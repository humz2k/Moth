from .lex import *
import re

def replace_aliases(raw):
    aliases = re.findall(r"alias\s*([a-zA-Z_0-9]*)\s*(.*)\;",raw)
    raw = re.sub(r"alias\s*([a-zA-Z_0-9]*)\s*(.*)\;",r"",raw)
    for i in aliases:
        raw = re.sub(r"\b" + i[0] + r"\b",i[1],raw)
    return raw

def find_classes(raw):
    return [i.strip() for i in re.findall(r"class\s*([a-zA-Z_0-9]*)",raw) if len(i.strip()) != 0]

def find_static_classes(raw):
    return [i.strip() for i in re.findall(r"class\s*([a-zA-Z_0-9]*)\s*\(\s*static\s*\)",raw) if len(i.strip()) != 0]

def find_functions(raw):
    return [i[1].strip() for i in re.findall(r"def\s*([a-zA-Z_0-9\[\]\:\,\*]*)\s*([a-zA-Z_0-9]*)\s*\(",raw) if len(i[1].strip()) != 0 and i[0].strip() != "cast"]

def find_t_functions(raw):
    return [i[1].strip() for i in re.findall(r"def\s*([a-zA-Z_0-9\[\]\:\,\*]*)\s*([a-zA-Z_0-9]*)\s*\[",raw) if len(i[1].strip()) != 0 and i[0].strip() != "cast"]