from rply.token import Token
import sys

HEADERS = '#include "moth_lib.hpp"\n\n'
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
    
    def eval(self,parent):
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
            throwError("Name \033[1;34m" + c_str + "\033[0;0m not found in scope [\033[1;34m" + parent.header.name.value[4:] + "\033[0;0m]","VarNotFound",self.lineno)
        moth_type = parent.declarations[c_str]
        return Variable(raw,c_str,c_type,moth_type)

    def eval(self,parent=None):
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
    
    def eval(self,parent):
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
    
    def eval(self,parent):
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

    def eval(self,parent):
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
            if not (isinstance(scope.header,FunctionHeader) or isinstance(scope.header,ClassHeader)):
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

    def eval(self, line_offset = 0):
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
                throwError("Function [\033[1;34m" + self.header.name.value[4:] + "\033[0;0m] is already defined","RedefinedFunc",self.lineno)
            out[self.header.name.value] = self.header.return_type
            return
        
        if isinstance(self.header,ClassHeader):
            self.functions = {}
            for i in self.body.lines.items:
                if isinstance(i,Scope):
                    i.classes = self.classes
                    if isinstance(i.header,FunctionHeader):
                        if i.header.name.value in self.functions:
                            throwError("Function [\033[1;34m" + self.header.name.value + "." + i.header.name.value[4:] + "\033[0;0m] is already defined","RedefinedMemFunc",i.lineno)
                            #throwError("Redefined function " + self.header.name.value + "." + i.header.name.value,"RedefineMemFunc",self.lineno)
                        self.functions[i.header.name.value] = i.header.return_type
                        out[i.header.name.value] = i.header.return_type
            return
    
    def find_declarations(self,declarations,dont_declare=[]):
        self.dont_declare = dont_declare[:]
        if isinstance(self.header,ForHeader):
            if type(self.header.var_t) != type(None):
                self.declarations[self.header.var.value] = self.header.var_t
                self.dont_declare.append(self.header.var.value)
        if isinstance(self.header,FunctionHeader):
            self.header.find_declarations(self.declarations,self.dont_declare)
        self.body.find_declarations(self.declarations)

    def find_variables(self,parent):
        self.classes.update(parent.classes)
        self.declarations.update(parent.declarations)
        self.dont_declare += list(parent.declarations.keys())
        self.header.find_variables(self)
        self.body.find_variables(self)
        return self

    def eval(self,parent,dont_declare=[]):
        self.dont_declare += dont_declare
        self.functions = parent.functions
        self.classes = parent.classes
        out = ""
        out += self.header.eval(parent) 
        is_class = False
        if isinstance(self.header,ClassHeader):
            is_class = True
        else:
            out += "{\n"
        out += "".join([self.declarations[i].get_c() + " " + i + self.declarations[i].get_special(is_class) + ";" for i in self.declarations.keys() if not i in self.dont_declare]) + "\n"
        if isinstance(self.header,ClassHeader):
            out += self.body.eval(self,self.declarations)
            if self.header.inherits == "STATIC":
                pass
            else:
                out += "\n}" + ";\n"
        else:
            out += self.body.eval(self)
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

    def eval(self,parent,dont_declare=[]):
        out = ""
        for line in self.lines:
            if not (isinstance(line,Variable) or isinstance(line,Pass)):
                if isinstance(line,Scope):
                    if isinstance(line.header,FunctionHeader):
                        #line.header.name.value = "OBJECT_" + parent.header.name.value+"_"+line.header.name.value
                        out += line.eval(parent,dont_declare) + "\n"
                    else:
                        out += line.eval(parent) + "\n"
                else:
                    out += line.eval(parent) + ";\n"
        return out


class ScopeHeader(AstObj):
    pass

class ClassHeader(ScopeHeader):
    def __init__(self,name,inherits=None,lineno = None):
        self.lineno = lineno
        self.name = name
        self.inherits = str(inherits)
        self.type = "class"
    
    def find_variables(self,parent):
        return self

    def eval(self,parent):
        global STRUCTS
        out = ""
        if self.inherits == "STATIC":
            pass
        else:
            out += "class __MothObject" + self.name.value + "{\npublic:\n"
        #STRUCTS += "struct Moth" + self.name.value + ";typedef struct Moth" + self.name.value + " Moth" + self.name.value + ";\n"
        return out

