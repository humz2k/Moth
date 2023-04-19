

def resolve(raw,moth_lib_dir,imported=[]):
    split = raw.splitlines()
    headers = ""
    imports = [i.strip().split()[1] + ".moth" for i in split if i.strip().startswith("include") and not i.strip().split()[1].startswith("<")]
    other_imports = [moth_lib_dir + i.strip().split()[1][1:-1] + ".moth" for i in split if i.strip().startswith("include") and i.strip().split()[1].startswith("<") and i.strip().split()[1].endswith(">")]
    imports = imports + other_imports
    cincludes = ["#include " + i.strip().split()[1] for i in split if i.strip().startswith("cinclude")]
    no_imports = [i for i in split if not (i.strip().startswith("include") or i.strip().startswith("cinclude"))]
    raw = "\n".join(no_imports)
    additions = []
    for fname in imports:
        if not fname in imported:
            with open(fname,"r") as f:
                tmp,tmp_headers,tmp_imported = resolve(f.read(),moth_lib_dir,imported[:])
                imported += tmp_imported
                additions.append(tmp + "\n")
                headers += tmp_headers
                imported.append(fname)
    headers += "\n".join(cincludes) + "\n"
    raw = "".join(additions) + raw
    return raw,headers,imported