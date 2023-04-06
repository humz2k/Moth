def InitializeArray(self):
    @self.pg.production('initialize : NEW type')
    def initialize(state,p):
        state.info(p,'initialize : NEW type')
        return self.ast.arrays.initialize.InitializeArray(p[1])

def InitializeObjectArray(self):
    @self.pg.production('initialize : NEW func_call index')
    def initialize(state,p):
        state.info(p,'initialize : NEW func_call index')
        return self.ast.arrays.initialize.InitializeObjectArray(p[1],p[2])