from . import aster
from rply import ParserGenerator

def get_parser(filename="tokens.txt"):
    with open(filename,"r") as f:
        tokens = [i.split()[0] for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)]
    if "IGNORE" in tokens:
        tokens.remove("IGNORE")
    pg = ParserGenerator(tokens, precedence=[
    ('left', ['PLUS', 'MINUS']),
    ('left', ['STAR', 'SLASH']),
    ('left', ['PERCENT']),
    ('left', ['STARSTAR']),
    ('left', ['EQUAL', 'NOT_EQUAL','GREATER','LESS','GREATER_OR_EQUAL','LESS_OR_EQUAL']),
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
    def scope_header(p):
        return p[0]
    
    @pg.production('function_header : type IDENTIFIER OPEN_PAREN CLOSE_PAREN COLON')
    @pg.production('function_header : type IDENTIFIER function_def_inputs COLON')
    def function_header(p):
        if len(p) == 4:
            return aster.FunctionHeader(p[0],p[1],p[2])
        else:
            return aster.FunctionHeader(p[0],p[1],aster.FunctionDefInputs())
    
    @pg.production('scope_body : OPEN_CURL lines CLOSE_CURL')
    def scope_body(p):
        return aster.ScopeBody(p[1])
    
    @pg.production('lines : line')
    @pg.production('lines : lines line')
    def lines(p):
        if len(p) == 0:
            return aster.Lines(p[0])
        else:
            return p[0].add(p[1])

