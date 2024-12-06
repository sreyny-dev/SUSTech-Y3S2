#include <iostream>
using namespace std;
//enum class Day {
//    Sunday,
//    Monday,
//    Tuesday,
//    Wednesday,
//    Thursday,
//    Friday,
//    Saturday
//};
//
//enum class Weather {
//    Sunny,
//    Rainy,
//    Cloudy,
//    Snowy
//};
//
//struct DayInfo {
//    Day day;
//    Weather weather;
//};
//bool canTravel(DayInfo dayInfo) {
//    if ((dayInfo.day == Day::Saturday || dayInfo.day == Day::Sunday) && dayInfo.weather == Weather::Sunny) {
//        return true;
//    } else {
//        return false;
//    }
//}
//
//int main() {
//    DayInfo today = {Day::Saturday, Weather::Sunny};
//    if (canTravel(today)) {
//        std::cout << "It's possible to travel today!" << std::endl;
//    } else {
//        std::cout << "It's not possible to travel today." << std::endl;
//    }
//
//    return 0;
//}
enum  Day {Sun, Mon, Tue, Wed, Thur, Fri, Sat};
enum Weather{Sunny, Rainy, Cloudy, Snowy};
struct DayInfo{
    Day day;
    Weather weather;
};
bool CanTravel(DayInfo dayInfo){
    if((dayInfo.day==Sat || dayInfo.day==Sun) && (dayInfo.weather==Sunny || dayInfo.weather==Cloudy)){
        return true;
    }else
        return false;
}
int main(){
    DayInfo today={Mon,Sunny};
    if(CanTravel(today)){
        cout<<"It's possible to travel today."<<endl;
    }else
        cout<<"It isn't possible to travel today."<<endl;
}