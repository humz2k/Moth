class ArrayType():
    def __init__(self,array_type,index):
        self.type = array_type
        self.index = index
        self.typename = self.type.typename + "array"
    
    def is_a(self,check):
        if check == "ArrayType":
            return True
        return False

    def show_tree(self,indent=""):
        print(indent,"ArrayType")
        self.type.show_tree(indent+"   ")
        self.index.show_tree(indent+"   ")
    
    def error(self,caller):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.type.cascade_parent(self)
        self.index.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.type.cascade_classes(out)
        self.index.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.type.cascade_functions(out)
        self.index.cascade_functions(out)