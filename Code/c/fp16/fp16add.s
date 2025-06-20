	.text
	.file	"fp16add.c"
	.globl	add                             # -- Begin function add
	.p2align	4, 0x90
	.type	add,@function
add:                                    # @add
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	pextrw	$0, %xmm0, %eax
                                        # kill: def $ax killed $ax killed $eax
	movw	%ax, -2(%rbp)
	pextrw	$0, %xmm1, %eax
                                        # kill: def $ax killed $ax killed $eax
	movw	%ax, -4(%rbp)
                                        # implicit-def: $xmm0
	pinsrw	$0, -2(%rbp), %xmm0
	callq	__extendhfsf2@PLT
	movss	%xmm0, -8(%rbp)                 # 4-byte Spill
                                        # implicit-def: $xmm0
	pinsrw	$0, -4(%rbp), %xmm0
	callq	__extendhfsf2@PLT
	movaps	%xmm0, %xmm1
	movss	-8(%rbp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	addss	%xmm1, %xmm0
	callq	__truncsfhf2@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	add, .Lfunc_end0-add
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git df38792efbdf8947bbf733ef81f183c0a11ffc97)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
