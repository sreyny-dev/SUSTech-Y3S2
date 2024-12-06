#include <iostream>
using namespace std;

class Driver;
class Car{
private:
    enum{Off, On}; //Off- non automatically drive, On-automatically
    enum{minVel=0, maxVel=200};
    int mode; //mode of car, Off or On
    int velocity;

public:
    friend class Driver;
    Car(int m=On, int v=50): mode(m), velocity(v){}

    bool velup(int v);
    bool veldown(int v);
    bool ison() const;
    int getvel() const;
    void showinfo() const;
};
bool Car::velup(int v){
    if(velocity + v<=maxVel){
        velocity +=v;
        return true;
    }else {
        cout << "Velocity: " << (velocity + v) << ", Speed exceed limit!" << endl;
        return false;
    }
};
bool Car::veldown(int v) {
    if(velocity-v >= minVel){
       velocity-=v;
        return true;
    }else{
        cout << "Velocity: " << (velocity - v) << ", Speed cannot go below 0!" << endl;
        return false;
    }
}
bool Car::ison() const {
    return mode==On;
}
int Car::getvel() const {
    return velocity;
}
void Car::showinfo() const {
    cout<<"Mode "<<(mode==On ? "On":"Off")<<", Velocity: "<<velocity<<endl;

}
class Driver{
public:
    bool velup(Car& car, int v);
    bool veldown(Car& car, int v);
    void setmode(Car& car);
    bool ison(Car& car) const;
};
bool Driver::velup(Car &car, int v) {
    return car.velup(v);
}
bool Driver::veldown(Car &car, int v) {
    return car.veldown(v);
}
void Driver::setmode(Car& car){
    car.mode=(car.mode==Car::On) ? Car::Off: Car::On;
}
bool Driver::ison(Car &car) const {
    return car.ison();
}
int main(){
    Car myCar; // default: On mode, velocity 50
    Driver myDriver;

    myCar.showinfo(); // Mode: On, Velocity: 50

    myDriver.velup(myCar, 30); // increase velocity by 30
    myCar.showinfo(); // Mode: On, Velocity: 80

    myDriver.setmode(myCar); // toggle mode
    myCar.showinfo(); // Mode: Off, Velocity: 80

    myDriver.veldown(myCar, 100); // decrease velocity by 100
    myCar.showinfo(); // Mode: Off, Velocity: 0

    myDriver.setmode(myCar); // toggle mode again
    myCar.showinfo(); // Mode: On, Velocity: 0

    cout << "Is car on? " << (myDriver.ison(myCar) ? "Yes" : "No") << endl; // Is car on? Yes

    return 0;

}
