import lex
import parse

with open("test.txt","r") as f:
    raw = f.read()

raw = lex.remove_comments(raw)
raw = lex.convert(raw)

function_names = lex.find_functions(raw)
object_names = lex.find_objects(raw)
struct_names = lex.find_structs(raw)
namespaces = lex.find_namespaces(raw)

lexer = lex.get_lexer(function_names = function_names, object_names = object_names, struct_names = struct_names, namespaces = namespaces)

tokens = [i for i in lexer.lex(raw)]

parser = parse.get_parser()

parsed = parser.parse(iter(tokens),parse.ParserState())