  #include "stdio.h"
/*
  int micro(long a, long b) {
     long res = 0;
     asm volatile (
       "movq %1 , %%rax \n\t"
       "movq %%rax , %%rbx \n\t"
       "movq %%rbx , %%rcx \n\t"
       "movq %%rcx , %%rdx \n\t"
       "movq %%rdx , %%rdi \n\t"
       "movq %%rdi , %%rsi \n\t"
       "movq %%rdi , %%r8 \n\t"
       "movq %%r8 , %%r9 \n\t"
       "movq %%r9 , %%r10 \n\t"
       "movq %%r10 , %%rax \n\t"
       "movq %%rax , %%rbx \n\t"
       "addq %2 , %%rbx \n\t"
       "movq %%rbx , %0 \n\t"
     : "=r"(res)
     : "r"(a) , "r"(b)
     : "%rax", "%rbx", "%rcx" ,"%rdx" , "%rdi", "%rsi" , "%r9" ,"%r8", "%r10", "%r11", "%r12", "%r13", "%r15"
     );
     return res;
  }
*/

  int micro(long a, long b) {
     return a + b;
  }

  int callee(int a, long b) {
     int t1 = a + b + 40;
     int t3 = micro(b , t1);
     int t2 = a + b + 40;
     return  t1 + t2 + t3; 
  }

  int main() {
    return printf("%d\n", callee(10,20)); 
  }
