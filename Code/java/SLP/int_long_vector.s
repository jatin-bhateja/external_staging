	.file	"int_long_vector.c"
# GNU C17 (Ubuntu 9.3.0-17ubuntu1~20.04) version 9.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.3.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu int_long_vector.c -mavx512f
# -mtune=generic -march=x86-64 -O3 -fverbose-asm
# -fasynchronous-unwind-tables -fstack-protector-strong -Wformat
# -Wformat-security -fstack-clash-protection -fcf-protection
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -falign-functions -falign-jumps -falign-labels -falign-loops
# -fassume-phsa -fasynchronous-unwind-tables -fauto-inc-dec
# -fbranch-count-reg -fcaller-saves -fcode-hoisting
# -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
# -fcrossjumping -fcse-follow-jumps -fdefer-pop
# -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -fexpensive-optimizations -fforward-propagate -ffp-int-builtin-inexact
# -ffunction-cse -fgcse -fgcse-after-reload -fgcse-lm -fgnu-runtime
# -fgnu-unique -fguess-branch-probability -fhoist-adjacent-loads -fident
# -fif-conversion -fif-conversion2 -findirect-inlining -finline
# -finline-atomics -finline-functions -finline-functions-called-once
# -finline-small-functions -fipa-bit-cp -fipa-cp -fipa-cp-clone -fipa-icf
# -fipa-icf-functions -fipa-icf-variables -fipa-profile -fipa-pure-const
# -fipa-ra -fipa-reference -fipa-reference-addressable -fipa-sra
# -fipa-stack-alignment -fipa-vrp -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -floop-interchange
# -floop-unroll-and-jam -flra-remat -flto-odr-type-merging -fmath-errno
# -fmerge-constants -fmerge-debug-strings -fmove-loop-invariants
# -fomit-frame-pointer -foptimize-sibling-calls -foptimize-strlen
# -fpartial-inlining -fpeel-loops -fpeephole -fpeephole2 -fplt
# -fpredictive-commoning -fprefetch-loop-arrays -free -freg-struct-return
# -freorder-blocks -freorder-blocks-and-partition -freorder-functions
# -frerun-cse-after-loop -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fschedule-insns2 -fsemantic-interposition -fshow-column -fshrink-wrap
# -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
# -fsplit-loops -fsplit-paths -fsplit-wide-types -fssa-backprop
# -fssa-phiopt -fstack-clash-protection -fstack-protector-strong
# -fstdarg-opt -fstore-merging -fstrict-aliasing
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim
# -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-distribute-patterns -ftree-loop-distribution
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-loop-vectorize -ftree-parallelize-loops=
# -ftree-partial-pre -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc
# -ftree-scev-cprop -ftree-sink -ftree-slp-vectorize -ftree-slsr -ftree-sra
# -ftree-switch-conversion -ftree-tail-merge -ftree-ter -ftree-vrp
# -funit-at-a-time -funswitch-loops -funwind-tables -fverbose-asm
# -fversion-loops-for-strides -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -malign-stringops -mavx -mavx2
# -mavx256-split-unaligned-load -mavx256-split-unaligned-store -mavx512f
# -mfancy-math-387 -mfp-ret-in-387 -mfxsr -mglibc -mieee-fp
# -mlong-double-80 -mmmx -mpopcnt -mpush-args -mred-zone -msse -msse2
# -msse3 -msse4 -msse4.1 -msse4.2 -mssse3 -mstv -mtls-direct-seg-refs
# -mvzeroupper -mxsave

	.text
	.p2align 4
	.globl	micro
	.type	micro, @function
micro:
.LFB0:
	.cfi_startproc
	endbr64	
	leaq	128(%rdi), %r8	#, tmp112
	leaq	8(%rsi), %rax	#, tmp113
	cmpq	%rax, %r8	# tmp113, tmp112
	leaq	136(%rsi), %rax	#, tmp116
	leaq	2048(%rdx), %r9	#, tmp123
	setbe	%r8b	#, tmp115
	cmpq	%rax, %rdi	# tmp116, lDst
	setnb	%al	#, tmp118
	orl	%eax, %r8d	# tmp118, tmp119
	leaq	4096(%rdi), %rax	#, tmp120
	cmpq	%rax, %rdx	# tmp120, iDst
	setnb	%al	#, tmp122
	cmpq	%r9, %rdi	# tmp123, lDst
	setnb	%r9b	#, tmp125
	orl	%r9d, %eax	# tmp125, tmp126
	testb	%al, %r8b	# tmp126, tmp119
	je	.L5	#,
	leaq	4(%rcx), %r8	#, tmp128
	leaq	64(%rdx), %rax	#, tmp129
	cmpq	%rax, %r8	# tmp129, tmp128
	leaq	68(%rcx), %rax	#, tmp132
	setnb	%r8b	#, tmp131
	cmpq	%rax, %rdx	# tmp132, iDst
	setnb	%al	#, tmp134
	orb	%al, %r8b	# tmp134, tmp131
	je	.L5	#,
