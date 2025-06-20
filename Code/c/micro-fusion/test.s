# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "";
# mark_description "-I/home/jatinbha/softwares/iaca-lin64/ -mavx512f -S";
	.file "test.c"
	.text
..TXTST0:
.L_2__routine_start_main_0:
# -- Begin  main
	.text
# mark_begin;
       .align    16,0x90
	.globl main
# --- main()
main:
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value_main.1:
..L2:
                                                          #18.12
        pushq     %rbp                                          #18.12
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #18.12
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #18.12
        subq      $256, %rsp                                    #18.12
        xorl      %esi, %esi                                    #18.12
        movl      $3, %edi                                      #18.12
        call      __intel_new_feature_proc_init                 #18.12
                                # LOE rbx r12 r13 r14 r15
..B1.14:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        vstmxcsr  (%rsp)                                        #18.12
        vmovups   src1.153.0.0.2(%rip), %zmm0                   #20.19
        orl       $32832, (%rsp)                                #18.12
        vldmxcsr  (%rsp)                                        #18.12
        vmovups   %zmm0, 64(%rsp)                               #20.19
                                # LOE rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.14
                                # Execution count [1.00e+00]
        vmovups   src2.153.0.0.2(%rip), %zmm0                   #21.19
        vmovups   %zmm0, 128(%rsp)                              #21.19
                                # LOE rbx r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.0, %esi                         #24.6
        lea       (%rsp), %rcx                                  #22.4
        movq      %rcx, 192(%rcx)                               #22.4
        lea       64(%rsp), %rax                                #22.4
        movl      $111, %ebx                                    #22.4
        .byte     100                                           #22.4
        .byte     103                                           #22.4
        .byte     144                                           #22.4
        lea       128(%rsp), %rdx                               #22.4
        movq      %rax, 136(%rax)                               #22.4
        movl      $1, %eax                                      #24.6
        movq      %rdx, 80(%rdx)                                #22.4
        xorl      %edx, %edx                                    #24.6
        vmovdqu64 200(%rsp), %zmm1                              #22.4
        vpxorq    208(%rsp), %zmm1, %zmm0                       #22.4
        vpxorq    %zmm0, %zmm1, %zmm0                           #22.4
        vmovdqu64 %zmm0, 192(%rsp)                              #22.4
        movl      $222, %ebx                                    #22.4
        .byte     100                                           #22.4
        .byte     103                                           #22.4
        .byte     144                                           #22.4
        vmovsd    (%rcx), %xmm0                                 #24.6
        movq      stdout(%rip), %rdi                            #24.6
        vzeroupper                                              #24.6
#       fprintf(FILE *, const char *, ...)
        call      fprintf                                       #24.6
                                # LOE rbx r12 r13 r14 r15
..B1.4:                         # Preds ..B1.3
                                # Execution count [1.00e+00]
        movl      $1, %edx                                      #24.6
        movl      $.L_2__STRING.0, %esi                         #24.6
        movl      %edx, %eax                                    #24.6
        vmovsd    8(%rsp), %xmm0                                #24.6
        movq      stdout(%rip), %rdi                            #24.6
#       fprintf(FILE *, const char *, ...)
        call      fprintf                                       #24.6
                                # LOE rbx r12 r13 r14 r15
..B1.5:                         # Preds ..B1.4
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.0, %esi                         #24.6
        movl      $2, %edx                                      #24.6
        movl      $1, %eax                                      #24.6
        vmovsd    16(%rsp), %xmm0                               #24.6
        movq      stdout(%rip), %rdi                            #24.6
#       fprintf(FILE *, const char *, ...)
        call      fprintf                                       #24.6
                                # LOE rbx r12 r13 r14 r15
..B1.6:                         # Preds ..B1.5
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.0, %esi                         #24.6
        movl      $3, %edx                                      #24.6
        movl      $1, %eax                                      #24.6
        vmovsd    24(%rsp), %xmm0                               #24.6
        movq      stdout(%rip), %rdi                            #24.6
#       fprintf(FILE *, const char *, ...)
        call      fprintf                                       #24.6
                                # LOE rbx r12 r13 r14 r15
