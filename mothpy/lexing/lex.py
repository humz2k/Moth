from rply import LexerGenerator
import re
import os

def remove_comments(raw):
    multilines = re.findall(r"\#\#\#.*?\#\#\#",raw,re.DOTALL)
    for i in multilines:
        raw = raw.replace(i,(i.count("\n")) * "\n")
    comments = re.findall(r"\#.*",raw)
    for i in comments:
        raw = raw.replace(i,"")
    return raw

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

def find_functions(raw):
    out = re.findall(r"def ([a-zA-Z_0-9\.\[\]\:]+) (\w+)",raw)
    return [i[1] for i in out if i[0] != 'cast' and i[1] != 'operator']

def find_objects(raw):
    return re.findall(r"object (\w+)",raw)

def find_structs(raw):
    return re.findall(r"struct (\w+)",raw)

def find_namespaces(raw):
    return re.findall(r"module (\w+)",raw)

def get_lexer(filename = "tokens.txt", object_names = [], struct_names = [], function_names = [], namespaces = []):
    
    lexer = LexerGenerator()
    with open(filename,"r") as f:
        raw = [i.split() for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)]

    for i in object_names:
        lexer.add("OBJECT_NAME",r"\b"+i+r"\b")

    for i in struct_names:
        lexer.add("STRUCT_NAME",r"\b"+i+r"\b")

    for i in namespaces:
        lexer.add("NAMESPACE",r"\b"+i+r"\b")

    for i in function_names:
        lexer.add("FUNCTION_NAME",r"\b"+i+r"\b")

    for i in raw:
        if i[0] == "IGNORE":
            lexer.ignore(i[1])
        else:
            lexer.add(i[0],i[1])

    return lexer.build()

def preprocess(fname : str, path, function_names = [],object_names = [],struct_names = [],namespaces = []):
    with open(fname,"r") as f:
        raw = f.read()
    raw = remove_comments(raw)
    raw = convert(raw)
    includes = re.findall(r"include\b.*\;",raw)
    for i in includes:
        raw = raw.replace(i,"")
    includes = [i.split("include ")[1][:-1] for i in includes]
    tokens = []
    stdlib_path = os.path.abspath(os.path.join(os.path.dirname( __file__ ), '..','..','stdlib'))
    for i in includes:
        name = i
        if (i.startswith("<") and i.endswith(">")):
            name = stdlib_path + "/" + i[1:-1]
        this_tokens,this_function_names,this_object_names,this_struct_names,this_namespaces = preprocess(name,path)
        tokens += this_tokens
        function_names += this_function_names
        object_names += this_object_names
        struct_names += this_struct_names
        namespaces += this_namespaces
    function_names += find_functions(raw)
    object_names += find_objects(raw)
    struct_names += find_structs(raw)
    namespaces += find_namespaces(raw)

    lexer = get_lexer(filename = path, function_names = function_names, object_names = object_names, struct_names = struct_names, namespaces = namespaces)

    tokens += [i for i in lexer.lex(raw)]
    return tokens,function_names,object_names,struct_names,namespaces

def lex(fname : str,path : str):
    tokens,_,_,_,_ = preprocess(fname,path)
    return tokens