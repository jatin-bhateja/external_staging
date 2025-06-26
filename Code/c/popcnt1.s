	.text
	.file	"popcnt1.cxx"
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5               # -- Begin function _Z5microPiS_ii
.LCPI0_0:
	.zero	32,15
.LCPI0_1:
	.byte	0                       # 0x0
	.byte	1                       # 0x1
	.byte	1                       # 0x1
	.byte	2                       # 0x2
	.byte	1                       # 0x1
	.byte	2                       # 0x2
	.byte	2                       # 0x2
	.byte	3                       # 0x3
	.byte	1                       # 0x1
	.byte	2                       # 0x2
	.byte	2                       # 0x2
	.byte	3                       # 0x3
	.byte	2                       # 0x2
	.byte	3                       # 0x3
	.byte	3                       # 0x3
	.byte	4                       # 0x4
	.byte	0                       # 0x0
	.byte	1                       # 0x1
	.byte	1                       # 0x1
	.byte	2                       # 0x2
	.byte	1                       # 0x1
	.byte	2                       # 0x2
	.byte	2                       # 0x2
	.byte	3                       # 0x3
	.byte	1                       # 0x1
	.byte	2                       # 0x2
	.byte	2                       # 0x2
	.byte	3                       # 0x3
	.byte	2                       # 0x2
	.byte	3                       # 0x3
	.byte	3                       # 0x3
	.byte	4                       # 0x4
	.text
	.globl	_Z5microPiS_ii
	.p2align	4, 0x90
	.type	_Z5microPiS_ii,@function
_Z5microPiS_ii:                         # @_Z5microPiS_ii
	.cfi_startproc
# %bb.0:
	testl	%edx, %edx
	jle	.LBB0_16
# %bb.1:
	movl	%edx, %r8d
	cmpl	$31, %edx
	jbe	.LBB0_2
# %bb.7:
	leaq	(%rsi,%r8,4), %rax
	cmpq	%rdi, %rax
	jbe	.LBB0_9
# %bb.8:
	leaq	(%rdi,%r8,4), %rax
	cmpq	%rsi, %rax
	jbe	.LBB0_9
.LBB0_2:
	xorl	%r11d, %r11d
.LBB0_3:
	movq	%r11, %r9
	notq	%r9
	addq	%r8, %r9
	movq	%r8, %rax
	andq	$7, %rax
	je	.LBB0_5
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	xorl	%edx, %edx
	popcntl	(%rsi,%r11,4), %edx
	movl	%edx, (%rdi,%r11,4)
	incq	%r11
	decq	%rax
	jne	.LBB0_4
.LBB0_5:
	cmpq	$7, %r9
	jb	.LBB0_16
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	popcntl	(%rsi,%r11,4), %eax
	movl	%eax, (%rdi,%r11,4)
	xorl	%eax, %eax
	popcntl	4(%rsi,%r11,4), %eax
	movl	%eax, 4(%rdi,%r11,4)
	xorl	%eax, %eax
	popcntl	8(%rsi,%r11,4), %eax
	movl	%eax, 8(%rdi,%r11,4)
	xorl	%eax, %eax
	popcntl	12(%rsi,%r11,4), %eax
	movl	%eax, 12(%rdi,%r11,4)
	xorl	%eax, %eax
	popcntl	16(%rsi,%r11,4), %eax
	movl	%eax, 16(%rdi,%r11,4)
	xorl	%eax, %eax
	popcntl	20(%rsi,%r11,4), %eax
	movl	%eax, 20(%rdi,%r11,4)
	xorl	%eax, %eax
	popcntl	24(%rsi,%r11,4), %eax
	movl	%eax, 24(%rdi,%r11,4)
	xorl	%eax, %eax
	popcntl	28(%rsi,%r11,4), %eax
	movl	%eax, 28(%rdi,%r11,4)
	addq	$8, %r11
	cmpq	%r11, %r8
	jne	.LBB0_6
	jmp	.LBB0_16
.LBB0_9:
	movl	%r8d, %r11d
	andl	$-32, %r11d
	leaq	-32(%r11), %rdx
	movq	%rdx, %rax
	shrq	$5, %rax
	incq	%rax
	movl	%eax, %r9d
	andl	$1, %r9d
	testq	%rdx, %rdx
	je	.LBB0_10
