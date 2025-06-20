
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/*
Timeline view:
Index     01234567

[0,0]     DeER . .   addq       %rcx, %rdx
             |       Dependency in flags [0,0]:ALL_FLAGS and [0,1]:ZF flag update need to merge SF/PF state. 
             V 
[0,1]     DeeeER .   bsrq       %rsi, %rax
              |Forwarding path transfer, triggers exeuction on dependent instruction before Retierment of previous instruction.
              V
[0,2]     D===eER.   movq       %rax, %rdx

[0,3]     D====eER   addq       %rdx, %rax
            |
            V No flag dependency, [0,4] modifies CF and [0,3] ALL FLAGS. CF is in seperate flag group and does not need to wait to merge other flags state in it set. 
[0,4]     DeE----R   incq       %rcx
[0,5]     D=eE---R   movq       %rcx, %rax

*/ 
long micro1(long a, long b, long c) {
   long res = 0;
   asm volatile (
      "addq %2, %1     \n\t" // ALL FLAGS
      "bsrq %3, %%rax  \n\t" // ZF (DEP ON SF, PF, AUX)
      "movq %%rax , %0 \n\t" 
    : "=r"(res)
    : "r"(a), "r"(b) , "r"(c)
    : "cc" , "%rax"
   );
   return res;
}

long micro2(long a, long b, long c) {
   long res = 0;
   asm volatile (
      "addq %2, %1     \n\t" // ALL FLAGS
      "incq %3         \n\t" // CF flag, no dep.
      "movq %3 , %0 \n\t" 
    : "=r"(res)
    : "r"(a), "r"(b) , "r"(c)
    : "cc" 
   );
   return res;
}

int main(int argc, char* argv[]) {
   if (argc != 2) {
      fprintf(stderr, "Incorrect Arguments! <app> <algo> \n");
      return -1;
   }

   long res = 0;
   int algo = atoi(argv[1]);
   if (algo == 0) {
      for (int i = 0; i < 10000000; i++) {
          res += micro1(10, 20, 30);
      }
   }
   
   if (algo == 1) {
      for (int i = 0; i < 10000000; i++) {
          res += micro2(10, 20, 30);
      }
   }
   return printf("[res] %ld", res);
}
