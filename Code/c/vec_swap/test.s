	.text
	.file	"test.c"
	.globl	swap                    # -- Begin function swap
	.p2align	4, 0x90
	.type	swap,@function
swap:                                   # @swap
	.cfi_startproc
# %bb.0:                                # %entry
	vmovaps	a(%rip), %zmm0
	vmovaps	b(%rip), %zmm1
	vmovaps	%zmm1, a(%rip)
	vmovaps	%zmm0, b(%rip)
	vzeroupper
	retq
.Lfunc_end0:
	.size	swap, .Lfunc_end0-swap
	.cfi_endproc
                                        # -- End function
	.type	a,@object               # @a
	.comm	a,64,64
	.type	b,@object               # @b
	.comm	b,64,64

	.ident	"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 60fda03659048b6ea10625d090572a840e09f6a2) (http://github.com/llvm-mirror/llvm.git d3d04773fe8e213c076fa7ee1ba372ab0dff834f)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
