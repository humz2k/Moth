import re

def find_types(raw):
    return [r"\b" + i + r"\b" for i in re.findall(r"(?<=\bclass\s)(\w+)(?=\s*\(type\))",raw)]

def find_static(raw):
    return [r"\b" + i + r"\b" for i in re.findall(r"(?<=\bclass\s)(\w+)(?=\s*\(static\))",raw)]

def find_dtype(raw):
    return [r"\b" + i + r"\b" for i in re.findall(r"(?<=\bdtype\s)(\w+)",raw)]