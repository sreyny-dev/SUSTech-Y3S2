#include <iostream>
#include <cmath> // For M_PI

class Circle {
private:
    double radius;

public:
    // Constructor to create a circle with a given radius
    Circle(double r) : radius(r) {}

    // Method to get the area of the circle
    double getArea() const {
        return M_PI * radius * radius;
    }

    // Method to get the circumference of the circle
    double getCircumference() const {
        return 2 * M_PI * radius;
    }

    // Optional: Method to get the radius of the circle
    double getRadius() const {
        return radius;
    }
};

int main() {
    // Create a circle with a radius of 5.0
    Circle myCircle(5.0);
    std::cout << " Radius: " << myCircle.getRadius() << std::endl;

    // Output the area of the circle
    std::cout << "Area: " << myCircle.getArea() << std::endl;

    // Output the circumference of the circle
    std::cout << "Circumference: " << myCircle.getCircumference() << std::endl;

    return 0;
}
