void micro() {
   asm volatile (
      "sfence"
     :  :  :
   );
}
