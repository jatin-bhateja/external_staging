
void micro(){
   asm volatile(
      "shlq $1, %%r11    \n\t"
      "shlq %%r11        \n\t"
      "shlq %%cl, %%r11 \n\t"
  :  :  : "%r11", "%rcx"
   );
}
