def ArrayType(self):
    @self.pg.production('type : type index')
    def get_array_type(state,p):
        state.info(p,'type : type index')
        return self.ast.types.arrays.ArrayType(p[0],p[1])