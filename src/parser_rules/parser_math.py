def math(self):
    @self.pg.production('expression : OPEN_PAREN expression CLOSE_PAREN')
    def get_brackets(state,p):
        state.info(p,'expression : OPEN_PAREN expression CLOSE_PAREN')
        return p[1]

    @self.pg.production('expression : NOT expression')
    def get_not(state,p):
        state.info(p,'expression : NOT expression')
        return self.ast.expressions.Not(p[1])

    @self.pg.production('expression : expression PLUS expression')
    @self.pg.production('expression : expression MINUS expression')
    @self.pg.production('expression : expression STARSTAR expression')
    @self.pg.production('expression : expression STAR expression')
    @self.pg.production('expression : expression SLASH expression')
    @self.pg.production('expression : expression PERCENT expression')
    @self.pg.production('expression : expression EQUAL expression')
    @self.pg.production('expression : expression NOT_EQUAL expression')
    @self.pg.production('expression : expression GREATER expression')
    @self.pg.production('expression : expression LESS expression')
    @self.pg.production('expression : expression GREATER_OR_EQUAL expression')
    @self.pg.production('expression : expression LESS_OR_EQUAL expression')
    @self.pg.production('expression : expression AND expression')
    @self.pg.production('expression : expression OR expression')
    def get_binop(state,p):
        state.info(p,'expression : expression OP expression')
        op = p[1]
        if op.value == "+":
            return self.ast.expressions.Add(p[0],p[2])
        if op.value == "-":
            return self.ast.expressions.Sub(p[0],p[2])
        if op.value == "**":
            return self.ast.expressions.Pwr(p[0],p[2])
        if op.value == "*":
            return self.ast.expressions.Mul(p[0],p[2])
        if op.value == "/":
            return self.ast.expressions.Div(p[0],p[2])
        if op.value == "%":
            return self.ast.expressions.Mod(p[0],p[2])
        if op.value == "==":
            return self.ast.expressions.Equal(p[0],p[2])
        if op.value == "!=":
            return self.ast.expressions.NotEqual(p[0],p[2])
        if op.value == ">":
            return self.ast.expressions.Greater(p[0],p[2])
        if op.value == "<":
            return self.ast.expressions.Less(p[0],p[2])
        if op.value == ">=":
            return self.ast.expressions.GreaterOrEqual(p[0],p[2])
        if op.value == "<=":
            return self.ast.expressions.LessOrEqual(p[0],p[2])
        if op.value == "and":
            return self.ast.expressions.And(p[0],p[2])
        if op.value == "or":
            return self.ast.expressions.And(p[0],p[2])