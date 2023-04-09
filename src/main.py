import lex
import parse

raw = r"""

def int main():
    float[:,:] particles = array(2,3)
    
    particles[0,0] = 1.0
    particles[1,0] = -1.0

    free(particles)

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



