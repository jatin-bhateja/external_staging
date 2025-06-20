# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "";
# mark_description "-I /home/jatinbha/softwares/iaca-lin64/ -mavx512f -O0 -o copy512_out.s -S";
	.file "copy512_opt1.c"
	.text
..TXTST0:
.L_2__routine_start__Z18vector_masked_loadPcS_l_0:
# -- Begin  _Z18vector_masked_loadPcS_l
	.section .rodata, "a"
	.align 4
	.align 4
.L_2__STRING.0:
	.long	1835363429
	.long	1953391455
	.long	908082720
	.word	52
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,14
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.long	2037411683
	.long	1597124917
	.long	829714543
	.word	25390
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,15
	.align 1
__$U0:
	.long	544501353
	.long	1952671094
	.long	1834971759
	.long	1701540705
	.long	1869373284
	.long	1663591521
	.long	544366952
	.long	1663052842
	.long	544366952
	.long	1814047786
	.long	694644335
	.byte	0
	.type	__$U0,@object
	.size	__$U0,45
	.text
# mark_begin;

	.globl _Z18vector_masked_loadPcS_l
# --- vector_masked_load(char *, char *, long)
_Z18vector_masked_loadPcS_l:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z18vector_masked_loadPcS_l.1:
..L2:
                                                          #27.63
        pushq     %rbp                                          #27.63
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #27.63
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $80, %rsp                                     #27.63
        movq      %r12, -8(%rbp)                                #27.63[spill]
        movq      %rbx, -16(%rbp)                               #27.63[spill]
        movq      %rdi, -80(%rbp)                               #27.63
        movq      %rsi, -72(%rbp)                               #27.63
        movq      %rdx, -64(%rbp)                               #27.63
        movq      -64(%rbp), %rax                               #28.3
        cmpq      $64, %rax                                     #28.3
        jg        ..B1.3        # Prob 50%                      #28.3
	.cfi_offset 3, -32
	.cfi_offset 12, -24
                                # LOE rbp rsp r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movl      $.L_2__STRING.0, %eax                         #28.3
        movl      $.L_2__STRING.1, %edx                         #28.3
        movl      $__$U0, %ecx                                  #28.3
        vzeroupper                                              #28.3
        movq      %rax, %rdi                                    #28.3
        movq      %rdx, %rsi                                    #28.3
        movl      $28, %edx                                     #28.3
..___tag_value__Z18vector_masked_loadPcS_l.10:
#       __assert_fail(const char *, const char *, unsigned int, const char *)
        call      __assert_fail                                 #28.3
..___tag_value__Z18vector_masked_loadPcS_l.11:
                                # LOE rbp rsp r13 r14 r15 rip
..B1.3:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movl      $111, %ebx                                    #29.0
        .byte     100                                           #29.0
        .byte     103                                           #29.0
        .byte     144                                           #29.0
        movq      -80(%rbp), %rax                               #30.30
        andq      $63, %rax                                     #30.37
        negq      %rax                                          #30.37
        addq      $64, %rax                                     #30.37
        andq      $63, %rax                                     #30.44
        movq      %rax, -56(%rbp)                               #30.14
        movl      $1, %eax                                      #31.29
        movl      -56(%rbp), %edx                               #31.22
        movl      %edx, %ecx                                    #31.22
        shll      %cl, %eax                                     #31.22
        decl      %eax                                          #31.29
        movslq    %eax, %rax                                    #31.29
        movq      %rax, -48(%rbp)                               #31.14
        movl      $1, %eax                                      #32.57
        movl      -64(%rbp), %edx                               #32.38
        addl      -80(%rbp), %edx                               #32.38
        movl      %edx, %ecx                                    #32.50
        shll      %cl, %eax                                     #32.50
        decl      %eax                                          #32.57
        movslq    %eax, %rax                                    #32.57
        movq      %rax, -40(%rbp)                               #32.14
        movq      -72(%rbp), %rax                               #33.0
        movq      -64(%rbp), %rdx                               #33.0
        movq      -48(%rbp), %rcx                               #33.0
        movq      -40(%rbp), %rbx                               #33.0
        movq      -56(%rbp), %rsi                               #33.0
        movq      %rcx, -32(%rbp)                               #33.0[spill]
        movq      %rax, -24(%rbp)                               #33.0[spill]
        movq      -32(%rbp), %rdi                               #33.0[spill]
        movq      -24(%rbp), %r8                                #33.0[spill]
