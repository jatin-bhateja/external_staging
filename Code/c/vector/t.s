	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "";
# mark_description "-mavx -g -S";
	.file "t.cpp"
	.section .text._Z8printVecI7__m256iEvT_i, "xaG",@progbits,_Z8printVecI7__m256iEvT_i,comdat
..TXTST0:
.L_2__routine_start__Z8printVecI7__m256iEvT_i_0:
# -- Begin  _Z8printVecI7__m256iEvT_i
	.section .rodata, "a"
	.align 4
	.align 4
.L_2__STRING.0:
	.word	10
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,2
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.long	2122789
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,4
	.section .text._Z8printVecI7__m256iEvT_i, "xaG",@progbits,_Z8printVecI7__m256iEvT_i,comdat
# mark_begin;

	.weak _Z8printVecI7__m256iEvT_i
# --- printVec<__m256i>(__m256i, int)
_Z8printVecI7__m256iEvT_i:
# parameter 1(vec): %ymm0
# parameter 2(len): %edi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z8printVecI7__m256iEvT_i.2:
..L3:
                                                          #6.34
..LN0:
	.file   1 "t.cpp"
	.loc    1  6  is_stmt 1
        pushq     %rbx                                          #6.34
	.cfi_def_cfa_offset 16
..LN1:
        movq      %rsp, %rbx                                    #6.34
	.cfi_def_cfa 3, 16
	.cfi_offset 3, -16
..LN2:
        andq      $-32, %rsp                                    #6.34
..LN3:
        pushq     %rbp                                          #6.34
..LN4:
        pushq     %rbp                                          #6.34
..LN5:
        movq      8(%rbx), %rbp                                 #6.34
..LN6:
        movq      %rbp, 8(%rsp)                                 #6.34
..LN7:
        movq      %rsp, %rbp                                    #6.34
	.cfi_escape 0x10, 0x06, 0x02, 0x76, 0x00
..LN8:
        subq      $112, %rsp                                    #6.34
..LN9:
        vmovdqu   %ymm0, -48(%rbp)                              #6.34
..LN10:
        movl      %edi, -64(%rbp)                               #6.34
..LN11:
	.loc    1  7  prologue_end  is_stmt 1
        movl      $.L_2__STRING.0, %eax                         #7.3
..LN12:
        vzeroupper                                              #7.3
..LN13:
        movq      %rax, %rdi                                    #7.3
..LN14:
        movl      $0, %eax                                      #7.3
..___tag_value__Z8printVecI7__m256iEvT_i.9:
..LN15:
        call      printf                                        #7.3
..___tag_value__Z8printVecI7__m256iEvT_i.10:
..LN16:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B1.10:                        # Preds ..B1.1
                                # Execution count [0.00e+00]
..LN17:
        movl      %eax, -112(%rbp)                              #7.3
..LN18:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.10
                                # Execution count [0.00e+00]
..LN19:
	.loc    1  8  is_stmt 1
        movl      $0, -108(%rbp)                                #8.13
..LN20:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.4 ..B1.2
                                # Execution count [0.00e+00]
..LN21:
        movl      -108(%rbp), %eax                              #8.19
..LN22:
        movl      -64(%rbp), %edx                               #8.23
..LN23:
        cmpl      %edx, %eax                                    #8.23
..LN24:
        jl        ..B1.5        # Prob 50%                      #8.23
..LN25:
        jmp       ..B1.6        # Prob 100%                     #8.23
..LN26:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.11
                                # Execution count [0.00e+00]
..LN27:
        movl      $1, %eax                                      #8.28
..LN28:
        addl      -108(%rbp), %eax                              #8.28
..LN29:
        movl      %eax, -108(%rbp)                              #8.28
..LN30:
        jmp       ..B1.3        # Prob 100%                     #8.28
..LN31:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.3
                                # Execution count [0.00e+00]
..LN32:
	.loc    1  9  is_stmt 1
        vmovdqu   -48(%rbp), %ymm0                              #9.20
..LN33:
	.loc    1  11  is_stmt 1
        vmovaps   %xmm0, %xmm1                                  #11.1
..LN34:
        vmovdqu   %xmm1, -104(%rbp)                             #11.1
..LN35:
        vextractf128 $1, %ymm0, -88(%rbp)                       #11.1
..LN36:
	.loc    1  9  is_stmt 1
        movl      $.L_2__STRING.1, %eax                         #9.5
