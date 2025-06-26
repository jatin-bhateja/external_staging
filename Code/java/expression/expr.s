# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "";
# mark_description "-I /home/jatinbha/softwares/iaca-lin64/ -O3 -mavx512f -S";
	.file "expr.c"
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
                                                          #59.14
        pushq     %rbp                                          #59.14
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #59.14
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #59.14
        pushq     %r12                                          #59.14
        pushq     %r13                                          #59.14
        pushq     %r14                                          #59.14
        pushq     %r15                                          #59.14
        subq      $96, %rsp                                     #59.14
        xorl      %esi, %esi                                    #59.14
        movl      $3, %edi                                      #59.14
        call      __intel_new_feature_proc_init                 #59.14
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
                                # LOE rbx
..B1.58:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        vstmxcsr  (%rsp)                                        #59.14
        movl      $64, %edi                                     #60.14
        orl       $32832, (%rsp)                                #59.14
        vldmxcsr  (%rsp)                                        #59.14
..___tag_value_main.10:
#       operator new[](std::size_t)
        call      _Znam                                         #60.14
..___tag_value_main.11:
                                # LOE rax rbx
..B1.57:                        # Preds ..B1.58
                                # Execution count [1.00e+00]
        movq      %rax, %r13                                    #60.14
                                # LOE rbx r13
..B1.2:                         # Preds ..B1.57
                                # Execution count [1.00e+00]
        movl      $64, %edi                                     #61.14
..___tag_value_main.12:
#       operator new[](std::size_t)
        call      _Znam                                         #61.14
..___tag_value_main.13:
                                # LOE rax rbx r13
..B1.59:                        # Preds ..B1.2
                                # Execution count [1.00e+00]
        movq      %rax, %r14                                    #61.14
                                # LOE rbx r13 r14
..B1.3:                         # Preds ..B1.59
                                # Execution count [1.00e+00]
        movl      $64, %edi                                     #62.14
..___tag_value_main.14:
#       operator new[](std::size_t)
        call      _Znam                                         #62.14
..___tag_value_main.15:
                                # LOE rax rbx r13 r14
..B1.60:                        # Preds ..B1.3
                                # Execution count [1.00e+00]
        movq      %rax, %r15                                    #62.14
                                # LOE rbx r13 r14 r15
..B1.4:                         # Preds ..B1.60
                                # Execution count [1.00e+00]
        movl      $64, %edi                                     #63.14
..___tag_value_main.16:
#       operator new[](std::size_t)
        call      _Znam                                         #63.14
..___tag_value_main.17:
                                # LOE rax rbx r13 r14 r15
..B1.61:                        # Preds ..B1.4
                                # Execution count [1.00e+00]
        movq      %rax, %r12                                    #63.14
                                # LOE rbx r12 r13 r14 r15
..B1.5:                         # Preds ..B1.61
                                # Execution count [1.00e+00]
        vmovups   .L_2il0floatpacket.1(%rip), %zmm16            #66.16
        movq      %r12, %rdi                                    #72.6
        vmovups   .L_2il0floatpacket.2(%rip), %zmm17            #68.16
        vmovups   .L_2il0floatpacket.3(%rip), %zmm18            #70.16
        vmovdqu32 %zmm16, (%r13)                                #66.9
        vmovdqu32 %zmm17, (%r14)                                #68.9
        vmovdqu32 %zmm18, (%r15)                                #70.9
        movq      %r13, %rsi                                    #72.6
        movq      %r14, %rdx                                    #72.6
        movq      %r15, %rcx                                    #72.6
        vzeroupper                                              #72.6
..___tag_value_main.18:
#       workload(int *, int *, int *, int *)
        call      _Z8workloadPiS_S_S_                           #72.6
..___tag_value_main.19:
                                # LOE rbx r12
..B1.6:                         # Preds ..B1.5
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.20:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.21:
                                # LOE rax rbx r12
..B1.7:                         # Preds ..B1.6
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      (%r12), %esi                                  #75.31
..___tag_value_main.22:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.23:
                                # LOE rax rbx r12
..B1.8:                         # Preds ..B1.7
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.24:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.25:
                                # LOE rbx r12
..B1.9:                         # Preds ..B1.8
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.26:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.27:
                                # LOE rax rbx r12
..B1.10:                        # Preds ..B1.9
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      4(%r12), %esi                                 #75.31
..___tag_value_main.28:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.29:
                                # LOE rax rbx r12
