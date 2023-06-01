from llvmlite import ir
import helpers
import re
from rply import Token

FUNCTIONS = {}

class Program:
    def __init__(self):
        self.items = []
    
    def add(self, item):
        self.items.append(item)

    def eval(self,module_name):
        global FUNCTIONS
        module = ir.Module(name=module_name)
        alloc_ty = ir.FunctionType(ir.PointerType(ir.IntType(8)),[ir.IntType(32)])
        alloc_func = ir.Function(module,alloc_ty,"bohem_malloc")
        alloc_init_ty = ir.FunctionType(ir.VoidType(),[])
        alloc_init = ir.Function(module,alloc_init_ty,"bohem_start")
        FUNCTIONS["bohem_start"] = alloc_init
        FUNCTIONS["alloc"] = alloc_func
        for item in self.items:
            item.eval(module)
        return module

class Struct:
    def __init__(self,name):
        self.name = name
        self.attributes = []
        self.functions = []
    
    def add_vardec(self,dec):
        self.attributes.append(dec)
    
    def add_function(self,func):
        self.functions.append(func)

class Object:
    def __init__(self,name):
        self.name = name
        self.attributes = []
        self.functions = []
    
    def add_vardec(self,dec):
        self.attributes.append(dec)
    
    def add_function(self,func):
        self.functions.append(func)

class IfStatement:
    def __init__(self,val,lines,else_statement = None):
        self.val = val
        self.lines = lines
        self.else_statement = else_statement
    
    def eval(self,module,builder : ir.IRBuilder, local_vars : dict, break_to = None):
        val = self.val.eval(module,builder,local_vars).get(module,builder)
        if type(self.else_statement) == type(None):
            with builder.if_then(val) as then:
                new_locals = local_vars.copy()
                for i in self.lines:
                    i.eval(module,builder,new_locals)
                    if (isinstance(i,Break)):
                        break
        else:
            with builder.if_else(val) as (then,otherwise):
                with then:
                    new_locals = local_vars.copy()
                    for i in self.lines:
                        i.eval(module,builder,new_locals)
                        if (isinstance(i,Break)):
                            break
                with otherwise:
                    self.else_statement.eval(module,builder,local_vars)

class ElseStatement:
    def __init__(self,lines):
        self.lines = lines
    
    def eval(self,module,builder : ir.IRBuilder, local_vars, break_to = None):
        new_locals = local_vars.copy()
        for i in self.lines:
            i.eval(module,builder,new_locals)
            if (isinstance(i,Break)):
                break

class WhileLoop:
    def __init__(self,val,lines):
        self.val = val
        self.lines = lines

class ForLoop:
    def __init__(self,val,iterator,lines):
        self.val = val
        self.iter = iterator
        self.lines = lines

class FunctionHeader:
    def __init__(self,typ,name,inputs=[]):
        self.type = typ
        self.name = name
        self.mangled = None
        self.inputs = inputs
    
    def generate(self,module,parent = None):
        ret_type = self.type.eval(module)
        inputs = [i[0].eval(module) for i in self.inputs]
        func_ty = ir.FunctionType(ret_type,inputs)
        name = helpers.mangle(self.name,inputs)
        if type(parent) != type(None):
            raise Exception("FUNCTION_HEADER_IMPLEMENTATION_ERROR")
        self.mangled = name
        self.func = ir.Function(module,func_ty,name)
        return self.func
    
    def get_inputs(self,module,builder):
        out = {}
        for idx,i in enumerate(self.inputs):
            if i[1].value in out:
                raise Exception("Var Declared")
            out[i[1].value] = helpers.Variable(i[0].eval(module))
            out[i[1].value].init(module,builder)
            out[i[1].value].set(module,builder,self.func.args[idx])
        return out


