# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.1.0.166 Build 20191121";
# mark_description "";
# mark_description "-mavx512f -o copy256.out.s -S";
	.file "copy_mask64_256.c"
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
                                                          #216.35
        pushq     %rbp                                          #216.35
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #216.35
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #216.35
        pushq     %r12                                          #216.35
        pushq     %r13                                          #216.35
        pushq     %r14                                          #216.35
        pushq     %r15                                          #216.35
        pushq     %rbx                                          #216.35
        subq      $88, %rsp                                     #216.35
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
        movq      %rsi, %rbx                                    #216.35
        movl      %edi, %r12d                                   #216.35
        movl      $3, %edi                                      #216.35
        xorl      %esi, %esi                                    #216.35
        call      __intel_new_feature_proc_init                 #216.35
                                # LOE rbx r12d
..B1.34:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        vstmxcsr  (%rsp)                                        #216.35
        orl       $32832, (%rsp)                                #216.35
        vldmxcsr  (%rsp)                                        #216.35
        cmpl      $4, %r12d                                     #217.15
        je        ..B1.4        # Prob 2%                       #217.15
                                # LOE rbx
..B1.2:                         # Preds ..B1.34
                                # Execution count [9.75e-01]
        movl      $il0_peep_printf_format_0, %edi               #218.5
        movq      stderr(%rip), %rsi                            #218.5
        call      fputs                                         #218.5
                                # LOE
..B1.3:                         # Preds ..B1.2
                                # Execution count [9.75e-01]
        movl      $-1, %eax                                     #219.12
        addq      $88, %rsp                                     #219.12
	.cfi_restore 3
        popq      %rbx                                          #219.12
	.cfi_restore 15
        popq      %r15                                          #219.12
	.cfi_restore 14
        popq      %r14                                          #219.12
	.cfi_restore 13
        popq      %r13                                          #219.12
	.cfi_restore 12
        popq      %r12                                          #219.12
        movq      %rbp, %rsp                                    #219.12
        popq      %rbp                                          #219.12
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #219.12
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
                                # LOE
..B1.4:                         # Preds ..B1.34
                                # Execution count [2.51e-02]: Infreq
        movl      $32768, %edi                                  #221.28
        movl      $64, %esi                                     #221.28
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #221.28
                                # LOE rax rbx
..B1.35:                        # Preds ..B1.4
                                # Execution count [2.51e-02]: Infreq
        movq      %rax, %r14                                    #221.28
                                # LOE rbx r14
..B1.5:                         # Preds ..B1.35
                                # Execution count [2.51e-02]: Infreq
        movl      $32768, %edi                                  #222.28
        movl      $64, %esi                                     #222.28
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #222.28
                                # LOE rax rbx r14
..B1.36:                        # Preds ..B1.5
                                # Execution count [2.51e-02]: Infreq
        movq      %rax, %r12                                    #222.28
                                # LOE rbx r12 r14
..B1.6:                         # Preds ..B1.36
                                # Execution count [2.51e-02]: Infreq
        movq      8(%rbx), %rdi                                 #223.21
        call      atol                                          #223.21
                                # LOE rax rbx r12 r14
..B1.37:                        # Preds ..B1.6
                                # Execution count [2.51e-02]: Infreq
        movq      %rax, %r15                                    #223.21
                                # LOE rbx r12 r14 r15
..B1.7:                         # Preds ..B1.37
                                # Execution count [2.51e-02]: Infreq
        xorl      %esi, %esi                                    #227.19
        lea       (%r12,%r15), %rax                             #225.3
        movq      16(%rbx), %rdi                                #227.19
        addq      %r15, %r14                                    #224.3
        movq      %rax, (%rsp)                                  #225.3[spill]
#       strtod(const char *, char **)
        call      strtod                                        #227.19
                                # LOE rbx r12 r14 r15 xmm0
