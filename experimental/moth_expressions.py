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
RSHIFT
LSHIFT
'''

class MothOP:
    def initialize():
        pass

class MothReturn(MothOP):
    def __init__(self,expression = None):
        self.expression = expression
    
    def build(self):
        if type(self.expression) != type(None):
            return "return " + self.expression.get_c() + ";"
        return "return;"

class MothBreak(MothOP):
    pass

class MothAssign(MothOP):
    def __init__(self,var,expression):
        self.var = var
        self.expression = expression
    
    def build(self):
        return self.var.get_c() + " = " + self.expression.get_c() + ";"

class FunctionCallInputs:
    def __init__(self):
        self.expressions = []
    
    def add_input(self,expression):
        self.expressions.append(expression)

class MothFunctionCall(MothOP):
    def __init__(self,function,inputs):
        self.function = function
        self.moth_type = function.moth_type
        self.inputs = inputs

class MothBinOP(MothOP):
    def __init__(self,left,right):
        self.left = left
        self.right = right
        self.initialize()

class MothSingleOP(MothOP):
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