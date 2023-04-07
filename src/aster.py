from rply.token import Token

HEADERS = "#include <stdlib.h>\n#include <stdio.h>\n#include <math.h>\n"

def throwError(err):
    print(err)
    exit()

class AstObj:
    pass

class Container(AstObj):
    def __init__(self,item=None):
        if type(item) != type(None):
            self.items = [item]
        else:
            self.items = []
    
    def add(self,item):
        self.items.append(item)
        return self

class Program(Container):

    def verify(self):
        for scope in self.items:
            if not scope.header.type in ["function","class"]:
                throwError("Found non-function or non-class on top level")

    def find_classes(self):
        self.classes = []
        for scope in self.items:
            scope.find_classes(self.classes)
    
    def find_functions(self):
        self.functions = {}
        for scope in self.items:
            scope.find_functions(self.functions)

    def find_variables(self):
        self.variables = {}
        for scope in self.items:
            scope.find_variables()

    def eval(self):
        global HEADERS
        self.verify()
        self.find_classes()
        self.find_functions()
        self.find_variables()
        out = ""
        for scope in self.items:
            out += scope.eval(self)
        return HEADERS + out

class Scope(AstObj):
    def __init__(self,header,body):
        self.header = header
        self.body = body
        self.type = "scope"
        self.functions = {}
        self.variables = {}

    def find_classes(self,out):
        if self.header.type == "class":
            if self.header.name.value in out:
                throwError("Redefined class " + self.header.name.value)
            out.append(self.header.name.value)
    
    def find_functions(self,out):
        if self.header.type == "function":
            if self.header.name.value in out.keys():
                throwError("Redefined function " + self.header.name.value)
            out[self.header.name.value] = self.header.return_type
            return
        
        if self.header.type == "class":
            self.functions = {}
            for i in self.body.lines.items:
                if isinstance(i,Scope):
                    if i.header.type == "function":
                        if i.header.name.value in self.functions:
                            throwError("Redefined function " + self.header.name.value + "." + i.header.name.value)
                        self.functions[i.header.name.value] = i.header.return_type
            return

    def find_variables(self):
        self.variables = {}
        if self.header.type == "function":
            for i in self.header.inputs.items:
                if i[1].value in self.variables.keys():
                    throwError("Redefined variable " + i[1].value)
                self.variables[i[1].value] = i[0]
        for line in self.body.lines.items:
            if isinstance(line,Scope):
                line.find_variables()
            else:
                if isinstance(line,Assign):
                    if isinstance(line.var,Declaration):
                        if line.var.name.value in self.variables.keys():
                            throwError("Redefined variable " + line.var.name.value)
                        self.variables[line.var.name.value] = line.var.type_name
                elif isinstance(line,Declaration):
                    if line.name.value in self.variables.keys():
                        throwError("Redefined variable " + line.name.value)
                    self.variables[line.name.value] = line.type_name

    def eval(self,parent):
        self.functions.update(parent.functions)
        self.variables.update(parent.variables)
        self.classes = parent.classes
        out = ""
        if self.header.type == "function":
            c_header = self.header.return_type.get_c() + " " + self.header.name.value
            c_header += "(" + ",".join([i[0].get_c() + " " + i[1].value for i in self.header.inputs.items]) + ")"
            c_body = ""
            for line in self.body.lines.items:
                c_body += line.eval(self) + "\n"
            out = c_header + "{\n" + c_body + "}\n"
        
        return out

class ScopeHeader(AstObj):
    pass

class ClassHeader(ScopeHeader):
    def __init__(self,name,inherits=None):
        self.name = name
        self.inherits = inherits
        self.type = "class"

class FunctionHeader(ScopeHeader):
    def __init__(self,return_type,name,inputs):
        self.return_type = return_type
        self.name = name
        self.inputs = inputs
        self.type = "function"

class FunctionDefInputs(Container):
    pass

class IfHeader(ScopeHeader):
    def __init__(self,expression):
        self.expression = expression
        self.type = "if"

class ElifHeader(ScopeHeader):
    def __init__(self,expression):
        self.expression = expression
        self.type = "elif"

class ElseHeader(ScopeHeader):
    def __init__(self):
        self.type = "else"

class ForHeader(ScopeHeader):
    def __init__(self,var,range_obj):
        self.var = var
        self.range_obj = range_obj
        self.type = "for"

class RangeObj(AstObj):
    def __init__(self,start,end,step):
        self.start,self.end,self.step = start,end,step
        self.type = "range"

class WhileHeader(ScopeHeader):
    def __init__(self,condition):
        self.condition = condition
        self.type = "while"

