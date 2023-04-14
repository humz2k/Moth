import aster
from rply import ParserGenerator
from rply.token import Token

def get_parser(filename="tokens.txt",user_types = ["USER_TYPE"], statics = ["STATIC_OBJECT"]):
    with open(filename,"r") as f:
        tokens = [i.split()[0] for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)] + user_types + statics
    if "IGNORE" in tokens:
        tokens.remove("IGNORE")
    pg = ParserGenerator(tokens, precedence=[
    ('left', ['PLUS', 'MINUS']),
    ('left', ['STAR', 'SLASH']),
    ('left', ['PERCENT']),
    ('left', ['STARSTAR']),
    ('left', ['EQUAL', 'NOT_EQUAL','GREATER','LESS','GREATER_OR_EQUAL','LESS_OR_EQUAL']),
    ('left', ['AMP', 'VERT']),
    ('left', ['AND', 'OR']),
    ('left', ['NOT']),
    ('left', ['PERIOD'])
    ])

    @pg.production('program : scope')
    def program(p):
        return aster.Program(p[0])
    
    @pg.production('program : program scope')
    def add_program(p):
        return p[0].add(p[1])
    
    @pg.production('scope : scope_header scope_body')
    def scope(p):
        return aster.Scope(p[0],p[1])
    
    @pg.production('scope_header : function_header')
    @pg.production('scope_header : for_header')
    @pg.production('scope_header : while_header')
    @pg.production('scope_header : if_header')
    @pg.production('scope_header : elif_header')
    @pg.production('scope_header : else_header')
    @pg.production('scope_header : class_header')
    def scope_header(p):
        return p[0]
    
    @pg.production('class_header : CLASS identifier COLON')
    @pg.production('class_header : CLASS identifier OPEN_PAREN identifier CLOSE_PAREN COLON')
    def class_header(p):
        if len(p) == 3:
            return aster.ClassHeader(p[1])
        return aster.ClassHeader(p[1],p[3])
    
    @pg.production('class_header : CLASS user_type OPEN_PAREN identifier CLOSE_PAREN COLON')
    @pg.production('class_header : CLASS static_object OPEN_PAREN identifier CLOSE_PAREN COLON')
    def class_header_type(p):
        return aster.ClassHeader(p[1])
    
    @pg.production('function_header : DEF type identifier OPEN_PAREN CLOSE_PAREN COLON')
    @pg.production('function_header : DEF type identifier func_def_inputs COLON')
    def function_header(p):
        if len(p) == 5:
            return aster.FunctionHeader(p[1],p[2],p[3])
        else:
            return aster.FunctionHeader(p[1],p[2],aster.FunctionDefInputs())
        
    @pg.production('if_header : IF expression COLON')
    def if_header(p):
        return aster.IfHeader(p[1])
    
    @pg.production('elif_header : ELIF expression COLON')
    def elif_header(p):
        return aster.ElifHeader(p[1])
    
    @pg.production('else_header : ELSE COLON')
    def else_header(p):
        return aster.ElseHeader()
    
    @pg.production('for_header : FOR identifier IN range_obj COLON')
    @pg.production('for_header : FOR type_name identifier IN range_obj COLON')
    def for_header(p):
        if len(p) == 5:
            return aster.ForHeader(p[1],p[3])
        else:
            return aster.ForHeader(p[2],p[4],p[1])
    
    @pg.production('range_obj : RANGE OPEN_PAREN expression CLOSE_PAREN')
    @pg.production('range_obj : RANGE OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    @pg.production('range_obj : RANGE OPEN_PAREN expression COMMA expression COMMA expression CLOSE_PAREN')
    def range_obj(p):
        if len(p) == 4:
            start = None
            end = p[2]
            step = None
        if len(p) == 6:
            start = p[2]
            end = p[4]
            step = None
        if len(p) == 8:
            start = p[2]
            end = p[4]
            step = p[6]
        return aster.RangeObj(start,end,step)

    @pg.production('while_header : WHILE expression COLON')
    def while_header(p):
        return aster.WhileHeader(p[1])
    
    @pg.production('func_def_inputs_open : OPEN_PAREN type identifier')
    def func_def_inputs_open(p):
        return aster.FunctionDefInputs((p[1],p[2]))

    @pg.production('func_def_inputs_open : func_def_inputs_open COMMA type identifier')
    def func_def_inputs_cont(p):
        return p[0].add((p[2],p[3]))

    @pg.production('func_def_inputs : func_def_inputs_open CLOSE_PAREN')
    def func_def_inputs(p):
        return p[0]
    
    @pg.production('scope_body : OPEN_CURL lines CLOSE_CURL')
    def scope_body(p):
        return aster.ScopeBody(p[1])
    
    @pg.production('lines : line')
    @pg.production('lines : lines line')
    def lines(p):
        if len(p) == 1:
            return aster.Lines(p[0])
        else:
            return p[0].add(p[1])
        
    @pg.production('line : declaration SEMI_COLON')
    @pg.production('line : assignment SEMI_COLON')
    @pg.production('line : function_call SEMI_COLON')
    @pg.production('line : pass SEMI_COLON')
    @pg.production('line : break SEMI_COLON')
    @pg.production('line : return SEMI_COLON')
    @pg.production('line : print SEMI_COLON')
    @pg.production('line : free SEMI_COLON')
    @pg.production('line : c_call SEMI_COLON')
    @pg.production('line : list_append SEMI_COLON')
    @pg.production('line : list_pop SEMI_COLON')
    @pg.production('line : list_len SEMI_COLON')
    @pg.production('line : list_remove SEMI_COLON')
    @pg.production('line : list_insert SEMI_COLON')
    @pg.production('line : scope')
    def line(p):
        return p[0]
    
    @pg.production('return : RETURN expression')
    @pg.production('return : RETURN')
    def return_val(p):
        if len(p) == 2:
            return aster.Return(p[1])
        else:
            return aster.Return()
        
    @pg.production('declaration : type identifier')
    def declaration(p):
        return aster.Declaration(p[0],p[1])
    
    @pg.production('assignment : declaration ASSIGN expression')
    @pg.production('assignment : identifier ASSIGN expression')
    @pg.production('assignment : reference ASSIGN expression')
    @pg.production('assignment : declaration ASSIGN allocobj')
    @pg.production('assignment : identifier ASSIGN allocobj')
    @pg.production('assignment : reference ASSIGN allocobj')
    def assignment(p):
        return aster.Assign(p[0],p[2])
    
    @pg.production('assignment : identifier PLUS_EQUAL expression')
    @pg.production('assignment : reference PLUS_EQUAL expression')
    @pg.production('assignment : identifier MINUS_EQUAL expression')
    @pg.production('assignment : reference MINUS_EQUAL expression')
    @pg.production('assignment : identifier STARSTAR_EQUAL expression')
    @pg.production('assignment : reference STARSTAR_EQUAL expression')
    @pg.production('assignment : identifier STAR_EQUAL expression')
    @pg.production('assignment : reference STAR_EQUAL expression')
    @pg.production('assignment : identifier SLASH_EQUAL expression')
    @pg.production('assignment : reference SLASH_EQUAL expression')
    @pg.production('assignment : identifier PERCENT_EQUAL expression')
    @pg.production('assignment : reference PERCENT_EQUAL expression')
    def assignment2(p):
        return aster.AssignInc(p[0],p[2],p[1])
    
    @pg.production('assignment : identifier PLUS_PLUS')
    @pg.production('assignment : reference PLUS_PLUS')
    @pg.production('assignment : identifier MINUS_MINUS')
    @pg.production('assignment : reference MINUS_MINUS')
    def inc(p):
        return aster.Inc(p[0],p[1])
    
    @pg.production('array_type : open_array_type CLOSE_SQUARE')
    def pass_array_type(p):
        return p[0]
        
    @pg.production('type : type_name')
    @pg.production('type : array_type')
    def pass_type(p):
        return p[0]
    
    @pg.production('reference : array_reference_open CLOSE_SQUARE')
    def array_reference(p):
        return p[0]

    @pg.production('array_reference_open : reference OPEN_SQUARE expression')
    @pg.production('array_reference_open : reference OPEN_SQUARE COLON')
    @pg.production('array_reference_open : identifier OPEN_SQUARE expression')
    @pg.production('array_reference_open : identifier OPEN_SQUARE COLON')
    def array_reference_open(p):
        return aster.ArrayReference(p[0],p[2])

    @pg.production('array_reference_open : array_reference_open COMMA expression')
    @pg.production('array_reference_open : array_reference_open COMMA COLON')
    def array_reference_cont(p):
        return p[0].add(p[2])
    
    @pg.production('alloc_array_open : ARRAY OPEN_PAREN expression')
    def alloc_array_open(p):
        return aster.AllocArray(p[2])

    @pg.production('alloc_array_open : alloc_array_open COMMA expression')
    def alloc_array_cont(p):
        return p[0].add(p[2])
    
    @pg.production('alloc_array : alloc_array_open CLOSE_PAREN')
    def alloc_array(p):
        return p[0]
        
    @pg.production('open_array_type : type_name OPEN_SQUARE COLON')
    @pg.production('open_array_type : array_type OPEN_SQUARE COLON')
    def open_array_type(p):
        return aster.ArrayType(p[0])
    
    @pg.production('open_array_type : open_array_type COMMA COLON')
    def cont_array_type(p):
        return p[0].add_dim()
    
    @pg.production('allocobj : NEW function_call')
    def allocobj(p):
        return aster.AllocObject(p[1])
    
    @pg.production('list_literal : OPEN_SQUARE CLOSE_SQUARE')
    def empty_list(p):
        return aster.ListLiteral()
    
    @pg.production('list_literal : list_literal_open CLOSE_SQUARE')
    def close_list(p):
        return p[0]
    
    @pg.production('list_literal_open : OPEN_SQUARE expression')
    def open_list(p):
        return aster.ListLiteral(p[1])

    @pg.production('list_literal_open : list_literal_open COMMA expression')
    def cont_list(p):
        return p[0].add(p[2])
    
    @pg.production('type_name_base : c_type')
    def c_type(p):
        return p[0]
    
    @pg.production('type_name_base : LIST type_name')
    def list_type_name(p):
        return aster.ListType(p[1])
        
    @pg.production('type_name_base : TYPE_NAME')
    @pg.production('type_name_base : OBJECT identifier')
    def type_name(p):
        if len(p) == 1:
            return aster.Type(p[0])
        if len(p) == 2:
            return aster.ObjectType(p[1])
        
    @pg.production('type_name : type_name_base')
    def type_name_base(p):
        return p[0]
        
    @pg.production('type_name : user_type')
    def user_type_name(p):
        return aster.ObjectType(p[0])
        
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
    def binop(p):
        return aster.BinOp(p[0],p[1],p[2])
    
    @pg.production('expression : NOT expression')
    def pass_not(p):
        return aster.Not(p[1])
        
    @pg.production('expression : OPEN_PAREN expression CLOSE_PAREN')
    def brackets(p):
        return p[1]
    
    @pg.production('expression : number|string|identifier|function_call|bool|reference|alloc_array|cast|c_call|c_ptr|c_val|null|c_lit|list_literal|list_pop|list_len|c_raw')
    def num_str_idn(p):
        return p[0]
    
    #@pg.production('expression : MINUS number')
    #def negative(p):
    #    return Token("number","-" + p[1].value)
    
    @pg.production('bool : TRUE|FALSE')
    def ret_bool(p):
        if p[0].name == "TRUE":
            return aster.Number(Token("Number","1"))
        else:
            return aster.Number(Token("Number","0"))
    
    @pg.production('cast : type_name_base OPEN_PAREN expression CLOSE_PAREN')
    @pg.production('cast : array_type OPEN_PAREN expression CLOSE_PAREN')
    def cast(p):
        return aster.Cast(p[0],p[2])
    
    @pg.production('list_append : identifier PERIOD APPEND OPEN_PAREN expression CLOSE_PAREN')
    @pg.production('list_append : reference PERIOD APPEND OPEN_PAREN expression CLOSE_PAREN')
    @pg.production('list_append : function_call PERIOD APPEND OPEN_PAREN expression CLOSE_PAREN')
    def list_append(p):
        return aster.ListAppend(p[0],p[4])
    
    @pg.production('list_pop : identifier PERIOD POP OPEN_PAREN CLOSE_PAREN')
    @pg.production('list_pop : reference PERIOD POP OPEN_PAREN CLOSE_PAREN')
    @pg.production('list_pop : function_call PERIOD POP OPEN_PAREN CLOSE_PAREN')
    def list_append(p):
        return aster.ListPop(p[0])
    
    @pg.production('list_len : identifier PERIOD LEN OPEN_PAREN CLOSE_PAREN')
    @pg.production('list_len : reference PERIOD LEN OPEN_PAREN CLOSE_PAREN')
    @pg.production('list_len : function_call PERIOD LEN OPEN_PAREN CLOSE_PAREN')
    def list_append(p):
        return aster.ListLen(p[0])
    
    @pg.production('list_insert : identifier PERIOD INSERT OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    @pg.production('list_insert : reference PERIOD INSERT OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    @pg.production('list_insert : function_call PERIOD INSERT OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def list_append(p):
        return aster.ListInsert(p[0],p[4],p[6])
    
    @pg.production('list_remove : identifier PERIOD REMOVE OPEN_PAREN expression CLOSE_PAREN')
    @pg.production('list_remove : reference PERIOD REMOVE OPEN_PAREN expression CLOSE_PAREN')
    @pg.production('list_remove : function_call PERIOD REMOVE OPEN_PAREN expression CLOSE_PAREN')
    def list_append(p):
        return aster.ListRemove(p[0],p[4])

    @pg.production('function_call : identifier OPEN_PAREN CLOSE_PAREN')
    @pg.production('function_call : reference OPEN_PAREN CLOSE_PAREN')
    @pg.production('function_call : user_type OPEN_PAREN CLOSE_PAREN')
    @pg.production('function_call : function_call_open CLOSE_PAREN')
    def function_call(p):
        if len(p) == 3:
            return aster.FunctionCall(p[0])
        return p[0]
    
    @pg.production('function_call_open : function_call_open COMMA expression')
    def function_call_cont(p):
        return p[0].add(p[2])

    @pg.production('function_call_open : identifier OPEN_PAREN expression')
    @pg.production('function_call_open : reference OPEN_PAREN expression')
    @pg.production('function_call_open : user_type OPEN_PAREN expression')
    def function_call_open(p):
        return aster.FunctionCall(p[0],p[2])
    
    @pg.production('c_val : C_VAL OPEN_PAREN expression CLOSE_PAREN')
    def c_val(p):
        return aster.Cval(p[2])
    
    @pg.production('c_lit : C_LIT OPEN_PAREN identifier CLOSE_PAREN')
    @pg.production('c_lit : C_LIT OPEN_PAREN null CLOSE_PAREN')
    @pg.production('c_lit : C_LIT OPEN_PAREN string CLOSE_PAREN')
    def c_val(p):
        return aster.Clit(p[2])
    
    @pg.production('c_type : C_TYPE OPEN_PAREN identifier CLOSE_PAREN')
    @pg.production('c_type : C_TYPE OPEN_PAREN c_raw CLOSE_PAREN')
    def c_val(p):
        return aster.Ctype(p[2])
    
    @pg.production('c_ptr : C_PTR OPEN_PAREN expression CLOSE_PAREN')
    def c_ptr(p):
        return aster.Cptr(p[2])
    
    @pg.production('c_call : C_CALL OPEN_PAREN identifier CLOSE_PAREN')
    def c_call(p):
        return aster.Ccall(p[2])
    
    @pg.production('c_call : c_call_open CLOSE_PAREN')
    def c_call_close(p):
        return p[0]
    
    @pg.production('c_raw : C_RAW OPEN_PAREN string COMMA c_val CLOSE_PAREN')
    @pg.production('c_raw : C_RAW OPEN_PAREN string COMMA c_ptr CLOSE_PAREN')
    @pg.production('c_raw : C_RAW OPEN_PAREN string COMMA c_call CLOSE_PAREN')
    @pg.production('c_raw : C_RAW OPEN_PAREN string COMMA c_lit CLOSE_PAREN')
    @pg.production('c_raw : C_RAW OPEN_PAREN string COMMA c_raw CLOSE_PAREN')
    @pg.production('c_raw : C_RAW OPEN_PAREN c_val COMMA string CLOSE_PAREN')
    @pg.production('c_raw : C_RAW OPEN_PAREN c_ptr COMMA string CLOSE_PAREN')
    @pg.production('c_raw : C_RAW OPEN_PAREN c_call COMMA string CLOSE_PAREN')
    @pg.production('c_raw : C_RAW OPEN_PAREN c_lit COMMA string CLOSE_PAREN')
    @pg.production('c_raw : C_RAW OPEN_PAREN c_raw COMMA string CLOSE_PAREN')
    @pg.production('c_raw : C_RAW OPEN_PAREN c_raw COMMA c_raw CLOSE_PAREN')
    @pg.production('c_raw : C_RAW OPEN_PAREN string CLOSE_PAREN')
    def c_raw(p):
        if len(p) == 4:
            return aster.Craw(p[2],aster.Clit(aster.Identifier(Token("",""))))
        return aster.Craw(p[2],p[4])
    
    @pg.production('c_call_open : C_CALL OPEN_PAREN identifier COMMA c_val')
    @pg.production('c_call_open : C_CALL OPEN_PAREN identifier COMMA c_ptr')
    @pg.production('c_call_open : C_CALL OPEN_PAREN identifier COMMA c_call')
    @pg.production('c_call_open : C_CALL OPEN_PAREN identifier COMMA c_lit')
    @pg.production('c_call_open : C_CALL OPEN_PAREN identifier COMMA c_raw')
    def c_call_open(p):
        tmp = aster.Ccall(p[2])
        return tmp.add(p[4])
    
    @pg.production('c_call_open : c_call_open COMMA c_val')
    @pg.production('c_call_open : c_call_open COMMA c_ptr')
    @pg.production('c_call_open : c_call_open COMMA c_call')
    @pg.production('c_call_open : c_call_open COMMA c_lit')
    @pg.production('c_call_open : c_call_open COMMA c_raw')
    def c_call_cont(p):
        return p[0].add(p[2])
    
    @pg.production('print : PRINT OPEN_PAREN CLOSE_PAREN')
    def pass_print(p):
        return aster.Print()
    
    @pg.production('print : print_open CLOSE_PAREN')
    def pass_print2(p):
        return p[0]
    
    @pg.production('print_open : PRINT OPEN_PAREN expression')
    def print_open(p):
        return aster.Print(p[2])
    
    @pg.production('print_open : print_open COMMA expression')
    def print_cont(p):
        return p[0].add(p[2])
    
    @pg.production('pass : PASS')
    def pass_pass(p):
        return aster.Pass()
    
    @pg.production('break : BREAK')
    def pass_break(p):
        return aster.Break()
    
    @pg.production('free : FREE OPEN_PAREN identifier CLOSE_PAREN')
    @pg.production('free : FREE OPEN_PAREN reference CLOSE_PAREN')
    def free(p):
        return aster.Free(p[2])
    
    @pg.production('reference : static_object PERIOD identifier')
    def reference2(p):
        return aster.StaticFunction(p[0],p[2])
    
    @pg.production('reference : identifier PERIOD identifier')
    @pg.production('reference : reference PERIOD identifier')
    def reference(p):
        return aster.Reference(p[0],p[2])
    
    @pg.production('number : NUMBER')
    @pg.production('number : IMAG')
    @pg.production('number : MINUS NUMBER')
    def number(p):
        if len(p) == 1:
            return aster.Number(p[0])
        else:
            return aster.Number(Token("NUMBER","-"+p[1].value))
        
    @pg.production('static_object : STATIC_OBJECT')
    def user_type(p):
        return aster.Identifier(p[0])
    
    @pg.production('user_type : USER_TYPE')
    def user_type(p):
        return aster.Identifier(p[0])

    @pg.production('identifier : IDENTIFIER')
    def identifier(p):
        return aster.Identifier(p[0])
    
    @pg.production('string : STRING')
    def string(p):
        return aster.String(p[0])
    
    @pg.production('null : NULL')
    def null(p):
        return aster.Null()

    @pg.error
    def error_handler(token):
        raise ValueError("Ran into a %s where it wasn't expected" % token.gettokentype())

    return pg.build()

