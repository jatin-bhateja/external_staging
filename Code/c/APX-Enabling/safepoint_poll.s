	.file	"safepoint_poll.c"
	.text
	.globl	micro
	.type	micro, @function
micro:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushp	%r15
	.cfi_offset 15, -24
#APP
# 4 "safepoint_poll.c" 1
	testl %eax, (%rax) 
	testl %eax, (%r15) 
	testl %eax, (%r16) 
	
# 0 "" 2
#NO_APP
	nop
	movq	-8(%rbp), %r15
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	micro, .-micro
	.ident	"GCC: (GNU) 14.0.1 20240226 (experimental)"
	.section	.note.GNU-stack,"",@progbits
