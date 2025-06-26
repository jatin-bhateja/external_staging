# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.1.0.166 Build 20191121";
# mark_description "";
# mark_description "-S -mavx512f";
	.file "logic.c"
	.text
..TXTST0:
.L_2__routine_start__Z3vecPiS_S_S__0:
# -- Begin  _Z3vecPiS_S_S_
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z3vecPiS_S_S_
# --- vec(int *, int *, int *, int *)
_Z3vecPiS_S_S_:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z3vecPiS_S_S_.1:
..L2:
                                                          #3.50
        movq      %rcx, %rax                                    #5.15
        subq      %rdi, %rax                                    #5.15
        movq      %rdx, %r8                                     #3.50
        cmpq      $16384, %rax                                  #4.3
        jge       ..B1.3        # Prob 50%                      #4.3
                                # LOE rax rcx rbx rbp rsi rdi r8 r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        negq      %rax                                          #5.6
        cmpq      $16384, %rax                                  #4.3
        jl        ..B1.20       # Prob 50%                      #4.3
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15
..B1.3:                         # Preds ..B1.1 ..B1.2
                                # Execution count [0.00e+00]
        movq      %rcx, %rax                                    #5.22
        subq      %rsi, %rax                                    #5.22
        cmpq      $16384, %rax                                  #4.3
        jge       ..B1.5        # Prob 50%                      #4.3
                                # LOE rax rcx rbx rbp rsi rdi r8 r12 r13 r14 r15
..B1.4:                         # Preds ..B1.3
                                # Execution count [0.00e+00]
        negq      %rax                                          #5.6
        cmpq      $16384, %rax                                  #4.3
        jl        ..B1.20       # Prob 50%                      #4.3
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15
..B1.5:                         # Preds ..B1.3 ..B1.4
                                # Execution count [0.00e+00]
        movq      %rcx, %rax                                    #5.29
        subq      %r8, %rax                                     #5.29
        cmpq      $16384, %rax                                  #4.3
        jge       ..B1.7        # Prob 50%                      #4.3
                                # LOE rax rcx rbx rbp rsi rdi r8 r12 r13 r14 r15
..B1.6:                         # Preds ..B1.5
                                # Execution count [0.00e+00]
        negq      %rax                                          #5.6
        cmpq      $16384, %rax                                  #4.3
        jl        ..B1.20       # Prob 50%                      #4.3
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15
..B1.7:                         # Preds ..B1.5 ..B1.6
                                # Execution count [5.00e-01]
        movq      %rcx, %rax                                    #4.3
        andq      $63, %rax                                     #4.3
        testl     %eax, %eax                                    #4.3
        je        ..B1.12       # Prob 50%                      #4.3
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax
..B1.8:                         # Preds ..B1.7
                                # Execution count [5.00e-01]
        testb     $3, %al                                       #4.3
        jne       ..B1.24       # Prob 10%                      #4.3
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax
..B1.9:                         # Preds ..B1.8
                                # Execution count [5.00e-01]
        negl      %eax                                          #4.3
        xorl      %edx, %edx                                    #4.3
        addl      $64, %eax                                     #4.3
        shrl      $2, %eax                                      #4.3
        vmovups   .L_2il0floatpacket.0(%rip), %zmm2             #4.3
        movl      %eax, %r9d                                    #4.3
        vmovdqu32 .L_2il0floatpacket.1(%rip), %zmm1             #4.3
        vpbroadcastd %eax, %zmm0                                #4.3
                                # LOE rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15 eax zmm0 zmm1 zmm2
..B1.10:                        # Preds ..B1.10 ..B1.9
                                # Execution count [2.05e+03]
        vpcmpud   $6, %zmm1, %zmm0, %k1                         #4.3
        vpaddd    %zmm2, %zmm1, %zmm1                           #4.3
        vmovdqu32 (%rdi,%rdx,4), %zmm3{%k1}{z}                  #5.15
        vmovdqu32 (%r8,%rdx,4), %zmm4{%k1}{z}                   #5.29
        vpternlogd $128, (%rsi,%rdx,4), %zmm3, %zmm4{%k1}{z}    #5.29
        vmovdqu32 %zmm4, (%rcx,%rdx,4){%k1}                     #5.6
        addq      $16, %rdx                                     #4.3
        cmpq      %r9, %rdx                                     #4.3
        jb        ..B1.10       # Prob 99%                      #4.3
        jmp       ..B1.13       # Prob 100%                     #4.3
                                # LOE rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15 eax zmm0 zmm1 zmm2
..B1.12:                        # Preds ..B1.7
                                # Execution count [2.50e-01]
        xorl      %r9d, %r9d                                    #4.3
                                # LOE rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15 eax
