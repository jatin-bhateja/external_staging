# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "";
# mark_description "-O3 -mavx512f -S";
	.file "logic_big_tree.c"
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
                                                          #18.14
        pushq     %rbp                                          #18.14
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #18.14
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #18.14
        pushq     %r12                                          #18.14
        pushq     %r13                                          #18.14
        pushq     %r14                                          #18.14
        pushq     %r15                                          #18.14
        pushq     %rbx                                          #18.14
        subq      $88, %rsp                                     #18.14
        xorl      %esi, %esi                                    #18.14
        movl      $3, %edi                                      #18.14
        call      __intel_new_feature_proc_init                 #18.14
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
                                # LOE
..B1.36:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        vstmxcsr  (%rsp)                                        #18.14
        xorl      %r14d, %r14d                                  #19.13
        movslq    VECLEN(%rip), %rdi                            #20.23
        orl       $32832, (%rsp)                                #18.14
        shlq      $2, %rdi                                      #20.23
        vldmxcsr  (%rsp)                                        #18.14
..___tag_value_main.11:
#       operator new[](unsigned long)
        call      _Znam                                         #20.23
..___tag_value_main.12:
                                # LOE rax r14d
..B1.35:                        # Preds ..B1.36
                                # Execution count [1.00e+00]
        movq      %rax, %r15                                    #20.23
                                # LOE r15 r14d
..B1.2:                         # Preds ..B1.35
                                # Execution count [1.00e+00]
        movslq    VECLEN(%rip), %rdi                            #22.24
        shlq      $2, %rdi                                      #22.24
..___tag_value_main.13:
#       operator new[](unsigned long)
        call      _Znam                                         #22.24
..___tag_value_main.14:
                                # LOE rax r15 r14d
..B1.37:                        # Preds ..B1.2
                                # Execution count [1.00e+00]
        movq      %rax, %r13                                    #22.24
                                # LOE r13 r15 r14d
..B1.3:                         # Preds ..B1.37
                                # Execution count [1.00e+00]
        movslq    VECLEN(%rip), %rdi                            #23.24
        shlq      $2, %rdi                                      #23.24
..___tag_value_main.15:
#       operator new[](unsigned long)
        call      _Znam                                         #23.24
..___tag_value_main.16:
                                # LOE rax r13 r15 r14d
..B1.38:                        # Preds ..B1.3
                                # Execution count [1.00e+00]
        movq      %rax, %r12                                    #23.24
                                # LOE r12 r13 r15 r14d
..B1.4:                         # Preds ..B1.38
                                # Execution count [1.00e+00]
        movslq    VECLEN(%rip), %rdi                            #24.24
        shlq      $2, %rdi                                      #24.24
..___tag_value_main.17:
#       operator new[](unsigned long)
        call      _Znam                                         #24.24
..___tag_value_main.18:
                                # LOE rax r12 r13 r15 r14d
..B1.39:                        # Preds ..B1.4
                                # Execution count [1.00e+00]
        movq      %rax, %rbx                                    #24.24
                                # LOE rbx r12 r13 r15 r14d
..B1.5:                         # Preds ..B1.39
                                # Execution count [1.00e+00]
        movl      VECLEN(%rip), %esi                            #26.25
        testl     %esi, %esi                                    #26.25
        jle       ..B1.22       # Prob 50%                      #26.25
                                # LOE rbx r12 r13 r15 esi r14d
..B1.6:                         # Preds ..B1.5
                                # Execution count [9.00e-01]
        cmpl      $166, %esi                                    #26.5
        jl        ..B1.32       # Prob 10%                      #26.5
                                # LOE rbx r12 r13 r15 esi r14d
..B1.7:                         # Preds ..B1.6
                                # Execution count [9.00e-01]
        movq      %rbx, %rdx                                    #26.5
        andq      $63, %rdx                                     #26.5
        testl     %edx, %edx                                    #26.5
        je        ..B1.10       # Prob 50%                      #26.5
                                # LOE rbx r12 r13 r15 edx esi r14d
..B1.8:                         # Preds ..B1.7
                                # Execution count [9.00e-01]
        testb     $3, %dl                                       #26.5
        jne       ..B1.31       # Prob 10%                      #26.5
                                # LOE rbx r12 r13 r15 edx esi r14d
..B1.9:                         # Preds ..B1.8
                                # Execution count [5.00e+00]
        negl      %edx                                          #26.5
        addl      $64, %edx                                     #26.5
        shrl      $2, %edx                                      #26.5
        cmpl      %edx, %esi                                    #26.5
        cmovl     %esi, %edx                                    #26.5
                                # LOE rbx r12 r13 r15 edx esi r14d
