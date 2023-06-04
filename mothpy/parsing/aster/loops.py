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

class Range:
    def __init__(self,*args):
        self.args = args