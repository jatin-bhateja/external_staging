void func() {
   asm volatile(
      "movl $10, %%eax \n\t"
      "movl $10, %%r17d \n\t"
    : : : "%rax", "%r17"
   );
}
