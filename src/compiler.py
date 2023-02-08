from lex import Lexer
from parse.ParserObject import Parser,ParserState
import python_style_indents
import parser_rules

import aster

exit()

inputtext = r"""

def int main(int a, int b):
    float c = float(1+1+b) + 5.0*9.0
        
"""

lexer = Lexer().get_lexer()
raw = python_style_indents.remove_comments(inputtext)

raw = python_style_indents.convert(raw)

tokens = lexer.lex(raw)

pg = Parser(aster,parser_rules)

pg.parse()

parser = pg.get_parser()

parsed = parser.parse(tokens,state = ParserState())

#parsed.show_tree()

print(parsed.generate())
