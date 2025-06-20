
#include <iostream>

template <typename T>
class ABC {
  public:
  static void msg() { std::cout << "GC" << std::endl;}
}; 

template <>
class ABC<int> {
  public:
  static void msg() { std::cout << "IC" << std::endl;}
};

int main() {
   ABC<int>::msg(); 
   ABC<short>::msg(); 
   return 0;
}
