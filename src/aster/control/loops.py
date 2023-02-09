class WhileLoop():
    def __init__(self,scope):
        self.scope = scope
    
    def is_a(self,check):
        if check == "WhileLoop":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"WhileLoop")
        self.scope.show_tree(indent+"   ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.scope.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.scope.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.scope.cascade_functions(out)

class ForLoop():
    def __init__(self,scope):
        self.scope = scope
    
    def is_a(self,check):
        if check == "ForLoop":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"ForLoop")
        self.scope.show_tree(indent+"   ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.scope.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.scope.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.scope.cascade_functions(out)

class WhileHeader():
    def __init__(self,expression):
        self.expression = expression
    
    def is_a(self,check):
        if check == "WhileHeader":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"WhileHeader")
        self.expression.show_tree(indent+"   ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.expression.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.expression.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.expression.cascade_functions(out)

class ForHeader():
    def __init__(self,variable,iterator):
        self.variable = variable
        self.iterator = iterator
    
    def is_a(self,check):
        if check == "ForHeader":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"ForHeader")
        print(indent+"   ","Variable")
        self.variable.show_tree(indent+"       ")
        print(indent+"   ","Iterator")
        self.iterator.show_tree(indent+"       ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.variable.cascade_parent(self)
        self.iterator.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.variable.cascade_classes(out)
        self.iterator.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.variable.cascade_functions(out)
        self.iterator.cascade_functions(out)