class Function:
    def __init__(self,header,lines):
        self.header = header
        self.lines = lines
        self.locals = {}
    
    def eval(self,module : ir.Module,parent = None):
        global FUNCTIONS
        func = self.header.generate(module,parent)
        FUNCTIONS[self.header.mangled] = func
        block = func.append_basic_block(name="entry")
        builder = ir.IRBuilder(block)
        if self.header.name.value == "main":
            builder.call(FUNCTIONS["bohem_start"],[])
        self.locals = self.header.get_inputs(module,builder)
        for i in self.lines:
            i.eval(module,builder,self.locals)

class KernelHeader:
    def __init__(self,iters,name,inputs=[]):
        self.iters = iters
        self.name = name
        self.inputs = inputs

class Kernel:
    def __init__(self,header,lines):
        self.header = header
        self.lines = lines

class CastHeader:
    def __init__(self,typ,inp):
        self.type = typ
        self.input = inp

class Cast:
    def __init__(self,header,lines):
        self.header = header
        self.lines = lines

class CastVal:
    def __init__(self,typ,val):
        self.type = typ
        self.val = val
    
    def eval(self,module,builder,local_vars,*args):
        val = self.val.eval(module,builder,local_vars).get(module,builder)
        return helpers.Constant(helpers.cast(module,builder,val,self.type.eval(module)))

class Return:
    def __init__(self,val=None):
        self.val = val
    
    def eval(self,module,builder : ir.IRBuilder,local_vars,*args):
        if type(self.val) == type(None):
            return builder.ret_void()
        return builder.ret(self.val.eval(module,builder,local_vars).get(module,builder))

class Print:
    def __init__(self):
        self.vals = []
        self.nonewline = False
    
    def add(self,val):
        self.vals.append(val)
    
    def nonewline(self):
        self.nonewline = True
    
class Pass:
    def __init__(self):
        pass
    
    def eval(self,module,builder,*args):
        return helpers.Constant(builder.add(ir.Constant(ir.IntType(32),0),ir.Constant(ir.IntType(32),0)))

class Break:
    def __init__(self):
        pass

class FunctionCall:
    def __init__(self,name,inputs = []):
        self.name = name
        self.inputs = inputs
    
    def eval(self,module,builder : ir.IRBuilder,local_vars,*args):
        global FUNCTIONS
        func = None
        inputs = [i.eval(module,builder,local_vars).get(module,builder) for i in self.inputs]
        if isinstance(self.name,Token):
            name = self.name.value
            if not name in ["alloc","exit"]:
                name = helpers.mangle(self.name,[i.type for i in inputs])
            if name in FUNCTIONS:
                func = FUNCTIONS[name]
        if type(func) == type(None):
            raise Exception("Function " + str(self.name) + " not found")
        return helpers.Constant(builder.call(func,inputs))

class NewStruct:
    def __init__(self,name,inputs = []):
        self.name = name
        self.inputs = inputs

class NewObject:
    def __init__(self,name,inputs = []):
        self.name = name
        self.inputs = inputs

class Assign:
    def __init__(self,dest,val):
        self.dest = dest
        self.val = val
    
    def eval(self,module,builder : ir.IRBuilder,local_vars,*args):
        out = self.val.eval(module,builder,local_vars).get(module,builder)
        dest = self.dest.eval(module,builder,local_vars)
        if dest.type == out.type:
            dest.set(module,builder,out)
            return dest
        if out.type == ir.PointerType(ir.IntType(8)):
            if isinstance(dest.type,ir.PointerType):
                out = builder.inttoptr(builder.ptrtoint(out,ir.IntType(64)),dest.type)
                dest.set(module,builder,out)
                return dest
        if (isinstance(out.type,ir.IntType) and isinstance(dest.type,ir.IntType)) or ((out.type in [ir.HalfType(),ir.FloatType(),ir.DoubleType()]) and (dest.type in [ir.HalfType(),ir.FloatType(),ir.DoubleType()])):
            dest.set(module,builder,helpers.cast(module,builder,out,dest.type))
            return dest
        if isinstance(self.val,Constant):
            dest.set(module,builder,helpers.cast(module,builder,out,dest.type))
            return dest
        raise Exception("Invalid Assign")

