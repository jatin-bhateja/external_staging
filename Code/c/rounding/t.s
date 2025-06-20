	.file	"t.c"
	.text
	.section	.rodata
.LC1:
	.string	"SRC = %lf\n"
.LC2:
	.string	"DST = %lf\n"
	.text
	.globl	round
	.type	round, @function
round:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movsd	%xmm0, -24(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	stdout(%rip), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movsd	-24(%rbp), %xmm0
#APP
# 8 "t.c" 1
	vroundsd  $1, %xmm0, %xmm0,  %xmm0 
	
# 0 "" 2
#NO_APP
	movsd	%xmm0, -8(%rbp)
	movq	stdout(%rip), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movsd	-8(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	round, .-round
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$13, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
