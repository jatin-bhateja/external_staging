	.file	"VecMinR.cpp"
	.text
	.p2align 4,,15
	.globl	_Z9vminps512Dv16_f
	.type	_Z9vminps512Dv16_f, @function
_Z9vminps512Dv16_f:
.LFB4797:
	.cfi_startproc
	vshufps	$85, %xmm0, %xmm0, %xmm4
	vshufps	$255, %xmm0, %xmm0, %xmm3
	vextractf128	$0x1, %ymm0, %xmm2
	vmaxss	%xmm0, %xmm4, %xmm1
	vunpckhps	%xmm0, %xmm0, %xmm4
	vextracti64x4	$0x1, %zmm0, %ymm0
	vmaxss	%xmm1, %xmm4, %xmm1
	vmaxss	%xmm1, %xmm3, %xmm1
	vshufps	$85, %xmm2, %xmm2, %xmm3
	vmaxss	%xmm1, %xmm2, %xmm1
	vmaxss	%xmm1, %xmm3, %xmm1
	vunpckhps	%xmm2, %xmm2, %xmm3
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vmaxss	%xmm1, %xmm3, %xmm1
	vshufps	$85, %xmm0, %xmm0, %xmm3
	vmaxss	%xmm1, %xmm2, %xmm1
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vmaxss	%xmm1, %xmm0, %xmm1
	vmaxss	%xmm1, %xmm3, %xmm1
	vunpckhps	%xmm0, %xmm0, %xmm3
	vextractf128	$0x1, %ymm0, %xmm0
	vmaxss	%xmm1, %xmm3, %xmm1
	vmaxss	%xmm1, %xmm2, %xmm1
	vshufps	$85, %xmm0, %xmm0, %xmm2
	vmaxss	%xmm1, %xmm0, %xmm1
	vmaxss	%xmm1, %xmm2, %xmm1
	vunpckhps	%xmm0, %xmm0, %xmm2
	vshufps	$255, %xmm0, %xmm0, %xmm0
	vmaxss	%xmm1, %xmm2, %xmm1
	vmaxss	%xmm1, %xmm0, %xmm1
	vzeroupper
	vmovaps	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE4797:
	.size	_Z9vminps512Dv16_f, .-_Z9vminps512Dv16_f
	.p2align 4,,15
	.globl	_Z9vminps256Dv8_f
	.type	_Z9vminps256Dv8_f, @function
_Z9vminps256Dv8_f:
.LFB4798:
	.cfi_startproc
	vperm2f128	$1, %ymm0, %ymm0, %ymm1
	vminps	%ymm1, %ymm0, %ymm0
	vshufps	$14, %ymm0, %ymm0, %ymm1
	vminps	%ymm1, %ymm0, %ymm0
	vshufps	$1, %ymm0, %ymm0, %ymm1
	vminps	%ymm1, %ymm0, %ymm0
	vzeroupper
	ret
	.cfi_endproc
.LFE4798:
	.size	_Z9vminps256Dv8_f, .-_Z9vminps256Dv8_f
	.p2align 4,,15
	.globl	_Z9vminps128Dv4_f
	.type	_Z9vminps128Dv4_f, @function
_Z9vminps128Dv4_f:
.LFB4799:
	.cfi_startproc
	vshufps	$14, %xmm0, %xmm0, %xmm1
	vminps	%xmm1, %xmm0, %xmm0
	vshufps	$1, %xmm0, %xmm0, %xmm1
	vminps	%xmm1, %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE4799:
	.size	_Z9vminps128Dv4_f, .-_Z9vminps128Dv4_f
	.p2align 4,,15
	.globl	_Z8vminps64Dv4_f
	.type	_Z8vminps64Dv4_f, @function
_Z8vminps64Dv4_f:
.LFB4800:
	.cfi_startproc
	vshufps	$1, %xmm0, %xmm0, %xmm1
	vminps	%xmm1, %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE4800:
	.size	_Z8vminps64Dv4_f, .-_Z8vminps64Dv4_f
	.section	.rodata._Z9print_vecIDv4_fEvT_i.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%f "
	.section	.text._Z9print_vecIDv4_fEvT_i,"axG",@progbits,_Z9print_vecIDv4_fEvT_i,comdat
	.p2align 4,,15
	.weak	_Z9print_vecIDv4_fEvT_i
	.type	_Z9print_vecIDv4_fEvT_i, @function
