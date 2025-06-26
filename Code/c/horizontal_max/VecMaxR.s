	.text
	.file	"VecMaxR.cpp"
	.globl	_Z9vmaxps512Dv16_f      # -- Begin function _Z9vmaxps512Dv16_f
	.p2align	4, 0x90
	.type	_Z9vmaxps512Dv16_f,@function
_Z9vmaxps512Dv16_f:                     # @_Z9vmaxps512Dv16_f
	.cfi_startproc
# %bb.0:                                # %entry
	#APP
	vextractf32x8	$1, %zmm0, %ymm1
	vmaxps	%zmm0, %zmm1, %zmm2
	vextractf32x4	$1, %ymm2, %xmm1
	vmaxps	%xmm1, %xmm2, %xmm2
	vpermilps	$78, %xmm2, %xmm1 # xmm1 = xmm2[2,3,0,1]
	vmaxps	%xmm1, %xmm2, %xmm2
	vpermilps	$1, %xmm2, %xmm1 # xmm1 = xmm2[1,0,0,0]
	vmaxss	%xmm1, %xmm2, %xmm2
	vmovss	%xmm2, -4(%rsp)

	#NO_APP
	vmovss	-4(%rsp), %xmm0         # xmm0 = mem[0],zero,zero,zero
	vzeroupper
	retq
.Lfunc_end0:
	.size	_Z9vmaxps512Dv16_f, .Lfunc_end0-_Z9vmaxps512Dv16_f
	.cfi_endproc
                                        # -- End function
	.globl	_Z9vmaxps256Dv8_f       # -- Begin function _Z9vmaxps256Dv8_f
	.p2align	4, 0x90
	.type	_Z9vmaxps256Dv8_f,@function
_Z9vmaxps256Dv8_f:                      # @_Z9vmaxps256Dv8_f
	.cfi_startproc
# %bb.0:                                # %entry
	vpermpd	$78, %ymm0, %ymm1       # ymm1 = ymm0[2,3,0,1]
	vmaxps	%ymm1, %ymm0, %ymm0
	vpermilps	$14, %ymm0, %ymm1 # ymm1 = ymm0[2,3,0,0,6,7,4,4]
	vmaxps	%ymm1, %ymm0, %ymm0
	vpermilps	$1, %ymm0, %ymm1 # ymm1 = ymm0[1,0,0,0,5,4,4,4]
	vmaxps	%ymm1, %ymm0, %ymm0
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	retq
.Lfunc_end1:
	.size	_Z9vmaxps256Dv8_f, .Lfunc_end1-_Z9vmaxps256Dv8_f
	.cfi_endproc
                                        # -- End function
	.globl	_Z9vmaxps128Dv4_f       # -- Begin function _Z9vmaxps128Dv4_f
	.p2align	4, 0x90
	.type	_Z9vmaxps128Dv4_f,@function
_Z9vmaxps128Dv4_f:                      # @_Z9vmaxps128Dv4_f
	.cfi_startproc
# %bb.0:                                # %entry
	vpermilps	$14, %xmm0, %xmm1 # xmm1 = xmm0[2,3,0,0]
	vmaxps	%xmm1, %xmm0, %xmm0
	vpermilps	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0,0,0]
	vmaxps	%xmm1, %xmm0, %xmm0
	retq
.Lfunc_end2:
	.size	_Z9vmaxps128Dv4_f, .Lfunc_end2-_Z9vmaxps128Dv4_f
	.cfi_endproc
                                        # -- End function
	.globl	_Z8vmaxps64Dv4_f        # -- Begin function _Z8vmaxps64Dv4_f
	.p2align	4, 0x90
	.type	_Z8vmaxps64Dv4_f,@function
_Z8vmaxps64Dv4_f:                       # @_Z8vmaxps64Dv4_f
	.cfi_startproc
# %bb.0:                                # %entry
	vpermilps	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0,0,0]
	vmaxps	%xmm1, %xmm0, %xmm0
	retq
.Lfunc_end3:
	.size	_Z8vmaxps64Dv4_f, .Lfunc_end3-_Z8vmaxps64Dv4_f
	.cfi_endproc
                                        # -- End function
	.section	.rodata,"a",@progbits
	.p2align	6               # -- Begin function main
.LCPI4_0:
	.long	1066192077              # float 1.10000002
	.long	1074161254              # float 2.0999999
	.long	1078355558              # float 3.0999999
	.long	3223322624              # float -2.5
	.long	1084437299              # float 5.0999999
	.long	1086534451              # float 6.0999999
	.long	1088631603              # float 7.0999999
	.long	3227516928              # float -3.5
	.long	1091672474              # float 9.10000038
	.long	1092721050              # float 10.1000004
	.long	1093769626              # float 11.1000004
	.long	1094818202              # float 12.1000004
	.long	1095866778              # float 13.1000004
	.long	1096915354              # float 14.1000004
	.long	1097963930              # float 15.1000004
	.long	1098960077              # float 16.1000004
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI4_1:
	.quad	4607632778870128640     # double 1.1000000238418579
.LCPI4_2:
	.quad	4611911198194008064     # double 2.0999999046325684
.LCPI4_3:
	.quad	4614162998007693312     # double 3.0999999046325684
.LCPI4_4:
	.quad	-4610560118520545280    # double -2.5
.LCPI4_5:
	.quad	4617428107844911104     # double 5.0999999046325684
.LCPI4_6:
	.quad	4618554007751753728     # double 6.0999999046325684
.LCPI4_7:
	.quad	4619679907658596352     # double 7.0999999046325684
