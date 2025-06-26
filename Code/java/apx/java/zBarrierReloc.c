void micro() {
 asm volatile (
   "shlq $10, %%r15 \n\t"
   "shlq $10, %%r17 \n\t"
  : : :
 );
}
