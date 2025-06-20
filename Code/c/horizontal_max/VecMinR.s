# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "";
# mark_description "-mavx512f -O3 -S -DAVX512";
	.file "VecMinR.cpp"
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
                                                          #94.12
        pushq     %rbp                                          #94.12
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #94.12
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #94.12
        pushq     %rbx                                          #94.12
        subq      $248, %rsp                                    #94.12
        xorl      %esi, %esi                                    #94.12
        movl      $3, %edi                                      #94.12
        call      __intel_new_feature_proc_init                 #94.12
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
                                # LOE r12 r13 r14 r15
..B1.32:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        vstmxcsr  (%rsp)                                        #94.12
        movl      $64, %edi                                     #95.26
        orl       $32832, (%rsp)                                #94.12
        movq      %rdi, %rsi                                    #95.26
        vldmxcsr  (%rsp)                                        #94.12
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #95.26
                                # LOE rax r12 r13 r14 r15
..B1.31:                        # Preds ..B1.32
                                # Execution count [1.00e+00]
        movq      %rax, %rbx                                    #95.26
                                # LOE rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.31
                                # Execution count [1.00e+00]
        vcvtdq2ps .L_2il0floatpacket.1(%rip), %zmm16            #97.15
        movl      $10, %edi                                     #103.3
        vaddps    .L_2il0floatpacket.0(%rip), %zmm16, %zmm17    #97.19
        vmovups   %zmm17, (%rbx)                                #97.5
        movl      $-1067450368, 28(%rbx)                        #98.3
        movl      $-1071644672, 12(%rbx)                        #99.3
        vmovups   (%rbx), %zmm18                                #102.32
        vmovups   %zmm18, 128(%rsp)                             #102.32[spill]
        vzeroupper                                              #103.3
        call      putchar                                       #103.3
                                # LOE rbx r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
                                # Execution count [9.00e-01]
        xorl      %eax, %eax                                    #103.3
        movq      %r15, 32(%rsp)                                #103.3[spill]
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x20, 0xff, 0xff, 0xff, 0x22
        movq      %rax, %r15                                    #103.3
                                # LOE rbx r12 r13 r14 r15
..B1.4:                         # Preds ..B1.5 ..B1.3
                                # Execution count [1.44e+01]
        vmovups   128(%rsp), %zmm16                             #103.3[spill]
        vxorpd    %xmm0, %xmm0, %xmm0                           #103.3
        vmovups   %zmm16, 40(%rsp)                              #103.3
        movl      $.L_2__STRING.1, %edi                         #103.3
        movl      $1, %eax                                      #103.3
        vcvtss2sd 40(%rsp,%r15,4), %xmm0, %xmm0                 #103.3
        vzeroupper                                              #103.3
..___tag_value_main.11:
#       printf(const char *, ...)
        call      printf                                        #103.3
..___tag_value_main.12:
                                # LOE rbx r12 r13 r14 r15
..B1.5:                         # Preds ..B1.4
                                # Execution count [1.44e+01]
        incq      %r15                                          #103.3
        cmpq      $16, %r15                                     #103.3
        jb        ..B1.4        # Prob 93%                      #103.3
                                # LOE rbx r12 r13 r14 r15
..B1.6:                         # Preds ..B1.5
                                # Execution count [1.00e+00]
        vmovups   128(%rsp), %zmm0                              #104.20[spill]
        movq      32(%rsp), %r15                                #[spill]
	.cfi_restore 15
..___tag_value_main.16:
#       vminps512(__m512)
        call      _Z9vminps5126__m512                           #104.20
..___tag_value_main.17:
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x20, 0xff, 0xff, 0xff, 0x22
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.7:                         # Preds ..B1.6
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.2, %edi                         #105.3
        movl      $1, %eax                                      #105.3
        vcvtss2sd %xmm0, %xmm0, %xmm0                           #105.3
..___tag_value_main.19:
#       printf(const char *, ...)
        call      printf                                        #105.3
..___tag_value_main.20:
                                # LOE rbx r12 r13 r14 r15
