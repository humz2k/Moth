import re
from collections import OrderedDict

class Template:
    def __init__(self,name,sub_vars,text):
        self.name = name
        self.sub_vars = sub_vars
        self.text = text
        self.out_text = ""
        self.instances = {}
    
    def add_instance(self,inputs):
        if len(inputs) != len(self.sub_vars):
            raise Exception("Wrong number of inputs to template " + self.name)
        if inputs in self.instances:
            return self.instances[inputs]
        new_name = "_" + self.name + "_arg_" + "_arg_".join(inputs)
        new_text = ""
        new_text = re.sub(self.name + r"\s*?\[\s*?" + (r",").join(self.sub_vars) + r"\s*?\]",new_name,self.text)
        for sub,inp in zip(self.sub_vars,inputs):
            new_text = re.sub(r"\b"+sub+r"\b",inp,new_text)
        new_text = "class " + new_name + " " + new_text
        self.out_text += new_text + "\n"
        return new_name

class finder:
    def __init__(self,files):
        self.files = files
        self.raw = "\n".join(files)

    def __call__(self):
        self.templates,self.text = self._find_templates(self.raw)
        text = self._find_template_instances(self.text,self.templates)
        out = ""
        for i in self.templates.values():
            out += i.out_text + "\n"
        return out + text

    def _flatten(self,raw):
        return " ".join(raw.split("\n"))

    def _find_templates(self,raw):
        out = OrderedDict()
        templates = []
        while "@template" in raw:
            t = raw.split("@template")[1].split("@endtemplate;")[0]
            templates.append(t)
            raw = raw.replace("@template" + t + "@endtemplate;","")
            if raw.count("@template") != raw.count("@endtemplate"):
                raise Exception("Unmatched @template or @endtemplate")
        for i in templates:
            sub_vars = i.split(";")[0][1:-1].split(",")
            text = ":" + "(".join((";".join(i.split(";")[1:])).strip().split(":")[1:])
            name = (";".join(i.split(";")[1:])).strip().split(":")[0].split("(")[0].split("class")[1].strip()
            inherits = i.split(name)[1].split(text)[0]
            #text = inherits + text
            out[name] = Template(name,sub_vars,text)
        return out,raw.strip()
    
    def _find_template_instances(self,raw,templates):
        for idx,name in enumerate(list(templates.keys())[::-1]):
            raw = self._replace_template(name,templates,raw)
            other_templates = list(templates.keys())[::-1][idx+1:]
            for tname in other_templates:
                templates[tname].text = self._replace_template(name,templates,templates[tname].text)
            #inputs = re.findall(name + "\s*?\[([\w+,?]*)\]",raw)
            #instances = re.findall(name + "\s*?\[[\w+,?]*\]",raw)
            #inputs = [tuple([j.strip() for j in i.split(",")]) for i in inputs]
            #for inst,inp in zip(instances,inputs):
            #    raw = raw.replace(inst,templates[name].add_instance(inp))
        return raw
    
    def _replace_template(self,name,templates,raw):
        inputs = re.findall(name + "\s*?\[([\w+,?]*)\]",raw)
        instances = re.findall(name + "\s*?\[[\w+,?]*\]",raw)
        inputs = [tuple([j.strip() for j in i.split(",")]) for i in inputs]
        for inst,inp in zip(instances,inputs):
            raw = raw.replace(inst,templates[name].add_instance(inp))
        return raw

        