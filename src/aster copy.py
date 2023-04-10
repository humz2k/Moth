from rply.token import Token

HEADERS = "#include <stdlib.h>\n#include <stdio.h>\n"
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
    out = r"""
    struct """ + arrayT + r"""Array {
        int initialized;
        int ndims;
        int* dims;
        """ + arrayT + r"""* raw;
    };
    """
    return out

def getVarC(var,parent=None):
    if isinstance(var,Token):
        return var.value
    if isinstance(var,Declaration):
        return var.get_c()
    if isinstance(var,ArrayReference):
        dims = list(range(len(var.index)))
        dims = [var.name.value + "->dims[" + str(i) + "]" for i in dims[1:]]
        dims.append("1")
        dims = dims[::-1]
        additions = []
        for idx,i in enumerate(var.index):
            to_mul = dims[:len(dims) - idx]
            evaluated,t = evaluateExpression(i,parent)
            if not t in ["int","flint"]:
                throwError("array index error")
            additions.append(evaluated + "*(" + "*".join(to_mul) + ")")
        index = "+".join(["(" + i + ")" for i in additions])
        return var.name.value + "->raw[" + index + "]"
    if isinstance(var,Reference):
        print("FIX GET VARC")
        exit()

def combineNonArrayTypes(ltype,rtype):
    if ltype == rtype:
        return ltype
    else:
        combined = [ltype,rtype]
        if "int" in combined and "flint" in combined:
            return "int"
        if "float" in combined and "flint" in combined:
            return "float"
        throwError("Invalid Types")

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

def evaluateArrayExpression(var,expression,parent):
    out = ""
    checks = ""
    if isinstance(expression,AllocArray):
        varName = getVarC(var).split(" ")[-1].split("*")[-1]
        if isinstance(var,Token):
            arrayT = parent.variables[var.value].name.name.value
            tName = parent.variables[var.value]
        else:
            arrayT = var.type_name.name.name.value
            tName = var.type_name
        allocDims = len(expression.items)
        cArrayT = "struct " + arrayT + "Array"
        print(cArrayT)
        tmpVar = varName + "Tmp"
        checks += """if (""" + varName + """->initialized != 0){ printf("ARRAY ALLOC ERROR: """ + varName + " already initialized" + """); exit(1);}\n"""
        if tName.dimensions != allocDims:
            throwError("ArrayDims mismatch")
        #checks += """if (""" + varName + """->ndims != """ + str(allocDims) + """){ printf("arrayErr");exit(1);}\n"""
        raw_size = "*".join(["("+i.value+")" for i in expression.items])
        out += varName + "->raw = (" + arrayT + "*)malloc(" + raw_size + "*sizeof("+arrayT+"));\n"
        out += varName + "->ndims = " + str(allocDims) + ";\n"
        out += varName + "->dims = (int*)malloc(" + str(allocDims) + "*sizeof(int));\n"
        out += ";".join([varName + "->dims["+str(idx)+"] = " + i.value for idx,i in enumerate(expression.items)]) + ";"
        return checks + out

def evaluateExpression(expression,parent):
    if isinstance(expression,Token):
        outType = ""
        if expression.value in parent.variables.keys():
            outType = parent.variables[expression.value].name.value
        else:
            try:
                a = int(expression.value)
                outType = "flint"
            except:
                try:
                    a = float(expression.value)
                    outType = "float"
                except:
                    outType = ""
        if outType == "":
            print("Yo wtf going on in evaluate expression (the token bit innit)")
            exit()
        return expression.value,outType
    if isinstance(expression,BinOp):
        left,ltype = evaluateExpression(expression.left,parent)
        right,rtype = evaluateExpression(expression.right,parent)
        newType = combineNonArrayTypes(ltype,rtype)
        if expression.op.name in ["AND","OR"] and not newType in ["int","flint"]:
            throwError("BOOL TYPE AADHS")
        if expression.op.value == "**":
            return "pow(" + left + "," + right + ")",newType
        if expression.op.value == "and":
            return "(" + left + " && " + right + ")",newType
        if expression.op.value == "or":
            return "(" + left + " || " + right + ")",newType
        else:
            return "(" + left + " " + expression.op.value + " " + right + ")",newType
    if isinstance(expression,ArrayReference):
        calc_index = ""
        print(expression.index)
        dims = list(range(len(expression.index)))
        dims = [expression.name.value + "->dims[" + str(i) + "]" for i in dims[1:]]
        dims.append("1")
        dims = dims[::-1]
        additions = []
        for idx,i in enumerate(expression.index):
            to_mul = dims[:len(dims) - idx]
            evaluated,t = evaluateExpression(i,parent)
            if not t in ["int","flint"]:
                throwError("array index error")
            additions.append(evaluated + "*(" + "*".join(to_mul) + ")")
        index = "+".join(["(" + i + ")" for i in additions])
        return expression.name.value + "->raw[" + index + "]",parent.variables[expression.name.value].name.name.value
        #print(expression.name.value + "->raw[" + ",".join([i.value + "* expression.name.value->dims" + str(len(expression.index) - idx) for idx,i in enumerate(expression.index)]) + "]")
    if isinstance(expression,FunctionCall):
        tmp = expression.eval(parent)
        return tmp[:-1],parent.functions[expression.name.value].name.value
    if isinstance(expression,Cptr):
        if isinstance(expression.var,Token):
            return expression.var.value + "->raw","__c_ptr"
    if isinstance(expression,Cval):
        return evaluateExpression(expression.val,parent)
    if isinstance(expression,Ccall):
        return expression.eval(parent)[:-1],"__c_val"
    print("yo wtf going on in evaluate expression (the end)")
    exit()