..B1.10:                        # Preds ..B1.9 ..B1.7
                                # Execution count [1.00e+00]
        movl      %esi, %eax                                    #26.5
        subl      %edx, %eax                                    #26.5
        andl      $15, %eax                                     #26.5
        negl      %eax                                          #26.5
        addl      %esi, %eax                                    #26.5
        cmpl      $1, %edx                                      #26.5
        jb        ..B1.14       # Prob 50%                      #26.5
                                # LOE rbx r12 r13 r15 eax edx esi r14d
..B1.11:                        # Preds ..B1.10
                                # Execution count [9.00e-01]
        vmovups   .L_2il0floatpacket.3(%rip), %zmm21            #26.5
        xorl      %r10d, %r10d                                  #26.5
        vmovups   .L_2il0floatpacket.4(%rip), %zmm20            #26.5
        vmovups   .L_2il0floatpacket.0(%rip), %zmm18            #27.16
        vmovups   .L_2il0floatpacket.1(%rip), %zmm17            #28.16
        vmovups   .L_2il0floatpacket.2(%rip), %zmm16            #29.16
        vpbroadcastd %edx, %zmm19                               #26.5
        movslq    %edx, %rdi                                    #26.5
                                # LOE rbx rdi r10 r12 r13 r15 eax edx esi r14d zmm16 zmm17 zmm18 zmm19 zmm20 zmm21
..B1.12:                        # Preds ..B1.12 ..B1.11
                                # Execution count [5.00e+00]
        vpcmpgtd  %zmm20, %zmm19, %k1                           #26.5
        vpaddd    %zmm21, %zmm20, %zmm20                        #26.5
        vmovdqu32 %zmm18, (%r13,%r10,4){%k1}                    #27.8
        vmovdqu32 %zmm17, (%r12,%r10,4){%k1}                    #28.8
        vmovdqu32 %zmm16, (%rbx,%r10,4){%k1}                    #29.8
        addq      $16, %r10                                     #26.5
        cmpq      %rdi, %r10                                    #26.5
        jb        ..B1.12       # Prob 82%                      #26.5
                                # LOE rbx rdi r10 r12 r13 r15 eax edx esi r14d zmm16 zmm17 zmm18 zmm19 zmm20 zmm21
..B1.13:                        # Preds ..B1.12
                                # Execution count [9.00e-01]
        cmpl      %edx, %esi                                    #26.5
        je        ..B1.22       # Prob 10%                      #26.5
                                # LOE rbx r12 r13 r15 eax edx esi r14d
..B1.14:                        # Preds ..B1.13 ..B1.10 ..B1.32
                                # Execution count [5.00e+00]
        lea       16(%rdx), %edi                                #26.5
        cmpl      %edi, %eax                                    #26.5
        jl        ..B1.18       # Prob 50%                      #26.5
                                # LOE rbx r12 r13 r15 eax edx esi r14d
..B1.15:                        # Preds ..B1.14
                                # Execution count [9.00e-01]
        movslq    %edx, %rdx                                    #26.5
        vmovups   .L_2il0floatpacket.0(%rip), %zmm18            #27.16
        vmovups   .L_2il0floatpacket.1(%rip), %zmm17            #28.16
        vmovups   .L_2il0floatpacket.2(%rip), %zmm16            #29.16
        movslq    %eax, %rdi                                    #26.5
                                # LOE rdx rbx rdi r12 r13 r15 eax esi r14d zmm16 zmm17 zmm18
..B1.16:                        # Preds ..B1.16 ..B1.15
                                # Execution count [5.00e+00]
        vmovdqu32 %zmm18, (%r13,%rdx,4)                         #27.8
        vmovdqu32 %zmm17, (%r12,%rdx,4)                         #28.8
        vmovdqu32 %zmm16, (%rbx,%rdx,4)                         #29.8
        addq      $16, %rdx                                     #26.5
        cmpq      %rdi, %rdx                                    #26.5
        jb        ..B1.16       # Prob 82%                      #26.5
                                # LOE rdx rbx rdi r12 r13 r15 eax esi r14d zmm16 zmm17 zmm18
