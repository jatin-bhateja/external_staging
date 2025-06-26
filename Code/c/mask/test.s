# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "";
# mark_description "-mavx512f -O3 -S";
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
                                                          #15.12
        pushq     %rbp                                          #15.12
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #15.12
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #15.12
        subq      $16512, %rsp                                  #15.12
        xorl      %esi, %esi                                    #15.12
        movl      $3, %edi                                      #15.12
        call      __intel_new_feature_proc_init                 #15.12
                                # LOE rbx r12 r13 r14 r15
..B1.10:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        vstmxcsr  (%rsp)                                        #15.12
        vmovups   .L_2il0floatpacket.0(%rip), %zmm19            #22.30
        vmovups   .L_2il0floatpacket.1(%rip), %zmm18            #22.30
        vmovups   .L_2il0floatpacket.2(%rip), %zmm17            #22.12
        vmovups   .L_2il0floatpacket.3(%rip), %zmm16            #23.19
        orl       $32832, (%rsp)                                #15.12
        xorl      %eax, %eax                                    #21.3
        vldmxcsr  (%rsp)                                        #15.12
                                # LOE rax rbx r12 r13 r14 r15 zmm16 zmm17 zmm18 zmm19
..B1.2:                         # Preds ..B1.2 ..B1.10
                                # Execution count [1.02e+03]
        vpandd    %zmm16, %zmm17, %zmm20                        #23.19
        vmovdqu32 %zmm18, 4160(%rsp,%rax,4)                     #22.12
        vmovdqu32 %zmm18, 8256(%rsp,%rax,4)                     #22.5
        vmovdqu32 %zmm20, 12352(%rsp,%rax,4)                    #23.5
        vpaddd    %zmm19, %zmm18, %zmm18                        #22.30
        vpaddd    %zmm19, %zmm17, %zmm17                        #22.12
        addq      $16, %rax                                     #21.3
        cmpq      $1024, %rax                                   #21.3
        jb        ..B1.2        # Prob 99%                      #21.3
                                # LOE rax rbx r12 r13 r14 r15 zmm16 zmm17 zmm18 zmm19
..B1.3:                         # Preds ..B1.2
                                # Execution count [6.25e-02]
        xorl      %esi, %esi                                    #25.11
        movq      %r12, 8(%rsp)                                 #26.3[spill]
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xbf, 0xff, 0xff, 0x22
        movl      %esi, %r12d                                   #26.3
        movq      %r13, (%rsp)                                  #26.3[spill]
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x80, 0xbf, 0xff, 0xff, 0x22
        movl      %esi, %r13d                                   #26.3
                                # LOE rbx r14 r15 r12d r13d
..B1.4:                         # Preds ..B1.5 ..B1.3
                                # Execution count [1.00e+06]
        vzeroupper                                              #27.13
        lea       12352(%rsp), %rdi                             #27.13
        lea       16(%rsp), %rsi                                #27.13
        lea       8256(%rsp), %rdx                              #27.13
        lea       4160(%rsp), %rcx                              #27.13
..___tag_value_main.10:
#       micro(int *, int *, int *, int *)
        call      _Z5microPiS_S_S_                              #27.13
..___tag_value_main.11:
                                # LOE rbx r14 r15 eax r12d r13d
..B1.5:                         # Preds ..B1.4
                                # Execution count [1.00e+06]
        incl      %r12d                                         #26.3
        addl      %eax, %r13d                                   #27.6
        cmpl      $10000000, %r12d                              #26.3
        jb        ..B1.4        # Prob 99%                      #26.3
                                # LOE rbx r14 r15 r12d r13d
..B1.6:                         # Preds ..B1.5
                                # Execution count [7.63e-02]
        movl      %r13d, %esi                                   #
        movl      $.L_2__STRING.0, %edi                         #28.10
        xorl      %eax, %eax                                    #28.10
        movq      8(%rsp), %r12                                 #[spill]
	.cfi_restore 12
        movq      (%rsp), %r13                                  #[spill]
	.cfi_restore 13
..___tag_value_main.16:
#       printf(const char *, ...)
        call      printf                                        #28.10
