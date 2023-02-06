def convert(raw):
    lines = raw.splitlines()

    indent_level = 0
    out = ""
    for line in lines:
        print("LINE",line)
        if len(line.strip()) != 0:
            indents = line.count("    ")
            if indents > indent_level:
                out += ("{\n" * (indents - indent_level))
                indent_level = indents
                out += line.strip() + ";\n"
            elif indents < indent_level:
                out += ("}\n" * (indent_level - indents))
                indent_level = indents
                out += line.strip() + ";\n"
            elif line.strip()[-1] == ":":
                print("NO",line)
                out += line.strip()
            else:
                out += line.strip() + ";\n"
    out += ("}\n" * (indent_level))

    return out