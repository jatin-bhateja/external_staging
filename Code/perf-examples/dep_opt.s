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
	vmovd	%edi, %xmm0
	vpbroadcastd	%xmm0, %xmm0
	movq	$-536384, %rax          # imm = 0xFFF7D0C0
	.p2align	4, 0x90
.LBB0_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vpaddd	arr+536384(%rax), %xmm0, %xmm1
	vpaddd	arr+536400(%rax), %xmm0, %xmm2
	vmovdqa	%xmm1, arr+536384(%rax)
	vmovdqa	%xmm2, arr+536400(%rax)
	vpaddd	arr+536416(%rax), %xmm0, %xmm1
	vpaddd	arr+536432(%rax), %xmm0, %xmm2
	vmovdqa	%xmm1, arr+536416(%rax)
	vmovdqa	%xmm2, arr+536432(%rax)
	addq	$64, %rax
	jne	.LBB0_1
# %bb.2:                                # %for.body
	addl	%edi, arr+536384(%rip)
	addl	%edi, arr+536388(%rip)
	movl	arr+28(%rip), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	workload, .Lfunc_end0-workload
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
