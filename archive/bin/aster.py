from rply.token import Token
import sys

#HEADERS = ''#include "moth_lib.hpp"\n\n'
LINEOFFSET = 0

def throwError(err,err_t,lineno):
    global LINEOFFSET
    print("\033[1;33mMothCodeGenError\033[0;0m(\033[1;31m" + err_t + "\033[0;0m) @ \033[1;32mline " + str(lineno.lineno - LINEOFFSET) + "\033[0;0m:",file=sys.stderr)
    print("   " + err,file=sys.stderr)
    exit()

class AstObj:
    def __init__(self,lineno=None):
        self.lineno = lineno

class Container(AstObj):
    def __init__(self,item=None,lineno=None):
        self.lineno = lineno
        if type(item) != type(None):
            self.items = [item]
        else:
            self.items = []
    
    def find_variables(self,parent):
        items = []
        for i in self.items:
            items.append(i.find_variables(parent))
        self.items = items
        return self
    
    def add(self,item):
        self.items.append(item)
        return self

class Program(Container):

    def verify(self):
        for scope in self.items:
            if not (isinstance(scope.header,FunctionHeader) or isinstance(scope.header,ClassHeader) or isinstance(scope.header,KernelHeader)):
                throwError("Found non-function or non-class on top level","TopLevel",self.lineno)

    def find_classes(self):
        self.classes = {}
        for scope in self.items:
            scope.find_classes(self.classes)
    
    def find_functions(self):
        self.functions = {}
        self.function_inputs = {}
        for scope in self.items:
            scope.find_functions(self.functions,self.function_inputs)
    
    def find_declarations(self):
        self.declarations = {}
        for scope in self.items:
            scope.find_declarations(self.declarations)

    def find_variables(self):
        self.variables = {}
        for scope in self.items:
            scope.find_variables(self)

    def find_static_inits(self):
        inits = []
        #This finds any static classes that have an __init__ method
        for name in self.classes.keys():
            if self.classes[name].is_static:
                if self.classes[name].has_init:
                    evaluated = self.classes[name].init_func.header.name.value
                    if self.classes[name].init_func.header.return_type.name.value != "void":
                        throwError("Static __init__ doesn't return void.","StatInitErr",self.lineno)
                    evaluated = evaluated + "();"
                    inits.append(evaluated)
        return inits

    def eval(self, line_offset = 0,isRaw=False):
        global LINEOFFSET
        LINEOFFSET = line_offset
        self.verify() #makes sure that there are no lines on the top level
        self.find_classes() #finds all classes
        self.find_functions() #finds all functions
        self.find_declarations() #finds all declarations
        self.find_variables() #finds all variables, validates function calls etc
        out = ""
        for scope in self.items: #evaluates all scopes
            out += scope.eval(self)
        inits = self.find_static_inits() #This finds any static classes that have an __init__ method and puts then in main
        if "Mothmain" in self.functions:
            if len(self.function_inputs["Mothmain"].items) == 0:
                return out + "\nint main() {I.real = 0; I.imag = 1;" + "".join(inits) + " return Mothmain();}\n"
            elif len(self.function_inputs["Mothmain"].items) == 1:
                if isinstance(self.function_inputs["Mothmain"].items[0][0],ListType):
                    if self.function_inputs["Mothmain"].items[0][0].name.get_c() != "__Mothstr":
                        throwError("Args can only be list str","ArgsType",self.lineno)
                    else:
                        return out + "\nint main(int argc, char* argv[]) {I.real = 0; I.imag = 1;" + "".join(inits) + " return Mothmain(argvToList(argc,argv));}\n"
                else:
                    throwError("Args can only be list str","ArgsType",self.lineno)
            else:
                throwError("Too many arguments to main","MainArgs",self.lineno)
        else:
            return out

class Scope(AstObj):
    def __init__(self,header,body,lineno=None):
        self.lineno = lineno
        self.header = header
        self.body = body
        self.functions = {}
        self.variables = {} #local to the scope (passed to if/else/while)
        self.declarations = {}
        self.classes = {}
        self.has_parent = False #if this scope is part of a class, so has class functions

    def find_classes(self,out):
        self.classes = out
        if isinstance(self.header,ClassHeader):
            if self.header.name.value in out:
                throwError("Class [\033[1;34m" + self.header.name.value + "\033[0;0m] is already defined","RedefinedClass",self.lineno)
            out[self.header.name.value] = self
    
    def find_functions(self,out,inputs):
        if isinstance(self.header,FunctionHeader):
            self.has_parent = False
            if self.header.name.value in out.keys():
                if not self.header.overload:
                    throwError("Function [\033[1;34m" + self.header.name.value[4:] + "\033[0;0m] is already defined","RedefinedFunc",self.lineno)
                else:
                    n_overloads = len([i for i in list(out.keys()) if i.split("-")[0] == self.header.name.value])
                    out[self.header.name.value + "-" + str(n_overloads)] = self.header.return_type
                    inputs[self.header.name.value + "-" + str(n_overloads)] = self.header.inputs
            else:
                out[self.header.name.value] = self.header.return_type
                inputs[self.header.name.value] = self.header.inputs
            self.functions = out
            self.function_inputs = inputs
        
        if isinstance(self.header,KernelHeader):
            if self.header.name.value in out.keys():
                throwError("Kernel [\033[1;34m" + self.header.name.value[4:] + "\033[0;0m] is already defined","RedefinedKernel",self.lineno)
            out["Moth" + self.header.name.value] = Type(Token("TYPE_NAME","void"))
            inputs["Moth" + self.header.name.value] = self.header.inputs
            self.functions = out
            self.function_inputs = inputs
            
        
        if isinstance(self.header,ClassHeader):
            self.functions = {}
            self.function_inputs = {}
            self.is_static = False
            if self.header.inherits == "STATIC":
                self.is_static = True
            self.has_init = False
            self.init_func = None
            for i in self.body.lines.items:
                if isinstance(i,Scope):
                    i.classes = self.classes
                    if isinstance(i.header,FunctionHeader):
                        if self.header.inherits != "STATIC":
                            i.has_parent = True
                        i.parent = self
                        if i.header.name.value in self.functions:
                            if not i.header.overload:
                                throwError("Function [\033[1;34m" + self.header.name.value + "." + i.header.name.value[4:] + "\033[0;0m] is already defined","RedefinedMemFunc",i.lineno)
                            else:
                                n_overloads = len([j for j in list(self.functions.keys()) if j.split("-")[0] == i.header.name.value])
                                self.functions[i.header.name.value + "-" + str(n_overloads)] = i.header.return_type
                                out[self.header.name.value + i.header.name.value + "-" + str(n_overloads)] = i.header.return_type
                                self.function_inputs[i.header.name.value + "-" + str(n_overloads)] = i.header.inputs
                                inputs[self.header.name.value + i.header.name.value + "-" + str(n_overloads)] = i.header.inputs
                        else:
                            self.functions[i.header.name.value] = i.header.return_type
                            #print(self.functions)
                            out[self.header.name.value + i.header.name.value] = i.header.return_type
                            self.function_inputs[i.header.name.value] = i.header.inputs
                            inputs[self.header.name.value + i.header.name.value] = i.header.inputs
                            #print(out)
                        for j in i.body.lines.items:
                            if isinstance(j,Scope):
                                if not (isinstance(j.header,ClassHeader) or isinstance(j.header,FunctionHeader) or isinstance(j.header,KernelHeader)):
                                    j.find_functions(out,inputs)
                                    j.has_parent = True
                                    j.parent = self
                            #throwError("Redefined function " + self.header.name.value + "." + i.header.name.value,"RedefineMemFunc",self.lineno)
                        if i.header.name.value == "Moth__init__":
                            if self.is_static:
                                self.has_init = True
                                self.init_func = i
                        
                        i.functions = out
                        i.function_inputs = inputs
        
        else:
            self.functions = out
            self.function_inputs = inputs
        
        for i in self.body.lines.items:
            if isinstance(i,Scope):
                if not (isinstance(i.header,ClassHeader) or isinstance(i.header,FunctionHeader) or isinstance(i.header,KernelHeader)):
                    i.find_functions(out,inputs)
    
    def find_declarations(self,declarations,dont_declare=[]):
        self.dont_declare = dont_declare[:]
        if isinstance(self.header,ForHeader):
            if type(self.header.var_t) != type(None):
                self.declarations[self.header.var.value] = self.header.var_t
                self.dont_declare.append(self.header.var.value)
        if isinstance(self.header,FunctionHeader):
            self.header.find_declarations(self.declarations,self.dont_declare)
        if isinstance(self.header,KernelHeader):
            self.header.find_declarations(self.declarations,self.dont_declare)
        self.body.find_declarations(self.declarations)

    def find_variables(self,parent):
        self.classes.update(parent.classes)
        self.declarations.update(parent.declarations)
        self.dont_declare += list(parent.declarations.keys())
        self.header.find_variables(self)
        self.body.find_variables(self)
        return self

    def eval(self,parent,dont_declare=[],isKernel=False, isRaw = False):
        self.dont_declare += dont_declare
        self.functions = parent.functions
        self.classes = parent.classes
        out = ""
        out += self.header.eval(parent) 
        is_class = False
        end = ""
        if isinstance(self.header,ForHeader):
            out += "{\n" + self.header.get_iter(parent,isRaw) + "\n"
        elif isinstance(self.header,ClassHeader):
            is_class = True
        elif isinstance(self.header,KernelHeader):
            isKernel = True
            end = "\n"
            out += "\n" + "{".strip() + "\n"
            if self.header.raw_ptr == True:
                isRaw = True
        else:
            if isKernel:
                out += "{".strip() + "\n"
            else:
                out += "{\n"
        out += "".join([self.declarations[i].get_c() + " " + i + self.declarations[i].get_special(is_class) + ";" for i in self.declarations.keys() if not i in self.dont_declare]) + end
        if isinstance(self.header,ClassHeader):
            out += self.body.eval(self,self.declarations)
            if self.header.inherits == "STATIC":
                pass
            else:
                out += "\n}" + ";\n"
        elif isinstance(self.header,KernelHeader):
            out += self.header.get_fors(self)
            out += self.body.eval(self,isKernel=True,isRaw=isRaw)
            out += "}" * len(self.header.iterators) + "}\n" + "\n"
        else:
            out += self.body.eval(self,isKernel=isKernel,isRaw = isRaw)
            if isKernel:
                out += "}".strip() + "\n"
            else:
                out += "\n}\n"
        return out


