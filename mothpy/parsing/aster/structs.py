from llvmlite import ir
import re
from rply import Token

class OpaqueStruct:
    def __init__(self,name):
        self.name = name

    def eval(self,common,module_prefix="",*args):
        out = common.module.context.get_identified_type(self.name.value)
        common.structs[self.name.value] = out
        return out

class Struct:
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
        if module_prefix + type_name in common.structs:
            existing_type = common.structs[module_prefix + type_name]
            my_attrs = tuple([i.type.eval(common) for i in self.attributes])
            if not my_attrs == existing_type.elements:
                error_t = "Redefinition of " + common.format_error_var(common.type_to_str(existing_type))
                common.throw_error(error_t = error_t, lineno = self.lineno, fileoforigin = self.fileoforigin)
            typ = existing_type
        else:
            typ = common.make_struct_type(type_name,self.attributes,module_prefix = module_prefix)
        for i in self.functions:
            i.eval(common,type_name,module_prefix = module_prefix)

class NewStruct:
    def __init__(self,name,inputs = []):
        self.name = name
        self.inputs = inputs

    def eval(self,common,builder : ir.IRBuilder,local_vars,*args):
        inputs = [i.eval(common,builder,local_vars).get(common,builder) for i in self.inputs]
        if not self.name.value in common.structs:
            raise Exception("Struct doesn't exist??? This should not happen???")
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
            error_t = "No matching constructor found for " + common.format_error_var(common.type_to_str(struct_ty)) + " with inputs " + "(" + ",".join([common.format_error_var(common.type_to_str(i)) for i in types]) + ")"
            common.throw_error(error_t = error_t, lineno = self.lineno, fileoforigin = self.fileoforigin)
        else:
            func = common.functions[mangled]
            out = builder.call(func,inputs)
            return common.constant(out)