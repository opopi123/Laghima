#include <iostream>
#include <sstream>
#include <string>
using namespace std;

int main(){

while(1){
string line;
string subline;
cin >> line;
istringstream ss(line, istringstream::in);
	
	while( ss >> subline){
		char a;
		a =  subline[0];
		subline.erase(0,1);
		cout << subline << a  << "ay"<< " " ;
					}
	}
}


