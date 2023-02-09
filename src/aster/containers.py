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

class EmptyLine():
    def __init__(self):
        pass

    def is_a(self,check):
        if check == "EmptyLine":
            return True
        return False

    def show_tree(self,indent=""):
        print(indent,"EmptyLine")