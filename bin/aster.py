from rply.token import Token
import sys

HEADERS = ''#include "moth_lib.hpp"\n\n'
LINEOFFSET = 0

def throwError(err,err_t,lineno):
    global LINEOFFSET
    print("\033[1;33mMothCodeGenError\033[0;0m(\033[1;31m" + err_t + "\033[0;0m) @ \033[1;32mline " + str(lineno.lineno - LINEOFFSET) + "\033[0;0m:",file=sys.stderr)
    print("   " + err,file=sys.stderr)
    exit()

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

class AstObj:
    def __init__(self,lineno=None):
        self.lineno = lineno

class Identifier(AstObj):
    def __init__(self,token,lineno = None):
        self.token = token
        self.value = self.token.value
        self.name = self.token.name
        self.lineno = lineno
    
    def find_variables(self,parent):
        raw = self
        c_str = self.value
        try:
            c_type = parent.declarations[c_str].get_c()
        except:
            if isinstance(parent.header,ClassHeader):
                scope_t = "class [\033[1;33m" + parent.header.name.value + "\033[0;0m]"
            elif isinstance(parent.header,FunctionHeader):
                scope_t = "function [\033[1;33m" + parent.header.name.value[4:] + "\033[0;0m]"
            else:
                scope_t = "scope"
            throwError("Name \033[1;34m" + c_str + "\033[0;0m not found in " + scope_t,"VarNotFound",self.lineno)
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
        return self.value
    
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
        for scope in self.items:
            scope.find_functions(self.functions)
    
    def find_declarations(self):
        self.declarations = {}
        for scope in self.items:
            scope.find_declarations(self.declarations)

    def find_variables(self):
        self.variables = {}
        for scope in self.items:
            scope.find_variables(self)

    def eval(self, line_offset = 0,isRaw=False):
        global HEADERS,LINEOFFSET
        LINEOFFSET = line_offset
        self.verify()
        self.find_classes()
        self.find_functions()
        self.find_declarations()
        self.find_variables()
        out = ""
        for scope in self.items:
            out += scope.eval(self)
        return HEADERS + out + "\nint main() {I.real = 0; I.imag = 1; return Mothmain();}\n"

class Scope(AstObj):
    def __init__(self,header,body,lineno=None):
        self.lineno = lineno
        self.header = header
        self.body = body
        self.functions = {}
        self.variables = {}
        self.declarations = {}
        self.classes = {}

    def find_classes(self,out):
        self.classes = out
        if isinstance(self.header,ClassHeader):
            if self.header.name.value in out:
                throwError("Class [\033[1;34m" + self.header.name.value + "\033[0;0m] is already defined","RedefinedClass",self.lineno)
            out[self.header.name.value] = self
    
    def find_functions(self,out):
        if isinstance(self.header,FunctionHeader):
            if self.header.name.value in out.keys():
                if not self.header.overload:
                    throwError("Function [\033[1;34m" + self.header.name.value[4:] + "\033[0;0m] is already defined","RedefinedFunc",self.lineno)
            out[self.header.name.value] = self.header.return_type
            self.functions = out
            
        
        if isinstance(self.header,KernelHeader):
            if self.header.name.value in out.keys():
                throwError("Kernel [\033[1;34m" + self.header.name.value[4:] + "\033[0;0m] is already defined","RedefinedKernel",self.lineno)
            out["Moth" + self.header.name.value] = Type(Token("TYPE_NAME","void"))
            self.functions = out
            
        
        if isinstance(self.header,ClassHeader):
            self.functions = {}
            for i in self.body.lines.items:
                if isinstance(i,Scope):
                    i.classes = self.classes
                    if isinstance(i.header,FunctionHeader):
                        if i.header.name.value in self.functions:
                            if not i.header.overload:
                                throwError("Function [\033[1;34m" + self.header.name.value + "." + i.header.name.value[4:] + "\033[0;0m] is already defined","RedefinedMemFunc",i.lineno)
                        for j in i.body.lines.items:
                            if isinstance(j,Scope):
                                if not (isinstance(j.header,ClassHeader) or isinstance(j.header,FunctionHeader) or isinstance(j.header,KernelHeader)):
                                    j.find_functions(out)
                            #throwError("Redefined function " + self.header.name.value + "." + i.header.name.value,"RedefineMemFunc",self.lineno)
                        self.functions[i.header.name.value] = i.header.return_type
                        out[i.header.name.value] = i.header.return_type
        
        else:
            self.functions = out
        
        for i in self.body.lines.items:
            if isinstance(i,Scope):
                if not (isinstance(i.header,ClassHeader) or isinstance(i.header,FunctionHeader) or isinstance(i.header,KernelHeader)):
                    i.find_functions(out)
    
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
        if isinstance(self.header,ClassHeader):
            is_class = True
        elif isinstance(self.header,KernelHeader):
            isKernel = True
            end = "\ ".strip() + "\n"
            out += "\n" + "{\ ".strip() + "\n"
            if self.header.raw_ptr == True:
                isRaw = True
        else:
            if isKernel:
                out += "{\ ".strip() + "\n"
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
                out += "}\ ".strip() + "\n" + "\ ".strip()
            else:
                out += "\n}\n"
        return out

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
        if isKernel:
            end = "\ ".strip()
        for line in self.lines:
            if not (isinstance(line,Variable) or isinstance(line,Pass)):
                if isinstance(line,Scope):
                    if isinstance(line.header,FunctionHeader):
                        #line.header.name.value = "OBJECT_" + parent.header.name.value+"_"+line.header.name.value
                        out += line.eval(parent,dont_declare,isKernel=isKernel) + "\n"
                    else:
                        out += line.eval(parent,isKernel=isKernel,isRaw=isRaw) + "\n"
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
        c_header = "#define Moth" + self.name.value + "(" + ",".join([i[1].eval(parent) for i in self.inputs.items]) + r") \ ".strip()
        return c_header
    
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
        c_header = ("{\ ".strip()+"\n").join(for_loops) + "{\ ".strip() + "\n"
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
            c_header = '_Pragma("omp parallel for' + private + thread_private + '")' + "\ ".strip() + "\n" + c_header # + 'printf("%d",omp_get_num_threads());\ '.strip() + "\n"
        return declares + "\ ".strip() + "\n" + c_header

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
        return "for (" + self.var.c_str + " = " + self.range_obj.start.eval(parent,isRaw=isRaw) + ";" + self.var.c_str + " < " + self.range_obj.end.eval(parent,isRaw=isRaw) + ";" + self.var.c_str + " = " + self.var.c_str + " + " + self.range_obj.step.eval(parent,isRaw=isRaw) + ")"

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
    
    def find_variables(self,parent):
        return self

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
        else:
            if isinstance(self.name,StaticFunction):
                if self.name.class_name.value in parent.classes:
                    if "Moth" + self.name.function_name.value in parent.classes[self.name.class_name.value].functions:
                        self.moth_type = parent.classes[self.name.class_name.value].functions["Moth" + self.name.function_name.value]
                    else:
                        throwError("Function [\033[1;34m" + self.name.class_name.value + "." + self.name.function_name.value + "\033[0;0m] not defined in scope ","FuncUnDefined",self.lineno)
                else:
                    throwError("Class [\033[1;34m" + str(self.name.class_name) + "\033[0;0m] not defined in scope ","ClassUnDefined",self.lineno)
            elif self.name.value in parent.functions:
                self.moth_type = parent.functions[self.name.value]
            else:
                if self.name.value == "MoththrowErr":
                    pass
                else:
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
        return out

