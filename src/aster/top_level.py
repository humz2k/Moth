class Program:
    def __init__(self,scope):
        self.scopes = [scope]
    
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
    
    def show_tree(self,indent=""):
        print(indent,"Scope")
        self.header.show_tree(indent + "   ")
        self.lines.show_tree(indent + "      ")

class Lines:
    def __init__(self,line):
        self.lines = [line]
    
    def add_line(self,line):
        self.lines.append(line)
        return self

    def show_tree(self,indent=""):
        print(indent,"Lines")
        for line in self.lines:
            line.show_tree(indent + "   ")