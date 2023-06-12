from rply import LexerGenerator
import re
import os

def remove_comments(code_str):
    """
    This function removes all the single-line and multi-line comments from a given piece of Moth code.

    Parameters
    ----------
    code_str : str
        A string representing the Moth code from which to remove comments.

    Returns
    -------
    str
        The input Moth code with all comments removed.
    """
    
    # Find all multiline comments (i.e., text enclosed between '###' and '###') in the code
    multiline_comments = re.findall(r"\#\#\#.*?\#\#\#", code_str, re.DOTALL)
    
    # Replace each multiline comment in the code with newline characters, preserving line count
    for comment in multiline_comments:
        code_str = code_str.replace(comment, "\n" * comment.count("\n"))
    
    # Find all single-line comments (i.e., text following '#') in the code
    single_line_comments = re.findall(r"\#.*", code_str)
    
    # Remove each single-line comment from the code
    for comment in single_line_comments:
        code_str = code_str.replace(comment, "")
    
    return code_str

def convert_to_c_style(code_str):
    """
    Converts Python-style code (indentation-based) to C-style code (curly braces-based).

    Parameters
    ----------
    code_str : str
        A string representing the Python code to be converted.

    Returns
    -------
    str
        The input Python code converted into C-style code.
    """

    lines = code_str.splitlines()
    indent_level = 0
    output_code = ""

    for line in lines:
        # Skip empty lines
        if len(line.strip()) == 0:
            output_code += "\n"
            continue

        indents = line.count("    ")  # Count the number of indentations (4 spaces)

        if indents > indent_level:
            # If current indent level is higher, add opening braces accordingly
            output_code += "{" * (indents - indent_level)
            indent_level = indents

        elif indents < indent_level:
            # If current indent level is lower, add closing braces accordingly
            output_code += "}" * (indent_level - indents)
            indent_level = indents

        output_code += line

        # Add semicolon at the end of the line if it's not a block opener (ends with :) 
        # and doesn't already end with a semicolon
        if not line.strip().endswith(":") and not line.strip().endswith(";"):
            output_code += ";"

        output_code += "\n"

    # Add closing braces for any remaining open blocks
    output_code += "}" * indent_level + "\n"

    return output_code

def find_functions(code_str):
    """
    Extracts the names of functions from a given Moth code string. 
    It specifically ignores functions named 'operator' with with type
    'cast'.

    Parameters
    ----------
    code_str : str
        A string representing the Python code from which to extract function names.

    Returns
    -------
    list
        A list of function names extracted from the input Python code.
    """

    # Regular expression pattern to match Moth function definitions.
    # This pattern matches 'def' keyword, followed by type and then name 
    function_matches = re.findall(r"def ([a-zA-Z_0-9\.\[\]\:\*\<\>]+) (\w+)", code_str)

    # Return all function names except ones with type 'cast' and name 'operator'
    function_names = [match[1] for match in function_matches if match[0] != 'cast' and match[1] != 'operator']

    return function_names

def find_objects(moth_code):
    """
    Extracts the names of objects from a given Moth code string.

    Parameters
    ----------
    moth_code : str
        A string representing the Moth code from which to extract object names.

    Returns
    -------
    list
        A list of object names extracted from the input Moth code.
    """
    return re.findall(r"object (\w+)", moth_code)

def find_structs(moth_code):
    """
    Extracts the names of structs from a given Moth code string.

    Parameters
    ----------
    moth_code : str
        A string representing the Moth code from which to extract struct names.

    Returns
    -------
    list
        A list of struct names extracted from the input Moth code.
    """
    return re.findall(r"struct (\w+)", moth_code)

def find_namespaces(moth_code):
    """
    Extracts the names of namespaces (modules) from a given Moth code string.

    Parameters
    ----------
    moth_code : str
        A string representing the Moth code from which to extract namespace names.

    Returns
    -------
    list
        A list of namespace names extracted from the input Moth code.
    """
    return re.findall(r"module (\w+)", moth_code)

