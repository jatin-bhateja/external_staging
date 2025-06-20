	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.1.0.166 Build 20191121";
# mark_description "";
# mark_description "-I /home/jatinbha/softwares/iaca-lin64/ -x c++ -mavx512f -o copy512_scalar_lt64.s -S -g";
	.file "copy512_scalar_lt64.c"
	.text
..TXTST0:
.L_2__routine_start__Z8init_memPcc_0:
# -- Begin  _Z8init_memPcc
	.text
# mark_begin;

	.globl _Z8init_memPcc
# --- init_mem(char *, char)
_Z8init_memPcc:
# parameter 1(mem): %rdi
# parameter 2(val): %esi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z8init_memPcc.2:
..L3:
                                                          #19.37
..LN0:
	.file   1 "copy512_scalar_lt64.c"
	.loc    1  19  is_stmt 1
        pushq     %rbp                                          #19.37
	.cfi_def_cfa_offset 16
..LN1:
        movq      %rsp, %rbp                                    #19.37
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN2:
        subq      $32, %rsp                                     #19.37
..LN3:
        movq      %rdi, -24(%rbp)                               #19.37
..LN4:
        movb      %sil, -16(%rbp)                               #19.37
..LN5:
	.loc    1  20  prologue_end  is_stmt 1
        movl      $0, -32(%rbp)                                 #20.13
..LN6:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.3 ..B1.1
                                # Execution count [0.00e+00]
..LN7:
        movl      -32(%rbp), %eax                               #20.19
..LN8:
        cmpl      $32768, %eax                                  #20.23
..LN9:
        jae       ..B1.4        # Prob 50%                      #20.23
..LN10:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
..LN11:
	.loc    1  21  is_stmt 1
        movl      -32(%rbp), %eax                               #21.9
..LN12:
        movslq    %eax, %rax                                    #21.5
..LN13:
        addq      -24(%rbp), %rax                               #21.5
..LN14:
        movsbl    -16(%rbp), %edx                               #21.14
..LN15:
        movb      %dl, (%rax)                                   #21.5
..LN16:
	.loc    1  20  is_stmt 1
        movl      $1, %eax                                      #20.35
..LN17:
        addl      -32(%rbp), %eax                               #20.35
..LN18:
        movl      %eax, -32(%rbp)                               #20.35
..LN19:
        jmp       ..B1.2        # Prob 100%                     #20.35
..LN20:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
..LN21:
	.loc    1  22  epilogue_begin  is_stmt 1
        leave                                                   #22.1
	.cfi_restore 6
..LN22:
        ret                                                     #22.1
..LN23:
                                # LOE
..LN24:
	.cfi_endproc
# mark_end;
	.type	_Z8init_memPcc,@function
	.size	_Z8init_memPcc,.-_Z8init_memPcc
..LN_Z8init_memPcc.25:
.LN_Z8init_memPcc:
	.data
# -- End  _Z8init_memPcc
	.text
.L_2__routine_start__Z11scalar_copyPcS_i_1:
# -- Begin  _Z11scalar_copyPcS_i
	.text
# mark_begin;

	.globl _Z11scalar_copyPcS_i
# --- scalar_copy(char *, char *, int)
_Z11scalar_copyPcS_i:
# parameter 1(dst): %rdi
# parameter 2(src): %rsi
# parameter 3(len): %edx
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z11scalar_copyPcS_i.14:
..L15:
                                                         #25.51
..LN26:
	.loc    1  25  is_stmt 1
        pushq     %rbp                                          #25.51
	.cfi_def_cfa_offset 16
..LN27:
        movq      %rsp, %rbp                                    #25.51
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN28:
        subq      $32, %rsp                                     #25.51
..LN29:
        movq      %rdi, -24(%rbp)                               #25.51
..LN30:
        movq      %rsi, -16(%rbp)                               #25.51
..LN31:
        movl      %edx, -8(%rbp)                                #25.51
..LN32:
	.loc    1  26  prologue_end  is_stmt 1
        movl      $0, -32(%rbp)                                 #26.13
..LN33:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.2:                         # Preds ..B2.3 ..B2.1
                                # Execution count [0.00e+00]
..LN34:
        movl      -32(%rbp), %eax                               #26.18
..LN35:
        movl      -8(%rbp), %edx                                #26.22
..LN36:
        cmpl      %edx, %eax                                    #26.22
..LN37:
        jge       ..B2.4        # Prob 50%                      #26.22
..LN38:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.3:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
..LN39:
	.loc    1  27  is_stmt 1
        movl      -32(%rbp), %eax                               #27.18
..LN40:
        movslq    %eax, %rax                                    #27.14
..LN41:
        addq      -16(%rbp), %rax                               #27.14
..LN42:
        movl      -32(%rbp), %edx                               #27.9
..LN43:
        movslq    %edx, %rdx                                    #27.5
