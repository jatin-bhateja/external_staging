#include "common.h"

int movnti_instr (char *dst, __int64 len, __int64 iter)
{

#ifdef LINUX
// %3 overall count to match iter
	asm volatile (
		"mov %0, %4 \n\r" // save start of buffer in reg %4
		"xor %3, %3 \n\r"
	"start11: \n\r"
		"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
		"xor %5, %5 \n\r"
	"loop11: \n\r"
		"movnti %1, (%0) \n\r"
		"movnti %1, 0x8(%0) \n\r"
		"movnti %1, 0x10(%0) \n\r"
		"movnti %1, 0x18(%0) \n\r"
		"movnti %1, 0x20(%0) \n\r"
		"movnti %1, 0x28(%0) \n\r"
		"movnti %1, 0x30(%0) \n\r"
		"movnti %1, 0x38(%0) \n\r"
		"movnti %1, 0x40(%0) \n\r"
		"movnti %1, 0x48(%0) \n\r"
		"movnti %1, 0x50(%0) \n\r"
		"movnti %1, 0x58(%0) \n\r"
		"movnti %1, 0x60(%0) \n\r"
		"movnti %1, 0x68(%0) \n\r"
		"movnti %1, 0x70(%0) \n\r"
		"movnti %1, 0x78(%0) \n\r"
		"add $0x80, %0 \n\r"
		"add $2, %3 \n\r"
		"add $0x80, %5 \n\r"
		"cmp %2, %3 \n\r"
		"jae end11 \n\r"
		"cmp %1, %5 \n\r"
		"jl loop11 \n\r"
		"jmp start11 \n\r"
	"end11: \n\r"
	 :: "r"(dst),"r"(len),"r"(iter),"r"(0L),"r"(0L),"r"(0L));
#else
// windows version
	__asm {
		mov rcx, dst
		mov rdx, len
		mov r8, iter
		xor r9, r9	// iteration count
	start22:
		mov r10, rcx // r10 buffer address
		xor r11, r11 // r11 - length of buffer accessed so far
	loop22:
		movnti [r10], r8
		movnti [r10+8h], r8
		movnti [r10+10h], r8
		movnti [r10+18h], r8
		movnti [r10+20h], r8
		movnti [r10+28h], r8
		movnti [r10+30h], r8
		movnti [r10+38h], r8
		movnti [r10+40h], r8
		movnti [r10+48h], r8
		movnti [r10+50h], r8
		movnti [r10+58h], r8
		movnti [r10+60h], r8
		movnti [r10+68h], r8
		movnti [r10+70h], r8
		movnti [r10+78h], r8
		add r10, 80h
		add r9, 2
		add r11, 80h
		cmp r9, r8
		jae end22
		cmp r11, rdx
		jl loop22
		jmp start22
	end22:
	}
	
#endif		
			 
	return 1; // dummy return
		
}

int repsto_instr (char *dst, __int64 len, __int64 iter)
{
	__int64 cnt;
	for (cnt=0; cnt < iter; cnt++) {

#ifdef LINUX
	asm volatile (
		"mov $1, %%rax \n\r"
		"mov %0, %%rdi \n\r"
		"mov %1, %%rcx \n\r"
		"rep stosb \n\t"
	 :: "r"(dst),"r"(len):"rax","rdi","rcx");
#else
	__asm {
		mov rax, 1
		mov rdi, dst
		mov rcx, len
		rep stosb
	}
#endif
	}
	return 1; // dummy return
		
		
}

int repmov_instr (char *dst, char *src, __int64 len, __int64 iter)
{
	__int64 cnt;
	__int64 dw_len = len/4;
	for (cnt=0; cnt < iter; cnt++) {

#ifdef LINUX
	asm volatile (
		"mov $1, %%rax \n\r"
		"mov %2, %%rsi \n\r"
		"mov %0, %%rdi \n\r"
		"mov %1, %%rcx \n\r"
		"rep movsd \n\t"
	 :: "r"(dst),"r"(dw_len), "r"(src):"rax","rdi","rsi","rcx");
#else
	__asm {
		mov rax, 1
		mov rdi, dst
		mov rsi, src
		mov rcx, dw_len
		rep movsd
	}
#endif
	}
	return 1; // dummy return
		
		
}
int load_store_mixed(char *src1, char *src2, __int64 len, __int64 ratio, __int64 iter)
{
	len -= 1024;
#ifdef LINUX
		    asm volatile (
			"xor %7, %7 \n\r" // %7 temp counter for total # of iterations
		"start577: \n\r"
			"mov %0, %5 \n\r" // save load buffer in reg %5
			"mov %3, %6 \n\r" // save store buffer in reg %6
			"xor %4, %4 \n\r" // buffer length accessed so far in %4
		"loop577: \n\r"
			"mov %8, %9 \n\r" // %8 is ld_st_ratio
			
		"load_more: \n\r"
			"movdqa (%5), %%xmm0 \n\r"
			"add $0x40, %5 \n\r"
			"add $0x40, %4 \n\r"
			"add $1, %7 \n\r"
			"dec %9 \n\r"
			"jnz load_more \n\r"
		
			"movdqa %%xmm1, (%6) \n\r"
			"add $0x40, %6 \n\r"

			"cmp %2, %7 \n\r" 
			"jae end577 \n\r"
			"cmp %1, %4 \n\r"  
			"jl loop577 \n\r"
			"jmp start577 \n\r"
		"end577: \n\r"
			 :: "r"(src1),"r"(len),"r"(iter),"r"(src2), "r"(0L),"r"(0L),"r"(0L), "r"(0L),"r"(ratio), "r"(0L));
#else
	printf("Not implemented on windows\n");
#endif

	return 1; // dummy return
		
	
}

