import lex
import parse

raw = r"""

def int main():
    int[:,:] k = array(2,3)
    k[1,0] = 1
    k[0,0] = 2
    print(k[1,0],"\n")
    print(k[0,0],"\n")

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



