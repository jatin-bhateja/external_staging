# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "";
# mark_description "-O3 -mavx2 -S -o VecMaxR_icpc_vex.s";
	.file "VecMaxR.cpp"
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
                                                          #71.12
        pushq     %rbp                                          #71.12
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #71.12
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #71.12
        pushq     %rbx                                          #71.12
        subq      $120, %rsp                                    #71.12
        xorl      %esi, %esi                                    #71.12
        movl      $3, %edi                                      #71.12
        call      __intel_new_feature_proc_init                 #71.12
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
                                # LOE r12 r13 r14 r15
..B1.26:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        vstmxcsr  (%rsp)                                        #71.12
        movl      $64, %edi                                     #72.26
        movl      $32, %esi                                     #72.26
        orl       $32832, (%rsp)                                #71.12
        vldmxcsr  (%rsp)                                        #71.12
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #72.26
                                # LOE rax r12 r13 r14 r15
..B1.25:                        # Preds ..B1.26
                                # Execution count [1.00e+00]
        movq      %rax, %rbx                                    #72.26
                                # LOE rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.25
                                # Execution count [1.00e+00]
        vmovdqu   .L_2il0floatpacket.0(%rip), %ymm2             #74.5
        movl      $10, %edi                                     #86.3
        vmovups   .L_2il0floatpacket.1(%rip), %ymm4             #74.19
        vcvtdq2ps %ymm2, %ymm0                                  #74.15
        vpaddd    .L_2il0floatpacket.2(%rip), %ymm2, %ymm3      #74.15
        vaddps    %ymm0, %ymm4, %ymm1                           #74.19
        vcvtdq2ps %ymm3, %ymm5                                  #74.15
        vmovups   %ymm1, (%rbx)                                 #74.5
        vaddps    %ymm5, %ymm4, %ymm6                           #74.19
        vmovss    (%rbx), %xmm7                                 #85.33
        movl      $-1067450368, 28(%rbx)                        #75.3
        movl      $-1071644672, 12(%rbx)                        #76.3
        vmovups   (%rbx), %ymm15                                #85.33
        vmovss    4(%rbx), %xmm8                                #85.33
        vmovss    8(%rbx), %xmm9                                #85.33
        vmovss    12(%rbx), %xmm10                              #85.33
        vmovss    16(%rbx), %xmm11                              #85.33
        vmovss    20(%rbx), %xmm12                              #85.33
        vmovss    24(%rbx), %xmm13                              #85.33
        vmovss    28(%rbx), %xmm14                              #85.33
        vmovups   %ymm6, 32(%rbx)                               #74.5
        vmovss    %xmm7, 40(%rsp)                               #85.33[spill]
        vmovss    %xmm8, 56(%rsp)                               #85.33[spill]
        vmovss    %xmm9, 88(%rsp)                               #85.33[spill]
        vmovss    %xmm10, 64(%rsp)                              #85.33[spill]
        vmovss    %xmm11, 32(%rsp)                              #85.33[spill]
        vmovss    %xmm12, 48(%rsp)                              #85.33[spill]
        vmovss    %xmm13, 72(%rsp)                              #85.33[spill]
        vmovss    %xmm14, 80(%rsp)                              #85.33[spill]
        vmovups   %ymm15, (%rsp)                                #85.33[spill]
        vzeroupper                                              #86.3
        call      putchar                                       #86.3
                                # LOE rbx r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #86.3[spill]
        movl      $.L_2__STRING.1, %edi                         #86.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #86.3
        vcvtss2sd 40(%rsp), %xmm0, %xmm0                        #86.3[spill]
        movl      $1, %eax                                      #86.3
        vzeroupper                                              #86.3
..___tag_value_main.18:
#       printf(const char *, ...)
        call      printf                                        #86.3
..___tag_value_main.19:
                                # LOE rbx r12 r13 r14 r15
..B1.4:                         # Preds ..B1.3
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #86.3[spill]
        movl      $.L_2__STRING.1, %edi                         #86.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #86.3
        vcvtss2sd 56(%rsp), %xmm0, %xmm0                        #86.3[spill]
        movl      $1, %eax                                      #86.3
        vzeroupper                                              #86.3
..___tag_value_main.22:
#       printf(const char *, ...)
        call      printf                                        #86.3
..___tag_value_main.23:
                                # LOE rbx r12 r13 r14 r15
..B1.5:                         # Preds ..B1.4
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #86.3[spill]
        movl      $.L_2__STRING.1, %edi                         #86.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #86.3
        vcvtss2sd 88(%rsp), %xmm0, %xmm0                        #86.3[spill]
        movl      $1, %eax                                      #86.3
        vzeroupper                                              #86.3
