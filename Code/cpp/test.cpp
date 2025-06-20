
#include <iostream>

int fun(int a, int b){ 
  return a + b;
}

using acmp = int (*) (int, int);
int main() {
   acmp func;
   func = fun;
   std::cout << func(10, 10) << std::endl;
   return 0;
}