..B1.8:                         # Preds ..B1.7
                                # Execution count [2.51e-02]: Infreq
        movq      %r15, %r13                                    #228.59
        movl      $.L_2__STRING.3, %esi                         #229.3
        negq      %r13                                          #228.59
        movq      %r15, %rdx                                    #229.3
        addq      $32768, %r13                                  #228.59
        movl      $1, %eax                                      #229.3
        vcvtusi2ssq %r13, %xmm16, %xmm16                        #228.59
        vcvtsd2ss %xmm0, %xmm0, %xmm0                           #227.19
        vmulss    %xmm0, %xmm16, %xmm1                          #228.59
        vcvtss2sd %xmm0, %xmm0, %xmm0                           #229.3
        vcvttss2usi %xmm1, %r13                                 #228.59
        movq      stdout(%rip), %rdi                            #229.3
#       fprintf(FILE *, const char *, ...)
        call      fprintf                                       #229.3
                                # LOE rbx r12 r13 r14 r15
..B1.9:                         # Preds ..B1.8
                                # Execution count [2.51e-02]: Infreq
        movl      $.L_2__STRING.4, %esi                         #230.3
        movq      %r13, %rdx                                    #230.3
        xorl      %eax, %eax                                    #230.3
        movq      stdout(%rip), %rdi                            #230.3
#       fprintf(FILE *, const char *, ...)
        call      fprintf                                       #230.3
                                # LOE rbx r12 r13 r14 r15
..B1.10:                        # Preds ..B1.9
                                # Execution count [2.26e-02]: Infreq
        addq      %r12, %r15                                    #222.16
        movq      %r15, %rsi                                    #232.3
        andq      $31, %rsi                                     #232.3
        je        ..B1.14       # Prob 50%                      #232.3
                                # LOE rbx rsi r13 r14 r15
..B1.11:                        # Preds ..B1.10
                                # Execution count [2.26e-02]: Infreq
        negq      %rsi                                          #232.3
        xorl      %ecx, %ecx                                    #232.3
        addq      $32, %rsi                                     #232.3
        xorl      %eax, %eax                                    #232.3
                                # LOE rax rbx rsi r13 r14 r15 ecx
..B1.12:                        # Preds ..B1.12 ..B1.11
                                # Execution count [1.26e-01]: Infreq
        incl      %ecx                                          #232.3
        movb      $1, (%rax,%r15)                               #232.3
        incq      %rax                                          #232.3
        cmpq      %rsi, %rcx                                    #232.3
        jb        ..B1.12       # Prob 82%                      #232.3
                                # LOE rax rbx rsi r13 r14 r15 ecx
..B1.14:                        # Preds ..B1.10 ..B1.12
                                # Execution count [2.26e-02]: Infreq
        movq      %rsi, %r8                                     #232.3
        movl      %esi, %eax                                    #232.3
        negq      %r8                                           #232.3
        addq      $32768, %r8                                   #232.3
        andq      $63, %r8                                      #232.3
        negq      %r8                                           #232.3
        vmovdqu   .L_2il0floatpacket.0(%rip), %ymm0             #232.3
        lea       32768(%r8), %rcx                              #232.3
                                # LOE rcx rbx rsi r8 r13 r14 r15 eax ymm0
..B1.15:                        # Preds ..B1.15 ..B1.14
                                # Execution count [1.26e-01]: Infreq
        addl      $64, %eax                                     #232.3
        vmovdqu   %ymm0, (%rsi,%r15)                            #232.3
        vmovdqu   %ymm0, 32(%rsi,%r15)                          #232.3
        addq      $64, %rsi                                     #232.3
        cmpq      %rcx, %rax                                    #232.3
        jb        ..B1.15       # Prob 82%                      #232.3
                                # LOE rcx rbx rsi r8 r13 r14 r15 eax ymm0
..B1.16:                        # Preds ..B1.15
                                # Execution count [2.26e-02]: Infreq
        xorl      %r9d, %r9d                                    #232.3
        lea       32769(%r8), %rax                              #232.3
        xorl      %esi, %esi                                    #232.3
        cmpq      $32768, %rax                                  #232.3
        ja        ..B1.20       # Prob 0%                       #232.3
                                # LOE rcx rbx rsi r8 r13 r14 r15 r9d
