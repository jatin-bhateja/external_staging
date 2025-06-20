#include <stdio.h>
#include <iostream>
#include <chrono>

int micro1() {
  int val = 15360;
  int out = 0;
  asm volatile(            
    "andl $0xFFFF, %1 \n\t"
    "vmovd %1, %%xmm1 \n\t"
    "vaddss %%xmm1, %%xmm1, %%xmm0 \n\t"
    "vmovd %%xmm0, %0 \n\t"
  : "=r"(out), "+r"(val)
  :
  : "%xmm0", "%xmm1");
  return out;
}

int micro2() {
  int val = 15360;
  int out = 0;
  asm volatile(
    "movd %1, %%xmm0 \n\t"
    "vcvtph2ps %%xmm0, %%xmm0 \n\t"
    "vaddss %%xmm0, %%xmm0, %%xmm0 \n\t"
    "vcvtps2ph $0x4, %%xmm0, %%xmm0 \n\t"
    "movd %%xmm0, %%eax \n\t"
    "movswl %%ax, %%eax \n\t"
    "movl %%eax, %0  \n\t"
  : "=r"(out)
  : "r"(val)
  : "%xmm0", "%eax");
  return out;
}

int main(int argc, char * argv[]) {
  if (argc < 2) {
     std::cerr << "Incorrect arguments" << std::endl;
     return -1;
  }
  int res = 0;
  int algo = atoi(argv[1]);
  if ( algo == 0) {
    for(int i = 0; i < 100000000; i++) {
       res += micro1();
    }
    auto t1 = std::chrono::steady_clock::now();
    for(int i = 0; i < 2000000000; i++) {
       res += micro1();
    }
    for(int i = 0; i < 2000000000; i++) {
       res += micro1();
    }
    for(int i = 0; i < 2000000000; i++) {
       res += micro1();
    }
    for(int i = 0; i < 2000000000; i++) {
       res += micro1();
    }
    for(int i = 0; i < 2000000000; i++) {
       res += micro1();
    }
    auto t2 = std::chrono::steady_clock::now();
    std::chrono::duration<double> diff = t2 - t1;
    printf("[Time micro1] %lf  [Res] %d\n" , diff.count(), res);
  } else {
    for(int i = 0; i < 100000000; i++) {
       res += micro2();
    }
    auto t1 = std::chrono::steady_clock::now();
    for(int i = 0; i < 2000000000; i++) {
       res += micro2();
    }
    for(int i = 0; i < 2000000000; i++) {
       res += micro2();
    }
    for(int i = 0; i < 2000000000; i++) {
       res += micro2();
    }
    for(int i = 0; i < 2000000000; i++) {
       res += micro2();
    }
    for(int i = 0; i < 2000000000; i++) {
       res += micro2();
    }
    auto t2 = std::chrono::steady_clock::now();
    std::chrono::duration<double> diff = t2 - t1;
    printf("[Time micro2] %lf  [Res] %d\n" , diff.count(), res);
  }
}

