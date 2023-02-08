from . import error

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
    
    def is_main(self):
        return self.scope.is_main()
    
    def find_classes(self,program):
        return None
    
    def find_top_level_functions(self,program):
        if self.identifier.value in program.functions:
            error.error("Function '" + self.identifier.value + "' redefined",self.identifier.token.source_pos.lineno)
        program.functions[self.identifier.value] = self
        return self.identifier.value

    def find_variables(self,functions = {}, classes ={}):
        self.variables = self.scope.find_variables(functions = functions, classes = classes)

    def generate(self,parent):
        self.parent = parent
        self.find_variables(parent.functions,parent.classes)
        print(self.variables)
        return self.scope.generate(self)


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
    
    def is_main(self):
        if self.identifier.value == "main":
            if self.type.typename != "int":
                error.error("Function 'main' does not return 'int'",self.identifier.token.source_pos.lineno)
            return 1
        return 0
    
    def find_variables(self,out):
        for i in self.inputs:
            i.find_variables(out)
    
    def generate(self,parent):
        self.parent = parent
        out = self.type.get_ctype() + " " + self.identifier.value + "("
        for i in self.inputs:
            out += i.generate(self,"") + ", "
        if out.endswith(", "):
            out = out[:-2]
        out += ")"
        return out

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

    def find_variables(self,out):
        self.identifier.find_variables(out)
        for i in self.inputs:
            i.find_variables(out)
    
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