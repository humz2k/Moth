from llvmlite import ir
import re
from rply import Token

class CastVal:
    def __init__(self,typ,val):
        self.type = typ
        self.val = val
    
    def eval(self,common,builder,local_vars,*args):
        val = self.val.eval(common,builder,local_vars).get(common,builder)
        return common.constant(common.cast(builder,val,self.type.eval(common)))