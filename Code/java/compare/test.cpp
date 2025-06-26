
#include <iostream>
#include <typeinfo>

class GenArr {
public:
  template <typename T>
  T doSum(T* arr, int len) {
    std::cout << "Argument type : " << typeid(arr).name() << "\nReturn type : " << typeid(T).name() << std::endl;
    T sum = 0; 
    for(int i = 0 ; i < len; i++)
       sum += arr[i];
    return sum;
  }
};

int main() {
  int arri[] = {1,2,3,4};
  long arrl[] = {1,2,3,4};
  float arrf[] = {1.4f,2.3f,3.3f,4.3f};
  GenArr obj;
  std::cout << obj.doSum(arri, 4) << std::endl;
  std::cout << obj.doSum(arrl, 4) << std::endl;
  std::cout << obj.doSum(arrf, 4) << std::endl;
  return 0;
}
