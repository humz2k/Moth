from llvmlite import ir
import re
from rply import Token

class String:
    def __init__(self,val):
        self.val = val
    
    def eval(self,common,builder,*args):
        out = eval(self.val.value)
        string = common.get_string(builder,out)
        return common.constant(string)