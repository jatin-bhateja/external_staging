	.text
	.file	"t.c"
	.globl	doSum                   # -- Begin function doSum
	.p2align	4, 0x90
	.type	doSum,@function
doSum:                                  # @doSum
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vpaddq	%xmm1, %xmm0, %xmm0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	doSum, .Lfunc_end0-doSum
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 0b3908b51cbf65f3bcf18f2503532ae49f80a91b) (http://github.com/llvm-mirror/llvm.git 52536b57c44723d1aae559e04a427181778099ff)"
	.section	".note.GNU-stack","",@progbits
