from llvmlite import ir

def mangle(name,inputs):
    if name.value == "main":
        return name.value
    return name.value + "_" + "_".join([str(i) for i in inputs])

class Variable:
    def __init__(self,typ):
        self.type = typ
        self.raw = None
    
    def init(self,module,builder : ir.IRBuilder):
        if type(self.raw) != type(None):
            raise Exception("Var Already Init")
        self.raw = builder.alloca(self.type)
    
    def set(self,module,builder : ir.IRBuilder, val):
        builder.store(val,self.raw)
    
    def get(self,module, builder : ir.IRBuilder):
        return builder.load(self.raw)
    
class Constant:
    def __init__(self,val):
        self.val = val
    
    def get(self,module,builder):
        return self.val