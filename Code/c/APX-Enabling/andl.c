
#include <stdio.h>

int micro1(int b, int *c) {
   int a = 0;
   asm volatile(
      "andl %2, %1, %0 \n\t"
     : "=r"(a)
     : "r"(b) , "m"(*c)
     : "cc"
   );
   return a;
}

int micro2(int *b, int c) {
   int a = 0;
   asm volatile(
      "andl %2, %1, %0 \n\t"
     : "=r"(a)
     : "m"(*b) , "r"(c)
     : "cc"
   );
   return a;
}

int c = 4;
int b = 20;

int main() {
  printf("micro1 = %d\n", micro1(b, &c));
  return printf("micro2 = %d\n", micro2(&b, c));
}
