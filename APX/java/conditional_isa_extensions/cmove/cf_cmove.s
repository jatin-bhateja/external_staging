	.file	"cf_cmove.c"
	.text
	.globl	gsrc
	.data
	.align 8
	.type	gsrc, @object
	.size	gsrc, 8
gsrc:
	.quad	20
	.globl	gdst
	.align 8
	.type	gdst, @object
	.size	gdst, 8
gdst:
	.quad	30
	.section	.rodata
.LC0:
	.string	"gdst = %ld\n"
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
	subq	$32, %rsp
	movq	$10, -8(%rbp)
	movq	$gsrc, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
#APP
# 12 "cf_cmove.c" 1
	cmpq      $10, %rdx   
	cfcmovne  %rdx,  (%rax)   
	cmpq      $10, %rdx   
	cmovneq   %rdx , (%rax)   
	
# 0 "" 2
#NO_APP
	movq	gdst(%rip), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.0.1 20240226 (experimental)"
	.section	.note.GNU-stack,"",@progbits
