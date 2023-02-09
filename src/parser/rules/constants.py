def Bool(self):
    @self.pg.production('bool : TRUE')
    @self.pg.production('bool : FALSE')
    def get_bool(state,p):
        state.info(p,'bool : TRUE|FALSE')
        return self.ast.constants.Bool(p[0])

def Number(self):
    @self.pg.production('number : NUMBER')
    def get_number(state,p):
        state.info(p,'number : NUMBER')
        return self.ast.constants.Number(p[0])
    
def String(self):
    @self.pg.production('string : STRING')
    def get_string(state,p):
        state.info(p,'string : STRING')
        return self.ast.constants.String(p[0])