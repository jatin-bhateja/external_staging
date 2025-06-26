#include "common.h"

int load_data_prior_to_clflush (char *addr, __int64 len)
{
	__int64 cnt=0, i;
	for (i=0; i <  len; i+=64) {
		cnt += addr[i];
	}
#ifdef LINUX
	// execute mfence to ensure the loads are completed before proceeding further
	asm ("mfence");
	
#else
	__asm { mfence }
#endif
	
	clflush_instr_latency (addr, len, 1);
	return (int)cnt;
}

int useless_prefetch_test(char *addr, __int64 iter)
{
	do_specified_dependent_read((UINT64*)addr, iter);
	return 0;
}

int setup_useless_pref_access(char *addr, __int64 bufsize, __int64 offset, int num_lines)
{
	__int64 LineIncrement, line_offset, successive_pref_lines;
	__int64 *datap, *endp, j;
	
	successive_pref_lines = num_lines;
	line_offset = offset+1;
	LineIncrement = stride/sizeof(__int64*); 
	//printf("ssl=%ld, offs=%ld, incre=%ld\n", successive_pref_lines, line_offset, LineIncrement);
	datap = (__int64*) addr;
	endp = (__int64*) (addr + bufsize - 4096);
	//printf("buf=%lx, endp=%lx\n", datap, endp);

	//endp = datap + (nLines*LineIncrement - (LineIncrement*(line_offset+2)));

 	for (j=1; endp > datap; j++)
	{
		if ( j >= successive_pref_lines)
		{
			*datap = (__int64)(datap+(LineIncrement*line_offset));
			datap=datap+(LineIncrement*line_offset);
			j=0;
		}
		else
		{
			*datap = (__int64)(datap+LineIncrement);
			datap=datap+LineIncrement;
		}
	}
	*datap=(__int64)addr;
	//printf("************** done \n");
	/*
	curr = addr; prev=addr;
	for (i=0; ; i++)
	{
		printf("%lx->%lx\n", (__int64)curr, *curr);
		curr = *curr;
		if (curr==addr) break;
	}
	*/
	return 0;
}

int large_stride_latency_access(char *addr, __int64 iter)
{
	do_specified_dependent_read((UINT64*)addr, iter);
	return 0;
}

// Allocates the desired buffer and just creates a chain of pointers
// with the specified number of lines
// For example if -b100MB is specified along with -p10 (num_lines=10)
// then 10 pointers are created at 100MB/10=10MB distance and each line is 
// pointing to the next one

int setup_large_stride_access (char *addr, __int64 size, int num_lines)
{
	__int64 value, delta, next, i;
	
	delta = size / (__int64) num_lines;
	//printf("addr = %llx, delta=%lld, sz=%lld, num=%d\n", addr, delta, size, num_lines);
	// now establish a chain of pointers
	next = (__int64)addr;
	for (i=0; i < num_lines-1; i++) {
		value = next + delta;
		*(__int64 **)next = (__int64 *)value;
		next = value;
	}
	*(__int64 **)value = (__int64 *)addr;
	
	return 0;
}

