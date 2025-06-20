	.text
	.file	"adler32.c"
	.globl	adler32                 # -- Begin function adler32
	.p2align	4, 0x90
	.type	adler32,@function
adler32:                                # @adler32
	.cfi_startproc
# %bb.0:                                # %entry
	testq	%rsi, %rsi
	je	.LBB0_3
# %bb.1:                                # %for.body.preheader
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	-1(%rsi), %rax
	movl	%esi, %r8d
	andl	$3, %r8d
	cmpq	$3, %rax
	jae	.LBB0_5
# %bb.2:
	movl	$1, %ecx
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	jmp	.LBB0_7
.LBB0_3:
	.cfi_def_cfa %rsp, 8
	xorl	%edx, %edx
	movl	$1, %eax
	orl	%edx, %eax
                                        # kill: def $eax killed $eax killed $rax
	retq
.LBB0_5:                                # %for.body.preheader.new
	.cfi_def_cfa %rbp, 16
	subq	%r8, %rsi
	movl	$1, %ecx
	xorl	%r9d, %r9d
	movl	$2147975281, %r10d      # imm = 0x80078071
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%rdi,%r9), %eax
	addl	%ecx, %eax
	movq	%rax, %rcx
	imulq	%r10, %rcx
	shrq	$47, %rcx
	imull	$65521, %ecx, %ecx      # imm = 0xFFF1
	subl	%ecx, %eax
	addl	%eax, %edx
	movq	%rdx, %rcx
	imulq	%r10, %rcx
	shrq	$47, %rcx
	imull	$65521, %ecx, %ecx      # imm = 0xFFF1
	subl	%ecx, %edx
	movzbl	1(%rdi,%r9), %ecx
	addl	%eax, %ecx
	movq	%rcx, %rax
	imulq	%r10, %rax
	shrq	$47, %rax
	imull	$65521, %eax, %eax      # imm = 0xFFF1
	subl	%eax, %ecx
	addl	%ecx, %edx
	movq	%rdx, %rax
	imulq	%r10, %rax
	shrq	$47, %rax
	imull	$65521, %eax, %eax      # imm = 0xFFF1
	subl	%eax, %edx
	movzbl	2(%rdi,%r9), %eax
	addl	%ecx, %eax
	movq	%rax, %rcx
	imulq	%r10, %rcx
	shrq	$47, %rcx
	imull	$65521, %ecx, %ecx      # imm = 0xFFF1
	subl	%ecx, %eax
	addl	%eax, %edx
	movq	%rdx, %rcx
	imulq	%r10, %rcx
	shrq	$47, %rcx
	imull	$65521, %ecx, %ecx      # imm = 0xFFF1
	subl	%ecx, %edx
	movzbl	3(%rdi,%r9), %ecx
	addl	%eax, %ecx
	movq	%rcx, %rax
	imulq	%r10, %rax
	shrq	$47, %rax
	imull	$65521, %eax, %eax      # imm = 0xFFF1
	subl	%eax, %ecx
	addl	%ecx, %edx
	movq	%rdx, %rax
	imulq	%r10, %rax
	shrq	$47, %rax
	imull	$65521, %eax, %eax      # imm = 0xFFF1
	subl	%eax, %edx
	addq	$4, %r9
	cmpq	%r9, %rsi
	jne	.LBB0_6
.LBB0_7:                                # %for.end.loopexit.unr-lcssa
	movl	%ecx, %eax
	testq	%r8, %r8
	je	.LBB0_10
# %bb.8:                                # %for.body.epil.preheader
	addq	%r9, %rdi
	xorl	%esi, %esi
	movl	$2147975281, %r9d       # imm = 0x80078071
	.p2align	4, 0x90
.LBB0_9:                                # %for.body.epil
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%rdi,%rsi), %eax
	addl	%ecx, %eax
	movq	%rax, %rcx
	imulq	%r9, %rcx
	shrq	$47, %rcx
	imull	$65521, %ecx, %ecx      # imm = 0xFFF1
	subl	%ecx, %eax
	addl	%eax, %edx
	movq	%rdx, %rcx
	imulq	%r9, %rcx
	shrq	$47, %rcx
	imull	$65521, %ecx, %ecx      # imm = 0xFFF1
	subl	%ecx, %edx
	incq	%rsi
	movl	%eax, %ecx
	cmpq	%rsi, %r8
	jne	.LBB0_9
.LBB0_10:                               # %for.end.loopexit
	shll	$16, %edx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	orl	%edx, %eax
                                        # kill: def $eax killed $eax killed $rax
	retq
.Lfunc_end0:
	.size	adler32, .Lfunc_end0-adler32
	.cfi_endproc
                                        # -- End function
	.type	MOD_ADLER,@object       # @MOD_ADLER
	.section	.rodata,"a",@progbits
	.globl	MOD_ADLER
	.p2align	2
MOD_ADLER:
	.long	65521                   # 0xfff1
	.size	MOD_ADLER, 4


	.ident	"clang version 10.0.0 (http://github.com/llvm-mirror/clang.git 3441aaff8506ac0252f9bba9d1ce117cf35906ce) (http://github.com/llvm-mirror/llvm.git 2e6b938e4e31a2fdd8a5b3ec969bee9dcf9806a7)"
	.section	".note.GNU-stack","",@progbits
