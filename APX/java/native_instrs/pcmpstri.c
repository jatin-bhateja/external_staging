
/*
       
4:	66 45 0f 3a 63 5b 04 01	pcmpistri $0x1,0x4(%r11),%xmm11
  SIMD PREFIX : 66
  REX : 45
  OPCODE MAP : 0F 3A
  OPCODE 63
  SIB: 5B
  DISP: 4
  IMM: 1

CPROMPT>xed -64 -d 66 45 0f 3a 63 5b 04 01
66450F3A635B0401
ICLASS:     PCMPISTRI
CATEGORY:   SSE
EXTENSION:  SSE4
IFORM:      PCMPISTRI_XMMdq_MEMdq_IMMb
ISA_SET:    SSE42
ATTRIBUTES: 
SHORT:      pcmpistri xmm11, xmmword ptr [r11+0x4], 0x1

     " vpcmpistri $1, 0x4(%%r17), %%xmm11 \n\t"
pcmpstri.c:26: Error: no EVEX encoding for `vpcmpistri'

Notes: This is anyways going to phased out with AVX10.

CPROMPT>gcc -c -mapxf -mno-avx  -mno-avx512f pcmpstri.c 
pcmpstri.c: Assembler messages:
pcmpstri.c:31: Error: extended GPR cannot be used as base/index for `pcmpistri'


*/

void pinsrq() {
  asm volatile (
     " vpcmpistri $1, 0x4(%%r17), %%xmm11 \n\t"
   : : : "%r17" , "%xmm11"
  );
}
