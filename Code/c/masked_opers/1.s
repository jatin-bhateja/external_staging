# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.1.0.166 Build 20191121";
# mark_description "";
# mark_description "-mavx512f -o 1.s -S";
	.file "copy_mask.c"
	.text
..TXTST0:
.L_2__routine_start_main_0:
# -- Begin  main
	.text
# mark_begin;
       .align    16,0x90
	.globl main
# --- main(int, char **)
main:
# parameter 1: %edi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value_main.1:
..L2:
                                                          #64.35
        pushq     %rbp                                          #64.35
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #64.35
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #64.35
        pushq     %r12                                          #64.35
        pushq     %r13                                          #64.35
        pushq     %r14                                          #64.35
        pushq     %r15                                          #64.35
        pushq     %rbx                                          #64.35
        subq      $88, %rsp                                     #64.35
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
        movq      %rsi, %r12                                    #64.35
        movl      %edi, %ebx                                    #64.35
        movl      $3, %edi                                      #64.35
        xorl      %esi, %esi                                    #64.35
        call      __intel_new_feature_proc_init                 #64.35
                                # LOE r12 ebx
..B1.51:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        vstmxcsr  (%rsp)                                        #64.35
        movl      $32768, %edi                                  #65.23
        movl      $64, %esi                                     #65.23
        orl       $32832, (%rsp)                                #64.35
        vldmxcsr  (%rsp)                                        #64.35
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #65.23
                                # LOE rax r12 ebx
..B1.50:                        # Preds ..B1.51
                                # Execution count [1.00e+00]
        movq      %rax, %r14                                    #65.23
                                # LOE r12 r14 ebx
..B1.2:                         # Preds ..B1.50
                                # Execution count [1.00e+00]
        movl      $32768, %edi                                  #66.23
        movl      $64, %esi                                     #66.23
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #66.23
                                # LOE rax r12 r14 ebx
..B1.52:                        # Preds ..B1.2
                                # Execution count [1.00e+00]
        movq      %rax, %r13                                    #66.23
                                # LOE r12 r13 r14 ebx
..B1.3:                         # Preds ..B1.52
                                # Execution count [1.00e+00]
        cmpl      $4, %ebx                                      #68.15
        je        ..B1.6        # Prob 63%                      #68.15
                                # LOE r12 r13 r14
..B1.4:                         # Preds ..B1.3
                                # Execution count [3.65e-01]
        movl      $il0_peep_printf_format_0, %edi               #69.5
        movq      stderr(%rip), %rsi                            #69.5
        call      fputs                                         #69.5
                                # LOE
..B1.5:                         # Preds ..B1.4
                                # Execution count [3.65e-01]
        movl      $-1, %eax                                     #70.12
        addq      $88, %rsp                                     #70.12
	.cfi_restore 3
        popq      %rbx                                          #70.12
	.cfi_restore 15
        popq      %r15                                          #70.12
	.cfi_restore 14
        popq      %r14                                          #70.12
	.cfi_restore 13
        popq      %r13                                          #70.12
	.cfi_restore 12
        popq      %r12                                          #70.12
        movq      %rbp, %rsp                                    #70.12
        popq      %rbp                                          #70.12
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #70.12
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
                                # LOE
..B1.6:                         # Preds ..B1.3
                                # Execution count [6.35e-01]
        movq      8(%r12), %rdi                                 #73.10
        call      atol                                          #73.10
                                # LOE rax r12 r13 r14
..B1.7:                         # Preds ..B1.6
                                # Execution count [6.35e-01]
        movslq    %eax, %rax                                    #73.10
        movq      8(%r12), %rdi                                 #74.10
        addq      %rax, %r14                                    #73.3
        call      atol                                          #74.10
                                # LOE rax r12 r13 r14
..B1.8:                         # Preds ..B1.7
                                # Execution count [6.35e-01]
        movslq    %eax, %rax                                    #74.10
        movq      16(%r12), %rdi                                #75.15
        addq      %rax, %r13                                    #74.3
        call      atol                                          #75.15
                                # LOE rax r12 r13 r14
