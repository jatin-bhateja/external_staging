# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "";
# mark_description "-mavx512f -S";
	.file "copy.c"
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
                                                          #122.35
        pushq     %rbp                                          #122.35
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #122.35
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #122.35
        subq      $128, %rsp                                    #122.35
        xorl      %esi, %esi                                    #122.35
        movl      $3, %edi                                      #122.35
        call      __intel_new_feature_proc_init                 #122.35
                                # LOE rbx r12 r13 r14 r15
..B1.23:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        vstmxcsr  (%rsp)                                        #122.35
        movl      $536870912, %edi                              #123.21
        orl       $32832, (%rsp)                                #122.35
        vldmxcsr  (%rsp)                                        #122.35
#       malloc(size_t)
        call      malloc                                        #123.21
                                # LOE rax rbx r12 r13 r14 r15
..B1.22:                        # Preds ..B1.23
                                # Execution count [1.00e+00]
        movq      %rax, %rdx                                    #123.21
                                # LOE rdx rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.22
                                # Execution count [9.00e-01]
        movq      %rdx, %rsi                                    #124.3
        andq      $63, %rsi                                     #124.3
        je        ..B1.7        # Prob 50%                      #124.3
                                # LOE rdx rbx rsi r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
                                # Execution count [9.00e-01]
        testq     $3, %rsi                                      #124.3
        jne       ..B1.19       # Prob 10%                      #124.3
                                # LOE rdx rbx rsi r12 r13 r14 r15
..B1.4:                         # Preds ..B1.3
                                # Execution count [9.00e-01]
        negq      %rsi                                          #124.3
        xorl      %ecx, %ecx                                    #124.3
        addq      $64, %rsi                                     #124.3
        xorl      %eax, %eax                                    #124.3
        shrq      $2, %rsi                                      #124.3
        vmovups   .L_2il0floatpacket.0(%rip), %zmm0             #124.3
        vmovups   .L_2il0floatpacket.1(%rip), %zmm3             #124.3
        vmovups   .L_2il0floatpacket.2(%rip), %zmm2             #125.18
        vpbroadcastq %rsi, %zmm1                                #124.3
                                # LOE rax rdx rbx rsi r12 r13 r14 r15 ecx zmm0 zmm1 zmm2 zmm3
..B1.5:                         # Preds ..B1.5 ..B1.4
                                # Execution count [5.00e+00]
        addl      $16, %ecx                                     #124.3
        valignd   $8, %zmm3, %zmm3, %zmm5                       #124.3
        vpmovsxdq %ymm3, %zmm4                                  #124.3
        vpaddd    %zmm0, %zmm3, %zmm3                           #124.3
        vpcmpuq   $6, %zmm4, %zmm1, %k1                         #124.3
        vpmovsxdq %ymm5, %zmm6                                  #124.3
        vpcmpuq   $6, %zmm6, %zmm1, %k0                         #124.3
        kunpckbw  %k1, %k0, %k2                                 #124.3
        vmovdqu32 %zmm2, (%rdx,%rax,4){%k2}                     #125.5
        addq      $16, %rax                                     #124.3
        vpaddd    %zmm0, %zmm2, %zmm2                           #125.18
        cmpq      %rsi, %rcx                                    #124.3
        jb        ..B1.5        # Prob 82%                      #124.3
        jmp       ..B1.8        # Prob 100%                     #124.3
                                # LOE rax rdx rbx rsi r12 r13 r14 r15 ecx zmm0 zmm1 zmm2 zmm3
..B1.7:                         # Preds ..B1.2
                                # Execution count [4.50e-01]
        vmovups   .L_2il0floatpacket.0(%rip), %zmm0             #125.18
                                # LOE rdx rbx rsi r12 r13 r14 r15 zmm0
..B1.8:                         # Preds ..B1.5 ..B1.7
                                # Execution count [9.00e-01]
        movl      %esi, %ecx                                    #124.3
        movq      %rsi, %rax                                    #124.3
        negq      %rax                                          #124.3
        addq      $134217728, %rax                              #124.3
        andq      $15, %rax                                     #124.3
        negq      %rax                                          #124.3
        lea       10(%rcx), %edi                                #125.18
        vpbroadcastd %edi, %zmm1                                #125.18
        addq      $134217728, %rax                              #124.3
        vpaddd    .L_2il0floatpacket.3(%rip), %zmm1, %zmm1      #125.18
                                # LOE rax rdx rbx rsi r12 r13 r14 r15 ecx zmm0 zmm1
..B1.9:                         # Preds ..B1.9 ..B1.8
                                # Execution count [5.00e+00]
        addl      $16, %ecx                                     #124.3
        vmovntdq  %zmm1, (%rdx,%rsi,4)                          #125.5
        addq      $16, %rsi                                     #124.3
        vpaddd    %zmm0, %zmm1, %zmm1                           #125.18
        cmpq      %rax, %rcx                                    #124.3
        jb        ..B1.9        # Prob 82%                      #124.3
                                # LOE rax rdx rbx rsi r12 r13 r14 r15 ecx zmm0 zmm1
..B1.10:                        # Preds ..B1.9
                                # Execution count [5.00e+00]
        mfence                                                  #124.3
                                # LOE rax rdx rbx r12 r13 r14 r15
..B1.11:                        # Preds ..B1.10 ..B1.19
                                # Execution count [9.00e-01]
        lea       1(%rax), %rcx                                 #124.3
        cmpq      $134217728, %rcx                              #124.3
        ja        ..B1.15       # Prob 50%                      #124.3
                                # LOE rax rdx rbx r12 r13 r14 r15
..B1.12:                        # Preds ..B1.11
                                # Execution count [9.00e-01]
        movl      %eax, %ecx                                    #125.18
        lea       (%rdx,%rax,4), %rsi                           #125.5
        addl      $10, %ecx                                     #125.18
        negq      %rax                                          #124.3
        vpbroadcastd %ecx, %zmm0                                #125.18
        addq      $134217728, %rax                              #124.3
        vmovups   .L_2il0floatpacket.0(%rip), %zmm3             #124.3
        vmovups   .L_2il0floatpacket.1(%rip), %zmm2             #124.3
        vpaddd    .L_2il0floatpacket.3(%rip), %zmm0, %zmm1      #125.18
        vpbroadcastq %rax, %zmm0                                #124.3
        xorl      %edi, %edi                                    #124.3
        xorl      %ecx, %ecx                                    #124.3
                                # LOE rax rdx rcx rbx rsi r12 r13 r14 r15 edi zmm0 zmm1 zmm2 zmm3
..B1.13:                        # Preds ..B1.13 ..B1.12
                                # Execution count [5.00e+00]
        addl      $16, %edi                                     #124.3
        valignd   $8, %zmm2, %zmm2, %zmm5                       #124.3
        vpmovsxdq %ymm2, %zmm4                                  #124.3
        vpaddd    %zmm3, %zmm2, %zmm2                           #124.3
        vpcmpuq   $6, %zmm4, %zmm0, %k1                         #124.3
        vpmovsxdq %ymm5, %zmm6                                  #124.3
        vpcmpuq   $6, %zmm6, %zmm0, %k0                         #124.3
        kunpckbw  %k1, %k0, %k2                                 #124.3
        vmovdqu32 %zmm1, (%rsi,%rcx,4){%k2}                     #125.5
        addq      $16, %rcx                                     #124.3
        vpaddd    %zmm3, %zmm1, %zmm1                           #125.18
        cmpq      %rax, %rdi                                    #124.3
        jb        ..B1.13       # Prob 82%                      #124.3
                                # LOE rax rdx rcx rbx rsi r12 r13 r14 r15 edi zmm0 zmm1 zmm2 zmm3
