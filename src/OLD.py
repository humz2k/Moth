from rply import ParserGenerator

class ParserState(object):
    def __init__(self):
        pass
    
    def info(self,p,text=""):
        pass

class Parser():
    def __init__(self,aster,filename = "src/tokens"):
        self.ast = aster
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