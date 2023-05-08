from .lex import *
import re

def find_classes(raw):
    return [i.strip() for i in re.findall(r"class\s*([a-zA-Z_0-9]*)",raw) if len(i.strip()) != 0]

def find_functions(raw):
    return [i.strip() for i in re.findall(r"def\s*[a-zA-Z_0-9\[\]\:\,]*\s*([a-zA-Z_0-9]*)\s*\(",raw) if len(i.strip()) != 0]

def find_t_functions(raw):
    return [i.strip() for i in re.findall(r"def\s*[a-zA-Z_0-9\[\]\:\,]*\s*([a-zA-Z_0-9]*)\s*\[",raw) if len(i.strip()) != 0]