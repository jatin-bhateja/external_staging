# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "";
# mark_description "-no-vec -S";
	.file "copy1.c"
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
                                                          #30.35
        pushq     %rbp                                          #30.35
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #30.35
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #30.35
        subq      $128, %rsp                                    #30.35
        xorl      %esi, %esi                                    #30.35
        movl      $3, %edi                                      #30.35
        call      __intel_new_feature_proc_init                 #30.35
                                # LOE rbx r12 r13 r14 r15
..B1.11:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        stmxcsr   (%rsp)                                        #30.35
        movl      $536870912, %edi                              #31.21
        movl      $64, %esi                                     #31.21
        orl       $32832, (%rsp)                                #30.35
        ldmxcsr   (%rsp)                                        #30.35
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #31.21
                                # LOE rax rbx r12 r13 r14 r15
..B1.10:                        # Preds ..B1.11
                                # Execution count [1.00e+00]
        movq      %rax, %rdx                                    #31.21
                                # LOE rdx rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.10
                                # Execution count [9.00e-01]
        xorl      %eax, %eax                                    #32.3
                                # LOE rdx rbx r12 r13 r14 r15 eax
..B1.3:                         # Preds ..B1.3 ..B1.2
                                # Execution count [2.50e+00]
        movslq    %eax, %rax                                    #33.5
        lea       10(%rax,%rax), %ecx                           #33.18
        lea       11(%rax,%rax), %esi                           #33.18
        movl      %ecx, (%rdx,%rax,8)                           #33.5
        movl      %esi, 4(%rdx,%rax,8)                          #33.5
        incl      %eax                                          #32.3
        cmpl      $67108864, %eax                               #32.3
        jb        ..B1.3        # Prob 63%                      #32.3
                                # LOE rdx rbx r12 r13 r14 r15 eax
..B1.4:                         # Preds ..B1.3
                                # Execution count [8.75e-01]
        xorl      %eax, %eax                                    #38.14
        lea       512(%rdx), %rsi                               #35.16
        movq      %r13, (%rsp)                                  #38.14[spill]
        lea       2560(%rdx), %rdi                              #35.16
        movq      %r14, 8(%rsp)                                 #38.14[spill]
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
        movq      %rsi, %r14                                    #38.14
        movq      %r15, 16(%rsp)                                #38.14[spill]
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x90, 0xff, 0xff, 0xff, 0x22
        movq      %rdx, %r15                                    #38.14
        movq      %rbx, 24(%rsp)                                #38.14[spill]
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x98, 0xff, 0xff, 0xff, 0x22
        movl      %eax, %ebx                                    #38.14
        movq      %rdi, %r13                                    #38.14
                                # LOE r12 r13 r14 r15 ebx
..B1.5:                         # Preds ..B1.6 ..B1.4
                                # Execution count [1.00e+06]
        movl      $4194304, %edx                                #39.6
        movq      %r13, %rdi                                    #39.6
        movq      %r14, %rsi                                    #39.6
        movl      %edx, %ecx                                    #39.6
        movl      %edx, %r8d                                    #39.6
..___tag_value_main.14:
#       array_copy_1(uint8_t *, uint8_t *, int, int, int)
        call      _Z12array_copy_1PhS_iii                       #39.6
..___tag_value_main.15:
                                # LOE r12 r13 r14 r15 ebx
..B1.6:                         # Preds ..B1.5
                                # Execution count [1.00e+06]
        incl      %ebx                                          #38.32
        cmpl      $1048576, %ebx                                #38.24
        jl        ..B1.5        # Prob 99%                      #38.24
                                # LOE r12 r13 r14 r15 ebx