..B1.55:                        # Preds ..B1.8
                                # Execution count [6.35e-01]
        movq      %rax, %rbx                                    #75.15
                                # LOE rbx r12 r13 r14
..B1.9:                         # Preds ..B1.55
                                # Execution count [6.35e-01]
        movq      8(%r12), %rdi                                 #77.3
        call      atol                                          #77.3
                                # LOE rax rbx r12 r13 r14
..B1.10:                        # Preds ..B1.9
                                # Execution count [6.35e-01]
        cmpl      $64, %eax                                     #77.3
        jge       ..B1.47       # Prob 0%                       #77.3
                                # LOE rbx r12 r13 r14
..B1.11:                        # Preds ..B1.10
                                # Execution count [5.68e-01]
        movq      %r14, %rdx                                    #79.3
        andq      $31, %rdx                                     #79.3
        je        ..B1.15       # Prob 50%                      #79.3
                                # LOE rdx rbx r12 r13 r14
..B1.12:                        # Preds ..B1.11
                                # Execution count [5.68e-01]
        negq      %rdx                                          #79.3
        xorl      %ecx, %ecx                                    #79.3
        addq      $32, %rdx                                     #79.3
        xorl      %eax, %eax                                    #79.3
                                # LOE rax rdx rbx r12 r13 r14 ecx
..B1.13:                        # Preds ..B1.13 ..B1.12
                                # Execution count [3.16e+00]
        movzbl    (%rax,%r14), %esi                             #79.3
        lea       1(%rcx,%rsi), %edi                            #79.3
        incl      %ecx                                          #79.3
        movb      %dil, (%rax,%r14)                             #79.3
        incq      %rax                                          #79.3
        cmpq      %rdx, %rcx                                    #79.3
        jb        ..B1.13       # Prob 82%                      #79.3
                                # LOE rax rdx rbx r12 r13 r14 ecx
..B1.15:                        # Preds ..B1.11 ..B1.13
                                # Execution count [5.68e-01]
        movq      %rdx, %rax                                    #79.3
        movl      %edx, %esi                                    #79.3
        negq      %rax                                          #79.3
        addq      $32768, %rax                                  #79.3
        andq      $63, %rax                                     #79.3
        negq      %rax                                          #79.3
        lea       1(%rsi), %edi                                 #79.3
        vpbroadcastd %edi, %zmm2                                #79.3
        lea       17(%rsi), %r8d                                #79.3
        vpbroadcastd %r8d, %zmm1                                #79.3
        vmovups   .L_2il0floatpacket.0(%rip), %zmm0             #79.3
        vpaddd    .L_2il0floatpacket.1(%rip), %zmm2, %zmm2      #79.3
        vpaddd    .L_2il0floatpacket.1(%rip), %zmm1, %zmm1      #79.3
        lea       32768(%rax), %rcx                             #79.3
                                # LOE rax rdx rcx rbx r12 r13 r14 esi zmm0 zmm1 zmm2
..B1.16:                        # Preds ..B1.16 ..B1.15
                                # Execution count [3.16e+00]
        vpaddd    %zmm0, %zmm2, %zmm9                           #79.3
        addl      $64, %esi                                     #79.3
        vpaddd    %zmm0, %zmm1, %zmm10                          #79.3
        vpmovdb   %zmm2, %xmm3                                  #79.3
        vpmovdb   %zmm9, %xmm2                                  #79.3
        vpmovdb   %zmm1, %xmm4                                  #79.3
        vpmovdb   %zmm10, %xmm1                                 #79.3
        vinserti128 $1, %xmm4, %ymm3, %ymm5                     #79.3
        vinserti128 $1, %xmm1, %ymm2, %ymm7                     #79.3
        vpaddb    (%rdx,%r14), %ymm5, %ymm6                     #79.3
        vpaddb    32(%rdx,%r14), %ymm7, %ymm8                   #79.3
        vpaddd    %zmm0, %zmm9, %zmm2                           #79.3
        vpaddd    %zmm0, %zmm10, %zmm1                          #79.3
        vmovdqu   %ymm6, (%rdx,%r14)                            #79.3
        vmovdqu   %ymm8, 32(%rdx,%r14)                          #79.3
        addq      $64, %rdx                                     #79.3
        cmpq      %rcx, %rsi                                    #79.3
        jb        ..B1.16       # Prob 82%                      #79.3
                                # LOE rax rdx rcx rbx r12 r13 r14 esi zmm0 zmm1 zmm2
