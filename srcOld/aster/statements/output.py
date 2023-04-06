class Print():
    def __init__(self):
        self.expressions = []
    
    def is_a(self,check):
        if check == "Print":
            return True
        return False
    
    def add_expression(self,expression):
        self.expressions.append(expression)
        return self
    
    def show_tree(self,indent=""):
        print(indent,"Print")
        for expression in self.expressions:
            expression.show_tree(indent+"   ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        for exp in self.expressions:
            exp.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        for exp in self.expressions:
            exp.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        for exp in self.expressions:
            exp.cascade_classes(out)