..B1.7:                         # Preds ..B1.6
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
        movl      2640(%rdx), %eax                              #47.10
        movq      %rbp, %rsp                                    #47.10
        popq      %rbp                                          #47.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #47.10
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
.L_2__routine_start__Z12array_copy_1PhS_iii_1:
# -- Begin  _Z12array_copy_1PhS_iii
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z12array_copy_1PhS_iii
# --- array_copy_1(uint8_t *, uint8_t *, int, int, int)
_Z12array_copy_1PhS_iii:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %edx
# parameter 4: %ecx
# parameter 5: %r8d
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z12array_copy_1PhS_iii.27:
..L28:
                                                         #10.93
        pushq     %rsi                                          #10.93
	.cfi_def_cfa_offset 16
        movl      %ecx, %eax                                    #11.21
        orl       %edx, %eax                                    #11.21
        jl        ..B2.21       # Prob 6%                       #11.21
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 edx ecx r8d
..B2.2:                         # Preds ..B2.1
                                # Execution count [9.31e-01]
        cmpl      %edx, %ecx                                    #11.57
        jl        ..B2.21       # Prob 28%                      #11.57
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B2.3:                         # Preds ..B2.2
                                # Execution count [6.70e-01]
        testl     %r8d, %r8d                                    #11.79
        jl        ..B2.21       # Prob 6%                       #11.79
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B2.4:                         # Preds ..B2.3
                                # Execution count [6.24e-01]
        cmpq      %rsi, %rdi                                    #15.4
        jbe       ..B2.23       # Prob 0%                       #15.4
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B2.5:                         # Preds ..B2.4
                                # Execution count [6.21e-01]
        testl     %r8d, %r8d                                    #19.10
        je        ..B2.21       # Prob 50%                      #19.10
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B2.6:                         # Preds ..B2.5
                                # Execution count [0.00e+00]
        cmpl      $6, %r8d                                      #19.4
        jle       ..B2.15       # Prob 50%                      #19.4
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B2.7:                         # Preds ..B2.6
                                # Execution count [0.00e+00]
        movslq    %ecx, %rcx                                    #17.11
        lea       -1(%rcx,%rdi), %r10                           #20.21
        lea       -1(%rcx,%rsi), %r9                            #20.47
        subq      %r9, %r10                                     #20.47
        lea       (%rsi,%rcx), %rdx                             #20.47
        movslq    %r8d, %r9                                     #10.93
        lea       (%rdi,%rcx), %rax                             #20.21
        cmpq      %r9, %r10                                     #19.4
        jg        ..B2.9        # Prob 50%                      #19.4
                                # LOE rax rdx rbx rbp rsi rdi r9 r10 r12 r13 r14 r15 ecx r8d
..B2.8:                         # Preds ..B2.7
                                # Execution count [0.00e+00]
        negq      %r10                                          #20.21
        cmpq      %r9, %r10                                     #19.4
        jle       ..B2.15       # Prob 50%                      #19.4
                                # LOE rax rdx rbx rbp rsi rdi r9 r12 r13 r14 r15 ecx r8d
..B2.9:                         # Preds ..B2.7 ..B2.8
                                # Execution count [3.10e-01]
        movl      %r8d, %esi                                    #19.4
        movl      $1, %r10d                                     #19.4
        xorl      %edi, %edi                                    #19.4
        shrl      $1, %esi                                      #19.4
        je        ..B2.13       # Prob 10%                      #19.4
                                # LOE rax rdx rbx rbp rsi rdi r9 r12 r13 r14 r15 r8d r10d
..B2.10:                        # Preds ..B2.9
                                # Execution count [2.79e-01]
        movq      %rax, %r10                                    #20.21
        movq      %rdx, %rcx                                    #20.47
        subq      %r9, %r10                                     #20.21
        subq      %r9, %rcx                                     #20.47
                                # LOE rax rdx rcx rbx rbp rsi rdi r9 r10 r12 r13 r14 r15 r8d
..B2.11:                        # Preds ..B2.11 ..B2.10
                                # Execution count [7.76e-01]
        movb      (%rcx,%rdi,2), %r11b                          #20.47
        movb      %r11b, (%r10,%rdi,2)                          #20.21
        movb      1(%rcx,%rdi,2), %r11b                         #20.47
        movb      %r11b, 1(%r10,%rdi,2)                         #20.21
        incq      %rdi                                          #19.4
        cmpq      %rsi, %rdi                                    #19.4
        jb        ..B2.11       # Prob 64%                      #19.4
                                # LOE rax rdx rcx rbx rbp rsi rdi r9 r10 r12 r13 r14 r15 r8d
..B2.12:                        # Preds ..B2.11
                                # Execution count [2.79e-01]
        lea       1(%rdi,%rdi), %r10d                           #19.4
                                # LOE rax rdx rbx rbp r9 r12 r13 r14 r15 r8d r10d
..B2.13:                        # Preds ..B2.12 ..B2.9
                                # Execution count [3.10e-01]
        lea       -1(%r10), %ecx                                #19.4
        cmpl      %r8d, %ecx                                    #19.4
        jae       ..B2.21       # Prob 10%                      #19.4
                                # LOE rax rdx rbx rbp r9 r12 r13 r14 r15 r10d
