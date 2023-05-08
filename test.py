import codegen
import re

with open("test.moth","r") as f:
    raw = f.read()

raw = codegen.remove_comments(raw)
raw = codegen.convert(raw)

raw = codegen.replace_aliases(raw)

class_names = codegen.find_classes(raw)
function_names = codegen.find_functions(raw)
function_template_names = codegen.find_t_functions(raw)

lexer = codegen.get_lexer(class_names = class_names, function_names=function_names, function_template_names = function_template_names)

tokens = lexer.lex(raw)

parser = codegen.templates.get_parser("tokens.txt")
state = codegen.templates.ParserState()

parser.parse(tokens,state)

raw = state.eval()
print(raw)

tokens = lexer.lex(raw)

parser = codegen.get_parser("tokens.txt")

state = codegen.ParserState("test.moth")

parser.parse(tokens,state)
print("\n\n")

print(state.module)