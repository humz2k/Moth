def functions(self):
    @self.pg.production('func_input_open : DEF declaration OPEN_PAREN')
    def init_func_def(state,p):
        state.info(p,'func_input_open : DEF declaration OPEN_PAREN')
        return self.ast.functions.FunctionDef(p[1])
    
    @self.pg.production('func_def : func_input_open CLOSE_PAREN')
    def close_func_def(state,p):
        state.info(p,'func_def : func_input_open CLOSE_PAREN')
        return p[0]