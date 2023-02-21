from rply import LexerGenerator

class Lexer():
    def __init__(self):
        self.lexer = LexerGenerator()
    
    def add_tokens(self,tokens):
        for i in tokens:
            if i[0] == "IGNORE":
                self.lexer.ignore(i[1])
            else:
                if len(i[1]) > 0:
                    self.lexer.add(i[0],i[1])
    
    def get_lexer(self):
        return self.lexer.build()