int my_memcpy (char *dst, char *src, __int64 len, __int64 iter)
{
	__int64 cnt;
	for (cnt=0; cnt < iter; cnt++) {

#ifdef LINUX
	asm volatile (
		"xor %%rax, %%rax \n\r"
		"Loop27: \n\r"
		"vmovdqa (%2), %%ymm0\n\r"
		"vmovdqa 0x20(%2), %%ymm1\n\r"
		"vmovdqa 0x40(%2), %%ymm2\n\r"
		"vmovdqa 0x60(%2), %%ymm3\n\r"
		"vmovdqa 0x80(%2), %%ymm4\n\r"
		"vmovdqa 0xa0(%2), %%ymm5\n\r"
		"vmovdqa 0xc0(%2), %%ymm6\n\r"
		"vmovdqa 0xe0(%2), %%ymm7\n\r"
		"vmovntdq %%ymm0, (%0) \n\r"
		"vmovntdq %%ymm1, 0x20(%0) \n\r"
		"vmovntdq %%ymm2, 0x40(%0) \n\r"
		"vmovntdq %%ymm3, 0x60(%0) \n\r"
		"vmovntdq %%ymm4, 0x80(%0) \n\r"
		"vmovntdq %%ymm5, 0xa0(%0) \n\r"
		"vmovntdq %%ymm6, 0xc0(%0) \n\r"
		"vmovntdq %%ymm7, 0xe0(%0) \n\r"
		"add $0x100, %0\n\r"
		"add $0x100, %2\n\r"
		"add $0x100, %%rax\n\r"
		"cmp %1, %%rax\n\r"
		"jb Loop27 \n\r"
	 :: "r"(dst),"r"(len), "r"(src):"ymm0","ymm1","ymm2","ymm3","ymm4","ymm5","ymm6","ymm7","rax");
#else
	printf("Not implemented\n");
#endif
	}
	return 1; // dummy return
		
		
}

int glibc_memcpy (char *dst, char *src, __int64 len, __int64 iter)
{
	__int64 cnt;
	for (cnt=0; cnt < iter; cnt++) {

#ifdef LINUX
		memcpy(dst, src, len);
#else
		printf("Not implemented\n");
#endif
	}
	return 1; // dummy return
		
		
}

