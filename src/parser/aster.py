class AstObj:
    pass

class Container(AstObj):
    def __init__(self,item=None):
        if type(item) != type(None):
            self.items = [item]
        else:
            self.items = []
    
    def add(self,item):
        self.items.append(item)
        return self

class Program(Container):
    pass

class Scope(AstObj):
    def __init__(self,header,body):
        self.header = header
        self.body = body    

class ScopeHeader(AstObj):
    pass

class FunctionHeader(ScopeHeader):
    def __init__(self,return_type,name,inputs):
        self.return_type = return_type
        self.name = name
        self.inputs = inputs

class FunctionDefInputs(Container):
    pass

class ScopeBody(AstObj):
    def __init__(self,lines):
        self.lines = lines

class Lines(Container):
    pass