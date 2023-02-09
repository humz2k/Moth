class Arange():
    def __init__(self,start,end,inc):
        self.start = start
        self.end = end
        self.inc = inc
    
    def is_a(self,check):
        if check == "Iterator":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"Arange")
        print(indent+"   ","Start")
        self.start.show_tree(indent+"       ")
        print(indent+"   ","End")
        self.end.show_tree(indent+"       ")
        print(indent+"   ","Inc")
        self.inc.show_tree(indent+"       ")

class Linspace():
    def __init__(self,start,end,n):
        self.start = start
        self.end = end
        self.n = n
    
    def is_a(self,check):
        if check == "Linspace":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"Linspace")
        print(indent+"   ","Start")
        self.start.show_tree(indent+"       ")
        print(indent+"   ","End")
        self.end.show_tree(indent+"       ")
        print(indent+"   ","N")
        self.n.show_tree(indent+"       ")