int temporal_stores_instr (char *addr, __int64 len, __int64 iter)
{
#ifdef LINUX
		    asm volatile (
			"mov %0, %4 \n\r" // save start of buffer in reg %4
			"xor %3, %3 \n\r"
			"start57: \n\r"
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop57: \n\r"
			"movdqa %%xmm0, (%0) \n\r"
			"movdqa %%xmm0, 0x10(%0) \n\r"
			"movdqa %%xmm0, 0x20(%0) \n\r"
			"movdqa %%xmm0, 0x30(%0) \n\r"
			"add %6, %0 \n\r"
			"add %6, %5 \n\r"
			"movdqa %%xmm0, (%0) \n\r"
			"movdqa %%xmm0, 0x10(%0) \n\r"
			"movdqa %%xmm0, 0x20(%0) \n\r"
			"movdqa %%xmm0, 0x30(%0) \n\r"
			"add %6, %0 \n\r"
			"add %6, %5 \n\r"
			"movdqa %%xmm0, (%0) \n\r"
			"movdqa %%xmm0, 0x10(%0) \n\r"
			"movdqa %%xmm0, 0x20(%0) \n\r"
			"movdqa %%xmm0, 0x30(%0) \n\r"
			"add %6, %0 \n\r"
			"add %6, %5 \n\r"
			"movdqa %%xmm0, (%0) \n\r"
			"movdqa %%xmm0, 0x10(%0) \n\r"
			"movdqa %%xmm0, 0x20(%0) \n\r"
			"movdqa %%xmm0, 0x30(%0) \n\r"
			"add %6, %0 \n\r"
			"add %6, %5 \n\r"

			"add $4, %3 \n\r"
			"cmp %2, %3 \n\r" 
			"jae end57 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop57 \n\r"
			"jmp start57 \n\r"
			"end57: \n\r"
			 :: "r"(addr),"r"(len),"r"(iter),"r"(0L),"r"(0L),"r"(0L),"r"(stride));
#else
// windows version
	__asm {
		mov rcx, addr
		mov rdx, len
		mov r8, iter
		xor r9, r9	// iteration count
		mov rax, stride
	start33:
		mov r10, rcx // r10 buffer address
		xor r11, r11 // r11 - length of buffer accessed so far
	loop33:
		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		add r10, rax
		add r11, rax

		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		add r10, rax
		add r11, rax

		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		add r10, rax
		add r11, rax

		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		add r10, rax
		add r11, rax

		add r9, 4 // 4 cache lines are consumed
		cmp r9, r8
		jae end33
		cmp r11, rdx
		jl loop33
		jmp start33
	end33:
	}
	
#endif
	return 1; // dummy return
}

