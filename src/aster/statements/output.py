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