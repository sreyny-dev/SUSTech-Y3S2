#include <iostream>
#include <string>
using namespace std;

struct stuinfo {
    string name;
    int age;
};

template<typename T>
int compare(const T &x, const T &y){
    if(x > y){
        return 1;
    } else if(x < y){
        return -1;
    } else {
        return 0;
    }
}

template<>
int compare<stuinfo>(const stuinfo &s1, const stuinfo &s2) {
    // Comparing based on age
    if (s1.age > s2.age) {
        return 1;
    } else if (s1.age < s2.age) {
        return -1;
    } else {
        return 0;
    }
}

int main(){
    int result = compare(10, 5);
    cout << result << endl;

    result = compare(10, 10);
    cout << result << endl;

    result = compare(5.3, 8.3);
    cout << result << endl;

    stuinfo s1 = {"Sreyny", 21};
    stuinfo s2 = {"Sreyna", 25};
    result = compare(s1, s2);

    if (result == 1) {
        cout << s1.name << " is older than " << s2.name << endl;
    } else if (result == -1) {
        cout << s1.name << " is younger than " << s2.name << endl;
    } else {
        cout << s1.name << " is the same age as " << s2.name << endl;
    }

    return 0;
}
