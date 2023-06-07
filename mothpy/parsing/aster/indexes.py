from llvmlite import ir
import re
from rply import Token

class Index:
    def __init__(self,val,idx):
        self.val = val
        self.idx = idx
    
    def eval(self,common,builder : ir.IRBuilder,local_vars,from_assign = None, assign_type = None,*args):
        val_eval = self.val.eval(common,builder,local_vars)
        val = val_eval.get(common,builder)
        idx = self.idx.get_list(common,builder,local_vars)
        if common.is_vector(val):
            idx1d = common.get_idx_1d(builder,val.type.dims,idx)
            return common.vector_index(val_eval,val,idx1d,val.type.element)
        if common.is_ptr(val):
            if common.type_is_base(val.type.pointee) or common.type_is_ptr(val.type.pointee) or common.type_is_struct(val.type.pointee):
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
        if common.is_object(val):
            parent = val_eval
            type_name = parent.raw.type.pointee.pointee.name.split("OBJECT_")[1]
            func_name = type_name + "_" + "__index__"
            idx_literal = ir.Constant.literal_array(idx)
            idx_var = builder.alloca(idx_literal.type)
            builder.store(idx_literal,idx_var)
            ptr = builder.bitcast(idx_var,ir.PointerType(ir.IntType(32)))
            n = ir.Constant(ir.IntType(32),len(idx))
            input_types = [val.type,ptr.type,n.type]
            mangled = common.mangle(Token("FUNCTION_NAME",func_name),input_types)
            if mangled in common.functions:
                func = common.functions[mangled]
                out = builder.call(func,[val,ptr,n])
                if out.type == ir.PointerType(ir.IntType(8)):
                    raise Exception("Fuck this is bad")
                if isinstance(out.type,ir.PointerType) and out.type != ir.PointerType(ir.IntType(8)):
                    out_t = out.type.pointee
                    var = common.variable(out_t)
                    var.init(common,builder)
                    var.raw = out
                    return var
                else:
                    return common.constant(out)
            else:
                pass
        common.throw_error("Can't index type " + str(val.type))