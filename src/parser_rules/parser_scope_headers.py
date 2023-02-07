def scope_headers(self):
    @self.pg.production('scope_header : func_def COLON')
    def get_scope_header(state,p):
        state.info(p,'scope_header : func_def')
        return p[0]