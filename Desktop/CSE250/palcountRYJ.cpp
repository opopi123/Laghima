#include <iostream>
#include <string>
using namespace std;

int main(int argc, char** argv)
{ if(argc<2){
	cerr<<"Usage: No Word Input"<<endl;
return 0;	}
else{	
	string* blah= new string (argv[1]);
	int count= 0;
	int meep= 0;
	int moop= blah->size();
	for(int i=0; i<blah->size()/2;i++){
	if(blah->at(meep)!=blah->at(moop-1)){
	
	blah->at(meep)=blah->at(moop-1);
	meep=meep+1;
	moop=moop-1;
	count++;}
	}
	cout<<"the new word is "<<*blah<<endl;
	cout<<"changes:"<<count<< endl;
	}
}
//invariants are meep and moop	

 
