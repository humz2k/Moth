from .lex import *
import re

def find_classes(raw):
    return re.findall(r"class\s*([a-zA-Z_0-9]*)",raw)

def find_functions(raw):
    return re.findall(r"def\s*[a-zA-Z_0-9]*\s*([a-zA-Z_0-9]*)",raw)