# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "";
# mark_description "-I/home/jatinbha/softwares/iaca-lin64/ -mavx512f -S";
	.file "old.c"
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
                                                          #34.12
        pushq     %rbp                                          #34.12
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #34.12
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #34.12
        subq      $384, %rsp                                    #34.12
        xorl      %esi, %esi                                    #34.12
        movl      $3, %edi                                      #34.12
        call      __intel_new_feature_proc_init                 #34.12
                                # LOE rbx r12 r13 r14 r15
..B1.10:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        vstmxcsr  (%rsp)                                        #34.12
        vmovups   a.151.0.0.2(%rip), %zmm0                      #35.11
        orl       $32832, (%rsp)                                #34.12
        vldmxcsr  (%rsp)                                        #34.12
        vmovups   %zmm0, 128(%rsp)                              #35.11
                                # LOE rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.10
                                # Execution count [1.00e+00]
        vmovups   b.151.0.0.2(%rip), %zmm0                      #39.11
        vmovups   %zmm0, 192(%rsp)                              #39.11
                                # LOE rbx r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
                                # Execution count [1.00e+00]
        vmovups   c.151.0.0.2(%rip), %zmm0                      #43.11
        vmovups   %zmm0, 256(%rsp)                              #43.11
                                # LOE rbx r12 r13 r14 r15
..B1.4:                         # Preds ..B1.3
                                # Execution count [0.00e+00]
        xorl      %eax, %eax                                    #48.13
        lea       (%rsp), %rdi                                  #49.6
        movq      %r12, 96(%rsp)                                #49.6[spill]
        lea       128(%rdi), %rsi                               #49.6
        movq      %r13, 88(%rsp)                                #49.6[spill]
        lea       64(%rsi), %rdx                                #49.6
        movq      %r14, 80(%rsp)                                #49.6[spill]
        lea       64(%rdx), %rcx                                #49.6
        movq      %r15, 72(%rsp)                                #49.6[spill]
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xfe, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xfe, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd0, 0xfe, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xc8, 0xfe, 0xff, 0xff, 0x22
        movl      %eax, %r15d                                   #49.6
        movq      %rbx, 64(%rsp)                                #49.6[spill]
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xc0, 0xfe, 0xff, 0xff, 0x22
        movq      %rdx, %r12                                    #49.6
        movq      %rcx, %rbx                                    #49.6
        movq      %rsi, %r13                                    #49.6
        movq      %rdi, %r14                                    #49.6
                                # LOE rbx r12 r13 r14 r15d
..B1.5:                         # Preds ..B1.6 ..B1.4
                                # Execution count [1.00e+06]
        movq      %r14, %rdi                                    #49.6
        movq      %r13, %rsi                                    #49.6
        movq      %r12, %rdx                                    #49.6
        movq      %rbx, %rcx                                    #49.6
        vzeroupper                                              #49.6
..___tag_value_main.16:
#       compute(int *, int *, int *, int *)
        call      _Z7computePiS_S_S_                            #49.6
..___tag_value_main.17:
                                # LOE rbx r12 r13 r14 r15d
..B1.6:                         # Preds ..B1.5
                                # Execution count [1.00e+06]
        incl      %r15d                                         #48.35
        cmpl      $100000000, %r15d                             #48.23
        jl        ..B1.5        # Prob 100%                     #48.23
                                # LOE rbx r12 r13 r14 r15d
..B1.7:                         # Preds ..B1.6
                                # Execution count [0.00e+00]
        movq      96(%rsp), %r12                                #[spill]
	.cfi_restore 12
        movq      88(%rsp), %r13                                #[spill]
	.cfi_restore 13
        movq      80(%rsp), %r14                                #[spill]
	.cfi_restore 14
        movq      72(%rsp), %r15                                #[spill]
	.cfi_restore 15
        movq      64(%rsp), %rbx                                #[spill]
	.cfi_restore 3
        movl      16(%rsp), %eax                                #50.10
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
	.section .rodata, "a"
	.align 64
	.align 64
a.151.0.0.2:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.align 64
b.151.0.0.2:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.align 64
c.151.0.0.2:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.data
# -- End  main
	.text
.L_2__routine_start__Z7computePiS_S_S__1:
# -- Begin  _Z7computePiS_S_S_
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z7computePiS_S_S_
# --- compute(int *, int *, int *, int *)
_Z7computePiS_S_S_:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z7computePiS_S_S_.30:
..L31:
                                                         #8.50
        pushq     %rbx                                          #8.50
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
        vmovdqu32 (%rsi), %zmm0                                 #10.0
        vmovdqu32 (%rdx), %zmm1                                 #10.0
        vmovdqu32 (%rcx), %zmm2                                 #10.0
        movl      $111, %ebx                                    #10.0
        .byte     100                                           #10.0
        .byte     103                                           #10.0
        .byte     144                                           #10.0
        vpxord    minus_1(%rip){1to16}, %zmm0, %zmm3            #10.0
        vpord     %zmm1, %zmm2, %zmm4                           #10.0
        vpandd    %zmm2, %zmm3, %zmm3                           #10.0
        vpxord    minus_1(%rip){1to16}, %zmm2, %zmm2            #10.0
        vpord     %zmm3, %zmm4, %zmm3                           #10.0
        vpxord    minus_1(%rip){1to16}, %zmm1, %zmm1            #10.0
        vpord     %zmm1, %zmm2, %zmm1                           #10.0
        vpandd    %zmm0, %zmm1, %zmm0                           #10.0
        vpxord    %zmm3, %zmm0, %zmm0                           #10.0
        movl      $222, %ebx                                    #10.0
        .byte     100                                           #10.0
        .byte     103                                           #10.0
        .byte     144                                           #10.0
        vmovdqu32 %zmm0, (%rdi)                                 #10.0
        vzeroupper                                              #32.1
	.cfi_restore 3
        popq      %rbx                                          #32.1
	.cfi_def_cfa_offset 8
        ret                                                     #32.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z7computePiS_S_S_,@function
	.size	_Z7computePiS_S_S_,.-_Z7computePiS_S_S_
..LN_Z7computePiS_S_S_.1:
	.data
# -- End  _Z7computePiS_S_S_
	.data
	.align 4
	.align 4
	.globl minus_1
minus_1:
	.long	-1
	.type	minus_1,@object
	.size	minus_1,4
	.data
	.section .note.GNU-stack, ""
# End
