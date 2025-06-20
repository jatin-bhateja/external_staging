	.file	"context_switch_legacy.c"
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
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
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
	endbr64
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
	.string	"context_switch_legacy.c"
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
	.string	"td->ossize == td->issize >> 3"
.LC8:
	.string	"Exiting thread.\n"
	.text
	.globl	kernel
	.type	kernel, @function
kernel:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L6
	leaq	__PRETTY_FUNCTION__.3932(%rip), %rcx
	movl	$49, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
.L6:
	movq	-56(%rbp), %rax
	movl	16(%rax), %edx
	movq	stdout(%rip), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$17, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	fwrite@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	cmpq	$0, -56(%rbp)
	jne	.L7
	leaq	__PRETTY_FUNCTION__.3932(%rip), %rcx
	movl	$50, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
.L7:
	movq	-56(%rbp), %rax
	movl	16(%rax), %edx
	movq	stdout(%rip), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-56(%rbp), %rax
	movl	20(%rax), %edx
	movq	stdout(%rip), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	cmpq	$0, -56(%rbp)
	jne	.L8
	leaq	__PRETTY_FUNCTION__.3932(%rip), %rcx
	movl	$51, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
.L8:
	movq	-56(%rbp), %rax
	movl	16(%rax), %edx
	movq	stdout(%rip), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-56(%rbp), %rax
	movl	24(%rax), %edx
	movq	stdout(%rip), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movq	-56(%rbp), %rax
	movl	24(%rax), %edx
	movq	-56(%rbp), %rax
	movl	20(%rax), %eax
	sarl	$3, %eax
	cmpl	%eax, %edx
	je	.L9
	leaq	__PRETTY_FUNCTION__.3932(%rip), %rcx
	movl	$52, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	__assert_fail@PLT
.L9:
	movl	$0, -68(%rbp)
	movl	$0, -64(%rbp)
	jmp	.L10
.L11:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rcx
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movl	-68(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rbx
#APP
# 54 "context_switch_legacy.c" 1
	movq %rbx, %rsi          
	movq 0x0(%rsi),   %r8 
	movq 0x8(%rsi),   %r9 
	movq 0x10(%rsi),  %r10 
	movq 0x18(%rsi),  %r11 
	movq 0x20(%rsi),  %r12 
	movq 0x28(%rsi),  %r13 
	movq 0x30(%rsi),  %r14 
	movq 0x38(%rsi),  %r15 
	addq $5, %r8 
	addq $5, %r9 
	addq $5, %r10 
	addq $5, %r11 
	addq $5, %r12 
	addq $5, %r13 
	addq $5, %r14 
	addq $5, %r15 
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
	addq %rax, %r8 
	addq %r9, %r8 
	addq %r10, %r8 
	addq %r11, %r8 
	addq %r12, %r8 
	addq %r13, %r8 
	addq %r14, %r8 
	addq %r15, %r8 
	movq %r8,  (%rcx)   
	
# 0 "" 2
#NO_APP
	addl	$8, -68(%rbp)
	addl	$1, -64(%rbp)
.L10:
	movq	-56(%rbp), %rax
	movl	20(%rax), %eax
	cmpl	%eax, -68(%rbp)
	jl	.L11
	movl	$1, -60(%rbp)
	jmp	.L12
.L13:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rcx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movl	-60(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	addl	$1, -60(%rbp)
.L12:
	movq	-56(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	%eax, -60(%rbp)
	jl	.L13
	cmpq	$0, -56(%rbp)
	jne	.L14
	leaq	__PRETTY_FUNCTION__.3932(%rip), %rcx
	movl	$107, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
.L14:
	movq	-56(%rbp), %rax
	movl	16(%rax), %edx
	movq	stdout(%rip), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	fwrite@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movq	-56(%rbp), %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
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
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$248, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -276(%rbp)
	movq	%rsi, -288(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	cmpl	$2, -276(%rbp)
	je	.L17
	movq	stderr(%rip), %rax
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L18
.L17:
	leaq	signal_handle(%rip), %rax
	movq	%rax, -208(%rbp)
	leaq	sig_action(%rip), %rax
	movq	%rax, -208(%rbp)
	leaq	-208(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$11, %edi
	call	sigaction@PLT
	movq	-288(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -252(%rbp)
	movl	-252(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -248(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r14
	movl	$0, %r15d
	movslq	%eax, %rdx
	movq	%rdx, %r12
	movl	$0, %r13d
	cltq
	leaq	0(,%rax,8), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rsi
	subq	%rdx, %rsi
	movq	%rsi, %rdx
.L19:
	cmpq	%rdx, %rsp
	je	.L20
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L19
.L20:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L21
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L21:
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -240(%rbp)
	movl	-252(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -232(%rbp)
	movl	-252(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$10, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -224(%rbp)
	movq	-224(%rbp), %rax
	movl	$7168, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	-252(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$7, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -216(%rbp)
	movl	$0, -256(%rbp)
	jmp	.L22
.L23:
	movl	-256(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movl	-256(%rbp), %edx
	addl	$1, %edx
	movl	%edx, 16(%rax)
	movl	-256(%rbp), %eax
	imull	$112, %eax, %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movl	-256(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movq	-216(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	movl	-256(%rbp), %eax
	imull	$896, %eax, %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movl	-256(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movq	-224(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, 8(%rax)
	movl	-256(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movl	$896, 20(%rax)
	movl	-256(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movl	$112, 24(%rax)
	addl	$1, -256(%rbp)
.L22:
	movl	-256(%rbp), %eax
	cmpl	-252(%rbp), %eax
	jl	.L23
	movl	$0, -260(%rbp)
	jmp	.L24
.L25:
	movl	-260(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-232(%rbp), %rax
	addq	%rax, %rdx
	movl	-260(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-240(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rcx
	leaq	kernel(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	addl	$1, -260(%rbp)
.L24:
	movl	-260(%rbp), %eax
	cmpl	-252(%rbp), %eax
	jl	.L25
	movl	$0, -264(%rbp)
	jmp	.L26
.L27:
	movq	-240(%rbp), %rax
	movl	-264(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	addl	$1, -264(%rbp)
.L26:
	movl	-264(%rbp), %eax
	cmpl	-252(%rbp), %eax
	jl	.L27
	movl	$0, -268(%rbp)
	jmp	.L28
.L29:
	movl	-268(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movl	-268(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rcx
	movq	-232(%rbp), %rax
	addq	%rcx, %rax
	movl	16(%rax), %eax
	movl	%eax, %esi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -268(%rbp)
.L28:
	movl	-268(%rbp), %eax
	cmpl	-252(%rbp), %eax
	jl	.L29
	movl	$0, %eax
.L18:
	movq	%rbx, %rsp
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L31
	call	__stack_chk_fail@PLT
.L31:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.3932, @object
	.size	__PRETTY_FUNCTION__.3932, 7
__PRETTY_FUNCTION__.3932:
	.string	"kernel"
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