..B1.15:                        # Preds ..B1.13 ..B1.11
                                # Execution count [8.75e-01]
        xorl      %eax, %eax                                    #130.14
        lea       512(%rdx), %rsi                               #127.16
        movq      %r13, (%rsp)                                  #130.14[spill]
        lea       2560(%rdx), %rdi                              #127.16
        movq      %r14, 8(%rsp)                                 #130.14[spill]
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
        movq      %rsi, %r14                                    #130.14
        movq      %r15, 16(%rsp)                                #130.14[spill]
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x90, 0xff, 0xff, 0xff, 0x22
        movq      %rdx, %r15                                    #130.14
        movq      %rbx, 24(%rsp)                                #130.14[spill]
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x98, 0xff, 0xff, 0xff, 0x22
        movl      %eax, %ebx                                    #130.14
        movq      %rdi, %r13                                    #130.14
                                # LOE r12 r13 r14 r15 ebx
..B1.16:                        # Preds ..B1.17 ..B1.15
                                # Execution count [1.00e+06]
        movl      $4194304, %edx                                #131.6
        movq      %r13, %rdi                                    #131.6
        movq      %r14, %rsi                                    #131.6
        movl      %edx, %ecx                                    #131.6
        movl      %edx, %r8d                                    #131.6
        vzeroupper                                              #131.6
..___tag_value_main.14:
#       array_copy_universal(uint8_t *, uint8_t *, int, int, int)
        call      _Z20array_copy_universalPhS_iii               #131.6
..___tag_value_main.15:
                                # LOE r12 r13 r14 r15 ebx
..B1.17:                        # Preds ..B1.16
                                # Execution count [1.00e+06]
        incl      %ebx                                          #130.32
        cmpl      $1048576, %ebx                                #130.24
        jl        ..B1.16       # Prob 99%                      #130.24
                                # LOE r12 r13 r14 r15 ebx
..B1.18:                        # Preds ..B1.17
                                # Execution count [9.16e-01]
        movq      %r15, %rdx                                    #
        movq      (%rsp), %r13                                  #[spill]
	.cfi_restore 13
        movq      8(%rsp), %r14                                 #[spill]
	.cfi_restore 14
        movq      16(%rsp), %r15                                #[spill]
	.cfi_restore 15
        movq      24(%rsp), %rbx                                #[spill]
	.cfi_restore 3
        movl      2640(%rdx), %eax                              #139.10
        movq      %rbp, %rsp                                    #139.10
        popq      %rbp                                          #139.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #139.10
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
                                # LOE
..B1.19:                        # Preds ..B1.3
                                # Execution count [9.00e-02]: Infreq
        xorl      %eax, %eax                                    #124.3
        jmp       ..B1.11       # Prob 100%                     #124.3
        .align    16,0x90
                                # LOE rax rdx rbx r12 r13 r14 r15
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.0:
	.data
# -- End  main
	.text
.L_2__routine_start__Z20array_copy_universalPhS_iii_1:
# -- Begin  _Z20array_copy_universalPhS_iii
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z20array_copy_universalPhS_iii
# --- array_copy_universal(uint8_t *, uint8_t *, int, int, int)
_Z20array_copy_universalPhS_iii:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %edx
# parameter 4: %ecx
# parameter 5: %r8d
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z20array_copy_universalPhS_iii.29:
..L30:
                                                         #9.101
        pushq     %rbp                                          #9.101
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #9.101
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-64, %rsp                                    #9.101
        pushq     %r12                                          #9.101
        pushq     %r13                                          #9.101
        pushq     %r14                                          #9.101
        pushq     %r15                                          #9.101
        pushq     %rbx                                          #9.101
        subq      $88, %rsp                                     #9.101
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
        movl      %ecx, %r14d                                   #9.101
        movl      %edx, %eax                                    #9.101
        movl      %r14d, %r9d                                   #10.21
        movl      %r8d, %r15d                                   #9.101
        movq      %rsi, %r13                                    #9.101
        movq      %rdi, %r12                                    #9.101
        orl       %eax, %r9d                                    #10.21
        jl        ..B2.80       # Prob 6%                       #10.21
                                # LOE r12 r13 eax r14d r15d
..B2.2:                         # Preds ..B2.1
                                # Execution count [9.31e-01]
        cmpl      %eax, %r14d                                   #10.57
        jl        ..B2.80       # Prob 28%                      #10.57
                                # LOE r12 r13 eax r14d r15d
..B2.3:                         # Preds ..B2.2
                                # Execution count [6.70e-01]
        testl     %r15d, %r15d                                  #10.79
        jl        ..B2.80       # Prob 6%                       #10.79
                                # LOE r12 r13 eax r14d r15d
..B2.4:                         # Preds ..B2.3
                                # Execution count [6.24e-01]
        cmpq      %r12, %r13                                    #14.15
        jbe       ..B2.33       # Prob 50%                      #14.15
                                # LOE r12 r13 eax r14d r15d
..B2.5:                         # Preds ..B2.4
                                # Execution count [3.12e-01]
        cmpl      $32, %r15d                                    #27.22
        jle       ..B2.9        # Prob 10%                      #27.22
                                # LOE r12 r13 r15d
..B2.7:                         # Preds ..B2.5 ..B2.7
                                # Execution count [1.56e+00]
        addl      $-32, %r15d                                   #34.10
        vmovdqu32 (%r13), %ymm0                                 #28.0
        vmovdqu32 %ymm0, (%r12)                                 #28.0
        addq      $32, %r12                                     #32.10
        addq      $32, %r13                                     #33.10
        cmpl      $32, %r15d                                    #27.22
        jg        ..B2.7        # Prob 82%                      #27.22
                                # LOE r12 r13 r15d
..B2.9:                         # Preds ..B2.7 ..B2.5
                                # Execution count [3.12e-01]
        cmpl      $16, %r15d                                    #36.22
        jle       ..B2.13       # Prob 10%                      #36.22
                                # LOE r12 r13 r15d
..B2.11:                        # Preds ..B2.9 ..B2.11
                                # Execution count [1.56e+00]
        addl      $-16, %r15d                                   #43.10
        vmovdqu   (%r13), %xmm0                                 #37.0
        vmovdqu   %xmm0, (%r12)                                 #37.0
        addq      $16, %r12                                     #41.10
        addq      $16, %r13                                     #42.10
        cmpl      $16, %r15d                                    #36.22
        jg        ..B2.11       # Prob 82%                      #36.22
                                # LOE r12 r13 r15d
..B2.13:                        # Preds ..B2.11 ..B2.9
                                # Execution count [3.12e-01]
        movl      %r15d, %r14d                                  #45.8
        cmpl      $8, %r15d                                     #45.22
        jle       ..B2.18       # Prob 50%                      #45.22
                                # LOE r12 r13 r14d r15d
