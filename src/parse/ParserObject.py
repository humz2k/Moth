from rply import ParserGenerator

class ParserState(object):
    def __init__(self):
        pass
    
    def info(self,p,text=""):
        pass

class Parser():
    def __init__(self,aster,parser_rules,filename = "src/tokens"):
        
        self.ast = aster
        with open(filename,"r") as f:
            tokens = [i.split()[0] for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)]
        if "IGNORE" in tokens:
            tokens.remove("IGNORE")
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
        self.parser_rules = parser_rules

    def bind(self):
        self.top_level = self.parser_rules.parser_top_level.top_level.__get__(self, self.__class__)
        self.scope_headers = self.parser_rules.parser_scope_headers.scope_headers.__get__(self, self.__class__)
        self.functions = self.parser_rules.parser_functions.functions.__get__(self, self.__class__)
        self.math = self.parser_rules.parser_math.math.__get__(self, self.__class__)
        self.expressions = self.parser_rules.parser_expressions.expressions.__get__(self, self.__class__)
        self.types = self.parser_rules.parser_types.types.__get__(self, self.__class__)

    def parse(self):
        self.bind()
        self.top_level()
        self.scope_headers()
        self.functions()
        self.math()
        self.expressions()
        self.types()
        self.error()
    
    def error(self):
        @self.pg.error
        def error_handle(state,token):
            raise ValueError(token)

    def get_parser(self):
        return self.pg.build()