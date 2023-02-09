from rply.token import Token

def Arange(self):
    @self.pg.production('expression : RANGE OPEN_PAREN expression CLOSE_PAREN')
    @self.pg.production('expression : RANGE OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    @self.pg.production('expression : RANGE OPEN_PAREN expression COMMA expression COMMA expression CLOSE_PAREN')
    def get_iterator(state,p):
        state.info(p,'expression : RANGE OPEN_PAREN expression [COMMA expression [COMMA expression]] CLOSE_PAREN')
        if len(p) == 8:
            first = p[2]
            second = p[4]
            third = p[6]
        elif len(p) == 6:
            first = p[2]
            second = p[4]
            third = self.ast.constants.Number(Token('NUMBER','1'))
        elif len(p) == 4:
            first = self.ast.constants.Number(Token('NUMBER','0'))
            second = p[2]
            third = self.ast.constants.Number(Token('NUMBER','1'))
        return self.ast.iterators.Arange(first,second,third)

def Linspace(self):
    @self.pg.production('expression : LINSPACE OPEN_PAREN expression COMMA expression COMMA expression CLOSE_PAREN')
    def get_linspace(state,p):
        state.info(p,'expression : LINSPACE OPEN_PAREN expression COMMA expression COMMA expression CLOSE_PAREN')
        return self.ast.iterators.Linspace(p[2],p[4],p[6])