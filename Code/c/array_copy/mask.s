# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "";
# mark_description "-O3 -S";
	.file "mask.c"
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
                                                          #23.35
        pushq     %rbp                                          #23.35
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #23.35
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #23.35
        pushq     %r12                                          #23.35
        pushq     %r14                                          #23.35
        pushq     %rbx                                          #23.35
        subq      $104, %rsp                                    #23.35
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
        movq      %rsi, %r14                                    #23.35
        movl      %edi, %ebx                                    #23.35
        xorl      %esi, %esi                                    #23.35
        movl      $3, %edi                                      #23.35
        call      __intel_new_feature_proc_init                 #23.35
                                # LOE r13 r14 r15 ebx
..B1.13:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        stmxcsr   (%rsp)                                        #23.35
        orl       $32832, (%rsp)                                #23.35
        ldmxcsr   (%rsp)                                        #23.35
        cmpl      $3, %ebx                                      #24.15
        je        ..B1.4        # Prob 16%                      #24.15
                                # LOE r13 r14 r15
..B1.2:                         # Preds ..B1.13
                                # Execution count [8.40e-01]
        movl      $il0_peep_printf_format_0, %edi               #25.5
        movq      stderr(%rip), %rsi                            #25.5
        call      fputs                                         #25.5
                                # LOE r13 r15
..B1.3:                         # Preds ..B1.2
                                # Execution count [8.40e-01]
        movl      $-1, %eax                                     #26.12
        addq      $104, %rsp                                    #26.12
	.cfi_restore 3
        popq      %rbx                                          #26.12
	.cfi_restore 14
        popq      %r14                                          #26.12
	.cfi_restore 12
        popq      %r12                                          #26.12
        movq      %rbp, %rsp                                    #26.12
        popq      %rbp                                          #26.12
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #26.12
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
                                # LOE
..B1.4:                         # Preds ..B1.13
                                # Execution count [1.60e-01]: Infreq
        movl      $1024, %edi                                   #28.24
        movl      $64, %esi                                     #28.24
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #28.24
                                # LOE rax r13 r14 r15
..B1.14:                        # Preds ..B1.4
                                # Execution count [1.60e-01]: Infreq
        movq      %rax, %r12                                    #28.24
                                # LOE r12 r13 r14 r15
..B1.5:                         # Preds ..B1.14
                                # Execution count [1.60e-01]: Infreq
        movq      8(%r14), %rdi                                 #29.14
        call      atol                                          #29.14
                                # LOE rax r12 r13 r14 r15
..B1.15:                        # Preds ..B1.5
                                # Execution count [1.60e-01]: Infreq
        movq      %rax, %rbx                                    #29.14
                                # LOE rbx r12 r13 r14 r15
..B1.6:                         # Preds ..B1.15
                                # Execution count [1.60e-01]: Infreq
        movq      16(%r14), %rdi                                #30.14
        call      atol                                          #30.14
                                # LOE rax rbx r12 r13 r15
..B1.7:                         # Preds ..B1.6
                                # Execution count [1.60e-01]: Infreq
        addq      %rbx, %r12                                    #33.15
        movl      %eax, %esi                                    #33.15
        movq      %r12, %rdi                                    #33.15
..___tag_value_main.19:
#       mask(char *, int)
        call      _Z4maskPci                                    #33.15
..___tag_value_main.20:
                                # LOE rax r13 r15
..B1.8:                         # Preds ..B1.7
                                # Execution count [1.60e-01]: Infreq
        movl      $.L_2__STRING.6, %edi                         #35.10
        movq      %rax, %rsi                                    #35.10
        xorl      %eax, %eax                                    #35.10
        addq      $104, %rsp                                    #35.10
	.cfi_restore 3
        popq      %rbx                                          #35.10
	.cfi_restore 14
        popq      %r14                                          #35.10
	.cfi_restore 12
        popq      %r12                                          #35.10
        movq      %rbp, %rsp                                    #35.10
        popq      %rbp                                          #35.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
#       printf(const char *, ...)
        jmp       printf                                        #35.10
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
	.long	1885417262
	.long	1346117744
	.long	540951617
	.long	1348031548
	.long	169885253
	.byte	0
	.data
# -- End  main
	.text
.L_2__routine_start__Z4maskPci_1:
# -- Begin  _Z4maskPci
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z4maskPci
# --- mask(char *, int)
_Z4maskPci:
# parameter 1: %rdi
# parameter 2: %esi
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z4maskPci.27:
..L28:
                                                         #12.33
        pushq     %r15                                          #12.33
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
        movq      %rdi, %rdx                                    #12.33

        andq      $63, %rdx                                     #15.32
        movl      $1, %r15d                                     #16.42
        movslq    %esi, %r8                                     #12.33
        negq      %rdx                                          #15.32
        addq      $64, %rdx                                     #15.32

        xorq      %rsi, %rsi                                    #18.16
        movq      %rdx, %r9                                     #16.29
        movl      $.L_2__STRING.4, %edi                         #19.3
        xorl      %eax, %eax                                    #19.3
        movl      type_shifta(,%r8,4), %ecx                     #16.29
        shrq      %cl, %r9                                      #16.29
        movl      %r9d, %ecx                                    #16.29
        shll      %cl, %r15d                                    #16.29
        movslq    %r15d, %r15                                   #16.42
        decq      %r15                                          #16.42
        popcnt    %r15, %rsi                                    #18.16
        movq      type_string(,%r8,8), %rcx                     #19.3
..___tag_value__Z4maskPci.31:
#       printf(const char *, ...)
        call      printf                                        #19.3
..___tag_value__Z4maskPci.32:
                                # LOE rbx rbp r12 r13 r14 r15
..B2.2:                         # Preds ..B2.1
                                # Execution count [1.00e+00]
        movq      %r15, %rax                                    #20.10
	.cfi_restore 15
        popq      %r15                                          #20.10
	.cfi_def_cfa_offset 8
        ret                                                     #20.10
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z4maskPci,@function
	.size	_Z4maskPci,.-_Z4maskPci
..LN_Z4maskPci.1:
	.data
# -- End  _Z4maskPci
	.data
	.align 8
	.align 8
	.globl type_string
type_string:
	.quad	.L_2__STRING.0
	.quad	.L_2__STRING.1
	.quad	.L_2__STRING.2
	.quad	.L_2__STRING.3
	.type	type_string,@object
	.size	type_string,32
	.align 4
	.globl type_shifta
type_shifta:
	.long	0
	.long	1
	.long	2
	.long	3
	.type	type_shifta,@object
	.size	type_shifta,16
	.section .rodata.str1.4, "aMS",@progbits,1
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.6:
	.long	1195725387
	.long	807419168
	.long	2020353400
	.word	10
	.type	.L_2__STRING.6,@object
	.size	.L_2__STRING.6,14
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.4:
	.long	1646289957
	.long	544437353
	.long	544499059
	.long	544370534
	.long	1646289957
	.long	1936028793
	.long	1931814944
	.long	1634738217
	.long	667236
	.type	.L_2__STRING.4,@object
	.size	.L_2__STRING.4,36
	.align 4
.L_2__STRING.0:
	.long	1702132066
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,5
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.long	1919903859
	.word	116
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,6
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.long	7630441
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,4
	.align 4
.L_2__STRING.3:
	.long	1735290732
	.byte	0
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,5
	.data
	.section .note.GNU-stack, ""
# End
