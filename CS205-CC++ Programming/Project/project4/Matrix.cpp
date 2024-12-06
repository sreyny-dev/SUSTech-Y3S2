#include "Matrix.h"


Matrix::Matrix(size_t rows, size_t cols)
        : rows(rows), cols(cols), data(rows ? new int[rows * cols] : nullptr),
          isROI(false), rowOffset(0), colOffset(0), roiRows(rows), roiCols(cols) {}


Matrix::Matrix(const Matrix& other)
        : rows(other.rows), cols(other.cols), data(nullptr),
          isROI(other.isROI), rowOffset(other.rowOffset), colOffset(other.colOffset),
          roiRows(other.roiRows), roiCols(other.roiCols) {
    copyDataFrom(other);
}


Matrix& Matrix::operator=(const Matrix& other) {
    if (this != &other) {
        delete[] data;
        rows = other.rows;
        cols = other.cols;
        isROI = other.isROI;
        rowOffset = other.rowOffset;
        colOffset = other.colOffset;
        roiRows = other.roiRows;
        roiCols = other.roiCols;
        copyDataFrom(other);
    }
    return *this;
}

Matrix::Matrix(Matrix&& other) noexcept
        : rows(other.rows), cols(other.cols), data(other.data),
          isROI(other.isROI), rowOffset(other.rowOffset), colOffset(other.colOffset),
          roiRows(other.roiRows), roiCols(other.roiCols) {
    other.rows = 0;
    other.cols = 0;
    other.data = nullptr;
}

Matrix& Matrix::operator=(Matrix&& other) noexcept {
    if (this != &other) {
        delete[] data;
        rows = other.rows;
        cols = other.cols;
        data = other.data;
        isROI = other.isROI;
        rowOffset = other.rowOffset;
        colOffset = other.colOffset;
        roiRows = other.roiRows;
        roiCols = other.roiCols;

        other.rows = 0;
        other.cols = 0;
        other.data = nullptr;
    }
    return *this;
}

Matrix::~Matrix() {
    delete[] data;
}

void Matrix::copyDataFrom(const Matrix& other) {
    if (other.data) {
        data = new int[other.rows * other.cols];
        std::memcpy(data, other.data, other.rows * other.cols * sizeof(int));
    }
}

bool Matrix::operator==(const Matrix& other) const {
    if (rows != other.rows || cols != other.cols) return false;
    for (size_t i = 0; i < rows * cols; ++i) {
        if (data[i] != other.data[i]) return false;
    }
    return true;
}

Matrix Matrix::operator+(const Matrix& other) const {
    if (rows != other.rows
    || cols != other.cols) {
        throw std::invalid_argument("Matrices must have the same dimensions for addition.");
    }
    Matrix result(rows, cols);
    for (size_t i = 0; i < rows * cols; ++i) {
        result.data[i] = data[i] + other.data[i];
    }
    return result;
}

Matrix Matrix::operator-(const Matrix& other) const {
    if (rows != other.rows || cols != other.cols) {
        throw std::invalid_argument("Matrices must have the same dimensions for subtraction.");
    }
    Matrix result(rows, cols);
    for (size_t i = 0; i < rows * cols; ++i) {
        result.data[i] = data[i] - other.data[i];
    }
    return result;
}

Matrix Matrix::operator*(const Matrix& other) const {
    if (cols != other.rows) {
        throw std::invalid_argument("Number of columns of first matrix must be equal to number of rows of second matrix.");
    }
    Matrix result(rows, other.cols);
    for (size_t i = 0; i < rows; ++i) {
        for (size_t j = 0; j < other.cols; ++j) {
            result(i, j) = 0;
            for (size_t k = 0; k < cols; ++k) {
                result(i, j) += (*this)(i, k) * other(k, j);
            }
        }
    }
    return result;
}

int& Matrix::operator()(size_t row, size_t col) {
    return data[(row + rowOffset) * cols + (col + colOffset)];
}

const int& Matrix::operator()(size_t row, size_t col) const {
    return data[(row + rowOffset) * cols + (col + colOffset)];
}

void Matrix::setROI(size_t rowOffset, size_t colOffset, size_t roiRows, size_t roiCols) {
    if (rowOffset + roiRows > rows || colOffset + roiCols > cols) {
        throw std::out_of_range("ROI exceeds matrix dimensions.");
    }
    this->rowOffset = rowOffset;
    this->colOffset = colOffset;
    this->roiRows = roiRows;
    this->roiCols = roiCols;
    isROI = true;
}

void Matrix::print() const {
    for (size_t i = 0; i < roiRows; ++i) {
        for (size_t j = 0; j < roiCols; ++j) {
            std::cout << (*this)(i, j) << " ";
        }
        std::cout << std::endl;
    }
}