class AstObj:
    pass

class Container(AstObj):
    def __init__(self,item=None,lineno=None):
        self.lineno = lineno
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

    def find_variables(self):
        self.variables = {}
        for scope in self.items:
            scope.find_variables()

    def eval(self):
        global HEADERS,DEFINES
        self.verify()
        self.find_classes()
        self.find_functions()
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
            return

    def find_variables(self):
        self.variables = {}
        if isinstance(self.header,FunctionHeader):
            for i in self.header.inputs.items:
                if i[1].value in self.variables.keys():
                    throwError("Redefined variable " + i[1].value,self.lineno)
                self.variables[i[1].value] = i[0]
        if isinstance(self.header,ForHeader):
            if type(self.header.var_t) != None:
                if self.header.var.value in self.variables.keys():
                    throwError("Redefined variable " + self.var.value,self.lineno)
                self.variables[self.header.var.value] = self.header.var_t
        for line in self.body.lines.items:
            if isinstance(line,Scope):
                line.find_variables()
            else:
                if isinstance(line,Assign):
                    if isinstance(line.var,Declaration):
                        if line.var.name.value in self.variables.keys():
                            throwError("Redefined variable " + line.var.name.value,self.lineno)
                        self.variables[line.var.name.value] = line.var.type_name
                elif isinstance(line,Declaration):
                    if line.name.value in self.variables.keys():
                        throwError("Redefined variable " + line.name.value,self.lineno)
                    self.variables[line.name.value] = line.type_name

    def eval(self,parent):
        self.functions.update(parent.functions)
        self.variables.update(parent.variables)
        self.classes = parent.classes
        out = ""
        c_header = self.header.eval(self)
        c_body = ""
        for line in self.body.lines.items:
            c_body += line.eval(self) + "\n"
        out = c_header + "{\n" + c_body + "}\n"
        return out

class ScopeHeader(AstObj):
    pass

class ClassHeader(ScopeHeader):
    def __init__(self,name,inherits=None,lineno = None):
        self.lineno = lineno
        self.name = name
        self.inherits = inherits
        self.type = "class"

class FunctionHeader(ScopeHeader):
    def __init__(self,return_type,name,inputs,lineno = None):
        self.lineno = lineno
        self.return_type = return_type
        self.name = Token("IDENTIFIER","Moth" + name.value)
        self.inputs = inputs
    
    def eval(self,parent):
        c_header = self.return_type.get_c() + " " + self.name.value
        c_header += "(" + ",".join([i[0].get_c() + " " + i[1].value for i in self.inputs.items]) + ")"
        return c_header

class FunctionDefInputs(Container):
    pass

class IfHeader(ScopeHeader):
    def __init__(self,expression,lineno=None):
        self.lineno = lineno
        self.expression = expression
        self.type = "if"

class ElifHeader(ScopeHeader):
    def __init__(self,expression,lineno = None):
        self.lineno = lineno
        self.expression = expression
        self.type = "elif"

class ElseHeader(ScopeHeader):
    def __init__(self,lineno = None):
        self.lineno = lineno
        self.type = "else"

class ForHeader(ScopeHeader):
    def __init__(self,var,range_obj,var_t = None,lineno = None):
        self.lineno = lineno
        self.var = var
        self.range_obj = range_obj
        self.var_t = var_t
    
    def eval(self,parent):
        start,start_t = evaluateExpression(self.range_obj.start,parent)
        end,end_t = evaluateExpression(self.range_obj.end,parent)
        step,step_t = evaluateExpression(self.range_obj.step,parent)
        var_name = self.var.value
        if type(self.var_t) == type(None):
            c_var_t = ""
            var_t = parent.variables[var_name].name.value
        else:
            c_var_t = self.var_t.name.value
            var_t = self.var_t.name.value
        if not (doRawTypesAgree(var_t,start_t) and doRawTypesAgree(var_t,end_t) and doRawTypesAgree(var_t,step_t)):
            print(doRawTypesAgree(var_t,start_t),var_t,start_t,end_t,step_t)
            throwError("Invalid types in for loop",self.lineno)
        c_header = "for (" + c_var_t + " " + var_name + " = " + start + "; " + var_name + " < " + end + "; " + var_name + " = " + var_name + " + " + step + ")"
        return c_header

