from rply import ParserGenerator
from rply.token import Token
import sys

class PreproccessorToken:
    pass

class Misc(PreproccessorToken):
    def __init__(self,token):
        self.token = token
        self.name = token.name
        self.value = token.value
    
    def eval(self):
        return self.value
    
class ArrayT(PreproccessorToken):
    def __init__(self,typ,dims):
        self.type = typ
        self.dims = dims
    
    def eval(self):
        return "_NDArray_" + self.type.value + "_" + str(self.dims) + "_"

class TemplateInstance(PreproccessorToken):
    def __init__(self,name,args):
        self.name = name
        self.args = args
        self.value = self.eval()

    def eval(self):
        return "_" + self.name.value + "_" + "_".join([i.eval() for i in self.args]) + "_"    

class Scope(PreproccessorToken):
    def __init__(self,start):
        self.tokens = [start]
    
    def add(self,item):
        self.tokens.append(item)
    
    def eval(self):
        return " ".join([i.eval() for i in self.tokens])
    
class ParserState(object):
    def __init__(self):
        self.tokens = []
        self.templates = {}

    def log(self,text):
        pass
        print(text)

    def append(self,token : PreproccessorToken):
        self.tokens.append(token)

    def eval(self):
        return " ".join([i.eval() for i in self.tokens])