int temporal_64B_sse2_stores_instr (char *addr, __int64 len, __int64 iter)
{
// %3 overall count to match iter
#ifdef LINUX
		    asm volatile (
			"mov %0, %4 \n\r" // save start of buffer in reg %4
			"xor %3, %3 \n\r"
			"start571_sse2: \n\r"
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop571_sse2: \n\r"

	    "movdqa %%xmm0,(%0)\n\t"
	    "movdqa %%xmm0,0x10(%0)\n\t"
	    "movdqa %%xmm0,0x20(%0)\n\t"
	    "movdqa %%xmm0,0x30(%0)\n\t"
	    "movdqa %%xmm0,0x40(%0)\n\t"
	    "movdqa %%xmm0,0x50(%0)\n\t"
	    "movdqa %%xmm0,0x60(%0)\n\t"
	    "movdqa %%xmm0,0x70(%0)\n\t"
	    "movdqa %%xmm0,0x80(%0)\n\t"
	    "movdqa %%xmm0,0x90(%0)\n\t"
	    "movdqa %%xmm0,0xa0(%0)\n\t"
	    "movdqa %%xmm0,0xb0(%0)\n\t"
	    "movdqa %%xmm0,0xc0(%0)\n\t"
	    "movdqa %%xmm0,0xd0(%0)\n\t"
	    "movdqa %%xmm0,0xe0(%0)\n\t"
	    "movdqa %%xmm0,0xf0(%0)\n\t"
		
	    "movdqa %%xmm0,0x100(%0)\n\t"
	    "movdqa %%xmm0,0x110(%0)\n\t"
	    "movdqa %%xmm0,0x120(%0)\n\t"
	    "movdqa %%xmm0,0x130(%0)\n\t"
	    "movdqa %%xmm0,0x140(%0)\n\t"
	    "movdqa %%xmm0,0x150(%0)\n\t"
	    "movdqa %%xmm0,0x160(%0)\n\t"
	    "movdqa %%xmm0,0x170(%0)\n\t"
	    "movdqa %%xmm0,0x180(%0)\n\t"
	    "movdqa %%xmm0,0x190(%0)\n\t"
	    "movdqa %%xmm0,0x1a0(%0)\n\t"
	    "movdqa %%xmm0,0x1b0(%0)\n\t"
	    "movdqa %%xmm0,0x1c0(%0)\n\t"
	    "movdqa %%xmm0,0x1d0(%0)\n\t"
	    "movdqa %%xmm0,0x1e0(%0)\n\t"
	    "movdqa %%xmm0,0x1f0(%0)\n\t"
		
	    "movdqa %%xmm0,0x200(%0)\n\t"
	    "movdqa %%xmm0,0x210(%0)\n\t"
	    "movdqa %%xmm0,0x220(%0)\n\t"
	    "movdqa %%xmm0,0x230(%0)\n\t"
	    "movdqa %%xmm0,0x240(%0)\n\t"
	    "movdqa %%xmm0,0x250(%0)\n\t"
	    "movdqa %%xmm0,0x260(%0)\n\t"
	    "movdqa %%xmm0,0x270(%0)\n\t"
	    "movdqa %%xmm0,0x280(%0)\n\t"
	    "movdqa %%xmm0,0x290(%0)\n\t"
	    "movdqa %%xmm0,0x2a0(%0)\n\t"
	    "movdqa %%xmm0,0x2b0(%0)\n\t"
	    "movdqa %%xmm0,0x2c0(%0)\n\t"
	    "movdqa %%xmm0,0x2d0(%0)\n\t"
	    "movdqa %%xmm0,0x2e0(%0)\n\t"
	    "movdqa %%xmm0,0x2f0(%0)\n\t"
		
	    "movdqa %%xmm0,0x300(%0)\n\t"
	    "movdqa %%xmm0,0x310(%0)\n\t"
	    "movdqa %%xmm0,0x320(%0)\n\t"
	    "movdqa %%xmm0,0x330(%0)\n\t"
	    "movdqa %%xmm0,0x340(%0)\n\t"
	    "movdqa %%xmm0,0x350(%0)\n\t"
	    "movdqa %%xmm0,0x360(%0)\n\t"
	    "movdqa %%xmm0,0x370(%0)\n\t"
	    "movdqa %%xmm0,0x380(%0)\n\t"
	    "movdqa %%xmm0,0x390(%0)\n\t"
	    "movdqa %%xmm0,0x3a0(%0)\n\t"
	    "movdqa %%xmm0,0x3b0(%0)\n\t"
	    "movdqa %%xmm0,0x3c0(%0)\n\t"
	    "movdqa %%xmm0,0x3d0(%0)\n\t"
	    "movdqa %%xmm0,0x3e0(%0)\n\t"
	    "movdqa %%xmm0,0x3f0(%0)\n\t"
		
	    "add $0x400,%0\n\t"
		
			"add $16, %3 \n\r"
			"add $0x400, %5 \n\r"
			"cmp %2, %3 \n\r" 
			"jae end571_sse2 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop571_sse2 \n\r"
			"jmp start571_sse2 \n\r"
			"end571_sse2: \n\r"
			 :: "r"(addr),"r"(len),"r"(iter),"r"(0L),"r"(0L),"r"(0L));
#else
// windows version
	__asm {
		mov rcx, addr
		mov rdx, len
		mov r8, iter
		xor r9, r9	// iteration count
	start33:
		mov r10, rcx // r10 buffer address
		xor r11, r11 // r11 - length of buffer accessed so far
	loop33:
		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		movdqa [r10+40h], xmm0
		movdqa [r10+50h], xmm0
		movdqa [r10+60h], xmm0
		movdqa [r10+70h], xmm0
		movdqa [r10+80h], xmm0
		movdqa [r10+90h], xmm0
		movdqa [r10+0a0h], xmm0
		movdqa [r10+0b0h], xmm0
		movdqa [r10+0c0h], xmm0
		movdqa [r10+0d0h], xmm0
		movdqa [r10+0e0h], xmm0
		movdqa [r10+0f0h], xmm0

		movdqa [r10+100h], xmm0
		movdqa [r10+110h], xmm0
		movdqa [r10+120h], xmm0
		movdqa [r10+130h], xmm0
		movdqa [r10+140h], xmm0
		movdqa [r10+150h], xmm0
		movdqa [r10+160h], xmm0
		movdqa [r10+170h], xmm0
		movdqa [r10+180h], xmm0
		movdqa [r10+190h], xmm0
		movdqa [r10+1a0h], xmm0
		movdqa [r10+1b0h], xmm0
		movdqa [r10+1c0h], xmm0
		movdqa [r10+1d0h], xmm0
		movdqa [r10+1e0h], xmm0
		movdqa [r10+1f0h], xmm0

		movdqa [r10+200h], xmm0
		movdqa [r10+210h], xmm0
		movdqa [r10+220h], xmm0
		movdqa [r10+230h], xmm0
		movdqa [r10+240h], xmm0
		movdqa [r10+250h], xmm0
		movdqa [r10+260h], xmm0
		movdqa [r10+270h], xmm0
		movdqa [r10+280h], xmm0
		movdqa [r10+290h], xmm0
		movdqa [r10+2a0h], xmm0
		movdqa [r10+2b0h], xmm0
		movdqa [r10+2c0h], xmm0
		movdqa [r10+2d0h], xmm0
		movdqa [r10+2e0h], xmm0
		movdqa [r10+2f0h], xmm0

		movdqa [r10+300h], xmm0
		movdqa [r10+310h], xmm0
		movdqa [r10+320h], xmm0
		movdqa [r10+330h], xmm0
		movdqa [r10+340h], xmm0
		movdqa [r10+350h], xmm0
		movdqa [r10+360h], xmm0
		movdqa [r10+370h], xmm0
		movdqa [r10+380h], xmm0
		movdqa [r10+390h], xmm0
		movdqa [r10+3a0h], xmm0
		movdqa [r10+3b0h], xmm0
		movdqa [r10+3c0h], xmm0
		movdqa [r10+3d0h], xmm0
		movdqa [r10+3e0h], xmm0
		movdqa [r10+3f0h], xmm0

		add r10, 400h
		add r9, 16 // 16 cache lines are consumed
		add r11, 400h  // add to the buffer size consumed so far
		cmp r9, r8
		jae end33
		cmp r11, rdx
		jl loop33
		jmp start33
	end33:
	}
	
#endif
	return 1; // dummy return
}