# %bb.11:
	movq	%r9, %r10
	subq	%rax, %r10
	xorl	%eax, %eax
	vmovdqa	.LCPI0_0(%rip), %ymm0   # ymm0 = [15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15]
	vmovdqa	.LCPI0_1(%rip), %ymm1   # ymm1 = [0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4]
	vpxor	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	vmovdqu	(%rsi,%rax,4), %ymm4
	vmovdqu	32(%rsi,%rax,4), %ymm5
	vmovdqu	64(%rsi,%rax,4), %ymm6
	vmovdqu	96(%rsi,%rax,4), %ymm3
	vpand	%ymm0, %ymm4, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm4, %ymm4
	vpand	%ymm0, %ymm4, %ymm4
	vpshufb	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm7, %ymm4, %ymm4
	vpunpckhdq	%ymm2, %ymm4, %ymm7 # ymm7 = ymm4[2],ymm2[2],ymm4[3],ymm2[3],ymm4[6],ymm2[6],ymm4[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm4, %ymm4 # ymm4 = ymm4[0],ymm2[0],ymm4[1],ymm2[1],ymm4[4],ymm2[4],ymm4[5],ymm2[5]
	vpsadbw	%ymm2, %ymm4, %ymm4
	vpackuswb	%ymm7, %ymm4, %ymm4
	vpand	%ymm0, %ymm5, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm5, %ymm5
	vpand	%ymm0, %ymm5, %ymm5
	vpshufb	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm7, %ymm5, %ymm5
	vpunpckhdq	%ymm2, %ymm5, %ymm7 # ymm7 = ymm5[2],ymm2[2],ymm5[3],ymm2[3],ymm5[6],ymm2[6],ymm5[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm5, %ymm5 # ymm5 = ymm5[0],ymm2[0],ymm5[1],ymm2[1],ymm5[4],ymm2[4],ymm5[5],ymm2[5]
	vpsadbw	%ymm2, %ymm5, %ymm5
	vpackuswb	%ymm7, %ymm5, %ymm5
	vpand	%ymm0, %ymm6, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm6, %ymm6
	vpand	%ymm0, %ymm6, %ymm6
	vpshufb	%ymm6, %ymm1, %ymm6
	vpaddb	%ymm7, %ymm6, %ymm6
	vpunpckhdq	%ymm2, %ymm6, %ymm7 # ymm7 = ymm6[2],ymm2[2],ymm6[3],ymm2[3],ymm6[6],ymm2[6],ymm6[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm6, %ymm6 # ymm6 = ymm6[0],ymm2[0],ymm6[1],ymm2[1],ymm6[4],ymm2[4],ymm6[5],ymm2[5]
	vpsadbw	%ymm2, %ymm6, %ymm6
	vpackuswb	%ymm7, %ymm6, %ymm6
	vpand	%ymm0, %ymm3, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm3, %ymm3
	vpand	%ymm0, %ymm3, %ymm3
	vpshufb	%ymm3, %ymm1, %ymm3
	vpaddb	%ymm7, %ymm3, %ymm3
	vpunpckhdq	%ymm2, %ymm3, %ymm7 # ymm7 = ymm3[2],ymm2[2],ymm3[3],ymm2[3],ymm3[6],ymm2[6],ymm3[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm3, %ymm3 # ymm3 = ymm3[0],ymm2[0],ymm3[1],ymm2[1],ymm3[4],ymm2[4],ymm3[5],ymm2[5]
	vpsadbw	%ymm2, %ymm3, %ymm3
	vpackuswb	%ymm7, %ymm3, %ymm3
	vmovdqu	%ymm4, (%rdi,%rax,4)
	vmovdqu	%ymm5, 32(%rdi,%rax,4)
	vmovdqu	%ymm6, 64(%rdi,%rax,4)
	vmovdqu	%ymm3, 96(%rdi,%rax,4)
	vmovdqu	128(%rsi,%rax,4), %ymm4
	vmovdqu	160(%rsi,%rax,4), %ymm5
	vmovdqu	192(%rsi,%rax,4), %ymm6
	vmovdqu	224(%rsi,%rax,4), %ymm3
	vpand	%ymm0, %ymm4, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm4, %ymm4
	vpand	%ymm0, %ymm4, %ymm4
	vpshufb	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm7, %ymm4, %ymm4
	vpunpckhdq	%ymm2, %ymm4, %ymm7 # ymm7 = ymm4[2],ymm2[2],ymm4[3],ymm2[3],ymm4[6],ymm2[6],ymm4[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm4, %ymm4 # ymm4 = ymm4[0],ymm2[0],ymm4[1],ymm2[1],ymm4[4],ymm2[4],ymm4[5],ymm2[5]
	vpsadbw	%ymm2, %ymm4, %ymm4
	vpackuswb	%ymm7, %ymm4, %ymm4
	vpand	%ymm0, %ymm5, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm5, %ymm5
	vpand	%ymm0, %ymm5, %ymm5
	vpshufb	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm7, %ymm5, %ymm5
	vpunpckhdq	%ymm2, %ymm5, %ymm7 # ymm7 = ymm5[2],ymm2[2],ymm5[3],ymm2[3],ymm5[6],ymm2[6],ymm5[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm5, %ymm5 # ymm5 = ymm5[0],ymm2[0],ymm5[1],ymm2[1],ymm5[4],ymm2[4],ymm5[5],ymm2[5]
	vpsadbw	%ymm2, %ymm5, %ymm5
	vpackuswb	%ymm7, %ymm5, %ymm5
	vpand	%ymm0, %ymm6, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm6, %ymm6
	vpand	%ymm0, %ymm6, %ymm6
	vpshufb	%ymm6, %ymm1, %ymm6
	vpaddb	%ymm7, %ymm6, %ymm6
	vpunpckhdq	%ymm2, %ymm6, %ymm7 # ymm7 = ymm6[2],ymm2[2],ymm6[3],ymm2[3],ymm6[6],ymm2[6],ymm6[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm6, %ymm6 # ymm6 = ymm6[0],ymm2[0],ymm6[1],ymm2[1],ymm6[4],ymm2[4],ymm6[5],ymm2[5]
	vpsadbw	%ymm2, %ymm6, %ymm6
	vpackuswb	%ymm7, %ymm6, %ymm6
	vpand	%ymm0, %ymm3, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm3, %ymm3
	vpand	%ymm0, %ymm3, %ymm3
	vpshufb	%ymm3, %ymm1, %ymm3
	vpaddb	%ymm7, %ymm3, %ymm3
	vpunpckhdq	%ymm2, %ymm3, %ymm7 # ymm7 = ymm3[2],ymm2[2],ymm3[3],ymm2[3],ymm3[6],ymm2[6],ymm3[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm3, %ymm3 # ymm3 = ymm3[0],ymm2[0],ymm3[1],ymm2[1],ymm3[4],ymm2[4],ymm3[5],ymm2[5]
	vpsadbw	%ymm2, %ymm3, %ymm3
	vpackuswb	%ymm7, %ymm3, %ymm3
	vmovdqu	%ymm4, 128(%rdi,%rax,4)
	vmovdqu	%ymm5, 160(%rdi,%rax,4)
	vmovdqu	%ymm6, 192(%rdi,%rax,4)
	vmovdqu	%ymm3, 224(%rdi,%rax,4)
	addq	$64, %rax
	addq	$2, %r10
	jne	.LBB0_12
