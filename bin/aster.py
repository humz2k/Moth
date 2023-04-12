from rply.token import Token

HEADERS = "#include <stdlib.h>\n#include <stdio.h>\n#include <math.h>\n"
DEFINES = ""

ARRAY_TYPES = []
LIST_TYPES = []

INT_TYPES = ["char","short","int","long","bool","flint"]
UINT_TYPES = ["unsigned char","unsigned short","unsigned int","unsigned long","bool","flint"]
FLOAT_TYPES = ["float","double","flint"]

STRUCTS = ""

def throwError(err,lineno):
    print("CODE GEN ERROR @ line " + str(lineno) + ":")
    print("   " + err)
    exit()

def generateArrayType(arrayT):
    global ARRAY_TYPES,DEFINES,STRUCTS
    arrayTptr = arrayT
    arrayT = "".join(arrayT.split())
    if arrayT.endswith("*"):
        arrayT = arrayT[:-1]
    if not arrayT in ARRAY_TYPES:
        out = r"""
struct """ + arrayT + r"""Array {
    int initialized;
    int ndims;
    int* dims;
    """ + arrayTptr + r"""* raw;
}""" + r"""; 
"""
        STRUCTS += "struct " + arrayT + "Array; typedef struct " + arrayT + "Array " + arrayT + "Array;\n"
        DEFINES += out
        ARRAY_TYPES.append(arrayT)
    return arrayT + "Array"

def generateListType(listT):
    if listT != "void":
        global LIST_TYPES,DEFINES,STRUCTS
        listTptr = listT.strip()
        listT = "".join(listT.split())
        if listT.endswith("*"):
            listT = listT[:-1]
        if not listT in LIST_TYPES:
            out = r"""
struct """ + listT + r"""List {

    """ + listTptr + r""" val;
    int terminator;
    int initialized;
    struct """ + listT + r"""List* next;
}""" + r""";
""" + listTptr + r"""* index""" + listT + r"""List(""" + listT + r"""List* input, int index) {

    """ + listT + r"""List* indexer = input;
    if (indexer->initialized == 0){
        printf("LIST INDEX ERROR: index out of range in list type""" + listT + r"""\n");
        exit(1);
    }
    if (index == 0){
        return &indexer->val;
    }
    for (int i = 0; i < index; i++){
        if (indexer->terminator == 1){
            printf("LIST INDEX ERROR: index out of range in list type""" + listT + r"""\n");
            exit(1);
        }
        indexer = indexer->next;
    }
    return &indexer->val;
}
void append""" + listT + r"""List(""" + listT + r"""List* input, """ + listTptr + r""" new_val) {

    """ + listT + r"""List* indexer = input;
    if (indexer->initialized == 0){
        indexer->val = new_val;
        indexer->initialized = 1;
        return;
    }
    while (indexer->terminator == 0){
        indexer = indexer->next;
    }
    indexer->next = (""" + listT + r"""List*)malloc(sizeof(""" + listT + r"""List));
    indexer->terminator = 0;
    indexer = indexer->next;
    indexer->val = new_val;
    indexer->terminator = 1;

}

void insert""" + listT + r"""List(""" + listT + r"""List* input, """ + listTptr + r""" new_val, int index) {

    """ + listT + r"""List* indexer = input;
    if (indexer->initialized == 0){
        if (index != 0){
            printf("LIST INSERT ERROR: index out of range in list type """ + listT + r"""\n");
            exit(1);
        }
        indexer->val = new_val;
        indexer->initialized = 1;
        indexer->terminator = 1;
        return;
    }
    int count = 0;
    while (indexer->terminator == 0){
        if (count == index){
            break;
        }
        indexer = indexer->next;
        count++;
    }
    if (count != index){
        printf("LIST INSERT ERROR: index out of range in list type """ + listT + r"""\n");
        exit(1);
    }
    """ + listT + r"""List* temp = (""" + listT + r"""List*)malloc(sizeof(""" + listT + r"""List));
    temp->next = indexer->next;
    temp->terminator = indexer->terminator;
    temp->val = indexer->val;
    indexer->next = temp;
    indexer->terminator = 0;
    indexer->val = new_val;
    indexer->initialized = 1;

}

void remove""" + listT + r"""List(""" + listT + r"""List* input, int index) {

    """ + listT + r"""List* indexer = input;
    """ + listT + r"""List* temp;
    if (indexer->initialized == 0){
        printf("LIST REMOVE ERROR: index out of range in list type""" + listT + r"""\n");
        exit(1);
    }
    if (index == 0){
        if (indexer->terminator == 1){
            indexer->initialized = 0;
            return;
        }
        temp = indexer->next;
        indexer->next = temp->next;
        indexer->terminator = temp->terminator;
        indexer->val = temp->val;
        free(temp);
        return;
    }
    int count = 1;
    while (indexer->terminator == 0){
        if (count == index){
            break;
        }
        indexer = indexer->next;
        count++;
    }
    if (count != index){
        printf("LIST REMOVE ERROR: index out of range in list type""" + listT + r"""\n");
        exit(1);
    }
    temp = indexer->next->next;
    free(indexer->next);
    indexer->next = temp;

}

int len""" + listT + r"""List(""" + listT + r"""List* input) {

    """ + listT + r"""List* indexer = input;
    if (indexer->initialized == 0){
        return 0;
    }
    int count = 1;
    while (indexer->terminator == 0){
        indexer = indexer->next;
        count++;
    }
    return count;

}
""" + listTptr + r""" pop""" + listT + r"""List(""" + listT + r"""List* input) {

    """ + listT + r"""List* indexer = input;
    if(indexer->terminator == 1){
        return indexer->val;
    }
    while (indexer->next->terminator == 0){
        indexer = indexer->next;
    }
    """ + listTptr + r""" out_val = indexer->next->val;
    free(indexer->next);
    indexer->terminator = 1;
    return out_val;

}
"""
            STRUCTS += "struct " + listT + "List; typedef struct " + listT + "List " + listT + "List;"
            DEFINES += out
            LIST_TYPES.append(listT)
    return listT + "List"

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
    
    def eval(self,parent):
        return self.value

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

    def eval(self):
        global HEADERS,DEFINES,STRUCTS
        generateArrayType("void")
        self.verify()
        self.find_classes()
        self.find_functions()
        self.find_declarations()
        self.find_variables()
        out = ""
        for scope in self.items:
            out += scope.eval(self)
        return HEADERS + STRUCTS + DEFINES + out + "\nint main() { return Mothmain();}\n"

