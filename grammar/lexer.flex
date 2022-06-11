package grammar;

import java.io.*;
import java_cup.runtime.*;

%%

%public
%type  Symbol
%char

%{
  public Symbol token(int tokenType) {
    System.err.println("Obtain token: " + sym.terminalNames[tokenType] + " \"" + yytext() + "\"");
    return new Symbol(tokenType, yytext());
  }
%}

number  =   [0-9]+
ident   =   [A-Za-z] [A-Za-z0-9]*
space   =   [\ \t]
newline =   \r|\n|\r\n

%%

"="         { return token(sym.ASSIGN); }
"+"         { return token(sym.PLUS); }
"-"         { return token(sym.MINUS); }
"*"         { return token(sym.TIMES); }
"/"         { return token(sym.DIVIDE); }
"("         { return token(sym.LEFT); }
")"         { return token(sym.RIGHT); }
{newline}   { return token(sym.NEWLINE); }
{space}     {  }
{number}    { return token(sym.NUMBER); }
{ident}     { return token(sym.IDENT); }
.           { return token(sym.error); }
<<EOF>>     { return token(sym.EOF); }