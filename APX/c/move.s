	.file	"move.c"
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
	pushp	%r12
	.cfi_offset 12, -24
#APP
# 3 "move.c" 1
	movq %r17, %r20 
	movq %r11, %r12 
	
# 0 "" 2
#NO_APP
	nop
	movq	-8(%rbp), %r12
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	micro, .-micro
	.ident	"GCC: (GNU) 14.0.1 20240226 (experimental)"
	.section	.note.GNU-stack,"",@progbits
