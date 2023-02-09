def Program(self):
    @self.pg.production('program : scope')
    def init_program(state,p):
        state.info(p,'program : scope')
        return self.ast.containers.Program(p[0])
    
    @self.pg.production('program : program scope')
    def continue_program(state,p):
        state.info(p,'program : program scope')
        return p[0].add_scope(p[1])

def Scope(self):
    @self.pg.production('scope : class_open CLOSE_CURL')
    @self.pg.production('scope : class_close CLOSE_CURL')
    def return_class(state,p):
        state.info(p,'scope : class_open CLOSE_CURL')
        return p[0]
    
    @self.pg.production('scope : function')
    def pass_function(state,p):
        state.info(p,'scope : function')
        return p[0]
    
def Lines(self):
    @self.pg.production('lines : line')
    def init_lines(state,p):
        state.info(p,'lines : line')
        return self.ast.containers.Lines(p[0])
    
    @self.pg.production('lines : lines line')
    def continue_lines(state,p):
        state.info(p,'lines : lines line')
        return p[0].add_line(p[1])

    @self.pg.production('line : assign SEMI_COLON')
    @self.pg.production('line : empty SEMI_COLON')
    @self.pg.production('line : func_call SEMI_COLON')
    @self.pg.production('line : return SEMI_COLON')
    @self.pg.production('line : break SEMI_COLON')
    @self.pg.production('line : print SEMI_COLON')
    @self.pg.production('line : declare_line')
    def sub_scope(state,p):
        state.info(p,'line : scope|assign|function_call')
        return p[0]

    @self.pg.production('empty : PASS')
    def get_empty_line(state,p):
        state.info(p,'empty : PASS')
        return self.ast.containers.EmptyLine()