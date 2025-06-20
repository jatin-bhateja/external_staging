
void micro() {
  char val = 0x1;
  asm volatile(
     "setzuz %0         \n\t"
     "setzul %0         \n\t"
     "setzunz %0         \n\t"
     : "+r"(val) : : "cc"
  );
}
