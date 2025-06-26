	.file	"ldmxcsr.c"
	.text
	.section	.rodata
.LC2:
	.string	"MXCSR = %x\n"
.LC4:
	.string	"SRC = %lf\n"
.LC5:
	.string	"DST = %lf\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$24448, -28(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -16(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movsd	-16(%rbp), %xmm1
	movsd	.LC3(%rip), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
#APP
# 10 "ldmxcsr.c" 1
	ldmxcsr -28(%rbp) 
movq %rax , %xmm1 
	roundsd $4 , %xmm1, %xmm2 
movq %xmm2 , %rax 
	
# 0 "" 2
#NO_APP
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC5(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movsd	.LC6(%rip), %xmm0
	movsd	%xmm0, -16(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movsd	-16(%rbp), %xmm1
	movsd	.LC3(%rip), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
#APP
# 23 "ldmxcsr.c" 1
	ldmxcsr -28(%rbp) 
movq %rax , %xmm1 
	roundsd $4 , %xmm1, %xmm2 
movq %xmm2 , %rax 
	
# 0 "" 2
#NO_APP
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC5(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	4294967295
	.long	1071644671
	.align 8
.LC3:
	.long	0
	.long	1071644672
	.align 8
.LC6:
	.long	2446413372
	.long	1071644252
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
