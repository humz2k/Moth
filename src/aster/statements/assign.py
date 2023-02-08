from .. import error

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
    
    def find_variables(self,out):
        self.expression.find_variables(out)
        self.assign_to.find_variables(out)
        self.variables = out
    
    def generate(self,parent,indent):
        assign_types = set(self.assign_to.get_types())
        expression_types = set(self.expression.get_types())
        operation_type = list(assign_types.intersection(expression_types))
        if len(operation_type) == 0:
            error.error("Type Error in Assign")
        if len(operation_type) > 1:
            error.error("Ambiguous return type")
        return self.assign_to.generate(self,indent) + " = " + self.expression.generate(self,indent,operation_type[0])