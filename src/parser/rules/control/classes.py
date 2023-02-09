def Class(self):
    @self.pg.production('class_open : CLASS IDENTIFIER COLON OPEN_CURL')
    def class_open(state,p):
        state.info(p,'class_open : CLASS IDENTIFIER OPEN_CURL')
        return self.ast.control.classes.Class(self.ast.identifiers.Identifier(p[1]))

    @self.pg.production('class_open : class_open declare_line')
    def class_add_var(state,p):
        state.info(p,'class_open : class_open declare_line')
        return p[0].add_declaration(p[1])
    
    @self.pg.production('class_close : class_open function')
    def class_add_func(state,p):
        state.info(p,'class_close : class_open function')
        return p[0].add_scope(p[1])
    
    @self.pg.production('class_close : class_close function')
    def class_add_func2(state,p):
        state.info(p,'class_close : class_close function')
        return p[0].add_scope(p[1])