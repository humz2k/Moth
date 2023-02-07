def top_level(self):
    @self.pg.production('program : scope')
    def init_program(state,p):
        state.info(p,'program : scope')
        return self.ast.top_level.Program(p[0])
    
    @self.pg.production('program : program scope')
    def continue_program(state,p):
        state.info(p,'program : program scope')
        return p[0].add_scope(p[1])

    @self.pg.production('scope : scope_header OPEN_CURL lines CLOSE_CURL')
    def get_scope(state,p):
        state.info(p,'scope : scope_header OPEN_CURL lines CLOSE_CURL')
        return self.ast.top_level.Scope(p[0],p[2])

    @self.pg.production('lines : line')
    def init_lines(state,p):
        state.info(p,'lines : line')
        return self.ast.top_level.Lines(p[0])
    
    @self.pg.production('lines : lines line')
    def continue_lines(state,p):
        state.info(p,'lines : lines line')
        return p[0].add_line(p[1])

    @self.pg.production('line : scope')
    @self.pg.production('line : assign SEMI_COLON')
    #@self.pg.production('line : function_call')
    def sub_scope(state,p):
        state.info(p,'line : scope|assign|function_call')
        return p[0]