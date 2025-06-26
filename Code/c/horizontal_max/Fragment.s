# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "";
# mark_description "-I /home/intel/softwares/iaca/iaca-lin64 -DVER1 -mavx512f -O3 -S";
	.file "Fragment.cpp"
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
                                                          #64.12
        pushq     %rbp                                          #64.12
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #64.12
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #64.12
        subq      $128, %rsp                                    #64.12
        xorl      %esi, %esi                                    #64.12
        movl      $3, %edi                                      #64.12
        call      __intel_new_feature_proc_init                 #64.12
                                # LOE rbx r12 r13 r14 r15
..B1.17:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        vstmxcsr  (%rsp)                                        #64.12
        movl      $64, %edi                                     #65.28
        orl       $32832, (%rsp)                                #64.12
        movq      %rdi, %rsi                                    #65.28
        vldmxcsr  (%rsp)                                        #64.12
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #65.28
                                # LOE rax rbx r12 r13 r14 r15
..B1.16:                        # Preds ..B1.17
                                # Execution count [1.00e+00]
        movq      %rax, %rcx                                    #65.28
                                # LOE rcx rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.16
                                # Execution count [1.00e+00]
        vmovdqu   .L_2il0floatpacket.1(%rip), %ymm0             #67.15
        movq      $0xc00c000000000000, %rax                     #68.13
        movq      $0xc004000000000000, %rdx                     #69.13
        movl      $10, %edi                                     #72.3
        vcvtdq2pd %ymm0, %zmm16                                 #67.15
        vaddpd    .L_2il0floatpacket.0(%rip), %zmm16, %zmm17    #67.19
        vmovupd   %zmm17, (%rcx)                                #67.5
        movq      %rax, 56(%rcx)                                #68.3
        movq      %rdx, 24(%rcx)                                #69.3
        vmovups   (%rcx), %zmm18                                #71.33
        vmovsd    (%rcx), %xmm1                                 #71.33
        vmovsd    8(%rcx), %xmm2                                #71.33
        vmovsd    16(%rcx), %xmm3                               #71.33
        vmovsd    24(%rcx), %xmm4                               #71.33
        vmovsd    32(%rcx), %xmm5                               #71.33
        vmovsd    40(%rcx), %xmm6                               #71.33
        vmovsd    48(%rcx), %xmm7                               #71.33
        vmovsd    56(%rcx), %xmm8                               #71.33
        vmovsd    %xmm1, 96(%rsp)                               #71.33[spill]
        vmovsd    %xmm2, 64(%rsp)                               #71.33[spill]
        vmovsd    %xmm3, 72(%rsp)                               #71.33[spill]
        vmovsd    %xmm4, 80(%rsp)                               #71.33[spill]
        vmovsd    %xmm5, 120(%rsp)                              #71.33[spill]
        vmovsd    %xmm6, 112(%rsp)                              #71.33[spill]
        vmovsd    %xmm7, 104(%rsp)                              #71.33[spill]
        vmovsd    %xmm8, 88(%rsp)                               #71.33[spill]
        vmovups   %zmm18, (%rsp)                                #71.33[spill]
        vzeroupper                                              #72.3
        call      putchar                                       #72.3
                                # LOE rbx r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
                                # Execution count [9.00e-01]
        movl      $.L_2__STRING.1, %edi                         #72.3
        movl      $1, %eax                                      #72.3
        vzeroupper                                              #72.3
        vmovsd    96(%rsp), %xmm0                               #72.3[spill]
..___tag_value_main.15:
#       printf(const char *, ...)
        call      printf                                        #72.3
..___tag_value_main.16:
                                # LOE rbx r12 r13 r14 r15
..B1.4:                         # Preds ..B1.3
                                # Execution count [9.00e-01]
        movl      $.L_2__STRING.1, %edi                         #72.3
        movl      $1, %eax                                      #72.3
        vzeroupper                                              #72.3
        vmovsd    64(%rsp), %xmm0                               #72.3[spill]
..___tag_value_main.18:
#       printf(const char *, ...)
        call      printf                                        #72.3
..___tag_value_main.19:
                                # LOE rbx r12 r13 r14 r15
..B1.5:                         # Preds ..B1.4
                                # Execution count [9.00e-01]
        movl      $.L_2__STRING.1, %edi                         #72.3
        movl      $1, %eax                                      #72.3
        vzeroupper                                              #72.3
        vmovsd    72(%rsp), %xmm0                               #72.3[spill]
..___tag_value_main.21:
#       printf(const char *, ...)
        call      printf                                        #72.3
..___tag_value_main.22:
                                # LOE rbx r12 r13 r14 r15
