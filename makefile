JAVAC = javac
JAVA = java
CLASSPATH = . 

parse: example.cup
	$(JAVA) -classpath $(CLASSPATH) java_cup.Main example.cup

lex: example.lex
	$(JAVA) JLex.Main spl_lex.lex
	mv example.lex.java Yylex.java

build: sym.java parser.java Yylex.java
	$(JAVAC) Program.java
	$(JAVAC) sym.java parser.java Yylex.java

all:
	$(JAVA) -classpath $(CLASSPATH) java_cup.Main example.cup
	$(JAVA) JLex.Main example.lex
	mv example.lex.java Yylex.java
	$(JAVAC) Program.java
	$(JAVAC) sym.java parser.java Yylex.java

run:
	$(JAVA) -classpath $(CLASSPATH) parser

clean:
	-rm *.class
	-rm Yylex.java
	-rm parser.java
	-rm sym.java
