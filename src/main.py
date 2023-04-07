import lex
import parse

raw = r"""

def int main():
    int i
    i[0] = 5
    free(i)

"""

raw = lex.remove_comments(raw)

raw = lex.convert(raw)

lexer = lex.get_lexer()

tokens = lexer.lex(raw)

parser = parse.get_parser()

base = parser.parse(tokens)

out = base.eval()
print(out)

with open("test.c","w") as f:
    f.write(out)


