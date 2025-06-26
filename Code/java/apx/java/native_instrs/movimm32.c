

void func() {
   asm volatile (
      "movq $32, %%r17  \n\t"
      "movl $32, %%r17d  \n\t"
      "movq $32, %%rax  \n\t"
      "movl $32, %%eax  \n\t"
     : : :"%rax" , "%r17"
   );
}
