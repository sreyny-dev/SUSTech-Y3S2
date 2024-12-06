
#include <iostream>
#include <typeinfo>
using namespace std;

class Base{
protected:
    int bvalue;
public:
    Base(int i):bvalue(i){}
    virtual bool equal(const Base& b)const{
        return bvalue==b.bvalue;
    }
    friend bool operator == (const Base& b1, const Base& b2){
        if(typeid(b1) != typeid(b2)){
            throw "The two obejcts have different types, cannot be compared.";
        }
        return b1.equal(b2);
    }
    virtual ~Base(){}
};
class Derived: public Base{
private:
    int dvalue;
public:
    Derived(int a, int b): Base(a), dvalue(b){}
    virtual bool equal(const Base& b) const override {
        if(const Derived* d=dynamic_cast<const Derived*>(&b)){
            return bvalue==d->bvalue && dvalue==d->dvalue;
        }
        return false;
    }
};
void process(const Base& b1, const Base& b2){
    try {
        if (b1 == b2) {
            if (typeid(b1) == typeid(Base)) {
                cout << "The two base type objects are equal." << endl;
            } else if (typeid(b1) == typeid(Derived)) {
                cout << "The two derived type objects are equal because they have different value." << endl;
            }
        } else {
            if (typeid(b1) == typeid(Base)) {
                cout << "The two base type objects are not equal." << endl;
            } else if (typeid(b1) == typeid(Derived)) {
                cout << "The two derived type objects are not equal because they have different value." << endl;
            }
        }
    }catch (const char* msg){
        cout<< msg <<endl;
    }
}

int main(){
    Base b1(2);
    Base b2(2);

    Derived d1(1,2);
    Derived d2(2,2);

    process(b1,b2);
    process(d1,d2);
    process(b1,d1);
    return 0;
}