..B2.14:                        # Preds ..B2.13
                                # Execution count [1.56e-03]
        movl      %r15d, %eax                                   #45.22
        negl      %eax                                          #45.22
        lea       1(%rax), %edx                                 #45.22
        movl      %edx, %ebx                                    #45.22
        sarl      $2, %ebx                                      #45.22
        shrl      $29, %ebx                                     #45.22
        lea       1(%rbx,%rax), %ebx                            #45.22
        sarl      $3, %ebx                                      #45.22
        cmpl      $12, %edx                                     #45.8
        jle       ..B2.87       # Prob 10%                      #45.8
                                # LOE r12 r13 ebx r14d r15d
..B2.15:                        # Preds ..B2.14
                                # Execution count [3.12e-01]
        movl      %ebx, %edx                                    #45.22
        movq      %r12, %rax                                    #45.8
        negl      %edx                                          #45.22
        subq      %r13, %rax                                    #45.8
        movslq    %edx, %rdx                                    #45.8
        xorl      %ecx, %ecx                                    #45.8
        shlq      $3, %rdx                                      #45.8
        xorl      %r8d, %r8d                                    #45.8
        cmpq      %rdx, %rax                                    #45.8
        setg      %r8b                                          #45.8
        negq      %rax                                          #45.8
        cmpq      %rdx, %rax                                    #45.8
        setg      %cl                                           #45.8
        orl       %ecx, %r8d                                    #45.8
        je        ..B2.87       # Prob 10%                      #45.8
                                # LOE rdx r12 r13 ebx r14d r15d
..B2.16:                        # Preds ..B2.15
                                # Execution count [3.12e-01]
        movq      %r12, %rdi                                    #45.8
        movq      %r13, %rsi                                    #45.8
        vzeroupper                                              #45.8
        call      _intel_fast_memcpy                            #45.8
                                # LOE r12 r13 ebx r14d r15d
..B2.17:                        # Preds ..B2.16 ..B2.92 ..B2.91
                                # Execution count [3.12e-01]
        negl      %r14d                                         #45.22
        lea       (%r15,%rbx,8), %r15d                          #58.23
        lea       1(%r14), %eax                                 #45.22
        sarl      $2, %eax                                      #45.22
        shrl      $29, %eax                                     #45.22
        lea       1(%rax,%r14), %edx                            #45.22
        sarl      $3, %edx                                      #45.22
        negl      %edx                                          #45.22
        movslq    %edx, %rdx                                    #45.22
        lea       (%r13,%rdx,8), %r13                           #58.23
        lea       (%r12,%rdx,8), %r12                           #58.23
                                # LOE r12 r13 r15d
..B2.18:                        # Preds ..B2.17 ..B2.13
                                # Execution count [3.12e-01]
        movl      %r15d, %r14d                                  #51.8
        cmpl      $4, %r15d                                     #51.22
        jle       ..B2.26       # Prob 50%                      #51.22
                                # LOE r12 r13 r14d r15d
..B2.19:                        # Preds ..B2.18
                                # Execution count [1.56e-03]
        movl      %r15d, %eax                                   #51.22
        negl      %eax                                          #51.22
        lea       1(%rax), %edx                                 #51.22
        movl      %edx, %ebx                                    #51.22
        sarl      $1, %ebx                                      #51.22
        shrl      $30, %ebx                                     #51.22
        lea       1(%rbx,%rax), %ebx                            #51.22
        sarl      $2, %ebx                                      #51.22
        cmpl      $24, %edx                                     #51.8
        jle       ..B2.81       # Prob 10%                      #51.8
                                # LOE r12 r13 ebx r14d r15d
..B2.20:                        # Preds ..B2.19
                                # Execution count [3.12e-01]
        movl      %ebx, %edx                                    #51.22
        movq      %r12, %rax                                    #51.8
        negl      %edx                                          #51.22
        subq      %r13, %rax                                    #51.8
        movslq    %edx, %rdx                                    #51.8
        xorl      %ecx, %ecx                                    #51.8
        shlq      $2, %rdx                                      #51.8
        xorl      %r8d, %r8d                                    #51.8
        cmpq      %rdx, %rax                                    #51.8
        setg      %r8b                                          #51.8
        negq      %rax                                          #51.8
        cmpq      %rdx, %rax                                    #51.8
        setg      %cl                                           #51.8
        orl       %ecx, %r8d                                    #51.8
        je        ..B2.81       # Prob 10%                      #51.8
                                # LOE rdx r12 r13 ebx r14d r15d
..B2.21:                        # Preds ..B2.20
                                # Execution count [3.12e-01]
        movq      %r12, %rdi                                    #51.8
        movq      %r13, %rsi                                    #51.8
        vzeroupper                                              #51.8
        call      _intel_fast_memcpy                            #51.8
                                # LOE r12 r13 ebx r14d r15d
..B2.22:                        # Preds ..B2.21 ..B2.86 ..B2.85
                                # Execution count [3.12e-01]
        negl      %r14d                                         #51.22
        lea       (%r15,%rbx,4), %r15d                          #58.23
        lea       1(%r14), %eax                                 #51.22
        sarl      $1, %eax                                      #51.22
        shrl      $30, %eax                                     #51.22
        lea       1(%rax,%r14), %edx                            #51.22
        sarl      $2, %edx                                      #51.22
        negl      %edx                                          #51.22
        movslq    %edx, %rdx                                    #51.22
        lea       (%r13,%rdx,4), %r13                           #58.23
        lea       (%r12,%rdx,4), %r12                           #58.23
        testl     %r15d, %r15d                                  #57.14
        je        ..B2.79       # Prob 50%                      #57.14
                                # LOE r12 r13 r15d
..B2.23:                        # Preds ..B2.22
                                # Execution count [0.00e+00]
        cmpl      $96, %r15d                                    #57.8
        jle       ..B2.27       # Prob 10%                      #57.8
                                # LOE r12 r13 r15d
..B2.24:                        # Preds ..B2.23
                                # Execution count [3.12e-01]
        movq      %r12, %rax                                    #57.8
        xorl      %ecx, %ecx                                    #57.8
        movslq    %r15d, %rdx                                   #57.8
        subq      %r13, %rax                                    #57.8
        xorl      %ebx, %ebx                                    #57.8
        cmpq      %rdx, %rax                                    #57.8
        setg      %bl                                           #57.8
        negq      %rax                                          #57.8
        cmpq      %rdx, %rax                                    #57.8
        setg      %cl                                           #57.8
        orl       %ecx, %ebx                                    #57.8
        je        ..B2.27       # Prob 10%                      #57.8
                                # LOE rdx r12 r13 r15d
..B2.25:                        # Preds ..B2.24
                                # Execution count [3.12e-01]
        movq      %r12, %rdi                                    #57.8
        movq      %r13, %rsi                                    #57.8
        vzeroupper                                              #57.8
        call      _intel_fast_memcpy                            #57.8
        jmp       ..B2.79       # Prob 100%                     #57.8
                                # LOE
..B2.26:                        # Preds ..B2.18
                                # Execution count [1.56e-01]
        testl     %r15d, %r15d                                  #57.14
        je        ..B2.79       # Prob 50%                      #57.14
                                # LOE r12 r13 r15d
