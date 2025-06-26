	.file	"const.cpp"
	.text
	.section	.rodata
	.align 8
	.type	_ZL3arr, @object
	.size	_ZL3arr, 12
_ZL3arr:
	.long	1
	.long	2
	.long	3
	.text
	.globl	_Z16const_arr_accessv
	.type	_Z16const_arr_accessv, @function
_Z16const_arr_accessv:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$1, %edx
	movl	$2, %eax
	addl	%edx, %eax
	movl	$3, %edx
	addl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z16const_arr_accessv, .-_Z16const_arr_accessv
	.globl	arr1
	.data
	.align 8
	.type	arr1, @object
	.size	arr1, 12
arr1:
	.long	1
	.long	2
	.long	3
	.text
	.globl	_Z20non_const_arr_accessv
	.type	_Z20non_const_arr_accessv, @function
_Z20non_const_arr_accessv:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	arr1(%rip), %edx
	movl	4+arr1(%rip), %eax
	addl	%eax, %edx
	movl	8+arr1(%rip), %eax
	addl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z20non_const_arr_accessv, .-_Z20non_const_arr_accessv
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
