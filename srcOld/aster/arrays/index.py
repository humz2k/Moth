class Index():
    def __init__(self,dimension=None):
        if type(dimension) == type(None):
            self.dimensions = [EmptyIndex()]
        else:
            self.dimensions = [dimension]
    
    def is_a(self,check):
        if check == "Index":
            return True
        return False

    def add_dimension(self,dimension):
        self.dimensions.append(dimension)
        return self
    
    def show_tree(self,indent=""):
        print(indent,"Index")
        for dimension in self.dimensions:
            dimension.show_tree(indent + "   ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        for dim in self.dimensions:
            dim.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        for dim in self.dimensions:
            dim.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        for dim in self.dimensions:
            dim.cascade_functions(out)

class EmptyIndex():
    def __init__(self):
        pass

    def is_a(self,check):
        if check == "EmptyIndex":
            return True
        return False

    def show_tree(self,indent=""):
        print(indent,"EmptyIndex")
        print(indent + "   " + ":")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
    
    def cascade_classes(self,out):
        self.classes = out
    
    def cascade_functions(self,out):
        self.functions = out

class ArrayIndex():
    def __init__(self,identifier,index):
        self.identifier = identifier
        self.index = index
    
    def is_a(self,check):
        if check == "ArrayIndex":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"ArrayIndex")
        self.identifier.show_tree(indent+"   ")
        self.index.show_tree(indent+"   ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.identifier.cascade_parent(self)
        self.index.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.identifier.cascade_classes(out)
        self.index.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.identifier.cascade_functions(out)
        self.index.cascade_functions(out)