# Begin ASM
        kmovq      %rdi  , %k2             
	kmovq      %rbx  , %k3             
	movq       %rsi  , %rcx            
	movq       %r8  , %r9             
	movq       %rdx  , %r12            
	vmovdqu8  (%r9) , %zmm1 {%k2} 
	vmovdqu8  %zmm1 , (%r12) {%k2} 
	addq  %rcx , %r9                
	addq  %rcx , %r12               
	main_loop:                        
	 vmovdqu8  (%r9) , %zmm1       
	 vmovdqu8  %zmm1 , (%r12)      
	 addq  $64 , %r9                 
	 addq  $64 , %r12                
	 cmpq  %r11 , %r12              
	 jl    main_loop                  
	vmovdqu8  (%r9) , %zmm1 {%k3}   
	vmovdqu8  %zmm1 , (%r12) {%k3}   
	
# End ASM                                                       #33.0
        movq      %rdx, -80(%rbp)                               #33.0
        movl      $222, %ebx                                    #56.0
        .byte     100                                           #56.0
        .byte     103                                           #56.0
        .byte     144                                           #56.0
        movq      -80(%rbp), %rax                               #57.10
        movsbl    63(%rax), %eax                                #57.10
        movsbq    %al, %rax                                     #57.10
        vzeroupper                                              #57.10
        movq      -16(%rbp), %rbx                               #57.10[spill]
	.cfi_restore 3
        movq      -8(%rbp), %r12                                #57.10[spill]
	.cfi_restore 12
        leave                                                   #57.10
	.cfi_restore 6
        ret                                                     #57.10
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z18vector_masked_loadPcS_l,@function
	.size	_Z18vector_masked_loadPcS_l,.-_Z18vector_masked_loadPcS_l
..LN_Z18vector_masked_loadPcS_l.0:
	.data
# -- End  _Z18vector_masked_loadPcS_l
	.text
.L_2__routine_start__Z8init_memPcc_1:
# -- Begin  _Z8init_memPcc
	.text
# mark_begin;

	.globl _Z8init_memPcc
# --- init_mem(char *, char)
_Z8init_memPcc:
# parameter 1: %rdi
# parameter 2: %esi
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z8init_memPcc.22:
..L23:
                                                         #60.37
        pushq     %rbp                                          #60.37
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #60.37
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $32, %rsp                                     #60.37
        movq      %rdi, -24(%rbp)                               #60.37
        movb      %sil, -16(%rbp)                               #60.37
        movl      $0, -32(%rbp)                                 #61.13
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.2:                         # Preds ..B2.3 ..B2.1
                                # Execution count [0.00e+00]
        movl      -32(%rbp), %eax                               #61.19
        cmpl      $512, %eax                                    #61.23
        jae       ..B2.4        # Prob 50%                      #61.23
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.3:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
        movl      -32(%rbp), %eax                               #62.9
        movslq    %eax, %rax                                    #62.5
        addq      -24(%rbp), %rax                               #62.5
        movsbl    -16(%rbp), %edx                               #62.14
        movb      %dl, (%rax)                                   #62.5
        movl      $1, %eax                                      #61.35
        addl      -32(%rbp), %eax                               #61.35
        movl      %eax, -32(%rbp)                               #61.35
        jmp       ..B2.2        # Prob 100%                     #61.35
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.4:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
        leave                                                   #63.1
	.cfi_restore 6
        ret                                                     #63.1
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z8init_memPcc,@function
	.size	_Z8init_memPcc,.-_Z8init_memPcc
..LN_Z8init_memPcc.1:
	.data
# -- End  _Z8init_memPcc
	.text
.L_2__routine_start_main_2:
# -- Begin  main
	.section .rodata, "a"
	.align 4
