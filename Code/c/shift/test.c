
#include <stdio.h>

void micro1(short* dst, short* src, short* shift) {
   asm volatile(
      "vmovdqu %1, %%ymm1             \n\t"
      "vmovdqu %2, %%ymm2             \n\t"
      "vpsllvw %%ymm2, %%ymm1, %%ymm3 \n\t" 
      "vmovdqu %%ymm3, %0            \n\t"
     : "=m"(*dst)
     : "m"(*src) ,  "m"(*shift)
     : "%ymm1" , "%ymm2" ,"%ymm3"
   );
}

void micro2(short* dst, short* src, int shift) {
   asm volatile(
      "vmovdqu %1, %%ymm1            \n\t"
      "movd    %2, %%xmm2            \n\t"
      "vpsllw  %%xmm2, %%ymm1, %%ymm3 \n\t" 
      "vmovdqu %%ymm3, %0            \n\t"
     : "=m"(*dst)
     : "m"(*src) ,  "r"(shift)
     : "%ymm1" , "%ymm2" ,"%ymm3"
   );
}

void print_arr(const char* msg, short* arr, int len) {
  printf("%s", msg); 
  for (int i = 0; i < len; i++) {
     printf(" %x ", arr[i]);
  }
  printf("\n");
}

int main() {
  short src[] =  {
      -1, -1, -1, -1,
      -1, -1, -1, -1,
      -1, -1, -1, -1,
      -1, -1, -1, -1
  };

  short shift[] =  {
      0,  1,  2,  3,
      5,  6,  7,  7,
      8,  9,  10, 11,
      12, 13, 14, 15
  };

  short dst[16] = {'\0'};

  //micro1(dst, src, shift);
  micro2(dst, src, 7);

  print_arr("src   = ", src, 16);
  //print_arr("shift = ", shift, 16);
  printf("shift = %d\n", 7);
  print_arr("dst   = ", dst, 16);
  return 0;
}
