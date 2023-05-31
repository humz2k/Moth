class Program:
    def __init__(self):
        self.items = []
    
    def add(self, item):
        self.items.append(item)

class Struct:
    def __init__(self,name):
        self.name = name
        self.attributes = []
        self.functions = []
    
    def add_vardec(self,dec):
        self.attributes.append(dec)
    
    def add_function(self,func):
        self.functions.append(func)

class Object:
    def __init__(self,name):
        self.name = name
        self.attributes = []
        self.functions = []
    
    def add_vardec(self,dec):
        self.attributes.append(dec)
    
    def add_function(self,func):
        self.functions.append(func)

class FunctionHeader:
    def __init__(self,typ,name,inputs=[]):
        self.type = typ
        self.name = name
        self.inputs = inputs

class Function:
    def __init__(self,header,lines):
        self.header = header
        self.lines = lines

class CastHeader:
    def __init__(self,typ,inp):
        self.type = typ
        self.input = inp

class Cast:
    def __init__(self,header,lines):
        self.header = header
        self.lines = lines

class Return:
    def __init__(self,val=None):
        self.val = val

class Print:
    def __init__(self):
        self.vals = []
        self.nonewline = False
    
    def add(self,val):
        self.vals.append(val)
    
    def nonewline(self):
        self.nonewline = True
    
class Pass:
    def __init__(self):
        pass

class Break:
    def __init__(self):
        pass

class FunctionCall:
    def __init__(self,name,inputs = []):
        self.name = name
        self.inputs = inputs

class NewStruct:
    def __init__(self,name,inputs = []):
        self.name = name
        self.inputs = inputs

class NewObject:
    def __init__(self,name,inputs = []):
        self.name = name
        self.inputs = inputs

class Assign:
    def __init__(self,dest,val):
        self.dest = dest
        self.val = val

class IncAssign:
    def __init__(self,op,dest,val):
        self.op = op
        self.dest = dest
        self.val = val

class BinOp:
    def __init__(self,op,left,right):
        self.op = op
        self.left = left
        self.right = right

class UserBinOp:
    def __init__(self,op,left,right):
        self.op = op
        self.left = left
        self.right = right

class SinOp:
    def __init__(self,op,val):
        self.op = op
        self.val = val

class Incr:
    def __init__(self,op,val):
        self.op = op
        self.val = val

class Index:
    def __init__(self,val,idx):
        self.val = val
        self.idx = idx

class Constant:
    def __init__(self,val):
        self.val = val

class VectorLiteral:
    def __init__(self,vals):
        self.vals = vals

class VarReference:
    def __init__(self,parent,name):
        self.parent = parent
        self.name = name

class FuncReference:
    def __init__(self,parent,name):
        self.parent = parent
        self.name = name

class NamespaceVar:
    def __init__(self,namespace,name):
        self.namespace = namespace
        self.name = name

class NamsespaceFunc:
    def __init__(self,namespace,name):
        self.namespace = namespace
        self.name = name

class Sizeof:
    def __init__(self,typ):
        self.type = typ

class Typeof:
    def __init__(self,val):
        self.val = val

class VarDec:
    def __init__(self,typ,name):
        self.type = typ
        self.name = name

class Var:
    def __init__(self,name):
        self.name = name

class BaseType:
    def __init__(self,name):
        self.name = name

class StructType:
    def __init__(self,name):
        self.name = name

class ObjectType:
    def __init__(self,name):
        self.name = name

class VectorType:
    def __init__(self,typ):
        self.type = typ

class PointerType:
    def __init__(self,typ):
        self.type = typ

class String:
    def __init__(self,val):
        self.val = val

    