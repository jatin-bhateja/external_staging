
    #include <stdio.h>

    void micro() {
       asm volatile (
          "addq %%r17, %%r17, %%r17 \n\t"
         : : : "%r17"
       );
    }