..B2.27:                        # Preds ..B2.26 ..B2.24 ..B2.23
                                # Execution count [3.47e-01]
        movl      %r15d, %eax                                   #57.8
        movl      $1, %ecx                                      #57.8
        xorl      %edx, %edx                                    #57.8
        shrl      $1, %eax                                      #57.8
        je        ..B2.31       # Prob 9%                       #57.8
                                # LOE rax rdx r12 r13 ecx r15d
..B2.29:                        # Preds ..B2.27 ..B2.29
                                # Execution count [8.67e-01]
        movb      (%r13,%rdx,2), %cl                            #58.44
        movb      %cl, (%r12,%rdx,2)                            #58.23
        movb      1(%r13,%rdx,2), %bl                           #58.44
        movb      %bl, 1(%r12,%rdx,2)                           #58.23
        incq      %rdx                                          #57.8
        cmpq      %rax, %rdx                                    #57.8
        jb        ..B2.29       # Prob 64%                      #57.8
                                # LOE rax rdx r12 r13 r15d
..B2.30:                        # Preds ..B2.29
                                # Execution count [3.12e-01]
        lea       1(%rdx,%rdx), %ecx                            #58.23
                                # LOE r12 r13 ecx r15d
..B2.31:                        # Preds ..B2.30 ..B2.27
                                # Execution count [3.47e-01]
        lea       -1(%rcx), %eax                                #57.8
        cmpl      %r15d, %eax                                   #57.8
        jae       ..B2.79       # Prob 9%                       #57.8
                                # LOE r12 r13 ecx
..B2.32:                        # Preds ..B2.31
                                # Execution count [3.12e-01]
        movslq    %ecx, %rcx                                    #58.44
        movb      -1(%rcx,%r13), %r13b                          #58.44
        movb      %r13b, -1(%rcx,%r12)                          #58.23
        jmp       ..B2.79       # Prob 100%                     #58.23
                                # LOE
..B2.33:                        # Preds ..B2.4
                                # Execution count [3.12e-01]
        cmpq      %r13, %r12                                    #63.6
        jbe       ..B2.108      # Prob 0%                       #63.6
                                # LOE r12 r13 eax r14d r15d
..B2.34:                        # Preds ..B2.33
                                # Execution count [3.10e-01]
        movslq    %r14d, %r14                                   #64.27
        addq      %r14, %r13                                    #65.13
        movq      %r14, (%rsp)                                  #64.27[spill]
        lea       (%r12,%r14), %rbx                             #64.27
        cmpl      $32, %r15d                                    #77.20
        jle       ..B2.38       # Prob 10%                      #77.20
                                # LOE rbx r12 r13 eax r14d r15d
..B2.36:                        # Preds ..B2.34 ..B2.36
                                # Execution count [1.55e+00]
        addq      $-32, %rbx                                    #78.8
        addq      $-32, %r13                                    #79.8
        addl      $-32, %r15d                                   #84.8
        vmovdqu32 (%r13), %ymm0                                 #80.0
        vmovdqu32 %ymm0, (%rbx)                                 #80.0
        cmpl      $32, %r15d                                    #77.20
        jg        ..B2.36       # Prob 82%                      #77.20
                                # LOE rbx r12 r13 eax r14d r15d
..B2.38:                        # Preds ..B2.36 ..B2.34
                                # Execution count [3.10e-01]
        cmpl      $16, %r15d                                    #86.20
        jle       ..B2.42       # Prob 10%                      #86.20
                                # LOE rbx r12 r13 eax r14d r15d
..B2.40:                        # Preds ..B2.38 ..B2.40
                                # Execution count [1.55e+00]
        addq      $-16, %rbx                                    #87.8
        addq      $-16, %r13                                    #88.8
        addl      $-16, %r15d                                   #93.8
        vmovdqu   (%r13), %xmm0                                 #89.0
        vmovdqu   %xmm0, (%rbx)                                 #89.0
        cmpl      $16, %r15d                                    #86.20
        jg        ..B2.40       # Prob 82%                      #86.20
                                # LOE rbx r12 r13 eax r14d r15d
..B2.42:                        # Preds ..B2.40 ..B2.38
                                # Execution count [3.10e-01]
        movl      %r15d, 24(%rsp)                               #95.6[spill]
        cmpl      $8, %r15d                                     #95.20
        jle       ..B2.47       # Prob 50%                      #95.20
                                # LOE rbx r12 r13 eax r14d r15d
..B2.43:                        # Preds ..B2.42
                                # Execution count [1.55e-03]
        movl      %r15d, %ecx                                   #95.20
        negl      %ecx                                          #95.20
        lea       1(%rcx), %r9d                                 #95.20
        movl      %r9d, %edx                                    #95.20
        sarl      $2, %edx                                      #95.20
        shrl      $29, %edx                                     #95.20
        lea       1(%rdx,%rcx), %r8d                            #95.20
        sarl      $3, %r8d                                      #95.20
        movl      %r8d, 16(%rsp)                                #95.20[spill]
        cmpl      $12, %r9d                                     #95.6
        jle       ..B2.102      # Prob 10%                      #95.6
                                # LOE rbx r12 r13 eax r8d r14d r15d
..B2.44:                        # Preds ..B2.43
                                # Execution count [3.10e-01]
        movl      %r8d, %edx                                    #95.20
        lea       -8(%r13), %rsi                                #98.47
        movq      %rsi, %r8                                     #95.6
        lea       -8(%rbx), %rdi                                #98.22
        negl      %edx                                          #95.20
        subq      %rdi, %r8                                     #95.6
        movslq    %edx, %rdx                                    #95.6
        movq      %r8, %rcx                                     #95.6
        shlq      $3, %rdx                                      #95.6
        negq      %rcx                                          #95.6
        xorl      %r10d, %r10d                                  #95.6
        cmpq      %rdx, %rcx                                    #95.6
        setg      %r10b                                         #95.6
        xorl      %r9d, %r9d                                    #95.6
        cmpq      %rdx, %r8                                     #95.6
        setg      %r9b                                          #95.6
        orl       %r9d, %r10d                                   #95.6
        je        ..B2.102      # Prob 10%                      #95.6
                                # LOE rdx rbx rsi rdi r12 r13 eax r14d r15d
..B2.45:                        # Preds ..B2.44
                                # Execution count [3.10e-01]
        movl      16(%rsp), %ecx                                #95.20[spill]
        movl      %eax, 8(%rsp)                                 #95.6[spill]
        vzeroupper                                              #95.6
        lea       (,%rcx,8), %r8d                               #95.20
        negl      %r8d                                          #95.20
        addl      $-8, %r8d                                     #95.20
        movslq    %r8d, %r8                                     #95.20
        subq      %r8, %rdi                                     #95.6
        subq      %r8, %rsi                                     #95.6
        call      _intel_fast_memcpy                            #95.6
                                # LOE rbx r12 r13 r14d r15d
..B2.112:                       # Preds ..B2.45
                                # Execution count [3.10e-01]
        movl      8(%rsp), %eax                                 #[spill]
                                # LOE rbx r12 r13 eax r14d r15d
