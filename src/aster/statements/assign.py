class Assign():
    def __init__(self,assign_to,expression):
        self.assign_to = assign_to
        self.expression = expression
    
    def is_a(self,check):
        if check == "Assign":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"Assign")
        print(indent + "   ","Out")
        self.assign_to.show_tree(indent + "       ")
        print(indent + "   ","Value")
        self.expression.show_tree(indent + "       ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.assign_to.cascade_parent(self)
        self.expression.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.assign_to.cascade_classes(out)
        self.expression.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.assign_to.cascade_functions(out)
        self.expression.cascade_functions(out)