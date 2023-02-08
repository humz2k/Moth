from . import error

class Identifier():
    def __init__(self,token):
        self.token = token
        self.value = token.value
    
    def is_a(self,check):
        if check == "Identifier":
            return True
        return False

    def find_variables(self,out):
        self.variables = out
        if not (self.value in self.variables):
            error.error("Variable '" + self.value + "' not defined",self.token.source_pos.lineno)
        return None
    
    def show_tree(self,indent=""):
        print(indent,"Identifier")
        print(indent,"   ",self.value)
    
    def get_types(self):
        return [self.variables[self.value].type.typename]

    def generate(self,parent,indent,ignore=None):
        return self.value

class Reference():
    def __init__(self,source,attribute):
        self.source = source
        self.attribute = attribute

    def is_a(self,check):
        if check == "Reference":
            return True
        return False
    
    def find_variables(self,out):
        self.variables = out
        self.source.find_variables(out)
        self.attribute.find_variables(out)
    
    def show_tree(self,indent=""):
        print(indent,"Reference")
        print(indent + "   ","Source")
        self.source.show_tree(indent + "       ")
        print(indent + "   ","Attribute")
        self.attribute.show_tree(indent + "       ")