def remove_curls(text):
    out = ""
    in_curl = 0
    in_bracket = 0
    for i in text:
        if i == "(":
            in_bracket += 1
        elif i == ")":
            in_bracket -= 1
        elif i == "{":
            in_curl += 1
        elif i == "}":
            in_curl -= 1
        else:
            if in_curl == 0 and in_bracket == 0:
                out += i
    return out
