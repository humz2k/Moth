L			[a-zA-Z_]
I           [0-9]*
F			[0-9]+\.([0-9]*)?
U           [\+\.\-\*\&\^\%\$\#\@\!\/\,\:\;\']

%{

#include <stdio.h>
#include <string.h>
#include <vector>
#include "moth.tab.hpp"
#include <cassert>

extern "C" int yylex();

int check_type();

//#define LOG

#ifdef LOG
#define log(...) printf(__VA_ARGS__); printf("\n")
#else
#define log(...)
#endif

int indent_level = 0;
int brackets = 0;
int curls = 0;
int squares = 0;
int delta = 0;

void set_indent_level(int nspaces){
    if(!((brackets == 0) && (curls == 0) && (squares == 0)))return;
    assert(nspaces%4 == 0);
    int new_indent_level = nspaces/4;
    delta = new_indent_level - indent_level;
    indent_level = new_indent_level;
}

#define emit_indent_tokens() if((delta != 0) && (brackets == 0) && (curls == 0) && (squares == 0)){\
                                if(delta > 0){\
                                    delta--;return(INDENT);\
                                }\
                                if(delta < 0){\
                                    delta++;return(DEINDENT);\
                                }\
                            }

#define emit_newln() if((brackets == 0) && (curls == 0) && (squares == 0)){log("NEWLN");return(NEWLN);}

%}

%%
    log("delta = %d",delta);
    log("brackets = %d",brackets);
    emit_indent_tokens();

"#"[^\n]*              { }

{I}             {yylval.i = atoi(yytext);return(INTEGER);}
{F}			    {yylval.r = atof(yytext);return(REAL);}

^[ ]*          {int nspaces = strlen(yytext); 
                set_indent_level(nspaces);
                emit_indent_tokens();
                }

[\n][ ]*            {int nspaces = strlen(yytext) - 1;
                    set_indent_level(nspaces);
                    emit_newln();}

"=="            {return(EQ);}
"!="            {return(NEQ);}
"+="            {return(PLUS_EQ);}
"-="            {return(MINUS_EQ);}
"**="           {return(POW_EQ);}
"*="            {return(MUL_EQ);}
"//="           {return(FLOOR_EQ);}
"/="            {return(DIV_EQ);}
"%="            {return(MOD_EQ);}
"<<="           {return(LSHIFT_EQ);}
">>="           {return(RSHIFT_EQ);}
"<<"            {return(LSHIFT);}
">>"            {return(RSHIFT);}
"<="            {return(LE);}
">="            {return(GE);}
"~="            {return(BITNOT_EQ);}
"<"             {return('<');}
">"             {return('>');}
"="             {return('=');}
"!"             {return('!');}
"~"             {return('~');}
"not"           {return('!');}
"&&"            {return(LAND);}
"||"            {return(LOR);}
"and"           {return(LAND);}
"or"            {return(LOR);}
"+"             {return('+');}
"-"             {return('-');}
"*"             {return('*');}
"//"             {return(FLOORDIV);}
"/"             {return('/');}
"%"             {return('%');}
"("             {brackets++;log("(");return('(');}
")"             {brackets--;log(")");return(')');}
"]"             {squares--;return(']');}
"["             {squares++;return('[');}
"}"             {curls--;return('}');}
"{"             {curls++;return('{');}
":"             {return(':');}
";"             {return(';');}

"True"          {yylval.i = 1; return(BOOL);}
"False"          {yylval.i = 0; return(BOOL);}

"if"            {return(IF);}
"else"          {return(ELSE);}
"elif"          {return(ELIF);}
"for"          {return(FOR);}
"in"          {return(IN);}
"while"          {return(WHILE);}
"return"          {return(RETURN);}
"break"          {return(BREAK);}
"continue"          {return(CONTINUE);}

"def"            {return(DEF);}

"i1"            {return(I1);}
"i8"            {return(I8);}
"i16"            {return(I16);}
"i32"            {return(I32);}
"i64"            {return(I64);}

"f16"           {return(F16);}
"f32"           {return(F32);}
"f64"           {return(F64);}

{L}*            {strcpy(yylval.id,yytext);return ID;}

[\t\v\f]		{ }
.			{ log("unmatched!");/* Add code to complain about unmatched characters */ }

%%

extern "C" int yywrap(void)
{
	return 1;
}