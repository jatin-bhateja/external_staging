
#include <chrono>
#include <iostream>
#include <string>

double micro1(int src) {
   double res = 0.0;
   asm volatile (
      // SSE encoded instructions preserve upper 128 bit lanes of
      // the destination vector there by incurring addition merging
      // penalty.
      //"vpxor %%xmm1, %%xmm1, %%xmm1 \n\t"
      "vpcmpeqq %%xmm2, %%xmm2, %%xmm2 \n\t"
      "cvtsi2sd %1, %%xmm1             \n\t"
      "divsd %%xmm1, %%xmm2            \n\t"
      "movq %%xmm2, %0                 \n\t"
     : "+x"(res)
     : "r"(src)
     : "%xmm1"
   );
   return res;
}

double micro2(int src) {
   double res = 0.0;
   asm volatile (
      "vpcmpeqq %%xmm2, %%xmm2, %%xmm2 \n\t"
      "vcvtsi2sd %1, %%xmm2, %%xmm1    \n\t"
      "vdivsd %%xmm1, %%xmm2, %%xmm2   \n\t"
      "movq %%xmm2, %0                 \n\t"
     : "+x"(res)
     : "r"(src)
     : "%xmm1"
   );
   return res;
}


int main(int argc, char* argv[]) {
   if (argc != 2) {
      std::cerr << "Incorrect Arguments " << std::endl;
      return -1;
   }
   
   double res = 0.0f;
   using micro_ptr = double (*) (int); 
   micro_ptr bm = nullptr;
   int algo = atoi(argv[1]);
   if (algo == 0) {
      bm = micro1; 
   } else {
      bm = micro2;
   }
   for (int i = 0;  i < 100000000; i++) {
       res += bm(i); 
   }
   auto start = std::chrono::steady_clock::now();
   for (int i = 0;  i < 900000000; i++) {
       res += bm(i); 
   }
   auto end = std::chrono::steady_clock::now();
   std::chrono::duration<double> time = end - start;
   std::cout << "[time] " << time.count() << " [res] " << res << std::endl;
   return 0;
}
