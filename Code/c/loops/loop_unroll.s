	.text
	.file	"loop_unroll.c"
	.globl	doSum                   # -- Begin function doSum
	.p2align	4, 0x90
	.type	doSum,@function
doSum:                                  # @doSum
	.cfi_startproc
# %bb.0:                                # %entry
	leaq	64(%rdi), %rcx
	leaq	64(%rsi), %rax
	leaq	64(%rdx), %r8
	cmpq	%rdi, %rax
	seta	%r9b
	cmpq	%rsi, %rcx
	seta	%r10b
	cmpq	%rdi, %r8
	seta	%al
	cmpq	%rdx, %rcx
	seta	%cl
	testb	%r10b, %r9b
	jne	.LBB0_5
# %bb.1:                                # %entry
	andb	%cl, %al
	jne	.LBB0_5
# %bb.2:                                # %vector.body.preheader
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_3:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovups	(%rsi,%rax,4), %zmm0
	vaddps	(%rdx,%rax,4), %zmm0, %zmm0
	vmovups	%zmm0, (%rdi,%rax,4)
	addq	$16, %rax
	cmpq	$16, %rax
	jne	.LBB0_3
	jmp	.LBB0_4
.LBB0_5:                                # %for.body.preheader
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovss	(%rsi,%rax,4), %xmm0    # xmm0 = mem[0],zero,zero,zero
	vaddss	(%rdx,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rdi,%rax,4)
	addq	$1, %rax
	cmpq	$16, %rax
	jne	.LBB0_6
.LBB0_4:                                # %for.cond.cleanup
	vzeroupper
	retq
.Lfunc_end0:
	.size	doSum, .Lfunc_end0-doSum
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 5a290db4b49c7f391b3038372cb69fdfc9f07725) (http://github.com/llvm-mirror/llvm.git 9b0581974207d38a5ef880bed858a33e6cbf12db)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
