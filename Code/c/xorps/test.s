	.text
	.file	"test.c"
	.globl	xorargs                 # -- Begin function xorargs
	.p2align	4, 0x90
	.type	xorargs,@function
xorargs:                                # @xorargs
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	#APP
	vmovdqu64	-8(%rbp), %zmm1
	vpxorq	-16(%rbp), %zmm1, %zmm0
	vmovdqu64	%zmm0, -24(%rbp)

	#NO_APP
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	xorargs, .Lfunc_end0-xorargs
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
	subq	$272, %rsp              # imm = 0x110
	leaq	-80(%rbp), %rdx
	leaq	-208(%rbp), %rax
	leaq	-144(%rbp), %rcx
	movabsq	$.L__const.main.src2, %rsi
	movabsq	$.L__const.main.src1, %rdi
	movl	$0, -4(%rbp)
	movq	%rcx, %r8
	movq	%rdi, -224(%rbp)        # 8-byte Spill
	movq	%r8, %rdi
	movq	-224(%rbp), %r8         # 8-byte Reload
	movq	%rsi, -232(%rbp)        # 8-byte Spill
	movq	%r8, %rsi
	movl	$64, %r9d
	movq	%rdx, -240(%rbp)        # 8-byte Spill
	movq	%r9, %rdx
	movq	%rax, -248(%rbp)        # 8-byte Spill
	movq	%rcx, -256(%rbp)        # 8-byte Spill
	movq	%r9, -264(%rbp)         # 8-byte Spill
	callq	memcpy
	movq	-248(%rbp), %rax        # 8-byte Reload
	movq	%rax, %rdi
	movq	-232(%rbp), %rsi        # 8-byte Reload
	movq	-264(%rbp), %rdx        # 8-byte Reload
	callq	memcpy
	movq	-256(%rbp), %rdi        # 8-byte Reload
	movq	-248(%rbp), %rsi        # 8-byte Reload
	movq	-240(%rbp), %rdx        # 8-byte Reload
	callq	xorargs
	movl	$0, -212(%rbp)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$8, -212(%rbp)
	jge	.LBB1_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	stdout, %rdi
	movl	-212(%rbp), %edx
	movslq	-212(%rbp), %rax
	vmovsd	-80(%rbp,%rax,8), %xmm0 # xmm0 = mem[0],zero
	movabsq	$.L.str, %rsi
	movb	$1, %al
	callq	fprintf
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-212(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -212(%rbp)
	jmp	.LBB1_1
.LBB1_4:                                # %for.end
	xorl	%eax, %eax
	addq	$272, %rsp              # imm = 0x110
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L__const.main.src1,@object # @__const.main.src1
	.section	.rodata,"a",@progbits
	.p2align	4
.L__const.main.src1:
	.quad	4607182418800017408     # double 1
	.quad	4611686018427387904     # double 2
	.quad	4613937818241073152     # double 3
	.quad	4616189618054758400     # double 4
	.quad	4617315517961601024     # double 5
	.quad	4618441417868443648     # double 6
	.quad	4619567317775286272     # double 7
	.quad	4620693217682128896     # double 8
	.size	.L__const.main.src1, 64

	.type	.L__const.main.src2,@object # @__const.main.src2
	.p2align	4
.L__const.main.src2:
	.quad	4607182418800017408     # double 1
	.quad	4611686018427387904     # double 2
	.quad	4613937818241073152     # double 3
	.quad	4616189618054758400     # double 4
	.quad	4617315517961601024     # double 5
	.quad	4618441417868443648     # double 6
	.quad	4619567317775286272     # double 7
	.quad	4620693217682128896     # double 8
	.size	.L__const.main.src2, 64

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Res [%d] : %lf\n"
	.size	.L.str, 16


	.ident	"clang version 10.0.0 (http://github.com/llvm-mirror/clang.git 1805646477aea66b2763033a2a226aa1aef84d7e) (http://github.com/llvm-mirror/llvm.git 062bcee38918c16c7d4c477419c8a7753e64ea40)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym xorargs
	.addrsig_sym fprintf
	.addrsig_sym stdout
