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