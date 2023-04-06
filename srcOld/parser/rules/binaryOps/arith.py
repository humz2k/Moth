def MathOP(self):
    @self.pg.production('expression : expression PLUS expression')
    @self.pg.production('expression : expression MINUS expression')
    @self.pg.production('expression : expression STARSTAR expression')
    @self.pg.production('expression : expression STAR expression')
    @self.pg.production('expression : expression SLASH expression')
    @self.pg.production('expression : expression PERCENT expression')
    def get_binop(state,p):
        state.info(p,'expression : expression OP expression')
        op = p[1]
        if op.value == "+":
            return self.ast.binaryOps.arith.Add(p[0],p[2])
        if op.value == "-":
            return self.ast.binaryOps.arith.Sub(p[0],p[2])
        if op.value == "**":
            return self.ast.binaryOps.arith.Pwr(p[0],p[2])
        if op.value == "*":
            return self.ast.binaryOps.arith.Mul(p[0],p[2])
        if op.value == "/":
            return self.ast.binaryOps.arith.Div(p[0],p[2])
        if op.value == "%":
            return self.ast.binaryOps.arith.Mod(p[0],p[2])