..B1.6:                         # Preds ..B1.5
                                # Execution count [9.00e-01]
        movl      $.L_2__STRING.1, %edi                         #72.3
        movl      $1, %eax                                      #72.3
        vzeroupper                                              #72.3
        vmovsd    80(%rsp), %xmm0                               #72.3[spill]
..___tag_value_main.24:
#       printf(const char *, ...)
        call      printf                                        #72.3
..___tag_value_main.25:
                                # LOE rbx r12 r13 r14 r15
..B1.7:                         # Preds ..B1.6
                                # Execution count [9.00e-01]
        movl      $.L_2__STRING.1, %edi                         #72.3
        movl      $1, %eax                                      #72.3
        vzeroupper                                              #72.3
        vmovsd    120(%rsp), %xmm0                              #72.3[spill]
..___tag_value_main.27:
#       printf(const char *, ...)
        call      printf                                        #72.3
..___tag_value_main.28:
                                # LOE rbx r12 r13 r14 r15
..B1.8:                         # Preds ..B1.7
                                # Execution count [9.00e-01]
        movl      $.L_2__STRING.1, %edi                         #72.3
        movl      $1, %eax                                      #72.3
        vzeroupper                                              #72.3
        vmovsd    112(%rsp), %xmm0                              #72.3[spill]
..___tag_value_main.30:
#       printf(const char *, ...)
        call      printf                                        #72.3
..___tag_value_main.31:
                                # LOE rbx r12 r13 r14 r15
..B1.9:                         # Preds ..B1.8
                                # Execution count [9.00e-01]
        movl      $.L_2__STRING.1, %edi                         #72.3
        movl      $1, %eax                                      #72.3
        vzeroupper                                              #72.3
        vmovsd    104(%rsp), %xmm0                              #72.3[spill]
..___tag_value_main.33:
#       printf(const char *, ...)
        call      printf                                        #72.3
..___tag_value_main.34:
                                # LOE rbx r12 r13 r14 r15
..B1.10:                        # Preds ..B1.9
                                # Execution count [9.00e-01]
        movl      $.L_2__STRING.1, %edi                         #72.3
        movl      $1, %eax                                      #72.3
        vzeroupper                                              #72.3
        vmovsd    88(%rsp), %xmm0                               #72.3[spill]
..___tag_value_main.36:
#       printf(const char *, ...)
        call      printf                                        #72.3
..___tag_value_main.37:
                                # LOE rbx r12 r13 r14 r15
..B1.11:                        # Preds ..B1.10
                                # Execution count [1.00e+00]
        vmovups   (%rsp), %zmm0                                 #73.21[spill]
..___tag_value_main.39:
#       vminpd512(__m512d)
        call      _Z9vminpd5127__m512d                          #73.21
..___tag_value_main.40:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.12:                        # Preds ..B1.11
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.2, %edi                         #74.3
        movl      $1, %eax                                      #74.3
..___tag_value_main.42:
#       printf(const char *, ...)
        call      printf                                        #74.3
..___tag_value_main.43:
                                # LOE rbx r12 r13 r14 r15
..B1.13:                        # Preds ..B1.12
                                # Execution count [1.00e+00]
        xorl      %eax, %eax                                    #75.10
        movq      %rbp, %rsp                                    #75.10
        popq      %rbp                                          #75.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #75.10
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
.L_2__routine_start__Z9vminpd5127__m512d_1:
# -- Begin  _Z9vminpd5127__m512d
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z9vminpd5127__m512d
# --- vminpd512(__m512d)
_Z9vminpd5127__m512d:
# parameter 1: %zmm0
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z9vminpd5127__m512d.47:
..L48:
                                                         #25.32
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vmovsd    -72(%rsp), %xmm1                              #26.20
        movl      $111, %ebx                                    #28.0
        .byte     100                                           #28.0
        .byte     103                                           #28.0
        .byte     144                                           #28.0
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vcomisd   -64(%rsp), %xmm1                              #30.20
        jbe       ..B2.3        # Prob 38%                      #30.20
                                # LOE rbx rbp r12 r13 r14 r15 xmm1 zmm0
..B2.2:                         # Preds ..B2.1
                                # Execution count [6.20e-01]
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vmovsd    -64(%rsp), %xmm1                              #31.19
                                # LOE rbx rbp r12 r13 r14 r15 xmm1 zmm0
..B2.3:                         # Preds ..B2.2 ..B2.1
                                # Execution count [1.00e+00]
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vcomisd   -56(%rsp), %xmm1                              #30.20
        jbe       ..B2.5        # Prob 38%                      #30.20
                                # LOE rbx rbp r12 r13 r14 r15 xmm1 zmm0
