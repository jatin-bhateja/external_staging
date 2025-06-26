	.text
	.file	"minRedF.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2               # -- Begin function micro
.LCPI0_0:
	.long	10                      # 0xa
	.text
	.globl	micro
	.p2align	4, 0x90
	.type	micro,@function
micro:                                  # @micro
	.cfi_startproc
# %bb.0:
	testl	%esi, %esi
	jle	.LBB0_1
# %bb.2:
	movl	%esi, %ecx
	cmpl	$31, %esi
	ja	.LBB0_4
# %bb.3:
	xorl	%edx, %edx
	xorl	%eax, %eax
	jmp	.LBB0_12
.LBB0_1:
	xorl	%eax, %eax
                                        # kill: def $eax killed $eax killed $rax
	retq
.LBB0_4:
	movl	%ecx, %edx
	andl	$-32, %edx
	leaq	-32(%rdx), %rsi
	movq	%rsi, %rax
	shrq	$5, %rax
	incq	%rax
	movl	%eax, %r8d
	andl	$1, %r8d
	testq	%rsi, %rsi
	je	.LBB0_5
# %bb.6:
	movq	%r8, %rsi
	subq	%rax, %rsi
	vpxor	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	vpbroadcastd	.LCPI0_0(%rip), %ymm4 # ymm4 = [10,10,10,10,10,10,10,10]
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm3, %xmm3, %xmm3
	vpxor	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	vpmulld	(%rdi,%rax,4), %ymm4, %ymm5
	vpmulld	32(%rdi,%rax,4), %ymm4, %ymm6
	vpmulld	64(%rdi,%rax,4), %ymm4, %ymm7
	vpmulld	96(%rdi,%rax,4), %ymm4, %ymm8
	vpaddd	%ymm4, %ymm0, %ymm0
	vpaddd	%ymm4, %ymm1, %ymm1
	vpaddd	%ymm4, %ymm3, %ymm3
	vpmulld	128(%rdi,%rax,4), %ymm4, %ymm9
	vpmulld	160(%rdi,%rax,4), %ymm4, %ymm10
	vpmulld	192(%rdi,%rax,4), %ymm4, %ymm11
	vpaddd	%ymm4, %ymm2, %ymm2
	vpmulld	224(%rdi,%rax,4), %ymm4, %ymm12
	vpaddd	%ymm4, %ymm0, %ymm0
	vpaddd	%ymm0, %ymm5, %ymm0
	vpaddd	%ymm0, %ymm9, %ymm0
	vpaddd	%ymm4, %ymm1, %ymm1
	vpaddd	%ymm1, %ymm6, %ymm1
	vpaddd	%ymm1, %ymm10, %ymm1
	vpaddd	%ymm4, %ymm3, %ymm3
	vpaddd	%ymm3, %ymm7, %ymm3
	vpaddd	%ymm3, %ymm11, %ymm3
	vpaddd	%ymm4, %ymm2, %ymm2
	vpaddd	%ymm2, %ymm8, %ymm2
	vpaddd	%ymm2, %ymm12, %ymm2
	addq	$64, %rax
	addq	$2, %rsi
	jne	.LBB0_7
# %bb.8:
	vpaddd	%ymm4, %ymm0, %ymm5
	vpaddd	%ymm4, %ymm1, %ymm6
	vpaddd	%ymm4, %ymm3, %ymm7
	vpaddd	%ymm4, %ymm2, %ymm4
	testq	%r8, %r8
	je	.LBB0_11
.LBB0_10:
	vpbroadcastd	.LCPI0_0(%rip), %ymm0 # ymm0 = [10,10,10,10,10,10,10,10]
	vpmulld	96(%rdi,%rax,4), %ymm0, %ymm1
	vpaddd	%ymm1, %ymm4, %ymm2
	vpmulld	64(%rdi,%rax,4), %ymm0, %ymm1
	vpmulld	32(%rdi,%rax,4), %ymm0, %ymm4
	vpaddd	%ymm1, %ymm7, %ymm3
	vpaddd	%ymm4, %ymm6, %ymm1
	vpmulld	(%rdi,%rax,4), %ymm0, %ymm0
	vpaddd	%ymm0, %ymm5, %ymm0
.LBB0_11:
	vpaddd	%ymm2, %ymm3, %ymm2
	vpaddd	%ymm0, %ymm1, %ymm0
	vpaddd	%ymm2, %ymm0, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$78, %xmm0, %xmm1       # xmm1 = xmm0[2,3,0,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$229, %xmm0, %xmm1      # xmm1 = xmm0[1,1,2,3]
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %eax
	cmpq	%rcx, %rdx
	je	.LBB0_13
	.p2align	4, 0x90
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	movl	(%rdi,%rdx,4), %esi
	leal	(%rsi,%rsi,4), %esi
	leal	(%rax,%rsi,2), %eax
	addl	$10, %eax
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.LBB0_12
.LBB0_13:
                                        # kill: def $eax killed $eax killed $rax
	vzeroupper
	retq
.LBB0_5:
	vpbroadcastd	.LCPI0_0(%rip), %ymm5 # ymm5 = [10,10,10,10,10,10,10,10]
	xorl	%eax, %eax
                                        # implicit-def: $ymm0
                                        # implicit-def: $ymm1
                                        # implicit-def: $ymm3
                                        # implicit-def: $ymm2
	vmovdqa	%ymm5, %ymm6
	vmovdqa	%ymm5, %ymm7
	vmovdqa	%ymm5, %ymm4
	testq	%r8, %r8
	jne	.LBB0_10
	jmp	.LBB0_11
.Lfunc_end0:
	.size	micro, .Lfunc_end0-micro
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