..___tag_value_main.17:
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xbf, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x80, 0xbf, 0xff, 0xff, 0x22
                                # LOE rbx r12 r13 r14 r15 eax
..B1.7:                         # Preds ..B1.6
                                # Execution count [7.63e-02]
        movq      %rbp, %rsp                                    #28.10
        popq      %rbp                                          #28.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #28.10
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
.L_2__routine_start__Z5microPiS_S_S__1:
# -- Begin  _Z5microPiS_S_S_
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z5microPiS_S_S_
# --- micro(int *, int *, int *, int *)
_Z5microPiS_S_S_:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z5microPiS_S_S_.23:
..L24:
                                                         #5.51
        movq      %rsi, %rax                                    #8.9
        subq      %rdi, %rax                                    #8.9
        cmpq      $4096, %rax                                   #6.3
        jge       ..B2.3        # Prob 50%                      #6.3
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15
..B2.2:                         # Preds ..B2.1
                                # Execution count [0.00e+00]
        negq      %rax                                          #10.5
        cmpq      $4096, %rax                                   #6.3
        jl        ..B2.20       # Prob 50%                      #6.3
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15
..B2.3:                         # Preds ..B2.1 ..B2.2
                                # Execution count [0.00e+00]
        movq      %rsi, %rax                                    #9.15
        subq      %rdx, %rax                                    #9.15
        cmpq      $4096, %rax                                   #6.3
        jge       ..B2.5        # Prob 50%                      #6.3
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15
..B2.4:                         # Preds ..B2.3
                                # Execution count [0.00e+00]
        negq      %rax                                          #10.5
        cmpq      $4096, %rax                                   #6.3
        jl        ..B2.20       # Prob 50%                      #6.3
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15
..B2.5:                         # Preds ..B2.3 ..B2.4
                                # Execution count [0.00e+00]
        movq      %rsi, %rax                                    #9.22
        subq      %rcx, %rax                                    #9.22
        cmpq      $4096, %rax                                   #6.3
        jge       ..B2.7        # Prob 50%                      #6.3
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15
..B2.6:                         # Preds ..B2.5
                                # Execution count [0.00e+00]
        negq      %rax                                          #10.5
        cmpq      $4096, %rax                                   #6.3
        jl        ..B2.20       # Prob 50%                      #6.3
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15
..B2.7:                         # Preds ..B2.5 ..B2.6
                                # Execution count [5.00e-01]
        movq      %rsi, %rax                                    #6.3
        andq      $63, %rax                                     #6.3
        testl     %eax, %eax                                    #6.3
        je        ..B2.12       # Prob 50%                      #6.3
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 eax
..B2.8:                         # Preds ..B2.7
                                # Execution count [5.00e-01]
        testb     $3, %al                                       #6.3
        jne       ..B2.30       # Prob 10%                      #6.3
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 eax
..B2.9:                         # Preds ..B2.8
                                # Execution count [5.00e-01]
        negl      %eax                                          #6.3
        xorl      %r8d, %r8d                                    #6.3
        addl      $64, %eax                                     #6.3
        shrl      $2, %eax                                      #6.3
        vmovups   .L_2il0floatpacket.0(%rip), %zmm18            #6.3
        movl      %eax, %r9d                                    #6.3
        vmovups   .L_2il0floatpacket.2(%rip), %zmm17            #6.3
        vpbroadcastd %eax, %zmm16                               #6.3
                                # LOE rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15 eax zmm16 zmm17 zmm18