class Lines(Container):
    pass

class BaseType(AstObj):
    def __init__(self,name,lineno = None):
        self.lineno = lineno
        self.name = name

    def find_variables(self,parent=None):
        return self
    
    def eval(self,parent=None,isRaw=False):
        return self.get_c()
    
    def get_c(self,parent=None):
        return "__Moth" + self.name.value
    
    def get_raw(self):
        return "Base"

    def get_special(self,is_class=False):
        return ""

class Template(BaseType):

    def __init__(self,name,lineno=None):
        super().__init__(name,lineno)
        self.value = name.value
        self.c_str = self.value

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

    def get_special(self,is_class=False):
        if is_class:
            return ""
        return ""
    
class TupleType(BaseType):
    def get_c(self,parent=None):
        return "__MothTuple<" + self.name.get_c() + ">"
    
    def get_raw(self):
        return "Tuple"

    def get_special(self,is_class=False):
        if is_class:
            return ""
        return ""

class ListLiteral(Container):
    def eval(self,var,parent,isRaw=False):
        out = ""
        return var.eval(parent) + ".Mothreset();" + ";".join([var.eval(parent) + "." + "Mothappend(" + i.eval(parent) + ")" for i in self.items])

class TupleLiteral(Container):
    def __init__(self,dtype,item=None,lineno=None):
        super().__init__(item,lineno)
        self.dtype = dtype

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
    
    def get_raw(self):
        return "Object"

class ArrayType(BaseType):
    def __init__(self,name, lineno = None):
        super().__init__(name,lineno)
        self.dimensions = 1

    def add_dim(self):
        self.dimensions += 1
        return self
    
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
                            slice_inputs.append(self.name.eval(parent) + ".dims.get()[" + str(idx) + "]")
                        else:
                            slice_inputs.append(i.end.eval(parent))
                        slice_inputs.append(i.step.eval(parent))
                    else:
                        slice_inputs += [i.eval(parent),i.eval(parent),"0"]
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

    def find_variables(self,parent):
        self.val = self.val.find_variables(parent)
        self.string = self.string.find_variables(parent)
        return self

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

    def eval(self,parent,isRaw=False):
        return self.val.eval(parent,isRaw=isRaw)

class Cptr(Ctypes):
    def __init__(self,var,lineno=None):
        self.lineno = lineno
        self.var = var
    
    def find_variables(self,parent):
        self.var = self.var.find_variables(parent)
        return self

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
        return "(" + self.new_type.get_c() + ")" + "(" + self.expression.eval(parent,isRaw=isRaw) + ")"
    
class Null(AstObj):
    def __init__(self,lineno=None):
        self.lineno = lineno
    
    def find_variables(self,parent):
        return self
    
    def eval(self,parent,isRaw=False):
        return "NULL"