_Z9print_vecIDv4_fEvT_i:
.LFB4805:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %ebx
	movl	$10, %edi
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	vmovaps	%xmm0, (%rsp)
	call	putchar@PLT
	testl	%ebx, %ebx
	jle	.L70
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	vcvtss2sd	(%rsp), %xmm0, %xmm0
	call	__printf_chk@PLT
	cmpl	$1, %ebx
	je	.L70
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	vcvtss2sd	4(%rsp), %xmm0, %xmm0
	call	__printf_chk@PLT
	cmpl	$2, %ebx
	je	.L70
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	vcvtss2sd	8(%rsp), %xmm0, %xmm0
	call	__printf_chk@PLT
	cmpl	$3, %ebx
	je	.L70
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	vcvtss2sd	12(%rsp), %xmm0, %xmm0
	call	__printf_chk@PLT
	cmpl	$4, %ebx
	je	.L70
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	vcvtss2sd	16(%rsp), %xmm0, %xmm0
	call	__printf_chk@PLT
	cmpl	$5, %ebx
	je	.L70
	movq	%rsp, %rax
	leal	-6(%rbx), %edx
	leaq	.LC0(%rip), %rbp
	leaq	4(%rax), %rbx
	leaq	(%rbx,%rdx,4), %r12
.L53:
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	%rbp, %rsi
	movl	$1, %edi
	vcvtss2sd	20(%rax), %xmm0, %xmm0
	movl	$1, %eax
	call	__printf_chk@PLT
	cmpq	%r12, %rbx
	movq	%rbx, %rax
	je	.L70
	addq	$4, %rbx
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L70:
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4805:
	.size	_Z9print_vecIDv4_fEvT_i, .-_Z9print_vecIDv4_fEvT_i
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"\nRes512 = %f\n"
.LC5:
	.string	"\nRes256 = %f\n"
.LC6:
	.string	"\nRes128 = %f\n"
.LC7:
	.string	"\nRes64 = %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB4802:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-64, %rsp
	movl	$64, %edx
	movl	$32, %esi
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x60,0x6
	.cfi_escape 0x10,0xe,0x2,0x76,0x78
	.cfi_escape 0x10,0xd,0x2,0x76,0x70
	.cfi_escape 0x10,0xc,0x2,0x76,0x68
	leaq	-216(%rbp), %rdi
	pushq	%rbx
	xorl	%r12d, %r12d
	subq	$264, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	posix_memalign@PLT
	testl	%eax, %eax
	jne	.L73
	movq	-216(%rbp), %r12
.L73:
	vmovaps	.LC1(%rip), %zmm0
	movl	$10, %edi
	vmovups	%zmm0, (%r12)
	movl	$0xc0600000, 28(%r12)
	movl	$0xc0200000, 12(%r12)
	vmovaps	(%r12), %zmm3
	vmovaps	%zmm3, -304(%rbp)
	vmovaps	%zmm3, -176(%rbp)
	vzeroupper
	leaq	-176(%rbp), %rbx
	leaq	.LC0(%rip), %r13
	leaq	64(%rbx), %r14
	call	putchar@PLT
.L74:
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	%r13, %rsi
	movl	$1, %edi
	movl	$1, %eax
	addq	$4, %rbx
	vcvtss2sd	-4(%rbx), %xmm0, %xmm0
	call	__printf_chk@PLT
	cmpq	%r14, %rbx
	jne	.L74
	vmovaps	-304(%rbp), %zmm0
	call	_Z9vminps512Dv16_f
	leaq	.LC4(%rip), %rsi
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	vmovaps	(%r12), %ymm2
	movl	$10, %edi
	vmovaps	%ymm2, -304(%rbp)
	vmovaps	%ymm2, -208(%rbp)
	vzeroupper
	leaq	-208(%rbp), %rbx
	leaq	.LC0(%rip), %r13
	leaq	32(%rbx), %r14
	call	putchar@PLT
	.p2align 4,,10
	.p2align 3
.L75:
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	%r13, %rsi
	movl	$1, %edi
	movl	$1, %eax
	addq	$4, %rbx
	vcvtss2sd	-4(%rbx), %xmm0, %xmm0
	call	__printf_chk@PLT
	cmpq	%r14, %rbx
	jne	.L75
	vmovaps	-304(%rbp), %ymm0
	call	_Z9vminps256Dv8_f
	leaq	.LC5(%rip), %rsi
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	vmovaps	(%r12), %xmm1
	movl	$4, %edi
	vmovaps	%xmm1, %xmm0
	vmovaps	%xmm1, -304(%rbp)
	call	_Z9print_vecIDv4_fEvT_i
	vmovaps	-304(%rbp), %xmm0
	call	_Z9vminps128Dv4_f
	leaq	.LC6(%rip), %rsi
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	vmovaps	-304(%rbp), %xmm0
	movl	$2, %edi
	call	_Z9print_vecIDv4_fEvT_i
	vmovaps	-304(%rbp), %xmm0
	call	_Z8vminps64Dv4_f
	leaq	.LC7(%rip), %rsi
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L83
	addq	$264, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L83:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4802:
	.size	main, .-main
	.section	.rodata
	.align 64
.LC1:
	.long	1066192077
	.long	1074161254
	.long	1078355558
	.long	1082340147
	.long	1084437299
	.long	1086534451
	.long	1088631603
	.long	1090623898
	.long	1091672474
	.long	1092721050
	.long	1093769626
	.long	1094818202
	.long	1095866778
	.long	1096915354
	.long	1097963930
	.long	1098960077
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
