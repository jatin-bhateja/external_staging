	.text
	.file	"test.c"
	.globl	round_ceil              # -- Begin function round_ceil
	.p2align	4, 0x90
	.type	round_ceil,@function
round_ceil:                             # @round_ceil
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	andq	$-32, %rsp
	subq	$160, %rsp
	movq	%rdi, 80(%rsp)
	movq	80(%rsp), %rax
	movq	%rax, 88(%rsp)
	movq	88(%rsp), %rax
	vmovapd	(%rax), %ymm0
	vmovapd	%ymm0, 32(%rsp)
	vmovapd	32(%rsp), %ymm0
	vroundpd	$2, %ymm0, %ymm0
	vmovapd	%ymm0, (%rsp)
	movq	80(%rsp), %rax
	vmovapd	(%rsp), %ymm0
	movq	%rax, 136(%rsp)
	vmovapd	%ymm0, 96(%rsp)
	vmovapd	96(%rsp), %ymm0
	movq	136(%rsp), %rax
	vmovapd	%ymm0, (%rax)
	movq	%rbp, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Lfunc_end0:
	.size	round_ceil, .Lfunc_end0-round_ceil
	.cfi_endproc
                                        # -- End function
	.globl	round_floor             # -- Begin function round_floor
	.p2align	4, 0x90
	.type	round_floor,@function
round_floor:                            # @round_floor
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	andq	$-32, %rsp
	subq	$160, %rsp
	movq	%rdi, 80(%rsp)
	movq	80(%rsp), %rax
	movq	%rax, 88(%rsp)
	movq	88(%rsp), %rax
	vmovapd	(%rax), %ymm0
	vmovapd	%ymm0, 32(%rsp)
	vmovapd	32(%rsp), %ymm0
	vroundpd	$1, %ymm0, %ymm0
	vmovapd	%ymm0, (%rsp)
	movq	80(%rsp), %rax
	vmovapd	(%rsp), %ymm0
	movq	%rax, 136(%rsp)
	vmovapd	%ymm0, 96(%rsp)
	vmovapd	96(%rsp), %ymm0
	movq	136(%rsp), %rax
	vmovapd	%ymm0, (%rax)
	movq	%rbp, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Lfunc_end1:
	.size	round_floor, .Lfunc_end1-round_floor
	.cfi_endproc
                                        # -- End function
	.globl	printmem                # -- Begin function printmem
	.p2align	4, 0x90
	.type	printmem,@function
printmem:                               # @printmem
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -20(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB2_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movq	stdout, %rdi
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	vmovsd	(%rax,%rcx,8), %xmm0    # xmm0 = mem[0],zero
	movabsq	$.L.str, %rsi
	movb	$1, %al
	callq	fprintf
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB2_1
.LBB2_4:                                # %for.end
	movq	stdout, %rdi
	movabsq	$.L.str.1, %rsi
	movb	$0, %al
	callq	fprintf
	movl	-16(%rbp), %ecx
	movl	%eax, -24(%rbp)         # 4-byte Spill
	movl	%ecx, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	printmem, .Lfunc_end2-printmem
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
	subq	$48, %rsp
	leaq	-48(%rbp), %rdi
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movq	.L__const.main.mem, %rax
	movq	%rax, -48(%rbp)
	movq	.L__const.main.mem+8, %rax
	movq	%rax, -40(%rbp)
	movq	.L__const.main.mem+16, %rax
	movq	%rax, -32(%rbp)
	movq	.L__const.main.mem+24, %rax
	movq	%rax, -24(%rbp)
	callq	round_floor
	leaq	-48(%rbp), %rdi
	movl	$4, %esi
	callq	printmem
	leaq	-48(%rbp), %rdi
	addl	-8(%rbp), %eax
	movl	%eax, -8(%rbp)
	callq	round_ceil
	leaq	-48(%rbp), %rdi
	movl	$4, %esi
	callq	printmem
	addl	-8(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lf "
	.size	.L.str, 5

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"\n"
	.size	.L.str.1, 2

	.type	.L__const.main.mem,@object # @__const.main.mem
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	4
.L__const.main.mem:
	.quad	4607632778762754458     # double 1.1000000000000001
	.quad	4612136378390124954     # double 2.2000000000000002
	.quad	4620355447710076109     # double 7.7000000000000001
	.quad	4621143577644865946     # double 8.8000000000000007
	.size	.L__const.main.mem, 32


	.ident	"clang version 10.0.0 (http://github.com/llvm-mirror/clang.git d220fc8c89e6db8709dfc34b5e44e1507ecd09c6) (http://github.com/llvm-mirror/llvm.git 345261fbe14e30202db9f7bbed5bb164fc768cbd)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym round_ceil
	.addrsig_sym round_floor
	.addrsig_sym printmem
	.addrsig_sym fprintf
	.addrsig_sym stdout
