	.text
	.file	"test.c"
	.globl	rotate                  # -- Begin function rotate
	.p2align	4, 0x90
	.type	rotate,@function
rotate:                                 # @rotate
	.cfi_startproc
# %bb.0:                                # %entry
                                        # kill: def $ecx killed $ecx def $rcx
	testl	%ecx, %ecx
	jle	.LBB0_39
# %bb.1:                                # %for.body.preheader
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, %r8d
	movq	%rsi, %r13
	movq	%rsp, -72(%rbp)         # 8-byte Spill
	movl	%ecx, %edx
	movq	%rsp, %rsi
	leaq	15(,%rdx,4), %rax
	andq	$-16, %rax
	subq	%rax, %rsi
	movq	%rsi, %rsp
	leal	-1(%r8), %r10d
	movslq	%r10d, %rax
	movq	%rax, -48(%rbp)         # 8-byte Spill
	cmpl	$7, %ecx
	ja	.LBB0_8
# %bb.2:
	xorl	%r11d, %r11d
	jmp	.LBB0_3
.LBB0_8:                                # %vector.scevcheck
	leaq	-1(%rdx), %rax
	leal	-1(%rcx), %r12d
	movl	%r12d, %ebx
	subl	%eax, %ebx
	xorl	%r11d, %r11d
	cmpl	%r12d, %ebx
	jg	.LBB0_3
# %bb.9:                                # %vector.scevcheck
	shrq	$32, %rax
	jne	.LBB0_3
# %bb.10:                               # %vector.ph
	movl	%edx, %r11d
	andl	$-8, %r11d
	leaq	-8(%r11), %rbx
	movq	%rbx, %rax
	shrq	$3, %rax
	addq	$1, %rax
	movl	%eax, %r9d
	andl	$1, %r9d
	testq	%rbx, %rbx
	je	.LBB0_11
# %bb.12:                               # %vector.ph.new
	movq	%r13, -56(%rbp)         # 8-byte Spill
	leal	-9(%rcx), %r14d
	movq	-48(%rbp), %rbx         # 8-byte Reload
	leaq	(%rdi,%rbx,4), %r13
	addq	$-12, %r13
	movl	$1, %ebx
	subq	%rax, %rbx
	movq	%r9, -64(%rbp)          # 8-byte Spill
	leaq	(%r9,%rbx), %r15
	addq	$-1, %r15
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB0_13:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovups	-16(%r13,%rbx,4), %ymm0
	leal	(%r12,%rbx), %r9d
	movslq	%r9d, %rax
	vmovups	%ymm0, -28(%rsi,%rax,4)
	vmovups	-48(%r13,%rbx,4), %ymm0
	leal	(%r14,%rbx), %eax
	cltq
	vmovups	%ymm0, -28(%rsi,%rax,4)
	addq	$-16, %rbx
	addq	$2, %r15
	jne	.LBB0_13
# %bb.14:                               # %middle.block.unr-lcssa.loopexit
	negq	%rbx
	movq	-56(%rbp), %r13         # 8-byte Reload
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	-64(%rbp), %r9          # 8-byte Reload
	testq	%r9, %r9
	je	.LBB0_17
.LBB0_16:                               # %vector.body.epil
	subq	%rbx, %rax
	vmovups	-28(%rdi,%rax,4), %ymm0
	notl	%ebx
	addl	%ecx, %ebx
	movslq	%ebx, %rax
	vmovups	%ymm0, -28(%rsi,%rax,4)
.LBB0_17:                               # %middle.block
	cmpq	%rdx, %r11
	je	.LBB0_18
.LBB0_3:                                # %for.body.preheader81
	movq	%r11, %rax
	notq	%rax
	testb	$1, %dl
	je	.LBB0_5
# %bb.4:                                # %for.body.prol
	movq	-48(%rbp), %rbx         # 8-byte Reload
	subq	%r11, %rbx
	movl	(%rdi,%rbx,4), %r14d
	movl	%r11d, %ebx
	notl	%ebx
	addl	%ecx, %ebx
	movslq	%ebx, %rbx
	movl	%r14d, (%rsi,%rbx,4)
	orq	$1, %r11
.LBB0_5:                                # %for.body.prol.loopexit
	movq	%rdx, %r14
	negq	%r14
	cmpq	%r14, %rax
	je	.LBB0_18
# %bb.6:                                # %for.body.preheader2
	movq	%r11, %r15
	negq	%r15
	leal	-2(%rcx), %ebx
	subl	%r11d, %ebx
	movq	-48(%rbp), %rax         # 8-byte Reload
	leaq	(%rdi,%rax,4), %r11
	.p2align	4, 0x90
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	(%r11,%r15,4), %r9d
	leal	1(%rbx), %eax
	cltq
	movl	%r9d, (%rsi,%rax,4)
	movl	-4(%r11,%r15,4), %eax
	movslq	%ebx, %rbx
	movl	%eax, (%rsi,%rbx,4)
	addq	$-2, %r15
	addl	$-2, %ebx
	cmpq	%r15, %r14
	jne	.LBB0_7
.LBB0_18:                               # %for.cond8.preheader
	subl	%ecx, %r10d
	movq	-48(%rbp), %r14         # 8-byte Reload
	js	.LBB0_36
# %bb.19:                               # %for.body11.preheader
	movl	%r8d, %r11d
	subl	%ecx, %r11d
	cmpl	$7, %r11d
	jbe	.LBB0_20
