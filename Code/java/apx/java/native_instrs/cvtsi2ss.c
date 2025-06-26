

void micro() {
  asm volatile (
     "cvtsi2ss %%r8, %%xmm0 \n\t"
     "vcvtsi2ss %%r8, %%xmm0, %%xmm0 \n\t"
    : : : "%r8", "%xmm0"
  );
}
