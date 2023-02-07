class Assign():
    def __init__(self,assign_to,expression):
        self.assign_to = assign_to
        self.expression = expression
    
    def show_tree(self,indent=""):
        print(indent,"Assign")
        self.assign_to.show_tree(indent + "   ")
        self.expression.show_tree(indent + "   ")

class Number():
    def __init__(self,value):
        self.value = value

    def show_tree(self,indent=""):
        print(indent,"Number")
        print(indent,"   ",self.value)

class Identifier():
    def __init__(self,value):
        self.value = value
    
    def show_tree(self,indent=""):
        print(indent,"Identifier")
        print(indent,"   ",self.value)

class BinaryOP():
    def __init__(self,left,right):
        self.left = left
        self.right = right

class Add(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Add")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Sub(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Sub")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Pwr(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Pwr")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Mul(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Mul")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Div(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Div")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Mod(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Mod")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Equal(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Equal")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class NotEqual(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"NotEqual")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Greater(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Greater")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Less(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Less")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class GreaterOrEqual(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"GreaterOrEqual")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class LessOrEqual(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"LessOrEqual")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class And(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"And")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Or(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Or")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")