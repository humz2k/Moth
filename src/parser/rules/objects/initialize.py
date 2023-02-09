def InitializeObject(self):
    @self.pg.production('initialize : NEW func_call')
    def initialize(state,p):
        state.info(p,'initialize : NEW func_call')
        return self.ast.objects.InitializeObject(p[1])