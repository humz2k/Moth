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
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.scope.cascade_parent(self)

    def cascade_classes(self,out):
        self.classes = out
        self.identifier.cascade_classes(out)
        self.scope.cascade_classes(out)

    def cascade_functions(self,out):
        name = self.identifier.value
        if self.parent.is_a("Class"):
            name = self.parent.identifier.value + "->" + name
        if name in out:
            self.parent.error([self])
            return
        out[name] = self
        self.functions = out
        self.identifier.cascade_functions(out)
        self.scope.cascade_functions(out)


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
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)
        
    def cascade_parent(self,caller):
        self.parent = caller
        self.type.cascade_parent(self)
        self.identifier.cascade_parent(self)
        for inp in self.inputs:
            inp.cascade_parents(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.type.cascade_classes(out)
        self.identifier.cascade_classes(out)
        for inp in self.inputs:
            inp.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.type.cascade_functions(out)
        self.identifier.cascade_functions(out)
        for inp in self.inputs:
            inp.cascade_functions(out)

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
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.identifier.cascade_parent(self)
        for inp in self.inputs:
            inp.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.identifier.cascade_classes(out)
        for inp in self.inputs:
            inp.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.identifier.cascade_functions(out)
        for inp in self.inputs:
            inp.cascade_functions(out)