int temporal_64B_avx2_stores_instr (char *addr, __int64 len, __int64 iter)
{
// %3 overall count to match iter
#ifdef LINUX
		    asm volatile (
			"mov %0, %4 \n\r" // save start of buffer in reg %4
			"xor %3, %3 \n\r"
			"start571_avx2: \n\r"
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop571_avx2: \n\r"

	    "vmovdqa %%ymm0,(%0)\n\t"
	    "vmovdqa %%ymm0,0x20(%0)\n\t"
	    "vmovdqa %%ymm0,0x40(%0)\n\t"
	    "vmovdqa %%ymm0,0x60(%0)\n\t"
	    "vmovdqa %%ymm0,0x80(%0)\n\t"
	    "vmovdqa %%ymm0,0xa0(%0)\n\t"
	    "vmovdqa %%ymm0,0xc0(%0)\n\t"
	    "vmovdqa %%ymm0,0xe0(%0)\n\t"

	    "vmovdqa %%ymm0,0x100(%0)\n\t"
	    "vmovdqa %%ymm0,0x120(%0)\n\t"
	    "vmovdqa %%ymm0,0x140(%0)\n\t"
	    "vmovdqa %%ymm0,0x160(%0)\n\t"
	    "vmovdqa %%ymm0,0x180(%0)\n\t"
	    "vmovdqa %%ymm0,0x1a0(%0)\n\t"
	    "vmovdqa %%ymm0,0x1c0(%0)\n\t"
	    "vmovdqa %%ymm0,0x1e0(%0)\n\t"

	    "vmovdqa %%ymm0,0x200(%0)\n\t"
	    "vmovdqa %%ymm0,0x220(%0)\n\t"
	    "vmovdqa %%ymm0,0x240(%0)\n\t"
	    "vmovdqa %%ymm0,0x260(%0)\n\t"
	    "vmovdqa %%ymm0,0x280(%0)\n\t"
	    "vmovdqa %%ymm0,0x2a0(%0)\n\t"
	    "vmovdqa %%ymm0,0x2c0(%0)\n\t"
	    "vmovdqa %%ymm0,0x2e0(%0)\n\t"

	    "vmovdqa %%ymm0,0x300(%0)\n\t"
	    "vmovdqa %%ymm0,0x320(%0)\n\t"
	    "vmovdqa %%ymm0,0x340(%0)\n\t"
	    "vmovdqa %%ymm0,0x360(%0)\n\t"
	    "vmovdqa %%ymm0,0x380(%0)\n\t"
	    "vmovdqa %%ymm0,0x3a0(%0)\n\t"
	    "vmovdqa %%ymm0,0x3c0(%0)\n\t"
	    "vmovdqa %%ymm0,0x3e0(%0)\n\t"

	    "add $0x400,%0\n\t"
		
			"add $16, %3 \n\r"
			"add $0x400, %5 \n\r"
			"cmp %2, %3 \n\r" 
			"jae end571_avx2 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop571_avx2 \n\r"
			"jmp start571_avx2 \n\r"
			"end571_avx2: \n\r"
			 :: "r"(addr),"r"(len),"r"(iter),"r"(0L),"r"(0L),"r"(0L));
#else
// windows version
	__asm {
		mov rcx, addr
		mov rdx, len
		mov r8, iter
		xor r9, r9	// iteration count
	start33:
		mov r10, rcx // r10 buffer address
		xor r11, r11 // r11 - length of buffer accessed so far
	loop33:
		vmovdqa [r10], ymm0
		vmovdqa [r10+20h], ymm0
		vmovdqa [r10+40h], ymm0
		vmovdqa [r10+60h], ymm0
		vmovdqa [r10+80h], ymm0
		vmovdqa [r10+0a0h], ymm0
		vmovdqa [r10+0c0h], ymm0
		vmovdqa [r10+0e0h], ymm0

		vmovdqa [r10+100h], ymm0
		vmovdqa [r10+120h], ymm0
		vmovdqa [r10+140h], ymm0
		vmovdqa [r10+160h], ymm0
		vmovdqa [r10+180h], ymm0
		vmovdqa [r10+1a0h], ymm0
		vmovdqa [r10+1c0h], ymm0
		vmovdqa [r10+1e0h], ymm0

		vmovdqa [r10+200h], ymm0
		vmovdqa [r10+220h], ymm0
		vmovdqa [r10+240h], ymm0
		vmovdqa [r10+260h], ymm0
		vmovdqa [r10+280h], ymm0
		vmovdqa [r10+2a0h], ymm0
		vmovdqa [r10+2c0h], ymm0
		vmovdqa [r10+2e0h], ymm0

		vmovdqa [r10+300h], ymm0
		vmovdqa [r10+320h], ymm0
		vmovdqa [r10+340h], ymm0
		vmovdqa [r10+360h], ymm0
		vmovdqa [r10+380h], ymm0
		vmovdqa [r10+3a0h], ymm0
		vmovdqa [r10+3c0h], ymm0
		vmovdqa [r10+3e0h], ymm0

		add r10, 400h
		add r9, 16 // 16 cache lines are consumed
		add r11, 400h  // add to the buffer size consumed so far
		cmp r9, r8
		jae end33
		cmp r11, rdx
		jl loop33
		jmp start33
	end33:
	}
	
#endif
	return 1; // dummy return
}

