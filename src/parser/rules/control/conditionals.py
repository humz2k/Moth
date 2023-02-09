
def IfStatement(self):
    @self.pg.production('line : if_statement')
    def return_if(state,p):
        state.info(p,'line : if_statement')
        return p[0]
    
    @self.pg.production('if_statement : if_temp')
    def return_if(state,p):
        state.info(p,'if_statement : if_temp')
        return p[0]

    @self.pg.production('if_statement : if_temp else_statement')
    def get_else(state,p):
        state.info(p,'if_statement : if_temp else_statement')
        return p[0].add_else(p[1])
    
    @self.pg.production('if_temp : if_temp elif_statement')
    def get_elif(state,p):
        state.info(p,'if_temp : if_temp elif_statement')
        return p[0].add_elif(p[1])
    
    @self.pg.production('if_temp : if_header OPEN_CURL lines CLOSE_CURL')
    def get_if(state,p):
        state.info(p,'if_temp : if_header OPEN_CURL lines CLOSE_CURL')
        return self.ast.control.conditionals.IfStatement(self.ast.containers.Scope(p[0],p[2]))
    
def IfHeader(self):
    @self.pg.production('if_header : IF expression COLON')
    def get_if_header(state,p):
        state.info(p,'if_header : IF expression COLON')
        return self.ast.control.conditionals.IfHeader(p[1])

def ElifStatement(self):
    @self.pg.production('elif_statement : elif_header OPEN_CURL lines CLOSE_CURL')
    def get_elif_statement(state,p):
        state.info(p,'elif_statement : elif_header OPEN_CURL lines CLOSE_CURL')
        return self.ast.control.conditionals.ElifStatement(self.ast.containers.Scope(p[0],p[2]))

def ElifHeader(self):
    @self.pg.production('elif_header : ELIF expression COLON')
    def get_elif_header(state,p):
        state.info(p,'elif_header : ELIF expression COLON')
        return self.ast.control.conditionals.ElifHeader(p[1])

def ElseStatement(self):
    @self.pg.production('else_statement : else_header OPEN_CURL lines CLOSE_CURL')
    def get_else_statement(state,p):
        state.info(p,'else_statement : else_header OPEN_CURL lines CLOSE_CURL')
        return self.ast.control.conditionals.ElseStatement(self.ast.containers.Scope(p[0],p[2]))

def ElseHeader(self):
    @self.pg.production('else_header : ELSE COLON')
    def get_else_header(state,p):
        state.info(p,'else_header : ELSE COLON')
        return self.ast.control.conditionals.ElseHeader()