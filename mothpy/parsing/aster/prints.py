from llvmlite import ir
import re
from rply import Token

class Print:
    def __init__(self):
        self.vals = []
        self.nonewline = False
    
    def add(self,val):
        self.vals.append(val)
    
    def nonewline(self):
        self.nonewline = True

    def print_vector(self,common,builder,val):
        dims = val.type.dims
        size = 1
        for i in dims:
            size *= i
        vals = [builder.extract_element(val,ir.Constant(ir.IntType(32),i)) for i in range(size)]
        #for i in range(len(dims)):
        #    helpers.print_open_sqr(module,builder)
        indexers = [0]*len(dims)
        last = [1]*len(dims)
        for idx,i in enumerate(vals):
            for j in list(range(len(indexers)))[::-1]:
                if indexers[j] == 0 and (last[j] != indexers[j]):
                    common.printf(builder,"[")
            last = indexers[:]
            common.printf(builder,i)
            indexers[-1] += 1
            for j in list(range(len(indexers)))[::-1][:-1]:
                if indexers[j] == dims[j]:
                    common.printf(builder,"]")
                    if (j == 1) and (idx != (len(vals)-1)):
                        common.printf(builder,"\n")
                    indexers[j] = 0
                    indexers[j-1] += 1
            if idx != (len(vals)-1):
                common.printf(builder," ")
            else:
                common.printf(builder,"]")
        return

    def print_array(self,common,builder : ir.IRBuilder, val):
        ndims = val.type.elements[0].count
        self.throw_error("printing arrays not implemented")
    
    def eval(self,common,builder : ir.IRBuilder, local_vars, *args):
        for idx,i in enumerate(self.vals):
            val = i.eval(common,builder,local_vars,None).get(common,builder)
            if common.is_base(val):
                common.printf(builder,val)
            elif common.is_vector(val):
                self.print_vector(common,builder,val)
            elif common.is_array(val):
                self.print_array(common,builder,val)
            if idx != (len(self.vals)-1):
                common.printf(builder," ")
        if not self.nonewline:
            common.printf(builder,"\n")