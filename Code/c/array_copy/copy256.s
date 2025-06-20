# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "";
# mark_description "-mavx512f -S";
	.file "copy256.c"
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
                                                          #33.35
        pushq     %rbp                                          #33.35
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #33.35
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #33.35
        subq      $128, %rsp                                    #33.35
        xorl      %esi, %esi                                    #33.35
        movl      $3, %edi                                      #33.35
        call      __intel_new_feature_proc_init                 #33.35
                                # LOE rbx r12 r13 r14 r15
..B1.12:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        vstmxcsr  (%rsp)                                        #33.35
        movl      $536870912, %edi                              #34.21
        movl      $64, %esi                                     #34.21
        orl       $32832, (%rsp)                                #33.35
        vldmxcsr  (%rsp)                                        #33.35
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #34.21
                                # LOE rax rbx r12 r13 r14 r15
..B1.11:                        # Preds ..B1.12
                                # Execution count [1.00e+00]
        movq      %rax, %rdx                                    #34.21
                                # LOE rdx rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.11
                                # Execution count [9.00e-01]
        vmovups   .L_2il0floatpacket.0(%rip), %zmm1             #36.18
        xorl      %ecx, %ecx                                    #35.3
        vmovups   .L_2il0floatpacket.1(%rip), %zmm0             #36.18
        xorl      %eax, %eax                                    #35.3
                                # LOE rax rdx rbx r12 r13 r14 r15 ecx zmm0 zmm1
..B1.3:                         # Preds ..B1.3 ..B1.2
                                # Execution count [5.00e+00]
        addl      $16, %ecx                                     #35.3
        vmovntdq  %zmm0, (%rdx,%rax,4)                          #36.5
        addq      $16, %rax                                     #35.3
        vpaddd    %zmm1, %zmm0, %zmm0                           #36.18
        cmpl      $134217728, %ecx                              #35.3
        jb        ..B1.3        # Prob 82%                      #35.3
                                # LOE rax rdx rbx r12 r13 r14 r15 ecx zmm0 zmm1
..B1.4:                         # Preds ..B1.3
                                # Execution count [5.00e+00]
        mfence                                                  #35.3
                                # LOE rdx rbx r12 r13 r14 r15
..B1.5:                         # Preds ..B1.4
                                # Execution count [8.75e-01]
        xorl      %eax, %eax                                    #41.14
        lea       512(%rdx), %rsi                               #38.16
        movq      %r13, (%rsp)                                  #41.14[spill]
        lea       2560(%rdx), %rdi                              #38.16
        movq      %r14, 8(%rsp)                                 #41.14[spill]
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
        movq      %rsi, %r14                                    #41.14
        movq      %r15, 16(%rsp)                                #41.14[spill]
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x90, 0xff, 0xff, 0xff, 0x22
        movq      %rdx, %r15                                    #41.14
        movq      %rbx, 24(%rsp)                                #41.14[spill]
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x98, 0xff, 0xff, 0xff, 0x22
        movl      %eax, %ebx                                    #41.14
        movq      %rdi, %r13                                    #41.14
                                # LOE r12 r13 r14 r15 ebx
..B1.6:                         # Preds ..B1.7 ..B1.5
                                # Execution count [1.00e+06]
        movl      $4194304, %edx                                #42.5
        movq      %r13, %rdi                                    #42.5
        movq      %r14, %rsi                                    #42.5
        movl      %edx, %ecx                                    #42.5
        movl      %edx, %r8d                                    #42.5
        vzeroupper                                              #42.5
..___tag_value_main.14:
#       array_copy_256(uint8_t *, uint8_t *, int, int, int)
        call      _Z14array_copy_256PhS_iii                     #42.5
..___tag_value_main.15:
                                # LOE r12 r13 r14 r15 ebx
..B1.7:                         # Preds ..B1.6
                                # Execution count [1.00e+06]
        incl      %ebx                                          #41.32
        cmpl      $1048576, %ebx                                #41.24
        jl        ..B1.6        # Prob 99%                      #41.24
                                # LOE r12 r13 r14 r15 ebx
