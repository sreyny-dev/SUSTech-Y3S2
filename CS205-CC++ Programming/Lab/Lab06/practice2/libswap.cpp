//
// Created by Admin on 3/27/2024.
//
#include <iostream>
#include "libswap.hpp"
 void swap(int& a, int& b) {
    int temp = a;
    a = b;
    b = temp;
}