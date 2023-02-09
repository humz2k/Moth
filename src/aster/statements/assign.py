class Assign():
    def __init__(self,assign_to,expression):
        self.assign_to = assign_to
        self.expression = expression
    
    def is_a(self,check):
        if check == "Assign":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"Assign")
        print(indent + "   ","Out")
        self.assign_to.show_tree(indent + "       ")
        print(indent + "   ","Value")
        self.expression.show_tree(indent + "       ")