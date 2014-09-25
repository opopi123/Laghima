//Roy Joo
#include <iostream>
#include <cstdlib>
#include <fstream>
#include "ValliRYJ.h"
using namespace std;


	
	int main(int argc, char** argv){
		if(argc<2){
	cerr<<"You've done it now, The world's going to end."<<endl;
	return 0;}
	else{	
	Valli<string>* txt= new Valli<string>();	
	string file_name(argv[1]);
	ifstream fin(file_name.c_str());
		if(fin.is_open()){
			while(!fin.eof()){
				string s;
				fin >> s;
			if(s=="insert"){
			fin>>s;
			txt->insert(s);}			
	else if(s=="erase"){
			fin>>s;
			txt->erase(txt->find(s));
					}	
	else if(s=="print"){
		cout<<txt->str()<<endl;	
	}	}
	fin.close();
	}
	else{ cout<<"file doesn't exist"<<endl;}
		return 0;}
		}

