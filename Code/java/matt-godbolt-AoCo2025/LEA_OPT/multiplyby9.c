
#include <chrono>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>

long multx9O(long inp) {
   long res = 0;
   asm volatile(
       "leaq (%1, %1, 8), %0  \n\t"
     : "+r"(res)
     : "r"(inp)
     :
   );
   return res;
}

long multx9B(long inp) {
   long res = 0;
   asm volatile(
      "imulq $9, %1, %0  \n\t"
    : "=r"(res)
    : "r"(inp)
    : "cc"
   );
   res = inp * 9;
   return res;
}

typedef long (*micro)(long);

int main(int argc, char* argv[]) {
   if (argc != 2) {
      std::cerr << "Incorrect arguments, APP <algo>" << std::endl;
      return -1;
   }

   int algo = atoi(argv[1]);
   micro func = NULL;
   if (algo == 0) {
     func = multx9B;
   } else {
     func = multx9O;
   }

   long res = 0;
   for (int i = 0; i < 1000000000; i++) {
      res += func(i);
      res += func(i);
      res += func(i);
      res += func(i);
      res += func(i);
   }

   auto start = std::chrono::high_resolution_clock::now();
   for (int i = 0; i < 1000000000; i++) {
      res += func(i);
   }
   auto end = std::chrono::high_resolution_clock::now();
   auto diff = std::chrono::duration<double>(end - start);
   std::cout << "[time] " << diff.count() << "s" << "  [res] " << res << std::endl;
}
