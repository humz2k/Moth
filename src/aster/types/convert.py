from .. import error

class Cast():
    def __init__(self,newtype,expression):
        self.expression = expression
        self.type = newtype
        self.allowed_casts = {
            "int" : ["int","float","double","ulong","long","char","uchar"],
            "float" : ["int","float","double","ulong","long","char","uchar"],
            "double" : ["int","float","double","ulong","long","char","uchar"],
            "ulong" : ["int","float","double","ulong","long","char","uchar"],
            "long" : ["int","float","double","ulong","long","char","uchar"],
            "char" : ["int","float","double","ulong","long","char","uchar"],
            "uchar" : ["int","float","double","ulong","long","char","uchar"]
        }
    
    def find_variables(self,out):
        self.expression.find_variables(out)
    
    def is_a(self,check):
        if check == "Cast":
            return True
        return False

    def show_tree(self,indent):
        print(indent,"Cast")
        self.type.show_tree(indent+"   ")
        self.expression.show_tree(indent+"   ")

    def get_types(self):
        return [self.type.typename]
    
    def generate(self,parent,indent,operation_type):
        if not (self.type.typename in self.allowed_casts.keys()):
            error.error("Cast " + self.type.typename + " not implemented")
        new_type = set([self.type.typename])
        expression_types = set(self.expression.get_types())
        union_type = list(new_type.intersection(expression_types))
        if not (operation_type in new_type):
            error.error("Type Error",self.type.token.source_pos.lineno)
        if len(union_type) == 1:
            return "(" + union_type[0] + ")" + "(" + self.expression.generate(self,indent,union_type[0]) + ")"
        else:
            check = list(expression_types.intersection(self.allowed_casts[self.type.typename]))
            if len(check) == 0:
                error.error("Type Error",self.type.token.source_pos.lineno)
            return "(" + self.type.typename + ")" + "(" + self.expression.generate(self,indent,check[0]) + ")"