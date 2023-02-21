class base:
    def propogate(self):
        pass

class Line(base):
    def __init__(self,line):
        self.line = line

class Declaration(base):
    def __init__(self,this_type,var):
        self.type = this_type
        self.var = var

class TypeName(base):
    def __init__(self,token):
        self.token = token

class Variable(base):
    def __init__(self,token):
        self.token = token
    
    def set_type(self,this_type):
        self.type = this_type

class Number(base):
    def __init__(self,token):
        self.token = token

class String(base):
    def __init__(self,token):
        self.token = token

class Bool(base):
    def __init__(self,token):
        self.token = token

class scope(base):
    def __init__(self,lines):
        self.lines = lines