#include "common.h"

int lock_instr (char *addr, __int64 len, __int64 iter)
{

#ifdef LINUX
#if 0
	asm volatile (
		"mov %0, %4 \n\r" // save start of buffer in reg %4
		"xor %3, %3 \n\r"
	"start44: \n\r"
		"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
		"xor %5, %5 \n\r"
	"loop44: \n\r"
		"lock add $1, (%0) \n\r"
		"add $0x40, %0 \n\r"
		"add $0x40, %5 \n\r"
		"add $1, %3 \n\r"
		"cmp %2, %3 \n\r"
		"jae end44 \n\r"
		"cmp %1, %5 \n\r"
		"jl loop44 \n\r"
		"jmp start44 \n\r"
	"end44: \n\r"
	 :: "r"(addr),"r"(len),"r"(iter),"r"(0L),"r"(0L),"r"(0L));
#endif
	asm volatile (
		"xor %3, %3 \n\r"
	"loop44: \n\r"
		"lock add $1, (%0) \n\r"
		"add $1, %3 \n\r"
		"cmp %2, %3 \n\r"
		"jb loop44 \n\r"
	"end44: \n\r"
	 :: "r"(addr),"r"(len),"r"(iter),"r"(0L),"r"(0L),"r"(0L));
#else
// windows version
	__asm {
		mov rcx, addr
		mov rdx, len
		mov r8, iter
		xor r9, r9	// iteration count
	start44:
		mov r10, rcx // r10 buffer address
		xor r11, r11 // r11 - length of buffer accessed so far
	loop44:
		lock add [r10], 1
		add r10, 40h
		add r9, 1
		add r11, 40h
		cmp r9, r8
		jae end44
		cmp r11, rdx
		jl loop44
		jmp start44
	end44:
	}
#endif
	return 1; // dummy return
		
		
}


