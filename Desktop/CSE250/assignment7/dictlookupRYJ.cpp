//Roy Joo CSe250 Assignment 6
#include "StackPairRYJ.h"
#include <vector>
#include <iostream>
#include <fstream>
#include <cstdlib>
using namespace std;


	string wordturn(const string& words){
	
	string* word= new string(words);
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
	return *word;
	}
	//middle character is left alone
	int binsearch(const vector<string>& words, const string& word){	//Requires that words in the array are in order from A to Z like a real dictionary
	int front=0;
	int mid;			//mid is an invariant because it always represents the midpoint between front and back.
	int back=words.size()-1;
	string turnword=wordturn(word);
	while(front <= back){
	mid = (front + back)/2;
	if(words.at(mid)== turnword){
	return mid;}
	else if(turnword.compare(words.at(mid))>0){
	front=mid+1;
	}
	else{
	back=mid-1;}
	}
	return-1;}	//Ensures that if the word is in the array it will return it. If not it will return -1.

	int main(int argc, char** argv){
		if(argc<2){
	cerr<<"You've done it now, The world's going to end."<<endl;
	return 0;}
	else{	
	vector<string>* txt= new vector<string>();	
	string file_name(argv[1]);
	ifstream fin(file_name.c_str());
	ofstream fout("pairs.txt");
		if(fin.is_open()){
			while(!fin.eof()){
				string str;
				fin >> str;
			if(str.size()>3){
				int i= binsearch(*txt,str);
	if(i!=-1){
	fout<<str<<" "<<txt->at(i)<<endl;
	}	txt->push_back(str);
					}		}
	fin.close();
	fout.close();
	}
	else{ cout<<"file doesn't exist"<<endl;}
		return 0;}
		}
	
		
		
	//Report Question:	All three methods take O(n) time to add items into the structure and O(logn) time to search for a item. So in total they take O(nlogn) time.	     // A) Binary Search is obsolent if the data structure "dict" can both add words and search up words in O(1) time.
	// B) If "wordTurnall" sorts and turns all words then binary search can still be used because Binary Search only requires that the words in the array are in A to Z order.
