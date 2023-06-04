from llvmlite import ir
import re
from rply import Token

class Object:
    def __init__(self,name):
        self.name = name
        self.attributes = []
        self.functions = []
    
    def add_vardec(self,dec):
        self.attributes.append(dec)
    
    def add_function(self,func):
        self.functions.append(func)
    
    def eval(self,common,*args):
        type_name = self.name.value
        typ = common.make_object_type(type_name,self.attributes)
        for i in self.functions:
            i.eval(common,type_name)

class NewObject:
    def __init__(self,name,inputs = []):
        self.name = name
        self.inputs = inputs

    def eval(self,common,builder : ir.IRBuilder)