..B2.46:                        # Preds ..B2.112 ..B2.107 ..B2.106
                                # Execution count [3.10e-01]
        movl      24(%rsp), %r8d                                #95.20[spill]
        negl      %r8d                                          #95.20
        movl      16(%rsp), %edx                                #58.23[spill]
        lea       1(%r8), %ecx                                  #95.20
        sarl      $2, %ecx                                      #95.20
        lea       (%r15,%rdx,8), %r15d                          #58.23
        shrl      $29, %ecx                                     #95.20
        lea       1(%rcx,%r8), %r9d                             #95.20
        sarl      $3, %r9d                                      #95.20
        negl      %r9d                                          #95.20
        movslq    %r9d, %r9                                     #95.20
        shlq      $3, %r9                                       #96.8
        negq      %r9                                           #96.8
        addq      %r9, %r13                                     #96.8
        addq      %r9, %rbx                                     #108.49
                                # LOE rbx r12 r13 eax r14d r15d
..B2.47:                        # Preds ..B2.46 ..B2.42
                                # Execution count [3.10e-01]
        movl      %r15d, 24(%rsp)                               #101.6[spill]
        cmpl      $4, %r15d                                     #101.20
        jle       ..B2.70       # Prob 50%                      #101.20
                                # LOE rbx r12 r13 eax r14d r15d
..B2.48:                        # Preds ..B2.47
                                # Execution count [1.55e-03]
        movl      %r15d, %ecx                                   #101.20
        negl      %ecx                                          #101.20
        lea       1(%rcx), %r9d                                 #101.20
        movl      %r9d, %edx                                    #101.20
        sarl      $1, %edx                                      #101.20
        shrl      $30, %edx                                     #101.20
        lea       1(%rdx,%rcx), %r8d                            #101.20
        sarl      $2, %r8d                                      #101.20
        movl      %r8d, 16(%rsp)                                #101.20[spill]
        cmpl      $24, %r9d                                     #101.6
        jle       ..B2.96       # Prob 10%                      #101.6
                                # LOE rbx r12 r13 eax r8d r14d r15d
..B2.49:                        # Preds ..B2.48
                                # Execution count [3.10e-01]
        movl      %r8d, %edx                                    #101.20
        lea       -4(%r13), %rsi                                #104.47
        movq      %rsi, %r8                                     #101.6
        lea       -4(%rbx), %rdi                                #104.22
        negl      %edx                                          #101.20
        subq      %rdi, %r8                                     #101.6
        movslq    %edx, %rdx                                    #101.6
        movq      %r8, %rcx                                     #101.6
        shlq      $2, %rdx                                      #101.6
        negq      %rcx                                          #101.6
        xorl      %r10d, %r10d                                  #101.6
        cmpq      %rdx, %rcx                                    #101.6
        setg      %r10b                                         #101.6
        xorl      %r9d, %r9d                                    #101.6
        cmpq      %rdx, %r8                                     #101.6
        setg      %r9b                                          #101.6
        orl       %r9d, %r10d                                   #101.6
        je        ..B2.96       # Prob 10%                      #101.6
                                # LOE rdx rbx rsi rdi r12 r13 eax r14d r15d
..B2.50:                        # Preds ..B2.49
                                # Execution count [3.10e-01]
        movl      16(%rsp), %ecx                                #101.20[spill]
        movl      %eax, 8(%rsp)                                 #101.6[spill]
        vzeroupper                                              #101.6
        lea       (,%rcx,4), %r8d                               #101.20
        negl      %r8d                                          #101.20
        addl      $-4, %r8d                                     #101.20
        movslq    %r8d, %r8                                     #101.20
        subq      %r8, %rdi                                     #101.6
        subq      %r8, %rsi                                     #101.6
        call      _intel_fast_memcpy                            #101.6
                                # LOE rbx r12 r13 r14d r15d
..B2.111:                       # Preds ..B2.50
                                # Execution count [3.10e-01]
        movl      8(%rsp), %eax                                 #[spill]
                                # LOE rbx r12 r13 eax r14d r15d
..B2.51:                        # Preds ..B2.111 ..B2.101 ..B2.100
                                # Execution count [3.10e-01]
        movl      24(%rsp), %r8d                                #101.20[spill]
        negl      %r8d                                          #101.20
        movl      16(%rsp), %edx                                #58.23[spill]
        lea       1(%r8), %ecx                                  #101.20
        sarl      $1, %ecx                                      #101.20
        lea       (%r15,%rdx,4), %r15d                          #58.23
        shrl      $30, %ecx                                     #101.20
        lea       1(%rcx,%r8), %r9d                             #101.20
        sarl      $2, %r9d                                      #101.20
        negl      %r9d                                          #101.20
        movslq    %r9d, %r9                                     #101.20
        shlq      $2, %r9                                       #102.8
        negq      %r9                                           #102.8
        addq      %r9, %rbx                                     #108.49
        addq      %r9, %r13                                     #102.8
        movq      %rbx, %rdx                                    #107.6
        testl     %r15d, %r15d                                  #107.12
        je        ..B2.77       # Prob 50%                      #107.12
                                # LOE rdx rbx r12 r13 eax r14d r15d
..B2.52:                        # Preds ..B2.51
                                # Execution count [0.00e+00]
        cmpl      $6, %r15d                                     #107.6
        jle       ..B2.71       # Prob 50%                      #107.6
                                # LOE rdx rbx r12 r13 eax r14d r15d
..B2.53:                        # Preds ..B2.52
                                # Execution count [0.00e+00]
        movslq    %r15d, %r11                                   #107.6
        lea       -1(%rbx), %r8                                 #108.23
        lea       -1(%r13), %rcx                                #108.49
        subq      %rcx, %r8                                     #108.49
        cmpq      %r11, %r8                                     #107.6
        jg        ..B2.55       # Prob 50%                      #107.6
                                # LOE rdx rbx r8 r11 r12 r13 eax r14d r15d
..B2.54:                        # Preds ..B2.53
                                # Execution count [0.00e+00]
        negq      %r8                                           #108.23
        cmpq      %r11, %r8                                     #107.6
        jle       ..B2.71       # Prob 50%                      #107.6
                                # LOE rdx rbx r11 r12 r13 eax r14d r15d
..B2.55:                        # Preds ..B2.53 ..B2.54
                                # Execution count [1.40e-01]
        negl      %r15d                                         #108.49
        lea       -1(%r15), %r9d                                #108.49
        negl      %r9d                                          #108.49
        decl      %r9d                                          #108.49
        movslq    %r9d, %r10                                    #107.6
        cmpq      $32, %r10                                     #107.6
        jl        ..B2.93       # Prob 10%                      #107.6
                                # LOE rbx r10 r11 r12 r13 eax r9d r14d r15d
..B2.56:                        # Preds ..B2.55
                                # Execution count [1.40e-01]
        cmpq      $273, %r10                                    #107.6
        jl        ..B2.94       # Prob 10%                      #107.6
                                # LOE rbx r10 r11 r12 r13 eax r9d r14d r15d
