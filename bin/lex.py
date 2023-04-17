from rply import LexerGenerator

def get_lexer(filename = "tokens.txt",user_types = [], statics = [], templates = [], line_offset = 0):
    
    lexer = LexerGenerator()
    with open(filename,"r") as f:
        raw = [i.split() for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)]

    for i in user_types:
        lexer.add("USER_TYPE",i)
    for i in statics:
        lexer.add("STATIC_OBJECT",i)
    for i in templates:
        lexer.add("TEMPLATE_T",i)

    for i in raw:
        if i[0] == "IGNORE":
            lexer.ignore(i[1])
        else:
            lexer.add(i[0],i[1])
    
    return lexer.build()

def remove_comments(raw):
    out = ""
    lines = raw.splitlines()
    for line in lines:
        if line.startswith("#"):
            out += "\n"
        else:
            out += line.split("#")[0] + "\n"
    return out

def convert(raw):
    lines = raw.splitlines()

    indent_level = 0
    out = ""
    for line in lines:
        if len(line.strip()) != 0:
            indents = line.count("    ")
            if indents > indent_level:
                out += ("{" * (indents - indent_level))
                indent_level = indents
                out += line
                if line.strip()[-1] != ":":
                    if line.strip()[-1] == ";":
                        pass
                    else:
                        out += ";"
            elif indents < indent_level:
                out += ("}" * (indent_level - indents))
                indent_level = indents
                out += line
                if line.strip()[-1] != ":":
                    if line.strip()[-1] == ";":
                        pass
                    else:
                        out += ";"
            else:
                out += line
                if line.strip()[-1] != ":":
                    if line.strip()[-1] == ";":
                        pass
                    else:
                        out += ";"
        else:
            pass
        out += "\n"
    out += ("}" * (indent_level) + "\n")

    return out