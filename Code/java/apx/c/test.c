#include <immintrin.h>
#include <stdio.h>
void clwb_example(void *address) {
  if (__builtin_cpu_supports("clwb")) _mm_clwb(address);
  else printf("CLWB instruction is not supported on this CPU.\n"); 
}
int main() {
  double data = 3;
  double *ptr = &data;
  printf("Original data: %lf\n", *ptr);
  clwb_example((void*)ptr);
  printf("Data after CLWB (potentially modified by other cores/devices): %lf\n", *ptr);
  return 0;
}