..B2.57:                        # Preds ..B2.56
                                # Execution count [1.40e-01]
        movslq    %r15d, %r15                                   #108.23
        addq      %rbx, %r15                                    #108.23
        andq      $31, %r15                                     #107.6
        movl      %r15d, %edx                                   #107.6
        negl      %edx                                          #107.6
        addl      $32, %edx                                     #107.6
        testl     %r15d, %r15d                                  #107.6
        cmovne    %edx, %r15d                                   #107.6
        lea       32(%r15), %ecx                                #107.6
        cmpq      %rcx, %r10                                    #107.6
        jl        ..B2.93       # Prob 10%                      #107.6
                                # LOE rbx r10 r11 r12 r13 eax r9d r14d r15d
..B2.58:                        # Preds ..B2.57
                                # Execution count [1.55e-01]
        movl      %r9d, %edx                                    #107.6
        movq      %r13, %r8                                     #108.49
        subl      %r15d, %edx                                   #107.6
        subq      %r11, %r8                                     #108.49
        andl      $31, %edx                                     #107.6
        xorl      %esi, %esi                                    #107.6
        subl      %edx, %r9d                                    #107.6
        movq      %rbx, %rdx                                    #108.23
        subq      %r11, %rdx                                    #108.23
        movl      %r15d, %ecx                                   #107.6
        cmpl      $1, %r15d                                     #107.6
        jb        ..B2.62       # Prob 10%                      #107.6
                                # LOE rdx rcx rbx rsi r8 r10 r11 r12 r13 eax r9d r14d
..B2.60:                        # Preds ..B2.58 ..B2.60
                                # Execution count [7.76e-01]
        movb      (%rsi,%r8), %r15b                             #108.49
        movb      %r15b, (%rsi,%rdx)                            #108.23
        incq      %rsi                                          #107.6
        cmpq      %rcx, %rsi                                    #107.6
        jb        ..B2.60       # Prob 82%                      #107.6
                                # LOE rdx rcx rbx rsi r8 r10 r11 r12 r13 eax r9d r14d
..B2.62:                        # Preds ..B2.60 ..B2.58 ..B2.94
                                # Execution count [1.40e-01]
        movslq    %r9d, %r15                                    #107.6
                                # LOE rdx rcx rbx r8 r10 r11 r12 r13 r15 eax r9d r14d
..B2.63:                        # Preds ..B2.63 ..B2.62
                                # Execution count [7.76e-01]
        vmovdqu   (%rcx,%r8), %ymm0                             #108.49
        vmovdqu   %ymm0, (%rcx,%rdx)                            #108.23
        addq      $32, %rcx                                     #107.6
        cmpq      %r15, %rcx                                    #107.6
        jb        ..B2.63       # Prob 82%                      #107.6
                                # LOE rdx rcx rbx r8 r10 r11 r12 r13 r15 eax r9d r14d
..B2.65:                        # Preds ..B2.63 ..B2.93
                                # Execution count [1.55e-01]
        xorl      %ecx, %ecx                                    #107.6
        lea       1(%r9), %edx                                  #107.6
        movslq    %edx, %rdx                                    #107.6
        cmpq      %r10, %rdx                                    #107.6
        ja        ..B2.69       # Prob 10%                      #107.6
                                # LOE rcx rbx r10 r11 r12 r13 eax r9d r14d
..B2.66:                        # Preds ..B2.65
                                # Execution count [1.40e-01]
        movq      %rbx, %rdx                                    #108.23
        subq      %r11, %r13                                    #108.49
        movslq    %r9d, %r9                                     #108.49
        subq      %r11, %rdx                                    #108.23
        addq      %r9, %rdx                                     #108.23
        addq      %r9, %r13                                     #108.49
        subq      %r9, %r10                                     #107.6
                                # LOE rdx rcx rbx r10 r11 r12 r13 eax r14d
..B2.67:                        # Preds ..B2.67 ..B2.66
                                # Execution count [7.76e-01]
        movb      (%rcx,%r13), %r8b                             #108.49
        movb      %r8b, (%rcx,%rdx)                             #108.23
        incq      %rcx                                          #107.6
        cmpq      %r10, %rcx                                    #107.6
        jb        ..B2.67       # Prob 82%                      #107.6
                                # LOE rdx rcx rbx r10 r11 r12 r13 eax r14d
..B2.69:                        # Preds ..B2.67 ..B2.65
                                # Execution count [1.40e-01]
        incq      %r11                                          #107.6
        subq      %r11, %rbx                                    #108.49
        incq      %rbx                                          #108.49
        jmp       ..B2.77       # Prob 100%                     #108.49
                                # LOE rbx r12 eax r14d
..B2.70:                        # Preds ..B2.47
                                # Execution count [1.55e-01]
        movq      %rbx, %rdx                                    #107.6
        testl     %r15d, %r15d                                  #107.12
        je        ..B2.77       # Prob 50%                      #107.12
                                # LOE rdx rbx r12 r13 eax r14d r15d
..B2.71:                        # Preds ..B2.70 ..B2.54 ..B2.52
                                # Execution count [1.55e-01]
        movl      %r15d, %ecx                                   #107.6
        xorl      %r9d, %r9d                                    #107.6
        movl      $1, %r10d                                     #107.6
        xorl      %r8d, %r8d                                    #107.6
        shrl      $1, %ecx                                      #107.6
        je        ..B2.75       # Prob 10%                      #107.6
                                # LOE rdx rcx rbx r8 r9 r12 r13 eax r10d r14d r15d
..B2.73:                        # Preds ..B2.71 ..B2.73
                                # Execution count [3.88e-01]
        movb      -1(%r8,%r13), %bl                             #108.49
        incq      %r9                                           #107.6
        movb      %bl, -1(%r8,%rdx)                             #108.23
        movb      -2(%r8,%r13), %r10b                           #108.49
        movb      %r10b, -2(%r8,%rdx)                           #108.23
        addq      $-2, %r8                                      #107.6
        cmpq      %rcx, %r9                                     #107.6
        jb        ..B2.73       # Prob 63%                      #107.6
                                # LOE rdx rcx r8 r9 r12 r13 eax r14d r15d
..B2.74:                        # Preds ..B2.73
                                # Execution count [1.40e-01]
        lea       (%r9,%r9), %rbx                               #108.49
        negq      %rbx                                          #108.49
        lea       1(%r9,%r9), %r10d                             #108.49
        addq      %rdx, %rbx                                    #108.49
                                # LOE rdx rbx r12 r13 eax r10d r14d r15d
..B2.75:                        # Preds ..B2.74 ..B2.71
                                # Execution count [1.55e-01]
        lea       -1(%r10), %ecx                                #107.6
        cmpl      %r15d, %ecx                                   #107.6
        jae       ..B2.77       # Prob 10%                      #107.6
                                # LOE rdx rbx r12 r13 eax r10d r14d
..B2.76:                        # Preds ..B2.75
                                # Execution count [1.40e-01]
        movslq    %r10d, %r10                                   #108.49
        subq      %r10, %r13                                    #108.49
        subq      %r10, %rdx                                    #108.23
        movq      %rdx, %rbx                                    #108.49
        movb      (%r13), %cl                                   #108.49
        movb      %cl, (%rdx)                                   #108.23
                                # LOE rbx r12 eax r14d
