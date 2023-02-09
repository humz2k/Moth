from rply.token import Token

def Print(self):   

    @self.pg.production('print_open : PRINT OPEN_PAREN')
    def get_print_open(state,p):
        state.info(p,'print_open : PRINT OPEN_PAREN')
        return self.ast.statements.output.Print()
    
    @self.pg.production('print_open : print_open expression COMMA')
    def cont_print_open(state,p):
        state.info(p,'print_open : print_open expression COMMA')
        return p[0].add_expression(p[1])

    @self.pg.production('print : print_open CLOSE_PAREN')
    @self.pg.production('print : print_open expression CLOSE_PAREN')
    def get_print(state,p):
        state.info(p,'print : print_open CLOSE_PAREN')
        if len(p) == 3:
            p[0].add_expression(p[1])
        return p[0].add_expression(self.ast.constants.String(Token('STRING',r'"\n"')))