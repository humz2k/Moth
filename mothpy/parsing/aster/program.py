from llvmlite import ir
import re
from rply import Token

class VectorIndex:
    def __init__(self,vstore,vector,idx1d,typ):
        self.vstore = vstore
        self.vector = vector
        self.idx1d = idx1d
        self.type = typ
    
    def set(self,common,builder : ir.IRBuilder, val):
        #print(self.vector.get(module,builder))
        new = builder.insert_element(self.vector,val,self.idx1d)
        self.vstore.set(common,builder,new)
        #self.vector.set(module,builder,new)
    
    def get(self,common,builder : ir.IRBuilder):
        return builder.extract_element(self.vector,self.idx1d)
    
class Variable:
    def __init__(self,typ):
        self.type = typ
        self.raw = None
    
    def init(self,common,builder : ir.IRBuilder,init = None):
        if type(self.raw) != type(None):
            common.throw_error("Var Already Init")
        with builder.goto_entry_block():
            builder.position_at_start(builder.block)
            self.raw = builder.alloca(self.type)
        if type(init) != type(None):
            self.set(common,builder,init)
    
    def set(self,common,builder : ir.IRBuilder, val):
        builder.store(val,self.raw)
    
    def get(self,common, builder : ir.IRBuilder):
        return builder.load(self.raw)
    
class TmpConstant:
    def __init__(self,val):
        self.val = val
    
    def get(self,common,builder):
        return self.val

