	.file	"signed_zero.c"
	.text
	.p2align 4,,15
	.globl	isSignedZero
	.type	isSignedZero, @function
isSignedZero:
.LFB0:
	.cfi_startproc
	pxor	%xmm1, %xmm1
	movl	$0, %edx
	ucomiss	%xmm1, %xmm0
	setnp	%al
	cmovne	%edx, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	isSignedZero, .-isSignedZero
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