..B1.17:                        # Preds ..B1.16
                                # Execution count [5.68e-01]
        xorl      %edi, %edi                                    #79.3
        lea       32769(%rax), %rdx                             #79.3
        xorl      %esi, %esi                                    #79.3
        cmpq      $32768, %rdx                                  #79.3
        ja        ..B1.21       # Prob 0%                       #79.3
                                # LOE rax rcx rbx rsi r12 r13 r14 edi zmm0
..B1.18:                        # Preds ..B1.17
                                # Execution count [5.68e-01]
        movl      %ecx, %edx                                    #79.3
        negq      %rcx                                          #79.3
        addq      $32768, %rcx                                  #79.3
        lea       32768(%r14,%rax), %rax                        #79.3
                                # LOE rax rcx rbx rsi r12 r13 r14 edx edi zmm0
..B1.19:                        # Preds ..B1.19 ..B1.18
                                # Execution count [3.16e+00]
        movzbl    (%rsi,%rax), %r8d                             #79.3
        lea       1(%rdx,%r8), %r9d                             #79.3
        addl      %edi, %r9d                                    #79.3
        incl      %edi                                          #79.3
        movb      %r9b, (%rsi,%rax)                             #79.3
        incq      %rsi                                          #79.3
        cmpq      %rcx, %rdi                                    #79.3
        jb        ..B1.19       # Prob 82%                      #79.3
                                # LOE rax rcx rbx rsi r12 r13 r14 edx edi zmm0
..B1.21:                        # Preds ..B1.19 ..B1.17
                                # Execution count [5.68e-01]
        movq      %r13, %rcx                                    #80.3
        andq      $31, %rcx                                     #80.3
        je        ..B1.25       # Prob 50%                      #80.3
                                # LOE rcx rbx r12 r13 r14 zmm0
..B1.22:                        # Preds ..B1.21
                                # Execution count [5.68e-01]
        negq      %rcx                                          #80.3
        xorl      %edx, %edx                                    #80.3
        addq      $32, %rcx                                     #80.3
        xorl      %eax, %eax                                    #80.3
                                # LOE rax rcx rbx r12 r13 r14 edx zmm0
..B1.23:                        # Preds ..B1.23 ..B1.22
                                # Execution count [3.16e+00]
        addb      %dl, (%rax,%r13)                              #80.3
        incq      %rax                                          #80.3
        incl      %edx                                          #80.3
        cmpq      %rcx, %rdx                                    #80.3
        jb        ..B1.23       # Prob 82%                      #80.3
                                # LOE rax rcx rbx r12 r13 r14 edx zmm0
..B1.25:                        # Preds ..B1.23 ..B1.21
                                # Execution count [5.68e-01]
        movq      %rcx, %r8                                     #80.3
        movl      %ecx, %edx                                    #80.3
        negq      %r8                                           #80.3
        addq      $32768, %r8                                   #80.3
        andq      $63, %r8                                      #80.3
        negq      %r8                                           #80.3
        lea       16(%rdx), %esi                                #80.3
        vpbroadcastd %edx, %zmm2                                #80.3
        vpbroadcastd %esi, %zmm1                                #80.3
        vpaddd    .L_2il0floatpacket.1(%rip), %zmm2, %zmm2      #80.3
        vpaddd    .L_2il0floatpacket.1(%rip), %zmm1, %zmm1      #80.3
        lea       32768(%r8), %rax                              #80.3
                                # LOE rax rcx rbx r8 r12 r13 r14 edx zmm0 zmm1 zmm2
