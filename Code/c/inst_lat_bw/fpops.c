#include "common.h"

int fp_instr  (__int64 iter)
{
	
#ifdef LINUX
	asm (
		"xor %1, %1\n\t"
		"LOOP_fpops1:\n\t"
		"inc %1\n\t"
		"addpd %%xmm1, %%xmm2\n\t"
		"cmp %0, %1\n\t"
		"jb LOOP_fpops1\n\t"
		::"r"(iter), "r"(0L): "xmm1", "xmm2");

#endif
	return 1; // dummy return
		
		
}
