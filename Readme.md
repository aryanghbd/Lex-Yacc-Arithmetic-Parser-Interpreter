A basic arithmetic parser with line by line execution built while studying ELEC50010 Instruction Set Architectures and Compilers.

The 'calculator' supports the following operations [+, -, *, ^, /, %] corresponding to binary addition, subtraction, multiplication, exponentiation, division and modulo. 

Implicit multiplication is also supported as well as explicit

The package consists of a lexer to tokenise input made in Lex, the parsing operation was designed in Yacc.

To use the software, just open a terminal to the directory of installation and type 'make calc', ensure that you have Bison Yacc installed by 'sudo apt-get install bison flex'. 

To operate after building, issue './calc'
