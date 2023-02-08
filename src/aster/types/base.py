from . import error

class TypeObj():
    def __init__(self,value):
        self.token = value
        self.typename = value.value
        self.ctype_map = {
            "void" : "void",
            "char" : "char",
            "uchar" : "unsigned char",
            "short" : "unsigned short",
            "int" : "int",
            "uint" : "unsigned int",
            "long" : "long",
            "ulong" : "unsigned long",
            "float" : "float",
            "double" : "double"
        }
    
    def is_a(self,check):
        if check == "TypeObj":
            return True
        return False
    
    def find_variables(self,out):
        pass
    
    def show_tree(self,indent=""):
        print(indent,"TypeObj")
        print(indent,"   ",self.typename)
    
    def get_ctype(self):
        if "array" in self.typename:
            error.error("ARRAYS NOT IMPLEMENTED")
        if "object" in self.typename:
            error.error("OBJECTS NOT IMPLEMENTED")
        if "string" in self.typename:
            error.error("STRINGS NOT IMPLEMENTED")
        return self.ctype_map[self.typename]