..___tag_value_main.26:
#       printf(const char *, ...)
        call      printf                                        #86.3
..___tag_value_main.27:
                                # LOE rbx r12 r13 r14 r15
..B1.6:                         # Preds ..B1.5
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #86.3[spill]
        movl      $.L_2__STRING.1, %edi                         #86.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #86.3
        vcvtss2sd 64(%rsp), %xmm0, %xmm0                        #86.3[spill]
        movl      $1, %eax                                      #86.3
        vzeroupper                                              #86.3
..___tag_value_main.30:
#       printf(const char *, ...)
        call      printf                                        #86.3
..___tag_value_main.31:
                                # LOE rbx r12 r13 r14 r15
..B1.7:                         # Preds ..B1.6
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #86.3[spill]
        movl      $.L_2__STRING.1, %edi                         #86.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #86.3
        vcvtss2sd 32(%rsp), %xmm0, %xmm0                        #86.3[spill]
        movl      $1, %eax                                      #86.3
        vzeroupper                                              #86.3
..___tag_value_main.34:
#       printf(const char *, ...)
        call      printf                                        #86.3
..___tag_value_main.35:
                                # LOE rbx r12 r13 r14 r15
..B1.8:                         # Preds ..B1.7
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #86.3[spill]
        movl      $.L_2__STRING.1, %edi                         #86.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #86.3
        vcvtss2sd 48(%rsp), %xmm0, %xmm0                        #86.3[spill]
        movl      $1, %eax                                      #86.3
        vzeroupper                                              #86.3
..___tag_value_main.38:
#       printf(const char *, ...)
        call      printf                                        #86.3
..___tag_value_main.39:
                                # LOE rbx r12 r13 r14 r15
..B1.9:                         # Preds ..B1.8
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #86.3[spill]
        movl      $.L_2__STRING.1, %edi                         #86.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #86.3
        vcvtss2sd 72(%rsp), %xmm0, %xmm0                        #86.3[spill]
        movl      $1, %eax                                      #86.3
        vzeroupper                                              #86.3
..___tag_value_main.42:
#       printf(const char *, ...)
        call      printf                                        #86.3
..___tag_value_main.43:
                                # LOE rbx r12 r13 r14 r15
..B1.10:                        # Preds ..B1.9
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #86.3[spill]
        movl      $.L_2__STRING.1, %edi                         #86.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #86.3
        vcvtss2sd 80(%rsp), %xmm0, %xmm0                        #86.3[spill]
        movl      $1, %eax                                      #86.3
        vzeroupper                                              #86.3
..___tag_value_main.46:
#       printf(const char *, ...)
        call      printf                                        #86.3
..___tag_value_main.47:
                                # LOE rbx r12 r13 r14 r15
..B1.11:                        # Preds ..B1.10
                                # Execution count [1.00e+00]
        vmovups   (%rsp), %ymm0                                 #87.20[spill]
..___tag_value_main.48:
#       vmaxps256(__m256)
        call      _Z9vmaxps2566__m256                           #87.20
..___tag_value_main.49:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.27:                        # Preds ..B1.11
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.2, %edi                         #88.3
        movl      $1, %eax                                      #88.3
        vcvtss2sd %xmm0, %xmm0, %xmm0                           #88.3
..___tag_value_main.51:
#       printf(const char *, ...)
        call      printf                                        #88.3
..___tag_value_main.52:
                                # LOE rbx r12 r13 r14 r15
..B1.12:                        # Preds ..B1.27
                                # Execution count [1.00e+00]
        vmovss    (%rbx), %xmm0                                 #90.30
        movl      $10, %edi                                     #91.3
        vmovss    4(%rbx), %xmm1                                #90.30
        vmovss    8(%rbx), %xmm2                                #90.30
        vmovss    12(%rbx), %xmm3                               #90.30
        vmovups   (%rbx), %xmm4                                 #90.30
        vmovss    %xmm0, 40(%rsp)                               #90.30[spill]
        vmovss    %xmm1, 32(%rsp)                               #90.30[spill]
        vmovss    %xmm2, 24(%rsp)                               #90.30[spill]
        vmovss    %xmm3, 16(%rsp)                               #90.30[spill]
        vmovups   %xmm4, (%rsp)                                 #90.30[spill]
        call      putchar                                       #91.3
                                # LOE r12 r13 r14 r15
..B1.13:                        # Preds ..B1.12
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %xmm0                                 #91.3[spill]
        movl      $.L_2__STRING.1, %edi                         #91.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #91.3
        movl      $1, %eax                                      #91.3
        vcvtss2sd 40(%rsp), %xmm0, %xmm0                        #91.3[spill]
        vmovsd    %xmm0, 48(%rsp)                               #91.3[spill]
