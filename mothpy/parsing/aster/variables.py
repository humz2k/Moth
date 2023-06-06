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
        if common.type_is_struct(typ):
            element_names = typ.element_names
            if not self.name.value in element_names:
                raise Exception("Attr " + self.name.value + " doesn't exist")
            idx = element_names.index(self.name.value)
            ptr = parent.raw
            this_ptr = builder.gep(ptr,[ir.Constant(ir.IntType(32),0),ir.Constant(ir.IntType(32),idx)])
            this_type = typ.elements[idx]
            var = common.variable(this_type)
            var.init(common,builder)
            var.raw = this_ptr
            return var
        if common.type_is_object(typ):
            element_names = typ.pointee.element_names
            if not self.name.value in element_names:
                raise Exception("Attr " + self.name.value + " doesn't exist")
            idx = element_names.index(self.name.value)
            ptr = parent.get(common,builder)
            this_ptr = builder.gep(ptr,[ir.Constant(ir.IntType(32),0),ir.Constant(ir.IntType(32),idx)])
            this_type = typ.pointee.elements[idx]
            var = common.variable(this_type)
            var.init(common,builder)
            var.raw = this_ptr
            return var
        if common.type_is_array(typ):
            if self.name.value == "dims":
                arr = parent.get(common,builder)
                out = builder.extract_value(arr,0)
                out.type.dims = [out.type.count]
                return common.constant(out)
            else:
                common.throw_error("Attr " + self.name.vale + " doesn't exist for type " + str(typ))
        common.throw_error("VAR REFERENCE NOT IMPLEMENTED")

class VarDeref:
    def __init__(self,var):
        self.var = var
    
    def eval(self,common,builder : ir.IRBuilder, local_vars, *args):
        var = self.var.eval(common,builder,local_vars)
        val = var.get(common,builder)
        if not common.is_ptr(val):
            common.throw_error("Trying to deref non pointer")
        typ = val.type.pointee
        new_var = common.variable(typ)
        new_var.init(common,builder)
        new_var.raw = val
        return new_var

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
    
class Global:
    def __init__(self,typ,name):
        self.type = typ
        self.name = name
        self.extern = False
    
    def eval(self,common,module_prefix="",*args):
        name = module_prefix + self.name.value
        typ = self.type.eval(common)
        out = ir.GlobalVariable(common.module,typ,name)
        if not self.extern:
            out.initializer = ir.Constant(typ,None)

class Var:
    def __init__(self,name):
        self.name = name
    
    def eval(self,common,builder,local_vars,*args):
        if self.name.value in local_vars:
            return local_vars[self.name.value]
        
        try:
            out = common.module.get_global(common.current_module + self.name.value)
            typ = out.type.pointee
            var = common.variable(typ)
            var.init(common,builder)
            var.raw = out
            return var
        except:
            pass
        try:
            out = common.module.get_global(self.name.value)
            typ = out.type.pointee
            var = common.variable(typ)
            var.init(common,builder)
            var.raw = out
            return var
        except:
            pass
        error_t = "Variable " + self.name.value + " does not exist in this scope"
        common.throw_error(error_t = error_t,fileoforigin = self.fileoforigin, lineno = self.lineno)