	.file	"t.c"
	.text
	.globl	doSumZ
	.type	doSumZ, @function
doSumZ:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	vmovss	%xmm0, -20(%rbp)
	vmovss	%xmm1, -24(%rbp)
	vpxord	%zmm0, %zmm0, %zmm0
	vmovss	%xmm0, -4(%rbp)
#APP
# 5 "t.c" 1
	vmovups -20(%rbp) , %zmm1 
	vmovups -24(%rbp) , %zmm2 
	vaddps  %zmm1 , %zmm2 , %zmm0 
	vmovups %zmm0 , %xmm3 
	
# 0 "" 2
#NO_APP
	vmovss	%xmm3, -4(%rbp)
	vmovss	-4(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	doSumZ, .-doSumZ
	.globl	doSumY
	.type	doSumY, @function
doSumY:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	vmovss	%xmm0, -20(%rbp)
	vmovss	%xmm1, -24(%rbp)
	vpxord	%zmm0, %zmm0, %zmm0
	vmovss	%xmm0, -4(%rbp)
#APP
# 19 "t.c" 1
	vmovups -20(%rbp) , %ymm1 
	vmovups -24(%rbp) , %ymm2 
	vaddps  %ymm1 , %ymm2 , %ymm0 
	vmovups %ymm0 , %xmm3 
	
# 0 "" 2
#NO_APP
	vmovss	%xmm3, -4(%rbp)
	vmovss	-4(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	doSumY, .-doSumY
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
