'''
MOTH OPS

PLUS
MINUS
STARSTAR
STAR
SLASH
PERCENT

EQUAL
NOT_EQUAL
GREATER
LESS
GREATER_OR_EQUAL
LESS_OR_EQUAL
AND
OR
NOT
AMP
VERT
'''

import moth_types

class MothOP:
    def initialize():
        pass

class MothBinOP:
    def __init__(self,left,right):
        self.left = left
        self.right = right
        self.initialize()

class MothSingleOP:
    def __init__(self,operand):
        self.operand = operand
        self.initialize()

class MothBinOPNumeric:
    pass

class MothBinOPBool:
    pass

class MothSingleOPBool:
    pass

class MothPlus(MothBinOPNumeric):
    pass

class MothMinus(MothBinOPNumeric):
    pass

class MothStarStar(MothBinOPNumeric):
    pass

class MothStar(MothBinOPNumeric):
    pass

class MothPercent(MothBinOPNumeric):
    pass

class MothEqual(MothBinOPBool):
    pass

class MothNotEqual(MothBinOPBool):
    pass

class MothGreater(MothBinOPBool):
    pass

class MothLess(MothBinOPBool):
    pass

class MothGreaterOrEqual(MothBinOPBool):
    pass

class MothLessOrEqual(MothBinOPBool):
    pass

class MothAnd(MothBinOPBool):
    pass

class MothOr(MothBinOPBool):
    pass

class MothNot(MothSingleOPBool):
    pass