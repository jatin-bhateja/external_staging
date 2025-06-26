	.text
	.file	"dep.c"
	.globl	workload                # -- Begin function workload
	.p2align	4, 0x90
	.type	workload,@function
workload:                               # @workload
	.cfi_startproc
# %bb.0:                                # %entry
	vmovd	%edi, %xmm0
	vpbroadcastd	%xmm0, %ymm0
	movq	$-536320, %rax          # imm = 0xFFF7D100
	.p2align	4, 0x90
.LBB0_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vpaddd	arr+536320(%rax), %ymm0, %ymm1
	vpaddd	arr+536352(%rax), %ymm0, %ymm2
	vpaddd	arr+536384(%rax), %ymm0, %ymm3
	vpaddd	arr+536416(%rax), %ymm0, %ymm4
	vmovdqu	%ymm1, arr+536320(%rax)
	vmovdqu	%ymm2, arr+536352(%rax)
	vmovdqu	%ymm3, arr+536384(%rax)
	vmovdqu	%ymm4, arr+536416(%rax)
	vpaddd	arr+536448(%rax), %ymm0, %ymm1
	vpaddd	arr+536480(%rax), %ymm0, %ymm2
	vpaddd	arr+536512(%rax), %ymm0, %ymm3
	vpaddd	arr+536544(%rax), %ymm0, %ymm4
	vmovdqu	%ymm1, arr+536448(%rax)
	vmovdqu	%ymm2, arr+536480(%rax)
	vmovdqu	%ymm3, arr+536512(%rax)
	vmovdqu	%ymm4, arr+536544(%rax)
	addq	$256, %rax              # imm = 0x100
	jne	.LBB0_1
# %bb.2:                                # %for.body
	addl	%edi, arr+536320(%rip)
	addl	%edi, arr+536324(%rip)
	addl	%edi, arr+536328(%rip)
	addl	%edi, arr+536332(%rip)
	addl	%edi, arr+536336(%rip)
	addl	%edi, arr+536340(%rip)
	addl	%edi, arr+536344(%rip)
	addl	%edi, arr+536348(%rip)
	addl	%edi, arr+536352(%rip)
	addl	%edi, arr+536356(%rip)
	addl	%edi, arr+536360(%rip)
	addl	%edi, arr+536364(%rip)
	addl	%edi, arr+536368(%rip)
	addl	%edi, arr+536372(%rip)
	addl	%edi, arr+536376(%rip)
	addl	%edi, arr+536380(%rip)
	addl	%edi, arr+536384(%rip)
	addl	%edi, arr+536388(%rip)
	movl	arr+28(%rip), %eax
	vzeroupper
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%ebx, %edi
	callq	workload
	addl	%eax, %r14d
	addl	$1, %ebx
	cmpl	$100000, %ebx           # imm = 0x186A0
	jne	.LBB1_1
# %bb.2:                                # %for.cond.cleanup
	andl	$4097, %r14d            # imm = 0x1001
	movl	arr(,%r14,4), %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
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
	.addrsig
