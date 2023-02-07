def types(self):
    @self.pg.production('declaration : type identifier')
    def get_declaration(state,p):
        state.info(p,'declaration : type identifier')
        return self.ast.types.Declaration(p[0],p[1])

    @self.pg.production('type : TYPE_NAME')
    def get_type(state,p):
        state.info(p,'type : TYPE_NAME')
        return self.ast.types.TypeObj(p[0])