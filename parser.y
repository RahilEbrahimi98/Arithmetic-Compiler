%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();

int regNum = 1;

void yyerror(char *str) ;

char* concatenate1(char* num1, char *oper, char* num2);
char* concatenate2(char* num1);
    %}
%union{
    char* word;
    struct { int flag; char * exp; } type;
}

%type<type> S E T F 
%token<word> NUM


%%
S   :E             {$$.flag = $1.flag;$$.exp = $1.exp;if($1.flag == 1){$$.exp = concatenate2($1.exp);
                    printf("Print %s",$$.exp);}else{ printf("Print %s",$1.exp);}}
    ;

E   :E '+' T       {$$.flag = 0;$$.exp =concatenate1($1.exp ,"Plu",$3.exp);}
    |E '-' T       {$$.flag = 0;$$.exp =concatenate1( $1.exp , "Min", $3.exp);}
    |T             {$$.flag = $1.flag;strcpy( $$.exp ,$1.exp) ;}
    ;
    
T   :T '*' F       {$$.flag = 0;$$.exp =concatenate1( $1.exp ,"Mul", $3.exp);}
    |T '/' F       {$$.flag = 0;$$.exp =concatenate1( $1.exp ,"Div" ,$3.exp);}
    |F             {$$.flag = $1.flag;strcpy( $$.exp ,$1.exp) ; }
    ;
     
F   : '(' E ')'    {$$.flag=$2.flag;$$.exp =$2.exp;}
    |NUM           {$$.flag=1;$$.exp =malloc(100); strcpy( $$.exp ,$1) ;}
    ;

%%
int main(){
    yyparse();
    return 0;
}

void yyerror(char *str)  {
    fprintf(stderr,"%s\n",str);
    exit(1);
}

 char* concatenate1(char* num1, char *oper, char* num2) {
        char* rv = malloc(10);
        snprintf(rv, 9, "t%d", regNum++);
        printf("Assign %s %s %s to %s\n", num1 , oper, num2,rv);
        return rv;
    }
 char* concatenate2(char* num1) {
        char* rv2 = malloc(10);
        snprintf(rv2, 9, "t%d", regNum++);
        printf("Assign %s to %s\n", num1,rv2);
        
        return rv2;
    }




