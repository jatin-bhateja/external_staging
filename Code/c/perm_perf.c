#include <chrono>
#include <iostream>
#include <stdlib.h>
#include <string.h>

// 1B = 0001 1011
// INP_Q[0:3] = A B C D
// S1 : PERMQ 1B , INP_Q = [D C B A]
void micro1(long* res, long* src) {
   asm volatile (
     "vmovdqu %1, %%ymm1            \n\t"
     "vpermq  $0x1B, %%ymm1, %%ymm1 \n\t"
     "vmovdqu %%ymm1, %0            \n\t"
     : "=m"(*res)
     : "m"(*src)
     : "%ymm1"
   );
}


// INP_Q[0:3] = A B C D
// SLICE with fixed count
//
void micro2(long* res, long* src) {
   asm volatile (
     "vmovdqu %1, %%ymm1                        \n\t"
     "vpshufd $0x4E, %%ymm1, %%ymm1             \n\t"
     "vextractf128 $1, %%ymm1, %%xmm3           \n\t"
     "vinsertf128  $1, %%xmm1, %%ymm3 , %%ymm3  \n\t"
     "vmovdqu %%ymm3, %0                        \n\t"
     : "=m"(*res)
     : "m"(*src)
     : "%ymm1"
   );
}

void print_arr(long* arr, int len) {
  std::cout << "[res] ";
  for (int i = 0; i < len; i++) {
     std::cout << " " <<  arr[i] << " ";
  }
  std::cout << std::endl;
}

#define LENGTH 2048

int main(int argc, char* argv[]) {
  if (argc != 2) {
     return fprintf(stderr, "Incorrect Args! ./app <algo>\n");
  }
  int algo = atoi(argv[1]);
  long* src = (long*)malloc(sizeof(long) * LENGTH);
  for (int i = 0; i < LENGTH; i++) {
     src[i] = i;
  }
  long* res = (long*)malloc(sizeof(long) * LENGTH);

  if (algo == 0 || algo == -1) {
     for (int i = 0; i < 10000000; i++) {
        for (int j = 0; j < LENGTH; j+=4) {
           micro1(res + j, src + j);
        }
     }
     auto start = std::chrono::system_clock::now();
     for (int i = 0; i < 10000000; i++) {
        for (int j = 0; j < LENGTH; j+=4) {
           micro1(res + j, src + j);
        }
     }
     auto end = std::chrono::system_clock::now();
     std::chrono::duration<double> diff = end - start;
     std::cout << "[time micro1] "  << diff.count() << " ms ";
     print_arr(res, 16);
  }

  if (algo == 1 || algo == -1) {
     for (int i = 0; i < 10000000; i++) {
        for (int j = 0; j < LENGTH; j+=4) {
           micro2(res + j, src + j);
        }
     }
     auto start = std::chrono::system_clock::now();
     for (int i = 0; i < 10000000; i++) {
        for (int j = 0; j < LENGTH; j+=4) {
           micro2(res + j, src + j);
        }
     }
     auto end = std::chrono::system_clock::now();
     std::chrono::duration<double> diff = end - start;
     std::cout << "[time micro2] "  << diff.count() << " ms ";
     print_arr(res, 16);
  }
}