class Constant:
    def __init__(self,c_str,c_type):
        self.c_str = c_str
        self.c_type = c_type

class Variable:
    def __init__(self,raw,c_str,c_type,moth_type):
        self.raw = raw
        self.c_str = c_str
        self.c_type = c_type
        self.moth_type = moth_type
    
    def eval(self,parent,isRaw=False):
        return self.c_str

class Identifier(AstObj):
    def __init__(self,token,lineno = None):
        self.token = token
        self.value = self.token.value
        self.name = self.token.name
        self.lineno = lineno
    
    def find_variables(self,parent : Scope):
        raw = self
        c_str = self.value
        try:
            c_type = parent.declarations[c_str].get_c()
        except:
            #if isinstance(parent.header,ClassHeader):
            #    scope_t = "class [\033[1;33m" + parent.header.name.value + "\033[0;0m]"
            #elif isinstance(parent.header,FunctionHeader):
            #    scope_t = "function [\033[1;33m" + parent.header.name.value[4:] + "\033[0;0m]"
            #else:
            #    scope_t = "scope"
            throwError("Name \033[1;34m" + c_str + "\033[0;0m not found in " + get_scope_t(parent),"VarNotFound",self.lineno)
        moth_type = parent.declarations[c_str]
        return Variable(raw,c_str,c_type,moth_type)

    def eval(self,parent=None,isRaw=False):
        return "Moth" + self.value

class String(AstObj):
    def __init__(self,token,lineno=None):
        self.token = token
        self.value = self.token.value
        self.name = self.token.name
        self.lineno = lineno
        self.moth_type = BaseType(Token("TYPE_NAME","str"))

    def find_variables(self,parent):
        return self
    
    def eval(self,parent,isRaw=False):
        return "convString(" + self.value + ")"
    
class Char(AstObj):
    def __init__(self,token,lineno=None):
        self.token = token
        self.value = self.token.value
        self.name = self.token.name
        self.lineno = lineno
        self.moth_type = BaseType(Token("TYPE_NAME","char"))

    def find_variables(self,parent):
        return self
    
    def eval(self,parent,isRaw=False):
        return self.value


class Number(AstObj):
    def __init__(self,token,lineno=None):
        self.token = token
        self.value = self.token.value
        self.name = self.token.name
        self.lineno = lineno
        if "." in self.value:
            self.moth_type = Type(Token("TYPE_NAME","float"))
        else:
            self.moth_type = Type(Token("TYPE_NAME","int"))
        self.c_str = self.value
    
    def find_variables(self,parent):
        return self

    def eval(self,parent,isRaw=False):
        return self.value

class ScopeBody(AstObj):
    def __init__(self,lines,lineno=None):
        self.lineno = lineno
        self.lines = lines
    
    def find_declarations(self,declarations):
        for line in self.lines.items:
            if isinstance(line,Declaration):
                declarations[line.name.value] = line.type_name
            elif isinstance(line,Assign):
                if isinstance(line.var,Declaration):
                    declarations[line.var.name.value] = line.var.type_name
            elif isinstance(line,Scope):
                if isinstance(line.header,ForHeader):
                    if type(line.header.var_t) != type(None):
                        declarations[line.header.var.value] = line.header.var_t
                line.find_declarations(declarations,list(declarations.keys()))

    def find_variables(self,parent):
        lines = []
        for line in self.lines.items:
            lines.append(line.find_variables(parent))
        self.lines = lines
        return self

    def eval(self,parent,dont_declare=[],isKernel=False,isRaw=False):
        out = ""
        end = ""
        #if isKernel:
        #    end = "\ ".strip()
        last_scope = None
        for line in self.lines:
            if not (isinstance(line,Variable) or isinstance(line,Pass)):
                if isinstance(line,Scope):
                    if isinstance(line.header,FunctionHeader):
                        #line.header.name.value = "OBJECT_" + parent.header.name.value+"_"+line.header.name.value
                        out += line.eval(parent,dont_declare,isKernel=isKernel) + "\n"
                    else:
                        if isinstance(line.header,ElifHeader):
                            if type(last_scope) == type(None):
                                throwError("Elif without previous Elif/If","ElifErr",self.lineno)
                            elif not (isinstance(last_scope.header,IfHeader) or isinstance(last_scope.header,ElifHeader)):
                                throwError("Elif without previous Elif/If","ElifErr",self.lineno)
                        if isinstance(line.header,ElseHeader):
                            if type(last_scope) == type(None):
                                throwError("Else without previous Elif/If","ElseErr",self.lineno)
                            elif not (isinstance(last_scope.header,IfHeader) or isinstance(last_scope.header,ElifHeader)):
                                throwError("Else without previous Elif/If","ElseErr",self.lineno)
                        out += line.eval(parent,isKernel=isKernel,isRaw=isRaw) + "\n"
                    last_scope = line
                else:
                    out += line.eval(parent,isRaw=isRaw) + ";" + end + "\n"
        return out


class ScopeHeader(AstObj):
    pass

