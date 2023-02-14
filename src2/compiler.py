import python_style_indents
import preprocessor

inputtext = r"""

import math
link test
cimport math.h

class a():
    int j
    def void test():
        pass
    
    def asad yeet():
        pass
        
class b():
    int j
    def void yeet():
        pass
    
def int[:,:,:] main():
    int[:,:,:] a = new int[1,2,3]

def float test():
    pass

typedef yee:
    int a
        
"""

raw = python_style_indents.remove_comments(inputtext)

raw = python_style_indents.convert(raw)

#raw = preprocessor.preprocess.remove_curls(raw)

raw = preprocessor.preprocess.rename_class_functions(raw)

pre = preprocessor.preprocess.find(raw)

print(pre)