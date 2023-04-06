class Program:
    def __init__(self,scope):
        self.scopes = [scope]
        self.classes = {}
        self.functions = {}
    
    def is_a(self,check):
        if check == "Program":
            return True
        return False
    
    def add_scope(self,scope):
        self.scopes.append(scope)
        return self

    def show_tree(self,indent=""):
        print(indent,"Program")
        for scope in self.scopes:
            scope.show_tree(indent + "   ")
    
    def error(self,caller):
        raise Exception(str(caller))

    def cascade_parent(self):
        for scope in self.scopes:
            scope.cascade_parent(self)
    
    def cascade_classes(self):
        for scope in self.scopes:
            scope.cascade_classes(self.classes)
    
    def cascade_functions(self):
        for scope in self.scopes:
            scope.cascade_functions(self.functions)
    
    def generate(self):
        self.cascade_parent()
        self.cascade_classes()
        self.cascade_functions()
        print(self.classes)
        print(self.functions)

class Scope:
    def __init__(self,header,lines):
        self.lines = lines
        self.header = header
    
    def is_a(self,check):
        if check == "Scope":
            return True
        return False
    
    def show_tree(self,indent=""):
        print(indent,"Scope")
        self.header.show_tree(indent + "   ")
        self.lines.show_tree(indent + "      ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        self.lines.cascade_parent(self)
        self.header.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        self.lines.cascade_classes(out)
        self.header.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        self.lines.cascade_functions(out)
        self.header.cascade_functions(out)

class Lines:
    def __init__(self,line):
        self.lines = [line]
    
    def is_a(self,check):
        if check == "Lines":
            return True
        return False
    
    def add_line(self,line):
        self.lines.append(line)
        return self

    def show_tree(self,indent=""):
        print(indent,"Lines")
        for line in self.lines:
            line.show_tree(indent + "   ")
    
    def error(self,caller=[]):
        self.parent.error([self] + caller)

    def cascade_parent(self,caller):
        self.parent = caller
        for line in self.lines:
            line.cascade_parent(self)
    
    def cascade_classes(self,out):
        self.classes = out
        for line in self.lines:
            line.cascade_classes(out)
    
    def cascade_functions(self,out):
        self.functions = out
        for line in self.lines:
            line.cascade_functions(out)

class EmptyLine():
    def __init__(self):
        pass

    def is_a(self,check):
        if check == "EmptyLine":
            return True
        return False

    def show_tree(self,indent=""):
        print(indent,"EmptyLine")
    
    def cascade_parent(self,caller):
        pass

    def cascade_classes(self,out):
        pass
    
    def cascade_functions(self,out):
        pass