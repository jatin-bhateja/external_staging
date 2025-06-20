	.file	"test.c"
	.text
	.data
	.align 2
	.type	.Lubsan_type0, @object
	.size	.Lubsan_type0, 10
.Lubsan_type0:
	.value	0
	.value	11
	.string	"'int'"
	.align 2
	.type	.Lubsan_type1, @object
	.size	.Lubsan_type1, 15
.Lubsan_type1:
	.value	0
	.value	13
	.string	"'long int'"
	.section	.rodata
.LC0:
	.string	"test.c"
	.section	.data.rel.local,"aw"
	.align 32
	.type	.Lubsan_data0, @object
	.size	.Lubsan_data0, 32
.Lubsan_data0:
	.quad	.LC0
	.long	5
	.long	15
	.quad	.Lubsan_type1
	.quad	.Lubsan_type0
	.align 16
	.type	.Lubsan_data1, @object
	.size	.Lubsan_data1, 24
.Lubsan_data1:
	.quad	.LC0
	.long	5
	.long	24
	.quad	.Lubsan_type1
	.text
	.globl	_Z7microUBv
	.type	_Z7microUBv, @function
_Z7microUBv:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	$1, -24(%rbp)
	movq	-24(%rbp), %rbx
	movq	%rbx, %rax
	shrq	$63, %rax
	movl	%eax, %edx
	movq	%rbx, %rax
	cmpq	$1, %rax
	seta	%al
	orl	%edx, %eax
	testb	%al, %al
	je	.L2
	movq	%rbx, %rax
	movl	$63, %edx
	movq	%rax, %rsi
	leaq	.Lubsan_data0(%rip), %rdi
	call	__ubsan_handle_shift_out_of_bounds@PLT
.L2:
	movq	%rbx, %rax
	salq	$63, %rax
	movq	%rax, %rbx
	subq	$1, %rbx
	jno	.L3
	movl	$1, %edx
	movq	%rax, %rsi
	leaq	.Lubsan_data1(%rip), %rdi
	call	__ubsan_handle_sub_overflow@PLT
.L3:
	movq	%rbx, %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z7microUBv, .-_Z7microUBv
	.ident	"GCC: (Ubuntu 10.5.0-1ubuntu1~20.04) 10.5.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