..LN44:
        addq      -24(%rbp), %rdx                               #27.5
..LN45:
        movsbl    (%rax), %eax                                  #27.14
..LN46:
        movb      %al, (%rdx)                                   #27.5
..LN47:
	.loc    1  26  is_stmt 1
        movl      $1, %eax                                      #26.27
..LN48:
        addl      -32(%rbp), %eax                               #26.27
..LN49:
        movl      %eax, -32(%rbp)                               #26.27
..LN50:
        jmp       ..B2.2        # Prob 100%                     #26.27
..LN51:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.4:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
..LN52:
	.loc    1  28  is_stmt 1
        movq      -24(%rbp), %rax                               #28.10
..LN53:
        movsbl    (%rax), %eax                                  #28.10
..LN54:
        movsbq    %al, %rax                                     #28.10
..LN55:
	.loc    1  28  epilogue_begin  is_stmt 1
        leave                                                   #28.10
	.cfi_restore 6
..LN56:
        ret                                                     #28.10
..LN57:
                                # LOE
..LN58:
	.cfi_endproc
# mark_end;
	.type	_Z11scalar_copyPcS_i,@function
	.size	_Z11scalar_copyPcS_i,.-_Z11scalar_copyPcS_i
..LN_Z11scalar_copyPcS_i.59:
.LN_Z11scalar_copyPcS_i:
	.data
# -- End  _Z11scalar_copyPcS_i
	.text
.L_2__routine_start_main_2:
# -- Begin  main
	.section .rodata, "a"
	.align 4
	.align 4
.L_2__STRING.0:
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
	.long	171866482
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,45
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.long	1702127963
	.long	975205234
	.long	1684808992
	.long	1699881053
	.long	540876915
	.long	680997
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,24
	.text
# mark_begin;

	.globl main
# --- main(int, char **)
main:
# parameter 1(argc): %edi
# parameter 2(argv): %rsi
..B3.1:                         # Preds ..B3.0
                                # Execution count [0.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value_main.26:
..L27:
                                                         #31.35
..LN60:
	.loc    1  31  is_stmt 1
        pushq     %rbp                                          #31.35
	.cfi_def_cfa_offset 16
..LN61:
        movq      %rsp, %rbp                                    #31.35
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN62:
        subq      $96, %rsp                                     #31.35
..LN63:
        movl      %edi, -56(%rbp)                               #31.35
..LN64:
        movq      %rsi, -48(%rbp)                               #31.35
..LN65:
	.loc    1  32  prologue_end  is_stmt 1
        movl      $0, -96(%rbp)                                 #32.11
..LN66:
	.loc    1  33  is_stmt 1
        movq      $0, -40(%rbp)                                 #33.17
..LN67:
	.loc    1  34  is_stmt 1
        movl      -56(%rbp), %eax                               #34.7
..LN68:
        cmpl      $2, %eax                                      #34.15
..LN69:
        je        ..B3.4        # Prob 50%                      #34.15
..LN70:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.2:                         # Preds ..B3.1
                                # Execution count [0.00e+00]
..LN71:
	.loc    1  35  is_stmt 1
        movq      stderr(%rip), %rax                            #35.5
..LN72:
        movl      $.L_2__STRING.0, %edx                         #35.5
..LN73:
        movq      %rax, %rdi                                    #35.5
..LN74:
        movq      %rdx, %rsi                                    #35.5
..LN75:
        movl      $0, %eax                                      #35.5
..___tag_value_main.32:
..LN76:
#       fprintf(FILE *, const char *, ...)
        call      fprintf                                       #35.5
..___tag_value_main.33:
..LN77:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B3.16:                        # Preds ..B3.2
                                # Execution count [0.00e+00]
..LN78:
        movl      %eax, -92(%rbp)                               #35.5
..LN79:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.3:                         # Preds ..B3.16
                                # Execution count [0.00e+00]
..LN80:
	.loc    1  36  is_stmt 1
        movl      $-1, %eax                                     #36.12
..LN81:
	.loc    1  36  epilogue_begin  is_stmt 1
        leave                                                   #36.12
	.cfi_restore 6
..LN82:
        ret                                                     #36.12
	.cfi_offset 6, -16
..LN83:
                                # LOE
..B3.4:                         # Preds ..B3.1
                                # Execution count [0.00e+00]
..LN84:
	.loc    1  38  is_stmt 1
        movl      $32768, %eax                                  #38.23
..LN85:
        movl      $64, %edx                                     #38.23
..LN86:
        movq      %rax, %rdi                                    #38.23
..LN87:
        movq      %rdx, %rsi                                    #38.23
..LN88:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #38.23
..LN89:
                                # LOE rax rbx rbp rsp r12 r13 r14 r15 rip
..B3.17:                        # Preds ..B3.4
                                # Execution count [0.00e+00]
..LN90:
        movq      %rax, -32(%rbp)                               #38.23
