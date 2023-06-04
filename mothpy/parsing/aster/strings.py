from llvmlite import ir
import re
from rply import Token

class String:
    def __init__(self,val):
        self.val = val
    
    def eval(self,common,builder,*args):
        string = common.make_string(builder,self.val.value[1:-1])
        return common.constant(string)