.L_2__STRING.2:
	.long	1630481952
	.long	1008758896
	.long	1145323856
	.long	541544009
	.long	544370534
	.long	1646277686
	.long	543519865
	.long	1734962273
	.long	543450478
	.long	1869440365
	.long	540965234
	.long	1396788540
	.long	169885259
	.byte	0
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,53
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.3:
	.long	1702127963
	.long	975205234
	.long	1684808992
	.long	1699881053
	.long	540876915
	.long	680997
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,24
	.text
# mark_begin;

	.globl main
# --- main(int, char **)
main:
# parameter 1: %edi
# parameter 2: %rsi
..B3.1:                         # Preds ..B3.0
                                # Execution count [0.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value_main.29:
..L30:
                                                         #65.35
        pushq     %rbp                                          #65.35
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #65.35
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $96, %rsp                                     #65.35
        movl      %edi, -64(%rbp)                               #65.35
        movq      %rsi, -56(%rbp)                               #65.35
        movl      $0, -96(%rbp)                                 #66.11
        movq      $0, -48(%rbp)                                 #67.17
        movl      -64(%rbp), %eax                               #68.7
        cmpl      $3, %eax                                      #68.15
        je        ..B3.4        # Prob 50%                      #68.15
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.2:                         # Preds ..B3.1
                                # Execution count [0.00e+00]
        movq      stderr(%rip), %rax                            #69.5
        movl      $.L_2__STRING.2, %edx                         #69.5
        movq      %rax, %rdi                                    #69.5
        movq      %rdx, %rsi                                    #69.5
        movl      $0, %eax                                      #69.5
..___tag_value_main.34:
#       fprintf(FILE *, const char *, ...)
        call      fprintf                                       #69.5
..___tag_value_main.35:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B3.16:                        # Preds ..B3.2
                                # Execution count [0.00e+00]
        movl      %eax, -92(%rbp)                               #69.5
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.3:                         # Preds ..B3.16
                                # Execution count [0.00e+00]
        movl      $-1, %eax                                     #70.12
        leave                                                   #70.12
	.cfi_restore 6
        ret                                                     #70.12
	.cfi_offset 6, -16
                                # LOE
..B3.4:                         # Preds ..B3.1
                                # Execution count [0.00e+00]
        movl      $512, %eax                                    #72.23
        movl      $64, %edx                                     #72.23
        movq      %rax, %rdi                                    #72.23
        movq      %rdx, %rsi                                    #72.23
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #72.23
                                # LOE rax rbx rbp rsp r12 r13 r14 r15 rip
..B3.17:                        # Preds ..B3.4
                                # Execution count [0.00e+00]
        movq      %rax, -40(%rbp)                               #72.23
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.5:                         # Preds ..B3.17
                                # Execution count [0.00e+00]
        movq      -40(%rbp), %rax                               #72.23
        movq      %rax, -32(%rbp)                               #72.14
        movl      $512, %eax                                    #73.23
        movl      $64, %edx                                     #73.23
        movq      %rax, %rdi                                    #73.23
        movq      %rdx, %rsi                                    #73.23
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #73.23
                                # LOE rax rbx rbp rsp r12 r13 r14 r15 rip
..B3.18:                        # Preds ..B3.5
                                # Execution count [0.00e+00]
        movq      %rax, -24(%rbp)                               #73.23
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.6:                         # Preds ..B3.18
                                # Execution count [0.00e+00]
        movq      -24(%rbp), %rax                               #73.23
        movq      %rax, -16(%rbp)                               #73.14
        movq      -32(%rbp), %rax                               #75.3
        movl      $1, %edx                                      #75.3
        movq      %rax, %rdi                                    #75.3
        movl      %edx, %esi                                    #75.3
..___tag_value_main.38:
#       init_mem(char *, char)
        call      _Z8init_memPcc                                #75.3
..___tag_value_main.39:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.7:                         # Preds ..B3.6
                                # Execution count [0.00e+00]
        movq      -16(%rbp), %rax                               #76.3
        movl      $0, %edx                                      #76.3
        movq      %rax, %rdi                                    #76.3
        movl      %edx, %esi                                    #76.3
..___tag_value_main.40:
#       init_mem(char *, char)
        call      _Z8init_memPcc                                #76.3
