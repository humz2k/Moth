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
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.start.cascade_parent(self)
        self.end.cascade_parent(self)
        self.inc.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.start.cascade_classes(out)
        self.end.cascade_classes(out)
        self.inc.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.start.cascade_functions(out)
        self.end.cascade_functions(out)
        self.inc.cascade_functions(out)

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
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.start.cascade_parent(self)
        self.end.cascade_parent(self)
        self.n.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.start.cascade_classes(out)
        self.end.cascade_classes(out)
        self.n.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.start.cascade_functions(out)
        self.end.cascade_functions(out)
        self.n.cascade_functions(out)