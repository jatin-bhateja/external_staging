
void micro() {
  asm volatile(
   "addq $0xf, %%r17, %%r19 \n\t"
   :  :  : "%r16", "%r17", "%r19"
  );
}
