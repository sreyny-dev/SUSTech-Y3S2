//
// Created by Admin on 3/20/2024.
//

#ifndef LAB_STUINFO_HPP
#define LAB_STUINFO_HPP
using namespace std;
struct stuinfo{
    char name[20];
    double score[3];
    double ave;
};
void inputstu(stuinfo stu[], int n);
void showstu(stuinfo stu[], int n);
#endif
