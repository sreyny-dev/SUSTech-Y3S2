#ifndef MATRIX_H
#define MATRIX_H

#include <iostream>
#include <cstring>
#include <stdexcept>

class Matrix {
public:
    Matrix(size_t rows = 0, size_t cols = 0);
    Matrix(const Matrix& other);
    Matrix& operator=(const Matrix& other);
    Matrix(Matrix&& other) noexcept;
    Matrix& operator=(Matrix&& other) noexcept;
    ~Matrix();

    bool operator==(const Matrix& other) const;
    Matrix operator+(const Matrix& other) const;
    Matrix operator-(const Matrix& other) const;
    Matrix operator*(const Matrix& other) const;

    int& operator()(size_t row, size_t col);
    const int& operator()(size_t row, size_t col) const;

    void setROI(size_t rowOffset, size_t colOffset, size_t roiRows, size_t roiCols);

    void print() const;

private:
    size_t rows;
    size_t cols;
    int* data;
    bool isROI;
    size_t rowOffset;
    size_t colOffset;
    size_t roiRows;
    size_t roiCols;

    void copyDataFrom(const Matrix& other);
};

#endif // MATRIX_H