# %bb.13:
	testq	%r9, %r9
	je	.LBB0_15
.LBB0_14:
	vmovdqu	(%rsi,%rax,4), %ymm3
	vmovdqu	32(%rsi,%rax,4), %ymm5
	vmovdqu	64(%rsi,%rax,4), %ymm6
	vmovdqu	96(%rsi,%rax,4), %ymm0
	vmovdqa	.LCPI0_0(%rip), %ymm1   # ymm1 = [15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15]
	vpand	%ymm1, %ymm3, %ymm4
	vmovdqa	.LCPI0_1(%rip), %ymm2   # ymm2 = [0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4]
	vpshufb	%ymm4, %ymm2, %ymm4
	vpsrlw	$4, %ymm3, %ymm3
	vpand	%ymm1, %ymm3, %ymm3
	vpshufb	%ymm3, %ymm2, %ymm3
	vpaddb	%ymm4, %ymm3, %ymm4
	vpxor	%xmm3, %xmm3, %xmm3
	vpunpckhdq	%ymm3, %ymm4, %ymm7 # ymm7 = ymm4[2],ymm3[2],ymm4[3],ymm3[3],ymm4[6],ymm3[6],ymm4[7],ymm3[7]
	vpsadbw	%ymm3, %ymm7, %ymm7
	vpunpckldq	%ymm3, %ymm4, %ymm4 # ymm4 = ymm4[0],ymm3[0],ymm4[1],ymm3[1],ymm4[4],ymm3[4],ymm4[5],ymm3[5]
	vpsadbw	%ymm3, %ymm4, %ymm4
	vpackuswb	%ymm7, %ymm4, %ymm4
	vpand	%ymm1, %ymm5, %ymm7
	vpshufb	%ymm7, %ymm2, %ymm7
	vpsrlw	$4, %ymm5, %ymm5
	vpand	%ymm1, %ymm5, %ymm5
	vpshufb	%ymm5, %ymm2, %ymm5
	vpaddb	%ymm7, %ymm5, %ymm5
	vpunpckhdq	%ymm3, %ymm5, %ymm7 # ymm7 = ymm5[2],ymm3[2],ymm5[3],ymm3[3],ymm5[6],ymm3[6],ymm5[7],ymm3[7]
	vpsadbw	%ymm3, %ymm7, %ymm7
	vpunpckldq	%ymm3, %ymm5, %ymm5 # ymm5 = ymm5[0],ymm3[0],ymm5[1],ymm3[1],ymm5[4],ymm3[4],ymm5[5],ymm3[5]
	vpsadbw	%ymm3, %ymm5, %ymm5
	vpackuswb	%ymm7, %ymm5, %ymm5
	vpand	%ymm1, %ymm6, %ymm7
	vpshufb	%ymm7, %ymm2, %ymm7
	vpsrlw	$4, %ymm6, %ymm6
	vpand	%ymm1, %ymm6, %ymm6
	vpshufb	%ymm6, %ymm2, %ymm6
	vpaddb	%ymm7, %ymm6, %ymm6
	vpunpckhdq	%ymm3, %ymm6, %ymm7 # ymm7 = ymm6[2],ymm3[2],ymm6[3],ymm3[3],ymm6[6],ymm3[6],ymm6[7],ymm3[7]
	vpsadbw	%ymm3, %ymm7, %ymm7
	vpunpckldq	%ymm3, %ymm6, %ymm6 # ymm6 = ymm6[0],ymm3[0],ymm6[1],ymm3[1],ymm6[4],ymm3[4],ymm6[5],ymm3[5]
	vpsadbw	%ymm3, %ymm6, %ymm6
	vpackuswb	%ymm7, %ymm6, %ymm6
	vpand	%ymm1, %ymm0, %ymm7
	vpshufb	%ymm7, %ymm2, %ymm7
	vpsrlw	$4, %ymm0, %ymm0
	vpand	%ymm1, %ymm0, %ymm0
	vpshufb	%ymm0, %ymm2, %ymm0
	vpaddb	%ymm7, %ymm0, %ymm0
	vpunpckhdq	%ymm3, %ymm0, %ymm1 # ymm1 = ymm0[2],ymm3[2],ymm0[3],ymm3[3],ymm0[6],ymm3[6],ymm0[7],ymm3[7]
	vpsadbw	%ymm3, %ymm1, %ymm1
	vpunpckldq	%ymm3, %ymm0, %ymm0 # ymm0 = ymm0[0],ymm3[0],ymm0[1],ymm3[1],ymm0[4],ymm3[4],ymm0[5],ymm3[5]
	vpsadbw	%ymm3, %ymm0, %ymm0
	vpackuswb	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm4, (%rdi,%rax,4)
	vmovdqu	%ymm5, 32(%rdi,%rax,4)
	vmovdqu	%ymm6, 64(%rdi,%rax,4)
	vmovdqu	%ymm0, 96(%rdi,%rax,4)
