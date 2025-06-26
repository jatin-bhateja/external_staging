
void micro() {
   asm volatile ("VPSLLQ  $54, %%xmm7, %%xmm7 \n\t"  : : : "%xmm7");
}
