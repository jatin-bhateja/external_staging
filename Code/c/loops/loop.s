	.text
	.file	"loop.c"
	.globl	doSum
	.p2align	2
	.type	doSum,@function
doSum:
	sub	sp, sp, #32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	str	wzr, [sp, #4]
.LBB0_1:
	ldr	w8, [sp, #4]
	cmp	w8, #23
	b.ge	.LBB0_4
	ldr	x8, [sp, #16]
	ldrsw	x9, [sp, #4]
	ldr	s0, [x8, x9, lsl #2]
	ldr	x8, [sp, #8]
	ldrsw	x9, [sp, #4]
	ldr	s1, [x8, x9, lsl #2]
	fadd	s0, s0, s1
	ldr	x8, [sp, #24]
	ldrsw	x9, [sp, #4]
	str	s0, [x8, x9, lsl #2]
	ldr	w8, [sp, #4]
	add	w8, w8, #1
	str	w8, [sp, #4]
	b	.LBB0_1
.LBB0_4:
	add	sp, sp, #32
	ret
.Lfunc_end0:
	.size	doSum, .Lfunc_end0-doSum


	.ident	"clang version 10.0.0 (http://github.com/llvm-mirror/clang.git 3441aaff8506ac0252f9bba9d1ce117cf35906ce) (http://github.com/llvm-mirror/llvm.git 2e6b938e4e31a2fdd8a5b3ec969bee9dcf9806a7)"
	.section	".note.GNU-stack","",@progbits
