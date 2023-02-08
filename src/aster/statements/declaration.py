from . import error

class Declaration():
    def __init__(self,declare_type,identifier):
        self.type = declare_type
        self.identifier = identifier
    
    def is_a(self,check):
        if check == "Declaration":
            return True
        return False
    
    def get_types(self):
        return [self.type.typename]

    def find_variables(self,out):
        if self.identifier.value in out.keys():
            error.error("Variable '" + self.identifier.value + "' redefined",self.identifier.token.source_pos.lineno)
        out[self.identifier.value] = self
    
    def show_tree(self,indent=""):
        print(indent,"Declaration")
        self.type.show_tree(indent+"   ")
        self.identifier.show_tree(indent+"   ")
    
    def generate(self,parent,indent):
        return self.type.get_ctype() + " " + self.identifier.value