..LN91:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.5:                         # Preds ..B3.17
                                # Execution count [0.00e+00]
..LN92:
        movq      -32(%rbp), %rax                               #38.23
..LN93:
        movq      %rax, -24(%rbp)                               #38.14
..LN94:
	.loc    1  39  is_stmt 1
        movl      $32768, %eax                                  #39.23
..LN95:
        movl      $64, %edx                                     #39.23
..LN96:
        movq      %rax, %rdi                                    #39.23
..LN97:
        movq      %rdx, %rsi                                    #39.23
..LN98:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #39.23
..LN99:
                                # LOE rax rbx rbp rsp r12 r13 r14 r15 rip
..B3.18:                        # Preds ..B3.5
                                # Execution count [0.00e+00]
..LN100:
        movq      %rax, -16(%rbp)                               #39.23
..LN101:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.6:                         # Preds ..B3.18
                                # Execution count [0.00e+00]
..LN102:
        movq      -16(%rbp), %rax                               #39.23
..LN103:
        movq      %rax, -8(%rbp)                                #39.14
..LN104:
	.loc    1  41  is_stmt 1
        movq      -24(%rbp), %rax                               #41.3
..LN105:
        movl      $1, %edx                                      #41.3
..LN106:
        movq      %rax, %rdi                                    #41.3
..LN107:
        movl      %edx, %esi                                    #41.3
..___tag_value_main.37:
..LN108:
#       init_mem(char *, char)
        call      _Z8init_memPcc                                #41.3
..___tag_value_main.38:
..LN109:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.7:                         # Preds ..B3.6
                                # Execution count [0.00e+00]
..LN110:
	.loc    1  42  is_stmt 1
        movq      -8(%rbp), %rax                                #42.3
..LN111:
        movl      $0, %edx                                      #42.3
..LN112:
        movq      %rax, %rdi                                    #42.3
..LN113:
        movl      %edx, %esi                                    #42.3
..___tag_value_main.39:
..LN114:
#       init_mem(char *, char)
        call      _Z8init_memPcc                                #42.3
..___tag_value_main.40:
..LN115:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.8:                         # Preds ..B3.7
                                # Execution count [0.00e+00]
..LN116:
	.loc    1  44  is_stmt 1
        movl      $8, %eax                                      #44.24
..LN117:
        addq      -48(%rbp), %rax                               #44.24
..LN118:
        movq      (%rax), %rax                                  #44.24
..LN119:
        movq      %rax, %rdi                                    #44.24
..___tag_value_main.41:
..LN120:
#       atoi(const char *)
        call      atoi                                          #44.24
..___tag_value_main.42:
..LN121:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B3.20:                        # Preds ..B3.8
                                # Execution count [0.00e+00]
..LN122:
        movl      %eax, -88(%rbp)                               #44.24
..LN123:
        movl      -88(%rbp), %eax                               #44.24
..LN124:
        movslq    %eax, %rax                                    #44.17
..LN125:
        addq      -8(%rbp), %rax                                #44.17
..LN126:
        movq      %rax, -8(%rbp)                                #44.3
..LN127:
	.loc    1  45  is_stmt 1
        movl      $8, %eax                                      #45.23
..LN128:
        addq      -48(%rbp), %rax                               #45.23
..LN129:
        movq      (%rax), %rax                                  #45.23
..LN130:
        movq      %rax, %rdi                                    #45.23
..___tag_value_main.43:
..LN131:
#       atoi(const char *)
        call      atoi                                          #45.23
..___tag_value_main.44:
..LN132:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B3.19:                        # Preds ..B3.20
                                # Execution count [0.00e+00]
..LN133:
        movl      %eax, -84(%rbp)                               #45.23
..LN134:
        movl      -84(%rbp), %eax                               #45.23
..LN135:
        negl      %eax                                          #45.23
..LN136:
        addl      $64, %eax                                     #45.23
..LN137:
        movl      %eax, -80(%rbp)                               #45.16
..LN138:
	.loc    1  46  is_stmt 1
        movl      $0, -76(%rbp)                                 #46.17
..LN139:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.9:                         # Preds ..B3.11 ..B3.19
                                # Execution count [0.00e+00]
..LN140:
        movl      -76(%rbp), %eax                               #46.23
..LN141:
        cmpl      $33554432, %eax                               #46.30
..LN142:
        jge       ..B3.12       # Prob 50%                      #46.30
..LN143:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.10:                        # Preds ..B3.9
                                # Execution count [0.00e+00]
..LN144:
	.loc    1  47  is_stmt 1
        movl      -76(%rbp), %eax                               #47.20
..LN145:
        imull     $64, %eax, %eax                               #47.20
..LN146:
        andl      $16383, %eax                                  #47.27
..LN147:
        movl      %eax, -72(%rbp)                               #47.14
