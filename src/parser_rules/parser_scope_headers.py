def scope_headers(self):
    @self.pg.production('func_def_header : func_def COLON')
    def get_scope_header(state,p):
        state.info(p,'func_def_header : func_def')
        return p[0]
    
    @self.pg.production('if_header : IF expression COLON')
    def get_if_header(state,p):
        state.info(p,'if_header : IF expression COLON')
        return self.ast.conditionals.IfHeader(p[1])
    
    @self.pg.production('elif_header : ELIF expression COLON')
    def get_if_header(state,p):
        state.info(p,'elif_header : ELIF expression COLON')
        return self.ast.conditionals.ElifHeader(p[1])
    
    @self.pg.production('else_header : ELSE COLON')
    def get_if_header(state,p):
        state.info(p,'else_header : ELSE COLON')
        return self.ast.conditionals.ElseHeader()
    
    @self.pg.production('while_loop_header : WHILE expression COLON')
    def get_while_header(state,p):
        state.info(p,'while_loop_header : WHILE expression COLON')
        return self.ast.loops.WhileHeader(p[1])

    @self.pg.production('for_loop_header : FOR declaration IN expression COLON')
    @self.pg.production('for_loop_header : FOR identifier IN expression COLON')
    def get_for_header(state,p):
        state.info(p,'for_loop_header : FOR declaration|identifier IN expression COLON')
        return self.ast.loops.ForHeader(p[1],p[3])