..___tag_value_main.60:
#       printf(const char *, ...)
        call      printf                                        #91.3
..___tag_value_main.61:
                                # LOE r12 r13 r14 r15
..B1.14:                        # Preds ..B1.13
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %xmm0                                 #91.3[spill]
        movl      $.L_2__STRING.1, %edi                         #91.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #91.3
        movl      $1, %eax                                      #91.3
        vcvtss2sd 32(%rsp), %xmm0, %xmm0                        #91.3[spill]
        vmovsd    %xmm0, 40(%rsp)                               #91.3[spill]
..___tag_value_main.65:
#       printf(const char *, ...)
        call      printf                                        #91.3
..___tag_value_main.66:
                                # LOE r12 r13 r14 r15
..B1.15:                        # Preds ..B1.14
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %xmm0                                 #91.3[spill]
        movl      $.L_2__STRING.1, %edi                         #91.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #91.3
        movl      $1, %eax                                      #91.3
        vcvtss2sd 24(%rsp), %xmm0, %xmm0                        #91.3[spill]
..___tag_value_main.69:
#       printf(const char *, ...)
        call      printf                                        #91.3
..___tag_value_main.70:
                                # LOE r12 r13 r14 r15
..B1.16:                        # Preds ..B1.15
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %xmm0                                 #91.3[spill]
        movl      $.L_2__STRING.1, %edi                         #91.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #91.3
        movl      $1, %eax                                      #91.3
        vcvtss2sd 16(%rsp), %xmm0, %xmm0                        #91.3[spill]
..___tag_value_main.73:
#       printf(const char *, ...)
        call      printf                                        #91.3
..___tag_value_main.74:
                                # LOE r12 r13 r14 r15
..B1.17:                        # Preds ..B1.16
                                # Execution count [1.00e+00]
        vmovups   (%rsp), %xmm0                                 #92.20[spill]
..___tag_value_main.76:
#       vmaxps128(__m128)
        call      _Z9vmaxps1286__m128                           #92.20
..___tag_value_main.77:
                                # LOE r12 r13 r14 r15 xmm0
..B1.28:                        # Preds ..B1.17
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.3, %edi                         #93.3
        movl      $1, %eax                                      #93.3
        vcvtss2sd %xmm0, %xmm0, %xmm0                           #93.3
..___tag_value_main.79:
#       printf(const char *, ...)
        call      printf                                        #93.3
..___tag_value_main.80:
                                # LOE r12 r13 r14 r15
..B1.18:                        # Preds ..B1.28
                                # Execution count [1.00e+00]
        movl      $10, %edi                                     #95.3
        call      putchar                                       #95.3
                                # LOE r12 r13 r14 r15
..B1.19:                        # Preds ..B1.18
                                # Execution count [1.80e+00]
        movl      $.L_2__STRING.1, %edi                         #95.3
        movl      $1, %eax                                      #95.3
        vmovsd    48(%rsp), %xmm0                               #95.3[spill]
..___tag_value_main.81:
#       printf(const char *, ...)
        call      printf                                        #95.3
..___tag_value_main.82:
                                # LOE r12 r13 r14 r15
..B1.20:                        # Preds ..B1.19
                                # Execution count [1.80e+00]
        movl      $.L_2__STRING.1, %edi                         #95.3
        movl      $1, %eax                                      #95.3
        vmovsd    40(%rsp), %xmm0                               #95.3[spill]
..___tag_value_main.84:
#       printf(const char *, ...)
        call      printf                                        #95.3
..___tag_value_main.85:
                                # LOE r12 r13 r14 r15
..B1.21:                        # Preds ..B1.20
                                # Execution count [1.00e+00]
        vmovups   (%rsp), %xmm0                                 #96.19[spill]
..___tag_value_main.87:
#       vmaxps64(__m128)
        call      _Z8vmaxps646__m128                            #96.19
..___tag_value_main.88:
                                # LOE r12 r13 r14 r15 xmm0
..B1.29:                        # Preds ..B1.21
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.4, %edi                         #97.3
        movl      $1, %eax                                      #97.3
        vcvtss2sd %xmm0, %xmm0, %xmm0                           #97.3
..___tag_value_main.90:
#       printf(const char *, ...)
        call      printf                                        #97.3
..___tag_value_main.91:
                                # LOE r12 r13 r14 r15