..LN148:
	.loc    1  48  is_stmt 1
        movl      -72(%rbp), %eax                               #48.12
..LN149:
        movslq    %eax, %rax                                    #48.12
..LN150:
        addq      -8(%rbp), %rax                                #48.12
..LN151:
        movl      -72(%rbp), %edx                               #48.12
..LN152:
        movslq    %edx, %rdx                                    #48.12
..LN153:
        addq      -24(%rbp), %rdx                               #48.12
..LN154:
        movl      -80(%rbp), %ecx                               #48.12
..LN155:
        movq      %rax, %rdi                                    #48.12
..LN156:
        movq      %rdx, %rsi                                    #48.12
..LN157:
        movl      %ecx, %edx                                    #48.12
..___tag_value_main.45:
..LN158:
#       scalar_copy(char *, char *, int)
        call      _Z11scalar_copyPcS_i                          #48.12
..___tag_value_main.46:
..LN159:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B3.21:                        # Preds ..B3.10
                                # Execution count [0.00e+00]
..LN160:
        movl      %eax, -68(%rbp)                               #48.12
..LN161:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.11:                        # Preds ..B3.21
                                # Execution count [0.00e+00]
..LN162:
        movl      -68(%rbp), %eax                               #48.12
..LN163:
        addl      -96(%rbp), %eax                               #48.5
..LN164:
        movl      %eax, -96(%rbp)                               #48.5
..LN165:
	.loc    1  49  is_stmt 1
        movl      $1, %eax                                      #49.5
..LN166:
        addq      -40(%rbp), %rax                               #49.5
..LN167:
        movq      %rax, -40(%rbp)                               #49.5
..LN168:
	.loc    1  46  is_stmt 1
        movl      $1, %eax                                      #46.39
..LN169:
        addl      -76(%rbp), %eax                               #46.39
..LN170:
        movl      %eax, -76(%rbp)                               #46.39
..LN171:
        jmp       ..B3.9        # Prob 100%                     #46.39
..LN172:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.12:                        # Preds ..B3.9
                                # Execution count [0.00e+00]
..LN173:
	.loc    1  52  is_stmt 1
        movl      $.L_2__STRING.1, %eax                         #52.10
..LN174:
        movq      -40(%rbp), %rdx                               #52.10
..LN175:
        movl      -96(%rbp), %ecx                               #52.10
..LN176:
        movq      %rax, %rdi                                    #52.10
..LN177:
        movq      %rdx, %rsi                                    #52.10
..LN178:
        movl      %ecx, %edx                                    #52.10
..LN179:
        movl      $0, %eax                                      #52.10
..___tag_value_main.47:
..LN180:
#       printf(const char *, ...)
        call      printf                                        #52.10
..___tag_value_main.48:
..LN181:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B3.22:                        # Preds ..B3.12
                                # Execution count [0.00e+00]
..LN182:
        movl      %eax, -64(%rbp)                               #52.10
..LN183:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.13:                        # Preds ..B3.22
                                # Execution count [0.00e+00]
..LN184:
        movl      -64(%rbp), %eax                               #52.10
..LN185:
	.loc    1  52  epilogue_begin  is_stmt 1
        leave                                                   #52.10
	.cfi_restore 6
..LN186:
        ret                                                     #52.10
..LN187:
                                # LOE
..LN188:
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.189:
.LNmain:
	.data
# -- End  main
	.data
	.section .note.GNU-stack, ""
	.file   2 "/usr/include/stdio.h"
	.file   3 "/usr/include/libio.h"
	.file   4 "/usr/include/bits/types.h"
	.file   5 "/opt/intel/system_studio_2020/compilers_and_libraries_2020.0.166/linux/compiler/include/icc/stddef.h"
// -- Begin DWARF2 SEGMENT .debug_info
	.section .debug_info
.debug_info_seg:
	.align 1
	.4byte 0x00000462
	.2byte 0x0004
	.4byte .debug_abbrev_seg
	.byte 0x08
//	DW_TAG_compile_unit:
	.byte 0x01
//	DW_AT_comp_dir:
	.4byte .debug_str
//	DW_AT_name:
	.4byte .debug_str+0x21
//	DW_AT_producer:
	.4byte .debug_str+0x37
	.4byte .debug_str+0xa5
//	DW_AT_language:
	.byte 0x04
//	DW_AT_use_UTF8:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..L3
//	DW_AT_high_pc:
	.8byte ..LNmain.189-..L3
	.byte 0x01
//	DW_AT_stmt_list:
	.4byte .debug_line_seg
//	DW_TAG_namespace:
	.byte 0x02
//	DW_AT_name:
	.4byte 0x00647473
//	DW_TAG_namespace:
	.byte 0x03
//	DW_AT_name:
	.4byte .debug_str+0xfd
//	DW_TAG_namespace:
	.byte 0x03
//	DW_AT_name:
	.4byte .debug_str+0x107