..B1.17:                        # Preds ..B1.16
                                # Execution count [2.26e-02]: Infreq
        negq      %rcx                                          #232.3
        lea       32768(%r15,%r8), %rax                         #232.3
        addq      $32768, %rcx                                  #232.3
                                # LOE rax rcx rbx rsi r13 r14 r9d
..B1.18:                        # Preds ..B1.18 ..B1.17
                                # Execution count [1.26e-01]: Infreq
        incl      %r9d                                          #232.3
        movb      $1, (%rsi,%rax)                               #232.3
        incq      %rsi                                          #232.3
        cmpq      %rcx, %r9                                     #232.3
        jb        ..B1.18       # Prob 82%                      #232.3
                                # LOE rax rcx rbx rsi r13 r14 r9d
..B1.20:                        # Preds ..B1.18 ..B1.16
                                # Execution count [2.51e-02]: Infreq
        xorl      %r15d, %r15d                                  #234.16
        movq      24(%rbx), %rdi                                #236.7
        xorl      %r12d, %r12d                                  #235.21
        vzeroupper                                              #236.7
        call      atol                                          #236.7
                                # LOE rax r12 r13 r14 r15
..B1.21:                        # Preds ..B1.20
                                # Execution count [2.51e-02]: Infreq
        cmpl      $1, %eax                                      #236.24
        je        ..B1.28       # Prob 16%                      #236.24
                                # LOE r12 r13 r14 r15
..B1.22:                        # Preds ..B1.21
                                # Execution count [1.95e-03]: Infreq
        xorl      %ebx, %ebx                                    #245.16
                                # LOE r12 r13 r14 r15 ebx
..B1.23:                        # Preds ..B1.24 ..B1.22
                                # Execution count [2.11e+04]: Infreq
        movq      %r14, %rdi                                    #247.14
        movq      %r13, %rdx                                    #247.14
        movl      $1, %ecx                                      #247.14
        movq      (%rsp), %rsi                                  #247.14[spill]
..___tag_value_main.26:
#       array_copy_rep(uint8_t *, uint8_t *, long, int)
        call      _Z14array_copy_repPhS_li                      #247.14
..___tag_value_main.27:
                                # LOE r12 r13 r14 r15 eax ebx
..B1.24:                        # Preds ..B1.23
                                # Execution count [2.11e+04]: Infreq
        movzbl    %al, %eax                                     #247.14
        incl      %ebx                                          #245.34
        addq      %rax, %r15                                    #247.7
        incq      %r12                                          #248.7
        cmpl      $33554432, %ebx                               #245.26
        jl        ..B1.23       # Prob 100%                     #245.26
                                # LOE r12 r13 r14 r15 ebx
..B1.26:                        # Preds ..B1.30 ..B1.24
                                # Execution count [0.00e+00]: Infreq
        movl      $.L_2__STRING.5, %edi                         #252.10
        movq      %r12, %rsi                                    #252.10
        movq      %r15, %rdx                                    #252.10
        xorl      %eax, %eax                                    #252.10
..___tag_value_main.29:
#       printf(const char *, ...)
        call      printf                                        #252.10
..___tag_value_main.30:
                                # LOE eax
..B1.27:                        # Preds ..B1.26
                                # Execution count [0.00e+00]: Infreq
        addq      $88, %rsp                                     #252.10
	.cfi_restore 3
        popq      %rbx                                          #252.10
	.cfi_restore 15
        popq      %r15                                          #252.10
	.cfi_restore 14
        popq      %r14                                          #252.10
	.cfi_restore 13
        popq      %r13                                          #252.10
	.cfi_restore 12
        popq      %r12                                          #252.10
        movq      %rbp, %rsp                                    #252.10
        popq      %rbp                                          #252.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #252.10
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
                                # LOE
..B1.28:                        # Preds ..B1.21
                                # Execution count [2.44e-04]: Infreq
        xorl      %ebx, %ebx                                    #238.16
                                # LOE r12 r13 r14 r15 ebx
..B1.29:                        # Preds ..B1.30 ..B1.28
                                # Execution count [4.02e+03]: Infreq
        movq      %r14, %rdi                                    #240.14
        movq      %r13, %rdx                                    #240.14
        movl      $1, %ecx                                      #240.14
        movq      (%rsp), %rsi                                  #240.14[spill]
