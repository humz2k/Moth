L           [a-zA-Z_]
I           [0-9]*
F           [0-9]+\.[0-9]*?
U           [\+\.\-\*\&\^\%\$\#\@\!\/\,\:\;\']

%{

#include <stdio.h>
#include <string.h>
#include <assert.h>
#include "moth.tab.h"

int yylex(void);
int check_type(void);

#define LOG

#ifdef LOG
#define log(...) printf(__VA_ARGS__); printf(" ")
#else
#define log(...)
#endif

int indent_level = 0;
int brackets = 0;
int curls = 0;
int squares = 0;
int delta = 0;
int yywrap_called = 0;
YY_BUFFER_STATE end_buff;

void set_indent_level(int nspaces) {
    if (!((brackets == 0) && (curls == 0) && (squares == 0))) return;
    assert(nspaces % 4 == 0);
    int new_indent_level = nspaces / 4;
    delta = new_indent_level - indent_level;
    indent_level = new_indent_level;
}

#define RETURN_TOKEN(t) log(#t);return(t)

#define emit_indent_tokens() if ((delta != 0) && (brackets == 0) && (curls == 0) && (squares == 0)) {\
                                if (delta > 0) {\
                                    delta--;RETURN_TOKEN(INDENT);\
                                }\
                                if (delta < 0) {\
                                    delta++;RETURN_TOKEN(DEINDENT);\
                                }\
                            }

#define emit_newln() if ((brackets == 0) && (curls == 0) && (squares == 0)) {\
                        log("NEWLN\n");log_indents();return(NEWLN);\
                     }

#define log_indents() for (int i = 0; i < indent_level; i++) { printf("    "); }

%}

%%
    //printf("yytext = %s\n",yytext);
    emit_indent_tokens();

"#"[^\n]*              { }

{I}             { yylval.i = atoi(yytext); RETURN_TOKEN(INTEGER); }
{F}             { yylval.r = atof(yytext); RETURN_TOKEN(REAL); }

^[ ]*          { int nspaces = strlen(yytext); 
                 set_indent_level(nspaces);
                 emit_indent_tokens();
               }

[\n][ ]*$       {}//{emit_newln();}

[\n][ ]*            { int nspaces = strlen(yytext) - 1;
                      set_indent_level(nspaces);
                      emit_newln();
                    }

"=="            { RETURN_TOKEN(EQ); }
"!="            { RETURN_TOKEN(NEQ); }
"+="            { RETURN_TOKEN(PLUS_EQ); }
"-="            { RETURN_TOKEN(MINUS_EQ); }
"**="           { RETURN_TOKEN(POW_EQ); }
"*="            { RETURN_TOKEN(MUL_EQ); }
"//="           { RETURN_TOKEN(FLOOR_EQ); }
"/="            { RETURN_TOKEN(DIV_EQ); }
"%="            { RETURN_TOKEN(MOD_EQ); }
"<<="           { RETURN_TOKEN(LSHIFT_EQ); }
">>="           { RETURN_TOKEN(RSHIFT_EQ); }
"<<"            { RETURN_TOKEN(LSHIFT); }
">>"            { RETURN_TOKEN(RSHIFT); }
"<="            { RETURN_TOKEN(LE); }
">="            { RETURN_TOKEN(GE); }
"~="            { RETURN_TOKEN(BITNOT_EQ); }
"<"             { RETURN_TOKEN('<'); }
">"             { RETURN_TOKEN('>'); }
"="             { RETURN_TOKEN('='); }
"!"             { RETURN_TOKEN('!'); }
"~"             { RETURN_TOKEN('~'); }
"not"           { RETURN_TOKEN('!'); }
"&&"            { RETURN_TOKEN(LAND); }
"||"            { RETURN_TOKEN(LOR); }
"and"           { RETURN_TOKEN(LAND); }
"or"            { RETURN_TOKEN(LOR); }
"+"             { RETURN_TOKEN('+'); }
"-"             { RETURN_TOKEN('-'); }
"*"             { RETURN_TOKEN('*'); }
"//"            { RETURN_TOKEN(FLOORDIV); }
"/"             { RETURN_TOKEN('/'); }
"%"             { RETURN_TOKEN(MOD); }
"("             { brackets++; RETURN_TOKEN('('); }
")"             { brackets--; RETURN_TOKEN(')'); }
"]"             { squares--; RETURN_TOKEN(']'); }
"["             { squares++; RETURN_TOKEN('['); }
"}"             { curls--; RETURN_TOKEN('}'); }
"{"             { curls++; RETURN_TOKEN('{'); }
":"             { RETURN_TOKEN(':'); }
";"             { RETURN_TOKEN(';'); }
","             { RETURN_TOKEN(','); }
"."             { RETURN_TOKEN('.'); }
"$"             { RETURN_TOKEN('$'); }

"True"          { yylval.i = 1;  RETURN_TOKEN(BOOL); }
"False"         { yylval.i = 0;  RETURN_TOKEN(BOOL); }

"if"            { RETURN_TOKEN(IF); }
"else"          { RETURN_TOKEN(ELSE); }
"elif"          { RETURN_TOKEN(ELIF); }
"for"           { RETURN_TOKEN(FOR); }
"in"            { RETURN_TOKEN(IN); }
"while"         { RETURN_TOKEN(WHILE); }
"return"        { RETURN_TOKEN(RETURN); }
"break"         { RETURN_TOKEN(BREAK); }
"continue"      { RETURN_TOKEN(CONTINUE); }

"with"      { RETURN_TOKEN(WITH); }

"generic"      { RETURN_TOKEN(GENERIC); }

"def"           { RETURN_TOKEN(DEF); }

"object"        { RETURN_TOKEN(OBJECT); }
"struct"        { RETURN_TOKEN(STRUCT); }
"interface"     { RETURN_TOKEN(INTERFACE); }

"bool"          { RETURN_TOKEN(I1); }
"char"          { RETURN_TOKEN(I8); }
"short"         { RETURN_TOKEN(I16); }
"int"           { RETURN_TOKEN(I32); }
"long"          { RETURN_TOKEN(I64); }
"str"           { RETURN_TOKEN(STR); }

"half"          { RETURN_TOKEN(F16); }
"float"         { RETURN_TOKEN(F32); }
"double"        { RETURN_TOKEN(F64); }

"void"          { RETURN_TOKEN(VOID); }

{L}*            { strcpy(yylval.id, yytext); RETURN_TOKEN(ID); }

[\t\v\f]        { }
.               { }

%%

int yywrap(void)
{
    if ((indent_level == 0) && (yywrap_called)) {
        yy_delete_buffer(end_buff);
        #ifdef LOG
        printf("\n");
        #endif
        return 1;
    }

    if (!yywrap_called) {
        yywrap_called = 1;
        end_buff = yy_scan_string("\n");
    }

    return 0;
}