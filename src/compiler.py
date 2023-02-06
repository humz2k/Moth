from lex import Lexer
from parse import Parser,ParserState
import python_style_indents


inputtext = r"""

def int main():

    not a and !(b);
        
"""
lexer = Lexer().get_lexer()

raw = python_style_indents.convert(inputtext)

tokens = lexer.lex(raw)

for token in tokens:
    print(token)
