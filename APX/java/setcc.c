void micro() {
  asm volatile (
     "setzunz %%al"
   : : : "cc"
  );
}
