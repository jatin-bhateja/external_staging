	.file	"test_add_demotion.c"
	.text
	.globl	micro
	.type	micro, @function
micro:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	leaq	100(%rax), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	leaq	100(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	24(%rbp), %rax
	addq	%rax, %rdx
	movq	32(%rbp), %rax
	addq	%rax, %rdx
	movq	40(%rbp), %rax
	addq	%rax, %rdx
	movq	48(%rbp), %rax
	addq	%rax, %rdx
	movq	56(%rbp), %rax
	addq	%rax, %rdx
	movq	64(%rbp), %rax
	addq	%rax, %rdx
	movq	72(%rbp), %rax
	addq	%rax, %rdx
	movq	80(%rbp), %rax
	addq	%rax, %rdx
	movq	88(%rbp), %rax
	addq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	micro, .-micro
	.ident	"GCC: (GNU) 14.0.1 20240226 (experimental)"
	.section	.note.GNU-stack,"",@progbits
