import python_style_indents
import preprocessor
import generate_tokens
import lex
import parse

inputtext = r"""
int a;
"""

raw = python_style_indents.remove_comments(inputtext)

raw = python_style_indents.convert(raw)

#raw = preprocessor.preprocess.remove_curls(raw)

raw = preprocessor.rename_class_functions(raw)

pre = preprocessor.find(raw)

token_list = generate_tokens.generate(pre)

lexerObject = lex.Lexer()
lexerObject.add_tokens(token_list)
lexer = lexerObject.get_lexer()
tokens = lexer.lex(raw)

#for i in tokens:
#    print(i)

pg = parse.Parser(token_list)
pg.parse()
parser = pg.get_parser()

top = parser.parse(tokens)

print(top)

