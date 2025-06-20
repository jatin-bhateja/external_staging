	.text
	.file	"dep.c"
	.globl	workload                # -- Begin function workload
	.p2align	4, 0x90
	.type	workload,@function
workload:                               # @workload
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	arr(,%rax,4), %ecx
	addl	%edi, %ecx
	movl	%ecx, arr+4(,%rax,4)
	incq	%rax
	cmpl	$134098, %eax           # imm = 0x20BD2
	jl	.LBB0_1
# %bb.2:                                # %for.end
	movl	arr+28(%rip), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	workload, .Lfunc_end0-workload
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
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%ebx, %edi
	callq	workload
	addl	%eax, %r14d
	incl	%ebx
	cmpl	$100000, %ebx           # imm = 0x186A0
	jl	.LBB1_1
# %bb.2:                                # %for.end
	andl	$4097, %r14d            # imm = 0x1001
	movl	arr(,%r14,4), %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	arr,@object             # @arr
	.data
	.globl	arr
	.p2align	4
arr:
	.long	1                       # 0x1
	.zero	536388
	.size	arr, 536392


	.ident	"clang version 10.0.0 (http://github.com/llvm-mirror/clang.git 3441aaff8506ac0252f9bba9d1ce117cf35906ce) (http://github.com/llvm-mirror/llvm.git 2e6b938e4e31a2fdd8a5b3ec969bee9dcf9806a7)"
	.section	".note.GNU-stack","",@progbits