class IncAssign:
    def __init__(self,op,dest,val):
        self.op = op
        self.dest = dest
        self.val = val

class BinOp:
    def __init__(self,op,left,right):
        self.op = op
        self.left = left
        self.right = right
    
    def eval(self,module,builder,local_vars,*args):
        global base_types
        left = self.left.eval(module,builder,local_vars).get(module,builder)
        right = self.right.eval(module,builder,local_vars).get(module,builder)
        #if self.op in ["AND","OR"]:
        #    if left.type == ir.IntType(1) and right.type == ir.IntType(1):
        #        if self.op == "AND":
        #            return helpers.Constant(builder.and_(left,right))
        #        if self.op == "OR":
        #            return helpers.Constant(builder.or_(left,right))
        #    raise Exception("Invalid Types")
        #if left.type in base_types and right.type in base_types:
        #    left,right = promote(module,builder,left,right)
        #if self.op in ["EQUAL","NOT_EQUAL",
        #               "GREATER_OR_EQUAL","LESS_OR_EQUAL",
        #               "GREATER","LESS"]:
        #    ops = {"EQUAL" : "==",
        #           "NOT_EQUAL" : "!=",
        #            "GREATER_OR_EQUAL" : ">=",
        #            "LESS_OR_EQUAL" : "<=",
        #            "GREATER" : ">",
        #            "LESS" : "<"}
        #    return helpers.Constant(compare(builder,ops[self.op],left.type,left,right))
        #out = arith(builder,self.op,left.type,left,right)
        return helpers.Constant(helpers.do_binop(module,builder,self.op,left,right))

class UserBinOp:
    def __init__(self,op,left,right):
        self.op = op
        self.left = left
        self.right = right

class SinOp:
    def __init__(self,op,val):
        self.op = op
        self.val = val

class Incr:
    def __init__(self,op,val):
        self.op = op
        self.val = val

class Index:
    def __init__(self,val,idx):
        self.val = val
        self.idx = idx
    
    def eval(self,module,builder : ir.IRBuilder,local_vars,*args):
        val = self.val.eval(module,builder,local_vars).get(module,builder)
        idx = self.idx.get_list(module,builder,local_vars)
        if not isinstance(idx[0].type,ir.IntType):
            raise Exception("Invalid type in index")
        if isinstance(val.type,ir.VectorType):
            if len(idx) == 1:
                return helpers.VectorIndex(val,idx[0])
            idx1d = helpers.get_idx_1d(module,builder,val.type.dims,idx)
            #out = builder.extract_element(val,idx1d)
            return helpers.VectorIndex(val,idx1d)
        if isinstance(val.type,ir.PointerType):
            if (val.type.pointee in helpers.base_types) or (isinstance(val.type.pointee,ir.PointerType)):
                if len(idx) != 1:
                    raise Exception("Invalid number of indexers to type " + str(val.type))
                var = helpers.Variable(val.type.pointee)
                var.raw = builder.gep(val,[idx[0]])
                return var
        raise Exception("Can't index type " + str(val.type))

class Constant:
    def __init__(self,val):
        self.val = val
    
    def eval(self,module,builder : ir.IRBuilder,local_vars,*args):
        if self.val.name == "NUMBER":
            try:
                return helpers.Constant(ir.Constant(ir.IntType(32),int(self.val.value)))
            except:
                return helpers.Constant(ir.Constant(ir.FloatType(),float(self.val.value)))
        if self.val.name == "TRUE":
            return helpers.Constant(ir.Constant(ir.IntType(1),1))
        if self.val.name == "FALSE":
            return helpers.Constant(ir.Constant(ir.IntType(1),0))
        if self.val.name == "CHAR":
            return helpers.Constant(ir.Constant(ir.IntType(8),ord(self.val.value[1:-1])))
        if self.val.name == "ENDSTR":
            return helpers.Constant(ir.Constant(ir.IntType(8),ord("\0")))
        if self.val.name == "FLOAT_LITERAL":
            return helpers.Constant(ir.Constant(ir.FloatType(),float(self.val.value[:-1])))
        if self.val.name == "DOUBLE_LITERAL":
            return helpers.Constant(ir.Constant(ir.DoubleType(),float(self.val.value[:-1])))
        if self.val.name == "HALF_LITERAL":
            return helpers.Constant(ir.Constant(ir.HalfType(),float(self.val.value[:-1])))
        if self.val.name == "LONG_LITERAL":
            return helpers.Constant(ir.Constant(ir.IntType(64),int(self.val.value[:-1])))
        print("CONSTANT " + self.val.name + " NOT IMPLEMENTED")
        exit()

