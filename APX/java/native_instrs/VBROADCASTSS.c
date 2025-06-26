void micro() {
   asm volatile(
     "VBROADCASTSS (%%r12), %%ymm2 \n\t"
     : : : "%r12", "%ymm2"
   );
}