..B1.18:                        # Preds ..B1.16 ..B1.14 ..B1.31
                                # Execution count [1.00e+00]
        lea       1(%rax), %edx                                 #26.5
        cmpl      %esi, %edx                                    #26.5
        ja        ..B1.22       # Prob 50%                      #26.5
                                # LOE rbx r12 r13 r15 eax esi r14d
..B1.19:                        # Preds ..B1.18
                                # Execution count [9.00e-01]
        movl      %esi, %edx                                    #26.5
        xorl      %r11d, %r11d                                  #26.5
        subl      %eax, %edx                                    #26.5
        movslq    %eax, %rax                                    #27.8
        vpbroadcastd %edx, %zmm16                               #26.5
        vmovups   .L_2il0floatpacket.3(%rip), %zmm21            #26.5
        vmovups   .L_2il0floatpacket.4(%rip), %zmm20            #26.5
        vmovups   .L_2il0floatpacket.0(%rip), %zmm19            #27.16
        vmovups   .L_2il0floatpacket.1(%rip), %zmm18            #28.16
        vmovups   .L_2il0floatpacket.2(%rip), %zmm17            #29.16
        movslq    %esi, %rdx                                    #26.5
        lea       (%rbx,%rax,4), %r10                           #29.8
        subq      %rax, %rdx                                    #26.5
        lea       (%r12,%rax,4), %rdi                           #28.8
        lea       (%r13,%rax,4), %rax                           #27.8
                                # LOE rax rdx rbx rdi r10 r11 r12 r13 r15 esi r14d zmm16 zmm17 zmm18 zmm19 zmm20 zmm21
..B1.20:                        # Preds ..B1.20 ..B1.19
                                # Execution count [5.00e+00]
        vpcmpgtd  %zmm20, %zmm16, %k1                           #26.5
        vpaddd    %zmm21, %zmm20, %zmm20                        #26.5
        vmovdqu32 %zmm19, (%rax,%r11,4){%k1}                    #27.8
        vmovdqu32 %zmm18, (%rdi,%r11,4){%k1}                    #28.8
        vmovdqu32 %zmm17, (%r10,%r11,4){%k1}                    #29.8
        addq      $16, %r11                                     #26.5
        cmpq      %rdx, %r11                                    #26.5
        jb        ..B1.20       # Prob 82%                      #26.5
                                # LOE rax rdx rbx rdi r10 r11 r12 r13 r15 esi r14d zmm16 zmm17 zmm18 zmm19 zmm20 zmm21
..B1.22:                        # Preds ..B1.20 ..B1.5 ..B1.18 ..B1.13
                                # Execution count [1.00e+00]
        xorl      %edi, %edi                                    #32.15
        movq      %r15, (%rsp)                                  #32.15[spill]
        movl      %edi, %r15d                                   #32.15
                                # LOE rbx r12 r13 esi r14d r15d
..B1.23:                        # Preds ..B1.42 ..B1.22
                                # Execution count [1.00e+05]
        decl      %esi                                          #33.14
        movl      %r15d, %edi                                   #33.14
        andl      %r15d, %esi                                   #33.14
        movq      %r13, %rcx                                    #33.14
        movq      %r12, %r8                                     #33.14
        movq      %rbx, %r9                                     #33.14
        movq      (%rsp), %rdx                                  #33.14[spill]
        vzeroupper                                              #33.14
..___tag_value_main.21:
#       workload(int, int, int *, int *, int *, int *)
        call      _Z8workloadiiPiS_S_S_                         #33.14
..___tag_value_main.22:
                                # LOE rbx r12 r13 eax r14d r15d
..B1.24:                        # Preds ..B1.23
                                # Execution count [1.00e+05]
        incl      %r15d                                         #32.34
        addl      %eax, %r14d                                   #33.7
        cmpl      $100000, %r15d                                #32.25
        jge       ..B1.25       # Prob 0%                       #32.25
                                # LOE rbx r12 r13 r14d r15d
..B1.42:                        # Preds ..B1.24
                                # Execution count [1.00e+05]
        movl      VECLEN(%rip), %esi                            #26.25
        jmp       ..B1.23       # Prob 100%                     #26.25
                                # LOE rbx r12 r13 esi r14d r15d
..B1.25:                        # Preds ..B1.24
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.0, %edi                         #35.5
        movl      %r14d, %esi                                   #35.5
        xorl      %eax, %eax                                    #35.5
        movq      (%rsp), %r15                                  #[spill]
..___tag_value_main.23:
#       printf(const char *, ...)
        call      printf                                        #35.5
..___tag_value_main.24:
                                # LOE rbx r12 r13 r15 r14d