.LBB0_15:
	cmpq	%r8, %r11
	jne	.LBB0_3
.LBB0_16:
	movslq	%ecx, %rax
	movl	(%rdi,%rax,4), %eax
	vzeroupper
	retq
.LBB0_10:
	xorl	%eax, %eax
	testq	%r9, %r9
	jne	.LBB0_14
	jmp	.LBB0_15
.Lfunc_end0:
	.size	_Z5microPiS_ii, .Lfunc_end0-_Z5microPiS_ii
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5               # -- Begin function main
.LCPI1_0:
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	3                       # 0x3
	.long	4                       # 0x4
	.long	5                       # 0x5
	.long	6                       # 0x6
	.long	7                       # 0x7
.LCPI1_17:
	.zero	32,15
.LCPI1_18:
	.byte	0                       # 0x0
	.byte	1                       # 0x1
	.byte	1                       # 0x1
	.byte	2                       # 0x2
	.byte	1                       # 0x1
	.byte	2                       # 0x2
	.byte	2                       # 0x2
	.byte	3                       # 0x3
	.byte	1                       # 0x1
	.byte	2                       # 0x2
	.byte	2                       # 0x2
	.byte	3                       # 0x3
	.byte	2                       # 0x2
	.byte	3                       # 0x3
	.byte	3                       # 0x3
	.byte	4                       # 0x4
	.byte	0                       # 0x0
	.byte	1                       # 0x1
	.byte	1                       # 0x1
	.byte	2                       # 0x2
	.byte	1                       # 0x1
	.byte	2                       # 0x2
	.byte	2                       # 0x2
	.byte	3                       # 0x3
	.byte	1                       # 0x1
	.byte	2                       # 0x2
	.byte	2                       # 0x2
	.byte	3                       # 0x3
	.byte	2                       # 0x2
	.byte	3                       # 0x3
	.byte	3                       # 0x3
	.byte	4                       # 0x4
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI1_1:
	.long	8                       # 0x8
