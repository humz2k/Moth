class MothFunctionInputs:
    def __init__(self):
        self.input_types = []
        self.input_names = []
    
    def add_input(self,input_type,input_name):
        self.input_types.append(input_type)
        self.input_names.append(input_name)

    def hash(self):
        return ",".join([i.get_c() for i in self.input_types])
    
    def get_c(self):
        return ",".join([i.get_c() + " " + j.get_c() for i,j in zip(self.input_types,self.input_names)])

class MothFunction:
    def __init__(self,parent,name,moth_type,inputs):
        self.parent = parent
        self.moth_type = moth_type
        self.inputs = inputs
        self.lines = []
        self.variables = {}
        self.name = name

    def add_line(self,line):
        self.lines.append(line)
    
    def add_declaration(self,moth_type,identifier):
        self.variables[identifier] = moth_type

    def hash(self):
        return self.name.hash() + self.inputs.hash()
    
    def build(self):
        header = ""
        header += self.moth_type.get_c() + " " + self.name.get_c() + "(" + self.inputs.get_c() + ")" + "{\n"
        declarations = ""
        for var_name in self.variables.keys():
            declarations += self.variables[var_name].get_c() + " " + var_name.get_c() + ";\n"
        out = ""
        for line in self.lines:
            out += line.build() + "\n"
        return header + declarations + out + "}"

class MothIf:
    def __init__(self,parent,expression):
        self.parent = parent
        self.expression = expression
        self.lines = []
        self.variables = {}
        self.otherwise = []

    def add_line(self,line):
        self.lines.append(line)
    
    def add_otherwise(self,otherwise):
        self.otherwise.append(otherwise)

    def add_declaration(self,moth_type,identifier):
        self.variables[identifier] = moth_type

    def build(self):
        header = ""
        header += "if (" + self.expression.get_c() + "){\n"
        declarations = ""
        for var_name in self.variables.keys():
            declarations += self.variables[var_name].get_c() + " " + var_name.get_c() + ";\n"
        out = ""
        for line in self.lines:
            out += line.build() + "\n"
        out = header + declarations + out + "}"
        for otherwise in self.otherwise:
            out += "else " + otherwise.build() + "\n"
        return out

class MothElse:
    def __init__(self,parent):
        self.lines = []
        self.variables = {}

    def add_line(self,line):
        self.lines.append(line)

    def add_declaration(self,moth_type,identifier):
        self.variables[identifier] = moth_type

    def build(self):
        header = ""
        header += "{\n"
        declarations = ""
        for var_name in self.variables.keys():
            declarations += self.variables[var_name].get_c() + " " + var_name.get_c() + ";\n"
        out = ""
        for line in self.lines:
            out += line.build() + "\n"
        return header + declarations + out + "}"

class MothClass:
    def __init__(self,name):
        self.name = name
        self.functions = []
        self.variables = {}
    
    def add_function(self,function):
        self.functions.append(function)
    
    def add_declaration(self,moth_type,identifier):
        self.variables[identifier] = moth_type
