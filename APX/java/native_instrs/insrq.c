
void pinsrq() {
  asm volatile (
     "pinsrq $1, %%r11 , %%xmm11 \n\t"
   : : : "%r11" , "%xmm11"
  );
}
