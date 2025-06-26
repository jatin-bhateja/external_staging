	.file	"stress_reg.c"
	.text
	.p2align 4
	.globl	micro1
	.type	micro1, @function
micro1:
.LFB0:
	.cfi_startproc
	endbr64
	movq	%rcx, %r11
	leaq	(%rdi,%rsi), %rax
	leaq	(%rsi,%rsi,4), %rcx
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	(%rsi,%rcx,2), %rcx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rax, %r14
	leaq	(%rdx,%r11), %r10
	subq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	imulq	%rsi, %rdi
	leaq	(%r11,%r11,4), %rcx
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	(%r11,%rcx,2), %rcx
	leaq	(%rax,%r14), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r10, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	%rcx, %rbp
	leaq	(%r8,%r9), %rbx
	leaq	(%r9,%r9,4), %rcx
	leaq	(%r9,%rcx,2), %rcx
	movq	%rbx, %r13
	leaq	(%r10,%rbp), %r15
	subq	%rcx, %r13
	imulq	%r10, %rdi
	movq	%rax, %rcx
	addq	%rdx, %rax
	imulq	%r14, %rcx
	addq	%r11, %rax
	imulq	%r11, %rdx
	addq	%r8, %rax
	addq	%r9, %rax
	imulq	%r8, %r9
	movq	%rcx, -16(%rsp)
	imulq	%rbp, %r10
	leaq	(%rbx,%r13), %rcx
	movq	%rcx, -8(%rsp)
	movq	-16(%rsp), %rcx
	imulq	%rbp, %rdx
	imulq	%r13, %rbx
	movq	-8(%rsp), %rsi
	addq	%rcx, %rax
	addq	%rax, %rdi
	leaq	(%rdi,%rdx), %rax
	leaq	(%r14,%r14,4), %rdx
	movq	%r15, %rdi
	addq	%rbx, %rax
	leaq	(%r14,%rdx,2), %rdx
	addq	%r9, %rax
	addq	%r12, %rax
	subq	%rdx, %r12
	leaq	0(%rbp,%rbp,4), %rdx
	leaq	0(%rbp,%rdx,2), %rdx
	addl	%r12d, %ecx
	subq	%rdx, %rdi
	salq	%cl, %rax
	leaq	0(%r13,%r13,4), %rdx
	movq	%rdi, %rcx
	leaq	0(%r13,%rdx,2), %rdx
	addl	%r15d, %ecx
	salq	%cl, %rax
	leal	(%r10,%rsi), %ecx
	subq	%rdx, %rsi
	salq	%cl, %rax
	movq	%rsi, %rcx
	addl	%ecx, %ecx
	salq	%cl, %rax
	movl	%ebx, %ecx
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	salq	%cl, %rax
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	micro1, .-micro1
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
