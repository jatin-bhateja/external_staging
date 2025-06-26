
void micro() {
   asm volatile (
     "shldl %%r17d, %%r17d, %%r29d \n\t"
     "shldl $1, %%r11d, %%r11d \n\t"
   : : : "%r17", "%r11" 
   );
}
