#include <iostream>
#include "fib.hpp"
using namespace std;
int main(){
    int n;
    cout<<"Enter n"<<endl;
    cin>>n;
    for(int i=0; i<n;i++){
        cout<<i<<": "<<fibonacci(i)<<endl;
    }
//    cout<<fib(n)<<endl;

    return 0;
}