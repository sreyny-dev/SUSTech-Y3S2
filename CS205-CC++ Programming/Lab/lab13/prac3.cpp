//
// Created by Admin on 5/22/2024.
//

#include <iostream>
#include <string>
#include <algorithm>
using namespace std;
 template <class Key, class Value>
 class Dictionary{
     Key* keys;
     Value* values;
     int size;
     int max_size;
 public:
     Dictionary(int int_size):size(0){
         max_size=1;
         while(int_size>=max_size)
             max_size*=2;
         keys=new Key[max_size];
         values=new Value[max_size];
     }
     void add(Key key, Value value){
         Key *tmpKey;
         Value *tmpVal;
         if(size+1>=max_size){
             max_size *=2;
             tmpKey=new Key[max_size];
             tmpVal=new Value[max_size];
             for(int i=0;i<size;i++){
                 tmpKey[i]=keys[i];
                 tmpVal[i]=values[i];
             }
             tmpKey[size]=key;
             tmpVal[size]=value;
             delete[] keys;
             delete[] values;
             keys=tmpKey;
             values=tmpVal;
         }else{
             keys[size]=key;
             values[size]=value;
         }
         size++;
     }
     void print(){
         for(int i=0;i<size;i++){
             cout<<"{" << keys[i]<< ", " <<values[i]<<"}"<<endl;
         }
     }
     ~Dictionary(){
         delete[] keys;
         delete [] values;
     }
 };
template <class Value>
class Dictionary<int, Value> {
    int* keys;
    Value* values;
    int size;
    int max_size;
public:
    Dictionary(int initial_size) : size(0) {
        max_size = 1;
        while (initial_size >= max_size)
            max_size *= 2;
        keys = new int[max_size];
        values = new Value[max_size];
    }

    void add(int key, Value value) {
        if (size + 1 >= max_size) {
            max_size *= 2;
            int* tmpKey = new int[max_size];
            Value* tmpVal = new Value[max_size];
            for (int i = 0; i < size; i++) {
                tmpKey[i] = keys[i];
                tmpVal[i] = values[i];
            }
            delete[] keys;
            delete[] values;
            keys = tmpKey;
            values = tmpVal;
        }
        keys[size] = key;
        values[size] = value;
        size++;
    }

    void print() {
        for (int i = 0; i < size; i++)
            cout << "{" << keys[i] << ", " << values[i] << "}" << endl;
    }

    void sort() {
        for (int i = 0; i < size - 1; i++) {
            for (int j = 0; j < size - i - 1; j++) {
                if (keys[j] > keys[j + 1]) {
                    swap(keys[j], keys[j + 1]);
                    swap(values[j], values[j + 1]);
                }
            }
        }
    }

    ~Dictionary() {
        delete[] keys;
        delete[] values;
    }
};
int main()
{
    Dictionary<const char*, const char*> dict(10);
    dict.print();
    dict.add("apple", "fruit");
    dict.add("banana", "fruit");
    dict.add("dog", "animal");
    dict.print();
    cout<<endl;
    Dictionary<int, const char*> dict_specialized(10);
    dict_specialized.add(100, "apple");
    dict_specialized.add(101, "banana");
    dict_specialized.add(103, "dog");
    dict_specialized.add(89, "cat");
    dict_specialized.print();
    dict_specialized.sort();
    cout << endl << "Sorted list:" << endl;
    dict_specialized.print();
    return 0;
}