
#include <stdio.h>
#include <iostream>

template <typename T>
auto  genVal(T a) -> decltype(a[1]) {
  std::cout << __PRETTY_FUNCTION__ << std::endl;
  std::cout << typeid(a).name() << std::endl;
  return a[1];
}

int main() {
  int a[10] = {1,2,3,4,5,6,7,8,9,10};
  return genVal(a);
}
