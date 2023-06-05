from llvmlite import ir
import re
from rply import Token

class BaseType:
    def __init__(self,name):
        self.name = name
    
    def eval(self,common,*args):
        if self.name.value == "void":
            return ir.VoidType()
        if self.name.value == "bool":
            return ir.IntType(1)
        if self.name.value == "char":
            return ir.IntType(8)
        if self.name.value == "int":
            return ir.IntType(32)
        if self.name.value == "long":
            return ir.IntType(64)
        if self.name.value == "float":
            return ir.FloatType()
        if self.name.value == "double":
            return ir.DoubleType()
        if self.name.value == "half":
            return ir.HalfType()
        if self.name.value == "str":
            return ir.PointerType(ir.IntType(8))

class StructType:
    def __init__(self,name):
        self.name = name
    
    def eval(self,common,module_prefix="",*args):
        if module_prefix != "":
            if module_prefix + self.name.value in common.structs:
                return common.structs[module_prefix + self.name.value]
        if common.current_module + self.name.value in common.structs:
            return common.structs[common.current_module + self.name.value]
        if module_prefix == "":
            if self.name.value in common.structs:
                return common.structs[self.name.value]
        print("AHHH")
        exit()

class ObjectType:
    def __init__(self,name):
        self.name = name

    def eval(self,common,module_prefix = "",*args):
        if module_prefix != "":
            if module_prefix + self.name.value in common.objects:
                return common.objects[module_prefix + self.name.value]
        if common.current_module + self.name.value in common.objects:
            return common.objects[common.current_module + self.name.value]
        if module_prefix == "":
            if module_prefix + self.name.value in common.objects:
                return common.objects[module_prefix + self.name.value]
        print("AHHH")
        exit()

class VectorType:
    def __init__(self,typ):
        self.type = typ
    
    def eval(self,common,*args):
        base_t_str = re.search(r"[a-z]+",self.type.value)[0]
        base_t = BaseType(Token("TYPE_NAME",base_t_str)).eval(common)
        dims = [int(i) for i in self.type.value[len(base_t_str):].split("x")]
        size = 1
        for i in dims:
            size *= i
        typ = ir.VectorType(base_t,size)
        typ.dims = dims
        return typ
    
class ArrayType:
    def __init__(self,typ,ndims):
        self.type = typ
        self.ndims = ndims
    
    def eval(self,common,*args):
        base_type = self.type.eval(common)
        return ir.LiteralStructType([ir.VectorType(ir.IntType(32),self.ndims),ir.PointerType(base_type)])

class PointerType:
    def __init__(self,typ):
        self.type = typ
    
    def eval(self,common,*args):
        return ir.PointerType(self.type.eval(common))
    
class NamespaceType:
    def __init__(self,name,typ):
        self.name = name
        self.type = typ
    
    def eval(self,common,module_prefix = "",*args):
        self.name = module_prefix + self.name + "."
        return self.type.eval(common,self.name)