from llvmlite import ir
import re
from rply import Token

class CastHeader:
    def __init__(self,typ,inp):
        self.type = typ
        self.input = inp

class Cast:
    def __init__(self,header,lines):
        self.header = header
        self.lines = lines

class CastVal:
    def __init__(self,typ,val):
        self.type = typ
        self.val = val
    
    def eval(self,common,builder,local_vars,*args):
        val = self.val.eval(common,builder,local_vars).get(common,builder)
        return common.constant(common.cast(builder,val,self.type.eval(common)))