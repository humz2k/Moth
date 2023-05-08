from rply import ParserGenerator
from rply.token import Token
from llvmlite import ir

class ParserState(object):
    def __init__(self,module_name : str):
        self.module = ir.Module(name=module_name)
        self.global_variables = {}
        self.blocks = []
        self.current_class = None
        self.current_function = None
        self.builder = None
        self.local_variables = {}
        self.functions = {}
        self.casts = {}

    def log(self,text):
        pass
        #print(text)

class TypeContainer:
    def __init__(self,raw):
        self.raw = raw
        self.bound_functions = {}

class ConstantContainer:
    def __init__(self,raw):
        self.raw = raw
    
    def _get(self,builder):
        return self.raw

class VariableContainer:
    def __init__(self,raw):
        self.raw = raw
    
    def _get(self,builder):
        return ConstantContainer(builder.load(self.raw))
    
    def _set(self,builder,value):
        return builder.store(value._get(builder),self.raw)

def get_parser(filename="tokens.txt"):
    with open(filename,"r") as f:
        tokens = [i.split()[0] for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)] + ["CLASS_NAME","FUNCTION_NAME","FUNCTION_TEMPLATE_NAME"]
    if "IGNORE" in tokens:
        tokens.remove("IGNORE")
    pg = ParserGenerator(tokens, precedence=[
        #("nonassoc",["misc"]),
        #("nonassoc",["template_instance"]),
    ])

    @pg.production('program : cast_def')
    @pg.production('program : function')
    @pg.production('program : global_def')
    def program(state,p):
        state.log('program : global_def|cast_def|function')
    
    @pg.production('program : program global_def')
    @pg.production('program : program cast_def')
    @pg.production('program : program function')
    def cont_program(state,p):
        state.log('program : program global_def|cast_def')

    @pg.production('global_def : type IDENTIFIER SEMI_COLON')
    def global_def(state,p):
        state.log('global_def : type IDENTIFIER SEMI_COLON')
        raw = ir.GlobalVariable(state.module,p[0].raw,"global."+p[1].value)
        var = VariableContainer(raw)
        if p[1].value in state.global_variables:
            raise Exception("Global Variable " + p[1].value + " already exists")
        state.global_variables[p[1].value] = var
        return var

    @pg.production('cast_def_open : DEF CAST type OPEN_PAREN type IDENTIFIER CLOSE_PAREN COLON OPEN_CURL')
    def cast_def_open(state,p):
        state.log('cast_def_open : DEF CAST type OPEN_PAREN type IDENTIFIER CLOSE_PAREN COLON OPEN_CURL')
        _,_,cast_to,_,cast_from,var_name,_,_,_ = p
        name = str(cast_from.raw) + "->" + str(cast_to.raw)
        state.current_function = ir.Function(state.module, ir.FunctionType(cast_to.raw,[cast_from.raw]),name)
        if name in state.casts:
            raise Exception("Cast " + name + " already defined")
        state.casts[name] = state.current_function
        state.current_block = [state.current_function.append_basic_block(name="entry")]
        state.builder = ir.IRBuilder(state.current_block[-1])
        state.local_variables = {}
        state.local_variables[var_name.value] = ConstantContainer(state.current_function.args[0])
        return state.builder
    
    @pg.production('cast_def_open : cast_def_open line')
    def pass_line(state,p):
        state.log('cast_def_open : cast_def_open line')
    
    @pg.production('cast_def : cast_def_open CLOSE_CURL')
    def finish_cast(state,p):
        state.log('cast_def : cast_def_open CLOSE_CURL')
    
    @pg.production('func_def_inputs_open : OPEN_PAREN type IDENTIFIER')
    def func_def_inputs_open(state,p):
        state.log('func_def_inputs_open : OPEN_PAREN type IDENTIFIER')
        return [(p[1],p[2])]

    @pg.production('func_def_inputs_open : func_def_inputs_open COMMA type IDENTIFIER')
    def func_def_inputs_cont(state,p):
        state.log('func_def_inputs_open : func_def_inputs_open COMMA type IDENTIFIER')
        return p[0] + [(p[2],p[3])]
    
    @pg.production('func_def_inputs : func_def_inputs_open CLOSE_PAREN')
    def func_def_inputs(state,p):
        state.log('func_def_inputs : func_def_inputs_open CLOSE_PAREN')
        return p[0]
    
    @pg.production('function_def_open : DEF type FUNCTION_NAME func_def_inputs COLON OPEN_CURL')
    def func_def_open(state,p):
        state.log('function_def_open : DEF type FUNCTION_NAME func_def_inputs COLON OPEN_CURL')
        if type(state.current_class) == type(None):
            _,return_type,func_name,inputs,_,_ = p
            input_types = [i[0].raw for i in inputs]
            func_type = ir.FunctionType(return_type.raw,input_types)
            name = func_name.value + "_" + "_".join([str(i) for i in input_types])
            state.current_function = ir.Function(state.module,func_type,name)
            if name in state.functions:
                raise Exception("Function " + name + " already exists")
            state.current_block = [state.current_function.append_basic_block(name="entry")]
            state.builder = ir.IRBuilder(state.current_block[-1])
            state.local_variables = {}
            for idx,i in enumerate(inputs):
                state.local_variables[i[1].value] = ConstantContainer(state.current_function.args[idx])
            return state.builder
    
    @pg.production('function_def_open : function_def_open line')
    def pass_line(state,p):
        state.log('function_def_open : function_def_open line')
    
    @pg.production('function : function_def_open CLOSE_CURL')
    def pass_func(state,p):
        state.log('function : function_def_open CLOSE_CURL')

    @pg.production('line : assign SEMI_COLON')
    @pg.production('line : expression SEMI_COLON')
    def pass_line(state,p):
        return p[0]
    
    @pg.production('line : RETURN expression SEMI_COLON')
    @pg.production('line : RETURN SEMI_COLON')
    def get_return(state,p):
        state.log('line : RETURN ... SEMI_COLON')
        if len(p) == 3:
            return state.builder.ret(p[1]._get(state.builder))
        return state.builder.ret_void()
    
    @pg.production('line : PASS SEMI_COLON')
    def get_pass(state,p):
        state.log('line : PASS SEMI_COLON')
        return ConstantContainer(state.builder.add(ir.Constant(ir.IntType(32),0),ir.Constant(ir.IntType(32),0)))

    @pg.production('assign : expression ASSIGN expression')
    def assign(state,p):
        state.log('assign : expression ASSIGN expression')
        if isinstance(p[0],VariableContainer):
            expr = p[2]
            var = p[0]
            if expr.raw.type != var.raw.type.pointee:
                cast_name = str(expr.raw.type) + "->" + str(var.type.pointee)
                if not cast_name in state.casts:
                    raise Exception("No casting rule " + cast_name + " exists")
                expr = ConstantContainer(state.builder.call(state.casts[cast_name],[expr._get()]))
            return var._set(state.builder,expr)
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
    
    @pg.production('expression : type OPEN_PAREN expression CLOSE_PAREN')
    def cast(state,p):
        state.log('expression : type OPEN_PAREN expression CLOSE_PAREN')
        cast_to,_,val,_ = p
        cast_from = val._get(state.builder).type
        cast_to = cast_to.raw
        if cast_to == cast_from:
            return p[2]
        name = str(cast_from) + "->" + str(cast_to)
        print(state.casts)
        if not name in state.casts:
            raise Exception("No cast " + name + " exists")
        return ConstantContainer(state.builder.call(state.casts[name],[val._get(state.builder)]))

    @pg.production('expression : NUMBER')
    def constant(state,p):
        state.log('expression : NUMBER')
        if "." in p[0].value:
            return ConstantContainer(ir.Constant(ir.FloatType(),float(p[0].value)))
        return ConstantContainer(ir.Constant(ir.IntType(32),int(p[0].value)))

    @pg.production('expression : type IDENTIFIER')
    def declaration(state,p):
        state.log('expression : type IDENTIFIER')
        var = VariableContainer(state.builder.alloca(p[0].raw))
        if p[1].value in state.local_variables:
            raise Exception("Variable " + p[1].value + " already exists")
        return var

    @pg.production('expression : IDENTIFIER')
    def find_var(state,p):
        state.log('expression : IDENTIFIER')
        var_name = p[0].value
        if var_name in state.local_variables:
            return state.local_variables[var_name]
        if var_name in state.global_variables:
            return state.global_variables[var_name]
        raise Exception("Variable " + var_name + " doesn't exist")

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

    @pg.error
    def error_handler(state,token):
        print("ERROR AT",token,token.source_pos)
        exit()

    out = pg.build()
    print(out.lr_table.sr_conflicts)
    return out