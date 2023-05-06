import re

class template:
    def __init__(self,name,inputs,inherits,code):
        self.name = name
        self.inputs = inputs
        self.inherits = inherits
        self.code = code

def find_classes(raw):
    return re.findall(r"class\s*([a-zA-Z_0-9]*)",raw)

def find_functions(raw):
    return re.findall(r"def\s*[a-zA-Z_0-9\[\]]*\s*([a-zA-Z_0-9]*)",raw)

def find_templates(raw,class_names):
    template_finder = r"(class\s*("+r"|".join(["" + i + "" for i in class_names])+r")\s*(\[.*\])\s*(\(.*\))?\s*\:\s*\{)"
    templates = {}

    deletes = []

    matches = re.finditer(template_finder,raw)
    for i in matches:
        open_brackets = 1
        start = i.end()
        end = start
        while open_brackets > 0 and end < len(raw):
            if raw[end] == "{":
                open_brackets += 1
            elif raw[end] == "}":
                open_brackets -= 1
            end += 1

        raw_code = i.group(0) + raw[start:end]
        code = raw[start:end-1].strip()
        header = i.group(0).strip()[:-1]
        name = i.group(2)
        inputs = i.group(3)[1:-1]
        inherits = i.group(4)
        templates[name] = template(name,inputs,inherits,code)
        deletes.append(raw_code)
    for i in deletes:
        raw = raw.replace(i,"")
    return raw,templates