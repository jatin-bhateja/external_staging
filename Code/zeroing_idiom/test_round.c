
#include <stdio.h>
#include <string.h>
#include <chrono>
#include <iostream>

double arr[2] = {1.2, 3.4};

// Hypothetical test, where we do 128 bit loads and perform 64 bit operation.

// True depedence RAW b/w instructions, inhebit parallel dispatch.
__attribute__((noinline))
double micro1(int i) {
  double res = 0.0;
  asm volatile (
     "movdqu %1, %%xmm1             \n\t"
     "vroundsd $0, %%xmm1, %%xmm1, %%xmm1 \n\t"
     "movq  %%xmm1, %0              \n\t"
    : "=r"(res)
    : "m"(arr[0]) 
    : "%xmm1"
  );
  return res * i;
}

__attribute__((noinline))
double micro2(int i) {
  double res = 0.0;
  asm volatile (
     "movdqu %1, %%xmm2             \n\t"
     "vroundsd $0, %%xmm1, %%xmm1, %%xmm1 \n\t"
     "movq  %%xmm1, %0              \n\t"
    : "=r"(res)
    : "m"(arr[0])
    : "%xmm1" , "%xmm2"           
  );
  return res * i;
}

int main(int argc, char * argv[]) {
  if (argc < 3) {
     return -1;
  }
  double res = 1.0;
  int iter = atoi(argv[1]);
  int algo = atoi(argv[2]);
  if (algo == 0) {
    auto start = std::chrono::steady_clock::now();
    for (int i = 0; i < iter; i++) {
      for (int j = 0; j < iter; j++) {
         res += micro1(j);
      }
    }
    auto end = std::chrono::steady_clock::now();
    std::chrono::duration<double> diff = end - start;
    std::cout << "[micro1 X1X1X1 time] " << diff.count() << " [res] " << res << std::endl;
  } else { 
    auto start = std::chrono::steady_clock::now();
    for (int i = 0; i < iter; i++) {
      for (int j = 0; j <  iter; j++) {
         res += micro2(j);
      }
    }
    auto end = std::chrono::steady_clock::now();
    std::chrono::duration<double> diff = end - start;
    std::cout << "[micro2 X2X2X1 time] " << diff.count() << " [res] " << res << std::endl;
  }
  return 0;
}