..B1.26:                        # Preds ..B1.25
                                # Execution count [1.00e+00]
        xorl      %edi, %edi                                    #37.15
        movq      %r15, (%rsp)                                  #37.15[spill]
        movq      %r12, %r15                                    #37.15
        movq      %rbx, %r12                                    #37.15
        movl      %edi, %ebx                                    #37.15
                                # LOE r12 r13 r15 ebx r14d
..B1.27:                        # Preds ..B1.28 ..B1.26
                                # Execution count [1.00e+03]
        movl      VECLEN(%rip), %esi                            #38.14
        movl      %ebx, %edi                                    #38.14
        decl      %esi                                          #38.14
        movq      %r13, %rcx                                    #38.14
        andl      %ebx, %esi                                    #38.14
        movq      %r15, %r8                                     #38.14
        movq      %r12, %r9                                     #38.14
        movq      (%rsp), %rdx                                  #38.14[spill]
..___tag_value_main.27:
#       workload(int, int, int *, int *, int *, int *)
        call      _Z8workloadiiPiS_S_S_                         #38.14
..___tag_value_main.28:
                                # LOE r12 r13 r15 eax ebx r14d
..B1.28:                        # Preds ..B1.27
                                # Execution count [1.00e+03]
        incl      %ebx                                          #37.32
        addl      %eax, %r14d                                   #38.7
        cmpl      $1000, %ebx                                   #37.25
        jl        ..B1.27       # Prob 99%                      #37.25
                                # LOE r12 r13 r15 ebx r14d
..B1.29:                        # Preds ..B1.28
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.0, %edi                         #42.5
        movl      %r14d, %esi                                   #42.5
        xorl      %eax, %eax                                    #42.5
..___tag_value_main.30:
#       printf(const char *, ...)
        call      printf                                        #42.5
..___tag_value_main.31:
                                # LOE
..B1.30:                        # Preds ..B1.29
                                # Execution count [1.00e+00]
        xorl      %eax, %eax                                    #43.3
        addq      $88, %rsp                                     #43.3
	.cfi_restore 3
        popq      %rbx                                          #43.3
	.cfi_restore 15
        popq      %r15                                          #43.3
	.cfi_restore 14
        popq      %r14                                          #43.3
	.cfi_restore 13
        popq      %r13                                          #43.3
	.cfi_restore 12
        popq      %r12                                          #43.3
        movq      %rbp, %rsp                                    #43.3
        popq      %rbp                                          #43.3
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #43.3
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
                                # LOE
..B1.31:                        # Preds ..B1.8
                                # Execution count [9.00e-02]: Infreq
        xorl      %eax, %eax                                    #26.5
        jmp       ..B1.18       # Prob 100%                     #26.5
                                # LOE rbx r12 r13 r15 eax esi r14d
..B1.32:                        # Preds ..B1.6
                                # Execution count [9.00e-02]: Infreq
        movl      %esi, %eax                                    #26.5
        xorl      %edx, %edx                                    #26.5
        andl      $-16, %eax                                    #26.5
        jmp       ..B1.14       # Prob 100%                     #26.5
        .align    16,0x90
                                # LOE rbx r12 r13 r15 eax edx esi r14d
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.0:
	.data
# -- End  main
	.text
.L_2__routine_start__Z8workloadiiPiS_S_S__1:
# -- Begin  _Z8workloadiiPiS_S_S_
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z8workloadiiPiS_S_S_
# --- workload(int, int, int *, int *, int *, int *)
_Z8workloadiiPiS_S_S_:
# parameter 1: %edi
# parameter 2: %esi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
# parameter 6: %r9
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.25e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z8workloadiiPiS_S_S_.47:
..L48:
                                                         #9.75
        movq      %rdx, %r10                                    #9.75
        movl      %esi, %edi                                    #9.75
        cmpl      $0, VECLEN(%rip)                              #10.25
        jle       ..B2.8        # Prob 10%                      #10.25
                                # LOE rcx rbx rbp r8 r9 r10 r12 r13 r14 r15 edi
..B2.2:                         # Preds ..B2.1
                                # Execution count [1.25e+00]
        xorl      %esi, %esi                                    #10.5
        movq      %r14, -40(%rsp)                               #10.5[spill]
        xorl      %edx, %edx                                    #10.5
        movq      %r15, -32(%rsp)                               #10.5[spill]
        movq      %rbx, -24(%rsp)                               #10.5[spill]
        movq      %rbp, -16(%rsp)                               #10.5[spill]
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 14, -48
	.cfi_offset 15, -40
                                # LOE rcx r8 r9 r10 r12 r13 edx esi edi
