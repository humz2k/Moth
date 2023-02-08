from . import error

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

class Cast():
    def __init__(self,newtype,expression):
        self.expression = expression
        self.type = newtype
    
    def show_tree(self,indent):
        print(indent,"Cast")
        self.type.show_tree(indent+"   ")
        self.expression.show_tree(indent+"   ")

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
    
    def generate(self,parent,indent):
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
    
    def generate(self,parent,indent):
        return self.value

class Identifier():
    def __init__(self,token):
        self.token = token
        self.value = token.value
    
    def is_a(self,check):
        if check == "Identifier":
            return True
        return False

    def find_variables(self,out):
        self.variables = out
        if not (self.value in self.variables):
            error.error("Variable '" + self.value + "' not defined",self.token.source_pos.lineno)
        return None
    
    def show_tree(self,indent=""):
        print(indent,"Identifier")
        print(indent,"   ",self.value)
    
    def get_types(self):
        return [self.variables[self.value].type.typename]

    def generate(self,parent,indent):
        return self.value

class Reference():
    def __init__(self,source,attribute):
        self.source = source
        self.attribute = attribute

    def is_a(self,check):
        if check == "Reference":
            return True
        return False
    
    def find_variables(self,out):
        self.variables = out
        self.source.find_variables(out)
        self.attribute.find_variables(out)
    
    def show_tree(self,indent=""):
        print(indent,"Reference")
        print(indent + "   ","Source")
        self.source.show_tree(indent + "       ")
        print(indent + "   ","Attribute")
        self.attribute.show_tree(indent + "       ")

class BinaryOP():
    def __init__(self,left,right):
        self.left = left
        self.right = right
    
    def find_variables(self,out):
        self.variables = out
        self.left.find_variables(out)
        self.right.find_variables(out)
    
    def is_a(self,check):
        if check == "BinaryOP":
            return True
        return False
    
    def get_types(self):
        left_types = set(self.left.get_types())
        right_types = set(self.right.get_types())
        common_types = list(left_types.intersection(right_types))
        if len(common_types) == 0:
            error.error("Type Error in BinaryOP")
        return common_types

    def generate_for_var(self,parent,indent,operation_type):
        error.error(str(self.generate_for_var) + " NOT IMPLEMENTED")
    
    def generate(self,parent,indent,operation_type):
        if not (operation_type in ["int","float","double","uint","char","uchar","long","ulong"]):
            error.error(str(self.generate) + " NOT IMPLEMENTED FOR " + operation_type)
        return self.generate_for_var(parent,indent,operation_type)

class Add(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Add")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")
    
    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        if self.left.is_a("BinaryOP"):
            out += self.left.generate(self,indent,operation_type)
        else:
            out += self.left.generate(self,indent)
        out += "+"
        if self.right.is_a("BinaryOP"):
            out += self.right.generate(self,indent,operation_type)
        else:
            out += self.right.generate(self,indent)
        out += ")"
        return out