..___tag_value_main.45:
#       array_copy_vec(uint8_t *, uint8_t *, long, int)
        call      _Z14array_copy_vecPhS_li                      #240.14
..___tag_value_main.46:
                                # LOE r12 r13 r14 r15 eax ebx
..B1.30:                        # Preds ..B1.29
                                # Execution count [4.02e+03]: Infreq
        movzbl    %al, %eax                                     #240.14
        incl      %ebx                                          #238.34
        addq      %rax, %r15                                    #240.7
        incq      %r12                                          #241.7
        cmpl      $33554432, %ebx                               #238.26
        jl        ..B1.29       # Prob 100%                     #238.26
        jmp       ..B1.26       # Prob 100%                     #238.26
        .align    16,0x90
                                # LOE r12 r13 r14 r15 ebx
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.0:
	.section .rodata.str1.32, "aMS",@progbits,1
	.align 32
	.align 32
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
	.long	2037411683
	.long	1648107582
	.long	1935633260
	.long	1600485993
	.long	1953265005
	.long	826023998
	.long	171847727
	.byte	0
	.data
# -- End  main
	.text
.L_2__routine_start__Z14array_copy_repPhS_li_1:
# -- Begin  _Z14array_copy_repPhS_li
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z14array_copy_repPhS_li
# --- array_copy_rep(uint8_t *, uint8_t *, long, int)
_Z14array_copy_repPhS_li:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z14array_copy_repPhS_li.49:
..L50:
                                                         #183.74
        subq      $24, %rsp                                     #183.74
	.cfi_def_cfa_offset 32
        movq      %rdi, (%rsp)                                  #183.74
        movq      %rsi, 8(%rsp)                                 #183.74
        cmpl      $1, %ecx                                      #185.8
        je        ..B2.7        # Prob 20%                      #185.8
                                # LOE rdx rbx rbp r12 r13 r14 r15 eax ecx
..B2.2:                         # Preds ..B2.1
                                # Execution count [8.00e-01]
        cmpl      $2, %ecx                                      #185.8
        je        ..B2.6        # Prob 25%                      #185.8
                                # LOE rbx rbp r12 r13 r14 r15 eax ecx
..B2.3:                         # Preds ..B2.2
                                # Execution count [6.00e-01]
        cmpl      $3, %ecx                                      #185.8
        je        ..B2.6        # Prob 33%                      #185.8
                                # LOE rbx rbp r12 r13 r14 r15 eax ecx
..B2.4:                         # Preds ..B2.3
                                # Execution count [4.00e-01]
        cmpl      $4, %ecx                                      #185.8
        je        ..B2.6        # Prob 50%                      #185.8
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B2.5:                         # Preds ..B2.4
                                # Execution count [2.00e-01]
        movl      $.L_2__STRING.0, %edi                         #205.6
        movl      $.L_2__STRING.1, %esi                         #205.6
        movl      $205, %edx                                    #205.6
        movl      $__$U1, %ecx                                  #205.6
#       __assert_fail(const char *, const char *, unsigned int, const char *)
        call      __assert_fail                                 #205.6
                                # LOE
..B2.6:                         # Preds ..B2.4 ..B2.3 ..B2.2
                                # Execution count [8.00e-01]
        addq      $24, %rsp                                     #207.11
	.cfi_def_cfa_offset 8
        ret                                                     #207.11
	.cfi_def_cfa_offset 32
                                # LOE
..B2.7:                         # Preds ..B2.1
                                # Execution count [2.00e-01]: Infreq
        movq      (%rsp), %rdi                                  #186.0
        movq      8(%rsp), %rsi                                 #186.0
        shrq      $3, %rdx                                      #186.0
        movq      %rdx, %rcx                                    #186.0
        rep                                                     #186.0
        movsq                                                   #186.0
        movl      -8(%rdi), %eax                                #186.0
        addq      $24, %rsp                                     #186.0
	.cfi_def_cfa_offset 8
        ret                                                     #186.0
        .align    16,0x90
                                # LOE rbx rbp r12 r13 r14 r15 eax
	.cfi_endproc
