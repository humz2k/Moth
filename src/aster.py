from rply.token import Token

HEADERS = "#include <stdlib.h>\n#include <stdio.h>\n#include <math.h>\n"
DEFINES = ""

ARRAY_TYPES = []

INT_TYPES = ["char","short","int","long","bool","flint"]
UINT_TYPES = ["unsigned char","unsigned short","unsigned int","unsigned long","bool","flint"]
FLOAT_TYPES = ["float","double","flint"]

def throwError(err,lineno):
    print("CODE GEN ERROR @ line " + str(lineno) + ":")
    print("   " + err)
    exit()

def generateArrayType(arrayT):
    global ARRAY_TYPES,DEFINES
    if not arrayT in ARRAY_TYPES:
        out = r"""
struct """ + arrayT + r"""Array {
    int initialized;
    int ndims;
    int* dims;
    """ + arrayT + r"""* raw;
};
        """
        DEFINES += out
    return "struct " + arrayT + "Array"

def doRawTypesAgree(type1,type2):
    global INT_TYPES,UINT_TYPES,FLOAT_TYPES
    if (type1 in INT_TYPES) and (type2 in INT_TYPES):
        return True
    if (type1 in UINT_TYPES) and (type2 in UINT_TYPES):
        return True
    if (type1 in FLOAT_TYPES) and (type2 in FLOAT_TYPES):
        return True
    if (type1 in (INT_TYPES + UINT_TYPES)) and (type2 in (INT_TYPES + UINT_TYPES)):
        return True
    return False

def isidentifier(val):
    try:
        float(val)
        return False
    except:
        return True

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
    pass

class Identifier(AstObj):
    def __init__(self,token):
        self.token = token
        self.value = self.token.value
        self.name = self.token.name
    
    def find_variables(self,parent):
        raw = self
        c_str = self.value
        c_type = parent.declarations[c_str].get_c()
        moth_type = parent.declarations[c_str]
        return Variable(raw,c_str,c_type,moth_type)

class String(AstObj):
    def __init__(self,token):
        self.token = token
        self.value = self.token.value
        self.name = self.token.name

    def find_variables(self,parent):
        return self

class Number(AstObj):
    def __init__(self,token):
        self.token = token
        self.value = self.token.value
        self.name = self.token.name
        if "." in self.value:
            self.c_type = "float"
        else:
            self.c_type = "int"
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
                throwError("Found non-function or non-class on top level",self.lineno)

    def find_classes(self):
        self.classes = []
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

    def eval(self):
        global HEADERS,DEFINES
        self.verify()
        self.find_classes()
        self.find_functions()
        self.find_declarations()
        self.find_variables()
        out = ""
        for scope in self.items:
            out += scope.eval(self)
        return HEADERS + DEFINES + out + "\nint main() { return Mothmain();}\n"

class Scope(AstObj):
    def __init__(self,header,body,lineno=None):
        self.lineno = lineno
        self.header = header
        self.body = body
        self.type = "scope"
        self.functions = {}
        self.variables = {}
        self.declarations = {}

    def find_classes(self,out):
        if isinstance(self.header,ClassHeader):
            if self.header.name.value in out:
                throwError("Redefined class " + self.header.name.value,self.lineno)
            out.append(self.header.name.value)
    
    def find_functions(self,out):
        if isinstance(self.header,FunctionHeader):
            if self.header.name.value in out.keys():
                throwError("Redefined function " + self.header.name.value,self.lineno)
            out[self.header.name.value] = self.header.return_type
            return
        
        if isinstance(self.header,ClassHeader):
            self.functions = {}
            for i in self.body.lines.items:
                if isinstance(i,Scope):
                    if isinstance(i.header,FunctionHeader):
                        if i.header.name.value in self.functions:
                            throwError("Redefined function " + self.header.name.value + "." + i.header.name.value,self.lineno)
                        self.functions[i.header.name.value] = i.header.return_type
                        out[i.header.name.value] = i.header.return_type
            return
    
    def find_declarations(self,declarations):
        if isinstance(self.header,ForHeader):
            if type(self.header.var_t) != type(None):
                self.declarations[self.header.var.name.value] = self.header.var_t
        self.dont_declare = []
        if isinstance(self.header,FunctionHeader):
            self.header.find_declarations(self.declarations,self.dont_declare)
        self.body.find_declarations(self.declarations)

    def find_variables(self,parent):
        self.declarations.update(parent.declarations)
        self.header.find_variables(self)
        self.body.find_variables(self)

    def eval(self,parent):
        self.functions = parent.functions
        out = ""
        out += self.header.eval(parent) + "{\n"
        out += "".join([self.declarations[i].get_c() + " " + i + ";" for i in self.declarations.keys() if not i in self.dont_declare]) + "\n"
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

    def find_variables(self,parent):
        lines = []
        for line in self.lines.items:
            lines.append(line.find_variables(parent))
        self.lines = lines
        return self

    def eval(self,parent):
        out = ""
        for line in self.lines:
            out += line.eval(parent) + ";\n"
        return out


