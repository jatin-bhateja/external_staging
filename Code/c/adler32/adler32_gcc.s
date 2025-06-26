	.file	"adler32.c"
	.text
	.p2align 4,,15
	.globl	adler32
	.type	adler32, @function
adler32:
.LFB23:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L4
	addq	%rdi, %rsi
	xorl	%r8d, %r8d
	movl	$1, %ecx
	movl	$-2146992015, %r10d
	.p2align 4,,10
	.p2align 3
.L3:
	movzbl	(%rdi), %r9d
	addq	$1, %rdi
	addl	%ecx, %r9d
	movl	%r9d, %eax
	mull	%r10d
	shrl	$15, %edx
	imull	$65521, %edx, %ecx
	subl	%ecx, %r9d
	movl	%r9d, %ecx
	leal	(%r9,%r8), %r9d
	movl	%r9d, %eax
	mull	%r10d
	shrl	$15, %edx
	imull	$65521, %edx, %r8d
	subl	%r8d, %r9d
	cmpq	%rsi, %rdi
	movl	%r9d, %r8d
	jne	.L3
	movl	%r9d, %eax
	sall	$16, %eax
	orl	%ecx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE23:
	.size	adler32, .-adler32
	.globl	MOD_ADLER
	.section	.rodata
	.align 4
	.type	MOD_ADLER, @object
	.size	MOD_ADLER, 4
MOD_ADLER:
	.long	65521
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
