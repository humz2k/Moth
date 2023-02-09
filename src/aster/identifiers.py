class Identifier():
    def __init__(self,token):
        self.token = token
        self.value = token.value
    
    def is_a(self,check):
        if check == "Identifier":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"Identifier")
        print(indent,"   ",self.value)
    
class Reference():
    def __init__(self,source,attribute):
        self.source = source
        self.attribute = attribute

    def is_a(self,check):
        if check == "Reference":
            return True
        return False

    def show_tree(self,indent=""):
        print(indent,"Reference")
        print(indent + "   ","Source")
        self.source.show_tree(indent + "       ")
        print(indent + "   ","Attribute")
        self.attribute.show_tree(indent + "       ")