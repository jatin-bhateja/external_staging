	.file	"test.c"
	.text
	.globl	micro1
	.type	micro1, @function
micro1:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rcx
#APP
# 5 "test.c" 1
	vmovdqu (%rdx), %ymm1             
	vmovdqu (%rcx), %ymm2             
	vpsllvw %ymm2, %ymm1, %ymm3 
	vmovdqu %ymm3, (%rax)            
	
# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	micro1, .-micro1
	.globl	micro2
	.type	micro2, @function
micro2:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movl	-20(%rbp), %ecx
#APP
# 17 "test.c" 1
	vmovdqu (%rdx), %ymm1            
	movd    %ecx, %xmm2            
	vpsllw  %xmm2, %ymm1, %ymm3 
	vmovdqu %ymm3, (%rax)            
	
# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	micro2, .-micro2
	.section	.rodata
.LC0:
	.string	"%s"
.LC1:
	.string	" %x "
	.text
	.globl	print_arr
	.type	print_arr, @function
print_arr:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -4(%rbp)
	jmp	.L4
.L5:
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	cwtl
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L4:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L5
	movl	$10, %edi
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	print_arr, .-print_arr
	.section	.rodata
.LC2:
	.string	"src   = "
.LC3:
	.string	"shift = %d\n"
.LC4:
	.string	"dst   = "
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movw	$-1, -112(%rbp)
	movw	$-1, -110(%rbp)
	movw	$-1, -108(%rbp)
	movw	$-1, -106(%rbp)
	movw	$-1, -104(%rbp)
	movw	$-1, -102(%rbp)
	movw	$-1, -100(%rbp)
	movw	$-1, -98(%rbp)
	movw	$-1, -96(%rbp)
	movw	$-1, -94(%rbp)
	movw	$-1, -92(%rbp)
	movw	$-1, -90(%rbp)
	movw	$-1, -88(%rbp)
	movw	$-1, -86(%rbp)
	movw	$-1, -84(%rbp)
	movw	$-1, -82(%rbp)
	movw	$0, -80(%rbp)
	movw	$1, -78(%rbp)
	movw	$2, -76(%rbp)
	movw	$3, -74(%rbp)
	movw	$5, -72(%rbp)
	movw	$6, -70(%rbp)
	movw	$7, -68(%rbp)
	movw	$7, -66(%rbp)
	movw	$8, -64(%rbp)
	movw	$9, -62(%rbp)
	movw	$10, -60(%rbp)
	movw	$11, -58(%rbp)
	movw	$12, -56(%rbp)
	movw	$13, -54(%rbp)
	movw	$14, -52(%rbp)
	movw	$15, -50(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	leaq	-112(%rbp), %rcx
	leaq	-48(%rbp), %rax
	movl	$7, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	micro2
	leaq	-112(%rbp), %rax
	movl	$16, %edx
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	call	print_arr
	movl	$7, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$16, %edx
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	call	print_arr
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
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