class VectorLiteral:
    def __init__(self,vals):
        self.vals = vals
    
    def get_list(self,module,builder,local_vars):
        out = []
        for i in self.vals:
            if isinstance(i,VectorLiteral):
                out += i.get_list(module,builder,local_vars)
            else:
                out.append(i.eval(module,builder,local_vars).get(module,builder))
        return out
    
    def eval(self,module,builder : ir.IRBuilder,local_vars,*args):
        items = self.get_list(module,builder,local_vars)
        items = helpers.promote_many(module,builder,items)
        v_len = len(items)
        v_type = ir.VectorType(items[0].type,v_len)
        return helpers.Constant(ir.Constant(v_type,items))

class VarReference:
    def __init__(self,parent,name):
        self.parent = parent
        self.name = name

class FuncReference:
    def __init__(self,parent,name):
        self.parent = parent
        self.name = name

class NamespaceVar:
    def __init__(self,namespace,name):
        self.namespace = namespace
        self.name = name

class NamsespaceFunc:
    def __init__(self,namespace,name):
        self.namespace = namespace
        self.name = name

class Sizeof:
    def __init__(self,typ):
        self.type = typ

class Typeof:
    def __init__(self,val):
        self.val = val

class VarDec:
    def __init__(self,typ,name):
        self.type = typ
        self.name = name
    
    def eval(self,module,builder : ir.IRBuilder,local_vars,*args):
        if self.name.value in local_vars:
            raise Exception("Var Exists")
        new_var = helpers.Variable(self.type.eval(module))
        new_var.init(module,builder)
        local_vars[self.name.value] = new_var
        return new_var

class Var:
    def __init__(self,name):
        self.name = name
    
    def eval(self,module,builder,local_vars,*args):
        if self.name.value in local_vars:
            return local_vars[self.name.value]
        raise Exception("Var not exist")

class BaseType:
    def __init__(self,name):
        self.name = name
    
    def eval(self,module,*args):
        if self.name.value == "void":
            return ir.VoidType()
        if self.name.value == "bool":
            return ir.IntType(1)
        if self.name.value == "char":
            return ir.IntType(8)
        if self.name.value == "int":
            return ir.IntType(32)
        if self.name.value == "long":
            return ir.IntType(64)
        if self.name.value == "float":
            return ir.FloatType()
        if self.name.value == "double":
            return ir.DoubleType()
        if self.name.value == "half":
            return ir.HalfType()
        if self.name.value == "str":
            print("STRINGS NOT IMPLEMENTED")
            exit()

class StructType:
    def __init__(self,name):
        self.name = name

class ObjectType:
    def __init__(self,name):
        self.name = name

class VectorType:
    def __init__(self,typ):
        self.type = typ
    
    def eval(self,module,*args):
        base_t_str = re.search(r"[a-z]+",self.type.value)[0]
        base_t = BaseType(Token("TYPE_NAME",base_t_str)).eval(module)
        dims = [int(i) for i in self.type.value[len(base_t_str):].split("x")]
        size = 1
        for i in dims:
            size *= i
        typ = ir.VectorType(base_t,size)
        typ.dims = dims
        return typ

class PointerType:
    def __init__(self,typ):
        self.type = typ
    
    def eval(self,module,*args):
        return ir.PointerType(self.type.eval(module))

class String:
    def __init__(self,val):
        self.val = val

    