# mark_end;
	.type	_Z14array_copy_repPhS_li,@function
	.size	_Z14array_copy_repPhS_li,.-_Z14array_copy_repPhS_li
..LN_Z14array_copy_repPhS_li.1:
	.data
# -- End  _Z14array_copy_repPhS_li
	.text
.L_2__routine_start__Z14array_copy_vecPhS_li_2:
# -- Begin  _Z14array_copy_vecPhS_li
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z14array_copy_vecPhS_li
# --- array_copy_vec(uint8_t *, uint8_t *, long, int)
_Z14array_copy_vecPhS_li:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B3.1:                         # Preds ..B3.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z14array_copy_vecPhS_li.56:
..L57:
                                                         #23.73
        subq      $24, %rsp                                     #23.73
	.cfi_def_cfa_offset 32
        movq      %rdi, (%rsp)                                  #23.73
        movq      %rsi, 8(%rsp)                                 #23.73
        cmpl      $1, %ecx                                      #25.11
        je        ..B3.7        # Prob 20%                      #25.11
                                # LOE rdx rbx rbp r12 r13 r14 r15 ecx esi
..B3.2:                         # Preds ..B3.1
                                # Execution count [8.00e-01]
        cmpl      $2, %ecx                                      #25.11
        je        ..B3.6        # Prob 25%                      #25.11
                                # LOE rbx rbp r12 r13 r14 r15 ecx esi
..B3.3:                         # Preds ..B3.2
                                # Execution count [6.00e-01]
        cmpl      $3, %ecx                                      #25.11
        je        ..B3.6        # Prob 33%                      #25.11
                                # LOE rbx rbp r12 r13 r14 r15 ecx esi
..B3.4:                         # Preds ..B3.3
                                # Execution count [4.00e-01]
        cmpl      $4, %ecx                                      #25.11
        je        ..B3.6        # Prob 50%                      #25.11
                                # LOE rbx rbp r12 r13 r14 r15 esi
..B3.5:                         # Preds ..B3.4
                                # Execution count [2.00e-01]
        movl      $.L_2__STRING.0, %edi                         #177.7
        movl      $.L_2__STRING.1, %esi                         #177.7
        movl      $177, %edx                                    #177.7
        movl      $__$U0, %ecx                                  #177.7
#       __assert_fail(const char *, const char *, unsigned int, const char *)
        call      __assert_fail                                 #177.7
                                # LOE
..B3.6:                         # Preds ..B3.7 ..B3.4 ..B3.3 ..B3.2
                                # Execution count [8.00e-01]
        vzeroupper                                              #179.12
        movl      %esi, %eax                                    #179.12
        addq      $24, %rsp                                     #179.12
	.cfi_def_cfa_offset 8
        ret                                                     #179.12
	.cfi_def_cfa_offset 32
                                # LOE
..B3.7:                         # Preds ..B3.1
                                # Execution count [2.00e-01]: Infreq
