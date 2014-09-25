
#include <vector>
#include <iostream>
#include "TwoStacksRYJ.h"
using namespace std;

	Twostacks::Twostacks(int cell):
	 elements( new vector <char>(cell)),
	front(-1),
	rear(cell),
	bound(cell){}					 

	int Twostacks::size() const{
	return bound-rear+front;}
	bool Twostacks::isFull() const{
	return front==rear || rear==0 ||front==bound ;}
	bool Twostacks::isEmpty() const{
	return front ==-1 && rear== bound;}
	char Twostacks::popA(){
	if(isEmpty()){
	cerr<<"error Stack is empty"<<endl;
	return ' ';}
	else{return elements->at(front--);
	}	}
	char Twostacks::popB(){
	if(isEmpty()){
	cerr<<"error Stack is empty"<<endl;
	return ' ';}
	else{ return elements->at(rear++);
	}
		}
	void Twostacks::pushA(char A){
	if(isFull()){
	cerr<< "error Stack is full"<<endl;
	}
	else{
	elements->at(++front)=A;
	}	}
	void Twostacks::pushB(char B){	
	if(isFull()){
	cerr<<"error Stack is full"<<endl;}
	else{	
		elements-> at(--rear)=B;
		}
			}
	
	
			
	
