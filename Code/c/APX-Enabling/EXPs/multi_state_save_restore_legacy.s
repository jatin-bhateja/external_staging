	.file	"multi_state_save_restore_legacy.c"
	.text
	.section	.rodata
.LC0:
	.string	"[TID=%lu] "
.LC1:
	.string	"Entered function..\n"
.LC2:
	.string	"Saving EGPR state..\n"
.LC3:
	.string	"Sleeping..\n"
.LC4:
	.string	"Wakeup..\n"
.LC5:
	.string	"Restored EGPR state..\n"
.LC6:
	.string	"%%r%d"
	.align 8
.LC7:
	.string	"Incorrect %s restoration => saved[=%ld] : restored[=%ld]\n"
	.align 8
.LC8:
	.string	"Successful state restoration..\n"
	.text
	.globl	func
	.type	func, @function
func:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	addq	$-128, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movq	%rdi, -152(%rbp)
	call	pthread_self
	movq	%rax, %rdx
	movq	stdout(%rip), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$19, %edx
	movl	$1, %esi
	movl	$.LC1, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush
	call	pthread_self
	movq	%rax, %rdx
	movq	stdout(%rip), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$20, %edx
	movl	$1, %esi
	movl	$.LC2, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush
	movq	-152(%rbp), %rax
#APP
# 30 "multi_state_save_restore_legacy.c" 1
	movq %rax ,          %rsi 
	movq 0x0(%rsi),   %r8 
	movq 0x8(%rsi),   %r9 
	movq 0x10(%rsi),  %r10 
	movq 0x18(%rsi),  %r11 
	movq 0x20(%rsi),  %r12 
	movq 0x28(%rsi),  %r13 
	movq 0x30(%rsi),  %r14 
	movq 0x38(%rsi),  %r15 
	
# 0 "" 2
#NO_APP
	call	pthread_self
	movq	%rax, %rdx
	movq	stdout(%rip), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$11, %edx
	movl	$1, %esi
	movl	$.LC3, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush
	movl	$10, %edi
	call	sleep
	call	pthread_self
	movq	%rax, %rdx
	movq	stdout(%rip), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	movl	$.LC4, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush
	leaq	-128(%rbp), %rax
	movl	$64, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	leaq	-128(%rbp), %rax
	movq	%rax, -48(%rbp)
#APP
# 50 "multi_state_save_restore_legacy.c" 1
	movq %rax ,         %rdi 
	movq %r8,  0x0(%rdi) 
	movq %r9,  0x8(%rdi) 
	movq %r10, 0x10(%rdi) 
	movq %r11, 0x18(%rdi) 
	movq %r12, 0x20(%rdi) 
	movq %r13, 0x28(%rdi) 
	movq %r14, 0x30(%rdi) 
	movq %r15, 0x38(%rdi) 
	
# 0 "" 2
#NO_APP
	movq	%rax, -48(%rbp)
	call	pthread_self
	movq	%rax, %rdx
	movq	stdout(%rip), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$22, %edx
	movl	$1, %esi
	movl	$.LC5, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush
	movl	$0, -36(%rbp)
	jmp	.L2
.L4:
	movl	-36(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
	movl	-36(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	-128(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	cmpq	-64(%rbp), %rax
	je	.L3
	movq	$0, -144(%rbp)
	movq	$0, -136(%rbp)
	movl	-36(%rbp), %eax
	leal	8(%rax), %edx
	leaq	-144(%rbp), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	call	pthread_self
	movq	%rax, %rdx
	movq	stdout(%rip), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stdout(%rip), %rax
	movq	-64(%rbp), %rsi
	movq	-56(%rbp), %rcx
	leaq	-144(%rbp), %rdx
	movq	%rsi, %r8
	movl	$.LC7, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush
.L3:
	addl	$1, -36(%rbp)
.L2:
	movl	-36(%rbp), %eax
	cmpl	$7, %eax
	jbe	.L4
	call	pthread_self
	movq	%rax, %rdx
	movq	stdout(%rip), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	movl	$.LC8, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush
	movl	$0, %eax
	subq	$-128, %rsp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	func, .-func
	.section	.rodata
.LC9:
	.string	"Incorrect Arguments!"
.LC10:
	.string	"Thread Count = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movl	%edi, -116(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rbx
	cmpl	$2, -116(%rbp)
	je	.L7
	movl	$.LC9, %edi
	call	puts
	movl	$-1, %eax
	jmp	.L8
.L7:
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC10, %edi
	movl	$0, %eax
	call	printf
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -40(%rbp)
	cltq
	leaq	0(,%rax,8), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -48(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L9
.L12:
	leaq	-112(%rbp), %rax
	movl	$64, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movl	$0, -24(%rbp)
	jmp	.L10
.L11:
	movl	-24(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	leaq	(%rax,%rdx), %rcx
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	-112(%rbp), %rax
	addq	%rdx, %rax
	movq	%rcx, %rdx
	movq	%rdx, (%rax)
	addl	$1, -24(%rbp)
.L10:
	movl	-24(%rbp), %eax
	cmpl	$7, %eax
	jbe	.L11
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	leaq	(%rdx,%rax), %rdi
	leaq	-112(%rbp), %rax
	movq	%rax, %rcx
	movl	$func, %edx
	movl	$0, %esi
	call	pthread_create
	addl	$1, -20(%rbp)
.L9:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L12
	movl	$0, -28(%rbp)
	jmp	.L13
.L14:
	movq	-48(%rbp), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join
	addl	$1, -28(%rbp)
.L13:
	movl	-28(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L14
	movl	$0, %eax
.L8:
	movq	%rbx, %rsp
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.0.1 20240226 (experimental)"
	.section	.note.GNU-stack,"",@progbits
