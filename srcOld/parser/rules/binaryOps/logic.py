def LogicOP(self):
    @self.pg.production('expression : expression AND expression')
    @self.pg.production('expression : expression OR expression')
    def get_binop(state,p):
        state.info(p,'expression : expression OP expression')
        op = p[1]
        if op.value == "and":
            return self.ast.binaryOps.logic.And(p[0],p[2])
        if op.value == "or":
            return self.ast.binaryOps.logic.And(p[0],p[2])

def Not(self):
    @self.pg.production('expression : NOT expression')
    def get_not(state,p):
        state.info(p,'expression : NOT expression')
        return self.ast.binaryOps.logic.Not(p[1])