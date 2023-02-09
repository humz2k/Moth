def Declaration(self):
    @self.pg.production('declaration : type identifier')
    def get_declaration(state,p):
        state.info(p,'declaration : type identifier')
        return self.ast.statements.declaration.Declaration(p[0],p[1])
    
    @self.pg.production('declare_line : declaration SEMI_COLON')
    def declare_line(state,p):
        state.info(p,'declare_line : declaration SEMI_COLON')
        return p[0]