..B2.77:                        # Preds ..B2.70 ..B2.76 ..B2.75 ..B2.69 ..B2.51
                                #      
                                # Execution count [3.10e-01]
        cmpl      %eax, %r14d                                   #112.23
        jle       ..B2.79       # Prob 78%                      #112.23
                                # LOE rbx r12
..B2.78:                        # Preds ..B2.77
                                # Execution count [6.83e-02]
        movq      %r12, %rdi                                    #113.9
        movq      %rbx, %rsi                                    #113.9
        movq      (%rsp), %rdx                                  #113.9[spill]
        vzeroupper                                              #113.9
        call      _intel_fast_memcpy                            #113.9
                                # LOE
..B2.79:                        # Preds ..B2.25 ..B2.78 ..B2.22 ..B2.26 ..B2.77
                                #       ..B2.31 ..B2.32
                                # Execution count [6.23e-01]
        vzeroupper                                              #116.1
        addq      $88, %rsp                                     #116.1
	.cfi_restore 3
        popq      %rbx                                          #116.1
	.cfi_restore 15
        popq      %r15                                          #116.1
	.cfi_restore 14
        popq      %r14                                          #116.1
	.cfi_restore 13
        popq      %r13                                          #116.1
	.cfi_restore 12
        popq      %r12                                          #116.1
        movq      %rbp, %rsp                                    #116.1
        popq      %rbp                                          #116.1
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #116.1
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
                                # LOE
..B2.80:                        # Preds ..B2.1 ..B2.2 ..B2.3
                                # Execution count [3.76e-01]
        addq      $88, %rsp                                     #11.6
	.cfi_restore 3
        popq      %rbx                                          #11.6
	.cfi_restore 15
        popq      %r15                                          #11.6
	.cfi_restore 14
        popq      %r14                                          #11.6
	.cfi_restore 13
        popq      %r13                                          #11.6
	.cfi_restore 12
        popq      %r12                                          #11.6
        movq      %rbp, %rsp                                    #11.6
        popq      %rbp                                          #11.6
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #11.6
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
                                # LOE
..B2.81:                        # Preds ..B2.19 ..B2.20
                                # Execution count [3.47e-01]
        movl      $1, %ecx                                      #51.8
        lea       -1(%r15), %eax                                #51.8
        xorl      %edx, %edx                                    #51.8
        shrl      $3, %eax                                      #51.8
        je        ..B2.85       # Prob 9%                       #51.8
                                # LOE rax rdx r12 r13 ecx ebx r14d r15d
..B2.83:                        # Preds ..B2.81 ..B2.83
                                # Execution count [8.67e-01]
        movl      (%r13,%rdx,8), %ecx                           #52.44
        movl      %ecx, (%r12,%rdx,8)                           #52.24
        movl      4(%r13,%rdx,8), %r8d                          #52.44
        movl      %r8d, 4(%r12,%rdx,8)                          #52.24
        incq      %rdx                                          #51.8
        cmpq      %rax, %rdx                                    #51.8
        jb        ..B2.83       # Prob 64%                      #51.8
                                # LOE rax rdx r12 r13 ebx r14d r15d
..B2.84:                        # Preds ..B2.83
                                # Execution count [3.12e-01]
        lea       1(%rdx,%rdx), %ecx                            #52.24
                                # LOE r12 r13 ecx ebx r14d r15d
..B2.85:                        # Preds ..B2.84 ..B2.81
                                # Execution count [3.47e-01]
        lea       -1(%r15), %edx                                #51.22
        shrl      $2, %edx                                      #51.22
        lea       -1(%rcx), %eax                                #51.8
        cmpl      %edx, %eax                                    #51.8
        jae       ..B2.22       # Prob 9%                       #51.8
                                # LOE r12 r13 ecx ebx r14d r15d
..B2.86:                        # Preds ..B2.85
                                # Execution count [3.12e-01]
        movslq    %ecx, %rcx                                    #52.44
        movl      -4(%r13,%rcx,4), %eax                         #52.44
        movl      %eax, -4(%r12,%rcx,4)                         #52.24
        jmp       ..B2.22       # Prob 100%                     #52.24
                                # LOE r12 r13 ebx r14d r15d
..B2.87:                        # Preds ..B2.14 ..B2.15
                                # Execution count [3.47e-01]
        xorl      %ecx, %ecx                                    #45.8
        lea       -1(%r15), %eax                                #45.8
        movl      $1, %r8d                                      #45.8
        xorl      %edx, %edx                                    #45.8
        shrl      $4, %eax                                      #45.8
        je        ..B2.91       # Prob 9%                       #45.8
                                # LOE rax rdx rcx r12 r13 ebx r8d r14d r15d
..B2.89:                        # Preds ..B2.87 ..B2.89
                                # Execution count [8.67e-01]
        movq      (%rdx,%r13), %r8                              #46.44
        incq      %rcx                                          #45.8
        movq      %r8, (%rdx,%r12)                              #46.24
        movq      8(%rdx,%r13), %r9                             #46.44
        movq      %r9, 8(%rdx,%r12)                             #46.24
        addq      $16, %rdx                                     #45.8
        cmpq      %rax, %rcx                                    #45.8
        jb        ..B2.89       # Prob 64%                      #45.8
                                # LOE rax rdx rcx r12 r13 ebx r14d r15d
..B2.90:                        # Preds ..B2.89
                                # Execution count [3.12e-01]
        lea       1(%rcx,%rcx), %r8d                            #46.24
                                # LOE r12 r13 ebx r8d r14d r15d
..B2.91:                        # Preds ..B2.90 ..B2.87
                                # Execution count [3.47e-01]
        lea       -1(%r15), %edx                                #45.22
        shrl      $3, %edx                                      #45.22
        lea       -1(%r8), %eax                                 #45.8
        cmpl      %edx, %eax                                    #45.8
        jae       ..B2.17       # Prob 9%                       #45.8
                                # LOE r12 r13 ebx r8d r14d r15d
..B2.92:                        # Preds ..B2.91
                                # Execution count [3.12e-01]
        movslq    %r8d, %r8                                     #46.44
        movq      -8(%r13,%r8,8), %rax                          #46.44
        movq      %rax, -8(%r12,%r8,8)                          #46.24
        jmp       ..B2.17       # Prob 100%                     #46.24
                                # LOE r12 r13 ebx r14d r15d
..B2.93:                        # Preds ..B2.55 ..B2.57
                                # Execution count [1.40e-02]: Infreq
        xorl      %r9d, %r9d                                    #107.6
        jmp       ..B2.65       # Prob 100%                     #107.6
                                # LOE rbx r10 r11 r12 r13 eax r9d r14d
..B2.94:                        # Preds ..B2.56
                                # Execution count [1.40e-02]: Infreq
        movq      %rbx, %rdx                                    #108.23
        movq      %r13, %r8                                     #108.49
        andl      $-32, %r9d                                    #107.6
        subq      %r11, %rdx                                    #108.23
        subq      %r11, %r8                                     #108.49
        xorl      %ecx, %ecx                                    #107.6
        jmp       ..B2.62       # Prob 100%                     #107.6
                                # LOE rdx rcx rbx r8 r10 r11 r12 r13 eax r9d r14d
