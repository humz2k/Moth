from llvmlite import ir
import re
from rply import Token

class VarReference:
    def __init__(self,parent,name):
        self.parent = parent
        self.name = name
    
    def eval(self,common,builder : ir.IRBuilder,local_vars,*args):
        parent = self.parent.eval(common,builder,local_vars)
        typ = parent.raw.type.pointee
        element_names = typ.element_names
        if not self.name.value in element_names:
            raise Exception("Attr " + self.name.value + " doesn't exist")
        idx = element_names.index(self.name.value)
        if typ.name.startswith("STRUCT"):
            ptr = parent.raw
            print(builder.gep(ptr,[ir.Constant(ir.IntType(32),idx)]))
            
        self.throw_error("VAR REFERENCE NOT IMPLEMENTED")

class NamespaceVar:
    def __init__(self,namespace,name):
        self.namespace = namespace
        self.name = name

class VarDec:
    def __init__(self,typ,name):
        self.type = typ
        self.name = name
    
    def eval(self,common,builder : ir.IRBuilder,local_vars,*args):
        if self.name.value in local_vars:
            common.throw_error("Var " + self.name.value + " already exists")
        new_var = common.variable(self.type.eval(common))
        new_var.init(common,builder)
        local_vars[self.name.value] = new_var
        return new_var

class Var:
    def __init__(self,name):
        self.name = name
    
    def eval(self,common,builder,local_vars,*args):
        if self.name.value in local_vars:
            return local_vars[self.name.value]
        common.throw_error("Var " + self.name.value + " does not exist")