..B1.13:                        # Preds ..B1.10 ..B1.12
                                # Execution count [5.00e-01]
        negl      %eax                                          #4.3
        andl      $63, %eax                                     #4.3
        negl      %eax                                          #4.3
        addl      $4096, %eax                                   #4.3
        movl      %eax, %edx                                    #4.3
                                # LOE rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15 eax
..B1.14:                        # Preds ..B1.14 ..B1.13
                                # Execution count [2.05e+03]
        vmovups   (%rdi,%r9,4), %zmm0                           #5.15
        vmovups   64(%rdi,%r9,4), %zmm2                         #5.15
        vmovups   128(%rdi,%r9,4), %zmm4                        #5.15
        vmovups   192(%rdi,%r9,4), %zmm6                        #5.15
        vmovups   (%r8,%r9,4), %zmm1                            #5.29
        vmovups   64(%r8,%r9,4), %zmm3                          #5.29
        vmovups   128(%r8,%r9,4), %zmm5                         #5.29
        vmovups   192(%r8,%r9,4), %zmm7                         #5.29
        vpternlogd $128, (%rsi,%r9,4), %zmm0, %zmm1             #5.29
        vpternlogd $128, 64(%rsi,%r9,4), %zmm2, %zmm3           #5.29
        vpternlogd $128, 128(%rsi,%r9,4), %zmm4, %zmm5          #5.29
        vpternlogd $128, 192(%rsi,%r9,4), %zmm6, %zmm7          #5.29
        vmovdqu32 %zmm1, (%rcx,%r9,4)                           #5.6
        vmovdqu32 %zmm3, 64(%rcx,%r9,4)                         #5.6
        vmovdqu32 %zmm5, 128(%rcx,%r9,4)                        #5.6
        vmovdqu32 %zmm7, 192(%rcx,%r9,4)                        #5.6
        addq      $64, %r9                                      #4.3
        cmpq      %rdx, %r9                                     #4.3
        jb        ..B1.14       # Prob 99%                      #4.3
                                # LOE rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15 eax
..B1.16:                        # Preds ..B1.14 ..B1.24
                                # Execution count [5.00e-01]
        lea       1(%rax), %edx                                 #4.3
        cmpl      $4096, %edx                                   #4.3
        ja        ..B1.23       # Prob 50%                      #4.3
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax
..B1.17:                        # Preds ..B1.16
                                # Execution count [5.00e-01]
        movl      %eax, %edx                                    #4.3
        xorl      %r9d, %r9d                                    #4.3
        negl      %edx                                          #4.3
        addl      $4096, %edx                                   #4.3
        vmovups   .L_2il0floatpacket.0(%rip), %zmm2             #4.3
        vmovdqu32 .L_2il0floatpacket.1(%rip), %zmm1             #4.3
        vpbroadcastd %edx, %zmm0                                #4.3
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax edx r9d zmm0 zmm1 zmm2
..B1.18:                        # Preds ..B1.18 ..B1.17
                                # Execution count [2.05e+03]
        vpcmpud   $6, %zmm1, %zmm0, %k1                         #4.3
        lea       (%rax,%r9), %r10d                             #5.6
        vpaddd    %zmm2, %zmm1, %zmm1                           #4.3
        movslq    %r10d, %r10                                   #5.6
        addl      $16, %r9d                                     #4.3
        vmovdqu32 (%rdi,%r10,4), %zmm3{%k1}{z}                  #5.15
        vmovdqu32 (%r8,%r10,4), %zmm4{%k1}{z}                   #5.29
        vpternlogd $128, (%rsi,%r10,4), %zmm3, %zmm4{%k1}{z}    #5.29
        vmovdqu32 %zmm4, (%rcx,%r10,4){%k1}                     #5.6
        cmpl      %edx, %r9d                                    #4.3
        jb        ..B1.18       # Prob 99%                      #4.3
        jmp       ..B1.23       # Prob 100%                     #4.3
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax edx r9d zmm0 zmm1 zmm2
..B1.20:                        # Preds ..B1.2 ..B1.4 ..B1.6
                                # Execution count [5.00e-01]
        xorl      %eax, %eax                                    #4.3
        xorl      %edx, %edx                                    #4.3
                                # LOE rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax
