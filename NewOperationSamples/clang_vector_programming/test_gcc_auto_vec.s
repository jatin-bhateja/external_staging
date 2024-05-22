	.file	"test_gcc_auto_vec.cxx"
	.text
	.p2align 4
	.globl	_Z17unsafe_scalar_addPiS_S_i
	.type	_Z17unsafe_scalar_addPiS_S_i, @function
_Z17unsafe_scalar_addPiS_S_i:
.LFB0:
	.cfi_startproc
	endbr64
	testl	%ecx, %ecx
	jle	.L30
	leaq	63(%rsi), %r8
	leal	-1(%rcx), %eax
	subq	%rdi, %r8
	cmpq	$126, %r8
	seta	%r9b
	cmpl	$14, %eax
	seta	%r8b
	testb	%r8b, %r9b
	je	.L3
	leaq	63(%rdx), %r8
	subq	%rdi, %r8
	cmpq	$126, %r8
	jbe	.L3
	movl	%ecx, %r8d
	xorl	%eax, %eax
	shrl	$4, %r8d
	salq	$6, %r8
	.p2align 4,,10
	.p2align 3
.L4:
	vmovdqu32	(%rsi,%rax), %zmm1
	vpaddd	(%rdx,%rax), %zmm1, %zmm0
	vmovdqu32	%zmm0, (%rdi,%rax)
	addq	$64, %rax
	cmpq	%r8, %rax
	jne	.L4
	movl	%ecx, %eax
	andl	$-16, %eax
	testb	$15, %cl
	je	.L29
	movl	%eax, %r8d
	movl	(%rdx,%r8,4), %r9d
	addl	(%rsi,%r8,4), %r9d
	movl	%r9d, (%rdi,%r8,4)
	leal	1(%rax), %r8d
	cmpl	%r8d, %ecx
	jle	.L29
	movslq	%r8d, %r8
	movl	(%rdx,%r8,4), %r9d
	addl	(%rsi,%r8,4), %r9d
	movl	%r9d, (%rdi,%r8,4)
	leal	2(%rax), %r8d
	cmpl	%r8d, %ecx
	jle	.L29
	movslq	%r8d, %r8
	movl	(%rdx,%r8,4), %r9d
	addl	(%rsi,%r8,4), %r9d
	movl	%r9d, (%rdi,%r8,4)
	leal	3(%rax), %r8d
	cmpl	%r8d, %ecx
	jle	.L29
	movslq	%r8d, %r8
	movl	(%rdx,%r8,4), %r9d
	addl	(%rsi,%r8,4), %r9d
	movl	%r9d, (%rdi,%r8,4)
	leal	4(%rax), %r8d
	cmpl	%r8d, %ecx
	jle	.L29
	movslq	%r8d, %r8
	movl	(%rdx,%r8,4), %r9d
	addl	(%rsi,%r8,4), %r9d
	movl	%r9d, (%rdi,%r8,4)
	leal	5(%rax), %r8d
	cmpl	%r8d, %ecx
	jle	.L29
	movslq	%r8d, %r8
	movl	(%rdx,%r8,4), %r9d
	addl	(%rsi,%r8,4), %r9d
	movl	%r9d, (%rdi,%r8,4)
	leal	6(%rax), %r8d
	cmpl	%r8d, %ecx
	jle	.L29
	movslq	%r8d, %r8
	movl	(%rdx,%r8,4), %r9d
	addl	(%rsi,%r8,4), %r9d
	movl	%r9d, (%rdi,%r8,4)
	leal	7(%rax), %r8d
	cmpl	%r8d, %ecx
	jle	.L29
	movslq	%r8d, %r8
	movl	(%rdx,%r8,4), %r9d
	addl	(%rsi,%r8,4), %r9d
	movl	%r9d, (%rdi,%r8,4)
	leal	8(%rax), %r8d
	cmpl	%r8d, %ecx
	jle	.L29
	movslq	%r8d, %r8
	movl	(%rdx,%r8,4), %r9d
	addl	(%rsi,%r8,4), %r9d
	movl	%r9d, (%rdi,%r8,4)
	leal	9(%rax), %r8d
	cmpl	%r8d, %ecx
	jle	.L29
	movslq	%r8d, %r8
	movl	(%rdx,%r8,4), %r9d
	addl	(%rsi,%r8,4), %r9d
	movl	%r9d, (%rdi,%r8,4)
	leal	10(%rax), %r8d
	cmpl	%r8d, %ecx
	jle	.L29
	movslq	%r8d, %r8
	movl	(%rdx,%r8,4), %r9d
	addl	(%rsi,%r8,4), %r9d
	movl	%r9d, (%rdi,%r8,4)
	leal	11(%rax), %r8d
	cmpl	%r8d, %ecx
	jle	.L29
	movslq	%r8d, %r8
	movl	(%rdx,%r8,4), %r9d
	addl	(%rsi,%r8,4), %r9d
	movl	%r9d, (%rdi,%r8,4)
	leal	12(%rax), %r8d
	cmpl	%r8d, %ecx
	jle	.L29
	movslq	%r8d, %r8
	movl	(%rdx,%r8,4), %r9d
	addl	(%rsi,%r8,4), %r9d
	movl	%r9d, (%rdi,%r8,4)
	leal	13(%rax), %r8d
	cmpl	%r8d, %ecx
	jle	.L29
	movslq	%r8d, %r8
	addl	$14, %eax
	movl	(%rdx,%r8,4), %r9d
	addl	(%rsi,%r8,4), %r9d
	movl	%r9d, (%rdi,%r8,4)
	cmpl	%eax, %ecx
	jle	.L29
	cltq
	movl	(%rdx,%rax,4), %edx
	addl	(%rsi,%rax,4), %edx
	movl	%edx, (%rdi,%rax,4)
	vzeroupper
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	vzeroupper
.L30:
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%eax, %r8d
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7:
	movl	(%rdx,%rax,4), %ecx
	addl	(%rsi,%rax,4), %ecx
	movl	%ecx, (%rdi,%rax,4)
	movq	%rax, %rcx
	addq	$1, %rax
	cmpq	%r8, %rcx
	jne	.L7
	ret
	.cfi_endproc
.LFE0:
	.size	_Z17unsafe_scalar_addPiS_S_i, .-_Z17unsafe_scalar_addPiS_S_i
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
