	.text
	.file	"test_intrin.c"
	.globl	JNI_MinReduction_512    # -- Begin function JNI_MinReduction_512
	.p2align	4, 0x90
	.type	JNI_MinReduction_512,@function
JNI_MinReduction_512:                   # @JNI_MinReduction_512
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vextractf64x4	$1, %zmm0, %ymm1
	vminpd	%ymm1, %ymm0, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vminpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vminpd	%xmm1, %xmm0, %xmm0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Lfunc_end0:
	.size	JNI_MinReduction_512, .Lfunc_end0-JNI_MinReduction_512
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI1_0:
	.quad	4607182418800017408     # double 1
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	-8(%rbp), %rdi
	movl	$64, %esi
	movl	$64, %edx
	callq	posix_memalign
	xorl	%ecx, %ecx
	movl	$0, %edx
	testl	%eax, %eax
	jne	.LBB1_2
# %bb.1:                                # %entry
	movq	-8(%rbp), %rdx
.LBB1_2:                                # %entry
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI1_0(%rip), %xmm1   # xmm1 = mem[0],zero
	cmpl	$7, %ecx
	ja	.LBB1_5
	.p2align	4, 0x90
.LBB1_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rcx,8)
	addq	$1, %rcx
	cmpl	$7, %ecx
	jbe	.LBB1_4
.LBB1_5:                                # %for.end
	vmovaps	(%rdx), %zmm0
	callq	JNI_MinReduction_512
	movl	$.L.str, %edi
	movb	$1, %al
	vzeroupper
	callq	printf
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Res = %f..\n"
	.size	.L.str, 12


	.ident	"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 5a290db4b49c7f391b3038372cb69fdfc9f07725) (http://github.com/llvm-mirror/llvm.git 9b0581974207d38a5ef880bed858a33e6cbf12db)"
	.section	".note.GNU-stack","",@progbits
