class ComparisonOP():
    def __init__(self,left,right):
        self.left = left
        self.right = right
    
    def is_a(self,check):
        if check == "ComparisonOP":
            return True
        return False
    
class Equal(ComparisonOP):
    def show_tree(self,indent=""):
        print(indent,"Equal")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class NotEqual(ComparisonOP):
    def show_tree(self,indent=""):
        print(indent,"NotEqual")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Greater(ComparisonOP):
    def show_tree(self,indent=""):
        print(indent,"Greater")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Less(ComparisonOP):
    def show_tree(self,indent=""):
        print(indent,"Less")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class GreaterOrEqual(ComparisonOP):
    def show_tree(self,indent=""):
        print(indent,"GreaterOrEqual")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class LessOrEqual(ComparisonOP):
    def show_tree(self,indent=""):
        print(indent,"LessOrEqual")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")
