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

    def eval(self,common,builder : ir.IRBuilder,local_vars,*args):
        inputs = [i.eval(common,builder,local_vars).get(common,builder) for i in self.inputs]
        if not self.name.value in common.objects:
            common.throw_error("Object doesn't exist (this should not happen)")
        object_ty = common.objects[self.name.value]
        func_name = self.name.value + "_" + "__init__"
        size = common.sizeof(builder,object_ty.pointee)
        alloced = common.alloc(builder,size,object_ty)
        alloced.type.pointee.element_names = object_ty.pointee.element_names
        inputs = [alloced] + inputs
        input_types = [i.type for i in inputs]
        mangled = common.mangle(Token("FUNCTION_NAME",func_name),input_types)
        if not mangled in common.functions:
            if len(inputs) == 1:
                return common.constant(alloced)
            common.throw_error("No matching initialized with " + mangled)
        func = common.functions[mangled]
        builder.call(func,inputs)
        return common.constant(alloced)
        