.LCPI1_2:
	.long	16                      # 0x10
.LCPI1_3:
	.long	24                      # 0x18
.LCPI1_4:
	.long	32                      # 0x20
.LCPI1_5:
	.long	40                      # 0x28
.LCPI1_6:
	.long	48                      # 0x30
.LCPI1_7:
	.long	56                      # 0x38
.LCPI1_8:
	.long	64                      # 0x40
.LCPI1_9:
	.long	72                      # 0x48
.LCPI1_10:
	.long	80                      # 0x50
.LCPI1_11:
	.long	88                      # 0x58
.LCPI1_12:
	.long	96                      # 0x60
.LCPI1_13:
	.long	104                     # 0x68
.LCPI1_14:
	.long	112                     # 0x70
.LCPI1_15:
	.long	120                     # 0x78
.LCPI1_16:
	.long	128                     # 0x80
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI1_19:
	.quad	4741671816366391296     # double 1.0E+9
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16448, %rsp            # imm = 0x4040
	.cfi_def_cfa_offset 16480
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	vmovdqa	.LCPI1_0(%rip), %ymm0   # ymm0 = [0,1,2,3,4,5,6,7]
	xorl	%eax, %eax
	vbroadcastss	.LCPI1_1(%rip), %ymm1 # ymm1 = [8,8,8,8,8,8,8,8]
	vmovups	%ymm1, 32(%rsp)         # 32-byte Spill
	vbroadcastss	.LCPI1_2(%rip), %ymm1 # ymm1 = [16,16,16,16,16,16,16,16]
	vmovups	%ymm1, (%rsp)           # 32-byte Spill
	vpbroadcastd	.LCPI1_3(%rip), %ymm3 # ymm3 = [24,24,24,24,24,24,24,24]
	vpbroadcastd	.LCPI1_4(%rip), %ymm4 # ymm4 = [32,32,32,32,32,32,32,32]
	vpbroadcastd	.LCPI1_5(%rip), %ymm5 # ymm5 = [40,40,40,40,40,40,40,40]
	vpbroadcastd	.LCPI1_6(%rip), %ymm6 # ymm6 = [48,48,48,48,48,48,48,48]
	vpbroadcastd	.LCPI1_7(%rip), %ymm7 # ymm7 = [56,56,56,56,56,56,56,56]
	vpbroadcastd	.LCPI1_8(%rip), %ymm8 # ymm8 = [64,64,64,64,64,64,64,64]
	vpbroadcastd	.LCPI1_9(%rip), %ymm9 # ymm9 = [72,72,72,72,72,72,72,72]
	vpbroadcastd	.LCPI1_10(%rip), %ymm10 # ymm10 = [80,80,80,80,80,80,80,80]
	vpbroadcastd	.LCPI1_11(%rip), %ymm11 # ymm11 = [88,88,88,88,88,88,88,88]
	vpbroadcastd	.LCPI1_12(%rip), %ymm12 # ymm12 = [96,96,96,96,96,96,96,96]
	vpbroadcastd	.LCPI1_13(%rip), %ymm13 # ymm13 = [104,104,104,104,104,104,104,104]
	vpbroadcastd	.LCPI1_14(%rip), %ymm14 # ymm14 = [112,112,112,112,112,112,112,112]
	vpbroadcastd	.LCPI1_15(%rip), %ymm15 # ymm15 = [120,120,120,120,120,120,120,120]
	vpbroadcastd	.LCPI1_16(%rip), %ymm1 # ymm1 = [128,128,128,128,128,128,128,128]
	.p2align	4, 0x90
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	vpaddd	32(%rsp), %ymm0, %ymm2  # 32-byte Folded Reload
	vmovdqu	%ymm0, 64(%rsp,%rax,4)
	vmovdqu	%ymm2, 96(%rsp,%rax,4)
	vpaddd	(%rsp), %ymm0, %ymm2    # 32-byte Folded Reload
	vmovdqu	%ymm2, 128(%rsp,%rax,4)
	vpaddd	%ymm3, %ymm0, %ymm2
	vmovdqu	%ymm2, 160(%rsp,%rax,4)
	vpaddd	%ymm4, %ymm0, %ymm2
	vmovdqu	%ymm2, 192(%rsp,%rax,4)
	vpaddd	%ymm5, %ymm0, %ymm2
	vmovdqu	%ymm2, 224(%rsp,%rax,4)
	vpaddd	%ymm6, %ymm0, %ymm2
	vmovdqu	%ymm2, 256(%rsp,%rax,4)
	vpaddd	%ymm7, %ymm0, %ymm2
	vmovdqu	%ymm2, 288(%rsp,%rax,4)
	vpaddd	%ymm0, %ymm8, %ymm2
	vmovdqu	%ymm2, 320(%rsp,%rax,4)
	vpaddd	%ymm0, %ymm9, %ymm2
	vmovdqu	%ymm2, 352(%rsp,%rax,4)
	vpaddd	%ymm0, %ymm10, %ymm2
	vmovdqu	%ymm2, 384(%rsp,%rax,4)
	vpaddd	%ymm0, %ymm11, %ymm2
	vmovdqu	%ymm2, 416(%rsp,%rax,4)
	vpaddd	%ymm0, %ymm12, %ymm2
	vmovdqu	%ymm2, 448(%rsp,%rax,4)
	vpaddd	%ymm0, %ymm13, %ymm2
	vmovdqu	%ymm2, 480(%rsp,%rax,4)
	vpaddd	%ymm0, %ymm14, %ymm2
	vmovdqu	%ymm2, 512(%rsp,%rax,4)
	vpaddd	%ymm0, %ymm15, %ymm2
	vmovdqu	%ymm2, 544(%rsp,%rax,4)
	subq	$-128, %rax
	vpaddd	%ymm1, %ymm0, %ymm0
	cmpq	$2048, %rax             # imm = 0x800
	jne	.LBB1_1
