def error(text,line=None):
    if type(line) != type(None):
        raise Exception(text + " at line " + str(line))
    raise Exception(text)