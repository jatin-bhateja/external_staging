

void micro() {
 asm volatile(
 "vpaddd 0x4(%%r17), %%xmm1, %%xmm11 \n\t"
  : : : "%r17" , "%xmm11"
 );
}
