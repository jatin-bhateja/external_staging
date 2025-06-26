	.file	"align.c"
	.text
	.globl	myint
	.data
	.align 4
	.type	myint, @object
	.size	myint, 4
myint:
	.long	1
	.globl	mychar
	.align 64
	.type	mychar, @object
	.size	mychar, 6
mychar:
	.byte	97
	.byte	98
	.byte	99
	.byte	100
	.byte	101
	.byte	102
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
