# Arithmetic Compiler
 
 **Compiler for arithmetic equation translation- with Flex and Bison**

# How to run
First you need to install Flex and Bison.
Then run the program using the following commands:

    bison -d .\parser.y
    flex .\lexical.l
	gcc .\lex.yy.c .\parser.tab.c
	.\a.exe