int temporal_64B_avx3_stores_instr (char *addr, __int64 len, __int64 iter)
{
// %3 overall count to match iter
#ifdef LINUX
		    asm volatile (
			"mov %0, %4 \n\r" // save start of buffer in reg %4
			"xor %3, %3 \n\r"
			"start571_avx3: \n\r"
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop571_avx3: \n\r"

	    "vmovdqa64 %%zmm0,(%0)\n\t"
	    "vmovdqa64 %%zmm0,0x40(%0)\n\t"
	    "vmovdqa64 %%zmm0,0x80(%0)\n\t"
	    "vmovdqa64 %%zmm0,0xc0(%0)\n\t"

	    "vmovdqa64 %%zmm0,0x100(%0)\n\t"
	    "vmovdqa64 %%zmm0,0x140(%0)\n\t"
	    "vmovdqa64 %%zmm0,0x180(%0)\n\t"
	    "vmovdqa64 %%zmm0,0x1c0(%0)\n\t"

	    "vmovdqa64 %%zmm0,0x200(%0)\n\t"
	    "vmovdqa64 %%zmm0,0x240(%0)\n\t"
	    "vmovdqa64 %%zmm0,0x280(%0)\n\t"
	    "vmovdqa64 %%zmm0,0x2c0(%0)\n\t"

	    "vmovdqa64 %%zmm0,0x300(%0)\n\t"
	    "vmovdqa64 %%zmm0,0x340(%0)\n\t"
	    "vmovdqa64 %%zmm0,0x380(%0)\n\t"
	    "vmovdqa64 %%zmm0,0x3c0(%0)\n\t"

	    "add $0x400,%0\n\t"
		
			"add $16, %3 \n\r"
			"add $0x400, %5 \n\r"
			"cmp %2, %3 \n\r" 
			"jae end571_avx3 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop571_avx3 \n\r"
			"jmp start571_avx3 \n\r"
			"end571_avx3: \n\r"
			 :: "r"(addr),"r"(len),"r"(iter),"r"(0L),"r"(0L),"r"(0L));
#else
// windows version
	__asm {
		mov rcx, addr
		mov rdx, len
		mov r8, iter
		xor r9, r9	// iteration count
	start33:
		mov r10, rcx // r10 buffer address
		xor r11, r11 // r11 - length of buffer accessed so far
	loop33:
		vmovdqa64 [r10], zmm0
		vmovdqa64 [r10+40h], zmm0
		vmovdqa64 [r10+80h], zmm0
		vmovdqa64 [r10+0c0h], zmm0

		vmovdqa64 [r10+100h], zmm0
		vmovdqa64 [r10+140h], zmm0
		vmovdqa64 [r10+180h], zmm0
		vmovdqa64 [r10+1c0h], zmm0

		vmovdqa64 [r10+200h], zmm0
		vmovdqa64 [r10+240h], zmm0
		vmovdqa64 [r10+280h], zmm0
		vmovdqa64 [r10+2c0h], zmm0

		vmovdqa64 [r10+300h], zmm0
		vmovdqa64 [r10+340h], zmm0
		vmovdqa64 [r10+380h], zmm0
		vmovdqa64 [r10+3c0h], zmm0

		add r10, 400h
		add r9, 16 // 16 cache lines are consumed
		add r11, 400h  // add to the buffer size consumed so far
		cmp r9, r8
		jae end33
		cmp r11, rdx
		jl loop33
		jmp start33
	end33:
	}
	
#endif
	return 1; // dummy return
}