..B2.3:                         # Preds ..B2.6 ..B2.2
                                # Execution count [1.25e+00]
        incl      %esi                                          #10.5
        addl      $4, %edx                                      #10.5
        movslq    %esi, %rax                                    #11.7
        shlq      $4, %rax                                      #11.7
        movl      -16(%r8,%rax), %r14d                          #12.83
        movl      %r14d, %ebx                                   #12.20
        movl      -16(%r9,%rax), %ebp                           #12.100
        xorl      %ebp, %ebx                                    #12.20
        movl      %r14d, %r15d                                  #12.52
        movl      -16(%rcx,%rax), %r11d                         #12.107
        andl      %r11d, %ebx                                   #12.13
        andl      %ebp, %r15d                                   #12.52
        xorl      %r15d, %ebx                                   #12.52
        movl      %r11d, %r15d                                  #12.66
        notl      %r15d                                         #12.66
        andl      %r14d, %r15d                                  #12.73
        notl      %r14d                                         #12.83
        andl      %ebp, %r14d                                   #12.90
        notl      %ebp                                          #12.100
        orl       %r14d, %r15d                                  #12.90
        andl      %r11d, %ebp                                   #12.107
        orl       %ebp, %r15d                                   #12.107
        andl      %r15d, %ebx                                   #12.107
        movl      %ebx, -16(%rax,%r10)                          #11.7
        lea       -3(%rdx), %ebx                                #10.15
        cmpl      VECLEN(%rip), %ebx                            #10.25
        jge       ..B2.7        # Prob 18%                      #10.25
                                # LOE rax rcx r8 r9 r10 r12 r13 edx esi edi
..B2.4:                         # Preds ..B2.3
                                # Execution count [0.00e+00]
        movl      -12(%r8,%rax), %r14d                          #12.83
        movl      %r14d, %ebx                                   #12.20
        movl      -12(%r9,%rax), %ebp                           #12.100
        xorl      %ebp, %ebx                                    #12.20
        movl      %r14d, %r15d                                  #12.52
        movl      -12(%rcx,%rax), %r11d                         #12.107
        andl      %r11d, %ebx                                   #12.13
        andl      %ebp, %r15d                                   #12.52
        xorl      %r15d, %ebx                                   #12.52
        movl      %r11d, %r15d                                  #12.66
        notl      %r15d                                         #12.66
        andl      %r14d, %r15d                                  #12.73
        notl      %r14d                                         #12.83
        andl      %ebp, %r14d                                   #12.90
        notl      %ebp                                          #12.100
        orl       %r14d, %r15d                                  #12.90
        andl      %r11d, %ebp                                   #12.107
        orl       %ebp, %r15d                                   #12.107
        andl      %r15d, %ebx                                   #12.107
        movl      %ebx, -12(%rax,%r10)                          #11.7
        lea       -2(%rdx), %ebx                                #10.15
        cmpl      VECLEN(%rip), %ebx                            #10.25
        jge       ..B2.7        # Prob 18%                      #10.25
                                # LOE rax rcx r8 r9 r10 r12 r13 edx esi edi
..B2.5:                         # Preds ..B2.4
                                # Execution count [0.00e+00]
        movl      -8(%r8,%rax), %r14d                           #12.83
        movl      %r14d, %ebx                                   #12.20
        movl      -8(%r9,%rax), %ebp                            #12.100
        xorl      %ebp, %ebx                                    #12.20
        movl      %r14d, %r15d                                  #12.52
        movl      -8(%rcx,%rax), %r11d                          #12.107
        andl      %r11d, %ebx                                   #12.13
        andl      %ebp, %r15d                                   #12.52
        xorl      %r15d, %ebx                                   #12.52
        movl      %r11d, %r15d                                  #12.66
        notl      %r15d                                         #12.66
        andl      %r14d, %r15d                                  #12.73
        notl      %r14d                                         #12.83
        andl      %ebp, %r14d                                   #12.90
        notl      %ebp                                          #12.100
        orl       %r14d, %r15d                                  #12.90
        andl      %r11d, %ebp                                   #12.107
        orl       %ebp, %r15d                                   #12.107
        andl      %r15d, %ebx                                   #12.107
        movl      %ebx, -8(%rax,%r10)                           #11.7
        lea       -1(%rdx), %ebx                                #10.15
        cmpl      VECLEN(%rip), %ebx                            #10.25
        jge       ..B2.7        # Prob 18%                      #10.25
                                # LOE rax rcx r8 r9 r10 r12 r13 edx esi edi
