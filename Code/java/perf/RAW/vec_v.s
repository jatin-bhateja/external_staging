	.text
	.file	"vec.c"
	.globl	war                     # -- Begin function war
	.p2align	4, 0x90
	.type	war,@function
war:                                    # @war
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovups	4(%rdi,%rax,4), %xmm0
	vmovups	20(%rdi,%rax,4), %xmm1
	vmovups	%xmm0, (%rdi,%rax,4)
	vmovups	%xmm1, 16(%rdi,%rax,4)
	addq	$8, %rax
	cmpl	$1016, %eax             # imm = 0x3F8
	jne	.LBB0_1
# %bb.2:                                # %middle.block
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_5
# %bb.3:                                # %scalar.ph
	movl	$1016, %eax             # imm = 0x3F8
	.p2align	4, 0x90
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovss	4(%rdi,%rax,4), %xmm0   # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, (%rdi,%rax,4)
	addq	$1, %rax
	cmpl	$1023, %eax             # imm = 0x3FF
	jl	.LBB0_4
.LBB0_5:                                # %for.end
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	war, .Lfunc_end0-war
	.cfi_endproc
                                        # -- End function
	.globl	raw                     # -- Begin function raw
	.p2align	4, 0x90
	.type	raw,@function
raw:                                    # @raw
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovss	(%rdi,%rax,4), %xmm0    # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 4(%rdi,%rax,4)
	addq	$1, %rax
	cmpl	$1023, %eax             # imm = 0x3FF
	jl	.LBB1_1
# %bb.2:                                # %for.end
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	raw, .Lfunc_end1-raw
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 5a290db4b49c7f391b3038372cb69fdfc9f07725) (http://github.com/llvm-mirror/llvm.git 9b0581974207d38a5ef880bed858a33e6cbf12db)"
	.section	".note.GNU-stack","",@progbits
