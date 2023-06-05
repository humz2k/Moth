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
    
    def eval(self,common,module_prefix = "",*args):
        type_name = self.name.value
        if module_prefix + type_name in common.objects:
            existing_type = common.objects[module_prefix + type_name]
            my_attrs = tuple([i.type.eval(common) for i in self.attributes])
            if not my_attrs == existing_type.pointee.elements:
                common.throw_error("Redef of object " + module_prefix + type_name)
            typ = existing_type
        else:
            typ = common.make_object_type(type_name,self.attributes,module_prefix = module_prefix)
        for i in self.functions:
            i.eval(common,type_name,module_prefix = module_prefix)

class NewObject:
    def __init__(self,name,inputs = []):
        self.name = name
        self.inputs = inputs

    def eval(self,common,builder : ir.IRBuilder,local_vars,*args):
        inputs = [i.eval(common,builder,local_vars).get(common,builder) for i in self.inputs]
        if (common.current_module + self.name.value in common.objects):
            object_ty = common.objects[common.current_module + self.name.value]
            func_name = common.current_module + self.name.value + "_" + "__init__"
        else:
            if self.name.value in common.objects:
                object_ty = common.objects[self.name.value]
                func_name = self.name.value + "_" + "__init__"
            else:
                common.throw_error("Object doesn't exist (this should not happen)")
        
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
        