int setup_random_access (char *addr, __int64 va_size, __int64 buf_size)
{
	//__int64** temp;
	__int64** prev;
	__int64 *value;
	__int64 num, max_lines, max_va_lines, next, i;
	__int64 pageaddr;
	static int cnt=0;
	
	max_lines = buf_size/stride;
	max_va_lines = va_size / stride;
#ifndef LINUX
	//printf("VA_Addr= %llx\tmax_va_lines=%lld\tmax_lines=%lld\n", addr, max_va_lines, max_lines);
#endif
	//printf("%s:%d, max_va_lines=%lld, max_lines=%lld\n", __func__, __LINE__, max_va_lines, max_lines);
	prev = (__int64**)addr;
	
/*
 *	In case of Linux, we can mmap a huge VA space and have physical backing
 *	only for the needed ones when any particular page was written to first time
 *	But that does not work on Windows. In Windows, we need to call VirtualAlloc for
 *	every one of those pages
 */

#ifndef LINUX	
	if (VirtualAlloc((void*)addr, 4*1024, MEM_COMMIT, PAGE_READWRITE) == NULL) {
			printf("Failed to commit\n");
			exit(1);
	}
#endif
	for (i=0; i < max_lines-1;) {
#ifdef LINUX	
		num = rand() % max_va_lines;
#else
		num = win_rand() % max_va_lines;
#endif
#ifdef LINUX
		next = (__int64)addr + num*stride;
#else
		next = (__int64)addr + num*stride;
		pageaddr = next & 0xFFFFFFFFFFFFF000LL;
		if (VirtualAlloc((void*)pageaddr, 4*1024, MEM_COMMIT, PAGE_READWRITE) == NULL) {
			printf("Failed to commit memory - Exiting\n");
			exit(1);
		}
#endif
		value = *(__int64**)next;
		if (value != 0) // already initialized so keep trying 
			continue;
		*prev = (__int64*)next;
		prev = (__int64**)next;
		i++;
	}
	*prev = (__int64*)addr;
	
	/*
	prev = (__int64**)addr;
	for (i=0; i < max_lines+1; i++) {
		
		printf("addr %llx\n", (__int64**)prev);
		prev = (*prev);
	}
	*/
	return 0;
}

