
#include <iostream>
#include <string>
using namespace std;

template <class T1, class T2>
class Pair {
public:
    T1 key;
    T2 value;

    Pair(T1 k, T2 v) : key(k), value(v) { }

    bool operator<(const Pair<T1, T2>& p) const {
        return this->key < p.key;
    }

    friend ostream& operator<<(ostream& print, const Pair<T1, T2>& p) {
        print << "Key: " << p.key << ", Value: " << p.value;
        return print;
    }
};

int main() {
    Pair<string, int> one("Tom", 19);
    Pair<string, int> two("Alice", 20);

    if (one < two)
        cout << one << endl;
    else
        cout << two << endl;

    return 0;
}
