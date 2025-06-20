	.file	"t1.cpp"
	.text
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	_Z8printVecDv4_xi
	.type	_Z8printVecDv4_xi, @function
_Z8printVecDv4_xi:
.LFB3676:
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
.L3:
	movl	-20(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.L2
	movl	-20(%rbp), %eax
	cltq
	movq	-80(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -20(%rbp)
	jmp	.L3
.L2:
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
.LFE3676:
	.size	_Z8printVecDv4_xi, .-_Z8printVecDv4_xi
	.globl	_Z7shiftELi
	.type	_Z7shiftELi, @function
_Z7shiftELi:
.LFB3677:
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
	subq	$104, %rsp
	movl	%edi, -84(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
#APP
# 21 "t1.cpp" 1
	vpbroadcastd -84(%rbp) , %ymm0 
	
# 0 "" 2
#NO_APP
	vmovdqa	%ymm0, -80(%rbp)
	vmovdqa	-80(%rbp), %ymm0
	movl	$8, %edi
	call	_Z8printVecDv4_xi
	movq	-64(%rbp), %rax
	movq	-24(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	addq	$104, %rsp
	popq	%r10
	.cfi_def_cfa 10, 0
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3677:
	.size	_Z7shiftELi, .-_Z7shiftELi
	.globl	main
	.type	main, @function
main:
.LFB3678:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	_Z7shiftELi
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3678:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
