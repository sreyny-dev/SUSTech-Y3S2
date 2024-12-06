//
// Created by Admin on 4/24/2024.
//
#include "complex.h"
#include <iostream>
using namespace std;

Complex::Complex(double real, double img) : real(real), img(img) {}

Complex Complex::operator+(const Complex &other) const {
    return Complex(real + other.real, img + other.img);
}

Complex Complex::operator-(const Complex &other) const {
    return Complex(real - other.real, img - other.img);
}

Complex Complex::operator*(const Complex &other) const {
    return Complex(real * other.real, img * other.img);
}

Complex Complex::operator~()  {
    this->img=-img;
    return Complex(real, img); // Conjugate
}
Complex operator*(int scalar, const Complex &c) {
    return Complex(scalar * c.real, scalar * c.img);
}
bool Complex::operator==(const Complex &other) const {
    return (real == other.real) && (img == other.img);
}

bool Complex::operator!=(const Complex &other) const {
    return !(*this == other);
}
ostream& operator<<(ostream& out, const Complex& c) {
    if(c.img>=0){
        out << c.real << " + " << c.img << "i";
        return out;
    }else{
        out << c.real << " - " << -c.img << "i";
        return out;
    }

}
istream& operator>>(istream& in, Complex& c) {
    std::cout << "Enter real part and img part: ";
    in >> c.real;
    in >> c.img;
    return in;
}



