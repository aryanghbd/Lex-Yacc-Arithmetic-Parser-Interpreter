%token N

%start line

%left '+' '-'
%left '*'
%right '^' //Exponentiation is right associative
%nonassoc UMINUS
//There is a need to distinguish between the uniary minus and binary operator minus.

%%

line : expr '\n' {return $1;}
     ;

expr : expr '+' expr { $$ = $1 + $3; }
     | expr '-' expr { $$ = $1 - $3; }
     | expr '*' expr { $$ = $1 * $3; }
     | expr '^' expr { int result = 1; for(int i = 0; i<$3; i++) result *= $1;
                        $$ = result;} //If loop for manual multiple multiplication
     | '(' expr ')' { $$ = $2; }
     | N { $$ = $1; }
     | '-' expr %prec UMINUS { $$ = -$2; }
     | expr expr %prec '*'{ $$ = $1 * $2; } //Implicit multiplication but can be 'too' implicit, i.e 'x y' can return x y
     | expr '%' expr { $$ = $1%$3;}
     ; 
//Simplified definition of grammar, however we need to establish explicit precedence

%%

#include "lex.yy.c"

int main() {
    while(1) {
        printf("> "); //Issue prompt
        int answer = yyparse(); //Parse user input
        printf("%d\n", answer); //Print answer
    }
}

int yyerror (char *s) {
    fprintf (stderr, "%s\n", s);
    exit(1);
}