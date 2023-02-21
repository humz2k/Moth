
def generate(additions,filename="/Users/humzaqureshi/GitHub/Moth/src2/tokens"):
    with open(filename,"r") as f:
        raw = [i.split() for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)]
    #if len(additions["def"]) > 0:
    raw.insert(-4,["FUNCTION_NAME","|".join(additions["def"])])
    #if len(additions["typedef"]) > 0:
    raw.insert(-4,["USER_TYPE","|".join(additions["typedef"])])
    #if len(additions["import"]) > 0:
    raw.insert(-4,["IMPORT_FILE","|".join(additions["import"])])
    #if len(additions["link"]) > 0:
    raw.insert(-4,["LINK_FILE","|".join(additions["link"])])
    #if len(additions["cimport"]) > 0:
    raw.insert(-4,["CIMPORT_FILE","|".join(additions["cimport"])])
    #if len(additions["class"]) > 0:
    raw.insert(-4,["CLASS_NAME","|".join(additions["class"])])
    return raw
