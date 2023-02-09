class Class():
    def __init__(self,identifier):
        self.identifier = identifier
        self.class_variables = []
        self.scopes = []
    
    def is_a(self,check):
        if check == "Class":
            return True
        return False

    def add_declaration(self,declaration):
        self.class_variables.append(declaration)
        return self
    
    def add_scope(self,scope):
        self.scopes.append(scope)
        return self
    
    def show_tree(self,indent=""):
        print(indent,"Class")
        print(indent+"   ","Identifier")
        self.identifier.show_tree(indent+"       ")
        print(indent+"   ","Variables")
        if len(self.class_variables) == 0:
            print(indent+"       ","None")
        else:
            for var in self.class_variables:
                var.show_tree(indent+"       ")
        print(indent+"   ","Functions")
        if len(self.scopes) == None:
            print(indent + "       ","None")
        else:
            for scope in self.scopes:
                scope.show_tree(indent+"       ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        for scope in self.scopes:
            scope.cascade_parent(self)
        for var in self.class_variables:
            var.cascade_parent(self)

    def cascade_classes(self,out):
        if self.identifier.value in out:
            self.parent.error([self])
            return
        out[self.identifier.value] = self
        self.classes = out
        for scope in self.scopes:
            scope.cascade_classes(out)
        for var in self.class_variables:
            var.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        for scope in self.scopes:
            scope.cascade_functions(out)
        for var in self.class_variables:
            var.cascade_functions(out)
