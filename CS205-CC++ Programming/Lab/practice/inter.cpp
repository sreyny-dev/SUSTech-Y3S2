#include <iostream>
#include <valarray>

using namespace std;

    float norm(float x, float y, float z);
    float norm(float x, float y, float z = 0);
    float norm(float x, float y = 0, float z);
    double roun(double x);
    float roun(float x);
    long double roun(long double x);
    int main()
    {
        cout << norm(3.0f) << endl;
        cout << norm(3.0f, 4.0f) << endl;
        cout << norm(3.0f, 4.0f, 5.0f) << endl;
        cout<<roun(2);
        return 0;
    }
    float norm(float x, float y, float z)
    {
        return sqrt(x * x + y * y + z * z);
    }
