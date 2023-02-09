from lex import Lexer
from parser.ParserObject import Parser,ParserState
import python_style_indents
import aster

inputtext = r"""

def int main():
    int[:,:,:] a = new int[1,2,3]
        
"""

lexer = Lexer().get_lexer()
raw = python_style_indents.remove_comments(inputtext)

raw = python_style_indents.convert(raw)

tokens = lexer.lex(raw)

pg = Parser(aster)

pg.parse()

parser = pg.get_parser()

parsed = parser.parse(tokens,state = ParserState())

parsed.show_tree()

#print(parsed.generate())
