from llvmlite import ir
import re
from rply import Token

class BinOp:
    def __init__(self,op,left,right):
        self.op = op
        self.left = left
        self.right = right
    
    def eval(self,common,builder,local_vars,from_assign = None, assign_type = None,*args):
        left = self.left.eval(common,builder,local_vars).get(common,builder)
        right = self.right.eval(common,builder,local_vars).get(common,builder)
        try:
            out = common.do_binop(builder,self.op.name,left,right)
        except:

            error_t = "No operator " + common.format_error_var(self.op.value) + " exists for " + common.format_error_var(common.type_to_str(left.type)) + " and " + common.format_error_var(common.type_to_str(right.type))
            common.throw_error(error_t = error_t, lineno = self.lineno, fileoforigin = self.fileoforigin)
        return common.constant(out)

class UserBinOp:
    def __init__(self,op,left,right):
        self.op = op
        self.left = left
        self.right = right

class SinOp:
    def __init__(self,op,val):
        self.op = op
        self.val = val
    
    def eval(self,common,builder,local_vars,from_assign = None, assign_type = None,*args):
        val = self.val.eval(common,builder,local_vars).get(common,builder)
        out = common.do_sinop(builder,self.op,val)
        if type(out) == type(None):
            error_t = "Operator " + common.format_error_var(self.token) + " not defined for " + common.format_error_var(common.type_to_str(val.type))
            lineno = self.lineno
            fileoforigin = self.fileoforigin
            common.throw_error(error_t = error_t, lineno = lineno, fileoforigin = fileoforigin)
        return common.constant(out)