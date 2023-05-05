import re

class finder:
    def __init__(self,files):
        self.raw = "\n".join(files)
        self.class_templates = self._find_class_templates(self.raw)

    def _flatten(self,raw):
        return " ".join(raw.split("\n"))

    def _find_class_templates(self,raw):
        flattened = self._flatten(raw)
        print(flattened)
        t_names = re.findall(r"\bclass\s*[a-zA-Z_0-9]+\[(?<=\[).*?(?=\])\]",flattened)
        print([i.split("class")[1].strip() for i in t_names])