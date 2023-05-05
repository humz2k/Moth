import moth_containers,moth_expressions,moth_types,moth_variables
from rply.token import Token
import sys

LINEOFFSET = 0

def throwError(err,err_t,lineno):
    global LINEOFFSET
    print("\033[1;33mMothCodeGenError\033[0;0m(\033[1;31m" + err_t + "\033[0;0m) @ \033[1;32mline " + str(lineno - LINEOFFSET) + "\033[0;0m:",file=sys.stderr)
    print("   " + err,file=sys.stderr)
    exit()


class Program:
    def __init__(self):
        self.functions = {}
        self.classes = {}
    
    def add_function(self,name,moth_type,inputs):
        function = moth_containers.MothFunction(self,name,moth_type,inputs)
        if function.hash() in self.functions:
            throwError("Function " + str(name) + " already exists","FuncExists",0)
        self.functions[function.hash()] = function
        return function

    def build(self):
        out = ""
        for class_name in self.classes.keys():
            out += self.classes[class_name].build()
        for function_name in self.functions.keys():
            out += self.functions[function_name].build()
        return out

function_name = moth_variables.Identifier("main")
function_type = moth_types.MothInt()
function_inputs = moth_containers.MothFunctionInputs()

program = Program()
my_function = program.add_function(function_name,function_type,function_inputs)
my_function.add_declaration(moth_types.MothInt(),moth_variables.Identifier("test"))
my_function.add_line(moth_expressions.MothAssign(moth_variables.MothVariable(moth_types.MothInt(),moth_variables.Identifier("test")),moth_variables.MothLiteral(moth_types.MothInt(),moth_variables.IntLiteral("10"))))
my_function.add_line(moth_expressions.MothReturn())

print(program.build())


