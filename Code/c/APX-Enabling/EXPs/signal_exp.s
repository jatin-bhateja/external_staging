	.file	"signal_exp.c"
	.text
.Ltext0:
	.globl	next_pc
	.bss
	.align 8
	.type	next_pc, @object
	.size	next_pc, 8
next_pc:
	.zero	8
	.text
	.globl	func
	.type	func, @function
func:
.LFB6:
	.file 1 "signal_exp.c"
	.loc 1 15 13
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 16 8
	movq	$0, -8(%rbp)
	.loc 1 17 3
#APP
# 17 "signal_exp.c" 1
	leaq next_pc(%rip) ,  %rdi        
	movq $0x0, %rax        
	leaq 0x0(%rip), %rdx  
	addq $0xe, %rdx       
	movq %rdx,  (%rdi)    
	movq $1, (%rax)        
	movq $0x10, %rcx          
	
# 0 "" 2
#NO_APP
	movq	%rcx, -8(%rbp)
	.loc 1 31 10
	movq	-8(%rbp), %rax
	.loc 1 32 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	func, .-func
	.section	.rodata
.LC0:
	.string	"Received Signal => %d\n"
	.text
	.globl	signal_handle
	.type	signal_handle, @function
signal_handle:
.LFB7:
	.loc 1 34 29
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	.loc 1 35 4
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 36 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	signal_handle, .-signal_handle
	.globl	sig_action
	.type	sig_action, @function
sig_action:
.LFB8:
	.loc 1 40 57
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
	.loc 1 41 22
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 42 7
	cmpl	$11, -20(%rbp)
	jne	.L6
	.loc 1 43 39
	movq	next_pc(%rip), %rax
	movq	%rax, %rdx
	.loc 1 43 37
	movq	-8(%rbp), %rax
	movq	%rdx, 168(%rax)
.L6:
	.loc 1 45 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	sig_action, .-sig_action
	.section	.rodata
