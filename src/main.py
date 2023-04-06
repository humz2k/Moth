import lex

raw = """

int main():
    int i = 0


"""

raw = lex.remove_comments(raw)

raw = lex.convert(raw)

lexer = lex.get_lexer()

print(raw)

tokens = lexer.lex(raw)


