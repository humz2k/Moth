def Index(self):
    @self.pg.production('index_open : OPEN_SQUARE empty_index')
    @self.pg.production('index_open : OPEN_SQUARE expression')
    def get_index_start(state,p):
        state.info(p,'index_open : OPEN_SQUARE COLON|expression')
        return self.ast.arrays.index.Index(p[1])
    
    @self.pg.production('index_open : index_open COMMA empty_index')
    @self.pg.production('index_open : index_open COMMA expression')
    def get_index_continue(state,p):
        state.info(p,'index_open : COMMA COLON|expression')
        return p[0].add_dimension(p[2])

    @self.pg.production('index : index_open CLOSE_SQUARE')
    def return_index(state,p):
        state.info(p,'index : index_open CLOSE_SQUARE')
        return p[0]
    
    @self.pg.production('index : OPEN_SQUARE CLOSE_SQUARE')
    def get_empty_index(state,p):
        state.info(p,'index : OPEN_SQUARE CLOSE_SQUARE')
        return self.ast.arrays.index.Index()

def EmptyIndex(self):
    @self.pg.production('empty_index : COLON')
    def return_empty_index(state,p):
        state.info(p,'empty_index : COLON')
        return self.ast.arrays.index.EmptyIndex()

def ArrayIndex(self):
    @self.pg.production('identifier : func_call index')
    @self.pg.production('identifier : identifier index')
    def get_array_index(state,p):
        state.info(p,'expression : identifier|func_Call index')
        return self.ast.arrays.index.ArrayIndex(p[0],p[1])