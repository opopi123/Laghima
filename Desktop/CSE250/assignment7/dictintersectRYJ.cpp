//Roy Joo 
#include <iostream>
#include <vector>
#include <cstdlib>
#include <fstream>
#include "StackPairRYJ.h"
#include "ValliRYJ.h"
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
        return *word;}
// REQ: Needs a input file.
       int main(int argc, char** argv){
                if(argc<2){
        cerr<<"You've done it now, The world's going to end."<<endl;
        return 0;}
        else{
	Valli<string>* elements= new Valli<string>();
        vector<string>* txt= new vector<string>();
        string file_name(argv[1]);
        ifstream fin(file_name.c_str());
        ofstream fout("pairs.txt");
                if(fin.is_open()){
                        while(!fin.eof()){
                                string str;
                                fin >> str;
                        if(str.size()>3){
                               txt->push_back(str);
				elements->insert(wordturn(str));}
   
                                        }               
        fin.close();	
      vector<string>::const_iterator itr1 = txt->begin();
           Valli<string>::iterator itr2 = elements->begin();
           while (itr1 != txt->end() && itr2 != elements->end()) {
      if (*itr1 < *itr2) {
         ++itr1;
      } else if (*itr1 == *itr2) {
         fout<<*itr1<< " "<< wordturn(*itr2)<<endl;
         ++itr1; ++itr2;
      } else {
         ++itr2;
      }
   }
	fout.close();
        }
        else{ cout<<"file doesn't exist"<<endl;}
                return 0;} }
                