..B1.11:                        # Preds ..B1.10
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.30:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.31:
                                # LOE rbx r12
..B1.12:                        # Preds ..B1.11
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.32:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.33:
                                # LOE rax rbx r12
..B1.13:                        # Preds ..B1.12
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      8(%r12), %esi                                 #75.31
..___tag_value_main.34:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.35:
                                # LOE rax rbx r12
..B1.14:                        # Preds ..B1.13
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.36:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.37:
                                # LOE rbx r12
..B1.15:                        # Preds ..B1.14
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.38:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.39:
                                # LOE rax rbx r12
..B1.16:                        # Preds ..B1.15
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      12(%r12), %esi                                #75.31
..___tag_value_main.40:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.41:
                                # LOE rax rbx r12
..B1.17:                        # Preds ..B1.16
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.42:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.43:
                                # LOE rbx r12
..B1.18:                        # Preds ..B1.17
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.44:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.45:
                                # LOE rax rbx r12
..B1.19:                        # Preds ..B1.18
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      16(%r12), %esi                                #75.31
..___tag_value_main.46:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.47:
                                # LOE rax rbx r12
..B1.20:                        # Preds ..B1.19
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.48:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.49:
                                # LOE rbx r12
..B1.21:                        # Preds ..B1.20
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.50:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.51:
                                # LOE rax rbx r12
..B1.22:                        # Preds ..B1.21
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      20(%r12), %esi                                #75.31
..___tag_value_main.52:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.53:
                                # LOE rax rbx r12
..B1.23:                        # Preds ..B1.22
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.54:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.55:
                                # LOE rbx r12
..B1.24:                        # Preds ..B1.23
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.56:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.57:
                                # LOE rax rbx r12
..B1.25:                        # Preds ..B1.24
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      24(%r12), %esi                                #75.31
..___tag_value_main.58:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.59:
                                # LOE rax rbx r12
..B1.26:                        # Preds ..B1.25
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.60:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.61:
                                # LOE rbx r12
..B1.27:                        # Preds ..B1.26
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.62:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.63:
                                # LOE rax rbx r12
..B1.28:                        # Preds ..B1.27
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      28(%r12), %esi                                #75.31
..___tag_value_main.64:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.65:
                                # LOE rax rbx r12
..B1.29:                        # Preds ..B1.28
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.66:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.67:
                                # LOE rbx r12
..B1.30:                        # Preds ..B1.29
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.68:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.69:
                                # LOE rax rbx r12
..B1.31:                        # Preds ..B1.30
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      32(%r12), %esi                                #75.31
..___tag_value_main.70:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.71:
                                # LOE rax rbx r12
..B1.32:                        # Preds ..B1.31
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.72:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.73:
                                # LOE rbx r12
..B1.33:                        # Preds ..B1.32
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.74:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.75:
                                # LOE rax rbx r12
..B1.34:                        # Preds ..B1.33
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      36(%r12), %esi                                #75.31
..___tag_value_main.76:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.77:
                                # LOE rax rbx r12
..B1.35:                        # Preds ..B1.34
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.78:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.79:
                                # LOE rbx r12
..B1.36:                        # Preds ..B1.35
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.80:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.81:
                                # LOE rax rbx r12
..B1.37:                        # Preds ..B1.36
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      40(%r12), %esi                                #75.31
..___tag_value_main.82:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.83:
                                # LOE rax rbx r12
..B1.38:                        # Preds ..B1.37
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.84:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.85:
                                # LOE rbx r12
..B1.39:                        # Preds ..B1.38
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.86:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.87:
                                # LOE rax rbx r12
..B1.40:                        # Preds ..B1.39
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      44(%r12), %esi                                #75.31
..___tag_value_main.88:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.89:
                                # LOE rax rbx r12
..B1.41:                        # Preds ..B1.40
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.90:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.91:
                                # LOE rbx r12
..B1.42:                        # Preds ..B1.41
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.92:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.93:
                                # LOE rax rbx r12
..B1.43:                        # Preds ..B1.42
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      48(%r12), %esi                                #75.31
..___tag_value_main.94:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.95:
                                # LOE rax rbx r12
..B1.44:                        # Preds ..B1.43
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.96:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.97:
                                # LOE rbx r12
..B1.45:                        # Preds ..B1.44
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.98:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.99:
                                # LOE rax rbx r12
..B1.46:                        # Preds ..B1.45
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      52(%r12), %esi                                #75.31
..___tag_value_main.100:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.101:
                                # LOE rax rbx r12
