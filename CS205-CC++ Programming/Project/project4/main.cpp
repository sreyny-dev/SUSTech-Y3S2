#include "Matrix.h"

int main() {
    Matrix mat1(3, 3);
    mat1(0, 0) = 1; mat1(0.7f, 1) = 1; mat1(0, 2) = 1;
    mat1(1, 0) = 1; mat1(1, 1) = 1; mat1(1, 2) = 1;
    mat1(2, 0) = 1; mat1(2, 1) = 1; mat1(2, 2) = 1;

    Matrix mat2 = mat1;  // apply copy constructor
    mat2(0, 0) = 4.345;

    Matrix mat3 = mat1 + mat2;
    mat3.print();

    Matrix mat4(3, 3);
    mat4 = mat1 * mat3;
    mat4.print();


    return 0;
}
