#ifndef STACKPAIRRYJ_h_
#define STACKPAIRRYJ_h_
#include <vector>
#include <iostream>

using namespace std;
template<class T>
class StackPair{
	int front, rear, bound;
	vector <T>* elements;

	public:
	~StackPair();
	StackPair(int cell);
	int size() const;
	bool isFull() const;
	bool isEmpty() const;
	T popA();
	T popB();
	void pushA(T A);
	void pushB(T B);
				};




        template<class T>
	StackPair<T>::StackPair(int cell):
	 elements( new vector <T>(cell)),
	front(-1),
	rear(cell),
	bound(cell){}					 
template<class T> StackPair<T>::~StackPair(){delete elements;}
template<class T>
	int StackPair<T>::size() const{
	return bound-rear+front;}
template<class T>
	bool StackPair<T>::isFull() const{
	return front==rear || rear==0 ||front==bound ;}
template<class T>
	bool StackPair<T>::isEmpty() const{
	return front ==-1 && rear== bound;}
template<class T>
	T StackPair<T>::popA(){
	if(isEmpty()){
	cerr<<"error Stack is empty"<<endl;
	return ' ';}
	else{return elements->at(front--);
	}	}
template<class T>
	T StackPair<T>::popB(){
	if(isEmpty()){
	cerr<<"error Stack is empty"<<endl;
	return ' ';}
	else{ return elements->at(rear++);
	}
		}
template<class T>
	void StackPair<T>::pushA(T A){
	if(isFull()){
	cerr<< "error Stack is full"<<endl;
	}
	else{
	elements->at(++front)=A;
	}	}
template<class T>
	void StackPair<T>::pushB(T B){	
	if(isFull()){
	cerr<<"error Stack is full"<<endl;}
	else{	
		elements-> at(--rear)=B;
		}
			}
	
	
			
	
#endif	
