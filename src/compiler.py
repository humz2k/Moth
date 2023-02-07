from lex import Lexer
from parse.ParserObject import Parser,ParserState
import python_style_indents
import aster
import parser_rules


inputtext = r"""

def void test():
    a = 10

def int main():

    def void tes2_g():
        a = 5
    a = 55 + b * c
        
"""
lexer = Lexer().get_lexer()

raw = python_style_indents.convert(inputtext)

tokens = lexer.lex(raw)

pg = Parser(aster,parser_rules)

pg.parse()

parser = pg.get_parser()
parsed = parser.parse(tokens,state = ParserState())

parsed.show_tree()
