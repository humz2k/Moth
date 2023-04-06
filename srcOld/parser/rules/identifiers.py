def Identifier(self):
    @self.pg.production('identifier : IDENTIFIER')
    def get_identifier(state,p):
        state.info(p,'identifier : IDENTIFIER')
        return self.ast.identifiers.Identifier(p[0])

def Reference(self):
    @self.pg.production('identifier : identifier PERIOD identifier')
    @self.pg.production('identifier : func_call PERIOD identifier')
    def get_reference_to(state,p):
        state.info(p,'identifier : identifier PERIOD identifier')
        return self.ast.identifiers.Reference(p[0],p[2])