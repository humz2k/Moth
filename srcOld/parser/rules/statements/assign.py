from rply.token import Token

def Assign(self):
    @self.pg.production('assign : identifier PLUS_PLUS')
    @self.pg.production('assign : identifier MINUS_MINUS')
    def get_assign_increment(state,p):
        state.info(p,'assign : identifier PLUS_PLUS|MINUS_MINUS')
        if p[1].value == "++":
            value = self.ast.binaryOps.arith.Add(p[0],self.ast.constants.Number(Token('NUMBER','1')))
        if p[1].value == "--":
            value = self.ast.binaryOps.arith.Sub(p[0],self.ast.constants.Number(Token('NUMBER','1')))
        return self.ast.statements.assign.Assign(p[0],value)

    @self.pg.production('assign : identifier PLUS_EQUAL expression')
    @self.pg.production('assign : identifier MINUS_EQUAL expression')
    @self.pg.production('assign : identifier STARSTAR_EQUAL expression')
    @self.pg.production('assign : identifier STAR_EQUAL expression')
    @self.pg.production('assign : identifier SLASH_EQUAL expression')
    @self.pg.production('assign : identifier PERCENT_EQUAL expression')
    def get_assign_shorthand(state,p):
        state.info(p,'assign : declaration PLUS_EQUAL|MINUS_EQUAL|... expression')
        if p[1].value == "+=":
            value = self.ast.binaryOps.arith.Add(p[0],p[2])
        elif p[1].value == "-=":
            value = self.ast.binaryOps.arith.Sub(p[0],p[2])
        elif p[1].value == "**=":
            value = self.ast.binaryOps.arith.Pwr(p[0],p[2])
        elif p[1].value == "*=":
            value = self.ast.binaryOps.arith.Mul(p[0],p[2])
        elif p[1].value == "/=":
            value = self.ast.binaryOps.arith.Div(p[0],p[2])
        elif p[1].value == "%=":
            value = self.ast.binaryOps.arith.Mod(p[0],p[2])
        return self.ast.statements.assign.Assign(p[0],value)

    @self.pg.production('assign : declaration ASSIGN expression')
    @self.pg.production('assign : identifier ASSIGN expression')
    def get_assign(state,p):
        state.info(p,'assign : identifier|declaration ASSIGN expression')
        return self.ast.statements.assign.Assign(p[0],p[2])