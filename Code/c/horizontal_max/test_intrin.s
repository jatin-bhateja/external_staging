# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "-S";
	.file "test_intrin.c"
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
..___tag_value_main.1:
..L2:
                                                          #13.12
        pushq     %rbp                                          #13.12
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #13.12
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #13.12
        subq      $128, %rsp                                    #13.12
        xorl      %esi, %esi                                    #13.12
        movl      $3, %edi                                      #13.12
        call      __intel_new_feature_proc_init                 #13.12
                                # LOE rbx r12 r13 r14 r15
..B1.8:                         # Preds ..B1.1
                                # Execution count [1.00e+00]
        stmxcsr   (%rsp)                                        #13.12
        movl      $8, %edi                                      #15.18
        movl      $64, %esi                                     #15.18
        orl       $32832, (%rsp)                                #13.12
        ldmxcsr   (%rsp)                                        #13.12
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #15.18
                                # LOE rax rbx r12 r13 r14 r15
..B1.7:                         # Preds ..B1.8
                                # Execution count [1.00e+00]
        movq      %rax, %rdx                                    #15.18
                                # LOE rdx rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.7
                                # Execution count [1.00e+00]
        movq      $0x3ff0000000000000, %rax                     #21.5
        movq      %rax, (%rdx)                                  #21.5
        vmovups   (%rdx), %zmm0                                 #24.16
..___tag_value_main.6:
#       JNI_MinReduction_512(__m512d)
        call      JNI_MinReduction_512                          #24.16
..___tag_value_main.7:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.9:                         # Preds ..B1.2
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.0, %edi                         #26.10
        movl      $1, %eax                                      #26.10
        movq      %rbp, %rsp                                    #26.10
        popq      %rbp                                          #26.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
#       printf(const char *__restrict__, ...)
        jmp       printf                                        #26.10
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.0:
	.data
# -- End  main
	.text
.L_2__routine_start_JNI_MinReduction_512_1:
# -- Begin  JNI_MinReduction_512
	.text
# mark_begin;
       .align    16,0x90
	.globl JNI_MinReduction_512
# --- JNI_MinReduction_512(__m512d)
JNI_MinReduction_512:
# parameter 1: %zmm0
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_JNI_MinReduction_512.11:
..L12:
                                                         #7.42
        vextractf64x4 $1, %zmm0, %ymm1                          #8.10
        vminpd    %ymm0, %ymm1, %ymm2                           #8.10
        valignq   $3, %zmm2, %zmm2, %zmm3                       #8.10
        valignq   $2, %zmm2, %zmm2, %zmm4                       #8.10
        valignq   $1, %zmm2, %zmm2, %zmm5                       #8.10
        vminsd    %xmm5, %xmm4, %xmm0                           #8.10
        vminsd    %xmm2, %xmm3, %xmm6                           #8.10
        vminsd    %xmm6, %xmm0, %xmm0                           #8.10
        vzeroupper                                              #8.10
        ret                                                     #8.10
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	JNI_MinReduction_512,@function
	.size	JNI_MinReduction_512,.-JNI_MinReduction_512
..LNJNI_MinReduction_512.1:
	.data
# -- End  JNI_MinReduction_512
	.section .rodata, "a"
	.align 8
	.align 8
.L_2il0floatpacket.0:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.long	544433490
	.long	1713709117
	.long	667182
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,12
	.data
	.section .note.GNU-stack, ""
# End