int temporal_loads_instr (char *addr, __int64 len, __int64 iter)
{
	printf("addr=%llx, len=%ld\n", addr, len);
// %3 overall count to match iter
#ifdef LINUX
		    asm volatile (
			"mov %0, %4 \n\r" // save start of buffer in reg %4
			"xor %3, %3 \n\r"
			"start55: \n\r"
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop55: \n\r"
			"movdqa (%0), %%xmm0 \n\r"
			"movdqa 0x10(%0), %%xmm0 \n\r"
			"movdqa 0x20(%0), %%xmm0 \n\r"
			"movdqa 0x30(%0), %%xmm0 \n\r"
			"add %6, %0 \n\r"
			"add %6, %5 \n\r"
			"movdqa (%0), %%xmm0 \n\r"
			"movdqa 0x10(%0), %%xmm0 \n\r"
			"movdqa 0x20(%0), %%xmm0 \n\r"
			"movdqa 0x30(%0), %%xmm0 \n\r"
			"add %6, %0 \n\r"
			"add %6, %5 \n\r"
			"movdqa (%0), %%xmm0 \n\r"
			"movdqa 0x10(%0), %%xmm0 \n\r"
			"movdqa 0x20(%0), %%xmm0 \n\r"
			"movdqa 0x30(%0), %%xmm0 \n\r"
			"add %6, %0 \n\r"
			"add %6, %5 \n\r"
			"movdqa (%0), %%xmm0 \n\r"
			"movdqa 0x10(%0), %%xmm0 \n\r"
			"movdqa 0x20(%0), %%xmm0 \n\r"
			"movdqa 0x30(%0), %%xmm0 \n\r"
			"add %6, %0 \n\r"
			"add %6, %5 \n\r"

			"add $4, %3 \n\r"
			"cmp %2, %3 \n\r" 
			"jae end55 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop55 \n\r"
			"jmp start55 \n\r"
			"end55: \n\r"
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
		movdqa xmm0, [r10]
		movdqa xmm0, [r10+10h]
		movdqa xmm0, [r10+20h]
		movdqa xmm0, [r10+30h]
		add r10, rax
		add r11, rax

		movdqa xmm0, [r10]
		movdqa xmm0, [r10+10h]
		movdqa xmm0, [r10+20h]
		movdqa xmm0, [r10+30h]
		add r10, rax
		add r11, rax

		movdqa xmm0, [r10]
		movdqa xmm0, [r10+10h]
		movdqa xmm0, [r10+20h]
		movdqa xmm0, [r10+30h]
		add r10, rax
		add r11, rax

		movdqa xmm0, [r10]
		movdqa xmm0, [r10+10h]
		movdqa xmm0, [r10+20h]
		movdqa xmm0, [r10+30h]
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

int temporal_64B_sse2_loads_instr (char *addr, __int64 len, __int64 iter)
{
// %3 overall count to match iter
#ifdef LINUX
		    asm volatile (
			"mov %0, %4 \n\r" // save start of buffer in reg %4
			"xor %3, %3 \n\r"
			"start55_sse2: \n\r"
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop55_sse2: \n\r"

			"movdqa (%0),%%xmm0\n\t"
			"movdqa 0x10(%0),%%xmm0\n\t"
			"movdqa 0x20(%0),%%xmm0\n\t"
			"movdqa 0x30(%0),%%xmm0\n\t"
			"movdqa 0x40(%0),%%xmm0\n\t"
			"movdqa 0x50(%0),%%xmm0\n\t"
			"movdqa 0x60(%0),%%xmm0\n\t"
			"movdqa 0x70(%0),%%xmm0\n\t"
			"movdqa 0x80(%0),%%xmm0\n\t"
			"movdqa 0x90(%0),%%xmm0\n\t"
			"movdqa 0xa0(%0),%%xmm0\n\t"
			"movdqa 0xb0(%0),%%xmm0\n\t"
			"movdqa 0xc0(%0),%%xmm0\n\t"
			"movdqa 0xd0(%0),%%xmm0\n\t"
			"movdqa 0xe0(%0),%%xmm0\n\t"
			"movdqa 0xf0(%0),%%xmm0\n\t"
			"movdqa 0x100(%0),%%xmm0\n\t"
			"movdqa 0x110(%0),%%xmm0\n\t"
			"movdqa 0x120(%0),%%xmm0\n\t"
			"movdqa 0x130(%0),%%xmm0\n\t"
			"movdqa 0x140(%0),%%xmm0\n\t"
			"movdqa 0x150(%0),%%xmm0\n\t"
			"movdqa 0x160(%0),%%xmm0\n\t"
			"movdqa 0x170(%0),%%xmm0\n\t"
			"movdqa 0x180(%0),%%xmm0\n\t"
			"movdqa 0x190(%0),%%xmm0\n\t"
			"movdqa 0x1a0(%0),%%xmm0\n\t"
			"movdqa 0x1b0(%0),%%xmm0\n\t"
			"movdqa 0x1c0(%0),%%xmm0\n\t"
			"movdqa 0x1d0(%0),%%xmm0\n\t"
			"movdqa 0x1e0(%0),%%xmm0\n\t"
			"movdqa 0x1f0(%0),%%xmm0\n\t"
			"movdqa 0x200(%0),%%xmm0\n\t"
			"movdqa 0x210(%0),%%xmm0\n\t"
			"movdqa 0x220(%0),%%xmm0\n\t"
			"movdqa 0x230(%0),%%xmm0\n\t"
			"movdqa 0x240(%0),%%xmm0\n\t"
			"movdqa 0x250(%0),%%xmm0\n\t"
			"movdqa 0x260(%0),%%xmm0\n\t"
			"movdqa 0x270(%0),%%xmm0\n\t"
			"movdqa 0x280(%0),%%xmm0\n\t"
			"movdqa 0x290(%0),%%xmm0\n\t"
			"movdqa 0x2a0(%0),%%xmm0\n\t"
			"movdqa 0x2b0(%0),%%xmm0\n\t"
			"movdqa 0x2c0(%0),%%xmm0\n\t"
			"movdqa 0x2d0(%0),%%xmm0\n\t"
			"movdqa 0x2e0(%0),%%xmm0\n\t"
			"movdqa 0x2f0(%0),%%xmm0\n\t"
			"movdqa 0x300(%0),%%xmm0\n\t"
			"movdqa 0x310(%0),%%xmm0\n\t"
			"movdqa 0x320(%0),%%xmm0\n\t"
			"movdqa 0x330(%0),%%xmm0\n\t"
			"movdqa 0x340(%0),%%xmm0\n\t"
			"movdqa 0x350(%0),%%xmm0\n\t"
			"movdqa 0x360(%0),%%xmm0\n\t"
			"movdqa 0x370(%0),%%xmm0\n\t"
			"movdqa 0x380(%0),%%xmm0\n\t"
			"movdqa 0x390(%0),%%xmm0\n\t"
			"movdqa 0x3a0(%0),%%xmm0\n\t"
			"movdqa 0x3b0(%0),%%xmm0\n\t"
			"movdqa 0x3c0(%0),%%xmm0\n\t"
			"movdqa 0x3d0(%0),%%xmm0\n\t"
			"movdqa 0x3e0(%0),%%xmm0\n\t"
			"movdqa 0x3f0(%0),%%xmm0\n\t"
			"add $0x400,%0\n\t"

			"add $16, %3 \n\r"
			"add $0x400, %5 \n\r"
			"cmp %2, %3 \n\r" 
			"jae end55_sse2 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop55_sse2 \n\r"
			"jmp start55_sse2 \n\r"
			"end55_sse2: \n\r"
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
		movdqa xmm0, [r10]
		movdqa xmm0, [r10+10h]
		movdqa xmm0, [r10+20h]
		movdqa xmm0, [r10+30h]
		movdqa xmm0, [r10+40h]
		movdqa xmm0, [r10+50h]
		movdqa xmm0, [r10+60h]
		movdqa xmm0, [r10+70h]
		movdqa xmm0, [r10+80h]
		movdqa xmm0, [r10+90h]
		movdqa xmm0, [r10+0a0h]
		movdqa xmm0, [r10+0b0h]
		movdqa xmm0, [r10+0c0h]
		movdqa xmm0, [r10+0d0h]
		movdqa xmm0, [r10+0e0h]
		movdqa xmm0, [r10+0f0h]
		movdqa xmm0, [r10+100h]
		movdqa xmm0, [r10+110h]
		movdqa xmm0, [r10+120h]
		movdqa xmm0, [r10+130h]
		movdqa xmm0, [r10+140h]
		movdqa xmm0, [r10+150h]
		movdqa xmm0, [r10+160h]
		movdqa xmm0, [r10+170h]
		movdqa xmm0, [r10+180h]
		movdqa xmm0, [r10+190h]
		movdqa xmm0, [r10+1a0h]
		movdqa xmm0, [r10+1b0h]
		movdqa xmm0, [r10+1c0h]
		movdqa xmm0, [r10+1d0h]
		movdqa xmm0, [r10+1e0h]
		movdqa xmm0, [r10+1f0h]
		movdqa xmm0, [r10+200h]
		movdqa xmm0, [r10+210h]
		movdqa xmm0, [r10+220h]
		movdqa xmm0, [r10+230h]
		movdqa xmm0, [r10+240h]
		movdqa xmm0, [r10+250h]
		movdqa xmm0, [r10+260h]
		movdqa xmm0, [r10+270h]
		movdqa xmm0, [r10+280h]
		movdqa xmm0, [r10+290h]
		movdqa xmm0, [r10+2a0h]
		movdqa xmm0, [r10+2b0h]
		movdqa xmm0, [r10+2c0h]
		movdqa xmm0, [r10+2d0h]
		movdqa xmm0, [r10+2e0h]
		movdqa xmm0, [r10+2f0h]
		movdqa xmm0, [r10+300h]
		movdqa xmm0, [r10+310h]
		movdqa xmm0, [r10+320h]
		movdqa xmm0, [r10+330h]
		movdqa xmm0, [r10+340h]
		movdqa xmm0, [r10+350h]
		movdqa xmm0, [r10+360h]
		movdqa xmm0, [r10+370h]
		movdqa xmm0, [r10+380h]
		movdqa xmm0, [r10+390h]
		movdqa xmm0, [r10+3a0h]
		movdqa xmm0, [r10+3b0h]
		movdqa xmm0, [r10+3c0h]
		movdqa xmm0, [r10+3d0h]
		movdqa xmm0, [r10+3e0h]
		movdqa xmm0, [r10+3f0h]
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
	return 1; 
}

int temporal_64B_avx2_loads_instr (char *addr, __int64 len, __int64 iter)
{
// %3 overall count to match iter
#ifdef LINUX
		    asm volatile (
			"mov %0, %4 \n\r" // save start of buffer in reg %4
			"xor %3, %3 \n\r"
			"start55_avx2: \n\r"
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop55_avx2: \n\r"

	    "vmovdqa (%0),%%ymm1\n\t"
	    "vmovdqa 0x20(%0),%%ymm1\n\t"
	    "vmovdqa 0x40(%0),%%ymm1\n\t"
	    "vmovdqa 0x60(%0),%%ymm1\n\t"
	    "vmovdqa 0x80(%0),%%ymm1\n\t"
	    "vmovdqa 0xa0(%0),%%ymm1\n\t"
	    "vmovdqa 0xc0(%0),%%ymm1\n\t"
	    "vmovdqa 0xe0(%0),%%ymm1\n\t"

	    "vmovdqa 0x100(%0),%%ymm1\n\t"
	    "vmovdqa 0x120(%0),%%ymm1\n\t"
	    "vmovdqa 0x140(%0),%%ymm1\n\t"
	    "vmovdqa 0x160(%0),%%ymm1\n\t"
	    "vmovdqa 0x180(%0),%%ymm1\n\t"
	    "vmovdqa 0x1a0(%0),%%ymm1\n\t"
	    "vmovdqa 0x1c0(%0),%%ymm1\n\t"
	    "vmovdqa 0x1e0(%0),%%ymm1\n\t"

	    "vmovdqa 0x200(%0),%%ymm1\n\t"
	    "vmovdqa 0x220(%0),%%ymm1\n\t"
	    "vmovdqa 0x240(%0),%%ymm1\n\t"
	    "vmovdqa 0x260(%0),%%ymm1\n\t"
	    "vmovdqa 0x280(%0),%%ymm1\n\t"
	    "vmovdqa 0x2a0(%0),%%ymm1\n\t"
	    "vmovdqa 0x2c0(%0),%%ymm1\n\t"
	    "vmovdqa 0x2e0(%0),%%ymm1\n\t"

	    "vmovdqa 0x300(%0),%%ymm1\n\t"
	    "vmovdqa 0x320(%0),%%ymm1\n\t"
	    "vmovdqa 0x340(%0),%%ymm1\n\t"
	    "vmovdqa 0x360(%0),%%ymm1\n\t"
	    "vmovdqa 0x380(%0),%%ymm1\n\t"
	    "vmovdqa 0x3a0(%0),%%ymm1\n\t"
	    "vmovdqa 0x3c0(%0),%%ymm1\n\t"
	    "vmovdqa 0x3e0(%0),%%ymm1\n\t"

	    "add $0x400, %0\n\t"

			"add $16, %3 \n\r"
			"add $0x400, %5 \n\r"
			"cmp %2, %3 \n\r" 
			"jae end55_avx2 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop55_avx2 \n\r"
			"jmp start55_avx2 \n\r"
			"end55_avx2: \n\r"
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
		vmovdqa ymm0, [r10]
		vmovdqa ymm0, [r10+20h]
		vmovdqa ymm0, [r10+40h]
		vmovdqa ymm0, [r10+60h]
		vmovdqa ymm0, [r10+80h]
		vmovdqa ymm0, [r10+0a0h]
		vmovdqa ymm0, [r10+0c0h]
		vmovdqa ymm0, [r10+0e0h]

		vmovdqa ymm0, [r10+100h]
		vmovdqa ymm0, [r10+120h]
		vmovdqa ymm0, [r10+140h]
		vmovdqa ymm0, [r10+160h]
		vmovdqa ymm0, [r10+180h]
		vmovdqa ymm0, [r10+1a0h]
		vmovdqa ymm0, [r10+1c0h]
		vmovdqa ymm0, [r10+1e0h]

		vmovdqa ymm0, [r10+200h]
		vmovdqa ymm0, [r10+220h]
		vmovdqa ymm0, [r10+240h]
		vmovdqa ymm0, [r10+260h]
		vmovdqa ymm0, [r10+280h]
		vmovdqa ymm0, [r10+2a0h]
		vmovdqa ymm0, [r10+2c0h]
		vmovdqa ymm0, [r10+2e0h]

		vmovdqa ymm0, [r10+300h]
		vmovdqa ymm0, [r10+320h]
		vmovdqa ymm0, [r10+340h]
		vmovdqa ymm0, [r10+360h]
		vmovdqa ymm0, [r10+380h]
		vmovdqa ymm0, [r10+3a0h]
		vmovdqa ymm0, [r10+3c0h]
		vmovdqa ymm0, [r10+3e0h]

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
int temporal_64B_avx3_loads_instr (char *addr, __int64 len, __int64 iter)
{
// %3 overall count to match iter
#ifdef LINUX
		    asm volatile (
			"mov %0, %4 \n\r" // save start of buffer in reg %4
			"xor %3, %3 \n\r"
			"start55_avx3: \n\r"
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop55_avx3: \n\r"

	    "vmovdqa64 (%0),%%zmm1\n\t"
	    "vmovdqa64 0x40(%0),%%zmm1\n\t"
	    "vmovdqa64 0x80(%0),%%zmm1\n\t"
	    "vmovdqa64 0xc0(%0),%%zmm1\n\t"
	    "vmovdqa64 0x100(%0),%%zmm1\n\t"
	    "vmovdqa64 0x140(%0),%%zmm1\n\t"
	    "vmovdqa64 0x180(%0),%%zmm1\n\t"
	    "vmovdqa64 0x1c0(%0),%%zmm1\n\t"
	    "vmovdqa64 0x200(%0),%%zmm1\n\t"
	    "vmovdqa64 0x240(%0),%%zmm1\n\t"
	    "vmovdqa64 0x280(%0),%%zmm1\n\t"
	    "vmovdqa64 0x2c0(%0),%%zmm1\n\t"
	    "vmovdqa64 0x300(%0),%%zmm1\n\t"
	    "vmovdqa64 0x340(%0),%%zmm1\n\t"
	    "vmovdqa64 0x380(%0),%%zmm1\n\t"
	    "vmovdqa64 0x3c0(%0),%%zmm1\n\t"
	    "add $0x400, %0\n\t"

			"add $16, %3 \n\r"
			"add $0x400, %5 \n\r"
			"cmp %2, %3 \n\r" 
			"jae end55_avx3 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop55_avx3 \n\r"
			"jmp start55_avx3 \n\r"
			"end55_avx3: \n\r"
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
		vmovdqa64 zmm0, [r10]
		vmovdqa64 zmm0, [r10+40h]
		vmovdqa64 zmm0, [r10+80h]
		vmovdqa64 zmm0, [r10+0c0h]
		vmovdqa64 zmm0, [r10+100h]
		vmovdqa64 zmm0, [r10+140h]
		vmovdqa64 zmm0, [r10+180h]
		vmovdqa64 zmm0, [r10+1c0h]
		vmovdqa64 zmm0, [r10+200h]
		vmovdqa64 zmm0, [r10+240h]
		vmovdqa64 zmm0, [r10+280h]
		vmovdqa64 zmm0, [r10+2c0h]
		vmovdqa64 zmm0, [r10+300h]
		vmovdqa64 zmm0, [r10+340h]
		vmovdqa64 zmm0, [r10+380h]
		vmovdqa64 zmm0, [r10+3c0h]

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

int clflush_instr_latency (char *addr, __int64 len, __int64 iter)
{
// %3 overall count to match iter
#ifdef LINUX
		    asm volatile (
			"lfence\n\r"
			"mov %0, %4 \n\r" // save start of buffer in reg %4
			"xor %3, %3 \n\r"
			"start569: \n\r"
			"mov %4, %0 \n\r"  // point to start of buffer as %4 contains top of buffer
			"xor %5, %5 \n\r"
			"loop569: \n\r"
			"clflush (%0) \n\r"
			"add $0x40, %0 \n\r"

			"add $1, %3 \n\r"
			"add $0x40, %5 \n\r"
			"cmp %2, %3 \n\r" 
			"jae end569 \n\r"
			"cmp %1, %5 \n\r"  
			"jl loop569 \n\r"
			"jmp start569 \n\r"
			"end569: \n\r"
			"lfence\n\r"
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
		clflush [r10]
		add r10, 40h

		add r9, 1 // 1 cache line is consumed
		add r11, 40h  // add to the buffer size consumed so far
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

int temporal_loads_clflush_instr (char *addr, __int64 len, __int64 iter)
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
			"movdqa (%0), %%xmm0 \n\r"
			"movdqa 0x10(%0), %%xmm0 \n\r"
			"movdqa 0x20(%0), %%xmm0 \n\r"
			"movdqa 0x30(%0), %%xmm0 \n\r"
			"clflush (%0) \n\r"
			"add $0x40, %0 \n\r"

			"add $1, %3 \n\r"
			"add $0x40, %5 \n\r"
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
		movdqa xmm0, [r10]
		movdqa xmm0, [r10+10h]
		movdqa xmm0, [r10+20h]
		movdqa xmm0, [r10+30h]
		clflush [r10]
		add r10, 40h

		add r9, 1 // 1 cache line is consumed
		add r11, 40h  // add to the buffer size consumed so far
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

#if defined(LINUX)
UINT64* do_specified_dependent_read(UINT64* a, UINT64 iter)
{
	UINT64 *ret_ptr;
	asm volatile(
	    "xor %1, %1\n\t"
	    "LOOP990:\n\t"
	    "mov (%2),%2\n\t"
	    "inc %1\n\t"
	    "cmp %3,%1\n\t"
	    "jb LOOP990\n\t"
	    "mov %2,%0\n\t"
	    :"=r"(ret_ptr):"b"(0LL), "d"(a), "r"(iter));
	return ret_ptr;
}
#else
UINT64* do_specified_dependent_read(UINT64* a, UINT64 iter)
{
	__asm {
		//zero out COUNTER and initialize arrayPOSITION
		xor rbx, rbx
		mov rdx, a
		mov rcx, iter

		LOOP1:
		//load value in [arrayPOSITION] into arrayPOSITION
		// basically pointer chasing code
		mov rdx, [rdx]
		//increment iteration counter
		inc rbx
		cmp rbx, rcx

		//quit if loop has run allotted number of times
		jb LOOP1

		STOP:
		mov rax, rdx

	}
}
#endif
int sw_prefetch_test(char *addr, __int64 bufsize, __int64 chunksize, __int64 iter)
{
	__int64 stride=64;
	__int64 i, j, num_blocks;
	
	num_blocks = bufsize / chunksize;
	
	for (i=0; i < iter; i+=(bufsize/stride)) {
		char *ptr = addr;
		for (j=0; j < num_blocks; j++, ptr+=chunksize) {
			exec_swprefetch(ptr, chunksize);
		}
	}
	return 0;

}

int exec_swprefetch (char *addr, __int64 len)
{
#ifdef LINUX
// %3 overall count to match iter
		    asm volatile (
			"xor %2, %2 \n\r"

			"mov %0, %3 \n\r" // save addr in %3
			"loop_swpf: \n\r"
			"prefetchNTA (%0) \n\r"
			"add $0x40, %0 \n\r"
			"add $0x40, %2 \n\r"
			"cmp %1, %2 \n\r"  
			"jl loop_swpf \n\r"
			
			"xor %2, %2 \n\r"
			"mov %3, %0 \n\r" 
			"loop_load: \n\r"
			"movdqa (%0), %%xmm0 \n\r"
			"add $0x40, %0 \n\r"
			"add $0x40, %2 \n\r"
			"cmp %1, %2 \n\r"  
			"jl loop_load \n\r"
			
			 :: "r"(addr),"r"(len),"r"(0L),"r"(0L),"r"(0L));
#else
	printf("Not implemented\n");
	return 0;
#endif

}

void initialize_mem_for_ptr_chasing(char* buf, UINT64 buf_len)
{
	//__int64* buf, **datap;
	UINT64 *datap;
	UINT64 i, nLines = 0, before, after, LineIncrement;
	// Bind to core on the socket where we want to allocate memory
	// Allocate the memory of size buf_len
	static int kk=0;


	LineIncrement = stride / sizeof(UINT64);
	nLines = (buf_len) / stride;

	datap = (UINT64*)buf;

	if (Random_Access) {
		Create_random_pattern((UINT64**)datap, buf_len);
	} else {
		// If random access not specified, initialize memory sequentially
		for (i = 0; i < nLines-1; i++) {
			*(UINT64**)datap = (UINT64*)(datap + LineIncrement);
			datap = datap + LineIncrement;
		}

		*(UINT64**)datap = (UINT64*)buf;
	}

	if (clflush) {
		for (i=0; i < nLines; i++) {
		char *ptr = (char*)buf + (i*stride);
		evict_line_from_cache ((void *)(ptr));
		}
	/* execute mfence to ensure all lines are flushed out */
#if defined(LINUX) || defined(__APPLE__)
		asm ("mfence");
#else
		__asm { mfence } 
#endif
	}

	if (evict_line_size) {
		char* tmp;
	    tmp = allocate_memory(800*1024LL*1024LL);
		do_64B_reads(tmp, 800*1024LL*1024LL);
		//printf("800MB VA=%llx\tPA=%llx\n", tmp, get_physaddr((void*)tmp));
	
	    tmp = allocate_memory(evict_line_size);
		//printf("Evict buffer VA=%llx\tPA=%llx\n", tmp, get_physaddr((void*)tmp));
		//printf("evictline size %lld\t tmp=%llx\n", evict_line_size, tmp);	
		//	before = rdtsc();
		//	while ((rdtsc() - before) < 8000000000LL);
		// read it back so it fills the caches and evicts all the old initialized data
		for (i=0; i < 10; i++)
		{
			do_64B_reads(tmp, evict_line_size);
		}
		//	before = rdtsc();
		//	while ((rdtsc() - before) < 2000000000LL);
		for (i=0; i < evict_line_size/stride; i++) {
			static int once=1;
			char *ptr = (char*)tmp + (i*stride);
			//printf("ptr=%llx\n", ptr);
			//if (once) { once=0; printf("ptr=%llx\n", ptr);}
			evict_line_from_cache ((void *)(ptr));
		}
		//	before = rdtsc();
		//	while ((rdtsc() - before) < 3000000000LL);
		//	do_64B_reads(tmp, evict_line_size);
	}

}
void dependent_read_latency(char *buf, __int64 bufsize, __int64 iter)
{
	UINT64 before=0, after=0, nLines, total_iter=0, i; 
	double nsec;
	char *pgsz;
	
	if (lp_1GB_enabled) pgsz = "1GB";
	else if (lp_enabled) pgsz = "2MB";
	else pgsz = "4KB";
	
	//printf("Main buffer VA=%llx\tPA=%llx\n", buf, get_physaddr((void*)buf));
	printf("RESULT\tBUF_INV\tPAGE_SZ\tBUF_SIZE\tITER#\tlatency\n");
	//before = rdtsc();
	//while ((rdtsc() - before) < 10000000000LL);
	//printf("Starting main buffer iteration\n");
	//sleep(4);
	nLines = bufsize/stride;
	//for (i=0; i < num_lines; i++) {
	//for (i=0; ; i++) {
	//for (i=0; i < total_iter; i++) {
		before = rdtsc();
		do_specified_dependent_read((UINT64*)buf, iter);
		//after = rdtsc();
		//nsec = ((double)(after-before)*1000000000LL/(double)ClksPerSec)/nLines;
		//total_iter += nLines;
	//if ((i % 50) == 0)	
		//printf("RESULT\t%lld\t%s\t%lld\t%lld\t%.2f\n", evict_line_size/(1024LL*1024), pgsz,  bufsize/(1024LL*1024), i, nsec);
	//}
}
