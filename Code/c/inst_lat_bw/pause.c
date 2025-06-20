#include "common.h"

int pause_instr (__int64 iter)
{
	
#ifdef LINUX
	asm (
		"xor %1, %1\n\t"
		"LOOP_pause:\n\t"
		"inc %1\n\t"
		"PAUSE\n\t"
		"cmp %0, %1\n\t"
		"jb LOOP_pause\n\t"
		::"r"(iter), "r"(0L));

#else

	__asm {
		xor rdx, rdx
		LOOP_pause:
		pause
		inc rdx
		cmp rdx, rcx
		jl LOOP_pause
	}
#endif
	return 1; // dummy return
		
		
}