# Begin ASM
        movq (%rsp)   ,  %rdi               
	movq 8(%rsp)   ,  %rsi               
	small_blocks:                    
	 cmpq     $0 , %rdx                
	 je exit                         
	block_32:                        
	 cmpq         $32 , %rdx           
	 jg           block_64           
	 mov          $1  , %rax        
	 shlx         %rdx  , %rax, %rax 
	 decq         %rax              
	 kmovq        %rax , %k1       
	 vmovdqu8     (%rsi) , %ymm0  {%k1}  
	 vmovdqu8     %ymm0 , (%rdi) {%k1}  
	 jmp          exit               
	block_64:                        
	 cmpq         $64  , %rdx          
	 jg           block_128          
	 vmovdqu32    (%rsi) , %ymm0   
	 vmovdqu32    %ymm0 , (%rdi)   
	 subq         $32  , %rdx          
	 mov          $1 , %rax         
	 shlx         %rdx  , %rax, %rax 
	 decq         %rax              
	 kmovq        %rax , %k1       
	 vmovdqu8     32(%rsi) , %ymm0  {%k1}  
	 vmovdqu8     %ymm0 , 32(%rdi) {%k1}  
	 jmp          exit               
	block_96:                        
	 cmpq         $96  , %rdx          
	 jg           block_128          
	 vmovdqu32    (%rsi) , %ymm0   
	 vmovdqu32    %ymm0 , (%rdi)   
	 vmovdqu32    32(%rsi) , %ymm0   
	 vmovdqu32    %ymm0 , 32(%rdi)   
	 subq         $64  , %rdx          
	 mov          $1  , %rax        
	 shlx         %rdx  , %rax, %rax 
	 decq         %rax              
	 kmovq        %rax , %k1       
	 vmovdqu8     64(%rsi) , %ymm0  {%k1}  
	 vmovdqu8     %ymm0 , 64(%rdi) {%k1}  
	 jmp          exit               
	block_128:                       
	 cmpq         $128  , %rdx          
	 jg           block_160          
	 vmovdqu32    (%rsi) , %ymm0   
	 vmovdqu32    %ymm0 , (%rdi)   
	 vmovdqu32    32(%rsi) , %ymm0   
	 vmovdqu32    %ymm0 , 32(%rdi)   
	 vmovdqu32    64(%rsi) , %ymm0  
	 vmovdqu32    %ymm0 , 64(%rdi)  
	 subq         $96  , %rdx          
	 mov          $1  , %rax        
	 shlx         %rdx  , %rax, %rax 
	 decq         %rax              
	 kmovq        %rax , %k1       
	 vmovdqu8     96(%rsi) , %ymm0  {%k1}  
	 vmovdqu8     %ymm0 , 96(%rdi) {%k1}  
	 jmp          exit               
	block_160:                       
	 cmpq         $160  , %rdx         
	 jg           block_192          
	 vmovdqu32    (%rsi) , %ymm0   
	 vmovdqu32    %ymm0 , (%rdi)   
	 vmovdqu32    32(%rsi) , %ymm0  
	 vmovdqu32    %ymm0 , 32(%rdi)  
	 vmovdqu32    64(%rsi) , %ymm0   
	 vmovdqu32    %ymm0 , 64(%rdi)   
	 vmovdqu32    96(%rsi) , %ymm0  
	 vmovdqu32    %ymm0 , 96(%rdi)  
	 subq         $128  , %rdx          
	 mov          $1  , %rax        
	 shlx         %rdx  , %rax, %rax 
	 decq         %rax              
	 kmovq        %rax , %k1       
	 vmovdqu8     128(%rsi) , %ymm0  {%k1}  
	 vmovdqu8     %ymm0 , 128(%rdi) {%k1}  
	 jmp          exit               
	block_192:                       
	 cmpq         $192  , %rdx         
	 jg           aligned_loop       
	 vmovdqu32    (%rsi) , %ymm0   
	 vmovdqu32    %ymm0 , (%rdi)   
	 vmovdqu32    32(%rsi) , %ymm0  
	 vmovdqu32    %ymm0 , 32(%rdi)  
	 vmovdqu32    64(%rsi) , %ymm0   
	 vmovdqu32    %ymm0 , 64(%rdi)   
	 vmovdqu32    96(%rsi) , %ymm0  
	 vmovdqu32    %ymm0 , 96(%rdi)  
	 vmovdqu32    128(%rsi) , %ymm0  
	 vmovdqu32    %ymm0 , 128(%rdi)  
	 subq         $160  , %rdx          
	 mov          $1  , %rax        
	 shlx         %rdx  , %rax, %rax 
	 decq         %rax              
	 kmovq        %rax , %k1       
	 vmovdqu8     160(%rsi) , %ymm0  {%k1}  
	 vmovdqu8     %ymm0 , 160(%rdi) {%k1}  
	 jmp          exit               
	aligned_loop:                    
	 mov          (%rsp)  , %rcx        
	 andq         $32 , %rcx        
	 negq         %rcx              
	 addq         $32 , %rcx        
	 mov          $1  ,  %rax       
	 shlx         %rcx , %rax, %rax 
	 decq         %rax              
	 kmovq        %rax , %k1       
	 vmovdqu8     %rsi , %ymm0  {%k1}  
	 vmovdqu8     %ymm0 , (%rdi) {%k1}  
	 addq         %rcx , %rdi      
	 addq         %rcx , %rsi      
	 subq         %rcx , %rdx         
	 cmpq         $192 , %rdx          
	 jl           small_blocks       
	 subq         $192 , %rdx          
	 mainloop:                       
	  vmovdqu32    (%rsi) , %ymm0   
	  vmovdqu32    %ymm0 , (%rdi)   
	  vmovdqu32    32(%rsi) , %ymm0   
	  vmovdqu32    %ymm0 , 32(%rdi)   
	  vmovdqu32    64(%rsi) , %ymm0   
	  vmovdqu32    %ymm0 , 64(%rdi)   
	  vmovdqu32    96(%rsi) , %ymm0   
	  vmovdqu32    %ymm0 , 96(%rdi)   
	  vmovdqu32    129(%rsi) , %ymm0   
	  vmovdqu32    %ymm0 , 128(%rdi)   
	  vmovdqu32    160(%rsi) , %ymm0   
	  vmovdqu32    %ymm0 , 160(%rdi)   
	  addq     $192 , %rdi          
	  addq     $192 , %rsi          
	  subq     $192 , %rdx             
	  ja       mainloop              
	 tail:                           
	  jmp  small_blocks              
	exit:                            
	mov    -8(%rdi) , %esi            
	
