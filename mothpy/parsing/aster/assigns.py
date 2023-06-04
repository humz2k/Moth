from llvmlite import ir
import re
from rply import Token

class Constant:
    def __init__(self,val):
        self.val = val
    
    def get_python(self,common):
        if self.val.name == "NUMBER":
            try:
                return int(self.val.value)
            except:
                return float(self.val.value)
        if self.val.name == "TRUE":
            return 1
        if self.val.name == "FALSE":
            return 0
        if self.val.name == "CHAR":
            return ord(self.val.value[1:-1])
        if self.val.name == "ENDSTR":
            return ord("\0")
        if self.val.name == "FLOAT_LITERAL":
            return float(self.val.value[:-1])
        if self.val.name == "DOUBLE_LITERAL":
            return float(self.val.value[:-1])
        if self.val.name == "HALF_LITERAL":
            return float(self.val.value[:-1])
        if self.val.name == "LONG_LITERAL":
            return int(self.val.value[:-1])
        common.throw_error("CONSTANT " + self.val.name + " NOT IMPLEMENTED")
    
    def eval(self,common,builder : ir.IRBuilder,local_vars,*args):
        if self.val.name == "NUMBER":
            try:
                return common.constant(ir.Constant(ir.IntType(32),int(self.val.value)))
            except:
                return common.constant(ir.Constant(ir.FloatType(),float(self.val.value)))
        if self.val.name == "TRUE":
            return common.constant(ir.Constant(ir.IntType(1),1))
        if self.val.name == "FALSE":
            return common.constant(ir.Constant(ir.IntType(1),0))
        if self.val.name == "CHAR":
            return common.constant(ir.Constant(ir.IntType(8),ord(self.val.value[1:-1])))
        if self.val.name == "ENDSTR":
            return common.constant(ir.Constant(ir.IntType(8),ord("\0")))
        if self.val.name == "FLOAT_LITERAL":
            return common.constant(ir.Constant(ir.FloatType(),float(self.val.value[:-1])))
        if self.val.name == "DOUBLE_LITERAL":
            return common.constant(ir.Constant(ir.DoubleType(),float(self.val.value[:-1])))
        if self.val.name == "HALF_LITERAL":
            return common.constant(ir.Constant(ir.HalfType(),float(self.val.value[:-1])))
        if self.val.name == "LONG_LITERAL":
            return common.constant(ir.Constant(ir.IntType(64),int(self.val.value[:-1])))
        common.throw_error("CONSTANT " + self.val.name + " NOT IMPLEMENTED")

class Assign:
    def __init__(self,dest,val):
        self.dest = dest
        self.val = val
    
    def eval(self,common,builder : ir.IRBuilder,local_vars,*args):
        if isinstance(self.val,Constant):
            val = self.val.get_python(common)
            dest = self.dest.eval(common,builder,local_vars)
            if isinstance(dest.type,ir.IntType):
                val = int(val)
            out = ir.Constant(dest.type,val)
            dest.set(common,builder,common.cast(builder,out,dest.type))
            return dest
        out = self.val.eval(common,builder,local_vars).get(common,builder)
        dest = self.dest.eval(common,builder,local_vars)
        if dest.type == out.type:
            dest.set(common,builder,out)
            return dest
        if common.is_void_ptr(out):
            if common.is_ptr(dest):
                out = common.cast_ptr(builder,out,dest.type)
                dest.set(common,builder,out)
                return dest
        if (common.is_int(out) and common.is_int(dest)) or (common.is_float(out) and common.is_float(dest)):
            dest.set(common,builder,common.cast(builder,out,dest.type))
            return dest
        if (common.is_vector(out) and common.is_vector(dest)):
            dest.set(common,builder,common.cast(builder,out,dest.type))
            return dest
        common.throw_error("Invalid Assign")

class IncAssign:
    def __init__(self,op,dest,val):
        self.op = op
        self.dest = dest
        self.val = val

class Incr:
    def __init__(self,op,val):
        self.op = op
        self.val = val