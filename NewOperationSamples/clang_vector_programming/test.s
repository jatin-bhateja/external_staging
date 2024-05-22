	.file	"test.cxx"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"void unsafe_vector_add(int*, int*, int*, int)"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"test.cxx"
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"(reinterpret_cast<uint64_t>(res) & 0x3L) == 0L"
	.align 8
.LC3:
	.string	"(reinterpret_cast<uint64_t>(src1) & 0x3L) == 0L"
	.align 8
.LC4:
	.string	"(reinterpret_cast<uint64_t>(src2) & 0x3L) == 0L"
	.text
	.p2align 4
	.globl	_Z17unsafe_vector_addPiS_S_i
	.type	_Z17unsafe_vector_addPiS_S_i, @function
_Z17unsafe_vector_addPiS_S_i:
.LFB376:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-64, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	testb	$3, %dil
	jne	.L31
	testb	$3, %sil
	jne	.L32
	movq	%rdx, %r8
	andl	$3, %r8d
	jne	.L33
	testb	$63, %dil
	jne	.L34
.L5:
	movl	%ecx, %r10d
	andl	$-16, %r10d
	jle	.L35
.L7:
	subl	$1, %r10d
	xorl	%eax, %eax
	shrl	$4, %r10d
	movl	%r10d, %r9d
	addq	$1, %r9
	salq	$6, %r9
	.p2align 4,,10
	.p2align 3
.L10:
	vmovdqu64	(%rsi,%rax), %zmm1
	vpaddq	(%rdx,%rax), %zmm1, %zmm0
	vmovdqu64	%zmm0, (%rdi,%rax)
	addq	$64, %rax
	cmpq	%r9, %rax
	jne	.L10
	addl	$1, %r10d
	addq	%rax, %rdi
	addq	%rax, %rsi
	addq	%rax, %rdx
	sall	$4, %r10d
.L11:
	cmpl	%r10d, %ecx
	jle	.L28
	movslq	%r10d, %rax
	leaq	64(,%rax,4), %r12
	leaq	0(,%rax,4), %r9
	leaq	(%rdi,%r9), %r11
	leaq	(%rsi,%r12), %r13
	leaq	(%rdi,%r12), %r14
	leaq	(%rsi,%r9), %rbx
	addq	%rdx, %r9
	cmpq	%r13, %r11
	setnb	%r15b
	cmpq	%r14, %rbx
	setnb	%r13b
	orl	%r15d, %r13d
	cmpq	%r14, %r9
	setnb	%r14b
	addq	%rdx, %r12
	cmpq	%r12, %r11
	setnb	%r12b
	orl	%r14d, %r12d
	testb	%r12b, %r13b
	je	.L23
	leal	-1(%rcx), %r12d
	subl	%r10d, %r12d
	cmpl	$14, %r12d
	jbe	.L23
	movl	%ecx, %r12d
	subl	%r10d, %r12d
	movl	%r12d, %eax
	shrl	$4, %eax
	salq	$6, %rax
	.p2align 4,,10
	.p2align 3
.L13:
	vmovdqu32	(%rbx,%r8), %zmm2
	vpaddd	(%r9,%r8), %zmm2, %zmm0
	vmovdqu32	%zmm0, (%r11,%r8)
	addq	$64, %r8
	cmpq	%rax, %r8
	jne	.L13
	movl	%r12d, %eax
	andl	$-16, %eax
	addl	%eax, %r10d
	cmpl	%eax, %r12d
	je	.L28
	movslq	%r10d, %rax
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	leal	1(%r10), %eax
	cmpl	%eax, %ecx
	jle	.L28
	cltq
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	leal	2(%r10), %eax
	cmpl	%eax, %ecx
	jle	.L28
	cltq
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	leal	3(%r10), %eax
	cmpl	%eax, %ecx
	jle	.L28
	cltq
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	leal	4(%r10), %eax
	cmpl	%eax, %ecx
	jle	.L28
	cltq
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	leal	5(%r10), %eax
	cmpl	%eax, %ecx
	jle	.L28
	cltq
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	leal	6(%r10), %eax
	cmpl	%eax, %ecx
	jle	.L28
	cltq
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	leal	7(%r10), %eax
	cmpl	%eax, %ecx
	jle	.L28
	cltq
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	leal	8(%r10), %eax
	cmpl	%eax, %ecx
	jle	.L28
	cltq
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	leal	9(%r10), %eax
	cmpl	%eax, %ecx
	jle	.L28
	cltq
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	leal	10(%r10), %eax
	cmpl	%eax, %ecx
	jle	.L28
	cltq
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	leal	11(%r10), %eax
	cmpl	%eax, %ecx
	jle	.L28
	cltq
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	leal	12(%r10), %eax
	cmpl	%eax, %ecx
	jle	.L28
	cltq
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	leal	13(%r10), %eax
	cmpl	%eax, %ecx
	jle	.L28
	cltq
	addl	$14, %r10d
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	cmpl	%r10d, %ecx
	jle	.L28
	movslq	%r10d, %rax
	movl	(%rdx,%rax,4), %edx
	addl	(%rsi,%rax,4), %edx
	movl	%edx, (%rdi,%rax,4)