..LN37:
        lea       -104(%rbp), %rdx                              #9.5
..LN38:
        movl      -108(%rbp), %ecx                              #9.5
..LN39:
        movslq    %ecx, %rcx                                    #9.5
..LN40:
        imulq     $8, %rcx, %rcx                                #9.5
..LN41:
        addq      %rcx, %rdx                                    #9.5
..LN42:
        movq      (%rdx), %rdx                                  #9.5
..LN43:
        vzeroupper                                              #9.5
..LN44:
        movq      %rax, %rdi                                    #9.5
..LN45:
        movq      %rdx, %rsi                                    #9.5
..LN46:
        movl      $0, %eax                                      #9.5
..___tag_value__Z8printVecI7__m256iEvT_i.11:
..LN47:
        call      printf                                        #9.5
..___tag_value__Z8printVecI7__m256iEvT_i.12:
..LN48:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B1.11:                        # Preds ..B1.5
                                # Execution count [0.00e+00]
..LN49:
        movl      %eax, -72(%rbp)                               #9.5
..LN50:
        jmp       ..B1.4        # Prob 100%                     #9.5
..LN51:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.3
                                # Execution count [0.00e+00]
..LN52:
	.loc    1  10  is_stmt 1
        movl      $.L_2__STRING.0, %eax                         #10.3
..LN53:
        vzeroupper                                              #10.3
..LN54:
        movq      %rax, %rdi                                    #10.3
..LN55:
        movl      $0, %eax                                      #10.3
..___tag_value__Z8printVecI7__m256iEvT_i.13:
..LN56:
        call      printf                                        #10.3
..___tag_value__Z8printVecI7__m256iEvT_i.14:
..LN57:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B1.12:                        # Preds ..B1.6
                                # Execution count [0.00e+00]
..LN58:
        movl      %eax, -68(%rbp)                               #10.3
..LN59:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.12
                                # Execution count [0.00e+00]
..LN60:
	.loc    1  11  is_stmt 1
        vzeroupper                                              #11.1
..LN61:
	.loc    1  11  epilogue_begin  is_stmt 1
        leave                                                   #11.1
	.cfi_restore 6
..LN62:
        movq      %rbx, %rsp                                    #11.1
..LN63:
        popq      %rbx                                          #11.1
	.cfi_def_cfa 7, 8
	.cfi_restore 3
..LN64:
        ret                                                     #11.1
..LN65:
                                # LOE
..LN66:
	.cfi_endproc
# mark_end;
	.type	_Z8printVecI7__m256iEvT_i,@function
	.size	_Z8printVecI7__m256iEvT_i,.-_Z8printVecI7__m256iEvT_i
..LN_Z8printVecI7__m256iEvT_i.67:
.LN_Z8printVecI7__m256iEvT_i:
	.data
	.file   2 "/opt/intel/system_studio_2019/compilers_and_libraries_2019.1.144/linux/compiler/include/icc/immintrin.h"
# -- End  _Z8printVecI7__m256iEvT_i
	.text
..TXTST1:
.L_2__routine_start__Z7shiftELv_1:
# -- Begin  _Z7shiftELv
	.section .rodata, "a"
	.space 24, 0x00 	# pad
	.align 32
.L_2il0floatpacket.0:
	.long	0x00000001,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,32
	.text
# mark_begin;

	.globl _Z7shiftELv
# --- shiftEL()
_Z7shiftELv:
..B2.1:                         # Preds ..B2.0
                                # Execution count [0.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value__Z7shiftELv.23:
..L24:
                                                         #13.15
..LN68:
	.loc    1  13  is_stmt 1
        pushq     %rbx                                          #13.15
	.cfi_def_cfa_offset 16
..LN69:
        movq      %rsp, %rbx                                    #13.15
	.cfi_def_cfa 3, 16
	.cfi_offset 3, -16
..LN70:
        andq      $-32, %rsp                                    #13.15
..LN71:
        pushq     %rbp                                          #13.15
..LN72:
        pushq     %rbp                                          #13.15
..LN73:
        movq      8(%rbx), %rbp                                 #13.15
..LN74:
        movq      %rbp, 8(%rsp)                                 #13.15
..LN75:
        movq      %rsp, %rbp                                    #13.15
	.cfi_escape 0x10, 0x06, 0x02, 0x76, 0x00
