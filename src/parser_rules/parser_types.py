def types(self):
    @self.pg.production('declaration : type identifier')
    def get_declaration(state,p):
        state.info(p,'declaration : type identifier')
        return self.ast.types.Declaration(p[0],p[1])

    @self.pg.production('initialize : NEW type')
    def initialize(state,p):
        state.info(p,'initialize : NEW type')
        return self.ast.types.InitializeArray(p[1])

    @self.pg.production('initialize : NEW func_call index')
    def initialize(state,p):
        state.info(p,'initialize : NEW func_call index')
        return self.ast.types.InitializeObjectArray(p[1],p[2])

    @self.pg.production('initialize : NEW func_call')
    def initialize(state,p):
        state.info(p,'initialize : NEW func_call')
        return self.ast.types.InitializeObject(p[1])

    @self.pg.production('type : type index')
    def get_array_type(state,p):
        state.info(p,'type : type index')
        return self.ast.arrays.ArrayType(p[0],p[1])

    @self.pg.production('index_open : OPEN_SQUARE empty_index')
    @self.pg.production('index_open : OPEN_SQUARE expression')
    def get_index_start(state,p):
        state.info(p,'index_open : OPEN_SQUARE COLON|expression')
        return self.ast.arrays.Index(p[1])
    
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
        return self.ast.arrays.Index()
    
    @self.pg.production('empty_index : COLON')
    def return_empty(state,p):
        state.info(p,'empty_index : COLON')
        return self.ast.arrays.EmptyIndex()

    @self.pg.production('type : TYPE_NAME')
    def get_type(state,p):
        state.info(p,'type : TYPE_NAME')
        return self.ast.types.TypeObj(p[0])

    @self.pg.production('cast : type OPEN_PAREN expression CLOSE_PAREN')
    def get_case(state,p):
        state.info(p,'cast : type OPEN_PAREN expression CLOSE_PAREN')
        return self.ast.expressions.Cast(p[0],p[2])