.LC1:
	.string	"RES = %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.loc 1 47 12
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	.loc 1 47 12
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 49 18
	leaq	signal_handle(%rip), %rax
	movq	%rax, -160(%rbp)
	.loc 1 50 20
	leaq	sig_action(%rip), %rax
	movq	%rax, -160(%rbp)
	.loc 1 51 3
	leaq	-160(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$11, %edi
	call	sigaction@PLT
	.loc 1 52 10
	movl	$0, %eax
	call	func
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 53 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/__sigval_t.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h"
	.file 7 "/usr/include/signal.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/sigaction.h"
	.file 9 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/types/stack_t.h"
	.file 11 "/usr/include/x86_64-linux-gnu/sys/ucontext.h"
	.file 12 "/usr/include/stdint.h"
	.file 13 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 14 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 15 "/usr/include/stdio.h"
	.file 16 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xaa4
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF142
	.byte	0xc
	.long	.LASF143
	.long	.LASF144
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.long	.LASF6
	.byte	0x2
	.byte	0x28
	.byte	0x1c
	.long	0x34
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF7
	.byte	0x2
	.byte	0x2a
	.byte	0x16
	.long	0x3b
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x3
	.long	.LASF9
	.byte	0x2
	.byte	0x2d
	.byte	0x1b
	.long	0x42
	.uleb128 0x3
	.long	.LASF10
	.byte	0x2
	.byte	0x92
	.byte	0x19
	.long	0x3b
	.uleb128 0x3
	.long	.LASF11
	.byte	0x2
	.byte	0x98
	.byte	0x19
	.long	0x76
	.uleb128 0x3
	.long	.LASF12
	.byte	0x2
	.byte	0x99
	.byte	0x1b
	.long	0x76
	.uleb128 0x3
	.long	.LASF13
	.byte	0x2
	.byte	0x9a
	.byte	0x19
	.long	0x63
	.uleb128 0x3
	.long	.LASF14
	.byte	0x2
	.byte	0x9c
	.byte	0x1b
	.long	0x76
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0xcd
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF15
	.uleb128 0x7
	.long	0xcd
	.uleb128 0x8
	.byte	0x80
	.byte	0x3
	.byte	0x5
	.byte	0x9
	.long	0xf0
	.uleb128 0x9
	.long	.LASF21
	.byte	0x3
	.byte	0x7
	.byte	0x15
	.long	0xf0
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x42
	.long	0x100
	.uleb128 0xb
	.long	0x42
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.long	.LASF16
	.byte	0x3
	.byte	0x8
	.byte	0x3
	.long	0xd9
	.uleb128 0x3
	.long	.LASF17
	.byte	0x4
	.byte	0x7
	.byte	0x14
	.long	0x100
	.uleb128 0xc
	.long	.LASF145
	.byte	0x8
	.byte	0x5
	.byte	0x18
	.byte	0x7
	.long	0x13e
	.uleb128 0xd
	.long	.LASF18
	.byte	0x5
	.byte	0x1a
	.byte	0x7
	.long	0x63
	.uleb128 0xd
	.long	.LASF19
	.byte	0x5
	.byte	0x1b
	.byte	0x9
	.long	0xc5
	.byte	0
	.uleb128 0x3
	.long	.LASF20
	.byte	0x5
	.byte	0x1e
	.byte	0x16
	.long	0x118
	.uleb128 0x8
	.byte	0x8
	.byte	0x6
	.byte	0x38
	.byte	0x2
	.long	0x16e
	.uleb128 0x9
	.long	.LASF22
	.byte	0x6
	.byte	0x3a
	.byte	0xe
	.long	0xad
	.byte	0
	.uleb128 0x9
	.long	.LASF23
	.byte	0x6
	.byte	0x3b
	.byte	0xe
	.long	0x89
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.byte	0x10
	.byte	0x6
	.byte	0x3f
	.byte	0x2
	.long	0x19f
	.uleb128 0x9
	.long	.LASF24
	.byte	0x6
	.byte	0x41
	.byte	0xa
	.long	0x63
	.byte	0
	.uleb128 0x9
	.long	.LASF25
	.byte	0x6
	.byte	0x42
	.byte	0xa
	.long	0x63
	.byte	0x4
	.uleb128 0x9
	.long	.LASF26
	.byte	0x6
	.byte	0x43
	.byte	0x11
	.long	0x13e
	.byte	0x8
	.byte	0
	.uleb128 0x8
	.byte	0x10
	.byte	0x6
	.byte	0x47
	.byte	0x2
	.long	0x1d0
	.uleb128 0x9
	.long	.LASF22
	.byte	0x6
	.byte	0x49
	.byte	0xe
	.long	0xad
	.byte	0
	.uleb128 0x9
	.long	.LASF23
	.byte	0x6
	.byte	0x4a
	.byte	0xe
	.long	0x89
	.byte	0x4
	.uleb128 0x9
	.long	.LASF26
	.byte	0x6
	.byte	0x4b
	.byte	0x11
	.long	0x13e
	.byte	0x8
	.byte	0
	.uleb128 0x8
	.byte	0x20
	.byte	0x6
	.byte	0x4f
	.byte	0x2
	.long	0x21b
	.uleb128 0x9
	.long	.LASF22
	.byte	0x6
	.byte	0x51
	.byte	0xe
	.long	0xad
	.byte	0
	.uleb128 0x9
	.long	.LASF23
	.byte	0x6
	.byte	0x52
	.byte	0xe
	.long	0x89
	.byte	0x4
	.uleb128 0x9
	.long	.LASF27
	.byte	0x6
	.byte	0x53
	.byte	0xa
	.long	0x63
	.byte	0x8
	.uleb128 0x9
	.long	.LASF28
	.byte	0x6
	.byte	0x54
	.byte	0x13
	.long	0xb9
	.byte	0x10
	.uleb128 0x9
	.long	.LASF29
	.byte	0x6
	.byte	0x55
	.byte	0x13
	.long	0xb9
	.byte	0x18
	.byte	0
	.uleb128 0x8
	.byte	0x10
	.byte	0x6
	.byte	0x61
	.byte	0x3
	.long	0x23f
	.uleb128 0x9
	.long	.LASF30
	.byte	0x6
	.byte	0x63
	.byte	0xd
	.long	0xc5
	.byte	0
	.uleb128 0x9
	.long	.LASF31
	.byte	0x6
	.byte	0x64
	.byte	0xd
	.long	0xc5
	.byte	0x8
	.byte	0
	.uleb128 0xe
	.byte	0x10
	.byte	0x6
	.byte	0x5e
	.byte	0x6
	.long	0x261
	.uleb128 0xd
	.long	.LASF32
	.byte	0x6
	.byte	0x65
	.byte	0x7
	.long	0x21b
	.uleb128 0xd
	.long	.LASF33
	.byte	0x6
	.byte	0x67
	.byte	0xe
	.long	0x6a
	.byte	0
	.uleb128 0x8
	.byte	0x20
	.byte	0x6
	.byte	0x59
	.byte	0x2
	.long	0x292
	.uleb128 0x9
	.long	.LASF34
	.byte	0x6
	.byte	0x5b
	.byte	0xc
	.long	0xc5
	.byte	0
	.uleb128 0x9
	.long	.LASF35
	.byte	0x6
	.byte	0x5d
	.byte	0x10
	.long	0x50
	.byte	0x8
	.uleb128 0x9
	.long	.LASF36
	.byte	0x6
	.byte	0x68
	.byte	0xa
	.long	0x23f
	.byte	0x10
	.byte	0
	.uleb128 0x8
	.byte	0x10
	.byte	0x6
	.byte	0x6c
	.byte	0x2
	.long	0x2b6
	.uleb128 0x9
	.long	.LASF37
	.byte	0x6
	.byte	0x6e
	.byte	0x15
	.long	0x76
	.byte	0
	.uleb128 0x9
	.long	.LASF38
	.byte	0x6
	.byte	0x6f
	.byte	0xa
	.long	0x63
	.byte	0x8
	.byte	0
	.uleb128 0x8
	.byte	0x10
	.byte	0x6
	.byte	0x74
	.byte	0x2
	.long	0x2e7
	.uleb128 0x9
	.long	.LASF39
	.byte	0x6
	.byte	0x76
	.byte	0xc
	.long	0xc5
	.byte	0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x6
	.byte	0x77
	.byte	0xa
	.long	0x63
	.byte	0x8
	.uleb128 0x9
	.long	.LASF41
	.byte	0x6
	.byte	0x78
	.byte	0x13
	.long	0x3b
	.byte	0xc
	.byte	0
	.uleb128 0xe
	.byte	0x70
	.byte	0x6
	.byte	0x33
	.byte	0x5
	.long	0x351
	.uleb128 0xd
	.long	.LASF42
	.byte	0x6
	.byte	0x35
	.byte	0x6
	.long	0x351
	.uleb128 0xd
	.long	.LASF43
	.byte	0x6
	.byte	0x3c
	.byte	0x6
	.long	0x14a
	.uleb128 0xd
	.long	.LASF44
	.byte	0x6
	.byte	0x44
	.byte	0x6
	.long	0x16e
	.uleb128 0xf
	.string	"_rt"
	.byte	0x6
	.byte	0x4c
	.byte	0x6
	.long	0x19f
	.uleb128 0xd
	.long	.LASF45
	.byte	0x6
	.byte	0x56
	.byte	0x6
	.long	0x1d0
	.uleb128 0xd
	.long	.LASF46
	.byte	0x6
	.byte	0x69
	.byte	0x6
	.long	0x261
	.uleb128 0xd
	.long	.LASF47
	.byte	0x6
	.byte	0x70
	.byte	0x6
	.long	0x292
	.uleb128 0xd
	.long	.LASF48
	.byte	0x6
	.byte	0x79
	.byte	0x6
	.long	0x2b6
	.byte	0
	.uleb128 0xa
	.long	0x63
	.long	0x361
	.uleb128 0xb
	.long	0x42
	.byte	0x1b
	.byte	0
	.uleb128 0x8
	.byte	0x80
	.byte	0x6
	.byte	0x24
	.byte	0x9
	.long	0x3ac
	.uleb128 0x9
	.long	.LASF49
	.byte	0x6
	.byte	0x26
	.byte	0x9
	.long	0x63
	.byte	0
	.uleb128 0x9
	.long	.LASF50
	.byte	0x6
	.byte	0x28
	.byte	0x9
	.long	0x63
	.byte	0x4
	.uleb128 0x9
	.long	.LASF51
	.byte	0x6
	.byte	0x2a
	.byte	0x9
	.long	0x63
	.byte	0x8
	.uleb128 0x9
	.long	.LASF52
	.byte	0x6
	.byte	0x30
	.byte	0x9
	.long	0x63
	.byte	0xc
	.uleb128 0x9
	.long	.LASF53
	.byte	0x6
	.byte	0x7b
	.byte	0x9
	.long	0x2e7
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.long	.LASF54
	.byte	0x6
	.byte	0x7c
	.byte	0x5
	.long	0x361
	.uleb128 0x3
	.long	.LASF55
	.byte	0x7
	.byte	0x48
	.byte	0x10
	.long	0x3c4
	.uleb128 0x6
	.byte	0x8
	.long	0x3ca
	.uleb128 0x10
	.long	0x3d5
	.uleb128 0x11
	.long	0x63
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.byte	0x8
	.byte	0x1f
	.byte	0x5
	.long	0x3f7
	.uleb128 0xd
	.long	.LASF56
	.byte	0x8
	.byte	0x22
	.byte	0x11
	.long	0x3b8
	.uleb128 0xd
	.long	.LASF57
	.byte	0x8
	.byte	0x24
	.byte	0x9
	.long	0x412
	.byte	0
	.uleb128 0x10
	.long	0x40c
	.uleb128 0x11
	.long	0x63
	.uleb128 0x11
	.long	0x40c
	.uleb128 0x11
	.long	0xc5
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3ac
	.uleb128 0x6
	.byte	0x8
	.long	0x3f7
	.uleb128 0x12
	.long	.LASF72
	.byte	0x98
	.byte	0x8
	.byte	0x1b
	.byte	0x8
	.long	0x45a
	.uleb128 0x9
	.long	.LASF58
	.byte	0x8
	.byte	0x26
	.byte	0x5
	.long	0x3d5
	.byte	0
	.uleb128 0x9
	.long	.LASF59
	.byte	0x8
	.byte	0x2e
	.byte	0x10
	.long	0x100
	.byte	0x8
	.uleb128 0x9
	.long	.LASF60
	.byte	0x8
	.byte	0x31
	.byte	0x9
	.long	0x63
	.byte	0x88
	.uleb128 0x9
	.long	.LASF61
	.byte	0x8
	.byte	0x34
	.byte	0xc
	.long	0x45b
	.byte	0x90
	.byte	0
	.uleb128 0x13
	.uleb128 0x6
	.byte	0x8
	.long	0x45a
	.uleb128 0xa
	.long	0x47c
	.long	0x471
	.uleb128 0xb
	.long	0x42
	.byte	0x40
	.byte	0
	.uleb128 0x7
	.long	0x461
	.uleb128 0x6
	.byte	0x8
	.long	0xd4
	.uleb128 0x7
	.long	0x476
	.uleb128 0x14
	.long	.LASF62
	.byte	0x7
	.value	0x11e
	.byte	0x1a
	.long	0x471
	.uleb128 0x14
	.long	.LASF63
	.byte	0x7
	.value	0x11f
	.byte	0x1a
	.long	0x471
	.uleb128 0xa
	.long	0x34
	.long	0x4ab
	.uleb128 0xb
	.long	0x42
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.long	0x34
	.long	0x4bb
	.uleb128 0xb
	.long	0x42
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.long	0x6a
	.long	0x4cb
	.uleb128 0xb
	.long	0x42
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.long	0x6a
	.long	0x4db
	.uleb128 0xb
	.long	0x42
	.byte	0x17
	.byte	0
	.uleb128 0x3
	.long	.LASF64
	.byte	0x9
	.byte	0xd1
	.byte	0x17
	.long	0x42
	.uleb128 0x8
	.byte	0x18
	.byte	0xa
	.byte	0x1a
	.byte	0x9
	.long	0x518
	.uleb128 0x9
	.long	.LASF65
	.byte	0xa
	.byte	0x1c
	.byte	0xb
	.long	0xc5
	.byte	0
	.uleb128 0x9
	.long	.LASF66
	.byte	0xa
	.byte	0x1d
	.byte	0x9
	.long	0x63
	.byte	0x8
	.uleb128 0x9
	.long	.LASF67
	.byte	0xa
	.byte	0x1e
	.byte	0xc
	.long	0x4db
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.long	.LASF68
	.byte	0xa
	.byte	0x1f
	.byte	0x5
	.long	0x4e7
	.uleb128 0x3
	.long	.LASF69
	.byte	0xb
	.byte	0x25
	.byte	0x25
	.long	0x530
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF70
	.uleb128 0x3
	.long	.LASF71
	.byte	0xb
	.byte	0x2e
	.byte	0x10
	.long	0x543
	.uleb128 0xa
	.long	0x524
	.long	0x553
	.uleb128 0xb
	.long	0x42
	.byte	0x16
	.byte	0
	.uleb128 0x12
	.long	.LASF73
	.byte	0x10
	.byte	0xb
	.byte	0x65
	.byte	0x8
	.long	0x588
	.uleb128 0x9
	.long	.LASF74
	.byte	0xb
	.byte	0x67
	.byte	0x16
	.long	0x49b
	.byte	0
	.uleb128 0x9
	.long	.LASF75
	.byte	0xb
	.byte	0x68
	.byte	0x16
	.long	0x34
	.byte	0x8
	.uleb128 0x9
	.long	.LASF76
	.byte	0xb
	.byte	0x69
	.byte	0x16
	.long	0x4ab
	.byte	0xa
	.byte	0
	.uleb128 0x12
	.long	.LASF77
	.byte	0x10
	.byte	0xb
	.byte	0x6c
	.byte	0x8
	.long	0x5a3
	.uleb128 0x9
	.long	.LASF78
	.byte	0xb
	.byte	0x6e
	.byte	0xe
	.long	0x4bb
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	.LASF79
	.value	0x200
	.byte	0xb
	.byte	0x71
	.byte	0x8
	.long	0x642
	.uleb128 0x16
	.string	"cwd"
	.byte	0xb
	.byte	0x74
	.byte	0xf
	.long	0x57
	.byte	0
	.uleb128 0x16
	.string	"swd"
	.byte	0xb
	.byte	0x75
	.byte	0xf
	.long	0x57
	.byte	0x2
	.uleb128 0x16
	.string	"ftw"
	.byte	0xb
	.byte	0x76
	.byte	0xf
	.long	0x57
	.byte	0x4
	.uleb128 0x16
	.string	"fop"
	.byte	0xb
	.byte	0x77
	.byte	0xf
	.long	0x57
	.byte	0x6
	.uleb128 0x16
	.string	"rip"
	.byte	0xb
	.byte	0x78
	.byte	0xf
	.long	0x7d
	.byte	0x8
	.uleb128 0x16
	.string	"rdp"
	.byte	0xb
	.byte	0x79
	.byte	0xf
	.long	0x7d
	.byte	0x10
	.uleb128 0x9
	.long	.LASF80
	.byte	0xb
	.byte	0x7a
	.byte	0xf
	.long	0x6a
	.byte	0x18
	.uleb128 0x9
	.long	.LASF81
	.byte	0xb
	.byte	0x7b
	.byte	0xf
	.long	0x6a
	.byte	0x1c
	.uleb128 0x16
	.string	"_st"
	.byte	0xb
	.byte	0x7c
	.byte	0x17
	.long	0x642
	.byte	0x20
	.uleb128 0x9
	.long	.LASF82
	.byte	0xb
	.byte	0x7d
	.byte	0x17
	.long	0x652
	.byte	0xa0
	.uleb128 0x17
	.long	.LASF76
	.byte	0xb
	.byte	0x7e
	.byte	0xf
	.long	0x4cb
	.value	0x1a0
	.byte	0
	.uleb128 0xa
	.long	0x553
	.long	0x652
	.uleb128 0xb
	.long	0x42
	.byte	0x7
	.byte	0
	.uleb128 0xa
	.long	0x588
	.long	0x662
	.uleb128 0xb
	.long	0x42
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.long	.LASF83
	.byte	0xb
	.byte	0x82
	.byte	0x1f
	.long	0x66e
	.uleb128 0x6
	.byte	0x8
	.long	0x5a3
	.uleb128 0x18
	.value	0x100
	.byte	0xb
	.byte	0x85
	.byte	0x9
	.long	0x6a6
	.uleb128 0x9
	.long	.LASF84
	.byte	0xb
	.byte	0x87
	.byte	0xf
	.long	0x537
	.byte	0
	.uleb128 0x9
	.long	.LASF85
	.byte	0xb
	.byte	0x89
	.byte	0x10
	.long	0x662
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF86
	.byte	0xb
	.byte	0x8a
	.byte	0x26
	.long	0x6a6
	.byte	0xc0
	.byte	0
	.uleb128 0xa
	.long	0x6b6
	.long	0x6b6
	.uleb128 0xb
	.long	0x42
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF87
	.uleb128 0x3
	.long	.LASF88
	.byte	0xb
	.byte	0x8b
	.byte	0x3
	.long	0x674
	.uleb128 0x15
	.long	.LASF89
	.value	0x3c8
	.byte	0xb
	.byte	0x8e
	.byte	0x10
	.long	0x736
	.uleb128 0x9
	.long	.LASF90
	.byte	0xb
	.byte	0x90
	.byte	0x17
	.long	0x42
	.byte	0
	.uleb128 0x9
	.long	.LASF91
	.byte	0xb
	.byte	0x91
	.byte	0x18
	.long	0x736
	.byte	0x8
	.uleb128 0x9
	.long	.LASF92
	.byte	0xb
	.byte	0x92
	.byte	0xd
	.long	0x518
	.byte	0x10
	.uleb128 0x9
	.long	.LASF93
	.byte	0xb
	.byte	0x93
	.byte	0x10
	.long	0x6bd
	.byte	0x28
	.uleb128 0x17
	.long	.LASF94
	.byte	0xb
	.byte	0x94
	.byte	0xe
	.long	0x10c
	.value	0x128
	.uleb128 0x17
	.long	.LASF95
	.byte	0xb
	.byte	0x95
	.byte	0x1a
	.long	0x5a3
	.value	0x1a8
	.uleb128 0x17
	.long	.LASF96
	.byte	0xb
	.byte	0x96
	.byte	0x2a
	.long	0x73c
	.value	0x3a8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x6c9
	.uleb128 0xa
	.long	0x6b6
	.long	0x74c
	.uleb128 0xb
	.long	0x42
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.long	.LASF89
	.byte	0xb
	.byte	0x97
	.byte	0x5
	.long	0x6c9
	.uleb128 0x3
	.long	.LASF97
	.byte	0xc
	.byte	0x57
	.byte	0x13
	.long	0x76
	.uleb128 0x12
	.long	.LASF98
	.byte	0xd8
	.byte	0xd
	.byte	0x31
	.byte	0x8
	.long	0x8eb
	.uleb128 0x9
	.long	.LASF99
	.byte	0xd
	.byte	0x33
	.byte	0x7
	.long	0x63
	.byte	0
	.uleb128 0x9
	.long	.LASF100
	.byte	0xd
	.byte	0x36
	.byte	0x9
	.long	0xc7
	.byte	0x8
	.uleb128 0x9
	.long	.LASF101
	.byte	0xd
	.byte	0x37
	.byte	0x9
	.long	0xc7
	.byte	0x10
	.uleb128 0x9
	.long	.LASF102
	.byte	0xd
	.byte	0x38
	.byte	0x9
	.long	0xc7
	.byte	0x18
	.uleb128 0x9
	.long	.LASF103
	.byte	0xd
	.byte	0x39
	.byte	0x9
	.long	0xc7
	.byte	0x20
	.uleb128 0x9
	.long	.LASF104
	.byte	0xd
	.byte	0x3a
	.byte	0x9
	.long	0xc7
	.byte	0x28
	.uleb128 0x9
	.long	.LASF105
	.byte	0xd
	.byte	0x3b
	.byte	0x9
	.long	0xc7
	.byte	0x30
	.uleb128 0x9
	.long	.LASF106
	.byte	0xd
	.byte	0x3c
	.byte	0x9
	.long	0xc7
	.byte	0x38
	.uleb128 0x9
	.long	.LASF107
	.byte	0xd
	.byte	0x3d
	.byte	0x9
	.long	0xc7
	.byte	0x40
	.uleb128 0x9
	.long	.LASF108
	.byte	0xd
	.byte	0x40
	.byte	0x9
	.long	0xc7
	.byte	0x48
	.uleb128 0x9
	.long	.LASF109
	.byte	0xd
	.byte	0x41
	.byte	0x9
	.long	0xc7
	.byte	0x50
	.uleb128 0x9
	.long	.LASF110
	.byte	0xd
	.byte	0x42
	.byte	0x9
	.long	0xc7
	.byte	0x58
	.uleb128 0x9
	.long	.LASF111
	.byte	0xd
	.byte	0x44
	.byte	0x16
	.long	0x904
	.byte	0x60
	.uleb128 0x9
	.long	.LASF112
	.byte	0xd
	.byte	0x46
	.byte	0x14
	.long	0x90a
	.byte	0x68
	.uleb128 0x9
	.long	.LASF113
	.byte	0xd
	.byte	0x48
	.byte	0x7
	.long	0x63
	.byte	0x70
	.uleb128 0x9
	.long	.LASF114
	.byte	0xd
	.byte	0x49
	.byte	0x7
	.long	0x63
	.byte	0x74
	.uleb128 0x9
	.long	.LASF115
	.byte	0xd
	.byte	0x4a
	.byte	0xb
	.long	0x95
	.byte	0x78
	.uleb128 0x9
	.long	.LASF116
	.byte	0xd
	.byte	0x4d
	.byte	0x12
	.long	0x34
	.byte	0x80
	.uleb128 0x9
	.long	.LASF117
	.byte	0xd
	.byte	0x4e
	.byte	0xf
	.long	0x49
	.byte	0x82
	.uleb128 0x9
	.long	.LASF118
	.byte	0xd
	.byte	0x4f
	.byte	0x8
	.long	0x910
	.byte	0x83
	.uleb128 0x9
	.long	.LASF119
	.byte	0xd
	.byte	0x51
	.byte	0xf
	.long	0x920
	.byte	0x88
	.uleb128 0x9
	.long	.LASF120
	.byte	0xd
	.byte	0x59
	.byte	0xd
	.long	0xa1
	.byte	0x90
	.uleb128 0x9
	.long	.LASF121
	.byte	0xd
	.byte	0x5b
	.byte	0x17
	.long	0x92b
	.byte	0x98
	.uleb128 0x9
	.long	.LASF122
	.byte	0xd
	.byte	0x5c
	.byte	0x19
	.long	0x936
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF123
	.byte	0xd
	.byte	0x5d
	.byte	0x14
	.long	0x90a
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF124
	.byte	0xd
	.byte	0x5e
	.byte	0x9
	.long	0xc5
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF125
	.byte	0xd
	.byte	0x5f
	.byte	0xa
	.long	0x4db
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF126
	.byte	0xd
	.byte	0x60
	.byte	0x7
	.long	0x63
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF127
	.byte	0xd
	.byte	0x62
	.byte	0x8
	.long	0x93c
	.byte	0xc4
	.byte	0
	.uleb128 0x3
	.long	.LASF128
	.byte	0xe
	.byte	0x7
	.byte	0x19
	.long	0x764
	.uleb128 0x19
	.long	.LASF146
	.byte	0xd
	.byte	0x2b
	.byte	0xe
	.uleb128 0x1a
	.long	.LASF129
	.uleb128 0x6
	.byte	0x8
	.long	0x8ff
	.uleb128 0x6
	.byte	0x8
	.long	0x764
	.uleb128 0xa
	.long	0xcd
	.long	0x920
	.uleb128 0xb
	.long	0x42
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x8f7
	.uleb128 0x1a
	.long	.LASF130
	.uleb128 0x6
	.byte	0x8
	.long	0x926
	.uleb128 0x1a
	.long	.LASF131
	.uleb128 0x6
	.byte	0x8
	.long	0x931
	.uleb128 0xa
	.long	0xcd
	.long	0x94c
	.uleb128 0xb
	.long	0x42
	.byte	0x13
	.byte	0
	.uleb128 0x1b
	.long	.LASF132
	.byte	0xf
	.byte	0x89
	.byte	0xe
	.long	0x958
	.uleb128 0x6
	.byte	0x8
	.long	0x8eb
	.uleb128 0x1b
	.long	.LASF133
	.byte	0xf
	.byte	0x8a
	.byte	0xe
	.long	0x958
	.uleb128 0x1b
	.long	.LASF134
	.byte	0xf
	.byte	0x8b
	.byte	0xe
	.long	0x958
	.uleb128 0x1b
	.long	.LASF135
	.byte	0x10
	.byte	0x1a
	.byte	0xc
	.long	0x63
	.uleb128 0xa
	.long	0x47c
	.long	0x98d
	.uleb128 0x1c
	.byte	0
	.uleb128 0x7
	.long	0x982
	.uleb128 0x1b
	.long	.LASF136
	.byte	0x10
	.byte	0x1b
	.byte	0x1a
	.long	0x98d
	.uleb128 0x1d
	.long	.LASF137
	.byte	0x1
	.byte	0xd
	.byte	0x7
	.long	0xc5
	.uleb128 0x9
	.byte	0x3
	.quad	next_pc
	.uleb128 0x1e
	.long	.LASF138
	.byte	0x1
	.byte	0x2f
	.byte	0x5
	.long	0x63
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x9e7
	.uleb128 0x1f
	.string	"act"
	.byte	0x1
	.byte	0x30
	.byte	0x14
	.long	0x418
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.byte	0
	.uleb128 0x20
	.long	.LASF139
	.byte	0x1
	.byte	0x28
	.byte	0x6
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0xa40
	.uleb128 0x21
	.string	"sig"
	.byte	0x1
	.byte	0x28
	.byte	0x15
	.long	0x63
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x21
	.string	"si"
	.byte	0x1
	.byte	0x28
	.byte	0x25
	.long	0x40c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x22
	.long	.LASF140
	.byte	0x1
	.byte	0x28
	.byte	0x2f
	.long	0xc5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.string	"uc"
	.byte	0x1
	.byte	0x29
	.byte	0x16
	.long	0xa46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x74c
	.uleb128 0x7
	.long	0xa40
	.uleb128 0x23
	.long	.LASF141
	.byte	0x1
	.byte	0x22
	.byte	0x6
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0xa79
	.uleb128 0x21
	.string	"sig"
	.byte	0x1
	.byte	0x22
	.byte	0x18
	.long	0x63
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x24
	.long	.LASF147
	.byte	0x1
	.byte	0xf
	.byte	0x6
	.long	0x76
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.string	"res"
	.byte	0x1
	.byte	0x10
	.byte	0x8
	.long	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF57:
	.string	"sa_sigaction"
.LASF140:
	.string	"ucontext"
.LASF118:
	.string	"_shortbuf"
.LASF146:
	.string	"_IO_lock_t"
.LASF40:
	.string	"_syscall"
.LASF75:
	.string	"exponent"
.LASF134:
	.string	"stderr"
.LASF107:
	.string	"_IO_buf_end"
.LASF32:
	.string	"_addr_bnd"
.LASF105:
	.string	"_IO_write_end"
.LASF2:
	.string	"unsigned int"
.LASF54:
	.string	"siginfo_t"
.LASF123:
	.string	"_freeres_list"
.LASF27:
	.string	"si_status"
.LASF99:
	.string	"_flags"
.LASF114:
	.string	"_flags2"
.LASF44:
	.string	"_timer"
.LASF80:
	.string	"mxcsr"
.LASF62:
	.string	"_sys_siglist"
.LASF35:
	.string	"si_addr_lsb"
.LASF147:
	.string	"func"
.LASF137:
	.string	"next_pc"
.LASF83:
	.string	"fpregset_t"
.LASF95:
	.string	"__fpregs_mem"
.LASF71:
	.string	"gregset_t"
.LASF139:
	.string	"sig_action"
.LASF59:
	.string	"sa_mask"
.LASF77:
	.string	"_libc_xmmreg"
.LASF16:
	.string	"__sigset_t"
.LASF94:
	.string	"uc_sigmask"
.LASF133:
	.string	"stdout"
.LASF110:
	.string	"_IO_save_end"
.LASF130:
	.string	"_IO_codecvt"
.LASF145:
	.string	"sigval"
.LASF39:
	.string	"_call_addr"
.LASF82:
	.string	"_xmm"
.LASF67:
	.string	"ss_size"
.LASF87:
	.string	"long long unsigned int"
.LASF42:
	.string	"_pad"
.LASF28:
	.string	"si_utime"
.LASF6:
	.string	"__uint16_t"
.LASF55:
	.string	"__sighandler_t"
.LASF136:
	.string	"sys_errlist"
.LASF109:
	.string	"_IO_backup_base"
.LASF78:
	.string	"element"
.LASF120:
	.string	"_offset"
.LASF135:
	.string	"sys_nerr"
.LASF45:
	.string	"_sigchld"
.LASF64:
	.string	"size_t"
.LASF30:
	.string	"_lower"
.LASF111:
	.string	"_markers"
.LASF24:
	.string	"si_tid"
.LASF50:
	.string	"si_errno"
.LASF102:
	.string	"_IO_read_base"
.LASF132:
	.string	"stdin"
.LASF9:
	.string	"__uint64_t"
.LASF34:
	.string	"si_addr"
.LASF37:
	.string	"si_band"
.LASF15:
	.string	"char"
.LASF43:
	.string	"_kill"
.LASF126:
	.string	"_mode"
.LASF129:
	.string	"_IO_marker"
.LASF100:
	.string	"_IO_read_ptr"
.LASF56:
	.string	"sa_handler"
.LASF65:
	.string	"ss_sp"
.LASF63:
	.string	"sys_siglist"
.LASF76:
	.string	"__glibc_reserved1"
.LASF103:
	.string	"_IO_write_base"
.LASF68:
	.string	"stack_t"
.LASF13:
	.string	"__pid_t"
.LASF70:
	.string	"long long int"
.LASF53:
	.string	"_sifields"
.LASF69:
	.string	"greg_t"
.LASF124:
	.string	"_freeres_buf"
.LASF48:
	.string	"_sigsys"
.LASF52:
	.string	"__pad0"
.LASF47:
	.string	"_sigpoll"
.LASF125:
	.string	"__pad5"
.LASF14:
	.string	"__clock_t"
.LASF89:
	.string	"ucontext_t"
.LASF117:
	.string	"_vtable_offset"
.LASF86:
	.string	"__reserved1"
.LASF41:
	.string	"_arch"
.LASF97:
	.string	"intptr_t"
.LASF73:
	.string	"_libc_fpxreg"
.LASF144:
	.string	"/home/jatinbha/code/c/APX-Enabling/EXPs"
.LASF33:
	.string	"_pkey"
.LASF108:
	.string	"_IO_save_base"
.LASF101:
	.string	"_IO_read_end"
.LASF17:
	.string	"sigset_t"
.LASF20:
	.string	"__sigval_t"
.LASF5:
	.string	"short int"
.LASF8:
	.string	"long int"
.LASF85:
	.string	"fpregs"
.LASF131:
	.string	"_IO_wide_data"
.LASF23:
	.string	"si_uid"
.LASF10:
	.string	"__uid_t"
.LASF22:
	.string	"si_pid"
.LASF84:
	.string	"gregs"
.LASF72:
	.string	"sigaction"
.LASF142:
	.string	"GNU C17 9.3.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF141:
	.string	"signal_handle"
.LASF122:
	.string	"_wide_data"
.LASF119:
	.string	"_lock"
.LASF88:
	.string	"mcontext_t"
.LASF3:
	.string	"long unsigned int"
.LASF115:
	.string	"_old_offset"
.LASF98:
	.string	"_IO_FILE"
.LASF90:
	.string	"uc_flags"
.LASF18:
	.string	"sival_int"
.LASF92:
	.string	"uc_stack"
.LASF143:
	.string	"signal_exp.c"
.LASF38:
	.string	"si_fd"
.LASF0:
	.string	"unsigned char"
.LASF7:
	.string	"__uint32_t"
.LASF104:
	.string	"_IO_write_ptr"
.LASF79:
	.string	"_libc_fpstate"
.LASF26:
	.string	"si_sigval"
.LASF91:
	.string	"uc_link"
.LASF36:
	.string	"_bounds"
.LASF51:
	.string	"si_code"
.LASF121:
	.string	"_codecvt"
.LASF93:
	.string	"uc_mcontext"
.LASF113:
	.string	"_fileno"
.LASF49:
	.string	"si_signo"
.LASF11:
	.string	"__off_t"
.LASF4:
	.string	"signed char"
.LASF1:
	.string	"short unsigned int"
.LASF60:
	.string	"sa_flags"
.LASF96:
	.string	"__ssp"
.LASF138:
	.string	"main"
.LASF21:
	.string	"__val"
.LASF74:
	.string	"significand"
.LASF112:
	.string	"_chain"
.LASF128:
	.string	"FILE"
.LASF29:
	.string	"si_stime"
.LASF81:
	.string	"mxcr_mask"
.LASF66:
	.string	"ss_flags"
.LASF19:
	.string	"sival_ptr"
.LASF58:
	.string	"__sigaction_handler"
.LASF46:
	.string	"_sigfault"
.LASF116:
	.string	"_cur_column"
.LASF31:
	.string	"_upper"
.LASF12:
	.string	"__off64_t"
.LASF127:
	.string	"_unused2"
.LASF106:
	.string	"_IO_buf_base"
.LASF25:
	.string	"si_overrun"
.LASF61:
	.string	"sa_restorer"
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
