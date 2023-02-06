from lex import Lexer
from parse import Parser,ParserState
import python_style_indents


inputtext = r"""

def int main():
    a
    if:
        1
    if:
        2

"""
lexer = Lexer().get_lexer()

raw = python_style_indents.convert(inputtext)
print(raw)

#tokens = lexer.lex(raw)

#for token in tokens:
#    print(token)
