	.text
	.file	"ext.ll"
	.globl	doOper                  # -- Begin function doOper
	.p2align	4, 0x90
	.type	doOper,@function
doOper:                                 # @doOper
	.cfi_startproc
# %bb.0:
	vpaddd	%ymm30, %ymm31, %ymm0   # encoding: [0x62,0x91,0x05,0x20,0xfe,0xc6]
	vpcmpeqd	%ymm1, %ymm1, %ymm1 # encoding: [0xc5,0xf5,0x76,0xc9]
	vpsubd	%ymm1, %ymm0, %ymm0     # EVEX TO VEX Compression encoding: [0xc5,0xfd,0xfa,0xc1]
	retq                            # encoding: [0xc3]
.Lfunc_end0:
	.size	doOper, .Lfunc_end0-doOper
	.cfi_endproc
                                        # -- End function
	.globl	doOper1                 # -- Begin function doOper1
	.p2align	4, 0x90
	.type	doOper1,@function
doOper1:                                # @doOper1
	.cfi_startproc
# %bb.0:
	vpaddd	%ymm1, %ymm0, %ymm0     # EVEX TO VEX Compression encoding: [0xc5,0xfd,0xfe,0xc1]
	retq                            # encoding: [0xc3]
.Lfunc_end1:
	.size	doOper1, .Lfunc_end1-doOper1
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