class Sub(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Sub")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        if self.left.is_a("BinaryOP"):
            out += self.left.generate(self,indent,operation_type)
        else:
            out += self.left.generate(self,indent)
        out += "-"
        if self.right.is_a("BinaryOP"):
            out += self.right.generate(self,indent,operation_type)
        else:
            out += self.right.generate(self,indent)
        out += ")"
        return out

class Pwr(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Pwr")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

class Mul(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Mul")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        if self.left.is_a("BinaryOP"):
            out += self.left.generate(self,indent,operation_type)
        else:
            out += self.left.generate(self,indent)
        out += "*"
        if self.right.is_a("BinaryOP"):
            out += self.right.generate(self,indent,operation_type)
        else:
            out += self.right.generate(self,indent)
        out += ")"
        return out

class Div(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Div")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        if self.left.is_a("BinaryOP"):
            out += self.left.generate(self,indent,operation_type)
        else:
            out += self.left.generate(self,indent)
        out += "/"
        if self.right.is_a("BinaryOP"):
            out += self.right.generate(self,indent,operation_type)
        else:
            out += self.right.generate(self,indent)
        out += ")"
        return out

class Mod(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Mod")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        if self.left.is_a("BinaryOP"):
            out += self.left.generate(self,indent,operation_type)
        else:
            out += self.left.generate(self,indent)
        out += "%"
        if self.right.is_a("BinaryOP"):
            out += self.right.generate(self,indent,operation_type)
        else:
            out += self.right.generate(self,indent)
        out += ")"
        return out

class Equal(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Equal")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        if self.left.is_a("BinaryOP"):
            out += self.left.generate(self,indent,operation_type)
        else:
            out += self.left.generate(self,indent)
        out += "=="
        if self.right.is_a("BinaryOP"):
            out += self.right.generate(self,indent,operation_type)
        else:
            out += self.right.generate(self,indent)
        out += ")"
        return out

class NotEqual(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"NotEqual")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        if self.left.is_a("BinaryOP"):
            out += self.left.generate(self,indent,operation_type)
        else:
            out += self.left.generate(self,indent)
        out += "!="
        if self.right.is_a("BinaryOP"):
            out += self.right.generate(self,indent,operation_type)
        else:
            out += self.right.generate(self,indent)
        out += ")"
        return out

class Greater(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Greater")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        if self.left.is_a("BinaryOP"):
            out += self.left.generate(self,indent,operation_type)
        else:
            out += self.left.generate(self,indent)
        out += ">"
        if self.right.is_a("BinaryOP"):
            out += self.right.generate(self,indent,operation_type)
        else:
            out += self.right.generate(self,indent)
        out += ")"
        return out

class Less(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Less")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        if self.left.is_a("BinaryOP"):
            out += self.left.generate(self,indent,operation_type)
        else:
            out += self.left.generate(self,indent)
        out += "<"
        if self.right.is_a("BinaryOP"):
            out += self.right.generate(self,indent,operation_type)
        else:
            out += self.right.generate(self,indent)
        out += ")"
        return out

class GreaterOrEqual(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"GreaterOrEqual")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        if self.left.is_a("BinaryOP"):
            out += self.left.generate(self,indent,operation_type)
        else:
            out += self.left.generate(self,indent)
        out += ">="
        if self.right.is_a("BinaryOP"):
            out += self.right.generate(self,indent,operation_type)
        else:
            out += self.right.generate(self,indent)
        out += ")"
        return out

class LessOrEqual(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"LessOrEqual")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "("
        if self.left.is_a("BinaryOP"):
            out += self.left.generate(self,indent,operation_type)
        else:
            out += self.left.generate(self,indent)
        out += "<="
        if self.right.is_a("BinaryOP"):
            out += self.right.generate(self,indent,operation_type)
        else:
            out += self.right.generate(self,indent)
        out += ")"
        return out

class And(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"And")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "(("
        if self.left.is_a("BinaryOP"):
            out += self.left.generate(self,indent,operation_type)
        else:
            out += self.left.generate(self,indent)
        out += ") && ("
        if self.right.is_a("BinaryOP"):
            out += self.right.generate(self,indent,operation_type)
        else:
            out += self.right.generate(self,indent)
        out += "))"
        return out

class Or(BinaryOP):
    def show_tree(self,indent=""):
        print(indent,"Or")
        self.left.show_tree(indent+"   ")
        self.right.show_tree(indent+"   ")

    def generate_for_var(self, parent, indent, operation_type):
        out = "(("
        if self.left.is_a("BinaryOP"):
            out += self.left.generate(self,indent,operation_type)
        else:
            out += self.left.generate(self,indent)
        out += ") || ("
        if self.right.is_a("BinaryOP"):
            out += self.right.generate(self,indent,operation_type)
        else:
            out += self.right.generate(self,indent)
        out += "))"
        return out

class Not():
    def __init__(self,expression):
        self.expression = expression
    
    def is_a(self,check):
        if check == "Not":
            return True
        return False

    def generate(self,parent,indent):
        error.error(str(self.generate) + "NOT IMPLEMENTED")

    def find_variables(self,out):
        self.variables = out
        self.expression.find_variables(out)
    
    def show_tree(self,indent=""):
        print(indent,"Not")
        self.expression.show_tree(indent+"   ")

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

class Iterator():
    def __init__(self,start,end,inc):
        self.start = start
        self.end = end
        self.inc = inc
    
    def find_variables(self,out):
        self.variables = out
        self.start.find_variables(out)
        self.end.find_variables(out)
        self.inc.find_variables(out)
    
    def is_a(self,check):
        if check == "Iterator":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"Iterator")
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
    
    def find_variables(self,out):
        self.variables = out
        self.start.find_variables(out)
        self.end.find_variables(out)
        self.n.find_variables(out)
    
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