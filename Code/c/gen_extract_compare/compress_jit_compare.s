	.text
	.file	"compress_jit_compare.c"
	.globl	compress_bits_A         # -- Begin function compress_bits_A
	.p2align	4, 0x90
	.type	compress_bits_A,@function
compress_bits_A:                        # @compress_bits_A
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	.cfi_offset %rbx, -24
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movl	$0, -40(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	-40(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movq	-24(%rbp), %rcx
	movslq	-40(%rbp), %rdx
	shlq	$2, %rdx
	addq	%rdx, %rcx
	movq	-32(%rbp), %rdx
	movslq	-40(%rbp), %rsi
	shlq	$2, %rsi
	addq	%rsi, %rdx
	movq	%rax, -48(%rbp)         # 8-byte Spill
	movq	-48(%rbp), %rsi         # 8-byte Reload
	#APP
	vpxor	%xmm2, %xmm3, %xmm3
	vmovdqu64	(%rcx), %xmm1
	vmovdqu64	(%rdx), %xmm2
	vpextrd	$0, %xmm1, %eax
	vpextrd	$0, %xmm2, %ebx
	pextl	%ebx, %eax, %eax
	vpinsrd	$0, %eax, %xmm3, %xmm3
	vpextrd	$1, %xmm1, %eax
	vpextrd	$1, %xmm2, %ebx
	pextl	%ebx, %eax, %eax
	vpinsrd	$1, %eax, %xmm3, %xmm3
	vpextrd	$2, %xmm2, %eax
	vpextrd	$2, %xmm2, %ebx
	pextl	%ebx, %eax, %eax
	vpinsrd	$2, %eax, %xmm3, %xmm3
	vpextrd	$3, %xmm2, %eax
	vpextrd	$3, %xmm2, %ebx
	pextl	%ebx, %eax, %eax
	vpinsrd	$3, %eax, %xmm3, %xmm3
	vmovdqu64	%xmm3, (%rsi)

	#NO_APP
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-40(%rbp), %eax
	addl	$4, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	compress_bits_A, .Lfunc_end0-compress_bits_A
	.cfi_endproc
                                        # -- End function
	.globl	compress_bits_B         # -- Begin function compress_bits_B
	.p2align	4, 0x90
	.type	compress_bits_B,@function
compress_bits_B:                        # @compress_bits_B
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	.cfi_offset %rbx, -24
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movl	$0, -40(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	-40(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movslq	-40(%rbp), %rsi
	movq	%rax, -48(%rbp)         # 8-byte Spill
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movq	%rdx, -64(%rbp)         # 8-byte Spill
	movq	-48(%rbp), %rdi         # 8-byte Reload
	movq	-56(%rbp), %r10         # 8-byte Reload
	movq	-64(%rbp), %r11         # 8-byte Reload
	#APP
	movq	%r10, %rax
	movq	%r11, %rcx
	movq	%rdi, %r8
	movl	(%rax,%rsi,4), %ebx
	pdepl	(%rcx,%rsi,4), %ebx, %ebx
	movl	%ebx, (%r8)
	movl	4(%rax,%rsi,4), %ebx
	pdepl	4(%rcx,%rsi,4), %ebx, %ebx
	movl	%ebx, 4(%r8,%rsi,4)
	movl	8(%rax,%rsi,4), %ebx
	pdepl	8(%rcx,%rsi,4), %ebx, %ebx
	movl	%ebx, 8(%r8,%rsi,4)
	movl	12(%rax,%rsi,4), %ebx
	pdepl	12(%rcx,%rsi,4), %ebx, %ebx
	movl	%ebx, 12(%r8,%rsi,4)

	#NO_APP
	movq	%rdi, %rax
	movq	%rax, -16(%rbp)
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-40(%rbp), %eax
	addl	$4, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB1_1
.LBB1_4:
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	compress_bits_B, .Lfunc_end1-compress_bits_B
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$112, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$3, -8(%rbp)
	je	.LBB2_2
# %bb.1:
	movq	stderr, %rdi
	movabsq	$.L.str, %rsi
	movb	$0, %al
	callq	fprintf
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	movl	%eax, -84(%rbp)         # 4-byte Spill
	callq	exit
.LBB2_2:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	callq	atoi
	movl	%eax, -20(%rbp)
	movq	-16(%rbp), %rcx
	movq	16(%rcx), %rdi
	callq	atoi
	movl	%eax, -24(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	movq	%rsp, %rdx
	movq	%rdx, -32(%rbp)
	leaq	15(,%rcx,4), %rdx
	andq	$-16, %rdx
	movq	%rsp, %rsi
	subq	%rdx, %rsi
	movq	%rsi, %rsp
	movq	%rcx, -40(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	leaq	15(,%rcx,4), %rdx
	andq	$-16, %rdx
	movq	%rsp, %rdi
	subq	%rdx, %rdi
	movq	%rdi, %rsp
	movq	%rcx, -48(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	leaq	15(,%rcx,4), %rdx
	andq	$-16, %rdx
	movq	%rsp, %r8
	subq	%rdx, %r8
	movq	%r8, %rsp
	movq	%rcx, -56(%rbp)
	movl	$0, -60(%rbp)
	movq	%rsi, -96(%rbp)         # 8-byte Spill
	movq	%rdi, -104(%rbp)        # 8-byte Spill
	movq	%r8, -112(%rbp)         # 8-byte Spill
.LBB2_3:                                # =>This Inner Loop Header: Depth=1
	movl	-60(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB2_6
# %bb.4:                                #   in Loop: Header=BB2_3 Depth=1
	movl	-60(%rbp), %eax
	andl	$31, %eax
	movl	%eax, %ecx
                                        # kill: def $cl killed $ecx
	movl	$1, %eax
	shll	%cl, %eax
	movslq	-60(%rbp), %rdx
	movq	-96(%rbp), %rsi         # 8-byte Reload
	movl	%eax, (%rsi,%rdx,4)
	movslq	-60(%rbp), %rdx
	movl	(%rsi,%rdx,4), %eax
	movslq	-60(%rbp), %rdx
	movq	-104(%rbp), %rdi        # 8-byte Reload
	movl	%eax, (%rdi,%rdx,4)
# %bb.5:                                #   in Loop: Header=BB2_3 Depth=1
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	.LBB2_3
.LBB2_6:
	cmpl	$1, -24(%rbp)
	jne	.LBB2_12
# %bb.7:
	movl	$0, -64(%rbp)
.LBB2_8:                                # =>This Inner Loop Header: Depth=1
	cmpl	$1000000, -64(%rbp)     # imm = 0xF4240
	jge	.LBB2_11
# %bb.9:                                #   in Loop: Header=BB2_8 Depth=1
	movl	-20(%rbp), %ecx
	movq	-112(%rbp), %rdi        # 8-byte Reload
	movq	-96(%rbp), %rsi         # 8-byte Reload
	movq	-104(%rbp), %rdx        # 8-byte Reload
	callq	compress_bits_A
# %bb.10:                               #   in Loop: Header=BB2_8 Depth=1
	movl	-64(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -64(%rbp)
	jmp	.LBB2_8
.LBB2_11:
	jmp	.LBB2_17
.LBB2_12:
	movl	$0, -68(%rbp)
.LBB2_13:                               # =>This Inner Loop Header: Depth=1
	cmpl	$1000000, -68(%rbp)     # imm = 0xF4240
	jge	.LBB2_16
# %bb.14:                               #   in Loop: Header=BB2_13 Depth=1
	movl	-20(%rbp), %ecx
	movq	-112(%rbp), %rdi        # 8-byte Reload
	movq	-96(%rbp), %rsi         # 8-byte Reload
	movq	-104(%rbp), %rdx        # 8-byte Reload
	callq	compress_bits_B
# %bb.15:                               #   in Loop: Header=BB2_13 Depth=1
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	.LBB2_13
.LBB2_16:
	jmp	.LBB2_17
.LBB2_17:
	movl	$0, -72(%rbp)
	movl	$0, -76(%rbp)
.LBB2_18:                               # =>This Inner Loop Header: Depth=1
	movl	-76(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB2_21
# %bb.19:                               #   in Loop: Header=BB2_18 Depth=1
	movslq	-76(%rbp), %rax
	movq	-112(%rbp), %rcx        # 8-byte Reload
	movl	(%rcx,%rax,4), %edx
	addl	-72(%rbp), %edx
	movl	%edx, -72(%rbp)
# %bb.20:                               #   in Loop: Header=BB2_18 Depth=1
	movl	-76(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -76(%rbp)
	jmp	.LBB2_18
.LBB2_21:
	movl	-72(%rbp), %esi
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf
	movl	$0, -80(%rbp)
.LBB2_22:                               # =>This Inner Loop Header: Depth=1
	cmpl	$8, -80(%rbp)
	jge	.LBB2_25
# %bb.23:                               #   in Loop: Header=BB2_22 Depth=1
	movl	-80(%rbp), %esi
	movslq	-80(%rbp), %rax
	movq	-112(%rbp), %rcx        # 8-byte Reload
	movl	(%rcx,%rax,4), %edx
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf
# %bb.24:                               #   in Loop: Header=BB2_22 Depth=1
	movl	-80(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -80(%rbp)
	jmp	.LBB2_22
.LBB2_25:
	movl	$0, -4(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rsp
	movl	-4(%rbp), %eax
	movq	%rbp, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Incorrect args!\n"
	.size	.L.str, 17

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"[RES] : %d\n"
	.size	.L.str.1, 12

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"res[%d] : %d\n"
	.size	.L.str.2, 14

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym compress_bits_A
	.addrsig_sym compress_bits_B
	.addrsig_sym fprintf
	.addrsig_sym exit
	.addrsig_sym atoi
	.addrsig_sym printf
	.addrsig_sym stderr
