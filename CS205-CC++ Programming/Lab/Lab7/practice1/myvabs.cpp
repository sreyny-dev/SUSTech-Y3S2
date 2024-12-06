//
// Created by Admin on 4/3/2024.
//
#include <iostream>
#include <cmath>
#include "myvabs.h"
using namespace std;


bool vabs(int*p, size_t n){
    for(int i=0;i<n;i++){
        if(p[i]<0){
            p[i]=abs(p[i]);
        }
    }
    return true;
}
bool vabs(float*p, size_t  n){
    for(int i=0;i<n;i++){
        if(p[i]<0){
            p[i]=fabs(p[i]);
        }
    }
    return true;
}
bool vabs(double*p, size_t  n){
    for(int i=0;i<n;i++){
        if(p[i]<0){
            p[i]=fabs(p[i]);
        }
    }
    return true;
}