..B2.96:                        # Preds ..B2.48 ..B2.49
                                # Execution count [3.45e-01]: Infreq
        xorl      %r8d, %r8d                                    #101.6
        lea       -1(%r15), %edx                                #101.6
        movl      $1, %r9d                                      #101.6
        xorl      %ecx, %ecx                                    #101.6
        shrl      $3, %edx                                      #101.6
        je        ..B2.100      # Prob 10%                      #101.6
                                # LOE rdx rcx rbx r8 r12 r13 eax r9d r14d r15d
..B2.98:                        # Preds ..B2.96 ..B2.98
                                # Execution count [8.62e-01]: Infreq
        movl      -4(%rcx,%r13), %r9d                           #104.47
        incq      %r8                                           #101.6
        movl      %r9d, -4(%rcx,%rbx)                           #104.22
        movl      -8(%rcx,%r13), %r10d                          #104.47
        movl      %r10d, -8(%rcx,%rbx)                          #104.22
        addq      $-8, %rcx                                     #101.6
        cmpq      %rdx, %r8                                     #101.6
        jb        ..B2.98       # Prob 63%                      #101.6
                                # LOE rdx rcx rbx r8 r12 r13 eax r14d r15d
..B2.99:                        # Preds ..B2.98
                                # Execution count [3.10e-01]: Infreq
        lea       1(%r8,%r8), %r9d                              #102.8
                                # LOE rbx r12 r13 eax r9d r14d r15d
..B2.100:                       # Preds ..B2.99 ..B2.96
                                # Execution count [3.45e-01]: Infreq
        lea       -1(%r15), %ecx                                #101.20
        shrl      $2, %ecx                                      #101.20
        lea       -1(%r9), %edx                                 #101.6
        cmpl      %ecx, %edx                                    #101.6
        jae       ..B2.51       # Prob 10%                      #101.6
                                # LOE rbx r12 r13 eax r9d r14d r15d
..B2.101:                       # Preds ..B2.100
                                # Execution count [3.10e-01]: Infreq
        movslq    %r9d, %r9                                     #104.47
        shlq      $2, %r9                                       #104.47
        negq      %r9                                           #104.47
        movl      (%r9,%r13), %edx                              #104.47
        movl      %edx, (%r9,%rbx)                              #104.22
        jmp       ..B2.51       # Prob 100%                     #104.22
                                # LOE rbx r12 r13 eax r14d r15d
..B2.102:                       # Preds ..B2.43 ..B2.44
                                # Execution count [3.45e-01]: Infreq
        xorl      %r8d, %r8d                                    #95.6
        lea       -1(%r15), %edx                                #95.6
        movl      $1, %r9d                                      #95.6
        xorl      %ecx, %ecx                                    #95.6
        shrl      $4, %edx                                      #95.6
        je        ..B2.106      # Prob 10%                      #95.6
                                # LOE rdx rcx rbx r8 r12 r13 eax r9d r14d r15d
..B2.104:                       # Preds ..B2.102 ..B2.104
                                # Execution count [8.62e-01]: Infreq
        movq      -8(%rcx,%r13), %r9                            #98.47
        incq      %r8                                           #95.6
        movq      %r9, -8(%rcx,%rbx)                            #98.22
        movq      -16(%rcx,%r13), %r10                          #98.47
        movq      %r10, -16(%rcx,%rbx)                          #98.22
        addq      $-16, %rcx                                    #95.6
        cmpq      %rdx, %r8                                     #95.6
        jb        ..B2.104      # Prob 63%                      #95.6
                                # LOE rdx rcx rbx r8 r12 r13 eax r14d r15d
..B2.105:                       # Preds ..B2.104
                                # Execution count [3.10e-01]: Infreq
        lea       1(%r8,%r8), %r9d                              #96.8
                                # LOE rbx r12 r13 eax r9d r14d r15d
..B2.106:                       # Preds ..B2.105 ..B2.102
                                # Execution count [3.45e-01]: Infreq
        lea       -1(%r15), %ecx                                #95.20
        shrl      $3, %ecx                                      #95.20
        lea       -1(%r9), %edx                                 #95.6
        cmpl      %ecx, %edx                                    #95.6
        jae       ..B2.46       # Prob 10%                      #95.6
                                # LOE rbx r12 r13 eax r9d r14d r15d
..B2.107:                       # Preds ..B2.106
                                # Execution count [3.10e-01]: Infreq
        movslq    %r9d, %r9                                     #98.47
        shlq      $3, %r9                                       #98.47
        negq      %r9                                           #98.47
        movq      (%r9,%r13), %rdx                              #98.47
        movq      %rdx, (%r9,%rbx)                              #98.22
        jmp       ..B2.46       # Prob 100%                     #98.22
                                # LOE rbx r12 r13 eax r14d r15d
..B2.108:                       # Preds ..B2.33
                                # Execution count [1.56e-03]: Infreq
        movl      $.L_2__STRING.0, %edi                         #63.6
        movl      $.L_2__STRING.1, %esi                         #63.6
        movl      $63, %edx                                     #63.6
        movl      $__$U0, %ecx                                  #63.6
#       __assert_fail(const char *, const char *, unsigned int, const char *)
        call      __assert_fail                                 #63.6
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z20array_copy_universalPhS_iii,@function
	.size	_Z20array_copy_universalPhS_iii,.-_Z20array_copy_universalPhS_iii
..LN_Z20array_copy_universalPhS_iii.1:
	.data
# -- End  _Z20array_copy_universalPhS_iii
	.section .rodata, "a"
	.align 64
	.align 64
.L_2il0floatpacket.0:
	.long	0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,64
	.align 64
.L_2il0floatpacket.1:
	.long	0x00000000,0x00000001,0x00000002,0x00000003,0x00000004,0x00000005,0x00000006,0x00000007,0x00000008,0x00000009,0x0000000a,0x0000000b,0x0000000c,0x0000000d,0x0000000e,0x0000000f
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,64
	.align 64
.L_2il0floatpacket.2:
	.long	0x0000000a,0x0000000b,0x0000000c,0x0000000d,0x0000000e,0x0000000f,0x00000010,0x00000011,0x00000012,0x00000013,0x00000014,0x00000015,0x00000016,0x00000017,0x00000018,0x00000019
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,64
	.align 64
.L_2il0floatpacket.3:
	.long	0x00000000,0x00000001,0x00000002,0x00000003,0x00000004,0x00000005,0x00000006,0x00000007,0x00000008,0x00000009,0x0000000a,0x0000000b,0x0000000c,0x0000000d,0x0000000e,0x0000000f
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,64
	.align 32
__$U0:
	.long	1684631414
	.long	1920098592
	.long	1667201377
	.long	1601794159
	.long	1986621045
	.long	1634955877
	.long	1853171820
	.long	1852270963
	.long	1663067237
	.long	544366952
	.long	1965042730
	.long	1734964078
	.long	543450478
	.long	1918986339
	.long	539765280
	.long	745827945
	.long	1953392928
	.long	1852383276
	.word	10612
	.byte	0
	.type	__$U0,@object
	.size	__$U0,75
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.long	544502628
	.long	1920147518
	.word	99
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,10
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.long	2037411683
	.word	25390
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,7
	.data
	.section .note.GNU-stack, ""
# End
