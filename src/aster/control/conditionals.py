class IfStatement():
    def __init__(self,scope):
        self.scope = scope
        self.otherwise = None
    
    def is_a(self,check):
        if check == "IfStatement":
            return True
        return False
    
    def add_elif(self,otherwise):
        if type(self.otherwise) == type(None):
            self.otherwise = otherwise
        else:
            self.otherwise.add_elif(otherwise)
        return self
    
    def add_else(self,otherwise):
        self.otherwise.add_elif(otherwise)
        return self
    
    def show_tree(self,indent=""):
        print(indent,"IfStatement")
        self.scope.show_tree(indent+"   ")
        if type(self.otherwise) != type(None):
            self.otherwise.show_tree(indent+"   ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.scope.cascade_parent(self)
        if type(self.otherwise) != type(None):
            self.otherwise.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.scope.cascade_classes(out)
        if type(self.otherwise) != type(None):
            self.otherwise.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.scope.cascade_functions(out)
        if type(self.otherwise) != type(None):
            self.otherwise.cascade_functions(out)

class IfHeader():
    def __init__(self,expression):
        self.expression = expression
    
    def is_a(self,check):
        if check == "IfHeader":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"IfHeader")
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

class ElifStatement():
    def __init__(self,scope):
        self.scope = scope
        self.otherwise = None
    
    def is_a(self,check):
        if check == "ElifStatement":
            return True
        return False
    
    def add_elif(self,scope):
        if type(self.otherwise) == type(None):
            self.otherwise = scope
        else:
            self.otherwise.add_elif(scope)
        return self
    
    def show_tree(self,indent=""):
        print(indent,"ElifStatement")
        self.scope.show_tree(indent+"   ")
        if type(self.otherwise) != type(None):
            self.otherwise.show_tree(indent+"       ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.scope.cascade_parent(self)
        if type(self.otherwise) != type(None):
            self.otherwise.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.scope.cascade_classes(out)
        if type(self.otherwise) != type(None):
            self.otherwise.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.scope.cascade_functions(out)
        if type(self.otherwise) != type(None):
            self.otherwise.cascade_functions(out)

class ElifHeader():
    def __init__(self,expression):
        self.expression = expression
    
    def is_a(self,check):
        if check == "ElifHeader":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"ElifHeader")
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

class ElseStatement():
    def __init__(self,scope):
        self.scope = scope
    
    def is_a(self,check):
        if check == "ElseStatement":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"ElseStatement")
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

class ElseHeader():
    def __init__(self):
        pass

    def is_a(self,check):
        if check == "ElseHeader":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"ElseHeader")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
    
    def cascade_classes(self,out):
        self.classes = out
    
    def cascade_functions(self,out):
        self.functions = out