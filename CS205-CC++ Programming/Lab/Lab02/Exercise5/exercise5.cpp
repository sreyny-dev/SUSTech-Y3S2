#include <iostream>
#include <cstdint>
#include <iomanip>

using namespace std;
int main()
{
auto a = 10;
a = 20.5;
cout << typeid(a).name() << endl;
a += 10.5;
std::cout << a << std::endl;
std:: cout<<sizeof(size_t)<<endl;
char c2=0x50;
std::cout<<c2<<endl;
std::cout<<INT32_MAX<<endl;

float f1=1.2f;
float f2=f1*100000000000000;
cout<<fixed<<setprecision(16)<<f1<<endl;
cout<<fixed<<setprecision(1)<<f2<<endl;
 const float pi=3.14;
 auto d=3;
 int e=d++;
 int f=++d;
 cout<<e<<endl;
 cout<<f<<endl;

return 0;
}