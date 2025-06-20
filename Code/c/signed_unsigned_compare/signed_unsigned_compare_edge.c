
#include <stdio.h>

void test_signed_unsigned_edge_case() {
  int res = 0;
  unsigned int val = 0xFFFFFFFF;  // -1 (signed)
  asm volatile (
     "xorl  %%edx, %%edx       \n\t"
     "movl  $2147483647, %%ecx \n\t"
     "cmpl  %%ecx, %1          \n\t"  // %1 - %%ecx, sets flags = RES =   US (above) > 0 for S (greater) < 0
     "movl  $1 , %%eax         \n\t"
     "cmovg %%edx, %%eax       \n\t"
     "movl  %%eax , %0         \n\t" 
    : "=r"(res)
    : "r"(val)
    : "cc" , "%eax" , "%ecx", "%edx"
  );
  printf("res = %d\n", res);
}

int main() {
  test_signed_unsigned_edge_case();
}
