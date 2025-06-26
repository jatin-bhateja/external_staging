	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.1.144 Build 20181018";
# mark_description "-g -S";
	.file "aligned_load.c"
	.text
..TXTST0:
.L_2__routine_start_main_0:
# -- Begin  main
	.section .rodata, "a"
	.align 4
	.align 4
.L_2il0floatpacket.0:
	.long	0x3f8ccccd
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,4
	.align 4
.L_2il0floatpacket.1:
	.long	0x40066666
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,4
	.align 4
.L_2il0floatpacket.2:
	.long	0x40466666
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,4
	.align 4
.L_2il0floatpacket.3:
	.long	0x40833333
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,4
	.align 4
.L_2__STRING.0:
	.long	774792741
	.word	10
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,6
	.text
# mark_begin;

	.globl main
# --- main()
main:
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_main.2:
..L3:
                                                          #6.12
..LN0:
	.file   1 "aligned_load.c"
	.loc    1  6  is_stmt 1
        pushq     %rbp                                          #6.12
	.cfi_def_cfa_offset 16
..LN1:
        movq      %rsp, %rbp                                    #6.12
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN2:
        subq      $64, %rsp                                     #6.12
..LN3:
	.loc    1  8  prologue_end  is_stmt 1
        movl      $16, %edi                                     #8.17
..LN4:
        movl      $16, %esi                                     #8.17
..LN5:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #8.17
..LN6:
                                # LOE rax rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
..LN7:
        movq      %rax, -56(%rbp)                               #8.17
..LN8:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.6
                                # Execution count [0.00e+00]
..LN9:
        movq      -56(%rbp), %rax                               #8.17
..LN10:
        movq      %rax, -48(%rbp)                               #8.15
..LN11:
	.loc    1  9  is_stmt 1
        movss     .L_2il0floatpacket.0(%rip), %xmm0             #9.12
..LN12:
        movq      -48(%rbp), %rax                               #9.3
..LN13:
        movss     %xmm0, (%rax)                                 #9.3
..LN14:
	.loc    1  10  is_stmt 1
        movss     .L_2il0floatpacket.1(%rip), %xmm0             #10.12
..LN15:
        movq      -48(%rbp), %rax                               #10.3
..LN16:
        movss     %xmm0, 4(%rax)                                #10.3
..LN17:
	.loc    1  11  is_stmt 1
        movss     .L_2il0floatpacket.2(%rip), %xmm0             #11.12
..LN18:
        movq      -48(%rbp), %rax                               #11.3
..LN19:
        movss     %xmm0, 8(%rax)                                #11.3
..LN20:
	.loc    1  12  is_stmt 1
        movss     .L_2il0floatpacket.3(%rip), %xmm0             #12.12
..LN21:
        movq      -48(%rbp), %rax                               #12.3
..LN22:
        movss     %xmm0, 12(%rax)                               #12.3
..LN23:
	.loc    1  13  is_stmt 1
        movq      -48(%rbp), %rax                               #13.28
..LN24:
        movups    (%rax), %xmm0                                 #13.28
..LN25:
        movups    %xmm0, -32(%rbp)                              #13.15
..LN26:
        movups    -32(%rbp), %xmm0                              #13.15
..LN27:
        movups    %xmm0, -16(%rbp)                              #13.13
..LN28:
	.loc    1  14  is_stmt 1
        movups    -16(%rbp), %xmm0                              #14.0
..LN29:
        vmovaps   %xmm0, %xmm1                                  #14.0
..LN30:
        vextractps $3, %xmm1, %eax                              #14.0
..LN31:
        movl      %eax, -64(%rbp)                               #14.0
..LN32:
	.loc    1  21  is_stmt 1
        movl      $.L_2__STRING.0, %eax                         #21.3
..LN33:
        movss     -64(%rbp), %xmm0                              #21.3
..LN34:
        cvtss2sd  %xmm0, %xmm0                                  #21.3
..LN35:
        movq      %rax, %rdi                                    #21.3
..LN36:
        movl      $1, %eax                                      #21.3
..___tag_value_main.8:
..LN37:
#       printf(const char *__restrict__, ...)
        call      printf                                        #21.3
..___tag_value_main.9:
..LN38:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip eax
..B1.7:                         # Preds ..B1.2
                                # Execution count [0.00e+00]
..LN39:
        movl      %eax, -60(%rbp)                               #21.3
..LN40:
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.7
                                # Execution count [0.00e+00]
..LN41:
	.loc    1  22  is_stmt 1
        movss     -64(%rbp), %xmm0                              #22.15
..LN42:
        cvttss2si %xmm0, %eax                                   #22.15
..LN43:
	.loc    1  22  epilogue_begin  is_stmt 1
        leave                                                   #22.15
	.cfi_restore 6
..LN44:
        ret                                                     #22.15
..LN45:
                                # LOE
..LN46:
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.47:
.LNmain:
	.data
	.file   2 "/opt/intel/system_studio_2019/compilers_and_libraries_2019.1.144/linux/compiler/include/icc/xmmintrin.h"
