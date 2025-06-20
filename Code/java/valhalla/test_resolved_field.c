
#include <stdio.h>

int micro1(int flag) {
  int value = 0;
  asm volatile (
    "movl %1, %%eax \n\t"
    "shrl $3, %%eax \n\t"
    "andl $1, %%eax \n\t"
    "testl %%eax, %%eax \n\t"
    "jz done0       \n\t"
    "movl $1, %0    \n\t"
    "done0:         \n\t"
    : "+r"(value)
    : "r"(flag)
    : "%eax", "cc"
  );
  return value;
}

int micro2(int flag) {
  int value = 0;
  asm volatile (
    "movl %1, %%eax \n\t"
    "testl $8, %%eax   \n\t"
    "jz done1      \n\t"
    "movl $1, %0    \n\t"
    "done1:         \n\t"
    : "+r"(value)
    : "r"(flag)
    : "%eax", "cc"
  );
  return value;
}

int main() {
  int flag = 1 << 3;
  printf("value1 = %d\n", micro1(flag));
  printf("value2 = %d\n", micro2(flag));
  return 0;
}