class Common:
    def __init__(self,module : ir.Module):
        self.module = module
        self.functions = {}
        self.structs = {}
        self.objects = {}
        self.casts = {}
        self.globals = {}

        self.current_module = ""

        self.types = {
            "bool": ir.IntType(1),
            "char": ir.IntType(8),
            "int": ir.IntType(32),
            "long": ir.IntType(64),
            "float": ir.FloatType(),
            "half": ir.HalfType(),
            "double": ir.DoubleType(),
            "str": ir.PointerType(ir.IntType(8))
        }

        self.alloc_func = self.get_alloc_func()
        self.alloc_init_func = self.get_alloc_init_func()
        self.print_func = self.get_print_func()
        self.sprintf_func = self.get_sprintf_func()
        self.strlen_func = self.get_strlen_func()
        self.strcpy_func = self.get_strcpy_func()
        self.pow_func = self.get_pow_func()
        self.powf_func = self.get_powf_func()
        self.n_strings = -1
        self.formatters = {}
        self.base_types = [ir.IntType(1),
                ir.IntType(8),
                ir.IntType(32),
                ir.IntType(64),
                ir.FloatType(),
                ir.DoubleType(),
                ir.HalfType(),
                ir.PointerType(ir.IntType(8))]
        self.float_types = [ir.HalfType(),ir.FloatType(),ir.DoubleType()]

    def throw_error(self,string):
        raise Exception(string)
    
    def is_base(self,val):
        return val.type in self.base_types

    def type_is_base(self,typ):
        return typ in self.base_types
    
    def is_int(self,val):
        return isinstance(val.type,ir.IntType)
    
    def is_float(self,val):
        return val.type in self.float_types
    
    def type_is_int(self,typ):
        return isinstance(typ,ir.IntType)
    
    def type_is_float(self,typ):
        return typ in self.float_types
    
    def is_vector(self,val):
        return isinstance(val.type,ir.VectorType)
    
    def type_is_vector(self,typ):
        return isinstance(typ,ir.VectorType)
    
    def is_array(self,val):
        return isinstance(val.type, ir.LiteralStructType)
    
    def type_is_array(self,typ):
        return isinstance(typ, ir.LiteralStructType)

    def is_struct(self,val):
        if isinstance(val.type, ir.IdentifiedStructType):
            name = val.typ.name.split(".")[-1]
            return name.startswith("STRUCT")
        return False
    
    def type_is_struct(self,typ):
        if isinstance(typ, ir.IdentifiedStructType):
            name = typ.name.split(".")[-1]
            return name.startswith("STRUCT")
        return False

    def is_object(self,val):
        if isinstance(val.type, ir.PointerType):
            if isinstance(val.type.pointee,ir.IdentifiedStructType):
                name = val.type.pointee.name.split(".")[-1]
                return name.startswith("OBJECT")
        return False
    
    def type_is_object(self,typ):
        if isinstance(typ, ir.PointerType):
            if isinstance(typ.pointee,ir.IdentifiedStructType):
                name = typ.pointee.name.split(".")[-1]
                return name.startswith("OBJECT")
        return False
    
    def is_void_ptr(self,val):
        return val.type == ir.PointerType(ir.IntType(16))
    
    def type_is_void_ptr(self,typ):
        return typ == ir.PointerType(ir.IntType(16))
    
    def is_ptr(self,val):
        if isinstance(val.type, ir.PointerType):
            if isinstance(val.type.pointee,ir.IdentifiedStructType):
                if val.type.pointee.name.startswith("OBJECT"):
                    return False
            return True
        return False
    
    def type_is_ptr(self,typ):
        if isinstance(typ, ir.PointerType):
            if isinstance(typ.pointee,ir.IdentifiedStructType):
                if typ.pointee.name.startswith("OBJECT"):
                    return False
            return True
        return False
    
    def void_type(self):
        return ir.VoidType()
    
    def bool_type(self):
        return ir.IntType(1)
    
    def char_type(self):
        return ir.IntType(8)
    
    def int_type(self):
        return ir.IntType(32)
    
    def long_type(self):
        return ir.IntType(64)

    def half_type(self):
        return ir.HalfType()

    def float_type(self):
        return ir.FloatType()
    
    def double_type(self):
        return ir.DoubleType()
    
    def str_type(self):
        return ir.PointerType(ir.IntType(8))
    
    def void_ptr_type(self):
        return ir.PointerType(ir.IntType(16))
    
    def cast_ptr(self,builder : ir.IRBuilder,ptr,typ):
        return builder.inttoptr(builder.ptrtoint(ptr,ir.IntType(64)),typ)
    
    def alloc(self,builder : ir.IRBuilder, size, ptr_type):
        raw_ptr = builder.call(self.alloc_func,[size])
        return self.cast_ptr(builder,raw_ptr,ptr_type)

    def mangle(self,name,inputs,parent=None):
        if type(parent) != type(None):
            return parent + "_" + name.value + "_" + "_".join([str(i) for i in inputs])
        if name.value == "main":
            return name.value
        return name.value + "_" + "_".join([str(i) for i in inputs])
    
    def get_alloc_func(self):
        alloc_ty = ir.FunctionType(ir.PointerType(ir.IntType(16)),[ir.IntType(32)])
        func = ir.Function(self.module,alloc_ty,"bohem_malloc")
        self.functions[self.mangle(Token("FUNCTION_NAME","alloc"),[ir.IntType(32)])] = func
        return func

    def get_alloc_init_func(self):
        alloc_init_ty = ir.FunctionType(ir.VoidType(),[])
        func = ir.Function(self.module,alloc_init_ty,"bohem_start")
        return func
    
    def get_print_func(self):
        printf_ty = ir.FunctionType(ir.IntType(32), [ir.IntType(8).as_pointer()], var_arg=True)
        func = ir.Function(self.module, printf_ty, name="printf")
        return func
    
    def get_sprintf_func(self):
        sprintf_ty = ir.FunctionType(ir.IntType(32), [ir.IntType(8).as_pointer(),ir.IntType(8).as_pointer()], var_arg=True)
        func = ir.Function(self.module, sprintf_ty, name="sprintf")
        return func
    
    def get_strlen_func(self):
        strlen_ty = ir.FunctionType(ir.IntType(32),[ir.PointerType(ir.IntType(8))])
        func = ir.Function(self.module,strlen_ty,"strlen")
        self.functions[self.mangle(Token("FUNCTION_NAME","strlen"),[ir.PointerType(ir.IntType(8))])] = func
        return func

    def get_strcpy_func(self):
        strcpy_ty = ir.FunctionType(ir.PointerType(ir.IntType(8)),[ir.PointerType(ir.IntType(8)),ir.PointerType(ir.IntType(8))])
        func = ir.Function(self.module,strcpy_ty,"strcpy")
        return func
    
    def get_pow_func(self):
        pow_ty = ir.FunctionType(ir.PointerType(ir.DoubleType()),[ir.DoubleType(),ir.DoubleType()])
        func = ir.Function(self.module,pow_ty,"pow")
        return func
    
    def get_powf_func(self):
        powf_ty = ir.FunctionType(ir.PointerType(ir.FloatType()),[ir.FloatType(),ir.FloatType()])
        func = ir.Function(self.module,powf_ty,"powf")
        return func
    
    def get_formatter(self,string):
        if string in self.formatters:
            return self.formatters[string]
        self.n_strings += 1
        fmt = string + "\0"
        c_fmt = ir.Constant(ir.ArrayType(ir.IntType(8), len(fmt)),
                            bytearray(fmt.encode("utf8")))
        global_fmt = ir.GlobalVariable(self.module, c_fmt.type, name="string" + str(self.n_strings))
        global_fmt.linkage = 'internal'
        global_fmt.global_constant = True
        global_fmt.initializer = c_fmt
        self.formatters[string] = global_fmt
        return global_fmt
    
    def get_string(self,builder,string):
        global_fmt = self.get_formatter(string)
        return builder.bitcast(global_fmt, ir.IntType(8).as_pointer())
    
    def print_vector(self,builder : ir.IRBuilder,val):
        dims = val.type.dims
        size = 1
        for i in dims:
            size *= i
        vals = [builder.extract_element(val,ir.Constant(ir.IntType(32),i)) for i in range(size)]
        #for i in range(len(dims)):
        #    helpers.print_open_sqr(module,builder)
        print_vals = []
        print_fmt = ""
        indexers = [0]*len(dims)
        last = [1]*len(dims)
        for idx,i in enumerate(vals):
            for j in list(range(len(indexers)))[::-1]:
                if indexers[j] == 0 and (last[j] != indexers[j]):
                    #common.printf(builder,"[")
                    print_fmt += "["
            last = indexers[:]
            fmt,out_val = self.get_print_formatter(builder,i)
            print_fmt += fmt
            print_vals.append(out_val)
            #common.printf(builder,i)
            indexers[-1] += 1
            for j in list(range(len(indexers)))[::-1][:-1]:
                if indexers[j] == dims[j]:
                    #common.printf(builder,"]")
                    print_fmt += "]"
                    if (j == 1) and (idx != (len(vals)-1)):
                        #common.printf(builder,"\n")
                        print_fmt += "\n"
                    indexers[j] = 0
                    indexers[j-1] += 1
            if idx != (len(vals)-1):
                #common.printf(builder," ")
                print_fmt += " "
            else:
                print_fmt += "]"
                #common.printf(builder,"]")
        return print_fmt,print_vals
    
    def get_struct_formatter(self,builder : ir.IRBuilder,val):
        vals = []
        for i in range(len(val.type.elements)):
            vals.append(builder.extract_value(val,i))
        name = val.type.name.split("STRUCT_")[1]
        new_vals = []
        fmt = name + "{"
        for idx,i in enumerate(vals):
            this_fmt,new_val = self.get_print_formatter(builder,i)
            new_vals.append(new_val)
            fmt += str(i.type) + ": " + this_fmt
            if idx != len(vals)-1:
                fmt += ", "
        fmt += "}"
        return fmt,new_vals
    
    def cast(self, builder : ir.IRBuilder,val,new_type):
        if val.type == new_type:
            return val
        if new_type == self.str_type():
            if self.is_base(val):
                out = self.alloc(builder,builder.mul(ir.Constant(ir.IntType(32),80),self.sizeof(builder,ir.IntType(8))),ir.PointerType(ir.IntType(8)))
                fmt,out_val = self.get_print_formatter(builder,val)
                fmt = self.get_string(builder,fmt)
                do_cast = builder.call(self.sprintf_func,[out,fmt,out_val])
                return out
            if self.is_vector(val):
                fmt,out_vals = self.print_vector(builder,val)
                size = len(fmt)*20
                if size < 256:
                    size = 256
                out = self.alloc(builder,builder.mul(ir.Constant(ir.IntType(32),size),self.sizeof(builder,ir.IntType(8))),ir.PointerType(ir.IntType(8)))
                fmt = self.get_string(builder,fmt)
                do_cast = builder.call(self.sprintf_func,[out,fmt] + out_vals)
                return out
            if self.is_struct(val):
                fmt,out_vals = self.get_struct_formatter(builder,val)
                size = len(fmt)*20
                if size < 256:
                    size = 256
                out = self.alloc(builder,builder.mul(ir.Constant(ir.IntType(32),size),self.sizeof(builder,ir.IntType(8))),ir.PointerType(ir.IntType(8)))
                fmt = self.get_string(builder,fmt)
                do_cast = builder.call(self.sprintf_func,[out,fmt] + out_vals)
                return out
        if isinstance(val,ir.Constant):
            if self.is_int(val) or self.is_float(val):
                val = val.constant
                if self.type_is_int(new_type):
                    return ir.Constant(new_type,int(val))
                if self.type_is_float(new_type):
                    return ir.Constant(new_type,float(val))
            if self.is_vector(val) and self.type_is_vector(new_type):
                if val.type.count == new_type.count:
                    all_const = True
                    for i in val.constant:
                        if not isinstance(i,ir.Constant):
                            all_const = False
                    if all_const:
                        vals = [i.constant for i in val.constant]
                        new_t = new_type.element
                        if self.type_is_int(new_t):
                            return ir.Constant(ir.VectorType(new_t,len(vals)),[int(i) for i in vals])
                        if self.type_is_float(new_t):
                            return ir.Constant(ir.VectorType(new_t,len(vals)),[float(i) for i in vals])
        if self.is_int(val):
            if self.type_is_int(new_type):
                if val.type.width < new_type.width:
                    return builder.sext(val,new_type)
                else:
                    return builder.trunc(val,new_type)
            if self.type_is_float(new_type):
                return builder.sitofp(val,new_type)
        if self.is_float(val):
            if self.type_is_int(new_type):
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
        if self.is_vector(val) and self.type_is_vector(new_type):
            size_val = 1
            for i in val.type.dims:
                size_val *= i
            size = 1
            for i in new_type.dims:
                size *= i
            if size_val == size:
                if self.type_is_int(val.type.element):
                    if self.type_is_int(new_type.element):
                        if val.type.element.width < new_type.element.width:
                            return builder.sext(val,new_type)
                        else:
                            return builder.trunc(val,new_type)
                    if self.type_is_float(new_type.element):
                        return builder.sitofp(val,new_type)
                if self.type_is_float(val.type.element):
                    if self.type_is_int(new_type.element):
                        return builder.fptosi(val,new_type)
                    if val.type.element == ir.HalfType():
                        return builder.fpext(val,new_type)
                    if val.type.element == ir.FloatType():
                        if new_type.element == ir.HalfType():
                            return builder.fptrunc(val,new_type)
                        if new_type.element == ir.DoubleType():
                            return builder.fpext(val,new_type)
                    if val.type.element == ir.DoubleType():
                        return builder.fptrunc(val,new_type)
        self.throw_error("No cast exists from " + str(val.type) + " to " + str(new_type))
    
    def get_print_formatter(self,builder : ir.IRBuilder, val):
        if type(val) == str:
            return "%s",self.get_string(builder,val)
        if val.type == self.bool_type():
            with builder.if_else(val) as (then,otherwise):
                with then:
                    bb_then = builder.basic_block
                    then_val = self.get_string(builder,"True")
                    #builder.call(self.print_func,[self.get_string(builder,"%s"),self.get_string(builder,"True")])
                with otherwise:
                    bb_other = builder.basic_block
                    other_val = self.get_string(builder,"False")
                    #builder.call(self.print_func,[self.get_string(builder,"%s"),self.get_string(builder,"False")])
            bool_str = builder.phi(self.str_type())
            bool_str.add_incoming(then_val, bb_then)
            bool_str.add_incoming(other_val, bb_other)
            return "%s",bool_str
        if val.type == ir.HalfType():
            val = self.cast(builder,val,ir.FloatType())
        if self.is_float(val):
            return "%g",val
        if val.type == ir.IntType(8):
            return "%c",val
        if val.type == ir.IntType(32):
            return "%d",val
        if val.type == ir.IntType(64):
            return "%ld",val
        if val.type == self.str_type():
            return "%s",val
        if isinstance(val.type,ir.PointerType):
            return "%p",val
        self.throw_error("Can't print type " + str(val.type))
    
    def printf(self,builder : ir.IRBuilder, val):
        if type(val) == str:
            builder.call(self.print_func,[self.get_string(builder,"%s"),self.get_string(builder,val)])
            return
        if val.type == self.bool_type:
            with builder.if_else(val) as (then,otherwise):
                with then:
                    builder.call(self.print_func,[self.get_string(builder,"%s"),self.get_string(builder,"True")])
                with otherwise:
                    builder.call(self.print_func,[self.get_string(builder,"%s"),self.get_string(builder,"False")])
            return
        if val.type == ir.HalfType():
            val = self.cast(builder,val,ir.FloatType())
        if self.is_float(val):
            builder.call(self.print_func,[self.get_string(builder,"%g"),val])
            return
        if val.type == ir.IntType(8):
            builder.call(self.print_func,[self.get_string(builder,"%c"),val])
            return
        if val.type == ir.IntType(32):
            builder.call(self.print_func,[self.get_string(builder,"%d"),val])
            return
        if val.type == ir.IntType(64):
            builder.call(self.print_func,[self.get_string(builder,"%ld"),val])
            return
        if val.type == self.str_type():
            builder.call(self.print_func,[self.get_string(builder,"%s"),val])
            return
        if isinstance(val.type,ir.PointerType):
            builder.call(self.print_func,[self.get_string(builder,"%p"),val])
            return
        self.throw_error("Can't print type " + str(val.type))

    def eval_lines(self,builder,local_vars,break_to,lines):
        for i in lines:
            if not builder.block.is_terminated:
                i.eval(self,builder,local_vars,break_to)

    def promote(self,builder,left,right):
        if left.type == right.type:
            return left,right
        if isinstance(left.type,ir.IntType) and isinstance(right.type,ir.IntType):
            if left.type.width > right.type.width:
                return self.cast(builder,left,left.type),self.cast(builder,right,left.type)
            return self.cast(builder,left,right.type),self.cast(builder,right,right.type)
        if isinstance(left.type,ir.IntType):
            return self.cast(builder,left,right.type),right
        if isinstance(right.type,ir.IntType):
            return left,self.cast(builder,right,left.type)
        if left.type == ir.HalfType():
            return self.cast(builder,left,right.type),self.cast(builder,right,right.type)
        if right.type == ir.HalfType():
            return self.cast(builder,left,left.type),self.cast(builder,right,left.type)
        if left.type == ir.FloatType():
            return self.cast(builder,left,right.type),self.cast(builder,right,right.type)
        if right.type == ir.FloatType():
            return self.cast(builder,left,left.type),self.cast(builder,right,left.type)
        self.throw_error("Types " + str(left.type) + " and " + str(right.type) + " are not promotable")

    def vector_promote(self,builder,left,right):
        if left.type.element == right.type.element:
            return left,right
        if isinstance(left.type.element,ir.IntType) and isinstance(right.type.element,ir.IntType):
            if left.type.element.width > right.type.element.width:
                return self.cast(builder,left,left.type),self.cast(builder,right,left.type)
            return self.cast(builder,left,right.type),self.cast(builder,right,right.type)
        if isinstance(left.type.element,ir.IntType):
            return self.cast(builder,left,right.type),right
        if isinstance(right.type.element,ir.IntType):
            return left,self.cast(builder,right,left.type)
        if left.type.element == ir.HalfType():
            return self.cast(builder,left,right.type),self.cast(builder,right,right.type)
        if right.type.element == ir.HalfType():
            return self.cast(builder,left,left.type),self.cast(builder,right,left.type)
        if left.type.element == ir.FloatType():
            return self.cast(builder,left,right.type),self.cast(builder,right,right.type)
        if right.type.element == ir.FloatType():
            return self.cast(builder,left,left.type),self.cast(builder,right,left.type)
        self.throw_error("Types " + str(left.type) + " and " + str(right.type) + " are not promotable")

    def vector_scalar_promote(self,builder,left,right):
        if left.type.element == right.type:
            return left,right
        right_vec_type = ir.VectorType(right.type,left.type.count)
        right_vec_type.dims = left.type.dims
        if isinstance(left.type.element,ir.IntType) and isinstance(right.type,ir.IntType):
            if left.type.element.width > right.type.width:
                return self.cast(builder,left,left.type),self.cast(builder,right,left.type.element)
            return self.cast(builder,left,right_vec_type),self.cast(builder,right,right.type)
        if isinstance(left.type.element,ir.IntType):
            return self.cast(builder,left,right_vec_type),right
        if isinstance(right.type.element,ir.IntType):
            return left,self.cast(builder,right,left.type.element)
        if left.type.element == ir.HalfType():
            return self.cast(builder,left,right_vec_type),self.cast(builder,right,right.type)
        if right.type.element == ir.HalfType():
            return self.cast(builder,left,left.type),self.cast(builder,right,left.type.element)
        if left.type.element == ir.FloatType():
            return self.cast(builder,left,right_vec_type),self.cast(builder,right,right.type)
        if right.type.element == ir.FloatType():
            return self.cast(builder,left,left.type),self.cast(builder,right,left.type.element)
        self.throw_error("Types " + str(left.type) + " and " + str(right.type) + " are not promotable")
    
    def promote_many(self,builder,items):
        current = items[0]
        for i in items[1:]:
            current,_ = self.promote(builder,current,i)
        out_ty = current.type
        out = []
        for i in items:
            out.append(self.cast(builder,i,out_ty))
        return out

    def sizeof(self,builder,typ):
        gep_hack = builder.gep(ir.Constant(ir.PointerType(typ),None),[ir.Constant(ir.IntType(32),1)])
        return builder.ptrtoint(gep_hack,ir.IntType(32))
    
    def arith(self,builder : ir.IRBuilder,op,typ,left,right):
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
        if self.type_is_vector(typ):
            typ = typ.element
        if self.type_is_int(typ):
            return INT_OPS[op](left,right)
        if typ == ir.PointerType(ir.IntType(8)):
            if op != "PLUS":
                raise self.throw_error("Cannot do op " + op + " on strings")
            left_len = builder.call(self.strlen_func,[left])
            right_len = builder.call(self.strlen_func,[right])
            new_len = builder.add(builder.add(left_len,right_len),ir.Constant(ir.IntType(32),1))
            new_size = builder.mul(new_len,self.sizeof(builder,ir.IntType(8)))
            new_pointer = self.alloc(builder,new_size,ir.PointerType(ir.IntType(8)))
            str_1_ptr = new_pointer
            str_2_ptr = builder.gep(new_pointer,[left_len])
            str_1_ptr = builder.call(self.strcpy_func,[str_1_ptr,left])
            str_2_ptr = builder.call(self.strcpy_func,[str_2_ptr,right])
            return new_pointer
        return FLOAT_OPS[op](left,right)
    
    def compare(self,builder : ir.IRBuilder,op,typ,left,right):
        ops = {"EQUAL" : "==",
                    "NOT_EQUAL" : "!=",
                    "GREATER_OR_EQUAL" : ">=",
                    "LESS_OR_EQUAL" : "<=",
                    "GREATER" : ">",
                    "LESS" : "<"}
        if self.type_is_vector(typ):
            if self.type_is_int(typ.element):
                return builder.icmp_signed(ops[op],left,right)
            return builder.fcmp_ordered(ops[op],left,right)
        if self.type_is_int(typ):
            return builder.icmp_signed(ops[op],left,right)
        return builder.fcmp_ordered(ops[op],left,right)
    
    def bool_op(self,builder : ir.IRBuilder, op, typ, left, right):
        if op == "AND":
            return builder.and_(left,right)
        if op == "OR":
            return builder.or_(left,right)
        
    def math_base(self,builder : ir.IRBuilder, op, left, right):
        if op in ["AND","OR"]:
            if left.type == ir.IntType(1) and right.type == ir.IntType(1):
                return self.bool_op(builder,op,ir.IntType(1),left,right)
            self.throw_error("Invalid types for op " + op)
        
        left,right = self.promote(builder,left,right)
        if op in ["EQUAL","NOT_EQUAL",
                        "GREATER_OR_EQUAL","LESS_OR_EQUAL",
                        "GREATER","LESS"]:
            return self.compare(builder,op,left.type,left,right)
        else:
            return self.arith(builder,op,left.type,left,right)
        
    def math_vectors(self,builder : ir.IRBuilder,op,left,right):
        left_dims = tuple(left.type.dims)
        right_dims = tuple(right.type.dims)
        size = 1
        for i in left_dims:
            size *= i
        if left_dims != right_dims:
            raise Exception("Can't " + str(op) + " vectors with dims " + str(left_dims) + " and " + str(right_dims))
        left,right = self.vector_promote(builder,left,right)
        typ = left.type.element
        if op in ["AND","OR"]:
            if typ == ir.IntType(1):
                return self.bool_op(builder,op,left.type,left,right)
            self.throw_error("Invalid types for op " + op)
        if op in ["EQUAL","NOT_EQUAL",
                        "GREATER_OR_EQUAL","LESS_OR_EQUAL",
                        "GREATER","LESS"]:
            return self.compare(builder,op,left.type,left,right)
        else:
            return self.arith(builder,op,left.type,left,right)
    
    def power(self,builder : ir.IRBuilder, left, right):
        if isinstance(right,ir.Constant):
            n = right.constant
            if int(n) == n:
                if self.is_vector(left) and not self.is_vector(right):
                    left,right = self.vector_scalar_promote(builder,left,right)
                else:
                    left,right = self.promote(builder,left,right)
                out = left
                if 0 <= n < 52:
                    if n == 0:
                        if isinstance(out.type,ir.VectorType):
                            out = ir.Constant(out.type,[1] * out.type.count)
                        else:
                            out = ir.Constant(out.type,1)
                    else:
                        for i in range(int(n)-1):
                            out = self.arith(builder,"STAR",out.type,out,left)
                return out
        
        #print(left,type(right))
        exit()

    def pointer_math(self,builder:ir.IRBuilder,op,left,right):
        if op == "PLUS":
            return builder.gep(left,[right])
        if op == "MINUS":
            return builder.gep(left,[builder.neg(right)])
        self.throw_error("Op " + op + " is invalid for pointer math")

    def do_binop(self,builder,op,left,right):
        if op == "STARSTAR":
            return self.power(builder,left,right)
        if self.is_base(left) and self.is_base(right):
            return self.math_base(builder,op,left,right)
        if self.is_vector(left) and self.is_vector(right):
            return self.math_vectors(builder,op,left,right)
        if self.is_ptr(left) and self.is_int(right):
            return self.pointer_math(builder,op,left,right)
        if self.is_ptr(right) and  self.is_int(left):
            return self.pointer_math(builder,op,right,left)
        self.throw_error("BINOP NOT IMPLEMENTED")

    def get_idx_1d(self,builder,dims,idx):
        ndims = len(dims)
        nindex = len(idx)
        idx = idx[::-1]
        for i in idx:
            if not self.is_int(i):
                self.throw_error("Invalid type in index")
        if nindex == 1:
            return self.cast(builder,idx[0],ir.IntType(32))
        if ndims != nindex:
            raise Exception("Invalid number of dimensions to index")
        if isinstance(dims[0],int):
            muls = [1]
            for i in range(1,ndims):
                dims = dims[i:]
                mul = 1
                for j in dims:
                    mul *= j
                muls.append(mul)
            idx1d = builder.mul(self.cast(builder,idx[0],ir.IntType(32)),ir.Constant(ir.IntType(32),muls[0]))
            for i in range(1,ndims):
                idx1d = builder.add(idx1d,builder.mul(self.cast(builder,idx[i],ir.IntType(32)),ir.Constant(ir.IntType(32),muls[i])))
        else:
            muls = [ir.Constant(ir.IntType(32),1)]
            dims = [self.cast(builder,i,ir.IntType(32)) for i in dims]
            for i in range(1,ndims):
                dims = dims[i:]
                mul = dims[0]
                for j in dims[1:]:
                    mul = builder.mul(mul,j)
                muls.append(mul)
            idx1d = builder.mul(self.cast(builder,idx[0],ir.IntType(32)),muls[0])
            for i in range(1,ndims):
                idx1d = builder.add(idx1d,builder.mul(self.cast(builder,idx[i],ir.IntType(32)),muls[i]))
        return idx1d

    def array_index(self,builder : ir.IRBuilder,array : ir.Constant,index):
        dims = builder.extract_value(array,0)
        pointer = builder.extract_value(array,1)
        ndims = dims.type.count
        out_dims = [builder.extract_element(dims,ir.Constant(ir.IntType(32),i)) for i in range(ndims)]
        idx_1d = self.get_idx_1d(builder,out_dims,index)
        return builder.gep(pointer,[idx_1d])
    
    def make_struct_type(self,name,attributes,module_prefix = ""):
        typ = self.module.context.get_identified_type(module_prefix + "STRUCT_" + name)
        name = module_prefix + name
        body = []
        names = []
        for i in attributes:
            names.append(i.name.value)
            body.append(i.type.eval(self))
        typ.set_body(*body)
        typ.element_names = names
        if name in self.structs:
            if self.structs[name].elements != typ.elements:
                self.throw_error("Redefinition of struct")
        self.structs[name] = typ
        return typ
    
    def make_object_type(self,name,attributes,module_prefix = ""):
        typ = self.module.context.get_identified_type(module_prefix + "OBJECT_" + name)
        body = []
        names = []
        for i in attributes:
            names.append(i.name.value)
            body.append(i.type.eval(self))
        typ.set_body(*body)
        typ.element_names = names
        typ = ir.PointerType(typ)
        if module_prefix + name in self.objects:
            if self.objects[module_prefix + name].elements != typ.elements:
                self.throw_error("Redefinition of struct")
        self.objects[module_prefix + name] = typ
        return typ
    
    def get_struct_type(self,name):
        if not name in self.structs:
            self.throw_error("Struct " + name + " not found")
        return self.structs[name]
    
    def variable(self,typ):
        return Variable(typ)
    
    def constant(self,val):
        return TmpConstant(val)
    
    def vector_index(self,vstore,vector,idx1d,typ):
        return VectorIndex(vstore,vector,idx1d,typ)

class Program:
    def __init__(self):
        self.items = []
    
    def add(self, item):
        self.items.append(item)

    def eval(self,module_name : str):
        common = Common(ir.Module(name=module_name))

        for item in self.items:
            item.eval(common,module_prefix = "")
        return common.module
    
class Module:
    def __init__(self,name):
        self.name = name
        self.items = []
    
    def add(self,item):
        self.items.append(item)
    
    def eval(self,common,module_prefix = ""):
        previous_module = common.current_module
        module_prefix = module_prefix + self.name + "."
        common.current_module = module_prefix
        for item in self.items:
            item.eval(common,module_prefix = module_prefix)
        common.current_module = previous_module