..B1.8:                         # Preds ..B1.7
                                # Execution count [1.00e+00]
        vmovups   (%rbx), %ymm0                                 #108.33
        movl      $10, %edi                                     #109.3
        vmovss    (%rbx), %xmm16                                #108.33
        vmovss    4(%rbx), %xmm17                               #108.33
        vmovss    8(%rbx), %xmm18                               #108.33
        vmovss    12(%rbx), %xmm19                              #108.33
        vmovss    16(%rbx), %xmm20                              #108.33
        vmovss    20(%rbx), %xmm21                              #108.33
        vmovss    24(%rbx), %xmm22                              #108.33
        vmovss    28(%rbx), %xmm23                              #108.33
        vmovss    %xmm16, 48(%rsp)                              #108.33[spill]
        vmovss    %xmm17, 96(%rsp)                              #108.33[spill]
        vmovss    %xmm18, 72(%rsp)                              #108.33[spill]
        vmovss    %xmm19, 40(%rsp)                              #108.33[spill]
        vmovss    %xmm20, 88(%rsp)                              #108.33[spill]
        vmovss    %xmm21, 56(%rsp)                              #108.33[spill]
        vmovss    %xmm22, 64(%rsp)                              #108.33[spill]
        vmovss    %xmm23, 80(%rsp)                              #108.33[spill]
        vmovups   %ymm0, (%rsp)                                 #108.33[spill]
        vzeroupper                                              #109.3
        call      putchar                                       #109.3
                                # LOE rbx r12 r13 r14 r15
..B1.9:                         # Preds ..B1.8
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #109.3[spill]
        movl      $.L_2__STRING.1, %edi                         #109.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #109.3
        vcvtss2sd 48(%rsp), %xmm0, %xmm0                        #109.3[spill]
        movl      $1, %eax                                      #109.3
        vzeroupper                                              #109.3
..___tag_value_main.32:
#       printf(const char *, ...)
        call      printf                                        #109.3
..___tag_value_main.33:
                                # LOE rbx r12 r13 r14 r15
..B1.10:                        # Preds ..B1.9
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #109.3[spill]
        movl      $.L_2__STRING.1, %edi                         #109.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #109.3
        vcvtss2sd 96(%rsp), %xmm0, %xmm0                        #109.3[spill]
        movl      $1, %eax                                      #109.3
        vzeroupper                                              #109.3
..___tag_value_main.36:
#       printf(const char *, ...)
        call      printf                                        #109.3
..___tag_value_main.37:
                                # LOE rbx r12 r13 r14 r15
..B1.11:                        # Preds ..B1.10
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #109.3[spill]
        movl      $.L_2__STRING.1, %edi                         #109.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #109.3
        vcvtss2sd 72(%rsp), %xmm0, %xmm0                        #109.3[spill]
        movl      $1, %eax                                      #109.3
        vzeroupper                                              #109.3
..___tag_value_main.40:
#       printf(const char *, ...)
        call      printf                                        #109.3
..___tag_value_main.41:
                                # LOE rbx r12 r13 r14 r15
..B1.12:                        # Preds ..B1.11
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #109.3[spill]
        movl      $.L_2__STRING.1, %edi                         #109.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #109.3
        vcvtss2sd 40(%rsp), %xmm0, %xmm0                        #109.3[spill]
        movl      $1, %eax                                      #109.3
        vzeroupper                                              #109.3
..___tag_value_main.44:
#       printf(const char *, ...)
        call      printf                                        #109.3
..___tag_value_main.45:
                                # LOE rbx r12 r13 r14 r15
..B1.13:                        # Preds ..B1.12
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #109.3[spill]
        movl      $.L_2__STRING.1, %edi                         #109.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #109.3
        vcvtss2sd 88(%rsp), %xmm0, %xmm0                        #109.3[spill]
        movl      $1, %eax                                      #109.3
        vzeroupper                                              #109.3
..___tag_value_main.48:
#       printf(const char *, ...)
        call      printf                                        #109.3
..___tag_value_main.49:
                                # LOE rbx r12 r13 r14 r15
..B1.14:                        # Preds ..B1.13
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #109.3[spill]
        movl      $.L_2__STRING.1, %edi                         #109.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #109.3
        vcvtss2sd 56(%rsp), %xmm0, %xmm0                        #109.3[spill]
        movl      $1, %eax                                      #109.3
        vzeroupper                                              #109.3
..___tag_value_main.52:
#       printf(const char *, ...)
        call      printf                                        #109.3
..___tag_value_main.53:
                                # LOE rbx r12 r13 r14 r15
..B1.15:                        # Preds ..B1.14
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #109.3[spill]
        movl      $.L_2__STRING.1, %edi                         #109.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #109.3
        vcvtss2sd 64(%rsp), %xmm0, %xmm0                        #109.3[spill]
        movl      $1, %eax                                      #109.3
        vzeroupper                                              #109.3