..B2.10:                        # Preds ..B2.10 ..B2.9
                                # Execution count [5.12e+02]
        vpcmpud   $6, %zmm17, %zmm16, %k4                       #6.3
        vpaddd    %zmm18, %zmm17, %zmm17                        #6.3
        vmovdqu32 (%rdi,%r8,4), %zmm19{%k4}{z}                  #8.9
        vptestnmd %zmm19, %zmm19, %k0                           #8.9
        kandnw    %k4, %k0, %k1                                 #8.9
        kandw     %k0, %k4, %k2                                 #7.15
        vmovdqu32 (%rdx,%r8,4), %zmm20{%k1}{z}                  #9.22
        knotw     %k2, %k3                                      #7.15
        vpaddd    (%rcx,%r8,4), %zmm20, %zmm21{%k1}{z}          #9.22
        vmovdqa32 %zmm21, %zmm22{%k3}{z}                        #7.15
        vmovdqu32 %zmm22, (%rsi,%r8,4){%k4}                     #10.5
        addq      $16, %r8                                      #6.3
        cmpq      %r9, %r8                                      #6.3
        jb        ..B2.10       # Prob 99%                      #6.3
        jmp       ..B2.13       # Prob 100%                     #6.3
                                # LOE rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15 eax zmm16 zmm17 zmm18
..B2.12:                        # Preds ..B2.7
                                # Execution count [2.50e-01]
        xorl      %r9d, %r9d                                    #6.3
                                # LOE rdx rcx rbx rbp rsi rdi r9 r12 r13 r14 r15 eax
..B2.13:                        # Preds ..B2.10 ..B2.12
                                # Execution count [5.00e-01]
        negl      %eax                                          #6.3
        andl      $15, %eax                                     #6.3
        negl      %eax                                          #6.3
        addl      $1024, %eax                                   #6.3
        movl      %eax, %r8d                                    #6.3
        vpxord    %zmm16, %zmm16, %zmm16                        #9.22
                                # LOE rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15 eax zmm16
..B2.14:                        # Preds ..B2.14 ..B2.13
                                # Execution count [5.12e+02]
        vpcmpd    $4, (%rdi,%r9,4), %zmm16, %k1                 #8.9
        vmovups   (%rdx,%r9,4), %zmm17                          #9.22
        vpaddd    (%rcx,%r9,4), %zmm17, %zmm18{%k1}{z}          #9.22
        vmovdqu32 %zmm18, (%rsi,%r9,4)                          #10.5
        addq      $16, %r9                                      #6.3
        cmpq      %r8, %r9                                      #6.3
        jb        ..B2.14       # Prob 99%                      #6.3
                                # LOE rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15 eax zmm16
