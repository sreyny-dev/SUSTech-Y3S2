//
// Created by Admin on 4/3/2024.
//
#include <iostream>
#include "myvabs.h"
using namespace std;

int main(){
    int arr1[] = { -1, -2, -3, -4, -5 };
    float arr2[] = { -1.1, -2.2, -3.3, -4.4, -5.5 };
    double arr3[] = { -1.11, -2.22, -3.33, -4.44, -5.55 };
    size_t  n1 = size(arr1);
    size_t  n2 = sizeof(arr2) / sizeof(arr2[0]);
    size_t  n3 = sizeof(arr3) / sizeof(arr3[0]);
    //function call
    vabs(arr1,n1);
    vabs(arr2,n2);
    vabs(arr3,n3);
    //print array
    for(int i=0;i<n1;i++){
        cout<<arr1[i]<<" ";
    }
    cout<<endl;
    for(int i=0;i<n2;i++){
        cout<<arr2[i]<<" ";
    }
    cout<<endl;
    for(int i=0;i<n3;i++){
        cout<<arr3[i]<<" ";
    }
    cout<<endl;
    return  0;
}