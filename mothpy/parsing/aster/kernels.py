from llvmlite import ir
import re
from rply import Token

class KernelHeader:
    def __init__(self,iters,name,inputs=[]):
        self.iters = iters
        self.name = name
        self.inputs = inputs

    def generate(self,common,modifiers,parent = None,module_prefix = ""):
        inputs = [i[0].eval(common) for i in self.inputs]
        func_ty = ir.FunctionType(ir.VoidType(),inputs)
        self.name.value = module_prefix + self.name.value
        name = common.mangle(self.name,inputs,parent)
        self.mangled = name
        if self.mangled in common.functions:
            if common.functions[self.mangled].is_declaration:
                self.func = common.functions[self.mangled]
                return self.func
            common.throw_error("Kernel " + name + " already exists")
        if modifiers["extern"]:
            name = self.name.value
        self.func = ir.Function(common.module,func_ty,name)
        return self.func,self.iters
    
    def get_inputs(self,common,builder):
        out = {}
        for idx,i in enumerate(self.inputs):
            if i[1].value in out:
                raise Exception("Var Declared")
            out[i[1].value] = common.variable(i[0].eval(common))
            out[i[1].value].init(common,builder)
            out[i[1].value].set(common,builder,self.func.args[idx])
        return out

class Kernel:
    def __init__(self,header,lines):
        self.header = header
        self.lines = lines
        self.modifiers = {"extern": False, "inline": True}
    
    def eval(self,common,parent = None,module_prefix = ""):
        func,iters = self.header.generate(common,self.modifiers,parent = parent,module_prefix = module_prefix)
        if self.modifiers["inline"]:
            func.attributes.add("alwaysinline")
        common.functions[self.header.mangled] = func
        if len(self.lines) == 0:
            return
        block = func.append_basic_block(name="entry")
        builder = ir.IRBuilder(block)
        self.locals = self.header.get_inputs(common,builder)
        #print(self.locals)
        iter_vars = []
        for i in iters:
            var = common.variable(ir.IntType(32))
            var.init(common,builder)
            iter_vars.append(var)
            if i[0].value in self.locals:
                common.throw_error("Redefinition of iterator " + i[0].name)
            var.set(common,builder,ir.Constant(ir.IntType(32),0))
            self.locals[i[0].value] = var
        iter_sizes = [common.cast(builder,i[1].eval(common,builder,self.locals).get(common,builder),ir.IntType(32)) for i in iters]
        total_size = iter_sizes[0]
        for i in iter_sizes[1:]:
            total_size = builder.mul(total_size,i)
        index = common.variable(ir.IntType(32))
        index.init(common,builder)
        index.set(common,builder,ir.Constant(ir.IntType(32),0))

        start = builder.append_basic_block()
        loop = builder.append_basic_block()
        end = builder.append_basic_block()
        builder.branch(start)
        #idx = x * 10 * 20 + y * 20 + z
        with builder.goto_block(start):
            this_index = index.get(common,builder)
            val = builder.icmp_signed("<",this_index,total_size)
            #exit()
            builder.cbranch(val,loop,end)
            with builder.goto_block(loop):
                common.eval_lines(builder,self.locals,end,self.lines)
                if not builder.block.is_terminated:
                    this_index = builder.add(this_index,ir.Constant(ir.IntType(32),1))
                    index.set(common,builder,this_index)
                    if len(iter_vars) == 1:
                        iter_vars[0].set(common,builder,this_index)
                    else:
                        iter_vars[-1].set(common,builder,builder.add(iter_vars[-1].get(common,builder),ir.Constant(ir.IntType(32),1)))
                        iter_val = iter_vars[-1].get(common,builder)
                        for i in list(range(len(iter_sizes)))[::-1][:-1]:
                            with builder.if_then(builder.icmp_signed("==",iter_val,iter_sizes[i])):
                                iter_vars[i].set(common,builder,ir.Constant(ir.IntType(32),0))
                                next_iter_val = builder.add(iter_vars[i-1].get(common,builder),ir.Constant(ir.IntType(32),1))
                                iter_vars[i-1].set(common,builder,next_iter_val)
                            iter_val = next_iter_val
                    builder.branch(start)
        builder.position_at_start(end)
        builder.ret_void()

        #print(common.module)
        #exit()
        #common.eval_lines(builder,self.locals,None,self.lines)
        #if not builder.block.is_terminated:
        #    if func.type.pointee.return_type == ir.VoidType():
        #        builder.ret_void()
        #        return
        #    common.throw_error("Function does not return value")