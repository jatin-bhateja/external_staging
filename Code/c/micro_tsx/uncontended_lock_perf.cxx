
#include <chrono>
#include <iostream>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

long mem = 0;
long micro1(long a, long b, long c) {
   long res = 0;
   asm volatile (
      "lock addq %1, %4 \n\t"
      "lock addq %2, %4 \n\t"
      "lock addq %3, %4 \n\t"
      "movq %4, %0   \n\t"
     : "=r"(res)
     : "r"(a), "r"(b), "r"(c), "m"(mem)
     : "cc", "%rax"
   );
   return res;
}

long micro2(long a, long b, long c) {
   long res = 0;
   asm volatile (
      "addq %1, %4      \n\t"
      "addq %2, %4      \n\t"
      "addq %3, %4      \n\t"
      "movq %4, %0   \n\t"
     : "=r"(res)
     : "r"(a), "r"(b), "r"(c), "m"(mem)
     : "cc", "%rax"
   );
   return res;
}

int main(int argc, char * argv[]) {
   long res1 = 0;
   long res2 = 0;

   if (argc != 2) {
      std::cerr << "Incorrect Arguments!" << std::endl;
      return -1;
   }

   int algo = atoi(argv[1]);

   if (algo == 0 || algo == -1) {
      for (int i = 0; i < 100000000; i++) {
         res1 += micro1(i, i + 1, i + 2);
      }
      auto start = std::chrono::system_clock::now();
      for (int i = 0; i < 100000000; i++) {
         res1 += micro1(i, i + 1, i + 2);
      }
      auto end = std::chrono::system_clock::now();
      std::chrono::duration<double> time = end - start;  
      std::cout << "[time uncontended lock] " << time.count() << " [res] " << res1 << std::endl;
   }

   if (algo == 1 || algo == -1) {
      mem = 0;
      for (int i = 0; i < 100000000; i++) {
         res2 += micro2(i, i + 1, i + 2);
      }
      auto start = std::chrono::system_clock::now();
      for (int i = 0; i < 100000000; i++) {
         res2 += micro2(i, i + 1, i + 2);
      }
      auto end = std::chrono::system_clock::now();
      std::chrono::duration<double> time = end - start;  
      std::cout << "[time nolock] " << time.count() << " [res] " << res2 << std::endl;
   }
}