class FunctionHeader(ScopeHeader):
    def __init__(self,return_type,name,inputs,lineno = None):
        self.lineno = lineno
        self.return_type = return_type
        self.name = Token("IDENTIFIER","Moth" + name.value)
        self.inputs = inputs
        if self.name.value == "Mothmain" and self.return_type.get_c() != "__Mothint":
            throwError("Function [\033[1;34mmain\033[0;0m] returns \033[1;34m" + self.return_type.get_c()[6:] + "\033[0;0m instead of \033[1;34mint\033[0;0m","MainReturnType",self.lineno)
    
    def find_variables(self,parent):
        self.inputs = self.inputs.find_variables(parent)
        return self

    def find_declarations(self,declarations,dont_declare):
        self.inputs.find_declarations(declarations,dont_declare)
    
    def eval(self,parent):
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
        c_header += "(" + ",".join([i[0].get_c() + " " + i[1].c_str for i in self.inputs.items]) + ")"
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
    
    def eval(self,parent):
        return "if (" + self.expression.eval(parent) + ")"

class ElifHeader(ScopeHeader):
    def __init__(self,expression,lineno = None):
        self.lineno = lineno
        self.expression = expression
    
    def find_variables(self,parent):
        self.expression = self.expression.find_variables(parent)
        return self
    
    def eval(self,parent):
        return "else if (" + self.expression.eval(parent) + ")"

class ElseHeader(ScopeHeader):
    def __init__(self,lineno = None):
        self.lineno = lineno
    
    def find_variables(self,parent):
        return self
    
    def eval(self,parent):
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
    
    def eval(self,parent):
        return "for (" + self.var.c_str + " = " + self.range_obj.start.eval(parent) + ";" + self.var.c_str + " < " + self.range_obj.end.eval(parent) + ";" + self.var.c_str + " = " + self.var.c_str + " + " + self.range_obj.step.eval(parent) + ")"

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
    
    def eval(self,parent):
        return "while (" + self.condition.eval(parent) + ")"
    
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
        return self

    def add(self,inp):
        self.inputs.append(inp)
        return self
    
    def eval(self,parent):
        if isinstance(self.name,Reference):
            name = self.name.eval(parent)
        elif isinstance(self.name,StaticFunction):
            name = "__Moth"+self.name.class_name.value+"Moth"+self.name.function_name.value
        else:
            name = self.name.value
        return name + "(" + ",".join([i.eval(parent) for i in self.inputs]) + ")"

class Lines(Container):
    pass

class BaseType(AstObj):
    def __init__(self,name,lineno = None):
        self.lineno = lineno
        self.name = name
    
    def get_c(self):
        return "__Moth" + self.name.value
    
    def get_raw(self):
        return "Base"

    def get_special(self,is_class=False):
        return ""

class ListType(BaseType):
    def get_c(self):
        return "__MothListContainer<" + self.name.get_c() + ">"
    
    def get_raw(self):
        return "ListContainer"

    def get_special(self,is_class=False):
        if is_class:
            return ""
        return ""

class ListLiteral(Container):
    def eval(self,var,parent):
        return ";".join([var.eval(parent) + "." + "Mothappend(" + i.eval(parent) + ")" for i in self.items])

class Type(BaseType):
    pass

class ObjectType(BaseType):
    def get_c(self):
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
    
    def get_c(self):
        return "__MothArray<" + self.name.get_c() + ">"

    def get_raw(self):
        return "Array"
    
    def get_special(self,is_class=False):
        if is_class:
            return "{" + str(self.dimensions) + "}"
        return "(" + str(self.dimensions) + ")"
    
class ArrayReference(AstObj):
    def __init__(self,name,index,lineno=None):
        self.lineno = lineno
        self.name = name
        self.index = [index]
    
    def find_variables(self,parent):
        self.name = self.name.find_variables(parent)
        index = []
        self.moth_type = self.name.moth_type.name
        for i in self.index:
            index.append(i.find_variables(parent))
        self.index = index
        return self
    
    def add(self,index):
        self.index.append(index)
        return self

    def eval(self,parent):
        size = str(len(self.index))
        index = ",".join([i.eval(parent) for idx,i in enumerate(self.index)])
        return "__Moth" + self.name.moth_type.get_raw() + "INDEX(" + self.name.eval(parent) + "," + size + "," + index + ")"


class Declaration(AstObj):
    def __init__(self,type_name,name,lineno=None):
        self.lineno = lineno
        self.type_name = type_name
        self.name = name
    
    def find_variables(self,parent):
        var = Variable(self,self.name.value,self.type_name.get_c(),self.type_name)
        return var

    def eval(self,parent):
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
    
    def eval(self,parent):
        if isinstance(self.expression,AllocArray):
            return self.expression.eval(self.var,parent)
        elif isinstance(self.expression,AllocObject):
            return self.expression.eval(self.var,parent)
        elif isinstance(self.expression,ListLiteral):
            return self.expression.eval(self.var,parent)
        else:
            return self.var.eval(parent) + " = " + self.expression.eval(parent)
    
