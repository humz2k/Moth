import lex
import parse
import sys

if __name__ == "__main__":

    args = sys.argv[1:]

    f = args[0]

    with open(f,"r") as f:
        raw = f.read()

    raw = lex.remove_comments(raw)

    raw = lex.convert(raw)

    lexer = lex.get_lexer()

    tokens = lexer.lex(raw)


    parser = parse.get_parser()

    base = parser.parse(tokens)

    out = base.eval()

    with open("test.c","w") as f:
        f.write(out)



