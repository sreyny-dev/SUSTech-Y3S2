#include <iostream>
using namespace std;
template <typename T>
T max(T& a, T& b){
    return (a>b)? a:b;
}

int main(){
    int intMax= max<int>(4,65);
    double doubleMax=max(5,89);
    cout<<intMax<<endl;
    cout<<doubleMax<<endl;
    return 0;
}