int temporal_stores_clflush_instr (char *addr, __int64 len, __int64 iter)
{
// %3 overall count to match iter
#ifdef LINUX
		    asm volatile (
			"mov %0, %4 \n\r" // save start of buffer in reg %4
			"xor %3, %3 \n\r"
			"start56: \n\r"
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop56: \n\r"
			"movdqa %%xmm0, (%0) \n\r"
			"movdqa %%xmm0, 0x10(%0) \n\r"
			"movdqa %%xmm0, 0x20(%0) \n\r"
			"movdqa %%xmm0, 0x30(%0) \n\r"
			"clflushopt (%0) \n\r"
			"add $0x40, %0 \n\r"
			"movdqa %%xmm0, (%0) \n\r"
			"movdqa %%xmm0, 0x10(%0) \n\r"
			"movdqa %%xmm0, 0x20(%0) \n\r"
			"movdqa %%xmm0, 0x30(%0) \n\r"
			"clflushopt (%0) \n\r"
			"add $0x40, %0 \n\r"
			"movdqa %%xmm0, (%0) \n\r"
			"movdqa %%xmm0, 0x10(%0) \n\r"
			"movdqa %%xmm0, 0x20(%0) \n\r"
			"movdqa %%xmm0, 0x30(%0) \n\r"
			"clflushopt (%0) \n\r"
			"add $0x40, %0 \n\r"
			"movdqa %%xmm0, (%0) \n\r"
			"movdqa %%xmm0, 0x10(%0) \n\r"
			"movdqa %%xmm0, 0x20(%0) \n\r"
			"movdqa %%xmm0, 0x30(%0) \n\r"
			"clflushopt (%0) \n\r"
			"add $0x40, %0 \n\r"

			"add $4, %3 \n\r"
			"add $0x100, %5 \n\r"
			"cmp %2, %3 \n\r" 
			"jae end56 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop56 \n\r"
			"jmp start56 \n\r"
			"end56: \n\r"
			 :: "r"(addr),"r"(len),"r"(iter),"r"(0L),"r"(0L),"r"(0L));
#else
// windows version
	__asm {
		mov rcx, addr
		mov rdx, len
		mov r8, iter
		xor r9, r9	// iteration count
	start33:
		mov r10, rcx // r10 buffer address
		xor r11, r11 // r11 - length of buffer accessed so far
	loop33:
		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		clflush [r10]
		add r10, 40h

		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		clflush [r10]
		add r10, 40h

		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		clflush [r10]
		add r10, 40h

		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		clflush [r10]
		add r10, 40h

		add r9, 4 // 4 cache lines are consumed
		add r11, 100h  // add to the buffer size consumed so far
		cmp r9, r8
		jae end33
		cmp r11, rdx
		jl loop33
		jmp start33
	end33:
	}
	
#endif
	return 1; // dummy return
}
int temporal_RMW_clflush_instr (char *addr, __int64 len, __int64 iter)
{
// %3 overall count to match iter
#ifdef LINUX
		    asm volatile (
			"mov %0, %4 \n\r" // save start of buffer in reg %4
			"xor %3, %3 \n\r"
			"start66: \n\r"
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop66: \n\r"
			"vmovdqa64 (%0), %%zmm0 \n\r"
			"vmovdqa64 %%zmm0, (%0) \n\r"
			"add $0x40, %0 \n\r"
			"vmovdqa64 (%0), %%zmm0 \n\r"
			"vmovdqa64 %%zmm0, (%0) \n\r"
			"add $0x40, %0 \n\r"
			"vmovdqa64 (%0), %%zmm0 \n\r"
			"vmovdqa64 %%zmm0, (%0) \n\r"
			"add $0x40, %0 \n\r"
			"vmovdqa64 (%0), %%zmm0 \n\r"
			"vmovdqa64 %%zmm0, (%0) \n\r"
			"add $0x40, %0 \n\r"

			"add $4, %3 \n\r"
			"add $0x100, %5 \n\r"
			"cmp %2, %3 \n\r" 
			"jae end66 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop66 \n\r"

			// now CLFLUSHOPT all lines in the buffer 
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop661: \n\r"
			"clflushopt (%0) \n\r"
			"add $0x40, %0 \n\r"
			"add $0x40, %5 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop661 \n\r"
			
			"jmp start66 \n\r"
			"end66: \n\r"
			 :: "r"(addr),"r"(len),"r"(iter),"r"(0L),"r"(0L),"r"(0L));
#else
// windows version
	__asm {
		mov rcx, addr
		mov rdx, len
		mov r8, iter
		xor r9, r9	// iteration count
	start33:
		mov r10, rcx // r10 buffer address
		xor r11, r11 // r11 - length of buffer accessed so far
	loop33:
		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		clflush [r10]
		add r10, 40h

		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		clflush [r10]
		add r10, 40h

		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		clflush [r10]
		add r10, 40h

		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		clflush [r10]
		add r10, 40h

		add r9, 4 // 4 cache lines are consumed
		add r11, 100h  // add to the buffer size consumed so far
		cmp r9, r8
		jae end33
		cmp r11, rdx
		jl loop33
		jmp start33
	end33:
	}
	
#endif
	return 1; // dummy return
}

