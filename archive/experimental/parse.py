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
        print("MATCHED PROGRAM")
    
    @pg.production('program : program scope')
    def add_program(p):
        print("Adding scope to program")
    
    @pg.production('scope : function | class | kernel')
    def scope(p):
        print("Matched scope")

    @pg.production('function_open : DEF moth_type IDENTIFIER OPEN_PAREN function_def_inputs CLOSE_PAREN COLON OPEN_CURL')
    @pg.production('function_open : DEF moth_type IDENTIFIER OPEN_PAREN CLOSE_PAREN COLON OPEN_CURL')
    def function(p):
        print("Matched open function")
    
    @pg.production('function_open : function_open line')
    def function_add(p):
        print("Adding line to function")

    @pg.production('function_open : ')

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

