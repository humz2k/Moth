from . import error

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
    
    def main_exists(self):
        nmain = sum([i.is_main() for i in self.scopes])
        if nmain == 1:
            return True,1
        return False,nmain

    def find_classes(self):
        return [j for j in [i.find_classes(self) for i in self.scopes] if j != None]
    
    def find_functions(self):
        return [j for j in [i.find_top_level_functions(self) for i in self.scopes] if j != None]

    def generate(self):
        exists,n = self.main_exists()
        self.find_classes()
        self.find_functions()
        if not exists:
            error.error("Function 'main' has " + str(n) + " definitions")
        out = ""
        for scope in self.scopes:
            out += scope.generate(self)
        print(self.classes)
        print(self.functions)
        return out

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
    
    def is_main(self):
        return self.header.is_main()
    
    def find_variables(self,out=None,existing_variables={},functions={},classes={}):
        self.variables = {}
        self.variables.update(existing_variables)
        self.variables.update(functions)
        self.variables.update(classes)
        if type(out) == type(None):
            self.header.find_variables(self.variables)
            self.lines.find_variables(self.variables)
            return self.variables
        return None
    
    def generate(self,parent,indent=""):
        if indent != "":
            indent = "   "
        self.parent = parent
        out = indent + self.header.generate(self) + "{\n"
        out += indent + self.lines.generate(self,indent+"   ") + "}\n"
        return out

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
    
    def find_variables(self,out):
        for line in self.lines:
            declaration = line.find_variables(out)
            if type(declaration) != type(None):
                out[declaration.identifier.value] = declaration
    
    def generate(self,parent,indent):
        out = ""
        for line in self.lines:
            out += indent + line.generate(self,indent) + ";\n"
        return out

class EmptyLine():
    def __init__(self):
        pass

    def is_a(self,check):
        if check == "EmptyLine":
            return True
        return False

    def show_tree(self,indent=""):
        print(indent,"EmptyLine")
    
    def generate(self,parent,indent):
        return ""
    
    def find_variables(self,out):
        return