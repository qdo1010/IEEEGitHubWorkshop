#include <iostream>

using namespace std;

int main(){
	int a = 1;
	int b = 2;
	int sum;
	sum = add(a,b);
	cout << sum << endl;
	return 0;
}

int add(int a, int b){
	return a + b;
}