# int_long_vector.c:1:   void micro(long * lDst, long * lSrc, int * iDst, int * iSrc) {
	xorl	%eax, %eax	# ivtmp.32
	.p2align 4,,10
	.p2align 3
.L3:
# int_long_vector.c:3:        iDst[i] = iSrc[i + 1]; // YMM : 8 (unroll 8 times)
	vmovdqu32	4(%rcx,%rax), %zmm1	# MEM[base: iSrc_16(D), index: ivtmp.32_1, offset: 4B], tmp145
# int_long_vector.c:4:        lDst[i] = lSrc[i + 1]; // ZMM : 8
	vmovdqu64	72(%rsi,%rax,2), %zmm0	# MEM[base: lSrc_19(D), index: ivtmp.32_1, step: 2, offset: 72B], MEM[base: lSrc_19(D), index: ivtmp.32_1, step: 2, offset: 72B]
# int_long_vector.c:4:        lDst[i] = lSrc[i + 1]; // ZMM : 8
	vmovdqu64	8(%rsi,%rax,2), %zmm2	# MEM[base: lSrc_19(D), index: ivtmp.32_1, step: 2, offset: 8B], tmp146
# int_long_vector.c:3:        iDst[i] = iSrc[i + 1]; // YMM : 8 (unroll 8 times)
	vmovdqu32	%zmm1, (%rdx,%rax)	# tmp145, MEM[base: iDst_17(D), index: ivtmp.32_1, offset: 0B]
# int_long_vector.c:4:        lDst[i] = lSrc[i + 1]; // ZMM : 8
	vmovdqu64	%zmm2, (%rdi,%rax,2)	# tmp146, MEM[base: lDst_20(D), index: ivtmp.32_1, step: 2, offset: 0B]
	vmovdqu64	%zmm0, 64(%rdi,%rax,2)	# MEM[base: lSrc_19(D), index: ivtmp.32_1, step: 2, offset: 72B], MEM[base: lDst_20(D), index: ivtmp.32_1, step: 2, offset: 64B]
	addq	$64, %rax	#, ivtmp.32
	cmpq	$2048, %rax	#, ivtmp.32
	jne	.L3	#,
	vzeroupper
	ret	
.L5:
# int_long_vector.c:1:   void micro(long * lDst, long * lSrc, int * iDst, int * iSrc) {
	xorl	%eax, %eax	# ivtmp.26
	.p2align 4,,10
	.p2align 3
.L2:
# int_long_vector.c:3:        iDst[i] = iSrc[i + 1]; // YMM : 8 (unroll 8 times)
	movl	4(%rcx,%rax), %r8d	# MEM[base: iSrc_16(D), index: ivtmp.26_43, offset: 4B], _53
# int_long_vector.c:3:        iDst[i] = iSrc[i + 1]; // YMM : 8 (unroll 8 times)
	movl	%r8d, (%rdx,%rax)	# _53, MEM[base: iDst_17(D), index: ivtmp.26_43, offset: 0B]
# int_long_vector.c:4:        lDst[i] = lSrc[i + 1]; // ZMM : 8
	movq	8(%rsi,%rax,2), %r8	# MEM[base: lSrc_19(D), index: ivtmp.26_43, step: 2, offset: 8B], _59
# int_long_vector.c:4:        lDst[i] = lSrc[i + 1]; // ZMM : 8
	movq	%r8, (%rdi,%rax,2)	# _59, MEM[base: lDst_20(D), index: ivtmp.26_43, step: 2, offset: 0B]
	addq	$4, %rax	#, ivtmp.26
# int_long_vector.c:2:     for(int i = 0; i < 512; i++) {
	cmpq	$2048, %rax	#, ivtmp.26
	jne	.L2	#,
# int_long_vector.c:6:   }
	ret	
	.cfi_endproc
.LFE0:
	.size	micro, .-micro
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