def get_parser(filename="tokens.txt"):
    with open(filename,"r") as f:
        tokens = [i.split()[0] for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)] + ["CLASS_NAME","FUNCTION_NAME"]
    if "IGNORE" in tokens:
        tokens.remove("IGNORE")
    pg = ParserGenerator(tokens, precedence=[
        ("nonassoc",["misc"]),
        ("nonassoc",["template_instance"]),
    ])

    @pg.production('program : template_def')
    @pg.production('program : template_instance')
    @pg.production('program : array_t')
    @pg.production('program : misc')
    def program(state,p):
        state.log('program : template_def|template_instance|array_t|misc')
        state.append(p[0])
        return p[0]

    #@pg.production('program : program template_def')
    #def pass_template_def(state,p):
    #    state.log('program : program template_def')

    #@pg.production('program : program template_instance')
    @pg.production('program : program array_t')
    @pg.production('program : program template_instance')
    @pg.production('program : program misc')
    def add_program(state,p):
        state.log('program : program template_def|template_instance|array_t|misc')
        state.append(p[1])
        return p[0]
    
    @pg.production('array_t : TYPE_NAME OPEN_SQUARE CLOSE_SQUARE')
    def zero_array(state,p):
        state.log('array_t : TYPE_NAME OPEN_SQUARE CLOSE_SQUARE')
        return ArrayT(p[0],0)
    
    @pg.production('array_t_open : TYPE_NAME OPEN_SQUARE COLON')
    def init_array(state,p):
        state.log('array_t_open : TYPE_NAME OPEN_SQUARE COLON')
        return ArrayT(p[0],1)
    
    @pg.production('array_t_open : array_t_open COMMA COLON')
    def cont_array(state,p):
        state.log('array_t_open : array_t_open COMMA COLON')
        p[0].dims += 1
        return p[0]
    
    @pg.production('array_t : array_t_open CLOSE_SQUARE')
    def cont_array(state,p):
        state.log('array_t : array_t_open CLOSE_SQUARE')
        return p[0]
    
    @pg.production('template_def : CLASS template_instance COLON scope')
    @pg.production('template_def : CLASS template_instance OPEN_PAREN IDENTIFIER CLOSE_PAREN COLON scope')
    def open_template(state,p):
        state.log('template_def_open : CLASS template_instance COLON OPEN_CURL')
        return Misc(Token("",""))
    
    @pg.production('template_instance_open : CLASS_NAME OPEN_SQUARE IDENTIFIER')
    @pg.production('template_instance_open : CLASS_NAME OPEN_SQUARE NUMBER')
    @pg.production('template_instance_open : CLASS_NAME OPEN_SQUARE TYPE_NAME')
    @pg.production('template_instance_open : CLASS_NAME OPEN_SQUARE CLASS_NAME')
    @pg.production('template_instance_open : CLASS_NAME OPEN_SQUARE template_instance')
    def template_inst_open(state,p):
        state.log('template_instance_open : CLASS_NAME OPEN_SQUARE misc')
        return [p[0],Misc(p[2])]

    @pg.production('template_instance_open : template_instance_open COMMA IDENTIFIER')
    @pg.production('template_instance_open : template_instance_open COMMA NUMBER')
    @pg.production('template_instance_open : template_instance_open COMMA TYPE_NAME')
    @pg.production('template_instance_open : template_instance_open COMMA CLASS_NAME')
    @pg.production('template_instance_open : template_instance_open COMMA template_instance')
    def template_inst_cont(state,p):
        state.log('template_instance_open : template_instance_open COMMA misc')
        return p[0] + [Misc(p[2])]
    
    @pg.production('template_instance : template_instance_open CLOSE_SQUARE')
    def template_inst(state,p):
        state.log('template_instance : template_instance_open CLOSE_SQUARE')
        return TemplateInstance(p[0][0],p[0][1:])

    @pg.production('scope_open : OPEN_CURL')
    def scope_open(state,p):
        state.log('scope_open : OPEN_CURL')
        return Scope(Misc(p[0]))
    
    @pg.production('scope : scope_open CLOSE_CURL')
    def scope_close(state,p):
        state.log('scope : scope_open CLOSE_CURL')
        p[0].add(Misc(p[1]))
        return p[0]
    
    @pg.production('scope_open : scope_open misc')
    @pg.production('scope_open : scope_open scope')
    def scope_cont(state,p):
        state.log('scope_open : scope_open misc')
        p[0].add(p[1])
        return p[0]

    @pg.production('misc : CHAR')
    @pg.production('misc : STRING')
    @pg.production('misc : PLUS_PLUS')
    @pg.production('misc : MINUS_MINUS')
    @pg.production('misc : PLUS_EQUAL')
    @pg.production('misc : MINUS_EQUAL')
    @pg.production('misc : STARSTAR_EQUAL')
    @pg.production('misc : STAR_EQUAL')
    @pg.production('misc : SLASH_EQUAL')
    @pg.production('misc : PERCENT_EQUAL')
    @pg.production('misc : PLUS')
    @pg.production('misc : MINUS')
    @pg.production('misc : STARSTAR')
    @pg.production('misc : STAR')
    @pg.production('misc : SLASH')
    @pg.production('misc : PERCENT')
    @pg.production('misc : BACKSLASH')
    @pg.production('misc : AT')
    @pg.production('misc : EQUAL')
    @pg.production('misc : NOT_EQUAL')
    @pg.production('misc : GREATER')
    @pg.production('misc : LESS')
    @pg.production('misc : GREATER_OR_EQUAL')
    @pg.production('misc : LESS_OR_EQUAL')
    @pg.production('misc : AND')
    @pg.production('misc : OR')
    @pg.production('misc : NOT')
    @pg.production('misc : AMP')
    @pg.production('misc : VERT')
    @pg.production('misc : ASSIGN')
    @pg.production('misc : COMMA')
    @pg.production('misc : SEMI_COLON')
    @pg.production('misc : COLON')
    @pg.production('misc : OPEN_CURL')
    @pg.production('misc : CLOSE_CURL')
    @pg.production('misc : OPEN_PAREN')
    @pg.production('misc : CLOSE_PAREN')
    @pg.production('misc : OPEN_SQUARE')
    @pg.production('misc : CLOSE_SQUARE')
    @pg.production('misc : TYPE_NAME')
    @pg.production('misc : TYPE_QUERY')
    @pg.production('misc : DTYPE')
    @pg.production('misc : KERNEL')
    @pg.production('misc : CLASS')
    @pg.production('misc : DEF')
    @pg.production('misc : IF')
    @pg.production('misc : ELSE')
    @pg.production('misc : ELIF')
    @pg.production('misc : FOR')
    @pg.production('misc : IN')
    @pg.production('misc : WHILE')
    @pg.production('misc : BREAK')
    @pg.production('misc : RETURN')
    @pg.production('misc : PRINT')
    @pg.production('misc : RANGE')
    @pg.production('misc : PASS')
    @pg.production('misc : TRUE')
    @pg.production('misc : FALSE')
    @pg.production('misc : NEW')
    @pg.production('misc : NULL')
    @pg.production('misc : NUMBER')
    @pg.production('misc : IDENTIFIER')
    @pg.production('misc : PERIOD')
    @pg.production('misc : FUNCTION_NAME')
    @pg.production('misc : CLASS_NAME')
    def pass_misc(state,p):
        state.log('misc : * = ' + p[0].name)
        return Misc(p[0])

    @pg.error
    def error_handler(state,token):
        print("ERROR AT",token)
        exit()

    out = pg.build()
    print(out.lr_table.sr_conflicts)
    return out