class KernelHeader(ScopeHeader):
    def __init__(self,name,iterators,expression,lineno=None):
        self.name = name
        self.iterators = [Identifier(Token("IDENTIFIER",i)) for i in list(iterators.value)]
        self.expressions = [expression]
        self.inputs = None
        self.lineno = lineno
        self.target = "C"
        self.raw_ptr = False

    def find_declarations(self,declarations,dont_declare):
        #for i in self.inputs:
        #    declarations[i.value] = ArrayType(Type(Token("TYPE_NAME","ANY")))
        #    dont_declare.append(i.value)
        self.inputs.find_declarations(declarations,dont_declare)
        for i in self.iterators:
            declarations[i.value] = Type(Token("TYPE_NAME","int"))
            #dont_declare.append(i.value)
        #print(self.iterators[0].value)
        #exit()

    def find_variables(self,parent):
        #inputs = []
        #for i in self.inputs:
        #    inputs.append(i.find_variables(parent))
        self.inputs = self.inputs.find_variables(parent)
        expressions = []
        for i in self.expressions:
            expressions.append(i.find_variables(parent))
        self.expressions = expressions
        iterators = []
        for i in self.iterators:
            iterators.append(i.find_variables(parent))
        self.iterators = iterators
        return self

    def add_expression(self,expression):
        self.expressions.append(expression)
        return self
    
    def add_input(self,inp):
        self.inputs = inp
        return self
    
    def set_target(self,target):
        self.target = target.value[1:-1]
        return self
    
    def set_raw(self):
        self.raw_ptr = True
        return self
    
    def eval(self,parent,isRaw=False):
        c_header = "inline __Mothvoid Moth" + self.name.value
        inputs = [i for i in self.inputs.items if i[0].get_c() != "__Mothdtype"]
        templates = [i for i in self.inputs.items if i[0].get_c() == "__Mothdtype"]
        if len(templates) != 0:
            c_header = "template <" + ",".join(["class " + i[1].c_str for i in templates]) + ">\n" + c_header
        c_header += "(" + ",".join([i[0].get_c() + " " + i[1].c_str for i in inputs]) + ")"
        return c_header
        #c_header = "#define Moth" + self.name.value + "(" + ",".join([i[1].eval(parent) for i in self.inputs.items]) + r") \ ".strip()
        #return c_header
    
    def get_fors(self,parent):
        for_loops = []
        declares = ""
        for i,expr in zip(self.iterators,self.expressions):
            declares += "__Mothint " + i.eval(parent) + "_range = " + expr.eval(parent) + ";"
            for_loops.append("for (" + i.eval(parent) + " = 0; " + i.eval(parent) +  " < " + i.eval(parent) + "_range" + "; " + i.eval(parent) + "++)")
        
        if self.raw_ptr:
            arrays = [i for i in self.inputs.items if isinstance(i[0],ArrayType)]
            for t,var in arrays:
                dims = t.dimensions
                name = var.eval(parent)
                declares += t.name.get_c() + "* " + name + "_raw = " + name + ".raw.get();"
                for dim in range(dims):
                    declares += "__Mothint " + name + "_idx" + str(dim) + " = " + name + ".muls.get()[" + str(dim) + "];"
        
        for_loops = [(idx+1)*"\t" + i for idx,i in enumerate(for_loops)]
        c_header = ("{".strip()+"\n").join(for_loops) + "{".strip() + "\n"
        if self.target == "OPENMP":
            local_vars = [i for i in list(parent.declarations.keys()) if not i in [j.eval(parent) for j in self.iterators]] #+ [j.eval(parent) for j in self.inputs]
            private = (",".join([i.eval(parent) for i in self.iterators[1:]])).strip()
            if len(private) != 0:
                private = " private(" + private + ")"
            thread_private = ""
            if self.raw_ptr == False:
                thread_private = (",".join(local_vars)).strip()
                if len(thread_private) != 0:
                    thread_private = " threadprivate(" + thread_private + ")"
            c_header = '_Pragma("omp parallel for' + private + thread_private + '")' + "\n" + c_header # + 'printf("%d",omp_get_num_threads());\ '.strip() + "\n"
        return declares + "\n" + c_header

class ClassHeader(ScopeHeader):
    def __init__(self,name,inherits=None,lineno = None):
        self.lineno = lineno
        self.name = name
        self.inherits = str(inherits)
        self.type = "class"
    
    def find_variables(self,parent):
        return self

    def eval(self,parent,isRaw=False):
        global STRUCTS
        out = ""
        if self.inherits == "STATIC":
            pass
        else:
            out += "class __MothObject" + self.name.value + "{\npublic:\n"
        #STRUCTS += "struct Moth" + self.name.value + ";typedef struct Moth" + self.name.value + " Moth" + self.name.value + ";\n"
        return out

class FunctionHeader(ScopeHeader):
    def __init__(self,return_type,name,inputs,overload=False,lineno = None):
        self.lineno = lineno
        self.return_type = return_type
        self.name = Token("IDENTIFIER","Moth" + name.value)
        self.inputs = inputs
        self.overload = overload
        if self.name.value == "Mothmain" and self.return_type.get_c() != "__Mothint":
            throwError("Function [\033[1;34mmain\033[0;0m] returns \033[1;34m" + self.return_type.get_c()[6:] + "\033[0;0m instead of \033[1;34mint\033[0;0m","MainReturnType",self.lineno)
    
    def find_variables(self,parent):
        self.inputs = self.inputs.find_variables(parent)
        return self

    def find_declarations(self,declarations,dont_declare):
        self.inputs.find_declarations(declarations,dont_declare)
    
    def eval(self,parent,isRaw=False):
        if isinstance(parent,Scope):
            if isinstance(parent.header,ClassHeader):
                if parent.header.inherits == "STATIC":
                    self.name.value = "__" + parent.header.name.eval() + self.name.value
        return_type = self.return_type.get_c() + " "
        #if isinstance(parent,Scope):
        #    if isinstance(parent.header,ClassHeader) and (self.name.value == "Moth__init__"):
        #        self.name.value = "__MothObject" + parent.header.name.value
        #        return_type = ""
        c_header = return_type + self.name.value
        inputs = [i for i in self.inputs.items if i[0].get_c() != "__Mothdtype"]
        templates = [i for i in self.inputs.items if i[0].get_c() == "__Mothdtype"]
        if len(templates) != 0:
            c_header = "template <" + ",".join(["class " + i[1].c_str for i in templates]) + ">\n" + c_header
        c_header += "(" + ",".join([i[0].get_c() + " " + i[1].c_str for i in inputs]) + ")"
        return c_header

class FunctionDefInputs(Container):
    
    def find_variables(self,parent):
        items = []
        for i in self.items:
            items.append((i[0],i[1].find_variables(parent)))
        self.items = items
        return self

    def find_declarations(self,declarations,dont_declare):
        for i in self.items:
            declarations[i[1].value] = i[0]
            dont_declare.append(i[1].value)

class IfHeader(ScopeHeader):
    def __init__(self,expression,lineno=None):
        self.lineno = lineno
        self.expression = expression
    
    def find_variables(self,parent):
        self.expression = self.expression.find_variables(parent)
        return self
    
    def eval(self,parent,isRaw=False):
        return "if (" + self.expression.eval(parent,isRaw=isRaw) + ")"

class ElifHeader(ScopeHeader):
    def __init__(self,expression,lineno = None):
        self.lineno = lineno
        self.expression = expression
    
    def find_variables(self,parent):
        self.expression = self.expression.find_variables(parent)
        return self
    
    def eval(self,parent,isRaw=False):
        return "else if (" + self.expression.eval(parent,isRaw=isRaw) + ")"

class ElseHeader(ScopeHeader):
    def __init__(self,lineno = None):
        self.lineno = lineno
    
    def find_variables(self,parent):
        return self
    
    def eval(self,parent,isRaw=False):
        return "else"