..LN76:
        subq      $496, %rsp                                    #13.15
..LN77:
	.loc    1  15  prologue_end  is_stmt 1
        vmovdqu   .L_2il0floatpacket.0(%rip), %ymm0             #15.21
..LN78:
        vmovdqu   %ymm0, -400(%rbp)                             #15.21
..LN79:
        vmovdqu   -400(%rbp), %ymm0                             #15.21
..LN80:
        vmovdqu   %ymm0, -368(%rbp)                             #15.19
..LN81:
	.loc    1  16  is_stmt 1
        vmovdqu   -368(%rbp), %ymm0                             #16.2
..LN82:
        movl      $8, %eax                                      #16.2
..LN83:
        movl      %eax, %edi                                    #16.2
..___tag_value__Z7shiftELv.30:
..LN84:
#       printVec<__m256i>(__m256i, int)
        call      _Z8printVecI7__m256iEvT_i                     #16.2
..___tag_value__Z7shiftELv.31:
..LN85:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.2:                         # Preds ..B2.1
                                # Execution count [0.00e+00]
..LN86:
	.loc    1  18  is_stmt 1
        lea       -496(%rbp), %rax                              #18.12
..LN87:
        movl      $mem.226.0, %edx                              #18.12
..LN88:
        movl      $32, %ecx                                     #18.12
..LN89:
        vzeroupper                                              #18.12
..LN90:
        movq      %rax, %rdi                                    #18.12
..LN91:
        movq      %rdx, %rsi                                    #18.12
..LN92:
        movl      %ecx, %eax                                    #18.12
..LN93:
        shrq      $2, %rcx                                      #18.12
..LN94:
        rep                                                     #18.12
..LN95:
        movsl                                                   #18.12
..LN96:
        movl      %eax, %ecx                                    #18.12
..LN97:
        andl      $3, %ecx                                      #18.12
..LN98:
        rep                                                     #18.12
..LN99:
        movsb                                                   #18.12
..LN100:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.3:                         # Preds ..B2.2
                                # Execution count [0.00e+00]
..LN101:
	.loc    1  19  is_stmt 1
        lea       -496(%rbp), %rax                              #19.20
..LN102:
        vmovdqu   -368(%rbp), %ymm0                             #19.20
..LN103:
        vpmaskmovd (%rax), %ymm0, %ymm0                         #19.20
..LN104:
        vmovdqu   %ymm0, -336(%rbp)                             #19.20
..LN105:
        vmovdqu   -336(%rbp), %ymm0                             #19.20
..LN106:
        vmovdqu   %ymm0, -304(%rbp)                             #19.18
..LN107:
	.loc    1  20  is_stmt 1
        vmovdqu   -304(%rbp), %ymm0                             #20.2
..LN108:
        movl      $8, %eax                                      #20.2
..LN109:
        movl      %eax, %edi                                    #20.2
..___tag_value__Z7shiftELv.32:
..LN110:
#       printVec<__m256i>(__m256i, int)
        call      _Z8printVecI7__m256iEvT_i                     #20.2
..___tag_value__Z7shiftELv.33:
..LN111:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.4:                         # Preds ..B2.3
                                # Execution count [0.00e+00]
..LN112:
	.loc    1  22  is_stmt 1
        lea       -464(%rbp), %rax                              #22.13
..LN113:
        movl      $mask.226.0, %edx                             #22.13
..LN114:
        movl      $32, %ecx                                     #22.13
..LN115:
        vzeroupper                                              #22.13
..LN116:
        movq      %rax, %rdi                                    #22.13
..LN117:
        movq      %rdx, %rsi                                    #22.13
..LN118:
        movl      %ecx, %eax                                    #22.13
..LN119:
        shrq      $2, %rcx                                      #22.13
..LN120:
        rep                                                     #22.13
..LN121:
        movsl                                                   #22.13
..LN122:
        movl      %eax, %ecx                                    #22.13
..LN123:
        andl      $3, %ecx                                      #22.13
..LN124:
        rep                                                     #22.13
..LN125:
        movsb                                                   #22.13
..LN126:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.5:                         # Preds ..B2.4
                                # Execution count [0.00e+00]
..LN127:
	.loc    1  23  is_stmt 1
        lea       -464(%rbp), %rax                              #23.21
..LN128:
        vmovdqu   -368(%rbp), %ymm0                             #23.21
