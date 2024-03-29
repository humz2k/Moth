from rply import ParserGenerator
from rply.token import Token
from . import aster

class ParserState(object):
    def __init__(self):
        self.chain = []
    
    def last(self,item):
        self.chain.append(item)

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
    @pg.production('program : module')
    @pg.production('program : global_var')
    def pass_program(state,p):
        program = aster.Program()
        program.add(p[0])
        return program

    @pg.production('program : program function')
    @pg.production('program : program struct')
    @pg.production('program : program object')
    @pg.production('program : program cast')
    @pg.production('program : program kernel')
    @pg.production('program : program module')
    @pg.production('program : program global_var')
    def pass_program(state,p):
        p[0].add(p[1])
        return p[0]
    
    @pg.production('module_open : MODULE NAMESPACE COLON OPEN_CURL function')
    @pg.production('module_open : MODULE NAMESPACE COLON OPEN_CURL struct')
    @pg.production('module_open : MODULE NAMESPACE COLON OPEN_CURL object')
    #@pg.production('module_open : MODULE NAMESPACE COLON OPEN_CURL cast')
    @pg.production('module_open : MODULE NAMESPACE COLON OPEN_CURL kernel')
    @pg.production('module_open : MODULE NAMESPACE COLON OPEN_CURL module')
    @pg.production('module_open : MODULE NAMESPACE COLON OPEN_CURL global_var')
    def module(state,p):
        out = aster.Module(p[1].value)
        out.lineno = p[0].source_pos.lineno
        out.fileoforigin = p[0].fileoforigin
        out.add(p[4])
        return out
    
    @pg.production('module_open : module_open function')
    @pg.production('module_open : module_open struct')
    @pg.production('module_open : module_open object')
    #@pg.production('module_open : module_open cast')
    @pg.production('module_open : module_open kernel')
    @pg.production('module_open : module_open module')
    @pg.production('module_open : module_open global_var')
    def module(state,p):
        out,new = p
        out.add(new)
        return out
    
    @pg.production('module : module_open CLOSE_CURL')
    def module(state,p):
        return p[0]
    
    @pg.production('global_var : type IDENTIFIER SEMI_COLON')
    def global_var(state,p):
        out = aster.Global(p[0],p[1])
        out.lineno = p[1].source_pos.lineno
        out.fileoforigin = p[1].fileoforigin
        return out
    
    @pg.production('global_var : AT MODIFIER SEMI_COLON global_var')
    def global_var(state,p):
        _,m,_,g = p
        if m.value == "extern":
            g.extern = True
        return g
    
    @pg.production('function : AT MODIFIER SEMI_COLON function')
    def modifier(state,p):
        _,modifier,_,function = p
        function.modifiers[modifier.value] = True
        return function
    
    @pg.production('function : AT template SEMI_COLON function')
    def modifier(state,p):
        _,modifier,_,function = p
        function.is_template = True
        function.template_vars = p[1]
        return function
    
    @pg.production('template_open : TEMPLATE OPEN_PAREN IDENTIFIER')
    def pass_template(state,p):
        return [p[2]]
    
    @pg.production('template_open : template_open COMMA IDENTIFIER')
    def pass_template(state,p):
        return p[1] + [p[2]]
    
    @pg.production('template : template_open CLOSE_PAREN')
    def pass_template(state,p):
        return p[0]
    
    @pg.production('kernel : AT MODIFIER SEMI_COLON kernel')
    def modifier(state,p):
        _,modifier,_,function = p
        function.modifiers[modifier.value] = True
        return function
    
    @pg.production('function : function_header SEMI_COLON')
    def pass_func_def(state,p):
        out = aster.Function(p[0],[])
        out.lineno = p[1].source_pos.lineno
        out.fileoforigin = p[1].fileoforigin
        return out
    
    @pg.production('kernel : kernel_header SEMI_COLON')
    def pass_func_def(state,p):
        out = aster.Kernel(p[0],[])
        out.lineno = p[1].source_pos.lineno
        out.fileoforigin = p[1].fileoforigin
        return out
    
    @pg.production('cast : cast_header SEMI_COLON')
    def pass_func_def(state,p):
        out = aster.Cast(p[0],[])
        out.lineno = p[1].source_pos.lineno
        out.fileoforigin = p[1].fileoforigin
        return out

    @pg.production('struct_open : STRUCT STRUCT_NAME COLON OPEN_CURL')
    def pass_struct_open(state,p):
        out = aster.Struct(p[1])
        out.lineno = p[0].source_pos.lineno
        out.fileoforigin = p[0].fileoforigin
        return out
    
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
    
    #@pg.production('operator_open : ')
    #def operator_open(state,p):
    #    _,typ,_ = p
    #    return typ

    @pg.production('function_header : DEF type OPERATOR RIGHT_SHIFT OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR LEFT_SHIFT OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR PLUS OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR MINUS OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR STARSTAR OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR STAR OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR SLASH OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR PERCENT OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR EQUAL OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR NOT_EQUAL OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR GREATER_OR_EQUAL OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR LESS_OR_EQUAL OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR GREATER OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR LESS OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR AND OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR OR OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR AMP OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR VERT OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR HAT OPEN_PAREN type IDENTIFIER COMMA type IDENTIFIER CLOSE_PAREN')
    def operator_header(state,p):
        _,typ,_,op,_,l_type,left,_,r_type,right,_ = p
        func_name = Token("FUNCTION_NAME","operator->" + op.name)
        inputs = [[l_type,left],[r_type,right]]
        return aster.FunctionHeader(typ,func_name,inputs)
    
    @pg.production('function_header : DEF type OPERATOR MINUS OPEN_PAREN type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR TILDE OPEN_PAREN type IDENTIFIER CLOSE_PAREN')
    @pg.production('function_header : DEF type OPERATOR NOT OPEN_PAREN type IDENTIFIER CLOSE_PAREN')
    def operator_header(state,p):
        _,typ,_,op,_,l_type,left,_ = p
        func_name = Token("FUNCTION_NAME","operator->" + op.name)
        inputs = [[l_type,left]]
        return aster.FunctionHeader(typ,func_name,inputs)

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
        return aster.Range(aster.Constant(Token("NUMBER",0)),p[2],aster.Constant(Token("NUMBER",1)))
    
    @pg.production('expression : RANGE OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    def pass_range(state,p):
        return aster.Range(p[2],p[4],aster.Constant(Token("NUMBER",1)))
    
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
        out = aster.ForLoop(p[1],p[3],p[6])
        out.lineno = p[0].source_pos.lineno
        out.fileoforigin = p[0].fileoforigin
        return out

    @pg.production('lines : line')
    def pass_lines(state,p):
        return [p[0]]
    
    @pg.production('lines : lines line')
    def pass_lines(state,p):
        return p[0] + [p[1]]
    
    @pg.production('line : RETURN expression SEMI_COLON')
    def pass_line(state,p):
        out = aster.Return(p[1])
        out.lineno = p[0].source_pos.lineno
        out.fileoforigin = p[0].fileoforigin
        return out
    
    @pg.production('line : RETURN SEMI_COLON')
    def pass_line(state,p):
        out = aster.Return()
        out.lineno = p[0].source_pos.lineno
        out.fileoforigin = p[0].fileoforigin
        return out
    
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
        out = aster.BinOp(p[1],p[0],p[2])
        out.lineno = p[1].source_pos.lineno
        out.fileoforigin = p[1].fileoforigin
        return out
    
    @pg.production('expression : MINUS expression')
    @pg.production('expression : NOT expression')
    @pg.production('expression : TILDE expression')
    def pass_expression(state,p):
        out = aster.SinOp(p[0].name,p[1])
        out.fileoforigin = p[0].fileoforigin
        out.lineno = p[0].source_pos.lineno
        out.token = p[0].value
        return out
    
    @pg.production('expression : STAR expression')
    def var_deref(state,p):
        out = aster.VarDeref(p[1])
        out.fileoforigin = p[0].fileoforigin
        out.lineno = p[0].source_pos.lineno
        return out
    
    @pg.production('expression : STARSTAR expression')
    def var_deref(state,p):
        tmp = aster.VarDeref(p[1])
        tmp.fileoforigin = p[0].fileoforigin
        tmp.lineno = p[0].source_pos.lineno
        out = aster.VarDeref(tmp)
        out.fileoforigin = p[0].fileoforigin
        out.lineno = p[0].source_pos.lineno
        return out
    
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
    @pg.production('expression : NEW struct_namespace_ref OPEN_PAREN CLOSE_PAREN')
    def pass_function(state,p):
        out = aster.NewStruct(p[1])
        out.lineno = p[0].source_pos.lineno
        out.fileoforigin = p[0].fileoforigin
        return out
    
    @pg.production('struct_call_open : NEW STRUCT_NAME OPEN_PAREN expression')
    @pg.production('struct_call_open : NEW struct_namespace_ref OPEN_PAREN expression')
    def pass_function(state,p):
        return [p[1],p[3]]
    
    @pg.production('struct_call_open : struct_call_open COMMA expression')
    def pass_function(state,p):
        return p[0] + [p[2]]
    
    @pg.production('expression : struct_call_open CLOSE_PAREN')
    def pass_function(state,p):
        out = aster.NewStruct(p[0][0],p[0][1:])
        out.lineno = p[1].source_pos.lineno
        out.fileoforigin = p[1].fileoforigin
        return out
    
    @pg.production('namespace_ref : NAMESPACE')
    def pass_thing(state,p):
        return p[0].value
    
    @pg.production('namespace_ref : namespace_ref PERIOD NAMESPACE')
    def pass_thing(state,p):
        return p[0] + "." + p[2].value
    
    @pg.production('object_namespace_ref : namespace_ref PERIOD OBJECT_NAME')
    def pass_thing(state,p):
        return Token(p[2].name,p[0] + "." + p[2].value)
    
    @pg.production('struct_namespace_ref : namespace_ref PERIOD STRUCT_NAME')
    def pass_thing(state,p):
        return Token(p[2].name,p[0] + "." + p[2].value)
    
    @pg.production('expression : NEW OBJECT_NAME OPEN_PAREN CLOSE_PAREN')
    @pg.production('expression : NEW object_namespace_ref OPEN_PAREN CLOSE_PAREN')
    def pass_function(state,p):
        return aster.NewObject(p[1])
    
    @pg.production('object_call_open : NEW OBJECT_NAME OPEN_PAREN expression')
    @pg.production('object_call_open : NEW object_namespace_ref OPEN_PAREN expression')
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
        out = aster.VarDec(p[0],p[1])
        out.lineno = p[1].source_pos.lineno
        out.fileoforigin = p[1].fileoforigin
        return out
    
    @pg.production('expression : vardec')
    def declaration(state,p):
        return p[0]
    
    @pg.production('expression : IDENTIFIER')
    def declaration(state,p):
        out = aster.Var(p[0])
        out.fileoforigin = p[0].fileoforigin
        out.lineno = p[0].source_pos.lineno
        return out
    
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
        out = aster.Assign(p[0],p[2])
        out.fileoforigin = p[1].fileoforigin
        out.lineno = p[1].source_pos.lineno
        return out
    
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
        binop = aster.BinOp(Token(op,p[1].value),left,right)
        binop.lineno = p[1].source_pos.lineno
        binop.fileoforigin = p[1].fileoforigin
        out = aster.Assign(left,binop)
        out.lineno = p[1].source_pos.lineno
        out.fileoforigin = p[1].fileoforigin
        return out
    
    @pg.production('expression : AMP expression')
    def get_pointer(state,p):
        out = aster.GetPtr(p[1])
        out.fileoforigin = p[0].fileoforigin
        out.lineno = p[0].source_pos.lineno
        return out
    
    @pg.production('expression : PRINT OPEN_PAREN CLOSE_PAREN')
    def pass_print(state,p):
        out = aster.Print()
        out.lineno = p[0].source_pos.lineno
        out.fileoforigin = p[0].fileoforigin
        return out
    
    @pg.production('expression : PRINT OPEN_PAREN NONEWLN CLOSE_PAREN')
    def pass_print(state,p):
        tmp = aster.Print()
        tmp.lineno = p[0].source_pos.lineno
        tmp.fileoforigin = p[0].fileoforigin
        tmp.nonewline = True
        return tmp
    
    @pg.production('print_open : PRINT OPEN_PAREN expression')
    def pass_print(state,p):
        tmp = aster.Print()
        tmp.lineno = p[0].source_pos.lineno
        tmp.fileoforigin = p[0].fileoforigin
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
    
    @pg.production('expression : TYPE_QUERY OPEN_PAREN type CLOSE_PAREN')
    def pass_sizeof(state,p):
        return aster.TypeStr(p[2])
    
    @pg.production('expression : print_open CLOSE_PAREN')
    def pass_print(state,p):
        return p[0]
    
    @pg.production('expression : print_open COMMA NONEWLN CLOSE_PAREN')
    def pass_print(state,p):
        p[0].nonewline = True
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
    
    @pg.production('array_literal_open : OPEN_CURL expression')
    def pass_arr_lit(state,p):
        return [p[1]]
    
    @pg.production('array_literal_open : array_literal_open COMMA expression')
    def pass_arr_lit(state,p):
        return p[0] + [p[-1]]
    
    @pg.production('expression : array_literal_open CLOSE_CURL')
    def pass_arr_lit(state,p):
        return aster.ArrayLiteral(p[0])
    
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
        out = aster.VarReference(p[0],p[2])
        out.lineno = p[1].source_pos.lineno
        out.fileoforigin = p[1].fileoforigin
        return out
    
    @pg.production('ref_func : expression PERIOD FUNCTION_NAME')
    def pass_var(state,p):
        return aster.FuncReference(p[0],p[2])
    
    @pg.production('identifier : NAMESPACE PERIOD IDENTIFIER')
    def pass_var(state,p):
        out = Token("IDENTIFIER",p[0].value + "." + p[2].value)
        out.fileoforigin = p[0].fileoforigin
        out.source_pos = p[0].source_pos
        return out
    
    @pg.production('identifier : NAMESPACE PERIOD identifier')
    def pass_var(state,p):
        out = Token("IDENTIFIER",p[0].value + "." + p[2].value)
        out.fileoforigin = p[0].fileoforigin
        out.source_pos = p[0].source_pos
        return out
    
    @pg.production('expression : identifier')
    def pass_global_var(state,p):
        out = aster.Var(p[0])
        out.fileoforigin = p[0].fileoforigin
        out.lineno = p[0].source_pos.lineno
        return out

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
    
    @pg.production('type : NAMESPACE PERIOD type')
    def pass_namespace_type(state,p):
        return aster.NamespaceType(p[0].value,p[2])
    
    @pg.production('type : OBJECT_NAME')
    def pass_type(state,p):
        return aster.ObjectType(p[0])
    
    @pg.production('type : VECTOR_TYPE')
    def pass_type(state,p):
        return aster.VectorType(p[0])
    
    @pg.production('type : type STAR')
    def pass_type(state,p):
        return aster.PointerType(p[0])
    
    @pg.production('type : type STARSTAR')
    def pass_type(state,p):
        return aster.PointerType(aster.PointerType(p[0]))
    
    @pg.production('type : LESS IDENTIFIER GREATER')
    def pass_template_type(state,p):
        return aster.TemplateType(p[1])
    
    @pg.production('open_printf : PRINTF OPEN_PAREN expression')
    def open_printf(state,p):
        return [p[2]]
    
    @pg.production('open_printf : open_printf COMMA expression')
    def open_printf(state,p):
        return p[0] + [p[2]]
    
    @pg.production('expression : open_printf CLOSE_PAREN')
    def close_printf(state,p):
        out = aster.Printf(p[0])
        out.fileoforigin = p[1].fileoforigin
        out.lineno = p[1].source_pos.lineno
        return out

    @pg.error
    def error_handler(state,token):
        if token.value == '$end':
            token.fileoforigin = "???"
            token.source_pos = TMP()
            token.source_pos.lineno = "???"
            
        print("\x1b[1;31mParsing Error\x1b[0;0m \x1b[1;29m(" + "\x1b[1;30m" + token.fileoforigin + "\x1b[0;0m\x1b[0;31m @\x1b[1;30m line " + str(token.source_pos.lineno) + "\x1b[0;0m\x1b[1;29m):\x1b[0;0m")
        if token.value != ";":
            print("   \x1b[1;35mToken \x1b[1;33m" + token.value + "\x1b[0;0m \x1b[1;35mwas unexpected...\x1b[0;0m")
        else:
            print("   \x1b[1;35mSyntax error\x1b[0;0m")
        if token.fileoforigin == "???":
            exit()
        with open(token.fileoforigin,"r") as f:
            lines = f.read().splitlines()
        if token.source_pos.lineno <= len(lines):
            line = token.source_pos.lineno - 1
            start = line - 3
            if start < 0:
                start = 0
            end = line + 4
            if end > len(lines):
                end = len(lines)
            tmp = [i.rstrip() for i in lines[start:end]]
            lens = [len(i) - len(i.lstrip()) for i in tmp if len(i.strip()) != 0]
            min_len = min(lens)
            out = []
            for i,idx in zip(tmp,list(range(start,end))):
                if idx == line:
                    out.append("      " + i[min_len:] + "  \x1b[1;31m<--\x1b[1;30m")
                else:
                    out.append("      " + i[min_len:])
            if start != 0:
                out = ["      ..."] + out
            if end != len(lines):
                out.append("      ...")
            out = "\n".join(out)
            out = "\x1b[1;30m" + out + "\x1b[0;0m"
            print(out)
        exit()

    out = pg.build()
    if len(out.lr_table.sr_conflicts) != 0:
        print(out.lr_table.sr_conflicts)
    return out

def parse(tokens,path):
    parser = get_parser(filename = path)
    parsed = parser.parse(iter(tokens),ParserState())
    return parsed

class TMP:
    def __init__(self):
        pass