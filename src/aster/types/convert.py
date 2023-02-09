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