..___tag_value_main.41:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.8:                         # Preds ..B3.7
                                # Execution count [0.00e+00]
        movl      $8, %eax                                      #79.24
        addq      -56(%rbp), %rax                               #79.24
        movq      (%rax), %rax                                  #79.24
        movq      %rax, %rdi                                    #79.24
..___tag_value_main.42:
#       atoi(const char *)
        call      atoi                                          #79.24
..___tag_value_main.43:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B3.20:                        # Preds ..B3.8
                                # Execution count [0.00e+00]
        movl      %eax, -88(%rbp)                               #79.24
        movl      -88(%rbp), %eax                               #79.24
        movslq    %eax, %rax                                    #79.17
        addq      -16(%rbp), %rax                               #79.17
        movq      %rax, -16(%rbp)                               #79.3
        movl      $16, %eax                                     #81.14
        addq      -56(%rbp), %rax                               #81.14
        movq      (%rax), %rax                                  #81.14
        movq      %rax, %rdi                                    #81.14
..___tag_value_main.44:
#       atoi(const char *)
        call      atoi                                          #81.14
..___tag_value_main.45:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B3.19:                        # Preds ..B3.20
                                # Execution count [0.00e+00]
        movl      %eax, -84(%rbp)                               #81.14
        movl      -84(%rbp), %eax                               #81.14
        movl      %eax, -80(%rbp)                               #81.12
        movl      $0, -76(%rbp)                                 #83.17
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.9:                         # Preds ..B3.11 ..B3.19
                                # Execution count [0.00e+00]
        movl      -76(%rbp), %eax                               #83.23
        cmpl      $1048576, %eax                                #83.30
        jge       ..B3.12       # Prob 50%                      #83.30
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.10:                        # Preds ..B3.9
                                # Execution count [0.00e+00]
        movq      -16(%rbp), %rax                               #84.12
        movq      -32(%rbp), %rdx                               #84.12
        movl      $512, %ecx                                    #84.12
        movq      %rax, %rdi                                    #84.12
        movq      %rdx, %rsi                                    #84.12
        movq      %rcx, %rdx                                    #84.12
..___tag_value_main.46:
#       vector_masked_load(char *, char *, long)
        call      _Z18vector_masked_loadPcS_l                   #84.12
..___tag_value_main.47:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B3.21:                        # Preds ..B3.10
                                # Execution count [0.00e+00]
        movl      %eax, -72(%rbp)                               #84.12
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.11:                        # Preds ..B3.21
                                # Execution count [0.00e+00]
        movl      -72(%rbp), %eax                               #84.12
        addl      -96(%rbp), %eax                               #84.5
        movl      %eax, -96(%rbp)                               #84.5
        movl      $1, %eax                                      #85.5
        addq      -48(%rbp), %rax                               #85.5
        movq      %rax, -48(%rbp)                               #85.5
        movl      $1, %eax                                      #83.39
        addl      -76(%rbp), %eax                               #83.39
        movl      %eax, -76(%rbp)                               #83.39
        jmp       ..B3.9        # Prob 100%                     #83.39
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.12:                        # Preds ..B3.9
                                # Execution count [0.00e+00]
        movl      $.L_2__STRING.3, %eax                         #88.10
        movq      -48(%rbp), %rdx                               #88.10
        movl      -96(%rbp), %ecx                               #88.10
        movq      %rax, %rdi                                    #88.10
        movq      %rdx, %rsi                                    #88.10
        movl      %ecx, %edx                                    #88.10
        movl      $0, %eax                                      #88.10
..___tag_value_main.48:
#       printf(const char *, ...)
        call      printf                                        #88.10
..___tag_value_main.49:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B3.22:                        # Preds ..B3.12
                                # Execution count [0.00e+00]
        movl      %eax, -68(%rbp)                               #88.10
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.13:                        # Preds ..B3.22
                                # Execution count [0.00e+00]
        movl      -68(%rbp), %eax                               #88.10
        leave                                                   #88.10
	.cfi_restore 6
        ret                                                     #88.10
                                # LOE
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.2:
	.data
# -- End  main
	.data
	.section .note.GNU-stack, ""
# End
