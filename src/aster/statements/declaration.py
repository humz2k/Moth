class Declaration():
    def __init__(self,declare_type,identifier):
        self.type = declare_type
        self.identifier = identifier
    
    def is_a(self,check):
        if check == "Declaration":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"Declaration")
        self.type.show_tree(indent+"   ")
        self.identifier.show_tree(indent+"   ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.type.cascade_parent(self)
        self.identifier.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.type.cascade_classes(out)
        self.identifier.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.type.cascade_functions(out)
        self.identifier.cascade_functions(out)
        