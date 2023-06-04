import mothpy
import os
import sys
import ctypes

with open("test.moth","r") as f:
    raw = f.read()

out = mothpy.compileMoth(raw,"test.moth")

with open("tmp.ll","w") as f:
    f.write(out)

os.system("llc -filetype=obj tmp.ll -o tmp.o -O3")
os.system("clang tmp.o gc_tools.o -o tmp")

tmp_lib = "tmp"
tmp = ctypes.CDLL(tmp_lib)

tmp.main()
