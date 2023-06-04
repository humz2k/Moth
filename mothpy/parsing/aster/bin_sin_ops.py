from llvmlite import ir
import re
from rply import Token

class BinOp:
    def __init__(self,op,left,right):
        self.op = op
        self.left = left
        self.right = right
    
    def eval(self,common,builder,local_vars,*args):
        global base_types
        left = self.left.eval(common,builder,local_vars).get(common,builder)
        right = self.right.eval(common,builder,local_vars).get(common,builder)
        return common.constant(common.do_binop(builder,self.op,left,right))

class UserBinOp:
    def __init__(self,op,left,right):
        self.op = op
        self.left = left
        self.right = right

class SinOp:
    def __init__(self,op,val):
        self.op = op
        self.val = val