..B2.4:                         # Preds ..B2.3
                                # Execution count [6.20e-01]
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vmovsd    -56(%rsp), %xmm1                              #31.19
                                # LOE rbx rbp r12 r13 r14 r15 xmm1 zmm0
..B2.5:                         # Preds ..B2.4 ..B2.3
                                # Execution count [1.00e+00]
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vcomisd   -48(%rsp), %xmm1                              #30.20
        jbe       ..B2.7        # Prob 38%                      #30.20
                                # LOE rbx rbp r12 r13 r14 r15 xmm1 zmm0
..B2.6:                         # Preds ..B2.5
                                # Execution count [6.20e-01]
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vmovsd    -48(%rsp), %xmm1                              #31.19
                                # LOE rbx rbp r12 r13 r14 r15 xmm1 zmm0
..B2.7:                         # Preds ..B2.6 ..B2.5
                                # Execution count [1.00e+00]
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vcomisd   -40(%rsp), %xmm1                              #30.20
        jbe       ..B2.9        # Prob 38%                      #30.20
                                # LOE rbx rbp r12 r13 r14 r15 xmm1 zmm0
..B2.8:                         # Preds ..B2.7
                                # Execution count [6.20e-01]
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vmovsd    -40(%rsp), %xmm1                              #31.19
                                # LOE rbx rbp r12 r13 r14 r15 xmm1 zmm0
..B2.9:                         # Preds ..B2.8 ..B2.7
                                # Execution count [1.00e+00]
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vcomisd   -32(%rsp), %xmm1                              #30.20
        jbe       ..B2.11       # Prob 38%                      #30.20
                                # LOE rbx rbp r12 r13 r14 r15 xmm1 zmm0
..B2.10:                        # Preds ..B2.9
                                # Execution count [6.20e-01]
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vmovsd    -32(%rsp), %xmm1                              #31.19
                                # LOE rbx rbp r12 r13 r14 r15 xmm1 zmm0
..B2.11:                        # Preds ..B2.10 ..B2.9
                                # Execution count [1.00e+00]
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vcomisd   -24(%rsp), %xmm1                              #30.20
        jbe       ..B2.13       # Prob 38%                      #30.20
                                # LOE rbx rbp r12 r13 r14 r15 xmm1 zmm0
..B2.12:                        # Preds ..B2.11
                                # Execution count [6.20e-01]
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vmovsd    -24(%rsp), %xmm1                              #31.19
                                # LOE rbx rbp r12 r13 r14 r15 xmm1 zmm0
..B2.13:                        # Preds ..B2.12 ..B2.11
                                # Execution count [1.00e+00]
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vcomisd   -16(%rsp), %xmm1                              #30.20
        jbe       ..B2.15       # Prob 38%                      #30.20
                                # LOE rbx rbp r12 r13 r14 r15 xmm1 zmm0
..B2.14:                        # Preds ..B2.13
                                # Execution count [6.20e-01]
        vmovups   %zmm0, -72(%rsp)                              #34.1
        vmovsd    -16(%rsp), %xmm1                              #31.19
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.15:                        # Preds ..B2.14 ..B2.13
                                # Execution count [1.00e+00]
        vzeroupper                                              #33.10
        movl      $222, %ebx                                    #32.0
        .byte     100                                           #32.0
        .byte     103                                           #32.0
        .byte     144                                           #32.0
        vmovapd   %xmm1, %xmm0                                  #33.10
        ret                                                     #33.10
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z9vminpd5127__m512d,@function
	.size	_Z9vminpd5127__m512d,.-_Z9vminpd5127__m512d
..LN_Z9vminpd5127__m512d.1:
	.data
# -- End  _Z9vminpd5127__m512d
	.section .rodata, "a"
	.align 64
	.align 64
.L_2il0floatpacket.0:
	.long	0x9999999a,0x3ff19999,0x9999999a,0x3ff19999,0x9999999a,0x3ff19999,0x9999999a,0x3ff19999,0x9999999a,0x3ff19999,0x9999999a,0x3ff19999,0x9999999a,0x3ff19999,0x9999999a,0x3ff19999
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,64
	.align 32
.L_2il0floatpacket.1:
	.long	0x00000000,0x00000001,0x00000002,0x00000003,0x00000004,0x00000005,0x00000006,0x00000007
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,32
	.align 8
.L_2il0floatpacket.2:
	.long	0x00000000,0xc00c0000
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,8
	.align 8
.L_2il0floatpacket.3:
	.long	0x00000000,0xc0040000
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.1:
	.long	543583269
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,5
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.long	1936019978
	.long	540160309
	.long	1713709117
	.word	10
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,14
	.data
	.section .note.GNU-stack, ""
# End
