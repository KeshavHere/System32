Y

%token NUMBER ID NL
%left '+' '-'
%left '*' '/'
%%
stmt : exp NL { printf("Valid Expression"); 
exit(0);}
;
exp : exp '+' exp       {printf("+");}
| exp '-' exp           {printf("-");}
| exp '*' exp           {printf("*");}
| exp '/' exp           {printf("/");}
| '(' exp ')'
| ID
| NUMBER                {printf("%d",$1);}
;
%%
int yyerror(char *msg)
{
printf("\nInvalid Expression\n");
exit(0);
}
main ()
{
printf("\nEnter the expression\n");
yyparse();
}

L

%{
#include "prac2a.tab.h"
%}
%%

[0-9]+ { yylval=atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9_]* { return ID; }
\n { return NL ;}
. { return yytext[0]; }
%%