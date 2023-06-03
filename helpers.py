from llvmlite import ir

FUNCTIONS = {}

base_types = [ir.IntType(1),
                ir.IntType(8),
                ir.IntType(32),
                ir.IntType(64),
                ir.FloatType(),
                ir.DoubleType(),
                ir.HalfType(),
                ir.PointerType(ir.IntType(8))] ####ADD STRING

N_STRINGS = -1

FORMATTERS = {}

PRINT = None
STRLEN = None
ALLOC = None
STRCPY = None

def make_string(module,builder,string):
    global N_STRINGS
    N_STRINGS += 1
    fmt = string + "\0"
    c_fmt = ir.Constant(ir.ArrayType(ir.IntType(8), len(fmt)),
                        bytearray(fmt.encode("utf8")))
    global_fmt = ir.GlobalVariable(module, c_fmt.type, name="string" + str(N_STRINGS))
    global_fmt.linkage = 'internal'
    global_fmt.global_constant = True
    global_fmt.initializer = c_fmt
    return builder.bitcast(global_fmt, ir.IntType(8).as_pointer())

def make_formatter(module,string):
    global N_STRINGS
    N_STRINGS += 1
    fmt = string + "\0"
    c_fmt = ir.Constant(ir.ArrayType(ir.IntType(8), len(fmt)),
                        bytearray(fmt.encode("utf8")))
    global_fmt = ir.GlobalVariable(module, c_fmt.type, name="string" + str(N_STRINGS))
    global_fmt.linkage = 'internal'
    global_fmt.global_constant = True
    global_fmt.initializer = c_fmt
    return global_fmt

def generate_formatters(module):
    global FORMATTERS
    FORMATTERS[ir.IntType(1)] = make_formatter(module,"%s")
    FORMATTERS[ir.IntType(8)] = make_formatter(module,"%c")
    FORMATTERS[ir.IntType(32)] = make_formatter(module,"%d")
    FORMATTERS[ir.IntType(64)] = make_formatter(module,"%ld")
    FORMATTERS[ir.HalfType()] = make_formatter(module,"%g")
    FORMATTERS[ir.FloatType()] = make_formatter(module,"%g")
    FORMATTERS[ir.DoubleType()] = make_formatter(module,"%g")
    FORMATTERS[ir.PointerType(ir.IntType(8))] = make_formatter(module,"%s")
    FORMATTERS["True"] = make_formatter(module,"True")
    FORMATTERS["False"] = make_formatter(module,"False")
    FORMATTERS["Newline"] = make_formatter(module,"\n")
    FORMATTERS["Space"] = make_formatter(module," ")
    FORMATTERS["["] = make_formatter(module,"[")
    FORMATTERS["]"] = make_formatter(module,"]")

def print_base(module,builder : ir.IRBuilder,val):
    formatter = FORMATTERS[val.type]
    formatter = builder.bitcast(formatter, ir.IntType(8).as_pointer())
    if val.type == ir.IntType(1):
        with builder.if_else(val) as (then,otherwise):
            with then:
                builder.call(PRINT,[formatter,builder.bitcast(FORMATTERS["True"], ir.IntType(8).as_pointer())])
            with otherwise:
                builder.call(PRINT,[formatter,builder.bitcast(FORMATTERS["False"], ir.IntType(8).as_pointer())])
        return
    if val.type == ir.HalfType():
        val = cast(module,builder,val,ir.FloatType())
    builder.call(PRINT,[formatter,val])

def print_newline(module,builder : ir.IRBuilder):
    builder.call(PRINT,[builder.bitcast(FORMATTERS["Newline"], ir.IntType(8).as_pointer())])

def print_space(module,builder : ir.IRBuilder):
    builder.call(PRINT,[builder.bitcast(FORMATTERS["Space"], ir.IntType(8).as_pointer())])

def print_open_sqr(module,builder : ir.IRBuilder):
    builder.call(PRINT,[builder.bitcast(FORMATTERS["["], ir.IntType(8).as_pointer())])

def print_close_sqr(module,builder : ir.IRBuilder):
    builder.call(PRINT,[builder.bitcast(FORMATTERS["]"], ir.IntType(8).as_pointer())])