# %bb.26:                               # %vector.memcheck
	leaq	1(%r14), %rax
	subq	%r11, %rax
	leaq	(,%rax,4), %r9
	addq	%r13, %r9
	movl	%ecx, %eax
	notl	%eax
	addl	%r8d, %eax
	cltq
	leaq	(%rdi,%rax,4), %rbx
	addq	$4, %rbx
	cmpq	%rbx, %r9
	jae	.LBB0_28
# %bb.27:                               # %vector.memcheck
	leaq	4(,%r14,4), %rbx
	addq	%r13, %rbx
	addq	$1, %rax
	subq	%r11, %rax
	leaq	(%rdi,%rax,4), %rax
	cmpq	%rbx, %rax
	jae	.LBB0_28
.LBB0_20:
	xorl	%r12d, %r12d
	xorl	%r15d, %r15d
.LBB0_21:                               # %for.body11.preheader80
	movq	%r12, %rax
	notq	%rax
	testb	$1, %r11b
	je	.LBB0_23
# %bb.22:                               # %for.body11.prol
	movl	%r10d, %ebx
	subl	%r15d, %ebx
	movslq	%ebx, %rbx
	movl	(%rdi,%rbx,4), %r9d
	movq	%r14, %rbx
	subq	%r12, %rbx
	movl	%r9d, (%r13,%rbx,4)
	orq	$1, %r12
	addl	$1, %r15d
.LBB0_23:                               # %for.body11.prol.loopexit
	addq	%r11, %rax
	je	.LBB0_36
# %bb.24:                               # %for.body11.preheader1
	subq	%r12, %r14
	subq	%r11, %r12
	leaq	(,%r14,4), %r11
	addq	%r13, %r11
	addl	$-2, %r8d
	subl	%r15d, %r8d
	subl	%ecx, %r8d
	movslq	%r10d, %r9
	movslq	%r15d, %rbx
	subq	%rbx, %r9
	leaq	(%rdi,%r9,4), %r9
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB0_25:                               # %for.body11
                                        # =>This Inner Loop Header: Depth=1
	movl	(%r9,%rbx,4), %eax
	movl	%eax, (%r11,%rbx,4)
	leal	(%r8,%rbx), %eax
	cltq
	movl	(%rdi,%rax,4), %eax
	movl	%eax, -4(%r11,%rbx,4)
	addq	$-2, %rbx
	cmpq	%rbx, %r12
	jne	.LBB0_25
	jmp	.LBB0_36
.LBB0_28:                               # %vector.ph58
	movl	%r11d, %r12d
	andl	$-8, %r12d
	leaq	-8(%r12), %rbx
	movq	%rbx, %rax
	shrq	$3, %rax
	addq	$1, %rax
	movl	%eax, %r15d
	andl	$1, %r15d
	testq	%rbx, %rbx
	je	.LBB0_29
# %bb.30:                               # %vector.ph58.new
	movq	%r13, -56(%rbp)         # 8-byte Spill
	leaq	-12(%r13,%r14,4), %r13
	leal	-9(%r8), %r14d
	subl	%ecx, %r14d
	movl	$1, %ebx
	subq	%rax, %rbx
	leaq	(%r15,%rbx), %r9
	addq	$-1, %r9
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB0_31:                               # %vector.body46
                                        # =>This Inner Loop Header: Depth=1
	leal	(%r10,%rbx), %eax
	cltq
	vmovups	-28(%rdi,%rax,4), %ymm0
	vmovups	%ymm0, -16(%r13,%rbx,4)
	leal	(%r14,%rbx), %eax
	cltq
	vmovups	-28(%rdi,%rax,4), %ymm0
	vmovups	%ymm0, -48(%r13,%rbx,4)
	addq	$-16, %rbx
	addq	$2, %r9
	jne	.LBB0_31
# %bb.32:                               # %middle.block47.unr-lcssa.loopexit
	negq	%rbx
	movq	-56(%rbp), %r13         # 8-byte Reload
	movq	-48(%rbp), %r14         # 8-byte Reload
	testq	%r15, %r15
	je	.LBB0_35
.LBB0_34:                               # %vector.body46.epil
	movl	%r10d, %eax
	subl	%ebx, %eax
	cltq
	vmovups	-28(%rdi,%rax,4), %ymm0
	movq	%r14, %rax
	subq	%rbx, %rax
	vmovups	%ymm0, -28(%r13,%rax,4)
.LBB0_35:                               # %middle.block47
	movl	%r12d, %r15d
	cmpq	%r11, %r12
	jne	.LBB0_21
.LBB0_36:                               # %for.cond23.preheader
	testl	%ecx, %ecx
	jle	.LBB0_38
# %bb.37:                               # %for.body25.preheader
	shlq	$2, %rdx
	movq	%r13, %rdi
	vzeroupper
	callq	memcpy
.LBB0_38:                               # %for.end32
	movq	-72(%rbp), %rsp         # 8-byte Reload
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
.LBB0_39:                               # %return
	vzeroupper
	retq
.LBB0_11:
	.cfi_def_cfa %rbp, 16
	xorl	%ebx, %ebx
	movq	-48(%rbp), %rax         # 8-byte Reload
	testq	%r9, %r9
	jne	.LBB0_16
	jmp	.LBB0_17
.LBB0_29:
	xorl	%ebx, %ebx
	testq	%r15, %r15
	jne	.LBB0_34
	jmp	.LBB0_35
.Lfunc_end0:
	.size	rotate, .Lfunc_end0-rotate
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 5a290db4b49c7f391b3038372cb69fdfc9f07725) (http://github.com/llvm-mirror/llvm.git 9b0581974207d38a5ef880bed858a33e6cbf12db)"
	.section	".note.GNU-stack","",@progbits
