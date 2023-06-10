from llvmlite import ir
import re
from rply import Token

class ArrayInit:
    def __init__(self,typ,dims):
        self.type = typ
        self.dims = dims
    
    def eval(self,common,builder : ir.IRBuilder, local_vars,*args):
        typ = self.type.eval(common)
        dims = self.dims.get_list(common,builder,local_vars)
        dims = common.promote_many(builder,dims)
        if not common.type_is_int(dims[0].type):
            common.throw_error("Array Init not int")
        dims = [common.cast(builder,i,ir.IntType(32)) for i in dims]
        size = dims[0]
        for i in dims[1:]:
            size = builder.mul(size,i)
        size = builder.mul(size,common.sizeof(builder,typ))
        dims_vec = ir.Constant(ir.VectorType(ir.IntType(32),len(dims)),[0]*len(dims))
        for idx,i in enumerate(dims):
            dims_vec = builder.insert_element(dims_vec,i,ir.Constant(ir.IntType(32),idx))
        out_ptr = common.alloc(builder,size,ir.PointerType(typ))
        out = builder.alloca(ir.LiteralStructType([ir.VectorType(ir.IntType(32),len(dims)),ir.PointerType(typ)]))
        vec_part = builder.gep(out,[ir.Constant(ir.IntType(32),0),ir.Constant(ir.IntType(32),0)])
        vec_part = builder.store(dims_vec,vec_part)
        ptr_part = builder.gep(out,[ir.Constant(ir.IntType(32),0),ir.Constant(ir.IntType(32),1)])
        ptr_part = builder.store(out_ptr,ptr_part)
        var = common.variable(ir.LiteralStructType([ir.VectorType(ir.IntType(32),len(dims)),ir.PointerType(typ)]))
        var.raw = out
        return var
    
class ArrayLiteral:
    def __init__(self,vals):
        self.vals = vals
    
    def get_list(self,common,builder,local_vars):
        out = []
        for i in self.vals:
            if isinstance(i,ArrayLiteral):
                out += i.get_list(common,builder,local_vars)
            else:
                out.append(i.eval(common,builder,local_vars).get(common,builder))
        return out
    
    def eval(self,common,builder : ir.IRBuilder,local_vars,*args):
        items = self.get_list(common,builder,local_vars)
        items = common.promote_many(builder,items)
        arr_type = items[0].type
        print(arr_type)
        out_ptr = common.alloc(builder,builder.mul(ir.Constant(ir.IntType(32),len(items)),common.sizeof(builder,arr_type)),ir.PointerType(arr_type))
        for idx,i in enumerate(items):
            builder.store(i,builder.gep(out_ptr,[ir.Constant(ir.IntType(32),idx)]))
        dims_vec = ir.Constant(ir.VectorType(ir.IntType(32),1),[len(items)])
        out = builder.alloca(ir.LiteralStructType([ir.VectorType(ir.IntType(32),1),ir.PointerType(arr_type)]))
        vec_part = builder.gep(out,[ir.Constant(ir.IntType(32),0),ir.Constant(ir.IntType(32),0)])
        vec_part = builder.store(dims_vec,vec_part)
        ptr_part = builder.gep(out,[ir.Constant(ir.IntType(32),0),ir.Constant(ir.IntType(32),1)])
        ptr_part = builder.store(out_ptr,ptr_part)
        var = common.variable(ir.LiteralStructType([ir.VectorType(ir.IntType(32),1),ir.PointerType(arr_type)]))
        var.raw = out
        return var