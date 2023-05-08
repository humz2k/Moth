import codegen
import re

with open("test.moth","r") as f:
    raw = f.read()

raw = codegen.remove_comments(raw)
raw = codegen.convert(raw)

class_names = codegen.find_classes(raw)
function_names = codegen.find_functions(raw)
lexer = codegen.get_lexer(class_names = class_names, function_names=function_names)

tokens = lexer.lex(raw)

parser = codegen.templates.get_parser("tokens.txt")
state = codegen.templates.ParserState()

parser.parse(tokens,state)

print(state.eval())