class Scope(AstObj):
    def __init__(self,header,body,lineno=None):
        self.lineno = lineno
        self.header = header
        self.body = body
        self.type = "scope"
        self.functions = {}
        self.variables = {}
        self.declarations = {}
        self.classes = {}

    def find_classes(self,out):
        self.classes = out
        if isinstance(self.header,ClassHeader):
            if self.header.name.value in out:
                throwError("Redefined class " + self.header.name.value,self.lineno)
            out[self.header.name.value] = self
    
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
                    i.classes = self.classes
                    if isinstance(i.header,FunctionHeader):
                        if i.header.name.value in self.functions:
                            throwError("Redefined function " + self.header.name.value + "." + i.header.name.value,self.lineno)
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
        out += self.header.eval(parent) + "{\n"
        out += "".join([self.declarations[i].get_c() + " " + i + ";" for i in self.declarations.keys() if not i in self.dont_declare]) + "\n"
        if isinstance(self.header,ClassHeader):
            out += "\n}" + ";\n"
            out += self.body.eval(self,self.declarations)
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
                        line.header.name.value = "OBJECT_" + parent.header.name.value+"_"+line.header.name.value
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
        self.inherits = inherits
        self.type = "class"
    
    def find_variables(self,parent):
        return self

    def eval(self,parent):
        global STRUCTS
        out = ""
        out += "struct Moth" + self.name.value
        STRUCTS += "struct Moth" + self.name.value + ";typedef struct Moth" + self.name.value + " Moth" + self.name.value + ";\n"
        return out

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
            name = "OBJECT_"+self.name.parent.moth_type.name.value+"_Moth"+self.name.child.value
            self.inputs.insert(0,self.name.parent)
        elif isinstance(self.name,StaticFunction):
            name = "OBJECT_"+self.name.class_name.value+"_Moth"+self.name.function_name.value
        else:
            name = self.name.value
        return name + "(" + ",".join([i.eval(parent) for i in self.inputs]) + ")"

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
            generateArrayType(self.name.value)
            generateListType(self.name.value)
        self.dimensions = 1

class ListType(BaseType):
    def __init__(self,name,lineno=None):
        super().__init__(name,lineno)
        generateListType("".join(self.name.get_c().split()))

    def get_c(self):
        return "".join(self.name.get_raw().split()) + "List*"
    
    def get_raw(self):
        return self.get_c()[:-1]

class ListLiteral(Container):
    pass

