class Bool():
    def __init__(self,token):
        self.token = token
        self.value = token.value

    def is_a(self,check):
        if check == "Bool":
            return True
        return False

    def show_tree(self,indent=""):
        print(indent,"Bool")
        print(indent,"   ",self.value)
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
    
    def cascade_classes(self,out):
        self.classes = out
    
    def cascade_functions(self,out):
        self.functions = out

class Number():
    def __init__(self,token):
        self.token = token
        self.value = token.value

    def is_a(self,check):
        if check == "Number":
            return True
        return False

    def show_tree(self,indent=""):
        print(indent,"Number")
        print(indent,"   ",self.value)
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
    
    def cascade_classes(self,out):
        self.classes = out
    
    def cascade_functions(self,out):
        self.functions = out

class String():
    def __init__(self,token):
        self.token = token
        self.value = token.value
    
    def is_a(self,check):
        if check == "String":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"String")
        print(indent+"   ",self.value)
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
    
    def cascade_classes(self,out):
        self.classes = out

    def cascade_functions(self,out):
        self.functions = out