def build_moth_lexer(token_file="tokens.txt", object_names=[], struct_names=[], function_names=[], namespaces=[]):
    """
    Builds and returns a lexer for the Moth programming language.

    Parameters
    ----------
    token_file : str, optional
        The filename of the text file containing token definitions. Each line should contain a token type
        and a regex pattern, separated by a space. Lines starting with '//' are ignored.
        Default is "tokens.txt".

    object_names : list of str, optional
        A list of object names to be added to the lexer as OBJECT_NAME tokens.

    struct_names : list of str, optional
        A list of struct names to be added to the lexer as STRUCT_NAME tokens.

    function_names : list of str, optional
        A list of function names to be added to the lexer as FUNCTION_NAME tokens.

    namespaces : list of str, optional
        A list of namespace names to be added to the lexer as NAMESPACE tokens.

    Returns
    -------
    LexerGenerator
        The built lexer for the Moth programming language.
    """
    lexer = LexerGenerator()

    # Read the token definitions from the file
    with open(token_file, "r") as f:
        token_definitions = [line.split() for line in f.read().splitlines() 
                             if not line.startswith("//") and len(line) != 0]

    # Add object name tokens to the lexer
    for name in object_names:
        lexer.add("OBJECT_NAME", r"\b" + re.escape(name) + r"\b")

    # Add struct name tokens to the lexer
    for name in struct_names:
        lexer.add("STRUCT_NAME", r"\b" + re.escape(name) + r"\b")

    # Add namespace tokens to the lexer
    for name in namespaces:
        lexer.add("NAMESPACE", r"\b" + re.escape(name) + r"\b")

    # Add function name tokens to the lexer
    for name in function_names:
        lexer.add("FUNCTION_NAME", r"\b" + re.escape(name) + r"\b")

    # Add or ignore other tokens as specified in the token file
    for token_type, pattern in token_definitions:
        if token_type == "IGNORE":
            lexer.ignore(pattern)
        else:
            lexer.add(token_type, pattern)

    return lexer.build()

def preprocess_file(filename, path, function_names=[], object_names=[], struct_names=[], namespaces=[], aliases={}):
    """
    Preprocesses a file of Moth code by removing comments, converting syntax, handling includes and aliases,
    identifying functions, objects, structs, and namespaces, and tokenizing the code.

    Parameters
    ----------
    filename : str
        The path of the Moth code file to preprocess.

    path : str
        The path where the token file is located.

    function_names : list of str, optional
        A list of known function names.

    object_names : list of str, optional
        A list of known object names.

    struct_names : list of str, optional
        A list of known struct names.

    namespaces : list of str, optional
        A list of known namespace names.

    aliases : dict, optional
        A dictionary of known aliases, mapping alias names to their replacements.

    Returns
    -------
    tuple
        A tuple containing the list of tokens generated from the preprocessed code, 
        and the updated lists of function names, object names, struct names, namespace names,
        and the aliases dictionary.
    """
    with open(filename,"r") as f:
        code = f.read()

    # Remove comments and convert to C-style syntax
    code = remove_comments(code)

    code = convert_to_c_style(code)

    # Handle included files
    includes = re.findall(r"include\b.*\;", code)
    for include in includes:
        code = code.replace(include, "")
    include_files = [include.split("include ")[1][:-1] for include in includes]

    stdlib_path = os.path.abspath(os.path.join(os.path.dirname( __file__ ), '..','..','stdlib'))
    tokens = []
    for include_file in include_files:
        if (include_file.startswith("<") and include_file.endswith(">")):
            include_file = stdlib_path + "/" + include_file[1:-1]

        processed = preprocess_file(include_file, path)
        out_tokens, func_names, obj_names, struct_names, namespace_names, new_aliases = processed

        tokens += out_tokens

        aliases.update(new_aliases)
        function_names += func_names
        object_names += obj_names
        struct_names += struct_names
        namespaces += namespace_names

    # Handle aliases
    found_aliases = re.findall(r"alias\b.*\;", code)
    for alias in found_aliases:
        code = code.replace(alias, "")
    for alias in found_aliases:
        label, *value = alias.strip().split(" ")
        value = " ".join(value)[:-1]
        aliases[label] = value
    for label, value in aliases.items():
        code = re.sub(r"\b" + re.escape(label.strip()) + r"\b", value, code)

    # Identify functions, objects, structs, and namespaces
    function_names += find_functions(code)
    object_names += find_objects(code)
    struct_names += find_structs(code)
    namespaces += find_namespaces(code)

    # Tokenize the processed code
    lexer = build_moth_lexer(token_file=path, function_names=function_names, object_names=object_names, struct_names=struct_names, namespaces=namespaces)
    new_tokens = [token for token in lexer.lex(code)]
    for token in new_tokens:
        token.fileoforigin = filename

    return tokens + new_tokens, function_names, object_names, struct_names, namespaces, aliases

def lex_file(filename, path):
    """
    Tokenizes a file of Moth code.

    This function is designed to be called from the command-line interface.

    Parameters
    ----------
    filename : str
        The path of the Moth code file to tokenize.

    path : str
        The path where the token file is located.

    Returns
    -------
    list
        A list of tokens generated from the Moth code in the specified file.
    """
    tokens, *_ = preprocess_file(filename, path)
    return tokens