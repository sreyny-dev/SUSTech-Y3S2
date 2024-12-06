#include <iostream>
#include <vector>
#include <algorithm>
#include <stdexcept>
#include <memory>
using namespace std;

class Matrix {
private:
    int rows;
    int cols;
    shared_ptr<vector<float>> data;

public:
    Matrix(int rows, int cols) : rows(rows), cols(cols), data(make_shared<vector<float>>(rows * cols)) {}
    Matrix(const Matrix& other) : rows(other.rows), cols(other.cols), data(other.data) {}
    Matrix& operator=(const Matrix& other) {
        if (this != &other) {
            rows = other.rows;
            cols = other.cols;
            data = other.data;
        }
        return *this;
    }
    ~Matrix() = default;
    float& operator()(int row, int col) {
        if (row < 0 || row >= rows || col < 0 || col >= cols) {
            throw std::out_of_range("Matrix indices out of range");
        }
        return (*data)[row * cols + col];
    }
    const float& operator()(int row, int col) const {
        if (row < 0 || row >= rows || col < 0 || col >= cols) {
            throw std::out_of_range("Matrix indices out of range");
        }
        return (*data)[row * cols + col];
    }
    Matrix operator+(const Matrix& other) const {
        if (rows != other.rows || cols != other.cols) {
            throw std::invalid_argument("Matrices must have the same dimensions for addition");
        }

        Matrix result(rows, cols);
        std::transform(data->begin(), data->end(), other.data->begin(), result.data->begin(), std::plus<float>());
        return result;
    }
    void display()  {
        for (int i = 0; i < rows; ++i) {
            for (int j = 0; j < cols; ++j) {
                std::cout << (*this)(i, j) << " ";
            }
            std::cout << std::endl;
        }
    }
};

int main() {
    Matrix a(3, 4);
    Matrix b(3, 4);

    a(1, 2) = 3;
    b(2,3)=4;

    std::cout << "Matrix a:" << std::endl;
    a.display();
    std::cout << "Matrix b:" << std::endl;
    b.display();
    Matrix c=a+b;
    std::cout << "Matrix c:" << std::endl;
    c.display();
    Matrix d=a;
    std::cout << "Matrix d (copy constructor):" << std::endl;
    d.display();
    d=b;
    std::cout << "Matrix d (assignment constructor):" << std::endl;
    d.display();

    return 0;
}
