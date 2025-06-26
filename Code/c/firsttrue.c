
#include "stdlib.h"
#include "stdio.h"

int main(int argc, char * argv[] ) {
   long val = atol(argv[1]);
   long res = 0;
   asm volatile (
     //"lzcnt %1 , %0 \n\t"
     "bsrq %1 , %0 \n\t"
    : "=r"(res) : "r"(val) :
   );
   return printf("Res = %ld\n", res); 
} 
