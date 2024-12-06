//
// Created by Admin on 3/20/2024.
//
#include "stuinfo.hpp"
#include <iostream>
using namespace std;
void inputstu(stuinfo stu[], int n){
    for(int i=0;i<n;i++){
        cout<<"Enter student name: "<<endl;
        cin>>stu[i].name;
        cout<<"Enter score of student: " <<i+1<<" (3 scores:)";
        for(int j=0;j<3;j++){
            cin>>stu[i].score[j];
        }
        stu[i].ave=(stu[i].score[0]+stu[i].score[1]+stu[i].score[2])/3;
    }
}
void showstu(stuinfo stu[], int n){
    for(int i=0;i<n;i++){
        cout<<"Student "<<i+1<<": Name - "<<stu[i].name
        <<", Score: "<<stu[i].score[0]<<" ,"<<stu[i].score[1]<<" ,"<<stu[i].score[2]
        <<", Average Score: "<<stu[i].ave<<endl;
    }
}