..B2.16:                        # Preds ..B2.14 ..B2.30
                                # Execution count [5.00e-01]
        lea       1(%rax), %r8d                                 #6.3
        cmpl      $1024, %r8d                                   #6.3
        ja        ..B2.29       # Prob 50%                      #6.3
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 eax
..B2.17:                        # Preds ..B2.16
                                # Execution count [5.00e-01]
        movl      %eax, %r8d                                    #6.3
        xorl      %r9d, %r9d                                    #6.3
        negl      %r8d                                          #6.3
        addl      $1024, %r8d                                   #6.3
        vmovups   .L_2il0floatpacket.0(%rip), %zmm18            #6.3
        vmovups   .L_2il0floatpacket.2(%rip), %zmm17            #6.3
        vpbroadcastd %r8d, %zmm16                               #6.3
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 eax r8d r9d zmm16 zmm17 zmm18
..B2.18:                        # Preds ..B2.18 ..B2.17
                                # Execution count [5.12e+02]
        vpcmpud   $6, %zmm17, %zmm16, %k4                       #6.3
        lea       (%rax,%r9), %r10d                             #10.5
        vpaddd    %zmm18, %zmm17, %zmm17                        #6.3
        movslq    %r10d, %r10                                   #10.5
        addl      $16, %r9d                                     #6.3
        vmovdqu32 (%rdi,%r10,4), %zmm19{%k4}{z}                 #8.9
        vptestnmd %zmm19, %zmm19, %k0                           #8.9
        kandnw    %k4, %k0, %k1                                 #8.9
        kandw     %k0, %k4, %k2                                 #7.15
        vmovdqu32 (%rdx,%r10,4), %zmm20{%k1}{z}                 #9.22
        knotw     %k2, %k3                                      #7.15
        vpaddd    (%rcx,%r10,4), %zmm20, %zmm21{%k1}{z}         #9.22
        vmovdqa32 %zmm21, %zmm22{%k3}{z}                        #7.15
        vmovdqu32 %zmm22, (%rsi,%r10,4){%k4}                    #10.5
        cmpl      %r8d, %r9d                                    #6.3
        jb        ..B2.18       # Prob 99%                      #6.3
        jmp       ..B2.29       # Prob 100%                     #6.3
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 eax r8d r9d zmm16 zmm17 zmm18
..B2.20:                        # Preds ..B2.2 ..B2.4 ..B2.6
                                # Execution count [5.00e-01]
        xorl      %eax, %eax                                    #6.3
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15
..B2.21:                        # Preds ..B2.27 ..B2.20
                                # Execution count [2.56e+02]
        cmpl      $0, (%rdi,%rax,8)                             #8.9
        je        ..B2.23       # Prob 50%                      #8.9
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15
..B2.22:                        # Preds ..B2.21
                                # Execution count [1.28e+02]
        movl      (%rdx,%rax,8), %r8d                           #9.15
        addl      (%rcx,%rax,8), %r8d                           #9.22
        jmp       ..B2.24       # Prob 100%                     #9.22
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 r8d
..B2.23:                        # Preds ..B2.21
                                # Execution count [2.56e+02]
        xorl      %r8d, %r8d                                    #7.15
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 r8d
..B2.24:                        # Preds ..B2.22 ..B2.23
                                # Execution count [2.56e+02]
        movl      %r8d, (%rsi,%rax,8)                           #10.5
        cmpl      $0, 4(%rdi,%rax,8)                            #8.9
        je        ..B2.26       # Prob 50%                      #8.9
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15
..B2.25:                        # Preds ..B2.24
                                # Execution count [1.28e+02]
        movl      4(%rdx,%rax,8), %r8d                          #9.15
        addl      4(%rcx,%rax,8), %r8d                          #9.22
        jmp       ..B2.27       # Prob 100%                     #9.22
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 r8d
..B2.26:                        # Preds ..B2.24
                                # Execution count [2.56e+02]
        xorl      %r8d, %r8d                                    #7.15
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 r8d
..B2.27:                        # Preds ..B2.25 ..B2.26
                                # Execution count [2.56e+02]
        movl      %r8d, 4(%rsi,%rax,8)                          #10.5
        incq      %rax                                          #6.3
        cmpq      $512, %rax                                    #6.3
        jb        ..B2.21       # Prob 99%                      #6.3
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15
..B2.29:                        # Preds ..B2.27 ..B2.18 ..B2.16
                                # Execution count [1.00e+00]
        vzeroupper                                              #12.10
        movl      80(%rsi), %eax                                #12.10
        ret                                                     #12.10
                                # LOE
..B2.30:                        # Preds ..B2.8
                                # Execution count [5.00e-02]: Infreq
        xorl      %eax, %eax                                    #6.3
        jmp       ..B2.16       # Prob 100%                     #6.3
        .align    16,0x90
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 eax
	.cfi_endproc
# mark_end;
	.type	_Z5microPiS_S_S_,@function
	.size	_Z5microPiS_S_S_,.-_Z5microPiS_S_S_
..LN_Z5microPiS_S_S_.1:
	.data
# -- End  _Z5microPiS_S_S_
	.section .rodata, "a"
	.align 64
	.align 64
.L_2il0floatpacket.0:
	.long	0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,64
	.align 64
.L_2il0floatpacket.1:
	.long	0x0000000a,0x0000000b,0x0000000c,0x0000000d,0x0000000e,0x0000000f,0x00000010,0x00000011,0x00000012,0x00000013,0x00000014,0x00000015,0x00000016,0x00000017,0x00000018,0x00000019
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,64
	.align 64
.L_2il0floatpacket.2:
	.long	0x00000000,0x00000001,0x00000002,0x00000003,0x00000004,0x00000005,0x00000006,0x00000007,0x00000008,0x00000009,0x0000000a,0x0000000b,0x0000000c,0x0000000d,0x0000000e,0x0000000f
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,64
	.align 64
.L_2il0floatpacket.3:
	.long	0x00000001,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,64
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.long	169894949
	.word	32
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,6
	.data
	.section .note.GNU-stack, ""
# End
