	.text
	.file	"alias.c"
	.globl	micro                   # -- Begin function micro
	.p2align	4, 0x90
	.type	micro,@function
micro:                                  # @micro
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	leaq	4096(%rdx), %r8
	cmpq	%rsi, %r8
	seta	%r11b
	leaq	4096(%rsi), %rax
	cmpq	%rdx, %rax
	seta	%bpl
	leaq	4096(%rcx), %r9
	cmpq	%rsi, %r9
	seta	%bl
	cmpq	%rcx, %rax
	seta	%r10b
	testb	%bpl, %r11b
	jne	.LBB0_4
# %bb.1:
	andb	%r10b, %bl
	jne	.LBB0_4
# %bb.2:
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	vmovdqu	(%rcx,%rax,4), %xmm0
	vmovdqu	16(%rcx,%rax,4), %xmm1
	vmovdqu	32(%rcx,%rax,4), %xmm2
	vmovdqu	48(%rcx,%rax,4), %xmm3
	vpaddd	(%rdx,%rax,4), %xmm0, %xmm0
	vpaddd	16(%rdx,%rax,4), %xmm1, %xmm1
	vpaddd	32(%rdx,%rax,4), %xmm2, %xmm2
	vpaddd	48(%rdx,%rax,4), %xmm3, %xmm3
	vmovdqu	64(%rcx,%rax,4), %xmm4
	vpaddd	64(%rdx,%rax,4), %xmm4, %xmm4
	vmovdqu	80(%rcx,%rax,4), %xmm5
	vpaddd	80(%rdx,%rax,4), %xmm5, %xmm5
	vmovdqu	96(%rcx,%rax,4), %xmm6
	vpaddd	96(%rdx,%rax,4), %xmm6, %xmm6
	vmovdqu	112(%rcx,%rax,4), %xmm7
	vpaddd	112(%rdx,%rax,4), %xmm7, %xmm7
	vmovdqu	%xmm1, 16(%rsi,%rax,4)
	vmovdqu	%xmm0, (%rsi,%rax,4)
	vmovdqu	%xmm3, 48(%rsi,%rax,4)
	vmovdqu	%xmm2, 32(%rsi,%rax,4)
	vmovdqu	%xmm5, 80(%rsi,%rax,4)
	vmovdqu	%xmm4, 64(%rsi,%rax,4)
	vmovdqu	%xmm7, 112(%rsi,%rax,4)
	vmovdqu	%xmm6, 96(%rsi,%rax,4)
	addq	$32, %rax
	cmpq	$1024, %rax             # imm = 0x400
	jne	.LBB0_3
	jmp	.LBB0_6
.LBB0_4:
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movl	(%rcx,%rax,4), %ebp
	addl	(%rdx,%rax,4), %ebp
	movl	%ebp, (%rsi,%rax,4)
	movl	4(%rcx,%rax,4), %ebp
	addl	4(%rdx,%rax,4), %ebp
	movl	%ebp, 4(%rsi,%rax,4)
	movl	8(%rcx,%rax,4), %ebp
	addl	8(%rdx,%rax,4), %ebp
	movl	%ebp, 8(%rsi,%rax,4)
	movl	12(%rcx,%rax,4), %ebp
	addl	12(%rdx,%rax,4), %ebp
	movl	%ebp, 12(%rsi,%rax,4)
	addq	$4, %rax
	cmpq	$1024, %rax             # imm = 0x400
	jne	.LBB0_5
.LBB0_6:
	cmpq	%rdi, %r8
	seta	%r8b
	leaq	4096(%rdi), %rsi
	cmpq	%rdx, %rsi
	seta	%bl
	cmpq	%rdi, %r9
	seta	%al
	cmpq	%rcx, %rsi
	seta	%sil
	testb	%bl, %r8b
	jne	.LBB0_11
# %bb.7:
	andb	%sil, %al
	jne	.LBB0_11
# %bb.8:
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	vmovdqu	(%rcx,%rax,4), %xmm0
	vmovdqu	16(%rcx,%rax,4), %xmm1
	vmovdqu	32(%rcx,%rax,4), %xmm2
	vmovdqu	48(%rcx,%rax,4), %xmm3
	vpmulld	(%rdx,%rax,4), %xmm0, %xmm0
	vpmulld	16(%rdx,%rax,4), %xmm1, %xmm1
	vpmulld	32(%rdx,%rax,4), %xmm2, %xmm2
	vpmulld	48(%rdx,%rax,4), %xmm3, %xmm3
	vmovdqu	64(%rcx,%rax,4), %xmm4
	vpmulld	64(%rdx,%rax,4), %xmm4, %xmm4
	vmovdqu	80(%rcx,%rax,4), %xmm5
	vpmulld	80(%rdx,%rax,4), %xmm5, %xmm5
	vmovdqu	96(%rcx,%rax,4), %xmm6
	vpmulld	96(%rdx,%rax,4), %xmm6, %xmm6
	vmovdqu	112(%rcx,%rax,4), %xmm7
	vpmulld	112(%rdx,%rax,4), %xmm7, %xmm7
	vmovdqu	%xmm1, 16(%rdi,%rax,4)
	vmovdqu	%xmm0, (%rdi,%rax,4)
	vmovdqu	%xmm3, 48(%rdi,%rax,4)
	vmovdqu	%xmm2, 32(%rdi,%rax,4)
	vmovdqu	%xmm5, 80(%rdi,%rax,4)
	vmovdqu	%xmm4, 64(%rdi,%rax,4)
	vmovdqu	%xmm7, 112(%rdi,%rax,4)
	vmovdqu	%xmm6, 96(%rdi,%rax,4)
	addq	$32, %rax
	cmpq	$1024, %rax             # imm = 0x400
	jne	.LBB0_9
	jmp	.LBB0_10
.LBB0_11:
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	movl	(%rcx,%rax,4), %esi
	imull	(%rdx,%rax,4), %esi
	movl	%esi, (%rdi,%rax,4)
	movl	4(%rcx,%rax,4), %esi
	imull	4(%rdx,%rax,4), %esi
	movl	%esi, 4(%rdi,%rax,4)
	movl	8(%rcx,%rax,4), %esi
	imull	8(%rdx,%rax,4), %esi
	movl	%esi, 8(%rdi,%rax,4)
	movl	12(%rcx,%rax,4), %esi
	imull	12(%rdx,%rax,4), %esi
	movl	%esi, 12(%rdi,%rax,4)
	addq	$4, %rax
	cmpq	$1024, %rax             # imm = 0x400
	jne	.LBB0_12
.LBB0_10:
	movl	12(%rdi), %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	micro, .Lfunc_end0-micro
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
