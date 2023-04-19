import aster
from rply import ParserGenerator
from rply.token import Token
import sys

LINEOFFSET = 0

def get_parser(filename="tokens.txt",user_types = ["USER_TYPE"], statics = ["STATIC_OBJECT"], templates = ["TEMPLATE_T"], line_offset = 0):
    global LINEOFFSET
    LINEOFFSET = line_offset
    with open(filename,"r") as f:
        tokens = [i.split()[0] for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)] + user_types + statics + templates
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
    ('left', ['BACKSLASH']),
    ('left', ['PERIOD']),
    ('left',['three','two','one'])
    #('left', ['identifier','template_t'])
    ])

    @pg.production('program : scope')
    def program(p):
        return aster.Program(p[0],lineno=p[0].lineno)
    
    @pg.production('program : program scope')
    def add_program(p):
        return p[0].add(p[1])
    
    @pg.production('scope : scope_header scope_body')
    def scope(p):
        return aster.Scope(p[0],p[1],lineno=p[0].lineno)
    
    @pg.production('scope_header : function_header')
    @pg.production('scope_header : for_header')
    @pg.production('scope_header : while_header')
    @pg.production('scope_header : if_header')
    @pg.production('scope_header : elif_header')
    @pg.production('scope_header : else_header')
    @pg.production('scope_header : class_header')
    @pg.production('scope_header : kernel_header')
    def scope_header(p):
        return p[0]
    
    @pg.production('kernel_header_open_iterator : DEF KERNEL identifier OPEN_SQUARE identifier COLON expression')
    def open_kernel_header(p):
        return aster.KernelHeader(p[2],p[4],p[6],p[0].source_pos)
    
    @pg.production('kernel_header_open_iterator : kernel_header_open_iterator COMMA expression')
    def cont_kernel_header_iter(p):
        return p[0].add_expression(p[2])
    
    @pg.production('kernel_header_open_inputs : kernel_header_open_iterator CLOSE_SQUARE OPEN_PAREN identifier')
    @pg.production('kernel_header_open_inputs : kernel_header_open_iterator CLOSE_SQUARE OPEN_PAREN template_t')
    def kernel_header_inputs_open(p):
        return p[0].add_input(p[3])
    
    @pg.production('kernel_header_open_inputs : kernel_header_open_inputs COMMA identifier')
    @pg.production('kernel_header_open_inputs : kernel_header_open_inputs COMMA template_t')
    def kernel_header_inputs_cont(p):
        return p[0].add_input(p[2])
    
    @pg.production('kernel_header : kernel_header_open_inputs CLOSE_PAREN COLON')
    def kernel_header(p):
        return p[0]
    
    @pg.production('kernel_header : kernel_header_open_inputs CLOSE_PAREN TARGET ASSIGN STRING COLON')
    def kernel_header(p):
        return p[0].set_target(p[4])

    @pg.production('class_header : CLASS identifier COLON')
    #@pg.production('class_header : CLASS template_t COLON')
    @pg.production('class_header : CLASS identifier OPEN_PAREN identifier CLOSE_PAREN COLON')
    #@pg.production('class_header : CLASS identifier OPEN_PAREN template_t CLOSE_PAREN COLON')
    #@pg.production('class_header : CLASS template_t OPEN_PAREN identifier CLOSE_PAREN COLON')
    #@pg.production('class_header : CLASS template_t OPEN_PAREN template_t CLOSE_PAREN COLON')
    def class_header(p):
        if len(p) == 3:
            return aster.ClassHeader(p[1],lineno=p[0].source_pos)
        return aster.ClassHeader(p[1],p[3],lineno=p[0].source_pos)
    
    @pg.production('class_header : CLASS static_object OPEN_PAREN identifier CLOSE_PAREN COLON')
    def class_header_type_static(p):
        return aster.ClassHeader(p[1],"STATIC",lineno=p[0].source_pos)
    
    @pg.production('class_header : CLASS user_type OPEN_PAREN TYPE_QUERY CLOSE_PAREN COLON')
    def class_header_type_user_t(p):
        return aster.ClassHeader(p[1],"USER_T",lineno=p[0].source_pos)
    
    @pg.production('function_header : DEF type identifier OPEN_PAREN CLOSE_PAREN COLON')
    #@pg.production('function_header : DEF type template_t OPEN_PAREN CLOSE_PAREN COLON')
    @pg.production('function_header : DEF template_t identifier OPEN_PAREN CLOSE_PAREN COLON')
    #@pg.production('function_header : DEF template_t template_t OPEN_PAREN CLOSE_PAREN COLON')
    @pg.production('function_header : DEF array_template_type identifier OPEN_PAREN CLOSE_PAREN COLON')
    #@pg.production('function_header : DEF array_template_type template_t OPEN_PAREN CLOSE_PAREN COLON')
    @pg.production('function_header : DEF type identifier func_def_inputs COLON')
    #@pg.production('function_header : DEF type template_t func_def_inputs COLON')
    @pg.production('function_header : DEF template_t identifier func_def_inputs COLON')
    #@pg.production('function_header : DEF template_t template_t func_def_inputs COLON')
    @pg.production('function_header : DEF array_template_type identifier func_def_inputs COLON')
    #@pg.production('function_header : DEF array_template_type template_t func_def_inputs COLON')
    def function_header(p):
        if len(p) == 5:
            return aster.FunctionHeader(p[1],p[2],p[3],lineno=p[0].source_pos)
        else:
            return aster.FunctionHeader(p[1],p[2],aster.FunctionDefInputs(),lineno=p[0].source_pos)
        
    @pg.production('function_header : AT OVERLOAD SEMI_COLON DEF type identifier OPEN_PAREN CLOSE_PAREN COLON')
    #@pg.production('function_header : DEF type template_t OPEN_PAREN CLOSE_PAREN COLON')
    @pg.production('function_header : AT OVERLOAD SEMI_COLON DEF template_t identifier OPEN_PAREN CLOSE_PAREN COLON')
    #@pg.production('function_header : DEF template_t template_t OPEN_PAREN CLOSE_PAREN COLON')
    @pg.production('function_header : AT OVERLOAD SEMI_COLON  DEF array_template_type identifier OPEN_PAREN CLOSE_PAREN COLON')
    #@pg.production('function_header : DEF array_template_type template_t OPEN_PAREN CLOSE_PAREN COLON')
    @pg.production('function_header : AT OVERLOAD SEMI_COLON  DEF type identifier func_def_inputs COLON')
    #@pg.production('function_header : DEF type template_t func_def_inputs COLON')
    @pg.production('function_header : AT OVERLOAD SEMI_COLON  DEF template_t identifier func_def_inputs COLON')
    #@pg.production('function_header : DEF template_t template_t func_def_inputs COLON')
    @pg.production('function_header : AT OVERLOAD SEMI_COLON  DEF array_template_type identifier func_def_inputs COLON')
    #@pg.production('function_header : DEF array_template_type template_t func_def_inputs COLON')
    def function_header_ol(p):
        if len(p) == 8:
            return aster.FunctionHeader(p[4],p[5],p[6],overload=True,lineno=p[0].source_pos)
        else:
            return aster.FunctionHeader(p[4],p[5],aster.FunctionDefInputs(),overload=True,lineno=p[0].source_pos)
        
    @pg.production('if_header : IF expression COLON')
    def if_header(p):
        return aster.IfHeader(p[1],lineno=p[0].source_pos)
    
    @pg.production('elif_header : ELIF expression COLON')
    def elif_header(p):
        return aster.ElifHeader(p[1],lineno=p[0].source_pos)
    
    @pg.production('else_header : ELSE COLON')
    def else_header(p):
        return aster.ElseHeader(lineno=p[0].source_pos)
    
    @pg.production('for_header : FOR identifier IN range_obj COLON')
    @pg.production('for_header : FOR type_name identifier IN range_obj COLON')
    def for_header(p):
        if len(p) == 5:
            return aster.ForHeader(p[1],p[3],lineno=p[0].source_pos)
        else:
            return aster.ForHeader(p[2],p[4],p[1],lineno=p[0].source_pos)
    
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
        return aster.RangeObj(start,end,step,lineno=p[0].source_pos)

    @pg.production('while_header : WHILE expression COLON')
    def while_header(p):
        return aster.WhileHeader(p[1],lineno=p[0].source_pos)
    
    @pg.production('func_def_inputs_open : OPEN_PAREN type identifier')
    @pg.production('func_def_inputs_open : OPEN_PAREN type template_t')
    #@pg.production('func_def_inputs_open : OPEN_PAREN template_t identifier')
    def func_def_inputs_open(p):
        return aster.FunctionDefInputs((p[1],p[2]),lineno=p[0].source_pos)

    @pg.production('func_def_inputs_open : func_def_inputs_open COMMA type identifier')
    @pg.production('func_def_inputs_open : func_def_inputs_open COMMA type template_t')
    def func_def_inputs_cont(p):
        return p[0].add((p[2],p[3]))

    @pg.production('func_def_inputs : func_def_inputs_open CLOSE_PAREN')
    def func_def_inputs(p):
        return p[0]
    
    @pg.production('scope_body : OPEN_CURL lines CLOSE_CURL')
    def scope_body(p):
        return aster.ScopeBody(p[1],lineno=p[0].source_pos)
    
    @pg.production('lines : line')
    @pg.production('lines : lines line')
    def lines(p):
        if len(p) == 1:
            return aster.Lines(p[0],lineno=p[0].lineno)
        else:
            return p[0].add(p[1])
        
    @pg.production('line : declaration SEMI_COLON')
    @pg.production('line : assignment SEMI_COLON')
    @pg.production('line : function_call SEMI_COLON')
    @pg.production('line : pass SEMI_COLON')
    @pg.production('line : break SEMI_COLON')
    @pg.production('line : return SEMI_COLON')
    @pg.production('line : print SEMI_COLON')
    @pg.production('line : c_call SEMI_COLON')
    @pg.production('line : scope')
    def line(p):
        return p[0]
    
    @pg.production('return : RETURN expression')
    @pg.production('return : RETURN')
    def return_val(p):
        if len(p) == 2:
            return aster.Return(p[1],lineno=p[0].source_pos)
        else:
            return aster.Return(lineno=p[0].source_pos)
        
    @pg.production('declaration : type identifier')
    @pg.production('declaration : array_template_type identifier')
    @pg.production('declaration : template_t identifier')
    @pg.production('declaration : type template_t')
    @pg.production('declaration : array_template_type template_t')
    @pg.production('declaration : template_t template_t')
    def declaration(p):
        return aster.Declaration(p[0],p[1],lineno=p[0].lineno)
    
    @pg.production('assignment : declaration ASSIGN expression')
    @pg.production('assignment : identifier ASSIGN expression')
    @pg.production('assignment : reference ASSIGN expression')
    @pg.production('assignment : template_t ASSIGN expression')
    @pg.production('assignment : declaration ASSIGN allocobj')
    @pg.production('assignment : identifier ASSIGN allocobj')
    @pg.production('assignment : reference ASSIGN allocobj')
    @pg.production('assignment : template_t ASSIGN allocobj')
    def assignment(p):
        return aster.Assign(p[0],p[2],lineno=p[1].source_pos)
    
    @pg.production('assignment : identifier PLUS_EQUAL expression')
    @pg.production('assignment : reference PLUS_EQUAL expression')
    @pg.production('assignment : template_t PLUS_EQUAL expression')
    @pg.production('assignment : identifier MINUS_EQUAL expression')
    @pg.production('assignment : reference MINUS_EQUAL expression')
    @pg.production('assignment : template_t MINUS_EQUAL expression')
    @pg.production('assignment : identifier STARSTAR_EQUAL expression')
    @pg.production('assignment : reference STARSTAR_EQUAL expression')
    @pg.production('assignment : template_t STARSTAR_EQUAL expression')
    @pg.production('assignment : identifier STAR_EQUAL expression')
    @pg.production('assignment : reference STAR_EQUAL expression')
    @pg.production('assignment : template_t STAR_EQUAL expression')
    @pg.production('assignment : identifier SLASH_EQUAL expression')
    @pg.production('assignment : reference SLASH_EQUAL expression')
    @pg.production('assignment : template_t SLASH_EQUAL expression')
    @pg.production('assignment : identifier PERCENT_EQUAL expression')
    @pg.production('assignment : reference PERCENT_EQUAL expression')
    @pg.production('assignment : template_t PERCENT_EQUAL expression')
    def assignment2(p):
        return aster.AssignInc(p[0],p[2],p[1],lineno=p[1].source_pos)
    
    @pg.production('assignment : identifier PLUS_PLUS')
    @pg.production('assignment : reference PLUS_PLUS')
    @pg.production('assignment : template_t PLUS_PLUS')
    @pg.production('assignment : identifier MINUS_MINUS')
    @pg.production('assignment : reference MINUS_MINUS')
    @pg.production('assignment : template_t MINUS_MINUS')
    def inc(p):
        return aster.Inc(p[0],p[1],lineno=p[1].source_pos)
    
    @pg.production('array_template_type : open_array_template_type CLOSE_SQUARE')
    def pass_array_ttype(p):
        return p[0]

    @pg.production('array_type : open_array_type CLOSE_SQUARE')
    def pass_array_type(p):
        return p[0]
        
    @pg.production('type : type_name')
    @pg.production('type : array_type')
    def pass_type(p):
        return p[0]
    
    @pg.production('reference : array_reference_open CLOSE_SQUARE')
    def array_reference(p):
        #print("MATCHED REFERENCE")
        #print(p)
        return p[0]
    
    @pg.production('slice_range : COLON')
    def empty_slice_range(p):
        return aster.SliceRange(lineno=p[0].source_pos)
    
    @pg.production('slice_range : expression COLON')
    def start_slice_range(p):
        return aster.SliceRange(start = p[0], lineno=p[1].source_pos)
    
    @pg.production('slice_range : COLON expression')
    def end_slice_range(p):
        return aster.SliceRange(end = p[1], lineno=p[0].source_pos)
    
    @pg.production('slice_range : expression COLON expression COLON expression')
    def step_slice_range(p):
        return aster.SliceRange(start = p[0], end = p[2], step = p[4], lineno=p[1].source_pos)
    
    @pg.production('slice_range : expression COLON COLON expression')
    def step_slice_range(p):
        return aster.SliceRange(start = p[0], step = p[3], lineno=p[1].source_pos)
    
    @pg.production('slice_range : expression COLON expression')
    def step_slice_range(p):
        return aster.SliceRange(start = p[0], end = p[2], lineno=p[1].source_pos)
    
    @pg.production('slice_range : COLON expression COLON expression')
    def step_slice_range(p):
        return aster.SliceRange(end = p[1], step = p[3], lineno=p[0].source_pos)
    
    @pg.production('slice_range : COLON COLON expression')
    def step_slice_range(p):
        return aster.SliceRange(step = p[2], lineno=p[0].source_pos)

    @pg.production('array_reference_open : reference OPEN_SQUARE expression',precedence="one")
    @pg.production('array_reference_open : reference OPEN_SQUARE slice_range',precedence="one")
    @pg.production('array_reference_open : function_call OPEN_SQUARE expression',precedence="one")
    @pg.production('array_reference_open : function_call OPEN_SQUARE slice_range',precedence="one")
    @pg.production('array_reference_open : identifier OPEN_SQUARE expression',precedence="one")
    @pg.production('array_reference_open : identifier OPEN_SQUARE slice_range',precedence="one")
    def array_reference_open(p):
        return aster.ArrayReference(p[0],p[2],lineno=p[1].source_pos)

    @pg.production('array_reference_open : array_reference_open COMMA expression')
    @pg.production('array_reference_open : array_reference_open COMMA slice_range')
    def array_reference_cont(p):
        return p[0].add(p[2])
    
    @pg.production('alloc_array_open : type_name ARRAY OPEN_PAREN expression')
    @pg.production('alloc_array_open : template_t ARRAY OPEN_PAREN expression')
    def alloc_array_open(p):
        return aster.AllocArray(p[0],p[3],lineno=p[1].source_pos)

    @pg.production('alloc_array_open : alloc_array_open COMMA expression')
    def alloc_array_cont(p):
        return p[0].add(p[2])
    
    @pg.production('alloc_array : alloc_array_open CLOSE_PAREN')
    def alloc_array(p):
        return p[0]
        
    @pg.production('open_array_template_type : template_t OPEN_SQUARE COLON',precedence="two")
    def open_array_ttype(p):
        return aster.ArrayType(p[0],lineno=p[1].source_pos)
    
    @pg.production('open_array_template_type : open_array_template_type COMMA COLON')
    def cont_array_ttype(p):
        return p[0].add_dim()

    @pg.production('array_type : type_name OPEN_SQUARE CLOSE_SQUARE')
    @pg.production('array_type : array_type OPEN_SQUARE CLOSE_SQUARE')
    def inf_array_t(p):
        out = aster.ArrayType(p[0],lineno = p[1].source_pos)
        out.dimensions = 'inf'
        return out

    @pg.production('open_array_type : type_name OPEN_SQUARE COLON',precedence="three")
    @pg.production('open_array_type : array_type OPEN_SQUARE COLON',precedence="three")
    def open_array_type(p):
        return aster.ArrayType(p[0],lineno=p[1].source_pos)
    
    @pg.production('open_array_type : open_array_type COMMA COLON')
    def cont_array_type(p):
        return p[0].add_dim()
    
    @pg.production('allocobj : NEW function_call')
    def allocobj(p):
        return aster.AllocObject(p[1],lineno=p[0].source_pos)
    
    @pg.production('tuple_literal : OPEN_PAREN COMMA CLOSE_PAREN')
    @pg.production('tuple_literal : type_name_base OPEN_PAREN COMMA CLOSE_PAREN')
    def empty_tuple(p):
        if len(p) == 3:
            return aster.TupleLiteral(None,lineno=p[0].source_pos)
        return aster.TupleLiteral(p[0],lineno=p[1].source_pos)
    
    @pg.production('tuple_literal : OPEN_PAREN expression COMMA CLOSE_PAREN')
    @pg.production('tuple_literal : type_name_base OPEN_PAREN expression COMMA CLOSE_PAREN')
    def one_tuple(p):
        if len(p) == 4:
            return aster.TupleLiteral(None,p[1],lineno=p[0].source_pos)
        return aster.TupleLiteral(p[0],p[2],lineno=p[1].source_pos)
    
    @pg.production('tuple_literal : tuple_literal_open CLOSE_PAREN')
    def pass_tuple(p):
        return p[0]
    
    @pg.production('tuple_literal_open : OPEN_PAREN expression COMMA expression')
    @pg.production('tuple_literal_open : type_name_base OPEN_PAREN expression COMMA expression')
    def open_tuple(p):
        if len(p) == 4:
            out = aster.TupleLiteral(None,p[1],lineno=p[0].source_pos)
            return out.add(p[3])
        out = aster.TupleLiteral(p[0],p[2],lineno=p[1].source_pos)
        return out.add(p[4])
    
    @pg.production('tuple_literal_open : tuple_literal_open COMMA expression')
    def cont_tuple(p):
        return p[0].add(p[2])
    
    @pg.production('list_literal : OPEN_SQUARE CLOSE_SQUARE')
    def empty_list(p):
        return aster.ListLiteral(lineno=p[0].source_pos)
    
    @pg.production('list_literal : list_literal_open CLOSE_SQUARE')
    def close_list(p):
        return p[0]
    
    @pg.production('list_literal_open : OPEN_SQUARE expression')
    @pg.production('list_literal_open : OPEN_SQUARE allocobj')
    def open_list(p):
        return aster.ListLiteral(p[1],lineno=p[0].source_pos)

    @pg.production('list_literal_open : list_literal_open COMMA allocobj')
    @pg.production('list_literal_open : list_literal_open COMMA expression')
    def cont_list(p):
        return p[0].add(p[2])
    
    @pg.production('type_name_base : c_type')
    def c_type(p):
        return p[0]
    
    @pg.production('type_name_base : LIST type_name')
    @pg.production('type_name_base : LIST template_t')
    def list_type_name(p):
        return aster.ListType(p[1],lineno=p[0].source_pos)
    
    @pg.production('type_name_base : TUPLE type_name')
    @pg.production('type_name_base : TUPLE template_t')
    def list_type_name(p):
        return aster.TupleType(p[1],lineno=p[0].source_pos)
        
    @pg.production('type_name_base : TYPE_NAME')
    @pg.production('type_name_base : DTYPE')
    @pg.production('type_name_base : OBJECT identifier')
    def type_name(p):
        if len(p) == 1:
            return aster.Type(p[0],lineno=p[0].source_pos)
        if len(p) == 2:
            return aster.ObjectType(p[1],lineno=p[0].source_pos)
        
    @pg.production('template_t : TEMPLATE_T')
    def template_t_iden(p):
        #print("AHSDOASID")
        return aster.Template(aster.Identifier(p[0],p[0].source_pos),p[0].source_pos)
        
    @pg.production('type_name : type_name_base')
    def type_name_base(p):
        return p[0]
    
    #@pg.production('type_name : template_t')
    #def template_type(p):
    #    return p[0]
    
    #@pg.production('template_t : TEMPLATE_T')
    #def template(p):
    #    return aster.Template(p[0],lineno=p[0].source_pos)
        
    @pg.production('type_name : user_type')
    def user_type_name(p):
        return aster.ObjectType(p[0],lineno=p[0].lineno)
        
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
        return aster.BinOp(p[0],p[1],p[2],lineno=p[1].source_pos)
    
    @pg.production('expression : expression BACKSLASH identifier expression')
    def user_binop(p):
        return aster.BinOp(p[0],p[2],p[3],lineno=p[1].source_pos)
    
    @pg.production('expression : NOT expression')
    def pass_not(p):
        return aster.Not(p[1],lineno=p[0].source_pos)
        
    @pg.production('expression : OPEN_PAREN expression CLOSE_PAREN')
    def brackets(p):
        return p[1]
    
    @pg.production('expression : number|string|identifier|function_call|bool|reference|alloc_array|cast|c_call|c_ptr|c_val|null|c_lit|list_literal|c_raw|char|template_t|tuple_literal')
    def num_str_idn(p):
        return p[0]
    
    #@pg.production('expression : MINUS number')
    #def negative(p):
    #    return Token("number","-" + p[1].value)
    
    @pg.production('bool : TRUE|FALSE')
    def ret_bool(p):
        if p[0].name == "TRUE":
            return aster.Number(Token("Number","true"),lineno=p[0].source_pos)
        else:
            return aster.Number(Token("Number","false"),lineno=p[0].source_pos)
    
    @pg.production('cast : type_name_base OPEN_PAREN expression CLOSE_PAREN')
    @pg.production('cast : array_type OPEN_PAREN expression CLOSE_PAREN')
    def cast(p):
        return aster.Cast(p[0],p[2],lineno=p[1].source_pos)

    @pg.production('function_call : identifier OPEN_PAREN CLOSE_PAREN')
    @pg.production('function_call : reference OPEN_PAREN CLOSE_PAREN')
    @pg.production('function_call : user_type OPEN_PAREN CLOSE_PAREN')
    #@pg.production('function_call : template_t OPEN_PAREN CLOSE_PAREN')
    @pg.production('function_call : function_call_open CLOSE_PAREN')
    def function_call(p):
        if len(p) == 3:
            return aster.FunctionCall(p[0],lineno=p[1].source_pos)
        return p[0]
    
    @pg.production('function_call_open : function_call_open COMMA expression')
    @pg.production('function_call_open : function_call_open COMMA type_name')
    @pg.production('function_call_open : function_call_open COMMA array_type')
    def function_call_cont(p):
        return p[0].add(p[2])

    @pg.production('function_call_open : identifier OPEN_PAREN expression')
    @pg.production('function_call_open : identifier OPEN_PAREN type_name')
    @pg.production('function_call_open : identifier OPEN_PAREN array_type')
    @pg.production('function_call_open : reference OPEN_PAREN expression')
    @pg.production('function_call_open : reference OPEN_PAREN type_name')
    @pg.production('function_call_open : reference OPEN_PAREN array_type')
    @pg.production('function_call_open : user_type OPEN_PAREN expression')
    @pg.production('function_call_open : user_type OPEN_PAREN type_name')
    @pg.production('function_call_open : user_type OPEN_PAREN array_type')
    #@pg.production('function_call_open : template_t OPEN_PAREN expression')
    #@pg.production('function_call_open : template_t OPEN_PAREN type_name')
    #@pg.production('function_call_open : template_t OPEN_PAREN array_type')
    def function_call_open(p):
        return aster.FunctionCall(p[0],p[2],lineno=p[1].source_pos)
    
    @pg.production('c_val : C_VAL OPEN_PAREN expression CLOSE_PAREN')
    def c_val(p):
        return aster.Cval(p[2],lineno=p[0].source_pos)
    
    @pg.production('c_lit : C_LIT OPEN_PAREN identifier CLOSE_PAREN')
    @pg.production('c_lit : C_LIT OPEN_PAREN null CLOSE_PAREN')
    @pg.production('c_lit : C_LIT OPEN_PAREN string CLOSE_PAREN')
    def c_val(p):
        return aster.Clit(p[2],lineno=p[0].source_pos)
    
    @pg.production('c_type : C_TYPE OPEN_PAREN identifier CLOSE_PAREN')
    @pg.production('c_type : C_TYPE OPEN_PAREN c_raw CLOSE_PAREN')
    def c_val(p):
        return aster.Ctype(p[2],lineno=p[0].source_pos)
    
    @pg.production('c_ptr : C_PTR OPEN_PAREN expression CLOSE_PAREN')
    def c_ptr(p):
        return aster.Cptr(p[2],lineno=p[0].source_pos)
    
    @pg.production('c_call : C_CALL OPEN_PAREN identifier CLOSE_PAREN')
    def c_call(p):
        return aster.Ccall(p[2],lineno=p[0].source_pos)
    
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
            return aster.Craw(p[2],aster.Clit(aster.Identifier(Token("",""))),lineno=p[0].source_pos)
        return aster.Craw(p[2],p[4],lineno=p[0].source_pos)
    
    @pg.production('c_call_open : C_CALL OPEN_PAREN identifier COMMA c_val')
    @pg.production('c_call_open : C_CALL OPEN_PAREN identifier COMMA c_ptr')
    @pg.production('c_call_open : C_CALL OPEN_PAREN identifier COMMA c_call')
    @pg.production('c_call_open : C_CALL OPEN_PAREN identifier COMMA c_lit')
    @pg.production('c_call_open : C_CALL OPEN_PAREN identifier COMMA c_raw')
    def c_call_open(p):
        tmp = aster.Ccall(p[2],lineno=p[0].source_pos)
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
        return aster.Print(lineno=p[0].source_pos)
    
    @pg.production('print : print_open CLOSE_PAREN')
    def pass_print2(p):
        return p[0]
    
    @pg.production('print_open : PRINT OPEN_PAREN expression')
    def print_open(p):
        return aster.Print(p[2],lineno=p[0].source_pos)
    
    @pg.production('print_open : print_open COMMA expression')
    def print_cont(p):
        return p[0].add(p[2])
    
    @pg.production('pass : PASS')
    def pass_pass(p):
        return aster.Pass(lineno=p[0].source_pos)
    
    @pg.production('break : BREAK')
    def pass_break(p):
        return aster.Break(lineno=p[0].source_pos)
    
    @pg.production('reference : static_object PERIOD identifier')
    def reference2(p):
        return aster.StaticFunction(p[0],p[2],lineno=p[1].source_pos)
    
    #@pg.production('reference : alloc_array PERIOD identifier')
    #@pg.production('reference : identifier PERIOD identifier')
    #@pg.production('reference : function_call PERIOD identifier')
    #@pg.production('reference : reference PERIOD identifier')
    @pg.production('reference : expression PERIOD identifier')
    def reference(p):
        return aster.Reference(p[0],p[2],lineno=p[1].source_pos)
    
    @pg.production('number : NUMBER')
    @pg.production('number : IMAG')
    @pg.production('number : MINUS NUMBER')
    def number(p):
        if len(p) == 1:
            return aster.Number(p[0],lineno=p[0].source_pos)
        else:
            return aster.Number(Token("NUMBER","-"+p[1].value),lineno=p[0].source_pos)
        
    @pg.production('static_object : STATIC_OBJECT')
    def user_type(p):
        return aster.Identifier(p[0],lineno=p[0].source_pos)
    
    @pg.production('user_type : USER_TYPE')
    def user_type(p):
        return aster.Identifier(p[0],lineno=p[0].source_pos)

    @pg.production('identifier : IDENTIFIER')
    def identifier(p):
        return aster.Identifier(p[0],lineno=p[0].source_pos)
    
    #@pg.production('identifier : TEMPLATE_T')
    #def template_identifier(p):
    #    return aster.Identifier(p[0],lineno=p[0].source_pos)

    @pg.production('string : STRING')
    def string(p):
        return aster.String(p[0],lineno=p[0].source_pos)

    @pg.production('char : CHAR')
    def string(p):
        return aster.Char(p[0],lineno=p[0].source_pos)
    
    @pg.production('null : NULL')
    def null(p):
        return aster.Null(lineno=p[0].source_pos)

    @pg.error
    def error_handler(token):
        global LINEOFFSET
        if token.name == "SEMI_COLON":
            token.name = "LINEBREAK"
            token.value = r"\n"
        print("\033[1;33mMothParseError\033[0;0m(\033[1;31mUnexpectedToken\033[0;0m) @ \033[1;32mline " + str(token.source_pos.lineno - LINEOFFSET) + "\033[0;0m:",file=sys.stderr)
        print("   Token [\033[1;34m" + token.name + "\033[0;0m] (\033[1;34m" + token.value + "\033[0;0m) not expected",file=sys.stderr)
        exit()

    out = pg.build()
    #print(out.lr_table.sr_conflicts)
    return out

