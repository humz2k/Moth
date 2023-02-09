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
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
    
    def cascade_classes(self,out):
        self.classes = out
    
    def cascade_functions(self,out):
        self.functions = out
    
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
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.source.cascade_parent(self)
        self.attribute.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.source.cascade_classes(out)
        self.attribute.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.source.cascade_functions(out)
        self.attribute.cascade_functions(out)