..B1.26:                        # Preds ..B1.26 ..B1.25
                                # Execution count [3.16e+00]
        vpaddd    %zmm0, %zmm2, %zmm9                           #80.3
        addl      $64, %edx                                     #80.3
        vpaddd    %zmm0, %zmm1, %zmm10                          #80.3
        vpmovdb   %zmm2, %xmm3                                  #80.3
        vpmovdb   %zmm9, %xmm2                                  #80.3
        vpmovdb   %zmm1, %xmm4                                  #80.3
        vpmovdb   %zmm10, %xmm1                                 #80.3
        vinserti128 $1, %xmm4, %ymm3, %ymm5                     #80.3
        vinserti128 $1, %xmm1, %ymm2, %ymm7                     #80.3
        vpaddb    (%rcx,%r13), %ymm5, %ymm6                     #80.3
        vpaddb    32(%rcx,%r13), %ymm7, %ymm8                   #80.3
        vpaddd    %zmm0, %zmm9, %zmm2                           #80.3
        vpaddd    %zmm0, %zmm10, %zmm1                          #80.3
        vmovdqu   %ymm6, (%rcx,%r13)                            #80.3
        vmovdqu   %ymm8, 32(%rcx,%r13)                          #80.3
        addq      $64, %rcx                                     #80.3
        cmpq      %rax, %rdx                                    #80.3
        jb        ..B1.26       # Prob 82%                      #80.3
                                # LOE rax rcx rbx r8 r12 r13 r14 edx zmm0 zmm1 zmm2
..B1.27:                        # Preds ..B1.26
                                # Execution count [5.68e-01]
        xorl      %edi, %edi                                    #80.3
        lea       32769(%r8), %rdx                              #80.3
        xorl      %esi, %esi                                    #80.3
        cmpq      $32768, %rdx                                  #80.3
        ja        ..B1.31       # Prob 0%                       #80.3
                                # LOE rax rbx rsi r8 r12 r13 r14 edi
..B1.28:                        # Preds ..B1.27
                                # Execution count [5.68e-01]
        movl      %eax, %ecx                                    #80.3
        negq      %rax                                          #80.3
        addq      $32768, %rax                                  #80.3
        lea       32768(%r13,%r8), %rdx                         #80.3
                                # LOE rax rdx rbx rsi r12 r14 ecx edi
..B1.29:                        # Preds ..B1.29 ..B1.28
                                # Execution count [3.16e+00]
        movzbl    (%rsi,%rdx), %r8d                             #80.3
        addl      %ecx, %r8d                                    #80.3
        addl      %edi, %r8d                                    #80.3
        incl      %edi                                          #80.3
        movb      %r8b, (%rsi,%rdx)                             #80.3
        incq      %rsi                                          #80.3
        cmpq      %rax, %rdi                                    #80.3
        jb        ..B1.29       # Prob 82%                      #80.3
                                # LOE rax rdx rbx rsi r12 r14 ecx edi
..B1.31:                        # Preds ..B1.29 ..B1.27
                                # Execution count [6.31e-01]
        xorl      %r15d, %r15d                                  #82.12
        movq      24(%r12), %rdi                                #86.7
        xorl      %r13d, %r13d                                  #83.17
        vzeroupper                                              #86.7
        call      atol                                          #86.7
                                # LOE rax rbx r13 r14 r15
..B1.32:                        # Preds ..B1.31
                                # Execution count [6.31e-01]
        cmpl      $1, %eax                                      #86.24
        je        ..B1.41       # Prob 16%                      #86.24
                                # LOE rbx r13 r14 r15
..B1.33:                        # Preds ..B1.32
                                # Execution count [6.25e-02]
        xorl      %eax, %eax                                    #98.16
        movq      %r13, %rsi                                    #98.16
                                # LOE rbx rsi r14 r15 eax
..B1.34:                        # Preds ..B1.37 ..B1.33
                                # Execution count [5.30e+05]
        movl      %eax, (%rsp)                                  #101.17[spill]
        movq      %r14, %r13                                    #100.7
        movq      %rsi, 8(%rsp)                                 #101.17[spill]
        xorl      %r12d, %r12d                                  #101.17
                                # LOE rbx r13 r14 r15 r12d
