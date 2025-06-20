	.text
	.file	"loop.c"
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
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovss	(%rsi,%rax,4), %xmm0    # xmm0 = mem[0],zero,zero,zero
	vaddss	(%rdx,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rdi,%rax,4)
	vmovss	%xmm0, 16(%rdi,%rax,4)
	incq	%rax
	cmpl	$16, %eax
	jl	.LBB0_1
# %bb.2:                                # %for.end
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	doSum, .Lfunc_end0-doSum
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 60fda03659048b6ea10625d090572a840e09f6a2) (http://github.com/llvm-mirror/llvm.git d3d04773fe8e213c076fa7ee1ba372ab0dff834f)"
	.section	".note.GNU-stack","",@progbits
