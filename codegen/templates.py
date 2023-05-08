from rply import ParserGenerator
from rply.token import Token
import sys

class PreproccessorToken:
    def make_template(self,templates):
        pass

class Misc(PreproccessorToken):
    def __init__(self,token):
        self.token = token
        self.name = token.name
        self.value = token.value

    def replace(self,map_to):
        if self.value in map_to:
            return Misc(Token("",map_to[self.value]))
        return self
    
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
        self.instantiated = False

    def make_template(self,templates):
        n_args = len(self.args)
        name = self.name.value + "_" + str(n_args)
        if name in templates:
            template = templates[name]
        else:
            raise Exception("Template does not exist")
        template.instantiate(self.args,templates)
        self.instantiated = True

    def replace(self,map_to):
        args = []
        for i in self.args:
            if i.eval() in map_to:
                args.append(Misc(Token("",map_to[i.eval()])))
            else:
                args.append(i)
        self.args = args
        return self

    def eval(self):
        return "_" + self.name.value + "_" + "_".join([i.eval() for i in self.args]) + "_"  
    
class TemplateDef(PreproccessorToken):
    def __init__(self,name,args,inherits,scope):
        self.name = name
        self.args = args
        self.inherits = inherits
        self.scope = scope
        self.instantiations = {}

    def instantiate(self,args,templates):
        name = "_".join([i.eval() for i in args])
        if name in self.instantiations:
            return
        map_to = {self.args[i].eval().strip(): args[i].eval().strip() for i in range(len(args))}
        #out = []
        #for token in self.scope.tokens:
        #    out.append(token.replace(map_to))
        #out = " ".join([i.eval() for i in out])
        self.scope = self.scope.replace(map_to)
        self.scope.make_template(templates)
        out = self.scope.eval()
        header = "class " + "_" + self.name.value + "_" + "_".join([i.eval() for i in args]) + "_"
        if type(self.inherits) != type(None):
            header += " (" + self.inherits.value + ")"
        header += ":"
        out = header + out + ""
        self.instantiations[name] = out

    def make_template(self,templates):
        pass
    
    def get(self):
        out = ""
        for i in self.instantiations.values():
            out += i + "\n"
        return out

    def eval(self):
        return self.get()
        #out = ""
        #for i in self.instantiations.values():
        #    out += i + "\n"
        #return out
        

class Scope(PreproccessorToken):
    def __init__(self,start):
        self.tokens = [start]
    
    def add(self,item):
        self.tokens.append(item)
    
    def eval(self):
        return " ".join([i.eval() for i in self.tokens])

    def make_template(self,templates):
        for i in self.tokens:
            i.make_template(templates)

    def replace(self,map_to):
        tokens = []
        for token in self.tokens:
            tokens.append(token.replace(map_to))
        self.tokens = tokens
        return self
    
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
        for i in self.tokens:
            i.make_template(self.templates)
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
    @pg.production('program : program template_def')
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
    
    @pg.production('template_def : CLASS template_instance_open CLOSE_SQUARE COLON scope')
    @pg.production('template_def : CLASS template_instance_open CLOSE_SQUARE OPEN_PAREN IDENTIFIER CLOSE_PAREN COLON scope')
    def open_template(state,p):
        state.log('template_def_open : CLASS template_instance COLON OPEN_CURL')
        if len(p) == 5:
            definition = TemplateDef(p[1][0],p[1][1:],None,p[4])
        else:
            definition = TemplateDef(p[1][0],p[1][1:],p[4],p[7])
        state.templates[p[1][0].value + "_" + str(len(p[1][1:]))] = definition
        #state.append(definition)
        return definition
    
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
        #n_args = len(p[0][1:])
        #name = p[0][0].value + "_" + str(n_args)
        #if name in state.templates:
        #    template = state.templates[name]
        #else:
        #    raise Exception("Template does not exist")
        #state.templates[name].instantiate(p[0][1:])
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
    @pg.production('scope_open : scope_open template_instance')
    @pg.production('scope_open : scope_open array_t')
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

