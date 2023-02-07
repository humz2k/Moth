def convert(raw):
    lines = raw.splitlines()

    indent_level = 0
    out = ""
    for line in lines:
        if len(line.strip()) != 0:
            indents = line.count("    ")
            if indents > indent_level:
                out += ("{\n" * (indents - indent_level))
                indent_level = indents
                out += line.strip()
                if out[-1] != ":":
                    out += ";\n"
            elif indents < indent_level:
                out += ("}\n" * (indent_level - indents))
                indent_level = indents
                out += line.strip() 
                if out[-1] != ":":
                    out += ";\n"
            else:
                out += line.strip()
                if out[-1] != ":":
                    out += ";\n"
    out += ("}\n" * (indent_level))

    return out