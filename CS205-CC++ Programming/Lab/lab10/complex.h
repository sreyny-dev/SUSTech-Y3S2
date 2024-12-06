//
// Created by Admin on 4/24/2024.
//

#ifndef LAB10_COMPLEX_H
#define LAB10_COMPLEX_H
#include <iostream>
class Complex{
public:
    double real;
    double img;
public:
    Complex(double real=0.0, double img=0.0);
    Complex operator+(const Complex &other) const;
    Complex operator-(const Complex &other) const;
    Complex operator*(const Complex &other) const;
    Complex operator~() ;
    bool operator==(const Complex &other) const;
    bool operator!=(const Complex &other) const;
    friend Complex operator*(int scalar, const Complex &c);
    friend std::ostream& operator<<(std::ostream& out, const Complex& c);
    friend std::istream& operator>>(std::istream& in, Complex& c);

};
#endif //LAB10_COMPLEX_H
