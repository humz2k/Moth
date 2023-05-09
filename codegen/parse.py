from rply import ParserGenerator
from rply.token import Token
from llvmlite import ir

log = False

class ParserState(object):
    def __init__(self,module_name : str):
        self.module = ir.Module(name=module_name)
        self.global_variables = {}
        self.current_block = []
        self.current_class = None
        self.current_function = None
        self.builder = None
        self.local_variables = []
        self.functions = {}
        self.classes = {}
        self.casts = {}
        self.formatters = {}
        self.break_to = []
        self.next_function_modifiers = []
        printf_ty = ir.FunctionType(ir.IntType(32), [ir.IntType(8).as_pointer()], var_arg=True)
        self.printf = ir.Function(self.module, printf_ty, name="printf")

        exit_ty = ir.FunctionType(ir.VoidType(),[ir.IntType(32)])
        self.exit = ir.Function(self.module,exit_ty,name="exit")
        self.functions["exit_i32"] = self.exit

        strlen_ty = ir.FunctionType(ir.IntType(32),[ir.PointerType(ir.IntType(8))])
        self.strlen = ir.Function(self.module,strlen_ty,"strlen")
        self.functions["__strlen_i8*"] = self.strlen

        powf_ty = ir.FunctionType(ir.FloatType(),[ir.FloatType()])
        self.powf = ir.Function(self.module,powf_ty,"powf")
        self.functions["__powf_float_float"] = self.powf

        pow_ty = ir.FunctionType(ir.DoubleType(),[ir.DoubleType()])
        self.pow = ir.Function(self.module,pow_ty,"pow")
        self.functions["__pow_double_double"] = self.pow

        bohem_init_ty = ir.FunctionType(ir.VoidType(), [], var_arg=True)
        self.bohem_start = ir.Function(self.module, bohem_init_ty, name="bohem_start")

        bohem_alloc_ty = ir.FunctionType(ir.PointerType(ir.IntType(8)), [ir.IntType(32)], var_arg=False)
        self.bohem_alloc = ir.Function(self.module, bohem_alloc_ty, name="bohem_malloc")
        self.functions["alloc_i32"] = self.bohem_alloc

    def get_formatter(self,string):
        if string in self.formatters:
            return self.builder.bitcast(self.formatters[string], ir.IntType(8).as_pointer())
        fmt = string + "\0"
        c_fmt = ir.Constant(ir.ArrayType(ir.IntType(8), len(fmt)),
                            bytearray(fmt.encode("utf8")))
        global_fmt = ir.GlobalVariable(self.module, c_fmt.type, name="formatter" + str(len(list(self.formatters.keys()))))
        global_fmt.linkage = 'internal'
        global_fmt.global_constant = True
        global_fmt.initializer = c_fmt
        self.formatters[string] = global_fmt
        return self.builder.bitcast(self.formatters[string], ir.IntType(8).as_pointer())

    def log(self,text):
        global log
        pass
        if log:
            print(text)

    def throwError(self,err_t,**kwargs):
        if err_t == "FuncNotFound":
            print("FuncNotFound:",kwargs["name"],"with inputs (" + ", ".join([str(i) for i in kwargs["arg_types"]]) + ")")
            exit()
        if err_t == "VarExists":
            print("VarExists:",kwargs["scope"],"var",kwargs["name"],"already exists in this scope")
            exit()
        if err_t == "CastExists":
            print("CastExists:",kwargs["name"],"is already defined")
            exit()
        if err_t == "FuncExists":
            print("FuncExists:",kwargs["name"])
            exit()
        if err_t == "SyntaxErr":
            print("SyntaxErr:",kwargs["msg"])
            exit()

    def gep_hack(self,typ):
        gep_hack = self.builder.gep(ir.Constant(ir.PointerType(typ),None),[ir.Constant(ir.IntType(32),1)])
        return self.builder.ptrtoint(gep_hack,ir.IntType(32))
    
    def allocate(self,typ,n=None,cast_to=None):
        ptr_size = self.gep_hack(typ)
        if isinstance(n,int):
            n = ir.Constant(ir.IntType(32),n)
        if type(n) == type(None):
            size = ptr_size
        else:
            size = self.builder.mul(ptr_size,n)
        alloced = self.builder.call(self.bohem_alloc,[size])
        if type(cast_to) != type(None):
            alloced = self.builder.ptrtoint(alloced,ir.IntType(64))
            alloced = self.builder.inttoptr(alloced,ir.PointerType(cast_to))
        return alloced
    
    def load_array(self,typ,array):
        alloced = self.allocate(typ,len(array),typ)
        #alloced = state.allocate(ir.IntType(32),len(indexes),ir.IntType(32))
        for idx,i in enumerate(array):
            var = self.builder.gep(alloced,[ir.Constant(ir.IntType(32),idx)])
            self.builder.store(i._get(self.builder),var)
        return alloced
    
    def find_global_function(self,name,inputs=[]):
        func_name = name + "_" + "_".join([str(i.type) for i in inputs])
        if func_name in self.functions:
            return self.functions[func_name]
        self.throwError("FuncNotFound",name = name, arg_types = [i.type for i in inputs])

    def call_global_function(self,name,inputs=[]):
        func = self.find_global_function(name,inputs)
        return self.builder.call(func,inputs)
    
    def make_global_variable(self,typ,name):
        if name in self.global_variables:
            self.throwError("VarExists",name=name,typ = typ,scope="global")
        raw = ir.GlobalVariable(self.module,typ,"global."+name)
        raw.linkage = 'internal'
        raw.initializer = None
        var = VariableContainer(raw)
        self.global_variables[name] = var
        return var
    
    def make_new_cast(self,cast_from,cast_to):
        name = str(cast_from) + "->" + str(cast_to)
        func = ir.Function(self.module, ir.FunctionType(cast_to,[cast_from]),name)
        if name in self.casts:
            self.throwError("CastExists",name=name)
        self.casts[name] = func
        return func
    
    def setup_new_cast(self,cast_from,cast_to,var_name):
        modifiers = self.next_function_modifiers
        self.next_function_modifiers = []
        self.current_function = self.make_new_cast(cast_from,cast_to)
        for i in modifiers:
            self.current_function.attributes.add(i)
        self.current_block = [self.current_function.append_basic_block(name="entry")]
        self.builder = ir.IRBuilder(self.current_block[-1])
        self.local_variables = [{}]
        self.local_variables[-1][var_name] = ConstantContainer(self.current_function.args[0])
        return self.builder

    def mangle(self,name,types=[],parent_class = None):
        if type(parent_class) != type(None):
            if isinstance(parent_class,StaticClass):
                name = str(parent_class.name) + "." + name + "_" + "_".join([str(i) for i in types])
            else: 
                name = str(parent_class.raw) + "." + name + "_" + "_".join([str(i) for i in types])
        else:
            if (name == "main"):
                name = "main"
            else:
                name = name + "_" + "_".join([str(i) for i in types])
        return name
    
    def make_new_function(self,name,return_type,input_types=[]):
        modifiers = self.next_function_modifiers
        self.next_function_modifiers = []

        func_type = ir.FunctionType(return_type,input_types)

        name = self.mangle(name,parent_class = self.current_class,types = input_types)
       
        if (type(self.current_class) != type(None)) and (not isinstance(self.current_class,StaticClass)):
            if name in self.current_class.bound_functions:
                self.throwError("FuncExists",name=self.current_class.raw.name + "." + name)
            if self.current_class.type_set == False:
                self.current_class.raw.set_body(*[i[0].raw for i in self.current_class.attrs])
                self.current_class.type_set = True
        else:
            if name in self.functions:
                self.throwError("FuncExists",name=name)
            
        func = ir.Function(self.module,func_type,name)

        if (type(self.current_class) != type(None)) and (not isinstance(self.current_class,StaticClass)):
            self.current_class.bound_functions[name] = func
        else:
            self.functions[name] = func
        return func
    
    def setup_new_function(self,name,return_type,inputs=[]):
        input_types = [i[0].raw for i in inputs]
        self.current_function = self.make_new_function(name,return_type,input_types)

        self.current_block = [self.current_function.append_basic_block(name="entry")]
        self.builder = ir.IRBuilder(self.current_block[-1])
        self.local_variables = [{}]
        for idx,i in enumerate(inputs):
            if len(i) > 2:
                attrs = list(set([j.name for j in i[2:]]))
                for j in attrs:
                    if j == "RESTRICT":
                        self.current_function.args[idx].add_attribute("noalias")
            self.local_variables[-1][i[1].value] = ConstantContainer(self.current_function.args[idx])
        if name == "main" and (type(self.current_class) == type(None)):
            self.builder.call(self.bohem_start,[])
        
        return self.builder
    
    def math_op(self,op,left,right):
        l_val = left._get(self.builder)
        r_val = right._get(self.builder)
        if isinstance(right,LiteralConstantContainer) and op == "__pow__":
            if (right.raw.type == ir.IntType(32)) and (l_val.type in [ir.IntType(8),ir.IntType(32),ir.IntType(64),ir.HalfType(),ir.FloatType(),ir.DoubleType()]):
                out = l_val
                tmp = out
                for i in range(right.raw.constant-1):
                    out = self.call_global_function("__mul__",[out,tmp])
                return out
        return self.call_global_function(op,[l_val,r_val])

