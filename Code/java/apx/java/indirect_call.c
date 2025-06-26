
void micro() {
   asm volatile (
       "call *%%r17 \n\t"
       "call *%%r15 \n\t"
     : : : "%r15", "%r17"
   );
}
