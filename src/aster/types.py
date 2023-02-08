from . import error

CTYPE_MAP={
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

class Declaration():
    def __init__(self,declare_type,identifier):
        self.type = declare_type
        self.identifier = identifier
    
    def is_a(self,check):
        if check == "Declaration":
            return True
        return False
    
    def get_types(self):
        return [self.type.typename]

    def find_variables(self,out):
        if self.identifier.value in out.keys():
            error.error("Variable '" + self.identifier.value + "' redefined",self.identifier.token.source_pos.lineno)
        out[self.identifier.value] = self
    
    def show_tree(self,indent=""):
        print(indent,"Declaration")
        self.type.show_tree(indent+"   ")
        self.identifier.show_tree(indent+"   ")
    
    def generate(self,parent,indent):
        return self.type.get_ctype() + " " + self.identifier.value

class TypeObj():
    def __init__(self,value):
        self.token = value
        self.typename = value.value
    
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
        return CTYPE_MAP[self.typename]

class InitializeArray():
    def __init__(self,inittype):
        self.type = inittype
    
    def is_a(self,check):
        if check == "InitializeArray":
            return True
        return False
    
    def find_variables(self,out):
        self.type.find_variables(out)
    
    def show_tree(self,indent=""):
        print(indent,"InitializeArray")
        self.type.show_tree(indent+"   ")

class InitializeObject():
    def __init__(self,call):
        self.call = call
    
    def is_a(self,check):
        if check == "InitializeObject":
            return True
        return False
    
    def find_variables(self,out):
        self.call.find_variables(out)
    
    def show_tree(self,indent=""):
        print(indent,"InitializeObject")
        self.call.show_tree(indent+"   ")

class InitializeObjectArray():
    def __init__(self,call,index):
        self.call = call
        self.index = index
    
    def is_a(self,check):
        if check == "InitializeObjectArray":
            return True
        return False
    
    def find_variables(self,out):
        self.call.find_variables(out)
        self.index.find_variables(out)
    
    def show_tree(self,indent=""):
        print(indent,"InitializeObjectArray")
        self.call.show_tree(indent+"   ")
        self.index.show_tree(indent+"   ")