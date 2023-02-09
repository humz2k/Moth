def Cast(self):
    @self.pg.production('cast : type OPEN_PAREN expression CLOSE_PAREN')
    def get_cast(state,p):
        state.info(p,'cast : type OPEN_PAREN expression CLOSE_PAREN')
        return self.ast.types.convert.Cast(p[0],p[2])