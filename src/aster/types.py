class Declaration():
    def __init__(self,declare_type,identifier):
        self.type = declare_type
        self.identifier = identifier
    
    def show_tree(self,indent=""):
        print(indent,"Declaration")
        self.type.show_tree(indent+"   ")
        self.identifier.show_tree(indent+"   ")

class TypeObj():
    def __init__(self,value):
        self.value = value
    
    def show_tree(self,indent=""):
        print(indent,"TypeObj")
        print(indent,"   ",self.value)