..___tag_value_main.56:
#       printf(const char *, ...)
        call      printf                                        #109.3
..___tag_value_main.57:
                                # LOE rbx r12 r13 r14 r15
..B1.16:                        # Preds ..B1.15
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %ymm0                                 #109.3[spill]
        movl      $.L_2__STRING.1, %edi                         #109.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #109.3
        vcvtss2sd 80(%rsp), %xmm0, %xmm0                        #109.3[spill]
        movl      $1, %eax                                      #109.3
        vzeroupper                                              #109.3
..___tag_value_main.60:
#       printf(const char *, ...)
        call      printf                                        #109.3
..___tag_value_main.61:
                                # LOE rbx r12 r13 r14 r15
..B1.17:                        # Preds ..B1.16
                                # Execution count [1.00e+00]
        vmovups   (%rsp), %ymm0                                 #110.20[spill]
..___tag_value_main.62:
#       vminps256(__m256)
        call      _Z9vminps2566__m256                           #110.20
..___tag_value_main.63:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.34:                        # Preds ..B1.17
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.3, %edi                         #111.3
        movl      $1, %eax                                      #111.3
        vcvtss2sd %xmm0, %xmm0, %xmm0                           #111.3
..___tag_value_main.65:
#       printf(const char *, ...)
        call      printf                                        #111.3
..___tag_value_main.66:
                                # LOE rbx r12 r13 r14 r15
..B1.18:                        # Preds ..B1.34
                                # Execution count [1.00e+00]
        vmovss    (%rbx), %xmm16                                #113.30
        movl      $10, %edi                                     #114.3
        vmovss    4(%rbx), %xmm17                               #113.30
        vmovss    8(%rbx), %xmm18                               #113.30
        vmovss    12(%rbx), %xmm19                              #113.30
        vmovups   (%rbx), %xmm0                                 #113.30
        vmovss    %xmm16, 48(%rsp)                              #113.30[spill]
        vmovss    %xmm17, 40(%rsp)                              #113.30[spill]
        vmovss    %xmm18, 24(%rsp)                              #113.30[spill]
        vmovss    %xmm19, 16(%rsp)                              #113.30[spill]
        vmovups   %xmm0, (%rsp)                                 #113.30[spill]
        call      putchar                                       #114.3
                                # LOE r12 r13 r14 r15
..B1.19:                        # Preds ..B1.18
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %xmm0                                 #114.3[spill]
        movl      $.L_2__STRING.1, %edi                         #114.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #114.3
        movl      $1, %eax                                      #114.3
        vcvtss2sd 48(%rsp), %xmm0, %xmm0                        #114.3[spill]
        vmovsd    %xmm0, 56(%rsp)                               #114.3[spill]
..___tag_value_main.74:
#       printf(const char *, ...)
        call      printf                                        #114.3
..___tag_value_main.75:
                                # LOE r12 r13 r14 r15
..B1.20:                        # Preds ..B1.19
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %xmm0                                 #114.3[spill]
        movl      $.L_2__STRING.1, %edi                         #114.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #114.3
        movl      $1, %eax                                      #114.3
        vcvtss2sd 40(%rsp), %xmm0, %xmm0                        #114.3[spill]
        vmovsd    %xmm0, 48(%rsp)                               #114.3[spill]
..___tag_value_main.79:
#       printf(const char *, ...)
        call      printf                                        #114.3
..___tag_value_main.80:
                                # LOE r12 r13 r14 r15
..B1.21:                        # Preds ..B1.20
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %xmm0                                 #114.3[spill]
        movl      $.L_2__STRING.1, %edi                         #114.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #114.3
        movl      $1, %eax                                      #114.3
        vcvtss2sd 24(%rsp), %xmm0, %xmm0                        #114.3[spill]
..___tag_value_main.83:
#       printf(const char *, ...)
        call      printf                                        #114.3
..___tag_value_main.84:
                                # LOE r12 r13 r14 r15
..B1.22:                        # Preds ..B1.21
                                # Execution count [9.00e-01]
        vmovups   (%rsp), %xmm0                                 #114.3[spill]
        movl      $.L_2__STRING.1, %edi                         #114.3
        vxorpd    %xmm0, %xmm0, %xmm0                           #114.3
        movl      $1, %eax                                      #114.3
        vcvtss2sd 16(%rsp), %xmm0, %xmm0                        #114.3[spill]
..___tag_value_main.87:
#       printf(const char *, ...)
        call      printf                                        #114.3
