from rply import ParserGenerator
from rply.token import Token
from llvmlite import ir

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
        self.casts = {}
        self.formatters = {}
        self.break_to = []
        printf_ty = ir.FunctionType(ir.IntType(32), [ir.IntType(8).as_pointer()], var_arg=True)
        self.printf = ir.Function(self.module, printf_ty, name="printf")
        bohem_init_ty = ir.FunctionType(ir.VoidType(), [], var_arg=True)
        self.bohem_start = ir.Function(self.module, bohem_init_ty, name="bohem_start")
        bohem_alloc_ty = ir.FunctionType(ir.PointerType(ir.IntType(8)), [ir.IntType(32)], var_arg=False)
        self.bohem_alloc = ir.Function(self.module, bohem_alloc_ty, name="bohem_malloc")

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
        pass
        print(text)

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
        return builder.load(self.raw)
    
    def _set(self,builder,value):
        return builder.store(value,self.raw)

def get_parser(filename="tokens.txt"):
    with open(filename,"r") as f:
        tokens = [i.split()[0] for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)] + ["CLASS_NAME","FUNCTION_NAME","FUNCTION_TEMPLATE_NAME"]
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
        state.local_variables = [{}]
        state.local_variables[-1][var_name.value] = ConstantContainer(state.current_function.args[0])
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
    @pg.production('function_def_open : DEF type FUNCTION_NAME OPEN_PAREN CLOSE_PAREN COLON OPEN_CURL')
    def func_def_open(state,p):
        state.log('function_def_open : DEF type FUNCTION_NAME func_def_inputs COLON OPEN_CURL')
        if type(state.current_class) == type(None):
            if len(p) == 7:
                _,return_type,func_name,_,_,_,_, = p
                inputs = []
            else:
                _,return_type,func_name,inputs,_,_ = p
            input_types = [i[0].raw for i in inputs]
            func_type = ir.FunctionType(return_type.raw,input_types)
            if func_name.value == "main":
                name = "main"
            else:
                name = func_name.value + "_" + "_".join([str(i) for i in input_types])
            state.current_function = ir.Function(state.module,func_type,name)
            if name in state.functions:
                raise Exception("Function " + name + " already exists")
            state.functions[name] = state.current_function
            state.current_block = [state.current_function.append_basic_block(name="entry")]
            state.builder = ir.IRBuilder(state.current_block[-1])
            state.local_variables = [{}]
            for idx,i in enumerate(inputs):
                state.local_variables[-1][i[1].value] = ConstantContainer(state.current_function.args[idx])
            return state.builder
    
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
            

    @pg.production('assign : expression ASSIGN expression')
    def assign(state,p):
        state.log('assign : expression ASSIGN expression')
        if isinstance(p[0],VariableContainer):
            expr = p[2]
            get = expr._get(state.builder)
            var = p[0]
            if get.type != var.raw.type.pointee:
                cast_name = str(get.type) + "->" + str(var.raw.type.pointee)
                if not cast_name in state.casts:
                    raise Exception("No casting rule " + cast_name + " exists")
                get = state.builder.call(state.casts[cast_name],[get])
            return var._set(state.builder,get)
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
    
    @pg.production('expression : PRINT OPEN_PAREN CLOSE_PAREN')
    def print_empty(state,p):
        state.log('expression : PRINT OPEN_PAREN CLOSE_PAREN')
        return ConstantContainer(state.builder.call(state.printf,[state.get_formatter("\n")]))
    
    @pg.production('print_open : PRINT OPEN_PAREN expression')
    def print_one(state,p):
        state.log('print_open : PRINT OPEN_PAREN expression')
        expr = p[2]._get(state.builder)
        name = "__print__" + "_" + str(expr.type)
        if not name in state.functions:
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
            raise Exception("Function " + p[0].value + " with no inputs " + ",".join([str(i.type) for i in input_exprs]) + " doesn't exist")
        return ConstantContainer(state.builder.call(state.functions[name],input_exprs))
        
    @pg.production('expression : OPEN_PAREN expression CLOSE_PAREN')
    def pass_expr(state,p):
        state.log('expression : OPEN_PAREN expression CLOSE_PAREN')
        return p[1]

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
        left = p[0]._get(state.builder)
        right = p[2]._get(state.builder)
        op_name = op_dict[p[1].name] + "_" + str(left.type) + "_" + str(right.type)
        if not op_name in state.functions:
            raise Exception("No definition for op " + str(p[1].value) + " exists for types " + str(left.type) + " and " + str(right.type))
        return ConstantContainer(state.builder.call(state.functions[op_name],[left,right]))

    @pg.production('expression : NUMBER')
    def constant(state,p):
        state.log('expression : NUMBER')
        if "." in p[0].value:
            return ConstantContainer(ir.Constant(ir.FloatType(),float(p[0].value)))
        return ConstantContainer(ir.Constant(ir.IntType(32),int(p[0].value)))
    
    @pg.production('expression : CHAR')
    def constant(state,p):
        state.log('expression : CHAR')
        return ConstantContainer(ir.Constant(ir.IntType(8),ord(p[0].value[1:-1])))
    
    @pg.production('expression : TRUE')
    def constant(state,p):
        state.log('expression : TRUE')
        return ConstantContainer(ir.Constant(ir.IntType(1),1))
    
    @pg.production('expression : FALSE')
    def constant(state,p):
        state.log('expression : FALSE')
        return ConstantContainer(ir.Constant(ir.IntType(1),0))

    @pg.production('expression : type IDENTIFIER')
    def declaration(state,p):
        state.log('expression : type IDENTIFIER')
        var = VariableContainer(state.builder.alloca(p[0].raw))
        if p[1].value in state.local_variables[-1]:
            raise Exception("Variable " + p[1].value + " already exists")
        state.local_variables[-1][p[1].value] = var
        return var

    @pg.production('expression : IDENTIFIER')
    def find_var(state,p):
        state.log('expression : IDENTIFIER')
        var_name = p[0].value
        if var_name in state.local_variables[-1]:
            return state.local_variables[-1][var_name]
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