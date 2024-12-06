#include <iostream>
#include "add.h"

using namespace std;
int main()
{
    int number1 =123;
    int number2 =1;
    int result=0;

    result = add(number1, number2);
    cout<<"The result is " <<result<<endl;
    return 0;
}
