class LogicOP():
    def __init__(self,left,right):
        self.left = left
        self.right = right

    def is_a(self,check):
        if check == "LogicOP":
            return True
        return False

    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.left.cascade_parent(self)
        self.right.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.left.cascade_classes(out)
        self.right.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.left.cascade_functions(out)
        self.right.cascade_functions(out)

class And(LogicOP):
    def show_tree(self,indent=""):
        print(indent,"And")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Or(LogicOP):
    def show_tree(self,indent=""):
        print(indent,"Or")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Not():
    def __init__(self,expression):
        self.expression = expression
    
    def is_a(self,check):
        if check == "Not":
            return True
        return False

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