class TypeContainer:
    def __init__(self,raw,parent_class = None):
        self.raw = raw
        self.bound_functions = {}
        self.attrs = []
        self.parent_class = parent_class
        self.type_set = False

class ConstantContainer:
    def __init__(self,raw):
        self.raw = raw
    
    def _get(self,builder):
        return self.raw
    
class LiteralConstantContainer(ConstantContainer):
    pass

class VariableContainer:
    def __init__(self,raw):
        self.raw = raw
    
    def _get(self,builder):
        return builder.load(self.raw)
    
    def _set(self,builder,value,casts):
        if value.type != self.raw.type.pointee:
            cast_name = str(value.type) + "->" + str(self.raw.type.pointee)
            if not cast_name in casts:
                raise Exception("No casting rule " + cast_name + " exists")
            value = builder.call(casts[cast_name],[value])
        return builder.store(value,self.raw)

class StaticClass:
    def __init__(self,name):
        self.name = name

def get_parser(filename="tokens.txt"):
    with open(filename,"r") as f:
        tokens = [i.split()[0] for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)] + ["CLASS_NAME","FUNCTION_NAME","FUNCTION_TEMPLATE_NAME","STATIC_CLASS_NAME"]
    if "IGNORE" in tokens:
        tokens.remove("IGNORE")
    pg = ParserGenerator(tokens, precedence=[
        ('left', ['PLUS', 'MINUS']),
        ('left', ['STAR', 'SLASH']),
        ('left', ['PERCENT']),
        ('left', ['STARSTAR']),
        ('left', ['EQUAL', 'NOT_EQUAL','GREATER','LESS','GREATER_OR_EQUAL','LESS_OR_EQUAL']),
        ('left', ['AMP', 'VERT','HAT','TILDE','LEFT_SHIFT','RIGHT_SHIFT']),
        ('left', ['AND', 'OR']),
        ('left', ['NOT']),
        ('left', ['BACKSLASH']),
        ('left', ['PERIOD']),
        ('left',["OPEN_SQUARE"])
    ])

    @pg.production('program : cast_def')
    @pg.production('program : function')
    @pg.production('program : class')
    @pg.production('program : global_def')
    @pg.production('program : modifier')
    def program(state,p):
        state.log('program : global_def|cast_def|function|class')
    
    @pg.production('program : program global_def')
    @pg.production('program : program cast_def')
    @pg.production('program : program class')
    @pg.production('program : program function')
    @pg.production('program : program modifier')
    def cont_program(state,p):
        state.log('program : program global_def|cast_def|function|class')

    @pg.production('global_def : type IDENTIFIER SEMI_COLON')
    def global_def(state,p):
        state.log('global_def : type IDENTIFIER SEMI_COLON')
        return state.make_global_variable(p[0].raw,p[1].value)
    
    @pg.production('class_open : CLASS CLASS_NAME COLON OPEN_CURL')
    @pg.production('class_open : CLASS CLASS_NAME OPEN_PAREN IDENTIFIER CLOSE_PAREN COLON OPEN_CURL')
    def class_open(state,p):
        state.log('class_open : CLASS CLASS_NAME COLON OPEN_CURL')
        if len(p) == 4:
            _,class_name,_,_ = p
        else:
            _,class_name,_,inherits,_,_,_ = p
        if class_name.value in state.classes:
            raise Exception("Class " + class_name.value + " already exists")
        state.current_class = TypeContainer(ir.global_context.get_identified_type(class_name.value))
        state.classes[class_name.value] = state.current_class

    @pg.production('class_open : CLASS STATIC_CLASS_NAME OPEN_PAREN IDENTIFIER CLOSE_PAREN COLON OPEN_CURL')
    def class_open(state,p):
        state.log('class_open : CLASS STATIC_CLASS_NAME OPEN_PAREN IDENTIFIER CLOSE_PAREN COLON OPEN_CURL')
        _,class_name,_,inherits,_,_,_ = p
        if class_name.value in state.classes:
            raise Exception("Class " + class_name.value + " already exists")
        state.current_class = StaticClass(class_name.value)
        state.classes[class_name.value] = state.current_class
    
    @pg.production('class_open : class_open class_def')
    @pg.production('class_open : class_open function')
    @pg.production('class_open : class_open modifier')
    def pass_class_def(state,p):
        state.log('class_open : class_open class_def|function')

    @pg.production('modifier : AT INLINE SEMI_COLON')
    def pass_modifier(state : ParserState,p):
        state.log('modifier : AT INLINE SEMI_COLON')
        modifiers = {"INLINE": "alwaysinline"}
        state.next_function_modifiers.append(modifiers[p[1].name])

    @pg.production('class : class_open CLOSE_CURL')
    def end_class(state,p):
        #print([i[0].raw for i in state.current_class.attrs])
        if isinstance(state.current_class,StaticClass):
            state.current_class = None
            return
        if state.current_class.type_set == False:
            state.current_class.raw.set_body(*[i[0].raw for i in state.current_class.attrs])
            state.current_class.type_set = True
        state.current_class = None

    @pg.production('class_def : type IDENTIFIER SEMI_COLON')
    def class_def(state : ParserState,p):
        state.log('class_def : type IDENTIFIER SEMI_COLON')
        if isinstance(state.current_class,StaticClass):
            return state.make_global_variable(p[0].raw,state.current_class.name + "." + p[1].value)
        if state.current_class.type_set == True:
            state.throwError("SyntaxErr",msg="Class definitions need to be above all function definitions")
        if p[1].value in state.current_class.attrs:
            raise Exception("Class attribute " + p[1].value + " already exists")
        state.current_class.attrs.append((p[0],p[1].value))

    @pg.production('cast_def_open : DEF CAST type OPEN_PAREN type IDENTIFIER CLOSE_PAREN COLON OPEN_CURL')
    def cast_def_open(state,p):
        state.log('cast_def_open : DEF CAST type OPEN_PAREN type IDENTIFIER CLOSE_PAREN COLON OPEN_CURL')
        _,_,cast_to,_,cast_from,var_name,_,_,_ = p
        return state.setup_new_cast(cast_from.raw,cast_to.raw,var_name.value)
    
    @pg.production('cast_def_open : cast_def_open line')
    def pass_line(state,p):
        state.log('cast_def_open : cast_def_open line')
    
    @pg.production('cast_def : cast_def_open CLOSE_CURL')
    def finish_cast(state,p):
        state.log('cast_def : cast_def_open CLOSE_CURL')
    
    @pg.production('func_def_inputs_open : OPEN_PAREN type IDENTIFIER')
    @pg.production('func_def_inputs_open : OPEN_PAREN type RESTRICT IDENTIFIER')
    def func_def_inputs_open(state,p):
        state.log('func_def_inputs_open : OPEN_PAREN type IDENTIFIER')
        if len(p) > 3:
            return [(p[1],p[-1],) + tuple(p[2:-1])]
        return [(p[1],p[2])]

    @pg.production('func_def_inputs_open : func_def_inputs_open COMMA type IDENTIFIER')
    @pg.production('func_def_inputs_open : func_def_inputs_open COMMA type RESTRICT IDENTIFIER')
    def func_def_inputs_cont(state,p):
        state.log('func_def_inputs_open : func_def_inputs_open COMMA type IDENTIFIER')
        if len(p) > 4:
            return p[0] + [(p[2],p[-1]) + tuple(p[3:-1])]
        return p[0] + [(p[2],p[3])]
    
    @pg.production('func_def_inputs : func_def_inputs_open CLOSE_PAREN')
    def func_def_inputs(state,p):
        state.log('func_def_inputs : func_def_inputs_open CLOSE_PAREN')
        return p[0]
    
    @pg.production('function_def_open : DEF type FUNCTION_NAME func_def_inputs COLON OPEN_CURL')
    @pg.production('function_def_open : DEF type FUNCTION_NAME OPEN_PAREN CLOSE_PAREN COLON OPEN_CURL')
    def func_def_open(state,p):
        state.log('function_def_open : DEF type FUNCTION_NAME func_def_inputs COLON OPEN_CURL')
        if len(p) == 7:
            _,return_type,func_name,_,_,_,_, = p
            inputs = []
        else:
            _,return_type,func_name,inputs,_,_ = p
        return state.setup_new_function(func_name.value,return_type.raw,inputs)
    
    @pg.production('function_def_open : function_def_open line')
    def pass_line(state,p):
        state.log('function_def_open : function_def_open line')
    
    @pg.production('function : function_def_open CLOSE_CURL')
    def pass_func(state,p):
        state.log('function : function_def_open CLOSE_CURL')
        if not state.current_block[-1].is_terminated:
            if state.current_function.type.pointee.return_type != ir.VoidType():
                raise Exception("Non-void function does not return a value")
            state.builder.ret_void()

    @pg.production('if_open : IF expression COLON OPEN_CURL')
    def if_open(state,p):
        state.log('if_open : IF expression COLON OPEN_CURL')
        if_true = state.current_function.append_basic_block()
        if_false = state.current_function.append_basic_block()
        after = state.current_function.append_basic_block()
        state.local_variables.append(state.local_variables[-1].copy())
        expr = p[1]._get(state.builder)
        if expr.type != ir.IntType(1):
            cast_name = str(expr.type) + "->" + str(ir.IntType(1))
            if not cast_name in state.casts:
                raise Exception("No casting rule " + cast_name + " exists")
            expr = state.builder.call(state.casts[cast_name],[expr])
        state.builder.cbranch(expr,if_true,if_false)
        state.builder.position_at_start(if_true)
        state.current_block.pop(-1)
        state.current_block.append(after)
        state.current_block.append(if_false)
        state.current_block.append(if_true)
    
    @pg.production('if_open : if_open line')
    def pass_line(state,p):
        state.log('if_open : if_open line')

    @pg.production('else_open : if_open CLOSE_CURL ELSE COLON OPEN_CURL')
    def open_else(state,p):
        state.log('else_open : if_open CLOSE_CURL ELSE COLON OPEN_CURL')
        if_true = state.current_block.pop(-1)
        if not if_true.is_terminated:
            state.builder.branch(state.current_block[-2])
        state.builder.position_at_start(state.current_block[-1])
        state.local_variables.pop(-1)
        state.local_variables.append(state.local_variables[-1].copy())
    
    @pg.production('elif : if_open CLOSE_CURL ELIF')
    def get_elif(state,p):
        state.log('elif : if_open CLOSE_CURL ELIF')
        if_true = state.current_block.pop(-1)
        if_false = state.current_block.pop(-1)
        if not if_true.is_terminated:
            state.builder.branch(state.current_block[-1])
        state.builder.position_at_start(if_false)

    @pg.production('if_open : elif expression COLON OPEN_CURL')
    def open_elif(state,p):
        state.log('if_open : elif expression COLON OPEN_CURL')
        expr = p[1]._get(state.builder)
        if expr.type != ir.IntType(1):
            cast_name = str(expr.type) + "->" + str(ir.IntType(1))
            if not cast_name in state.casts:
                raise Exception("No casting rule " + cast_name + " exists")
            expr = state.builder.call(state.casts[cast_name],[expr])
        if_true_two = state.current_function.append_basic_block()
        if_false_two = state.current_function.append_basic_block()
        state.builder.cbranch(expr,if_true_two,if_false_two)
        state.current_block.append(if_false_two)
        state.current_block.append(if_true_two)
        state.builder.position_at_start(if_true_two)
        state.local_variables.pop(-1)
        state.local_variables.append(state.local_variables[-1].copy())

    @pg.production('else_open : else_open line')
    def pass_line(state,p):
        state.log('else_open : else_open line')

    @pg.production('line : else_open CLOSE_CURL')
    def else_close(state,p):
        state.log('line : else_open CLOSE_CURL')
        if_false = state.current_block.pop(-1)
        if not if_false.is_terminated:
            state.builder.branch(state.current_block[-1])
        state.builder.position_at_start(state.current_block[-1])
        state.local_variables.pop(-1)

    @pg.production('line : if_open CLOSE_CURL')
    def if_close(state,p):
        state.log('line : if_open CLOSE_CURL')
        if_true = state.current_block.pop(-1)
        if_false = state.current_block.pop(-1)
        if not if_true.is_terminated:
            state.builder.branch(state.current_block[-1])
        state.builder.position_at_start(if_false)
        state.builder.branch(state.current_block[-1])
        state.builder.position_at_start(state.current_block[-1])
        state.local_variables.pop(-1)

    @pg.production('for : FOR')
    def for_init(state,p):
        state.log('for : FOR')
        check_condition = state.current_function.append_basic_block()
        loop = state.current_function.append_basic_block()
        after = state.current_function.append_basic_block()
        #state.builder.branch(check_condition)
        #state.builder.position_at_start(check_condition)
        state.current_block.pop(-1)
        state.current_block.append(after)
        state.current_block.append(check_condition)
        state.current_block.append(loop)
        state.local_variables.append(state.local_variables[-1].copy())
        state.break_to.append(after)

    @pg.production('for_open : for expression IN expression COLON OPEN_CURL')
    def for_open(state,p):
        state.log('for_open : for expression IN expression COLON OPEN_CURL')
        loop = state.current_block[-1]
        check_condition = state.current_block[-2]
        after = state.current_block[-3]
        ref_get = p[3]._get(state.builder)
        class_name = ref_get.type.pointee.name
        ref_class = state.classes[class_name]
        iter_get_name = str(ref_class.raw) + ".__iterget___" + str(ir.PointerType(ref_class.raw))
        if not iter_get_name in ref_class.bound_functions:
            raise Exception("Class " + class_name + " is not iterable")
        iter_get = ref_class.bound_functions[iter_get_name]
        iter_next_name = str(ref_class.raw) + ".__iternext___" + str(ir.PointerType(ref_class.raw))
        if not iter_next_name in ref_class.bound_functions:
            raise Exception("Class " + class_name + " is not iterable")
        iter_next = ref_class.bound_functions[iter_next_name]
        iter_check_name = str(ref_class.raw) + ".__itercheck___" + str(ir.PointerType(ref_class.raw))
        if not iter_check_name in ref_class.bound_functions:
            raise Exception("Class " + class_name + " is not iterable")
        iter_check = ref_class.bound_functions[iter_check_name]
        state.builder.call(iter_get,[ref_get])
        state.builder.branch(check_condition)
        state.builder.position_at_start(check_condition)
        cond = state.builder.call(iter_check,[ref_get])
        state.builder.cbranch(cond,loop,after)
        state.builder.position_at_start(loop)
        val = state.builder.call(iter_next,[ref_get])
        p[1]._set(state.builder,val,state.casts)


    @pg.production('for_open : for_open line')
    def pass_line(state,p):
        state.log('for_open : for_open line')

    @pg.production('line : for_open CLOSE_CURL')
    def end_for(state,p):
        state.log('line : for_open CLOSE_CURL')
        loop = state.current_block.pop(-1)
        check_condition = state.current_block.pop(-1)
        after = state.current_block[-1]
        if not loop.is_terminated:
            state.builder.branch(check_condition)
        state.builder.position_at_start(after)
        state.break_to.pop(-1)
        state.local_variables.pop(-1)

    @pg.production('while : WHILE')
    def while_init(state,p):
        state.log('while : WHILE')
        check_condition = state.current_function.append_basic_block()
        loop = state.current_function.append_basic_block()
        after = state.current_function.append_basic_block()
        state.builder.branch(check_condition)
        state.builder.position_at_start(check_condition)
        state.current_block.pop(-1)
        state.current_block.append(after)
        state.current_block.append(check_condition)
        state.current_block.append(loop)
        state.local_variables.append(state.local_variables[-1].copy())
        state.break_to.append(after)
    
    @pg.production('while_open : while expression COLON OPEN_CURL')
    def while_open(state,p):
        state.log('while_open : while expression COLON OPEN_CURL')
        expr = p[1]._get(state.builder)
        if expr.type != ir.IntType(1):
            cast_name = str(expr.type) + "->" + str(ir.IntType(1))
            if not cast_name in state.casts:
                raise Exception("No casting rule " + cast_name + " exists")
            expr = state.builder.call(state.casts[cast_name],[expr])
        state.builder.cbranch(expr,state.current_block[-1],state.current_block[-3])
        state.builder.position_at_start(state.current_block[-1])
    
    @pg.production('while_open : while_open line')
    def pass_line(state,p):
        state.log('while_open : while_open line')

    @pg.production('line : while_open CLOSE_CURL')
    def end_while(state,p):
        state.log('line : while_open CLOSE_CURL')
        loop = state.current_block.pop(-1)
        check_condition = state.current_block.pop(-1)
        if not loop.is_terminated:
            state.builder.branch(check_condition)
        state.builder.position_at_start(state.current_block[-1])
        state.break_to.pop(-1)
        state.local_variables.pop(-1)


    @pg.production('line : assign SEMI_COLON')
    @pg.production('line : expression SEMI_COLON')
    def pass_line(state,p):
        return p[0]
    
    @pg.production('line : RETURN expression SEMI_COLON')
    @pg.production('line : RETURN SEMI_COLON')
    def get_return(state,p):
        state.log('line : RETURN ... SEMI_COLON')
        if state.current_block[-1].is_terminated:
            raise Exception("Current block is terminated")
        return_type = state.current_function.type.pointee.return_type
        if len(p) == 3:
            expr = p[1]._get(state.builder)
            
            if return_type != expr.type:
                print(return_type,expr.type)
                exit()
                raise Exception("Function returns wrong type")
            return state.builder.ret(expr)
        if return_type != ir.VoidType():
            raise Exception("Function returns wrong type")
        return state.builder.ret_void()
    
    @pg.production('line : PASS SEMI_COLON')
    def get_pass(state,p):
        state.log('line : PASS SEMI_COLON')
        return ConstantContainer(state.builder.add(ir.Constant(ir.IntType(32),0),ir.Constant(ir.IntType(32),0)))
    
    @pg.production('line : BREAK SEMI_COLON')
    def get_break(state,p):
        state.log('line : BREAK SEMI_COLON')
        if len(state.break_to) != 0:
            if not state.current_block[-1].is_terminated:
                return state.builder.branch(state.break_to[-1])
        raise Exception("Break but not in loop")

    @pg.production('assign : expression ASSIGN expression')
    def assign(state,p):
        state.log('assign : expression ASSIGN expression')
        if isinstance(p[0],VariableContainer):
            expr = p[2]
            get = expr._get(state.builder)
            var = p[0]
            return var._set(state.builder,get,state.casts)
        raise Exception("Can't assign to constant")
    
    @pg.production('expression : TRUNC_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : TRUNC_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
        return ConstantContainer(state.builder.trunc(p[2]._get(state.builder),p[4].raw))
    
    @pg.production('expression : FTRUNC_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : FTRUNC_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
        return ConstantContainer(state.builder.fptrunc(p[2]._get(state.builder),p[4].raw))
    
    @pg.production('expression : EXT_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : EXT_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
        return ConstantContainer(state.builder.sext(p[2]._get(state.builder),p[4].raw))
    
    @pg.production('expression : FEXT_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : FEXT_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
        return ConstantContainer(state.builder.fpext(p[2]._get(state.builder),p[4].raw))
    
    @pg.production('expression : FTOI_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : FTOI_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
        return ConstantContainer(state.builder.fptosi(p[2]._get(state.builder),p[4].raw))
    
    @pg.production('expression : ITOF_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : ITOF_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
        return ConstantContainer(state.builder.sitofp(p[2]._get(state.builder),p[4].raw))
    
    @pg.production('expression : SHL_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : SHL_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.shl(p[2]._get(state.builder),p[4]._get(state.builder)))
    
    @pg.production('expression : SHR_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : SHR_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.ashr(p[2]._get(state.builder),p[4]._get(state.builder)))
    
    @pg.production('expression : ADD_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : ADD_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.add(p[2]._get(state.builder),p[4]._get(state.builder)))
    
    @pg.production('expression : SUB_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : SUB_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.sub(p[2]._get(state.builder),p[4]._get(state.builder)))
    
    @pg.production('expression : MUL_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : MUL_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.mul(p[2]._get(state.builder),p[4]._get(state.builder)))
    
    @pg.production('expression : DIV_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : DIV_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.sdiv(p[2]._get(state.builder),p[4]._get(state.builder)))
    
    @pg.production('expression : REM_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : REM_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.srem(p[2]._get(state.builder),p[4]._get(state.builder)))
    
    @pg.production('expression : AND_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : AND_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.and_(p[2]._get(state.builder),p[4]._get(state.builder)))
    
    @pg.production('expression : OR_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : OR_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.or_(p[2]._get(state.builder),p[4]._get(state.builder)))
    
    @pg.production('expression : XOR_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : XOR_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.xor(p[2]._get(state.builder),p[4]._get(state.builder)))

    @pg.production('expression : FADD_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : FADD_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.fadd(p[2]._get(state.builder),p[4]._get(state.builder)))
    
    @pg.production('expression : FSUB_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : FSUB_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.fsub(p[2]._get(state.builder),p[4]._get(state.builder)))
    
    @pg.production('expression : FMUL_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : FMUL_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.fmul(p[2]._get(state.builder),p[4]._get(state.builder)))
    
    @pg.production('expression : FDIV_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : FDIV_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.fdiv(p[2]._get(state.builder),p[4]._get(state.builder)))
    
    @pg.production('expression : FREM_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : FREM_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.frem(p[2]._get(state.builder),p[4]._get(state.builder)))
    
    @pg.production('expression : FNEG_INTR OPEN_PAREN expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : FNEG_INTR OPEN_PAREN expression CLOSE_PAREN')
        return ConstantContainer(state.builder.fneg(p[2]._get(state.builder)))
    
    @pg.production('expression : NEG_INTR OPEN_PAREN expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : NEG_INTR OPEN_PAREN expression CLOSE_PAREN')
        return ConstantContainer(state.builder.neg(p[2]._get(state.builder)))
    
    @pg.production('expression : NOT_INTR OPEN_PAREN expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : NOT_INTR OPEN_PAREN expression CLOSE_PAREN')
        return ConstantContainer(state.builder.not_(p[2]._get(state.builder)))
    
    @pg.production('expression : PRINT_INTR OPEN_PAREN STRING COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : PRINT_INTR OPEN_PAREN STRING COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.call(state.printf,[state.get_formatter(p[2].value[1:-1]),p[4]._get(state.builder)]))
    
    @pg.production('expression : PRINT_INTR OPEN_PAREN STRING CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : PRINT_INTR OPEN_PAREN STRING CLOSE_PAREN')
        return ConstantContainer(state.builder.call(state.printf,[state.get_formatter(p[2].value[1:-1])]))
    
    @pg.production('expression : CMP_INTR OPEN_PAREN EQUAL COMMA expression COMMA expression CLOSE_PAREN')
    @pg.production('expression : CMP_INTR OPEN_PAREN NOT_EQUAL COMMA expression COMMA expression CLOSE_PAREN')
    @pg.production('expression : CMP_INTR OPEN_PAREN GREATER COMMA expression COMMA expression CLOSE_PAREN')
    @pg.production('expression : CMP_INTR OPEN_PAREN LESS COMMA expression COMMA expression CLOSE_PAREN')
    @pg.production('expression : CMP_INTR OPEN_PAREN GREATER_OR_EQUAL COMMA expression COMMA expression CLOSE_PAREN')
    @pg.production('expression : CMP_INTR OPEN_PAREN LESS_OR_EQUAL COMMA expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : CMP_INTR OPEN_PAREN OP COMMA expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.icmp_signed(p[2].value,p[4]._get(state.builder),p[6]._get(state.builder)))
    
    @pg.production('expression : FCMP_INTR OPEN_PAREN EQUAL COMMA expression COMMA expression CLOSE_PAREN')
    @pg.production('expression : FCMP_INTR OPEN_PAREN NOT_EQUAL COMMA expression COMMA expression CLOSE_PAREN')
    @pg.production('expression : FCMP_INTR OPEN_PAREN GREATER COMMA expression COMMA expression CLOSE_PAREN')
    @pg.production('expression : FCMP_INTR OPEN_PAREN LESS COMMA expression COMMA expression CLOSE_PAREN')
    @pg.production('expression : FCMP_INTR OPEN_PAREN GREATER_OR_EQUAL COMMA expression COMMA expression CLOSE_PAREN')
    @pg.production('expression : FCMP_INTR OPEN_PAREN LESS_OR_EQUAL COMMA expression COMMA expression CLOSE_PAREN')
    def trunc(state,p):
        state.log('expression : FCMP_INTR OPEN_PAREN OP COMMA expression COMMA expression CLOSE_PAREN')
        return ConstantContainer(state.builder.fcmp_ordered(p[2].value,p[4]._get(state.builder),p[6]._get(state.builder)))
    
    @pg.production('expression : PTOI_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
    def ptoi(state,p):
        state.log('expression : PTOI_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
        return ConstantContainer(state.builder.ptrtoint(p[2]._get(state.builder),p[4].raw))
    
    @pg.production('expression : ITOP_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
    def ptoi(state,p):
        state.log('expression : ITOP_INTR OPEN_PAREN expression COMMA type CLOSE_PAREN')
        return ConstantContainer(state.builder.inttoptr(p[2]._get(state.builder),p[4].raw))
    
    @pg.production('expression : GEP_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def ptoi(state,p):
        state.log('expression : GEP_INTR OPEN_PAREN expression COMMA expression CLOSE_PAREN')
        return VariableContainer(state.builder.gep(p[2]._get(state.builder),[p[4]._get(state.builder)]))
    
    @pg.production('expression : SIZEOF OPEN_PAREN type CLOSE_PAREN')
    def get_sizeof(state,p):
        state.log('expression : SIZEOF OPEN_PAREN type CLOSE_PAREN')
        return ConstantContainer(state.gep_hack(p[2].raw))

    @pg.production('expression : PRINT OPEN_PAREN CLOSE_PAREN')
    def print_empty(state,p):
        state.log('expression : PRINT OPEN_PAREN CLOSE_PAREN')
        return ConstantContainer(state.builder.call(state.printf,[state.get_formatter("\n")]))
    
    @pg.production('expression : STATIC_CLASS_NAME PERIOD IDENTIFIER')
    def static_ref(state : ParserState,p):
        name = p[0].value + "." + p[2].value
        if name in state.global_variables:
            return state.global_variables[name]
        raise Exception("Static Var " + name + " doesn't exist")

    @pg.production('expression : expression PERIOD IDENTIFIER')
    def reference(state,p):
        state.log('expression : expression PERIOD IDENTIFIER')
        reference,_,var_name = p
        ref_get = reference._get(state.builder)
        class_name = ref_get.type.pointee.name
        ref_class = state.classes[class_name]
        attr_names = [i[1] for i in ref_class.attrs]
        if not p[2].value in attr_names:
            raise Exception("Attribute " + p[2].value + " doesn't exist in class " + class_name)
        var = VariableContainer(state.builder.gep(ref_get,[ir.Constant(ir.IntType(32),0),ir.Constant(ir.IntType(32),attr_names.index(p[2].value))]))
        return var
    
    @pg.production('open_index : expression OPEN_SQUARE expression')
    def open_index(state,p):
        state.log('open_index : expression OPEN_SQUARE expression')
        return [p[0],p[2]]
    
    @pg.production('open_index : open_index COMMA expression')
    def cont_index(state,p):
        state.log('open_index : open_index COMMA expression')
        return p[0] + [p[2]]

    @pg.production('expression : open_index CLOSE_SQUARE')
    def reference(state,p):
        state.log('expression : open_index CLOSE_SQUARE')
        reference = p[0][0]
        indexes = p[0][1:]
        ref_get = reference._get(state.builder)
        class_name = ref_get.type.pointee.name
        ref_class = state.classes[class_name]
        func_name = str(ref_class.raw) + "." + "__index___" + str(ir.PointerType(ref_class.raw)) + "_" + str(ir.PointerType(ir.IntType(32))) + "_" + str(ir.IntType(32))
        if not func_name in ref_class.bound_functions:
            raise Exception("Class " + class_name + " is not indexable")
        alloced = state.load_array(ir.IntType(32),indexes)
        index = state.builder.call(ref_class.bound_functions[func_name],[ref_get,alloced,ir.Constant(ir.IntType(32),len(indexes))])
        var = VariableContainer(index)
        #print(var._get(state.builder).type)
        return var
        #return var
    
    @pg.production('expression : NEW CLASS_NAME OPEN_PAREN CLOSE_PAREN')
    def new_class(state,p):
        state.log('expression : NEW CLASS_NAME')
        if not p[1].value in state.classes:
            raise Exception("Class " + p[1].value + " doesn't exist")
        my_class = state.classes[p[1].value]
        alloced = state.allocate(my_class.raw,cast_to = my_class.raw)
        init_func = str(my_class.raw) + "." + "__init__" + "_" + str(ir.PointerType(my_class.raw))
        if init_func in my_class.bound_functions:
            state.builder.call(my_class.bound_functions[init_func],[alloced])
        return ConstantContainer(alloced)
    
    @pg.production('new_open : NEW CLASS_NAME OPEN_PAREN expression')
    def new_open(state,p):
        state.log('new_open : NEW CLASS_NAME OPEN_PAREN expression')
        return [p[1],p[3]]
    
    @pg.production('new_open : new_open COMMA expression')
    def new_cont(state,p):
        state.log('new_open : new_open COMMA expression')
        return p[0] + [p[2]]
    
    @pg.production('expression : new_open CLOSE_PAREN')
    def new_class(state,p):
        state.log('expression : new_open CLOSE_PAREN')
        class_name = p[0][0]
        inputs = p[0][1:]
        if not class_name.value in state.classes:
            raise Exception("Class " + p[1].value + " doesn't exist")
        my_class = state.classes[class_name.value]
        alloced = state.allocate(my_class.raw,cast_to = my_class.raw)
        inputs = [i._get(state.builder) for i in inputs]
        init_func = str(my_class.raw) + "." + "__init__" + "_" + str(ir.PointerType(my_class.raw)) + "_" + "_".join([str(i.type) for i in inputs])
        if not init_func in my_class.bound_functions:
            raise Exception("No matching initialize for inputs " + ",".join(str([i.type]) for i in inputs))
        state.builder.call(my_class.bound_functions[init_func],[alloced] + inputs)
        return ConstantContainer(alloced)

    @pg.production('open_tuple : OPEN_PAREN expression COMMA')
    def open_tuple(state,p):
        state.log('open_tuple : OPEN_PAREN expression COMMA')
        return [p[1]]
    
    @pg.production('cont_tuple : open_tuple expression')
    def cont_tuple(state,p):
        state.log('cont_tuple : open_tuple expression')
        return p[0] + [p[1]]
    
    @pg.production('cont_tuple : cont_tuple COMMA expression')
    def cont_tuple(state,p):
        state.log('cont_tuple : cont_tuple COMMA expression')
        return p[0] + [p[2]]
    
    @pg.production('expression : open_tuple CLOSE_PAREN')
    @pg.production('expression : cont_tuple CLOSE_PAREN')
    def tuple_literal(state : ParserState,p):
        inputs = [i._get(state.builder) for i in p[0]]
        tuple_t = inputs[0].type
        for i in inputs:
            if i.type != tuple_t:
                raise Exception("Can't make tuple literal with multiple types")
        inputs = [ConstantContainer(i) for i in inputs]
        int_ptr = state.load_array(tuple_t,inputs)
        n = ir.Constant(ir.IntType(32),len(inputs))
        name = "_tuple_"
        type_dict = {ir.IntType(1): "bool", ir.IntType(8): "char", ir.IntType(32) : "int", ir.IntType(64) : "long"}
        if tuple_t in type_dict:
            name += type_dict[tuple_t] + "_"
        else:
            name += str(tuple_t) + "_"
        my_class = state.classes[name]
        alloced = state.allocate(my_class.raw,cast_to=my_class.raw)
        #print(alloced)
        init_func = str(my_class.raw) + "." + "__init__" + "_" + str(ir.PointerType(my_class.raw)) + "_" + "_".join([str(i) for i in [ir.PointerType(tuple_t),ir.IntType(32)]])
        if not init_func in my_class.bound_functions:
            raise Exception("No matching initialize for inputs " + ",".join(str([i]) for i in [ir.PointerType(tuple_t),ir.IntType(32)]))
        state.builder.call(my_class.bound_functions[init_func],[alloced,int_ptr,n])
        return ConstantContainer(alloced)
    
    @pg.production('expression : OPEN_PAREN COMMA CLOSE_PAREN')
    def empty_tuple(state : ParserState,p):
        return LiteralConstantContainer(ir.Constant(ir.PointerType(ir.IntType(8)),None))

    @pg.production('print_open : PRINT OPEN_PAREN expression')
    def print_one(state,p):
        state.log('print_open : PRINT OPEN_PAREN expression')
        expr = p[2]._get(state.builder)
        name = "__print__" + "_" + str(expr.type)
        if not name in state.functions:
            #try:
            #reference = p[2]
            try:
                ref_get = expr
                class_name = ref_get.type.pointee.name
                ref_class = state.classes[class_name]
                name = str(ref_class.raw) + "." + "__print___" + str(ir.PointerType(ref_class.raw))
                return ConstantContainer(state.builder.call(ref_class.bound_functions[name],[expr]))
            except:
                pass
            #except:
            #    pass
            raise Exception("No rule to print " + str(expr.type))
        return ConstantContainer(state.builder.call(state.functions[name],[expr]))
    
    @pg.production('print_open : print_open COMMA expression')
    def print_next(state,p):
        state.log('print_open : print_open COMMA expression')
        expr = p[2]._get(state.builder)
        name = "__print__" + "_" + str(expr.type)
        if not name in state.functions:
            raise Exception("No rule to print " + str(expr.type))
        ConstantContainer(state.builder.call(state.printf,[state.get_formatter(r" ")]))
        return ConstantContainer(state.builder.call(state.functions[name],[expr]))
    
    @pg.production('expression : print_open CLOSE_PAREN')
    def get_print(state,p):
        state.log('expression : print_open CLOSE_PAREN')
        return ConstantContainer(state.builder.call(state.printf,[state.get_formatter("\n")]))
    
    @pg.production('expression : print_open COMMA NONEWLN CLOSE_PAREN')
    def get_print(state,p):
        state.log('expression : print_open COMMA NONEWLN CLOSE_PAREN')
        return
        
    
    @pg.production('expression : type OPEN_PAREN expression CLOSE_PAREN')
    def cast(state,p):
        state.log('expression : type OPEN_PAREN expression CLOSE_PAREN')
        cast_to,_,val,_ = p
        cast_from = val._get(state.builder).type
        cast_to = cast_to.raw
        if cast_to == cast_from:
            return p[2]
        name = str(cast_from) + "->" + str(cast_to)
        if not name in state.casts:
            raise Exception("No cast " + name + " exists")
        return ConstantContainer(state.builder.call(state.casts[name],[val._get(state.builder)]))
    
    @pg.production('expression : expression PERIOD FUNCTION_NAME OPEN_PAREN CLOSE_PAREN')
    def ref_func_call(state,p):
        state.log('expression : expression PERIOD FUNCTION_NAME OPEN_PAREN CLOSE_PAREN')
        ref_get = p[0]._get(state.builder)
        class_name = ref_get.type.pointee.name
        ref_class = state.classes[class_name]
        func_name = str(ref_class.raw) + "." + p[2].value + "_" + str(ir.PointerType(ref_class.raw))
        if not func_name in ref_class.bound_functions:
            raise Exception("Class " + class_name + " has no function " + p[2].value)
        return ConstantContainer(state.builder.call(ref_class.bound_functions[func_name],[ref_get]))
    
    @pg.production('expression : STATIC_CLASS_NAME PERIOD FUNCTION_NAME OPEN_PAREN CLOSE_PAREN')
    def ref_func_call(state,p):
        state.log('expression : STATIC_CLASS_NAME PERIOD FUNCTION_NAME OPEN_PAREN CLOSE_PAREN')
        func_name = str(p[0].value) + "." + p[2].value
        return ConstantContainer(state.call_global_function(func_name,[]))
    
    @pg.production('static_ref_func_call_open : STATIC_CLASS_NAME PERIOD FUNCTION_NAME OPEN_PAREN expression')
    def ref_func_call_open(state,p):
        state.log('ref_func_call_open : expression PERIOD FUNCTION_NAME OPEN_PAREN expression')
        return [p[0],p[2],p[4]]
    
    @pg.production('static_ref_func_call_open : static_ref_func_call_open COMMA expression')
    def ref_func_call_cont(state,p):
        return p[0] + [p[2]]

    @pg.production('expression : static_ref_func_call_open CLOSE_PAREN')
    def ref_func_call(state : ParserState,p):
        state.log('expression : static_ref_func_call_open CLOSE_PAREN')
        inputs = [i._get(state.builder) for i in p[0][2:]]
        func_name = str(p[0][0].value) + "." + p[0][1].value
        return ConstantContainer(state.call_global_function(func_name,inputs))

    @pg.production('ref_func_call_open : expression PERIOD FUNCTION_NAME OPEN_PAREN expression')
    def ref_func_call_open(state,p):
        state.log('ref_func_call_open : expression PERIOD FUNCTION_NAME OPEN_PAREN expression')
        return [p[0],p[2],p[4]]
    
    @pg.production('ref_func_call_open : ref_func_call_open COMMA expression')
    def ref_func_call_cont(state,p):
        return p[0] + [p[2]]
    
    @pg.production('expression : ref_func_call_open CLOSE_PAREN')
    def ref_func_call(state,p):
        state.log('expression : ref_func_call_open CLOSE_PAREN')
        ref_get = p[0][0]._get(state.builder)
        class_name = ref_get.type.pointee.name
        ref_class = state.classes[class_name]
        func_name_token = p[0][1]
        inputs = [i._get(state.builder) for i in p[0][2:]]
        func_name = str(ref_class.raw) + "." + func_name_token.value + "_" + str(ir.PointerType(ref_class.raw)) + "_" + "_".join([str(i.type) for i in inputs])
        if not func_name in ref_class.bound_functions:
            raise Exception("Class " + class_name + " has no function " + p[2].value)
        return ConstantContainer(state.builder.call(ref_class.bound_functions[func_name],[ref_get] + inputs))

    @pg.production('expression : FUNCTION_NAME OPEN_PAREN CLOSE_PAREN')
    def function_call(state,p):
        state.log('expression : FUNCTION_NAME OPEN_PAREN CLOSE_PAREN')
        name = p[0].value + "_"
        if not name in state.functions:
            raise Exception("Function " + p[0].value + " with no inputs doesn't exist")
        return ConstantContainer(state.builder.call(state.functions[name],[]))
    
    @pg.production('func_call_open : FUNCTION_NAME OPEN_PAREN expression')
    def func_call_open(state,p):
        state.log('func_call_open : FUNCTION_NAME OPEN_PAREN expression')
        return [p[0],p[2]]
    
    @pg.production('func_call_open : func_call_open COMMA expression')
    def func_call_cont(state,p):
        state.log('func_call_open : func_call_open COMMA expression')
        return p[0] + [p[2]]
    
    @pg.production('expression : func_call_open CLOSE_PAREN')
    def func_call(state,p):
        state.log('expression : func_call_open CLOSE_PAREN')
        token_name = p[0][0]
        inputs = p[0][1:]
        input_exprs = [i._get(state.builder) for i in inputs]
        name = token_name.value + "_" + "_".join([str(i.type) for i in input_exprs])
        if not name in state.functions:
            raise Exception("Function " + token_name.value + " with no inputs " + ",".join([str(i.type) for i in input_exprs]) + " doesn't exist")
        return ConstantContainer(state.builder.call(state.functions[name],input_exprs))
        
    @pg.production('expression : OPEN_PAREN expression CLOSE_PAREN')
    def pass_expr(state,p):
        state.log('expression : OPEN_PAREN expression CLOSE_PAREN')
        return p[1]
    
    @pg.production('assign : expression PLUS_EQUAL expression')
    @pg.production('assign : expression MINUS_EQUAL expression')
    @pg.production('assign : expression STARSTAR_EQUAL expression')
    @pg.production('assign : expression STAR_EQUAL expression')
    @pg.production('assign : expression SLASH_EQUAL expression')
    @pg.production('assign : expression PERCENT_EQUAL expression')
    def inc_assign(state : ParserState,p):
        state.log('assign : expression PLUS_EQUAL expression')
        op_dict = {
            "PLUS_EQUAL": "__add__",
            "MINUS_EQUAL": "__sub__",
            "STAR_EQUAL": "__mul__",
            "STARSTAR_EQUAL": "__pow__",
            "SLASH_EQUAL": "__div__",
            "PERCENT_EQUAL": "__mod__"
        }
        left = p[0]
        right = p[2]
        return p[0]._set(state.builder,state.math_op(op_dict[p[1].name],left,right),state.casts)
    
    @pg.production('expression : expression PLUS_PLUS')
    @pg.production('expression : expression MINUS_MINUS')
    def inc_dec(state : ParserState,p):
        state.log('expression : expression PLUS_PLUS')
        op_dict = {
            "PLUS_PLUS": "__postincr__",
            "MINUS_MINUS": "__postdecr__"
        }
        val = p[0]._get(state.builder)
        p[0]._set(state.builder,state.call_global_function(op_dict[p[1].name],[val]),state.casts)
        return p[0]

    @pg.production('expression : expression RIGHT_SHIFT expression')
    @pg.production('expression : expression LEFT_SHIFT expression')
    @pg.production('expression : expression PLUS expression')
    @pg.production('expression : expression MINUS expression')
    @pg.production('expression : expression STARSTAR expression')
    @pg.production('expression : expression STAR expression')
    @pg.production('expression : expression SLASH expression')
    @pg.production('expression : expression PERCENT expression')
    @pg.production('expression : expression EQUAL expression')
    @pg.production('expression : expression NOT_EQUAL expression')
    @pg.production('expression : expression GREATER expression')
    @pg.production('expression : expression LESS expression')
    @pg.production('expression : expression GREATER_OR_EQUAL expression')
    @pg.production('expression : expression LESS_OR_EQUAL expression')
    @pg.production('expression : expression AND expression')
    @pg.production('expression : expression OR expression')
    @pg.production('expression : expression AMP expression')
    @pg.production('expression : expression VERT expression')
    @pg.production('expression : expression HAT expression')
    def binop(state,p):
        state.log('expression : expression OP expression')
        op_dict = {
            "RIGHT_SHIFT": "__shr__",
            "LEFT_SHIFT": "__shl__",
            "PLUS": "__add__",
            "MINUS": "__sub__",
            "STAR": "__mul__",
            "STARSTAR": "__pow__",
            "SLASH": "__div__",
            "PERCENT": "__mod__",
            "EQUAL": "__eq__",
            "NOT_EQUAL": "__neq__",
            "GREATER": "__gr__",
            "LESS": "__ls__",
            "GREATER_OR_EQUAL": "__geq__",
            "LESS_OR_EQUAL": "__leq__",
            "AND": "__and__",
            "OR": "__or__",
            "AMP": "__bitand__",
            "VERT": "__bitor__",
            "HAT": "__bitxor__"
        }
        left = p[0]
        right = p[2]
        return ConstantContainer(state.math_op(op_dict[p[1].name],left,right))

    @pg.production('expression : NUMBER')
    def constant(state,p):
        state.log('expression : NUMBER')
        if "." in p[0].value:
            return LiteralConstantContainer(ir.Constant(ir.FloatType(),float(p[0].value)))
        return LiteralConstantContainer(ir.Constant(ir.IntType(32),int(p[0].value)))
    
    @pg.production('expression : CHAR')
    def constant(state,p):
        state.log('expression : CHAR')
        return LiteralConstantContainer(ir.Constant(ir.IntType(8),ord(p[0].value[1:-1])))
    
    @pg.production('expression : TRUE')
    def constant(state,p):
        state.log('expression : TRUE')
        return LiteralConstantContainer(ir.Constant(ir.IntType(1),1))
    
    @pg.production('expression : FALSE')
    def constant(state,p):
        state.log('expression : FALSE')
        return LiteralConstantContainer(ir.Constant(ir.IntType(1),0))

    @pg.production('expression : type IDENTIFIER')
    def declaration(state,p):
        state.log('expression : type IDENTIFIER')
        var = VariableContainer(state.builder.alloca(p[0].raw))
        if p[1].value in state.local_variables[-1]:
            raise Exception("Variable " + p[1].value + " already exists")
        state.local_variables[-1][p[1].value] = var
        return var
    
    @pg.production('expression : TYPE_QUERY OPEN_PAREN expression CLOSE_PAREN')
    def type_query(state : ParserState,p):
        state.log('expression : TYPE_QUERY OPEN_PAREN expression CLOSE_PAREN')
        val = p[2]._get(state.builder)
        return ConstantContainer(state.get_formatter(str(val.type)))
    
    @pg.production('expression : TYPE_QUERY OPEN_PAREN type CLOSE_PAREN')
    def type_query(state : ParserState,p):
        state.log('expression : TYPE_QUERY OPEN_PAREN type CLOSE_PAREN')
        val = p[2]
        return ConstantContainer(state.get_formatter(str(val.raw)))

    @pg.production('expression : IDENTIFIER')
    def find_var(state,p):
        state.log('expression : IDENTIFIER')
        var_name = p[0].value
        if var_name in state.local_variables[-1]:
            return state.local_variables[-1][var_name]
        if var_name in state.global_variables:
            return state.global_variables[var_name]
        raise Exception("Variable " + var_name + " doesn't exist")
    
    @pg.production('expression : STRING')
    def get_str(state : ParserState,p):
        state.log('expression : STRING')
        out = state.get_formatter(p[0].value[1:-1])
        return LiteralConstantContainer(out)
    
    @pg.production('expression : ENDSTR')
    def get_str(state : ParserState,p):
        state.log('expression : ENDSTR')
        return LiteralConstantContainer(ir.Constant(ir.IntType(8),ord('\0')))
    
    @pg.production('expression : NULL')
    def get_null(state : ParserState,p):
        state.log('expression : NULL')
        return LiteralConstantContainer(ir.Constant(ir.PointerType(ir.IntType(8)),None))
    
    @pg.production('type : CLASS_NAME')
    def class_type(state,p):
        state.log('type : CLASS_NAME')
        if not p[0].value in state.classes:
            raise Exception("Class " + p[0].value + " does not exist")
        return TypeContainer(ir.PointerType(state.classes[p[0].value].raw),state.classes[p[0].value])

    @pg.production('type : TYPE_NAME')
    def base_type(state,p):
        state.log('type : TYPE_NAME')
        types = {"void": ir.VoidType(),
                 "char": ir.IntType(8),
                 "int": ir.IntType(32),
                 "long": ir.IntType(64),
                 "float": ir.FloatType(),
                 "double": ir.DoubleType(),
                 "half": ir.HalfType(),
                 "bool": ir.IntType(1)}
        return TypeContainer(types[p[0].value])
    
    @pg.production('type : type STAR')
    def pointer_type(state,p):
        state.log('type : type STAR')
        return TypeContainer(ir.PointerType(p[0].raw))

    @pg.error
    def error_handler(state,token):
        print("ERROR AT",token,token.source_pos)
        exit()

    out = pg.build()
    print(out.lr_table.sr_conflicts)
    return out