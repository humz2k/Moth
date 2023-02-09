class MathOP():
    def __init__(self,left,right):
        self.left = left
        self.right = right
    
    def is_a(self,check):
        if check == "MathOP":
            return True
        return False

class Add(MathOP):
    def show_tree(self,indent=""):
        print(indent,"Add")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Sub(MathOP):
    def show_tree(self,indent=""):
        print(indent,"Sub")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Pwr(MathOP):
    def show_tree(self,indent=""):
        print(indent,"Pwr")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Mul(MathOP):
    def show_tree(self,indent=""):
        print(indent,"Mul")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Div(MathOP):
    def show_tree(self,indent=""):
        print(indent,"Div")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Mod(MathOP):
    def show_tree(self,indent=""):
        print(indent,"Mod")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")