..B1.35:                        # Preds ..B1.36 ..B1.34
                                # Execution count [5.43e+08]
        movq      %r13, %rdi                                    #102.17
        movq      %r13, %rsi                                    #102.17
        movq      %rbx, %rdx                                    #102.17
..___tag_value_main.27:
#       array_copy_512_unmasked(uint8_t *, uint8_t *, long)
        call      _Z23array_copy_512_unmaskedPhS_l              #102.17
..___tag_value_main.28:
                                # LOE rax rbx r13 r14 r15 r12d
..B1.36:                        # Preds ..B1.35
                                # Execution count [5.43e+08]
        addl      $32, %r12d                                    #101.38
        addq      %rax, %r15                                    #102.10
        addq      $32, %r13                                     #104.10
        cmpl      $32768, %r12d                                 #101.27
        jl        ..B1.35       # Prob 99%                      #101.27
                                # LOE rbx r13 r14 r15 r12d
..B1.37:                        # Preds ..B1.36
                                # Execution count [5.30e+05]
        movl      (%rsp), %eax                                  #[spill]
        incl      %eax                                          #98.34
        movq      8(%rsp), %rsi                                 #[spill]
        incq      %rsi                                          #107.7
        cmpl      $8388608, %eax                                #98.26
        jl        ..B1.34       # Prob 99%                      #98.26
                                # LOE rbx rsi r14 r15 eax
..B1.38:                        # Preds ..B1.45 ..B1.37
                                # Execution count [8.09e-02]
        movq      %rsi, %r13                                    #
                                # LOE r13 r15
..B1.39:                        # Preds ..B1.38
                                # Execution count [9.63e-02]
        movl      $.L_2__STRING.3, %edi                         #111.10
        movq      %r13, %rsi                                    #111.10
        movq      %r15, %rdx                                    #111.10
        xorl      %eax, %eax                                    #111.10
..___tag_value_main.31:
#       printf(const char *, ...)
        call      printf                                        #111.10
..___tag_value_main.32:
                                # LOE eax
..B1.40:                        # Preds ..B1.39
                                # Execution count [9.63e-02]
        addq      $88, %rsp                                     #111.10
	.cfi_restore 3
        popq      %rbx                                          #111.10
	.cfi_restore 15
        popq      %r15                                          #111.10
	.cfi_restore 14
        popq      %r14                                          #111.10
	.cfi_restore 13
        popq      %r13                                          #111.10
	.cfi_restore 12
        popq      %r12                                          #111.10
        movq      %rbp, %rsp                                    #111.10
        popq      %rbp                                          #111.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #111.10
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
                                # LOE
..B1.41:                        # Preds ..B1.32
                                # Execution count [1.56e-02]: Infreq
        xorl      %eax, %eax                                    #87.16
        movq      %r13, %rsi                                    #87.16
        movq      %rbx, %r13                                    #87.16
                                # LOE rsi r13 r14 r15 eax
..B1.42:                        # Preds ..B1.45 ..B1.41
                                # Execution count [1.01e+05]: Infreq
        movl      %eax, (%rsp)                                  #90.17[spill]
        movq      %r14, %rbx                                    #89.7
        movq      %rsi, 8(%rsp)                                 #90.17[spill]
        xorl      %r12d, %r12d                                  #90.17
                                # LOE rbx r13 r14 r15 r12d
..B1.43:                        # Preds ..B1.44 ..B1.42
                                # Execution count [1.03e+08]: Infreq
        movq      %rbx, %rdi                                    #91.17
        movq      %rbx, %rsi                                    #91.17
        movq      %r13, %rdx                                    #91.17
..___tag_value_main.49:
#       array_copy_512(uint8_t *, uint8_t *, long)
        call      _Z14array_copy_512PhS_l                       #91.17
..___tag_value_main.50:
                                # LOE rax rbx r13 r14 r15 r12d
