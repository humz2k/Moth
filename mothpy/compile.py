from .lexing import *
from .parsing import *
import os

def compileMoth(raw,module_name = "tmp"):
    path = os.path.dirname(os.path.abspath(__file__)) + "/tokens.txt"
    tokens = lex(raw,path)
    parsed = parse(tokens,path)
    module = parsed.eval(module_name)
    out = "\n".join([i for i in str(module).split("\n") if not i.startswith("target")])
    return out