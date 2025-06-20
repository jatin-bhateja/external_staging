	.file	"test_prefetch.c"
	.text
	.globl	func
	.type	func, @function
func:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 4 "test_prefetch.c" 1
	movq $10 , (%r17, %rcx) 
	movq $10 , (%rcx, %rcx) 
	
# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	func, .-func
	.ident	"GCC: (GNU) 14.0.1 20240229 (experimental)"
	.section	.note.GNU-stack,"",@progbits
