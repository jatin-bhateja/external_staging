
#include <stdint.h>
#include <stdio.h>

int main() {
  uint64_t val = 10;
  uint64_t res = 0;

/*  asm volatile (
     "subq $128 , %1 \n\t"
     "jge greater_than \n\t"
     "mov $2, %0 \n\t" 
     "jmp exit  \n\t"
     "greater_than: \n\t"
     "mov $1, %0 \n\t"
     "exit:"
   : "=r"(res), "+r"(val)
   : 
   : "cc"
  );
*/
  val -= 128;
  if (val > 128) 
    res = 2;
  else
    res = 1;
   
  printf("res = %ld\n", res);
  return res;
}
