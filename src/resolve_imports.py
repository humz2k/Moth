

def resolve(raw):
    split = raw.splitlines()
    headers = ""
    imports = [i.strip().split()[1] + ".moth" for i in split if i.strip().startswith("include")]
    cincludes = ["#include " + i.strip().split()[1] for i in split if i.strip().startswith("cinclude")]
    no_imports = [i for i in split if not (i.strip().startswith("include") or i.strip().startswith("cinclude"))]
    raw = "\n".join(no_imports)
    additions = []
    for fname in imports:
        with open(fname,"r") as f:
            tmp,tmp_headers = resolve(f.read())
            additions.append(tmp + "\n")
            headers += tmp_headers
    headers += "\n".join(cincludes) + "\n"
    raw = "".join(additions) + raw
    return raw,headers