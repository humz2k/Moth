class MathOP():
    def __init__(self,left,right):
        self.left = left
        self.right = right
    
    def find_variables(self,out):
        self.variables = out
        self.left.find_variables(out)
        self.right.find_variables(out)
    
    def is_a(self,check):
        if check == "BinaryOP":
            return True
        return False
    
    def get_types(self):
        left_types = set(self.left.get_types())
        right_types = set(self.right.get_types())
        common_types = list(left_types.intersection(right_types))
        if len(common_types) == 0:
            error.error("Type Error in BinaryOP")
        return common_types

    def generate_for_var(self,parent,indent,operation_type):
        error.error(str(self.generate_for_var) + " NOT IMPLEMENTED")
    
    def generate(self,parent,indent,operation_type):
        if not (operation_type in ["int","float","double","uint","char","uchar","long","ulong"]):
            error.error(str(self.generate) + " NOT IMPLEMENTED FOR " + operation_type)
        return self.generate_for_var(parent,indent,operation_type)

class Add(MathOP):
    def show_tree(self,indent=""):
        print(indent,"Add")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")
    
    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        out += self.left.generate(self,indent, operation_type)
        out += "+"
        out += self.right.generate(self,indent,operation_type)
        out += ")"
        return out

class Sub(MathOP):
    def show_tree(self,indent=""):
        print(indent,"Sub")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        out += self.left.generate(self,indent,operation_type)
        out += "-"
        out += self.right.generate(self,indent,operation_type)
        out += ")"
        return out

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

    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        out += self.left.generate(self,indent,operation_type)
        out += "*"
        out += self.right.generate(self,indent,operation_type)
        out += ")"
        return out

class Div(MathOP):
    def show_tree(self,indent=""):
        print(indent,"Div")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        out += self.left.generate(self,indent,operation_type)
        out += "/"
        out += self.right.generate(self,indent,operation_type)
        out += ")"
        return out

class Mod(MathOP):
    def show_tree(self,indent=""):
        print(indent,"Mod")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        out += self.left.generate(self,indent,operation_type)
        out += "%"
        out += self.right.generate(self,indent,operation_type)
        out += ")"
        return out