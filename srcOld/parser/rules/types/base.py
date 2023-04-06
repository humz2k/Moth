def TypeObj(self):
    @self.pg.production('type : TYPE_NAME')
    def get_type(state,p):
        state.info(p,'type : TYPE_NAME')
        return self.ast.types.base.TypeObj(p[0])