class ForHeader(ScopeHeader):
    def __init__(self,var,range_obj,var_t = None,lineno = None):
        self.lineno = lineno
        self.var = var
        self.range_obj = range_obj
        self.var_t = var_t
    
    def find_variables(self,parent):
        self.var = self.var.find_variables(parent)
        self.range_obj = self.range_obj.find_variables(parent)
        return self
    
    def eval(self,parent,isRaw=False):
        if isinstance(self.range_obj,RangeObj):
            return "for (" + self.var.c_str + " = " + self.range_obj.start.eval(parent,isRaw=isRaw) + ";" + self.var.c_str + " < " + self.range_obj.end.eval(parent,isRaw=isRaw) + ";" + self.var.c_str + " = " + self.var.c_str + " + " + self.range_obj.step.eval(parent,isRaw=isRaw) + ")"
        else:
            if isinstance(self.range_obj.moth_type,ListType):
                return "for (int " + self.var.eval(parent) + "_MOTH_ITER = 0; " + self.var.eval(parent) + "_MOTH_ITER < " + self.range_obj.eval(parent) + ".Mothlen(); " + self.var.eval(parent) + "_MOTH_ITER++)"
            if isinstance(self.range_obj.moth_type,ArrayType):
                return "for (int " + self.var.eval(parent) + "_MOTH_ITER = 0; " + self.var.eval(parent) + "_MOTH_ITER < " + self.range_obj.eval(parent) + ".dims.get()[0]; " + self.var.eval(parent) + "_MOTH_ITER++)"
            throwError("ITERATORS NOT IMPLEMENTER","IMPLEMT",self.lineno)
    
    def get_iter(self,parent,isRaw=False):
        if isinstance(self.range_obj,RangeObj):
            return ""
        else:
            if isinstance(self.range_obj.moth_type,ListType):
                return self.var.eval(parent,isRaw=isRaw) + " = " + self.range_obj.eval(parent,isRaw=isRaw) + ".findIndex(" + self.var.eval(parent) + "_MOTH_ITER,0);"
            if isinstance(self.range_obj.moth_type,ArrayType):
                var = Variable(self.var.eval(parent,isRaw=isRaw) + "_MOTH_ITER",self.var.eval(parent,isRaw=isRaw) + "_MOTH_ITER","int",Type(Token("TYPE_NAME","int")))
                ref = ArrayReference(self.range_obj,var)
                for i in range(self.range_obj.moth_type.dimensions-1):
                    ref.add(SliceRange(Number(Token("NUMBER","0")),None,Number(Token("NUMBER","1"))))
                    ref.is_slice = True
                return Assign(self.var,ref).eval(parent) + ";"
            throwError("ITERATORS NOT IMPLEMENTER","IMPLEMT",self.lineno)

class RangeObj(AstObj):
    def __init__(self,start,end,step,lineno = None):
        self.lineno = lineno
        self.start,self.end,self.step = start,end,step
        if type(self.start) == type(None):
            self.start = Number(Token("NUMBER","0"))
        if type(self.step) == type(None):
            self.step = Number(Token("NUMBER","1"))
    
    def find_variables(self,parent):
        self.start = self.start.find_variables(parent)
        self.end = self.end.find_variables(parent)
        self.step = self.step.find_variables(parent)
        return self

class WhileHeader(ScopeHeader):
    def __init__(self,condition,lineno = None):
        self.lineno = lineno
        self.condition = condition
        self.type = "while"
    
    def find_variables(self,parent):
        self.condition = self.condition.find_variables(parent)
        return self
    
    def eval(self,parent,isRaw=False):
        return "while (" + self.condition.eval(parent,isRaw=isRaw) + ")"
    
class StaticFunction(AstObj):
    def __init__(self,class_name,function_name,lineno=None):
        self.class_name = class_name
        self.function_name = function_name
        self.lineno = lineno
        self.value = "__Moth"+self.class_name.value+"Moth"+self.function_name.value

    def find_variables(self,parent):
        my_class = parent.classes[self.class_name.value]
        if self.value in my_class.functions.keys():
            self.moth_type = my_class.functions[self.value]
        elif self.value in my_class.declarations.keys():
            self.moth_type = my_class.declarations[self.value]
        else:
            throwError("Static function or var " + self.class_name.value + "." + self.function_name.value + " not found in scope.","StatFunVarNotFound",self.lineno)
        return self
    
    def eval(self,parent=None,isRaw=False):
        return self.value

