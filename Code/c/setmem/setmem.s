	.file	"setmem.c"
	.text
	.p2align 4,,15
	.globl	SetMemory
	.type	SetMemory, @function
SetMemory:
.LFB0:
	.cfi_startproc
	movsbq	%dil, %rdi
	testq	%rdi, %rdi
	je	.L2
	movq	%rdi, %rax
	salq	$8, %rax
	addq	%rdi, %rax
	movq	%rax, %rdi
	salq	$16, %rdi
	addq	%rdi, %rax
	movq	%rax, %rdi
	salq	$32, %rdi
	addq	%rax, %rdi
.L2:
	movslq	%esi, %rsi
	testq	%rsi, %rsi
	je	.L12
	subq	$1, %rsi
	shrq	$3, %rsi
	salq	$5, %rsi
	leaq	32(%rdx,%rsi), %rax
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%rdi, (%rdx)
	addq	$32, %rdx
	cmpq	%rax, %rdx
	jne	.L4
.L12:
	rep ret
	.cfi_endproc
.LFE0:
	.size	SetMemory, .-SetMemory
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
