	.file	"loop.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4032, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -4028(%rbp)
	jmp	.L2
.L7:
	movl	$0, -4024(%rbp)
	jmp	.L3
.L6:
	movl	$0, -4020(%rbp)
	jmp	.L4
.L5:
#APP
# 9 "loop.c" 1
	nop 
	
# 0 "" 2
#NO_APP
	movl	-4020(%rbp), %eax
	cltq
	movl	$10, -4016(%rbp,%rax,4)
#APP
# 11 "loop.c" 1
	nop 
	
# 0 "" 2
#NO_APP
	addl	$1, -4020(%rbp)
.L4:
	cmpl	$999, -4020(%rbp)
	jle	.L5
	addl	$1, -4024(%rbp)
.L3:
	cmpl	$999, -4024(%rbp)
	jle	.L6
	addl	$1, -4028(%rbp)
.L2:
	cmpl	$999, -4028(%rbp)
	jle	.L7
	movl	-3836(%rbp), %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
