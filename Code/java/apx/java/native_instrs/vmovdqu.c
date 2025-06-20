
void micro() {
  asm volatile (
     "vmovdqu 0x20(%%r17, %%r21, 8), %%ymm1 \n\t"
    : : : "%r17", "%r21", "%ymm1"
  );
}