# %bb.2:
	xorl	%ebx, %ebx
	vzeroupper
	callq	_ZNSt6chrono3_V212steady_clock3nowEv
	movq	%rax, %r14
	vmovdqa	.LCPI1_17(%rip), %ymm0  # ymm0 = [15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15]
	vmovdqa	.LCPI1_18(%rip), %ymm1  # ymm1 = [0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4]
	vpxor	%xmm2, %xmm2, %xmm2
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB1_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_4 Depth 2
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_4:                                #   Parent Loop BB1_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqu	64(%rsp,%rax,4), %ymm4
	vmovdqu	96(%rsp,%rax,4), %ymm5
	vmovdqu	128(%rsp,%rax,4), %ymm6
	vmovdqu	160(%rsp,%rax,4), %ymm3
	vpand	%ymm0, %ymm4, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm4, %ymm4
	vpand	%ymm0, %ymm4, %ymm4
	vpshufb	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm7, %ymm4, %ymm4
	vpunpckhdq	%ymm2, %ymm4, %ymm7 # ymm7 = ymm4[2],ymm2[2],ymm4[3],ymm2[3],ymm4[6],ymm2[6],ymm4[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm4, %ymm4 # ymm4 = ymm4[0],ymm2[0],ymm4[1],ymm2[1],ymm4[4],ymm2[4],ymm4[5],ymm2[5]
	vpsadbw	%ymm2, %ymm4, %ymm4
	vpackuswb	%ymm7, %ymm4, %ymm4
	vpand	%ymm0, %ymm5, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm5, %ymm5
	vpand	%ymm0, %ymm5, %ymm5
	vpshufb	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm7, %ymm5, %ymm5
	vpunpckhdq	%ymm2, %ymm5, %ymm7 # ymm7 = ymm5[2],ymm2[2],ymm5[3],ymm2[3],ymm5[6],ymm2[6],ymm5[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm5, %ymm5 # ymm5 = ymm5[0],ymm2[0],ymm5[1],ymm2[1],ymm5[4],ymm2[4],ymm5[5],ymm2[5]
	vpsadbw	%ymm2, %ymm5, %ymm5
	vpackuswb	%ymm7, %ymm5, %ymm5
	vpand	%ymm0, %ymm6, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm6, %ymm6
	vpand	%ymm0, %ymm6, %ymm6
	vpshufb	%ymm6, %ymm1, %ymm6
	vpaddb	%ymm7, %ymm6, %ymm6
	vpunpckhdq	%ymm2, %ymm6, %ymm7 # ymm7 = ymm6[2],ymm2[2],ymm6[3],ymm2[3],ymm6[6],ymm2[6],ymm6[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm6, %ymm6 # ymm6 = ymm6[0],ymm2[0],ymm6[1],ymm2[1],ymm6[4],ymm2[4],ymm6[5],ymm2[5]
	vpsadbw	%ymm2, %ymm6, %ymm6
	vpackuswb	%ymm7, %ymm6, %ymm6
	vpand	%ymm0, %ymm3, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm3, %ymm3
	vpand	%ymm0, %ymm3, %ymm3
	vpshufb	%ymm3, %ymm1, %ymm3
	vpaddb	%ymm7, %ymm3, %ymm3
	vpunpckhdq	%ymm2, %ymm3, %ymm7 # ymm7 = ymm3[2],ymm2[2],ymm3[3],ymm2[3],ymm3[6],ymm2[6],ymm3[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm3, %ymm3 # ymm3 = ymm3[0],ymm2[0],ymm3[1],ymm2[1],ymm3[4],ymm2[4],ymm3[5],ymm2[5]
	vpsadbw	%ymm2, %ymm3, %ymm3
	vpackuswb	%ymm7, %ymm3, %ymm3
	vmovdqu	%ymm4, 8256(%rsp,%rax,4)
	vmovdqu	%ymm5, 8288(%rsp,%rax,4)
	vmovdqu	%ymm6, 8320(%rsp,%rax,4)
	vmovdqu	%ymm3, 8352(%rsp,%rax,4)
	vmovdqu	192(%rsp,%rax,4), %ymm4
	vmovdqu	224(%rsp,%rax,4), %ymm5
	vmovdqu	256(%rsp,%rax,4), %ymm6
	vmovdqu	288(%rsp,%rax,4), %ymm3
	vpand	%ymm0, %ymm4, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm4, %ymm4
	vpand	%ymm0, %ymm4, %ymm4
	vpshufb	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm7, %ymm4, %ymm4
	vpunpckhdq	%ymm2, %ymm4, %ymm7 # ymm7 = ymm4[2],ymm2[2],ymm4[3],ymm2[3],ymm4[6],ymm2[6],ymm4[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm4, %ymm4 # ymm4 = ymm4[0],ymm2[0],ymm4[1],ymm2[1],ymm4[4],ymm2[4],ymm4[5],ymm2[5]
	vpsadbw	%ymm2, %ymm4, %ymm4
	vpackuswb	%ymm7, %ymm4, %ymm4
	vpand	%ymm0, %ymm5, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm5, %ymm5
	vpand	%ymm0, %ymm5, %ymm5
	vpshufb	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm7, %ymm5, %ymm5
	vpunpckhdq	%ymm2, %ymm5, %ymm7 # ymm7 = ymm5[2],ymm2[2],ymm5[3],ymm2[3],ymm5[6],ymm2[6],ymm5[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm5, %ymm5 # ymm5 = ymm5[0],ymm2[0],ymm5[1],ymm2[1],ymm5[4],ymm2[4],ymm5[5],ymm2[5]
	vpsadbw	%ymm2, %ymm5, %ymm5
	vpackuswb	%ymm7, %ymm5, %ymm5
	vpand	%ymm0, %ymm6, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm6, %ymm6
	vpand	%ymm0, %ymm6, %ymm6
	vpshufb	%ymm6, %ymm1, %ymm6
	vpaddb	%ymm7, %ymm6, %ymm6
	vpunpckhdq	%ymm2, %ymm6, %ymm7 # ymm7 = ymm6[2],ymm2[2],ymm6[3],ymm2[3],ymm6[6],ymm2[6],ymm6[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm6, %ymm6 # ymm6 = ymm6[0],ymm2[0],ymm6[1],ymm2[1],ymm6[4],ymm2[4],ymm6[5],ymm2[5]
	vpsadbw	%ymm2, %ymm6, %ymm6
	vpackuswb	%ymm7, %ymm6, %ymm6
	vpand	%ymm0, %ymm3, %ymm7
	vpshufb	%ymm7, %ymm1, %ymm7
	vpsrlw	$4, %ymm3, %ymm3
	vpand	%ymm0, %ymm3, %ymm3
	vpshufb	%ymm3, %ymm1, %ymm3
	vpaddb	%ymm7, %ymm3, %ymm3
	vpunpckhdq	%ymm2, %ymm3, %ymm7 # ymm7 = ymm3[2],ymm2[2],ymm3[3],ymm2[3],ymm3[6],ymm2[6],ymm3[7],ymm2[7]
	vpsadbw	%ymm2, %ymm7, %ymm7
	vpunpckldq	%ymm2, %ymm3, %ymm3 # ymm3 = ymm3[0],ymm2[0],ymm3[1],ymm2[1],ymm3[4],ymm2[4],ymm3[5],ymm2[5]
	vpsadbw	%ymm2, %ymm3, %ymm3
	vpackuswb	%ymm7, %ymm3, %ymm3
	vmovdqu	%ymm4, 8384(%rsp,%rax,4)
	vmovdqu	%ymm5, 8416(%rsp,%rax,4)
	vmovdqu	%ymm6, 8448(%rsp,%rax,4)
	vmovdqu	%ymm3, 8480(%rsp,%rax,4)
	addq	$64, %rax
	cmpq	$2048, %rax             # imm = 0x800
	jne	.LBB1_4
