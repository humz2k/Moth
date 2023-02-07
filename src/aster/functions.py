class FunctionDef():
    def __init__(self,declaration):
        self.declaration = declaration
        self.inputs = []
    
    def add_input(self,declaration):
        self.inputs.append(declaration)
        return self

    def show_tree(self,indent=""):
        print(indent,"FunctionDef")
        self.declaration.show_tree(indent + "   ")
        for inp in self.inputs:
            inp.show_tree(indent + "   ")