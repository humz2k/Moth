import preprocess
import re

with open("test.moth","r") as f:
    raw = f.read()

raw = preprocess.remove_comments(raw)
raw = preprocess.convert(raw)

#print(raw)

class_names = preprocess.find_classes(raw)
function_names = preprocess.find_functions(raw)
raw,templates = preprocess.find_templates(raw,class_names)

#tokenize class names and other text

print(raw)