..B1.44:                        # Preds ..B1.43
                                # Execution count [1.03e+08]: Infreq
        addl      $32, %r12d                                    #90.38
        addq      %rax, %r15                                    #91.10
        addq      $32, %rbx                                     #93.10
        cmpl      $32768, %r12d                                 #90.27
        jl        ..B1.43       # Prob 99%                      #90.27
                                # LOE rbx r13 r14 r15 r12d
..B1.45:                        # Preds ..B1.44
                                # Execution count [1.01e+05]: Infreq
        movl      (%rsp), %eax                                  #[spill]
        incl      %eax                                          #87.34
        movq      8(%rsp), %rsi                                 #[spill]
        incq      %rsi                                          #95.7
        cmpl      $8388608, %eax                                #87.26
        jl        ..B1.42       # Prob 99%                      #87.26
        jmp       ..B1.38       # Prob 100%                     #87.26
                                # LOE rsi r13 r14 r15 eax
..B1.47:                        # Preds ..B1.10
                                # Execution count [3.17e-03]: Infreq
        movl      $.L_2__STRING.1, %edi                         #77.3
        movl      $.L_2__STRING.2, %esi                         #77.3
        movl      $77, %edx                                     #77.3
        movl      $__$U0, %ecx                                  #77.3
#       __assert_fail(const char *, const char *, unsigned int, const char *)
        call      __assert_fail                                 #77.3
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.0:
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
il0_peep_printf_format_0:
	.long	1630481952
	.long	1008758896
	.long	1145323856
	.long	541544009
	.long	544370534
	.long	1646277686
	.long	543519865
	.long	1734962273
	.long	543450478
	.long	1869440365
	.long	540965234
	.long	1935764796
	.long	1008746091
	.long	1043345201
	.word	10
	.data
# -- End  main
	.text
.L_2__routine_start__Z23array_copy_512_unmaskedPhS_l_1:
# -- Begin  _Z23array_copy_512_unmaskedPhS_l
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z23array_copy_512_unmaskedPhS_l
# --- array_copy_512_unmasked(uint8_t *, uint8_t *, long)
_Z23array_copy_512_unmaskedPhS_l:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z23array_copy_512_unmaskedPhS_l.54:
..L55:
                                                         #37.72
        movq      %rdx, %rax                                    #37.72
        movq      %rdi, -24(%rsp)                               #37.72
        movq      %rsi, -16(%rsp)                               #37.72
        movq      -16(%rsp), %rdx                               #39.0
        movq      -24(%rsp), %rsi                               #39.0
        kmovq     %rax, %k2                                     #39.0
        vmovdqu32 (%rdx), %ymm0                                 #39.0
        vmovdqu32 %ymm0, (%rsi)                                 #39.0
        movq      (%rsi), %rax                                  #39.0
        vzeroupper                                              #49.11
        ret                                                     #49.11
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z23array_copy_512_unmaskedPhS_l,@function
	.size	_Z23array_copy_512_unmaskedPhS_l,.-_Z23array_copy_512_unmaskedPhS_l
..LN_Z23array_copy_512_unmaskedPhS_l.1:
	.data
# -- End  _Z23array_copy_512_unmaskedPhS_l
	.text
.L_2__routine_start__Z14array_copy_512PhS_l_2:
# -- Begin  _Z14array_copy_512PhS_l
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z14array_copy_512PhS_l
# --- array_copy_512(uint8_t *, uint8_t *, long)
_Z14array_copy_512PhS_l:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B3.1:                         # Preds ..B3.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z14array_copy_512PhS_l.57:
..L58:
                                                         #21.63
        movq      %rdx, %rax                                    #21.63
        movq      %rdi, -24(%rsp)                               #21.63
        movq      %rsi, -16(%rsp)                               #21.63
        movq      -16(%rsp), %rdx                               #23.0
        movq      -24(%rsp), %rsi                               #23.0
        kmovq     %rax, %k2                                     #23.0
        vmovdqu32 (%rdx), %ymm0{%k2}                            #23.0
        vmovdqu32 %ymm0, (%rsi){%k2}                            #23.0
        movq      (%rsi), %rax                                  #23.0
        vzeroupper                                              #33.11
        ret                                                     #33.11
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z14array_copy_512PhS_l,@function
	.size	_Z14array_copy_512PhS_l,.-_Z14array_copy_512PhS_l
