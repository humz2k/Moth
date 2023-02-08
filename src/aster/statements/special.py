from .. import error

class Return():
    def __init__(self,value=None):
        self.value = value

    def is_a(self,check):
        if check == "Return":
            return True
        return False

    def show_tree(self,indent=""):
        print(indent,"Return")
        if type(self.value) != type(None):
            self.value.show_tree(indent+"   ")
    
    def find_variables(self,out):
        self.variables = out
        self.value.find_variables(out)
        return None

class Break():
    def __init__(self):
        pass
    
    def is_a(self,check):
        if check == "Break":
            return True
        return False

    def show_tree(self,indent=""):
        print(indent,"Break")
    
    def find_variables(self,out):
        return None

    def generate(self,parent,indent):
        return "break"