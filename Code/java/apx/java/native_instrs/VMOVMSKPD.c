void micro() {
  asm volatile (
     "vmovmskpd %%xmm2, %%r21 \n\t"
    : : : "%xmm2", "%r21"
  );
}
