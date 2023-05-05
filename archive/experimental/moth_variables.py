
class MothValue:
    pass

class Identifier:
    def __init__(self,value):
        self.value = value
    
    def hash(self):
        return self.value
    
    def get_c(self):
        return self.value

class Literal:
    def __init__(self,value):
        self.value = value
    
    def get_c(self):
        return self.value

class FloatLiteral(Literal):
    pass

class IntLiteral(Literal):
    pass

class CharLiteral(Literal):
    pass
    
class MothVariable(MothValue):
    def __init__(self, moth_type, identifier):
        self.moth_type = moth_type
        self.identifier = identifier
    
    def get_c(self):
        return self.identifier.get_c()

class MothLiteral(MothValue):
    def __init__(self, moth_type, literal):
        self.moth_type = moth_type
        self.literal = literal
    
    def get_c(self):
        return self.literal.get_c()
