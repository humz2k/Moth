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

class WhileHeader():
    def __init__(self,expression):
        self.expression = expression
    
    def is_a(self,check):
        if check == "WhileHeader":
            return True
        return False
    
    def find_variables(self,out):
        return None
    
    def show_tree(self,indent=""):
        print(indent,"WhileHeader")
        self.expression.show_tree(indent+"   ")

class ForHeader():
    def __init__(self,variable,iterator):
        self.variable = variable
        self.iterator = iterator
    
    def is_a(self,check):
        if check == "ForHeader":
            return True
        return False
    
    def find_variables(self,out):
        self.variable.find_variables(out)
    
    def show_tree(self,indent=""):
        print(indent,"ForHeader")
        print(indent+"   ","Variable")
        self.variable.show_tree(indent+"       ")
        print(indent+"   ","Iterator")
        self.iterator.show_tree(indent+"       ")