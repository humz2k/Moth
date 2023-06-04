from llvmlite import ir
import re
from rply import Token

class Index:
    def __init__(self,val,idx):
        self.val = val
        self.idx = idx
    
    def eval(self,common,builder : ir.IRBuilder,local_vars,*args):
        val_eval = self.val.eval(common,builder,local_vars)
        val = val_eval.get(common,builder)
        idx = self.idx.get_list(common,builder,local_vars)
        if common.is_vector(val):
            idx1d = common.get_idx_1d(builder,val.type.dims,idx)
            return common.vector_index(val_eval,val,idx1d,val.type.element)
        if common.is_ptr(val):
            if common.type_is_base(val.type.pointee) or common.type_is_ptr(val.type.pointee):
                if len(idx) != 1:
                    self.throw_error("Invalid number of indexers to type " + str(val.type))
                var = common.variable(val.type.pointee)
                var.raw = builder.gep(val,[idx[0]])
                return var
        if common.is_array(val):
            raw = common.array_index(builder,val,idx)
            var = common.variable(raw.type.pointee)
            var.raw = raw
            return var
        self.throw_error("Can't index type " + str(val.type))