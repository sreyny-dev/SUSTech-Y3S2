#include "fib.hpp"
using namespace std;
int fibonacci(int n){
    if(n<=1){
        return 1;
    }else
    return fibonacci(n-1)+fibonacci(n-2);
}
