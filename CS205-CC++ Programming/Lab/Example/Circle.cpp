#include <iostream>
#include <cstdlib>
#include <cmath>
using namespace std;
class Circle{
private:
    double radius;
public:
    Circle(double r): radius(r){}
    double getArea(){
        return M_PI*radius*radius;
    }
    double getCircum(){
        return 2*M_PI*radius;
    }
};
int main(){
    Circle c(4);
    cout<<c.getArea()<<endl;
    cout<<c.getCircum()<<endl;
}