
#include <math.h>
#include <chrono>
#include <iostream>

double micro(double value) {
   return tanh(value);
}

int main(int argc, char * argv[]) {
   if (argc != 2) {
      std::cerr << "./micro <iters> " << std::endl;
      return -1;
   }
   int iters = atoi(argv[1]); 
   double res = 0.0;
   double value = 0.0001;
   for (int i = 0; i < iters; i++) {
      res += micro(value);
      value += 0.001;
   }
   value = 0.0001;
   auto start = std::chrono::high_resolution_clock::now();
   for (int i = 0; i < iters; i++) {
      res += micro(value);
      value += 0.001;
   }
   auto end = std::chrono::high_resolution_clock::now();
   auto diff = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
   std::cout << "[time] "  << diff.count() <<  " ms  [res] " << res << std::endl;
   return 0; 
}
