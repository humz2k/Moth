def WhileLoop(self):
    @self.pg.production('line : while_loop_header OPEN_CURL lines CLOSE_CURL')
    def get_while_loop(state,p):
        state.info(p,'line : while_loop_header OPEN_CURL lines CLOSE_CURL')
        return self.ast.control.loops.WhileLoop(self.ast.top_level.Scope(p[0],p[2]))

def ForLoop(self):
    @self.pg.production('line : for_loop_header OPEN_CURL lines CLOSE_CURL')
    def get_for_loop(state,p):
        state.info(p,'line : for_loop_header OPEN_CURL lines CLOSE_CURL')
        return self.ast.control.loops.ForLoop(self.ast.top_level.Scope(p[0],p[2]))
    
def WhileHeader(self):
    @self.pg.production('while_loop_header : WHILE expression COLON')
    def get_while_header(state,p):
        state.info(p,'while_loop_header : WHILE expression COLON')
        return self.ast.control.loops.WhileHeader(p[1])

def ForHeader(self):
    @self.pg.production('for_loop_header : FOR declaration IN expression COLON')
    @self.pg.production('for_loop_header : FOR identifier IN expression COLON')
    def get_for_header(state,p):
        state.info(p,'for_loop_header : FOR declaration|identifier IN expression COLON')
        return self.ast.control.loops.ForHeader(p[1],p[3])