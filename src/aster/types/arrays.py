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