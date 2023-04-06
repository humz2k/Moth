def ComparisonOP(self):
    @self.pg.production('expression : expression EQUAL expression')
    @self.pg.production('expression : expression NOT_EQUAL expression')
    @self.pg.production('expression : expression GREATER expression')
    @self.pg.production('expression : expression LESS expression')
    @self.pg.production('expression : expression GREATER_OR_EQUAL expression')
    @self.pg.production('expression : expression LESS_OR_EQUAL expression')
    def get_binop(state,p):
        state.info(p,'expression : expression OP expression')
        op = p[1]
        if op.value == "==":
            return self.ast.binaryOps.comparison.Equal(p[0],p[2])
        if op.value == "!=":
            return self.ast.binaryOps.comparison.NotEqual(p[0],p[2])
        if op.value == ">":
            return self.ast.binaryOps.comparison.Greater(p[0],p[2])
        if op.value == "<":
            return self.ast.binaryOps.comparison.Less(p[0],p[2])
        if op.value == ">=":
            return self.ast.binaryOps.comparison.GreaterOrEqual(p[0],p[2])
        if op.value == "<=":
            return self.ast.binaryOps.comparison.LessOrEqual(p[0],p[2])