from llvmlite import ir
import re
from rply import Token

class Struct:
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
        typ = common.make_struct_type(type_name,self.attributes)
        for i in self.functions:
            i.eval(common,type_name)

class NewStruct:
    def __init__(self,name,inputs = []):
        self.name = name
        self.inputs = inputs

    def eval(self,common,builder : ir.IRBuilder,local_vars,*args):
        inputs = [i.eval(common,builder,local_vars).get(common,builder) for i in self.inputs]
        if not self.name.value in common.structs:
            common.throw_error("Struct doesn't exist (this should not happen lol)")
        func_name = self.name.value + "_" + "__init__"
        mangled = common.mangle(Token("FUNCTION_NAME",func_name),[i.type for i in inputs])
        if not mangled in common.functions:
            types = tuple([i.type for i in inputs])
            struct_ty = common.structs[self.name.value]
            if types == struct_ty.elements:
                var = common.variable(struct_ty)
                var.init(common,builder)
                ptr = var.raw
                for idx,i in enumerate(inputs):
                    this_ptr = builder.gep(ptr,[ir.Constant(ir.IntType(32),0),ir.Constant(ir.IntType(32),idx)])
                    builder.store(i,this_ptr)
                return var
            common.throw_error("No matching struct constructor found (" + mangled + ")")
        else:
            func = common.functions[mangled]
            out = builder.call(func,inputs)
            return common.constant(out)
        #print(func)
        #struct_ty = common.structs[self.name.value]
        #var = common.variable(struct_ty)
        #var.init(common,builder)
        #print(var.raw.type)
        #print(struct_ty)
        #print(self.name.value)
        #print(inputs)
        exit()