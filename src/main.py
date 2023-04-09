import lex
import parse

raw = r"""

def float sqrtf(float a):
    return __c_call(sqrtf,__c_val(a))

def int main():
    float[:,:] particles = array(2,3)
    
    float test = sqrtf(2.0)

    print(test)

    free(particles)

    return 0

"""

with open("mothTest.moth","r") as f:
    raw = f.read()

print(raw)

raw = lex.remove_comments(raw)

raw = lex.convert(raw)

lexer = lex.get_lexer()

tokens = lexer.lex(raw)


parser = parse.get_parser()

base = parser.parse(tokens)

out = base.eval()
#print(out)

with open("test.c","w") as f:
    f.write(out)



