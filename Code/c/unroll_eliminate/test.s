	.file	"test.c"
	.text
	.p2align 4
	.globl	micro
	.type	micro, @function
micro:
.LFB34:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	l2(%rip), %rdx
	movq	%rdx, %xmm0
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	l3(%rip), %rax
	movq	%rax, %xmm1
	punpcklqdq	%xmm1, %xmm0
	movq	%xmm0, %rax
	movups	%xmm0, 8(%rsp)
	movq	(%rax), %rdi
	call	strlen@PLT
	movq	%rax, %rbx
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	call	strlen@PLT
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	leal	3(%rbx,%rax), %eax
	jne	.L5
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE34:
	.size	micro, .-micro
	.globl	l3
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"LV3"
	.section	.data.rel.ro.local,"aw"
	.align 8
	.type	l3, @object
	.size	l3, 8
l3:
	.quad	.LC0
	.globl	l2
	.section	.rodata.str1.1
.LC1:
	.string	"LV2"
	.section	.data.rel.ro.local
	.align 8
	.type	l2, @object
	.size	l2, 8
l2:
	.quad	.LC1
	.globl	l1
	.section	.rodata.str1.1
.LC2:
	.string	"LV1"
	.section	.data.rel.ro.local
	.align 8
	.type	l1, @object
	.size	l1, 8
l1:
	.quad	.LC2
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
