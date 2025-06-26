	.text
	.file	"VecMaxR_dp.cpp"
	.globl	_Z9vmaxpd512Dv8_d       # -- Begin function _Z9vmaxpd512Dv8_d
	.p2align	4, 0x90
	.type	_Z9vmaxpd512Dv8_d,@function
_Z9vmaxpd512Dv8_d:                      # @_Z9vmaxpd512Dv8_d
	.cfi_startproc
# %bb.0:                                # %entry
	#APP
	vextractf64x4	$1, %zmm0, %ymm1
	vmaxpd	%zmm0, %zmm1, %zmm2
	vextractf64x2	$1, %ymm2, %xmm1
	vmaxpd	%xmm1, %xmm2, %xmm2
	vpermilpd	$1, %xmm2, %xmm1 # xmm1 = xmm2[1,0]
	vmaxsd	%xmm1, %xmm2, %xmm2
	vmovsd	%xmm2, -8(%rsp)

	#NO_APP
	vmovsd	-8(%rsp), %xmm0         # xmm0 = mem[0],zero
	vzeroupper
	retq
.Lfunc_end0:
	.size	_Z9vmaxpd512Dv8_d, .Lfunc_end0-_Z9vmaxpd512Dv8_d
	.cfi_endproc
                                        # -- End function
	.globl	_Z9vmaxpd256Dv4_d       # -- Begin function _Z9vmaxpd256Dv4_d
	.p2align	4, 0x90
	.type	_Z9vmaxpd256Dv4_d,@function
_Z9vmaxpd256Dv4_d:                      # @_Z9vmaxpd256Dv4_d
	.cfi_startproc
# %bb.0:                                # %entry
	vpermpd	$78, %ymm0, %ymm1       # ymm1 = ymm0[2,3,0,1]
	vmaxpd	%ymm1, %ymm0, %ymm0
	vpermilpd	$1, %ymm0, %ymm1 # ymm1 = ymm0[1,0,2,2]
	vmaxpd	%ymm1, %ymm0, %ymm0
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	retq
.Lfunc_end1:
	.size	_Z9vmaxpd256Dv4_d, .Lfunc_end1-_Z9vmaxpd256Dv4_d
	.cfi_endproc
                                        # -- End function
	.globl	_Z9vmaxpd128Dv2_d       # -- Begin function _Z9vmaxpd128Dv2_d
	.p2align	4, 0x90
	.type	_Z9vmaxpd128Dv2_d,@function
_Z9vmaxpd128Dv2_d:                      # @_Z9vmaxpd128Dv2_d
	.cfi_startproc
# %bb.0:                                # %entry
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vmaxpd	%xmm1, %xmm0, %xmm0
	retq
.Lfunc_end2:
	.size	_Z9vmaxpd128Dv2_d, .Lfunc_end2-_Z9vmaxpd128Dv2_d
	.cfi_endproc
                                        # -- End function
	.section	.rodata,"a",@progbits
	.p2align	6               # -- Begin function main
.LCPI3_0:
	.quad	4607632778762754458     # double 1.1000000000000001
	.quad	4611911198408756429     # double 2.1000000000000001
	.quad	4614162998222441677     # double 3.1000000000000001
	.quad	-4610560118520545280    # double -2.5
	.quad	4617428107952285286     # double 5.0999999999999996
	.quad	4618554007859127910     # double 6.0999999999999996
	.quad	4619679907765970534     # double 7.0999999999999996
	.quad	-4608308318706860032    # double -3.5
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI3_1:
	.quad	4607632778762754458     # double 1.1000000000000001
.LCPI3_2:
	.quad	4611911198408756429     # double 2.1000000000000001
.LCPI3_3:
	.quad	4614162998222441677     # double 3.1000000000000001
.LCPI3_4:
	.quad	-4610560118520545280    # double -2.5
.LCPI3_5:
	.quad	4617428107952285286     # double 5.0999999999999996
.LCPI3_6:
	.quad	4618554007859127910     # double 6.0999999999999996
.LCPI3_7:
	.quad	4619679907765970534     # double 7.0999999999999996
.LCPI3_8:
	.quad	-4608308318706860032    # double -3.5
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
	leaq	40(%rsp), %rdi
	movl	$64, %esi
	movl	$64, %edx
	callq	posix_memalign
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jne	.LBB3_2
# %bb.1:                                # %entry
	movq	40(%rsp), %rbx
.LBB3_2:                                # %entry
	vmovaps	.LCPI3_0(%rip), %zmm0   # zmm0 = [1.1000000000000001E+0,2.1000000000000001E+0,3.1000000000000001E+0,-2.5E+0,5.0999999999999996E+0,6.0999999999999996E+0,7.0999999999999996E+0,-3.5E+0]
	vmovups	%zmm0, (%rbx)
	movl	$10, %edi
	vzeroupper
	callq	putchar
	vmovsd	.LCPI3_1(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
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
	vmovaps	.LCPI3_0(%rip), %zmm0   # zmm0 = [1.1000000000000001E+0,2.1000000000000001E+0,3.1000000000000001E+0,-2.5E+0,5.0999999999999996E+0,6.0999999999999996E+0,7.0999999999999996E+0,-3.5E+0]
	callq	_Z9vmaxpd512Dv8_d
	movl	$.L.str, %edi
	movb	$1, %al
	vzeroupper
	callq	printf
	vmovaps	(%rbx), %ymm0
	vmovups	%ymm0, 64(%rsp)         # 32-byte Spill
	vmovaps	(%rbx), %xmm0
	vmovaps	%xmm0, 48(%rsp)         # 16-byte Spill
	vmovaps	16(%rbx), %xmm0
	vmovaps	%xmm0, 16(%rsp)         # 16-byte Spill
	movl	$10, %edi
	vzeroupper
	callq	putchar
	movl	$.L.str.4, %edi
	vmovaps	48(%rsp), %xmm0         # 16-byte Reload
	movb	$1, %al
	callq	printf
	vpermilpd	$1, 48(%rsp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	movl	$.L.str.4, %edi
	vmovaps	16(%rsp), %xmm0         # 16-byte Reload
	movb	$1, %al
	callq	printf
	vpermilpd	$1, 16(%rsp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	vmovups	64(%rsp), %ymm0         # 32-byte Reload
	callq	_Z9vmaxpd256Dv4_d
	movl	$.L.str.1, %edi
	movb	$1, %al
	vzeroupper
	callq	printf
	vmovaps	(%rbx), %xmm0
	vmovaps	%xmm0, 16(%rsp)         # 16-byte Spill
	movl	$10, %edi
	callq	putchar
	movl	$.L.str.4, %edi
	vmovaps	16(%rsp), %xmm0         # 16-byte Reload
	movb	$1, %al
	callq	printf
	vpermilpd	$1, 16(%rsp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	vmovaps	16(%rsp), %xmm0         # 16-byte Reload
	callq	_Z9vmaxpd128Dv2_d
	movl	$.L.str.2, %edi
	movb	$1, %al
	callq	printf
	xorl	%eax, %eax
	addq	$112, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
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

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"%lf "
	.size	.L.str.4, 5


	.ident	"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 8e47b092c60e3b4842e6200e022dd1253e9896c6) (http://github.com/llvm-mirror/llvm.git 954735141519398580615e0907a85ed0972b50cb)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