class FunctionCall(AstObj):
    def __init__(self,name,inp=None,lineno=None):
        self.lineno = lineno
        if (isinstance(name,Reference)):
            self.name = name
        elif (isinstance(name,StaticFunction)):
            self.name = name
        else:
            self.name = Token("IDENTIFIER","Moth" + name.value)
        if type(inp) != type(None):
            self.inputs = [inp]
        else:
            self.inputs = []
        self.type = "function_call"
    
    def find_variables(self,parent):
        inputs = []
        for i in self.inputs:
            inputs.append(i.find_variables(parent))
        self.inputs = inputs
        if isinstance(self.name,Reference):
            self.name = self.name.find_variables(parent,function=True)
            if isinstance(self.name.parent.moth_type,ArrayType):
                if self.name.child.value == "reshape":
                    self.moth_type = ArrayType(self.name.parent.moth_type.name)
                    self.moth_type.dimensions = len(self.inputs)
                elif self.name.child.value == "sum":
                    if len(self.inputs) == 0:
                        self.moth_type = self.name.parent.moth_type.name
                    else:
                        self.moth_type = self.name.parent.moth_type
                elif self.name.child.value == "min":
                    if len(self.inputs) == 0:
                        self.moth_type = self.name.parent.moth_type.name
                    else:
                        self.moth_type = self.name.parent.moth_type
                elif self.name.child.value == "max":
                    if len(self.inputs) == 0:
                        self.moth_type = self.name.parent.moth_type.name
                    else:
                        self.moth_type = self.name.parent.moth_type
                elif self.name.child.value == "tovector":
                    self.moth_type = Type(Token("TYPE_NAME","void"))
                elif self.name.child.value == "zero":
                    self.moth_type = Type(Token("TYPE_NAME","void"))
                elif self.name.child.value == "inf2zero":
                    self.moth_type = Type(Token("TYPE_NAME","void"))
                elif self.name.child.value == "copy":
                    self.moth_type = self.name.parent.moth_type
                #elif self.name.child.value == "ndims":
                #    self.moth_type = Type(Token("TYPE_NAME","int"))
                #elif self.name.child.value == "shape":
                #    self.moth_type = TupleType(Token("TYPE_NAME","int"))
                else:
                    throwError("Array Type does not have function \033[1;34m" + self.name.child.value + "\033[0;0m", "ArrayFuncNotFound",self.lineno)
            elif isinstance(self.name.parent.moth_type,TupleType):
                if self.name.child.value == "len":
                    self.moth_type = Type(Token("TYPE_NAME","int"))
            elif isinstance(self.name.parent.moth_type,ListType):
                if self.name.child.value == "len":
                    self.moth_type = Type(Token("TYPE_NAME","int"))
                elif self.name.child.value == "append":
                    self.moth_type = Type(Token("TYPE_NAME","void"))
                elif self.name.child.value == "pop":
                    self.moth_type = self.name.parent.moth_type.name
                elif self.name.child.value == "reset":
                    self.moth_type = Type(Token("TYPE_NAME","void"))
            elif isinstance(self.name.parent.moth_type,ObjectType):
                if self.name.parent.moth_type.name.value in parent.classes:
                    my_class = parent.classes[self.name.parent.moth_type.name.value]
                    if "Moth"+self.name.child.value in my_class.functions:
                        #print("YEET")
                        candidates = [i for i in list(my_class.functions.keys()) if i.split("-")[0] == "Moth"+self.name.child.value]
                        found = False
                        for candidate in candidates:
                            correct_inputs = my_class.function_inputs[candidate]
                            correct_inputs = [i[0].get_compare() for i in correct_inputs.items]
                            actual = [i.moth_type.get_compare() for i in self.inputs]
                            while "c_type" in correct_inputs:
                                try:
                                    actual.pop(correct_inputs.index("c_type"))
                                    correct_inputs.pop(correct_inputs.index("c_type"))
                                except:
                                    throwError("No overloads exist with inputs","NoOverload",self.lineno)
                            if correct_inputs == actual:
                                found = True
                                self.moth_type = my_class.functions[candidate]
                                break
                                        
                        if not found:
                            throwError("No overloads exist with inputs","NoOverload",self.lineno)
                        
                        #print(correct_inputs.items)
                        #print(self.inputs[0].moth_type.get_c())
                        #exit()
                        #self.moth_type = my_class.functions["Moth"+self.name.child.value]
                        
                    else:
                        throwError("Function "+self.name.child.value+" not found in object "+self.name.parent.moth_type.name.value,"FuncNotFoundinObj",self.lineno)
                else:
                    throwError("Object "+self.name.parent.moth_type.name.value+" not found in scope","ObjNotFound",self.lineno)
        else:
            found = False
            if isinstance(self.name,StaticFunction):
                if self.name.class_name.value in parent.classes:
                    if "Moth" + self.name.function_name.value in parent.classes[self.name.class_name.value].functions:
                        candidates = [i for i in list(parent.classes[self.name.class_name.value].functions.keys()) if i.split("-")[0] == "Moth" + self.name.function_name.value]
                        found = False
                        for candidate in candidates:
                            correct_inputs = parent.classes[self.name.class_name.value].function_inputs[candidate]
                            correct_inputs = [i[0].get_compare() for i in correct_inputs.items]
                            actual = [i.moth_type.get_compare() for i in self.inputs]
                            while "c_type" in correct_inputs:
                                try:
                                    actual.pop(correct_inputs.index("c_type"))
                                    correct_inputs.pop(correct_inputs.index("c_type"))
                                except:
                                    throwError("No overloads exist with inputs","NoOverload",self.lineno)
                            if correct_inputs == actual:
                                found = True
                                self.moth_type = parent.classes[self.name.class_name.value].functions[candidate]
                                break
                        if not found:
                            throwError("No overloads exist with inputs","NoOverload",self.lineno)
                        #self.moth_type = parent.classes[self.name.class_name.value].functions["Moth" + self.name.function_name.value]
                    else:
                        throwError("Function [\033[1;34m" + self.name.class_name.value + "." + self.name.function_name.value + "\033[0;0m] not defined in scope ","FuncUnDefined",self.lineno)
                else:
                    throwError("Class [\033[1;34m" + str(self.name.class_name) + "\033[0;0m] not defined in scope ","ClassUnDefined",self.lineno)
            elif isinstance(parent.header,FunctionHeader):
                found = False
                if parent.has_parent:
                    if self.name.value in parent.parent.functions.keys():
                        candidates = [i for i in list(parent.parent.functions.keys()) if i.split("-")[0] == self.name.value]
                        for candidate in candidates:
                            correct_inputs = parent.parent.function_inputs[candidate]
                            correct_inputs = [i[0].get_compare() for i in correct_inputs.items]
                            actual = [i.moth_type.get_compare() for i in self.inputs]
                            while "c_type" in correct_inputs:
                                try:
                                    actual.pop(correct_inputs.index("c_type"))
                                    correct_inputs.pop(correct_inputs.index("c_type"))
                                except:
                                    throwError("No overloads exist with inputs","NoOverload",self.lineno)
                            if correct_inputs == actual:
                                found = True
                                self.moth_type = parent.parent.functions[candidate]
                                break
                        #self.moth_type = parent.parent.functions[self.name.value]
                        #found = True
                if not found:
                    if self.name.value in parent.functions:
                        found = False
                        candidates = [i for i in list(parent.functions.keys()) if i.split("-")[0] == self.name.value]
                        for candidate in candidates:
                            correct_inputs = parent.function_inputs[candidate]
                            correct_inputs = [i[0].get_compare() for i in correct_inputs.items]
                            actual = [i.moth_type.get_compare() for i in self.inputs]
                            while "c_type" in correct_inputs:
                                try:
                                    actual.pop(correct_inputs.index("c_type"))
                                    correct_inputs.pop(correct_inputs.index("c_type"))
                                except:
                                    throwError("No overloads exist with inputs","NoOverload",self.lineno)
                            if correct_inputs == actual:
                                found = True
                                self.moth_type = parent.functions[candidate]
                                break
                        if not found:
                            throwError("No overloads exist with inputs","NoOverload",self.lineno)
                    elif self.name.value == "MoththrowErr":
                        pass
                    else:
                        throwError("Function [\033[1;34m" + str(self.name) + "\033[0;0m] not defined in scope ","FuncUnDefined",self.lineno)
            elif (self.name.value in parent.functions):
                #self.moth_type = parent.functions[self.name.value]
                found = False
                candidates = [i for i in list(parent.functions.keys()) if i.split("-")[0] == self.name.value]
                for candidate in candidates:
                    correct_inputs = parent.function_inputs[candidate]
                    correct_inputs = [i[0].get_compare() for i in correct_inputs.items]
                    actual = [i.moth_type.get_compare() for i in self.inputs]
                    while "c_type" in correct_inputs:
                        try:
                            actual.pop(correct_inputs.index("c_type"))
                            correct_inputs.pop(correct_inputs.index("c_type"))
                        except:
                            throwError("No overloads exist with inputs","NoOverload",self.lineno)
                    if correct_inputs == actual:
                        found = True
                        self.moth_type = parent.functions[candidate]
                        break
                if not found:
                    throwError("No overloads exist with inputs","NoOverload",self.lineno)
            else:
                if self.name.value == "MoththrowErr":
                    pass
                else:
                    if parent.has_parent:
                        if self.name.value in parent.parent.functions.keys():
                            candidates = [i for i in list(parent.parent.functions.keys()) if i.split("-")[0] == self.name.value]
                            for candidate in candidates:
                                correct_inputs = parent.parent.function_inputs[candidate]
                                correct_inputs = [i[0].get_compare() for i in correct_inputs.items]
                                actual = [i.moth_type.get_compare() for i in self.inputs]
                                while "c_type" in correct_inputs:
                                    try:
                                        actual.pop(correct_inputs.index("c_type"))
                                        correct_inputs.pop(correct_inputs.index("c_type"))
                                    except:
                                        throwError("No overloads exist with inputs","NoOverload",self.lineno)
                                if correct_inputs == actual:
                                    found = True
                                    self.moth_type = parent.parent.functions[candidate]
                                    return self
                    #print(self.name.value)
                    #exit()
                    throwError("Function [\033[1;34m" + str(self.name) + "\033[0;0m] not defined in scope ","FuncUnDefined",self.lineno)
        return self

    def add(self,inp):
        self.inputs.append(inp)
        return self
    
    def eval(self,parent,isRaw=False):
        if isinstance(self.name,Reference):
            name = self.name.eval(parent,isRaw=isRaw)
        elif isinstance(self.name,StaticFunction):
            name = "__Moth"+self.name.class_name.value+"Moth"+self.name.function_name.value
        else:
            name = self.name.value
        #print(self.inputs)
        #exit()
        inputs = [i for i in self.inputs if not isinstance(i,BaseType)]
        templates = [i for i in self.inputs if isinstance(i,BaseType)]
        out = name
        if len(templates) != 0:
            out += "<" + ",".join([i.eval(parent,isRaw=isRaw) for i in templates]) + ">"
        out += "(" + ",".join([i.eval(parent,isRaw=isRaw) for i in inputs]) + ")"
        #if "MothNg" in out:
        #    print(out)
        #    print(inputs[0].value)
        #    exit()
        return out

class Lines(Container):
    pass

class DtypeType(AstObj):
    def __init__(self):
        self.name = Token("TYPE_NAME","dtype")
    
    def get_compare(self):
        return "dtype"


class BaseType(AstObj):
    def __init__(self,name,lineno = None):
        self.lineno = lineno
        self.name = name
        self.moth_type = DtypeType()

    def find_variables(self,parent=None):
        return self
    
    def eval(self,parent=None,isRaw=False):
        return self.get_c()
    
    def get_c(self,parent=None):
        return "__Moth" + self.name.value
    
    def get_raw(self):
        return "Base"
    
    def get_compare(self):
        if self.name.value in ["char","short","int","long"]:
            return "int"
        if self.name.value in ["uchar","ushort","uint","ulong"]:
            return "uint"
        if self.name.value in ["double","float"]:
            return "double"
        if self.name.value in ["str"]:
            return "str"
        if self.name.value in ["dtype"]:
            return "dtype"
        throwError("TYPE IS WRONG????","THISISBAD",self.lineno)

    def get_special(self,is_class=False):
        return ""