class ScopeHeader(AstObj):
    pass

class ClassHeader(ScopeHeader):
    def __init__(self,name,inherits=None,lineno = None):
        self.lineno = lineno
        self.name = name
        self.inherits = inherits
        self.type = "class"
    
    def find_variables(self,parent):
        return self

class FunctionHeader(ScopeHeader):
    def __init__(self,return_type,name,inputs,lineno = None):
        self.lineno = lineno
        self.return_type = return_type
        self.name = Token("IDENTIFIER","Moth" + name.value)
        self.inputs = inputs
    
    def find_variables(self,parent):
        self.inputs = self.inputs.find_variables(parent)
        return self

    def find_declarations(self,declarations,dont_declare):
        self.inputs.find_declarations(declarations,dont_declare)
    
    def eval(self,parent):
        c_header = self.return_type.get_c() + " " + self.name.value
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

class ElifHeader(ScopeHeader):
    def __init__(self,expression,lineno = None):
        self.lineno = lineno
        self.expression = expression
    
    def find_variables(self,parent):
        self.expression = self.expression.find_variables(parent)
        return self

class ElseHeader(ScopeHeader):
    def __init__(self,lineno = None):
        self.lineno = lineno
    
    def find_variables(self,parent):
        return self

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
        pass

class RangeObj(AstObj):
    def __init__(self,start,end,step,lineno = None):
        self.lineno = lineno
        self.start,self.end,self.step = start,end,step
        if type(self.start) == type(None):
            self.start = Constant(Token("NUMBER","0"))
        if type(self.step) == type(None):
            self.step = Constant(Token("NUMBER","1"))
    
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
        pass

class FunctionCall(AstObj):
    def __init__(self,name,inp=None,lineno=None):
        self.lineno = lineno
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
        return self

    def add(self,inp):
        self.inputs.append(inp)
        return self
    
    def eval(self,parent):
        return self.name.value + "(" + ",".join([i.eval(parent) for i in self.inputs]) + ")"

class Lines(Container):
    pass

class BaseType(AstObj):
    def __init__(self,name,lineno = None):
        self.lineno = lineno
        self.name = name
        if isinstance(self.name,Token):
            if self.name.value == "bool":
                self.name.value = "int"
            if self.name.value[0] == "u":
                self.name.value = "unsigned " + self.name.value[1:]
        self.dimensions = 1

class Type(BaseType):
    def get_c(self):
        return self.name.value

class ObjectType(BaseType):
    def get_c(self):
        print("OBJECT TYPE NOT IMPLEMENTED")
        exit()

class ArrayType(BaseType):
    def add_dim(self):
        self.dimensions += 1
        return self
    
    def get_c(self):
        return "struct " + self.name.get_c() + "Array*"
    
class ArrayReference(AstObj):
    def __init__(self,name,index,lineno=None):
        self.lineno = lineno
        self.name = name
        self.index = [index]
    
    def find_variables(self,parent):
        self.name = self.name.find_variables(parent)
        index = []
        for i in self.index:
            index.append(i.find_variables(parent))
        self.index = index
        return self
    
    def add(self,index):
        self.index.append(index)
        return self

    def eval(self,parent):
        index = [i.eval(parent) for idx,i in enumerate(self.index)]
        reverse = ["(" + self.name.c_str + "->dims[" + str(i) + "])" for i in list(range(len(index)))]
        if parent.declarations[self.name.c_str].dimensions != len(self.index):
            throwError("Array index error",self.lineno)
        reverse.pop(0)
        reverse.append(str(1))
        reverse = reverse[::-1]
        c_index = []
        for i in range(len(index)):
            c_index.append("(" + index[i] + "*" + "*".join(reverse[:len(index)-i]) + ")")
        return self.name.c_str + "->raw[" + "+".join(c_index) + "]"

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
    
    def find_variables(self,parent):
        self.var = self.var.find_variables(parent)
        self.expression = self.expression.find_variables(parent)
        return self
    
    def eval(self,parent):
        if isinstance(self.var,ArrayReference):
            return self.var.eval(parent) + " = " + self.expression.eval(parent)
        if isinstance(self.var.moth_type,ArrayType):
            return self.expression.get_c(self.var,parent)
        return self.var.c_str + " = " + self.expression.eval(parent)
    
