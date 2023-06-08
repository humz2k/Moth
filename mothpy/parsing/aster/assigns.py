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
        if self.val.name == "NULL":
            return None
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
        if self.val.name == "NULL":
            return common.constant(ir.Constant(ir.PointerType(ir.IntType(16)),None))
        common.throw_error("CONSTANT " + self.val.name + " NOT IMPLEMENTED")

class Assign:
    def __init__(self,dest,val):
        self.dest = dest
        self.val = val
    
    def eval(self,common,builder : ir.IRBuilder,local_vars,*args):
        out_t = None
        out = None
        from_assign = False
        out_t = None
        if isinstance(self.val,Constant):
            val = self.val.get_python(common)
            if type(val) == float:
                out_t = ir.FloatType()
                from_assign = True
            if type(val) == int:
                out_t = ir.IntType(32)
                from_assign = True
        else:
            out = self.val.eval(common,builder,local_vars).get(common,builder)
            from_assign = True
            out_t = out.type
        dest = self.dest.eval(common,builder,local_vars,from_assign = from_assign, assign_type = out_t)
        #exit()
        if isinstance(self.val,Constant) and common.type_is_base(dest.type) and not dest.type == common.str_type():
            val = self.val.get_python(common)
            if isinstance(dest.type,ir.IntType):
                val = int(val)
            out = ir.Constant(dest.type,val)
            dest.set(common,builder,common.cast(builder,out,dest.type))
            return dest
        if type(out) == type(None):
            out = self.val.eval(common,builder,local_vars).get(common,builder)
        if dest.type == out.type:
            dest.set(common,builder,out)
            return dest
        if common.is_void_ptr(out):
            if common.is_ptr(dest):
                out = common.cast_ptr(builder,out,dest.type)
                dest.set(common,builder,out)
                return dest
        if (common.is_int(out) and common.type_is_int(dest.type)) or (common.is_float(out) and common.type_is_float(dest.type)):
            dest.set(common,builder,common.cast(builder,out,dest.type))
            return dest
        if (common.is_vector(out) and common.type_is_vector(dest.type)):
            dest.set(common,builder,common.cast(builder,out,dest.type))
            return dest
        print(self.fileoforigin,self.lineno)
        error_t = "Can't assign " + common.type_to_str(out.type) + " to " + common.type_to_str(dest.type)
        common.throw_error(error_t = error_t, fileoforigin = self.fileoforigin, lineno = self.lineno)

class Incr:
    def __init__(self,op,val,post):
        self.op = op
        self.val = val
        self.post = post
    
    def eval(self,common,builder:ir.IRBuilder,local_vars,*args):
        var = self.val.eval(common,builder,local_vars)
        val = var.get(common,builder)
        op = self.op.split("_")[0]
        if common.is_base(val):
            new_val = common.do_binop(builder,op,val,ir.Constant(ir.IntType(8),1))
            var.set(common,builder,new_val)
            if self.post:
                return common.constant(val)
            return common.constant(new_val)
        common.throw_error("Incr not implemented for type " + str(val.type))