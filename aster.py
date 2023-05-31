from llvmlite import ir
import helpers

def cast(module, builder : ir.IRBuilder,val,new_type):
    if val.type == new_type:
        return val
    if isinstance(val.type,ir.IntType):
        if isinstance(new_type,ir.IntType):
            if val.type.width < new_type.width:
                return builder.sext(val,new_type)
            else:
                return builder.trunc(val,new_type)
        if new_type in [ir.HalfType(),ir.FloatType(),ir.DoubleType()]:
            return builder.sitofp(val,new_type)
    if val.type in [ir.HalfType(),ir.FloatType(),ir.DoubleType()]:
        if isinstance(new_type,ir.IntType):
            return builder.fptosi(val,new_type)
        if val.type == ir.HalfType():
            return builder.fpext(val,new_type)
        if val.type == ir.FloatType():
            if new_type == ir.HalfType():
                return builder.fptrunc(val,new_type)
            if new_type == ir.DoubleType():
                return builder.fpext(val,new_type)
        if val.type == ir.DoubleType():
            return builder.fptrunc(val,new_type)
    raise Exception("NO CAST EXISTS")

def promote(module,builder,left,right):
    if left.type == right.type:
        return left,right
    if isinstance(left.type,ir.IntType) and isinstance(right.type,ir.IntType):
        if left.width > right.width:
            return cast(module,left,left.type),cast(module,right,right.type)
        return cast(module,left,right.type),cast(module,right,right.type)
    if isinstance(left.type,ir.IntType):
        return cast(module,builder,left,right.type),right
    if isinstance(right.type,ir.IntType):
        return left,cast(module,builder,right,left.type)
    if left.type == ir.HalfType():
        return cast(module,left,right.type),cast(module,right,right.type)
    if right.type == ir.HalfType():
        return cast(module,left,left.type),cast(module,right,left.type)
    if left.type == ir.FloatType():
        return cast(module,left,right.type),cast(module,right,right.type)
    if right.type == ir.FloatType():
        return cast(module,left,left.type),cast(module,right,left.type)

def arith(builder : ir.IRBuilder,op,typ,left,right):
    INT_OPS = {
        "RIGHT_SHIFT": builder.ashr,
        "LEFT_SHIFT": builder.shl,
        "PLUS": builder.add,
        "MINUS": builder.sub,
        "STAR": builder.mul,
        "SLASH": builder.sdiv,
        "PERCENT": builder.srem,
        "AMP": builder.and_,
        "VERT": builder.or_,
        "HAT": builder.xor 
    }
    FLOAT_OPS = {
        "PLUS": builder.fadd,
        "MINUS": builder.fsub,
        "STAR": builder.fmul,
        "SLASH": builder.fdiv,
        "PERCENT": builder.frem
    }
    if isinstance(typ,ir.IntType):
        return INT_OPS[op](left,right)
    return FLOAT_OPS[op](left,right)

def compare(builder : ir.IRBuilder,op,typ,left,right):
    if isinstance(typ,ir.IntType):
        return builder.icmp_signed(op,left,right)
    return builder.fcmp_ordered(op,left,right)

base_types = [ir.IntType(1),
                ir.IntType(8),
                ir.IntType(32),
                ir.IntType(64),
                ir.FloatType(),
                ir.DoubleType(),
                ir.HalfType()] ####ADD STRING

class Program:
    def __init__(self):
        self.items = []
    
    def add(self, item):
        self.items.append(item)

    def eval(self,module_name):
        module = ir.Module(name=module_name)
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

class ElseStatement:
    def __init__(self,lines):
        self.lines = lines

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
        self.inputs = inputs
    
    def generate(self,module):
        ret_type = self.type.eval(module)
        inputs = [i[0].eval(module) for i in self.inputs]
        func_ty = ir.FunctionType(ret_type,inputs)
        name = helpers.mangle(self.name,inputs)
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
    
    def eval(self,module : ir.Module):
        func = self.header.generate(module)
        block = func.append_basic_block(name="entry")
        builder = ir.IRBuilder(block)
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

class Return:
    def __init__(self,val=None):
        self.val = val
    
    def eval(self,module,builder : ir.IRBuilder,local_vars):
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

class Break:
    def __init__(self):
        pass

class FunctionCall:
    def __init__(self,name,inputs = []):
        self.name = name
        self.inputs = inputs

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
    
    def eval(self,module,builder : ir.IRBuilder,local_vars):
        out = self.val.eval(module,builder,local_vars).get(module,builder)
        dest = self.dest.eval(module,builder,local_vars)
        dest.set(module,builder,cast(module,builder,out,dest.type))
        return dest

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
    
    def eval(self,module,builder,local_vars):
        global base_types
        left = self.left.eval(module,builder,local_vars).get(module,builder)
        right = self.right.eval(module,builder,local_vars).get(module,builder)
        if self.op in ["AND","OR"]:
            if left.type == ir.IntType(1) and right.type == ir.IntType(1):
                if self.op == "AND":
                    return helpers.Constant(builder.and_(left,right))
                if self.op == "OR":
                    return helpers.Constant(builder.or_(left,right))
            raise Exception("Invalid Types")
        if left.type in base_types and right.type in base_types:
            left,right = promote(module,builder,left,right)
        if self.op in ["EQUAL","NOT_EQUAL",
                       "GREATER_OR_EQUAL","LESS_OR_EQUAL",
                       "GREATER","LESS"]:
            ops = {"EQUAL" : "==",
                   "NOT_EQUAL" : "!=",
                    "GREATER_OR_EQUAL" : ">=",
                    "LESS_OR_EQUAL" : "<=",
                    "GREATER" : ">",
                    "LESS" : "<"}
            return helpers.Constant(compare(builder,ops[self.op],left.type,left,right))
        out = arith(builder,self.op,left.type,left,right)
        return helpers.Constant(out)

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

class Constant:
    def __init__(self,val):
        self.val = val
    
    def eval(self,module,builder : ir.IRBuilder,local_vars):
        if self.val.name == "NUMBER":
            try:
                return helpers.Constant(ir.Constant(ir.IntType(32),int(self.val.value)))
            except:
                return helpers.Constant(ir.Constant(ir.FloatType(),float(self.val.value)))
        if self.val.name == "TRUE":
            return helpers.Constant(ir.Constant(ir.IntType(1),1))
        if self.val.name == "FALSE":
            return helpers.Constant(ir.Constant(ir.IntType(1),0))
        print("CONSTANT " + self.val.name + " NOT IMPLEMENTED")
        exit()

class VectorLiteral:
    def __init__(self,vals):
        self.vals = vals

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
    
    def eval(self,module,builder : ir.IRBuilder,local_vars):
        if self.name.value in local_vars:
            raise Exception("Var Exists")
        new_var = helpers.Variable(self.type.eval(module))
        new_var.init(module,builder)
        local_vars[self.name.value] = new_var
        return new_var

class Var:
    def __init__(self,name):
        self.name = name
    
    def eval(self,module,builder,local_vars):
        if self.name.value in local_vars:
            return local_vars[self.name.value]
        raise Exception("Var not exist")

class BaseType:
    def __init__(self,name):
        self.name = name
    
    def eval(self,module):
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

class PointerType:
    def __init__(self,typ):
        self.type = typ
    
    def eval(self,module):
        return ir.PointerType(self.type.eval())

class String:
    def __init__(self,val):
        self.val = val

    