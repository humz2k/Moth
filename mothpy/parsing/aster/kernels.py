from llvmlite import ir
import re
from rply import Token

class KernelHeader:
    def __init__(self,iters,name,inputs=[]):
        self.iters = iters
        self.name = name
        self.inputs = inputs

class Kernel:
    def __init__(self,header,lines):
        self.header = header
        self.lines = lines