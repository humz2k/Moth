class Program:
    def __init__(self):
        self.items = []
    
    def add(self, item):
        self.items.append(item)

class FunctionHeader:
    def __init__(self,typ,name,inputs=[]):
        self.type = typ
        self.name = name
        self.inputs = inputs

class Function:
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

class Assign:
    def __init__(self,dest,val):
        self.dest = dest
        self.val = val

class BinOp:
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

class VectorType:
    def __init__(self,typ):
        self.type = typ

class String:
    def __init__(self,val):
        self.val = val

    