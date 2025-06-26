	.file	"jit1.c"
	.text
	.globl	micro
	.type	micro, @function
micro:
.LFB13:
	.cfi_startproc
	endbr64
	leal	(%rdi,%rsi), %eax
	ret
	.cfi_endproc
.LFE13:
	.size	micro, .-micro
	.globl	callee
	.type	callee, @function
callee:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %eax
	movq	%rsi, %rdi
	leal	40(%rax,%rsi), %ebx
	movslq	%ebx, %rsi
	call	micro
	leal	(%rax,%rbx,2), %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	callee, .-callee
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB15:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$20, %esi
	movl	$10, %edi
	call	callee
	movl	%eax, %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
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
