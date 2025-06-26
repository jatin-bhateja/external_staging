	.file	"context_switch.c"
	.text
	.globl	next_pc
	.bss
	.align 8
	.type	next_pc, @object
	.size	next_pc, 8
next_pc:
	.zero	8
	.section	.rodata
.LC0:
	.string	"Received Signal => %d\n"
	.text
	.globl	signal_handle
	.type	signal_handle, @function
signal_handle:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	signal_handle, .-signal_handle
	.globl	sig_action
	.type	sig_action, @function
sig_action:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	cmpl	$11, -20(%rbp)
	jne	.L4
	movq	next_pc(%rip), %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 168(%rax)
.L4:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	sig_action, .-sig_action
	.section	.rodata
.LC1:
	.string	"context_switch.c"
.LC2:
	.string	"td != NULL"
.LC3:
	.string	"[tid=%d]"
.LC4:
	.string	"Entering thread.\n"
.LC5:
	.string	"Input slice size = %d.\n"
.LC6:
	.string	"Output slice size = %d.\n"
.LC7:
	.string	"td->ossize == td->issize >> 4"
.LC8:
	.string	"Exiting thread.\n"
	.text
	.globl	kernel
	.type	kernel, @function
kernel:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	-184(%rbp), %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L6
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$50, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L6:
	movq	-24(%rbp), %rax
	movl	16(%rax), %edx
	movq	stdout(%rip), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$17, %edx
	movl	$1, %esi
	movl	$.LC4, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush
	cmpq	$0, -24(%rbp)
	jne	.L7
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$51, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L7:
	movq	-24(%rbp), %rax
	movl	16(%rax), %edx
	movq	stdout(%rip), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	-24(%rbp), %rax
	movl	20(%rax), %edx
	movq	stdout(%rip), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush
	cmpq	$0, -24(%rbp)
	jne	.L8
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$52, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L8:
	movq	-24(%rbp), %rax
	movl	16(%rax), %edx
	movq	stdout(%rip), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	-24(%rbp), %rax
	movl	24(%rax), %edx
	movq	stdout(%rip), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush
	movq	-24(%rbp), %rax
	movl	24(%rax), %edx
	movq	-24(%rbp), %rax
	movl	20(%rax), %eax
	sarl	$4, %eax
	cmpl	%eax, %edx
	je	.L9
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$53, %edx
	movl	$.LC1, %esi
	movl	$.LC7, %edi
	call	__assert_fail
