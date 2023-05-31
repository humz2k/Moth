from rply import ParserGenerator
from rply.token import Token
import aster

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
        ('left', ['PLUS', 'MINUS']),
        ('left', ['STAR', 'SLASH', 'AT']),
        ('left', ['PERCENT']),
        ('left', ['STARSTAR']),
        ('left', ['EQUAL', 'NOT_EQUAL','GREATER','LESS','GREATER_OR_EQUAL','LESS_OR_EQUAL']),
        ('left', ['AMP', 'VERT','HAT','TILDE','LEFT_SHIFT','RIGHT_SHIFT']),
        ('left', ['AND', 'OR']),
        ('left', ['NOT']),
        ('left', ['BACKSLASH']),
        ('left', ['PERIOD']),
        ('left',["OPEN_SQUARE"]),
        ('left',["ASSIGN"])
    ])

    @pg.production('program : function')
    def pass_program(state,p):
        program = aster.Program()
        program.add(p[0])
        return program

    @pg.production('program : program function')
    def pass_program(state,p):
        p[0].add(p[1])
        return p[0]

    @pg.production('function : function_header OPEN_CURL lines CLOSE_CURL')
    def return_function(state,p):
        header,_,lines,_ = p
        return aster.Function(header,lines)

    @pg.production('function_header : DEF type FUNCTION_NAME OPEN_PAREN CLOSE_PAREN COLON')
    def function_header(state,p):
        _,typ,name,_,_,_ = p
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

    @pg.production('lines : line')
    def pass_lines(state,p):
        return [p[0]]
    
    @pg.production('lines : lines line')
    def pass_lines(state,p):
        return p[0] + [p[1]]
    
    @pg.production('line : RETURN expression SEMI_COLON')
    def pass_line(state,p):
        return aster.Return(p[1])
    
    @pg.production('line : PASS SEMI_COLON')
    def pass_line(state,p):
        return aster.Pass()
    
    @pg.production('line : BREAK SEMI_COLON')
    def pass_line(state,p):
        return aster.Break()
    
    @pg.production('line : expression SEMI_COLON')
    def pass_line(state,p):
        return p[0]
    
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
    
    @pg.production('expression : expression PLUS_PLUS')
    @pg.production('expression : expression MINUS_MINUS')
    def pass_expression(state,p):
        return aster.Incr(p[1].name,p[0])

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
    
    @pg.production('expression : type IDENTIFIER')
    def declaration(state,p):
        return aster.VarDec(p[0],p[1])
    
    @pg.production('expression : IDENTIFIER')
    def declaration(state,p):
        return aster.Var(p[0])
    
    @pg.production('expression : STRING')
    def string(state,p):
        return aster.String(p[0])
    
    @pg.production('expression : expression ASSIGN expression')
    def declaration(state,p):
        return aster.Assign(p[0],p[2])
    
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
    
    @pg.production('type : TYPE_NAME')
    def pass_type(state,p):
        return aster.BaseType(p[0])
    
    @pg.production('type : VECTOR_TYPE')
    def pass_type(state,p):
        return aster.VectorType(p[0])

    @pg.error
    def error_handler(state,token):
        print("ERROR AT",token,token.source_pos)
        exit()

    out = pg.build()
    print(out.lr_table.sr_conflicts)
    return out