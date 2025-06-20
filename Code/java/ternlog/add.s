# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.1.0.166 Build 20191121";
# mark_description "";
# mark_description "-mavx512f -S -O2";
	.file "add.c"
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
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z3vecPiS_S_S_.1:
..L2:
                                                          #3.50
        movq      %rcx, %r8                                     #3.50
        movq      %rdx, %rcx                                    #3.50
        xorl      %eax, %eax                                    #4.3
        xorl      %edx, %edx                                    #4.3
                                # LOE rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax
..B1.2:                         # Preds ..B1.2 ..B1.1
                                # Execution count [4.10e+02]
        movl      (%rdx,%rdi), %r9d                             #5.39
        incl      %eax                                          #4.3
        movl      (%rdx,%rcx), %r10d                            #5.30
        andl      (%rdx,%rsi), %r9d                             #5.22
        notl      %r10d                                         #5.30
        andl      %r9d, %r10d                                   #5.30
        notl      %r9d                                          #5.47
        orl       %r9d, %r10d                                   #5.47
        movl      %r10d, (%rdx,%r8)                             #5.6
        movl      4(%rdx,%rdi), %r11d                           #5.39
        movl      4(%rdx,%rcx), %r9d                            #5.30
        andl      4(%rdx,%rsi), %r11d                           #5.22
        notl      %r9d                                          #5.30
        andl      %r11d, %r9d                                   #5.30
        notl      %r11d                                         #5.47
        orl       %r11d, %r9d                                   #5.47
        movl      %r9d, 4(%rdx,%r8)                             #5.6
        movl      8(%rdx,%rdi), %r10d                           #5.39
        movl      8(%rdx,%rcx), %r9d                            #5.30
        andl      8(%rdx,%rsi), %r10d                           #5.22
        notl      %r9d                                          #5.30
        andl      %r10d, %r9d                                   #5.30
        notl      %r10d                                         #5.47
        orl       %r10d, %r9d                                   #5.47
        movl      %r9d, 8(%rdx,%r8)                             #5.6
        movl      12(%rdx,%rdi), %r11d                          #5.39
        movl      12(%rdx,%rcx), %r9d                           #5.30
        andl      12(%rdx,%rsi), %r11d                          #5.22
        notl      %r9d                                          #5.30
        andl      %r11d, %r9d                                   #5.30
        notl      %r11d                                         #5.47
        orl       %r11d, %r9d                                   #5.47
        movl      %r9d, 12(%rdx,%r8)                            #5.6
        movl      16(%rdx,%rdi), %r10d                          #5.39
        movl      16(%rdx,%rcx), %r9d                           #5.30
        andl      16(%rdx,%rsi), %r10d                          #5.22
        notl      %r9d                                          #5.30
        andl      %r10d, %r9d                                   #5.30
        notl      %r10d                                         #5.47
        orl       %r10d, %r9d                                   #5.47
        movl      %r9d, 16(%rdx,%r8)                            #5.6
        movl      20(%rdx,%rdi), %r11d                          #5.39
        movl      20(%rdx,%rcx), %r9d                           #5.30
        andl      20(%rdx,%rsi), %r11d                          #5.22
        notl      %r9d                                          #5.30
        andl      %r11d, %r9d                                   #5.30
        notl      %r11d                                         #5.47
        orl       %r11d, %r9d                                   #5.47
        movl      %r9d, 20(%rdx,%r8)                            #5.6
        movl      24(%rdx,%rdi), %r10d                          #5.39
        movl      24(%rdx,%rcx), %r9d                           #5.30
        andl      24(%rdx,%rsi), %r10d                          #5.22
        notl      %r9d                                          #5.30
        andl      %r10d, %r9d                                   #5.30
        notl      %r10d                                         #5.47
        orl       %r10d, %r9d                                   #5.47
        movl      %r9d, 24(%rdx,%r8)                            #5.6
        movl      28(%rdx,%rdi), %r11d                          #5.39
        movl      28(%rdx,%rcx), %r9d                           #5.30
        andl      28(%rdx,%rsi), %r11d                          #5.22
        notl      %r9d                                          #5.30
        andl      %r11d, %r9d                                   #5.30
        notl      %r11d                                         #5.47
        orl       %r11d, %r9d                                   #5.47
        movl      %r9d, 28(%rdx,%r8)                            #5.6
        movl      32(%rdx,%rdi), %r10d                          #5.39
        movl      32(%rdx,%rcx), %r9d                           #5.30
        andl      32(%rdx,%rsi), %r10d                          #5.22
        notl      %r9d                                          #5.30
        andl      %r10d, %r9d                                   #5.30
        notl      %r10d                                         #5.47
        orl       %r10d, %r9d                                   #5.47
        movl      %r9d, 32(%rdx,%r8)                            #5.6
        .byte     144                                           #5.39
        movl      36(%rdx,%rdi), %r11d                          #5.39
        movl      36(%rdx,%rcx), %r9d                           #5.30
        andl      36(%rdx,%rsi), %r11d                          #5.22
        notl      %r9d                                          #5.30
        andl      %r11d, %r9d                                   #5.30
        notl      %r11d                                         #5.47
        orl       %r11d, %r9d                                   #5.47
        movl      %r9d, 36(%rdx,%r8)                            #5.6
        addq      $40, %rdx                                     #4.3
        cmpl      $409, %eax                                    #4.3
        jb        ..B1.2        # Prob 99%                      #4.3
                                # LOE rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax
..B1.3:                         # Preds ..B1.2
                                # Execution count [1.00e+00]
        movl      $4090, %eax                                   #4.3
                                # LOE rax rcx rbx rbp rsi rdi r8 r12 r13 r14 r15
..B1.4:                         # Preds ..B1.4 ..B1.3
                                # Execution count [9.00e+00]
        movl      (%rdi,%rax,4), %edx                           #5.15
        movl      (%rcx,%rax,4), %r9d                           #5.30
        andl      (%rsi,%rax,4), %edx                           #5.47
        notl      %r9d                                          #5.30
        andl      %edx, %r9d                                    #5.30
        notl      %edx                                          #5.47
        orl       %edx, %r9d                                    #5.47
        movl      %r9d, (%r8,%rax,4)                            #5.6
        incq      %rax                                          #4.3
        cmpq      $4096, %rax                                   #4.3
        jb        ..B1.4        # Prob 88%                      #4.3
                                # LOE rax rcx rbx rbp rsi rdi r8 r12 r13 r14 r15
..B1.5:                         # Preds ..B1.4
                                # Execution count [1.00e+00]
        ret                                                     #7.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z3vecPiS_S_S_,@function
	.size	_Z3vecPiS_S_S_,.-_Z3vecPiS_S_S_
..LN_Z3vecPiS_S_S_.0:
	.data
# -- End  _Z3vecPiS_S_S_
	.data
	.section .note.GNU-stack, ""
# End
