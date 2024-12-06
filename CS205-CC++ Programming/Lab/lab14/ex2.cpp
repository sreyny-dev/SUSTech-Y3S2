#include <iostream>
#include <cfloat>
#include <cstdlib>
#include <stdexcept>
using namespace std;
class OutOfRangeException : public exception{
public:
    OutOfRangeException(const string& msg) : m_msg(msg){}
    virtual const char*what() const throw(){
        return m_msg.c_str();
    }
private: string m_msg;
};
float calculateAverage(int mark1, int mark2, int mark3, int mark4){
    float average=0;
    if(mark1<0 || mark1 >100 || mark2<0 || mark2 >100 || mark3<0 || mark3 >100 ||mark4<0 || mark4 >100){
        throw OutOfRangeException("Mark out of bound, mark must be in between 0-100!");
    }else{
        average=(mark1+mark2+mark3+mark4)/4.0;
    }
    return average;
}
int main(){
    int mark1, mark2, mark3, mark4;
    cout<<"Please Enter 4 numbers between 0 and 100: ";
    cin>> mark1 >> mark2 >>mark3 >>mark4;
    try{
        float average= calculateAverage(mark1,mark2,mark3,mark4);
        cout<< "Average Score is: "<<average<<endl;
    }catch(const OutOfRangeException& e) {
        cout<<"Error: "<<e.what()<<endl;
    }
}
