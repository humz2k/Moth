from rply.token import Token

def expressions(self):
    @self.pg.production('expression : number')
    @self.pg.production('expression : bool')
    @self.pg.production('expression : identifier')
    @self.pg.production('expression : initialize')
    @self.pg.production('expression : func_call')
    @self.pg.production('expression : string')
    @self.pg.production('expression : cast')
    def get_expression(state,p):
        state.info(p,'expression : NUMBER')
        return p[0]
    
    @self.pg.production('assign : identifier PLUS_PLUS')
    @self.pg.production('assign : identifier MINUS_MINUS')
    def get_assign_increment(state,p):
        state.info(p,'assign : identifier PLUS_PLUS|MINUS_MINUS')
        if p[1].value == "++":
            value = self.ast.expressions.Add(p[0],self.ast.expressions.Number(Token('NUMBER','1')))
        if p[1].value == "--":
            value = self.ast.expressions.Sub(p[0],self.ast.expressions.Number(Token('NUMBER','1')))
        return self.ast.expressions.Assign(p[0],value)

    @self.pg.production('assign : identifier PLUS_EQUAL expression')
    @self.pg.production('assign : identifier MINUS_EQUAL expression')
    @self.pg.production('assign : identifier STARSTAR_EQUAL expression')
    @self.pg.production('assign : identifier STAR_EQUAL expression')
    @self.pg.production('assign : identifier SLASH_EQUAL expression')
    @self.pg.production('assign : identifier PERCENT_EQUAL expression')
    def get_assign_shorthand(state,p):
        state.info(p,'assign : declaration PLUS_EQUAL|MINUS_EQUAL|... expression')
        if p[1].value == "+=":
            value = self.ast.expressions.Add(p[0],p[2])
        elif p[1].value == "-=":
            value = self.ast.expressions.Sub(p[0],p[2])
        elif p[1].value == "**=":
            value = self.ast.expressions.Pwr(p[0],p[2])
        elif p[1].value == "*=":
            value = self.ast.expressions.Mul(p[0],p[2])
        elif p[1].value == "/=":
            value = self.ast.expressions.Div(p[0],p[2])
        elif p[1].value == "%=":
            value = self.ast.expressions.Mod(p[0],p[2])
        return self.ast.expressions.Assign(p[0],value)

    @self.pg.production('assign : declaration ASSIGN expression')
    @self.pg.production('assign : identifier ASSIGN expression')
    def get_assign(state,p):
        state.info(p,'assign : declaration ASSIGN expression')
        return self.ast.expressions.Assign(p[0],p[2])

    @self.pg.production('identifier : func_call index')
    @self.pg.production('identifier : identifier index')
    def get_array(state,p):
        state.info(p,'expression : identifier|func_Call index')
        return self.ast.arrays.ArrayIndex(p[0],p[1])
    
    @self.pg.production('identifier : identifier PERIOD identifier')
    @self.pg.production('identifier : func_call PERIOD identifier')
    def get_reference_to(state,p):
        state.info(p,'identifier : identifier PERIOD identifier')
        return self.ast.expressions.Reference(p[0],p[2])

    @self.pg.production('identifier : IDENTIFIER')
    def get_identifier(state,p):
        state.info(p,'identifier : IDENTIFIER')
        return self.ast.expressions.Identifier(p[0])

    @self.pg.production('number : NUMBER')
    def get_number(state,p):
        state.info(p,'number : NUMBER')
        return self.ast.expressions.Number(p[0])
    
    @self.pg.production('bool : TRUE')
    @self.pg.production('bool : FALSE')
    def get_bool(state,p):
        state.info(p,'bool : TRUE|FALSE')
        return self.ast.expressions.Bool(p[0])

    @self.pg.production('string : STRING')
    def get_string(state,p):
        state.info(p,'string : STRING')
        return self.ast.expressions.String(p[0])
    
    @self.pg.production('expression : RANGE OPEN_PAREN expression CLOSE_PAREN')
    @self.pg.production('expression : RANGE OPEN_PAREN expression COMMA expression CLOSE_PAREN')
    @self.pg.production('expression : RANGE OPEN_PAREN expression COMMA expression COMMA expression CLOSE_PAREN')
    def get_iterator(state,p):
        state.info(p,'expression : RANGE OPEN_PAREN expression [COMMA expression [COMMA expression]] CLOSE_PAREN')
        if len(p) == 8:
            first = p[2]
            second = p[4]
            third = p[6]
        elif len(p) == 6:
            first = p[2]
            second = p[4]
            third = self.ast.expressions.Number(Token('NUMBER','1'))
        elif len(p) == 4:
            first = self.ast.expressions.Number(Token('NUMBER','0'))
            second = p[2]
            third = self.ast.expressions.Number(Token('NUMBER','1'))
        return self.ast.expressions.Iterator(first,second,third)
    
    @self.pg.production('expression : LINSPACE OPEN_PAREN expression COMMA expression COMMA expression CLOSE_PAREN')
    def get_linspace(state,p):
        state.info(p,'expression : LINSPACE OPEN_PAREN expression COMMA expression COMMA expression CLOSE_PAREN')
        return self.ast.expressions.Linspace(p[2],p[4],p[6])