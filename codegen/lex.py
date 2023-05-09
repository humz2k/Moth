from rply import LexerGenerator

def get_lexer(filename = "tokens.txt", class_names = [], function_names = [], function_template_names = [], static_class_names = [], line_offset = 0):
    
    lexer = LexerGenerator()
    with open(filename,"r") as f:
        raw = [i.split() for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)]

    for i in class_names:
        lexer.add("CLASS_NAME",r"\b"+i+r"\b")

    for i in static_class_names:
        lexer.add("STATIC_CLASS_NAME",r"\b" + i + r"\b")

    for i in function_names:
        lexer.add("FUNCTION_NAME",r"\b"+i+r"\b")

    for i in function_template_names:
        lexer.add("FUNCTION_TEMPLATE_NAME",r"\b"+i+r"\b")

    for i in raw:
        if i[0] == "IGNORE":
            lexer.ignore(i[1])
        else:
            lexer.add(i[0],i[1])

    return lexer.build()