..LN_Z14array_copy_512PhS_l.2:
	.data
# -- End  _Z14array_copy_512PhS_l
	.text
.L_2__routine_start__Z8init_memPcc_3:
# -- Begin  _Z8init_memPcc
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z8init_memPcc
# --- init_mem(char *, char)
_Z8init_memPcc:
# parameter 1: %rdi
# parameter 2: %esi
..B4.1:                         # Preds ..B4.0
                                # Execution count [9.00e-01]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z8init_memPcc.60:
..L61:
                                                         #58.37
        movq      %rdi, %r8                                     #58.37
        movq      %r8, %rax                                     #59.3
        movl      %esi, %r9d                                    #58.37
        andq      $31, %rax                                     #59.3
        je        ..B4.5        # Prob 50%                      #59.3
                                # LOE rax rbx rbp r8 r12 r13 r14 r15 r9d
..B4.2:                         # Preds ..B4.1
                                # Execution count [9.00e-01]
        negq      %rax                                          #59.3
        xorl      %ecx, %ecx                                    #59.3
        addq      $32, %rax                                     #59.3
        xorl      %edx, %edx                                    #59.3
                                # LOE rax rdx rbx rbp r8 r12 r13 r14 r15 ecx r9d
..B4.3:                         # Preds ..B4.3 ..B4.2
                                # Execution count [5.00e+00]
        movzbl    (%rdx,%r8), %esi                              #60.5
        addl      %r9d, %esi                                    #60.5
        addl      %ecx, %esi                                    #60.5
        incl      %ecx                                          #59.3
        movb      %sil, (%rdx,%r8)                              #60.5
        incq      %rdx                                          #59.3
        cmpq      %rax, %rcx                                    #59.3
        jb        ..B4.3        # Prob 82%                      #59.3
                                # LOE rax rdx rbx rbp r8 r12 r13 r14 r15 ecx r9d
..B4.5:                         # Preds ..B4.1 ..B4.3
                                # Execution count [9.00e-01]
        movq      %rax, %rsi                                    #59.3
        movl      %eax, %edx                                    #59.3
        negq      %rsi                                          #59.3
        vmovd     %r9d, %xmm0                                   #60.16
        addq      $32768, %rsi                                  #59.3
        andq      $63, %rsi                                     #59.3
        negq      %rsi                                          #59.3
        lea       16(%rdx), %ecx                                #60.5
        vpbroadcastd %edx, %zmm2                                #60.5
        vpbroadcastd %ecx, %zmm1                                #60.5
        vmovups   .L_2il0floatpacket.0(%rip), %zmm3             #60.5
        vpaddd    .L_2il0floatpacket.1(%rip), %zmm2, %zmm2      #60.5
        vpaddd    .L_2il0floatpacket.1(%rip), %zmm1, %zmm1      #60.5
        vpbroadcastb %xmm0, %ymm0                               #60.16
        lea       32768(%rsi), %rdi                             #59.3
                                # LOE rax rbx rbp rsi rdi r8 r12 r13 r14 r15 edx r9d ymm0 zmm1 zmm2 zmm3