..B1.47:                        # Preds ..B1.46
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.102:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.103:
                                # LOE rbx r12
..B1.48:                        # Preds ..B1.47
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.104:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.105:
                                # LOE rax rbx r12
..B1.49:                        # Preds ..B1.48
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      56(%r12), %esi                                #75.31
..___tag_value_main.106:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.107:
                                # LOE rax rbx r12
..B1.50:                        # Preds ..B1.49
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.108:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.109:
                                # LOE rbx r12
..B1.51:                        # Preds ..B1.50
                                # Execution count [1.00e+00]
        movl      $_ZSt4cout, %edi                              #75.18
        movl      $.L_2__STRING.0, %esi                         #75.18
..___tag_value_main.110:
#       std::operator<<<std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>> &, const char *)
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.18
..___tag_value_main.111:
                                # LOE rax rbx r12
..B1.52:                        # Preds ..B1.51
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.31
        movl      60(%r12), %esi                                #75.31
..___tag_value_main.112:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, int)
        call      _ZNSolsEi                                     #75.31
..___tag_value_main.113:
                                # LOE rax rbx
..B1.53:                        # Preds ..B1.52
                                # Execution count [1.00e+00]
        movq      %rax, %rdi                                    #75.39
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.39
..___tag_value_main.114:
#       std::basic_ostream<char, std::char_traits<char>>::operator<<(std::basic_ostream<char, std::char_traits<char>> *, std::basic_ostream<char, std::char_traits<char>>::__ostream_type &(*)(std::basic_ostream<char, std::char_traits<char>>::__ostream_type &))
        call      _ZNSolsEPFRSoS_E                              #75.39
..___tag_value_main.115:
                                # LOE rbx
..B1.54:                        # Preds ..B1.53
                                # Execution count [1.00e+00]
        xorl      %eax, %eax                                    #76.3
        addq      $96, %rsp                                     #76.3
	.cfi_restore 15
        popq      %r15                                          #76.3
	.cfi_restore 14
        popq      %r14                                          #76.3
	.cfi_restore 13
        popq      %r13                                          #76.3
	.cfi_restore 12
        popq      %r12                                          #76.3
        movq      %rbp, %rsp                                    #76.3
        popq      %rbp                                          #76.3
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #76.3
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.0:
	.data
# -- End  main
	.section .text._ZNSt11char_traitsIcE6lengthEPKc, "xaG",@progbits,_ZNSt11char_traitsIcE6lengthEPKc,comdat
..TXTST1:
.L_2__routine_start__ZNSt11char_traitsIcE6lengthEPKc_1:
# -- Begin  _ZNSt11char_traitsIcE6lengthEPKc
	.section .text._ZNSt11char_traitsIcE6lengthEPKc, "xaG",@progbits,_ZNSt11char_traitsIcE6lengthEPKc,comdat
# mark_begin;
       .align    16,0x90
	.weak _ZNSt11char_traitsIcE6lengthEPKc
# --- std::char_traits<char>::length(const std::char_traits<char>::char_type *)
_ZNSt11char_traitsIcE6lengthEPKc:
# parameter 1: %rdi
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__ZNSt11char_traitsIcE6lengthEPKc.123:
..L124:
                                                        #259.7
        pushq     %rsi                                          #259.7
	.cfi_def_cfa_offset 16
        movq      %rdi, %rdx                                    #259.16
        movq      %rdx, %rcx                                    #259.16
        andq      $-16, %rdx                                    #259.16
        vpxor     %xmm0, %xmm0, %xmm0                           #259.16
        vpcmpeqb  (%rdx), %xmm0, %xmm0                          #259.16
        vpmovmskb %xmm0, %eax                                   #259.16
        andl      $15, %ecx                                     #259.16
        shrl      %cl, %eax                                     #259.16
        bsf       %eax, %eax                                    #259.16
        jne       ..L126        # Prob 60%                      #259.16
        movq      %rdx, %rax                                    #259.16
        addq      %rcx, %rdx                                    #259.16
        call      *__intel_sse2_strlen@GOTPCREL(%rip)           #259.16
..L126:                                                         #
                                # LOE rax rbx rbp r12 r13 r14 r15
..B2.4:                         # Preds ..B2.1
                                # Execution count [1.00e+00]
        popq      %rcx                                          #259.16
	.cfi_def_cfa_offset 8
        ret                                                     #259.16
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_ZNSt11char_traitsIcE6lengthEPKc,@function
	.size	_ZNSt11char_traitsIcE6lengthEPKc,.-_ZNSt11char_traitsIcE6lengthEPKc
