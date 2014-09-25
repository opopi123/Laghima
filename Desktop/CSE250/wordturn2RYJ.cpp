
#include <iostream>
#include <vector>
#include "StackPairRYJ.h"
using namespace std;

	int main(int argc, char** argv){
	if(argc<2){
	cerr<<"Error! No Input"<<endl;
	return 0;
	}
	else{
	string* word= new string(argv[1]);
	int wordsize = word->size(); 
	StackPair<char>* box =new  StackPair<char>(wordsize);
	int meep=0;
	int moop= wordsize-1;
	for(int i=0;i<word->size()/2;i++){
	box->pushA(word->at(meep));
	meep++;
	box->pushB(word->at(moop));
	moop--;}
	int beep=0;
	int boop= wordsize-1;
	for(int i=0; i<word->size()/2;i++){
	word->at(beep)=box->popA();
	beep++;	
	word->at(boop)=box->popB();
	boop--;}
	cout<<"your new word is:"<<*word<<endl;
	return 0;}
	}
	//middle character is left alone