..B4.6:                         # Preds ..B4.6 ..B4.5
                                # Execution count [5.00e+00]
        vpaddd    %zmm3, %zmm2, %zmm12                          #60.5
        addl      $64, %edx                                     #59.3
        vpaddd    %zmm3, %zmm1, %zmm13                          #60.5
        vpmovdb   %zmm2, %xmm4                                  #60.5
        vpmovdb   %zmm12, %xmm2                                 #60.5
        vpmovdb   %zmm1, %xmm5                                  #60.5
        vpmovdb   %zmm13, %xmm1                                 #60.5
        vinserti128 $1, %xmm5, %ymm4, %ymm6                     #60.5
        vinserti128 $1, %xmm1, %ymm2, %ymm9                     #60.5
        vpaddb    %ymm6, %ymm0, %ymm7                           #60.22
        vpaddb    %ymm9, %ymm0, %ymm10                          #60.22
        vpaddd    %zmm3, %zmm12, %zmm2                          #60.5
        vpaddd    %zmm3, %zmm13, %zmm1                          #60.5
        vpaddb    (%rax,%r8), %ymm7, %ymm8                      #60.5
        vpaddb    32(%rax,%r8), %ymm10, %ymm11                  #60.5
        vmovdqu   %ymm8, (%rax,%r8)                             #60.5
        vmovdqu   %ymm11, 32(%rax,%r8)                          #60.5
        addq      $64, %rax                                     #59.3
        cmpq      %rdi, %rdx                                    #59.3
        jb        ..B4.6        # Prob 82%                      #59.3
                                # LOE rax rbx rbp rsi rdi r8 r12 r13 r14 r15 edx r9d ymm0 zmm1 zmm2 zmm3
..B4.7:                         # Preds ..B4.6
                                # Execution count [9.00e-01]
        xorl      %ecx, %ecx                                    #59.3
        lea       32769(%rsi), %rax                             #59.3
        xorl      %edx, %edx                                    #59.3
        cmpq      $32768, %rax                                  #59.3
        ja        ..B4.11       # Prob 0%                       #59.3
                                # LOE rdx rbx rbp rsi rdi r8 r12 r13 r14 r15 ecx r9d
..B4.8:                         # Preds ..B4.7
                                # Execution count [9.00e-01]
        movl      %edi, %eax                                    #60.5
        negq      %rdi                                          #59.3
        addq      $32768, %rdi                                  #59.3
        lea       32768(%r8,%rsi), %rsi                         #60.5
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 eax ecx r9d
..B4.9:                         # Preds ..B4.9 ..B4.8
                                # Execution count [5.00e+00]
        movzbl    (%rdx,%rsi), %r8d                             #60.5
        addl      %r9d, %r8d                                    #60.5
        addl      %eax, %r8d                                    #60.5
        addl      %ecx, %r8d                                    #60.5
        incl      %ecx                                          #59.3
        movb      %r8b, (%rdx,%rsi)                             #60.5
        incq      %rdx                                          #59.3
        cmpq      %rdi, %rcx                                    #59.3
        jb        ..B4.9        # Prob 82%                      #59.3
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 eax ecx r9d
..B4.11:                        # Preds ..B4.9 ..B4.7
                                # Execution count [1.00e+00]
        vzeroupper                                              #61.1
        ret                                                     #61.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z8init_memPcc,@function
	.size	_Z8init_memPcc,.-_Z8init_memPcc
..LN_Z8init_memPcc.3:
	.data
# -- End  _Z8init_memPcc
	.section .rodata, "a"
	.align 64
	.align 64
.L_2il0floatpacket.0:
	.long	0x00000020,0x00000020,0x00000020,0x00000020,0x00000020,0x00000020,0x00000020,0x00000020,0x00000020,0x00000020,0x00000020,0x00000020,0x00000020,0x00000020,0x00000020,0x00000020
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,64
	.align 64
.L_2il0floatpacket.1:
	.long	0x00000000,0x00000001,0x00000002,0x00000003,0x00000004,0x00000005,0x00000006,0x00000007,0x00000008,0x00000009,0x0000000a,0x0000000b,0x0000000c,0x0000000d,0x0000000e,0x0000000f
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,64
	.align 1
__$U0:
	.long	544501353
	.long	1852399981
	.long	1953392936
	.long	1751326764
	.long	706769505
	.word	10538
	.byte	0
	.type	__$U0,@object
	.size	__$U0,23
	.section .rodata.str1.4, "aMS",@progbits,1
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.3:
	.long	1702127963
	.long	975205234
	.long	1684808992
	.long	1699881053
	.long	540876915
	.long	174353445
	.byte	0
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,25
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.long	1768911969
	.long	1735549224
	.long	1563515766
	.long	540811305
	.word	13366
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,19
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.long	2037411683
	.long	1935764831
	.long	6499947
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,12
	.data
	.section .note.GNU-stack, ""
# End
