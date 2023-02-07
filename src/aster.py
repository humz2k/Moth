class Program:
    def __init__(self,scope):
        self.scopes = [scope]
    
    def add_scope(self,scope):
        self.scopes.append(scope)
        return self

    def show_tree(self,indent=""):
        print(indent,self)
        for scope in self.scopes:
            scope.show_tree(indent + "   ")

class Scope:
    def __init__(self,header,lines):
        self.lines = lines
        self.header = header
    
    def show_tree(self,indent=""):
        print(indent,self)
        self.header.show_tree(indent + "   ")
        self.lines.show_tree(indent + "      ")

class Lines:
    def __init__(self,line):
        self.lines = [line]
    
    def add_line(self,line):
        self.lines.append(line)
        return self

    def show_tree(self,indent=""):
        print(indent,self)
        for line in self.lines:
            line.show_tree(indent + "   ")

class FunctionDef():
    def __init__(self,declaration):
        self.declaration = declaration
        self.inputs = []
    
    def add_input(self,declaration):
        self.inputs.append(declaration)
        return self

    def show_tree(self,indent=""):
        print(indent,self)
        self.declaration.show_tree(indent + "   ")
        for inp in self.inputs:
            inp.show_tree(indent + "   ")

class Declaration():
    def __init__(self,declare_type,identifier):
        self.type = declare_type
        self.identifier = identifier
    
    def show_tree(self,indent=""):
        print(indent,self)
        self.type.show_tree(indent+"   ")
        self.identifier.show_tree(indent+"   ")

class Assign():
    def __init__(self,assign_to,expression):
        self.assign_to = assign_to
        self.expression = expression
    
    def show_tree(self,indent=""):
        print(indent,self)
        self.assign_to.show_tree(indent + "   ")
        self.expression.show_tree(indent + "   ")

class Number():
    def __init__(self,value):
        self.value = value

    def show_tree(self,indent=""):
        print(indent,self)
        print(indent,"   ",self.value)

class Identifier():
    def __init__(self,value):
        self.value = value
    
    def show_tree(self,indent=""):
        print(indent,self)
        print(indent,"   ",self.value)

class TypeObj():
    def __init__(self,value):
        self.value = value
    
    def show_tree(self,indent=""):
        print(indent,self)
        print(indent,"   ",self.value)

class BinaryOP():
    def __init__(self,left,right):
        self.left = left
        self.right = right

class Add(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,self)
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Sub(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,self)
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Pwr(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,self)
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Mul(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,self)
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Div(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,self)
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Mod(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,self)
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Equal(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,self)
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class NotEqual(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,self)
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Greater(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,self)
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Less(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,self)
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class GreaterOrEqual(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,self)
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class LessOrEqual(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,self)
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class And(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,self)
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Or(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,self)
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")