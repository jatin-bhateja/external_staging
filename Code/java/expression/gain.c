  #include <iostream>
  #include "iacaMarks.h"

  #define SIZE 16

  static int VALUE = 5;

  __attribute__((noinline))
  static void workload(int * r, int * a, int * b) {
     __asm__ volatile (
        " movl $111, %%ebx \n\t"
        "  .byte 0x64, 0x67, 0x90 \n\t"
        " vmovdqu64 %1 , %%zmm1  \n\t"
        " vpandd  %2, %%zmm1 , %%zmm2  \n\t"
        " vpord   %2, %%zmm1 , %%zmm3  \n\t"
        " vpxord   %%zmm2, %%zmm3 , %%zmm3  \n\t"
        " vmovdqu64 %%zmm3 , %0 \n\t"
        " movl $222, %%ebx \n\t"
        "  .byte 0x64, 0x67, 0x90 \n\t"
       :"=m"(*r)
       :"m"(*a), "m"(*b)
       : "%zmm1", "%zmm2" , "%zmm3", "%ebx"
     );
  }

  __attribute__((noinline))
  static void workload_opt(int * r, int * a, int * b) {
     __asm__ volatile (
        " movl $111, %%ebx \n\t"
        "  .byte 0x64, 0x67, 0x90 \n\t"
        " vmovdqu64 %1 , %%zmm1  \n\t"
        " vmovdqu64 %2 , %%zmm2  \n\t"
        " vpternlogd $0x3c, %%zmm1, %%zmm2 , %%zmm1  \n\t"
        " vmovdqu64 %%zmm1 , %0 \n\t"
        " movl $222, %%ebx \n\t"
        "  .byte 0x64, 0x67, 0x90 \n\t"
       :"=m"(*r)
       :"m"(*a), "m"(*b)
       : "%zmm1", "%zmm2" , "%ebx"
     );
  }

  int main() {
     int * a =  new int[SIZE];
     int * b = new int[SIZE];
     int * c = new int[SIZE];
     int * r = new int[SIZE];

     for (int i = 0 ; i < SIZE; i++)
        a[i] = 7;
     for (int i = 0 ; i < SIZE; i++)
        b[i] = 2;
     for (int i = 0 ; i < SIZE; i++)
        c[i] = 1;
     
     workload(r, a, b);
     //for (int i = 0 ; i < SIZE; i++)
     //  std::cout << "Res =  " << r[i] << std::endl; 

     workload_opt(r, a, b);
     
     //for (int i = 0 ; i < SIZE; i++)
     //  std::cout << "Res =  " << r[i] << std::endl; 
  }