# -- End  main
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .debug_info
	.section .debug_info
.debug_info_seg:
	.align 1
	.4byte 0x000000cb
	.2byte 0x0004
	.4byte .debug_abbrev_seg
	.byte 0x08
//	DW_TAG_compile_unit:
	.byte 0x01
//	DW_AT_comp_dir:
	.4byte .debug_str
//	DW_AT_name:
	.4byte .debug_str+0x1c
//	DW_AT_producer:
	.4byte .debug_str+0x2b
	.4byte .debug_str+0x97
//	DW_AT_language:
	.byte 0x01
//	DW_AT_use_UTF8:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..L3
//	DW_AT_high_pc:
	.8byte ..LNmain.47-..L3
	.byte 0x01
//	DW_AT_stmt_list:
	.4byte .debug_line_seg
//	DW_TAG_base_type:
	.byte 0x02
//	DW_AT_byte_size:
	.byte 0x04
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte 0x00746e69
//	DW_TAG_subprogram:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x06
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000033
//	DW_AT_name:
	.4byte .debug_str+0x9d
	.4byte .debug_str+0x9d
//	DW_AT_low_pc:
	.8byte ..L3
//	DW_AT_high_pc:
	.8byte ..LNmain.47-..L3
	.byte 0x01
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x07
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0xaf
//	DW_AT_type:
	.4byte 0x0000008b
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x40
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x08
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00727261
//	DW_AT_type:
	.4byte 0x00000086
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x50
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x0d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x006c6176
//	DW_AT_type:
	.4byte 0x000000a3
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x70
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x06
//	DW_AT_type:
	.4byte 0x0000008b
//	DW_TAG_base_type:
	.byte 0x07
//	DW_AT_byte_size:
	.byte 0x04
//	DW_AT_encoding:
	.byte 0x04
//	DW_AT_name:
	.4byte .debug_str+0xa2
//	DW_TAG_pointer_type:
	.byte 0x06
//	DW_AT_type:
	.4byte 0x00000097
//	DW_TAG_const_type:
	.byte 0x08
//	DW_AT_type:
	.4byte 0x0000008b
//	DW_TAG_base_type:
	.byte 0x07
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x04
//	DW_AT_name:
	.4byte .debug_str+0xa8
//	DW_TAG_typedef:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x40
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_name:
	.4byte .debug_str+0xb4
//	DW_AT_type:
	.4byte 0x000000ae
//	DW_TAG_structure_type:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_byte_size:
	.byte 0x10
//	DW_AT_name:
	.4byte .debug_str+0xb4
//	DW_TAG_member:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x3f
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0xbb
//	DW_AT_type:
	.4byte 0x000000c5
	.byte 0x00
//	DW_TAG_array_type:
	.byte 0x0c
//	DW_AT_type:
	.4byte 0x0000008b
//	DW_AT_byte_size:
	.byte 0x10
//	DW_TAG_subrange_type:
	.byte 0x0d
//	DW_AT_upper_bound:
	.byte 0x03
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
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.2byte 0x0000
	.byte 0x03
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
	.byte 0x04
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
	.byte 0x05
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
	.byte 0x06
	.byte 0x0f
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x07
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x08
	.byte 0x26
	.byte 0x00
	.byte 0x49
	.byte 0x13
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
	.byte 0x00
// -- Begin DWARF2 SEGMENT .debug_str
	.section .debug_str,"MS",@progbits,1
.debug_str_seg:
	.align 1
	.8byte 0x6e692f656d6f682f
	.8byte 0x65646f632f6c6574
	.8byte 0x5f786576652f632f
	.4byte 0x0078616d
	.8byte 0x5f64656e67696c61
	.4byte 0x64616f6c
	.2byte 0x632e
	.byte 0x00
	.8byte 0x2952286c65746e49
	.8byte 0x6c65746e49204320
	.8byte 0x4320343620295228
	.8byte 0x2072656c69706d6f
	.8byte 0x6c70706120726f66
	.8byte 0x736e6f6974616369
	.8byte 0x676e696e6e757220
	.8byte 0x65746e49206e6f20
	.8byte 0x2c3436202952286c
	.8byte 0x6e6f697372655620
	.8byte 0x2e312e302e393120
	.8byte 0x6c69754220343431
	.8byte 0x3031383130322064
	.4byte 0x000a3831
	.4byte 0x2d20672d
	.2byte 0x0053
	.4byte 0x6e69616d
	.byte 0x00
	.4byte 0x616f6c66
	.2byte 0x0074
	.4byte 0x62756f64
	.2byte 0x656c
	.byte 0x00
	.4byte 0x6d656c65
	.byte 0x00
	.4byte 0x316d5f5f
	.2byte 0x3832
	.byte 0x00
	.8byte 0x3233665f3832316d
	.byte 0x00
	.section .text
.LNDBG_TXe:
# End
