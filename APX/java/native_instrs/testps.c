

void micro() {
  asm volatile (
     "vtestps 0x20(%%r17, %%r21, 0x8), %%xmm1 \n\t"
    : : : "%r17", "%r21", "%xmm1"
  );
}