class ListAppend(AstObj):
    def __init__(self,list_name,val,lineno = None):
        self.list_name = list_name
        self.val = val
        self.lineno = None
    
    def find_variables(self,parent):
        self.list_name = self.list_name.find_variables(parent)
        self.val = self.val.find_variables(parent)
        return self
    
    def eval(self,parent):
        val = self.val.eval(parent)
        this_list = self.list_name.eval(parent)
        return "append"+self.list_name.moth_type.get_raw() + "(" + this_list + "," + val + ")"
    
class ListPop(AstObj):
    def __init__(self,list_name,lineno = None):
        self.list_name = list_name
        self.lineno = None
    
    def find_variables(self,parent):
        self.list_name = self.list_name.find_variables(parent)
        self.c_type = self.list_name.moth_type.name.get_raw()
        return self
    
    def eval(self,parent):
        this_list = self.list_name.eval(parent)
        return "pop"+self.list_name.moth_type.get_raw() + "(" + this_list + ")"
    
class ListLen(AstObj):
    def __init__(self,list_name,lineno = None):
        self.list_name = list_name
        self.lineno = None
    
    def find_variables(self,parent):
        self.list_name = self.list_name.find_variables(parent)
        self.c_type = self.list_name.moth_type.name.get_raw()
        return self
    
    def eval(self,parent):
        this_list = self.list_name.eval(parent)
        return "len"+self.list_name.moth_type.get_raw() + "(" + this_list + ")"
    
class ListInsert(AstObj):
    def __init__(self,list_name,index,val,lineno = None):
        self.list_name = list_name
        self.index = index
        self.val = val
        self.lineno = None
    
    def find_variables(self,parent):
        self.list_name = self.list_name.find_variables(parent)
        self.index = self.index.find_variables(parent)
        self.val = self.val.find_variables(parent)
        return self
    
    def eval(self,parent):
        this_list = self.list_name.eval(parent)
        return "insert"+self.list_name.moth_type.get_raw() + "(" + this_list + "," + self.val.eval(parent) + "," + self.index.eval(parent) + ")"

class ListRemove(AstObj):
    def __init__(self,list_name,index,lineno = None):
        self.list_name = list_name
        self.index = index
        self.lineno = None
    
    def find_variables(self,parent):
        self.list_name = self.list_name.find_variables(parent)
        self.index = self.index.find_variables(parent)
        return self
    
    def eval(self,parent):
        this_list = self.list_name.eval(parent)
        return "remove"+self.list_name.moth_type.get_raw() + "(" + this_list + "," + self.index.eval(parent) + ")"


class Type(BaseType):
    def get_c(self):
        return self.name.value
    
    def get_raw(self):
        return self.get_c()

class ObjectType(BaseType):
    def get_c(self):
        return "Moth" + self.name.value + "*"
    
    def get_raw(self):
        return "Moth" + self.name.value

class ArrayType(BaseType):
    def __init__(self,name, lineno = None):
        super().__init__(name,lineno)
        generateArrayType("".join(self.name.get_c().split()))

    def add_dim(self):
        self.dimensions += 1
        return self
    
    def get_c(self):
        return "".join(self.name.get_raw().split()) + "Array*"

    def get_raw(self):
        return self.name.get_raw() + "Array"
    
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
        if isinstance(self.name.moth_type,ListType):
            if len(self.index) != 1:
                throwError("LIST IS ONLY 1 DIMENSION",self.lineno)
            return "(*(index" + self.name.moth_type.get_raw() + "(" + self.name.c_str + "," + self.index[0].eval(parent) + ")))"
        else:
            index = [i.eval(parent) for idx,i in enumerate(self.index)]
            reverse = ["(" + self.name.eval(parent) + "->dims[" + str(i) + "])" for i in list(range(len(index)))]
            #if parent.declarations[self.name.c_str].dimensions != len(self.index):
            #    throwError("Array index error",self.lineno)
            reverse.pop(0)
            reverse.append(str(1))
            reverse = reverse[::-1]
            c_index = []
            for i in range(len(index)):
                c_index.append("(" + index[i] + "*" + "*".join(reverse[:len(index)-i]) + ")")
            return self.name.eval(parent) + "->raw[" + "+".join(c_index) + "]"

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
        if isinstance(self.expression,ListLiteral):
            if not isinstance(self.var.moth_type,ListType):
                throwError("List type error",self.lineno)
            nitems = len(self.expression.items)
            out = self.var.c_str + " = ("+self.var.moth_type.get_c()+")malloc(sizeof(" + self.var.moth_type.get_raw() + "));\n"
            out += self.var.c_str + "->terminator = 1;\n"
            out += self.var.c_str + "->initialized = 0"
            if nitems > 0:
                temp_var = "Moth_tmp_" + "_".join(self.var.c_str.split("->"))
                
                out += ";\n" + self.var.moth_type.get_c() + " " + temp_var + " = " + self.var.c_str + ";\n"
                for i in range(nitems-1):
                    out += temp_var + "->initialized = 1;\n"
                    out += temp_var + "->val = " + self.expression.items[i].eval(parent) + ";\n"
                    out += temp_var + "->terminator = 0;\n"
                    out += temp_var + "->next = " + "("+self.var.moth_type.get_c()+")malloc(sizeof(" + self.var.moth_type.get_c()[:-1] + "));\n"
                    out += temp_var + " = " + temp_var + "->next;\n"
                out += temp_var + "->val = " + self.expression.items[-1].eval(parent) + ";\n"
                out += temp_var + "->terminator = 1;\n"
                out += temp_var + "->initialized = 1;\n"
            
            return out

        if isinstance(self.expression,AllocArray):
            return self.expression.get_c(self.var,parent)
        if isinstance(self.expression,AllocObject):
            out = self.var.eval(parent) + " = " + self.expression.eval(parent) + ";"
            self.expression.objname.name = Reference(self.var,Identifier(Token("","__init__")))
            out += self.expression.objname.eval(parent)
            #out += FunctionCall(Reference(self.var,Identifier(Token("","__init__"))),).eval(parent)
            return out
        if isinstance(self.var,ArrayReference):
            return self.var.eval(parent) + " = " + self.expression.eval(parent)
        if isinstance(self.var,Reference):
            return self.var.eval(parent) + " = " + self.expression.eval(parent)
        return self.var.c_str + " = " + self.expression.eval(parent)
    