..B2.6:                         # Preds ..B2.5
                                # Execution count [0.00e+00]
        movl      -4(%r8,%rax), %r14d                           #12.83
        movl      %r14d, %ebx                                   #12.20
        movl      -4(%r9,%rax), %ebp                            #12.100
        xorl      %ebp, %ebx                                    #12.20
        movl      %r14d, %r15d                                  #12.52
        movl      -4(%rcx,%rax), %r11d                          #12.107
        andl      %r11d, %ebx                                   #12.13
        andl      %ebp, %r15d                                   #12.52
        xorl      %r15d, %ebx                                   #12.52
        movl      %r11d, %r15d                                  #12.66
        notl      %r15d                                         #12.66
        andl      %r14d, %r15d                                  #12.73
        notl      %r14d                                         #12.83
        andl      %ebp, %r14d                                   #12.90
        notl      %ebp                                          #12.100
        orl       %r14d, %r15d                                  #12.90
        andl      %r11d, %ebp                                   #12.107
        orl       %ebp, %r15d                                   #12.107
        andl      %r15d, %ebx                                   #12.107
        movl      %ebx, -4(%rax,%r10)                           #11.7
        cmpl      VECLEN(%rip), %edx                            #10.25
        jl        ..B2.3        # Prob 82%                      #10.25
                                # LOE rcx r8 r9 r10 r12 r13 edx esi edi
..B2.7:                         # Preds ..B2.4 ..B2.5 ..B2.3 ..B2.6
                                # Execution count [0.00e+00]
        movq      -40(%rsp), %r14                               #[spill]
	.cfi_restore 14
        movq      -32(%rsp), %r15                               #[spill]
	.cfi_restore 15
        movq      -24(%rsp), %rbx                               #[spill]
	.cfi_restore 3
        movq      -16(%rsp), %rbp                               #[spill]
	.cfi_restore 6
                                # LOE rbx rbp r10 r12 r13 r14 r15 edi
..B2.8:                         # Preds ..B2.1 ..B2.7
                                # Execution count [1.00e+00]
        movslq    %edi, %rdi                                    #15.12
        movl      (%r10,%rdi,4), %eax                           #15.12
        ret                                                     #15.12
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z8workloadiiPiS_S_S_,@function
	.size	_Z8workloadiiPiS_S_S_,.-_Z8workloadiiPiS_S_S_
..LN_Z8workloadiiPiS_S_S_.1:
	.data
# -- End  _Z8workloadiiPiS_S_S_
	.data
	.align 4
	.align 4
	.globl VECLEN
VECLEN:
	.long	2048
	.type	VECLEN,@object
	.size	VECLEN,4
	.section .rodata, "a"
	.align 64
	.align 64
.L_2il0floatpacket.0:
	.long	0x0000000f,0x0000000f,0x0000000f,0x0000000f,0x0000000f,0x0000000f,0x0000000f,0x0000000f,0x0000000f,0x0000000f,0x0000000f,0x0000000f,0x0000000f,0x0000000f,0x0000000f,0x0000000f
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,64
	.align 64
.L_2il0floatpacket.1:
	.long	0x00000003,0x00000003,0x00000003,0x00000003,0x00000003,0x00000003,0x00000003,0x00000003,0x00000003,0x00000003,0x00000003,0x00000003,0x00000003,0x00000003,0x00000003,0x00000003
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,64
	.align 64
.L_2il0floatpacket.2:
	.long	0x0000000c,0x0000000c,0x0000000c,0x0000000c,0x0000000c,0x0000000c,0x0000000c,0x0000000c,0x0000000c,0x0000000c,0x0000000c,0x0000000c,0x0000000c,0x0000000c,0x0000000c,0x0000000c
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,64
	.align 64
.L_2il0floatpacket.3:
	.long	0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,64
	.align 64
.L_2il0floatpacket.4:
	.long	0x00000000,0x00000001,0x00000002,0x00000003,0x00000004,0x00000005,0x00000006,0x00000007,0x00000008,0x00000009,0x0000000a,0x0000000b,0x0000000c,0x0000000d,0x0000000e,0x0000000f
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,64
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.long	544433490
	.long	1680154685
	.word	10
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,10
	.data
	.section .note.GNU-stack, ""
# End
