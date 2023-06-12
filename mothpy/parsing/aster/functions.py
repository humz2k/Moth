from llvmlite import ir
import re
from rply import Token

class FunctionHeader:
    def __init__(self,typ,name,inputs=[]):
        self.type = typ
        self.name = name
        self.mangled = None
        self.inputs = inputs
    
    def generate(self,common,modifiers,parent = None,module_prefix = ""):
        ret_type = self.type.eval(common)
        inputs = [i[0].eval(common) for i in self.inputs]
        func_ty = ir.FunctionType(ret_type,inputs)
        name = module_prefix + common.mangle(self.name,inputs,parent)
        self.mangled = name
        if self.mangled in common.functions:
            if common.functions[self.mangled].is_declaration:
                self.func = common.functions[self.mangled]
                return self.func
            common.throw_error("Function " + name + " already exists")
        if modifiers["extern"]:
            name = self.name.value
        self.func = ir.Function(common.module,func_ty,name)
        return self.func
    
    def generate_template(self,common,modifiers,parent = None,module_prefix = ""):
        inputs = [i[0].eval(common) for i in self.inputs]
        name = module_prefix + common.mangle(self.name,inputs,parent)
        self.mangled = name
        raise Exception("templates not implemented")
    
    def get_inputs(self,common,builder):
        out = {}
        for idx,i in enumerate(self.inputs):
            if i[1].value in out:
                raise Exception("Var Declared")
            out[i[1].value] = common.variable(i[0].eval(common))
            out[i[1].value].init(common,builder)
            out[i[1].value].set(common,builder,self.func.args[idx])
        return out

class TemplateType:
    def __init__(self,identifier):
        self.identifier = identifier
    
    def eval(self,common,instantiated=None):
        if type(instantiated) == type(None):
            return ""

class Function:
    def __init__(self,header,lines):
        self.header = header
        self.lines = lines
        self.locals = {}
        self.modifiers = {"inline": False, "extern": False}
        self.is_template = False
        self.template_vars = []
    
    def eval(self,common,parent = None,module_prefix = ""):
        if self.is_template:
            out_name = self.header.generate_template(common,self.modifiers,parent,module_prefix=module_prefix)
            common.templates[out_name] = self
            return
        func = self.header.generate(common,self.modifiers,parent,module_prefix=module_prefix)
        if self.modifiers["inline"]:
            func.attributes.add("alwaysinline")
        common.functions[self.header.mangled] = func
        if len(self.lines) == 0:
            return
        block = func.append_basic_block(name="entry")
        builder = ir.IRBuilder(block)
        if self.header.name.value == "main":
            builder.call(common.alloc_init_func,[])
        self.locals = self.header.get_inputs(common,builder)
        common.eval_lines(builder,self.locals,None,self.lines)
        if not builder.block.is_terminated:
            if func.type.pointee.return_type == ir.VoidType():
                builder.ret_void()
                return
            common.throw_error("Function does not return value")

class CastHeader:
    def __init__(self,typ,inp):
        self.type = typ
        self.input = inp
    
    def generate(self,common,modifiers):
        func_name = Token("FUNCTION_NAME","cast_" + str(self.type.eval(common)) + "->" + str(self.input[0].eval(common)))
        inputs = [self.input]
        func_header = FunctionHeader(self.type,func_name,inputs)
        return func_header

class Cast:
    def __init__(self,header,lines):
        self.header = header
        self.lines = lines
        self.modifiers = {"inline" : False, "extern" : False}
    
    def eval(self,common,module_prefix = "",*args):
        self.modifiers["extern"] = False
        func_header = self.header.generate(common,self.modifiers)
        func_obj = Function(func_header,self.lines)
        func_obj.modifiers = self.modifiers
        func_obj.eval(common)

class FunctionCall:
    def __init__(self,name,inputs = []):
        self.name = name
        self.inputs = inputs
    
    def eval(self,common,builder : ir.IRBuilder,local_vars,*args):
        func = None
        inputs = [i.eval(common,builder,local_vars).get(common,builder) for i in self.inputs]
        if isinstance(self.name,FuncReference):
            name,inputs = self.name.get(common,builder,local_vars,inputs)
            if name in common.functions:
                func = common.functions[name]
        if isinstance(self.name,NamsespaceFunc):
            name,inputs = self.name.get(common,builder,local_vars,inputs)
            if name in common.functions:
                func = common.functions[name]
        if isinstance(self.name,Token):
            name = self.name.value
            #if not name in ["alloc","exit"]:
            name = common.mangle(self.name,[i.type for i in inputs])
            if name in common.functions:
                func = common.functions[name]
            name = common.current_module + name
            if name in common.functions:
                func = common.functions[name]
        if type(func) == type(None):
            common.throw_error("Function " + str(self.name) + " not found")
        return common.constant(builder.call(func,inputs))
    
class FuncReference:
    def __init__(self,parent,name):
        self.parent = parent
        self.name = name
    
    def get(self,common,builder : ir.IRBuilder, local_vars, inputs):
        parent = self.parent.eval(common,builder,local_vars)
        if common.type_is_object(parent.raw.type.pointee):
            type_name = parent.raw.type.pointee.pointee.name.split("OBJECT_")[1]
            func_name = type_name + "_" + self.name.value
            inputs = [parent.get(common,builder)] + inputs
            input_types = [i.type for i in inputs]
            mangled = common.mangle(Token("FUNCTION_NAME",func_name),input_types)
            return mangled,inputs
        common.throw_error("FuncRef for Structs not implemented")

class NamsespaceFunc:
    def __init__(self,namespace,name):
        self.namespace = namespace
        self.name = name
    
    def get(self,common,builder : ir.IRBuilder, local_vars, inputs):
        return common.mangle(Token("FUNCTION_NAME",self.collapse()),[i.type for i in inputs]),inputs
    
    def collapse(self):
        if isinstance(self.name,NamsespaceFunc):
            self.name = self.collapse()
        return self.namespace.value + "." + self.name.value