class AllocObject(AstObj):
    def __init__(self,objname):
        self.objname = objname
    
    def find_variables(self,parent):
        return self
    
    def eval(self,parent):
        out = ""
        c_t = self.objname.name.value
        return "(" + c_t + "*)malloc(sizeof(" + c_t + "))"

class AllocArray(Container):
    def get_c(self,var,parent):
        dims = [i.eval(parent) for i in self.items]
        ndims = len(dims)
        vardims = var.moth_type.dimensions
        if ndims != vardims:
            throwError("Array Dims dont match",self.lineno)
        c_t = var.moth_type.name.get_c()
        array_t = generateArrayType(var.moth_type.name.get_c())
        out = ""
        try:
            c_str = var.c_str
        except:
            c_str = var.eval(parent)
        out += c_str + " = (" + array_t + "*)malloc(" + "sizeof(" + array_t + "));\n"
        out += c_str + "->dims = (int*)malloc(" + str(ndims) + "*sizeof(int));\n"
        out += "".join([c_str + "->dims[" + str(idx) + "] = " + i + ";" for idx,i in enumerate(dims)]) + "\n"
        out += c_str + "->raw = (" + c_t + "*" + ")malloc(" + "*".join(dims) + "*sizeof(" + c_t + "))"
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
        if isinstance(self.var.moth_type,ObjectType):
            return FunctionCall(Reference(self.var,Identifier(Token("","__free__")))).eval(parent) + ";" + "free(" + self.var.c_str + ")"
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
        elif op == "**":
            out += "pow(" + self.left.eval(parent) + "," + self.right.eval(parent) + ")"
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
            elif isinstance(i,FunctionCall):
                c_t = parent.functions[i.name.value].name.value
                out.append(r'printf("' + formatters[c_t] + r'",' + i.eval(parent) + r')')
            elif isinstance(i,BinOp):
                c_t = i.right.c_type
                out.append(r'printf("' + formatters[c_t] + r'",' + i.eval(parent) + r')')
            else:
                if isinstance(i,Variable):
                    if isinstance(i.moth_type,ListType):
                        #print("print" + i.moth_type.get_raw() + "(" + i.c_str + ")")
                        throwError("Can't print LIST",self.lineno)
                    elif isinstance(i.moth_type,ObjectType):
                        out.append("OBJECT_" + i.moth_type.name.value + "_Moth__print__(" + i.c_str + ")")
                    else:
                        out.append(r'printf("' + formatters[i.c_type] + r'",' + i.eval(parent) + r')')
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

class Craw(Ctypes):
    def __init__(self,string,val):
        self.string = string
        self.val = val

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
            return self.var.c_str + "->raw"
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
            self.child = self.child.find_variables(parent.classes[self.parent.moth_type.name.value])
            self.c_type = self.child.c_type
            self.moth_type = self.child.moth_type
            self.c_str = self.parent.eval(parent) + "->" + self.child.eval(parent)
        return self

    def eval(self,parent):
        return self.parent.eval(parent) + "->" + self.child.eval(parent)

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