..LN_ZNSt11char_traitsIcE6lengthEPKc.1:
	.data
# -- End  _ZNSt11char_traitsIcE6lengthEPKc
	.text
.L_2__routine_start__Z8workloadPiS_S_S__2:
# -- Begin  _Z8workloadPiS_S_S_
	.text
# mark_begin;
       .align    16,0x90
# --- workload(int *, int *, int *, int *)
_Z8workloadPiS_S_S_:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
..B3.1:                         # Preds ..B3.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z8workloadPiS_S_S_.129:
..L130:
                                                        #10.61
        movl      $111, %ebx                                    #11.0
        .byte     100                                           #11.0
        .byte     103                                           #11.0
        .byte     144                                           #11.0
        vmovups   (%rcx), %zmm19                                #13.31
        vmovups   (%rsi), %zmm16                                #13.17
        vmovups   (%rdx), %zmm17                                #13.24
        vmovaps   %zmm19, %zmm18                                #13.31
        vpternlogd $128, %zmm17, %zmm16, %zmm18                 #13.31
        vpternlogd $254, %zmm17, %zmm16, %zmm19                 #13.54
        vpxord    %zmm19, %zmm18, %zmm20                        #13.54
        vmovdqu32 %zmm20, (%rdi)                                #13.9
        movl      $222, %ebx                                    #15.0
        .byte     100                                           #15.0
        .byte     103                                           #15.0
        .byte     144                                           #15.0
        vzeroupper                                              #16.3
        ret                                                     #16.3
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	_Z8workloadPiS_S_S_,@function
	.size	_Z8workloadPiS_S_S_,.-_Z8workloadPiS_S_S_
..LN_Z8workloadPiS_S_S_.2:
	.data
# -- End  _Z8workloadPiS_S_S_
	.text
.L_2__routine_start___sti__$E_3:
# -- Begin  __sti__$E
	.text
# mark_begin;
       .align    16,0x90
# --- __sti__$E()
__sti__$E:
..B4.1:                         # Preds ..B4.0
                                # Execution count [1.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value___sti__$E.132:
..L133:
                                                        #
        pushq     %rsi                                          #
	.cfi_def_cfa_offset 16
        movl      $_ZSt8__ioinit, %edi                          #74.25
..___tag_value___sti__$E.135:
#       std::ios_base::Init::Init(std::ios_base::Init *)
        call      _ZNSt8ios_base4InitC1Ev                       #74.25
..___tag_value___sti__$E.136:
                                # LOE rbx rbp r12 r13 r14 r15
..B4.2:                         # Preds ..B4.1
                                # Execution count [1.00e+00]
        movl      $_ZNSt8ios_base4InitD1Ev, %edi                #74.25
        movl      $_ZSt8__ioinit, %esi                          #74.25
        movl      $__dso_handle, %edx                           #74.25
        addq      $8, %rsp                                      #74.25
	.cfi_def_cfa_offset 8
#       __cxa_atexit(void (*)(void *), void *, void *)
        jmp       __cxa_atexit                                  #74.25
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	__sti__$E,@function
	.size	__sti__$E,.-__sti__$E
..LN__sti__$E.3:
	.data
# -- End  __sti__$E
	.bss
	.align 4
	.align 1
_ZSt8__ioinit:
	.type	_ZSt8__ioinit,@object
	.size	_ZSt8__ioinit,1
	.space 1	# pad
	.section .rodata, "a"
	.align 64
	.align 64
.L_2il0floatpacket.1:
	.long	0x00000007,0x00000007,0x00000007,0x00000007,0x00000007,0x00000007,0x00000007,0x00000007,0x00000007,0x00000007,0x00000007,0x00000007,0x00000007,0x00000007,0x00000007,0x00000007
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,64
	.align 64
.L_2il0floatpacket.2:
	.long	0x00000002,0x00000002,0x00000002,0x00000002,0x00000002,0x00000002,0x00000002,0x00000002,0x00000002,0x00000002,0x00000002,0x00000002,0x00000002,0x00000002,0x00000002,0x00000002
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
	.long	544433490
	.long	2105405
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,8
	.section .ctors, "wa"
	.align 8
__init_0:
	.type	__init_0,@object
	.size	__init_0,8
	.quad	__sti__$E
	.data
	.hidden __dso_handle
# mark_proc_addr_taken __sti__$E;
	.section .note.GNU-stack, ""
# End