class RangeObj(AstObj):
    def __init__(self,start,end,step,lineno = None):
        self.lineno = lineno
        self.start,self.end,self.step = start,end,step
        if type(self.start) == type(None):
            self.start = Token("NUMBER","0")
        if type(self.step) == type(None):
            self.step = Token("NUMBER","1")
        self.type = "range"

class WhileHeader(ScopeHeader):
    def __init__(self,condition,lineno = None):
        self.lineno = lineno
        self.condition = condition
        self.type = "while"
    
    def eval(self,parent):
        cond,cond_t = evaluateExpression(self.condition,parent)
        c_header = "while (" + cond + ")"
        return c_header

class FunctionCall(AstObj):
    def __init__(self,name,inp=None,lineno=None):
        self.lineno = lineno
        self.name = Token("IDENTIFIER","Moth" + name.value)
        if type(inp) != type(None):
            self.inputs = [inp]
        else:
            self.inputs = []
        self.type = "function_call"

    def add(self,inp):
        self.inputs.append(inp)
        return self
    
    def eval(self,parent):
        inps = []
        for inp in self.inputs:
            if isinstance(inp,Token):
                if inp.value in parent.variables.keys():
                    if isinstance(parent.variables[inp.value],ArrayType):
                        inps.append(inp.value)
                    else:
                        inps.append(evaluateExpression(inp,parent)[0])
                else:
                    inps.append(evaluateExpression(inp,parent)[0])
            else:
                inps.append(evaluateExpression(inp,parent)[0])
        return self.name.value + "(" + ",".join(inps) + ")" + ";"

class ScopeBody(AstObj):
    def __init__(self,lines,lineno=None):
        self.lineno = lineno
        self.lines = lines
        self.type = "scope_body"

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
    pass

class ArrayType(BaseType):
    def add_dim(self):
        self.dimensions += 1
        return self

    def get_c(self):
        return "struct " + self.name.name.value + "Array" + "*"
    
class AllocArray(Container):
    pass
    
class ArrayReference(AstObj):
    def __init__(self,name,index,lineno=None):
        self.lineno = lineno
        self.name = name
        self.index = [index]
    
    def add(self,index):
        self.index.append(index)
        return self

class Declaration(AstObj):
    def __init__(self,type_name,name,lineno=None):
        self.lineno = lineno
        self.type_name = type_name
        self.name = name

    def eval(self,parent):
        return self.get_c() + ";"
    
    def get_c(self):
        return self.type_name.get_c() + " " + self.name.value

class Assign(AstObj):
    def __init__(self,var,expression,lineno=None):
        self.var = var
        self.expression = expression

    def isArrayAssign(self,parent):
        if isinstance(self.var,Declaration):
            if isinstance(self.var.type_name,ArrayType):
                return True
            return False
        if isinstance(self.var,Token):
            if isinstance(parent.variables[self.var.value],ArrayType):
                return True
            return False
        if isinstance(self.var,Reference):
            print("FIX ARRAY ASSIGN")
            exit()
        if isinstance(self.var,ArrayReference):
            return False
        return False
    
    def getDestinationType(self,parent):
        if isinstance(self.var,Declaration):
            if isinstance(self.var.type_name,ArrayType):
                return self.var.type_name.name.name.value
            else:
                return self.var.type_name.name.value
        if isinstance(self.var,Token):
            if isinstance(parent.variables[self.var.value],ArrayType):
                return parent.variables[self.var.value].name.name.value
            else:
                return parent.variables[self.var.value].name.value
        if isinstance(self.var,Reference):
            print("FIX DESTINATION TYPE")
            exit()
        if isinstance(self.var,ArrayReference):
            refType = parent.variables[self.var.name.value]
            if isinstance(refType,ArrayType):
                return refType.name.name.value
            else:
                return refType.name.value
        print(self.var)
        print("Yo wtf going on at Destination Type")
        exit()
    
    def eval(self,parent):
        global ARRAY_TYPES,DEFINES
        destType = self.getDestinationType(parent)
        if self.isArrayAssign(parent):
            preamble = ""
            if isinstance(self.var,Declaration):
                arrayT = self.var.type_name.name.name.value
                if not arrayT in ARRAY_TYPES:
                    ARRAY_TYPES.append(arrayT)
                    newType = generateArrayType(arrayT)
                    DEFINES += newType + "\n"
                structArrayT = "struct " + arrayT + "Array"
                preamble = getVarC(self.var) + " = " + "(" +structArrayT + "*)malloc(sizeof(" + structArrayT + "));\n"
                preamble += self.var.name.value + "->initialized = 0;\n"
                expr = evaluateArrayExpression(self.var,self.expression,parent)
                return preamble + expr
            else:
                arrayT = parent.variables[self.var.value].name.name.value
                if not arrayT in ARRAY_TYPES:
                    ARRAY_TYPES.append(arrayT)
                    newType = generateArrayType(arrayT)
                    DEFINES += newType + "\n"
                structArrayT = "struct " + arrayT + "Array"
                preamble = self.var.value + " = " + "(" +structArrayT + "*)malloc(sizeof(" + structArrayT + "));\n"
                preamble += self.var.value + "->initialized = 0;\n"
                expr = evaluateArrayExpression(self.var,self.expression,parent)
                return preamble + expr
            return ""
        else:
            print("Normal Assign")
            expr,exprType = evaluateExpression(self.expression,parent)
            if not doRawTypesAgree(destType,exprType):
                throwError("types dont agree")
            return getVarC(self.var,parent) + " = " + expr + ";"
    