int temporal_RMW_clwb_instr (char *addr, __int64 len, __int64 iter)
{
// %3 overall count to match iter
#ifdef LINUX
		    asm volatile (
			"mov %0, %4 \n\r" // save start of buffer in reg %4
			"xor %3, %3 \n\r"
			"start55: \n\r"
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop55: \n\r"
			"vmovdqa64 (%0), %%zmm0 \n\r"
			"vmovdqa64 %%zmm0, (%0) \n\r"
			"add $0x40, %0 \n\r"
			"vmovdqa64 (%0), %%zmm0 \n\r"
			"vmovdqa64 %%zmm0, (%0) \n\r"
			"add $0x40, %0 \n\r"
			"vmovdqa64 (%0), %%zmm0 \n\r"
			"vmovdqa64 %%zmm0, (%0) \n\r"
			"add $0x40, %0 \n\r"
			"vmovdqa64 (%0), %%zmm0 \n\r"
			"vmovdqa64 %%zmm0, (%0) \n\r"
			"add $0x40, %0 \n\r"

			"add $4, %3 \n\r"
			"add $0x100, %5 \n\r"
			"cmp %2, %3 \n\r" 
			"jae end55 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop55 \n\r"
			
			// now CLWB all lines in the buffer 
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop551: \n\r"
			"clwb (%0) \n\r"
			"add $0x40, %0 \n\r"
			"add $0x40, %5 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop551 \n\r"
			
			"jmp start55 \n\r"
			"end55: \n\r"
			 :: "r"(addr),"r"(len),"r"(iter),"r"(0L),"r"(0L),"r"(0L));
#else
// windows version
	__asm {
		mov rcx, addr
		mov rdx, len
		mov r8, iter
		xor r9, r9	// iteration count
	start33:
		mov r10, rcx // r10 buffer address
		xor r11, r11 // r11 - length of buffer accessed so far
	loop33:
		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		clwb [r10]
		add r10, 40h

		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		clwb [r10]
		add r10, 40h

		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		clwb [r10]
		add r10, 40h

		movdqa [r10], xmm0
		movdqa [r10+10h], xmm0
		movdqa [r10+20h], xmm0
		movdqa [r10+30h], xmm0
		clwb [r10]
		add r10, 40h

		add r9, 4 // 4 cache lines are consumed
		add r11, 100h  // add to the buffer size consumed so far
		cmp r9, r8
		jae end33
		cmp r11, rdx
		jl loop33
		jmp start33
	end33:
	}
	
#endif
	return 1; // dummy return
}
/*
#if 0
		    asm volatile (
			"mov %0, %4 \n\r" // save start of buffer in reg %4
			"xor %3, %3 \n\r"
			"start55: \n\r"
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop55: \n\r"
			"vmovdqa64 (%0), %%zmm0 \n\r"
			"vmovdqa64 %%zmm0, (%0) \n\r"
			"clwb (%0) \n\r"
			"add $0x40, %0 \n\r"
			"vmovdqa64 (%0), %%zmm0 \n\r"
			"vmovdqa64 %%zmm0, (%0) \n\r"
			"clwb (%0) \n\r"
			"add $0x40, %0 \n\r"
			"vmovdqa64 (%0), %%zmm0 \n\r"
			"vmovdqa64 %%zmm0, (%0) \n\r"
			"clwb (%0) \n\r"
			"add $0x40, %0 \n\r"
			"vmovdqa64 (%0), %%zmm0 \n\r"
			"vmovdqa64 %%zmm0, (%0) \n\r"
			"clwb (%0) \n\r"
			"add $0x40, %0 \n\r"

			"add $4, %3 \n\r"
			"add $0x100, %5 \n\r"
			"cmp %2, %3 \n\r" 
			"jae end55 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop55 \n\r"
			"jmp start55 \n\r"
			"end55: \n\r"
			 :: "r"(addr),"r"(len),"r"(iter),"r"(0L),"r"(0L),"r"(0L));
#endif
*/