# End ASM                                                       #26.0
        jmp       ..B3.6        # Prob 100%                     #26.0
        .align    16,0x90
                                # LOE rbx rbp r12 r13 r14 r15 esi
	.cfi_endproc
# mark_end;
	.type	_Z14array_copy_vecPhS_li,@function
	.size	_Z14array_copy_vecPhS_li,.-_Z14array_copy_vecPhS_li
..LN_Z14array_copy_vecPhS_li.2:
	.data
# -- End  _Z14array_copy_vecPhS_li
	.text
.L_2__routine_start__Z8init_memPhc_3:
# -- Begin  _Z8init_memPhc
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z8init_memPhc
# --- init_mem(uint8_t *, char)
_Z8init_memPhc:
# parameter 1: %rdi
# parameter 2: %esi
..B4.1:                         # Preds ..B4.0
                                # Execution count [9.00e-01]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z8init_memPhc.62:
..L63:
                                                         #210.40
        movq      %rdi, %rax                                    #211.3
        andq      $31, %rax                                     #211.3
        je        ..B4.5        # Prob 50%                      #211.3
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 esi
..B4.2:                         # Preds ..B4.1
                                # Execution count [9.00e-01]
        negq      %rax                                          #211.3
        xorl      %ecx, %ecx                                    #211.3
        addq      $32, %rax                                     #211.3
        xorl      %edx, %edx                                    #211.3
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 ecx esi
..B4.3:                         # Preds ..B4.3 ..B4.2
                                # Execution count [5.00e+00]
        incl      %ecx                                          #211.3
        movb      %sil, (%rdx,%rdi)                             #212.5
        incq      %rdx                                          #211.3
        cmpq      %rax, %rcx                                    #211.3
        jb        ..B4.3        # Prob 82%                      #211.3
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 ecx esi
..B4.5:                         # Preds ..B4.1 ..B4.3
                                # Execution count [9.00e-01]
        movq      %rax, %rdx                                    #211.3
        vmovd     %esi, %xmm0                                   #212.14
        negq      %rdx                                          #211.3
        movl      %eax, %r8d                                    #211.3
        addq      $32768, %rdx                                  #211.3
        andq      $63, %rdx                                     #211.3
        negq      %rdx                                          #211.3
        vpbroadcastb %xmm0, %ymm0                               #212.14
        lea       32768(%rdx), %rcx                             #211.3
                                # LOE rax rdx rcx rbx rbp rdi r12 r13 r14 r15 esi r8d ymm0
..B4.6:                         # Preds ..B4.6 ..B4.5
                                # Execution count [5.00e+00]
        addl      $64, %r8d                                     #211.3
        vmovdqu   %ymm0, (%rax,%rdi)                            #212.5
        vmovdqu   %ymm0, 32(%rax,%rdi)                          #212.5
        addq      $64, %rax                                     #211.3
        cmpq      %rcx, %r8                                     #211.3
        jb        ..B4.6        # Prob 82%                      #211.3
                                # LOE rax rdx rcx rbx rbp rdi r12 r13 r14 r15 esi r8d ymm0