def eval_lines(module,builder,local_vars,break_to,lines):
    for i in lines:
        if not builder.block.is_terminated:
            i.eval(module,builder,local_vars,break_to)

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
    if isinstance(val.type,ir.VectorType) and isinstance(new_type,ir.VectorType):
        if tuple(val.type.dims) == tuple(new_type.dims):
            size = 1
            for i in val.type.dims:
                size *= i
            out = ir.Constant(ir.VectorType(new_type.element,size),[0]*size)
            elems = []
            for i in range(size):
                elems.append(builder.extract_element(val,ir.Constant(ir.IntType(32),i)))
            vals = []
            for i in range(size):
                tmp = cast(module,builder,elems[i],new_type.element)
                vals.append(tmp)
            for i in range(size):
                out = builder.insert_element(out,vals[i],ir.Constant(ir.IntType(32),i))
            out.type.dims = new_type.dims
            return out
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
    
def promote_many(module,builder,items):
    current = items[0]
    for i in items[1:]:
        current,_ = promote(module,builder,current,i)
    out_ty = current.type
    out = []
    for i in items:
        out.append(cast(module,builder,i,out_ty))
    return out
    
def gep_hack(builder,typ):
    gep_hack = builder.gep(ir.Constant(ir.PointerType(typ),None),[ir.Constant(ir.IntType(32),1)])
    return builder.ptrtoint(gep_hack,ir.IntType(32))

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
    if typ == ir.PointerType(ir.IntType(8)):
        left_len = builder.call(STRLEN,[left])
        right_len = builder.call(STRLEN,[right])
        new_len = builder.add(builder.add(left_len,right_len),ir.Constant(ir.IntType(32),1))
        new_size = builder.mul(new_len,gep_hack(builder,ir.IntType(8)))
        new_pointer = builder.call(ALLOC,[new_size])
        new_pointer = builder.inttoptr(builder.ptrtoint(new_pointer,ir.IntType(64)),ir.PointerType(ir.IntType(8)))
        str_1_ptr = new_pointer
        str_2_ptr = builder.gep(new_pointer,[left_len])
        str_1_ptr = builder.call(STRCPY,[str_1_ptr,left])
        str_2_ptr = builder.call(STRCPY,[str_2_ptr,right])
        return new_pointer
    return FLOAT_OPS[op](left,right)

def compare(builder : ir.IRBuilder,op,typ,left,right):
    if isinstance(typ,ir.IntType):
        return builder.icmp_signed(op,left,right)
    return builder.fcmp_ordered(op,left,right)

def mangle(name,inputs):
    if name.value == "main":
        return name.value
    return name.value + "_" + "_".join([str(i) for i in inputs])

def math_vectors(module,builder : ir.IRBuilder,op,left,right,func):
    left_dims = tuple(left.type.dims)
    right_dims = tuple(right.type.dims)
    size = 1
    for i in left_dims:
        size *= i
    if left_dims != right_dims:
        raise Exception("Can't " + str(op) + " vectors with dims " + str(left_dims) + " and " + str(right_dims))
    vals = [builder.extract_element(left,ir.Constant(ir.IntType(32),i)) for i in range(size)] + [builder.extract_element(right,ir.Constant(ir.IntType(32),i)) for i in range(size)]
    vals = promote_many(module,builder,vals)
    left_vals = vals[:size]
    right_vals = vals[size:]
    out = None
    vals = []
    for idx,i,j in zip(list(range(size)),left_vals,right_vals):
        tmp = func(module,builder,op,i,j)
        vals.append(tmp)
        #print(tmp)
        #print(tmp.type)
    out = ir.Constant(ir.VectorType(vals[0].type,size),[0]*size)
    for idx,i in enumerate(vals):
        out = builder.insert_element(out,i,ir.Constant(ir.IntType(32),idx))
    out.type.dims = left.type.dims[:]
    return out

