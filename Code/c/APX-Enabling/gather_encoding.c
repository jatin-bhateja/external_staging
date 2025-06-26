
void micro() {
  asm volatile(
      "vpgatherdd %%ymm1, (%%rax, %%ymm3), %%ymm2 \n\t"   // AVX2-GATHER
      "vpgatherdd (%%rax, %%ymm15), %%ymm2 %{%%k1} \n\t"  // EVEX-GATHER
    ::: "%ymm31", "%ymm3", "%ymm2", "%ymm1"
  );
}

/*
   8:	c4 e2 75 90 14 18    	vpgatherdd %ymm1,(%rax,%ymm3,1),%ymm2
   
   e:	62 b2 7d 21 90 14 38 	vpgatherdd (%rax,%ymm31,1),%ymm2{%k1}
             SCALE   INDEX  BASE
 VSIB : 0x38 (00     111    000)
      BASE:                 RAX 
      VIDX:    EVEX.V’           +  EVEX.X +  sib.index
      YMM31 = (EVEX.V'(1) + EVEX.X(0) + SIB.INDEX(111)

 
   e:	62 f2 7d 29 90 14 38 	vpgatherdd (%rax,%ymm7,1),%ymm2{%k1}
       f2  1111 0010 (ymm7) EVEX.X
      EVEX.V = 29[4] = 1, EVEX.V' = 0
      YMM7 = (EVEX.V'(0) + EVEX.X(1) + SIB.INDEX(111))
   
   e:	62 b2 7d 29 90 14 38 	vpgatherdd (%rax,%ymm15,1),%ymm2{%k1}
       b2  1011 0010 -> EVEX.X = 0     YMM15 = 0 0 111 (EVEX.V'(0) + EVEX.X(0) + SIB.INDEX(111)
       EVEX.V = 29[4] = 1, EVEX.V'= 0

   EVEX.X => To pick Compliment notation while computing encoding.
*/

