	.text
	.file	"rotate.c"
	.globl	rotateEL                # -- Begin function rotateEL
	.p2align	4, 0x90
	.type	rotateEL,@function
rotateEL:                               # @rotateEL
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%edx, %eax
	cltd
	idivl	%esi
	testl	%edx, %edx
	jle	.LBB0_5
# %bb.1:                                # %for.body.lr.ph
	movl	%esi, %r8d
	subl	%edx, %r8d
	movl	%edx, %r11d
	movl	%r11d, %r10d
	andl	$1, %r10d
	cmpl	$1, %edx
	jne	.LBB0_6
# %bb.2:
	xorl	%r9d, %r9d
	testq	%r10, %r10
	jne	.LBB0_4
	jmp	.LBB0_5
.LBB0_6:                                # %for.body.lr.ph.new
	subq	%r10, %r11
	xorl	%r9d, %r9d
	movl	%r8d, %ecx
	.p2align	4, 0x90
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%ecx, %eax
	cltd
	idivl	%esi
	movslq	%edx, %rax
	movl	(%rdi,%rax,4), %eax
	movl	%eax, (%rdi,%r9,4)
	leal	1(%rcx), %eax
	cltd
	idivl	%esi
	movslq	%edx, %rax
	movl	(%rdi,%rax,4), %eax
	movl	%eax, 4(%rdi,%r9,4)
	addq	$2, %r9
	addl	$2, %ecx
	cmpq	%r9, %r11
	jne	.LBB0_7
# %bb.3:                                # %for.cond.cleanup.loopexit.unr-lcssa
	testq	%r10, %r10
	je	.LBB0_5
.LBB0_4:                                # %for.body.epil
	addl	%r9d, %r8d
	movl	%r8d, %eax
	cltd
	idivl	%esi
	movslq	%edx, %rax
	movl	(%rdi,%rax,4), %eax
	movl	%eax, (%rdi,%r9,4)
.LBB0_5:                                # %for.cond.cleanup
	retq
.Lfunc_end0:
	.size	rotateEL, .Lfunc_end0-rotateEL
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 249cf79bade5af443c2a997b5cf645aa1a9e2843) (http://github.com/llvm-mirror/llvm.git 551e44401a9806760bcb1a69dfabaa10145f6e56)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
