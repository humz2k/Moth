import moth_types

class MothValue:
    pass

class Identifier:
    pass

class Literal:
    pass

class MothVariable(MothValue):
    def __init__(self, moth_type: moth_types.MothType, identifier: Identifier):
        self.moth_type = moth_type
        self.identifier = Identifier

class MothLiteral(MothValue):
    def __init__(self, moth_type: moth_types.MothType, literal: Literal):
        self.moth_type = moth_type
        self.literal = literal
