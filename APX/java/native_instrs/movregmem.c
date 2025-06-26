

void func() {
   asm volatile  (
      "movq` 0x10(%r17,%t19) , %r24 \n\t"
      "movq 0x10(%r11,%t9) , %rax \n\t"
     : : : "%r11", "%r19" ,"%r7"
   
   );

}