class Free(AstObj):
    def __init__(self,var,lineno=None):
        self.lineno = lineno
        self.var = var
    
    def eval(self,parent):
        out = ""
        if isinstance(self.var,Token):
            out += "free(" + self.var.value + "->raw" + ");"
            out += "free(" + self.var.value + "->dims" + ");"
            out += "free(" + self.var.value + ");"
            return out
 
class AssignInc(AstObj):
    def __init__(self,var,expression,op,lineno=None):
        self.lineno = lineno
        self.var = var
        self.expression = expression
        self.op = op
    
    def eval(self,parent):
        newExpr = BinOp(self.var,Token("",self.op.value[:-1]),self.expression)
        return Assign(self.var,newExpr).eval(parent)

class Inc(AstObj):
    def __init__(self,var,op,lineno=None):
        self.lineno = lineno
        self.var = var
        self.op = op
    
    def eval(self,parent):
        newExpr = BinOp(self.var,Token("",self.op.value[0]),Token("Number","1"))
        return Assign(self.var,newExpr).eval(parent)

class BinOp(AstObj):
    def __init__(self,left,op,right,lineno=None):
        self.lineno = lineno
        self.left = left
        self.op = op
        self.right = right

class Not(AstObj):
    def __init__(self,val,lineno=None):
        self.lineno = lineno
        self.val = val

class Return(AstObj):
    def __init__(self,val=None,lineno=None):
        self.lineno = lineno
        self.val = val
    
    def eval(self,parent):
        return "return " + evaluateExpression(self.val,parent)[0] + ";"

class Print(Container):
    def eval(self,parent):
        out = ""
        statements = []
        formatter = {"int" : r"%d","float" : r"%f"}
        for i in self.items:
            if isinstance(i,Token):
                if i.name == "STRING":
                    statements.append("printf(" + i.value + ")")
                if i.name == "IDENTIFIER":
                    print("FF")
                    var_t = parent.variables[i.value].get_c()
                    statements.append('printf("' + formatter[var_t] + '"' + ',' + i.value + ')')
            else:
                statement,var_t = evaluateExpression(i,parent)
                statements.append('printf("' + formatter[var_t] + '",' + statement + ')')
        return ";".join(statements) + ";"

class Pass(AstObj):
    def eval(self,parent):
        return ""

class Break(AstObj):
    def eval(self,parent):
        return "break;"

class Ctypes(AstObj):
    pass

class Cval(Ctypes):
    def __init__(self,val,lineno=None):
        self.lineno = lineno
        self.val = val

class Cptr(Ctypes):
    def __init__(self,var,lineno=None):
        self.lineno = lineno
        self.var = var

class Ccall(Ctypes):
    def __init__(self,func_name,lineno=None):
        self.lineno = lineno
        self.func_name = func_name
        self.inputs = []
    
    def add(self,inp):
        self.inputs.append(inp)
        return self

    def eval(self,parent):
        evals = [evaluateExpression(i,parent)[0] for i in self.inputs]
        return self.func_name.value + "(" + ",".join(evals) + ");"
    
class Reference(AstObj):
    def __init__(self,parent,child,lineno=None):
        self.lineno = lineno
        self.parent = parent
        self.child = child

class Cast(AstObj):
    def __init__(self,new_type,expression,lineno=None):
        self.lineno = lineno
        self.new_type = new_type
        self.expression = expression