..LN129:
        vpmaskmovd (%rax), %ymm0, %ymm0                         #23.21
..LN130:
        vmovdqu   %ymm0, -272(%rbp)                             #23.21
..LN131:
        vmovdqu   -272(%rbp), %ymm0                             #23.21
..LN132:
        vmovdqu   %ymm0, -240(%rbp)                             #23.19
..LN133:
	.loc    1  25  is_stmt 1
        lea       -432(%rbp), %rax                              #25.17
..LN134:
        movl      $shuf_idx.226.0, %edx                         #25.17
..LN135:
        movl      $32, %ecx                                     #25.17
..LN136:
        vzeroupper                                              #25.17
..LN137:
        movq      %rax, %rdi                                    #25.17
..LN138:
        movq      %rdx, %rsi                                    #25.17
..LN139:
        movl      %ecx, %eax                                    #25.17
..LN140:
        shrq      $2, %rcx                                      #25.17
..LN141:
        rep                                                     #25.17
..LN142:
        movsl                                                   #25.17
..LN143:
        movl      %eax, %ecx                                    #25.17
..LN144:
        andl      $3, %ecx                                      #25.17
..LN145:
        rep                                                     #25.17
..LN146:
        movsb                                                   #25.17
..LN147:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.6:                         # Preds ..B2.5
                                # Execution count [0.00e+00]
..LN148:
	.loc    1  26  is_stmt 1
        lea       -432(%rbp), %rax                              #26.25
..LN149:
        vmovdqu   -368(%rbp), %ymm0                             #26.25
..LN150:
        vpmaskmovd (%rax), %ymm0, %ymm0                         #26.25
..LN151:
        vmovdqu   %ymm0, -208(%rbp)                             #26.25
..LN152:
        vmovdqu   -208(%rbp), %ymm0                             #26.25
..LN153:
        vmovdqu   %ymm0, -176(%rbp)                             #26.23
..LN154:
	.loc    1  28  is_stmt 1
        vmovdqu   -304(%rbp), %ymm0                             #28.16
..LN155:
        vmovdqu   -176(%rbp), %ymm1                             #28.16
..LN156:
        vpermd    %ymm0, %ymm1, %ymm0                           #28.16
..LN157:
        vmovdqu   %ymm0, -144(%rbp)                             #28.16
..LN158:
        vmovdqu   -144(%rbp), %ymm0                             #28.16
..LN159:
        vmovdqu   %ymm0, -112(%rbp)                             #28.14
..LN160:
	.loc    1  29  is_stmt 1
        vmovdqu   -368(%rbp), %ymm0                             #29.16
..LN161:
        movl      $255, %eax                                    #29.16
..LN162:
        vmovdqu   -112(%rbp), %ymm1                             #29.16
..LN163:
        vmovdqu   -240(%rbp), %ymm2                             #29.16
..LN164:
        kmovw     %eax, %k1                                     #29.16
..LN165:
        vpandd    %ymm2, %ymm1, %ymm0{%k1}                      #29.16
..LN166:
        vmovdqu   %ymm0, -80(%rbp)                              #29.16
..LN167:
        vmovdqu   -80(%rbp), %ymm0                              #29.16
..LN168:
        vmovdqu   %ymm0, -48(%rbp)                              #29.14
..LN169:
	.loc    1  31  is_stmt 1
        vmovdqu   -48(%rbp), %ymm0                              #31.2
..LN170:
        movl      $8, %eax                                      #31.2
..LN171:
        movl      %eax, %edi                                    #31.2
..___tag_value__Z7shiftELv.34:
..LN172:
#       printVec<__m256i>(__m256i, int)
        call      _Z8printVecI7__m256iEvT_i                     #31.2
..___tag_value__Z7shiftELv.35:
..LN173:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B2.7:                         # Preds ..B2.6
                                # Execution count [0.00e+00]
..LN174:
	.loc    1  32  is_stmt 1
        lea       -48(%rbp), %rax                               #32.13
..LN175:
        addq      $16, %rax                                     #32.13
..LN176:
        movl      (%rax), %eax                                  #32.13
..LN177:
        vzeroupper                                              #32.13
..LN178:
	.loc    1  32  epilogue_begin  is_stmt 1
        leave                                                   #32.13
	.cfi_restore 6
..LN179:
        movq      %rbx, %rsp                                    #32.13
