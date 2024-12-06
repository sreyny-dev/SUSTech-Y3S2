#include <iostream>
using namespace std;
int sum(int * a, int * b){
    return *a+*b;
}
int main(){
    int a=0;
    int b=10;
    cout<<sum(&a, &b)<<endl;
    cout<<a<< " "<<b<<endl;
}