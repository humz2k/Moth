class InitializeObject():
    def __init__(self,call):
        self.call = call
    
    def is_a(self,check):
        if check == "InitializeObject":
            return True
        return False
    
    def find_variables(self,out):
        self.call.find_variables(out)
    
    def show_tree(self,indent=""):
        print(indent,"InitializeObject")
        self.call.show_tree(indent+"   ")