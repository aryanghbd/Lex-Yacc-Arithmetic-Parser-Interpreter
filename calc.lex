%option noyywrap

%%

[0-9]+ { yylval = atoi(yytext); return N; }

[ \t] { }

.|\n { return yytext[0]; }