..B1.21:                        # Preds ..B1.21 ..B1.20
                                # Execution count [1.28e+02]
        movl      (%rdx,%rdi), %r9d                             #5.15
        incl      %eax                                          #4.3
        andl      (%rdx,%rsi), %r9d                             #5.22
        andl      (%rdx,%r8), %r9d                              #5.29
        movl      %r9d, (%rdx,%rcx)                             #5.6
        movl      4(%rdx,%rdi), %r10d                           #5.15
        andl      4(%rdx,%rsi), %r10d                           #5.22
        andl      4(%rdx,%r8), %r10d                            #5.29
        movl      %r10d, 4(%rdx,%rcx)                           #5.6
        movl      8(%rdx,%rdi), %r11d                           #5.15
        andl      8(%rdx,%rsi), %r11d                           #5.22
        andl      8(%rdx,%r8), %r11d                            #5.29
        movl      %r11d, 8(%rdx,%rcx)                           #5.6
        movl      12(%rdx,%rdi), %r9d                           #5.15
        andl      12(%rdx,%rsi), %r9d                           #5.22
        andl      12(%rdx,%r8), %r9d                            #5.29
        movl      %r9d, 12(%rdx,%rcx)                           #5.6
        movl      16(%rdx,%rdi), %r10d                          #5.15
        andl      16(%rdx,%rsi), %r10d                          #5.22
        andl      16(%rdx,%r8), %r10d                           #5.29
        movl      %r10d, 16(%rdx,%rcx)                          #5.6
        movl      20(%rdx,%rdi), %r9d                           #5.15
        andl      20(%rdx,%rsi), %r9d                           #5.22
        andl      20(%rdx,%r8), %r9d                            #5.29
        movl      %r9d, 20(%rdx,%rcx)                           #5.6
        movl      24(%rdx,%rdi), %r11d                          #5.15
        andl      24(%rdx,%rsi), %r11d                          #5.22
        andl      24(%rdx,%r8), %r11d                           #5.29
        movl      %r11d, 24(%rdx,%rcx)                          #5.6
        movl      28(%rdx,%rdi), %r9d                           #5.15
        andl      28(%rdx,%rsi), %r9d                           #5.22
        andl      28(%rdx,%r8), %r9d                            #5.29
        movl      %r9d, 28(%rdx,%rcx)                           #5.6
        movl      32(%rdx,%rdi), %r10d                          #5.15
        andl      32(%rdx,%rsi), %r10d                          #5.22
        andl      32(%rdx,%r8), %r10d                           #5.29
        movl      %r10d, 32(%rdx,%rcx)                          #5.6
        movl      36(%rdx,%rdi), %r9d                           #5.15
        andl      36(%rdx,%rsi), %r9d                           #5.22
        andl      36(%rdx,%r8), %r9d                            #5.29
        movl      %r9d, 36(%rdx,%rcx)                           #5.6
        movl      40(%rdx,%rdi), %r11d                          #5.15
        andl      40(%rdx,%rsi), %r11d                          #5.22
        andl      40(%rdx,%r8), %r11d                           #5.29
        movl      %r11d, 40(%rdx,%rcx)                          #5.6
        movl      44(%rdx,%rdi), %r9d                           #5.15
        andl      44(%rdx,%rsi), %r9d                           #5.22
        andl      44(%rdx,%r8), %r9d                            #5.29
        movl      %r9d, 44(%rdx,%rcx)                           #5.6
        movl      48(%rdx,%rdi), %r10d                          #5.15
        andl      48(%rdx,%rsi), %r10d                          #5.22
        andl      48(%rdx,%r8), %r10d                           #5.29
        movl      %r10d, 48(%rdx,%rcx)                          #5.6
        movl      52(%rdx,%rdi), %r9d                           #5.15
        andl      52(%rdx,%rsi), %r9d                           #5.22
        andl      52(%rdx,%r8), %r9d                            #5.29
        movl      %r9d, 52(%rdx,%rcx)                           #5.6
        movl      56(%rdx,%rdi), %r11d                          #5.15
        andl      56(%rdx,%rsi), %r11d                          #5.22
        andl      56(%rdx,%r8), %r11d                           #5.29
        movl      %r11d, 56(%rdx,%rcx)                          #5.6
        movl      60(%rdx,%rdi), %r9d                           #5.15
        andl      60(%rdx,%rsi), %r9d                           #5.22
        andl      60(%rdx,%r8), %r9d                            #5.29
        movl      %r9d, 60(%rdx,%rcx)                           #5.6
        addq      $64, %rdx                                     #4.3
        cmpl      $256, %eax                                    #4.3
        jb        ..B1.21       # Prob 99%                      #4.3
                                # LOE rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax
..B1.23:                        # Preds ..B1.21 ..B1.18 ..B1.16
                                # Execution count [1.00e+00]
        vzeroupper                                              #8.1
        ret                                                     #8.1
                                # LOE
..B1.24:                        # Preds ..B1.8
                                # Execution count [5.00e-02]: Infreq
        xorl      %eax, %eax                                    #4.3
        jmp       ..B1.16       # Prob 100%                     #4.3
        .align    16,0x90
                                # LOE rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax
	.cfi_endproc
# mark_end;
	.type	_Z3vecPiS_S_S_,@function
	.size	_Z3vecPiS_S_S_,.-_Z3vecPiS_S_S_
..LN_Z3vecPiS_S_S_.0:
	.data
# -- End  _Z3vecPiS_S_S_
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
	.data
	.section .note.GNU-stack, ""
# End
