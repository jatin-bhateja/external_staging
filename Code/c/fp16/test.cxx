
#include <iostream>
#include <chrono>
#include <math.h>

double half = 0.5;
int tie_to_ninf_mxscr = 0x1FC0;
void micro1(long* res, double* src, int length) {
   for (int i = 0; i < length; i++) {
       asm volatile (
         "ldmxcsr %3  \n\t" 
         "vpxor %%xmm1, %%xmm1, %%xmm1 \n\t"
         "movq %1, %%xmm1 \n\t"
         "addsd %2, %%xmm1 \n\t" 
         //"roundsd $5, %%xmm1 , %%xmm1 \n\t" // ROUND = WILL perform rounding on floor(x + 0.5)
         "cvttsd2si %%xmm1, %0    \n\t"     // CVTT = absolute value of double (x + 0.5),  ROUND not needed.
         // Special cases for NaN, +/- Inf => 0x8000000000000000
        : "=r"(res[i])
        : "x"(src[i]), "x"(half), "m"(tie_to_ninf_mxscr)
        : "%xmm1", "cc"
       );
   }
}

template<typename T>
void print_arr(const char* msg, T* arr, int len) {
  std::cout << msg << " = ";
  for (int i = 0; i < len; i++) {
     std::cout << arr[i] << " , ";
  }
  std::cout << std::endl;
}

int main() {
   double src[] = {2.3, 2.5, 2.6, 0x1.0P-1, NAN, INFINITY, -INFINITY, 1.7976931348623157E308};
   int size = sizeof(src)/sizeof(double);
   long res[size];
   for (int i = 0; i < 100000000; i++) {
     micro1(res, src, size);
   }

   auto start = std::chrono::system_clock::now();
   for (int i = 0; i < 100000000; i++) {
     micro1(res, src, size);
   }
   auto stop = std::chrono::system_clock::now();
   std::chrono::duration<double> diff = stop - start;
   print_arr("src = ", src, size);
   print_arr("res = ", res, size);
   std::cout << "[time] " << diff.count() << std::endl;
}