..___tag_value_main.88:
                                # LOE r12 r13 r14 r15
..B1.23:                        # Preds ..B1.22
                                # Execution count [1.00e+00]
        vmovups   (%rsp), %xmm0                                 #115.20[spill]
..___tag_value_main.90:
#       vminps128(__m128)
        call      _Z9vminps1286__m128                           #115.20
..___tag_value_main.91:
                                # LOE r12 r13 r14 r15 xmm0
..B1.35:                        # Preds ..B1.23
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.4, %edi                         #116.3
        movl      $1, %eax                                      #116.3
        vcvtss2sd %xmm0, %xmm0, %xmm0                           #116.3
..___tag_value_main.93:
#       printf(const char *, ...)
        call      printf                                        #116.3
..___tag_value_main.94:
                                # LOE r12 r13 r14 r15
..B1.24:                        # Preds ..B1.35
                                # Execution count [1.00e+00]
        movl      $10, %edi                                     #118.3
        call      putchar                                       #118.3
                                # LOE r12 r13 r14 r15
..B1.25:                        # Preds ..B1.24
                                # Execution count [1.80e+00]
        movl      $.L_2__STRING.1, %edi                         #118.3
        movl      $1, %eax                                      #118.3
        vmovsd    56(%rsp), %xmm0                               #118.3[spill]
..___tag_value_main.95:
#       printf(const char *, ...)
        call      printf                                        #118.3
..___tag_value_main.96:
                                # LOE r12 r13 r14 r15
..B1.26:                        # Preds ..B1.25
                                # Execution count [1.80e+00]
        movl      $.L_2__STRING.1, %edi                         #118.3
        movl      $1, %eax                                      #118.3
        vmovsd    48(%rsp), %xmm0                               #118.3[spill]
..___tag_value_main.98:
#       printf(const char *, ...)
        call      printf                                        #118.3
..___tag_value_main.99:
                                # LOE r12 r13 r14 r15
..B1.27:                        # Preds ..B1.26
                                # Execution count [1.00e+00]
        vmovups   (%rsp), %xmm0                                 #119.19[spill]
..___tag_value_main.101:
#       vminps64(__m128)
        call      _Z8vminps646__m128                            #119.19
..___tag_value_main.102:
                                # LOE r12 r13 r14 r15 xmm0
..B1.36:                        # Preds ..B1.27
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.5, %edi                         #120.3
        movl      $1, %eax                                      #120.3
        vcvtss2sd %xmm0, %xmm0, %xmm0                           #120.3
..___tag_value_main.104:
#       printf(const char *, ...)
        call      printf                                        #120.3
..___tag_value_main.105:
                                # LOE r12 r13 r14 r15
..B1.28:                        # Preds ..B1.36
                                # Execution count [1.00e+00]
        xorl      %eax, %eax                                    #122.10
        addq      $248, %rsp                                    #122.10
	.cfi_restore 3
        popq      %rbx                                          #122.10
        movq      %rbp, %rsp                                    #122.10
        popq      %rbp                                          #122.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #122.10
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
.L_2__routine_start__Z9vminps5126__m512_1:
# -- Begin  _Z9vminps5126__m512
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z9vminps5126__m512
# --- vminps512(__m512)
_Z9vminps5126__m512:
# parameter 1: %zmm0
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z9vminps5126__m512.110:
..L111:
                                                        #35.30
# Begin ASM
        vextractf32x8 $1,  %zmm0 ,     %zmm1      
	vminps        %zmm0,  %zmm1 , %zmm2      
	vextractf32x4 $1,  %zmm2 , %zmm1      
	vminps        %zmm1,  %zmm2 , %zmm2  
	vpermilps     $4E,  %zmm2 , %zmm1     
	vminps        %zmm1,  %zmm2 , %zmm2  
	vpermilps    $1,  %zmm2 , %zmm1       
	vminss       %zmm1,  %zmm2 , %zmm2   
	vmovss       %zmm2,  %eax                
	
# End ASM                                                       #37.0
        movl      %eax, -8(%rsp)                                #37.0
        vmovss    -8(%rsp), %xmm0                               #51.10
        vzeroupper                                              #51.10
        ret                                                     #51.10
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z9vminps5126__m512,@function
	.size	_Z9vminps5126__m512,.-_Z9vminps5126__m512
..LN_Z9vminps5126__m512.1:
	.data
# -- End  _Z9vminps5126__m512
	.text
