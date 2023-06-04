from llvmlite import ir
import re
from rply import Token

class VectorLiteral:
    def __init__(self,vals):
        self.vals = vals
    
    def get_list(self,common,builder,local_vars):
        out = []
        for i in self.vals:
            if isinstance(i,VectorLiteral):
                out += i.get_list(common,builder,local_vars)
            else:
                out.append(i.eval(common,builder,local_vars).get(common,builder))
        return out
    
    def eval(self,common,builder : ir.IRBuilder,local_vars,*args):
        items = self.get_list(common,builder,local_vars)
        items = common.promote_many(builder,items)
        v_len = len(items)
        v_type = ir.VectorType(items[0].type,v_len)
        out = ir.Constant(v_type,items)
        out.type.dims = [len(items)]
        return common.constant(out)
    
class VecLen:
    def __init__(self,expr):
        self.expr = expr
    
    def eval(self,common,builder,local_vars,*args):
        expr = self.expr.eval(common,builder,local_vars).get(common,builder)
        dims = expr.type.dims
        size = 1
        for i in dims:
            size *= i
        out = ir.Constant(ir.IntType(32),size)
        return common.constant(out)