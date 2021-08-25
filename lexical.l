%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"
char* ListWord[10] =  {"Zer","One","Two","Thr","Fou","Fiv","Six","Sev","Eig","Nin"};
char* listGan[6]  =  {"","","Ten_","Hun_",")Tou_"};
char* digitToWord1();
char* digitToWord2();
char* digitToWord3();
char* digitToWord4();
char* digitToWord5();
char* digitToWord6();
%}
  

%%
([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])           {yylval.word=digitToWord6();return NUM; }
([0-9])([0-9])([0-9])([0-9])([0-9])           {yylval.word=digitToWord5();return NUM; }
([0-9])([0-9])([0-9])([0-9])         {yylval.word=digitToWord4();return NUM; }
([0-9])([0-9])([0-9])         {yylval.word=digitToWord3();return NUM; }
([0-9])([0-9])         {yylval.word=digitToWord2();return NUM; }
[0-9]        {yylval.word=digitToWord1();return NUM; }

[-+*/()]        {return yytext[0];}
[\t ]           ;
[\n]            {return 0;}
   
      
%%

char* digitToWord1(){
    char *Word = (char *)malloc(100);
    strcpy(Word,ListWord[yytext[0]-'0']);
    strcat(Word,listGan[1]);
    Word[3] = '\0';
    return Word;  
}

char* digitToWord2() {
    char *Word = (char *)malloc(100);
    strcpy(Word,ListWord[yytext[0]-'0']);
    strcat(Word,listGan[2]);
    strcat(Word,ListWord[yytext[1]-'0']);
    Word[10] = '\0';
    return Word;  
}

char* digitToWord3() {
    char *Word = (char *)malloc(100);
    strcpy(Word,ListWord[yytext[0]-'0']);
    strcat(Word,listGan[3]);
    strcat(Word,ListWord[yytext[1]-'0']);
    strcat(Word,listGan[2]);
    strcat(Word,ListWord[yytext[2]-'0']);
    strcat(Word,listGan[1]);
    Word[17] = '\0';
    return Word;  
}
char* digitToWord4() {
    char *Word = (char *)malloc(100);
    strcpy(Word,"(");
    strcat(Word,ListWord[yytext[0]-'0']);
    strcat(Word,listGan[4]);
    strcat(Word,ListWord[yytext[1]-'0']);
    strcat(Word,listGan[3]);
    strcat(Word,ListWord[yytext[2]-'0']);
    strcat(Word,listGan[2]);
    strcat(Word,ListWord[yytext[3]-'0']);
    strcat(Word,listGan[1]);
    Word[26] = '\0';
    return Word;  
}
char* digitToWord5() {
    char *Word = (char *)malloc(100);
    strcpy(Word,"(");
    strcat(Word,ListWord[yytext[0]-'0']);
    strcat(Word,listGan[2]);
    strcat(Word,ListWord[yytext[1]-'0']);
    strcat(Word,listGan[1]);
    strcat(Word,listGan[4]);
    strcat(Word,ListWord[yytext[2]-'0']);
    strcat(Word,listGan[3]);
    strcat(Word,ListWord[yytext[3]-'0']);
    strcat(Word,listGan[2]);
    strcat(Word,ListWord[yytext[4]-'0']);
    strcat(Word,listGan[1]);
    Word[33] = '\0';
    return Word;  
}

char* digitToWord6() {
    char *Word = (char *)malloc(100);
    strcpy(Word,"(");
    strcat(Word,ListWord[yytext[0]-'0']);
    strcat(Word,listGan[3]);
    strcat(Word,ListWord[yytext[1]-'0']);
    strcat(Word,listGan[2]);
    strcat(Word,ListWord[yytext[2]-'0']);
    strcat(Word,listGan[1]);
    strcat(Word,listGan[4]);
    strcat(Word,ListWord[yytext[3]-'0']);
    strcat(Word,listGan[3]);
    strcat(Word,ListWord[yytext[4]-'0']);
    strcat(Word,listGan[2]);
    strcat(Word,ListWord[yytext[5]-'0']);
    strcat(Word,listGan[1]);
    Word[40] = '\0';
    return Word;  
}