
void micro () {
   asm volatile(
     //        SRC1   SRC2(NDS)   DST
     "vpaddd %%ymm12, %%ymm10, %%ymm30 \n\t"
      ::: "%ymm12", "%ymm10", "%ymm30"
  );
}

/*
   DST        = ymm30
   SRC2(NDS)  = ymm10
   SRC1       = ymm12

   8:	62 41 2d 28 fe f4    	vpaddd %ymm12,%ymm10,%ymm30
        Mandatory Prefix = 62
        P0               = 41 => 0100 0001 
        P1               = 2d => 0010 1101
        P2               = 28 => 0010 1000
        ModRM            = f4
            .MOD         = 11
            .REG         = 110
            .RM          = 100
        DST  = EVEX.R' + REX.R + ModRM.REG
               0'= 1   + 0' = 1 + 110 => 11110    => 30 (YMM30)
        SRC1 = EVEX.X  + EVEX.B + ModRM.RM
               0       + 0' = 1 + 100 => 1100     => 12 (YMM12)
        SRC2 = EVEX.V' + EVEX.VVVV
        (NDS)   1' = 0   2D[6:3]' = 0101' => 1010 => 10 (YMM10)
*/
