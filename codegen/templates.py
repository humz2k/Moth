from rply import ParserGenerator
from rply.token import Token
import sys

class PreproccessorToken:
    def make_template(self,templates):
        pass

class PointerType(PreproccessorToken):
    def __init__(self,pointee):
        self.pointee = pointee
    
    def get_arg_name(self):
        return self.pointee.eval() + "POINTER"
    
    def replace(self,map_to):
        self.pointee.replace(map_to)
        return self

    def eval(self):
        return self.pointee.eval() + "*"

class Misc(PreproccessorToken):
    def __init__(self,token):
        self.token = token
        self.name = token.name
        try:
            self.value = token.value
        except:
            self.value = token.eval()
        self.replaced = None
        self.old_value = self.value

    def replace(self,map_to):
        if self.old_value in map_to:
            self.replaced = map_to[self.old_value]
        return self

    def get_arg_name(self):
        if type(self.replaced) != type(None):
            return self.replaced.get_arg_name()
        if self.value.replace("_","").isalnum():
            return self.value
        else:
            return self.name
    
    def eval(self):
        if type(self.replaced) != type(None):
            return self.replaced.eval()
        return self.value
    
class ArrayT(PreproccessorToken):
    def __init__(self,typ,dims):
        self.type = Misc(typ)
        self.old_type = Misc(self.type)
        self.dims = dims
        #self.instantiated = False
        self.name = "ARRAY_T"
        #self.value = self.eval()

    def make_template(self,templates):
        #if self.instantiated:
        #    return
        n_args = 2
        name = "NDArray_" + str(n_args)
        if name in templates:
            template = templates[name]
        else:
            raise Exception("Did you forget to include stdlib?")
        template.instantiate([Misc(self.type),Misc(Token("NUMBER",str(self.dims)))],templates)
        #self.instantiated = True

    def replace(self,map_to):
        if self.old_type.eval() in map_to:
            self.type = map_to[self.old_type.eval()]
        return self

    def get_arg_name(self):
        return self.eval()
    
    def eval(self):
        #if self.dims == 1:
        #    print("FUCK")
        #    print(self)
        #    exit()
        return "_NDArray_" + self.type.eval() + "_" + str(self.dims) + "_"

class TemplateInstance(PreproccessorToken):
    def __init__(self,name,args):
        self.name = name
        self.args = args
        self.old_args = self.args
        self.value = self.eval()
        self.instantiated = False

    def get_arg_name(self):
        return self.eval()

    def make_template(self,templates):
        #if self.instantiated:
        #    return
        n_args = len(self.args)
        name = self.name.value + "_" + str(n_args)
        if name in templates:
            template = templates[name]
        else:
            raise Exception("Template does not exist")
        template.instantiate(self.args,templates)
        #self.instantiated = True

    def replace(self,map_to):
        args = []
        for i in self.old_args:
            if i.eval() in map_to:
                args.append(Misc(map_to[i.eval()]))
            else:
                args.append(i)
        self.args = args
        return self

    def eval(self):
        return "_" + self.name.value + "_" + "_".join([i.get_arg_name() for i in self.args]) + "_"  
    
class FunctionTemplateInstance(PreproccessorToken):
    def __init__(self,name,args):
        self.name = name
        self.args = args
        self.old_args = self.args
        self.value = self.eval()

    def get_arg_name(self):
        return self.eval()

    def make_template(self,templates):
        #if self.instantiated:
        #    return
        n_args = len(self.args)
        name = self.name.value + "_" + str(n_args)
        if name in templates:
            template = templates[name]
        else:
            raise Exception("Template does not exist")
        template.instantiate(self.args,templates)
        #self.instantiated = True

    def replace(self,map_to):
        args = []
        for i in self.old_args:
            if i.eval() in map_to:
                args.append(Misc(map_to[i.eval()]))
            else:
                args.append(i)
        self.args = args
        return self

    def eval(self):
        return "_" + self.name.value + "_" + "_".join([i.get_arg_name() for i in self.args]) + "_"  

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
       
        self.instantiations[name] = None
        map_to = {self.args[i].eval().strip(): args[i] for i in range(len(args))}
        self.scope = self.scope.replace(map_to)
        self.scope.make_template(templates)
        out = self.scope.eval()
        
        arg_names = []
        for i in args:
            arg_names.append(i.get_arg_name())
        header = "class " + "_" + self.name.value + "_" + "_".join(arg_names) + "_"
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
        
