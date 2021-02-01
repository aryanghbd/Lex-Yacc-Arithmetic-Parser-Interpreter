all:
	lex calc.lex
	yacc -v calc.y
	gcc -Wno-error=all y.tab.c 

clean:
	rm -f a.out lex.yy.c y.tab.c
	Makefile (END)