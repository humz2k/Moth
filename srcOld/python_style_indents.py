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