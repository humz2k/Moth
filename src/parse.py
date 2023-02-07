from rply import ParserGenerator
from aster import *

class ParserState(object):
    def __init__(self):
        pass
    
    def info(self,p,text=""):
        pass

class Parser():
    def __init__(self,filename = "src/tokens"):
        with open(filename,"r") as f:
            tokens = [i.split()[0] for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)]
        self.pg = ParserGenerator(tokens, precedence=[
        ('left', ['PLUS', 'MINUS']),
        ('left', ['STAR', 'SLASH']),
        ('left', ['PERCENT']),
        ('left', ['STARSTAR']),
        ('left', ['EQUAL', 'NOT_EQUAL','GREATER','LESS','GREATER_OR_EQUAL','LESS_OR_EQUAL']),
        ('left', ['AND', 'OR'])
        ])

    def parse(self):
        
        @self.pg.production('program : scope')
        def init_program(state,p):
            state.info(p,'program : scope')
            return Program(p[0])
        
        @self.pg.production('program : program scope')
        def continue_program(state,p):
            state.info(p,'program : program scope')
            return p[0].add_scope(p[1])

        @self.pg.production('scope : scope_header OPEN_CURL lines CLOSE_CURL')
        def get_scope(state,p):
            state.info(p,'scope : scope_header OPEN_CURL lines CLOSE_CURL')
            return Scope(p[0],p[2])
        
        @self.pg.production('scope_header : func_def COLON')
        def get_scope_header(state,p):
            state.info(p,'scope_header : func_def')
            return p[0]

        @self.pg.production('func_input_open : DEF declaration OPEN_PAREN')
        def init_func_def(state,p):
            state.info(p,'func_input_open : DEF declaration OPEN_PAREN')
            return FunctionDef(p[1])
        
        @self.pg.production('func_def : func_input_open CLOSE_PAREN')
        def close_func_def(state,p):
            state.info(p,'func_def : func_input_open CLOSE_PAREN')
            return p[0]

        @self.pg.production('lines : line')
        def init_lines(state,p):
            state.info(p,'lines : line')
            return Lines(p[0])
        
        @self.pg.production('lines : lines line')
        def continue_lines(state,p):
            state.info(p,'lines : lines line')
            return p[0].add_line(p[1])
        
        @self.pg.production('line : scope')
        @self.pg.production('line : assign SEMI_COLON')
        #@self.pg.production('line : function_call')
        def sub_scope(state,p):
            state.info(p,'line : scope|assign|function_call')
            return p[0]
        
        @self.pg.production('assign : declaration ASSIGN expression')
        @self.pg.production('assign : identifier ASSIGN expression')
        def get_assign(state,p):
            state.info(p,'assign : declaration ASSIGN expression')
            return Assign(p[0],p[2])
        
        @self.pg.production('expression : OPEN_PAREN expression CLOSE_PAREN')
        def get_brackets(state,p):
            state.info(p,'expression : OPEN_PAREN expression CLOSE_PAREN')
            return p[1]

        @self.pg.production('expression : expression PLUS expression')
        @self.pg.production('expression : expression MINUS expression')
        @self.pg.production('expression : expression STARSTAR expression')
        @self.pg.production('expression : expression STAR expression')
        @self.pg.production('expression : expression SLASH expression')
        @self.pg.production('expression : expression PERCENT expression')
        @self.pg.production('expression : expression EQUAL expression')
        @self.pg.production('expression : expression NOT_EQUAL expression')
        @self.pg.production('expression : expression GREATER expression')
        @self.pg.production('expression : expression LESS expression')
        @self.pg.production('expression : expression GREATER_OR_EQUAL expression')
        @self.pg.production('expression : expression LESS_OR_EQUAL expression')
        @self.pg.production('expression : expression AND expression')
        @self.pg.production('expression : expression OR expression')
        def get_binop(state,p):
            state.info(p,'expression : expression OP expression')
            op = p[1]
            if op.value == "+":
                return Add(p[0],p[2])
            if op.value == "-":
                return Sub(p[0],p[2])
            if op.value == "**":
                return Pwr(p[0],p[2])
            if op.value == "*":
                return Mul(p[0],p[2])
            if op.value == "/":
                return Div(p[0],p[2])
            if op.value == "%":
                return Mod(p[0],p[2])
            if op.value == "==":
                return Equal(p[0],p[2])
            if op.value == "!=":
                return NotEqual(p[0],p[2])
            if op.value == ">":
                return Greater(p[0],p[2])
            if op.value == "<":
                return Less(p[0],p[2])
            if op.value == ">=":
                return GreaterOrEqual(p[0],p[2])
            if op.value == "<=":
                return LessOrEqual(p[0],p[2])
            if op.value == "and":
                return And(p[0],p[2])
            if op.value == "or":
                return And(p[0],p[2])

        @self.pg.production('expression : number')
        @self.pg.production('expression : identifier')
        def get_expression(state,p):
            state.info(p,'expression : NUMBER')
            return p[0]
        
        @self.pg.production('declaration : type identifier')
        def get_declaration(state,p):
            state.info(p,'declaration : type identifier')
            return Declaration(p[0],p[1])

        @self.pg.production('identifier : IDENTIFIER')
        def get_identifier(state,p):
            state.info(p,'identifier : IDENTIFIER')
            return Identifier(p[0])
    
        @self.pg.production('number : NUMBER')
        def get_number(state,p):
            state.info(p,'number : NUMBER')
            return Number(p[0])

        @self.pg.production('type : TYPE_NAME')
        def get_type(state,p):
            state.info(p,'type : TYPE_NAME')
            return TypeObj(p[0])

        @self.pg.error
        def error_handle(state,token):
            raise ValueError(token)

    def get_parser(self):
        return self.pg.build()