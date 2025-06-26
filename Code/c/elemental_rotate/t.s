	.file	"t.cpp"
	.text
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	_Z8printVecPii
	.type	_Z8printVecPii, @function
_Z8printVecPii:
.LFB3677:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, -4(%rbp)
.L3:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.L2
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
	jmp	.L3
.L2:
	movl	$10, %edi
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3677:
	.size	_Z8printVecPii, .-_Z8printVecPii
	.globl	_Z7shiftELv
	.type	_Z7shiftELv, @function
_Z7shiftELv:
.LFB3678:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	subq	$136, %rsp
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$2, -116(%rbp)
	vpbroadcastd	-116(%rbp), %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	vmovdqa	-112(%rbp), %ymm0
	movl	$8, %edi
	call	_Z8printVecIDv4_xEvT_i
	movq	-112(%rbp), %rax
	movq	-24(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	addq	$136, %rsp
	popq	%r10
	.cfi_def_cfa 10, 0
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3678:
	.size	_Z7shiftELv, .-_Z7shiftELv
	.globl	main
	.type	main, @function
main:
.LFB3679:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	_Z7shiftELv
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3679:
	.size	main, .-main
	.section	.text._Z8printVecIDv4_xEvT_i,"axG",@progbits,_Z8printVecIDv4_xEvT_i,comdat
	.weak	_Z8printVecIDv4_xEvT_i
	.type	_Z8printVecIDv4_xEvT_i, @function
_Z8printVecIDv4_xEvT_i:
.LFB3680:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	subq	$72, %rsp
	vmovdqa	%ymm0, -80(%rbp)
	movl	%edi, -36(%rbp)
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, -20(%rbp)
.L12:
	movl	-20(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.L11
	movl	-20(%rbp), %eax
	cltq
	movq	-80(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -20(%rbp)
	jmp	.L12
.L11:
	movl	$10, %edi
	call	putchar@PLT
	nop
	addq	$72, %rsp
	popq	%r10
	.cfi_def_cfa 10, 0
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3680:
	.size	_Z8printVecIDv4_xEvT_i, .-_Z8printVecIDv4_xEvT_i
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