..B2.14:                        # Preds ..B2.13
                                # Execution count [2.79e-01]
        movslq    %r10d, %r10                                   #20.47
        subq      %r9, %rdx                                     #20.47
        subq      %r9, %rax                                     #20.21
        movb      -1(%r10,%rdx), %dl                            #20.47
        movb      %dl, -1(%r10,%rax)                            #20.21
        jmp       ..B2.21       # Prob 100%                     #20.21
                                # LOE rbx rbp r12 r13 r14 r15
..B2.15:                        # Preds ..B2.6 ..B2.8
                                # Execution count [3.10e-01]
        movl      %r8d, %r10d                                   #19.4
        xorl      %r11d, %r11d                                  #19.4
        movl      $1, %eax                                      #19.4
        xorl      %r9d, %r9d                                    #19.4
        shrl      $1, %r10d                                     #19.4
        je        ..B2.19       # Prob 10%                      #19.4
                                # LOE rbx rbp rsi rdi r9 r10 r11 r12 r13 r14 r15 eax ecx r8d
..B2.16:                        # Preds ..B2.15
                                # Execution count [2.79e-01]
        movslq    %ecx, %rdx                                    #17.11
        movq      %r12, (%rsp)                                  #19.4[spill]
        lea       (%rdi,%rdx), %rax                             #20.21
        addq      %rsi, %rdx                                    #20.47
	.cfi_offset 12, -16
                                # LOE rax rdx rbx rbp rsi rdi r9 r10 r11 r13 r14 r15 ecx r8d
..B2.17:                        # Preds ..B2.17 ..B2.16
                                # Execution count [7.76e-01]
        movb      -1(%r9,%rdx), %r12b                           #20.47
        incq      %r11                                          #19.4
        movb      %r12b, -1(%r9,%rax)                           #20.21
        movb      -2(%r9,%rdx), %r12b                           #20.47
        movb      %r12b, -2(%r9,%rax)                           #20.21
        addq      $-2, %r9                                      #19.4
        cmpq      %r10, %r11                                    #19.4
        jb        ..B2.17       # Prob 64%                      #19.4
                                # LOE rax rdx rbx rbp rsi rdi r9 r10 r11 r13 r14 r15 ecx r8d
..B2.18:                        # Preds ..B2.17
                                # Execution count [2.79e-01]
        movq      (%rsp), %r12                                  #[spill]
	.cfi_restore 12
        lea       1(%r11,%r11), %eax                            #20.47
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 eax ecx r8d
..B2.19:                        # Preds ..B2.18 ..B2.15
                                # Execution count [3.10e-01]
        lea       -1(%rax), %edx                                #19.4
        cmpl      %r8d, %edx                                    #19.4
        jae       ..B2.21       # Prob 10%                      #19.4
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 eax ecx
..B2.20:                        # Preds ..B2.19
                                # Execution count [2.79e-01]
        movslq    %ecx, %rcx                                    #17.11
        movslq    %eax, %rax                                    #20.47
        addq      %rcx, %rsi                                    #20.47
        subq      %rax, %rsi                                    #20.47
        addq      %rdi, %rcx                                    #20.21
        subq      %rax, %rcx                                    #20.21
        movb      (%rsi), %sil                                  #20.47
        movb      %sil, (%rcx)                                  #20.21
                                # LOE rbx rbp r12 r13 r14 r15
..B2.21:                        # Preds ..B2.3 ..B2.2 ..B2.1 ..B2.13 ..B2.5
                                #       ..B2.19 ..B2.14 ..B2.20
                                # Execution count [6.21e-01]
        popq      %rcx                                          #24.1
	.cfi_def_cfa_offset 8
        ret                                                     #24.1
	.cfi_def_cfa_offset 16
                                # LOE
..B2.23:                        # Preds ..B2.4
                                # Execution count [3.12e-03]: Infreq
        movl      $.L_2__STRING.0, %edi                         #15.4
        movl      $.L_2__STRING.1, %esi                         #15.4
        movl      $15, %edx                                     #15.4
        movl      $__$U0, %ecx                                  #15.4
#       __assert_fail(const char *, const char *, unsigned int, const char *)
        call      __assert_fail                                 #15.4
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z12array_copy_1PhS_iii,@function
	.size	_Z12array_copy_1PhS_iii,.-_Z12array_copy_1PhS_iii
..LN_Z12array_copy_1PhS_iii.1:
	.data
# -- End  _Z12array_copy_1PhS_iii
	.section .rodata, "a"
	.align 32
	.align 32
__$U0:
	.long	1684631414
	.long	1920098592
	.long	1667201377
	.long	1601794159
	.long	1853171761
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
	.size	__$U0,67
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
	.long	6499889
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,8
	.data
	.section .note.GNU-stack, ""
# End
