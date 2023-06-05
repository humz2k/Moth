from llvmlite import ir
import re
from rply import Token

class WhileLoop:
    def __init__(self,val,lines):
        self.val = val
        self.lines = lines
    
    def eval(self,common,builder : ir.IRBuilder, local_vars, *args):
        new_locals = local_vars.copy()
        start = builder.append_basic_block()
        loop = builder.append_basic_block()
        end = builder.append_basic_block()
        builder.branch(start)
        with builder.goto_block(start):
            val = self.val.eval(common,builder,local_vars).get(common,builder)
            if val.type != ir.IntType(1):
                common.throw_error("While loop condition is not bool")
            builder.cbranch(val,loop,end)
            with builder.goto_block(loop):
                common.eval_lines(builder,new_locals,end,self.lines)
                if not builder.block.is_terminated:
                    builder.branch(start)
        builder.position_at_start(end)

class ForLoop:
    def __init__(self,val,iterator,lines):
        self.val = val
        self.iter = iterator
        self.lines = lines

    def eval(self,common,builder : ir.IRBuilder, local_vars, *args):
        new_locals = local_vars.copy()
        var = self.val.eval(common,builder,new_locals)
        if isinstance(self.iter,Range):
            if not var.raw.type.pointee == common.int_type():
                common.throw_error("Invalid type for For Loop and range")
            start_val = self.iter.start.eval(common,builder,local_vars).get(common,builder)
            end_val = self.iter.end.eval(common,builder,local_vars).get(common,builder)
            step_val = self.iter.step.eval(common,builder,local_vars).get(common,builder)
            var.set(common,builder,start_val)
            start = builder.append_basic_block()
            loop = builder.append_basic_block()
            end = builder.append_basic_block()
            builder.branch(start)
            with builder.goto_block(start):
                val = var.get(common,builder)
                builder.cbranch(builder.icmp_signed("<",val,end_val),loop,end)
                with builder.goto_block(loop):
                    common.eval_lines(builder,new_locals,end,self.lines)
                    if not builder.block.is_terminated:
                        var.set(common,builder,builder.add(val,step_val))
                        builder.branch(start)
            builder.position_at_start(end)
        else:
            this_iter = self.iter.eval(common,builder,local_vars).get(common,builder)
            if common.is_array(this_iter):
                dims = builder.extract_value(this_iter,0)
                dims_list = []
                for i in range(dims.type.count):
                    dims_list.append(builder.extract_element(dims,ir.Constant(ir.IntType(32),i)))
                arr_ptr = builder.extract_value(this_iter,1)
                if dims.type.count == 1:
                    out_ty = this_iter.type.elements[1].pointee
                else:
                    out_ty = ir.LiteralStructType([ir.VectorType(ir.IntType(32),dims.type.count-1),this_iter.type.elements[1]])
                    vec_ptr = builder.gep(var.raw,[ir.Constant(ir.IntType(32),0),ir.Constant(ir.IntType(32),0)])
                    new_dims = ir.Constant(ir.VectorType(ir.IntType(32),dims.type.count-1),[0]*(dims.type.count-1))
                    for idx,i in enumerate(dims_list[1:]):
                        new_dims = builder.insert_element(new_dims,i,ir.Constant(ir.IntType(32),idx))
                    builder.store(new_dims,vec_ptr)
                if var.raw.type.pointee != out_ty:
                    common.throw_error("Invalid type in for loop")
                len_loop = builder.extract_element(dims,ir.Constant(ir.IntType(32),0))
                iter_var = common.variable(ir.IntType(32))
                iter_var.init(common,builder)
                iter_var.set(common,builder,ir.Constant(ir.IntType(32),0))
                start = builder.append_basic_block()
                loop = builder.append_basic_block()
                end = builder.append_basic_block()
                builder.branch(start)
                with builder.goto_block(start):
                    val = iter_var.get(common,builder)
                    builder.cbranch(builder.icmp_signed("<",val,len_loop),loop,end)
                    with builder.goto_block(loop):
                        if common.type_is_array(out_ty):
                            idx_1d = common.get_idx_1d(builder,dims_list,[val] + [ir.Constant(ir.IntType(32),0)]*(len(dims_list)-1))
                            out_ptr = builder.gep(arr_ptr,[idx_1d])
                            dest_ptr = builder.gep(var.raw,[ir.Constant(ir.IntType(32),0),ir.Constant(ir.IntType(32),1)])
                            builder.store(out_ptr,dest_ptr)
                        else:
                            var.set(common,builder,builder.load(builder.gep(arr_ptr,[val])))
                        common.eval_lines(builder,new_locals,end,self.lines)
                        if not builder.block.is_terminated:
                            iter_var.set(common,builder,builder.add(val,ir.Constant(ir.IntType(32),1)))
                            builder.branch(start)
                builder.position_at_start(end)

class Range:
    def __init__(self,*args):
        self.args = args
        self.start,self.end,self.step = args