..LN180:
        popq      %rbx                                          #32.13
	.cfi_def_cfa 7, 8
	.cfi_restore 3
..LN181:
        ret                                                     #32.13
..LN182:
                                # LOE
..LN183:
	.cfi_endproc
# mark_end;
	.type	_Z7shiftELv,@function
	.size	_Z7shiftELv,.-_Z7shiftELv
..LN_Z7shiftELv.184:
.LN_Z7shiftELv:
	.section .rodata, "a"
	.align 4
mem.226.0:
	.long	10
	.long	20
	.long	30
	.long	40
	.long	50
	.long	60
	.long	70
	.long	80
	.align 4
mask.226.0:
	.long	0
	.long	0
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.align 4
shuf_idx.226.0:
	.long	0
	.long	0
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.data
# -- End  _Z7shiftELv
	.text
.L_2__routine_start_main_2:
# -- Begin  main
	.text
# mark_begin;

	.globl main
# --- main()
main:
..B3.1:                         # Preds ..B3.0
                                # Execution count [0.00e+00]
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
..___tag_value_main.43:
..L44:
                                                         #35.12
..LN185:
	.loc    1  35  is_stmt 1
        pushq     %rbp                                          #35.12
	.cfi_def_cfa_offset 16
..LN186:
        movq      %rsp, %rbp                                    #35.12
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN187:
        subq      $16, %rsp                                     #35.12
..___tag_value_main.49:
..LN188:
	.loc    1  36  prologue_end  is_stmt 1
#       shiftEL()
        call      _Z7shiftELv                                   #36.10
..___tag_value_main.50:
..LN189:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B3.5:                         # Preds ..B3.1
                                # Execution count [0.00e+00]
..LN190:
        movl      %eax, -16(%rbp)                               #36.10
..LN191:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B3.2:                         # Preds ..B3.5
                                # Execution count [0.00e+00]
..LN192:
        movl      -16(%rbp), %eax                               #36.10
..LN193:
	.loc    1  36  epilogue_begin  is_stmt 1
        leave                                                   #36.10
	.cfi_restore 6
..LN194:
        ret                                                     #36.10
..LN195:
                                # LOE
..LN196:
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.197:
.LNmain:
	.data
# -- End  main
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .debug_info
	.section .debug_info
.debug_info_seg:
	.align 1
	.4byte 0x000002b5
	.2byte 0x0004
	.4byte .debug_abbrev_seg
	.byte 0x08
//	DW_TAG_compile_unit:
	.byte 0x01
//	DW_AT_comp_dir:
	.4byte .debug_str
//	DW_AT_name:
	.4byte .debug_str+0x1a
//	DW_AT_producer:
	.4byte .debug_str+0x20
	.4byte .debug_str+0x8e
//	DW_AT_language:
	.byte 0x04
//	DW_AT_use_UTF8:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte 0x0000000000000000
//	DW_AT_ranges:
	.4byte .debug_ranges_seg
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
	.4byte .debug_str+0x9a
//	DW_TAG_namespace:
	.byte 0x03
//	DW_AT_name:
	.4byte .debug_str+0xa4
//	DW_TAG_subprogram:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x06
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0xaf
	.4byte .debug_str+0xb8
//	DW_AT_low_pc:
	.8byte ..L3
//	DW_AT_high_pc:
	.8byte ..LN_Z8printVecI7__m256iEvT_i.67-..L3
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x06
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000b0
//	DW_AT_name:
	.4byte 0x00636576
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x50
//	DW_TAG_formal_parameter:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x06
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000017b
//	DW_AT_name:
	.4byte 0x006e656c
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x40
//	DW_TAG_template_type_param:
	.byte 0x06
//	DW_AT_name:
	.4byte .debug_str+0x188
//	DW_AT_type:
	.4byte 0x000000b0
//	DW_TAG_formal_parameter:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x06
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000b0
//	DW_AT_name:
	.4byte 0x00636576
//	DW_AT_location:
	.4byte 0x7f987603
//	DW_TAG_lexical_block:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x08
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN19
//	DW_AT_high_pc:
	.8byte ..LN60
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x08
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000017b
//	DW_AT_location:
	.4byte 0x7f947603
	.byte 0x00
	.byte 0x00
//	DW_TAG_typedef:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x37
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_name:
	.4byte .debug_str+0xd2
//	DW_AT_type:
	.4byte 0x000000bb
