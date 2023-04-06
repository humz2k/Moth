def Expression(self):
    @self.pg.production('expression : OPEN_PAREN expression CLOSE_PAREN')
    def get_brackets(state,p):
        state.info(p,'expression : OPEN_PAREN expression CLOSE_PAREN')
        return p[1]
    
    @self.pg.production('expression : number')
    @self.pg.production('expression : bool')
    @self.pg.production('expression : identifier')
    @self.pg.production('expression : initialize')
    @self.pg.production('expression : func_call')
    @self.pg.production('expression : string')
    @self.pg.production('expression : cast')
    def get_expression(state,p):
        state.info(p,'expression : NUMBER')
        return p[0]