class FuncTemplateDef(PreproccessorToken):
    def __init__(self,name,args,return_type,scope,func_args = None):
        self.name = name
        self.args = args
        self.return_type = return_type
        self.scope = scope
        self.instantiations = {}
        self.func_args = func_args

    def instantiate(self,args,templates):
        name = "_".join([i.eval() for i in args])
        if name in self.instantiations:
            return
       
        self.instantiations[name] = None
        map_to = {self.args[i].eval().strip(): args[i] for i in range(len(args))}
        self.scope = self.scope.replace(map_to)
        self.scope.make_template(templates)
        self.return_type = self.return_type.replace(map_to)
        self.return_type.make_template(templates)
        out = self.scope.eval()
        
        arg_names = []
        for i in args:
            arg_names.append(i.get_arg_name())
        header = "def " + self.return_type.eval() + " _" + self.name.value + "_" + "_".join(arg_names) + "_"
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
        self.func_templates = {}

    def log(self,text):
        pass
        #print(text)

    def append(self,token : PreproccessorToken):
        self.tokens.append(token)

    def eval(self):
        for i in self.tokens:
            i.make_template(self.templates)
        return " ".join([i.eval() for i in self.tokens])

def get_parser(filename="tokens.txt"):
    with open(filename,"r") as f:
        tokens = [i.split()[0] for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)] + ["CLASS_NAME","FUNCTION_NAME","FUNCTION_TEMPLATE_NAME"]
    if "IGNORE" in tokens:
        tokens.remove("IGNORE")
    pg = ParserGenerator(tokens, precedence=[
        #("nonassoc",["misc"]),
        #("nonassoc",["template_instance"]),
    ])

    @pg.production('program : template_def')
    @pg.production('program : function_template_def')
    @pg.production('program : template_instance')
    @pg.production('program : function_template_instance')
    @pg.production('program : array_t')
    @pg.production('program : misc')
    def program(state,p):
        state.log('program : template_def|template_instance|array_t|misc')
        state.append(p[0])
        return p[0]

    @pg.production('program : program array_t')
    @pg.production('program : program template_instance')
    @pg.production('program : program function_template_instance')
    @pg.production('program : program template_def')
    @pg.production('program : program function_template_def')
    @pg.production('program : program misc')
    def add_program(state,p):
        state.log('program : program template_def|template_instance|array_t|misc')
        state.append(p[1])
        return p[0]
    
    @pg.production('array_t : TYPE_NAME OPEN_SQUARE CLOSE_SQUARE')
    #@pg.production('array_t : IDENTIFIER OPEN_SQUARE CLOSE_SQUARE')
    def zero_array(state,p):
        state.log('array_t : TYPE_NAME OPEN_SQUARE CLOSE_SQUARE')
        return ArrayT(p[0],0)
    
    @pg.production('array_t_open : TYPE_NAME OPEN_SQUARE COLON')
    #@pg.production('array_t_open : IDENTIFIER OPEN_SQUARE COLON')
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
    
    @pg.production('template_def : AT TEMPLATE SEMI_COLON CLASS template_instance_open CLOSE_SQUARE COLON scope')
    @pg.production('template_def : AT TEMPLATE SEMI_COLON CLASS template_instance_open CLOSE_SQUARE OPEN_PAREN IDENTIFIER CLOSE_PAREN COLON scope')
    def open_template(state,p):
        state.log('template_def_open : CLASS template_instance COLON OPEN_CURL')
        if len(p) == 8:
            definition = TemplateDef(p[4][0],p[4][1:],None,p[7])
        else:
            definition = TemplateDef(p[4][0],p[4][1:],p[7],p[10])
        state.templates[p[4][0].value + "_" + str(len(p[4][1:]))] = definition
        #state.append(definition)
        return definition
    
    @pg.production('func_temp_init : AT TEMPLATE SEMI_COLON DEF misc FUNCTION_TEMPLATE_NAME OPEN_SQUARE IDENTIFIER')
    @pg.production('func_temp_init : AT TEMPLATE SEMI_COLON DEF array_t FUNCTION_TEMPLATE_NAME OPEN_SQUARE IDENTIFIER')
    #@pg.production('func_temp_init : AT TEMPLATE SEMI_COLON DEF TYPE_NAME FUNCTION_TEMPLATE_NAME OPEN_SQUARE IDENTIFIER')
    def func_temp_init(state,p):
        state.log('func_temp_init : AT TEMPLATE SEMI_COLON DEF IDENTIFIER FUNCTION_TEMPLATE_NAME OPEN_SQUARE IDENTIFIER')
        return [p[4],p[5],Misc(p[-1])]
    
    @pg.production('func_temp_init : func_temp_init COMMA IDENTIFIER')
    def func_temp_init(state,p):
        state.log('func_temp_init : func_temp_init COMMA IDENTIFIER')
        return p[0] + [Misc(p[-1])]
    
    @pg.production('func_temp : func_temp_init CLOSE_SQUARE')
    def func_temp(state,p):
        state.log('func_temp : func_temp_init CLOSE_SQUARE')
        return p[0]
    
    @pg.production('function_template_def : func_temp OPEN_PAREN CLOSE_PAREN COLON scope')
    def open_template(state,p):
        state.log('function_template_def : func_temp OPEN_PAREN CLOSE_PAREN COLON scope')
        name = p[0][1]
        return_type = p[0][0]
        args = p[0][2:]
        definition = FuncTemplateDef(name,args,return_type,p[-1])
        state.templates[name.value + "_" + str(len(args))] = definition
        #state.append(definition)
        return definition

    @pg.production('function_template_def_open : func_temp OPEN_PAREN misc')
    def open_template(state,p):
        state.log('function_template_def_open : func_temp OPEN_PAREN misc')
        #definition = FuncTemplateDef(p[2][0],p[2][1:],p[1],p[-1])
        #state.templates[p[2][0].value + "_" + str(len(p[2][1:]))] = definition
        #state.append(definition)
        return [p[0][1],p[0][2:],p[0][0],[p[-1]]]
    
    @pg.production('function_template_def_open : function_template_def_open misc')
    def cont_template(state,p):
        state.log('function_template_def_open : function_template_def_open misc')
        p[0][-1].append(p[-1])
        return p[0]
    
    @pg.production('function_template_def : function_template_def_open CLOSE_PAREN COLON scope')
    def finish_template(state,p):
        state.log('function_template_def : function_template_def_open CLOSE_PAREN COLON scope')
        scope = p[-1]
        name,temp_args,return_t,func_args = p[0]
        definition = FuncTemplateDef(name,temp_args,return_t,scope,func_args)
        state.templates[name.value + "_" + str(len(temp_args))] = definition
        return definition
    
    @pg.production('template_instance_open : CLASS_NAME OPEN_SQUARE misc')
    @pg.production('template_instance_open : CLASS_NAME OPEN_SQUARE template_instance')
    @pg.production('template_instance_open : CLASS_NAME OPEN_SQUARE array_t')
    def template_inst_open(state,p):
        state.log('template_instance_open : CLASS_NAME OPEN_SQUARE misc')
        return [p[0],p[2]]

    @pg.production('template_instance_open : template_instance_open COMMA misc')
    @pg.production('template_instance_open : template_instance_open COMMA template_instance')
    @pg.production('template_instance_open : template_instance_open COMMA array_t')
    def template_inst_cont(state,p):
        state.log('template_instance_open : template_instance_open COMMA misc')
        return p[0] + [p[2]]
    
    @pg.production('template_instance : template_instance_open CLOSE_SQUARE')
    def template_inst(state,p):
        state.log('template_instance : template_instance_open CLOSE_SQUARE')
        return TemplateInstance(p[0][0],p[0][1:])

    @pg.production('function_template_instance_open : FUNCTION_TEMPLATE_NAME OPEN_SQUARE misc')
    @pg.production('function_template_instance_open : FUNCTION_TEMPLATE_NAME OPEN_SQUARE template_instance')
    @pg.production('function_template_instance_open : FUNCTION_TEMPLATE_NAME OPEN_SQUARE array_t')
    def func_temp_inst_open(state,p):
        state.log('function_template_instance_open : FUNCTION_NAME OPEN_SQUARE misc')
        return [p[0],p[2]]

    @pg.production('function_template_instance_open : function_template_instance_open COMMA misc')
    @pg.production('function_template_instance_open : function_template_instance_open COMMA template_instance')
    @pg.production('function_template_instance_open : function_template_instance_open COMMA array_t')
    def func_temp_inst_cont(state,p):
        state.log('function_template_instance_open : function_template_instance_open misc')
        return p[0] + [p[2]]
    
    @pg.production('function_template_instance : function_template_instance_open CLOSE_SQUARE')
    def function_template_inst(state,p):
        state.log('function_template_instance : function_template_instance_open CLOSE_SQUARE')
        return FunctionTemplateInstance(p[0][0],p[0][1:])

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
    @pg.production('scope_open : scope_open function_template_instance')
    @pg.production('scope_open : scope_open array_t')
    @pg.production('scope_open : scope_open scope')
    def scope_cont(state,p):
        state.log('scope_open : scope_open misc')
        p[0].add(p[1])
        return p[0]

    @pg.production('pointer_type : TYPE_NAME STAR')
    @pg.production('pointer_type : IDENTIFIER STAR')
    def pointer_type(state,p):
        return PointerType(Misc(p[0]))
    
    @pg.production('pointer_type : pointer_type STAR')
    def pointer_type(state,p):
        return PointerType(p[0])
    
    @pg.production('misc : pointer_type')
    def pass_ptr(state,p):
        return p[0]

    @pg.production('misc : RIGHT_SHIFT')
    @pg.production('misc : LEFT_SHIFT')
    @pg.production('misc : TILDE')
    @pg.production('misc : SHL_INTR')
    @pg.production('misc : SHR_INTR')
    @pg.production('misc : ADD_INTR')
    @pg.production('misc : SUB_INTR')
    @pg.production('misc : MUL_INTR')
    @pg.production('misc : DIV_INTR')
    @pg.production('misc : REM_INTR')
    @pg.production('misc : AND_INTR')
    @pg.production('misc : OR_INTR')
    @pg.production('misc : XOR_INTR')
    @pg.production('misc : NOT_INTR')
    @pg.production('misc : NEG_INTR')
    @pg.production('misc : FADD_INTR')
    @pg.production('misc : FSUB_INTR')
    @pg.production('misc : FMUL_INTR')
    @pg.production('misc : FDIV_INTR')
    @pg.production('misc : FREM_INTR')
    @pg.production('misc : FNEG_INTR')
    @pg.production('misc : TRUNC_INTR')
    @pg.production('misc : EXT_INTR')
    @pg.production('misc : FTRUNC_INTR')
    @pg.production('misc : FEXT_INTR')
    @pg.production('misc : FTOI_INTR')
    @pg.production('misc : ITOF_INTR')
    @pg.production('misc : CMP_INTR')
    @pg.production('misc : FCMP_INTR')
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
    @pg.production('misc : PASS')
    @pg.production('misc : TRUE')
    @pg.production('misc : FALSE')
    @pg.production('misc : NEW')
    @pg.production('misc : NULL')
    @pg.production('misc : NUMBER')
    @pg.production('misc : IDENTIFIER')
    @pg.production('misc : PERIOD')
    @pg.production('misc : FUNCTION_NAME')
    @pg.production('misc : FUNCTION_TEMPLATE_NAME')
    @pg.production('misc : CLASS_NAME')
    @pg.production('misc : CAST')
    @pg.production('misc : HAT')
    @pg.production('misc : SIZEOF')
    @pg.production('misc : PRINT_INTR')
    @pg.production('misc : PTOI_INTR')
    @pg.production('misc : ITOP_INTR')
    @pg.production('misc : GEP_INTR')
    @pg.production('misc : NONEWLN')
    def pass_misc(state,p):
        state.log('misc : * = ' + p[0].name + " " + p[0].value)
        return Misc(p[0])

    @pg.error
    def error_handler(state,token):
        print("ERROR AT",token,token.source_pos)
        exit()

    out = pg.build()
    #print(out.lr_table.sr_conflicts)
    return out

