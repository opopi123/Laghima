TurnWord: TwoStacksRYJ.o wordturnRYJ.o
	g++ -o TurnWord TwoStacksRYJ.o wordturnRYJ.o

TwoStacksRYJ.o: TwoStacksRYJ.cpp TwoStacksRYJ.h
	g++ -c TwoStacksRYJ.cpp TwoStacksRYJ.h

wordturnRYJ.o: wordturnRYJ.cpp TwoStacksRYJ.cpp TwoStacksRYJ.h
	g++ -c wordturnRYJ.cpp TwoStacksRYJ.cpp TwoStacksRYJ.h
