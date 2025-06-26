
void micro() {
  asm volatile(
   "movq %%r17, %%r20 \n\t"
   "movq %%r11, %%r12 \n\t"
   "cmoveq %%r11, %%r12 \n\t"
   "cmoveq %%r11, %%r12, %%r17 \n\t"
  : : : "%r11", "%r12", "%r17", "%r20"
  );
}