//	DW_TAG_subprogram:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x13
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x112
	.4byte .debug_str+0x11b
//	DW_AT_low_pc:
	.8byte ..L3
//	DW_AT_high_pc:
	.8byte ..LN_Z8init_memPcc.25-..L3
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x13
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_AT_name:
	.4byte 0x006d656d
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x68
//	DW_TAG_formal_parameter:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x13
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000a0
//	DW_AT_name:
	.4byte 0x006c6176
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x70
//	DW_TAG_lexical_block:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x14
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN5
//	DW_AT_high_pc:
	.8byte ..LN_Z8init_memPcc.25
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x14
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x60
	.byte 0x00
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x08
//	DW_AT_type:
	.4byte 0x000000a0
//	DW_TAG_base_type:
	.byte 0x09
//	DW_AT_byte_size:
	.byte 0x01
//	DW_AT_encoding:
	.byte 0x06
//	DW_AT_name:
	.4byte .debug_str+0x12a
//	DW_TAG_base_type:
	.byte 0x09
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x07
//	DW_AT_name:
	.4byte .debug_str+0x12f
//	DW_TAG_base_type:
	.byte 0x0a
//	DW_AT_byte_size:
	.byte 0x04
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte 0x00746e69
//	DW_TAG_subprogram:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x19
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_AT_name:
	.4byte .debug_str+0x13d
	.4byte .debug_str+0x149
//	DW_AT_low_pc:
	.8byte ..L15
//	DW_AT_high_pc:
	.8byte ..LN_Z11scalar_copyPcS_i.59-..L15
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x19
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_AT_name:
	.4byte 0x00747364
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x68
//	DW_TAG_formal_parameter:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x19
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_AT_name:
	.4byte 0x00637273
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x70
//	DW_TAG_formal_parameter:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x19
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_AT_name:
	.4byte 0x006e656c
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x78
//	DW_TAG_lexical_block:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x1a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN32
//	DW_AT_high_pc:
	.8byte ..LN52
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x1a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x60
	.byte 0x00
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0x1f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_AT_name:
	.4byte .debug_str+0x15e
	.4byte .debug_str+0x15e
//	DW_AT_low_pc:
	.8byte ..L27
//	DW_AT_high_pc:
	.8byte ..LNmain.189-..L27
	.byte 0x01
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x0d
//	DW_AT_decl_line:
	.byte 0x1f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_AT_name:
	.4byte .debug_str+0x163
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x48
//	DW_TAG_formal_parameter:
	.byte 0x0d
//	DW_AT_decl_line:
	.byte 0x1f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000001ec
//	DW_AT_name:
	.4byte .debug_str+0x168
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x50
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x20
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00736572
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_AT_location:
	.4byte 0x7fa07603
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0x21
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x16d
//	DW_AT_type:
	.4byte 0x000001fb
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x58
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x26
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00637273
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x68
//	DW_TAG_variable:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x27
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00747364
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x78
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0x2d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x176
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_AT_location:
	.4byte 0x7fb07603
//	DW_TAG_lexical_block:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x2e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN138
//	DW_AT_high_pc:
	.8byte ..LN173
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0x2e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x17f
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_AT_location:
	.4byte 0x7fb47603
//	DW_TAG_lexical_block:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x2e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN144
//	DW_AT_high_pc:
	.8byte ..LN168
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0x2f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x184
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_AT_location:
	.4byte 0x7fb87603
	.byte 0x00
	.byte 0x00
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x08
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_TAG_pointer_type:
	.byte 0x08
//	DW_AT_type:
	.4byte 0x000001f6
//	DW_TAG_const_type:
	.byte 0x0f
//	DW_AT_type:
	.4byte 0x000000a0
//	DW_TAG_base_type:
	.byte 0x09
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x138
//	DW_TAG_variable:
	.byte 0x10
//	DW_AT_decl_line:
	.byte 0xaa
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_name:
	.4byte .debug_str+0x189
//	DW_AT_type:
	.4byte 0x0000020f
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_pointer_type:
	.byte 0x08
//	DW_AT_type:
	.4byte 0x00000214
//	DW_TAG_structure_type:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0xf6
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_byte_size:
	.byte 0xd8
//	DW_AT_name:
	.4byte .debug_str+0x190
//	DW_TAG_member:
	.byte 0x12
//	DW_AT_decl_line:
	.byte 0xf7
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x199
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_TAG_member:
	.byte 0x12
//	DW_AT_decl_line:
	.byte 0xfc
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x08
//	DW_AT_name:
	.4byte .debug_str+0x1a0
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_TAG_member:
	.byte 0x12
//	DW_AT_decl_line:
	.byte 0xfd
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x10
//	DW_AT_name:
	.4byte .debug_str+0x1ad
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_TAG_member:
	.byte 0x12
