from rply import ParserGenerator
from rply.token import Token
from . import aster

class ParserState(object):
    def __init__(self):
        pass

def get_parser(filename="tokens.txt"):
    with open(filename,"r") as f:
        tokens = [i.split()[0] for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)] + ["OBJECT_NAME","FUNCTION_NAME","STRUCT_NAME","NAMESPACE"]
        tokens = list(set(tokens))
    if "IGNORE" in tokens:
        tokens.remove("IGNORE")
    pg = ParserGenerator(tokens, precedence=[
        ('left',["PLUS_PLUS","MINUS_MINUS"]),
        ('left',["ASSIGN","PLUS_EQUAL","MINUS_EQUAL","STARSTAR_EQUAL","STAR_EQUAL","SLASH_EQUAL","PERCENT_EQUAL","RIGHT_SHIFT_EQUAL","LEFT_SHIFT_EQUAL"]),
        ('left', ['USER_BINOP']),
        ('left', ['PLUS', 'MINUS']),
        ('left', ['STAR', 'SLASH', 'AT']),
        ('left', ['PERCENT']),
        ('left', ['STARSTAR']),
        ('left', ['EQUAL', 'NOT_EQUAL','GREATER','LESS','GREATER_OR_EQUAL','LESS_OR_EQUAL']),
        ('left', ['AMP', 'VERT','HAT','TILDE','LEFT_SHIFT','RIGHT_SHIFT']),
        ('left', ['AND', 'OR']),
        ('left', ['NOT']),
        ('left', ['PERIOD']),
        ('left',["OPEN_SQUARE"]),
        ('left',["OPEN_PAREN"])
    ])

    @pg.production('program : function')
    @pg.production('program : struct')
    @pg.production('program : object')
    @pg.production('program : cast')
    @pg.production('program : kernel')
    def pass_program(state,p):
        program = aster.Program()
        program.add(p[0])
        return program

    @pg.production('program : program function')
    @pg.production('program : program struct')
    @pg.production('program : program object')
    @pg.production('program : program cast')
    @pg.production('program : program kernel')
    def pass_program(state,p):
        p[0].add(p[1])
        return p[0]
    
    @pg.production('function : AT MODIFIER SEMI_COLON function')
    def modifier(state,p):
        _,modifier,_,function = p
        function.modifiers[modifier.value] = True
        return function
    
    @pg.production('function : function_header SEMI_COLON')
    def pass_func_def(state,p):
        return aster.Function(p[0],[])
    
    @pg.production('kernel : kernel_header SEMI_COLON')
    def pass_func_def(state,p):
        return aster.Kernel(p[0],[])
    
    @pg.production('cast : cast_header SEMI_COLON')
    def pass_func_def(state,p):
        return aster.Cast(p[0],[])

    @pg.production('struct_open : STRUCT STRUCT_NAME COLON OPEN_CURL')
    def pass_struct_open(state,p):
        return aster.Struct(p[1])
    
    @pg.production('struct_open : struct_open vardec SEMI_COLON')
    def pass_struct_open(state,p):
        p[0].add_vardec(p[1])
        return p[0]
    
    @pg.production('struct_open : struct_open function')
    def pass_struct_open(state,p):
        p[0].add_function(p[1])
        return p[0]
    
    @pg.production('struct : struct_open CLOSE_CURL')
    def pass_struct(state,p):
        return p[0]
    
    @pg.production('object_open : OBJECT OBJECT_NAME COLON OPEN_CURL')
    def pass_struct_open(state,p):
        return aster.Object(p[1])
    
    @pg.production('object_open : object_open vardec SEMI_COLON')
    def pass_struct_open(state,p):
        p[0].add_vardec(p[1])
        return p[0]
    
    @pg.production('object_open : object_open function')
    def pass_struct_open(state,p):
        p[0].add_function(p[1])
        return p[0]
    
    @pg.production('object : object_open CLOSE_CURL')
    def pass_struct(state,p):
        return p[0]
    
    @pg.production('cast_header : DEF CAST type OPEN_PAREN type IDENTIFIER CLOSE_PAREN')
    def pass_cast_header(state,p):
        _,_,typ,_,inptyp,inpname,_ = p
        return aster.CastHeader(typ,[inptyp,inpname])
    
    @pg.production('cast : cast_header COLON OPEN_CURL lines CLOSE_CURL')
    def pass_cast(state,p):
        return aster.Cast(p[0],p[3])

    @pg.production('function : function_header COLON OPEN_CURL lines CLOSE_CURL')
    def return_function(state,p):
        header,_,_,lines,_ = p
        return aster.Function(header,lines)

    @pg.production('function_header : DEF type FUNCTION_NAME OPEN_PAREN CLOSE_PAREN')
    def function_header(state,p):
        _,typ,name,_,_ = p
        return aster.FunctionHeader(typ,name)
    
    @pg.production('function_header_open : DEF type FUNCTION_NAME OPEN_PAREN type IDENTIFIER')
    def function_header_open(state,p):
        _,typ,name,_,inptyp,inpname = p
        return {"type":typ,"name":name,"inputs":[[inptyp,inpname]]}
    
    @pg.production('function_header_open : function_header_open COMMA type IDENTIFIER')
    def function_header_open(state,p):
        tmp,_,inptyp,inpname = p
        tmp["inputs"].append([inptyp,inpname])
        return tmp
    
    @pg.production('function_header : function_header_open CLOSE_PAREN')
    def function_header(state,p):
        tmp = p[0]
        return aster.FunctionHeader(tmp["type"],tmp["name"],tmp["inputs"])
    
    @pg.production('kernel_iters_open : OPEN_SQUARE IDENTIFIER COLON expression')
    def kernel_iters(state,p):
        _,name,_,val = p
        return [[name,val]]
    
    @pg.production('kernel_iters_open : kernel_iters_open COMMA IDENTIFIER COLON expression')
    def kernel_iters(state,p):
        tmp,_,name,_,val = p
        return tmp + [[name,val]]
    
    @pg.production('kernel_iters : kernel_iters_open CLOSE_SQUARE')
    def kernel_iters(state,p):
        return p[0]
    
    @pg.production('kernel : kernel_header COLON OPEN_CURL lines CLOSE_CURL')
    def return_function(state,p):
        header,_,_,lines,_ = p
        return aster.Kernel(header,lines)

    @pg.production('kernel_header : DEF KERNEL FUNCTION_NAME kernel_iters OPEN_PAREN CLOSE_PAREN')
    def function_header(state,p):
        _,typ,name,iters,_,_ = p
        return aster.KernelHeader(iters,name)
    
    @pg.production('kernel_header_open : DEF KERNEL FUNCTION_NAME kernel_iters OPEN_PAREN type IDENTIFIER')
    def function_header_open(state,p):
        _,typ,name,iters,_,inptyp,inpname = p
        return {"type":typ,"iters":iters,"name":name,"inputs":[[inptyp,inpname]]}
    
    @pg.production('kernel_header_open : kernel_header_open COMMA type IDENTIFIER')
    def function_header_open(state,p):
        tmp,_,inptyp,inpname = p
        tmp["inputs"].append([inptyp,inpname])
        return tmp
    
    @pg.production('kernel_header : kernel_header_open CLOSE_PAREN')
    def function_header(state,p):
        tmp = p[0]
        return aster.KernelHeader(tmp["iters"],tmp["name"],tmp["inputs"])
    
    @pg.production('expression : RANGE OPEN_PAREN expression CLOSE_PAREN')
    def pass_range(state,p):
        return aster.Range(p[2])
    
    @pg.production('expression : RANGE OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def pass_range(state,p):
        return aster.Range(p[2],p[4])
    
    @pg.production('expression : RANGE OPEN_PAREN expression COMMA expression COMMA expression CLOSE_PAREN')
    def pass_range(state,p):
        return aster.Range(p[2],p[4],p[6])
    
    @pg.production('line : IF expression COLON OPEN_CURL lines CLOSE_CURL else_statement')
    def if_statement(state,p):
        return aster.IfStatement(p[1],p[4],p[6])
    
    @pg.production('line : IF expression COLON OPEN_CURL lines CLOSE_CURL')
    def if_statement(state,p):
        return aster.IfStatement(p[1],p[4])
    
    @pg.production('elif_statement : ELIF expression COLON OPEN_CURL lines CLOSE_CURL elif_statement')
    def elif_statement(state,p):
        return aster.IfStatement(p[1],p[4],p[6])
    
    @pg.production('else_statement : ELIF expression COLON OPEN_CURL lines CLOSE_CURL else_statement')
    def elif_statement(state,p):
        return aster.IfStatement(p[1],p[4],p[6])
    
    @pg.production('else_statement : ELIF expression COLON OPEN_CURL lines CLOSE_CURL')
    def elif_statement(state,p):
        return aster.IfStatement(p[1],p[4])
    
    @pg.production('else_statement : ELSE COLON OPEN_CURL lines CLOSE_CURL')
    def if_statement(state,p):
        return aster.ElseStatement(p[3])
    
    @pg.production('line : WHILE expression COLON OPEN_CURL lines CLOSE_CURL')
    def while_loop(state,p):
        return aster.WhileLoop(p[1],p[4])
    
    @pg.production('line : FOR expression IN expression COLON OPEN_CURL lines CLOSE_CURL')
    def for_loop(state,p):
        return aster.ForLoop(p[1],p[3],p[6])

    @pg.production('lines : line')
    def pass_lines(state,p):
        return [p[0]]
    
    @pg.production('lines : lines line')
    def pass_lines(state,p):
        return p[0] + [p[1]]
    
    @pg.production('line : RETURN expression SEMI_COLON')
    def pass_line(state,p):
        return aster.Return(p[1])
    
    @pg.production('line : RETURN SEMI_COLON')
    def pass_line(state,p):
        return aster.Return()
    
    @pg.production('line : PASS SEMI_COLON')
    def pass_line(state,p):
        return aster.Pass()
    
    @pg.production('line : BREAK SEMI_COLON')
    def pass_line(state,p):
        return aster.Break()
    
    @pg.production('line : expression SEMI_COLON')
    def pass_line(state,p):
        return p[0]
    
    #@pg.production('user_binop : BACKSLASH FUNCTION_NAME')
    #@pg.production('user_binop : BACKSLASH ref_func')
    #def pass_user_binop(state,p):
    #    return p[1]
    
    #@pg.production('expression : expression user_binop expression')
    #def pass_user_binop(state,p):
    #    return aster.FunctionCall(p[1],[p[0],p[2]])
    
    @pg.production('expression : expression RIGHT_SHIFT expression')
    @pg.production('expression : expression LEFT_SHIFT expression')
    @pg.production('expression : expression PLUS expression')
    @pg.production('expression : expression MINUS expression')
    @pg.production('expression : expression STARSTAR expression')
    @pg.production('expression : expression STAR expression')
    @pg.production('expression : expression SLASH expression')
    @pg.production('expression : expression PERCENT expression')
    @pg.production('expression : expression AT expression')
    @pg.production('expression : expression EQUAL expression')
    @pg.production('expression : expression NOT_EQUAL expression')
    @pg.production('expression : expression GREATER_OR_EQUAL expression')
    @pg.production('expression : expression LESS_OR_EQUAL expression')
    @pg.production('expression : expression GREATER expression')
    @pg.production('expression : expression LESS expression')
    @pg.production('expression : expression AND expression')
    @pg.production('expression : expression OR expression')
    @pg.production('expression : expression AMP expression')
    @pg.production('expression : expression VERT expression')
    @pg.production('expression : expression HAT expression')
    def pass_expression(state,p):
        return aster.BinOp(p[1].name,p[0],p[2])
    
    @pg.production('expression : MINUS expression')
    @pg.production('expression : NOT expression')
    @pg.production('expression : TILDE expression')
    def pass_expression(state,p):
        return aster.SinOp(p[0].name,p[1])
    
    @pg.production('expression : STAR expression')
    def var_deref(state,p):
        return aster.VarDeref(p[1])
    
    @pg.production('expression : expression PLUS_PLUS')
    @pg.production('expression : expression MINUS_MINUS')
    def pass_expression(state,p):
        return aster.Incr(p[1].name,p[0],True)
    
    @pg.production('expression : PLUS_PLUS expression')
    @pg.production('expression : MINUS_MINUS expression')
    def pass_expression(state,p):
        return aster.Incr(p[0].name,p[1],False)
    
    @pg.production('expression : FUNCTION_NAME OPEN_PAREN CLOSE_PAREN')
    @pg.production('expression : ref_func OPEN_PAREN CLOSE_PAREN')
    def pass_function(state,p):
        return aster.FunctionCall(p[0])
    
    @pg.production('func_call_open : FUNCTION_NAME OPEN_PAREN expression')
    @pg.production('func_call_open : ref_func OPEN_PAREN expression')
    def pass_function(state,p):
        return [p[0],p[2]]
    
    @pg.production('func_call_open : func_call_open COMMA expression')
    def pass_function(state,p):
        return p[0] + [p[2]]
    
    @pg.production('expression : func_call_open CLOSE_PAREN')
    def pass_function(state,p):
        return aster.FunctionCall(p[0][0],p[0][1:])
    
    @pg.production('expression : NEW STRUCT_NAME OPEN_PAREN CLOSE_PAREN')
    def pass_function(state,p):
        return aster.NewStruct(p[1])
    
    @pg.production('struct_call_open : NEW STRUCT_NAME OPEN_PAREN expression')
    def pass_function(state,p):
        return [p[1],p[3]]
    
    @pg.production('struct_call_open : struct_call_open COMMA expression')
    def pass_function(state,p):
        return p[0] + [p[2]]
    
    @pg.production('expression : struct_call_open CLOSE_PAREN')
    def pass_function(state,p):
        return aster.NewStruct(p[0][0],p[0][1:])
    
    @pg.production('expression : NEW OBJECT_NAME OPEN_PAREN CLOSE_PAREN')
    def pass_function(state,p):
        return aster.NewObject(p[1])
    
    @pg.production('object_call_open : NEW OBJECT_NAME OPEN_PAREN expression')
    def pass_function(state,p):
        return [p[1],p[3]]
    
    @pg.production('object_call_open : object_call_open COMMA expression')
    def pass_function(state,p):
        return p[0] + [p[2]]
    
    @pg.production('cast_val : type OPEN_PAREN expression CLOSE_PAREN')
    def pass_cast(state,p):
        return aster.CastVal(p[0],p[2])
    
    @pg.production('expression : cast_val')
    def pass_cast(state,p):
        return p[0]

    @pg.production('expression : object_call_open CLOSE_PAREN')
    def pass_function(state,p):
        return aster.NewObject(p[0][0],p[0][1:])

    @pg.production('expression : NUMBER')
    @pg.production('expression : FLOAT_LITERAL')
    @pg.production('expression : DOUBLE_LITERAL')
    @pg.production('expression : HALF_LITERAL')
    @pg.production('expression : LONG_LITERAL')
    @pg.production('expression : CHAR')
    @pg.production('expression : TRUE')
    @pg.production('expression : FALSE')
    @pg.production('expression : NULL')
    @pg.production('expression : ENDSTR')
    def pass_expression(state,p):
        return aster.Constant(p[0])
    
    @pg.production('vardec : type IDENTIFIER')
    def declaration(state,p):
        return aster.VarDec(p[0],p[1])
    
    @pg.production('expression : vardec')
    def declaration(state,p):
        return p[0]
    
    @pg.production('expression : IDENTIFIER')
    def declaration(state,p):
        return aster.Var(p[0])
    
    @pg.production('expression : STRING')
    def string(state,p):
        return aster.String(p[0])
    
    @pg.production('expression : expression USER_BINOP expression')
    def user_binop(state,p):
        left,name,right = p
        name = Token("FUNCTION_NAME",name.value[1:])
        return aster.FunctionCall(name,[left,right])
    
    @pg.production('expression : expression ASSIGN expression')
    def declaration(state,p):
        return aster.Assign(p[0],p[2])
    
    @pg.production('expression : expression PLUS_EQUAL expression')
    @pg.production('expression : expression MINUS_EQUAL expression')
    @pg.production('expression : expression STARSTAR_EQUAL expression')
    @pg.production('expression : expression STAR_EQUAL expression')
    @pg.production('expression : expression SLASH_EQUAL expression')
    @pg.production('expression : expression PERCENT_EQUAL expression')
    @pg.production('expression : expression RIGHT_SHIFT_EQUAL expression')
    @pg.production('expression : expression LEFT_SHIFT_EQUAL expression')
    def declaration(state,p):
        left,op,right = p
        op = op.name.split("_EQUAL")[0]
        binop = aster.BinOp(op,left,right)
        return aster.Assign(left,binop)
    
    @pg.production('expression : PRINT OPEN_PAREN CLOSE_PAREN')
    def pass_print(state,p):
        return aster.Print()
    
    @pg.production('expression : PRINT OPEN_PAREN NONEWLN CLOSE_PAREN')
    def pass_print(state,p):
        tmp = aster.Print()
        tmp.nonewline()
        return tmp
    
    @pg.production('print_open : PRINT OPEN_PAREN expression')
    def pass_print(state,p):
        tmp = aster.Print()
        tmp.add(p[2])
        return tmp
    
    @pg.production('print_open : print_open COMMA expression')
    def pass_print(state,p):
        p[0].add(p[2])
        return p[0]
    
    @pg.production('expression : SIZEOF OPEN_PAREN type CLOSE_PAREN')
    def pass_sizeof(state,p):
        return aster.Sizeof(p[2])
    
    @pg.production('expression : TYPE_QUERY OPEN_PAREN expression CLOSE_PAREN')
    def pass_sizeof(state,p):
        return aster.Typeof(p[2])
    
    @pg.production('expression : print_open CLOSE_PAREN')
    def pass_print(state,p):
        return p[0]
    
    @pg.production('expression : print_open COMMA NONEWLN CLOSE_PAREN')
    def pass_print(state,p):
        p[0].nonewline()
        return p[0]
    
    @pg.production('vector_open : OPEN_SQUARE expression')
    def pass_vector(state,p):
        return [p[1]]
    
    @pg.production('vector_open : vector_open COMMA expression')
    def pass_vector(state,p):
        return p[0] + [p[2]]
    
    @pg.production('vector : vector_open CLOSE_SQUARE')
    def pass_vector(state,p):
        return aster.VectorLiteral(p[0])
    
    @pg.production('expression : vector')
    def pass_vector(state,p):
        return p[0]
    
    @pg.production('expression : expression vector')
    def pass_index(state,p):
        return aster.Index(p[0],p[1])
    
    @pg.production('expression : OPEN_PAREN expression CLOSE_PAREN')
    def pass_expr(state,p):
        return p[1]
    
    @pg.production('expression : expression PERIOD IDENTIFIER')
    def pass_var(state,p):
        return aster.VarReference(p[0],p[2])
    
    @pg.production('ref_func : expression PERIOD FUNCTION_NAME')
    def pass_var(state,p):
        return aster.FuncReference(p[0],p[2])
    
    @pg.production('expression : NAMESPACE PERIOD IDENTIFIER')
    def pass_var(state,p):
        return aster.NamespaceVar(p[0],p[2])
    
    @pg.production('ref_func : NAMESPACE PERIOD FUNCTION_NAME')
    def pass_var(state,p):
        return aster.NamsespaceFunc(p[0],p[2])
    
    @pg.production('expression : VECTOR_LEN OPEN_PAREN expression CLOSE_PAREN')
    def pass_veclen(state,p):
        return aster.VecLen(p[2])
    
    @pg.production('expression : NEW type vector')
    def pass_array_init(state,p):
        return aster.ArrayInit(p[1],p[2])
    
    @pg.production('array_type_open : type OPEN_SQUARE COLON')
    def pass_array_type(state,p):
        return p[0],1

    @pg.production('array_type_open : array_type_open COMMA COLON')
    def pass_array_type(state,p):
        typ,ndims = p[0]
        return typ,ndims+1
    
    @pg.production('type : array_type_open CLOSE_SQUARE')
    def pass_array_type(state,p):
        typ,ndims = p[0]
        return aster.ArrayType(typ,ndims)
    
    @pg.production('type : TYPE_NAME')
    def pass_type(state,p):
        return aster.BaseType(p[0])
    
    @pg.production('type : STRUCT_NAME')
    def pass_type(state,p):
        return aster.StructType(p[0])
    
    @pg.production('type : OBJECT_NAME')
    def pass_type(state,p):
        return aster.ObjectType(p[0])
    
    @pg.production('type : VECTOR_TYPE')
    def pass_type(state,p):
        return aster.VectorType(p[0])
    
    @pg.production('type : type STAR')
    def pass_type(state,p):
        return aster.PointerType(p[0])

    @pg.error
    def error_handler(state,token):
        print("ERROR AT",token,token.source_pos)
        exit()

    out = pg.build()
    if len(out.lr_table.sr_conflicts) != 0:
        print(out.lr_table.sr_conflicts)
    return out

def parse(tokens,path):
    parser = get_parser(filename = path)
    parsed = parser.parse(iter(tokens),ParserState())
    return parsed