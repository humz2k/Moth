from llvmlite import ir
import re
from rply import Token

class Printf:
    def __init__(self,vals):
        self.vals = vals

    def eval(self,common,builder : ir.IRBuilder, local_vars,*args):
        vals = [i.eval(common,builder,local_vars).get(common,builder) for i in self.vals]
        return common.constant(builder.call(common.print_func,vals))

class Print:
    def __init__(self):
        self.vals = []
        self.nonewline = False
    
    def add(self,val):
        self.vals.append(val)
    
    def nonewline(self):
        self.nonewline = True

    def print_vector(self,common,builder : ir.IRBuilder,val):
        dims = val.type.dims
        size = 1
        for i in dims:
            size *= i
        vals = [builder.extract_element(val,ir.Constant(ir.IntType(32),i)) for i in range(size)]
        #for i in range(len(dims)):
        #    helpers.print_open_sqr(module,builder)
        print_vals = []
        print_fmt = ""
        indexers = [0]*len(dims)
        last = [1]*len(dims)
        for idx,i in enumerate(vals):
            for j in list(range(len(indexers)))[::-1]:
                if indexers[j] == 0 and (last[j] != indexers[j]):
                    #common.printf(builder,"[")
                    print_fmt += "["
            last = indexers[:]
            fmt,out_val = common.get_print_formatter(builder,i)
            print_fmt += fmt
            print_vals.append(out_val)
            #common.printf(builder,i)
            indexers[-1] += 1
            for j in list(range(len(indexers)))[::-1][:-1]:
                if indexers[j] == dims[j]:
                    #common.printf(builder,"]")
                    print_fmt += "]"
                    if (j == 1) and (idx != (len(vals)-1)):
                        #common.printf(builder,"\n")
                        print_fmt += "\n"
                    indexers[j] = 0
                    indexers[j-1] += 1
            if idx != (len(vals)-1):
                #common.printf(builder," ")
                print_fmt += " "
            else:
                print_fmt += "]"
                #common.printf(builder,"]")
        return print_fmt,print_vals


    def print_array(self,common,builder : ir.IRBuilder, val):
        ndims = val.type.elements[0].count
        self.throw_error("printing arrays not implemented")
    
    def eval(self,common,builder : ir.IRBuilder, local_vars, *args):
        out_fmt = ""
        out_vals = []
        for idx,i in enumerate(self.vals):
            val = i.eval(common,builder,local_vars,None).get(common,builder)
            if common.is_base(val):
                fmt,out_val = common.get_print_formatter(builder,val)
                out_fmt += fmt
                out_vals.append(out_val)
            elif common.is_vector(val):
                fmt,new_vals = self.print_vector(common,builder,val)
                out_fmt += fmt
                out_vals += new_vals
            elif common.is_struct(val):
                fmt,new_vals = common.get_struct_formatter(builder,val)
                out_fmt += fmt
                out_vals += new_vals
            elif common.is_object(val):
                name = val.type.pointee.name.split("OBJECT_")[1]
                out_fmt += "object[" + name + "]"
            else:
                error_t = "Can't print type " + common.format_error_var(common.type_to_str(val.type))
                common.throw_error(error_t = error_t, fileoforigin = self.fileoforigin, lineno = self.lineno)
            #elif common.is_array(val):
            #    self.print_array(common,builder,val)
            if idx != (len(self.vals)-1):
                out_fmt += " "
        if not self.nonewline:
            out_fmt += "\n"
        builder.call(common.print_func,[common.get_string(builder,out_fmt)] + out_vals)