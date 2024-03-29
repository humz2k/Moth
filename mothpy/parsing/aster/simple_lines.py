from llvmlite import ir
import re
from rply import Token

class Return:
    def __init__(self,val=None):
        self.val = val
    
    def eval(self,common,builder : ir.IRBuilder,local_vars,*args):
        if type(self.val) == type(None):
            if builder.function.type.pointee.return_type != ir.VoidType():
                error_t = common.format_error_var(common.type_to_str(builder.function.type.pointee.return_type)) + " function does not return a value"
                common.throw_error(error_t = error_t, lineno = self.lineno, fileoforigin = self.fileoforigin)
            return builder.ret_void()
        val = self.val.eval(common,builder,local_vars).get(common,builder)
        if builder.function.type.pointee.return_type != val.type:
            error_t = common.format_error_var(common.type_to_str(builder.function.type.pointee.return_type)) + " function returns " + common.format_error_var(common.type_to_str(val.type))
            common.throw_error(error_t = error_t, lineno = self.lineno, fileoforigin = self.fileoforigin)
            #raise common.throw_error("Function returns wrong type")
        return builder.ret(val)
    
class Pass:
    def __init__(self):
        pass
    
    def eval(self,common,builder,*args):
        return common.constant(builder.add(ir.Constant(ir.IntType(32),0),ir.Constant(ir.IntType(32),0)))

class Break:
    def __init__(self):
        pass

    def eval(self,common,builder : ir.IRBuilder, local_vars, break_to, *args):
        if type(break_to) == type(None):
            raise Exception("Break not in loop")
        return common.constant(builder.branch(break_to))
    
class Sizeof:
    def __init__(self,typ):
        self.type = typ
    
    def eval(self,common,builder : ir.IRBuilder, local_vars,*args):
        typ = self.type.eval(common)
        return common.constant(common.sizeof(builder,typ))

class Typeof:
    def __init__(self,val):
        self.val = val
    
    def eval(self,common,builder : ir.IRBuilder, local_vars, *args):
        var = self.val.eval(common,builder,local_vars).get(common,builder)
        out = common.get_string(builder,common.type_to_str(var.type))
        return common.constant(out)
    
class TypeStr:
    def __init__(self,typ):
        self.type = typ
    
    def eval(self,common,builder : ir.IRBuilder, local_vars, *args):
        var = self.type.eval(common)
        out = common.get_string(builder,common.type_to_str(var))
        return common.constant(out)