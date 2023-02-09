class Return():
    def __init__(self,value=None):
        self.value = value

    def is_a(self,check):
        if check == "Return":
            return True
        return False

    def show_tree(self,indent=""):
        print(indent,"Return")
        if type(self.value) != type(None):
            self.value.show_tree(indent+"   ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        if type(self.value) != type(None):
            self.value.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        if type(self.value) != type(None):
            self.value.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        if type(self.value) != type(None):
            self.value.cascade_functions(out)

class Break():
    def __init__(self):
        pass
    
    def is_a(self,check):
        if check == "Break":
            return True
        return False

    def show_tree(self,indent=""):
        print(indent,"Break")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
    
    def cascade_classes(self,out):
        self.classes = out
    
    def cascade_functions(self,out):
        self.functions = out
        