..B1.8:                         # Preds ..B1.7
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
        movl      2640(%rdx), %eax                              #50.10
        movq      %rbp, %rsp                                    #50.10
        popq      %rbp                                          #50.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #50.10
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
.L_2__routine_start__Z14array_copy_256PhS_iii_1:
# -- Begin  _Z14array_copy_256PhS_iii
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z14array_copy_256PhS_iii
# --- array_copy_256(uint8_t *, uint8_t *, int, int, int)
_Z14array_copy_256PhS_iii:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %edx
# parameter 4: %ecx
# parameter 5: %r8d
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z14array_copy_256PhS_iii.27:
..L28:
                                                         #10.94
        pushq     %rsi                                          #10.94
	.cfi_def_cfa_offset 16
        movl      %ecx, %eax                                    #11.21
        orl       %edx, %eax                                    #11.21
        jl        ..B2.10       # Prob 6%                       #11.21
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 edx ecx r8d
..B2.2:                         # Preds ..B2.1
                                # Execution count [9.31e-01]
        cmpl      %edx, %ecx                                    #11.57
        jl        ..B2.10       # Prob 28%                      #11.57
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B2.3:                         # Preds ..B2.2
                                # Execution count [6.70e-01]
        testl     %r8d, %r8d                                    #11.79
        jl        ..B2.10       # Prob 6%                       #11.79
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B2.4:                         # Preds ..B2.3
                                # Execution count [6.24e-01]
        cmpq      %rsi, %rdi                                    #15.4
        jbe       ..B2.11       # Prob 0%                       #15.4
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B2.5:                         # Preds ..B2.4
                                # Execution count [6.21e-01]
        movslq    %ecx, %rcx                                    #16.25
        lea       -32(%rdi,%rcx), %rdx                          #16.25
        lea       -32(%rsi,%rcx), %rax                          #17.11
        cmpl      $32, %r8d                                     #18.18
        jle       ..B2.9        # Prob 10%                      #18.18
                                # LOE rax rdx rbx rbp r12 r13 r14 r15 r8d
..B2.7:                         # Preds ..B2.5 ..B2.7
                                # Execution count [3.10e+00]
        addl      $-32, %r8d                                    #25.6
        vmovdqu32 (%rax), %ymm0                                 #21.0
        vmovdqu32 %ymm0, (%rdx)                                 #21.0
        addq      $-32, %rax                                    #20.6
        addq      $-32, %rdx                                    #19.6
        cmpl      $32, %r8d                                     #18.18
        jg        ..B2.7        # Prob 82%                      #18.18
                                # LOE rax rdx rbx rbp r12 r13 r14 r15 r8d
..B2.9:                         # Preds ..B2.7 ..B2.5
                                # Execution count [6.21e-01]
        vzeroupper                                              #27.1
        popq      %rcx                                          #27.1
	.cfi_def_cfa_offset 8
        ret                                                     #27.1
	.cfi_def_cfa_offset 16
                                # LOE
..B2.10:                        # Preds ..B2.1 ..B2.2 ..B2.3
                                # Execution count [3.76e-01]
        popq      %rcx                                          #12.6
	.cfi_def_cfa_offset 8
        ret                                                     #12.6
	.cfi_def_cfa_offset 16
                                # LOE
..B2.11:                        # Preds ..B2.4
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
	.type	_Z14array_copy_256PhS_iii,@function
	.size	_Z14array_copy_256PhS_iii,.-_Z14array_copy_256PhS_iii
..LN_Z14array_copy_256PhS_iii.1:
	.data
# -- End  _Z14array_copy_256PhS_iii
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
	.align 32
__$U0:
	.long	1684631414
	.long	1920098592
	.long	1667201377
	.long	1601794159
	.long	674641202
	.long	1769172597
	.long	1684368999
	.long	1634231072
	.long	740958322
	.long	1936618784
	.long	1701734249
	.long	1751326820
	.long	706769505
	.long	1852383276
	.long	1763716212
	.long	539784302
	.long	695496297
	.byte	0
	.type	__$U0,@object
	.size	__$U0,69
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
	.long	775304498
	.word	99
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,10
	.data
	.section .note.GNU-stack, ""
# End