class FunctionCall(AstObj):
    def __init__(self,name,inp=None):
        self.name = name
        if type(inp) != type(None):
            self.inputs = [inp]
        else:
            self.inputs = []
        self.type = "function_call"

    def add(self,inp):
        self.inputs.append(inp)

class ScopeBody(AstObj):
    def __init__(self,lines):
        self.lines = lines
        self.type = "scope_body"

class Lines(Container):
    pass

class BaseType(AstObj):
    def __init__(self,name):
        self.name = name
        self.dimensions = 1

class Type(BaseType):
    def get_c(self):
        return self.name.value

class ObjectType(BaseType):
    pass

class ArrayType(BaseType):
    def add_dim(self):
        self.dimensions += 1
        return self

    def get_c(self):
        return self.name.name.value + "*"
    
class AllocArray(Container):
    pass
    
class ArrayReference(AstObj):
    def __init__(self,name,index):
        self.name = name
        self.index = [index]
    
    def add(self,index):
        self.index.append(index)

class Declaration(AstObj):
    def __init__(self,type_name,name):
        self.type_name = type_name
        self.name = name

    def eval(self,parent):
        return self.get_c() + ";"
    
    def get_c(self):
        return self.type_name.get_c() + " " + self.name.value

class Assign(AstObj):
    def __init__(self,var,expression):
        self.var = var
        self.expression = expression
    
    def eval(self,parent):
        out = ""
        isArray = False
        if isinstance(self.var,Declaration):
            out += self.var.get_c()
            if isinstance(self.var.type_name,ArrayType):
                isArray = True
        else:
            out += self.var.value
            if isinstance(self.parent.variables[self.var.value],ArrayType):
                isArray = True
        out += " = "
        if isArray:
            arrayType = self.var.type_name.name.get_c()
            ndims = self.var.type_name.dimensions
            dimensions = []
            for i in self.expression.items:
                if isinstance(i,Token):
                    dimensions.append(i.value)
                else:
                    dimensions.append(i.eval(parent))
            if len(dimensions) != ndims:
                throwError("Dimension mismatch")
            out += "(" + self.var.type_name.get_c() + ")malloc(sizeof(" + arrayType + ")*(" + "*".join(dimensions) + "))"
            print(arrayType,ndims,"*".join(dimensions))
        else:
            if isinstance(self.expression,Token):
                out += self.expression.value
            else:
                out += self.expression.eval(parent)
        return out + ";"
    
class Free(AstObj):
    def __init__(self,var):
        self.var = var
    
    def eval(self,parent):
        if isinstance(self.var,Token):
            return "free(" + self.var.value + ");"
 
class AssignInc(AstObj):
    def __init__(self,var,expression,op):
        self.var = var
        self.expression = expression
        self.op = op

class Inc(AstObj):
    def __init__(self,var,op):
        self.var = var
        self.op = op

class BinOp(AstObj):
    def __init__(self,left,op,right):
        self.left = left
        self.op = op
        self.right = right
    
    def eval(self,parent):
        out = ""
        if isinstance(self.left,Token):
            left = "(" + self.left.value + ")"
        else:
            left = "(" + self.left.eval(parent) + ")"
        if isinstance(self.right,Token):
            right = "(" + self.right.value + ")"
        else:
            right = "(" + self.right.eval(parent) + ")"
        if self.op.value == "**":
            return "pow(" + left + "," + right + ")"
        else:
            return left + self.op.value + right

class Not(AstObj):
    def __init__(self,val):
        self.val = val

class Return(AstObj):
    def __init__(self,val=None):
        self.val = val

class Print(Container):
    def eval(self,parent):
        out = ""
        statements = []
        for i in self.items:
            if isinstance(i,Token):
                if i.name == "STRING":
                    statements.append("printf(" + i.value + ")")
                if i.name == "IDENTIFIER":
                    print("FF")
                    var_t = parent.variables[i.value].get_c()
                    formatter = {"int" : r"%d","float" : r"%f"}
                    statements.append('printf("' + formatter[var_t] + '"' + ',' + i.value + ')')
            else:
                print(i.eval(parent))
        return ";".join(statements) + ";"

class Pass(AstObj):
    pass

class Break(AstObj):
    pass

class Ctypes(AstObj):
    pass

class Cval(Ctypes):
    def __init__(self,val):
        self.val = val

class Cptr(Ctypes):
    def __init__(self,var):
        self.var = var

class Ccall(Ctypes):
    def __init__(self,func_name):
        self.func_name = func_name
        self.inputs = []
    
    def add(self,inp):
        self.inputs.append(inp)
        return self
    
class Reference(AstObj):
    def __init__(self,parent,child):
        self.parent = parent
        self.child = child