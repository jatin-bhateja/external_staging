void micro() {
   asm volatile (
      "cmovel %%r17d, %%eax \n\t"
      "cmovel %%edx, %%eax \n\t"
     : : : "%rax"
   );
}
