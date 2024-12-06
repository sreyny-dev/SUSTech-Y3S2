//
// Created by Admin on 4/17/2024.
//

#include <iostream>
using namespace std;

class Complex {
private:
    double realPart;
    double imaginaryPart;

public:
    // Constructor with default values
    Complex(double real = 0.0, double imaginary = 0.0) : realPart(real), imaginaryPart(imaginary) {}

    // Member function to add two complex numbers
    Complex add(const Complex& other) const {
        return Complex(realPart + other.realPart, imaginaryPart + other.imaginaryPart);
    }

    // Member function to subtract two complex numbers
    Complex subtract(const Complex& other) const {
        return Complex(realPart - other.realPart, imaginaryPart - other.imaginaryPart);
    }

    // Member function to display the complex number
    void display() const {
        if (imaginaryPart < 0)
            cout << realPart << " - " << -imaginaryPart << "i" << endl;
        else
            cout << realPart << " + " << imaginaryPart << "i" << endl;
    }
};

int main() {
    Complex num1(4.5, 2.0);
    Complex num2(1.2, -3.7);

    Complex sum = num1.add(num2);
    Complex difference = num1.subtract(num2);

    cout << "Num1: ";
    num1.display();

    cout << "Num2: ";
    num2.display();

    cout << "Sum: ";
    sum.display();

    cout << "Difference: ";
    difference.display();

    return 0;
}


