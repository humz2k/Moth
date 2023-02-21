from rply import ParserGenerator
import aster

class Parser():
    def __init__(self,token_list):
        tokens = [i[0] for i in token_list]
        self.pg = ParserGenerator(tokens, precedence=[
        ('left', ['PLUS', 'MINUS']),
        ('left', ['STAR', 'SLASH']),
        ('left', ['PERCENT']),
        ('left', ['STARSTAR']),
        ('left', ['EQUAL', 'NOT_EQUAL','GREATER','LESS','GREATER_OR_EQUAL','LESS_OR_EQUAL']),
        ('left', ['AND', 'OR']),
        ('left', ['NOT']),
        ('left', ['PERIOD'])
        ])
    
    def parse(self):

        

        @self.pg.production('line : declaration SEMI_COLON')
        def get_line(p):
            return aster.Line(p[0])

        @self.pg.production('declaration : type variable')
        def get_declaration(p):
            return aster.Declaration(p[0],p[1])

        @self.pg.production('type : TYPE_NAME')
        @self.pg.production('type : CLASS_NAME')
        @self.pg.production('type : USER_TYPE')
        def get_type(p):
            return aster.TypeName(p[0])

        @self.pg.production('variable : IDENTIFIER')
        def get_var(p):
            return aster.Variable(p[0])

        @self.pg.production('bool : TRUE')
        @self.pg.production('bool : FALSE')
        def get_bool(p):
            return aster.Bool(p[0])

        @self.pg.production('number : NUMBER')
        def get_number(p):
            return aster.Number(p[0])
            
        @self.pg.production('string : STRING')
        def get_string(p):
            return aster.Number(p[0])
    
    def error(self):
        @self.pg.error
        def error_handle(state,token):
            raise ValueError(token)

    def get_parser(self):
        return self.pg.build()