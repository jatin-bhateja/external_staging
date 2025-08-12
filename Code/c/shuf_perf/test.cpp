
#include <chrono>
#include <iostream>
#include <stdlib.h>

void micro1(char* dst, char* src, char* shuf) {
   asm volatile(
     "vmovdqu %1, %%ymm1 \n\t"
     "vmovdqu %2, %%ymm2 \n\t"
     "vpshufb %%ymm2, %%ymm1, %%ymm0 \n\t"
     "vmovdqu %%ymm0, %0 \n\t"
   : "=m"(*dst)
   : "m"(*src), "m"(*shuf)
   : "%ymm0", "%ymm1", "%ymm2");
}

void micro2(char* dst, char* src, char* shuf) {
   asm volatile(
     "vmovdqu8 %1, %%ymm16 \n\t"
     "vmovdqu8 %2, %%ymm17 \n\t"
     "vpshufb %%ymm17, %%ymm16, %%ymm20 \n\t"
     "vmovdqu8 %%ymm20, %0 \n\t"
   : "=m"(*dst)
   : "m"(*src), "m"(*shuf)
   : "%ymm20", "%ymm16", "%ymm17");
}


int main(int argc, char* argv[]) {
  using fptr = void (*)(char*, char*, char*);
  if (argc != 2) {
    std::cerr<< "APP <bm_id>" << std::endl;
    return -1;
  }
  int bm_id = atoi(argv[1]);

  char src[] = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
    'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
    '0', '1', '2', '3', '4', '5', '6', '7', '8',
    '9', 'a', 'b', 'c', 'd'
  };
  char shuf[] = {
    (char)7, (char)6, (char)5, (char)4, (char)3, (char)2, (char)1, (char)0,
    (char)7, (char)6, (char)5, (char)4, (char)3, (char)2, (char)1, (char)0,
    (char)7, (char)6, (char)5, (char)4, (char)3, (char)2, (char)1, (char)0,
    (char)7, (char)6, (char)5, (char)4, (char)3, (char)2, (char)1, (char)0,
  };
  char dst[32];
  
  fptr bm = bm_id == 0 ? micro1 : micro2;
  for (int i = 0; i < 900000000; i++) {
     bm(dst, src, shuf);  
  }

  auto t1 = std::chrono::high_resolution_clock::now();
  for (int i = 0; i < 900000000; i++) {
     bm(dst, src, shuf);  
  }
  auto t2 = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> diff = t2 - t1;
  std::cout << "[time] " << diff.count() << "ns" << std::endl;
  return 0;
}
