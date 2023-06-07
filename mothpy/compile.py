from .lexing import *
from .parsing import *
import os
from llvmlite import binding


def compileMoth(fname,ll = "llc",opt = 3):
    path = os.path.dirname(os.path.abspath(__file__)) + "/tokens.txt"
    tokens = lex(fname,path)
    parsed = parse(tokens,path)
    module = parsed.eval(fname)
    out = "\n".join([i for i in str(module).split("\n") if not i.startswith("target")])
    triple = binding.get_default_triple()
    out = 'target triple = "' + triple + '"\n' + out
    tmp_ll = fname + ".tmp.ll"
    with open(tmp_ll,"w") as f:
        f.write(out)
    opt_ll = fname + ".tmp.opt.ll" #-polly-vectorizer=polly
    #os.system('opt ' + tmp_ll + " -passes='always-inline' -S -o " + opt_ll)
    os.system('opt ' + tmp_ll + " -passes='always-inline,mem2reg' -S -o " + opt_ll)
    tmp_o = fname + ".tmp.o"
    os.system(ll + " -filetype=obj " + opt_ll + " -o " + tmp_o + " -O" + str(opt))
    return tmp_o,opt_ll,tmp_ll

def link(fnames,out,is_shared,c,cc="clang",gc_tools=None,c_tools = None,file_tools = None):
    if type(gc_tools) == type(None):
        gc_tools = os.path.dirname(os.path.abspath(__file__)) + "/gc_tools.o"
    if type(c_tools) == type(None):
        c_tools = os.path.dirname(os.path.abspath(__file__)) + "/c_tools.o"
    if type(file_tools) == type(None):
        file_tools = os.path.dirname(os.path.abspath(__file__)) + "/file_tools.o"
    gc_a = os.path.abspath(os.path.join(os.path.dirname( __file__ ), '..','bdwgc','libgc.a'))
    fnames += [gc_tools,c_tools,gc_a,file_tools]
    files = " ".join(fnames)
    shared = ""
    if is_shared:
        shared = " -shared"
    c = ""
    if c:
        c + " -c"
    #print(cc + " " + files + " -o " + out + shared)
    os.system(cc + " " + files + " -o " + out + shared + c)
