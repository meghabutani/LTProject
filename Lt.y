%{
#include<stdio.h>
#include<math.h>

#define A 1.609
#define B 3.785
#define C 0.405
#define D 0.454
%}
%union{
int integer;
float real;
}
%token <integer> NUMBER <real> FLOAT
%token Result of is to Miles Km Gallon Litres Acres Hectares Pound Kg
%type <real> S T
%%
S: Result of T {$$=$3;};

T: FLOAT Miles to Km 	{$$=A*$1;printf("Result of %f Miles to Km is %f\n",$1,$$);}
  |FLOAT Gallon to Litres 	{$$=B*$1;printf("Result of %f Gallon to Litres is %f\n",$1,$$);}
  |FLOAT Acres to Hectares 	{$$=C*$1;printf("Result of %f Acres to Hectares is %f\n",$1,$$);}
  |FLOAT Pound to Kg 	{$$=D*$1;printf("Result of %f Pound to Kg is %f\n",$1,$$);}
  ;
  
%%
void yyerror(char *s){}
int main(int argc, char *argv[])
{
yyparse();

return 0;
}