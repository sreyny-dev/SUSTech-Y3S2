//
// Created by Admin on 5/8/2024.
////
//#include <iostream>
//#include <memory>
//using namespace std;
//int main()
//{
//    double *p_reg = new double(5);
//    shared_ptr<double> pd;
//    pd = p_reg;
//    pd = shared_ptr<double>(p_reg);
//    cout << "*pd = " << *pd << endl;
//    shared_ptr<double> pshared = p_reg;
//    shared_ptr<double> pshared(p_reg);
//    cout << "*pshred = " << *pshared << endl;
//    string str("Hello World!");
//    shared_ptr<string> pstr(&str);
//    cout << "*pstr = " << *pstr << endl;
//    return 0;
//}
#include <iostream>
#include <memory>
using namespace std;

int main() {
    double *p_reg = new double(5);     // dynamicallty allocate memory and assign it to a raw pointer
    shared_ptr<double> pd(p_reg); //create share_ptr and make it pointed to memo allocated
    cout << "*pd = " << *pd << endl;  // Access the value through shared_ptr
    shared_ptr<double> pshared = make_shared<double>(*p_reg);    // Use make_shared to directly create and manage a dynamic object
    cout << "*pshared = " << *pshared << endl;    // Access the value through shared_ptr
    string str("Hello World!");
    shared_ptr<string> pstr = make_shared<string>(str);     // Use make_shared to directly create and manage a string object
    cout << "*pstr = " << *pstr << endl;
    return 0;
}
