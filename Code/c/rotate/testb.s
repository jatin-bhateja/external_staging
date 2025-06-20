	.text
	.file	"testb.c"
	.section	.rodata,"a",@progbits
	.p2align	6               # -- Begin function loadVec
.LCPI0_0:
	.quad	1                       # 0x1
	.quad	2                       # 0x2
	.quad	3                       # 0x3
	.quad	4                       # 0x4
	.quad	5                       # 0x5
	.quad	6                       # 0x6
	.quad	7                       # 0x7
	.quad	8                       # 0x8
	.text
	.globl	loadVec
	.p2align	4, 0x90
	.type	loadVec,@function
loadVec:                                # @loadVec
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	andq	$-64, %rsp
	subq	$128, %rsp
	vmovdqa64	.LCPI0_0(%rip), %zmm0 # zmm0 = [1,2,3,4,5,6,7,8]
	vmovdqa64	%zmm0, (%rsp)
	vmovdqa64	(%rsp), %zmm0
	movq	%rbp, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	loadVec, .Lfunc_end0-loadVec
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 249cf79bade5af443c2a997b5cf645aa1a9e2843) (http://github.com/llvm-mirror/llvm.git 551e44401a9806760bcb1a69dfabaa10145f6e56)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
