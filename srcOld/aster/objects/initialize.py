class InitializeObject():
    def __init__(self,call):
        self.call = call
    
    def is_a(self,check):
        if check == "InitializeObject":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"InitializeObject")
        self.call.show_tree(indent+"   ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.owner = caller
        self.call.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.call.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.call.cascade_functions(out)