..B1.22:                        # Preds ..B1.29
                                # Execution count [1.00e+00]
        xorl      %eax, %eax                                    #99.10
        addq      $120, %rsp                                    #99.10
	.cfi_restore 3
        popq      %rbx                                          #99.10
        movq      %rbp, %rsp                                    #99.10
        popq      %rbp                                          #99.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #99.10
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
.L_2__routine_start__Z9vmaxps2566__m256_1:
# -- Begin  _Z9vmaxps2566__m256
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z9vmaxps2566__m256
# --- vmaxps256(__m256)
_Z9vmaxps2566__m256:
# parameter 1: %ymm0
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z9vmaxps2566__m256.96:
..L97:
                                                         #38.29
        pushq     %rbp                                          #38.29
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #38.29
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-32, %rsp                                    #38.29
        vperm2f128 $1, %ymm0, %ymm0, %ymm1                      #39.21
        vminps    %ymm1, %ymm0, %ymm2                           #40.15
        vshufps   $14, %ymm2, %ymm2, %ymm3                      #41.19
        vminps    %ymm3, %ymm2, %ymm4                           #42.15
        vshufps   $1, %ymm4, %ymm4, %ymm5                       #43.19
        vminps    %ymm5, %ymm4, %ymm6                           #44.15
        vmovups   %ymm6, -32(%rsp)                              #44.13
        vmovss    -32(%rsp), %xmm0                              #45.13
        vzeroupper                                              #45.13
        movq      %rbp, %rsp                                    #45.13
        popq      %rbp                                          #45.13
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #45.13
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z9vmaxps2566__m256,@function
	.size	_Z9vmaxps2566__m256,.-_Z9vmaxps2566__m256
..LN_Z9vmaxps2566__m256.1:
	.data
# -- End  _Z9vmaxps2566__m256
	.text
.L_2__routine_start__Z9vmaxps1286__m128_2:
# -- Begin  _Z9vmaxps1286__m128
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z9vmaxps1286__m128
# --- vmaxps128(__m128)
_Z9vmaxps1286__m128:
# parameter 1: %xmm0
..B3.1:                         # Preds ..B3.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z9vmaxps1286__m128.104:
..L105:
                                                        #49.29
        vshufps   $14, %xmm0, %xmm0, %xmm1                      #50.19
        vminps    %xmm1, %xmm0, %xmm2                           #51.15
        vshufps   $1, %xmm2, %xmm2, %xmm3                       #52.19
        vminps    %xmm3, %xmm2, %xmm0                           #53.15
        ret                                                     #54.13
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z9vmaxps1286__m128,@function
	.size	_Z9vmaxps1286__m128,.-_Z9vmaxps1286__m128
..LN_Z9vmaxps1286__m128.2:
	.data
# -- End  _Z9vmaxps1286__m128
	.text
.L_2__routine_start__Z8vmaxps646__m128_3:
# -- Begin  _Z8vmaxps646__m128
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z8vmaxps646__m128
# --- vmaxps64(__m128)
_Z8vmaxps646__m128:
# parameter 1: %xmm0
..B4.1:                         # Preds ..B4.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z8vmaxps646__m128.107:
..L108:
                                                        #58.28
        vshufps   $1, %xmm0, %xmm0, %xmm1                       #59.19
        vminps    %xmm1, %xmm0, %xmm0                           #60.15
        ret                                                     #61.13
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z8vmaxps646__m128,@function
	.size	_Z8vmaxps646__m128,.-_Z8vmaxps646__m128
..LN_Z8vmaxps646__m128.3:
	.data
# -- End  _Z8vmaxps646__m128
	.section .rodata, "a"
	.align 32
	.align 32
.L_2il0floatpacket.0:
	.long	0x00000000,0x00000001,0x00000002,0x00000003,0x00000004,0x00000005,0x00000006,0x00000007
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,32
	.align 32
.L_2il0floatpacket.1:
	.long	0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,32
	.align 32
.L_2il0floatpacket.2:
	.long	0x00000008,0x00000008,0x00000008,0x00000008,0x00000008,0x00000008,0x00000008,0x00000008
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,32
	.align 4
.L_2il0floatpacket.3:
	.long	0xc0600000
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,4
	.align 4
.L_2il0floatpacket.4:
	.long	0xc0200000
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,4
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.1:
	.long	2123301
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,4
	.align 4
.L_2__STRING.2:
	.long	1936019978
	.long	540423474
	.long	1713709117
	.word	10
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,14
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.3:
	.long	1936019978
	.long	540553777
	.long	1713709117
	.word	10
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,14
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.4:
	.long	1936019978
	.long	1025520694
	.long	174466336
	.byte	0
	.type	.L_2__STRING.4,@object
	.size	.L_2__STRING.4,13
	.data
	.section .note.GNU-stack, ""
# End
