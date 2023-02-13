import python_style_indents
import preprocessor

inputtext = r"""

import math
link test
cimport math.h

class a:
    int j
    def void test():
        pass

def int[:,:,:] main():
    int[:,:,:] a = new int[1,2,3]

def float test():
    pass
        
"""

raw = python_style_indents.remove_comments(inputtext)

raw = python_style_indents.convert(raw)

raw = preprocessor.preprocess.remove_curls(raw)

print(raw)

lexer = preprocessor.lex.Lexer().get_lexer()

out = lexer.lex(raw)

print([i for i in out])