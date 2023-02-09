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
    
    def is_a(self,check):
        if check == "Cast":
            return True
        return False

    def show_tree(self,indent):
        print(indent,"Cast")
        self.type.show_tree(indent+"   ")
        self.expression.show_tree(indent+"   ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.expression.cascade_parent(self)
        self.type.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.expression.cascade_classes(out)
        self.type.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.expression.cascade_functions(out)
        self.type.cascade_functions(out)