//	DW_AT_decl_line:
	.byte 0xfe
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x18
//	DW_AT_name:
	.4byte .debug_str+0x1ba
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_TAG_member:
	.byte 0x12
//	DW_AT_decl_line:
	.byte 0xff
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x20
//	DW_AT_name:
	.4byte .debug_str+0x1c8
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0100
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x28
//	DW_AT_name:
	.4byte .debug_str+0x1d7
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0101
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x30
//	DW_AT_name:
	.4byte .debug_str+0x1e5
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0102
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x38
//	DW_AT_name:
	.4byte .debug_str+0x1f3
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0103
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x40
//	DW_AT_name:
	.4byte .debug_str+0x200
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0105
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x48
//	DW_AT_name:
	.4byte .debug_str+0x20c
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0106
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x50
//	DW_AT_name:
	.4byte .debug_str+0x21a
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0107
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x58
//	DW_AT_name:
	.4byte .debug_str+0x22a
//	DW_AT_type:
	.4byte 0x0000009b
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0109
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x60
//	DW_AT_name:
	.4byte .debug_str+0x237
//	DW_AT_type:
	.4byte 0x000003d7
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x010b
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x68
//	DW_AT_name:
	.4byte .debug_str+0x25c
//	DW_AT_type:
	.4byte 0x0000020f
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x010d
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x70
//	DW_AT_name:
	.4byte .debug_str+0x263
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0111
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x74
//	DW_AT_name:
	.4byte .debug_str+0x26b
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0113
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x78
//	DW_AT_name:
	.4byte .debug_str+0x273
//	DW_AT_type:
	.4byte 0x0000040f
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0117
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.4byte 0x01802303
//	DW_AT_name:
	.4byte .debug_str+0x287
//	DW_AT_type:
	.4byte 0x0000041a
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0118
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.4byte 0x01822303
//	DW_AT_name:
	.4byte .debug_str+0x2a2
//	DW_AT_type:
	.4byte 0x000000a0
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0119
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.4byte 0x01832303
//	DW_AT_name:
	.4byte .debug_str+0x2b1
//	DW_AT_type:
	.4byte 0x00000421
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x011d
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.4byte 0x01882303
//	DW_AT_name:
	.4byte .debug_str+0x2bb
//	DW_AT_type:
	.4byte 0x0000042a
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0126
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.4byte 0x01902303
//	DW_AT_name:
	.4byte .debug_str+0x277
//	DW_AT_type:
	.4byte 0x00000441
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x012f
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.4byte 0x01982303
//	DW_AT_name:
	.4byte .debug_str+0x2db
//	DW_AT_type:
	.4byte 0x0000044c
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0130
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.4byte 0x01a02303
//	DW_AT_name:
	.4byte .debug_str+0x2e2
//	DW_AT_type:
	.4byte 0x0000044c
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0131
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.4byte 0x01a82303
//	DW_AT_name:
	.4byte .debug_str+0x2e9
//	DW_AT_type:
	.4byte 0x0000044c
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0132
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.4byte 0x01b02303
//	DW_AT_name:
	.4byte .debug_str+0x2f0
//	DW_AT_type:
	.4byte 0x0000044c
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0133
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.4byte 0x01b82303
//	DW_AT_name:
	.4byte .debug_str+0x2f7
//	DW_AT_type:
	.4byte 0x00000451
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0135
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.4byte 0x01c02303
//	DW_AT_name:
	.4byte .debug_str+0x305
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_TAG_member:
	.byte 0x13
//	DW_AT_decl_line:
	.2byte 0x0137
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.4byte 0x01c42303
//	DW_AT_name:
	.4byte .debug_str+0x30b
//	DW_AT_type:
	.4byte 0x0000045c
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x08
//	DW_AT_type:
	.4byte 0x000003dc
//	DW_TAG_structure_type:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0xa1
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_byte_size:
	.byte 0x18
//	DW_AT_name:
	.4byte .debug_str+0x240
//	DW_TAG_member:
	.byte 0x12
//	DW_AT_decl_line:
	.byte 0xa2
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x24b
//	DW_AT_type:
	.4byte 0x000003d7
//	DW_TAG_member:
	.byte 0x12
//	DW_AT_decl_line:
	.byte 0xa3
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x08
//	DW_AT_name:
	.4byte .debug_str+0x251
//	DW_AT_type:
	.4byte 0x0000020f
//	DW_TAG_member:
	.byte 0x12
//	DW_AT_decl_line:
	.byte 0xa7
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x10
//	DW_AT_name:
	.4byte .debug_str+0x257
//	DW_AT_type:
	.4byte 0x000000ae
	.byte 0x00
//	DW_TAG_typedef:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0x8c
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_name:
	.4byte .debug_str+0x27f
//	DW_AT_type:
	.4byte 0x000001fb
//	DW_TAG_base_type:
	.byte 0x09
//	DW_AT_byte_size:
	.byte 0x02
