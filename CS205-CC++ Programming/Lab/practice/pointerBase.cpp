#include <iostream>
using namespace std;
void func(int& ref) {
    ref = 10;
}
int main() {
//    int value = 0; // Declare a valid integer variable
//    int* ptr = &value; // Initialize ptr to point to value
//    *ptr = 10; // Dereference ptr to set the value of the integer it points to
//    *ptr=100;
//
//    std::cout << "Value: " << value << std::endl; // Output the value to verify the assignment


    int a = 5;
    func(a); // a is now 10
    cout<<a;

    return 0;
}
