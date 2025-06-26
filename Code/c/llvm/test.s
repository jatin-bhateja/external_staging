	.file	"test.c"
	.text
	.globl	unsigned_add_overflow1
	.type	unsigned_add_overflow1, @function
unsigned_add_overflow1:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	andl	-8(%rbp), %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	orl	-8(%rbp), %eax
	movl	-4(%rbp), %esi
	movl	-8(%rbp), %ecx
	addl	%esi, %ecx
	notl	%ecx
	andl	%ecx, %eax
	orl	%edx, %eax
	shrl	$31, %eax
	cmpl	$1, %eax
	sete	%al
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	unsigned_add_overflow1, .-unsigned_add_overflow1
	.globl	unsigned_add_overflow2
	.type	unsigned_add_overflow2, @function
unsigned_add_overflow2:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	unsigned_add_overflow2, .-unsigned_add_overflow2
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
