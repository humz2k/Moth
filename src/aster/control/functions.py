class Function():
    def __init__(self,scope):
        self.scope = scope
        self.identifier = scope.header.identifier
    
    def is_a(self,check):
        if check == "Function":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"Function")
        self.scope.show_tree(indent+"   ")


class FunctionDef():
    def __init__(self,return_type,identifier,inp = None):
        self.type = return_type
        self.identifier = identifier
        if type(inp) == type(None):
            self.inputs = []
        else:
            self.inputs = [inp]
    
    def is_a(self,check):
        if check == "FunctionDef":
            return True
        return False
    
    def add_input(self,declaration):
        self.inputs.append(declaration)
        return self

    def show_tree(self,indent=""):
        print(indent,"FunctionDef")
        self.type.show_tree(indent + "   ")
        self.identifier.show_tree(indent + "   ")
        print(indent + "   ","Inputs")
        if len(self.inputs) == 0:
            print(indent + "        ","None")
        else:
            for inp in self.inputs:
                inp.show_tree(indent + "       ")

class FunctionCall():
    def __init__(self,identifier,inp = None):
        self.identifier = identifier
        if type(inp) == type(None):
            self.inputs = []
        else:
            self.inputs = [inp]

    def is_a(self,check):
        if check == "FunctionCall":
            return True
        return False

    def add_input(self,inp):
        self.inputs.append(inp)
        return self

    def show_tree(self,indent=""):
        print(indent,"FunctionCall")
        self.identifier.show_tree(indent + "   ")
        print(indent + "   ","Inputs")
        if len(self.inputs) == 0:
            print(indent + "       ","None")
        else:
            for inp in self.inputs:
                inp.show_tree(indent+"       ")