# %bb.5:                                #   in Loop: Header=BB1_3 Depth=1
	movl	%ebx, %eax
	andl	$2047, %eax             # imm = 0x7FF
	addl	8256(%rsp,%rax,4), %ebp
	incl	%ebx
	cmpl	$1000000, %ebx          # imm = 0xF4240
	jne	.LBB1_3
# %bb.6:
	vzeroupper
	callq	_ZNSt6chrono3_V212steady_clock3nowEv
	subq	%r14, %rax
	vcvtsi2sd	%rax, %xmm8, %xmm0
	vdivsd	.LCPI1_19(%rip), %xmm0, %xmm0
	movl	$.L.str, %edi
	movl	%ebp, %esi
	movb	$1, %al
	callq	printf
	movl	$10, %edi
	callq	putchar
	movl	8256(%rsp), %edx
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movl	8260(%rsp), %edx
	movl	$.L.str.2, %edi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	printf
	movl	8264(%rsp), %edx
	movl	$.L.str.2, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	callq	printf
	movl	8268(%rsp), %edx
	movl	$.L.str.2, %edi
	movl	$3, %esi
	xorl	%eax, %eax
	callq	printf
	movl	8272(%rsp), %edx
	movl	$.L.str.2, %edi
	movl	$4, %esi
	xorl	%eax, %eax
	callq	printf
	movl	8276(%rsp), %edx
	movl	$.L.str.2, %edi
	movl	$5, %esi
	xorl	%eax, %eax
	callq	printf
	movl	8280(%rsp), %edx
	movl	$.L.str.2, %edi
	movl	$6, %esi
	xorl	%eax, %eax
	callq	printf
	movl	8284(%rsp), %edx
	movl	$.L.str.2, %edi
	movl	$7, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.3, %edi
	movl	%ebp, %esi
	xorl	%eax, %eax
	addq	$16448, %rsp            # imm = 0x4040
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	printf                  # TAILCALL
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	popc_table,@object      # @popc_table
	.data
	.globl	popc_table
	.p2align	4
