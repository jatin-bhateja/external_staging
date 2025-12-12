	.text
	.file	"four_add_patterns.c"
	.globl	add_v1                          # -- Begin function add_v1
	.p2align	4, 0x90
	.type	add_v1,@function
add_v1:                                 # @add_v1
	.cfi_startproc
# %bb.0:
                                        # kill: def $esi killed $esi def $rsi
                                        # kill: def $edi killed $edi def $rdi
	leal	(%rdi,%rsi), %eax
	retq
.Lfunc_end0:
	.size	add_v1, .Lfunc_end0-add_v1
	.cfi_endproc
                                        # -- End function
	.globl	add_v2                          # -- Begin function add_v2
	.p2align	4, 0x90
	.type	add_v2,@function
add_v2:                                 # @add_v2
	.cfi_startproc
# %bb.0:
                                        # kill: def $esi killed $esi def $rsi
                                        # kill: def $edi killed $edi def $rdi
	leal	(%rdi,%rsi), %eax
	retq
.Lfunc_end1:
	.size	add_v2, .Lfunc_end1-add_v2
	.cfi_endproc
                                        # -- End function
	.globl	add_v3                          # -- Begin function add_v3
	.p2align	4, 0x90
	.type	add_v3,@function
add_v3:                                 # @add_v3
	.cfi_startproc
# %bb.0:
                                        # kill: def $esi killed $esi def $rsi
                                        # kill: def $edi killed $edi def $rdi
	leal	(%rdi,%rsi), %eax
	retq
.Lfunc_end2:
	.size	add_v3, .Lfunc_end2-add_v3
	.cfi_endproc
                                        # -- End function
	.globl	add_v4                          # -- Begin function add_v4
	.p2align	4, 0x90
	.type	add_v4,@function
add_v4:                                 # @add_v4
	.cfi_startproc
# %bb.0:
                                        # kill: def $esi killed $esi def $rsi
                                        # kill: def $edi killed $edi def $rdi
	leal	(%rdi,%rsi), %eax
	retq
.Lfunc_end3:
	.size	add_v4, .Lfunc_end3-add_v4
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
