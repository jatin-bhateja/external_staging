
#include <stdio.h>

// lanewise(VectorOperators.ROL, 7);       // shift immediate
// lanewise(VectorOperators.ROL, shift);   // shift variable scalar = BCAST
// lanewise(VectorOperators.ROL, shiftv);  // shift vector          = 
void micro1(short* dst, short* src, int shift) {
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

  short shift = 7;
  short dst[16] = {'\0'};

  micro1(dst, src, shift);

  print_arr("src   = ", src, 16);
  print_arr("shift = ", shift, 16);
  print_arr("dst   = ", dst, 16);
  return 0;
}
