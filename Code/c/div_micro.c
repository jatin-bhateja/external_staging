
#include <chrono>
#include <iostream>

float micro1(int dividend) {
   float res = 5.0;
   asm volatile(
      "movl %1, %%eax \n\t"
      "cvtsi2sd %%eax, %%xmm0 \n\t"
      "divps %%xmm0 , %0  \n\t"
     : "=x"(res) 
     : "r"(dividend)
   );
   return  res;
}

float micro2(int dividend) {
   float res = 5.0;
   asm volatile(
      "movl %1, %%eax \n\t"
      "cvtsi2sd %%eax, %%xmm0 \n\t"
      "vdivps %%xmm0 , %0, %0  \n\t"
     : "=x"(res) 
     : "r"(dividend)
   );
   return  res;
}

int main(int argc, char* argv[]) {
   int algo = atoi(argv[0]);
   if (algo == 0) {
      float res = 0.0f;
      for (int i = 0; i < 1000000000; i++) {
          res += micro1(2.0f); 
      }
      auto start = std::chrono::steady_clock::now();
      for (int i = 0; i < 1000000000; i++) {
          res += micro1(2.0f); 
      }
      auto end = std::chrono::steady_clock::now();
      std::chrono::duration<double> diff = end - start;
      std::cout << "[time] "  << diff.count() << "  [res] " << res << std::endl;
   } else {
      float res = 0.0f;
      for (int i = 0; i < 1000000000; i++) {
          res += micro2(2.0f); 
      }
      auto start = std::chrono::steady_clock::now();
      for (int i = 0; i < 1000000000; i++) {
          res += micro2(2.0f); 
      }
      auto end = std::chrono::steady_clock::now();
      std::chrono::duration<double> diff = end - start;
      std::cout << "[time] "  << diff.count() << "  [res] " << res << std::endl;
   }
   return 0; 
}
