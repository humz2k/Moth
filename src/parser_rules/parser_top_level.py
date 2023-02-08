from rply.token import Token

def top_level(self):
    @self.pg.production('program : scope')
    def init_program(state,p):
        state.info(p,'program : scope')
        return self.ast.top_level.Program(p[0])
    
    @self.pg.production('program : program scope')
    def continue_program(state,p):
        state.info(p,'program : program scope')
        return p[0].add_scope(p[1])

    @self.pg.production('class_open : CLASS IDENTIFIER COLON OPEN_CURL')
    def class_open(state,p):
        state.info(p,'class_open : CLASS IDENTIFIER OPEN_CURL')
        return self.ast.classes.Class(self.ast.expressions.Identifier(p[1]))
    
    @self.pg.production('class_open : class_open declare_line')
    def class_add_var(state,p):
        state.info(p,'class_open : class_open declare_line')
        return p[0].add_declaration(p[1])
    
    @self.pg.production('class_close : class_open function')
    def class_add_var(state,p):
        state.info(p,'class_close : class_open function')
        return p[0].add_scope(p[1])
    
    @self.pg.production('class_close : class_close function')
    def class_add_var(state,p):
        state.info(p,'class_close : class_close function')
        return p[0].add_scope(p[1])
    
    @self.pg.production('scope : class_open CLOSE_CURL')
    @self.pg.production('scope : class_close CLOSE_CURL')
    def return_class(state,p):
        state.info(p,'scope : class_open CLOSE_CURL')
        return p[0]

    @self.pg.production('scope : function')
    def pass_function(state,p):
        state.info(p,'scope : function')
        return p[0]

    @self.pg.production('function : func_def_header OPEN_CURL lines CLOSE_CURL')
    def get_scope(state,p):
        state.info(p,'function : func_def_header OPEN_CURL lines CLOSE_CURL')
        return self.ast.functions.Function(self.ast.top_level.Scope(p[0],p[2]))
    
    @self.pg.production('line : while_loop_header OPEN_CURL lines CLOSE_CURL')
    def get_while_loop(state,p):
        state.info(p,'line : while_loop_header OPEN_CURL lines CLOSE_CURL')
        return self.ast.loops.WhileLoop(self.ast.top_level.Scope(p[0],p[2]))

    @self.pg.production('line : for_loop_header OPEN_CURL lines CLOSE_CURL')
    def get_for_loop(state,p):
        state.info(p,'line : for_loop_header OPEN_CURL lines CLOSE_CURL')
        return self.ast.loops.ForLoop(self.ast.top_level.Scope(p[0],p[2]))
    
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
        return self.ast.conditionals.IfStatement(self.ast.top_level.Scope(p[0],p[2]))
    
    @self.pg.production('elif_statement : elif_header OPEN_CURL lines CLOSE_CURL')
    def get_elif_statement(state,p):
        state.info(p,'elif_statement : elif_header OPEN_CURL lines CLOSE_CURL')
        return self.ast.conditionals.ElifStatement(self.ast.top_level.Scope(p[0],p[2]))
    
    @self.pg.production('else_statement : else_header OPEN_CURL lines CLOSE_CURL')
    def get_else_statement(state,p):
        state.info(p,'else_statement : else_header OPEN_CURL lines CLOSE_CURL')
        return self.ast.conditionals.ElseStatement(self.ast.top_level.Scope(p[0],p[2]))
    
    @self.pg.production('lines : line')
    def init_lines(state,p):
        state.info(p,'lines : line')
        return self.ast.top_level.Lines(p[0])
    
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
    
    @self.pg.production('declare_line : declaration SEMI_COLON')
    def declare_line(state,p):
        state.info(p,'declare_line : declaration SEMI_COLON')
        return p[0]
    
    @self.pg.production('empty : PASS')
    def get_empty_line(state,p):
        state.info(p,'empty : PASS')
        return self.ast.top_level.EmptyLine()
    
    @self.pg.production('break : BREAK')
    def get_return(state,p):
        state.info(p,'break : Break')
        return self.ast.expressions.Break()

    @self.pg.production('return : RETURN')
    def get_return(state,p):
        state.info(p,'return : RETURN')
        return self.ast.expressions.Return()

    @self.pg.production('return : RETURN expression')
    def get_return_val(state,p):
        state.info(p,'return : RETURN expression')
        return self.ast.expressions.Return(p[1])
    
    @self.pg.production('print_open : PRINT OPEN_PAREN')
    def get_print_open(state,p):
        state.info(p,'print_open : PRINT OPEN_PAREN')
        return self.ast.top_level.Print()
    
    @self.pg.production('print_open : print_open expression COMMA')
    def cont_print_open(state,p):
        state.info(p,'print_open : print_open expression COMMA')
        return p[0].add_expression(p[1])

    @self.pg.production('print : print_open CLOSE_PAREN')
    @self.pg.production('print : print_open expression CLOSE_PAREN')
    def get_print(state,p):
        state.info(p,'print : print_open CLOSE_PAREN')
        if len(p) == 3:
            p[0].add_expression(p[1])
        return p[0].add_expression(self.ast.expressions.String(Token('STRING',r'"\n"')))