.L28:
	vzeroupper
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	.cfi_restore_state
	movl	(%rdx,%rax,4), %r8d
	addl	(%rsi,%rax,4), %r8d
	movl	%r8d, (%rdi,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ecx
	jg	.L23
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L34:
	leaq	64(%rdi), %rax
	andq	$-64, %rax
	subq	%rdi, %rax
	shrq	$2, %rax
	movl	%eax, %r9d
	testl	%eax, %eax
	je	.L5
	.p2align 4,,10
	.p2align 3
.L6:
	movl	(%rdx), %eax
	addl	(%rsi), %eax
	movl	%eax, (%rdi)
	subl	$1, %r9d
	jne	.L6
	movl	%ecx, %r10d
	andl	$-16, %r10d
	jg	.L7
.L35:
	xorl	%r10d, %r10d
	jmp	.L11
.L33:
	leaq	.LC0(%rip), %rcx
	movl	$42, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	__assert_fail@PLT
.L32:
	leaq	.LC0(%rip), %rcx
	movl	$41, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	__assert_fail@PLT
.L31:
	leaq	.LC0(%rip), %rcx
	movl	$40, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE376:
	.size	_Z17unsafe_vector_addPiS_S_i, .-_Z17unsafe_vector_addPiS_S_i
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Incorrect Arguments!\n<app> <size>\n"
	.section	.rodata.str1.1
.LC7:
	.string	"[time] %lf  [res] %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB377:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$3, %edi
	je	.L37
	movq	stderr(%rip), %rcx
	movl	$34, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	fwrite@PLT
.L37:
	movq	8(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %r14
	movl	%eax, %r15d
	call	strtol@PLT
	movslq	%r14d, %r14
	leaq	0(,%r14,4), %r12
	movq	%rax, %rbx
	movq	%r12, %rdi
	call	malloc@PLT
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	malloc@PLT
	movq	%r12, %rdi
	movq	%rax, %r13
	call	malloc@PLT
	movq	%r14, %rdx
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	memset@PLT
	movq	%r14, %rdx
	movl	$1, %esi
	movq	%rbp, %rdi
	call	memset@PLT
	leaq	_Z17unsafe_vector_addPiS_S_i(%rip), %r14
	testl	%ebx, %ebx
	jne	.L38
	movq	_Z17unsafe_scalar_addPiS_S_i@GOTPCREL(%rip), %r14
.L38:
	movl	$500000, %ebx
	.p2align 4,,10
	.p2align 3
.L39:
	movl	%r15d, %ecx
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	*%r14
	subl	$1, %ebx
	jne	.L39
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	movl	$1000000, %ebx
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L40:
	movl	%r15d, %ecx
	movq	%r13, %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	*%r14
	subl	$1, %ebx
	jne	.L40
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	movl	(%r12), %edx
	subq	8(%rsp), %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	$1, %edi
	leaq	.LC7(%rip), %rsi
	movl	$1, %eax
	vdivsd	.LC6(%rip), %xmm0, %xmm0
	call	__printf_chk@PLT
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE377:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC6:
	.long	0
	.long	1104006501
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