class Template(BaseType):

    def __init__(self,name,lineno=None):
        super().__init__(name,lineno)
        self.value = name.value
        self.c_str = self.value

    def get_compare(self):
        return "dtype"

    def get_c(self,parent=None):
        if type(parent) != type(None):
            if not self.name.value in parent.declarations:
                if isinstance(parent.header,ClassHeader):
                    scope_t = "class [\033[1;33m" + parent.header.name.value + "\033[0;0m]"
                elif isinstance(parent.header,FunctionHeader):
                    scope_t = "function [\033[1;33m" + parent.header.name.value[4:] + "\033[0;0m]"
                else:
                    scope_t = "scope"
                throwError("Type \033[1;34m" + self.name.value + "\033[0;0m not declared in " + scope_t,"DtypeNotDeclared",self.lineno)
        return self.name.value
    
    def get_raw(self):
        return "Base"
    
    def get_special(self,is_class=False):
        return ""

class ListType(BaseType):
    def get_c(self,parent=None):
        return "__MothListContainer<" + self.name.get_c() + ">"
    
    def get_raw(self):
        return "ListContainer"
    
    def get_compare(self):
        return "list" + self.name.get_compare()

    def get_special(self,is_class=False):
        if is_class:
            return ""
        return ""
    
class TupleType(BaseType):
    def get_c(self,parent=None):
        return "__MothTuple<" + self.name.get_c() + ">"
    
    def get_raw(self):
        return "Tuple"
    
    def get_compare(self):
        return self.name.get_compare()

    def get_special(self,is_class=False):
        if is_class:
            return ""
        return ""
    
class MapType(AstObj):
    def __init__(self,name,to,lineno = None):
        self.lineno = lineno
        self.name = name
        self.to = to
        self.moth_type = DtypeType()

    def find_variables(self,parent=None):
        return self
    
    def eval(self,parent=None,isRaw=False):
        return self.get_c()
    
    def get_c(self,parent=None):
        return "std::map<" + self.name.get_c(parent) + ", " + self.to.get_c(parent) + ">"
    
    def get_raw(self):
        return "Base"
    
    def get_compare(self):
        return "map" + self.name.get_compare() + "->" + self.to.get_compare()

    def get_special(self,is_class=False):
        return ""

class MapLiteral(Container):
    def find_variables(self,parent):
        items = []
        for i in self.items:
            items.append((i[0].find_variables(parent),i[1].find_variables(parent)))
        self.items = items
        self.name_t = self.items[0][0].moth_type.get_c()
        self.to_t = self.items[0][1].moth_type.get_c()
        self.moth_type = MapType(self.items[0][0].moth_type,self.items[0][1].moth_type)
        for i in self.items:
            if (i[0].moth_type.get_c() != self.name_t) or (i[1].moth_type.get_c() != self.to_t):
                throwError("can't infer map type","MapInferErr",self.lineno)
        return self
    
    def eval(self,parent,isRaw=False):
        items = []
        for i in self.items:
            items.append("{" + i[0].eval(parent) + "," + i[1].eval(parent) + "}")
        return "{" + ",".join(items) + "}"
        #out_map = var.eval(parent)
        #outs = [out_map + ".clear()"]
        #for i in self.items:
        #    outs.append(out_map + "[" + i[0].eval(parent) + "] = " + i[1].eval(parent))
        #return ";".join(outs)

class ListLiteral(Container):
    def eval(self,var,parent,isRaw=False):
        out = ""
        return var.eval(parent) + ".Mothreset();" + ";".join([var.eval(parent) + "." + "Mothappend(" + i.eval(parent) + ")" for i in self.items])

class TupleLiteral(Container):
    def __init__(self,dtype,item=None,lineno=None):
        super().__init__(item,lineno)
        self.dtype = dtype
        self.moth_type = dtype

    def find_variables(self,parent):
        items = []
        for i in self.items:
            items.append(i.find_variables(parent))
        self.items = items
        if type(self.dtype) == type(None):
            self.dtype = Type(Token("TYPE_NAME","int"))
            for i in self.items:
                if i.moth_type.get_c() in ["__Mothchar", "__Mothuchar", "__Mothshort", "__Mothushort", "__Mothint", "__Mothuint", "__Mothlong", "__Mothulong"]:
                    pass
                elif i.moth_type.get_c() in ["__Mothfloat","__Mothdouble"]:
                    self.dtype = Type(Token("TYPE_NAME","float"))
                else:
                    throwError("Only \033[1;34mint\033[0;0m or \033[1;34mfloat\033[0;0m is valid for type inferred tuple","TypeInferTupleErr",self.lineno)
            self.moth_type = self.dtype
        return self

    def eval(self,parent,isRaw=False):
        out = ""
        nitems = len(self.items)
        if len(self.items) == 0:
            out = out = "newTuple<" + self.dtype.get_c() + ">(" + str(nitems) + ")"
        else:
            out = "newTuple<" + self.dtype.get_c() + ">(" + str(nitems) + "," + ",".join([i.eval(parent,isRaw=isRaw) for i in self.items]) + ")"
        return out
        #return var.eval(parent) + ".Mothreset();" + ";".join([var.eval(parent) + "." + "Mothappend(" + i.eval(parent) + ")" for i in self.items])


class Type(BaseType):
    pass

class ObjectType(BaseType):
    def get_c(self,parent=None):
        return "__MothObject" + self.name.value
    
    def get_compare(self):
        return self.get_c()
    
    def get_raw(self):
        return "Object"

class ArrayType(BaseType):
    def __init__(self,name, lineno = None):
        super().__init__(name,lineno)
        self.dimensions = 1

    def add_dim(self):
        self.dimensions += 1
        return self
    
    def get_compare(self):
        return "array" + self.name.get_compare()

    def get_c(self,parent=None):
        return "__MothArray<" + self.name.get_c(parent) + ">"

    def get_raw(self):
        return "Array"
    
    def get_special(self,is_class=False):
        return ""
        #if is_class:
        #    return "{" + str(self.dimensions) + "}"
        #return "(" + str(self.dimensions) + ")"

class SliceRange(AstObj):
    def __init__(self,start=None,end=None,step=None,lineno=None):
        self.start,self.end,self.step = start,end,step
        self.lineno = lineno

    def find_variables(self,parent):
        if type(self.start) != type(None):
            self.start = self.start.find_variables(parent)
        else:
            self.start = Number(Token("NUMBER","0"))
        if type(self.end) != type(None):
            self.end = self.end.find_variables(parent)
        if type(self.step) != type(None):
            self.step = self.step.find_variables(parent)
        else:
            self.step = Number(Token("NUMBER","1"))
        return self

