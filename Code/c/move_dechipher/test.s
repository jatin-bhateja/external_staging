	.text
	.file	"test.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2               # -- Begin function func
.LCPI0_0:
	.long	10                      # 0xa
	.text
	.globl	func
	.p2align	4, 0x90
	.type	func,@function
func:                                   # @func
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	andq	$-64, %rsp
	subq	$192, %rsp
	leaq	80(%rbp), %rax
	leaq	16(%rbp), %rcx
	vmovdqa64	(%rcx), %zmm0
	vmovdqa64	(%rax), %zmm1
	vmovdqa64	%zmm1 , %zmm2
	vmovdqa64	%zmm2 , %zmm1
	vmovdqa64	%zmm0, (%rsp)
	vmovdqa64	%zmm1, 64(%rsp)
	vmovdqa64	64(%rsp), %zmm0
	vpbroadcastd	.LCPI0_0(%rip), %zmm1 # zmm1 = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
	vpaddd	%zmm1, %zmm0, %zmm0
	vmovdqa64	%zmm0, (%rsp)
	vmovdqa64	(%rsp), %zmm0
	movq	%rbp, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	func, .Lfunc_end0-func
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git f35770b93323fd56b5f8e83116492ff4dc1e5126) (http://github.com/llvm-mirror/llvm.git 8322207d92e408fca8fa195f7573149792a1c719)"
	.section	".note.GNU-stack","",@progbits
