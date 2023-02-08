from .. import error

class InitializeArray():
    def __init__(self,inittype):
        self.type = inittype
    
    def is_a(self,check):
        if check == "InitializeArray":
            return True
        return False
    
    def find_variables(self,out):
        self.type.find_variables(out)
    
    def show_tree(self,indent=""):
        print(indent,"InitializeArray")
        self.type.show_tree(indent+"   ")

class InitializeObjectArray():
    def __init__(self,call,index):
        self.call = call
        self.index = index
    
    def is_a(self,check):
        if check == "InitializeObjectArray":
            return True
        return False
    
    def find_variables(self,out):
        self.call.find_variables(out)
        self.index.find_variables(out)
    
    def show_tree(self,indent=""):
        print(indent,"InitializeObjectArray")
        self.call.show_tree(indent+"   ")
        self.index.show_tree(indent+"   ")