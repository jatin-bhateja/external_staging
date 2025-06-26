	.text
	.file	"test.c"
	.globl	loadArr                 # -- Begin function loadArr
	.p2align	4, 0x90
	.type	loadArr,@function
loadArr:                                # @loadArr
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	#APP
	vpmovsxbd	cmem(%rip), %xmm0
	vmovdqu	%xmm0, imem(%rip)

	#NO_APP
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	loadArr, .Lfunc_end0-loadArr
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	leaq	-32(%rbp), %rax
	xorl	%esi, %esi
	movl	$0, -4(%rbp)
	movq	%rax, %rcx
	movq	%rcx, %rdi
	movl	$16, %edx
	movq	%rax, -48(%rbp)         # 8-byte Spill
	callq	memset
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	%rax, imem
	callq	loadArr
	movl	$0, -36(%rbp)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$4, -36(%rbp)
	jge	.LBB1_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	movslq	-36(%rbp), %rax
	movl	-32(%rbp,%rax,4), %esi
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf
	movl	%eax, -52(%rbp)         # 4-byte Spill
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB1_1
.LBB1_4:                                # %for.end
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf
	xorl	%ecx, %ecx
	movl	%eax, -56(%rbp)         # 4-byte Spill
	movl	%ecx, %eax
	addq	$64, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"ABCDEFGH"
	.size	.L.str, 9

	.type	cmem,@object            # @cmem
	.data
	.globl	cmem
	.p2align	3
cmem:
	.quad	.L.str
	.size	cmem, 8

	.type	imem,@object            # @imem
	.comm	imem,8,8
	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"%d "
	.size	.L.str.1, 4

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"\n"
	.size	.L.str.2, 2


	.ident	"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 249cf79bade5af443c2a997b5cf645aa1a9e2843) (http://github.com/llvm-mirror/llvm.git 551e44401a9806760bcb1a69dfabaa10145f6e56)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym loadArr
	.addrsig_sym printf
	.addrsig_sym cmem
	.addrsig_sym imem
