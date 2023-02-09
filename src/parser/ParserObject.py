from rply import ParserGenerator
from . import rules

class ParserState(object):
    def __init__(self):
        pass
    
    def info(self,p,text=""):
        #print(text)
        pass

class Parser():
    def __init__(self,aster,filename = "src/tokens"):
        
        self.ast = aster
        with open(filename,"r") as f:
            tokens = [i.split()[0] for i in f.read().splitlines() if (not i.startswith("//")) and (not len(i) == 0)]
        if "IGNORE" in tokens:
            tokens.remove("IGNORE")
        self.pg = ParserGenerator(tokens, precedence=[
        ('left', ['PLUS', 'MINUS']),
        ('left', ['STAR', 'SLASH']),
        ('left', ['PERCENT']),
        ('left', ['STARSTAR']),
        ('left', ['EQUAL', 'NOT_EQUAL','GREATER','LESS','GREATER_OR_EQUAL','LESS_OR_EQUAL']),
        ('left', ['AND', 'OR']),
        ('left', ['NOT']),
        ('left', ['PERIOD'])
        ])

    def bind(self):

        self.Index = rules.arrays.index.Index.__get__(self,self.__class__)
        self.EmptyIndex = rules.arrays.index.EmptyIndex.__get__(self,self.__class__)
        self.ArrayIndex = rules.arrays.index.ArrayIndex.__get__(self,self.__class__)
        self.InitializeArray = rules.arrays.initialize.InitializeArray.__get__(self,self.__class__)
        self.InitializeObjectArray = rules.arrays.initialize.InitializeObjectArray.__get__(self,self.__class__)
        self.MathOP = rules.binaryOps.arith.MathOP.__get__(self,self.__class__)
        self.ComparisonOP = rules.binaryOps.comparison.ComparisonOP.__get__(self,self.__class__)
        self.LogicOP = rules.binaryOps.logic.LogicOP.__get__(self,self.__class__)
        self.Not = rules.binaryOps.logic.Not.__get__(self,self.__class__)
        self.Expression = rules.binaryOps.expressions.Expression.__get__(self,self.__class__)
        self.Class = rules.control.classes.Class.__get__(self,self.__class__)
        self.IfStatement = rules.control.conditionals.IfStatement.__get__(self,self.__class__)
        self.IfHeader = rules.control.conditionals.IfHeader.__get__(self,self.__class__)
        self.ElifStatement = rules.control.conditionals.ElifStatement.__get__(self,self.__class__)
        self.ElifHeader = rules.control.conditionals.ElifHeader.__get__(self,self.__class__)
        self.ElseStatement = rules.control.conditionals.ElseStatement.__get__(self,self.__class__)
        self.ElseHeader = rules.control.conditionals.ElseHeader.__get__(self,self.__class__)
        self.Function = rules.control.functions.Function.__get__(self,self.__class__)
        self.FunctionDef = rules.control.functions.FunctionDef.__get__(self,self.__class__)
        self.FunctionCall = rules.control.functions.FunctionCall.__get__(self,self.__class__)
        self.WhileLoop = rules.control.loops.WhileLoop.__get__(self,self.__class__)
        self.ForLoop = rules.control.loops.ForLoop.__get__(self,self.__class__)
        self.WhileHeader = rules.control.loops.WhileHeader.__get__(self,self.__class__)
        self.ForHeader = rules.control.loops.ForHeader.__get__(self,self.__class__)
        self.InitializeObject = rules.objects.initialize.InitializeObject.__get__(self,self.__class__)
        self.Assign = rules.statements.assign.Assign.__get__(self,self.__class__)
        self.Declaration = rules.statements.declaration.Declaration.__get__(self,self.__class__)
        self.Print = rules.statements.output.Print.__get__(self,self.__class__)
        self.Return = rules.statements.special.Return.__get__(self,self.__class__)
        self.Break = rules.statements.special.Break.__get__(self,self.__class__)
        self.ArrayType = rules.types.arrays.ArrayType.__get__(self,self.__class__)
        self.TypeObj = rules.types.base.TypeObj.__get__(self,self.__class__)
        self.Cast = rules.types.convert.Cast.__get__(self,self.__class__)
        self.Bool = rules.constants.Bool.__get__(self,self.__class__)
        self.Number = rules.constants.Number.__get__(self,self.__class__)
        self.String = rules.constants.String.__get__(self,self.__class__)
        self.Program = rules.containers.Program.__get__(self,self.__class__)
        self.Scope = rules.containers.Scope.__get__(self,self.__class__)
        self.Lines = rules.containers.Lines.__get__(self,self.__class__)
        self.Identifier = rules.identifiers.Identifier.__get__(self,self.__class__)
        self.Reference = rules.identifiers.Reference.__get__(self,self.__class__)
        self.Arange = rules.iterators.Arange.__get__(self,self.__class__)
        self.Linspace = rules.iterators.Linspace.__get__(self,self.__class__)

    def parse(self):
        self.bind()

        self.Program()

        self.Function()
        self.FunctionDef()
        self.FunctionCall()

        self.Class()

        self.Scope()
        self.Lines()

        self.WhileHeader()
        self.WhileLoop()
        self.ForLoop()
        self.ForHeader()

        self.Declaration()

        self.Linspace()
        self.Arange()
        self.Reference()
        self.Identifier()
        
        
        self.String()
        self.Number()
        self.Bool()
        self.Cast()
        self.TypeObj()
        self.ArrayType()
        self.Break()
        self.Return()
        self.Print()
        
        self.Assign()
        self.InitializeObject()
        
        
        self.ElseHeader()
        self.ElseStatement()
        self.ElifHeader()
        self.ElifStatement()
        self.IfHeader()
        self.IfStatement()
        
        self.Expression()
        self.Not()
        self.LogicOP()
        self.ComparisonOP()
        self.MathOP()
        self.InitializeObjectArray()
        self.InitializeArray()
        self.ArrayIndex()
        self.EmptyIndex()
        self.Index()

    def error(self):
        @self.pg.error
        def error_handle(state,token):
            raise ValueError(token)

    def get_parser(self):
        return self.pg.build()