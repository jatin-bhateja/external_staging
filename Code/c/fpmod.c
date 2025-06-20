
#include <stdio.h>
#include <stdlib.h>

int fpmod(float d1, float d2) {
  int res = 0;
  asm volatile(
     "vfpclassss $31, %1, %%k1 \n\t"
     "vfpclassss $31, %2, %%k2 \n\t"
     "kortestb %%k1, %%k2      \n\t"
     "jnz  special_case        \n\t" 
     "subq $4, %%rsp           \n\t"
     "movd %2, 0x0(%%rsp)      \n\t"
     "fld 0x0(%%rsp)           \n\t"
     "movd %1, 0x0(%%rsp)      \n\t"
     "fld 0x0(%%rsp)           \n\t"
     "movl $0xF7F, 0x0(%%rsp)  \n\t"
     "fldcw  0x0(%%rsp)        \n\t"
     "fprem                    \n\t"
     "movl $0x37F, 0x0(%%rsp)  \n\t"
     "fldcw  0x0(%%rsp)        \n\t"
     "fst 0x0(%%rsp)           \n\t"
     "movl 0x0(%%rsp), %0      \n\t"
     "addq $4, %%rsp           \n\t"
     "jmp done                 \n\t"
     "special_case:            \n\t"
     "movl $0x7ff00000, %0     \n\t"
     "done:                    \n\t"
    : "=r"(res)
    : "x"(d1), "x"(d2)
    : "%eax", "%k1" , "%k2"
  );
  return res;
}

int main(int argc, char * argv[]) {
  if (argc != 3) {
    fprintf(stderr, "Incorrect Args!\n");
    exit(-1);
  }
  float d1 = atof(argv[1]);
  float d2 = atof(argv[2]);
  return printf("%f mod %f = %d\n", d1, d2, fpmod(d1, d2));
}