.LCPI4_8:
	.quad	-4608308318706860032    # double -3.5
.LCPI4_9:
	.quad	4621312462845640704     # double 9.1000003814697265
.LCPI4_10:
	.quad	4621875412799062016     # double 10.100000381469727
.LCPI4_11:
	.quad	4622438362752483328     # double 11.100000381469727
.LCPI4_12:
	.quad	4623001312705904640     # double 12.100000381469727
.LCPI4_13:
	.quad	4623564262659325952     # double 13.100000381469727
.LCPI4_14:
	.quad	4624127212612747264     # double 14.100000381469727
.LCPI4_15:
	.quad	4624690162566168576     # double 15.100000381469727
.LCPI4_16:
	.quad	4625224964914544640     # double 16.100000381469727
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$112, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -16
	leaq	56(%rsp), %rdi
	movl	$64, %esi
	movl	$64, %edx
	callq	posix_memalign
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jne	.LBB4_2
# %bb.1:                                # %entry
	movq	56(%rsp), %rbx
.LBB4_2:                                # %entry
	vmovaps	.LCPI4_0(%rip), %zmm0   # zmm0 = [1.10000002E+0,2.0999999E+0,3.0999999E+0,-2.5E+0,5.0999999E+0,6.0999999E+0,7.0999999E+0,-3.5E+0,9.10000038E+0,1.01000004E+1,1.11000004E+1,1.21000004E+1,1.31000004E+1,1.41000004E+1,1.51000004E+1,1.61000004E+1]
	vmovups	%zmm0, (%rbx)
	movl	$10, %edi
	vzeroupper
	callq	putchar
	vmovsd	.LCPI4_1(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_2(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_3(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_4(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_5(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_6(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_7(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_8(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_9(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_10(%rip), %xmm0  # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_11(%rip), %xmm0  # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_12(%rip), %xmm0  # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_13(%rip), %xmm0  # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_14(%rip), %xmm0  # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_15(%rip), %xmm0  # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI4_16(%rip), %xmm0  # xmm0 = mem[0],zero
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovaps	.LCPI4_0(%rip), %zmm0   # zmm0 = [1.10000002E+0,2.0999999E+0,3.0999999E+0,-2.5E+0,5.0999999E+0,6.0999999E+0,7.0999999E+0,-3.5E+0,9.10000038E+0,1.01000004E+1,1.11000004E+1,1.21000004E+1,1.31000004E+1,1.41000004E+1,1.51000004E+1,1.61000004E+1]
	callq	_Z9vmaxps512Dv16_f
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str, %edi
	movb	$1, %al
	vzeroupper
	callq	printf
	vmovaps	(%rbx), %ymm0
	vmovups	%ymm0, 64(%rsp)         # 32-byte Spill
	vmovaps	(%rbx), %xmm0
	vmovaps	%xmm0, 32(%rsp)         # 16-byte Spill
	vmovaps	16(%rbx), %xmm0
	vmovaps	%xmm0, 16(%rsp)         # 16-byte Spill
	movl	$10, %edi
	vzeroupper
	callq	putchar
	vmovaps	32(%rsp), %xmm0         # 16-byte Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovshdup	32(%rsp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[1,1,3,3]
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vpermilpd	$1, 32(%rsp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vpermilps	$231, 32(%rsp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[3,1,2,3]
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovaps	16(%rsp), %xmm0         # 16-byte Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovshdup	16(%rsp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[1,1,3,3]
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vpermilpd	$1, 16(%rsp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vpermilps	$231, 16(%rsp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[3,1,2,3]
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovups	64(%rsp), %ymm0         # 32-byte Reload
	callq	_Z9vmaxps256Dv8_f
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	vzeroupper
	callq	printf
	vmovaps	(%rbx), %xmm0
	vmovaps	%xmm0, 16(%rsp)         # 16-byte Spill
	movl	$10, %edi
	callq	putchar
	vmovaps	16(%rsp), %xmm0         # 16-byte Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%rsp)         # 8-byte Spill
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovshdup	16(%rsp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[1,1,3,3]
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 64(%rsp)         # 8-byte Spill
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vpermilpd	$1, 16(%rsp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vpermilps	$231, 16(%rsp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[3,1,2,3]
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.5, %edi
	movb	$1, %al
	callq	printf
	vmovaps	16(%rsp), %xmm0         # 16-byte Reload
	callq	_Z9vmaxps128Dv4_f
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.2, %edi
	movb	$1, %al
	callq	printf
	movl	$10, %edi
	callq	putchar
	movl	$.L.str.5, %edi
	vmovsd	32(%rsp), %xmm0         # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	printf
	movl	$.L.str.5, %edi
	vmovsd	64(%rsp), %xmm0         # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	printf
	vmovaps	16(%rsp), %xmm0         # 16-byte Reload
	callq	_Z8vmaxps64Dv4_f
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str.3, %edi
	movb	$1, %al
	callq	printf
	xorl	%eax, %eax
	addq	$112, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"\nRes512 = %f\n"
	.size	.L.str, 14

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"\nRes256 = %f\n"
	.size	.L.str.1, 14

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"\nRes128 = %f\n"
	.size	.L.str.2, 14

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"\nRes64 = %f\n"
	.size	.L.str.3, 13

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"%f "
	.size	.L.str.5, 4


	.ident	"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 8e47b092c60e3b4842e6200e022dd1253e9896c6) (http://github.com/llvm-mirror/llvm.git 954735141519398580615e0907a85ed0972b50cb)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
