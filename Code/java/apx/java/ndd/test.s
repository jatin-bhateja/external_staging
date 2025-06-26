	.file	"test.c"
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
#APP
# 3 "test.c" 1
	addq %r9, %r10, %r11 
	movq %r10, %r11       
	addq %r9, %r11        
	
# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	micro, .-micro
	.ident	"GCC: (GNU) 14.0.1 20240226 (experimental)"
	.section	.note.GNU-stack,"",@progbits
