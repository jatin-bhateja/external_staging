
void func() {
   asm volatile (
      "xorq %%r19, %%r20 \n\t"
      "xorq %%r9, %%r11 \n\t"
     : : : "%r9" , "%r19" , "r11", "%r20"  
   );
}