.L_2__routine_start__Z9vminps2566__m256_2:
# -- Begin  _Z9vminps2566__m256
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z9vminps2566__m256
# --- vminps256(__m256)
_Z9vminps2566__m256:
# parameter 1: %ymm0
..B3.1:                         # Preds ..B3.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z9vminps2566__m256.113:
..L114:
                                                        #61.29
        pushq     %rbp                                          #61.29
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #61.29
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-32, %rsp                                    #61.29
        vperm2f128 $1, %ymm0, %ymm0, %ymm1                      #62.21
        vminps    %ymm1, %ymm0, %ymm2                           #63.15
        vshufps   $14, %ymm2, %ymm2, %ymm3                      #64.19
        vminps    %ymm3, %ymm2, %ymm4                           #65.15
        vshufps   $1, %ymm4, %ymm4, %ymm5                       #66.19
        vminps    %ymm5, %ymm4, %ymm6                           #67.15
        vmovups   %ymm6, -32(%rsp)                              #67.13
        vmovss    -32(%rsp), %xmm0                              #68.13
        vzeroupper                                              #68.13
        movq      %rbp, %rsp                                    #68.13
        popq      %rbp                                          #68.13
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #68.13
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z9vminps2566__m256,@function
	.size	_Z9vminps2566__m256,.-_Z9vminps2566__m256
..LN_Z9vminps2566__m256.2:
	.data
# -- End  _Z9vminps2566__m256
	.text
.L_2__routine_start__Z9vminps1286__m128_3:
# -- Begin  _Z9vminps1286__m128
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z9vminps1286__m128
# --- vminps128(__m128)
_Z9vminps1286__m128:
# parameter 1: %xmm0
..B4.1:                         # Preds ..B4.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z9vminps1286__m128.121:
..L122:
                                                        #72.29
        vshufps   $14, %xmm0, %xmm0, %xmm1                      #73.19
        vminps    %xmm1, %xmm0, %xmm2                           #74.15
        vshufps   $1, %xmm2, %xmm2, %xmm3                       #75.19
        vminps    %xmm3, %xmm2, %xmm0                           #76.15
        ret                                                     #77.13
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z9vminps1286__m128,@function
	.size	_Z9vminps1286__m128,.-_Z9vminps1286__m128
..LN_Z9vminps1286__m128.3:
	.data
# -- End  _Z9vminps1286__m128
	.text
.L_2__routine_start__Z8vminps646__m128_4:
# -- Begin  _Z8vminps646__m128
	.text
# mark_begin;
       .align    16,0x90
	.globl _Z8vminps646__m128
# --- vminps64(__m128)
_Z8vminps646__m128:
# parameter 1: %xmm0
..B5.1:                         # Preds ..B5.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z8vminps646__m128.124:
..L125:
                                                        #81.28
        vshufps   $1, %xmm0, %xmm0, %xmm1                       #82.19
        vminps    %xmm1, %xmm0, %xmm0                           #83.15
        ret                                                     #84.13
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z8vminps646__m128,@function
	.size	_Z8vminps646__m128,.-_Z8vminps646__m128
..LN_Z8vminps646__m128.4:
	.data
# -- End  _Z8vminps646__m128
	.section .rodata, "a"
	.align 64
	.align 64
.L_2il0floatpacket.0:
	.long	0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd,0x3f8ccccd
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,64
	.align 64
.L_2il0floatpacket.1:
	.long	0x00000000,0x00000001,0x00000002,0x00000003,0x00000004,0x00000005,0x00000006,0x00000007,0x00000008,0x00000009,0x0000000a,0x0000000b,0x0000000c,0x0000000d,0x0000000e,0x0000000f
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,64
	.align 4
.L_2il0floatpacket.2:
	.long	0xc0600000
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,4
	.align 4
.L_2il0floatpacket.3:
	.long	0xc0200000
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,4
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.1:
	.long	2123301
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,4
	.align 4
.L_2__STRING.2:
	.long	1936019978
	.long	540160309
	.long	1713709117
	.word	10
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,14
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.3:
	.long	1936019978
	.long	540423474
	.long	1713709117
	.word	10
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,14
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.4:
	.long	1936019978
	.long	540553777
	.long	1713709117
	.word	10
	.type	.L_2__STRING.4,@object
	.size	.L_2__STRING.4,14
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.5:
	.long	1936019978
	.long	1025520694
	.long	174466336
	.byte	0
	.type	.L_2__STRING.5,@object
	.size	.L_2__STRING.5,13
	.data
	.section .note.GNU-stack, ""
# End