class ArrayReference(AstObj):
    def __init__(self,name,index,lineno=None):
        self.lineno = lineno
        self.name = name
        self.index = [index]
        self.is_slice = False
    
    def find_variables(self,parent):
        self.name = self.name.find_variables(parent)
        index = []
        self.moth_type = self.name.moth_type.name
        for i in self.index:
            if isinstance(i,SliceRange):
                self.is_slice = True
                self.moth_type = self.name.moth_type
                index.append(i.find_variables(parent))
            else:
                index.append(i.find_variables(parent))
        self.index = index
        return self
    
    def add(self,index):
        self.index.append(index)
        return self

    def eval(self,parent,isRaw=False):
        if isRaw:
            #nindex = len(self.index)
            name = self.name.eval(parent,isRaw)
            muls = "+".join([i.eval(parent,isRaw) + "*" + name + "_idx" + str(idx) for idx,i in enumerate(self.index)])
            return name + "_raw[" + muls + "]"
        else:
            if self.is_slice:
                slice_inputs = []
                for idx,i in enumerate(self.index):
                    if isinstance(i,SliceRange):
                        slice_inputs.append(i.start.eval(parent))
                        if type(i.end) == type(None):
                            if isinstance(self.name.moth_type,ListType):
                                slice_inputs.append(self.name.eval(parent) + ".Mothlen()")
                            else:
                                slice_inputs.append(self.name.eval(parent) + ".dims.get()[" + str(idx) + "]")
                        else:
                            slice_inputs.append(i.end.eval(parent))
                        slice_inputs.append(i.step.eval(parent))
                    else:
                        slice_inputs += [i.eval(parent),i.eval(parent),"0"]
                if isinstance(self.name.moth_type,ListType):
                    if len(slice_inputs) != 3:
                        throwError("Too many inputs to List slice","ListSliceErr",self.lineno)
                return "__MothGetSlice(" + self.name.eval(parent) + "," + str(len(slice_inputs)) + "," + ",".join(slice_inputs) + ")"
            else:
                size = str(len(self.index))
                index = ",".join([i.eval(parent) for idx,i in enumerate(self.index)])
                return "__Moth" + self.name.moth_type.get_raw() + "INDEX(" + self.name.eval(parent) + "," + size + "," + index + ")"


class Declaration(AstObj):
    def __init__(self,type_name,name,lineno=None):
        self.lineno = lineno
        self.type_name = type_name
        self.name = name
    
    def find_variables(self,parent):
        #print(parent.declarations,self.name.value,self.type_name.get_c(parent))
        var = Variable(self,self.name.value,self.type_name.get_c(parent),self.type_name)
        return var

    def eval(self,parent,isRaw=False):
        pass

class Assign(AstObj):
    def __init__(self,var,expression,lineno=None):
        self.var = var
        self.expression = expression
        self.lineno = lineno
    
    def find_variables(self,parent):
        self.var = self.var.find_variables(parent)
        self.expression = self.expression.find_variables(parent)
        return self
    
    def eval(self,parent,isRaw=False):
        #if isinstance(self.expression,AllocArray):
        #    return self.expression.eval(self.var,parent)
        if isinstance(self.expression,AllocObject):
            return self.expression.eval(self.var,parent,isRaw=isRaw)
        elif isinstance(self.expression,ListLiteral):
            return self.expression.eval(self.var,parent,isRaw=isRaw)
        #elif isinstance(self.expression,MapLiteral):
        #    return self.expression.eval(self.var,parent,isRaw=isRaw)
        elif isinstance(self.expression,AllocArray):
            if self.var.moth_type.dimensions == "inf":
                pass
            else:
                if len(self.expression.items) == 1:
                    if isinstance(self.expression.items[0],TupleLiteral):
                        if self.var.moth_type.dimensions != len(self.expression.items[0].items):
                            throwError("Can't initialize " + str(self.var.moth_type.dimensions) + " dimensional array \033[1;34m" + self.var.c_str + "\033[0;0m with " + str(len(self.expression.items[0].items)) + " dimensions","ArrayAllocError",self.lineno)
                    else:
                        if self.var.moth_type.dimensions != len(self.expression.items):
                            throwError("Can't initialize " + str(self.var.moth_type.dimensions) + " dimensional array \033[1;34m" + self.var.c_str + "\033[0;0m with " + str(len(self.expression.items)) + " dimensions","ArrayAllocError",self.lineno)
                else:
                    if self.var.moth_type.dimensions != len(self.expression.items):
                        throwError("Can't initialize " + str(self.var.moth_type.dimensions) + " dimensional array \033[1;34m" + self.var.c_str + "\033[0;0m with " + str(len(self.expression.items)) + " dimensions","ArrayAllocError",self.lineno)
            return self.var.eval(parent,isRaw=isRaw) + " = " + self.expression.eval(parent,isRaw=isRaw)
        else:
            return self.var.eval(parent,isRaw=isRaw) + " = " + self.expression.eval(parent,isRaw=isRaw)
    
class AllocObject(AstObj):
    def __init__(self,objname,lineno=None):
        self.objname = objname
        self.lineno = lineno
    
    def find_variables(self,parent):
        #self.objname = self.objname.find_variables(parent)
        self.objname.inputs = [i.find_variables(parent) for i in self.objname.inputs]
        return self
    
    def eval(self,var,parent,isRaw=False):
        self.objname.name.value = var.eval(parent,isRaw=isRaw) + ".Moth__init__"
        return self.objname.eval(parent,isRaw=isRaw)

class AllocArray(Container):
    def __init__(self,dtype,item,lineno=None):
        super().__init__(item,lineno)
        self.dtype = dtype
        self.moth_type = self.dtype

    def eval(self,parent,isRaw=False):
        return "newArray<" + self.dtype.get_c() + ">(" + str(len(self.items)) + "," + ",".join([i.eval(parent,isRaw=isRaw) for i in self.items]) + ")" #var.eval(parent) + "." + "init(" + ",".join([i.eval(parent) for i in self.items]) + ")"
 
class AssignInc(AstObj):
    def __init__(self,var,expression,op,lineno=None):
        self.lineno = lineno
        self.var = var
        self.expression = expression
        self.op = op
    
    def find_variables(self,parent):
        self.var = self.var.find_variables(parent)
        self.expression = self.expression.find_variables(parent)
        return self
    
    def eval(self,parent,isRaw=False):
        if self.op.value == "+=":
            t = Token("PLUS","+")
        elif self.op.value == "-=":
            t = Token("MINUS","-")
        elif self.op.value == "*=":
            t = Token("STAR","*")
        elif self.op.value == "/=":
            t = Token("SLASH","/")
        elif self.op.value == "%=":
            t = Token("PERCENT","%")
        elif self.op.value == "**=":
            t = Token("STARSTAR","**")
        else:
            throwError("THIS SHOULD NOT HAPPEN","VERYBAD",self.lineno)
        return Assign(self.var,BinOp(self.var,t,self.expression)).eval(parent,isRaw=isRaw)

class Inc(AstObj):
    def __init__(self,var,op,lineno=None):
        self.lineno = lineno
        self.var = var
        self.op = op
    
    def find_variables(self,parent):
        self.var = self.var.find_variables(parent)
        return self
    
    def eval(self,parent,isRaw=False):
        if self.op.value == "++":
            t = Token("PLUS","+")
        elif self.op.value == "--":
            t = Token("MINUS","-")
        else:
            throwError("THIS SHOULD NOT HAPPEN","VERYBAD",self.lineno)
        return Assign(self.var,BinOp(self.var,t,Number(Token("","1")))).eval(parent,isRaw=isRaw)

class BinOp(AstObj):
    def __init__(self,left,op,right,lineno=None):
        self.lineno = lineno
        self.left = left
        self.op = op
        self.right = right
    
    def find_variables(self,parent):
        self.left = self.left.find_variables(parent)
        self.right = self.right.find_variables(parent)
        self.moth_type = self.left.moth_type
        if self.right.moth_type.get_raw() == "Base":
            if self.right.moth_type.name.value == "float":
                self.moth_type = self.right.moth_type
        return self

    def eval(self,parent,isRaw=False):
        if self.op.name  == "IDENTIFIER":
            return "Moth" + self.op.value + "(" + self.left.eval(parent,isRaw=isRaw) + "," + self.right.eval(parent,isRaw=isRaw) + ")"
        return "__Moth" + "Base" + self.op.name + "(" + self.left.eval(parent,isRaw=isRaw) + "," + self.right.eval(parent,isRaw=isRaw) + ")"

class Not(AstObj):
    def __init__(self,val,lineno=None):
        self.lineno = lineno
        self.val = val
    
    def find_variables(self,parent):
        self.val = self.val.find_variables(parent)
        return self
    
    def eval(self,parent,isRaw=False):
        return "__Moth" + self.val.moth_type.get_raw() + "NOT(" + self.val.eval(parent,isRaw=isRaw) + ")"