//	DW_TAG_union_type:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0x27
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_byte_size:
	.byte 0x20
//	DW_AT_name:
	.4byte .debug_str+0xd2
//	DW_TAG_member:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x2d
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0xda
//	DW_AT_type:
	.4byte 0x00000142
//	DW_TAG_member:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x2f
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0xf7
//	DW_AT_type:
	.4byte 0x00000152
//	DW_TAG_member:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x30
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x105
//	DW_AT_type:
	.4byte 0x00000162
//	DW_TAG_member:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x31
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x115
//	DW_AT_type:
	.4byte 0x00000172
//	DW_TAG_member:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x32
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x11f
//	DW_AT_type:
	.4byte 0x00000182
//	DW_TAG_member:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x33
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x129
//	DW_AT_type:
	.4byte 0x0000018b
//	DW_TAG_member:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x34
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x140
//	DW_AT_type:
	.4byte 0x0000019b
//	DW_TAG_member:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x35
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x159
//	DW_AT_type:
	.4byte 0x000001ab
//	DW_TAG_member:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x36
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x170
//	DW_AT_type:
	.4byte 0x000001bb
	.byte 0x00
//	DW_TAG_array_type:
	.byte 0x0c
//	DW_AT_type:
	.4byte 0x0000014b
//	DW_AT_byte_size:
	.byte 0x20
//	DW_TAG_subrange_type:
	.byte 0x0d
//	DW_AT_upper_bound:
	.byte 0x03
	.byte 0x00
//	DW_TAG_base_type:
	.byte 0x0e
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0xf2
//	DW_TAG_array_type:
	.byte 0x0c
//	DW_AT_type:
	.4byte 0x0000015b
//	DW_AT_byte_size:
	.byte 0x20
//	DW_TAG_subrange_type:
	.byte 0x0d
//	DW_AT_upper_bound:
	.byte 0x1f
	.byte 0x00
//	DW_TAG_base_type:
	.byte 0x0e
//	DW_AT_byte_size:
	.byte 0x01
//	DW_AT_encoding:
	.byte 0x06
//	DW_AT_name:
	.4byte .debug_str+0x100
//	DW_TAG_array_type:
	.byte 0x0c
//	DW_AT_type:
	.4byte 0x0000016b
//	DW_AT_byte_size:
	.byte 0x20
//	DW_TAG_subrange_type:
	.byte 0x0d
//	DW_AT_upper_bound:
	.byte 0x0f
	.byte 0x00
//	DW_TAG_base_type:
	.byte 0x0e
//	DW_AT_byte_size:
	.byte 0x02
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x10f
//	DW_TAG_array_type:
	.byte 0x0c
//	DW_AT_type:
	.4byte 0x0000017b
//	DW_AT_byte_size:
	.byte 0x20
//	DW_TAG_subrange_type:
	.byte 0x0d
//	DW_AT_upper_bound:
	.byte 0x07
	.byte 0x00
//	DW_TAG_base_type:
	.byte 0x0f
//	DW_AT_byte_size:
	.byte 0x04
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte 0x00746e69
//	DW_TAG_array_type:
	.byte 0x0c
//	DW_AT_type:
	.4byte 0x0000014b
//	DW_AT_byte_size:
	.byte 0x20
//	DW_TAG_subrange_type:
	.byte 0x0d
//	DW_AT_upper_bound:
	.byte 0x03
	.byte 0x00
//	DW_TAG_array_type:
	.byte 0x0c
//	DW_AT_type:
	.4byte 0x00000194
//	DW_AT_byte_size:
	.byte 0x20
//	DW_TAG_subrange_type:
	.byte 0x0d
//	DW_AT_upper_bound:
	.byte 0x1f
	.byte 0x00
//	DW_TAG_base_type:
	.byte 0x0e
//	DW_AT_byte_size:
	.byte 0x01
//	DW_AT_encoding:
	.byte 0x08
//	DW_AT_name:
	.4byte .debug_str+0x132
//	DW_TAG_array_type:
	.byte 0x0c
//	DW_AT_type:
	.4byte 0x000001a4
//	DW_AT_byte_size:
	.byte 0x20
//	DW_TAG_subrange_type:
	.byte 0x0d
//	DW_AT_upper_bound:
	.byte 0x0f
	.byte 0x00
//	DW_TAG_base_type:
	.byte 0x0e