..B4.7:                         # Preds ..B4.6
                                # Execution count [9.00e-01]
        xorl      %r9d, %r9d                                    #211.3
        lea       32769(%rdx), %rax                             #211.3
        xorl      %r8d, %r8d                                    #211.3
        cmpq      $32768, %rax                                  #211.3
        ja        ..B4.11       # Prob 0%                       #211.3
                                # LOE rdx rcx rbx rbp rdi r8 r12 r13 r14 r15 esi r9d
..B4.8:                         # Preds ..B4.7
                                # Execution count [9.00e-01]
        negq      %rcx                                          #211.3
        lea       32768(%rdi,%rdx), %rax                        #212.5
        addq      $32768, %rcx                                  #211.3
                                # LOE rax rcx rbx rbp r8 r12 r13 r14 r15 esi r9d
..B4.9:                         # Preds ..B4.9 ..B4.8
                                # Execution count [5.00e+00]
        incl      %r9d                                          #211.3
        movb      %sil, (%r8,%rax)                              #212.5
        incq      %r8                                           #211.3
        cmpq      %rcx, %r9                                     #211.3
        jb        ..B4.9        # Prob 82%                      #211.3
                                # LOE rax rcx rbx rbp r8 r12 r13 r14 r15 esi r9d
..B4.11:                        # Preds ..B4.9 ..B4.7
                                # Execution count [1.00e+00]
        vzeroupper                                              #213.1
        ret                                                     #213.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z8init_memPhc,@function
	.size	_Z8init_memPhc,.-_Z8init_memPhc
..LN_Z8init_memPhc.3:
	.data
# -- End  _Z8init_memPhc
	.section .rodata, "a"
	.align 32
	.align 32
.L_2il0floatpacket.0:
	.long	0x01010101,0x01010101,0x01010101,0x01010101,0x01010101,0x01010101,0x01010101,0x01010101
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,32
	.align 32
__$U1:
	.long	1769172597
	.long	1684368999
	.long	1634231072
	.long	1918967922
	.long	1601790322
	.long	2037411683
	.long	1885696607
	.long	1936618792
	.long	1701734249
	.long	1751326820
	.long	706769505
	.long	1853169708
	.long	1852270963
	.long	1663067237
	.long	544366952
	.long	1814047786
	.long	744975983
	.long	1953392928
	.word	41
	.type	__$U1,@object
	.size	__$U1,74
	.space 22, 0x00 	# pad
	.align 32
__$U0:
	.long	1769172597
	.long	1684368999
	.long	1634231072
	.long	1918967922
	.long	1601790322
	.long	2037411683
	.long	1667593823
	.long	1936618792
	.long	1701734249
	.long	1751326820
	.long	706769505
	.long	1853169708
	.long	1852270963
	.long	1663067237
	.long	544366952
	.long	1814047786
	.long	744975983
	.long	1953392928
	.word	41
	.type	__$U0,@object
	.size	__$U0,74
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.3:
	.long	1834973811
	.long	544500853
	.long	1713709117
	.long	1852377632
	.long	1868526697
	.long	1702061670
	.long	540876916
	.long	680997
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,32
	.align 4
.L_2__STRING.4:
	.long	1601004909
	.long	1702521203
	.long	622869792
	.long	1646290028
	.long	1936028793
	.word	10
	.type	.L_2__STRING.4,@object
	.size	.L_2__STRING.4,22
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.5:
	.long	1702127963
	.long	975205234
	.long	1684808992
	.long	1699881053
	.long	540876915
	.long	174353445
	.byte	0
	.type	.L_2__STRING.5,@object
	.size	.L_2__STRING.5,25
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.0:
	.word	48
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,2
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.long	2037411683
	.long	1935764831
	.long	1597257323
	.long	775304498
	.word	99
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,18
	.data
	.section .note.GNU-stack, ""
# End