class AllocObject(AstObj):
    def __init__(self,objname,lineno=None):
        self.objname = objname
        self.lineno = lineno
    
    def find_variables(self,parent):
        return self
    
    def eval(self,var,parent):
        self.objname.name.value = var.eval(parent) + ".Moth__init__"
        return self.objname.eval(parent)
        return ""

class AllocArray(Container):
    def eval(self,var,parent):
        return var.eval(parent) + "." + "init(" + ",".join([i.eval(parent) for i in self.items]) + ")"
 
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
    
    def eval(self,parent):
        return Assign(self.var,BinOp(self.var,Token("",self.op.value[:-1]),self.expression)).eval(parent)

class Inc(AstObj):
    def __init__(self,var,op,lineno=None):
        self.lineno = lineno
        self.var = var
        self.op = op
    
    def find_variables(self,parent):
        self.var = self.var.find_variables(parent)
        return self
    
    def eval(self,parent):
        return Assign(self.var,BinOp(self.var,Token("",self.op.value[0]),Number(Token("","1")))).eval(parent)

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

    def eval(self,parent):
        return "__Moth" + self.right.moth_type.get_raw() + self.op.name + "(" + self.left.eval(parent) + "," + self.right.eval(parent) + ")"

class Not(AstObj):
    def __init__(self,val,lineno=None):
        self.lineno = lineno
        self.val = val
    
    def find_variables(self,parent):
        self.val = self.val.find_variables(parent)
        return self
    
    def eval(self,parent):
        return "__Moth" + self.val.moth_type.get_raw() + "NOT(" + self.val.eval(parent) + ")"

class Return(AstObj):
    def __init__(self,val=None,lineno=None):
        self.lineno = lineno
        self.val = val
    
    def find_variables(self,parent):
        if type(self.val) != type(None):
            self.val = self.val.find_variables(parent)
        return self
    
    def eval(self,parent):
        out = "return "
        if type(self.val) != type(None):
            out += self.val.eval(parent)
        return out

class Print(Container):
    def eval(self,parent):
        out = []
        formatters = {"int" : r"%d", "float": r"%f", "double": r"%lf","char":r"%c"}
        for i in self.items:
            out.append(r'__MothPrint(' + i.eval(parent) + r')')
        return ";".join(out)

class Pass(AstObj):
    def find_variables(self,parent):
        return self
    
    def eval(self,parent):
        return ""

class Break(AstObj):
    def find_variables(self,parent):
        return self
    def eval(self,parent):
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
    
    def eval(self,parent=None):
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

class Clit(Ctypes):
    def __init__(self,val,lineno=None):
        self.lineno = lineno
        self.val = val
    
    def find_variables(self,parent):
        return self
    
    def eval(self,parent):
        try:
            return self.val.value
        except:
            return self.val.eval(parent)

class Cval(Ctypes):
    def __init__(self,val,lineno=None):
        self.lineno = lineno
        self.val = val
    
    def find_variables(self,parent):
        self.val = self.val.find_variables(parent)
        return self

    def eval(self,parent):
        return self.val.eval(parent)

class Cptr(Ctypes):
    def __init__(self,var,lineno=None):
        self.lineno = lineno
        self.var = var
    
    def find_variables(self,parent):
        self.var = self.var.find_variables(parent)
        return self

    def eval(self,parent):
        if isinstance(self.var,Null):
            return "NULL"
        elif isinstance(self.var.moth_type,ArrayType):
            return self.var.c_str + ".raw"
        elif isinstance(self.var.moth_type,ObjectType):
            return self.var.c_str
        else:
            return "&"+self.var.c_str

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

    def eval(self,parent):
        return self.func_name.value + "(" + ",".join([i.eval(parent) for i in self.inputs]) + ")"
    
class Reference(AstObj):
    def __init__(self,parent,child,lineno=None):
        self.lineno = lineno
        self.parent = parent
        self.child = child
    
    def find_variables(self,parent,function=False):
        self.parent = self.parent.find_variables(parent)
        if not function:
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

    def eval(self,parent):
        return self.c_str #self.parent.eval(parent) + "." + self.child.eval(parent)

class Cast(AstObj):
    def __init__(self,new_type,expression,lineno=None):
        self.lineno = lineno
        self.new_type = new_type
        self.expression = expression
        self.c_type = self.new_type.get_c()
    
    def find_variables(self,parent):
        self.expression = self.expression.find_variables(parent)
        return self
    
    def eval(self,parent):
        return "(" + self.new_type.get_c() + ")" + "(" + self.expression.eval(parent) + ")"
    
class Null(AstObj):
    def __init__(self,lineno=None):
        self.lineno = lineno
    
    def find_variables(self,parent):
        return self
    
    def eval(self,parent):
        return "NULL"