//	DW_AT_byte_size:
	.byte 0x02
//	DW_AT_encoding:
	.byte 0x07
//	DW_AT_name:
	.4byte .debug_str+0x14a
//	DW_TAG_array_type:
	.byte 0x0c
//	DW_AT_type:
	.4byte 0x000001b4
//	DW_AT_byte_size:
	.byte 0x20
//	DW_TAG_subrange_type:
	.byte 0x0d
//	DW_AT_upper_bound:
	.byte 0x07
	.byte 0x00
//	DW_TAG_base_type:
	.byte 0x0e
//	DW_AT_byte_size:
	.byte 0x04
//	DW_AT_encoding:
	.byte 0x07
//	DW_AT_name:
	.4byte .debug_str+0x163
//	DW_TAG_array_type:
	.byte 0x0c
//	DW_AT_type:
	.4byte 0x000001c4
//	DW_AT_byte_size:
	.byte 0x20
//	DW_TAG_subrange_type:
	.byte 0x0d
//	DW_AT_upper_bound:
	.byte 0x03
	.byte 0x00
//	DW_TAG_base_type:
	.byte 0x0e
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x07
//	DW_AT_name:
	.4byte .debug_str+0x17a
//	DW_TAG_subprogram:
	.byte 0x10
//	DW_AT_decl_line:
	.byte 0x0d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000017b
//	DW_AT_name:
	.4byte .debug_str+0x18d
	.4byte .debug_str+0x195
//	DW_AT_low_pc:
	.8byte ..L24
//	DW_AT_high_pc:
	.8byte ..LN_Z7shiftELv.184-..L24
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_variable:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0x0f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1a1
//	DW_AT_type:
	.4byte 0x000000b0
//	DW_AT_location:
	.4byte 0x7d907603
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x12
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x006d656d
//	DW_AT_type:
	.4byte 0x0000027c
//	DW_AT_location:
	.4byte 0x7c907603
//	DW_TAG_variable:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0x13
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1aa
//	DW_AT_type:
	.4byte 0x000000b0
//	DW_AT_location:
	.4byte 0x7dd07603
//	DW_TAG_variable:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0x16
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1b2
//	DW_AT_type:
	.4byte 0x00000285
//	DW_AT_location:
	.4byte 0x7cb07603
//	DW_TAG_variable:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0x17
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1b7
//	DW_AT_type:
	.4byte 0x000000b0
//	DW_AT_location:
	.4byte 0x7e907603
//	DW_TAG_variable:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0x19
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1c0
//	DW_AT_type:
	.4byte 0x0000028e
//	DW_AT_location:
	.4byte 0x7cd07603
//	DW_TAG_variable:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0x1a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1c9
//	DW_AT_type:
	.4byte 0x000000b0
//	DW_AT_location:
	.4byte 0x7ed07603
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x1c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00317270
//	DW_AT_type:
	.4byte 0x000000b0
//	DW_AT_location:
	.4byte 0x7f907603
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x1d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00736572
//	DW_AT_type:
	.4byte 0x000000b0
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x50
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x12
//	DW_AT_type:
	.4byte 0x00000277
//	DW_TAG_const_type:
	.byte 0x13
//	DW_AT_type:
	.4byte 0x0000017b
//	DW_TAG_array_type:
	.byte 0x0c
//	DW_AT_type:
	.4byte 0x0000017b
//	DW_AT_byte_size:
	.byte 0x20
//	DW_TAG_subrange_type:
	.byte 0x0d
//	DW_AT_upper_bound:
	.byte 0x07
	.byte 0x00
//	DW_TAG_array_type:
	.byte 0x0c
//	DW_AT_type:
	.4byte 0x0000017b
//	DW_AT_byte_size:
	.byte 0x20
//	DW_TAG_subrange_type:
	.byte 0x0d
//	DW_AT_upper_bound:
	.byte 0x07
	.byte 0x00
//	DW_TAG_array_type:
	.byte 0x0c
//	DW_AT_type:
	.4byte 0x0000017b
//	DW_AT_byte_size:
	.byte 0x20
//	DW_TAG_subrange_type:
	.byte 0x0d
//	DW_AT_upper_bound:
	.byte 0x07
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0x23
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000017b
//	DW_AT_name:
	.4byte .debug_str+0x1d6
	.4byte .debug_str+0x1d6
//	DW_AT_low_pc:
	.8byte ..L44
