

__attribute__((noinline))
long micro(long in) {
  long out;
  asm volatile (
     "movq %1 , %%xmm0 \n\t"
     "movq %1 , %%xmm1 \n\t"
     "vpbroadcastd %%xmm0 , %%zmm2 \n\t"
     "vpbroadcastd %%xmm0 , %%zmm3 \n\t"
     //"vzeroupper \n\t"
     "paddd %%xmm2, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "paddd %%xmm3, %%xmm3 \n\t"
     "movq %%xmm3 , %0 \n\t"
     : "=r"(out)
     : "r"(in)
     : "%xmm0", "%xmm1" ,"%xmm2", "%xmm3" , "cc");
  return out;
}

int main() {
  long out = 0;
  for (int i = 0 ; i < 1; i++) 
  for (int j = 0 ; j < 1000*1000*10; j++)  {
      out += micro(i+j);
  }
  return out;
}

