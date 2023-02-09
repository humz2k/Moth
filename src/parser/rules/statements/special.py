def Return(self):
    @self.pg.production('return : RETURN')
    def get_return(state,p):
        state.info(p,'return : RETURN')
        return self.ast.statements.special.Return()

    @self.pg.production('return : RETURN expression')
    def get_return_val(state,p):
        state.info(p,'return : RETURN expression')
        return self.ast.statements.special.Return(p[1])

def Break(self):
    @self.pg.production('break : BREAK')
    def get_return(state,p):
        state.info(p,'break : Break')
        return self.ast.statements.special.Break()