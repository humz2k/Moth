from llvmlite import ir
import re
from rply import Token

class IfStatement:
    def __init__(self,val,lines,else_statement = None):
        self.val = val
        self.lines = lines
        self.else_statement = else_statement
    
    def eval(self,common,builder : ir.IRBuilder, local_vars : dict, break_to = None):
        val = self.val.eval(common,builder,local_vars).get(common,builder)
        if val.type != ir.IntType(1):
            raise Exception("If statement that is not bool")
        if type(self.else_statement) == type(None):
            with builder.if_then(val) as then:
                new_locals = local_vars.copy()
                common.eval_lines(builder,new_locals,break_to,self.lines)
        else:
            with builder.if_else(val) as (then,otherwise):
                with then:
                    new_locals = local_vars.copy()
                    common.eval_lines(builder,new_locals,break_to,self.lines)
                with otherwise:
                    self.else_statement.eval(common,builder,local_vars)

class ElseStatement:
    def __init__(self,lines):
        self.lines = lines
    
    def eval(self,common,builder : ir.IRBuilder, local_vars, break_to = None):
        new_locals = local_vars.copy()
        common.eval_lines(builder,new_locals,break_to,self.lines)