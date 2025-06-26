

int micro() {
   int res1 = 10;
   int res2 = 20;
   int res3 = 0;
   asm volatile(
      "movl %1, %%eax \n\t"
      "movl %2, %%edx \n\t"
      "xchg %%ax , %%dx \n\t"
      "movl %%edx, %0 \n\t" 
      : "=r"(res3) 
      : "r"(res1), "r"(res2)
      : "%eax", "%edx"
   );
   return res3;
}

int main() {
  int res = 0;
  for (int i = 0; i < 100000; i++) {
     res += micro();
  }
  return res;
}