class AllocArray(Container):
    def get_c(self,var,parent):
        dims = [i.eval(parent) for i in self.items]
        ndims = len(dims)
        vardims = var.raw.type_name.dimensions
        if ndims != vardims:
            throwError("Array Dims dont match",self.lineno)
        c_t = var.raw.type_name.name.get_c()
        array_t = generateArrayType(var.raw.type_name.name.get_c())
        out = ""
        out += var.c_str + " = (" + array_t + "*)malloc(" + "sizeof(" + array_t + "));\n"
        out += var.c_str + "->dims = (int*)malloc(" + str(ndims) + "*sizeof(int));\n"
        out += "".join([var.c_str + "->dims[" + str(idx) + "] = " + i + ";" for idx,i in enumerate(dims)]) + "\n"
        out += var.c_str + "->raw = (" + c_t + "*" + ")malloc(" + "*".join(dims) + "*sizeof(" + c_t + "))"
        return out 

class Free(AstObj):
    def __init__(self,var,lineno=None):
        self.lineno = lineno
        self.var = var
    
    def find_variables(self,parent):
        self.var = self.var.find_variables(parent)
        return self
    
    def eval(self,parent):
        out = ""
        out += "free(" + self.var.c_str + "->dims);free(" + self.var.c_str + "->raw);free(" + self.var.c_str + ")"
        return out
 
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
        pass

class Inc(AstObj):
    def __init__(self,var,op,lineno=None):
        self.lineno = lineno
        self.var = var
        self.op = op
    
    def find_variables(self,parent):
        self.var = self.var.find_variables(parent)
    
    def eval(self,parent):
        pass

class BinOp(AstObj):
    def __init__(self,left,op,right,lineno=None):
        self.lineno = lineno
        self.left = left
        self.op = op
        if self.op.value == "and":
            self.op.value = "&&"
        elif self.op.value == "or":
            self.op.value = "||"
        self.right = right
    
    def find_variables(self,parent):
        self.left = self.left.find_variables(parent)
        self.right = self.right.find_variables(parent)
        return self

    def eval(self,parent):
        out = ""
        op = self.op.value
        if op in ["+","-","*","/","%","&&","||","&","|","==","!=",">","<",">=","<="]:
            out += "(" + self.left.eval(parent) + ") " + op + " (" + self.right.eval(parent) + ")"
        else:
            print("OP",op,"not implemented")
            exit()
        return out

class Not(AstObj):
    def __init__(self,val,lineno=None):
        self.lineno = lineno
        self.val = val
    
    def find_variables(self,parent):
        self.val = self.val.find_variables(parent)
        return self

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
        formatters = {"int" : r"%d", "float": r"%f"}
        for i in self.items:
            if isinstance(i,String):
                out.append(r'printf("%s",' + i.value + r')')
            elif isinstance(i,ArrayReference):
                c_t = i.name.moth_type.name.get_c()
                out.append(r'printf("' + formatters[c_t] + r'",' + i.eval(parent) + r')')
            else:
                out.append(r'printf("' + formatters[i.c_type] + r'",' + i.eval(parent) + r')')
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

class Cval(Ctypes):
    def __init__(self,val,lineno=None):
        self.lineno = lineno
        self.val = val
    
    def find_variables(self,parent):
        self.val = self.val.find_variables(parent)
        return self

class Cptr(Ctypes):
    def __init__(self,var,lineno=None):
        self.lineno = lineno
        self.var = var
    
    def find_variables(self,parent):
        self.val = self.val.find_variables(parent)
        return self

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
        pass
    
class Reference(AstObj):
    def __init__(self,parent,child,lineno=None):
        self.lineno = lineno
        self.parent = parent
        self.child = child
    
    def find_variables(self,parent):
        self.parent = self.parent.find_variables(parent)
        self.child = self.child.find_variables(parent)
        return self

class Cast(AstObj):
    def __init__(self,new_type,expression,lineno=None):
        self.lineno = lineno
        self.new_type = new_type
        self.expression = expression
    
    def find_variables(self,parent):
        self.expression = self.expression.find_variables(parent)
        return self