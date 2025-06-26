	.text
	.file	"VecMaxR.cpp"
	.globl	_Z9vmaxps256Dv8_f       # -- Begin function _Z9vmaxps256Dv8_f
	.p2align	4, 0x90
	.type	_Z9vmaxps256Dv8_f,@function
_Z9vmaxps256Dv8_f:                      # @_Z9vmaxps256Dv8_f
	.cfi_startproc
# %bb.0:
	vpermpd	$78, %ymm0, %ymm1       # ymm1 = ymm0[2,3,0,1]
	vminps	%ymm1, %ymm0, %ymm0
	vpermilps	$14, %ymm0, %ymm1 # ymm1 = ymm0[2,3,0,0,6,7,4,4]
	vminps	%ymm1, %ymm0, %ymm0
	vpermilps	$1, %ymm0, %ymm1 # ymm1 = ymm0[1,0,0,0,5,4,4,4]
	vminps	%ymm1, %ymm0, %ymm0
                                        # kill: def %xmm0 killed %xmm0 killed %ymm0
	vzeroupper
	retq
.Lfunc_end0:
	.size	_Z9vmaxps256Dv8_f, .Lfunc_end0-_Z9vmaxps256Dv8_f
	.cfi_endproc
                                        # -- End function
	.globl	_Z9vmaxps128Dv4_f       # -- Begin function _Z9vmaxps128Dv4_f
	.p2align	4, 0x90
	.type	_Z9vmaxps128Dv4_f,@function
_Z9vmaxps128Dv4_f:                      # @_Z9vmaxps128Dv4_f
	.cfi_startproc
# %bb.0:
	vpermilps	$14, %xmm0, %xmm1 # xmm1 = xmm0[2,3,0,0]
	vminps	%xmm1, %xmm0, %xmm0
	vpermilps	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0,0,0]
	vminps	%xmm1, %xmm0, %xmm0
	retq
.Lfunc_end1:
	.size	_Z9vmaxps128Dv4_f, .Lfunc_end1-_Z9vmaxps128Dv4_f
	.cfi_endproc
                                        # -- End function
	.globl	_Z8vmaxps64Dv4_f        # -- Begin function _Z8vmaxps64Dv4_f
	.p2align	4, 0x90
	.type	_Z8vmaxps64Dv4_f,@function
_Z8vmaxps64Dv4_f:                       # @_Z8vmaxps64Dv4_f
	.cfi_startproc
# %bb.0:
	vpermilps	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0,0,0]
	vminps	%xmm1, %xmm0, %xmm0
	retq
.Lfunc_end2:
	.size	_Z8vmaxps64Dv4_f, .Lfunc_end2-_Z8vmaxps64Dv4_f
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5               # -- Begin function main
.LCPI3_0:
	.long	1091672474              # float 9.10000038
	.long	1092721050              # float 10.1000004
	.long	1093769626              # float 11.1000004
	.long	1094818202              # float 12.1000004
	.long	1095866778              # float 13.1000004
	.long	1096915354              # float 14.1000004
	.long	1097963930              # float 15.1000004
	.long	1098960077              # float 16.1000004
.LCPI3_1:
	.long	1066192077              # float 1.10000002
	.long	1074161254              # float 2.0999999
	.long	1078355558              # float 3.0999999
	.long	3223322624              # float -2.5
	.long	1084437299              # float 5.0999999
	.long	1086534451              # float 6.0999999
	.long	1088631603              # float 7.0999999
	.long	3227516928              # float -3.5
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI3_2:
	.quad	4607632778870128640     # double 1.1000000238418579
.LCPI3_3:
	.quad	4611911198194008064     # double 2.0999999046325684
.LCPI3_4:
	.quad	4614162998007693312     # double 3.0999999046325684
.LCPI3_5:
	.quad	-4610560118520545280    # double -2.5
.LCPI3_6:
	.quad	4617428107844911104     # double 5.0999999046325684
.LCPI3_7:
	.quad	4618554007751753728     # double 6.0999999046325684
.LCPI3_8:
	.quad	4619679907658596352     # double 7.0999999046325684
.LCPI3_9:
	.quad	-4608308318706860032    # double -3.5
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -16
	leaq	40(%rsp), %rdi
	movl	$32, %esi
	movl	$64, %edx
	callq	posix_memalign
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jne	.LBB3_2
# %bb.1:
	movq	40(%rsp), %rbx
.LBB3_2:
	vmovaps	.LCPI3_0(%rip), %ymm0   # ymm0 = [9.100000e+00,1.010000e+01,1.110000e+01,1.210000e+01,1.310000e+01,1.410000e+01,1.510000e+01,1.610000e+01]
	vmovups	%ymm0, 32(%rbx)
	vmovaps	.LCPI3_1(%rip), %ymm0   # ymm0 = [1.100000e+00,2.100000e+00,3.100000e+00,-2.500000e+00,5.100000e+00,6.100000e+00,7.100000e+00,-3.500000e+00]
	vmovups	%ymm0, (%rbx)
	movl	$10, %edi
	vzeroupper
	callq	putchar
	vmovsd	.LCPI3_2(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI3_3(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI3_4(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI3_5(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI3_6(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI3_7(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI3_8(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI3_9(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	vmovaps	.LCPI3_1(%rip), %ymm0   # ymm0 = [1.100000e+00,2.100000e+00,3.100000e+00,-2.500000e+00,5.100000e+00,6.100000e+00,7.100000e+00,-3.500000e+00]
	callq	_Z9vmaxps256Dv8_f
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str, %edi
	movb	$1, %al
	vzeroupper
	callq	printf
	vmovaps	(%rbx), %xmm0
	vmovaps	%xmm0, (%rsp)           # 16-byte Spill
	movl	$10, %edi
	callq	putchar
	vmovaps	(%rsp), %xmm0           # 16-byte Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%rsp)         # 8-byte Spill
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	vmovshdup	(%rsp), %xmm0   # 16-byte Folded Reload
                                        # xmm0 = mem[1,1,3,3]
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)         # 8-byte Spill
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	vpermilpd	$1, (%rsp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	vpermilps	$231, (%rsp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[3,1,2,3]
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	vmovaps	(%rsp), %xmm0           # 16-byte Reload
	callq	_Z9vmaxps128Dv4_f
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movl	$10, %edi
	callq	putchar
	movl	$.L.str.4, %edi
	movb	$1, %al
	vmovsd	32(%rsp), %xmm0         # 8-byte Reload
                                        # xmm0 = mem[0],zero
	callq	printf
	movl	$.L.str.4, %edi
	movb	$1, %al
	vmovsd	24(%rsp), %xmm0         # 8-byte Reload
                                        # xmm0 = mem[0],zero
	callq	printf
	vmovaps	(%rsp), %xmm0           # 16-byte Reload
	callq	_Z8vmaxps64Dv4_f
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.2, %edi
	movb	$1, %al
	callq	printf
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbx
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"\nRes256 = %f\n"
	.size	.L.str, 14

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"\nRes128 = %f\n"
	.size	.L.str.1, 14

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"\nRes64 = %f\n"
	.size	.L.str.2, 13

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"%f "
	.size	.L.str.4, 4


	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",@progbits
