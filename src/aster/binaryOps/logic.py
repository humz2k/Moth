class LogicOP():
    def __init__(self,left,right):
        self.left = left
        self.right = right

    def is_a(self,check):
        if check == "LogicOP":
            return True
        return False

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