	.text
	.file	"test.c"
	.globl	encodeBlock             # -- Begin function encodeBlock
	.p2align	4, 0x90
	.type	encodeBlock,@function
encodeBlock:                            # @encodeBlock
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	toBase64(%rip), %r10
	movslq	%r8d, %rdx
	addq	%rdx, %rcx
	addq	$3, %rcx
	xorl	%edx, %edx
	movl	$1548, %r8d             # imm = 0x60C
	movl	$1542, %r9d             # imm = 0x606
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rdi,%rdx), %r11d
	movl	%r11d, %eax
	shll	$16, %eax
	movzbl	1(%rdi,%rdx), %esi
	shll	$8, %esi
	orl	%esi, %eax
	bextrl	%r8d, %eax, %r14d
	movzbl	2(%rdi,%rdx), %ebx
	orl	%ebx, %esi
	bextrl	%r9d, %esi, %esi
	shrq	$2, %r11
	movzbl	(%r10,%r11), %eax
	movb	%al, -3(%rcx)
	movzbl	(%r10,%r14), %eax
	movb	%al, -2(%rcx)
	movzbl	(%r10,%rsi), %eax
	movb	%al, -1(%rcx)
	andl	$63, %ebx
	movzbl	(%r10,%rbx), %eax
	movb	%al, (%rcx)
	addq	$3, %rdx
	addq	$4, %rcx
	cmpq	$64, %rdx
	jb	.LBB0_1
# %bb.2:
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end0:
	.size	encodeBlock, .Lfunc_end0-encodeBlock
	.cfi_endproc
                                        # -- End function
	.type	toBase64,@object        # @toBase64
	.comm	toBase64,8,8

	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",@progbits
