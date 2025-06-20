	.file	"micro.c"
	.text
	.globl	micro
	.type	micro, @function
micro:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
#APP
# 6 "micro.c" 1
	movq %rax , %xmm0 
	movq %rax , %xmm1 
	vpbroadcastd %xmm0 , %zmm2 
	vpbroadcastd %xmm0 , %zmm3 
	vzeroupper 
	paddd %xmm2, %xmm3 
	paddd %xmm3, %xmm3 
	paddd %xmm3, %xmm3 
	paddd %xmm3, %xmm3 
	paddd %xmm3, %xmm3 
	paddd %xmm3, %xmm3 
	paddd %xmm3, %xmm3 
	paddd %xmm3, %xmm3 
	paddd %xmm3, %xmm3 
	paddd %xmm3, %xmm3 
	paddd %xmm3, %xmm3 
	movq %xmm3 , %rax 
	
# 0 "" 2
#NO_APP
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	micro, .-micro
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	$0, -8(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L4
.L7:
	movl	$0, -12(%rbp)
	jmp	.L5
.L6:
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	cltq
	movq	%rax, %rdi
	call	micro
	addq	%rax, -8(%rbp)
	addl	$1, -12(%rbp)
.L5:
	cmpl	$9999999, -12(%rbp)
	jle	.L6
	addl	$1, -16(%rbp)
.L4:
	cmpl	$0, -16(%rbp)
	jle	.L7
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
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
