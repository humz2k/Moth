from rply import ParserGenerator

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
        ('left', ['PERCENT','STAR', 'SLASH']),
        ('left', ['MUL', 'DIV']),
        ('left', ['EQUAL_CMP', 'NEQUAL_CMP','GREATER','LESS','GREATER_EQ','LESS_EQ']),
        ('left', ['AND_CMP', 'OR_CMP'])
        ])

    def parse(self):
        
        

        @self.pg.error
        def error_handle(state,token):
            raise ValueError(token)

    def get_parser(self):
        self.pg.build()