def expressions(self):
    @self.pg.production('expression : number')
    @self.pg.production('expression : identifier')
    def get_expression(state,p):
        state.info(p,'expression : NUMBER')
        return p[0]
    
    @self.pg.production('assign : declaration ASSIGN expression')
    @self.pg.production('assign : identifier ASSIGN expression')
    def get_assign(state,p):
        state.info(p,'assign : declaration ASSIGN expression')
        return self.ast.expressions.Assign(p[0],p[2])

    @self.pg.production('identifier : IDENTIFIER')
    def get_identifier(state,p):
        state.info(p,'identifier : IDENTIFIER')
        return self.ast.expressions.Identifier(p[0])

    @self.pg.production('number : NUMBER')
    def get_number(state,p):
        state.info(p,'number : NUMBER')
        return self.ast.expressions.Number(p[0])