//	DW_AT_encoding:
	.byte 0x07
//	DW_AT_name:
	.4byte .debug_str+0x293
//	DW_TAG_array_type:
	.byte 0x15
//	DW_AT_type:
	.4byte 0x000000a0
//	DW_AT_byte_size:
	.byte 0x01
//	DW_TAG_subrange_type:
	.byte 0x16
//	DW_AT_upper_bound:
	.byte 0x00
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x08
//	DW_AT_type:
	.4byte 0x0000042f
//	DW_TAG_typedef:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0x9b
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_name:
	.4byte .debug_str+0x2c1
//	DW_AT_type:
	.4byte 0x0000043a
//	DW_TAG_base_type:
	.byte 0x09
//	DW_AT_byte_size:
	.byte 0x00
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x2cc
//	DW_TAG_typedef:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0x8d
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_name:
	.4byte .debug_str+0x2d1
//	DW_AT_type:
	.4byte 0x000001fb
//	DW_TAG_pointer_type:
	.byte 0x08
//	DW_AT_type:
	.4byte 0x0000043a
//	DW_TAG_typedef:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0x2f
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x2fe
//	DW_AT_type:
	.4byte 0x000000a7
//	DW_TAG_array_type:
	.byte 0x15
//	DW_AT_type:
	.4byte 0x000000a0
//	DW_AT_byte_size:
	.byte 0x14
//	DW_TAG_subrange_type:
	.byte 0x16
//	DW_AT_upper_bound:
	.byte 0x13
	.byte 0x00
	.byte 0x00
// -- Begin DWARF2 SEGMENT .debug_line
	.section .debug_line
.debug_line_seg:
	.align 1
// -- Begin DWARF2 SEGMENT .debug_abbrev
	.section .debug_abbrev
.debug_abbrev_seg:
	.align 1
	.byte 0x01
	.byte 0x11
	.byte 0x01
	.byte 0x1b
	.byte 0x0e
	.byte 0x03
	.byte 0x0e
	.byte 0x25
	.byte 0x0e
	.2byte 0x7681
	.byte 0x0e
	.byte 0x13
	.byte 0x0b
	.byte 0x53
	.byte 0x0c
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x07
	.byte 0x6a
	.byte 0x0c
	.byte 0x10
	.byte 0x17
	.2byte 0x0000
	.byte 0x02
	.byte 0x39
	.byte 0x00
	.byte 0x03
	.byte 0x08
	.2byte 0x0000
	.byte 0x03
	.byte 0x39
	.byte 0x00
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x04
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x07
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x05
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x08
	.byte 0x02
	.byte 0x18
	.2byte 0x0000
	.byte 0x06
	.byte 0x0b
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.2byte 0x0000
	.byte 0x07
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.byte 0x49
	.byte 0x13
	.byte 0x02
	.byte 0x18
	.2byte 0x0000
	.byte 0x08
	.byte 0x0f
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x09
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x0a
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.2byte 0x0000
	.byte 0x0b
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x07
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x0c
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x07
	.byte 0x6a
	.byte 0x0c
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x0d
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x0e
	.byte 0x02
	.byte 0x18
	.2byte 0x0000
	.byte 0x0e
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.byte 0x02
	.byte 0x18
	.2byte 0x0000
	.byte 0x0f
	.byte 0x26
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x10
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.byte 0x3c
	.byte 0x0c
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x11
	.byte 0x13
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x0b
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x12
	.byte 0x0d
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x38
	.byte 0x18
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x13
	.byte 0x0d
	.byte 0x00
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x38
	.byte 0x18
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x14
	.byte 0x16
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x15
	.byte 0x01
	.byte 0x01
	.byte 0x49
	.byte 0x13
	.byte 0x0b
	.byte 0x0b
	.2byte 0x0000
	.byte 0x16
	.byte 0x21
	.byte 0x00
	.byte 0x2f
	.byte 0x0b
	.2byte 0x0000
	.byte 0x00
// -- Begin DWARF2 SEGMENT .debug_str
	.section .debug_str,"MS",@progbits,1