def do_binop(module,builder,op,left,right):
    if op in ["AND","OR"]:
        if left.type == ir.IntType(1) and right.type == ir.IntType(1):
            if op == "AND":
                return builder.and_(left,right)
            if op == "OR":
                return builder.or_(left,right)
        raise Exception("Invalid Types")
    if left.type in base_types and right.type in base_types:
        left,right = promote(module,builder,left,right)
        if op in ["EQUAL","NOT_EQUAL",
                        "GREATER_OR_EQUAL","LESS_OR_EQUAL",
                        "GREATER","LESS"]:
            ops = {"EQUAL" : "==",
                    "NOT_EQUAL" : "!=",
                    "GREATER_OR_EQUAL" : ">=",
                    "LESS_OR_EQUAL" : "<=",
                    "GREATER" : ">",
                    "LESS" : "<"}
            return compare(builder,ops[op],left.type,left,right)
        else:
            return arith(builder,op,left.type,left,right)
    if isinstance(left.type,ir.VectorType) and isinstance(right.type,ir.VectorType):
        return math_vectors(module,builder,op,left,right,do_binop)
    raise Exception("BINOP NOT IMPLEMENTED")

def get_idx_1d(module,builder,dims,idx):
    ndims = len(dims)
    nindex = len(idx)
    if ndims != nindex:
        raise Exception("Invalid number of dimensions to index")
    muls = [1]
    for i in range(1,ndims):
        dims = dims[i:]
        mul = 1
        for j in dims:
            mul *= j
        muls.append(mul)
    idx1d = builder.mul(cast(module,builder,idx[0],ir.IntType(32)),ir.Constant(ir.IntType(32),muls[0]))
    for i in range(1,ndims):
        idx1d = builder.add(idx1d,builder.mul(cast(module,builder,idx[i],ir.IntType(32)),ir.Constant(ir.IntType(32),muls[i])))
    return idx1d

def get_idx_1d_array(module,builder,dims,idx):
    ndims = len(dims)
    nindex = len(idx)
    if ndims != nindex:
        raise Exception("Invalid number of dimensions to index")
    muls = [ir.Constant(ir.IntType(32),1)]
    dims = [cast(module,builder,i,ir.IntType(32)) for i in dims]
    for i in range(1,ndims):
        dims = dims[i:]
        mul = dims[0]
        for j in dims[1:]:
            mul = builder.mul(mul,j)
        muls.append(mul)
    idx1d = builder.mul(cast(module,builder,idx[0],ir.IntType(32)),muls[0])
    for i in range(1,ndims):
        idx1d = builder.add(idx1d,builder.mul(cast(module,builder,idx[i],ir.IntType(32)),muls[i]))
    return idx1d

def ArrayIndex(module,builder : ir.IRBuilder,local_vars,array : ir.Constant,index):
    dims = builder.extract_value(array,0)#.gep([ir.Constant(ir.IntType(32),0)]))
    pointer = builder.extract_value(array,1)
    ndims = dims.type.count
    if (len(index) != ndims) and (len(index) != 1):
        raise Exception("Wrong number of indexers")
    if len(index) == 1:
        idx_1d = cast(module,builder,index[0],ir.IntType(32))
    else:
        out_dims = [builder.extract_element(dims,ir.Constant(ir.IntType(32),i)) for i in range(ndims)]
        idx_1d = get_idx_1d_array(module,builder,out_dims,index)
    return builder.gep(pointer,[idx_1d])

class Variable:
    def __init__(self,typ):
        self.type = typ
        self.raw = None
    
    def init(self,module,builder : ir.IRBuilder):
        if type(self.raw) != type(None):
            raise Exception("Var Already Init")
        self.raw = builder.alloca(self.type)
    
    def set(self,module,builder : ir.IRBuilder, val):
        builder.store(val,self.raw)
    
    def get(self,module, builder : ir.IRBuilder):
        return builder.load(self.raw)
    
class VectorIndex:
    def __init__(self,vstore,vector,idx1d,typ):
        self.vstore = vstore
        self.vector = vector
        self.idx1d = idx1d
        self.type = typ
    
    def set(self,module,builder : ir.IRBuilder, val):
        #print(self.vector.get(module,builder))
        new = builder.insert_element(self.vector,val,self.idx1d)
        self.vstore.set(module,builder,new)
        #self.vector.set(module,builder,new)
    
    def get(self,module,builder : ir.IRBuilder):
        return builder.extract_element(self.vector,self.idx1d)
    
class Constant:
    def __init__(self,val):
        self.val = val
    
    def get(self,module,builder):
        return self.val
    
