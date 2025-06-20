# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "-mcpu=skylake-avx512 -S";
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
..___tag_value_main.1:
..L2:
                                                          #23.12
        pushq     %rbp                                          #23.12
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #23.12
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #23.12
        subq      $128, %rsp                                    #23.12
        xorl      %esi, %esi                                    #23.12
        movl      $3, %edi                                      #23.12
        call      __intel_new_feature_proc_init                 #23.12
                                # LOE rbx r12 r13 r14 r15
..B1.13:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        stmxcsr   (%rsp)                                        #23.12
        movl      $-1, %edi                                     #26.3
        orl       $32832, (%rsp)                                #23.12
        ldmxcsr   (%rsp)                                        #23.12
..___tag_value_main.6:
#       vectorAdd(short)
        call      vectorAdd                                     #26.3
..___tag_value_main.7:
                                # LOE rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.13
                                # Execution count [1.00e+00]
        movsd     res(%rip), %xmm0                              #29.5
        movl      $.L_2__STRING.0, %edi                         #29.5
        xorl      %esi, %esi                                    #29.5
        movl      $1, %eax                                      #29.5
..___tag_value_main.8:
#       printf(const char *__restrict__, ...)
        call      printf                                        #29.5
..___tag_value_main.9:
                                # LOE rbx r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
                                # Execution count [1.00e+00]
        movl      $1, %esi                                      #29.5
        movl      $.L_2__STRING.0, %edi                         #29.5
        movsd     8+res(%rip), %xmm0                            #29.5
        movl      %esi, %eax                                    #29.5
..___tag_value_main.10:
#       printf(const char *__restrict__, ...)
        call      printf                                        #29.5
..___tag_value_main.11:
                                # LOE rbx r12 r13 r14 r15
..B1.4:                         # Preds ..B1.3
                                # Execution count [1.00e+00]
        movsd     16+res(%rip), %xmm0                           #29.5
        movl      $.L_2__STRING.0, %edi                         #29.5
        movl      $2, %esi                                      #29.5
        movl      $1, %eax                                      #29.5
..___tag_value_main.12:
#       printf(const char *__restrict__, ...)
        call      printf                                        #29.5
..___tag_value_main.13:
                                # LOE rbx r12 r13 r14 r15
..B1.5:                         # Preds ..B1.4
                                # Execution count [1.00e+00]
        movsd     24+res(%rip), %xmm0                           #29.5
        movl      $.L_2__STRING.0, %edi                         #29.5
        movl      $3, %esi                                      #29.5
        movl      $1, %eax                                      #29.5
..___tag_value_main.14:
#       printf(const char *__restrict__, ...)
        call      printf                                        #29.5
..___tag_value_main.15:
                                # LOE rbx r12 r13 r14 r15
..B1.6:                         # Preds ..B1.5
                                # Execution count [1.00e+00]
        movsd     32+res(%rip), %xmm0                           #29.5
        movl      $.L_2__STRING.0, %edi                         #29.5
        movl      $4, %esi                                      #29.5
        movl      $1, %eax                                      #29.5
..___tag_value_main.16:
#       printf(const char *__restrict__, ...)
        call      printf                                        #29.5
..___tag_value_main.17:
                                # LOE rbx r12 r13 r14 r15
..B1.7:                         # Preds ..B1.6
                                # Execution count [1.00e+00]
        movsd     40+res(%rip), %xmm0                           #29.5
        movl      $.L_2__STRING.0, %edi                         #29.5
        movl      $5, %esi                                      #29.5
        movl      $1, %eax                                      #29.5
..___tag_value_main.18:
#       printf(const char *__restrict__, ...)
        call      printf                                        #29.5
..___tag_value_main.19:
                                # LOE rbx r12 r13 r14 r15
..B1.8:                         # Preds ..B1.7
                                # Execution count [1.00e+00]
        movsd     48+res(%rip), %xmm0                           #29.5
        movl      $.L_2__STRING.0, %edi                         #29.5
        movl      $6, %esi                                      #29.5
        movl      $1, %eax                                      #29.5
..___tag_value_main.20:
#       printf(const char *__restrict__, ...)
        call      printf                                        #29.5
..___tag_value_main.21:
                                # LOE rbx r12 r13 r14 r15
..B1.9:                         # Preds ..B1.8
                                # Execution count [1.00e+00]
        movsd     56+res(%rip), %xmm0                           #29.5
        movl      $.L_2__STRING.0, %edi                         #29.5
        movl      $7, %esi                                      #29.5
        movl      $1, %eax                                      #29.5
..___tag_value_main.22:
#       printf(const char *__restrict__, ...)
        call      printf                                        #29.5
..___tag_value_main.23:
                                # LOE rbx r12 r13 r14 r15
..B1.10:                        # Preds ..B1.9
                                # Execution count [1.00e+00]
        xorl      %eax, %eax                                    #31.10
        movq      %rbp, %rsp                                    #31.10
        popq      %rbp                                          #31.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #31.10
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
.L_2__routine_start_vectorAdd_1:
# -- Begin  vectorAdd
	.text
# mark_begin;
       .align    16,0x90
	.globl vectorAdd
# --- vectorAdd(short)
vectorAdd:
# parameter 1: %edi
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_vectorAdd.27:
..L28:
                                                         #10.28
        movl      $a, %eax                                      #11.0
        kmovw     %edi, %k0                                     #11.0
        movl      $b, %edx                                      #11.0
        movq      %rax, -24(%rsp)                               #11.0
        movq      %rdx, -16(%rsp)                               #11.0
        kmovw     %k0, %k1                                      #11.0
        vmovapd   -24(%rsp), %zmm1                              #11.0
        vaddpd    -16(%rsp), %zmm1, %zmm0{%k1}                  #11.0
        vmovapd   %zmm0, res(%rip){%k1}                         #11.0
        ret                                                     #20.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	vectorAdd,@function
	.size	vectorAdd,.-vectorAdd
..LNvectorAdd.1:
	.data
# -- End  vectorAdd
	.bss
	.align 64
	.align 64
	.globl res
res:
	.type	res,@object
	.size	res,64
	.space 64	# pad
	.data
	.align 64
	.align 64
	.globl a
a:
	.long	0x9999999a,0x3ff19999
	.long	0x9999999a,0x40019999
	.long	0x66666666,0x400a6666
	.long	0x9999999a,0x40119999
	.long	0x00000000,0x40160000
	.long	0x66666666,0x401a6666
	.long	0xcccccccd,0x401ecccc
	.long	0x9999999a,0x40219999
	.type	a,@object
	.size	a,64
	.align 64
	.globl b
b:
	.long	0x9999999a,0x3ff19999
	.long	0x9999999a,0x40019999
	.long	0x66666666,0x400a6666
	.long	0x9999999a,0x40119999
	.long	0x00000000,0x40160000
	.long	0x66666666,0x401a6666
	.long	0xcccccccd,0x401ecccc
	.long	0x9999999a,0x40219999
	.type	b,@object
	.size	b,64
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.long	1534289266
	.long	542991397
	.long	1814372413
	.word	102
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,14
	.data
	.section .note.GNU-stack, ""
# End
