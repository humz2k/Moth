
def Function(self):
    @self.pg.production('function : func_def_header OPEN_CURL lines CLOSE_CURL')
    def get_func_scope(state,p):
        state.info(p,'function : func_def_header OPEN_CURL lines CLOSE_CURL')
        return self.ast.control.functions.Function(self.ast.containers.Scope(p[0],p[2]))

def FunctionDef(self):

    @self.pg.production('func_def_header : func_def COLON')
    def get_scope_header(state,p):
        state.info(p,'func_def_header : func_def')
        return p[0]

    @self.pg.production('func_def_input_open : DEF type IDENTIFIER OPEN_PAREN declaration')
    def init_func_def(state,p):
        state.info(p,'func_def_input_open : DEF type IDENTIFIER OPEN_PAREN declaration')
        return self.ast.control.functions.FunctionDef(p[1],self.ast.identifiers.Identifier(p[2]),p[4])
    
    @self.pg.production('func_def_input_open : func_def_input_open COMMA declaration')
    def cont_func_def(state,p):
        state.info(p,'func_def_input_open : func_input_open COMMA declaration')
        return p[0].add_input(p[2])

    @self.pg.production('func_def : func_def_input_open CLOSE_PAREN')
    def close_func_def(state,p):
        state.info(p,'func_def : func_def_input_open CLOSE_PAREN')
        return p[0]
    
    @self.pg.production('func_def : DEF type IDENTIFIER OPEN_PAREN CLOSE_PAREN')
    def empty_function_header(state,p):
        state.info(p,'func_def : DEF type IDENTIFIER OPEN_PAREN CLOSE_PAREN')
        return self.ast.control.functions.FunctionDef(p[1],self.ast.identifiers.Identifier(p[2]))
    
def FunctionCall(self):
    @self.pg.production('func_call_open : identifier OPEN_PAREN expression')
    def init_func(state,p):
        state.info(p,'func_call_open : identifier OPEN_PAREN expression')
        return self.ast.control.functions.FunctionCall(p[0],p[2])
    
    @self.pg.production('func_call_open : func_call_open COMMA expression')
    def cont_func(state,p):
        state.info(p,'func_call_open : func_call_open COMMA expression')
        return p[0].add_input(p[2])
    
    @self.pg.production('func_call : func_call_open CLOSE_PAREN')
    def close_func(state,p):
        state.info(p,'func_call : func_call_open CLOSE_PAREN')
        return p[0]
    
    @self.pg.production('func_call : identifier OPEN_PAREN CLOSE_PAREN')
    def get_func_call(state,p):
        state.info(p,'func_call : identifier OPEN_PAREN CLOSE_PAREN')
        return self.ast.control.functions.FunctionCall(p[0])