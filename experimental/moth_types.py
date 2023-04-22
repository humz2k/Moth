'''
MOTH TYPES:
USER
    object
MISC
    void
    str
NUMERIC
    MISC
        bool
    SIGNED
        int
        long
    FPOINT
        float
        double
    COMPLEX
        complexf
        complexd
ARRAY
    number only
MAP
    any->any
LIST
    any

'''

import moth_ops

def throwNoConversions(from_type,to_type):
    Exception("No conversions exist between " + str(from_type) + " and " + str(to_type))

class MothType:
    pass

class MothObject(MothType):
    def __init__(self,object_reference):
        self.object_reference = object_reference

    def get_c(self):
        Exception("MothObjectGetC not implemented")

    def __str__(self):
        return "[MothType: object]"

class MothVoid(MothType):
    def __init__(self):
        self.precedence = 0

    def get_c(self):
        return "__Mothvoid"

    def __str__(self):
        return "[MothType: void]"
    
class MothTypeNumeric(MothType):
    pass

class MothBool(MothTypeNumeric):
    def __init__(self):
        self.precedence = 1

    def get_c(self):
        return "__Mothbool"
    
    def __str__(self):
        return "[MothType: bool]"

class MothInt(MothTypeNumeric):
    def __init__(self):
        self.precedence = 2

    def get_c(self):
        return "__Mothint"
    
    def __str__(self):
        return "[MothType: int]"
    
class MothLong(MothTypeNumeric):
    def __init__(self):
        self.precedence = 3

    def get_c(self):
        return "__Mothlong"
    
    def __str__(self):
        return "[MothType: long]"

class MothFloat(MothTypeNumeric):
    def __init__(self):
        self.precedence = 4

    def get_c(self):
        return "__Mothfloat"
    
    def __str__(self):
        return "[MothType: float]"

class MothDouble(MothTypeNumeric):
    def __init__(self):
        self.precedence = 5

    def get_c(self):
        return "__Mothdouble"
    
    def __str__(self):
        return "[MothType: double]"

class MothComplexf(MothTypeNumeric):
    def __init__(self):
        self.precedence = 6

    def get_c(self):
        return "__Mothcomplexf"
    
    def __str__(self):
        return "[MothType: complexf]"

class MothComplexd(MothTypeNumeric):
    def __init__(self):
        self.precedence = 7

    def get_c(self):
        return "__Mothcomplexd"
    
    def __str__(self):
        return "[MothType: complexd]"
    
class MothArray(MothType):
    def __init__(self,dimensions):
        self.dimensions = dimensions

class MothBoolArray(MothArray):
    def get_c(self):
        return "__Mothboolarray"

    def __str__(self):
        return "[MothType: bool array]"

class MothIntArray(MothArray):
    def get_c(self):
        return "__Mothintarray"

    def __str__(self):
        return "[MothType: int array]"

class MothLongArray(MothArray):
    def get_c(self):
        return "__Mothlongarray"

    def __str__(self):
        return "[MothType: long array]"

class MothFloatArray(MothArray):
    def get_c(self):
        return "__Mothfloatarray"

    def __str__(self):
        return "[MothType: float array]"

class MothDoubleArray(MothArray):
    def get_c(self):
        return "__Mothdoublearray"

    def __str__(self):
        return "[MothType: double array]"

class MothComplexfArray(MothArray):
    def get_c(self):
        return "__Mothcomplexfarray"

    def __str__(self):
        return "[MothType: complexf array]"

class MothComplexdArray(MothArray):
    def get_c(self):
        return "__Mothcomplexdarray"

    def __str__(self):
        return "[MothType: complexd array]"
    
class MothMap(MothType):
    def __init__(self,from_type,to_type):
        self.from_type = from_type
        self.to_type = to_type
    
    def get_c(self):
        Exception("MothMap get_c not implemented")
    
    def __str__(self):
        return "[MothType: map]"

class MothList(MothType):
    def __init__(self,list_type):
        self.list_type = list_type
    
    def get_c(self):
        Exception("MothList get_c not implemented")
    
    def __str__(self):
        return "[MothType: list]"