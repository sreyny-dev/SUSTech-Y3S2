#include <iostream>
using namespace std;
class Demo
{
    public :
    static int num;
    void display()
    {
    cout << "The value of the static member variable num is: " << num <<endl;
    }
};
int Demo::num=1;
int main()
{
    Demo obj;
    obj.display();
    return 0;
}