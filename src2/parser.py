
class Parser():

    def __init__(self):
        with open("/Users/humzaqureshi/GitHub/Moth/src2/tokens","r") as f:
            tokens = [i.split()[0] for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)]
        if "IGNORE" in tokens:
            tokens.remove("IGNORE")
        print(tokens)
