#include <iostream>

using namespace std;

int main()
{
//    int num = 10;
//    int * p1 = NULL, * p2 = NULL; // declaration, initialize to 0
//    p1 = &num; // take the address of num, assign to p1
//    p2 = &num; // take the address of num, assign to p2
//
//    cout << "num = " << num << endl;
//
//    *p1 = 20; // assign to num
//    cout << "num = " << num << endl;
//
//    *p2 = 30; // assign to num
//    cout << "num = " << num << endl;
int numbers []={0,1,2,3};
int * p=numbers+1;
p++;
*p=20;
*(p-1)=10;
p[1]=30;
for(int i=0;i<4;i++){
    cout<<numbers[i]<<" ";
}

    return 0;
}