.debug_str_seg:
	.align 1
	.8byte 0x616a2f656d6f682f
	.8byte 0x632f6168626e6974
	.8byte 0x72612f632f65646f
	.8byte 0x79706f635f796172
	.byte 0x00
	.8byte 0x5f32313579706f63
	.8byte 0x6c5f72616c616373
	.4byte 0x2e343674
	.2byte 0x0063
	.8byte 0x2952286c65746e49
	.8byte 0x746e49202b2b4320
	.8byte 0x3436202952286c65
	.8byte 0x656c69706d6f4320
	.8byte 0x706120726f662072
	.8byte 0x6f69746163696c70
	.8byte 0x696e6e757220736e
	.8byte 0x6e49206e6f20676e
	.8byte 0x36202952286c6574
	.8byte 0x6973726556202c34
	.8byte 0x2e312e3931206e6f
	.8byte 0x7542203636312e30
	.8byte 0x3931303220646c69
	.4byte 0x31323131
	.2byte 0x000a
	.8byte 0x656d6f682f20492d
	.8byte 0x68626e6974616a2f
	.8byte 0x617774666f732f61
	.8byte 0x616361692f736572
	.8byte 0x202f34366e696c2d
	.8byte 0x2d202b2b6320782d
	.8byte 0x663231357876616d
	.8byte 0x79706f63206f2d20
	.8byte 0x6c6163735f323135
	.8byte 0x2e3436746c5f7261
	.8byte 0x00672d20532d2073
	.8byte 0x78635f756e675f5f
	.2byte 0x0078
	.8byte 0x6962617878635f5f
	.2byte 0x3176
	.byte 0x00
	.8byte 0x6d656d5f74696e69
	.byte 0x00
	.8byte 0x5f74696e69385a5f
	.4byte 0x506d656d
	.2byte 0x6363
	.byte 0x00
	.4byte 0x72616863
	.byte 0x00
	.8byte 0x64656e6769736e75
	.4byte 0x6e6f6c20
	.2byte 0x0067
	.8byte 0x635f72616c616373
	.4byte 0x0079706f
	.8byte 0x6c61637331315a5f
	.8byte 0x5079706f635f7261
	.4byte 0x695f5363
	.byte 0x00
	.4byte 0x6e69616d
	.byte 0x00
	.4byte 0x63677261
	.byte 0x00
	.4byte 0x76677261
	.byte 0x00
	.8byte 0x7274635f72657469
	.byte 0x00
	.8byte 0x6e6f697463617266
	.byte 0x00
	.4byte 0x706f6f6c
	.byte 0x00
	.4byte 0x70696b73
	.byte 0x00
	.4byte 0x65647473
	.2byte 0x7272
	.byte 0x00
	.8byte 0x454c49465f4f495f
	.byte 0x00
	.4byte 0x616c665f
	.2byte 0x7367
	.byte 0x00
	.8byte 0x646165725f4f495f
	.4byte 0x7274705f
	.byte 0x00
	.8byte 0x646165725f4f495f
	.4byte 0x646e655f
	.byte 0x00
	.8byte 0x646165725f4f495f
	.4byte 0x7361625f
	.2byte 0x0065
	.8byte 0x746972775f4f495f
	.4byte 0x61625f65
	.2byte 0x6573
	.byte 0x00
	.8byte 0x746972775f4f495f
	.4byte 0x74705f65
	.2byte 0x0072
	.8byte 0x746972775f4f495f
	.4byte 0x6e655f65
	.2byte 0x0064
	.8byte 0x5f6675625f4f495f
	.4byte 0x65736162
	.byte 0x00
	.8byte 0x5f6675625f4f495f
	.4byte 0x00646e65
	.8byte 0x657661735f4f495f
	.4byte 0x7361625f
	.2byte 0x0065
	.8byte 0x6b6361625f4f495f
	.8byte 0x00657361625f7075
	.8byte 0x657661735f4f495f
	.4byte 0x646e655f
	.byte 0x00
	.8byte 0x7372656b72616d5f
	.byte 0x00
	.8byte 0x6b72616d5f4f495f
	.2byte 0x7265
	.byte 0x00
	.4byte 0x78656e5f
	.2byte 0x0074
	.4byte 0x7562735f
	.2byte 0x0066
	.4byte 0x736f705f
	.byte 0x00
	.4byte 0x6168635f
	.2byte 0x6e69
	.byte 0x00
	.8byte 0x006f6e656c69665f
	.8byte 0x00327367616c665f
	.8byte 0x66666f5f646c6f5f
	.4byte 0x00746573
	.8byte 0x00745f66666f5f5f
	.8byte 0x6c6f635f7275635f
	.4byte 0x006e6d75
	.8byte 0x64656e6769736e75
	.4byte 0x6f687320
	.2byte 0x7472
	.byte 0x00
	.8byte 0x5f656c626174765f
	.4byte 0x7366666f
	.2byte 0x7465
	.byte 0x00
	.8byte 0x756274726f68735f
	.2byte 0x0066
	.4byte 0x636f6c5f
	.2byte 0x006b
	.8byte 0x6b636f6c5f4f495f
	.2byte 0x745f
	.byte 0x00
	.4byte 0x64696f76
	.byte 0x00
	.8byte 0x5f343666666f5f5f
	.2byte 0x0074
	.4byte 0x61705f5f
	.2byte 0x3164
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3264
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3364
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3464
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3564
	.byte 0x00
	.4byte 0x657a6973
	.2byte 0x745f
	.byte 0x00
	.4byte 0x646f6d5f
	.2byte 0x0065
	.8byte 0x32646573756e755f
	.byte 0x00
	.section .text
.LNDBG_TXe:
# End
