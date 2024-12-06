//// C++ Program to Illustrate that Array Name is a Pointer
//// that Points to First Element of the Array
//#include <iostream>
//using namespace std;
//
//int main()
//{
//    // Defining an array
//    int arr[] = { 1, 2, 3, 4 };
//
//    // Define a pointer
//    int* ptr = arr;
//    *ptr+=5;
//
//    // Printing address of the arrary using array name
//    cout << "Memory address of arr: " << &arr<<" "<< &arr[0]<< endl;
//
//    // Printing address of the array using ptr
//    cout << "Memory address of arr: " << *ptr << endl;
//
//    return 0;
//}
#include <iostream>
using namespace std;

// passing array as a sized array argument
void printArraySized(int arr[3], int n)
{
    cout << "Array as Sized Array Argument: ";
    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;
}

// passing array as an unsized array argument
void printArrayUnsized(int arr[], int n)
{
    cout << "Array as Unsized Array Argument: ";
    for (int i = 0; i < n; i++) {
        cout << *(arr + i) << " ";
    }
    cout << endl;
}

// Passing array as a pointer argument
void printArrayPointer(int* ptr, int n)
{
    // Print array elements using pointer ptr
    // that store the address of array passed
    cout << "Array as Pointer Argument: ";
    for (int i = 0; i < n; i++) {
        cout << ptr[i] << " ";
    }
}

// driver code
int main()
{

    int arr[] = { 10, 20, 30 };

    // Call function printArray and pass
    // array and its size to it.
    printArraySized(arr, 3);
    printArrayUnsized(arr, 3);
    printArrayPointer(arr, 3);

    return 0;
}
