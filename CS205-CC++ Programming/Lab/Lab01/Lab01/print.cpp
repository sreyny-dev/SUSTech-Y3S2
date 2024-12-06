#include <iostream>
#include <iomanip>
using namespace std;
int main(){
    double a=0.10000;
    double b=0.2000;
    double c=0.30000;
   
  std::cout << std::fixed << std::setprecision(2);
    std::cout << a << std::endl;
    std::cout << b << std::endl;
    std::cout << c << std::endl;

    return 0; 
}