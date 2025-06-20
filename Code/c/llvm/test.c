
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

bool unsigned_add_overflow1(uint32_t a, uint32_t b) {
  return ((a & b) | ((a | b) & ~( a + b))) >> 31 == 1;
}

bool unsigned_add_overflow2(uint32_t a, uint32_t b) {
  return ((a + b) < (a | b));
}

int main() {
   printf("res1 = %d \n", unsigned_add_overflow1(-1, 0));
   return printf("res2 = %d \n", unsigned_add_overflow2(-1U, 1U));
}
