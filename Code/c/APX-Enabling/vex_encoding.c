

void micro1() {
  asm volatile (
    "vpaddd %%ymm2, %%ymm1, %%ymm0 \n\t"
    : : : "%ymm0" , "%ymm1", "%ymm2" 
  );
}

/*
     c5 f5 fe c2  vpaddd %ymm2,%ymm1,%ymm0
     B0             : c5 -> 2 byte prefix.
     B1             : f5
                    : 1111 0101
                        : VEX.R    = 1    -> effective -> 1' = 0 (extension bit for Mod.REG)
                        : VEX.VVVV = 1110 -> effective -> 1110' = 0001  (NDS, first operand) -> YMM1
                        : VEX.L    = 1    -> 256 bit 
                        : VEX.PP   = 01   -> 0x0F (escape prefix)
     Primary Opcode : fe
     ModRM          : c2
                    : 1100 0010
                    : Mod = 11  -> Register addressing mode for Mod.RM.
                    : REG = 000 -> Second Operand -> YMM0
                    : RM  = 010 -> Destination    -> YMM2 

   Notes:
         Vex encoded instruction need a 3 byte prefix is one of the operand use SIB encoding (for memory operand)
*/

void micro2() {
  asm volatile (
    "shlxq %%r10, %%r9, %%r8 \n\t"
    : : : "%r10" , "%r9", "%r8"
  );
}

/*
    c4 42 a9 f7 c1  shlx  %r10,%r9,%r8
    B0              : c4 -> 3 byte prefix.
    B1              : 42 
                      0100 0010
                      VEX.R = 0       -> effective -> 0' = 1 (extension bit for Mod.REG)
                      VEX.X = 1       -> effective -> 1' = 0 (extension bit for SIB.INDEX) 
                      VEX.B = 0       -> effective -> 0' = 1 (extension bit for SIB.BASE) 
                      VEX.MAP = 00010 -> 0F_38
    B2              : a9
                      1010 1001
                      VEX.W     = 1       -> 64 bit 
                      VEX.VVVV  = 0101    -> effective 0101' -> 1010 = R10  (second operand) 
                      VEX.L     = 0       -> 128 bit 
                      VEX.PP    = 01      -> 66
    Primary Opcode  : f7
    ModRM           : c1
                      1100 0001
                      Mod = 11  -> Register addressing mode for Mod.RM
                      REG = 000 -> effective register encoding  = VEX.R + ModRM.REG = 1000 -> R8 (destination)
                      RM  = 001 -> effective register encoding  = VEX.B + ModRM.RM = 1001  -> R9 (first operand)

   -  EGPR operand need EVEX promotion to accomodate RM, REG and VVVV entension bit.
   -  Three byte prefix is must to accomodate R8-R15 registers in destination / first source operand.
*/

void micro3() {
  asm volatile (
    "shlxq %%rcx, %%rbx, %%rax \n\t"
    : : : "%rcx" , "%rbx", "%rax" 
  );
}

/*
  c4 e2 f1 f7 c3       	shlx   %rcx,%rbx,%rax

*/

void micro4() {
   asm volatile(
      "imul %%r10, %%r15 \n\t"
     : : : "%r10", "%r15"
   );
}

void micro5() {
   asm volatile(
      "shlq $10, %%r15 \n\t"
     : : : "%r10", "%r15"
   );
}
