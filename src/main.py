import lex
import parse
import sys
import os
import resolve_imports

def parse_flags(args):
    i = 0
    to_compile = ""
    output_file = "a.out"
    cc = "gcc"
    keep_temp = False
    flags = ["-o","-keep_temp","-cc","-I","-L","-l"]
    includes = []
    links = []
    while i < len(args):
        currentFlag = ""
        val = args[i]
        for flag in flags:
            if args[i].startswith(flag):
                currentFlag = flag
        if currentFlag in ["","-keep_temp"]:
            i += 1
            if currentFlag == "":
                to_compile = val
            elif currentFlag == "-keep_temp":
                keep_temp = True
        else:
            val = args[i][len(currentFlag):].strip()
            if val == "":
                val = args[i+1]
                i += 2
            else:
                i += 1
            if currentFlag == "-o":
                output_file = val
            if currentFlag == "-cc":
                cc = val
            if currentFlag == "-I":
                includes.append("-I" + val)
            if currentFlag == "-L":
                links.append("-L" + val)
            if currentFlag == "-l":
                links.append("-l" + val)
    return {"filename": to_compile,"output":output_file,"keep_temp":keep_temp,"cc":cc,"includes":includes,"links":links}

if __name__ == "__main__":

    args = sys.argv[1:]

    flags = parse_flags(args)

    f = flags["filename"]

    tmp_file = "MOTH" + f.split(".")[0] + "_tmp.c"

    out_file = flags["output"]

    with open(f,"r") as f:
        raw = f.read()

    raw,headers,tmp = resolve_imports.resolve(raw)

    raw = lex.remove_comments(raw)

    raw = lex.convert(raw)

    lexer = lex.get_lexer()

    tokens = lexer.lex(raw)

    parser = parse.get_parser()

    base = parser.parse(tokens)

    out = headers + base.eval()

    with open(tmp_file,"w") as f:
        f.write(out)
    os.system(flags["cc"] + ' ' + tmp_file + ' -o ' + out_file + " " + " ".join(flags["includes"]) + " " + " ".join(flags["links"]))

    if not flags["keep_temp"]:
        os.remove(tmp_file)




