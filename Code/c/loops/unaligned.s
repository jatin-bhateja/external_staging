# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on IA-32, Version 19.0.1.144 Build 20181018";
# mark_description "-m32 -O0 -mavx2 -use_masm -S";
	.file "unaligned.c"
	.text
..TXTST0:
# -- Begin  loadVec
	.text
# mark_begin;

	.globl loadVec
# --- loadVec()
loadVec:
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
..L1:
                                                          #37.15
        pushl     %ebp                                          #37.15
        movl      %esp, %ebp                                    #37.15
        subl      $24, %esp                                     #37.15
        movl      %ebx, -16(%ebp)                               #37.15[spill]
        movl      $a, %eax                                      #38.0
        movl      %eax, -24(%ebp)                               #38.0
        movl      $b, %eax                                      #38.0
        movl      %eax, -20(%ebp)                               #38.0
        movl      $111, %ebx                                    #38.0
        .byte     100                                           #38.0
        .byte     103                                           #38.0
        .byte     144                                           #38.0
        vmovdqu   -24(%ebp), %ymm0                              #38.0
        vmovdqu   -20(%ebp), %ymm1                              #38.0
        vpaddd    %ymm1, %ymm0, %ymm0                           #38.0
        vmovdqu   %ymm0, res                                    #38.0
        movl      $222, %ebx                                    #38.0
        .byte     100                                           #38.0
        .byte     103                                           #38.0
        .byte     144                                           #38.0
        movl      28+res, %eax                                  #51.11
        vzeroupper                                              #51.11
        movl      -16(%ebp), %ebx                               #51.11[spill]
        leave                                                   #51.11
        ret                                                     #51.11
                                # LOE
# mark_end;
	.type	loadVec,@function
	.size	loadVec,.-loadVec
	.data
# -- End  loadVec
	.text
# -- Begin  main
	.section .rodata, "a"
	.align 4
	.align 4
.L_2__STRING.0:
	.long	680997
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,4
	.text
# mark_begin;

	.globl main
# --- main()
main:
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
..L4:
                                                          #54.12
        pushl     %ebx                                          #54.12
        movl      %esp, %ebx                                    #54.12
        andl      $-16, %esp                                    #54.12
        pushl     %ebp                                          #54.12
        pushl     %ebp                                          #54.12
        movl      4(%ebx), %ebp                                 #54.12
        movl      %ebp, 4(%esp)                                 #54.12
        movl      %esp, %ebp                                    #54.12
        subl      $8, %esp                                      #54.12
#       loadVec()
        call      loadVec                                       #55.23
                                # LOE eax ebx ebp esi edi esp
..B2.6:                         # Preds ..B2.1
                                # Execution count [0.00e+00]
        movl      %eax, -8(%ebp)                                #55.23
                                # LOE ebx ebp esi edi esp
..B2.2:                         # Preds ..B2.6
                                # Execution count [0.00e+00]
        addl      $-16, %esp                                    #55.9
        movl      $.L_2__STRING.0, (%esp)                       #55.9
        movl      -8(%ebp), %eax                                #55.9
        movl      %eax, 4(%esp)                                 #55.9
#       printf(const char *__restrict__, ...)
        call      printf                                        #55.9
                                # LOE eax ebx ebp esi edi esp
..B2.7:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
        movl      %eax, -4(%ebp)                                #55.9
        addl      $16, %esp                                     #55.9
                                # LOE ebx ebp esi edi esp
..B2.3:                         # Preds ..B2.7
                                # Execution count [0.00e+00]
        movl      -4(%ebp), %eax                                #55.9
        leave                                                   #55.9
        movl      %ebx, %esp                                    #55.9
        popl      %ebx                                          #55.9
        ret                                                     #55.9
                                # LOE
# mark_end;
	.type	main,@function
	.size	main,.-main
	.data
# -- End  main
	.data
	.align 64
	.align 64
	.globl a
a:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	13
	.long	14
	.long	15
	.long	16
	.type	a,@object
	.size	a,64
	.align 64
	.globl b
b:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	13
	.long	14
	.long	15
	.long	16
	.type	b,@object
	.size	b,64
	.data
	.comm res,64,64
	.section .note.GNU-stack, ""
# End