..B1.7:                         # Preds ..B1.6
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.0, %esi                         #24.6
        movl      $4, %edx                                      #24.6
        movl      $1, %eax                                      #24.6
        vmovsd    32(%rsp), %xmm0                               #24.6
        movq      stdout(%rip), %rdi                            #24.6
#       fprintf(FILE *, const char *, ...)
        call      fprintf                                       #24.6
                                # LOE rbx r12 r13 r14 r15
..B1.8:                         # Preds ..B1.7
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.0, %esi                         #24.6
        movl      $5, %edx                                      #24.6
        movl      $1, %eax                                      #24.6
        vmovsd    40(%rsp), %xmm0                               #24.6
        movq      stdout(%rip), %rdi                            #24.6
#       fprintf(FILE *, const char *, ...)
        call      fprintf                                       #24.6
                                # LOE rbx r12 r13 r14 r15
..B1.9:                         # Preds ..B1.8
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.0, %esi                         #24.6
        movl      $6, %edx                                      #24.6
        movl      $1, %eax                                      #24.6
        vmovsd    48(%rsp), %xmm0                               #24.6
        movq      stdout(%rip), %rdi                            #24.6
#       fprintf(FILE *, const char *, ...)
        call      fprintf                                       #24.6
                                # LOE rbx r12 r13 r14 r15
..B1.10:                        # Preds ..B1.9
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.0, %esi                         #24.6
        movl      $7, %edx                                      #24.6
        movl      $1, %eax                                      #24.6
        vmovsd    56(%rsp), %xmm0                               #24.6
        movq      stdout(%rip), %rdi                            #24.6
#       fprintf(FILE *, const char *, ...)
        call      fprintf                                       #24.6
                                # LOE rbx r12 r13 r14 r15
..B1.11:                        # Preds ..B1.10
                                # Execution count [1.00e+00]
        xorl      %eax, %eax                                    #26.11
        movq      %rbp, %rsp                                    #26.11
        popq      %rbp                                          #26.11
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #26.11
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.0:
	.section .rodata, "a"
	.align 64
	.align 64
src1.153.0.0.2:
	.long	0x00000000,0x3ff00000
	.long	0x00000000,0x40000000
	.long	0x00000000,0x40080000
	.long	0x00000000,0x40100000
	.long	0x00000000,0x40140000
	.long	0x00000000,0x40180000
	.long	0x00000000,0x401c0000
	.long	0x00000000,0x40200000
	.align 64
src2.153.0.0.2:
	.long	0x00000000,0x3ff00000
	.long	0x00000000,0x40000000
	.long	0x00000000,0x40080000
	.long	0x00000000,0x40100000
	.long	0x00000000,0x40140000
	.long	0x00000000,0x40180000
	.long	0x00000000,0x401c0000
	.long	0x00000000,0x40200000
	.data
# -- End  main
	.text
.L_2__routine_start__Z7xorargsPdS_S__1:
# -- Begin  _Z7xorargsPdS_S_
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z7xorargsPdS_S_
# --- xorargs(double *, double *, double *)
_Z7xorargsPdS_S_:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z7xorargsPdS_S_.9:
..L10:
                                                         #4.60
        movq      %rdi, -24(%rsp)                               #4.60
        movq      %rsi, -16(%rsp)                               #4.60
        movq      %rdx, -8(%rsp)                                #4.60
        vmovdqu64 -24(%rsp), %zmm1                              #6.0
        movl      $111, %ebx                                    #5.0
        .byte     100                                           #5.0
        .byte     103                                           #5.0
        .byte     144                                           #5.0
        vpxorq    -16(%rsp), %zmm1, %zmm0                       #6.0
        vpxorq    %zmm0, %zmm1, %zmm0                           #6.0
        movl      $222, %ebx                                    #15.0
        .byte     100                                           #15.0
        .byte     103                                           #15.0
        .byte     144                                           #15.0
        vmovdqu64 %zmm0, -8(%rsp)                               #6.0
        vzeroupper                                              #16.1
        ret                                                     #16.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z7xorargsPdS_S_,@function
	.size	_Z7xorargsPdS_S_,.-_Z7xorargsPdS_S_
..LN_Z7xorargsPdS_S_.1:
	.data
# -- End  _Z7xorargsPdS_S_
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.long	544433490
	.long	1566844251
	.long	622869024
	.long	681580
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,16
	.data
	.section .note.GNU-stack, ""
# End
