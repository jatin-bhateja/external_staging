

void func() {
  asm volatile (
      "movss 0x10(%%r11,%%r9), %%xmm15 \n\t"
      "movss 0x10(%%r17,%%r19), %%xmm15 \n\t"
    : : : "%r11", "%r9" , "%xmm15", "%r19", "%r17"
  );
}