class Return(AstObj):
    def __init__(self,val=None,lineno=None):
        self.lineno = lineno
        self.val = val
    
    def find_variables(self,parent):
        if type(self.val) != type(None):
            self.val = self.val.find_variables(parent)
        return self
    
    def eval(self,parent,isRaw=False):
        out = "return "
        if type(self.val) != type(None):
            out += self.val.eval(parent,isRaw=isRaw)
        return out

class Print(Container):
    def eval(self,parent,isRaw=False):
        out = []
        formatters = {"int" : r"%d", "float": r"%f", "double": r"%lf","char":r"%c"}
        for i in self.items:
            out.append(r'__MothPrint(' + i.eval(parent,isRaw=isRaw) + r')')
        return ";".join(out)

class Pass(AstObj):
    def find_variables(self,parent):
        return self
    
    def eval(self,parent,isRaw=False):
        return ""

class Break(AstObj):
    def find_variables(self,parent):
        return self
    def eval(self,parent,isRaw=False):
        return "break;"

class Ctypes(AstObj):
    pass

class Craw(Ctypes):
    def __init__(self,string,val,lineno=None):
        self.string = string
        self.val = val
        self.lineno = lineno
        if isinstance(self.string,String):
            self.value = self.string.value[1:-1]
        #else:
        #    self.value = self.get_c()

    def find_variables(self,parent):
        self.val = self.val.find_variables(parent)
        self.string = self.string.find_variables(parent)
        return self
    
    def get_compare(self):
        return "c_type"

    def get_c(self,parent=None):
        f = ""
        s = ""
        if isinstance(self.string,String):
            f = self.string.value[1:-1]
        else:
            try:
                f = self.string.get_c(parent)
            except:
                f = self.string.eval(parent)
        if isinstance(self.val,String):
            s = self.val.value[1:-1]
        else:
            try:
                s = self.val.get_c(parent)
            except:
                s = self.val.eval(parent)
        return f + s
    
    def eval(self,parent=None,isRaw=False):
        return self.get_c(parent)

class Ctype(Ctypes):
    def __init__(self,val,lineno=None):
        self.lineno = lineno
        self.val = val

    def find_variables(self,parent):
        return self
    
    def get_compare(self):
        return "c_type"
    
    def get_c(self,parent=None):
        try:
            return self.val.value
        except:
            return self.val.get_c()
    
    def get_raw(self,parent=None):
        return self.get_c()
    
    def get_special(self,parent=None):
        return ""

class Clit(Ctypes):
    def __init__(self,val,lineno=None):
        self.lineno = lineno
        self.val = val
        self.moth_type = Type(Token("TYPE_NAME","int"))

    def get_compare(self):
        return "c_type"
    
    def find_variables(self,parent):
        return self
    
    def eval(self,parent,isRaw=False):
        try:
            return self.val.value
        except:
            return self.val.eval(parent,isRaw=isRaw)

class Cval(Ctypes):
    def __init__(self,val,lineno=None):
        self.lineno = lineno
        self.val = val
    
    def find_variables(self,parent):
        self.val = self.val.find_variables(parent)
        return self
    
    def get_compare(self):
        return "c_type"

    def eval(self,parent,isRaw=False):
        return self.val.eval(parent,isRaw=isRaw)

class Cptr(Ctypes):
    def __init__(self,var,lineno=None):
        self.lineno = lineno
        self.var = var
    
    def find_variables(self,parent):
        self.var = self.var.find_variables(parent)
        return self
    
    def get_compare(self):
        return "c_type"

    def eval(self,parent,isRaw=False):
        if isinstance(self.var,Null):
            return "NULL"
        elif isinstance(self.var.moth_type,ArrayType):
            return self.var.eval(parent,isRaw=isRaw) + ".raw.get()"
        elif isinstance(self.var.moth_type,ObjectType):
            throwError("Can't pass Moth objects to C","MothObjPtrErr",self.lineno)
        else:
            return "&"+self.var.eval(parent,isRaw=isRaw)

class Ccall(Ctypes):
    def __init__(self,func_name,lineno=None):
        self.lineno = lineno
        self.func_name = func_name
        self.inputs = []
    
    def find_variables(self,parent):
        inputs = []
        for i in self.inputs:
            inputs.append(i.find_variables(parent))
        self.inputs = inputs
        return self
    
    def get_compare(self):
        return "c_type"

    def add(self,inp):
        self.inputs.append(inp)
        return self

    def eval(self,parent,isRaw=False):
        return self.func_name.value + "(" + ",".join([i.eval(parent,isRaw=isRaw) for i in self.inputs]) + ")"
    
class Reference(AstObj):
    def __init__(self,parent,child,lineno=None):
        self.lineno = lineno
        self.parent = parent
        self.child = child
    
    def find_variables(self,parent,function=False):
        self.parent = self.parent.find_variables(parent)
        if not function:
            if (isinstance(self.parent.moth_type,ArrayType)):
                if (self.child.value == "ndims"):
                    self.c_str = self.parent.eval(parent) + "." + self.child.value
                    self.moth_type = Type(Token("TYPE_NAME","int"))
                elif (self.child.value == "shape"):
                    self.c_str = "" + self.parent.eval(parent) + "." + self.child.value
                    self.moth_type = TupleType(Type(Token("TYPE_NAME","int")))
                else:
                    throwError("Arrays have no attribute \033[1;34m" + self.child.value + "\033[0;0m","ArrayAttributeErr",self.lineno)
            else:
                if not "complex" in self.parent.moth_type.name.value:
                    self.child = self.child.find_variables(parent.classes[self.parent.moth_type.name.value])
                    self.c_type = self.child.c_type
                    self.moth_type = self.child.moth_type
                    self.c_str = self.parent.eval(parent) + "." + self.child.eval(parent)
                else:
                    self.c_type = "__Mothcomplexf"
                    self.moth_type = BaseType(Token("",self.parent.moth_type.name.value))
                    self.c_str = self.parent.eval(parent) + "." + self.child.eval(parent)[4:]
        else:
            self.c_str = self.parent.eval(parent) + "." + self.child.eval(parent)
        return self

    def eval(self,parent,isRaw=False):
        return self.c_str #self.parent.eval(parent) + "." + self.child.eval(parent)

class Cast(AstObj):
    def __init__(self,new_type,expression,lineno=None):
        self.lineno = lineno
        self.new_type = new_type
        self.expression = expression
        self.c_type = self.new_type.get_c()
        self.moth_type = new_type
    
    def find_variables(self,parent):
        self.expression = self.expression.find_variables(parent)
        return self
    
    def eval(self,parent,isRaw=False):
        if not isinstance(self.expression,Ccall):
            if self.expression.moth_type.get_c() == "__Mothstr":
                funcs = {"__Mothint": "std::stoi", "__Mothfloat": "std::stof","__Mothdouble": "std::stod","__Mothlong": "std::stol"}
                t = self.new_type.get_c()
                if t in funcs:
                    return funcs[t] + "(" + self.expression.eval(parent,isRaw=isRaw) + ")"
                else:
                    throwError("No casting rule for string","CastRuleErr",self.lineno)
            else:
                return "(" + self.new_type.get_c() + ")" + "(" + self.expression.eval(parent,isRaw=isRaw) + ")"
        else:
            return "(" + self.new_type.get_c() + ")" + "(" + self.expression.eval(parent,isRaw=isRaw) + ")"
    
class Null(AstObj):
    def __init__(self,lineno=None):
        self.lineno = lineno
    
    def find_variables(self,parent):
        return self
    
    def get_compare(self):
        return "NULL"
    
    def eval(self,parent,isRaw=False):
        return "NULL"
    
def get_scope_t(parent : Scope):
    if isinstance(parent.header,ClassHeader):
        scope_t = "class [\033[1;33m" + parent.header.name.value + "\033[0;0m]"
    elif isinstance(parent.header,FunctionHeader):
        scope_t = "function [\033[1;33m" + parent.header.name.value[4:] + "\033[0;0m]"
    else:
        scope_t = "scope"
    return scope_t