#include <iostream>
#include <cstring> // For strcpy

union Data {
    int i;
    float f;
    char str[20];
};

int main() {
    Data data;

    // Store an integer
    data.i = 42;
//    std::cout << "data.i: " << data.i << std::endl;

    // Store a float (this will overwrite the integer)
    data.f = 3.14f;
//    std::cout << "data.f: " << data.f << std::endl;

    // Store a string (this will overwrite the float)
    strcpy(data.str, "Hello, World!");
    std::cout << "data.str: " << data.str << std::endl;

    return 0;
}