popc_table:
	.ascii	"\000\001\001\002\001\002\002\003\001\002\002\003\002\003\003\004\000\001\001\002\001\002\002\003\001\002\002\003\002\003\003\004"
	.size	popc_table, 32

	.type	lower_4bits,@object     # @lower_4bits
	.globl	lower_4bits
	.p2align	4
lower_4bits:
	.zero	32,15
	.size	lower_4bits, 32

	.type	perm_vector,@object     # @perm_vector
	.globl	perm_vector
	.p2align	4
perm_vector:
	.long	0                       # 0x0
	.long	2                       # 0x2
	.long	4                       # 0x4
	.long	6                       # 0x6
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	0                       # 0x0
	.size	perm_vector, 32

	.type	perm_vec1,@object       # @perm_vec1
	.globl	perm_vec1
	.p2align	4
perm_vec1:
	.long	0                       # 0x0
	.long	4                       # 0x4
	.long	1                       # 0x1
	.long	5                       # 0x5
	.long	2                       # 0x2
	.long	6                       # 0x6
	.long	3                       # 0x3
	.long	7                       # 0x7
	.size	perm_vec1, 32

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"[VectorAVX Time] %lf  [Res] %d\n"
	.size	.L.str, 32

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"res[%d] = %d\n"
	.size	.L.str.2, 14

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"[RES] = %d\n"
	.size	.L.str.3, 12

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