.L9:
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L10
.L11:
	movq	$signal_handle, -176(%rbp)
	movq	$sig_action, -176(%rbp)
	leaq	-176(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$11, %edi
	call	sigaction
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rcx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %r8
#APP
# 59 "context_switch.c" 1
	movq %r8, %rsi          
	movq 0x0(%rsi),   %r16 
	movq 0x8(%rsi),   %r17 
	movq 0x10(%rsi),  %r18 
	movq 0x18(%rsi),  %r19 
	movq 0x20(%rsi),  %r20 
	movq 0x28(%rsi),  %r21 
	movq 0x30(%rsi),  %r22 
	movq 0x38(%rsi),  %r23 
	movq 0x40(%rsi),  %r24 
	movq 0x48(%rsi),  %r25 
	movq 0x50(%rsi),  %r26 
	movq 0x58(%rsi),  %r27 
	movq 0x60(%rsi),  %r28 
	movq 0x68(%rsi),  %r29 
	movq 0x70(%rsi),  %r30 
	movq 0x78(%rsi),  %r31 
	addq $8, %r16 
	addq $8, %r17 
	addq $8, %r18 
	addq $8, %r19 
	addq $8, %r20 
	addq $8, %r21 
	addq $8, %r22 
	addq $8, %r23 
	addq $8, %r24 
	addq $8, %r25 
	addq $8, %r26 
	addq $8, %r27 
	addq $8, %r28 
	addq $8, %r29 
	addq $8, %r30 
	addq $8, %r31 
	pause          
	pause          
	pause          
	pause          
	pause          
	pause          
	pause          
	pause          
	pause          
	pause          
	pause          
	pause          
	pause          
	pause          
	pause          
	pause          
	pause          
	leaq next_pc(%rip) ,  %rdi        
	movq $0x0, %rax        
	leaq 0x0(%rip), %rdx  
	addq $0xe, %rdx       
	movq %rdx,  (%rdi)    
	movq $1, (%rax)        
	movq $0x10, %rax       
	addq %rax, %r16 
	addq %r17, %r16 
	addq %r18, %r16 
	addq %r19, %r16 
	addq %r20, %r16 
	addq %r21, %r16 
	addq %r22, %r16 
	addq %r23, %r16 
	addq %r24, %r16 
	addq %r25, %r16 
	addq %r26, %r16 
	addq %r27, %r16 
	addq %r28, %r16 
	addq %r29, %r16 
	addq %r30, %r16 
	addq %r31, %r16 
	movq %r16, (%rcx) 
	
# 0 "" 2
#NO_APP
	addl	$16, -4(%rbp)
	addl	$1, -8(%rbp)
.L10:
	movq	-24(%rbp), %rax
	movl	20(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L11
	movl	$1, -12(%rbp)
	jmp	.L12
.L13:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rcx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	addl	$1, -12(%rbp)
.L12:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L13
	cmpq	$0, -24(%rbp)
	jne	.L14
	movl	$__PRETTY_FUNCTION__.0, %ecx
	movl	$146, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L14:
	movq	-24(%rbp), %rax
	movl	16(%rax), %edx
	movq	stdout(%rip), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movl	$.LC8, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush
	movq	-24(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	kernel, .-kernel
	.section	.rodata
	.align 8
.LC9:
	.string	"Incorrect arguments! => ./app <thread_count>\n"
.LC10:
	.string	"[thead %d] res = %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushp	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rbx
	cmpl	$2, -84(%rbp)
	je	.L17
	movq	stderr(%rip), %rax
	movl	$.LC9, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	jmp	.L18
.L17:
	addq	$8, -96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -48(%rbp)
	cltq
	leaq	0(,%rax,8), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -56(%rbp)
	movl	-36(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -64(%rbp)
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$18, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -72(%rbp)
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$18, %rax
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$14, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -80(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L19
.L20:
	movl	-20(%rbp), %eax
	cltq
	salq	$5, %rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rax, %rdx
	addl	$1, -20(%rbp), %eax
	movl	%eax, 16(%rdx)
	movl	-20(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$11, %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movl	-20(%rbp), %eax
	cltq
	salq	$5, %rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	-80(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movl	-20(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$15, %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movl	-20(%rbp), %eax
	cltq
	salq	$5, %rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	-72(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, 8(%rax)
	movl	-20(%rbp), %eax
	cltq
	salq	$5, %rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	$163840, 20(%rax)
	movl	-20(%rbp), %eax
	cltq
	salq	$5, %rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	$10240, 24(%rax)
	addl	$1, -20(%rbp)
.L19:
	movl	-20(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L20
	movl	$0, -24(%rbp)
	jmp	.L21
.L22:
	movl	-24(%rbp), %eax
	cltq
	salq	$5, %rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rax, %rdx
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rcx
	movl	$kernel, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create
	addl	$1, -24(%rbp)
.L21:
	movl	-24(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L22
	movl	$0, -28(%rbp)
	jmp	.L23
.L24:
	movq	-56(%rbp), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join
	addl	$1, -28(%rbp)
.L23:
	movl	-28(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L24
	movl	$0, -32(%rbp)
	jmp	.L25
.L26:
	movl	-32(%rbp), %eax
	cltq
	salq	$5, %rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movl	-32(%rbp), %eax
	cltq
	salq	$5, %rax, %rcx
	movq	-64(%rbp), %rax
	addq	%rcx, %rax
	movl	16(%rax), %eax
	movl	%eax, %esi
	movl	$.LC10, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -32(%rbp)
.L25:
	movl	-32(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L26
	movl	$0, %eax
.L18:
	movq	%rbx, %rsp
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 7
__PRETTY_FUNCTION__.0:
	.string	"kernel"
	.ident	"GCC: (GNU) 14.0.1 20240226 (experimental)"
	.section	.note.GNU-stack,"",@progbits
