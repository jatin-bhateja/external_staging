
void micro() {
  asm volatile (
     "vcvtsd2ss 0x20(%%r17, %%r21, 0x8), %%xmm1, %%xmm0 \n\t"
    : : : "%r17", "%r21", "%xmm0" , "%xmm1"
  );
}
