void micro() {
 asm volatile(
   "andnq %%r16, %%r17, %%r17 \n\t"
   "andnq %%r12, %%r13, %%r13 \n\t"
  : : : "%r13", "%r17", "%r12", "%r16"
 );
}
