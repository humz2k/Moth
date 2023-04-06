class InitializeArray():
    def __init__(self,inittype):
        self.type = inittype
    
    def is_a(self,check):
        if check == "InitializeArray":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"InitializeArray")
        self.type.show_tree(indent+"   ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.type.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.type.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.type.cascade_functions(out)

class InitializeObjectArray():
    def __init__(self,call,index):
        self.call = call
        self.index = index
    
    def is_a(self,check):
        if check == "InitializeObjectArray":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"InitializeObjectArray")
        self.call.show_tree(indent+"   ")
        self.index.show_tree(indent+"   ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.call.cascade_parent(self)
        self.index.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.call.cascade_classes(self)
        self.index.cascade_classes(self)
    
    def cascade_functions(self,out):
        self.functions = out
        self.call.cascade_functions(self)
        self.index.cascade_functions(self)