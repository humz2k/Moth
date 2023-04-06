from rply import LexerGenerator

class Lexer():
    def __init__(self):
        self.lexer = LexerGenerator()
    
    def _add_tokens(self,filename = "src/tokens"):
        
        with open(filename,"r") as f:
            raw = [i.split() for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)]

        for i in raw:
            if i[0] == "IGNORE":
                self.lexer.ignore(i[1])
            else:
                self.lexer.add(i[0],i[1])
    
    def get_lexer(self):
        self._add_tokens()
        return self.lexer.build()