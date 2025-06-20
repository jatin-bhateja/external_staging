

void pack_shuffle(int * res, long * src) {
   asm volatile(
      "vpxor %%ymm0, %%ymm0, %%ymm0 \n\t"
      "vmovdqu %1,  %%ymm1 \n\t"
      "vextractf128 $0x1, %%ymm1, %%xmm2 \n\t"
      "vshufps $0x88, %%ymm2, %%ymm1, %%ymm1 \n\t"
      "movdqu %%xmm1, %0"
     : "=m"(*res)
     : "m"(*src)
     : "%ymm0", "%ymm1" , "%xmm2"
  );
}

long src[] = { 0x00000000FFFFFFFFL, 0x00000000FFFFFFFFL, 0x00000000AAAAAAAAL, 0x00000000AAAAAAAAL };
int res[4];

int main() {
   pack_shuffle(res, src);
}

