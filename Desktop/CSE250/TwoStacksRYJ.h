#ifndef TWOSTACKSRYJ_H_
#define TWOSTACKSRYJ_H_
#include <vector>

using namespace std;

class Twostacks{
	int front, rear, bound;
	vector <char>* elements;

	public:
	Twostacks(int cell);
	int size() const;
	bool isFull() const;
	bool isEmpty() const;
	char popA();
	char popB();
	void pushA(char A);
	void pushB(char B);
				};
#endif	
