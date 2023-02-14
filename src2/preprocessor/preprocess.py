tokens = {
    "class" : ":",
    "def" : "(",
    "typedef" : ":",
    "import" : ";",
    "link" : ";",
    "cimport" : ";"
}

def rename_class_functions(text):
    global tokens
    out = ""
    indent = 0
    token = ""
    class_name = ""
    class_indent = 0
    idx = 0
    i = ""
    while idx < len(text):
        i = text[idx]
        if i == "\n" or i == " " or i == "}" or i == "{":
            token = ""
        else:
            token += i
        if i == "{":
            indent += 1
        if i == "}":
            indent -= 1
            if indent == class_indent:
                class_name = ""
        if token == "class":
            args = text[idx+1:].split(":")[0].split("(")[0]
            class_name = args.strip().split()[0]
            class_indent = indent
            token = ""
            #print(token,class_name,indent)
        if token == "def":
            out += i
            if class_name != "":
                args = text[idx+1:].split("(")[0]
                idx += len(args)
                args = args.strip().split()
                args[1] = class_name + "_" + args[1]
                new = " " + " ".join(args)
                out += new
        else:
            out += i
        idx += 1
    return out

def find(text):
    global tokens
    token = ""

    out = {
        "class":[],
        "def":[],
        "typedef":[],
        "import":[],
        "link":[],
        "cimport":[]
        }

    for idx,i in enumerate(text):
        if i == "\n" or i == " " or i == "}" or i == "{":
            token = ""
        else:
            token += i
        if token in tokens:
            args = text[idx+1:].split(tokens[token])[0]
            if token == "class":
                args = args.split("(")[0]
            out[token].append(args.strip().split()[-1])
            token = ""
    return out