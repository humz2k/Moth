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