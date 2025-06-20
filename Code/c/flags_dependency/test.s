	.file	"test.c"
	.text
	.globl	micro1
	.type	micro1, @function
micro1:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$0, -8(%rbp)
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-40(%rbp), %rsi
#APP
# 8 "test.c" 1
	addq %rcx, %rdx     
	bsrq %rsi, %rax  
	movq %rax , %rdx 
	
# 0 "" 2
#NO_APP
	movq	%rdx, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	micro1, .-micro1
	.globl	micro2
	.type	micro2, @function
micro2:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$0, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rcx
#APP
# 21 "test.c" 1
	addq %rdx, %rax     
	incq %rcx         
	movq %rcx , %rax 
	
# 0 "" 2
#NO_APP
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	micro2, .-micro2
	.section	.rodata
	.align 8
.LC0:
	.string	"Incorrect Arguments! <app> <algo> \n"
.LC1:
	.string	"[res] %ld"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	cmpl	$2, -36(%rbp)
	je	.L6
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$35, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	movl	$-1, %eax
	jmp	.L7
.L6:
	movq	$0, -8(%rbp)
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jne	.L8
	movl	$0, -20(%rbp)
	jmp	.L9
.L10:
	movl	$30, %edx
	movl	$20, %esi
	movl	$10, %edi
	call	micro1
	addq	%rax, -8(%rbp)
	addl	$1, -20(%rbp)
.L9:
	cmpl	$9999999, -20(%rbp)
	jle	.L10
.L8:
	cmpl	$1, -12(%rbp)
	jne	.L11
	movl	$0, -16(%rbp)
	jmp	.L12
.L13:
	movl	$30, %edx
	movl	$20, %esi
	movl	$10, %edi
	call	micro2
	addq	%rax, -8(%rbp)
	addl	$1, -16(%rbp)
.L12:
	cmpl	$9999999, -16(%rbp)
	jle	.L13
.L11:
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
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