//	DW_AT_high_pc:
	.8byte ..LNmain.197-..L44
	.byte 0x01
//	DW_AT_external:
	.byte 0x01
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
	.byte 0x55
	.byte 0x17
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
	.byte 0x2f
	.byte 0x00
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x07
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
	.byte 0x08
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
	.byte 0x09
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
	.byte 0x0a
	.byte 0x17
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
	.byte 0x0b
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
	.byte 0x0c
	.byte 0x01
	.byte 0x01
	.byte 0x49
	.byte 0x13
	.byte 0x0b
	.byte 0x0b
	.2byte 0x0000
	.byte 0x0d
	.byte 0x21
	.byte 0x00
	.byte 0x2f
	.byte 0x0b
	.2byte 0x0000
	.byte 0x0e
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x0f
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.2byte 0x0000
	.byte 0x10
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
	.byte 0x11
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
	.byte 0x12
	.byte 0x0f
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x13
	.byte 0x26
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x14
	.byte 0x2e
	.byte 0x00
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
	.byte 0x00
// -- Begin DWARF2 SEGMENT .debug_str
	.section .debug_str,"MS",@progbits,1
.debug_str_seg:
	.align 1
	.8byte 0x6e692f656d6f682f
	.8byte 0x65646f632f6c6574
	.8byte 0x6f746365762f632f
	.2byte 0x0072
	.4byte 0x70632e74
	.2byte 0x0070
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
	.8byte 0x2e302e3931206e6f
	.8byte 0x7542203434312e31
	.8byte 0x3831303220646c69
	.4byte 0x38313031
	.2byte 0x000a
	.8byte 0x672d207876616d2d
	.4byte 0x00532d20
	.8byte 0x78635f756e675f5f
	.2byte 0x0078
	.8byte 0x6962617878635f5f
	.2byte 0x3176
	.byte 0x00
	.8byte 0x636556746e697270
	.byte 0x00
	.8byte 0x746e697270385a5f
	.8byte 0x6d5f5f3749636556
	.8byte 0x5f54764569363532
	.2byte 0x0069
	.8byte 0x00693635326d5f5f
	.8byte 0x63675f693635326d
	.8byte 0x7461706d6f635f63
	.8byte 0x007974696c696269
	.4byte 0x676e6f6c
	.byte 0x00
	.8byte 0x38695f693635326d
	.byte 0x00
	.4byte 0x72616863
	.byte 0x00
	.8byte 0x31695f693635326d
	.2byte 0x0036
	.4byte 0x726f6873
	.2byte 0x0074
	.8byte 0x33695f693635326d
	.2byte 0x0032
	.8byte 0x36695f693635326d
	.2byte 0x0034
	.8byte 0x38755f693635326d
	.byte 0x00
	.8byte 0x64656e6769736e75
	.4byte 0x61686320
	.2byte 0x0072
	.8byte 0x31755f693635326d
	.2byte 0x0036
	.8byte 0x64656e6769736e75
	.4byte 0x6f687320
	.2byte 0x7472
	.byte 0x00
	.8byte 0x33755f693635326d
	.2byte 0x0032
	.8byte 0x64656e6769736e75
	.4byte 0x746e6920
	.byte 0x00
	.8byte 0x36755f693635326d
	.2byte 0x0034
	.8byte 0x64656e6769736e75
	.4byte 0x6e6f6c20
	.2byte 0x0067
	.4byte 0x54636556
	.byte 0x00
	.8byte 0x004c457466696873
	.8byte 0x7466696873375a5f
	.4byte 0x00764c45
	.8byte 0x6365765f73656e6f
	.byte 0x00
	.8byte 0x006365765f6d656d
	.4byte 0x6b73616d
	.byte 0x00
	.8byte 0x6365765f6b73616d
	.byte 0x00
	.8byte 0x7864695f66756873
	.byte 0x00
	.8byte 0x7864695f66756873
	.4byte 0x6365765f
	.byte 0x00
	.4byte 0x6e69616d
	.byte 0x00
// -- Begin DWARF2 SEGMENT .debug_ranges
	.section .debug_ranges
.debug_ranges_seg:
	.align 1
	.8byte ..L24
	.8byte ..LNmain.197
	.8byte ..L3
	.8byte ..LN_Z8printVecI7__m256iEvT_i.67
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.section .text
.LNDBG_TXe:
# End
