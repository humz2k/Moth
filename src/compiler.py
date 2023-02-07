from lex import Lexer
from parse import Parser,ParserState
import python_style_indents


inputtext = r"""

def void test():
    a = 10

def int main():

    a = 5 + b * c
        
"""
lexer = Lexer().get_lexer()

raw = python_style_indents.convert(inputtext)

tokens = lexer.lex(raw)

pg = Parser()
pg.parse()
parser = pg.get_parser()
parsed = parser.parse(tokens,state = ParserState())

parsed.show_tree()
