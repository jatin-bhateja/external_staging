	.text
	.section	.note.gnu.property,"a",@note
	.p2align	3
	.long	4
	.long	16
	.long	5
	.asciz	"GNU"
	.long	3221225474
	.long	4
	.long	1
	.p2align	3
.Lsec_end0:
	.text
	.file	"switch.c"
	.globl	func                    # -- Begin function func
	.p2align	4, 0x90
	.type	func,@function
func:                                   # @func
	.cfi_startproc
# %bb.0:
	endbr64                         # Prolog : MachPrologNode
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, %ecx
	subl	$6, %eax
	movq	%rcx, -16(%rbp)         # 8-byte Spill
	ja	.LBB0_8
# %bb.10:
	movq	-16(%rbp), %rax         # 8-byte Reload
	movq	.LJTI0_0(,%rax,8), %rcx
	notrack		jmpq	*%rcx   # Indirect jump: May jump at the start of any basic block. Inline-asm to any instruction.
.LBB0_1:                                # L1
	movl	-8(%rbp), %eax
	addl	$100, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB0_9
.LBB0_2:                                # L2
	movl	-8(%rbp), %eax
	addl	$200, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB0_9
.LBB0_3:
	movl	-8(%rbp), %eax
	addl	$300, %eax              # imm = 0x12C
	movl	%eax, -4(%rbp)
	jmp	.LBB0_9
.LBB0_4:
	movl	-8(%rbp), %eax
	addl	$400, %eax              # imm = 0x190
	movl	%eax, -4(%rbp)
	jmp	.LBB0_9
.LBB0_5:
	movl	-8(%rbp), %eax
	addl	$500, %eax              # imm = 0x1F4
	movl	%eax, -4(%rbp)
	jmp	.LBB0_9
.LBB0_6:
	movl	-8(%rbp), %eax
	addl	$600, %eax              # imm = 0x258
	movl	%eax, -4(%rbp)
	jmp	.LBB0_9
.LBB0_7:
	movl	-8(%rbp), %eax
	addl	$700, %eax              # imm = 0x2BC
	movl	%eax, -4(%rbp)
	jmp	.LBB0_9
.LBB0_8:
	movl	-8(%rbp), %eax
	addl	$10000, %eax            # imm = 0x2710
	movl	%eax, -4(%rbp)
.LBB0_9:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	func, .Lfunc_end0-func
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI0_0:
	.quad	.LBB0_1
	.quad	.LBB0_2
	.quad	.LBB0_3
	.quad	.LBB0_4
	.quad	.LBB0_5
	.quad	.LBB0_6
	.quad	.LBB0_7
                                        # -- End function
	.ident	"clang version 10.0.0-4ubuntu1~18.04.2 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
