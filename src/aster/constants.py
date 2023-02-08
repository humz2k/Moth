from . import error

class Bool():
    def __init__(self,token):
        self.token = token
        self.value = token.value

    def is_a(self,check):
        if check == "Bool":
            return True
        return False

    def find_variables(self,out):
        pass
    
    def show_tree(self,indent=""):
        print(indent,"Bool")
        print(indent,"   ",self.value)
    
    def get_types(self):
        return ["int"]
    
    def generate(self,parent,indent,ignore=None):
        return ["0","1"][self.value == "True"]

class Number():
    def __init__(self,token):
        self.token = token
        self.value = token.value

    def is_a(self,check):
        if check == "Number":
            return True
        return False

    def find_variables(self,out):
        pass

    def get_types(self):
        if "." in self.value:
            return ["float"]
        else:
            return ["float","int"]

    def show_tree(self,indent=""):
        print(indent,"Number")
        print(indent,"   ",self.value)
    
    def generate(self,parent,indent,ignore=None):
        return self.value

class String():
    def __init__(self,token):
        self.token = token
        self.value = token.value
    
    def find_variables(self,out):
        pass
    
    def is_a(self,check):
        if check == "String":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"String")
        print(indent+"   ",self.value)