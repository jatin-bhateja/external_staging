	.text
	.file	"cpuid.c"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset %rbx, -24
	movl	$0, -12(%rbp)
	movl	$1, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -28(%rbp)
	movq	.L__const.main.proct, %rax
	movq	%rax, -64(%rbp)
	movq	.L__const.main.proct+8, %rax
	movq	%rax, -56(%rbp)
	movq	.L__const.main.proct+16, %rax
	movq	%rax, -48(%rbp)
	movq	.L__const.main.proct+24, %rax
	movq	%rax, -40(%rbp)
	movl	-16(%rbp), %ecx
	movl	%ecx, -92(%rbp)         # 4-byte Spill
	movl	-92(%rbp), %esi         # 4-byte Reload
	#APP
	movl	%esi, %eax
	cpuid
	movl	%eax, %esi
	movl	%ebx, %edi
	movl	%ecx, %r8d
	movl	%edx, %r9d

	#NO_APP
	movl	%esi, %eax
	movl	%eax, -16(%rbp)
	movl	%edi, -20(%rbp)
	movl	%r8d, -24(%rbp)
	movl	%r9d, -28(%rbp)
	movl	-16(%rbp), %eax
	movabsq	$.L.str.4, %rdi
	movl	%esi, -92(%rbp)         # 4-byte Spill
	movl	%eax, %esi
	movb	$0, %al
	callq	printf
	movl	-16(%rbp), %ecx
	andl	$15, %ecx
	movl	%ecx, -68(%rbp)
	movl	-68(%rbp), %esi
	movabsq	$.L.str.5, %rdi
	movl	%eax, -96(%rbp)         # 4-byte Spill
	movb	$0, %al
	callq	printf
	movl	-16(%rbp), %ecx
	andl	$240, %ecx
	sarl	$4, %ecx
	movl	%ecx, -72(%rbp)
	movl	-72(%rbp), %esi
	movabsq	$.L.str.6, %rdi
	movl	%eax, -100(%rbp)        # 4-byte Spill
	movb	$0, %al
	callq	printf
	movl	-16(%rbp), %ecx
	andl	$3840, %ecx             # imm = 0xF00
	sarl	$8, %ecx
	movl	%ecx, -76(%rbp)
	movl	-76(%rbp), %esi
	movabsq	$.L.str.7, %rdi
	movl	%eax, -104(%rbp)        # 4-byte Spill
	movb	$0, %al
	callq	printf
	movl	-16(%rbp), %ecx
	andl	$12288, %ecx            # imm = 0x3000
	sarl	$12, %ecx
	movl	%ecx, -80(%rbp)
	movslq	-80(%rbp), %rdi
	movq	-64(%rbp,%rdi,8), %rsi
	movabsq	$.L.str.8, %rdi
	movl	%eax, -108(%rbp)        # 4-byte Spill
	movb	$0, %al
	callq	printf
	movl	-16(%rbp), %ecx
	andl	$983040, %ecx           # imm = 0xF0000
	sarl	$16, %ecx
	movl	%ecx, -84(%rbp)
	movl	-84(%rbp), %esi
	movabsq	$.L.str.9, %rdi
	movl	%eax, -112(%rbp)        # 4-byte Spill
	movb	$0, %al
	callq	printf
	movl	-16(%rbp), %ecx
	andl	$267386880, %ecx        # imm = 0xFF00000
	sarl	$20, %ecx
	movl	%ecx, -88(%rbp)
	movl	-88(%rbp), %esi
	movabsq	$.L.str.10, %rdi
	movl	%eax, -116(%rbp)        # 4-byte Spill
	movb	$0, %al
	callq	printf
	movl	-20(%rbp), %esi
	movabsq	$.L.str.11, %rdi
	movl	%eax, -120(%rbp)        # 4-byte Spill
	movb	$0, %al
	callq	printf
	movl	-24(%rbp), %esi
	movabsq	$.L.str.12, %rdi
	movl	%eax, -124(%rbp)        # 4-byte Spill
	movb	$0, %al
	callq	printf
	movl	-28(%rbp), %esi
	movabsq	$.L.str.13, %rdi
	movl	%eax, -128(%rbp)        # 4-byte Spill
	movb	$0, %al
	callq	printf
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Original OEM"
	.size	.L.str, 13

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"Intel Overdrive"
	.size	.L.str.1, 16

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Dual Processor"
	.size	.L.str.2, 15

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"Intel Reserved"
	.size	.L.str.3, 15

	.type	.L__const.main.proct,@object # @__const.main.proct
	.section	.rodata,"a",@progbits
	.p2align	4
.L__const.main.proct:
	.quad	.L.str
	.quad	.L.str.1
	.quad	.L.str.2
	.quad	.L.str.3
	.size	.L__const.main.proct, 32

	.type	.L.str.4,@object        # @.str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4:
	.asciz	"EAX = %x\n"
	.size	.L.str.4, 10

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"    Stepping ID : %x \n "
	.size	.L.str.5, 24

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"    Model       : %x \n "
	.size	.L.str.6, 24

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"    Family ID   : %x \n "
	.size	.L.str.7, 24

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	"    Proctype    : %s \n "
	.size	.L.str.8, 24

	.type	.L.str.9,@object        # @.str.9
.L.str.9:
	.asciz	"    Ext Model ID : %x \n "
	.size	.L.str.9, 25

	.type	.L.str.10,@object       # @.str.10
.L.str.10:
	.asciz	"    Ext Family ID : %x \n"
	.size	.L.str.10, 25

	.type	.L.str.11,@object       # @.str.11
.L.str.11:
	.asciz	"EBX = %x\n"
	.size	.L.str.11, 10

	.type	.L.str.12,@object       # @.str.12
.L.str.12:
	.asciz	"ECX = %x\n"
	.size	.L.str.12, 10

	.type	.L.str.13,@object       # @.str.13
.L.str.13:
	.asciz	"EDX = %x\n"
	.size	.L.str.13, 10

	.ident	"clang version 10.0.0-4ubuntu1~18.04.2 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym printf
