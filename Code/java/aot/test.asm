
test.so:     file format elf64-x86-64


Disassembly of section .text:

0000000000002900 <A.text>:
	...

0000000000002920 <test.<init>()V>:
    2920:	44 8b 56 08          	mov    0x8(%rsi),%r10d
    2924:	49 c1 e2 03          	shl    $0x3,%r10
    2928:	4c 8b 25 81 47 21 00 	mov    0x214781(%rip),%r12        # 2170b0 <_aot_narrow_klass_base_address>
    292f:	4d 03 d4             	add    %r12,%r10
    2932:	4c 8b 25 7f 47 21 00 	mov    0x21477f(%rip),%r12        # 2170b8 <_aot_narrow_oop_base_address>
    2939:	49 3b c2             	cmp    %r10,%rax
    293c:	0f 85 1e 86 00 00    	jne    af60 <plt._aot_ic_miss_stub>
    2942:	90                   	nop
    2943:	66 66 66 0f 1f 84 00 	data16 data16 nopw 0x0(%rax,%rax,1)
    294a:	00 00 00 00 
    294e:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    2955:	00 00 
    2957:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    295e:	00 00 
    2960:	48 8b 05 19 4c 21 00 	mov    0x214c19(%rip),%rax        # 217580 <A.meth.state>
    2967:	48 85 c0             	test   %rax,%rax
    296a:	0f 85 f8 85 00 00    	jne    af68 <plt._aot_handle_wrong_method_stub>
    2970:	90                   	nop
    2971:	89 84 24 00 a0 fe ff 	mov    %eax,-0x16000(%rsp)
    2978:	48 83 ec 18          	sub    $0x18,%rsp
    297c:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
    2981:	e8 1a 70 00 00       	callq  99a0 <Stub<registerFinalizer(Object)void>>
    2986:	90                   	nop
    2987:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
    298c:	48 83 c4 18          	add    $0x18,%rsp
    2990:	49 8b 8f 28 01 00 00 	mov    0x128(%r15),%rcx
    2997:	85 01                	test   %eax,(%rcx)
    2999:	c5 f8 77             	vzeroupper 
    299c:	c3                   	retq   
    299d:	e8 fe 01 00 00       	callq  2ba0 <Stub<ExceptionHandlerStub.exceptionHandler>>
    29a2:	90                   	nop
    29a3:	e8 c8 85 00 00       	callq  af70 <plt._aot_deopt_blob_unpack>
    29a8:	90                   	nop
	...
    29fd:	00 00                	add    %al,(%rax)
    29ff:	00 01                	add    %al,(%rcx)
	...

0000000000002a20 <test.main([Ljava/lang/String;)V>:
    2a20:	48 8b 05 61 4b 21 00 	mov    0x214b61(%rip),%rax        # 217588 <got.state.M1>
    2a27:	48 85 c0             	test   %rax,%rax
    2a2a:	0f 85 38 85 00 00    	jne    af68 <plt._aot_handle_wrong_method_stub>
    2a30:	90                   	nop
    2a31:	89 84 24 00 a0 fe ff 	mov    %eax,-0x16000(%rsp)
    2a38:	48 83 ec 18          	sub    $0x18,%rsp
    2a3c:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
    2a41:	48 8b 35 58 4a 21 00 	mov    0x214a58(%rip),%rsi        # 2174a0 <got.init.Ljava/lang/System;>
    2a48:	48 85 f6             	test   %rsi,%rsi
    2a4b:	0f 84 5a 00 00 00    	je     2aab <test.main([Ljava/lang/String;)V+0x8b>
    2a51:	48 8b 76 70          	mov    0x70(%rsi),%rsi
    2a55:	48 8b 36             	mov    (%rsi),%rsi
    2a58:	8b 5e 74             	mov    0x74(%rsi),%ebx
    2a5b:	41 85 04 dc          	test   %eax,(%r12,%rbx,8)
    2a5f:	48 8b 35 9a 4a 21 00 	mov    0x214a9a(%rip),%rsi        # 217500 <A.cnt.got>
    2a66:	48 85 f6             	test   %rsi,%rsi
    2a69:	0f 84 57 00 00 00    	je     2ac6 <test.main([Ljava/lang/String;)V+0xa6>
    2a6f:	48 8b d6             	mov    %rsi,%rdx
    2a72:	48 c1 e3 03          	shl    $0x3,%rbx
    2a76:	74 03                	je     2a7b <test.main([Ljava/lang/String;)V+0x5b>
    2a78:	49 03 dc             	add    %r12,%rbx
    2a7b:	48 8b f3             	mov    %rbx,%rsi
    2a7e:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffffffff,%rax
    2a85:	ff ff ff 
    2a88:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2a8f:	e8 8c 00 00 00       	callq  2b20 <M1_111_java.io.PrintStream.println(Ljava/lang/String;)V_plt.entry>
    2a94:	90                   	nop
    2a95:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
    2a9a:	48 83 c4 18          	add    $0x18,%rsp
    2a9e:	49 8b 8f 28 01 00 00 	mov    0x128(%r15),%rcx
    2aa5:	85 01                	test   %eax,(%rcx)
    2aa7:	c5 f8 77             	vzeroupper 
    2aaa:	c3                   	retq   
    2aab:	48 8d 1d 4e cb 00 00 	lea    0xcb4e(%rip),%rbx        # f600 <data.M1.0>
    2ab2:	48 8d 35 e7 49 21 00 	lea    0x2149e7(%rip),%rsi        # 2174a0 <got.init.Ljava/lang/System;>
    2ab9:	48 8b d3             	mov    %rbx,%rdx
    2abc:	e8 df 7f 00 00       	callq  aaa0 <Stub<initialize_klass_by_symbol(Word,Word)Word>>
    2ac1:	48 8b f0             	mov    %rax,%rsi
    2ac4:	eb 8b                	jmp    2a51 <test.main([Ljava/lang/String;)V+0x31>
    2ac6:	48 8d 2d 4b cb 00 00 	lea    0xcb4b(%rip),%rbp        # f618 <data.M1.20>
    2acd:	48 8d 35 2c 4a 21 00 	lea    0x214a2c(%rip),%rsi        # 217500 <A.cnt.got>
    2ad4:	48 8b d5             	mov    %rbp,%rdx
    2ad7:	e8 c4 7b 00 00       	callq  a6a0 <Stub<resolve_string_by_symbol(Word,Word)Object>>
    2adc:	48 8b d0             	mov    %rax,%rdx
    2adf:	eb 91                	jmp    2a72 <test.main([Ljava/lang/String;)V+0x52>
    2ae1:	49 8b b7 60 04 00 00 	mov    0x460(%r15),%rsi
    2ae8:	49 c7 87 60 04 00 00 	movq   $0x0,0x460(%r15)
    2aef:	00 00 00 00 
    2af3:	49 c7 87 68 04 00 00 	movq   $0x0,0x468(%r15)
    2afa:	00 00 00 00 
    2afe:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
    2b03:	48 83 c4 18          	add    $0x18,%rsp
    2b07:	48 8b 14 24          	mov    (%rsp),%rdx
    2b0b:	e9 10 62 00 00       	jmpq   8d20 <Stub<UnwindExceptionToCallerStub.unwindExceptionToCaller>>
    2b10:	90                   	nop
    2b11:	e8 8a 00 00 00       	callq  2ba0 <Stub<ExceptionHandlerStub.exceptionHandler>>
    2b16:	90                   	nop
    2b17:	e8 54 84 00 00       	callq  af70 <plt._aot_deopt_blob_unpack>
    2b1c:	90                   	nop
    2b1d:	00 00                	add    %al,(%rax)
	...

0000000000002b20 <M1_111_java.io.PrintStream.println(Ljava/lang/String;)V_plt.entry>:
    2b20:	48 8b 05 01 49 21 00 ff 25 f3 48 21 00              H...I!..%.H!.

0000000000002b2d <M1_111_java.io.PrintStream.println(Ljava/lang/String;)V_plt.jmp>:
    2b2d:	ff 25 55 45 21 00 0f 1f 44 00 00 00 00 00 00 00     .%UE!...D.......
	...
    2b7d:	00 00 00 02 00 00 00 00 00 00 00 00 00 00 00 00     ................
	...

0000000000002ba0 <Stub<ExceptionHandlerStub.exceptionHandler>>:
    2ba0:	48 83 ec 28          	sub    $0x28,%rsp
    2ba4:	48 89 6c 24 20       	mov    %rbp,0x20(%rsp)
    2ba9:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    2bae:	49 8b 8f 60 04 00 00 	mov    0x460(%r15),%rcx
    2bb5:	48 85 c9             	test   %rcx,%rcx
    2bb8:	0f 84 17 01 00 00    	je     2cd5 <Stub<ExceptionHandlerStub.exceptionHandler>+0x135>
    2bbe:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    2bc3:	48 8d 35 5e ca 00 00 	lea    0xca5e(%rip),%rsi        # f628 <data.M2.0>
    2bca:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    2bd1:	bf 01 00 00 00       	mov    $0x1,%edi
    2bd6:	48 8b d1             	mov    %rcx,%rdx
    2bd9:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx
    2be0:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8
    2be7:	c5 f8 77             	vzeroupper 
    2bea:	e8 89 83 00 00       	callq  af78 <plt._aot_jvmci_runtime_vm_message>
    2bef:	90                   	nop
    2bf0:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    2bf7:	00 00 00 00 
    2bfb:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    2c02:	00 00 00 00 
    2c06:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    2c0d:	00 00 00 00 
    2c11:	49 8b 97 68 04 00 00 	mov    0x468(%r15),%rdx
    2c18:	48 85 d2             	test   %rdx,%rdx
    2c1b:	0f 84 4b 00 00 00    	je     2c6c <Stub<ExceptionHandlerStub.exceptionHandler>+0xcc>
    2c21:	48 8d 35 30 ca 00 00 	lea    0xca30(%rip),%rsi        # f658 <data.M2.48>
    2c28:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    2c2f:	bf 01 00 00 00       	mov    $0x1,%edi
    2c34:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx
    2c3b:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8
    2c42:	c5 f8 77             	vzeroupper 
    2c45:	e8 2e 83 00 00       	callq  af78 <plt._aot_jvmci_runtime_vm_message>
    2c4a:	90                   	nop
    2c4b:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    2c52:	00 00 00 00 
    2c56:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    2c5d:	00 00 00 00 
    2c61:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    2c68:	00 00 00 00 
    2c6c:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    2c71:	48 85 c0             	test   %rax,%rax
    2c74:	0f 84 65 00 00 00    	je     2cdf <Stub<ExceptionHandlerStub.exceptionHandler>+0x13f>
    2c7a:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
    2c7f:	49 89 87 60 04 00 00 	mov    %rax,0x460(%r15)
    2c86:	49 89 97 68 04 00 00 	mov    %rdx,0x468(%r15)
    2c8d:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
    2c92:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    2c99:	49 8b ff             	mov    %r15,%rdi
    2c9c:	c5 f8 77             	vzeroupper 
    2c9f:	e8 dc 82 00 00       	callq  af80 <plt._aot_jvmci_runtime_exception_handler_for_pc>
    2ca4:	90                   	nop
    2ca5:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    2cac:	00 00 00 00 
    2cb0:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    2cb7:	00 00 00 00 
    2cbb:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    2cc2:	00 00 00 00 
    2cc6:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    2ccb:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
    2cd0:	48 83 c4 28          	add    $0x28,%rsp
    2cd4:	c3                   	retq   
    2cd5:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    2cda:	e9 32 ff ff ff       	jmpq   2c11 <Stub<ExceptionHandlerStub.exceptionHandler>+0x71>
    2cdf:	48 8d 35 a2 c9 00 00 	lea    0xc9a2(%rip),%rsi        # f688 <data.M2.92>
    2ce6:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    2ced:	bf 01 00 00 00       	mov    $0x1,%edi
    2cf2:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
    2cf9:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx
    2d00:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8
    2d07:	c5 f8 77             	vzeroupper 
    2d0a:	e8 69 82 00 00       	callq  af78 <plt._aot_jvmci_runtime_vm_message>
    2d0f:	90                   	nop
    2d10:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    2d17:	00 00 00 00 
    2d1b:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    2d22:	00 00 00 00 
    2d26:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    2d2d:	00 00 00 00 
    2d31:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
    2d36:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    2d3b:	e9 3f ff ff ff       	jmpq   2c7f <Stub<ExceptionHandlerStub.exceptionHandler>+0xdf>
	...
    2d80:	03 00                	add    (%rax),%eax
	...

0000000000002da0 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>>:
    2da0:	44 8b d2             	mov    %edx,%r10d
    2da3:	48 8b c6             	mov    %rsi,%rax
    2da6:	c5 f9 6e c1          	vmovd  %ecx,%xmm0
    2daa:	c4 e2 7d 79 c0       	vpbroadcastw %xmm0,%ymm0
    2daf:	44 8b d8             	mov    %eax,%r11d
    2db2:	41 81 fa 81 00 00 00 	cmp    $0x81,%r10d
    2db9:	0f 82 01 01 00 00    	jb     2ec0 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x120>
    2dbf:	41 83 e3 3f          	and    $0x3f,%r11d
    2dc3:	0f 84 87 00 00 00    	je     2e50 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0xb0>
    2dc9:	c5 fe 6f 08          	vmovdqu (%rax),%ymm1
    2dcd:	c5 fe 6f 50 01       	vmovdqu 0x1(%rax),%ymm2
    2dd2:	c5 fe 6f 58 20       	vmovdqu 0x20(%rax),%ymm3
    2dd7:	c5 fe 6f 60 21       	vmovdqu 0x21(%rax),%ymm4
    2ddc:	c5 fd 75 c9          	vpcmpeqw %ymm1,%ymm0,%ymm1
    2de0:	c5 fd 75 d2          	vpcmpeqw %ymm2,%ymm0,%ymm2
    2de4:	c5 fd 75 db          	vpcmpeqw %ymm3,%ymm0,%ymm3
    2de8:	c5 fd 75 e4          	vpcmpeqw %ymm4,%ymm0,%ymm4
    2dec:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    2df0:	c5 7d d7 c2          	vpmovmskb %ymm2,%r8d
    2df4:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    2df8:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    2dfc:	45 85 db             	test   %r11d,%r11d
    2dff:	0f 85 e5 01 00 00    	jne    2fea <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x24a>
    2e05:	45 85 c0             	test   %r8d,%r8d
    2e08:	0f 85 a6 01 00 00    	jne    2fb4 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x214>
    2e0e:	45 85 c9             	test   %r9d,%r9d
    2e11:	0f 85 c5 01 00 00    	jne    2fdc <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x23c>
    2e17:	85 db                	test   %ebx,%ebx
    2e19:	0f 85 a9 01 00 00    	jne    2fc8 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x228>
    2e1f:	44 8b d8             	mov    %eax,%r11d
    2e22:	48 83 c0 40          	add    $0x40,%rax
    2e26:	41 83 ea 40          	sub    $0x40,%r10d
    2e2a:	41 83 e3 3f          	and    $0x3f,%r11d
    2e2e:	48 83 e0 c0          	and    $0xffffffffffffffc0,%rax
    2e32:	45 03 d3             	add    %r11d,%r10d
    2e35:	41 81 fa 81 00 00 00 	cmp    $0x81,%r10d
    2e3c:	0f 82 7e 00 00 00    	jb     2ec0 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x120>
    2e42:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2e49:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2e50:	c5 fe 6f 08          	vmovdqu (%rax),%ymm1
    2e54:	c5 fe 6f 50 01       	vmovdqu 0x1(%rax),%ymm2
    2e59:	c5 fe 6f 58 20       	vmovdqu 0x20(%rax),%ymm3
    2e5e:	c5 fe 6f 60 21       	vmovdqu 0x21(%rax),%ymm4
    2e63:	c5 fd 75 c9          	vpcmpeqw %ymm1,%ymm0,%ymm1
    2e67:	c5 fd 75 d2          	vpcmpeqw %ymm2,%ymm0,%ymm2
    2e6b:	c5 fd 75 db          	vpcmpeqw %ymm3,%ymm0,%ymm3
    2e6f:	c5 fd 75 e4          	vpcmpeqw %ymm4,%ymm0,%ymm4
    2e73:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    2e77:	c5 7d d7 c2          	vpmovmskb %ymm2,%r8d
    2e7b:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    2e7f:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    2e83:	45 85 db             	test   %r11d,%r11d
    2e86:	0f 85 5e 01 00 00    	jne    2fea <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x24a>
    2e8c:	45 85 c0             	test   %r8d,%r8d
    2e8f:	0f 85 1f 01 00 00    	jne    2fb4 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x214>
    2e95:	45 85 c9             	test   %r9d,%r9d
    2e98:	0f 85 3e 01 00 00    	jne    2fdc <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x23c>
    2e9e:	85 db                	test   %ebx,%ebx
    2ea0:	0f 85 22 01 00 00    	jne    2fc8 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x228>
    2ea6:	41 83 ea 40          	sub    $0x40,%r10d
    2eaa:	48 83 c0 40          	add    $0x40,%rax
    2eae:	41 81 fa 81 00 00 00 	cmp    $0x81,%r10d
    2eb5:	0f 82 05 00 00 00    	jb     2ec0 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x120>
    2ebb:	eb 93                	jmp    2e50 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0xb0>
    2ebd:	66 66 90             	data16 xchg %ax,%ax
    2ec0:	41 83 fa 21          	cmp    $0x21,%r10d
    2ec4:	0f 82 35 00 00 00    	jb     2eff <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x15f>
    2eca:	c5 fe 6f 08          	vmovdqu (%rax),%ymm1
    2ece:	c5 fe 6f 50 01       	vmovdqu 0x1(%rax),%ymm2
    2ed3:	c5 fd 75 c9          	vpcmpeqw %ymm1,%ymm0,%ymm1
    2ed7:	c5 fd 75 d2          	vpcmpeqw %ymm2,%ymm0,%ymm2
    2edb:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    2edf:	c5 7d d7 c2          	vpmovmskb %ymm2,%r8d
    2ee3:	45 85 db             	test   %r11d,%r11d
    2ee6:	0f 85 fe 00 00 00    	jne    2fea <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x24a>
    2eec:	45 85 c0             	test   %r8d,%r8d
    2eef:	0f 85 bf 00 00 00    	jne    2fb4 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x214>
    2ef5:	41 83 ea 20          	sub    $0x20,%r10d
    2ef9:	48 83 c0 20          	add    $0x20,%rax
    2efd:	eb c1                	jmp    2ec0 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x120>
    2eff:	45 85 d2             	test   %r10d,%r10d
    2f02:	0f 84 0b 01 00 00    	je     3013 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x273>
    2f08:	44 8b d8             	mov    %eax,%r11d
    2f0b:	41 81 e3 ff 0f 00 00 	and    $0xfff,%r11d
    2f12:	41 81 fb df 0f 00 00 	cmp    $0xfdf,%r11d
    2f19:	77 78                	ja     2f93 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x1f3>
    2f1b:	c5 fe 6f 08          	vmovdqu (%rax),%ymm1
    2f1f:	c5 fe 6f 50 01       	vmovdqu 0x1(%rax),%ymm2
    2f24:	c5 fd 75 c9          	vpcmpeqw %ymm1,%ymm0,%ymm1
    2f28:	c5 fd 75 d2          	vpcmpeqw %ymm2,%ymm0,%ymm2
    2f2c:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    2f30:	c5 7d d7 c2          	vpmovmskb %ymm2,%r8d
    2f34:	45 85 db             	test   %r11d,%r11d
    2f37:	0f 85 1b 00 00 00    	jne    2f58 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x1b8>
    2f3d:	45 85 c0             	test   %r8d,%r8d
    2f40:	0f 85 05 00 00 00    	jne    2f4b <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x1ab>
    2f46:	e9 c8 00 00 00       	jmpq   3013 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x273>
    2f4b:	4d 0f bc c0          	bsf    %r8,%r8
    2f4f:	41 83 c0 01          	add    $0x1,%r8d
    2f53:	45 8b d8             	mov    %r8d,%r11d
    2f56:	eb 21                	jmp    2f79 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x1d9>
    2f58:	4d 0f bc db          	bsf    %r11,%r11
    2f5c:	45 85 c0             	test   %r8d,%r8d
    2f5f:	0f 84 14 00 00 00    	je     2f79 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x1d9>
    2f65:	4d 0f bc c0          	bsf    %r8,%r8
    2f69:	41 83 c0 01          	add    $0x1,%r8d
    2f6d:	45 3b d8             	cmp    %r8d,%r11d
    2f70:	0f 8e 03 00 00 00    	jle    2f79 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x1d9>
    2f76:	45 8b d8             	mov    %r8d,%r11d
    2f79:	49 03 c3             	add    %r11,%rax
    2f7c:	41 ff ca             	dec    %r10d
    2f7f:	45 3b da             	cmp    %r10d,%r11d
    2f82:	0f 8d 8b 00 00 00    	jge    3013 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x273>
    2f88:	41 ff c2             	inc    %r10d
    2f8b:	45 2b d3             	sub    %r11d,%r10d
    2f8e:	e9 8c 00 00 00       	jmpq   301f <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x27f>
    2f93:	41 83 fa 01          	cmp    $0x1,%r10d
    2f97:	0f 8e 76 00 00 00    	jle    3013 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x273>
    2f9d:	44 0f b7 18          	movzwl (%rax),%r11d
    2fa1:	66 44 3b d9          	cmp    %cx,%r11w
    2fa5:	0f 84 74 00 00 00    	je     301f <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x27f>
    2fab:	41 ff ca             	dec    %r10d
    2fae:	48 83 c0 01          	add    $0x1,%rax
    2fb2:	eb df                	jmp    2f93 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x1f3>
    2fb4:	48 83 c0 01          	add    $0x1,%rax
    2fb8:	41 83 ea 01          	sub    $0x1,%r10d
    2fbc:	4d 0f bc c0          	bsf    %r8,%r8
    2fc0:	49 03 c0             	add    %r8,%rax
    2fc3:	45 2b d0             	sub    %r8d,%r10d
    2fc6:	eb 57                	jmp    301f <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x27f>
    2fc8:	48 83 c0 21          	add    $0x21,%rax
    2fcc:	41 83 ea 21          	sub    $0x21,%r10d
    2fd0:	48 0f bc db          	bsf    %rbx,%rbx
    2fd4:	48 03 c3             	add    %rbx,%rax
    2fd7:	44 2b d3             	sub    %ebx,%r10d
    2fda:	eb 43                	jmp    301f <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x27f>
    2fdc:	48 83 c0 20          	add    $0x20,%rax
    2fe0:	41 83 ea 20          	sub    $0x20,%r10d
    2fe4:	45 8b d9             	mov    %r9d,%r11d
    2fe7:	44 8b c3             	mov    %ebx,%r8d
    2fea:	4d 0f bc db          	bsf    %r11,%r11
    2fee:	45 85 c0             	test   %r8d,%r8d
    2ff1:	0f 84 14 00 00 00    	je     300b <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x26b>
    2ff7:	4d 0f bc c0          	bsf    %r8,%r8
    2ffb:	41 83 c0 01          	add    $0x1,%r8d
    2fff:	45 3b d8             	cmp    %r8d,%r11d
    3002:	0f 8e 03 00 00 00    	jle    300b <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x26b>
    3008:	45 8b d8             	mov    %r8d,%r11d
    300b:	49 03 c3             	add    %r11,%rax
    300e:	45 2b d3             	sub    %r11d,%r10d
    3011:	eb 0c                	jmp    301f <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x27f>
    3013:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffffffff,%rax
    301a:	ff ff ff 
    301d:	eb 03                	jmp    3022 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveBytes>+0x282>
    301f:	48 2b c6             	sub    %rsi,%rax
    3022:	c3                   	retq   
	...
    307f:	00 04 00             	add    %al,(%rax,%rax,1)
	...

00000000000030a0 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>>:
    30a0:	44 8b d2             	mov    %edx,%r10d
    30a3:	48 8b c6             	mov    %rsi,%rax
    30a6:	c5 f9 6e c1          	vmovd  %ecx,%xmm0
    30aa:	c4 e2 7d 58 c0       	vpbroadcastd %xmm0,%ymm0
    30af:	44 8b d8             	mov    %eax,%r11d
    30b2:	41 83 fa 41          	cmp    $0x41,%r10d
    30b6:	0f 82 f4 00 00 00    	jb     31b0 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x110>
    30bc:	41 83 e3 3f          	and    $0x3f,%r11d
    30c0:	0f 84 7a 00 00 00    	je     3140 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0xa0>
    30c6:	c5 fe 6f 08          	vmovdqu (%rax),%ymm1
    30ca:	c5 fe 6f 50 02       	vmovdqu 0x2(%rax),%ymm2
    30cf:	c5 fe 6f 58 20       	vmovdqu 0x20(%rax),%ymm3
    30d4:	c5 fe 6f 60 22       	vmovdqu 0x22(%rax),%ymm4
    30d9:	c5 fd 76 c9          	vpcmpeqd %ymm1,%ymm0,%ymm1
    30dd:	c5 fd 76 d2          	vpcmpeqd %ymm2,%ymm0,%ymm2
    30e1:	c5 fd 76 db          	vpcmpeqd %ymm3,%ymm0,%ymm3
    30e5:	c5 fd 76 e4          	vpcmpeqd %ymm4,%ymm0,%ymm4
    30e9:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    30ed:	c5 7d d7 c2          	vpmovmskb %ymm2,%r8d
    30f1:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    30f5:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    30f9:	45 85 db             	test   %r11d,%r11d
    30fc:	0f 85 e1 01 00 00    	jne    32e3 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x243>
    3102:	45 85 c0             	test   %r8d,%r8d
    3105:	0f 85 9b 01 00 00    	jne    32a6 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x206>
    310b:	45 85 c9             	test   %r9d,%r9d
    310e:	0f 85 c1 01 00 00    	jne    32d5 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x235>
    3114:	85 db                	test   %ebx,%ebx
    3116:	0f 85 a2 01 00 00    	jne    32be <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x21e>
    311c:	44 8b d8             	mov    %eax,%r11d
    311f:	48 83 c0 40          	add    $0x40,%rax
    3123:	41 83 ea 20          	sub    $0x20,%r10d
    3127:	41 83 e3 3f          	and    $0x3f,%r11d
    312b:	41 c1 eb 01          	shr    $0x1,%r11d
    312f:	48 83 e0 c0          	and    $0xffffffffffffffc0,%rax
    3133:	45 03 d3             	add    %r11d,%r10d
    3136:	41 83 fa 41          	cmp    $0x41,%r10d
    313a:	0f 82 70 00 00 00    	jb     31b0 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x110>
    3140:	c5 fe 6f 08          	vmovdqu (%rax),%ymm1
    3144:	c5 fe 6f 50 02       	vmovdqu 0x2(%rax),%ymm2
    3149:	c5 fe 6f 58 20       	vmovdqu 0x20(%rax),%ymm3
    314e:	c5 fe 6f 60 22       	vmovdqu 0x22(%rax),%ymm4
    3153:	c5 fd 76 c9          	vpcmpeqd %ymm1,%ymm0,%ymm1
    3157:	c5 fd 76 d2          	vpcmpeqd %ymm2,%ymm0,%ymm2
    315b:	c5 fd 76 db          	vpcmpeqd %ymm3,%ymm0,%ymm3
    315f:	c5 fd 76 e4          	vpcmpeqd %ymm4,%ymm0,%ymm4
    3163:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    3167:	c5 7d d7 c2          	vpmovmskb %ymm2,%r8d
    316b:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    316f:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    3173:	45 85 db             	test   %r11d,%r11d
    3176:	0f 85 67 01 00 00    	jne    32e3 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x243>
    317c:	45 85 c0             	test   %r8d,%r8d
    317f:	0f 85 21 01 00 00    	jne    32a6 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x206>
    3185:	45 85 c9             	test   %r9d,%r9d
    3188:	0f 85 47 01 00 00    	jne    32d5 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x235>
    318e:	85 db                	test   %ebx,%ebx
    3190:	0f 85 28 01 00 00    	jne    32be <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x21e>
    3196:	41 83 ea 20          	sub    $0x20,%r10d
    319a:	48 83 c0 40          	add    $0x40,%rax
    319e:	41 83 fa 41          	cmp    $0x41,%r10d
    31a2:	0f 82 08 00 00 00    	jb     31b0 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x110>
    31a8:	eb 96                	jmp    3140 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0xa0>
    31aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    31b0:	41 83 fa 11          	cmp    $0x11,%r10d
    31b4:	0f 82 35 00 00 00    	jb     31ef <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x14f>
    31ba:	c5 fe 6f 08          	vmovdqu (%rax),%ymm1
    31be:	c5 fe 6f 50 02       	vmovdqu 0x2(%rax),%ymm2
    31c3:	c5 fd 76 c9          	vpcmpeqd %ymm1,%ymm0,%ymm1
    31c7:	c5 fd 76 d2          	vpcmpeqd %ymm2,%ymm0,%ymm2
    31cb:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    31cf:	c5 7d d7 c2          	vpmovmskb %ymm2,%r8d
    31d3:	45 85 db             	test   %r11d,%r11d
    31d6:	0f 85 07 01 00 00    	jne    32e3 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x243>
    31dc:	45 85 c0             	test   %r8d,%r8d
    31df:	0f 85 c1 00 00 00    	jne    32a6 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x206>
    31e5:	41 83 ea 10          	sub    $0x10,%r10d
    31e9:	48 83 c0 20          	add    $0x20,%rax
    31ed:	eb c1                	jmp    31b0 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x110>
    31ef:	45 85 d2             	test   %r10d,%r10d
    31f2:	0f 84 18 01 00 00    	je     3310 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x270>
    31f8:	44 8b d8             	mov    %eax,%r11d
    31fb:	41 81 e3 ff 0f 00 00 	and    $0xfff,%r11d
    3202:	41 81 fb de 0f 00 00 	cmp    $0xfde,%r11d
    3209:	77 7c                	ja     3287 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x1e7>
    320b:	c5 fe 6f 08          	vmovdqu (%rax),%ymm1
    320f:	c5 fe 6f 50 02       	vmovdqu 0x2(%rax),%ymm2
    3214:	c5 fd 76 c9          	vpcmpeqd %ymm1,%ymm0,%ymm1
    3218:	c5 fd 76 d2          	vpcmpeqd %ymm2,%ymm0,%ymm2
    321c:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    3220:	c5 7d d7 c2          	vpmovmskb %ymm2,%r8d
    3224:	45 85 db             	test   %r11d,%r11d
    3227:	0f 85 1b 00 00 00    	jne    3248 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x1a8>
    322d:	45 85 c0             	test   %r8d,%r8d
    3230:	0f 85 05 00 00 00    	jne    323b <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x19b>
    3236:	e9 d5 00 00 00       	jmpq   3310 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x270>
    323b:	4d 0f bc c0          	bsf    %r8,%r8
    323f:	41 83 c0 02          	add    $0x2,%r8d
    3243:	45 8b d8             	mov    %r8d,%r11d
    3246:	eb 21                	jmp    3269 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x1c9>
    3248:	4d 0f bc db          	bsf    %r11,%r11
    324c:	45 85 c0             	test   %r8d,%r8d
    324f:	0f 84 14 00 00 00    	je     3269 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x1c9>
    3255:	4d 0f bc c0          	bsf    %r8,%r8
    3259:	41 83 c0 02          	add    $0x2,%r8d
    325d:	45 3b d8             	cmp    %r8d,%r11d
    3260:	0f 8e 03 00 00 00    	jle    3269 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x1c9>
    3266:	45 8b d8             	mov    %r8d,%r11d
    3269:	49 03 c3             	add    %r11,%rax
    326c:	41 c1 eb 01          	shr    $0x1,%r11d
    3270:	41 ff ca             	dec    %r10d
    3273:	45 3b da             	cmp    %r10d,%r11d
    3276:	0f 8d 94 00 00 00    	jge    3310 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x270>
    327c:	41 ff c2             	inc    %r10d
    327f:	45 2b d3             	sub    %r11d,%r10d
    3282:	e9 95 00 00 00       	jmpq   331c <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x27c>
    3287:	41 83 fa 01          	cmp    $0x1,%r10d
    328b:	0f 8e 7f 00 00 00    	jle    3310 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x270>
    3291:	44 8b 18             	mov    (%rax),%r11d
    3294:	44 3b d9             	cmp    %ecx,%r11d
    3297:	0f 84 7f 00 00 00    	je     331c <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x27c>
    329d:	41 ff ca             	dec    %r10d
    32a0:	48 83 c0 02          	add    $0x2,%rax
    32a4:	eb e1                	jmp    3287 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x1e7>
    32a6:	48 83 c0 02          	add    $0x2,%rax
    32aa:	41 83 ea 01          	sub    $0x1,%r10d
    32ae:	4d 0f bc c0          	bsf    %r8,%r8
    32b2:	49 03 c0             	add    %r8,%rax
    32b5:	41 c1 e8 01          	shr    $0x1,%r8d
    32b9:	45 2b d0             	sub    %r8d,%r10d
    32bc:	eb 5e                	jmp    331c <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x27c>
    32be:	48 83 c0 22          	add    $0x22,%rax
    32c2:	41 83 ea 11          	sub    $0x11,%r10d
    32c6:	48 0f bc db          	bsf    %rbx,%rbx
    32ca:	48 03 c3             	add    %rbx,%rax
    32cd:	c1 eb 01             	shr    $0x1,%ebx
    32d0:	44 2b d3             	sub    %ebx,%r10d
    32d3:	eb 47                	jmp    331c <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x27c>
    32d5:	48 83 c0 20          	add    $0x20,%rax
    32d9:	41 83 ea 10          	sub    $0x10,%r10d
    32dd:	45 8b d9             	mov    %r9d,%r11d
    32e0:	44 8b c3             	mov    %ebx,%r8d
    32e3:	4d 0f bc db          	bsf    %r11,%r11
    32e7:	45 85 c0             	test   %r8d,%r8d
    32ea:	0f 84 14 00 00 00    	je     3304 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x264>
    32f0:	4d 0f bc c0          	bsf    %r8,%r8
    32f4:	41 83 c0 02          	add    $0x2,%r8d
    32f8:	45 3b d8             	cmp    %r8d,%r11d
    32fb:	0f 8e 03 00 00 00    	jle    3304 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x264>
    3301:	45 8b d8             	mov    %r8d,%r11d
    3304:	49 03 c3             	add    %r11,%rax
    3307:	41 c1 eb 01          	shr    $0x1,%r11d
    330b:	45 2b d3             	sub    %r11d,%r10d
    330e:	eb 0c                	jmp    331c <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x27c>
    3310:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffffffff,%rax
    3317:	ff ff ff 
    331a:	eb 06                	jmp    3322 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x282>
    331c:	48 2b c6             	sub    %rsi,%rax
    331f:	48 d1 e8             	shr    %rax
    3322:	c3                   	retq   
	...
    337f:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 3385 <Stub<AMD64ArrayIndexOfStub.indexOfTwoConsecutiveChars>+0x2e5>
	...

00000000000033a0 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>>:
    33a0:	44 8b d2             	mov    %edx,%r10d
    33a3:	48 8b c6             	mov    %rsi,%rax
    33a6:	c5 f9 6e c1          	vmovd  %ecx,%xmm0
    33aa:	c4 e2 7d 78 c0       	vpbroadcastb %xmm0,%ymm0
    33af:	44 8b d8             	mov    %eax,%r11d
    33b2:	41 81 fa 80 00 00 00 	cmp    $0x80,%r10d
    33b9:	0f 82 11 01 00 00    	jb     34d0 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x130>
    33bf:	41 83 e3 7f          	and    $0x7f,%r11d
    33c3:	0f 84 87 00 00 00    	je     3450 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0xb0>
    33c9:	c5 fe 6f 08          	vmovdqu (%rax),%ymm1
    33cd:	c5 fe 6f 50 20       	vmovdqu 0x20(%rax),%ymm2
    33d2:	c5 fe 6f 58 40       	vmovdqu 0x40(%rax),%ymm3
    33d7:	c5 fe 6f 60 60       	vmovdqu 0x60(%rax),%ymm4
    33dc:	c5 fd 74 c9          	vpcmpeqb %ymm1,%ymm0,%ymm1
    33e0:	c5 fd 74 d2          	vpcmpeqb %ymm2,%ymm0,%ymm2
    33e4:	c5 fd 74 db          	vpcmpeqb %ymm3,%ymm0,%ymm3
    33e8:	c5 fd 74 e4          	vpcmpeqb %ymm4,%ymm0,%ymm4
    33ec:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    33f0:	c5 7d d7 c2          	vpmovmskb %ymm2,%r8d
    33f4:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    33f8:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    33fc:	45 85 db             	test   %r11d,%r11d
    33ff:	0f 85 9e 01 00 00    	jne    35a3 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x203>
    3405:	45 85 c0             	test   %r8d,%r8d
    3408:	0f 85 59 01 00 00    	jne    3567 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x1c7>
    340e:	45 85 c9             	test   %r9d,%r9d
    3411:	0f 85 64 01 00 00    	jne    357b <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x1db>
    3417:	85 db                	test   %ebx,%ebx
    3419:	0f 85 70 01 00 00    	jne    358f <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x1ef>
    341f:	44 8b d8             	mov    %eax,%r11d
    3422:	48 81 c0 80 00 00 00 	add    $0x80,%rax
    3429:	41 81 ea 80 00 00 00 	sub    $0x80,%r10d
    3430:	41 83 e3 7f          	and    $0x7f,%r11d
    3434:	48 83 e0 80          	and    $0xffffffffffffff80,%rax
    3438:	45 03 d3             	add    %r11d,%r10d
    343b:	41 81 fa 80 00 00 00 	cmp    $0x80,%r10d
    3442:	0f 82 88 00 00 00    	jb     34d0 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x130>
    3448:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    344f:	00 
    3450:	c5 fd 6f 08          	vmovdqa (%rax),%ymm1
    3454:	c5 fd 6f 50 20       	vmovdqa 0x20(%rax),%ymm2
    3459:	c5 fd 6f 58 40       	vmovdqa 0x40(%rax),%ymm3
    345e:	c5 fd 6f 60 60       	vmovdqa 0x60(%rax),%ymm4
    3463:	c5 fd 74 c9          	vpcmpeqb %ymm1,%ymm0,%ymm1
    3467:	c5 fd 74 d2          	vpcmpeqb %ymm2,%ymm0,%ymm2
    346b:	c5 fd 74 db          	vpcmpeqb %ymm3,%ymm0,%ymm3
    346f:	c5 fd 74 e4          	vpcmpeqb %ymm4,%ymm0,%ymm4
    3473:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    3477:	c5 7d d7 c2          	vpmovmskb %ymm2,%r8d
    347b:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    347f:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    3483:	45 85 db             	test   %r11d,%r11d
    3486:	0f 85 17 01 00 00    	jne    35a3 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x203>
    348c:	45 85 c0             	test   %r8d,%r8d
    348f:	0f 85 d2 00 00 00    	jne    3567 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x1c7>
    3495:	45 85 c9             	test   %r9d,%r9d
    3498:	0f 85 dd 00 00 00    	jne    357b <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x1db>
    349e:	85 db                	test   %ebx,%ebx
    34a0:	0f 85 e9 00 00 00    	jne    358f <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x1ef>
    34a6:	41 81 ea 80 00 00 00 	sub    $0x80,%r10d
    34ad:	48 81 c0 80 00 00 00 	add    $0x80,%rax
    34b4:	41 81 fa 80 00 00 00 	cmp    $0x80,%r10d
    34bb:	0f 82 0f 00 00 00    	jb     34d0 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x130>
    34c1:	eb 8d                	jmp    3450 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0xb0>
    34c3:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    34ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    34d0:	41 83 fa 20          	cmp    $0x20,%r10d
    34d4:	0f 82 1f 00 00 00    	jb     34f9 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x159>
    34da:	c5 fe 6f 08          	vmovdqu (%rax),%ymm1
    34de:	c5 fd 74 c9          	vpcmpeqb %ymm1,%ymm0,%ymm1
    34e2:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    34e6:	45 85 db             	test   %r11d,%r11d
    34e9:	0f 85 b4 00 00 00    	jne    35a3 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x203>
    34ef:	41 83 ea 20          	sub    $0x20,%r10d
    34f3:	48 83 c0 20          	add    $0x20,%rax
    34f7:	eb d7                	jmp    34d0 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x130>
    34f9:	45 85 d2             	test   %r10d,%r10d
    34fc:	0f 84 ad 00 00 00    	je     35af <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x20f>
    3502:	44 8b d8             	mov    %eax,%r11d
    3505:	41 81 e3 ff 0f 00 00 	and    $0xfff,%r11d
    350c:	41 81 fb e0 0f 00 00 	cmp    $0xfe0,%r11d
    3513:	77 32                	ja     3547 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x1a7>
    3515:	c5 fe 6f 08          	vmovdqu (%rax),%ymm1
    3519:	c5 fd 74 c9          	vpcmpeqb %ymm1,%ymm0,%ymm1
    351d:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    3521:	45 85 db             	test   %r11d,%r11d
    3524:	0f 85 05 00 00 00    	jne    352f <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x18f>
    352a:	e9 80 00 00 00       	jmpq   35af <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x20f>
    352f:	4d 0f bc db          	bsf    %r11,%r11
    3533:	49 03 c3             	add    %r11,%rax
    3536:	45 3b da             	cmp    %r10d,%r11d
    3539:	0f 8d 70 00 00 00    	jge    35af <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x20f>
    353f:	45 2b d3             	sub    %r11d,%r10d
    3542:	e9 74 00 00 00       	jmpq   35bb <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x21b>
    3547:	41 83 fa 00          	cmp    $0x0,%r10d
    354b:	0f 8e 5e 00 00 00    	jle    35af <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x20f>
    3551:	44 0f b6 18          	movzbl (%rax),%r11d
    3555:	44 3a d9             	cmp    %cl,%r11b
    3558:	0f 84 5d 00 00 00    	je     35bb <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x21b>
    355e:	41 ff ca             	dec    %r10d
    3561:	48 83 c0 01          	add    $0x1,%rax
    3565:	eb e0                	jmp    3547 <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x1a7>
    3567:	48 83 c0 20          	add    $0x20,%rax
    356b:	41 83 ea 20          	sub    $0x20,%r10d
    356f:	4d 0f bc c0          	bsf    %r8,%r8
    3573:	49 03 c0             	add    %r8,%rax
    3576:	45 2b d0             	sub    %r8d,%r10d
    3579:	eb 40                	jmp    35bb <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x21b>
    357b:	48 83 c0 40          	add    $0x40,%rax
    357f:	41 83 ea 40          	sub    $0x40,%r10d
    3583:	4d 0f bc c9          	bsf    %r9,%r9
    3587:	49 03 c1             	add    %r9,%rax
    358a:	45 2b d1             	sub    %r9d,%r10d
    358d:	eb 2c                	jmp    35bb <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x21b>
    358f:	48 83 c0 60          	add    $0x60,%rax
    3593:	41 83 ea 60          	sub    $0x60,%r10d
    3597:	48 0f bc db          	bsf    %rbx,%rbx
    359b:	48 03 c3             	add    %rbx,%rax
    359e:	44 2b d3             	sub    %ebx,%r10d
    35a1:	eb 18                	jmp    35bb <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x21b>
    35a3:	4d 0f bc db          	bsf    %r11,%r11
    35a7:	49 03 c3             	add    %r11,%rax
    35aa:	45 2b d3             	sub    %r11d,%r10d
    35ad:	eb 0c                	jmp    35bb <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x21b>
    35af:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffffffff,%rax
    35b6:	ff ff ff 
    35b9:	eb 03                	jmp    35be <Stub<AMD64ArrayIndexOfStub.indexOf1Byte>+0x21e>
    35bb:	48 2b c6             	sub    %rsi,%rax
    35be:	c3                   	retq   
	...
    35ff:	00 06                	add    %al,(%rsi)
	...

0000000000003620 <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>>:
    3620:	44 8b d2             	mov    %edx,%r10d
    3623:	48 8b c6             	mov    %rsi,%rax
    3626:	c5 f9 6e c1          	vmovd  %ecx,%xmm0
    362a:	c4 c1 79 6e c8       	vmovd  %r8d,%xmm1
    362f:	c4 e2 7d 78 c0       	vpbroadcastb %xmm0,%ymm0
    3634:	c4 e2 7d 78 c9       	vpbroadcastb %xmm1,%ymm1
    3639:	44 8b d8             	mov    %eax,%r11d
    363c:	41 83 fa 40          	cmp    $0x40,%r10d
    3640:	0f 82 da 00 00 00    	jb     3720 <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x100>
    3646:	41 83 e3 3f          	and    $0x3f,%r11d
    364a:	0f 84 70 00 00 00    	je     36c0 <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0xa0>
    3650:	c5 fe 6f 10          	vmovdqu (%rax),%ymm2
    3654:	c5 fe 6f 58 20       	vmovdqu 0x20(%rax),%ymm3
    3659:	c5 fe 6f 20          	vmovdqu (%rax),%ymm4
    365d:	c5 fe 6f 68 20       	vmovdqu 0x20(%rax),%ymm5
    3662:	c5 fd 74 d2          	vpcmpeqb %ymm2,%ymm0,%ymm2
    3666:	c5 fd 74 db          	vpcmpeqb %ymm3,%ymm0,%ymm3
    366a:	c5 f5 74 e4          	vpcmpeqb %ymm4,%ymm1,%ymm4
    366e:	c5 f5 74 ed          	vpcmpeqb %ymm5,%ymm1,%ymm5
    3672:	c5 7d d7 da          	vpmovmskb %ymm2,%r11d
    3676:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    367a:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    367e:	c5 fd d7 fd          	vpmovmskb %ymm5,%edi
    3682:	44 0b db             	or     %ebx,%r11d
    3685:	44 0b cf             	or     %edi,%r9d
    3688:	45 85 db             	test   %r11d,%r11d
    368b:	0f 85 61 01 00 00    	jne    37f2 <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1d2>
    3691:	45 85 c9             	test   %r9d,%r9d
    3694:	0f 85 44 01 00 00    	jne    37de <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1be>
    369a:	44 8b d8             	mov    %eax,%r11d
    369d:	48 83 c0 40          	add    $0x40,%rax
    36a1:	41 83 ea 40          	sub    $0x40,%r10d
    36a5:	41 83 e3 3f          	and    $0x3f,%r11d
    36a9:	48 83 e0 c0          	and    $0xffffffffffffffc0,%rax
    36ad:	45 03 d3             	add    %r11d,%r10d
    36b0:	41 83 fa 40          	cmp    $0x40,%r10d
    36b4:	0f 82 66 00 00 00    	jb     3720 <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x100>
    36ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    36c0:	c5 fd 6f 10          	vmovdqa (%rax),%ymm2
    36c4:	c5 fd 6f 58 20       	vmovdqa 0x20(%rax),%ymm3
    36c9:	c5 fd 6f 20          	vmovdqa (%rax),%ymm4
    36cd:	c5 fd 6f 68 20       	vmovdqa 0x20(%rax),%ymm5
    36d2:	c5 fd 74 d2          	vpcmpeqb %ymm2,%ymm0,%ymm2
    36d6:	c5 fd 74 db          	vpcmpeqb %ymm3,%ymm0,%ymm3
    36da:	c5 f5 74 e4          	vpcmpeqb %ymm4,%ymm1,%ymm4
    36de:	c5 f5 74 ed          	vpcmpeqb %ymm5,%ymm1,%ymm5
    36e2:	c5 7d d7 da          	vpmovmskb %ymm2,%r11d
    36e6:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    36ea:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    36ee:	c5 fd d7 fd          	vpmovmskb %ymm5,%edi
    36f2:	44 0b db             	or     %ebx,%r11d
    36f5:	44 0b cf             	or     %edi,%r9d
    36f8:	45 85 db             	test   %r11d,%r11d
    36fb:	0f 85 f1 00 00 00    	jne    37f2 <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1d2>
    3701:	45 85 c9             	test   %r9d,%r9d
    3704:	0f 85 d4 00 00 00    	jne    37de <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1be>
    370a:	41 83 ea 40          	sub    $0x40,%r10d
    370e:	48 83 c0 40          	add    $0x40,%rax
    3712:	41 83 fa 40          	cmp    $0x40,%r10d
    3716:	0f 82 04 00 00 00    	jb     3720 <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x100>
    371c:	eb a2                	jmp    36c0 <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0xa0>
    371e:	66 90                	xchg   %ax,%ax
    3720:	41 83 fa 20          	cmp    $0x20,%r10d
    3724:	0f 82 2e 00 00 00    	jb     3758 <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x138>
    372a:	c5 fe 6f 10          	vmovdqu (%rax),%ymm2
    372e:	c5 fe 6f 18          	vmovdqu (%rax),%ymm3
    3732:	c5 fd 74 d2          	vpcmpeqb %ymm2,%ymm0,%ymm2
    3736:	c5 f5 74 db          	vpcmpeqb %ymm3,%ymm1,%ymm3
    373a:	c5 7d d7 da          	vpmovmskb %ymm2,%r11d
    373e:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    3742:	45 0b d9             	or     %r9d,%r11d
    3745:	45 85 db             	test   %r11d,%r11d
    3748:	0f 85 a4 00 00 00    	jne    37f2 <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1d2>
    374e:	41 83 ea 20          	sub    $0x20,%r10d
    3752:	48 83 c0 20          	add    $0x20,%rax
    3756:	eb c8                	jmp    3720 <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x100>
    3758:	45 85 d2             	test   %r10d,%r10d
    375b:	0f 84 9d 00 00 00    	je     37fe <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1de>
    3761:	44 8b d8             	mov    %eax,%r11d
    3764:	41 81 e3 ff 0f 00 00 	and    $0xfff,%r11d
    376b:	41 81 fb e0 0f 00 00 	cmp    $0xfe0,%r11d
    3772:	77 41                	ja     37b5 <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x195>
    3774:	c5 fe 6f 10          	vmovdqu (%rax),%ymm2
    3778:	c5 fe 6f 18          	vmovdqu (%rax),%ymm3
    377c:	c5 fd 74 d2          	vpcmpeqb %ymm2,%ymm0,%ymm2
    3780:	c5 f5 74 db          	vpcmpeqb %ymm3,%ymm1,%ymm3
    3784:	c5 7d d7 da          	vpmovmskb %ymm2,%r11d
    3788:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    378c:	45 0b d9             	or     %r9d,%r11d
    378f:	45 85 db             	test   %r11d,%r11d
    3792:	0f 85 05 00 00 00    	jne    379d <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x17d>
    3798:	e9 61 00 00 00       	jmpq   37fe <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1de>
    379d:	4d 0f bc db          	bsf    %r11,%r11
    37a1:	49 03 c3             	add    %r11,%rax
    37a4:	45 3b da             	cmp    %r10d,%r11d
    37a7:	0f 8d 51 00 00 00    	jge    37fe <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1de>
    37ad:	45 2b d3             	sub    %r11d,%r10d
    37b0:	e9 55 00 00 00       	jmpq   380a <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1ea>
    37b5:	41 83 fa 00          	cmp    $0x0,%r10d
    37b9:	0f 8e 3f 00 00 00    	jle    37fe <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1de>
    37bf:	44 0f b6 18          	movzbl (%rax),%r11d
    37c3:	44 3a d9             	cmp    %cl,%r11b
    37c6:	0f 84 3e 00 00 00    	je     380a <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1ea>
    37cc:	45 3a d8             	cmp    %r8b,%r11b
    37cf:	0f 84 35 00 00 00    	je     380a <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1ea>
    37d5:	41 ff ca             	dec    %r10d
    37d8:	48 83 c0 01          	add    $0x1,%rax
    37dc:	eb d7                	jmp    37b5 <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x195>
    37de:	48 83 c0 20          	add    $0x20,%rax
    37e2:	41 83 ea 20          	sub    $0x20,%r10d
    37e6:	4d 0f bc c9          	bsf    %r9,%r9
    37ea:	49 03 c1             	add    %r9,%rax
    37ed:	45 2b d1             	sub    %r9d,%r10d
    37f0:	eb 18                	jmp    380a <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1ea>
    37f2:	4d 0f bc db          	bsf    %r11,%r11
    37f6:	49 03 c3             	add    %r11,%rax
    37f9:	45 2b d3             	sub    %r11d,%r10d
    37fc:	eb 0c                	jmp    380a <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1ea>
    37fe:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffffffff,%rax
    3805:	ff ff ff 
    3808:	eb 03                	jmp    380d <Stub<AMD64ArrayIndexOfStub.indexOf2Bytes>+0x1ed>
    380a:	48 2b c6             	sub    %rsi,%rax
    380d:	c3                   	retq   
	...
    387e:	00 00                	add    %al,(%rax)
    3880:	07                   	(bad)  
	...

00000000000038a0 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>>:
    38a0:	44 8b d2             	mov    %edx,%r10d
    38a3:	48 8b c6             	mov    %rsi,%rax
    38a6:	c5 f9 6e c1          	vmovd  %ecx,%xmm0
    38aa:	c4 c1 79 6e c8       	vmovd  %r8d,%xmm1
    38af:	c4 c1 79 6e d1       	vmovd  %r9d,%xmm2
    38b4:	c4 e2 7d 78 c0       	vpbroadcastb %xmm0,%ymm0
    38b9:	c4 e2 7d 78 c9       	vpbroadcastb %xmm1,%ymm1
    38be:	c4 e2 7d 78 d2       	vpbroadcastb %xmm2,%ymm2
    38c3:	44 8b d8             	mov    %eax,%r11d
    38c6:	41 83 fa 20          	cmp    $0x20,%r10d
    38ca:	0f 82 a7 00 00 00    	jb     3977 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0xd7>
    38d0:	41 83 e3 1f          	and    $0x1f,%r11d
    38d4:	0f 84 56 00 00 00    	je     3930 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x90>
    38da:	c5 fe 6f 18          	vmovdqu (%rax),%ymm3
    38de:	c5 fe 6f 20          	vmovdqu (%rax),%ymm4
    38e2:	c5 fe 6f 28          	vmovdqu (%rax),%ymm5
    38e6:	c5 fd 74 db          	vpcmpeqb %ymm3,%ymm0,%ymm3
    38ea:	c5 f5 74 e4          	vpcmpeqb %ymm4,%ymm1,%ymm4
    38ee:	c5 ed 74 ed          	vpcmpeqb %ymm5,%ymm2,%ymm5
    38f2:	c5 7d d7 db          	vpmovmskb %ymm3,%r11d
    38f6:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    38fa:	c5 fd d7 fd          	vpmovmskb %ymm5,%edi
    38fe:	44 0b db             	or     %ebx,%r11d
    3901:	44 0b df             	or     %edi,%r11d
    3904:	45 85 db             	test   %r11d,%r11d
    3907:	0f 85 08 01 00 00    	jne    3a15 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x175>
    390d:	44 8b d8             	mov    %eax,%r11d
    3910:	48 83 c0 20          	add    $0x20,%rax
    3914:	41 83 ea 20          	sub    $0x20,%r10d
    3918:	41 83 e3 1f          	and    $0x1f,%r11d
    391c:	48 83 e0 e0          	and    $0xffffffffffffffe0,%rax
    3920:	45 03 d3             	add    %r11d,%r10d
    3923:	41 83 fa 20          	cmp    $0x20,%r10d
    3927:	0f 82 4a 00 00 00    	jb     3977 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0xd7>
    392d:	66 66 90             	data16 xchg %ax,%ax
    3930:	c5 fd 6f 18          	vmovdqa (%rax),%ymm3
    3934:	c5 fd 6f 20          	vmovdqa (%rax),%ymm4
    3938:	c5 fd 6f 28          	vmovdqa (%rax),%ymm5
    393c:	c5 fd 74 db          	vpcmpeqb %ymm3,%ymm0,%ymm3
    3940:	c5 f5 74 e4          	vpcmpeqb %ymm4,%ymm1,%ymm4
    3944:	c5 ed 74 ed          	vpcmpeqb %ymm5,%ymm2,%ymm5
    3948:	c5 7d d7 db          	vpmovmskb %ymm3,%r11d
    394c:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    3950:	c5 fd d7 fd          	vpmovmskb %ymm5,%edi
    3954:	44 0b db             	or     %ebx,%r11d
    3957:	44 0b df             	or     %edi,%r11d
    395a:	45 85 db             	test   %r11d,%r11d
    395d:	0f 85 b2 00 00 00    	jne    3a15 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x175>
    3963:	41 83 ea 20          	sub    $0x20,%r10d
    3967:	48 83 c0 20          	add    $0x20,%rax
    396b:	41 83 fa 20          	cmp    $0x20,%r10d
    396f:	0f 82 02 00 00 00    	jb     3977 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0xd7>
    3975:	eb b9                	jmp    3930 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x90>
    3977:	45 85 d2             	test   %r10d,%r10d
    397a:	0f 84 a1 00 00 00    	je     3a21 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x181>
    3980:	44 8b d8             	mov    %eax,%r11d
    3983:	41 81 e3 ff 0f 00 00 	and    $0xfff,%r11d
    398a:	41 81 fb e0 0f 00 00 	cmp    $0xfe0,%r11d
    3991:	77 50                	ja     39e3 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x143>
    3993:	c5 fe 6f 18          	vmovdqu (%rax),%ymm3
    3997:	c5 fe 6f 20          	vmovdqu (%rax),%ymm4
    399b:	c5 fe 6f 28          	vmovdqu (%rax),%ymm5
    399f:	c5 fd 74 db          	vpcmpeqb %ymm3,%ymm0,%ymm3
    39a3:	c5 f5 74 e4          	vpcmpeqb %ymm4,%ymm1,%ymm4
    39a7:	c5 ed 74 ed          	vpcmpeqb %ymm5,%ymm2,%ymm5
    39ab:	c5 7d d7 db          	vpmovmskb %ymm3,%r11d
    39af:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    39b3:	c5 fd d7 fd          	vpmovmskb %ymm5,%edi
    39b7:	44 0b db             	or     %ebx,%r11d
    39ba:	44 0b df             	or     %edi,%r11d
    39bd:	45 85 db             	test   %r11d,%r11d
    39c0:	0f 85 05 00 00 00    	jne    39cb <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x12b>
    39c6:	e9 56 00 00 00       	jmpq   3a21 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x181>
    39cb:	4d 0f bc db          	bsf    %r11,%r11
    39cf:	49 03 c3             	add    %r11,%rax
    39d2:	45 3b da             	cmp    %r10d,%r11d
    39d5:	0f 8d 46 00 00 00    	jge    3a21 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x181>
    39db:	45 2b d3             	sub    %r11d,%r10d
    39de:	e9 4a 00 00 00       	jmpq   3a2d <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x18d>
    39e3:	41 83 fa 00          	cmp    $0x0,%r10d
    39e7:	0f 8e 34 00 00 00    	jle    3a21 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x181>
    39ed:	44 0f b6 18          	movzbl (%rax),%r11d
    39f1:	44 3a d9             	cmp    %cl,%r11b
    39f4:	0f 84 33 00 00 00    	je     3a2d <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x18d>
    39fa:	45 3a d8             	cmp    %r8b,%r11b
    39fd:	0f 84 2a 00 00 00    	je     3a2d <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x18d>
    3a03:	45 3a d9             	cmp    %r9b,%r11b
    3a06:	0f 84 21 00 00 00    	je     3a2d <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x18d>
    3a0c:	41 ff ca             	dec    %r10d
    3a0f:	48 83 c0 01          	add    $0x1,%rax
    3a13:	eb ce                	jmp    39e3 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x143>
    3a15:	4d 0f bc db          	bsf    %r11,%r11
    3a19:	49 03 c3             	add    %r11,%rax
    3a1c:	45 2b d3             	sub    %r11d,%r10d
    3a1f:	eb 0c                	jmp    3a2d <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x18d>
    3a21:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffffffff,%rax
    3a28:	ff ff ff 
    3a2b:	eb 03                	jmp    3a30 <Stub<AMD64ArrayIndexOfStub.indexOf3Bytes>+0x190>
    3a2d:	48 2b c6             	sub    %rsi,%rax
    3a30:	c3                   	retq   
	...
    3a7d:	00 00                	add    %al,(%rax)
    3a7f:	00 08                	add    %cl,(%rax)
	...

0000000000003aa0 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>>:
    3aa0:	44 8b d2             	mov    %edx,%r10d
    3aa3:	48 8b c6             	mov    %rsi,%rax
    3aa6:	c5 f9 6e c1          	vmovd  %ecx,%xmm0
    3aaa:	c4 c1 79 6e c8       	vmovd  %r8d,%xmm1
    3aaf:	c4 c1 79 6e d1       	vmovd  %r9d,%xmm2
    3ab4:	c5 f9 6e df          	vmovd  %edi,%xmm3
    3ab8:	c4 e2 7d 78 c0       	vpbroadcastb %xmm0,%ymm0
    3abd:	c4 e2 7d 78 c9       	vpbroadcastb %xmm1,%ymm1
    3ac2:	c4 e2 7d 78 d2       	vpbroadcastb %xmm2,%ymm2
    3ac7:	c4 e2 7d 78 db       	vpbroadcastb %xmm3,%ymm3
    3acc:	44 8b d8             	mov    %eax,%r11d
    3acf:	41 83 fa 20          	cmp    $0x20,%r10d
    3ad3:	0f 82 cd 00 00 00    	jb     3ba6 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x106>
    3ad9:	41 83 e3 1f          	and    $0x1f,%r11d
    3add:	0f 84 6d 00 00 00    	je     3b50 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0xb0>
    3ae3:	c5 fe 6f 20          	vmovdqu (%rax),%ymm4
    3ae7:	c5 fe 6f 28          	vmovdqu (%rax),%ymm5
    3aeb:	c5 fe 6f 30          	vmovdqu (%rax),%ymm6
    3aef:	c5 fe 6f 38          	vmovdqu (%rax),%ymm7
    3af3:	c5 fd 74 e4          	vpcmpeqb %ymm4,%ymm0,%ymm4
    3af7:	c5 f5 74 ed          	vpcmpeqb %ymm5,%ymm1,%ymm5
    3afb:	c5 ed 74 f6          	vpcmpeqb %ymm6,%ymm2,%ymm6
    3aff:	c5 e5 74 ff          	vpcmpeqb %ymm7,%ymm3,%ymm7
    3b03:	c5 7d d7 dc          	vpmovmskb %ymm4,%r11d
    3b07:	c5 fd d7 dd          	vpmovmskb %ymm5,%ebx
    3b0b:	c5 fd d7 d6          	vpmovmskb %ymm6,%edx
    3b0f:	c5 7d d7 ef          	vpmovmskb %ymm7,%r13d
    3b13:	44 0b db             	or     %ebx,%r11d
    3b16:	41 0b d5             	or     %r13d,%edx
    3b19:	44 0b da             	or     %edx,%r11d
    3b1c:	45 85 db             	test   %r11d,%r11d
    3b1f:	0f 85 37 01 00 00    	jne    3c5c <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x1bc>
    3b25:	44 8b d8             	mov    %eax,%r11d
    3b28:	48 83 c0 20          	add    $0x20,%rax
    3b2c:	41 83 ea 20          	sub    $0x20,%r10d
    3b30:	41 83 e3 1f          	and    $0x1f,%r11d
    3b34:	48 83 e0 e0          	and    $0xffffffffffffffe0,%rax
    3b38:	45 03 d3             	add    %r11d,%r10d
    3b3b:	41 83 fa 20          	cmp    $0x20,%r10d
    3b3f:	0f 82 61 00 00 00    	jb     3ba6 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x106>
    3b45:	66 66 66 0f 1f 84 00 	data16 data16 nopw 0x0(%rax,%rax,1)
    3b4c:	00 00 00 00 
    3b50:	c5 fd 6f 20          	vmovdqa (%rax),%ymm4
    3b54:	c5 fd 6f 28          	vmovdqa (%rax),%ymm5
    3b58:	c5 fd 6f 30          	vmovdqa (%rax),%ymm6
    3b5c:	c5 fd 6f 38          	vmovdqa (%rax),%ymm7
    3b60:	c5 fd 74 e4          	vpcmpeqb %ymm4,%ymm0,%ymm4
    3b64:	c5 f5 74 ed          	vpcmpeqb %ymm5,%ymm1,%ymm5
    3b68:	c5 ed 74 f6          	vpcmpeqb %ymm6,%ymm2,%ymm6
    3b6c:	c5 e5 74 ff          	vpcmpeqb %ymm7,%ymm3,%ymm7
    3b70:	c5 7d d7 dc          	vpmovmskb %ymm4,%r11d
    3b74:	c5 fd d7 dd          	vpmovmskb %ymm5,%ebx
    3b78:	c5 fd d7 d6          	vpmovmskb %ymm6,%edx
    3b7c:	c5 7d d7 ef          	vpmovmskb %ymm7,%r13d
    3b80:	44 0b db             	or     %ebx,%r11d
    3b83:	41 0b d5             	or     %r13d,%edx
    3b86:	44 0b da             	or     %edx,%r11d
    3b89:	45 85 db             	test   %r11d,%r11d
    3b8c:	0f 85 ca 00 00 00    	jne    3c5c <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x1bc>
    3b92:	41 83 ea 20          	sub    $0x20,%r10d
    3b96:	48 83 c0 20          	add    $0x20,%rax
    3b9a:	41 83 fa 20          	cmp    $0x20,%r10d
    3b9e:	0f 82 02 00 00 00    	jb     3ba6 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x106>
    3ba4:	eb aa                	jmp    3b50 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0xb0>
    3ba6:	45 85 d2             	test   %r10d,%r10d
    3ba9:	0f 84 b9 00 00 00    	je     3c68 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x1c8>
    3baf:	44 8b d8             	mov    %eax,%r11d
    3bb2:	41 81 e3 ff 0f 00 00 	and    $0xfff,%r11d
    3bb9:	41 81 fb e0 0f 00 00 	cmp    $0xfe0,%r11d
    3bc0:	77 5f                	ja     3c21 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x181>
    3bc2:	c5 fe 6f 20          	vmovdqu (%rax),%ymm4
    3bc6:	c5 fe 6f 28          	vmovdqu (%rax),%ymm5
    3bca:	c5 fe 6f 30          	vmovdqu (%rax),%ymm6
    3bce:	c5 fe 6f 38          	vmovdqu (%rax),%ymm7
    3bd2:	c5 fd 74 e4          	vpcmpeqb %ymm4,%ymm0,%ymm4
    3bd6:	c5 f5 74 ed          	vpcmpeqb %ymm5,%ymm1,%ymm5
    3bda:	c5 ed 74 f6          	vpcmpeqb %ymm6,%ymm2,%ymm6
    3bde:	c5 e5 74 ff          	vpcmpeqb %ymm7,%ymm3,%ymm7
    3be2:	c5 7d d7 dc          	vpmovmskb %ymm4,%r11d
    3be6:	c5 fd d7 dd          	vpmovmskb %ymm5,%ebx
    3bea:	c5 fd d7 d6          	vpmovmskb %ymm6,%edx
    3bee:	c5 7d d7 ef          	vpmovmskb %ymm7,%r13d
    3bf2:	44 0b db             	or     %ebx,%r11d
    3bf5:	41 0b d5             	or     %r13d,%edx
    3bf8:	44 0b da             	or     %edx,%r11d
    3bfb:	45 85 db             	test   %r11d,%r11d
    3bfe:	0f 85 05 00 00 00    	jne    3c09 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x169>
    3c04:	e9 5f 00 00 00       	jmpq   3c68 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x1c8>
    3c09:	4d 0f bc db          	bsf    %r11,%r11
    3c0d:	49 03 c3             	add    %r11,%rax
    3c10:	45 3b da             	cmp    %r10d,%r11d
    3c13:	0f 8d 4f 00 00 00    	jge    3c68 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x1c8>
    3c19:	45 2b d3             	sub    %r11d,%r10d
    3c1c:	e9 53 00 00 00       	jmpq   3c74 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x1d4>
    3c21:	41 83 fa 00          	cmp    $0x0,%r10d
    3c25:	0f 8e 3d 00 00 00    	jle    3c68 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x1c8>
    3c2b:	44 0f b6 18          	movzbl (%rax),%r11d
    3c2f:	44 3a d9             	cmp    %cl,%r11b
    3c32:	0f 84 3c 00 00 00    	je     3c74 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x1d4>
    3c38:	45 3a d8             	cmp    %r8b,%r11b
    3c3b:	0f 84 33 00 00 00    	je     3c74 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x1d4>
    3c41:	45 3a d9             	cmp    %r9b,%r11b
    3c44:	0f 84 2a 00 00 00    	je     3c74 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x1d4>
    3c4a:	44 3a df             	cmp    %dil,%r11b
    3c4d:	0f 84 21 00 00 00    	je     3c74 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x1d4>
    3c53:	41 ff ca             	dec    %r10d
    3c56:	48 83 c0 01          	add    $0x1,%rax
    3c5a:	eb c5                	jmp    3c21 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x181>
    3c5c:	4d 0f bc db          	bsf    %r11,%r11
    3c60:	49 03 c3             	add    %r11,%rax
    3c63:	45 2b d3             	sub    %r11d,%r10d
    3c66:	eb 0c                	jmp    3c74 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x1d4>
    3c68:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffffffff,%rax
    3c6f:	ff ff ff 
    3c72:	eb 03                	jmp    3c77 <Stub<AMD64ArrayIndexOfStub.indexOf4Bytes>+0x1d7>
    3c74:	48 2b c6             	sub    %rsi,%rax
    3c77:	c3                   	retq   
	...
    3c80:	09 00                	or     %eax,(%rax)
	...

0000000000003ca0 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>>:
    3ca0:	44 8b d2             	mov    %edx,%r10d
    3ca3:	48 8b c6             	mov    %rsi,%rax
    3ca6:	c5 f9 6e c1          	vmovd  %ecx,%xmm0
    3caa:	c4 e2 7d 79 c0       	vpbroadcastw %xmm0,%ymm0
    3caf:	44 8b d8             	mov    %eax,%r11d
    3cb2:	41 83 fa 40          	cmp    $0x40,%r10d
    3cb6:	0f 82 04 01 00 00    	jb     3dc0 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x120>
    3cbc:	41 83 e3 7f          	and    $0x7f,%r11d
    3cc0:	0f 84 8a 00 00 00    	je     3d50 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0xb0>
    3cc6:	c5 fe 6f 08          	vmovdqu (%rax),%ymm1
    3cca:	c5 fe 6f 50 20       	vmovdqu 0x20(%rax),%ymm2
    3ccf:	c5 fe 6f 58 40       	vmovdqu 0x40(%rax),%ymm3
    3cd4:	c5 fe 6f 60 60       	vmovdqu 0x60(%rax),%ymm4
    3cd9:	c5 fd 75 c9          	vpcmpeqw %ymm1,%ymm0,%ymm1
    3cdd:	c5 fd 75 d2          	vpcmpeqw %ymm2,%ymm0,%ymm2
    3ce1:	c5 fd 75 db          	vpcmpeqw %ymm3,%ymm0,%ymm3
    3ce5:	c5 fd 75 e4          	vpcmpeqw %ymm4,%ymm0,%ymm4
    3ce9:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    3ced:	c5 7d d7 c2          	vpmovmskb %ymm2,%r8d
    3cf1:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    3cf5:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    3cf9:	45 85 db             	test   %r11d,%r11d
    3cfc:	0f 85 a1 01 00 00    	jne    3ea3 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x203>
    3d02:	45 85 c0             	test   %r8d,%r8d
    3d05:	0f 85 51 01 00 00    	jne    3e5c <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x1bc>
    3d0b:	45 85 c9             	test   %r9d,%r9d
    3d0e:	0f 85 60 01 00 00    	jne    3e74 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x1d4>
    3d14:	85 db                	test   %ebx,%ebx
    3d16:	0f 85 70 01 00 00    	jne    3e8c <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x1ec>
    3d1c:	44 8b d8             	mov    %eax,%r11d
    3d1f:	48 81 c0 80 00 00 00 	add    $0x80,%rax
    3d26:	41 83 ea 40          	sub    $0x40,%r10d
    3d2a:	41 83 e3 7f          	and    $0x7f,%r11d
    3d2e:	41 c1 eb 01          	shr    $0x1,%r11d
    3d32:	48 83 e0 80          	and    $0xffffffffffffff80,%rax
    3d36:	45 03 d3             	add    %r11d,%r10d
    3d39:	41 83 fa 40          	cmp    $0x40,%r10d
    3d3d:	0f 82 7d 00 00 00    	jb     3dc0 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x120>
    3d43:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3d4a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3d50:	c5 fd 6f 08          	vmovdqa (%rax),%ymm1
    3d54:	c5 fd 6f 50 20       	vmovdqa 0x20(%rax),%ymm2
    3d59:	c5 fd 6f 58 40       	vmovdqa 0x40(%rax),%ymm3
    3d5e:	c5 fd 6f 60 60       	vmovdqa 0x60(%rax),%ymm4
    3d63:	c5 fd 75 c9          	vpcmpeqw %ymm1,%ymm0,%ymm1
    3d67:	c5 fd 75 d2          	vpcmpeqw %ymm2,%ymm0,%ymm2
    3d6b:	c5 fd 75 db          	vpcmpeqw %ymm3,%ymm0,%ymm3
    3d6f:	c5 fd 75 e4          	vpcmpeqw %ymm4,%ymm0,%ymm4
    3d73:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    3d77:	c5 7d d7 c2          	vpmovmskb %ymm2,%r8d
    3d7b:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    3d7f:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    3d83:	45 85 db             	test   %r11d,%r11d
    3d86:	0f 85 17 01 00 00    	jne    3ea3 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x203>
    3d8c:	45 85 c0             	test   %r8d,%r8d
    3d8f:	0f 85 c7 00 00 00    	jne    3e5c <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x1bc>
    3d95:	45 85 c9             	test   %r9d,%r9d
    3d98:	0f 85 d6 00 00 00    	jne    3e74 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x1d4>
    3d9e:	85 db                	test   %ebx,%ebx
    3da0:	0f 85 e6 00 00 00    	jne    3e8c <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x1ec>
    3da6:	41 83 ea 40          	sub    $0x40,%r10d
    3daa:	48 81 c0 80 00 00 00 	add    $0x80,%rax
    3db1:	41 83 fa 40          	cmp    $0x40,%r10d
    3db5:	0f 82 05 00 00 00    	jb     3dc0 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x120>
    3dbb:	eb 93                	jmp    3d50 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0xb0>
    3dbd:	66 66 90             	data16 xchg %ax,%ax
    3dc0:	41 83 fa 10          	cmp    $0x10,%r10d
    3dc4:	0f 82 1f 00 00 00    	jb     3de9 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x149>
    3dca:	c5 fe 6f 08          	vmovdqu (%rax),%ymm1
    3dce:	c5 fd 75 c9          	vpcmpeqw %ymm1,%ymm0,%ymm1
    3dd2:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    3dd6:	45 85 db             	test   %r11d,%r11d
    3dd9:	0f 85 c4 00 00 00    	jne    3ea3 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x203>
    3ddf:	41 83 ea 10          	sub    $0x10,%r10d
    3de3:	48 83 c0 20          	add    $0x20,%rax
    3de7:	eb d7                	jmp    3dc0 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x120>
    3de9:	45 85 d2             	test   %r10d,%r10d
    3dec:	0f 84 c1 00 00 00    	je     3eb3 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x213>
    3df2:	44 8b d8             	mov    %eax,%r11d
    3df5:	41 81 e3 ff 0f 00 00 	and    $0xfff,%r11d
    3dfc:	41 81 fb e0 0f 00 00 	cmp    $0xfe0,%r11d
    3e03:	77 36                	ja     3e3b <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x19b>
    3e05:	c5 fe 6f 08          	vmovdqu (%rax),%ymm1
    3e09:	c5 fd 75 c9          	vpcmpeqw %ymm1,%ymm0,%ymm1
    3e0d:	c5 7d d7 d9          	vpmovmskb %ymm1,%r11d
    3e11:	45 85 db             	test   %r11d,%r11d
    3e14:	0f 85 05 00 00 00    	jne    3e1f <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x17f>
    3e1a:	e9 94 00 00 00       	jmpq   3eb3 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x213>
    3e1f:	4d 0f bc db          	bsf    %r11,%r11
    3e23:	49 03 c3             	add    %r11,%rax
    3e26:	41 c1 eb 01          	shr    $0x1,%r11d
    3e2a:	45 3b da             	cmp    %r10d,%r11d
    3e2d:	0f 8d 80 00 00 00    	jge    3eb3 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x213>
    3e33:	45 2b d3             	sub    %r11d,%r10d
    3e36:	e9 84 00 00 00       	jmpq   3ebf <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x21f>
    3e3b:	41 83 fa 00          	cmp    $0x0,%r10d
    3e3f:	0f 8e 6e 00 00 00    	jle    3eb3 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x213>
    3e45:	44 0f b7 18          	movzwl (%rax),%r11d
    3e49:	66 44 3b d9          	cmp    %cx,%r11w
    3e4d:	0f 84 6c 00 00 00    	je     3ebf <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x21f>
    3e53:	41 ff ca             	dec    %r10d
    3e56:	48 83 c0 02          	add    $0x2,%rax
    3e5a:	eb df                	jmp    3e3b <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x19b>
    3e5c:	48 83 c0 20          	add    $0x20,%rax
    3e60:	41 83 ea 10          	sub    $0x10,%r10d
    3e64:	4d 0f bc c0          	bsf    %r8,%r8
    3e68:	49 03 c0             	add    %r8,%rax
    3e6b:	41 c1 e8 01          	shr    $0x1,%r8d
    3e6f:	45 2b d0             	sub    %r8d,%r10d
    3e72:	eb 4b                	jmp    3ebf <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x21f>
    3e74:	48 83 c0 40          	add    $0x40,%rax
    3e78:	41 83 ea 20          	sub    $0x20,%r10d
    3e7c:	4d 0f bc c9          	bsf    %r9,%r9
    3e80:	49 03 c1             	add    %r9,%rax
    3e83:	41 c1 e9 01          	shr    $0x1,%r9d
    3e87:	45 2b d1             	sub    %r9d,%r10d
    3e8a:	eb 33                	jmp    3ebf <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x21f>
    3e8c:	48 83 c0 60          	add    $0x60,%rax
    3e90:	41 83 ea 30          	sub    $0x30,%r10d
    3e94:	48 0f bc db          	bsf    %rbx,%rbx
    3e98:	48 03 c3             	add    %rbx,%rax
    3e9b:	c1 eb 01             	shr    $0x1,%ebx
    3e9e:	44 2b d3             	sub    %ebx,%r10d
    3ea1:	eb 1c                	jmp    3ebf <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x21f>
    3ea3:	4d 0f bc db          	bsf    %r11,%r11
    3ea7:	49 03 c3             	add    %r11,%rax
    3eaa:	41 c1 eb 01          	shr    $0x1,%r11d
    3eae:	45 2b d3             	sub    %r11d,%r10d
    3eb1:	eb 0c                	jmp    3ebf <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x21f>
    3eb3:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffffffff,%rax
    3eba:	ff ff ff 
    3ebd:	eb 06                	jmp    3ec5 <Stub<AMD64ArrayIndexOfStub.indexOf1Char>+0x225>
    3ebf:	48 2b c6             	sub    %rsi,%rax
    3ec2:	48 d1 e8             	shr    %rax
    3ec5:	c3                   	retq   
	...
    3efe:	00 00                	add    %al,(%rax)
    3f00:	0a 00                	or     (%rax),%al
	...

0000000000003f20 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>>:
    3f20:	44 8b d2             	mov    %edx,%r10d
    3f23:	48 8b c6             	mov    %rsi,%rax
    3f26:	c5 f9 6e c1          	vmovd  %ecx,%xmm0
    3f2a:	c4 c1 79 6e c8       	vmovd  %r8d,%xmm1
    3f2f:	c4 e2 7d 79 c0       	vpbroadcastw %xmm0,%ymm0
    3f34:	c4 e2 7d 79 c9       	vpbroadcastw %xmm1,%ymm1
    3f39:	44 8b d8             	mov    %eax,%r11d
    3f3c:	41 83 fa 20          	cmp    $0x20,%r10d
    3f40:	0f 82 da 00 00 00    	jb     4020 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x100>
    3f46:	41 83 e3 3f          	and    $0x3f,%r11d
    3f4a:	0f 84 70 00 00 00    	je     3fc0 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0xa0>
    3f50:	c5 fe 6f 10          	vmovdqu (%rax),%ymm2
    3f54:	c5 fe 6f 58 20       	vmovdqu 0x20(%rax),%ymm3
    3f59:	c5 fe 6f 20          	vmovdqu (%rax),%ymm4
    3f5d:	c5 fe 6f 68 20       	vmovdqu 0x20(%rax),%ymm5
    3f62:	c5 fd 75 d2          	vpcmpeqw %ymm2,%ymm0,%ymm2
    3f66:	c5 fd 75 db          	vpcmpeqw %ymm3,%ymm0,%ymm3
    3f6a:	c5 f5 75 e4          	vpcmpeqw %ymm4,%ymm1,%ymm4
    3f6e:	c5 f5 75 ed          	vpcmpeqw %ymm5,%ymm1,%ymm5
    3f72:	c5 7d d7 da          	vpmovmskb %ymm2,%r11d
    3f76:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    3f7a:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    3f7e:	c5 fd d7 fd          	vpmovmskb %ymm5,%edi
    3f82:	44 0b db             	or     %ebx,%r11d
    3f85:	44 0b cf             	or     %edi,%r9d
    3f88:	45 85 db             	test   %r11d,%r11d
    3f8b:	0f 85 6b 01 00 00    	jne    40fc <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1dc>
    3f91:	45 85 c9             	test   %r9d,%r9d
    3f94:	0f 85 4a 01 00 00    	jne    40e4 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1c4>
    3f9a:	44 8b d8             	mov    %eax,%r11d
    3f9d:	48 83 c0 40          	add    $0x40,%rax
    3fa1:	41 83 ea 20          	sub    $0x20,%r10d
    3fa5:	41 83 e3 3f          	and    $0x3f,%r11d
    3fa9:	41 c1 eb 01          	shr    $0x1,%r11d
    3fad:	48 83 e0 c0          	and    $0xffffffffffffffc0,%rax
    3fb1:	45 03 d3             	add    %r11d,%r10d
    3fb4:	41 83 fa 20          	cmp    $0x20,%r10d
    3fb8:	0f 82 62 00 00 00    	jb     4020 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x100>
    3fbe:	66 90                	xchg   %ax,%ax
    3fc0:	c5 fd 6f 10          	vmovdqa (%rax),%ymm2
    3fc4:	c5 fd 6f 58 20       	vmovdqa 0x20(%rax),%ymm3
    3fc9:	c5 fd 6f 20          	vmovdqa (%rax),%ymm4
    3fcd:	c5 fd 6f 68 20       	vmovdqa 0x20(%rax),%ymm5
    3fd2:	c5 fd 75 d2          	vpcmpeqw %ymm2,%ymm0,%ymm2
    3fd6:	c5 fd 75 db          	vpcmpeqw %ymm3,%ymm0,%ymm3
    3fda:	c5 f5 75 e4          	vpcmpeqw %ymm4,%ymm1,%ymm4
    3fde:	c5 f5 75 ed          	vpcmpeqw %ymm5,%ymm1,%ymm5
    3fe2:	c5 7d d7 da          	vpmovmskb %ymm2,%r11d
    3fe6:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    3fea:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    3fee:	c5 fd d7 fd          	vpmovmskb %ymm5,%edi
    3ff2:	44 0b db             	or     %ebx,%r11d
    3ff5:	44 0b cf             	or     %edi,%r9d
    3ff8:	45 85 db             	test   %r11d,%r11d
    3ffb:	0f 85 fb 00 00 00    	jne    40fc <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1dc>
    4001:	45 85 c9             	test   %r9d,%r9d
    4004:	0f 85 da 00 00 00    	jne    40e4 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1c4>
    400a:	41 83 ea 20          	sub    $0x20,%r10d
    400e:	48 83 c0 40          	add    $0x40,%rax
    4012:	41 83 fa 20          	cmp    $0x20,%r10d
    4016:	0f 82 04 00 00 00    	jb     4020 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x100>
    401c:	eb a2                	jmp    3fc0 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0xa0>
    401e:	66 90                	xchg   %ax,%ax
    4020:	41 83 fa 10          	cmp    $0x10,%r10d
    4024:	0f 82 2e 00 00 00    	jb     4058 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x138>
    402a:	c5 fe 6f 10          	vmovdqu (%rax),%ymm2
    402e:	c5 fe 6f 18          	vmovdqu (%rax),%ymm3
    4032:	c5 fd 75 d2          	vpcmpeqw %ymm2,%ymm0,%ymm2
    4036:	c5 f5 75 db          	vpcmpeqw %ymm3,%ymm1,%ymm3
    403a:	c5 7d d7 da          	vpmovmskb %ymm2,%r11d
    403e:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    4042:	45 0b d9             	or     %r9d,%r11d
    4045:	45 85 db             	test   %r11d,%r11d
    4048:	0f 85 ae 00 00 00    	jne    40fc <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1dc>
    404e:	41 83 ea 10          	sub    $0x10,%r10d
    4052:	48 83 c0 20          	add    $0x20,%rax
    4056:	eb c8                	jmp    4020 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x100>
    4058:	45 85 d2             	test   %r10d,%r10d
    405b:	0f 84 ab 00 00 00    	je     410c <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1ec>
    4061:	44 8b d8             	mov    %eax,%r11d
    4064:	41 81 e3 ff 0f 00 00 	and    $0xfff,%r11d
    406b:	41 81 fb e0 0f 00 00 	cmp    $0xfe0,%r11d
    4072:	77 45                	ja     40b9 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x199>
    4074:	c5 fe 6f 10          	vmovdqu (%rax),%ymm2
    4078:	c5 fe 6f 18          	vmovdqu (%rax),%ymm3
    407c:	c5 fd 75 d2          	vpcmpeqw %ymm2,%ymm0,%ymm2
    4080:	c5 f5 75 db          	vpcmpeqw %ymm3,%ymm1,%ymm3
    4084:	c5 7d d7 da          	vpmovmskb %ymm2,%r11d
    4088:	c5 7d d7 cb          	vpmovmskb %ymm3,%r9d
    408c:	45 0b d9             	or     %r9d,%r11d
    408f:	45 85 db             	test   %r11d,%r11d
    4092:	0f 85 05 00 00 00    	jne    409d <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x17d>
    4098:	e9 6f 00 00 00       	jmpq   410c <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1ec>
    409d:	4d 0f bc db          	bsf    %r11,%r11
    40a1:	49 03 c3             	add    %r11,%rax
    40a4:	41 c1 eb 01          	shr    $0x1,%r11d
    40a8:	45 3b da             	cmp    %r10d,%r11d
    40ab:	0f 8d 5b 00 00 00    	jge    410c <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1ec>
    40b1:	45 2b d3             	sub    %r11d,%r10d
    40b4:	e9 5f 00 00 00       	jmpq   4118 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1f8>
    40b9:	41 83 fa 00          	cmp    $0x0,%r10d
    40bd:	0f 8e 49 00 00 00    	jle    410c <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1ec>
    40c3:	44 0f b7 18          	movzwl (%rax),%r11d
    40c7:	66 44 3b d9          	cmp    %cx,%r11w
    40cb:	0f 84 47 00 00 00    	je     4118 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1f8>
    40d1:	66 45 3b d8          	cmp    %r8w,%r11w
    40d5:	0f 84 3d 00 00 00    	je     4118 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1f8>
    40db:	41 ff ca             	dec    %r10d
    40de:	48 83 c0 02          	add    $0x2,%rax
    40e2:	eb d5                	jmp    40b9 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x199>
    40e4:	48 83 c0 20          	add    $0x20,%rax
    40e8:	41 83 ea 10          	sub    $0x10,%r10d
    40ec:	4d 0f bc c9          	bsf    %r9,%r9
    40f0:	49 03 c1             	add    %r9,%rax
    40f3:	41 c1 e9 01          	shr    $0x1,%r9d
    40f7:	45 2b d1             	sub    %r9d,%r10d
    40fa:	eb 1c                	jmp    4118 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1f8>
    40fc:	4d 0f bc db          	bsf    %r11,%r11
    4100:	49 03 c3             	add    %r11,%rax
    4103:	41 c1 eb 01          	shr    $0x1,%r11d
    4107:	45 2b d3             	sub    %r11d,%r10d
    410a:	eb 0c                	jmp    4118 <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1f8>
    410c:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffffffff,%rax
    4113:	ff ff ff 
    4116:	eb 06                	jmp    411e <Stub<AMD64ArrayIndexOfStub.indexOf2Chars>+0x1fe>
    4118:	48 2b c6             	sub    %rsi,%rax
    411b:	48 d1 e8             	shr    %rax
    411e:	c3                   	retq   
	...
    417f:	00 0b                	add    %cl,(%rbx)
	...

00000000000041a0 <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>>:
    41a0:	44 8b d2             	mov    %edx,%r10d
    41a3:	48 8b c6             	mov    %rsi,%rax
    41a6:	c5 f9 6e c1          	vmovd  %ecx,%xmm0
    41aa:	c4 c1 79 6e c8       	vmovd  %r8d,%xmm1
    41af:	c4 c1 79 6e d1       	vmovd  %r9d,%xmm2
    41b4:	c4 e2 7d 79 c0       	vpbroadcastw %xmm0,%ymm0
    41b9:	c4 e2 7d 79 c9       	vpbroadcastw %xmm1,%ymm1
    41be:	c4 e2 7d 79 d2       	vpbroadcastw %xmm2,%ymm2
    41c3:	44 8b d8             	mov    %eax,%r11d
    41c6:	41 83 fa 10          	cmp    $0x10,%r10d
    41ca:	0f 82 b7 00 00 00    	jb     4287 <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0xe7>
    41d0:	41 83 e3 1f          	and    $0x1f,%r11d
    41d4:	0f 84 66 00 00 00    	je     4240 <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0xa0>
    41da:	c5 fe 6f 18          	vmovdqu (%rax),%ymm3
    41de:	c5 fe 6f 20          	vmovdqu (%rax),%ymm4
    41e2:	c5 fe 6f 28          	vmovdqu (%rax),%ymm5
    41e6:	c5 fd 75 db          	vpcmpeqw %ymm3,%ymm0,%ymm3
    41ea:	c5 f5 75 e4          	vpcmpeqw %ymm4,%ymm1,%ymm4
    41ee:	c5 ed 75 ed          	vpcmpeqw %ymm5,%ymm2,%ymm5
    41f2:	c5 7d d7 db          	vpmovmskb %ymm3,%r11d
    41f6:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    41fa:	c5 fd d7 fd          	vpmovmskb %ymm5,%edi
    41fe:	44 0b db             	or     %ebx,%r11d
    4201:	44 0b df             	or     %edi,%r11d
    4204:	45 85 db             	test   %r11d,%r11d
    4207:	0f 85 1f 01 00 00    	jne    432c <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x18c>
    420d:	44 8b d8             	mov    %eax,%r11d
    4210:	48 83 c0 20          	add    $0x20,%rax
    4214:	41 83 ea 10          	sub    $0x10,%r10d
    4218:	41 83 e3 1f          	and    $0x1f,%r11d
    421c:	41 c1 eb 01          	shr    $0x1,%r11d
    4220:	48 83 e0 e0          	and    $0xffffffffffffffe0,%rax
    4224:	45 03 d3             	add    %r11d,%r10d
    4227:	41 83 fa 10          	cmp    $0x10,%r10d
    422b:	0f 82 56 00 00 00    	jb     4287 <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0xe7>
    4231:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    4238:	00 
    4239:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    4240:	c5 fd 6f 18          	vmovdqa (%rax),%ymm3
    4244:	c5 fd 6f 20          	vmovdqa (%rax),%ymm4
    4248:	c5 fd 6f 28          	vmovdqa (%rax),%ymm5
    424c:	c5 fd 75 db          	vpcmpeqw %ymm3,%ymm0,%ymm3
    4250:	c5 f5 75 e4          	vpcmpeqw %ymm4,%ymm1,%ymm4
    4254:	c5 ed 75 ed          	vpcmpeqw %ymm5,%ymm2,%ymm5
    4258:	c5 7d d7 db          	vpmovmskb %ymm3,%r11d
    425c:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    4260:	c5 fd d7 fd          	vpmovmskb %ymm5,%edi
    4264:	44 0b db             	or     %ebx,%r11d
    4267:	44 0b df             	or     %edi,%r11d
    426a:	45 85 db             	test   %r11d,%r11d
    426d:	0f 85 b9 00 00 00    	jne    432c <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x18c>
    4273:	41 83 ea 10          	sub    $0x10,%r10d
    4277:	48 83 c0 20          	add    $0x20,%rax
    427b:	41 83 fa 10          	cmp    $0x10,%r10d
    427f:	0f 82 02 00 00 00    	jb     4287 <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0xe7>
    4285:	eb b9                	jmp    4240 <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0xa0>
    4287:	45 85 d2             	test   %r10d,%r10d
    428a:	0f 84 ac 00 00 00    	je     433c <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x19c>
    4290:	44 8b d8             	mov    %eax,%r11d
    4293:	41 81 e3 ff 0f 00 00 	and    $0xfff,%r11d
    429a:	41 81 fb e0 0f 00 00 	cmp    $0xfe0,%r11d
    42a1:	77 54                	ja     42f7 <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x157>
    42a3:	c5 fe 6f 18          	vmovdqu (%rax),%ymm3
    42a7:	c5 fe 6f 20          	vmovdqu (%rax),%ymm4
    42ab:	c5 fe 6f 28          	vmovdqu (%rax),%ymm5
    42af:	c5 fd 75 db          	vpcmpeqw %ymm3,%ymm0,%ymm3
    42b3:	c5 f5 75 e4          	vpcmpeqw %ymm4,%ymm1,%ymm4
    42b7:	c5 ed 75 ed          	vpcmpeqw %ymm5,%ymm2,%ymm5
    42bb:	c5 7d d7 db          	vpmovmskb %ymm3,%r11d
    42bf:	c5 fd d7 dc          	vpmovmskb %ymm4,%ebx
    42c3:	c5 fd d7 fd          	vpmovmskb %ymm5,%edi
    42c7:	44 0b db             	or     %ebx,%r11d
    42ca:	44 0b df             	or     %edi,%r11d
    42cd:	45 85 db             	test   %r11d,%r11d
    42d0:	0f 85 05 00 00 00    	jne    42db <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x13b>
    42d6:	e9 61 00 00 00       	jmpq   433c <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x19c>
    42db:	4d 0f bc db          	bsf    %r11,%r11
    42df:	49 03 c3             	add    %r11,%rax
    42e2:	41 c1 eb 01          	shr    $0x1,%r11d
    42e6:	45 3b da             	cmp    %r10d,%r11d
    42e9:	0f 8d 4d 00 00 00    	jge    433c <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x19c>
    42ef:	45 2b d3             	sub    %r11d,%r10d
    42f2:	e9 51 00 00 00       	jmpq   4348 <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x1a8>
    42f7:	41 83 fa 00          	cmp    $0x0,%r10d
    42fb:	0f 8e 3b 00 00 00    	jle    433c <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x19c>
    4301:	44 0f b7 18          	movzwl (%rax),%r11d
    4305:	66 44 3b d9          	cmp    %cx,%r11w
    4309:	0f 84 39 00 00 00    	je     4348 <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x1a8>
    430f:	66 45 3b d8          	cmp    %r8w,%r11w
    4313:	0f 84 2f 00 00 00    	je     4348 <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x1a8>
    4319:	66 45 3b d9          	cmp    %r9w,%r11w
    431d:	0f 84 25 00 00 00    	je     4348 <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x1a8>
    4323:	41 ff ca             	dec    %r10d
    4326:	48 83 c0 02          	add    $0x2,%rax
    432a:	eb cb                	jmp    42f7 <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x157>
    432c:	4d 0f bc db          	bsf    %r11,%r11
    4330:	49 03 c3             	add    %r11,%rax
    4333:	41 c1 eb 01          	shr    $0x1,%r11d
    4337:	45 2b d3             	sub    %r11d,%r10d
    433a:	eb 0c                	jmp    4348 <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x1a8>
    433c:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffffffff,%rax
    4343:	ff ff ff 
    4346:	eb 06                	jmp    434e <Stub<AMD64ArrayIndexOfStub.indexOf3Chars>+0x1ae>
    4348:	48 2b c6             	sub    %rsi,%rax
    434b:	48 d1 e8             	shr    %rax
    434e:	c3                   	retq   
	...
    437f:	00 0c 00             	add    %cl,(%rax,%rax,1)
	...

00000000000043a0 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>>:
    43a0:	44 8b d2             	mov    %edx,%r10d
    43a3:	48 8b c6             	mov    %rsi,%rax
    43a6:	c5 f9 6e c1          	vmovd  %ecx,%xmm0
    43aa:	c4 c1 79 6e c8       	vmovd  %r8d,%xmm1
    43af:	c4 c1 79 6e d1       	vmovd  %r9d,%xmm2
    43b4:	c5 f9 6e df          	vmovd  %edi,%xmm3
    43b8:	c4 e2 7d 79 c0       	vpbroadcastw %xmm0,%ymm0
    43bd:	c4 e2 7d 79 c9       	vpbroadcastw %xmm1,%ymm1
    43c2:	c4 e2 7d 79 d2       	vpbroadcastw %xmm2,%ymm2
    43c7:	c4 e2 7d 79 db       	vpbroadcastw %xmm3,%ymm3
    43cc:	44 8b d8             	mov    %eax,%r11d
    43cf:	41 83 fa 10          	cmp    $0x10,%r10d
    43d3:	0f 82 cd 00 00 00    	jb     44a6 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x106>
    43d9:	41 83 e3 1f          	and    $0x1f,%r11d
    43dd:	0f 84 6d 00 00 00    	je     4450 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0xb0>
    43e3:	c5 fe 6f 20          	vmovdqu (%rax),%ymm4
    43e7:	c5 fe 6f 28          	vmovdqu (%rax),%ymm5
    43eb:	c5 fe 6f 30          	vmovdqu (%rax),%ymm6
    43ef:	c5 fe 6f 38          	vmovdqu (%rax),%ymm7
    43f3:	c5 fd 75 e4          	vpcmpeqw %ymm4,%ymm0,%ymm4
    43f7:	c5 f5 75 ed          	vpcmpeqw %ymm5,%ymm1,%ymm5
    43fb:	c5 ed 75 f6          	vpcmpeqw %ymm6,%ymm2,%ymm6
    43ff:	c5 e5 75 ff          	vpcmpeqw %ymm7,%ymm3,%ymm7
    4403:	c5 7d d7 dc          	vpmovmskb %ymm4,%r11d
    4407:	c5 fd d7 dd          	vpmovmskb %ymm5,%ebx
    440b:	c5 fd d7 d6          	vpmovmskb %ymm6,%edx
    440f:	c5 7d d7 ef          	vpmovmskb %ymm7,%r13d
    4413:	44 0b db             	or     %ebx,%r11d
    4416:	41 0b d5             	or     %r13d,%edx
    4419:	44 0b da             	or     %edx,%r11d
    441c:	45 85 db             	test   %r11d,%r11d
    441f:	0f 85 3f 01 00 00    	jne    4564 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x1c4>
    4425:	44 8b d8             	mov    %eax,%r11d
    4428:	48 83 c0 20          	add    $0x20,%rax
    442c:	41 83 ea 10          	sub    $0x10,%r10d
    4430:	41 83 e3 1f          	and    $0x1f,%r11d
    4434:	41 c1 eb 01          	shr    $0x1,%r11d
    4438:	48 83 e0 e0          	and    $0xffffffffffffffe0,%rax
    443c:	45 03 d3             	add    %r11d,%r10d
    443f:	41 83 fa 10          	cmp    $0x10,%r10d
    4443:	0f 82 5d 00 00 00    	jb     44a6 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x106>
    4449:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    4450:	c5 fd 6f 20          	vmovdqa (%rax),%ymm4
    4454:	c5 fd 6f 28          	vmovdqa (%rax),%ymm5
    4458:	c5 fd 6f 30          	vmovdqa (%rax),%ymm6
    445c:	c5 fd 6f 38          	vmovdqa (%rax),%ymm7
    4460:	c5 fd 75 e4          	vpcmpeqw %ymm4,%ymm0,%ymm4
    4464:	c5 f5 75 ed          	vpcmpeqw %ymm5,%ymm1,%ymm5
    4468:	c5 ed 75 f6          	vpcmpeqw %ymm6,%ymm2,%ymm6
    446c:	c5 e5 75 ff          	vpcmpeqw %ymm7,%ymm3,%ymm7
    4470:	c5 7d d7 dc          	vpmovmskb %ymm4,%r11d
    4474:	c5 fd d7 dd          	vpmovmskb %ymm5,%ebx
    4478:	c5 fd d7 d6          	vpmovmskb %ymm6,%edx
    447c:	c5 7d d7 ef          	vpmovmskb %ymm7,%r13d
    4480:	44 0b db             	or     %ebx,%r11d
    4483:	41 0b d5             	or     %r13d,%edx
    4486:	44 0b da             	or     %edx,%r11d
    4489:	45 85 db             	test   %r11d,%r11d
    448c:	0f 85 d2 00 00 00    	jne    4564 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x1c4>
    4492:	41 83 ea 10          	sub    $0x10,%r10d
    4496:	48 83 c0 20          	add    $0x20,%rax
    449a:	41 83 fa 10          	cmp    $0x10,%r10d
    449e:	0f 82 02 00 00 00    	jb     44a6 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x106>
    44a4:	eb aa                	jmp    4450 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0xb0>
    44a6:	45 85 d2             	test   %r10d,%r10d
    44a9:	0f 84 c5 00 00 00    	je     4574 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x1d4>
    44af:	44 8b d8             	mov    %eax,%r11d
    44b2:	41 81 e3 ff 0f 00 00 	and    $0xfff,%r11d
    44b9:	41 81 fb e0 0f 00 00 	cmp    $0xfe0,%r11d
    44c0:	77 63                	ja     4525 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x185>
    44c2:	c5 fe 6f 20          	vmovdqu (%rax),%ymm4
    44c6:	c5 fe 6f 28          	vmovdqu (%rax),%ymm5
    44ca:	c5 fe 6f 30          	vmovdqu (%rax),%ymm6
    44ce:	c5 fe 6f 38          	vmovdqu (%rax),%ymm7
    44d2:	c5 fd 75 e4          	vpcmpeqw %ymm4,%ymm0,%ymm4
    44d6:	c5 f5 75 ed          	vpcmpeqw %ymm5,%ymm1,%ymm5
    44da:	c5 ed 75 f6          	vpcmpeqw %ymm6,%ymm2,%ymm6
    44de:	c5 e5 75 ff          	vpcmpeqw %ymm7,%ymm3,%ymm7
    44e2:	c5 7d d7 dc          	vpmovmskb %ymm4,%r11d
    44e6:	c5 fd d7 dd          	vpmovmskb %ymm5,%ebx
    44ea:	c5 fd d7 d6          	vpmovmskb %ymm6,%edx
    44ee:	c5 7d d7 ef          	vpmovmskb %ymm7,%r13d
    44f2:	44 0b db             	or     %ebx,%r11d
    44f5:	41 0b d5             	or     %r13d,%edx
    44f8:	44 0b da             	or     %edx,%r11d
    44fb:	45 85 db             	test   %r11d,%r11d
    44fe:	0f 85 05 00 00 00    	jne    4509 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x169>
    4504:	e9 6b 00 00 00       	jmpq   4574 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x1d4>
    4509:	4d 0f bc db          	bsf    %r11,%r11
    450d:	49 03 c3             	add    %r11,%rax
    4510:	41 c1 eb 01          	shr    $0x1,%r11d
    4514:	45 3b da             	cmp    %r10d,%r11d
    4517:	0f 8d 57 00 00 00    	jge    4574 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x1d4>
    451d:	45 2b d3             	sub    %r11d,%r10d
    4520:	e9 5b 00 00 00       	jmpq   4580 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x1e0>
    4525:	41 83 fa 00          	cmp    $0x0,%r10d
    4529:	0f 8e 45 00 00 00    	jle    4574 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x1d4>
    452f:	44 0f b7 18          	movzwl (%rax),%r11d
    4533:	66 44 3b d9          	cmp    %cx,%r11w
    4537:	0f 84 43 00 00 00    	je     4580 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x1e0>
    453d:	66 45 3b d8          	cmp    %r8w,%r11w
    4541:	0f 84 39 00 00 00    	je     4580 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x1e0>
    4547:	66 45 3b d9          	cmp    %r9w,%r11w
    454b:	0f 84 2f 00 00 00    	je     4580 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x1e0>
    4551:	66 44 3b df          	cmp    %di,%r11w
    4555:	0f 84 25 00 00 00    	je     4580 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x1e0>
    455b:	41 ff ca             	dec    %r10d
    455e:	48 83 c0 02          	add    $0x2,%rax
    4562:	eb c1                	jmp    4525 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x185>
    4564:	4d 0f bc db          	bsf    %r11,%r11
    4568:	49 03 c3             	add    %r11,%rax
    456b:	41 c1 eb 01          	shr    $0x1,%r11d
    456f:	45 2b d3             	sub    %r11d,%r10d
    4572:	eb 0c                	jmp    4580 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x1e0>
    4574:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffffffff,%rax
    457b:	ff ff ff 
    457e:	eb 06                	jmp    4586 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x1e6>
    4580:	48 2b c6             	sub    %rsi,%rax
    4583:	48 d1 e8             	shr    %rax
    4586:	c3                   	retq   
	...
    45ff:	00 0d 00 00 00 00    	add    %cl,0x0(%rip)        # 4605 <Stub<AMD64ArrayIndexOfStub.indexOf4Chars>+0x265>
	...

0000000000004620 <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>>:
    4620:	4c 8d 56 10          	lea    0x10(%rsi),%r10
    4624:	4c 8d 5a 10          	lea    0x10(%rdx),%r11
    4628:	44 8b c1             	mov    %ecx,%r8d
    462b:	41 8b c0             	mov    %r8d,%eax
    462e:	83 e0 1f             	and    $0x1f,%eax
    4631:	41 83 e0 e0          	and    $0xffffffe0,%r8d
    4635:	0f 84 60 00 00 00    	je     469b <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x7b>
    463b:	4f 8d 14 02          	lea    (%r10,%r8,1),%r10
    463f:	4f 8d 1c 03          	lea    (%r11,%r8,1),%r11
    4643:	49 f7 d8             	neg    %r8
    4646:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    464d:	00 00 00 
    4650:	c4 81 7e 6f 04 02    	vmovdqu (%r10,%r8,1),%ymm0
    4656:	c4 81 7e 6f 0c 03    	vmovdqu (%r11,%r8,1),%ymm1
    465c:	c5 fd ef c1          	vpxor  %ymm1,%ymm0,%ymm0
    4660:	c4 e2 7d 17 c0       	vptest %ymm0,%ymm0
    4665:	0f 85 d0 00 00 00    	jne    473b <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x11b>
    466b:	49 83 c0 20          	add    $0x20,%r8
    466f:	75 df                	jne    4650 <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x30>
    4671:	85 c0                	test   %eax,%eax
    4673:	0f 84 bb 00 00 00    	je     4734 <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x114>
    4679:	c4 c1 7e 6f 44 02 e0 	vmovdqu -0x20(%r10,%rax,1),%ymm0
    4680:	c4 c1 7e 6f 4c 03 e0 	vmovdqu -0x20(%r11,%rax,1),%ymm1
    4687:	c5 fd ef c1          	vpxor  %ymm1,%ymm0,%ymm0
    468b:	c4 e2 7d 17 c0       	vptest %ymm0,%ymm0
    4690:	0f 85 a5 00 00 00    	jne    473b <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x11b>
    4696:	e9 99 00 00 00       	jmpq   4734 <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x114>
    469b:	44 8b c0             	mov    %eax,%r8d
    469e:	83 e0 07             	and    $0x7,%eax
    46a1:	41 83 e0 f8          	and    $0xfffffff8,%r8d
    46a5:	0f 84 3f 00 00 00    	je     46ea <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0xca>
    46ab:	4f 8d 14 02          	lea    (%r10,%r8,1),%r10
    46af:	4f 8d 1c 03          	lea    (%r11,%r8,1),%r11
    46b3:	49 f7 d8             	neg    %r8
    46b6:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    46bd:	00 00 00 
    46c0:	4f 8b 0c 02          	mov    (%r10,%r8,1),%r9
    46c4:	4f 3b 0c 03          	cmp    (%r11,%r8,1),%r9
    46c8:	0f 85 6d 00 00 00    	jne    473b <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x11b>
    46ce:	49 83 c0 08          	add    $0x8,%r8
    46d2:	75 ec                	jne    46c0 <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0xa0>
    46d4:	85 c0                	test   %eax,%eax
    46d6:	0f 84 58 00 00 00    	je     4734 <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x114>
    46dc:	4d 8b 4c 02 f8       	mov    -0x8(%r10,%rax,1),%r9
    46e1:	4d 3b 4c 03 f8       	cmp    -0x8(%r11,%rax,1),%r9
    46e6:	75 53                	jne    473b <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x11b>
    46e8:	eb 4a                	jmp    4734 <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x114>
    46ea:	44 8b c0             	mov    %eax,%r8d
    46ed:	a9 04 00 00 00       	test   $0x4,%eax
    46f2:	74 10                	je     4704 <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0xe4>
    46f4:	45 8b 0a             	mov    (%r10),%r9d
    46f7:	45 3b 0b             	cmp    (%r11),%r9d
    46fa:	75 3f                	jne    473b <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x11b>
    46fc:	4d 8d 52 04          	lea    0x4(%r10),%r10
    4700:	4d 8d 5b 04          	lea    0x4(%r11),%r11
    4704:	a9 02 00 00 00       	test   $0x2,%eax
    4709:	74 15                	je     4720 <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x100>
    470b:	45 0f b7 0a          	movzwl (%r10),%r9d
    470f:	45 0f b7 03          	movzwl (%r11),%r8d
    4713:	45 3b c8             	cmp    %r8d,%r9d
    4716:	75 23                	jne    473b <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x11b>
    4718:	4d 8d 52 02          	lea    0x2(%r10),%r10
    471c:	4d 8d 5b 02          	lea    0x2(%r11),%r11
    4720:	a9 01 00 00 00       	test   $0x1,%eax
    4725:	74 0d                	je     4734 <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x114>
    4727:	45 0f b6 0a          	movzbl (%r10),%r9d
    472b:	45 0f b6 03          	movzbl (%r11),%r8d
    472f:	45 3b c8             	cmp    %r8d,%r9d
    4732:	75 07                	jne    473b <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x11b>
    4734:	b8 01 00 00 00       	mov    $0x1,%eax
    4739:	eb 02                	jmp    473d <Stub<AMD64ArrayEqualsStub.booleanArraysEquals>+0x11d>
    473b:	33 c0                	xor    %eax,%eax
    473d:	c3                   	retq   
	...
    477e:	00 00                	add    %al,(%rax)
    4780:	0e                   	(bad)  
	...

00000000000047a0 <Stub<AMD64ArrayEqualsStub.byteArraysEquals>>:
    47a0:	4c 8d 56 10          	lea    0x10(%rsi),%r10
    47a4:	4c 8d 5a 10          	lea    0x10(%rdx),%r11
    47a8:	44 8b c1             	mov    %ecx,%r8d
    47ab:	41 8b c0             	mov    %r8d,%eax
    47ae:	83 e0 1f             	and    $0x1f,%eax
    47b1:	41 83 e0 e0          	and    $0xffffffe0,%r8d
    47b5:	0f 84 60 00 00 00    	je     481b <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x7b>
    47bb:	4f 8d 14 02          	lea    (%r10,%r8,1),%r10
    47bf:	4f 8d 1c 03          	lea    (%r11,%r8,1),%r11
    47c3:	49 f7 d8             	neg    %r8
    47c6:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    47cd:	00 00 00 
    47d0:	c4 81 7e 6f 04 02    	vmovdqu (%r10,%r8,1),%ymm0
    47d6:	c4 81 7e 6f 0c 03    	vmovdqu (%r11,%r8,1),%ymm1
    47dc:	c5 fd ef c1          	vpxor  %ymm1,%ymm0,%ymm0
    47e0:	c4 e2 7d 17 c0       	vptest %ymm0,%ymm0
    47e5:	0f 85 d0 00 00 00    	jne    48bb <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x11b>
    47eb:	49 83 c0 20          	add    $0x20,%r8
    47ef:	75 df                	jne    47d0 <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x30>
    47f1:	85 c0                	test   %eax,%eax
    47f3:	0f 84 bb 00 00 00    	je     48b4 <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x114>
    47f9:	c4 c1 7e 6f 44 02 e0 	vmovdqu -0x20(%r10,%rax,1),%ymm0
    4800:	c4 c1 7e 6f 4c 03 e0 	vmovdqu -0x20(%r11,%rax,1),%ymm1
    4807:	c5 fd ef c1          	vpxor  %ymm1,%ymm0,%ymm0
    480b:	c4 e2 7d 17 c0       	vptest %ymm0,%ymm0
    4810:	0f 85 a5 00 00 00    	jne    48bb <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x11b>
    4816:	e9 99 00 00 00       	jmpq   48b4 <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x114>
    481b:	44 8b c0             	mov    %eax,%r8d
    481e:	83 e0 07             	and    $0x7,%eax
    4821:	41 83 e0 f8          	and    $0xfffffff8,%r8d
    4825:	0f 84 3f 00 00 00    	je     486a <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0xca>
    482b:	4f 8d 14 02          	lea    (%r10,%r8,1),%r10
    482f:	4f 8d 1c 03          	lea    (%r11,%r8,1),%r11
    4833:	49 f7 d8             	neg    %r8
    4836:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    483d:	00 00 00 
    4840:	4f 8b 0c 02          	mov    (%r10,%r8,1),%r9
    4844:	4f 3b 0c 03          	cmp    (%r11,%r8,1),%r9
    4848:	0f 85 6d 00 00 00    	jne    48bb <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x11b>
    484e:	49 83 c0 08          	add    $0x8,%r8
    4852:	75 ec                	jne    4840 <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0xa0>
    4854:	85 c0                	test   %eax,%eax
    4856:	0f 84 58 00 00 00    	je     48b4 <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x114>
    485c:	4d 8b 4c 02 f8       	mov    -0x8(%r10,%rax,1),%r9
    4861:	4d 3b 4c 03 f8       	cmp    -0x8(%r11,%rax,1),%r9
    4866:	75 53                	jne    48bb <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x11b>
    4868:	eb 4a                	jmp    48b4 <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x114>
    486a:	44 8b c0             	mov    %eax,%r8d
    486d:	a9 04 00 00 00       	test   $0x4,%eax
    4872:	74 10                	je     4884 <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0xe4>
    4874:	45 8b 0a             	mov    (%r10),%r9d
    4877:	45 3b 0b             	cmp    (%r11),%r9d
    487a:	75 3f                	jne    48bb <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x11b>
    487c:	4d 8d 52 04          	lea    0x4(%r10),%r10
    4880:	4d 8d 5b 04          	lea    0x4(%r11),%r11
    4884:	a9 02 00 00 00       	test   $0x2,%eax
    4889:	74 15                	je     48a0 <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x100>
    488b:	45 0f b7 0a          	movzwl (%r10),%r9d
    488f:	45 0f b7 03          	movzwl (%r11),%r8d
    4893:	45 3b c8             	cmp    %r8d,%r9d
    4896:	75 23                	jne    48bb <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x11b>
    4898:	4d 8d 52 02          	lea    0x2(%r10),%r10
    489c:	4d 8d 5b 02          	lea    0x2(%r11),%r11
    48a0:	a9 01 00 00 00       	test   $0x1,%eax
    48a5:	74 0d                	je     48b4 <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x114>
    48a7:	45 0f b6 0a          	movzbl (%r10),%r9d
    48ab:	45 0f b6 03          	movzbl (%r11),%r8d
    48af:	45 3b c8             	cmp    %r8d,%r9d
    48b2:	75 07                	jne    48bb <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x11b>
    48b4:	b8 01 00 00 00       	mov    $0x1,%eax
    48b9:	eb 02                	jmp    48bd <Stub<AMD64ArrayEqualsStub.byteArraysEquals>+0x11d>
    48bb:	33 c0                	xor    %eax,%eax
    48bd:	c3                   	retq   
	...
    48fe:	00 00                	add    %al,(%rax)
    4900:	0f 00 00             	sldt   (%rax)
	...

0000000000004920 <Stub<AMD64ArrayEqualsStub.charArraysEquals>>:
    4920:	4c 8d 56 10          	lea    0x10(%rsi),%r10
    4924:	4c 8d 5a 10          	lea    0x10(%rdx),%r11
    4928:	44 8b c1             	mov    %ecx,%r8d
    492b:	41 8b c0             	mov    %r8d,%eax
    492e:	83 e0 0f             	and    $0xf,%eax
    4931:	41 83 e0 f0          	and    $0xfffffff0,%r8d
    4935:	0f 84 60 00 00 00    	je     499b <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0x7b>
    493b:	4f 8d 14 42          	lea    (%r10,%r8,2),%r10
    493f:	4f 8d 1c 43          	lea    (%r11,%r8,2),%r11
    4943:	49 f7 d8             	neg    %r8
    4946:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    494d:	00 00 00 
    4950:	c4 81 7e 6f 04 42    	vmovdqu (%r10,%r8,2),%ymm0
    4956:	c4 81 7e 6f 0c 43    	vmovdqu (%r11,%r8,2),%ymm1
    495c:	c5 fd ef c1          	vpxor  %ymm1,%ymm0,%ymm0
    4960:	c4 e2 7d 17 c0       	vptest %ymm0,%ymm0
    4965:	0f 85 b4 00 00 00    	jne    4a1f <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0xff>
    496b:	49 83 c0 10          	add    $0x10,%r8
    496f:	75 df                	jne    4950 <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0x30>
    4971:	85 c0                	test   %eax,%eax
    4973:	0f 84 9f 00 00 00    	je     4a18 <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0xf8>
    4979:	c4 c1 7e 6f 44 42 e0 	vmovdqu -0x20(%r10,%rax,2),%ymm0
    4980:	c4 c1 7e 6f 4c 43 e0 	vmovdqu -0x20(%r11,%rax,2),%ymm1
    4987:	c5 fd ef c1          	vpxor  %ymm1,%ymm0,%ymm0
    498b:	c4 e2 7d 17 c0       	vptest %ymm0,%ymm0
    4990:	0f 85 89 00 00 00    	jne    4a1f <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0xff>
    4996:	e9 7d 00 00 00       	jmpq   4a18 <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0xf8>
    499b:	44 8b c0             	mov    %eax,%r8d
    499e:	83 e0 03             	and    $0x3,%eax
    49a1:	41 83 e0 fc          	and    $0xfffffffc,%r8d
    49a5:	0f 84 3f 00 00 00    	je     49ea <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0xca>
    49ab:	4f 8d 14 42          	lea    (%r10,%r8,2),%r10
    49af:	4f 8d 1c 43          	lea    (%r11,%r8,2),%r11
    49b3:	49 f7 d8             	neg    %r8
    49b6:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    49bd:	00 00 00 
    49c0:	4f 8b 0c 42          	mov    (%r10,%r8,2),%r9
    49c4:	4f 3b 0c 43          	cmp    (%r11,%r8,2),%r9
    49c8:	0f 85 51 00 00 00    	jne    4a1f <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0xff>
    49ce:	49 83 c0 04          	add    $0x4,%r8
    49d2:	75 ec                	jne    49c0 <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0xa0>
    49d4:	85 c0                	test   %eax,%eax
    49d6:	0f 84 3c 00 00 00    	je     4a18 <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0xf8>
    49dc:	4d 8b 4c 42 f8       	mov    -0x8(%r10,%rax,2),%r9
    49e1:	4d 3b 4c 43 f8       	cmp    -0x8(%r11,%rax,2),%r9
    49e6:	75 37                	jne    4a1f <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0xff>
    49e8:	eb 2e                	jmp    4a18 <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0xf8>
    49ea:	44 8b c0             	mov    %eax,%r8d
    49ed:	a9 02 00 00 00       	test   $0x2,%eax
    49f2:	74 10                	je     4a04 <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0xe4>
    49f4:	45 8b 0a             	mov    (%r10),%r9d
    49f7:	45 3b 0b             	cmp    (%r11),%r9d
    49fa:	75 23                	jne    4a1f <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0xff>
    49fc:	4d 8d 52 04          	lea    0x4(%r10),%r10
    4a00:	4d 8d 5b 04          	lea    0x4(%r11),%r11
    4a04:	a9 01 00 00 00       	test   $0x1,%eax
    4a09:	74 0d                	je     4a18 <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0xf8>
    4a0b:	45 0f b7 0a          	movzwl (%r10),%r9d
    4a0f:	45 0f b7 03          	movzwl (%r11),%r8d
    4a13:	45 3b c8             	cmp    %r8d,%r9d
    4a16:	75 07                	jne    4a1f <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0xff>
    4a18:	b8 01 00 00 00       	mov    $0x1,%eax
    4a1d:	eb 02                	jmp    4a21 <Stub<AMD64ArrayEqualsStub.charArraysEquals>+0x101>
    4a1f:	33 c0                	xor    %eax,%eax
    4a21:	c3                   	retq   
	...
    4a7e:	00 00                	add    %al,(%rax)
    4a80:	10 00                	adc    %al,(%rax)
	...

0000000000004aa0 <Stub<AMD64ArrayEqualsStub.shortArraysEquals>>:
    4aa0:	4c 8d 56 10          	lea    0x10(%rsi),%r10
    4aa4:	4c 8d 5a 10          	lea    0x10(%rdx),%r11
    4aa8:	44 8b c1             	mov    %ecx,%r8d
    4aab:	41 8b c0             	mov    %r8d,%eax
    4aae:	83 e0 0f             	and    $0xf,%eax
    4ab1:	41 83 e0 f0          	and    $0xfffffff0,%r8d
    4ab5:	0f 84 60 00 00 00    	je     4b1b <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0x7b>
    4abb:	4f 8d 14 42          	lea    (%r10,%r8,2),%r10
    4abf:	4f 8d 1c 43          	lea    (%r11,%r8,2),%r11
    4ac3:	49 f7 d8             	neg    %r8
    4ac6:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    4acd:	00 00 00 
    4ad0:	c4 81 7e 6f 04 42    	vmovdqu (%r10,%r8,2),%ymm0
    4ad6:	c4 81 7e 6f 0c 43    	vmovdqu (%r11,%r8,2),%ymm1
    4adc:	c5 fd ef c1          	vpxor  %ymm1,%ymm0,%ymm0
    4ae0:	c4 e2 7d 17 c0       	vptest %ymm0,%ymm0
    4ae5:	0f 85 b4 00 00 00    	jne    4b9f <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0xff>
    4aeb:	49 83 c0 10          	add    $0x10,%r8
    4aef:	75 df                	jne    4ad0 <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0x30>
    4af1:	85 c0                	test   %eax,%eax
    4af3:	0f 84 9f 00 00 00    	je     4b98 <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0xf8>
    4af9:	c4 c1 7e 6f 44 42 e0 	vmovdqu -0x20(%r10,%rax,2),%ymm0
    4b00:	c4 c1 7e 6f 4c 43 e0 	vmovdqu -0x20(%r11,%rax,2),%ymm1
    4b07:	c5 fd ef c1          	vpxor  %ymm1,%ymm0,%ymm0
    4b0b:	c4 e2 7d 17 c0       	vptest %ymm0,%ymm0
    4b10:	0f 85 89 00 00 00    	jne    4b9f <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0xff>
    4b16:	e9 7d 00 00 00       	jmpq   4b98 <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0xf8>
    4b1b:	44 8b c0             	mov    %eax,%r8d
    4b1e:	83 e0 03             	and    $0x3,%eax
    4b21:	41 83 e0 fc          	and    $0xfffffffc,%r8d
    4b25:	0f 84 3f 00 00 00    	je     4b6a <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0xca>
    4b2b:	4f 8d 14 42          	lea    (%r10,%r8,2),%r10
    4b2f:	4f 8d 1c 43          	lea    (%r11,%r8,2),%r11
    4b33:	49 f7 d8             	neg    %r8
    4b36:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    4b3d:	00 00 00 
    4b40:	4f 8b 0c 42          	mov    (%r10,%r8,2),%r9
    4b44:	4f 3b 0c 43          	cmp    (%r11,%r8,2),%r9
    4b48:	0f 85 51 00 00 00    	jne    4b9f <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0xff>
    4b4e:	49 83 c0 04          	add    $0x4,%r8
    4b52:	75 ec                	jne    4b40 <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0xa0>
    4b54:	85 c0                	test   %eax,%eax
    4b56:	0f 84 3c 00 00 00    	je     4b98 <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0xf8>
    4b5c:	4d 8b 4c 42 f8       	mov    -0x8(%r10,%rax,2),%r9
    4b61:	4d 3b 4c 43 f8       	cmp    -0x8(%r11,%rax,2),%r9
    4b66:	75 37                	jne    4b9f <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0xff>
    4b68:	eb 2e                	jmp    4b98 <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0xf8>
    4b6a:	44 8b c0             	mov    %eax,%r8d
    4b6d:	a9 02 00 00 00       	test   $0x2,%eax
    4b72:	74 10                	je     4b84 <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0xe4>
    4b74:	45 8b 0a             	mov    (%r10),%r9d
    4b77:	45 3b 0b             	cmp    (%r11),%r9d
    4b7a:	75 23                	jne    4b9f <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0xff>
    4b7c:	4d 8d 52 04          	lea    0x4(%r10),%r10
    4b80:	4d 8d 5b 04          	lea    0x4(%r11),%r11
    4b84:	a9 01 00 00 00       	test   $0x1,%eax
    4b89:	74 0d                	je     4b98 <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0xf8>
    4b8b:	45 0f b7 0a          	movzwl (%r10),%r9d
    4b8f:	45 0f b7 03          	movzwl (%r11),%r8d
    4b93:	45 3b c8             	cmp    %r8d,%r9d
    4b96:	75 07                	jne    4b9f <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0xff>
    4b98:	b8 01 00 00 00       	mov    $0x1,%eax
    4b9d:	eb 02                	jmp    4ba1 <Stub<AMD64ArrayEqualsStub.shortArraysEquals>+0x101>
    4b9f:	33 c0                	xor    %eax,%eax
    4ba1:	c3                   	retq   
	...
    4bfe:	00 00                	add    %al,(%rax)
    4c00:	11 00                	adc    %eax,(%rax)
	...

0000000000004c20 <Stub<AMD64ArrayEqualsStub.intArraysEquals>>:
    4c20:	4c 8d 56 10          	lea    0x10(%rsi),%r10
    4c24:	4c 8d 5a 10          	lea    0x10(%rdx),%r11
    4c28:	44 8b c1             	mov    %ecx,%r8d
    4c2b:	41 8b c0             	mov    %r8d,%eax
    4c2e:	83 e0 07             	and    $0x7,%eax
    4c31:	41 83 e0 f8          	and    $0xfffffff8,%r8d
    4c35:	0f 84 60 00 00 00    	je     4c9b <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0x7b>
    4c3b:	4f 8d 14 82          	lea    (%r10,%r8,4),%r10
    4c3f:	4f 8d 1c 83          	lea    (%r11,%r8,4),%r11
    4c43:	49 f7 d8             	neg    %r8
    4c46:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    4c4d:	00 00 00 
    4c50:	c4 81 7e 6f 04 82    	vmovdqu (%r10,%r8,4),%ymm0
    4c56:	c4 81 7e 6f 0c 83    	vmovdqu (%r11,%r8,4),%ymm1
    4c5c:	c5 fd ef c1          	vpxor  %ymm1,%ymm0,%ymm0
    4c60:	c4 e2 7d 17 c0       	vptest %ymm0,%ymm0
    4c65:	0f 85 98 00 00 00    	jne    4d03 <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0xe3>
    4c6b:	49 83 c0 08          	add    $0x8,%r8
    4c6f:	75 df                	jne    4c50 <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0x30>
    4c71:	85 c0                	test   %eax,%eax
    4c73:	0f 84 83 00 00 00    	je     4cfc <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0xdc>
    4c79:	c4 c1 7e 6f 44 82 e0 	vmovdqu -0x20(%r10,%rax,4),%ymm0
    4c80:	c4 c1 7e 6f 4c 83 e0 	vmovdqu -0x20(%r11,%rax,4),%ymm1
    4c87:	c5 fd ef c1          	vpxor  %ymm1,%ymm0,%ymm0
    4c8b:	c4 e2 7d 17 c0       	vptest %ymm0,%ymm0
    4c90:	0f 85 6d 00 00 00    	jne    4d03 <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0xe3>
    4c96:	e9 61 00 00 00       	jmpq   4cfc <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0xdc>
    4c9b:	44 8b c0             	mov    %eax,%r8d
    4c9e:	83 e0 01             	and    $0x1,%eax
    4ca1:	41 83 e0 fe          	and    $0xfffffffe,%r8d
    4ca5:	0f 84 3f 00 00 00    	je     4cea <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0xca>
    4cab:	4f 8d 14 82          	lea    (%r10,%r8,4),%r10
    4caf:	4f 8d 1c 83          	lea    (%r11,%r8,4),%r11
    4cb3:	49 f7 d8             	neg    %r8
    4cb6:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    4cbd:	00 00 00 
    4cc0:	4f 8b 0c 82          	mov    (%r10,%r8,4),%r9
    4cc4:	4f 3b 0c 83          	cmp    (%r11,%r8,4),%r9
    4cc8:	0f 85 35 00 00 00    	jne    4d03 <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0xe3>
    4cce:	49 83 c0 02          	add    $0x2,%r8
    4cd2:	75 ec                	jne    4cc0 <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0xa0>
    4cd4:	85 c0                	test   %eax,%eax
    4cd6:	0f 84 20 00 00 00    	je     4cfc <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0xdc>
    4cdc:	4d 8b 4c 82 f8       	mov    -0x8(%r10,%rax,4),%r9
    4ce1:	4d 3b 4c 83 f8       	cmp    -0x8(%r11,%rax,4),%r9
    4ce6:	75 1b                	jne    4d03 <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0xe3>
    4ce8:	eb 12                	jmp    4cfc <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0xdc>
    4cea:	44 8b c0             	mov    %eax,%r8d
    4ced:	a9 01 00 00 00       	test   $0x1,%eax
    4cf2:	74 08                	je     4cfc <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0xdc>
    4cf4:	45 8b 0a             	mov    (%r10),%r9d
    4cf7:	45 3b 0b             	cmp    (%r11),%r9d
    4cfa:	75 07                	jne    4d03 <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0xe3>
    4cfc:	b8 01 00 00 00       	mov    $0x1,%eax
    4d01:	eb 02                	jmp    4d05 <Stub<AMD64ArrayEqualsStub.intArraysEquals>+0xe5>
    4d03:	33 c0                	xor    %eax,%eax
    4d05:	c3                   	retq   
	...
    4d7e:	00 00                	add    %al,(%rax)
    4d80:	12 00                	adc    (%rax),%al
	...

0000000000004da0 <Stub<AMD64ArrayEqualsStub.longArraysEquals>>:
    4da0:	4c 8d 56 10          	lea    0x10(%rsi),%r10
    4da4:	4c 8d 5a 10          	lea    0x10(%rdx),%r11
    4da8:	44 8b c1             	mov    %ecx,%r8d
    4dab:	41 8b c0             	mov    %r8d,%eax
    4dae:	83 e0 03             	and    $0x3,%eax
    4db1:	41 83 e0 fc          	and    $0xfffffffc,%r8d
    4db5:	0f 84 60 00 00 00    	je     4e1b <Stub<AMD64ArrayEqualsStub.longArraysEquals>+0x7b>
    4dbb:	4f 8d 14 c2          	lea    (%r10,%r8,8),%r10
    4dbf:	4f 8d 1c c3          	lea    (%r11,%r8,8),%r11
    4dc3:	49 f7 d8             	neg    %r8
    4dc6:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    4dcd:	00 00 00 
    4dd0:	c4 81 7e 6f 04 c2    	vmovdqu (%r10,%r8,8),%ymm0
    4dd6:	c4 81 7e 6f 0c c3    	vmovdqu (%r11,%r8,8),%ymm1
    4ddc:	c5 fd ef c1          	vpxor  %ymm1,%ymm0,%ymm0
    4de0:	c4 e2 7d 17 c0       	vptest %ymm0,%ymm0
    4de5:	0f 85 89 00 00 00    	jne    4e74 <Stub<AMD64ArrayEqualsStub.longArraysEquals>+0xd4>
    4deb:	49 83 c0 04          	add    $0x4,%r8
    4def:	75 df                	jne    4dd0 <Stub<AMD64ArrayEqualsStub.longArraysEquals>+0x30>
    4df1:	85 c0                	test   %eax,%eax
    4df3:	0f 84 74 00 00 00    	je     4e6d <Stub<AMD64ArrayEqualsStub.longArraysEquals>+0xcd>
    4df9:	c4 c1 7e 6f 44 c2 e0 	vmovdqu -0x20(%r10,%rax,8),%ymm0
    4e00:	c4 c1 7e 6f 4c c3 e0 	vmovdqu -0x20(%r11,%rax,8),%ymm1
    4e07:	c5 fd ef c1          	vpxor  %ymm1,%ymm0,%ymm0
    4e0b:	c4 e2 7d 17 c0       	vptest %ymm0,%ymm0
    4e10:	0f 85 5e 00 00 00    	jne    4e74 <Stub<AMD64ArrayEqualsStub.longArraysEquals>+0xd4>
    4e16:	e9 52 00 00 00       	jmpq   4e6d <Stub<AMD64ArrayEqualsStub.longArraysEquals>+0xcd>
    4e1b:	44 8b c0             	mov    %eax,%r8d
    4e1e:	83 e0 00             	and    $0x0,%eax
    4e21:	41 83 e0 ff          	and    $0xffffffff,%r8d
    4e25:	0f 84 3f 00 00 00    	je     4e6a <Stub<AMD64ArrayEqualsStub.longArraysEquals>+0xca>
    4e2b:	4f 8d 14 c2          	lea    (%r10,%r8,8),%r10
    4e2f:	4f 8d 1c c3          	lea    (%r11,%r8,8),%r11
    4e33:	49 f7 d8             	neg    %r8
    4e36:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    4e3d:	00 00 00 
    4e40:	4f 8b 0c c2          	mov    (%r10,%r8,8),%r9
    4e44:	4f 3b 0c c3          	cmp    (%r11,%r8,8),%r9
    4e48:	0f 85 26 00 00 00    	jne    4e74 <Stub<AMD64ArrayEqualsStub.longArraysEquals>+0xd4>
    4e4e:	49 83 c0 01          	add    $0x1,%r8
    4e52:	75 ec                	jne    4e40 <Stub<AMD64ArrayEqualsStub.longArraysEquals>+0xa0>
    4e54:	85 c0                	test   %eax,%eax
    4e56:	0f 84 11 00 00 00    	je     4e6d <Stub<AMD64ArrayEqualsStub.longArraysEquals>+0xcd>
    4e5c:	4d 8b 4c c2 f8       	mov    -0x8(%r10,%rax,8),%r9
    4e61:	4d 3b 4c c3 f8       	cmp    -0x8(%r11,%rax,8),%r9
    4e66:	75 0c                	jne    4e74 <Stub<AMD64ArrayEqualsStub.longArraysEquals>+0xd4>
    4e68:	eb 03                	jmp    4e6d <Stub<AMD64ArrayEqualsStub.longArraysEquals>+0xcd>
    4e6a:	44 8b c0             	mov    %eax,%r8d
    4e6d:	b8 01 00 00 00       	mov    $0x1,%eax
    4e72:	eb 02                	jmp    4e76 <Stub<AMD64ArrayEqualsStub.longArraysEquals>+0xd6>
    4e74:	33 c0                	xor    %eax,%eax
    4e76:	c3                   	retq   
	...
    4e7f:	00 13                	add    %dl,(%rbx)
	...

0000000000004ea0 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>>:
    4ea0:	4c 8d 56 10          	lea    0x10(%rsi),%r10
    4ea4:	4c 8d 5a 10          	lea    0x10(%rdx),%r11
    4ea8:	44 8b c1             	mov    %ecx,%r8d
    4eab:	41 8b c0             	mov    %r8d,%eax
    4eae:	83 e0 07             	and    $0x7,%eax
    4eb1:	41 83 e0 f8          	and    $0xfffffff8,%r8d
    4eb5:	0f 84 04 01 00 00    	je     4fbf <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x11f>
    4ebb:	4f 8d 14 82          	lea    (%r10,%r8,4),%r10
    4ebf:	4f 8d 1c 83          	lea    (%r11,%r8,4),%r11
    4ec3:	49 f7 d8             	neg    %r8
    4ec6:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    4ecd:	00 00 00 
    4ed0:	c4 81 7e 6f 0c 82    	vmovdqu (%r10,%r8,4),%ymm1
    4ed6:	c4 81 7e 6f 14 83    	vmovdqu (%r11,%r8,4),%ymm2
    4edc:	c5 f5 ef ca          	vpxor  %ymm2,%ymm1,%ymm1
    4ee0:	c4 e2 7d 17 c9       	vptest %ymm1,%ymm1
    4ee5:	0f 85 10 00 00 00    	jne    4efb <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x5b>
    4eeb:	49 83 c0 08          	add    $0x8,%r8
    4eef:	75 df                	jne    4ed0 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x30>
    4ef1:	85 c0                	test   %eax,%eax
    4ef3:	0f 84 ff 01 00 00    	je     50f8 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x258>
    4ef9:	eb 4d                	jmp    4f48 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0xa8>
    4efb:	48 bb 08 00 00 00 00 	movabs $0x8,%rbx
    4f02:	00 00 00 
    4f05:	48 f7 db             	neg    %rbx
    4f08:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    4f0f:	00 
    4f10:	47 8b 0c 82          	mov    (%r10,%r8,4),%r9d
    4f14:	47 3b 0c 83          	cmp    (%r11,%r8,4),%r9d
    4f18:	74 20                	je     4f3a <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x9a>
    4f1a:	c4 81 7a 10 04 82    	vmovss (%r10,%r8,4),%xmm0
    4f20:	c5 f8 2e c0          	vucomiss %xmm0,%xmm0
    4f24:	0f 8b d5 01 00 00    	jnp    50ff <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x25f>
    4f2a:	c4 81 7a 10 04 83    	vmovss (%r11,%r8,4),%xmm0
    4f30:	c5 f8 2e c0          	vucomiss %xmm0,%xmm0
    4f34:	0f 8b c5 01 00 00    	jnp    50ff <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x25f>
    4f3a:	49 ff c0             	inc    %r8
    4f3d:	48 ff c3             	inc    %rbx
    4f40:	75 ce                	jne    4f10 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x70>
    4f42:	49 83 e8 08          	sub    $0x8,%r8
    4f46:	eb a3                	jmp    4eeb <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x4b>
    4f48:	c4 c1 7e 6f 4c 82 e0 	vmovdqu -0x20(%r10,%rax,4),%ymm1
    4f4f:	c4 c1 7e 6f 54 83 e0 	vmovdqu -0x20(%r11,%rax,4),%ymm2
    4f56:	c5 f5 ef ca          	vpxor  %ymm2,%ymm1,%ymm1
    4f5a:	c4 e2 7d 17 c9       	vptest %ymm1,%ymm1
    4f5f:	0f 84 93 01 00 00    	je     50f8 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x258>
    4f65:	48 bb 08 00 00 00 00 	movabs $0x8,%rbx
    4f6c:	00 00 00 
    4f6f:	48 f7 db             	neg    %rbx
    4f72:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    4f79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    4f80:	45 8b 4c 82 e0       	mov    -0x20(%r10,%rax,4),%r9d
    4f85:	45 3b 4c 83 e0       	cmp    -0x20(%r11,%rax,4),%r9d
    4f8a:	74 22                	je     4fae <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x10e>
    4f8c:	c4 c1 7a 10 44 82 e0 	vmovss -0x20(%r10,%rax,4),%xmm0
    4f93:	c5 f8 2e c0          	vucomiss %xmm0,%xmm0
    4f97:	0f 8b 62 01 00 00    	jnp    50ff <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x25f>
    4f9d:	c4 c1 7a 10 44 83 e0 	vmovss -0x20(%r11,%rax,4),%xmm0
    4fa4:	c5 f8 2e c0          	vucomiss %xmm0,%xmm0
    4fa8:	0f 8b 51 01 00 00    	jnp    50ff <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x25f>
    4fae:	48 ff c0             	inc    %rax
    4fb1:	48 ff c3             	inc    %rbx
    4fb4:	75 ca                	jne    4f80 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0xe0>
    4fb6:	48 83 e8 08          	sub    $0x8,%rax
    4fba:	e9 39 01 00 00       	jmpq   50f8 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x258>
    4fbf:	44 8b c0             	mov    %eax,%r8d
    4fc2:	83 e0 01             	and    $0x1,%eax
    4fc5:	41 83 e0 fe          	and    $0xfffffffe,%r8d
    4fc9:	0f 84 f7 00 00 00    	je     50c6 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x226>
    4fcf:	4f 8d 14 82          	lea    (%r10,%r8,4),%r10
    4fd3:	4f 8d 1c 83          	lea    (%r11,%r8,4),%r11
    4fd7:	49 f7 d8             	neg    %r8
    4fda:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    4fe0:	4f 8b 0c 82          	mov    (%r10,%r8,4),%r9
    4fe4:	4f 3b 0c 83          	cmp    (%r11,%r8,4),%r9
    4fe8:	0f 85 10 00 00 00    	jne    4ffe <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x15e>
    4fee:	49 83 c0 02          	add    $0x2,%r8
    4ff2:	75 ec                	jne    4fe0 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x140>
    4ff4:	85 c0                	test   %eax,%eax
    4ff6:	0f 84 fc 00 00 00    	je     50f8 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x258>
    4ffc:	eb 5a                	jmp    5058 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x1b8>
    4ffe:	47 8b 0c 82          	mov    (%r10,%r8,4),%r9d
    5002:	47 3b 0c 83          	cmp    (%r11,%r8,4),%r9d
    5006:	74 20                	je     5028 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x188>
    5008:	c4 81 7a 10 04 82    	vmovss (%r10,%r8,4),%xmm0
    500e:	c5 f8 2e c0          	vucomiss %xmm0,%xmm0
    5012:	0f 8b e7 00 00 00    	jnp    50ff <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x25f>
    5018:	c4 81 7a 10 04 83    	vmovss (%r11,%r8,4),%xmm0
    501e:	c5 f8 2e c0          	vucomiss %xmm0,%xmm0
    5022:	0f 8b d7 00 00 00    	jnp    50ff <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x25f>
    5028:	47 8b 4c 82 04       	mov    0x4(%r10,%r8,4),%r9d
    502d:	47 3b 4c 83 04       	cmp    0x4(%r11,%r8,4),%r9d
    5032:	74 22                	je     5056 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x1b6>
    5034:	c4 81 7a 10 44 82 04 	vmovss 0x4(%r10,%r8,4),%xmm0
    503b:	c5 f8 2e c0          	vucomiss %xmm0,%xmm0
    503f:	0f 8b ba 00 00 00    	jnp    50ff <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x25f>
    5045:	c4 81 7a 10 44 83 04 	vmovss 0x4(%r11,%r8,4),%xmm0
    504c:	c5 f8 2e c0          	vucomiss %xmm0,%xmm0
    5050:	0f 8b a9 00 00 00    	jnp    50ff <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x25f>
    5056:	eb 96                	jmp    4fee <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x14e>
    5058:	4d 8b 4c 82 f8       	mov    -0x8(%r10,%rax,4),%r9
    505d:	4d 3b 4c 83 f8       	cmp    -0x8(%r11,%rax,4),%r9
    5062:	0f 84 90 00 00 00    	je     50f8 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x258>
    5068:	45 8b 4c 82 f8       	mov    -0x8(%r10,%rax,4),%r9d
    506d:	45 3b 4c 83 f8       	cmp    -0x8(%r11,%rax,4),%r9d
    5072:	74 22                	je     5096 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x1f6>
    5074:	c4 c1 7a 10 44 82 f8 	vmovss -0x8(%r10,%rax,4),%xmm0
    507b:	c5 f8 2e c0          	vucomiss %xmm0,%xmm0
    507f:	0f 8b 7a 00 00 00    	jnp    50ff <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x25f>
    5085:	c4 c1 7a 10 44 83 f8 	vmovss -0x8(%r11,%rax,4),%xmm0
    508c:	c5 f8 2e c0          	vucomiss %xmm0,%xmm0
    5090:	0f 8b 69 00 00 00    	jnp    50ff <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x25f>
    5096:	45 8b 4c 82 fc       	mov    -0x4(%r10,%rax,4),%r9d
    509b:	45 3b 4c 83 fc       	cmp    -0x4(%r11,%rax,4),%r9d
    50a0:	74 22                	je     50c4 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x224>
    50a2:	c4 c1 7a 10 44 82 fc 	vmovss -0x4(%r10,%rax,4),%xmm0
    50a9:	c5 f8 2e c0          	vucomiss %xmm0,%xmm0
    50ad:	0f 8b 4c 00 00 00    	jnp    50ff <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x25f>
    50b3:	c4 c1 7a 10 44 83 fc 	vmovss -0x4(%r11,%rax,4),%xmm0
    50ba:	c5 f8 2e c0          	vucomiss %xmm0,%xmm0
    50be:	0f 8b 3b 00 00 00    	jnp    50ff <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x25f>
    50c4:	eb 32                	jmp    50f8 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x258>
    50c6:	44 8b c0             	mov    %eax,%r8d
    50c9:	a9 01 00 00 00       	test   $0x1,%eax
    50ce:	74 28                	je     50f8 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x258>
    50d0:	45 8b 0a             	mov    (%r10),%r9d
    50d3:	45 3b 0b             	cmp    (%r11),%r9d
    50d6:	74 20                	je     50f8 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x258>
    50d8:	c4 c1 7a 10 02       	vmovss (%r10),%xmm0
    50dd:	c5 f8 2e c0          	vucomiss %xmm0,%xmm0
    50e1:	0f 8b 18 00 00 00    	jnp    50ff <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x25f>
    50e7:	c4 c1 7a 10 03       	vmovss (%r11),%xmm0
    50ec:	c5 f8 2e c0          	vucomiss %xmm0,%xmm0
    50f0:	0f 8b 09 00 00 00    	jnp    50ff <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x25f>
    50f6:	eb 00                	jmp    50f8 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x258>
    50f8:	b8 01 00 00 00       	mov    $0x1,%eax
    50fd:	eb 02                	jmp    5101 <Stub<AMD64ArrayEqualsStub.floatArraysEquals>+0x261>
    50ff:	33 c0                	xor    %eax,%eax
    5101:	c3                   	retq   
	...
    517e:	00 00                	add    %al,(%rax)
    5180:	14 00                	adc    $0x0,%al
	...

00000000000051a0 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>>:
    51a0:	4c 8d 56 10          	lea    0x10(%rsi),%r10
    51a4:	4c 8d 5a 10          	lea    0x10(%rdx),%r11
    51a8:	44 8b c1             	mov    %ecx,%r8d
    51ab:	41 8b c0             	mov    %r8d,%eax
    51ae:	83 e0 03             	and    $0x3,%eax
    51b1:	41 83 e0 fc          	and    $0xfffffffc,%r8d
    51b5:	0f 84 04 01 00 00    	je     52bf <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x11f>
    51bb:	4f 8d 14 c2          	lea    (%r10,%r8,8),%r10
    51bf:	4f 8d 1c c3          	lea    (%r11,%r8,8),%r11
    51c3:	49 f7 d8             	neg    %r8
    51c6:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    51cd:	00 00 00 
    51d0:	c4 81 7e 6f 0c c2    	vmovdqu (%r10,%r8,8),%ymm1
    51d6:	c4 81 7e 6f 14 c3    	vmovdqu (%r11,%r8,8),%ymm2
    51dc:	c5 f5 ef ca          	vpxor  %ymm2,%ymm1,%ymm1
    51e0:	c4 e2 7d 17 c9       	vptest %ymm1,%ymm1
    51e5:	0f 85 10 00 00 00    	jne    51fb <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x5b>
    51eb:	49 83 c0 04          	add    $0x4,%r8
    51ef:	75 df                	jne    51d0 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x30>
    51f1:	85 c0                	test   %eax,%eax
    51f3:	0f 84 5e 01 00 00    	je     5357 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1b7>
    51f9:	eb 4d                	jmp    5248 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0xa8>
    51fb:	48 bb 04 00 00 00 00 	movabs $0x4,%rbx
    5202:	00 00 00 
    5205:	48 f7 db             	neg    %rbx
    5208:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    520f:	00 
    5210:	4f 8b 0c c2          	mov    (%r10,%r8,8),%r9
    5214:	4f 3b 0c c3          	cmp    (%r11,%r8,8),%r9
    5218:	74 20                	je     523a <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x9a>
    521a:	c4 81 7b 10 04 c2    	vmovsd (%r10,%r8,8),%xmm0
    5220:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
    5224:	0f 8b 34 01 00 00    	jnp    535e <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1be>
    522a:	c4 81 7b 10 04 c3    	vmovsd (%r11,%r8,8),%xmm0
    5230:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
    5234:	0f 8b 24 01 00 00    	jnp    535e <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1be>
    523a:	49 ff c0             	inc    %r8
    523d:	48 ff c3             	inc    %rbx
    5240:	75 ce                	jne    5210 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x70>
    5242:	49 83 e8 04          	sub    $0x4,%r8
    5246:	eb a3                	jmp    51eb <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x4b>
    5248:	c4 c1 7e 6f 4c c2 e0 	vmovdqu -0x20(%r10,%rax,8),%ymm1
    524f:	c4 c1 7e 6f 54 c3 e0 	vmovdqu -0x20(%r11,%rax,8),%ymm2
    5256:	c5 f5 ef ca          	vpxor  %ymm2,%ymm1,%ymm1
    525a:	c4 e2 7d 17 c9       	vptest %ymm1,%ymm1
    525f:	0f 84 f2 00 00 00    	je     5357 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1b7>
    5265:	48 bb 04 00 00 00 00 	movabs $0x4,%rbx
    526c:	00 00 00 
    526f:	48 f7 db             	neg    %rbx
    5272:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    5279:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    5280:	4d 8b 4c c2 e0       	mov    -0x20(%r10,%rax,8),%r9
    5285:	4d 3b 4c c3 e0       	cmp    -0x20(%r11,%rax,8),%r9
    528a:	74 22                	je     52ae <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x10e>
    528c:	c4 c1 7b 10 44 c2 e0 	vmovsd -0x20(%r10,%rax,8),%xmm0
    5293:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
    5297:	0f 8b c1 00 00 00    	jnp    535e <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1be>
    529d:	c4 c1 7b 10 44 c3 e0 	vmovsd -0x20(%r11,%rax,8),%xmm0
    52a4:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
    52a8:	0f 8b b0 00 00 00    	jnp    535e <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1be>
    52ae:	48 ff c0             	inc    %rax
    52b1:	48 ff c3             	inc    %rbx
    52b4:	75 ca                	jne    5280 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0xe0>
    52b6:	48 83 e8 04          	sub    $0x4,%rax
    52ba:	e9 98 00 00 00       	jmpq   5357 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1b7>
    52bf:	44 8b c0             	mov    %eax,%r8d
    52c2:	83 e0 00             	and    $0x0,%eax
    52c5:	41 83 e0 ff          	and    $0xffffffff,%r8d
    52c9:	0f 84 85 00 00 00    	je     5354 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1b4>
    52cf:	4f 8d 14 c2          	lea    (%r10,%r8,8),%r10
    52d3:	4f 8d 1c c3          	lea    (%r11,%r8,8),%r11
    52d7:	49 f7 d8             	neg    %r8
    52da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    52e0:	4f 8b 0c c2          	mov    (%r10,%r8,8),%r9
    52e4:	4f 3b 0c c3          	cmp    (%r11,%r8,8),%r9
    52e8:	0f 85 10 00 00 00    	jne    52fe <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x15e>
    52ee:	49 83 c0 01          	add    $0x1,%r8
    52f2:	75 ec                	jne    52e0 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x140>
    52f4:	85 c0                	test   %eax,%eax
    52f6:	0f 84 5b 00 00 00    	je     5357 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1b7>
    52fc:	eb 22                	jmp    5320 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x180>
    52fe:	c4 81 7b 10 04 c2    	vmovsd (%r10,%r8,8),%xmm0
    5304:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
    5308:	0f 8b 50 00 00 00    	jnp    535e <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1be>
    530e:	c4 81 7b 10 04 c3    	vmovsd (%r11,%r8,8),%xmm0
    5314:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
    5318:	0f 8b 40 00 00 00    	jnp    535e <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1be>
    531e:	eb ce                	jmp    52ee <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x14e>
    5320:	4d 8b 4c c2 f8       	mov    -0x8(%r10,%rax,8),%r9
    5325:	4d 3b 4c c3 f8       	cmp    -0x8(%r11,%rax,8),%r9
    532a:	0f 84 27 00 00 00    	je     5357 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1b7>
    5330:	c4 c1 7b 10 44 c2 f8 	vmovsd -0x8(%r10,%rax,8),%xmm0
    5337:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
    533b:	0f 8b 1d 00 00 00    	jnp    535e <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1be>
    5341:	c4 c1 7b 10 44 c3 f8 	vmovsd -0x8(%r11,%rax,8),%xmm0
    5348:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
    534c:	0f 8b 0c 00 00 00    	jnp    535e <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1be>
    5352:	eb 03                	jmp    5357 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1b7>
    5354:	44 8b c0             	mov    %eax,%r8d
    5357:	b8 01 00 00 00       	mov    $0x1,%eax
    535c:	eb 02                	jmp    5360 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1c0>
    535e:	33 c0                	xor    %eax,%eax
    5360:	c3                   	retq   
	...
    537d:	00 00                	add    %al,(%rax)
    537f:	00 15 00 00 00 00    	add    %dl,0x0(%rip)        # 5385 <Stub<AMD64ArrayEqualsStub.doubleArraysEquals>+0x1e5>
	...

00000000000053a0 <Stub<AMD64MathStub.sin>>:
    53a0:	53                   	push   %rbx
    53a1:	48 83 ec 10          	sub    $0x10,%rsp
    53a5:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
    53ab:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    53af:	c4 c1 7a 7e 0d f0 a2 	vmovq  0xa2f0(%rip),%xmm1        # f6a8 <data.M21.0>
    53b6:	00 00 
    53b8:	c4 c1 7a 7e 15 ef a2 	vmovq  0xa2ef(%rip),%xmm2        # f6b0 <data.M21.8>
    53bf:	00 00 
    53c1:	81 e0 00 00 ff 7f    	and    $0x7fff0000,%eax
    53c7:	81 e8 00 00 30 30    	sub    $0x30300000,%eax
    53cd:	81 f8 00 00 c5 10    	cmp    $0x10c50000,%eax
    53d3:	0f 87 4f 01 00 00    	ja     5528 <Stub<AMD64MathStub.sin>+0x188>
    53d9:	c5 f3 59 c8          	vmulsd %xmm0,%xmm1,%xmm1
    53dd:	c4 c1 7a 6f 2d da a2 	vmovdqu 0xa2da(%rip),%xmm5        # f6c0 <data.M21.96>
    53e4:	00 00 
    53e6:	c4 c1 7a 7e 25 e1 a2 	vmovq  0xa2e1(%rip),%xmm4        # f6d0 <data.M21.16>
    53ed:	00 00 
    53ef:	c5 d9 db e0          	vpand  %xmm0,%xmm4,%xmm4
    53f3:	c5 d1 eb ec          	vpor   %xmm4,%xmm5,%xmm5
    53f7:	c5 f1 58 cd          	vaddpd %xmm5,%xmm1,%xmm1
    53fb:	c5 fb 2c d1          	vcvttsd2si %xmm1,%edx
    53ff:	c5 f3 2a ca          	vcvtsi2sd %edx,%xmm1,%xmm1
    5403:	c4 c1 7a 6f 35 d4 a2 	vmovdqu 0xa2d4(%rip),%xmm6        # f6e0 <data.M21.112>
    540a:	00 00 
    540c:	49 b8 00 00 40 54 fb 	movabs $0x3fb921fb54400000,%r8
    5413:	21 b9 3f 
    5416:	c4 c1 f9 6e d8       	vmovq  %r8,%xmm3
    541b:	c4 c1 7a 6f 2d cc a2 	vmovdqu 0xa2cc(%rip),%xmm5        # f6f0 <data.M21.128>
    5422:	00 00 
    5424:	c5 f9 70 e0 44       	vpshufd $0x44,%xmm0,%xmm4
    5429:	c5 e3 59 d9          	vmulsd %xmm1,%xmm3,%xmm3
    542d:	c5 fb 12 c9          	vmovddup %xmm1,%xmm1
    5431:	83 e2 3f             	and    $0x3f,%edx
    5434:	c1 e2 05             	shl    $0x5,%edx
    5437:	48 8d 05 c2 a2 00 00 	lea    0xa2c2(%rip),%rax        # f700 <data.M21.144>
    543e:	48 03 c2             	add    %rdx,%rax
    5441:	c5 c9 59 f1          	vmulpd %xmm1,%xmm6,%xmm6
    5445:	c4 c1 73 59 0d b2 aa 	vmulsd 0xaab2(%rip),%xmm1,%xmm1        # ff00 <data.M21.24>
    544c:	00 00 
    544e:	c5 db 5c e3          	vsubsd %xmm3,%xmm4,%xmm4
    5452:	c5 fa 7e 78 08       	vmovq  0x8(%rax),%xmm7
    5457:	c5 fb 5c c3          	vsubsd %xmm3,%xmm0,%xmm0
    545b:	c5 fb 12 dc          	vmovddup %xmm4,%xmm3
    545f:	c5 db 5c e6          	vsubsd %xmm6,%xmm4,%xmm4
    5463:	c5 f9 70 c0 44       	vpshufd $0x44,%xmm0,%xmm0
    5468:	c5 fa 6f 10          	vmovdqu (%rax),%xmm2
    546c:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    5470:	c5 f9 5c c6          	vsubpd %xmm6,%xmm0,%xmm0
    5474:	c5 c3 59 fc          	vmulsd %xmm4,%xmm7,%xmm7
    5478:	c5 e3 5c dc          	vsubsd %xmm4,%xmm3,%xmm3
    547c:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    5480:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    5484:	c5 e3 5c de          	vsubsd %xmm6,%xmm3,%xmm3
    5488:	c4 c1 7a 6f 35 7f aa 	vmovdqu 0xaa7f(%rip),%xmm6        # ff10 <data.M21.2192>
    548f:	00 00 
    5491:	c5 f3 5c cb          	vsubsd %xmm3,%xmm1,%xmm1
    5495:	c5 fa 7e 58 18       	vmovq  0x18(%rax),%xmm3
    549a:	c5 eb 58 d3          	vaddsd %xmm3,%xmm2,%xmm2
    549e:	c5 c3 5c fa          	vsubsd %xmm2,%xmm7,%xmm7
    54a2:	c5 eb 59 d4          	vmulsd %xmm4,%xmm2,%xmm2
    54a6:	c5 c9 59 f0          	vmulpd %xmm0,%xmm6,%xmm6
    54aa:	c5 e3 59 dc          	vmulsd %xmm4,%xmm3,%xmm3
    54ae:	c5 e9 59 d0          	vmulpd %xmm0,%xmm2,%xmm2
    54b2:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    54b6:	c4 c1 51 58 2d 61 aa 	vaddpd 0xaa61(%rip),%xmm5,%xmm5        # ff20 <data.M21.2208>
    54bd:	00 00 
    54bf:	c5 db 59 20          	vmulsd (%rax),%xmm4,%xmm4
    54c3:	c4 c1 49 58 35 64 aa 	vaddpd 0xaa64(%rip),%xmm6,%xmm6        # ff30 <data.M21.2224>
    54ca:	00 00 
    54cc:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    54d0:	c5 fa 6f c3          	vmovdqu %xmm3,%xmm0
    54d4:	c5 e3 58 58 08       	vaddsd 0x8(%rax),%xmm3,%xmm3
    54d9:	c5 f1 59 cf          	vmulpd %xmm7,%xmm1,%xmm1
    54dd:	c5 fa 6f fc          	vmovdqu %xmm4,%xmm7
    54e1:	c5 db 58 e3          	vaddsd %xmm3,%xmm4,%xmm4
    54e5:	c5 c9 58 f5          	vaddpd %xmm5,%xmm6,%xmm6
    54e9:	c5 fa 7e 68 08       	vmovq  0x8(%rax),%xmm5
    54ee:	c5 d3 5c eb          	vsubsd %xmm3,%xmm5,%xmm5
    54f2:	c5 e3 5c dc          	vsubsd %xmm4,%xmm3,%xmm3
    54f6:	c5 f3 58 48 10       	vaddsd 0x10(%rax),%xmm1,%xmm1
    54fb:	c5 c9 59 f2          	vmulpd %xmm2,%xmm6,%xmm6
    54ff:	c5 d3 58 e8          	vaddsd %xmm0,%xmm5,%xmm5
    5503:	c5 e3 58 df          	vaddsd %xmm7,%xmm3,%xmm3
    5507:	c5 f3 58 cd          	vaddsd %xmm5,%xmm1,%xmm1
    550b:	c5 f3 58 cb          	vaddsd %xmm3,%xmm1,%xmm1
    550f:	c5 f3 58 ce          	vaddsd %xmm6,%xmm1,%xmm1
    5513:	c5 c9 15 f6          	vunpckhpd %xmm6,%xmm6,%xmm6
    5517:	c5 fa 6f c4          	vmovdqu %xmm4,%xmm0
    551b:	c5 f3 58 ce          	vaddsd %xmm6,%xmm1,%xmm1
    551f:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
    5523:	e9 11 05 00 00       	jmpq   5a39 <Stub<AMD64MathStub.sin>+0x699>
    5528:	0f 8f 3c 00 00 00    	jg     556a <Stub<AMD64MathStub.sin>+0x1ca>
    552e:	c1 e8 14             	shr    $0x14,%eax
    5531:	81 f8 fd 0c 00 00    	cmp    $0xcfd,%eax
    5537:	0f 85 0e 00 00 00    	jne    554b <Stub<AMD64MathStub.sin>+0x1ab>
    553d:	c4 c1 7b 59 05 fa a9 	vmulsd 0xa9fa(%rip),%xmm0,%xmm0        # ff40 <data.M21.32>
    5544:	00 00 
    5546:	e9 ee 04 00 00       	jmpq   5a39 <Stub<AMD64MathStub.sin>+0x699>
    554b:	c4 c1 7a 7e 1d f4 a9 	vmovq  0xa9f4(%rip),%xmm3        # ff48 <data.M21.40>
    5552:	00 00 
    5554:	c5 e3 59 d8          	vmulsd %xmm0,%xmm3,%xmm3
    5558:	c5 e3 5c d8          	vsubsd %xmm0,%xmm3,%xmm3
    555c:	c4 c1 63 59 1d eb a9 	vmulsd 0xa9eb(%rip),%xmm3,%xmm3        # ff50 <data.M21.48>
    5563:	00 00 
    5565:	e9 cf 04 00 00       	jmpq   5a39 <Stub<AMD64MathStub.sin>+0x699>
    556a:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    556f:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    5575:	81 f8 f0 7f 00 00    	cmp    $0x7ff0,%eax
    557b:	0f 84 a4 04 00 00    	je     5a25 <Stub<AMD64MathStub.sin>+0x685>
    5581:	c5 f9 c5 c8 03       	vpextrw $0x3,%xmm0,%ecx
    5586:	81 e1 f0 7f 00 00    	and    $0x7ff0,%ecx
    558c:	81 e9 60 3f 00 00    	sub    $0x3f60,%ecx
    5592:	c1 e9 07             	shr    $0x7,%ecx
    5595:	81 e1 fc ff 00 00    	and    $0xfffc,%ecx
    559b:	4c 8d 1d be a9 00 00 	lea    0xa9be(%rip),%r11        # ff60 <data.M21.2240>
    55a2:	49 03 cb             	add    %r11,%rcx
    55a5:	c4 e1 f9 7e c0       	vmovq  %xmm0,%rax
    55aa:	44 8b 51 14          	mov    0x14(%rcx),%r10d
    55ae:	44 8b 41 18          	mov    0x18(%rcx),%r8d
    55b2:	8b d0                	mov    %eax,%edx
    55b4:	48 c1 e8 15          	shr    $0x15,%rax
    55b8:	81 c8 00 00 00 80    	or     $0x80000000,%eax
    55be:	c1 e8 0b             	shr    $0xb,%eax
    55c1:	45 8b ca             	mov    %r10d,%r9d
    55c4:	4c 0f af d2          	imul   %rdx,%r10
    55c8:	4c 0f af c8          	imul   %rax,%r9
    55cc:	4c 0f af c0          	imul   %rax,%r8
    55d0:	8b 71 10             	mov    0x10(%rcx),%esi
    55d3:	8b 79 0c             	mov    0xc(%rcx),%edi
    55d6:	45 8b da             	mov    %r10d,%r11d
    55d9:	49 c1 ea 20          	shr    $0x20,%r10
    55dd:	4d 03 ca             	add    %r10,%r9
    55e0:	4d 03 d8             	add    %r8,%r11
    55e3:	45 8b c3             	mov    %r11d,%r8d
    55e6:	49 c1 eb 20          	shr    $0x20,%r11
    55ea:	4d 03 cb             	add    %r11,%r9
    55ed:	44 8b d6             	mov    %esi,%r10d
    55f0:	48 0f af f2          	imul   %rdx,%rsi
    55f4:	4c 0f af d0          	imul   %rax,%r10
    55f8:	44 8b df             	mov    %edi,%r11d
    55fb:	48 0f af fa          	imul   %rdx,%rdi
    55ff:	8b de                	mov    %esi,%ebx
    5601:	48 c1 ee 20          	shr    $0x20,%rsi
    5605:	4c 03 cb             	add    %rbx,%r9
    5608:	41 8b d9             	mov    %r9d,%ebx
    560b:	49 c1 e9 20          	shr    $0x20,%r9
    560f:	4c 03 d6             	add    %rsi,%r10
    5612:	4d 03 d1             	add    %r9,%r10
    5615:	48 c1 e3 20          	shl    $0x20,%rbx
    5619:	4c 0b c3             	or     %rbx,%r8
    561c:	4c 0f af d8          	imul   %rax,%r11
    5620:	44 8b 49 08          	mov    0x8(%rcx),%r9d
    5624:	8b 71 04             	mov    0x4(%rcx),%esi
    5627:	8b df                	mov    %edi,%ebx
    5629:	48 c1 ef 20          	shr    $0x20,%rdi
    562d:	4c 03 d3             	add    %rbx,%r10
    5630:	41 8b da             	mov    %r10d,%ebx
    5633:	49 c1 ea 20          	shr    $0x20,%r10
    5637:	4c 03 df             	add    %rdi,%r11
    563a:	4d 03 da             	add    %r10,%r11
    563d:	49 8b f9             	mov    %r9,%rdi
    5640:	4c 0f af ca          	imul   %rdx,%r9
    5644:	48 0f af f8          	imul   %rax,%rdi
    5648:	45 8b d1             	mov    %r9d,%r10d
    564b:	49 c1 e9 20          	shr    $0x20,%r9
    564f:	4d 03 da             	add    %r10,%r11
    5652:	45 8b d3             	mov    %r11d,%r10d
    5655:	49 c1 eb 20          	shr    $0x20,%r11
    5659:	49 03 f9             	add    %r9,%rdi
    565c:	49 03 fb             	add    %r11,%rdi
    565f:	4c 8b ce             	mov    %rsi,%r9
    5662:	48 0f af f2          	imul   %rdx,%rsi
    5666:	4c 0f af c8          	imul   %rax,%r9
    566a:	49 c1 e2 20          	shl    $0x20,%r10
    566e:	4c 0b d3             	or     %rbx,%r10
    5671:	8b 01                	mov    (%rcx),%eax
    5673:	44 8b de             	mov    %esi,%r11d
    5676:	48 c1 ee 20          	shr    $0x20,%rsi
    567a:	49 03 fb             	add    %r11,%rdi
    567d:	44 8b df             	mov    %edi,%r11d
    5680:	48 c1 ef 20          	shr    $0x20,%rdi
    5684:	4c 03 ce             	add    %rsi,%r9
    5687:	4c 03 cf             	add    %rdi,%r9
    568a:	48 0f af d0          	imul   %rax,%rdx
    568e:	c5 f9 c5 d8 03       	vpextrw $0x3,%xmm0,%ebx
    5693:	48 8d 3d c6 a8 00 00 	lea    0xa8c6(%rip),%rdi        # ff60 <data.M21.2240>
    569a:	48 2b cf             	sub    %rdi,%rcx
    569d:	03 c9                	add    %ecx,%ecx
    569f:	03 c9                	add    %ecx,%ecx
    56a1:	03 c9                	add    %ecx,%ecx
    56a3:	83 c1 13             	add    $0x13,%ecx
    56a6:	be 00 80 00 00       	mov    $0x8000,%esi
    56ab:	23 f3                	and    %ebx,%esi
    56ad:	c1 eb 04             	shr    $0x4,%ebx
    56b0:	81 e3 ff 07 00 00    	and    $0x7ff,%ebx
    56b6:	81 eb ff 03 00 00    	sub    $0x3ff,%ebx
    56bc:	2b cb                	sub    %ebx,%ecx
    56be:	4c 03 ca             	add    %rdx,%r9
    56c1:	8b d1                	mov    %ecx,%edx
    56c3:	83 c2 20             	add    $0x20,%edx
    56c6:	83 f9 01             	cmp    $0x1,%ecx
    56c9:	0f 8c a6 02 00 00    	jl     5975 <Stub<AMD64MathStub.sin>+0x5d5>
    56cf:	f7 d9                	neg    %ecx
    56d1:	83 c1 1d             	add    $0x1d,%ecx
    56d4:	41 d3 e1             	shl    %cl,%r9d
    56d7:	41 8b f9             	mov    %r9d,%edi
    56da:	41 81 e1 ff ff ff 1f 	and    $0x1fffffff,%r9d
    56e1:	41 f7 c1 00 00 00 10 	test   $0x10000000,%r9d
    56e8:	0f 85 b4 02 00 00    	jne    59a2 <Stub<AMD64MathStub.sin>+0x602>
    56ee:	41 d3 e9             	shr    %cl,%r9d
    56f1:	bb 00 00 00 00       	mov    $0x0,%ebx
    56f6:	49 c1 e1 20          	shl    $0x20,%r9
    56fa:	4d 0b cb             	or     %r11,%r9
    56fd:	49 83 f9 00          	cmp    $0x0,%r9
    5701:	0f 84 12 02 00 00    	je     5919 <Stub<AMD64MathStub.sin>+0x579>
    5707:	4d 0f bd d9          	bsr    %r9,%r11
    570b:	b9 1d 00 00 00       	mov    $0x1d,%ecx
    5710:	41 2b cb             	sub    %r11d,%ecx
    5713:	0f 8e 39 02 00 00    	jle    5952 <Stub<AMD64MathStub.sin>+0x5b2>
    5719:	49 d3 e1             	shl    %cl,%r9
    571c:	49 8b c2             	mov    %r10,%rax
    571f:	49 d3 e2             	shl    %cl,%r10
    5722:	03 d1                	add    %ecx,%edx
    5724:	f7 d9                	neg    %ecx
    5726:	83 c1 40             	add    $0x40,%ecx
    5729:	48 d3 e8             	shr    %cl,%rax
    572c:	49 d3 e8             	shr    %cl,%r8
    572f:	4c 0b c8             	or     %rax,%r9
    5732:	4d 0b d0             	or     %r8,%r10
    5735:	c4 c1 fb 2a c1       	vcvtsi2sd %r9,%xmm0,%xmm0
    573a:	49 d1 ea             	shr    %r10
    573d:	c4 c1 e3 2a da       	vcvtsi2sd %r10,%xmm3,%xmm3
    5742:	c5 d9 57 e4          	vxorpd %xmm4,%xmm4,%xmm4
    5746:	c1 e2 04             	shl    $0x4,%edx
    5749:	f7 da                	neg    %edx
    574b:	81 c2 f0 3f 00 00    	add    $0x3ff0,%edx
    5751:	0b d6                	or     %esi,%edx
    5753:	33 d3                	xor    %ebx,%edx
    5755:	c5 d9 c4 e2 03       	vpinsrw $0x3,%edx,%xmm4,%xmm4
    575a:	c4 c1 7a 7e 15 ad a8 	vmovq  0xa8ad(%rip),%xmm2        # 10010 <data.M21.56>
    5761:	00 00 
    5763:	c4 c1 7a 7e 35 ac a8 	vmovq  0xa8ac(%rip),%xmm6        # 10018 <data.M21.64>
    576a:	00 00 
    576c:	c5 d1 57 ed          	vxorpd %xmm5,%xmm5,%xmm5
    5770:	81 ea f0 03 00 00    	sub    $0x3f0,%edx
    5776:	c5 d1 c4 ea 03       	vpinsrw $0x3,%edx,%xmm5,%xmm5
    577b:	c5 fb 59 c4          	vmulsd %xmm4,%xmm0,%xmm0
    577f:	c1 e6 10             	shl    $0x10,%esi
    5782:	c1 fe 1f             	sar    $0x1f,%esi
    5785:	c5 e3 59 dd          	vmulsd %xmm5,%xmm3,%xmm3
    5789:	c5 fa 6f c8          	vmovdqu %xmm0,%xmm1
    578d:	c5 fb 59 c2          	vmulsd %xmm2,%xmm0,%xmm0
    5791:	c1 ef 1d             	shr    $0x1d,%edi
    5794:	c5 f3 58 cb          	vaddsd %xmm3,%xmm1,%xmm1
    5798:	c5 e3 59 da          	vmulsd %xmm2,%xmm3,%xmm3
    579c:	03 fe                	add    %esi,%edi
    579e:	33 fe                	xor    %esi,%edi
    57a0:	c5 cb 59 f1          	vmulsd %xmm1,%xmm6,%xmm6
    57a4:	8b c7                	mov    %edi,%eax
    57a6:	c5 cb 58 f3          	vaddsd %xmm3,%xmm6,%xmm6
    57aa:	c5 fa 6f d0          	vmovdqu %xmm0,%xmm2
    57ae:	c5 fb 58 c6          	vaddsd %xmm6,%xmm0,%xmm0
    57b2:	c5 eb 5c d0          	vsubsd %xmm0,%xmm2,%xmm2
    57b6:	c5 cb 58 f2          	vaddsd %xmm2,%xmm6,%xmm6
    57ba:	c4 c1 7a 7e 0d e5 9e 	vmovq  0x9ee5(%rip),%xmm1        # f6a8 <data.M21.0>
    57c1:	00 00 
    57c3:	c5 f3 59 c8          	vmulsd %xmm0,%xmm1,%xmm1
    57c7:	c4 c1 7a 7e 2d f0 9e 	vmovq  0x9ef0(%rip),%xmm5        # f6c0 <data.M21.96>
    57ce:	00 00 
    57d0:	c4 c1 7a 7e 25 f7 9e 	vmovq  0x9ef7(%rip),%xmm4        # f6d0 <data.M21.16>
    57d7:	00 00 
    57d9:	c5 d9 db e0          	vpand  %xmm0,%xmm4,%xmm4
    57dd:	c5 d1 eb ec          	vpor   %xmm4,%xmm5,%xmm5
    57e1:	c5 f1 58 cd          	vaddpd %xmm5,%xmm1,%xmm1
    57e5:	c5 fb 2c d1          	vcvttsd2si %xmm1,%edx
    57e9:	c5 f3 2a ca          	vcvtsi2sd %edx,%xmm1,%xmm1
    57ed:	c4 c1 7a 7e 1d 2a a8 	vmovq  0xa82a(%rip),%xmm3        # 10020 <data.M21.72>
    57f4:	00 00 
    57f6:	c4 c1 7a 6f 15 e1 9e 	vmovdqu 0x9ee1(%rip),%xmm2        # f6e0 <data.M21.112>
    57fd:	00 00 
    57ff:	c5 e3 59 d9          	vmulsd %xmm1,%xmm3,%xmm3
    5803:	c5 f1 14 c9          	vunpcklpd %xmm1,%xmm1,%xmm1
    5807:	c1 e0 03             	shl    $0x3,%eax
    580a:	81 c2 00 76 1c 00    	add    $0x1c7600,%edx
    5810:	c5 fa 6f e0          	vmovdqu %xmm0,%xmm4
    5814:	03 d0                	add    %eax,%edx
    5816:	83 e2 3f             	and    $0x3f,%edx
    5819:	c4 c1 7a 6f 2d ce 9e 	vmovdqu 0x9ece(%rip),%xmm5        # f6f0 <data.M21.128>
    5820:	00 00 
    5822:	48 8d 05 d7 9e 00 00 	lea    0x9ed7(%rip),%rax        # f700 <data.M21.144>
    5829:	c1 e2 05             	shl    $0x5,%edx
    582c:	48 03 c2             	add    %rdx,%rax
    582f:	c5 e9 59 d1          	vmulpd %xmm1,%xmm2,%xmm2
    5833:	c5 fb 5c c3          	vsubsd %xmm3,%xmm0,%xmm0
    5837:	c4 c1 73 59 0d c0 a6 	vmulsd 0xa6c0(%rip),%xmm1,%xmm1        # ff00 <data.M21.24>
    583e:	00 00 
    5840:	c5 db 5c e3          	vsubsd %xmm3,%xmm4,%xmm4
    5844:	c5 fa 7e 78 08       	vmovq  0x8(%rax),%xmm7
    5849:	c5 f9 14 c0          	vunpcklpd %xmm0,%xmm0,%xmm0
    584d:	c5 fa 6f dc          	vmovdqu %xmm4,%xmm3
    5851:	c5 db 5c e2          	vsubsd %xmm2,%xmm4,%xmm4
    5855:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    5859:	c5 f9 5c c2          	vsubpd %xmm2,%xmm0,%xmm0
    585d:	c5 c3 59 fc          	vmulsd %xmm4,%xmm7,%xmm7
    5861:	c5 e3 5c dc          	vsubsd %xmm4,%xmm3,%xmm3
    5865:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    5869:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    586d:	c5 e3 5c da          	vsubsd %xmm2,%xmm3,%xmm3
    5871:	c5 fa 6f 10          	vmovdqu (%rax),%xmm2
    5875:	c5 f3 5c cb          	vsubsd %xmm3,%xmm1,%xmm1
    5879:	c5 fa 7e 58 18       	vmovq  0x18(%rax),%xmm3
    587e:	c5 eb 58 d3          	vaddsd %xmm3,%xmm2,%xmm2
    5882:	c5 c3 5c fa          	vsubsd %xmm2,%xmm7,%xmm7
    5886:	c5 f3 5c ce          	vsubsd %xmm6,%xmm1,%xmm1
    588a:	c4 c1 7a 6f 35 7d a6 	vmovdqu 0xa67d(%rip),%xmm6        # ff10 <data.M21.2192>
    5891:	00 00 
    5893:	c5 eb 59 d4          	vmulsd %xmm4,%xmm2,%xmm2
    5897:	c5 c9 59 f0          	vmulpd %xmm0,%xmm6,%xmm6
    589b:	c5 e3 59 dc          	vmulsd %xmm4,%xmm3,%xmm3
    589f:	c5 e9 59 d0          	vmulpd %xmm0,%xmm2,%xmm2
    58a3:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    58a7:	c4 c1 51 58 2d 70 a6 	vaddpd 0xa670(%rip),%xmm5,%xmm5        # ff20 <data.M21.2208>
    58ae:	00 00 
    58b0:	c5 db 59 20          	vmulsd (%rax),%xmm4,%xmm4
    58b4:	c4 c1 49 58 35 73 a6 	vaddpd 0xa673(%rip),%xmm6,%xmm6        # ff30 <data.M21.2224>
    58bb:	00 00 
    58bd:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    58c1:	c5 fa 6f c3          	vmovdqu %xmm3,%xmm0
    58c5:	c5 e3 58 58 08       	vaddsd 0x8(%rax),%xmm3,%xmm3
    58ca:	c5 f1 59 cf          	vmulpd %xmm7,%xmm1,%xmm1
    58ce:	c5 fa 6f fc          	vmovdqu %xmm4,%xmm7
    58d2:	c5 db 58 e3          	vaddsd %xmm3,%xmm4,%xmm4
    58d6:	c5 c9 58 f5          	vaddpd %xmm5,%xmm6,%xmm6
    58da:	c5 fa 7e 68 08       	vmovq  0x8(%rax),%xmm5
    58df:	c5 d3 5c eb          	vsubsd %xmm3,%xmm5,%xmm5
    58e3:	c5 e3 5c dc          	vsubsd %xmm4,%xmm3,%xmm3
    58e7:	c5 f3 58 48 10       	vaddsd 0x10(%rax),%xmm1,%xmm1
    58ec:	c5 c9 59 f2          	vmulpd %xmm2,%xmm6,%xmm6
    58f0:	c5 d3 58 e8          	vaddsd %xmm0,%xmm5,%xmm5
    58f4:	c5 e3 58 df          	vaddsd %xmm7,%xmm3,%xmm3
    58f8:	c5 f3 58 cd          	vaddsd %xmm5,%xmm1,%xmm1
    58fc:	c5 f3 58 cb          	vaddsd %xmm3,%xmm1,%xmm1
    5900:	c5 f3 58 ce          	vaddsd %xmm6,%xmm1,%xmm1
    5904:	c5 c9 15 f6          	vunpckhpd %xmm6,%xmm6,%xmm6
    5908:	c5 fa 6f c4          	vmovdqu %xmm4,%xmm0
    590c:	c5 f3 58 ce          	vaddsd %xmm6,%xmm1,%xmm1
    5910:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
    5914:	e9 20 01 00 00       	jmpq   5a39 <Stub<AMD64MathStub.sin>+0x699>
    5919:	83 c2 40             	add    $0x40,%edx
    591c:	4d 8b ca             	mov    %r10,%r9
    591f:	4d 8b d0             	mov    %r8,%r10
    5922:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    5928:	49 83 f9 00          	cmp    $0x0,%r9
    592c:	0f 85 d5 fd ff ff    	jne    5707 <Stub<AMD64MathStub.sin>+0x367>
    5932:	83 c2 40             	add    $0x40,%edx
    5935:	4d 8b ca             	mov    %r10,%r9
    5938:	4d 8b d0             	mov    %r8,%r10
    593b:	49 83 f9 00          	cmp    $0x0,%r9
    593f:	0f 85 c2 fd ff ff    	jne    5707 <Stub<AMD64MathStub.sin>+0x367>
    5945:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    5949:	c5 c9 57 f6          	vxorpd %xmm6,%xmm6,%xmm6
    594d:	e9 68 fe ff ff       	jmpq   57ba <Stub<AMD64MathStub.sin>+0x41a>
    5952:	0f 84 dd fd ff ff    	je     5735 <Stub<AMD64MathStub.sin>+0x395>
    5958:	f7 d9                	neg    %ecx
    595a:	49 d3 ea             	shr    %cl,%r10
    595d:	49 8b c1             	mov    %r9,%rax
    5960:	49 d3 e9             	shr    %cl,%r9
    5963:	2b d1                	sub    %ecx,%edx
    5965:	f7 d9                	neg    %ecx
    5967:	83 c1 40             	add    $0x40,%ecx
    596a:	48 d3 e0             	shl    %cl,%rax
    596d:	4c 0b d0             	or     %rax,%r10
    5970:	e9 c0 fd ff ff       	jmpq   5735 <Stub<AMD64MathStub.sin>+0x395>
    5975:	f7 d9                	neg    %ecx
    5977:	49 c1 e1 20          	shl    $0x20,%r9
    597b:	4d 0b cb             	or     %r11,%r9
    597e:	49 d3 e1             	shl    %cl,%r9
    5981:	49 8b f9             	mov    %r9,%rdi
    5984:	41 f7 c1 00 00 00 80 	test   $0x80000000,%r9d
    598b:	0f 85 53 00 00 00    	jne    59e4 <Stub<AMD64MathStub.sin>+0x644>
    5991:	41 d3 e9             	shr    %cl,%r9d
    5994:	bb 00 00 00 00       	mov    $0x0,%ebx
    5999:	48 c1 ef 03          	shr    $0x3,%rdi
    599d:	e9 5b fd ff ff       	jmpq   56fd <Stub<AMD64MathStub.sin>+0x35d>
    59a2:	41 d3 e9             	shr    %cl,%r9d
    59a5:	bb 00 00 00 20       	mov    $0x20000000,%ebx
    59aa:	d3 eb                	shr    %cl,%ebx
    59ac:	49 c1 e1 20          	shl    $0x20,%r9
    59b0:	4d 0b cb             	or     %r11,%r9
    59b3:	48 c1 e3 20          	shl    $0x20,%rbx
    59b7:	81 c7 00 00 00 20    	add    $0x20000000,%edi
    59bd:	b9 00 00 00 00       	mov    $0x0,%ecx
    59c2:	41 bb 00 00 00 00    	mov    $0x0,%r11d
    59c8:	49 2b c8             	sub    %r8,%rcx
    59cb:	4d 1b da             	sbb    %r10,%r11
    59ce:	49 1b d9             	sbb    %r9,%rbx
    59d1:	4c 8b c1             	mov    %rcx,%r8
    59d4:	4d 8b d3             	mov    %r11,%r10
    59d7:	4c 8b cb             	mov    %rbx,%r9
    59da:	bb 00 80 00 00       	mov    $0x8000,%ebx
    59df:	e9 19 fd ff ff       	jmpq   56fd <Stub<AMD64MathStub.sin>+0x35d>
    59e4:	41 d3 e9             	shr    %cl,%r9d
    59e7:	48 bb 00 00 00 00 01 	movabs $0x100000000,%rbx
    59ee:	00 00 00 
    59f1:	48 d3 eb             	shr    %cl,%rbx
    59f4:	b9 00 00 00 00       	mov    $0x0,%ecx
    59f9:	41 bb 00 00 00 00    	mov    $0x0,%r11d
    59ff:	49 2b c8             	sub    %r8,%rcx
    5a02:	4d 1b da             	sbb    %r10,%r11
    5a05:	49 1b d9             	sbb    %r9,%rbx
    5a08:	4c 8b c1             	mov    %rcx,%r8
    5a0b:	4d 8b d3             	mov    %r11,%r10
    5a0e:	4c 8b cb             	mov    %rbx,%r9
    5a11:	bb 00 80 00 00       	mov    $0x8000,%ebx
    5a16:	48 c1 ef 03          	shr    $0x3,%rdi
    5a1a:	81 c7 00 00 00 20    	add    $0x20000000,%edi
    5a20:	e9 d8 fc ff ff       	jmpq   56fd <Stub<AMD64MathStub.sin>+0x35d>
    5a25:	c5 fa 7e 44 24 08    	vmovq  0x8(%rsp),%xmm0
    5a2b:	c4 c1 7b 59 05 f4 a5 	vmulsd 0xa5f4(%rip),%xmm0,%xmm0        # 10028 <data.M21.80>
    5a32:	00 00 
    5a34:	c5 f9 d6 04 24       	vmovq  %xmm0,(%rsp)
    5a39:	48 83 c4 10          	add    $0x10,%rsp
    5a3d:	5b                   	pop    %rbx
    5a3e:	c3                   	retq   
	...
    5a7f:	00 16                	add    %dl,(%rsi)
	...

0000000000005aa0 <Stub<AMD64MathStub.cos>>:
    5aa0:	53                   	push   %rbx
    5aa1:	48 83 ec 10          	sub    $0x10,%rsp
    5aa5:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
    5aab:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    5aaf:	c4 c1 7a 7e 0d 78 a5 	vmovq  0xa578(%rip),%xmm1        # 10030 <data.M22.0>
    5ab6:	00 00 
    5ab8:	81 e0 00 00 ff 7f    	and    $0x7fff0000,%eax
    5abe:	81 e8 00 00 30 30    	sub    $0x30300000,%eax
    5ac4:	81 f8 00 00 c5 10    	cmp    $0x10c50000,%eax
    5aca:	0f 87 4c 01 00 00    	ja     5c1c <Stub<AMD64MathStub.cos>+0x17c>
    5ad0:	c5 f3 59 c8          	vmulsd %xmm0,%xmm1,%xmm1
    5ad4:	c4 c1 7a 6f 2d 63 a5 	vmovdqu 0xa563(%rip),%xmm5        # 10040 <data.M22.80>
    5adb:	00 00 
    5add:	c4 c1 7a 7e 25 6a a5 	vmovq  0xa56a(%rip),%xmm4        # 10050 <data.M22.8>
    5ae4:	00 00 
    5ae6:	c5 d9 db e0          	vpand  %xmm0,%xmm4,%xmm4
    5aea:	c5 d1 eb ec          	vpor   %xmm4,%xmm5,%xmm5
    5aee:	c5 f1 58 cd          	vaddpd %xmm5,%xmm1,%xmm1
    5af2:	c5 fb 2c d1          	vcvttsd2si %xmm1,%edx
    5af6:	c5 f3 2a ca          	vcvtsi2sd %edx,%xmm1,%xmm1
    5afa:	c4 c1 7a 6f 15 5d a5 	vmovdqu 0xa55d(%rip),%xmm2        # 10060 <data.M22.96>
    5b01:	00 00 
    5b03:	c4 c1 7a 7e 1d 64 a5 	vmovq  0xa564(%rip),%xmm3        # 10070 <data.M22.16>
    5b0a:	00 00 
    5b0c:	c5 e3 59 d9          	vmulsd %xmm1,%xmm3,%xmm3
    5b10:	c5 f1 14 c9          	vunpcklpd %xmm1,%xmm1,%xmm1
    5b14:	48 81 c2 10 76 1c 00 	add    $0x1c7610,%rdx
    5b1b:	c5 fa 6f e0          	vmovdqu %xmm0,%xmm4
    5b1f:	48 83 e2 3f          	and    $0x3f,%rdx
    5b23:	c4 c1 7a 6f 2d 54 a5 	vmovdqu 0xa554(%rip),%xmm5        # 10080 <data.M22.112>
    5b2a:	00 00 
    5b2c:	48 8d 05 5d a5 00 00 	lea    0xa55d(%rip),%rax        # 10090 <data.M22.128>
    5b33:	48 c1 e2 05          	shl    $0x5,%rdx
    5b37:	48 03 c2             	add    %rdx,%rax
    5b3a:	c5 e9 59 d1          	vmulpd %xmm1,%xmm2,%xmm2
    5b3e:	c5 fb 5c c3          	vsubsd %xmm3,%xmm0,%xmm0
    5b42:	c4 c1 73 59 0d 45 ad 	vmulsd 0xad45(%rip),%xmm1,%xmm1        # 10890 <data.M22.24>
    5b49:	00 00 
    5b4b:	c5 db 5c e3          	vsubsd %xmm3,%xmm4,%xmm4
    5b4f:	c5 fa 7e 78 08       	vmovq  0x8(%rax),%xmm7
    5b54:	c5 f9 14 c0          	vunpcklpd %xmm0,%xmm0,%xmm0
    5b58:	c5 fa 6f dc          	vmovdqu %xmm4,%xmm3
    5b5c:	c5 db 5c e2          	vsubsd %xmm2,%xmm4,%xmm4
    5b60:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    5b64:	c5 f9 5c c2          	vsubpd %xmm2,%xmm0,%xmm0
    5b68:	c4 c1 7a 6f 35 2f ad 	vmovdqu 0xad2f(%rip),%xmm6        # 108a0 <data.M22.2176>
    5b6f:	00 00 
    5b71:	c5 c3 59 fc          	vmulsd %xmm4,%xmm7,%xmm7
    5b75:	c5 e3 5c dc          	vsubsd %xmm4,%xmm3,%xmm3
    5b79:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    5b7d:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    5b81:	c5 e3 5c da          	vsubsd %xmm2,%xmm3,%xmm3
    5b85:	c5 fa 6f 10          	vmovdqu (%rax),%xmm2
    5b89:	c5 f3 5c cb          	vsubsd %xmm3,%xmm1,%xmm1
    5b8d:	c5 fa 7e 58 18       	vmovq  0x18(%rax),%xmm3
    5b92:	c5 eb 58 d3          	vaddsd %xmm3,%xmm2,%xmm2
    5b96:	c5 c3 5c fa          	vsubsd %xmm2,%xmm7,%xmm7
    5b9a:	c5 eb 59 d4          	vmulsd %xmm4,%xmm2,%xmm2
    5b9e:	c5 c9 59 f0          	vmulpd %xmm0,%xmm6,%xmm6
    5ba2:	c5 e3 59 dc          	vmulsd %xmm4,%xmm3,%xmm3
    5ba6:	c5 e9 59 d0          	vmulpd %xmm0,%xmm2,%xmm2
    5baa:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    5bae:	c4 c1 51 58 2d f9 ac 	vaddpd 0xacf9(%rip),%xmm5,%xmm5        # 108b0 <data.M22.2192>
    5bb5:	00 00 
    5bb7:	c5 db 59 20          	vmulsd (%rax),%xmm4,%xmm4
    5bbb:	c4 c1 49 58 35 fc ac 	vaddpd 0xacfc(%rip),%xmm6,%xmm6        # 108c0 <data.M22.2208>
    5bc2:	00 00 
    5bc4:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    5bc8:	c5 fa 6f c3          	vmovdqu %xmm3,%xmm0
    5bcc:	c5 e3 58 58 08       	vaddsd 0x8(%rax),%xmm3,%xmm3
    5bd1:	c5 f1 59 cf          	vmulpd %xmm7,%xmm1,%xmm1
    5bd5:	c5 fa 6f fc          	vmovdqu %xmm4,%xmm7
    5bd9:	c5 db 58 e3          	vaddsd %xmm3,%xmm4,%xmm4
    5bdd:	c5 c9 58 f5          	vaddpd %xmm5,%xmm6,%xmm6
    5be1:	c5 fa 7e 68 08       	vmovq  0x8(%rax),%xmm5
    5be6:	c5 d3 5c eb          	vsubsd %xmm3,%xmm5,%xmm5
    5bea:	c5 e3 5c dc          	vsubsd %xmm4,%xmm3,%xmm3
    5bee:	c5 f3 58 48 10       	vaddsd 0x10(%rax),%xmm1,%xmm1
    5bf3:	c5 c9 59 f2          	vmulpd %xmm2,%xmm6,%xmm6
    5bf7:	c5 fb 58 c5          	vaddsd %xmm5,%xmm0,%xmm0
    5bfb:	c5 e3 58 df          	vaddsd %xmm7,%xmm3,%xmm3
    5bff:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
    5c03:	c5 fb 58 c3          	vaddsd %xmm3,%xmm0,%xmm0
    5c07:	c5 fb 58 c6          	vaddsd %xmm6,%xmm0,%xmm0
    5c0b:	c5 c9 15 f6          	vunpckhpd %xmm6,%xmm6,%xmm6
    5c0f:	c5 fb 58 c6          	vaddsd %xmm6,%xmm0,%xmm0
    5c13:	c5 fb 58 c4          	vaddsd %xmm4,%xmm0,%xmm0
    5c17:	e9 fd 04 00 00       	jmpq   6119 <Stub<AMD64MathStub.cos>+0x679>
    5c1c:	0f 8f 26 00 00 00    	jg     5c48 <Stub<AMD64MathStub.cos>+0x1a8>
    5c22:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    5c27:	81 e0 ff 7f 00 00    	and    $0x7fff,%eax
    5c2d:	c5 f9 c4 c0 03       	vpinsrw $0x3,%eax,%xmm0,%xmm0
    5c32:	c4 c1 7a 7e 0d 95 ac 	vmovq  0xac95(%rip),%xmm1        # 108d0 <data.M22.32>
    5c39:	00 00 
    5c3b:	c5 f3 5c c8          	vsubsd %xmm0,%xmm1,%xmm1
    5c3f:	c5 fa 6f c1          	vmovdqu %xmm1,%xmm0
    5c43:	e9 d1 04 00 00       	jmpq   6119 <Stub<AMD64MathStub.cos>+0x679>
    5c48:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    5c4d:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    5c53:	81 f8 f0 7f 00 00    	cmp    $0x7ff0,%eax
    5c59:	0f 84 a6 04 00 00    	je     6105 <Stub<AMD64MathStub.cos>+0x665>
    5c5f:	c5 f9 c5 c8 03       	vpextrw $0x3,%xmm0,%ecx
    5c64:	81 e1 f0 7f 00 00    	and    $0x7ff0,%ecx
    5c6a:	81 e9 60 3f 00 00    	sub    $0x3f60,%ecx
    5c70:	c1 e9 07             	shr    $0x7,%ecx
    5c73:	81 e1 fc ff 00 00    	and    $0xfffc,%ecx
    5c79:	4c 8d 1d 60 ac 00 00 	lea    0xac60(%rip),%r11        # 108e0 <data.M22.2224>
    5c80:	49 03 cb             	add    %r11,%rcx
    5c83:	c4 e1 f9 7e c0       	vmovq  %xmm0,%rax
    5c88:	44 8b 51 14          	mov    0x14(%rcx),%r10d
    5c8c:	44 8b 41 18          	mov    0x18(%rcx),%r8d
    5c90:	8b d0                	mov    %eax,%edx
    5c92:	48 c1 e8 15          	shr    $0x15,%rax
    5c96:	81 c8 00 00 00 80    	or     $0x80000000,%eax
    5c9c:	c1 e8 0b             	shr    $0xb,%eax
    5c9f:	45 8b ca             	mov    %r10d,%r9d
    5ca2:	4c 0f af d2          	imul   %rdx,%r10
    5ca6:	4c 0f af c8          	imul   %rax,%r9
    5caa:	4c 0f af c0          	imul   %rax,%r8
    5cae:	8b 71 10             	mov    0x10(%rcx),%esi
    5cb1:	8b 79 0c             	mov    0xc(%rcx),%edi
    5cb4:	45 8b da             	mov    %r10d,%r11d
    5cb7:	49 c1 ea 20          	shr    $0x20,%r10
    5cbb:	4d 03 ca             	add    %r10,%r9
    5cbe:	4d 03 d8             	add    %r8,%r11
    5cc1:	45 8b c3             	mov    %r11d,%r8d
    5cc4:	49 c1 eb 20          	shr    $0x20,%r11
    5cc8:	4d 03 cb             	add    %r11,%r9
    5ccb:	44 8b d6             	mov    %esi,%r10d
    5cce:	48 0f af f2          	imul   %rdx,%rsi
    5cd2:	4c 0f af d0          	imul   %rax,%r10
    5cd6:	44 8b df             	mov    %edi,%r11d
    5cd9:	48 0f af fa          	imul   %rdx,%rdi
    5cdd:	8b de                	mov    %esi,%ebx
    5cdf:	48 c1 ee 20          	shr    $0x20,%rsi
    5ce3:	4c 03 cb             	add    %rbx,%r9
    5ce6:	41 8b d9             	mov    %r9d,%ebx
    5ce9:	49 c1 e9 20          	shr    $0x20,%r9
    5ced:	4c 03 d6             	add    %rsi,%r10
    5cf0:	4d 03 d1             	add    %r9,%r10
    5cf3:	48 c1 e3 20          	shl    $0x20,%rbx
    5cf7:	4c 0b c3             	or     %rbx,%r8
    5cfa:	4c 0f af d8          	imul   %rax,%r11
    5cfe:	44 8b 49 08          	mov    0x8(%rcx),%r9d
    5d02:	8b 71 04             	mov    0x4(%rcx),%esi
    5d05:	8b df                	mov    %edi,%ebx
    5d07:	48 c1 ef 20          	shr    $0x20,%rdi
    5d0b:	4c 03 d3             	add    %rbx,%r10
    5d0e:	41 8b da             	mov    %r10d,%ebx
    5d11:	49 c1 ea 20          	shr    $0x20,%r10
    5d15:	4c 03 df             	add    %rdi,%r11
    5d18:	4d 03 da             	add    %r10,%r11
    5d1b:	49 8b f9             	mov    %r9,%rdi
    5d1e:	4c 0f af ca          	imul   %rdx,%r9
    5d22:	48 0f af f8          	imul   %rax,%rdi
    5d26:	45 8b d1             	mov    %r9d,%r10d
    5d29:	49 c1 e9 20          	shr    $0x20,%r9
    5d2d:	4d 03 da             	add    %r10,%r11
    5d30:	45 8b d3             	mov    %r11d,%r10d
    5d33:	49 c1 eb 20          	shr    $0x20,%r11
    5d37:	49 03 f9             	add    %r9,%rdi
    5d3a:	49 03 fb             	add    %r11,%rdi
    5d3d:	4c 8b ce             	mov    %rsi,%r9
    5d40:	48 0f af f2          	imul   %rdx,%rsi
    5d44:	4c 0f af c8          	imul   %rax,%r9
    5d48:	49 c1 e2 20          	shl    $0x20,%r10
    5d4c:	4c 0b d3             	or     %rbx,%r10
    5d4f:	8b 01                	mov    (%rcx),%eax
    5d51:	44 8b de             	mov    %esi,%r11d
    5d54:	48 c1 ee 20          	shr    $0x20,%rsi
    5d58:	49 03 fb             	add    %r11,%rdi
    5d5b:	44 8b df             	mov    %edi,%r11d
    5d5e:	48 c1 ef 20          	shr    $0x20,%rdi
    5d62:	4c 03 ce             	add    %rsi,%r9
    5d65:	4c 03 cf             	add    %rdi,%r9
    5d68:	48 0f af d0          	imul   %rax,%rdx
    5d6c:	c5 f9 c5 d8 03       	vpextrw $0x3,%xmm0,%ebx
    5d71:	48 8d 3d 68 ab 00 00 	lea    0xab68(%rip),%rdi        # 108e0 <data.M22.2224>
    5d78:	48 2b cf             	sub    %rdi,%rcx
    5d7b:	03 c9                	add    %ecx,%ecx
    5d7d:	03 c9                	add    %ecx,%ecx
    5d7f:	03 c9                	add    %ecx,%ecx
    5d81:	83 c1 13             	add    $0x13,%ecx
    5d84:	be 00 80 00 00       	mov    $0x8000,%esi
    5d89:	23 f3                	and    %ebx,%esi
    5d8b:	c1 eb 04             	shr    $0x4,%ebx
    5d8e:	81 e3 ff 07 00 00    	and    $0x7ff,%ebx
    5d94:	81 eb ff 03 00 00    	sub    $0x3ff,%ebx
    5d9a:	2b cb                	sub    %ebx,%ecx
    5d9c:	4c 03 ca             	add    %rdx,%r9
    5d9f:	8b d1                	mov    %ecx,%edx
    5da1:	83 c2 20             	add    $0x20,%edx
    5da4:	83 f9 01             	cmp    $0x1,%ecx
    5da7:	0f 8c a8 02 00 00    	jl     6055 <Stub<AMD64MathStub.cos>+0x5b5>
    5dad:	f7 d9                	neg    %ecx
    5daf:	83 c1 1d             	add    $0x1d,%ecx
    5db2:	41 d3 e1             	shl    %cl,%r9d
    5db5:	41 8b f9             	mov    %r9d,%edi
    5db8:	41 81 e1 ff ff ff 1f 	and    $0x1fffffff,%r9d
    5dbf:	41 f7 c1 00 00 00 10 	test   $0x10000000,%r9d
    5dc6:	0f 85 b6 02 00 00    	jne    6082 <Stub<AMD64MathStub.cos>+0x5e2>
    5dcc:	41 d3 e9             	shr    %cl,%r9d
    5dcf:	bb 00 00 00 00       	mov    $0x0,%ebx
    5dd4:	49 c1 e1 20          	shl    $0x20,%r9
    5dd8:	4d 0b cb             	or     %r11,%r9
    5ddb:	49 83 f9 00          	cmp    $0x0,%r9
    5ddf:	0f 84 14 02 00 00    	je     5ff9 <Stub<AMD64MathStub.cos>+0x559>
    5de5:	4d 0f bd d9          	bsr    %r9,%r11
    5de9:	b9 1d 00 00 00       	mov    $0x1d,%ecx
    5dee:	41 2b cb             	sub    %r11d,%ecx
    5df1:	0f 8e 3b 02 00 00    	jle    6032 <Stub<AMD64MathStub.cos>+0x592>
    5df7:	49 d3 e1             	shl    %cl,%r9
    5dfa:	49 8b c2             	mov    %r10,%rax
    5dfd:	49 d3 e2             	shl    %cl,%r10
    5e00:	03 d1                	add    %ecx,%edx
    5e02:	f7 d9                	neg    %ecx
    5e04:	83 c1 40             	add    $0x40,%ecx
    5e07:	48 d3 e8             	shr    %cl,%rax
    5e0a:	49 d3 e8             	shr    %cl,%r8
    5e0d:	4c 0b c8             	or     %rax,%r9
    5e10:	4d 0b d0             	or     %r8,%r10
    5e13:	c4 c1 fb 2a c1       	vcvtsi2sd %r9,%xmm0,%xmm0
    5e18:	49 d1 ea             	shr    %r10
    5e1b:	c4 c1 e3 2a da       	vcvtsi2sd %r10,%xmm3,%xmm3
    5e20:	c5 d9 57 e4          	vxorpd %xmm4,%xmm4,%xmm4
    5e24:	c1 e2 04             	shl    $0x4,%edx
    5e27:	f7 da                	neg    %edx
    5e29:	81 c2 f0 3f 00 00    	add    $0x3ff0,%edx
    5e2f:	0b d6                	or     %esi,%edx
    5e31:	33 d3                	xor    %ebx,%edx
    5e33:	c5 d9 c4 e2 03       	vpinsrw $0x3,%edx,%xmm4,%xmm4
    5e38:	c4 c1 7a 7e 15 4f ab 	vmovq  0xab4f(%rip),%xmm2        # 10990 <data.M22.40>
    5e3f:	00 00 
    5e41:	c4 c1 7a 7e 35 56 ab 	vmovq  0xab56(%rip),%xmm6        # 109a0 <data.M22.56>
    5e48:	00 00 
    5e4a:	c5 d1 57 ed          	vxorpd %xmm5,%xmm5,%xmm5
    5e4e:	81 ea f0 03 00 00    	sub    $0x3f0,%edx
    5e54:	c5 d1 c4 ea 03       	vpinsrw $0x3,%edx,%xmm5,%xmm5
    5e59:	c5 fb 59 c4          	vmulsd %xmm4,%xmm0,%xmm0
    5e5d:	c1 e6 10             	shl    $0x10,%esi
    5e60:	c1 fe 1f             	sar    $0x1f,%esi
    5e63:	c5 e3 59 dd          	vmulsd %xmm5,%xmm3,%xmm3
    5e67:	c5 fa 6f c8          	vmovdqu %xmm0,%xmm1
    5e6b:	c5 fb 59 c2          	vmulsd %xmm2,%xmm0,%xmm0
    5e6f:	c1 ef 1d             	shr    $0x1d,%edi
    5e72:	c5 f3 58 cb          	vaddsd %xmm3,%xmm1,%xmm1
    5e76:	c5 e3 59 da          	vmulsd %xmm2,%xmm3,%xmm3
    5e7a:	03 fe                	add    %esi,%edi
    5e7c:	33 fe                	xor    %esi,%edi
    5e7e:	c5 cb 59 f1          	vmulsd %xmm1,%xmm6,%xmm6
    5e82:	8b c7                	mov    %edi,%eax
    5e84:	c5 cb 58 f3          	vaddsd %xmm3,%xmm6,%xmm6
    5e88:	c5 fa 6f d0          	vmovdqu %xmm0,%xmm2
    5e8c:	c5 fb 58 c6          	vaddsd %xmm6,%xmm0,%xmm0
    5e90:	c5 eb 5c d0          	vsubsd %xmm0,%xmm2,%xmm2
    5e94:	c5 cb 58 f2          	vaddsd %xmm2,%xmm6,%xmm6
    5e98:	c4 c1 7a 7e 0d 8f a1 	vmovq  0xa18f(%rip),%xmm1        # 10030 <data.M22.0>
    5e9f:	00 00 
    5ea1:	c5 f3 59 c8          	vmulsd %xmm0,%xmm1,%xmm1
    5ea5:	c4 c1 7a 7e 2d 92 a1 	vmovq  0xa192(%rip),%xmm5        # 10040 <data.M22.80>
    5eac:	00 00 
    5eae:	c4 c1 7a 7e 25 99 a1 	vmovq  0xa199(%rip),%xmm4        # 10050 <data.M22.8>
    5eb5:	00 00 
    5eb7:	c5 d9 db e0          	vpand  %xmm0,%xmm4,%xmm4
    5ebb:	c5 d1 eb ec          	vpor   %xmm4,%xmm5,%xmm5
    5ebf:	c5 f1 58 cd          	vaddpd %xmm5,%xmm1,%xmm1
    5ec3:	c4 e1 fb 2c d1       	vcvttsd2si %xmm1,%rdx
    5ec8:	c4 e1 f3 2a ca       	vcvtsi2sd %rdx,%xmm1,%xmm1
    5ecd:	c4 c1 7a 7e 1d 9a a1 	vmovq  0xa19a(%rip),%xmm3        # 10070 <data.M22.16>
    5ed4:	00 00 
    5ed6:	c4 c1 7a 6f 15 81 a1 	vmovdqu 0xa181(%rip),%xmm2        # 10060 <data.M22.96>
    5edd:	00 00 
    5edf:	c5 e3 59 d9          	vmulsd %xmm1,%xmm3,%xmm3
    5ee3:	c5 f1 14 c9          	vunpcklpd %xmm1,%xmm1,%xmm1
    5ee7:	c1 e0 03             	shl    $0x3,%eax
    5eea:	81 c2 10 76 1c 00    	add    $0x1c7610,%edx
    5ef0:	c5 fa 6f e0          	vmovdqu %xmm0,%xmm4
    5ef4:	03 d0                	add    %eax,%edx
    5ef6:	83 e2 3f             	and    $0x3f,%edx
    5ef9:	c4 c1 7a 6f 2d 7e a1 	vmovdqu 0xa17e(%rip),%xmm5        # 10080 <data.M22.112>
    5f00:	00 00 
    5f02:	48 8d 05 87 a1 00 00 	lea    0xa187(%rip),%rax        # 10090 <data.M22.128>
    5f09:	c1 e2 05             	shl    $0x5,%edx
    5f0c:	48 03 c2             	add    %rdx,%rax
    5f0f:	c5 e9 59 d1          	vmulpd %xmm1,%xmm2,%xmm2
    5f13:	c5 fb 5c c3          	vsubsd %xmm3,%xmm0,%xmm0
    5f17:	c4 c1 73 59 0d 70 a9 	vmulsd 0xa970(%rip),%xmm1,%xmm1        # 10890 <data.M22.24>
    5f1e:	00 00 
    5f20:	c5 db 5c e3          	vsubsd %xmm3,%xmm4,%xmm4
    5f24:	c5 fa 7e 78 08       	vmovq  0x8(%rax),%xmm7
    5f29:	c5 f9 14 c0          	vunpcklpd %xmm0,%xmm0,%xmm0
    5f2d:	c5 fa 6f dc          	vmovdqu %xmm4,%xmm3
    5f31:	c5 db 5c e2          	vsubsd %xmm2,%xmm4,%xmm4
    5f35:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    5f39:	c5 f9 5c c2          	vsubpd %xmm2,%xmm0,%xmm0
    5f3d:	c5 c3 59 fc          	vmulsd %xmm4,%xmm7,%xmm7
    5f41:	c5 e3 5c dc          	vsubsd %xmm4,%xmm3,%xmm3
    5f45:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    5f49:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    5f4d:	c5 e3 5c da          	vsubsd %xmm2,%xmm3,%xmm3
    5f51:	c5 fa 6f 10          	vmovdqu (%rax),%xmm2
    5f55:	c5 f3 5c cb          	vsubsd %xmm3,%xmm1,%xmm1
    5f59:	c5 fa 7e 58 18       	vmovq  0x18(%rax),%xmm3
    5f5e:	c5 eb 58 d3          	vaddsd %xmm3,%xmm2,%xmm2
    5f62:	c5 c3 5c fa          	vsubsd %xmm2,%xmm7,%xmm7
    5f66:	c5 f3 5c ce          	vsubsd %xmm6,%xmm1,%xmm1
    5f6a:	c4 c1 7a 6f 35 2d a9 	vmovdqu 0xa92d(%rip),%xmm6        # 108a0 <data.M22.2176>
    5f71:	00 00 
    5f73:	c5 eb 59 d4          	vmulsd %xmm4,%xmm2,%xmm2
    5f77:	c5 c9 59 f0          	vmulpd %xmm0,%xmm6,%xmm6
    5f7b:	c5 e3 59 dc          	vmulsd %xmm4,%xmm3,%xmm3
    5f7f:	c5 e9 59 d0          	vmulpd %xmm0,%xmm2,%xmm2
    5f83:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    5f87:	c4 c1 51 58 2d 20 a9 	vaddpd 0xa920(%rip),%xmm5,%xmm5        # 108b0 <data.M22.2192>
    5f8e:	00 00 
    5f90:	c5 db 59 20          	vmulsd (%rax),%xmm4,%xmm4
    5f94:	c4 c1 49 58 35 23 a9 	vaddpd 0xa923(%rip),%xmm6,%xmm6        # 108c0 <data.M22.2208>
    5f9b:	00 00 
    5f9d:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    5fa1:	c5 fa 6f c3          	vmovdqu %xmm3,%xmm0
    5fa5:	c5 e3 58 58 08       	vaddsd 0x8(%rax),%xmm3,%xmm3
    5faa:	c5 f1 59 cf          	vmulpd %xmm7,%xmm1,%xmm1
    5fae:	c5 fa 6f fc          	vmovdqu %xmm4,%xmm7
    5fb2:	c5 db 58 e3          	vaddsd %xmm3,%xmm4,%xmm4
    5fb6:	c5 c9 58 f5          	vaddpd %xmm5,%xmm6,%xmm6
    5fba:	c5 fa 7e 68 08       	vmovq  0x8(%rax),%xmm5
    5fbf:	c5 d3 5c eb          	vsubsd %xmm3,%xmm5,%xmm5
    5fc3:	c5 e3 5c dc          	vsubsd %xmm4,%xmm3,%xmm3
    5fc7:	c5 f3 58 48 10       	vaddsd 0x10(%rax),%xmm1,%xmm1
    5fcc:	c5 c9 59 f2          	vmulpd %xmm2,%xmm6,%xmm6
    5fd0:	c5 d3 58 e8          	vaddsd %xmm0,%xmm5,%xmm5
    5fd4:	c5 e3 58 df          	vaddsd %xmm7,%xmm3,%xmm3
    5fd8:	c5 f3 58 cd          	vaddsd %xmm5,%xmm1,%xmm1
    5fdc:	c5 f3 58 cb          	vaddsd %xmm3,%xmm1,%xmm1
    5fe0:	c5 f3 58 ce          	vaddsd %xmm6,%xmm1,%xmm1
    5fe4:	c5 c9 15 f6          	vunpckhpd %xmm6,%xmm6,%xmm6
    5fe8:	c5 fa 6f c4          	vmovdqu %xmm4,%xmm0
    5fec:	c5 f3 58 ce          	vaddsd %xmm6,%xmm1,%xmm1
    5ff0:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
    5ff4:	e9 20 01 00 00       	jmpq   6119 <Stub<AMD64MathStub.cos>+0x679>
    5ff9:	83 c2 40             	add    $0x40,%edx
    5ffc:	4d 8b ca             	mov    %r10,%r9
    5fff:	4d 8b d0             	mov    %r8,%r10
    6002:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    6008:	49 83 f9 00          	cmp    $0x0,%r9
    600c:	0f 85 d3 fd ff ff    	jne    5de5 <Stub<AMD64MathStub.cos>+0x345>
    6012:	83 c2 40             	add    $0x40,%edx
    6015:	4d 8b ca             	mov    %r10,%r9
    6018:	4d 8b d0             	mov    %r8,%r10
    601b:	49 83 f9 00          	cmp    $0x0,%r9
    601f:	0f 85 c0 fd ff ff    	jne    5de5 <Stub<AMD64MathStub.cos>+0x345>
    6025:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    6029:	c5 c9 57 f6          	vxorpd %xmm6,%xmm6,%xmm6
    602d:	e9 66 fe ff ff       	jmpq   5e98 <Stub<AMD64MathStub.cos>+0x3f8>
    6032:	0f 84 db fd ff ff    	je     5e13 <Stub<AMD64MathStub.cos>+0x373>
    6038:	f7 d9                	neg    %ecx
    603a:	49 d3 ea             	shr    %cl,%r10
    603d:	49 8b c1             	mov    %r9,%rax
    6040:	49 d3 e9             	shr    %cl,%r9
    6043:	2b d1                	sub    %ecx,%edx
    6045:	f7 d9                	neg    %ecx
    6047:	83 c1 40             	add    $0x40,%ecx
    604a:	48 d3 e0             	shl    %cl,%rax
    604d:	4c 0b d0             	or     %rax,%r10
    6050:	e9 be fd ff ff       	jmpq   5e13 <Stub<AMD64MathStub.cos>+0x373>
    6055:	f7 d9                	neg    %ecx
    6057:	49 c1 e1 20          	shl    $0x20,%r9
    605b:	4d 0b cb             	or     %r11,%r9
    605e:	49 d3 e1             	shl    %cl,%r9
    6061:	49 8b f9             	mov    %r9,%rdi
    6064:	41 f7 c1 00 00 00 80 	test   $0x80000000,%r9d
    606b:	0f 85 53 00 00 00    	jne    60c4 <Stub<AMD64MathStub.cos>+0x624>
    6071:	41 d3 e9             	shr    %cl,%r9d
    6074:	bb 00 00 00 00       	mov    $0x0,%ebx
    6079:	48 c1 ef 03          	shr    $0x3,%rdi
    607d:	e9 59 fd ff ff       	jmpq   5ddb <Stub<AMD64MathStub.cos>+0x33b>
    6082:	41 d3 e9             	shr    %cl,%r9d
    6085:	bb 00 00 00 20       	mov    $0x20000000,%ebx
    608a:	d3 eb                	shr    %cl,%ebx
    608c:	49 c1 e1 20          	shl    $0x20,%r9
    6090:	4d 0b cb             	or     %r11,%r9
    6093:	48 c1 e3 20          	shl    $0x20,%rbx
    6097:	81 c7 00 00 00 20    	add    $0x20000000,%edi
    609d:	b9 00 00 00 00       	mov    $0x0,%ecx
    60a2:	41 bb 00 00 00 00    	mov    $0x0,%r11d
    60a8:	49 2b c8             	sub    %r8,%rcx
    60ab:	4d 1b da             	sbb    %r10,%r11
    60ae:	49 1b d9             	sbb    %r9,%rbx
    60b1:	4c 8b c1             	mov    %rcx,%r8
    60b4:	4d 8b d3             	mov    %r11,%r10
    60b7:	4c 8b cb             	mov    %rbx,%r9
    60ba:	bb 00 80 00 00       	mov    $0x8000,%ebx
    60bf:	e9 17 fd ff ff       	jmpq   5ddb <Stub<AMD64MathStub.cos>+0x33b>
    60c4:	41 d3 e9             	shr    %cl,%r9d
    60c7:	48 bb 00 00 00 00 01 	movabs $0x100000000,%rbx
    60ce:	00 00 00 
    60d1:	48 d3 eb             	shr    %cl,%rbx
    60d4:	b9 00 00 00 00       	mov    $0x0,%ecx
    60d9:	41 bb 00 00 00 00    	mov    $0x0,%r11d
    60df:	49 2b c8             	sub    %r8,%rcx
    60e2:	4d 1b da             	sbb    %r10,%r11
    60e5:	49 1b d9             	sbb    %r9,%rbx
    60e8:	4c 8b c1             	mov    %rcx,%r8
    60eb:	4d 8b d3             	mov    %r11,%r10
    60ee:	4c 8b cb             	mov    %rbx,%r9
    60f1:	bb 00 80 00 00       	mov    $0x8000,%ebx
    60f6:	48 c1 ef 03          	shr    $0x3,%rdi
    60fa:	81 c7 00 00 00 20    	add    $0x20000000,%edi
    6100:	e9 d6 fc ff ff       	jmpq   5ddb <Stub<AMD64MathStub.cos>+0x33b>
    6105:	c5 fb 10 44 24 08    	vmovsd 0x8(%rsp),%xmm0
    610b:	c4 c1 7b 59 05 94 a8 	vmulsd 0xa894(%rip),%xmm0,%xmm0        # 109a8 <data.M22.64>
    6112:	00 00 
    6114:	c5 f9 d6 04 24       	vmovq  %xmm0,(%rsp)
    6119:	48 83 c4 10          	add    $0x10,%rsp
    611d:	5b                   	pop    %rbx
    611e:	c3                   	retq   
	...
    617f:	00 17                	add    %dl,(%rdi)
	...

00000000000061a0 <Stub<AMD64MathStub.tan>>:
    61a0:	53                   	push   %rbx
    61a1:	48 83 ec 10          	sub    $0x10,%rsp
    61a5:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
    61ab:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    61b0:	81 e0 ff 7f 00 00    	and    $0x7fff,%eax
    61b6:	81 e8 ba 3f 00 00    	sub    $0x3fba,%eax
    61bc:	81 f8 0e 01 00 00    	cmp    $0x10e,%eax
    61c2:	0f 87 08 02 00 00    	ja     63d0 <Stub<AMD64MathStub.tan>+0x230>
    61c8:	c4 c1 7a 6f 2d df a7 	vmovdqu 0xa7df(%rip),%xmm5        # 109b0 <data.M23.64>
    61cf:	00 00 
    61d1:	c4 c1 7a 6f 35 e6 a7 	vmovdqu 0xa7e6(%rip),%xmm6        # 109c0 <data.M23.80>
    61d8:	00 00 
    61da:	c5 f9 14 c0          	vunpcklpd %xmm0,%xmm0,%xmm0
    61de:	c4 c1 7a 6f 25 e9 a7 	vmovdqu 0xa7e9(%rip),%xmm4        # 109d0 <data.M23.96>
    61e5:	00 00 
    61e7:	c5 d9 54 e0          	vandpd %xmm0,%xmm4,%xmm4
    61eb:	c4 c1 7a 6f 0d ec a7 	vmovdqu 0xa7ec(%rip),%xmm1        # 109e0 <data.M23.112>
    61f2:	00 00 
    61f4:	c5 f1 59 c8          	vmulpd %xmm0,%xmm1,%xmm1
    61f8:	c5 d1 eb ec          	vpor   %xmm4,%xmm5,%xmm5
    61fc:	c5 f1 58 cd          	vaddpd %xmm5,%xmm1,%xmm1
    6200:	c5 fa 6f f9          	vmovdqu %xmm1,%xmm7
    6204:	c5 c1 15 ff          	vunpckhpd %xmm7,%xmm7,%xmm7
    6208:	c5 fb 2c d7          	vcvttsd2si %xmm7,%edx
    620c:	c5 f9 e6 c9          	vcvttpd2dq %xmm1,%xmm1
    6210:	c5 fa e6 c9          	vcvtdq2pd %xmm1,%xmm1
    6214:	c5 f1 59 ce          	vmulpd %xmm6,%xmm1,%xmm1
    6218:	c4 c1 7a 6f 1d cf a7 	vmovdqu 0xa7cf(%rip),%xmm3        # 109f0 <data.M23.128>
    621f:	00 00 
    6221:	c4 c1 7a 7e 2d d6 a7 	vmovq  0xa7d6(%rip),%xmm5        # 10a00 <data.M23.16>
    6228:	00 00 
    622a:	48 81 c2 00 29 07 00 	add    $0x72900,%rdx
    6231:	c4 c1 7a 6f 25 d6 a7 	vmovdqu 0xa7d6(%rip),%xmm4        # 10a10 <data.M23.144>
    6238:	00 00 
    623a:	c5 e1 59 d9          	vmulpd %xmm1,%xmm3,%xmm3
    623e:	48 83 e2 1f          	and    $0x1f,%rdx
    6242:	c5 d3 59 e9          	vmulsd %xmm1,%xmm5,%xmm5
    6246:	48 8b ca             	mov    %rdx,%rcx
    6249:	c5 d9 59 e1          	vmulpd %xmm1,%xmm4,%xmm4
    624d:	48 d1 e1             	shl    %rcx
    6250:	c5 f9 5c c3          	vsubpd %xmm3,%xmm0,%xmm0
    6254:	c4 c1 71 59 0d c3 a7 	vmulpd 0xa7c3(%rip),%xmm1,%xmm1        # 10a20 <data.M23.160>
    625b:	00 00 
    625d:	48 03 d1             	add    %rcx,%rdx
    6260:	48 c1 e1 02          	shl    $0x2,%rcx
    6264:	48 03 d1             	add    %rcx,%rdx
    6267:	c5 d3 58 e8          	vaddsd %xmm0,%xmm5,%xmm5
    626b:	c5 fa 6f d0          	vmovdqu %xmm0,%xmm2
    626f:	c5 f9 5c c4          	vsubpd %xmm4,%xmm0,%xmm0
    6273:	c4 c1 7a 7e 35 b4 a7 	vmovq  0xa7b4(%rip),%xmm6        # 10a30 <data.M23.24>
    627a:	00 00 
    627c:	48 c1 e2 04          	shl    $0x4,%rdx
    6280:	48 8d 05 b9 a7 00 00 	lea    0xa7b9(%rip),%rax        # 10a40 <data.M23.176>
    6287:	c4 c1 51 54 2d b0 bd 	vandpd 0xbdb0(%rip),%xmm5,%xmm5        # 12040 <data.M23.5808>
    628e:	00 00 
    6290:	c5 fa 6f d8          	vmovdqu %xmm0,%xmm3
    6294:	48 03 c2             	add    %rdx,%rax
    6297:	c5 e9 5c d0          	vsubpd %xmm0,%xmm2,%xmm2
    629b:	c5 f9 15 c0          	vunpckhpd %xmm0,%xmm0,%xmm0
    629f:	c5 cb 5e f5          	vdivsd %xmm5,%xmm6,%xmm6
    62a3:	c5 e9 5c d4          	vsubpd %xmm4,%xmm2,%xmm2
    62a7:	c5 fa 6f 78 10       	vmovdqu 0x10(%rax),%xmm7
    62ac:	c5 e3 5c dd          	vsubsd %xmm5,%xmm3,%xmm3
    62b0:	c5 c1 59 f8          	vmulpd %xmm0,%xmm7,%xmm7
    62b4:	c5 e9 5c d1          	vsubpd %xmm1,%xmm2,%xmm2
    62b8:	c5 fa 6f 48 30       	vmovdqu 0x30(%rax),%xmm1
    62bd:	c5 f1 59 c8          	vmulpd %xmm0,%xmm1,%xmm1
    62c1:	c5 fa 6f 60 60       	vmovdqu 0x60(%rax),%xmm4
    62c6:	c5 d9 59 e0          	vmulpd %xmm0,%xmm4,%xmm4
    62ca:	c5 eb 58 d3          	vaddsd %xmm3,%xmm2,%xmm2
    62ce:	c5 fa 6f d8          	vmovdqu %xmm0,%xmm3
    62d2:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    62d6:	c5 c1 58 38          	vaddpd (%rax),%xmm7,%xmm7
    62da:	c5 f1 58 48 20       	vaddpd 0x20(%rax),%xmm1,%xmm1
    62df:	c5 f1 59 c8          	vmulpd %xmm0,%xmm1,%xmm1
    62e3:	c5 d9 58 60 50       	vaddpd 0x50(%rax),%xmm4,%xmm4
    62e8:	c5 c1 58 f9          	vaddpd %xmm1,%xmm7,%xmm7
    62ec:	c5 fa 6f 48 70       	vmovdqu 0x70(%rax),%xmm1
    62f1:	c5 f1 59 c8          	vmulpd %xmm0,%xmm1,%xmm1
    62f5:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    62f9:	c5 d9 58 e1          	vaddpd %xmm1,%xmm4,%xmm4
    62fd:	c5 fa 6f 48 40       	vmovdqu 0x40(%rax),%xmm1
    6302:	c5 f1 59 c8          	vmulpd %xmm0,%xmm1,%xmm1
    6306:	c5 c1 58 f9          	vaddpd %xmm1,%xmm7,%xmm7
    630a:	c5 fa 6f cb          	vmovdqu %xmm3,%xmm1
    630e:	c5 e1 59 d8          	vmulpd %xmm0,%xmm3,%xmm3
    6312:	c5 fb 59 c0          	vmulsd %xmm0,%xmm0,%xmm0
    6316:	c5 f1 59 88 90 00 00 	vmulpd 0x90(%rax),%xmm1,%xmm1
    631d:	00 
    631e:	c5 d9 59 e3          	vmulpd %xmm3,%xmm4,%xmm4
    6322:	c5 fa 6f d9          	vmovdqu %xmm1,%xmm3
    6326:	c5 c1 58 fc          	vaddpd %xmm4,%xmm7,%xmm7
    632a:	c5 fa 6f e1          	vmovdqu %xmm1,%xmm4
    632e:	c5 fb 59 c7          	vmulsd %xmm7,%xmm0,%xmm0
    6332:	c5 c1 15 ff          	vunpckhpd %xmm7,%xmm7,%xmm7
    6336:	c5 fb 58 c7          	vaddsd %xmm7,%xmm0,%xmm0
    633a:	c5 f1 15 c9          	vunpckhpd %xmm1,%xmm1,%xmm1
    633e:	c5 e3 58 d9          	vaddsd %xmm1,%xmm3,%xmm3
    6342:	c5 db 5c e3          	vsubsd %xmm3,%xmm4,%xmm4
    6346:	c5 f3 58 cc          	vaddsd %xmm4,%xmm1,%xmm1
    634a:	c5 fa 6f e2          	vmovdqu %xmm2,%xmm4
    634e:	c5 fa 7e b8 90 00 00 	vmovq  0x90(%rax),%xmm7
    6355:	00 
    6356:	c5 e9 15 d2          	vunpckhpd %xmm2,%xmm2,%xmm2
    635a:	c5 c3 58 b8 98 00 00 	vaddsd 0x98(%rax),%xmm7,%xmm7
    6361:	00 
    6362:	c5 c3 59 fa          	vmulsd %xmm2,%xmm7,%xmm7
    6366:	c5 c3 58 b8 88 00 00 	vaddsd 0x88(%rax),%xmm7,%xmm7
    636d:	00 
    636e:	c5 c3 58 f9          	vaddsd %xmm1,%xmm7,%xmm7
    6372:	c5 fb 58 c7          	vaddsd %xmm7,%xmm0,%xmm0
    6376:	c4 c1 7a 7e 3d b1 a6 	vmovq  0xa6b1(%rip),%xmm7        # 10a30 <data.M23.24>
    637d:	00 00 
    637f:	c5 db 59 e6          	vmulsd %xmm6,%xmm4,%xmm4
    6383:	c5 fa 7e 90 a8 00 00 	vmovq  0xa8(%rax),%xmm2
    638a:	00 
    638b:	c5 e9 54 d6          	vandpd %xmm6,%xmm2,%xmm2
    638f:	c5 d3 59 ea          	vmulsd %xmm2,%xmm5,%xmm5
    6393:	c5 cb 59 b0 a0 00 00 	vmulsd 0xa0(%rax),%xmm6,%xmm6
    639a:	00 
    639b:	c5 c3 5c fd          	vsubsd %xmm5,%xmm7,%xmm7
    639f:	c5 eb 5c 90 80 00 00 	vsubsd 0x80(%rax),%xmm2,%xmm2
    63a6:	00 
    63a7:	c5 c3 5c fc          	vsubsd %xmm4,%xmm7,%xmm7
    63ab:	c5 c3 59 fe          	vmulsd %xmm6,%xmm7,%xmm7
    63af:	c5 fa 6f e3          	vmovdqu %xmm3,%xmm4
    63b3:	c5 e3 5c da          	vsubsd %xmm2,%xmm3,%xmm3
    63b7:	c5 eb 58 d3          	vaddsd %xmm3,%xmm2,%xmm2
    63bb:	c5 db 5c e2          	vsubsd %xmm2,%xmm4,%xmm4
    63bf:	c5 fb 58 c4          	vaddsd %xmm4,%xmm0,%xmm0
    63c3:	c5 fb 5c c7          	vsubsd %xmm7,%xmm0,%xmm0
    63c7:	c5 fb 58 c3          	vaddsd %xmm3,%xmm0,%xmm0
    63cb:	e9 26 06 00 00       	jmpq   69f6 <Stub<AMD64MathStub.tan>+0x856>
    63d0:	0f 8f ab 00 00 00    	jg     6481 <Stub<AMD64MathStub.tan>+0x2e1>
    63d6:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    63db:	8b d0                	mov    %eax,%edx
    63dd:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    63e3:	0f 84 8b 00 00 00    	je     6474 <Stub<AMD64MathStub.tan>+0x2d4>
    63e9:	81 e2 ff 7f 00 00    	and    $0x7fff,%edx
    63ef:	81 fa 20 3e 00 00    	cmp    $0x3e20,%edx
    63f5:	0f 82 5a 00 00 00    	jb     6455 <Stub<AMD64MathStub.tan>+0x2b5>
    63fb:	c5 fa 6f d0          	vmovdqu %xmm0,%xmm2
    63ff:	c5 fa 6f d8          	vmovdqu %xmm0,%xmm3
    6403:	c4 c1 7a 7e 0d 44 bc 	vmovq  0xbc44(%rip),%xmm1        # 12050 <data.M23.5824>
    640a:	00 00 
    640c:	c5 eb 59 d0          	vmulsd %xmm0,%xmm2,%xmm2
    6410:	c5 e3 59 da          	vmulsd %xmm2,%xmm3,%xmm3
    6414:	c5 f3 59 ca          	vmulsd %xmm2,%xmm1,%xmm1
    6418:	c4 c1 73 58 0d 3f bc 	vaddsd 0xbc3f(%rip),%xmm1,%xmm1        # 12060 <data.M23.5840>
    641f:	00 00 
    6421:	c5 f3 59 ca          	vmulsd %xmm2,%xmm1,%xmm1
    6425:	c4 c1 73 58 0d 42 bc 	vaddsd 0xbc42(%rip),%xmm1,%xmm1        # 12070 <data.M23.5856>
    642c:	00 00 
    642e:	c5 f3 59 ca          	vmulsd %xmm2,%xmm1,%xmm1
    6432:	c4 c1 73 58 0d 45 bc 	vaddsd 0xbc45(%rip),%xmm1,%xmm1        # 12080 <data.M23.5872>
    6439:	00 00 
    643b:	c5 f3 59 ca          	vmulsd %xmm2,%xmm1,%xmm1
    643f:	c4 c1 73 58 0d 48 bc 	vaddsd 0xbc48(%rip),%xmm1,%xmm1        # 12090 <data.M23.5888>
    6446:	00 00 
    6448:	c5 f3 59 cb          	vmulsd %xmm3,%xmm1,%xmm1
    644c:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
    6450:	e9 a1 05 00 00       	jmpq   69f6 <Stub<AMD64MathStub.tan>+0x856>
    6455:	c4 c1 7a 7e 1d 42 bc 	vmovq  0xbc42(%rip),%xmm3        # 120a0 <data.M23.32>
    645c:	00 00 
    645e:	c5 e3 59 d8          	vmulsd %xmm0,%xmm3,%xmm3
    6462:	c5 fb 58 c3          	vaddsd %xmm3,%xmm0,%xmm0
    6466:	c4 c1 7b 59 05 39 bc 	vmulsd 0xbc39(%rip),%xmm0,%xmm0        # 120a8 <data.M23.0>
    646d:	00 00 
    646f:	e9 82 05 00 00       	jmpq   69f6 <Stub<AMD64MathStub.tan>+0x856>
    6474:	c5 fa 6f c8          	vmovdqu %xmm0,%xmm1
    6478:	c5 f3 59 c9          	vmulsd %xmm1,%xmm1,%xmm1
    647c:	e9 75 05 00 00       	jmpq   69f6 <Stub<AMD64MathStub.tan>+0x856>
    6481:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    6486:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    648c:	81 f8 f0 7f 00 00    	cmp    $0x7ff0,%eax
    6492:	0f 84 4a 05 00 00    	je     69e2 <Stub<AMD64MathStub.tan>+0x842>
    6498:	c5 f9 c5 c8 03       	vpextrw $0x3,%xmm0,%ecx
    649d:	81 e1 f0 7f 00 00    	and    $0x7ff0,%ecx
    64a3:	81 e9 60 3f 00 00    	sub    $0x3f60,%ecx
    64a9:	c1 e9 07             	shr    $0x7,%ecx
    64ac:	81 e1 fc ff 00 00    	and    $0xfffc,%ecx
    64b2:	4c 8d 1d f7 bb 00 00 	lea    0xbbf7(%rip),%r11        # 120b0 <data.M23.5904>
    64b9:	49 03 cb             	add    %r11,%rcx
    64bc:	c4 e1 f9 7e c0       	vmovq  %xmm0,%rax
    64c1:	44 8b 51 14          	mov    0x14(%rcx),%r10d
    64c5:	44 8b 41 18          	mov    0x18(%rcx),%r8d
    64c9:	8b d0                	mov    %eax,%edx
    64cb:	48 c1 e8 15          	shr    $0x15,%rax
    64cf:	81 c8 00 00 00 80    	or     $0x80000000,%eax
    64d5:	c1 e8 0b             	shr    $0xb,%eax
    64d8:	45 8b ca             	mov    %r10d,%r9d
    64db:	4c 0f af d2          	imul   %rdx,%r10
    64df:	4c 0f af c8          	imul   %rax,%r9
    64e3:	4c 0f af c0          	imul   %rax,%r8
    64e7:	8b 71 10             	mov    0x10(%rcx),%esi
    64ea:	8b 79 0c             	mov    0xc(%rcx),%edi
    64ed:	45 8b da             	mov    %r10d,%r11d
    64f0:	49 c1 ea 20          	shr    $0x20,%r10
    64f4:	4d 03 ca             	add    %r10,%r9
    64f7:	4d 03 d8             	add    %r8,%r11
    64fa:	45 8b c3             	mov    %r11d,%r8d
    64fd:	49 c1 eb 20          	shr    $0x20,%r11
    6501:	4d 03 cb             	add    %r11,%r9
    6504:	44 8b d6             	mov    %esi,%r10d
    6507:	48 0f af f2          	imul   %rdx,%rsi
    650b:	4c 0f af d0          	imul   %rax,%r10
    650f:	44 8b df             	mov    %edi,%r11d
    6512:	48 0f af fa          	imul   %rdx,%rdi
    6516:	8b de                	mov    %esi,%ebx
    6518:	48 c1 ee 20          	shr    $0x20,%rsi
    651c:	4c 03 cb             	add    %rbx,%r9
    651f:	41 8b d9             	mov    %r9d,%ebx
    6522:	49 c1 e9 20          	shr    $0x20,%r9
    6526:	4c 03 d6             	add    %rsi,%r10
    6529:	4d 03 d1             	add    %r9,%r10
    652c:	48 c1 e3 20          	shl    $0x20,%rbx
    6530:	4c 0b c3             	or     %rbx,%r8
    6533:	4c 0f af d8          	imul   %rax,%r11
    6537:	44 8b 49 08          	mov    0x8(%rcx),%r9d
    653b:	8b 71 04             	mov    0x4(%rcx),%esi
    653e:	8b df                	mov    %edi,%ebx
    6540:	48 c1 ef 20          	shr    $0x20,%rdi
    6544:	4c 03 d3             	add    %rbx,%r10
    6547:	41 8b da             	mov    %r10d,%ebx
    654a:	49 c1 ea 20          	shr    $0x20,%r10
    654e:	4c 03 df             	add    %rdi,%r11
    6551:	4d 03 da             	add    %r10,%r11
    6554:	49 8b f9             	mov    %r9,%rdi
    6557:	4c 0f af ca          	imul   %rdx,%r9
    655b:	48 0f af f8          	imul   %rax,%rdi
    655f:	45 8b d1             	mov    %r9d,%r10d
    6562:	49 c1 e9 20          	shr    $0x20,%r9
    6566:	4d 03 da             	add    %r10,%r11
    6569:	45 8b d3             	mov    %r11d,%r10d
    656c:	49 c1 eb 20          	shr    $0x20,%r11
    6570:	49 03 f9             	add    %r9,%rdi
    6573:	49 03 fb             	add    %r11,%rdi
    6576:	4c 8b ce             	mov    %rsi,%r9
    6579:	48 0f af f2          	imul   %rdx,%rsi
    657d:	4c 0f af c8          	imul   %rax,%r9
    6581:	49 c1 e2 20          	shl    $0x20,%r10
    6585:	4c 0b d3             	or     %rbx,%r10
    6588:	8b 01                	mov    (%rcx),%eax
    658a:	44 8b de             	mov    %esi,%r11d
    658d:	48 c1 ee 20          	shr    $0x20,%rsi
    6591:	49 03 fb             	add    %r11,%rdi
    6594:	44 8b df             	mov    %edi,%r11d
    6597:	48 c1 ef 20          	shr    $0x20,%rdi
    659b:	4c 03 ce             	add    %rsi,%r9
    659e:	4c 03 cf             	add    %rdi,%r9
    65a1:	48 0f af d0          	imul   %rax,%rdx
    65a5:	c5 f9 c5 d8 03       	vpextrw $0x3,%xmm0,%ebx
    65aa:	48 8d 3d ff ba 00 00 	lea    0xbaff(%rip),%rdi        # 120b0 <data.M23.5904>
    65b1:	48 2b cf             	sub    %rdi,%rcx
    65b4:	03 c9                	add    %ecx,%ecx
    65b6:	03 c9                	add    %ecx,%ecx
    65b8:	03 c9                	add    %ecx,%ecx
    65ba:	83 c1 13             	add    $0x13,%ecx
    65bd:	be 00 80 00 00       	mov    $0x8000,%esi
    65c2:	23 f3                	and    %ebx,%esi
    65c4:	c1 eb 04             	shr    $0x4,%ebx
    65c7:	81 e3 ff 07 00 00    	and    $0x7ff,%ebx
    65cd:	81 eb ff 03 00 00    	sub    $0x3ff,%ebx
    65d3:	2b cb                	sub    %ebx,%ecx
    65d5:	4c 03 ca             	add    %rdx,%r9
    65d8:	8b d1                	mov    %ecx,%edx
    65da:	83 c2 20             	add    $0x20,%edx
    65dd:	83 f9 00             	cmp    $0x0,%ecx
    65e0:	0f 8c 4c 03 00 00    	jl     6932 <Stub<AMD64MathStub.tan>+0x792>
    65e6:	f7 d9                	neg    %ecx
    65e8:	83 c1 1d             	add    $0x1d,%ecx
    65eb:	41 d3 e1             	shl    %cl,%r9d
    65ee:	41 8b f9             	mov    %r9d,%edi
    65f1:	41 81 e1 ff ff ff 3f 	and    $0x3fffffff,%r9d
    65f8:	41 f7 c1 00 00 00 20 	test   $0x20000000,%r9d
    65ff:	0f 85 5a 03 00 00    	jne    695f <Stub<AMD64MathStub.tan>+0x7bf>
    6605:	41 d3 e9             	shr    %cl,%r9d
    6608:	bb 00 00 00 00       	mov    $0x0,%ebx
    660d:	49 c1 e1 20          	shl    $0x20,%r9
    6611:	4d 0b cb             	or     %r11,%r9
    6614:	49 83 f9 00          	cmp    $0x0,%r9
    6618:	0f 84 c0 02 00 00    	je     68de <Stub<AMD64MathStub.tan>+0x73e>
    661e:	4d 0f bd d9          	bsr    %r9,%r11
    6622:	b9 1d 00 00 00       	mov    $0x1d,%ecx
    6627:	41 2b cb             	sub    %r11d,%ecx
    662a:	0f 8e df 02 00 00    	jle    690f <Stub<AMD64MathStub.tan>+0x76f>
    6630:	49 d3 e1             	shl    %cl,%r9
    6633:	49 8b c2             	mov    %r10,%rax
    6636:	49 d3 e2             	shl    %cl,%r10
    6639:	03 d1                	add    %ecx,%edx
    663b:	f7 d9                	neg    %ecx
    663d:	83 c1 40             	add    $0x40,%ecx
    6640:	48 d3 e8             	shr    %cl,%rax
    6643:	49 d3 e8             	shr    %cl,%r8
    6646:	4c 0b c8             	or     %rax,%r9
    6649:	4d 0b d0             	or     %r8,%r10
    664c:	c4 c1 fb 2a c1       	vcvtsi2sd %r9,%xmm0,%xmm0
    6651:	49 d1 ea             	shr    %r10
    6654:	c4 c1 e3 2a da       	vcvtsi2sd %r10,%xmm3,%xmm3
    6659:	c5 d9 57 e4          	vxorpd %xmm4,%xmm4,%xmm4
    665d:	c1 e2 04             	shl    $0x4,%edx
    6660:	f7 da                	neg    %edx
    6662:	81 c2 f0 3f 00 00    	add    $0x3ff0,%edx
    6668:	0b d6                	or     %esi,%edx
    666a:	33 d3                	xor    %ebx,%edx
    666c:	c5 d9 c4 e2 03       	vpinsrw $0x3,%edx,%xmm4,%xmm4
    6671:	c4 c1 7a 7e 15 e6 ba 	vmovq  0xbae6(%rip),%xmm2        # 12160 <data.M23.40>
    6678:	00 00 
    667a:	c4 c1 7a 7e 3d e5 ba 	vmovq  0xbae5(%rip),%xmm7        # 12168 <data.M23.48>
    6681:	00 00 
    6683:	c5 d1 57 ed          	vxorpd %xmm5,%xmm5,%xmm5
    6687:	81 ea f0 03 00 00    	sub    $0x3f0,%edx
    668d:	c5 d1 c4 ea 03       	vpinsrw $0x3,%edx,%xmm5,%xmm5
    6692:	c5 fb 59 c4          	vmulsd %xmm4,%xmm0,%xmm0
    6696:	c1 e6 10             	shl    $0x10,%esi
    6699:	c1 fe 1f             	sar    $0x1f,%esi
    669c:	c5 e3 59 dd          	vmulsd %xmm5,%xmm3,%xmm3
    66a0:	c5 fa 6f c8          	vmovdqu %xmm0,%xmm1
    66a4:	c5 fb 59 c2          	vmulsd %xmm2,%xmm0,%xmm0
    66a8:	c1 ef 1e             	shr    $0x1e,%edi
    66ab:	c5 f3 58 cb          	vaddsd %xmm3,%xmm1,%xmm1
    66af:	c5 e3 59 da          	vmulsd %xmm2,%xmm3,%xmm3
    66b3:	03 fe                	add    %esi,%edi
    66b5:	33 fe                	xor    %esi,%edi
    66b7:	c5 c3 59 f9          	vmulsd %xmm1,%xmm7,%xmm7
    66bb:	8b c7                	mov    %edi,%eax
    66bd:	c5 c3 58 fb          	vaddsd %xmm3,%xmm7,%xmm7
    66c1:	c5 fa 6f d0          	vmovdqu %xmm0,%xmm2
    66c5:	c5 fb 58 c7          	vaddsd %xmm7,%xmm0,%xmm0
    66c9:	c5 eb 5c d0          	vsubsd %xmm0,%xmm2,%xmm2
    66cd:	c5 c3 58 fa          	vaddsd %xmm2,%xmm7,%xmm7
    66d1:	c4 c1 7a 6f 0d 06 a3 	vmovdqu 0xa306(%rip),%xmm1        # 109e0 <data.M23.112>
    66d8:	00 00 
    66da:	c5 fb 12 c0          	vmovddup %xmm0,%xmm0
    66de:	c4 c1 7a 6f 25 e9 a2 	vmovdqu 0xa2e9(%rip),%xmm4        # 109d0 <data.M23.96>
    66e5:	00 00 
    66e7:	c5 d9 54 e0          	vandpd %xmm0,%xmm4,%xmm4
    66eb:	c5 f1 59 c8          	vmulpd %xmm0,%xmm1,%xmm1
    66ef:	c5 fb 12 ff          	vmovddup %xmm7,%xmm7
    66f3:	c4 c1 7a 6f 2d b4 a2 	vmovdqu 0xa2b4(%rip),%xmm5        # 109b0 <data.M23.64>
    66fa:	00 00 
    66fc:	c4 c1 7a 6f 35 bb a2 	vmovdqu 0xa2bb(%rip),%xmm6        # 109c0 <data.M23.80>
    6703:	00 00 
    6705:	c5 d1 eb ec          	vpor   %xmm4,%xmm5,%xmm5
    6709:	c5 f1 58 cd          	vaddpd %xmm5,%xmm1,%xmm1
    670d:	c5 fa 6f e9          	vmovdqu %xmm1,%xmm5
    6711:	c5 d1 15 ed          	vunpckhpd %xmm5,%xmm5,%xmm5
    6715:	c5 fb 2c d5          	vcvttsd2si %xmm5,%edx
    6719:	c5 f9 e6 c9          	vcvttpd2dq %xmm1,%xmm1
    671d:	c5 fa e6 c9          	vcvtdq2pd %xmm1,%xmm1
    6721:	c5 f1 59 ce          	vmulpd %xmm6,%xmm1,%xmm1
    6725:	c4 c1 7a 6f 1d c2 a2 	vmovdqu 0xa2c2(%rip),%xmm3        # 109f0 <data.M23.128>
    672c:	00 00 
    672e:	c4 c1 7a 7e 2d c9 a2 	vmovq  0xa2c9(%rip),%xmm5        # 10a00 <data.M23.16>
    6735:	00 00 
    6737:	c1 e0 04             	shl    $0x4,%eax
    673a:	81 c2 00 29 07 00    	add    $0x72900,%edx
    6740:	c4 c1 7a 6f 25 c7 a2 	vmovdqu 0xa2c7(%rip),%xmm4        # 10a10 <data.M23.144>
    6747:	00 00 
    6749:	c5 e1 59 d9          	vmulpd %xmm1,%xmm3,%xmm3
    674d:	03 d0                	add    %eax,%edx
    674f:	83 e2 1f             	and    $0x1f,%edx
    6752:	c5 d3 59 e9          	vmulsd %xmm1,%xmm5,%xmm5
    6756:	8b ca                	mov    %edx,%ecx
    6758:	c5 d9 59 e1          	vmulpd %xmm1,%xmm4,%xmm4
    675c:	d1 e1                	shl    %ecx
    675e:	c5 f9 5c c3          	vsubpd %xmm3,%xmm0,%xmm0
    6762:	c4 c1 71 59 0d b5 a2 	vmulpd 0xa2b5(%rip),%xmm1,%xmm1        # 10a20 <data.M23.160>
    6769:	00 00 
    676b:	03 d1                	add    %ecx,%edx
    676d:	c1 e1 02             	shl    $0x2,%ecx
    6770:	03 d1                	add    %ecx,%edx
    6772:	c5 d3 58 e8          	vaddsd %xmm0,%xmm5,%xmm5
    6776:	c5 fa 6f d0          	vmovdqu %xmm0,%xmm2
    677a:	c5 f9 5c c4          	vsubpd %xmm4,%xmm0,%xmm0
    677e:	c4 c1 7a 7e 35 a9 a2 	vmovq  0xa2a9(%rip),%xmm6        # 10a30 <data.M23.24>
    6785:	00 00 
    6787:	c1 e2 04             	shl    $0x4,%edx
    678a:	48 8d 05 af a2 00 00 	lea    0xa2af(%rip),%rax        # 10a40 <data.M23.176>
    6791:	c4 c1 51 54 2d a6 b8 	vandpd 0xb8a6(%rip),%xmm5,%xmm5        # 12040 <data.M23.5808>
    6798:	00 00 
    679a:	c5 fa 6f d8          	vmovdqu %xmm0,%xmm3
    679e:	48 03 c2             	add    %rdx,%rax
    67a1:	c5 e9 5c d0          	vsubpd %xmm0,%xmm2,%xmm2
    67a5:	c5 f9 15 c0          	vunpckhpd %xmm0,%xmm0,%xmm0
    67a9:	c5 cb 5e f5          	vdivsd %xmm5,%xmm6,%xmm6
    67ad:	c5 e9 5c d4          	vsubpd %xmm4,%xmm2,%xmm2
    67b1:	c5 e3 5c dd          	vsubsd %xmm5,%xmm3,%xmm3
    67b5:	c5 e9 5c d1          	vsubpd %xmm1,%xmm2,%xmm2
    67b9:	c5 fa 6f 48 30       	vmovdqu 0x30(%rax),%xmm1
    67be:	c5 e9 58 d7          	vaddpd %xmm7,%xmm2,%xmm2
    67c2:	c5 fa 6f 78 10       	vmovdqu 0x10(%rax),%xmm7
    67c7:	c5 c1 59 f8          	vmulpd %xmm0,%xmm7,%xmm7
    67cb:	c5 fa 6f 60 60       	vmovdqu 0x60(%rax),%xmm4
    67d0:	c5 f1 59 c8          	vmulpd %xmm0,%xmm1,%xmm1
    67d4:	c5 d9 59 e0          	vmulpd %xmm0,%xmm4,%xmm4
    67d8:	c5 eb 58 d3          	vaddsd %xmm3,%xmm2,%xmm2
    67dc:	c5 fa 6f d8          	vmovdqu %xmm0,%xmm3
    67e0:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    67e4:	c5 c1 58 38          	vaddpd (%rax),%xmm7,%xmm7
    67e8:	c5 f1 58 48 20       	vaddpd 0x20(%rax),%xmm1,%xmm1
    67ed:	c5 f1 59 c8          	vmulpd %xmm0,%xmm1,%xmm1
    67f1:	c5 d9 58 60 50       	vaddpd 0x50(%rax),%xmm4,%xmm4
    67f6:	c5 c1 58 f9          	vaddpd %xmm1,%xmm7,%xmm7
    67fa:	c5 fa 6f 48 70       	vmovdqu 0x70(%rax),%xmm1
    67ff:	c5 f1 59 c8          	vmulpd %xmm0,%xmm1,%xmm1
    6803:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    6807:	c5 d9 58 e1          	vaddpd %xmm1,%xmm4,%xmm4
    680b:	c5 fa 6f 48 40       	vmovdqu 0x40(%rax),%xmm1
    6810:	c5 f1 59 c8          	vmulpd %xmm0,%xmm1,%xmm1
    6814:	c5 c1 58 f9          	vaddpd %xmm1,%xmm7,%xmm7
    6818:	c5 fa 6f cb          	vmovdqu %xmm3,%xmm1
    681c:	c5 e1 59 d8          	vmulpd %xmm0,%xmm3,%xmm3
    6820:	c5 fb 59 c0          	vmulsd %xmm0,%xmm0,%xmm0
    6824:	c5 f1 59 88 90 00 00 	vmulpd 0x90(%rax),%xmm1,%xmm1
    682b:	00 
    682c:	c5 d9 59 e3          	vmulpd %xmm3,%xmm4,%xmm4
    6830:	c5 fa 6f d9          	vmovdqu %xmm1,%xmm3
    6834:	c5 c1 58 fc          	vaddpd %xmm4,%xmm7,%xmm7
    6838:	c5 fa 6f e1          	vmovdqu %xmm1,%xmm4
    683c:	c5 fb 59 c7          	vmulsd %xmm7,%xmm0,%xmm0
    6840:	c5 c1 15 ff          	vunpckhpd %xmm7,%xmm7,%xmm7
    6844:	c5 fb 58 c7          	vaddsd %xmm7,%xmm0,%xmm0
    6848:	c5 f1 15 c9          	vunpckhpd %xmm1,%xmm1,%xmm1
    684c:	c5 e3 58 d9          	vaddsd %xmm1,%xmm3,%xmm3
    6850:	c5 db 5c e3          	vsubsd %xmm3,%xmm4,%xmm4
    6854:	c5 f3 58 cc          	vaddsd %xmm4,%xmm1,%xmm1
    6858:	c5 fa 6f e2          	vmovdqu %xmm2,%xmm4
    685c:	c5 fa 7e b8 90 00 00 	vmovq  0x90(%rax),%xmm7
    6863:	00 
    6864:	c5 e9 15 d2          	vunpckhpd %xmm2,%xmm2,%xmm2
    6868:	c5 c3 58 b8 98 00 00 	vaddsd 0x98(%rax),%xmm7,%xmm7
    686f:	00 
    6870:	c5 c3 59 fa          	vmulsd %xmm2,%xmm7,%xmm7
    6874:	c5 c3 58 b8 88 00 00 	vaddsd 0x88(%rax),%xmm7,%xmm7
    687b:	00 
    687c:	c5 c3 58 f9          	vaddsd %xmm1,%xmm7,%xmm7
    6880:	c5 fb 58 c7          	vaddsd %xmm7,%xmm0,%xmm0
    6884:	c4 c1 7a 7e 3d a3 a1 	vmovq  0xa1a3(%rip),%xmm7        # 10a30 <data.M23.24>
    688b:	00 00 
    688d:	c5 db 59 e6          	vmulsd %xmm6,%xmm4,%xmm4
    6891:	c5 fa 7e 90 a8 00 00 	vmovq  0xa8(%rax),%xmm2
    6898:	00 
    6899:	c5 e9 54 d6          	vandpd %xmm6,%xmm2,%xmm2
    689d:	c5 d3 59 ea          	vmulsd %xmm2,%xmm5,%xmm5
    68a1:	c5 cb 59 b0 a0 00 00 	vmulsd 0xa0(%rax),%xmm6,%xmm6
    68a8:	00 
    68a9:	c5 c3 5c fd          	vsubsd %xmm5,%xmm7,%xmm7
    68ad:	c5 eb 5c 90 80 00 00 	vsubsd 0x80(%rax),%xmm2,%xmm2
    68b4:	00 
    68b5:	c5 c3 5c fc          	vsubsd %xmm4,%xmm7,%xmm7
    68b9:	c5 c3 59 fe          	vmulsd %xmm6,%xmm7,%xmm7
    68bd:	c5 fa 6f e3          	vmovdqu %xmm3,%xmm4
    68c1:	c5 e3 5c da          	vsubsd %xmm2,%xmm3,%xmm3
    68c5:	c5 eb 58 d3          	vaddsd %xmm3,%xmm2,%xmm2
    68c9:	c5 db 5c e2          	vsubsd %xmm2,%xmm4,%xmm4
    68cd:	c5 fb 58 c4          	vaddsd %xmm4,%xmm0,%xmm0
    68d1:	c5 fb 5c c7          	vsubsd %xmm7,%xmm0,%xmm0
    68d5:	c5 fb 58 c3          	vaddsd %xmm3,%xmm0,%xmm0
    68d9:	e9 18 01 00 00       	jmpq   69f6 <Stub<AMD64MathStub.tan>+0x856>
    68de:	83 c2 40             	add    $0x40,%edx
    68e1:	4d 8b ca             	mov    %r10,%r9
    68e4:	4d 8b d0             	mov    %r8,%r10
    68e7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    68ed:	49 83 f9 00          	cmp    $0x0,%r9
    68f1:	0f 85 27 fd ff ff    	jne    661e <Stub<AMD64MathStub.tan>+0x47e>
    68f7:	83 c2 40             	add    $0x40,%edx
    68fa:	4d 8b ca             	mov    %r10,%r9
    68fd:	4d 8b d0             	mov    %r8,%r10
    6900:	49 83 f9 00          	cmp    $0x0,%r9
    6904:	0f 85 14 fd ff ff    	jne    661e <Stub<AMD64MathStub.tan>+0x47e>
    690a:	e9 3d fd ff ff       	jmpq   664c <Stub<AMD64MathStub.tan>+0x4ac>
    690f:	0f 84 37 fd ff ff    	je     664c <Stub<AMD64MathStub.tan>+0x4ac>
    6915:	f7 d9                	neg    %ecx
    6917:	49 d3 ea             	shr    %cl,%r10
    691a:	49 8b c1             	mov    %r9,%rax
    691d:	49 d3 e9             	shr    %cl,%r9
    6920:	2b d1                	sub    %ecx,%edx
    6922:	f7 d9                	neg    %ecx
    6924:	83 c1 40             	add    $0x40,%ecx
    6927:	48 d3 e0             	shl    %cl,%rax
    692a:	4c 0b d0             	or     %rax,%r10
    692d:	e9 1a fd ff ff       	jmpq   664c <Stub<AMD64MathStub.tan>+0x4ac>
    6932:	f7 d1                	not    %ecx
    6934:	49 c1 e1 20          	shl    $0x20,%r9
    6938:	4d 0b cb             	or     %r11,%r9
    693b:	49 d3 e1             	shl    %cl,%r9
    693e:	49 8b f9             	mov    %r9,%rdi
    6941:	41 f7 c1 00 00 00 80 	test   $0x80000000,%r9d
    6948:	0f 85 53 00 00 00    	jne    69a1 <Stub<AMD64MathStub.tan>+0x801>
    694e:	41 d3 e9             	shr    %cl,%r9d
    6951:	bb 00 00 00 00       	mov    $0x0,%ebx
    6956:	48 c1 ef 02          	shr    $0x2,%rdi
    695a:	e9 b5 fc ff ff       	jmpq   6614 <Stub<AMD64MathStub.tan>+0x474>
    695f:	41 d3 e9             	shr    %cl,%r9d
    6962:	bb 00 00 00 40       	mov    $0x40000000,%ebx
    6967:	d3 eb                	shr    %cl,%ebx
    6969:	49 c1 e1 20          	shl    $0x20,%r9
    696d:	4d 0b cb             	or     %r11,%r9
    6970:	48 c1 e3 20          	shl    $0x20,%rbx
    6974:	81 c7 00 00 00 40    	add    $0x40000000,%edi
    697a:	b9 00 00 00 00       	mov    $0x0,%ecx
    697f:	41 bb 00 00 00 00    	mov    $0x0,%r11d
    6985:	49 2b c8             	sub    %r8,%rcx
    6988:	4d 1b da             	sbb    %r10,%r11
    698b:	49 1b d9             	sbb    %r9,%rbx
    698e:	4c 8b c1             	mov    %rcx,%r8
    6991:	4d 8b d3             	mov    %r11,%r10
    6994:	4c 8b cb             	mov    %rbx,%r9
    6997:	bb 00 80 00 00       	mov    $0x8000,%ebx
    699c:	e9 73 fc ff ff       	jmpq   6614 <Stub<AMD64MathStub.tan>+0x474>
    69a1:	41 d3 e9             	shr    %cl,%r9d
    69a4:	48 bb 00 00 00 00 01 	movabs $0x100000000,%rbx
    69ab:	00 00 00 
    69ae:	48 d3 eb             	shr    %cl,%rbx
    69b1:	b9 00 00 00 00       	mov    $0x0,%ecx
    69b6:	41 bb 00 00 00 00    	mov    $0x0,%r11d
    69bc:	49 2b c8             	sub    %r8,%rcx
    69bf:	4d 1b da             	sbb    %r10,%r11
    69c2:	49 1b d9             	sbb    %r9,%rbx
    69c5:	4c 8b c1             	mov    %rcx,%r8
    69c8:	4d 8b d3             	mov    %r11,%r10
    69cb:	4c 8b cb             	mov    %rbx,%r9
    69ce:	bb 00 80 00 00       	mov    $0x8000,%ebx
    69d3:	48 c1 ef 02          	shr    $0x2,%rdi
    69d7:	81 c7 00 00 00 40    	add    $0x40000000,%edi
    69dd:	e9 32 fc ff ff       	jmpq   6614 <Stub<AMD64MathStub.tan>+0x474>
    69e2:	c5 fa 7e 44 24 08    	vmovq  0x8(%rsp),%xmm0
    69e8:	c4 c1 7b 59 05 7f b7 	vmulsd 0xb77f(%rip),%xmm0,%xmm0        # 12170 <data.M23.8>
    69ef:	00 00 
    69f1:	c5 f9 d6 04 24       	vmovq  %xmm0,(%rsp)
    69f6:	48 83 c4 10          	add    $0x10,%rsp
    69fa:	5b                   	pop    %rbx
    69fb:	c3                   	retq   
    69fc:	00 00                	add    %al,(%rax)
    69fe:	00 00                	add    %al,(%rax)
    6a00:	18 00                	sbb    %al,(%rax)
	...

0000000000006a20 <Stub<AMD64MathStub.exp>>:
    6a20:	48 83 ec 18          	sub    $0x18,%rsp
    6a24:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
    6a2a:	c5 f9 14 c0          	vunpcklpd %xmm0,%xmm0,%xmm0
    6a2e:	c4 c1 7a 6f 0d 49 b7 	vmovdqu 0xb749(%rip),%xmm1        # 12180 <data.M24.48>
    6a35:	00 00 
    6a37:	c4 c1 7a 6f 35 50 b7 	vmovdqu 0xb750(%rip),%xmm6        # 12190 <data.M24.64>
    6a3e:	00 00 
    6a40:	c4 c1 7a 6f 15 57 b7 	vmovdqu 0xb757(%rip),%xmm2        # 121a0 <data.M24.80>
    6a47:	00 00 
    6a49:	c4 c1 7a 6f 1d 5e b7 	vmovdqu 0xb75e(%rip),%xmm3        # 121b0 <data.M24.96>
    6a50:	00 00 
    6a52:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    6a57:	81 e0 ff 7f 00 00    	and    $0x7fff,%eax
    6a5d:	ba 8f 40 00 00       	mov    $0x408f,%edx
    6a62:	2b d0                	sub    %eax,%edx
    6a64:	81 e8 90 3c 00 00    	sub    $0x3c90,%eax
    6a6a:	0b d0                	or     %eax,%edx
    6a6c:	81 fa 00 00 00 80    	cmp    $0x80000000,%edx
    6a72:	0f 83 9a 02 00 00    	jae    6d12 <Stub<AMD64MathStub.exp>+0x2f2>
    6a78:	c5 f1 59 c8          	vmulpd %xmm0,%xmm1,%xmm1
    6a7c:	c5 f1 58 ce          	vaddpd %xmm6,%xmm1,%xmm1
    6a80:	c5 f9 28 f9          	vmovapd %xmm1,%xmm7
    6a84:	c5 f1 5c ce          	vsubpd %xmm6,%xmm1,%xmm1
    6a88:	c5 e9 59 d1          	vmulpd %xmm1,%xmm2,%xmm2
    6a8c:	c4 c1 7a 6f 25 2b b7 	vmovdqu 0xb72b(%rip),%xmm4        # 121c0 <data.M24.112>
    6a93:	00 00 
    6a95:	c5 e1 59 d9          	vmulpd %xmm1,%xmm3,%xmm3
    6a99:	c4 c1 7a 6f 2d 2e b7 	vmovdqu 0xb72e(%rip),%xmm5        # 121d0 <data.M24.128>
    6aa0:	00 00 
    6aa2:	c5 f9 5c c2          	vsubpd %xmm2,%xmm0,%xmm0
    6aa6:	c5 f9 7e f8          	vmovd  %xmm7,%eax
    6aaa:	8b c8                	mov    %eax,%ecx
    6aac:	83 e1 3f             	and    $0x3f,%ecx
    6aaf:	c1 e1 04             	shl    $0x4,%ecx
    6ab2:	c1 f8 06             	sar    $0x6,%eax
    6ab5:	8b d0                	mov    %eax,%edx
    6ab7:	c4 c1 7a 6f 35 20 b7 	vmovdqu 0xb720(%rip),%xmm6        # 121e0 <data.M24.144>
    6abe:	00 00 
    6ac0:	c5 c1 db fe          	vpand  %xmm6,%xmm7,%xmm7
    6ac4:	c4 c1 7a 6f 35 23 b7 	vmovdqu 0xb723(%rip),%xmm6        # 121f0 <data.M24.160>
    6acb:	00 00 
    6acd:	c5 c1 d4 fe          	vpaddq %xmm6,%xmm7,%xmm7
    6ad1:	c5 c1 73 f7 2e       	vpsllq $0x2e,%xmm7,%xmm7
    6ad6:	c5 f9 5c c3          	vsubpd %xmm3,%xmm0,%xmm0
    6ada:	4c 8d 1d 1f b7 00 00 	lea    0xb71f(%rip),%r11        # 12200 <data.M24.176>
    6ae1:	c4 a1 7a 6f 14 19    	vmovdqu (%rcx,%r11,1),%xmm2
    6ae7:	c5 d9 59 e0          	vmulpd %xmm0,%xmm4,%xmm4
    6aeb:	c5 f9 28 f0          	vmovapd %xmm0,%xmm6
    6aef:	c5 f9 28 c8          	vmovapd %xmm0,%xmm1
    6af3:	c5 c9 59 f6          	vmulpd %xmm6,%xmm6,%xmm6
    6af7:	c5 f9 59 c6          	vmulpd %xmm6,%xmm0,%xmm0
    6afb:	c5 d1 58 ec          	vaddpd %xmm4,%xmm5,%xmm5
    6aff:	c5 fb 59 c6          	vmulsd %xmm6,%xmm0,%xmm0
    6b03:	c4 c1 49 59 35 f4 ba 	vmulpd 0xbaf4(%rip),%xmm6,%xmm6        # 12600 <data.M24.1200>
    6b0a:	00 00 
    6b0c:	c5 f3 58 ca          	vaddsd %xmm2,%xmm1,%xmm1
    6b10:	c5 e9 15 d2          	vunpckhpd %xmm2,%xmm2,%xmm2
    6b14:	c5 f9 59 c5          	vmulpd %xmm5,%xmm0,%xmm0
    6b18:	c5 f3 58 c8          	vaddsd %xmm0,%xmm1,%xmm1
    6b1c:	c5 e9 eb d7          	vpor   %xmm7,%xmm2,%xmm2
    6b20:	c5 f9 15 c0          	vunpckhpd %xmm0,%xmm0,%xmm0
    6b24:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
    6b28:	c5 fb 58 c6          	vaddsd %xmm6,%xmm0,%xmm0
    6b2c:	81 c2 7e 03 00 00    	add    $0x37e,%edx
    6b32:	81 fa 7c 07 00 00    	cmp    $0x77c,%edx
    6b38:	0f 87 0d 00 00 00    	ja     6b4b <Stub<AMD64MathStub.exp>+0x12b>
    6b3e:	c5 fb 59 c2          	vmulsd %xmm2,%xmm0,%xmm0
    6b42:	c5 fb 58 c2          	vaddsd %xmm2,%xmm0,%xmm0
    6b46:	e9 fd 01 00 00       	jmpq   6d48 <Stub<AMD64MathStub.exp>+0x328>
    6b4b:	c5 e1 57 db          	vxorpd %xmm3,%xmm3,%xmm3
    6b4f:	c4 c1 7a 6f 25 b8 ba 	vmovdqu 0xbab8(%rip),%xmm4        # 12610 <data.M24.1216>
    6b56:	00 00 
    6b58:	ba 02 fc ff ff       	mov    $0xfffffc02,%edx
    6b5d:	2b d0                	sub    %eax,%edx
    6b5f:	c5 f9 6e ea          	vmovd  %edx,%xmm5
    6b63:	c5 d9 f3 e5          	vpsllq %xmm5,%xmm4,%xmm4
    6b67:	8b c8                	mov    %eax,%ecx
    6b69:	d1 f8                	sar    %eax
    6b6b:	c5 e1 c4 d8 03       	vpinsrw $0x3,%eax,%xmm3,%xmm3
    6b70:	c4 c1 7a 6f 35 a7 ba 	vmovdqu 0xbaa7(%rip),%xmm6        # 12620 <data.M24.1232>
    6b77:	00 00 
    6b79:	c5 e1 73 f3 04       	vpsllq $0x4,%xmm3,%xmm3
    6b7e:	c5 e9 fa d3          	vpsubd %xmm3,%xmm2,%xmm2
    6b82:	c5 fb 59 c2          	vmulsd %xmm2,%xmm0,%xmm0
    6b86:	83 fa 34             	cmp    $0x34,%edx
    6b89:	0f 8f c9 00 00 00    	jg     6c58 <Stub<AMD64MathStub.exp>+0x238>
    6b8f:	c5 d9 db e2          	vpand  %xmm2,%xmm4,%xmm4
    6b93:	c5 e1 fe de          	vpaddd %xmm6,%xmm3,%xmm3
    6b97:	c5 eb 5c d4          	vsubsd %xmm4,%xmm2,%xmm2
    6b9b:	c5 fb 58 c2          	vaddsd %xmm2,%xmm0,%xmm0
    6b9f:	81 f9 ff 03 00 00    	cmp    $0x3ff,%ecx
    6ba5:	0f 8d 89 00 00 00    	jge    6c34 <Stub<AMD64MathStub.exp>+0x214>
    6bab:	c5 f9 c5 c8 03       	vpextrw $0x3,%xmm0,%ecx
    6bb0:	81 e1 00 80 00 00    	and    $0x8000,%ecx
    6bb6:	0b d1                	or     %ecx,%edx
    6bb8:	83 fa 00             	cmp    $0x0,%edx
    6bbb:	0f 84 66 00 00 00    	je     6c27 <Stub<AMD64MathStub.exp>+0x207>
    6bc1:	c5 f9 28 f0          	vmovapd %xmm0,%xmm6
    6bc5:	c5 fb 58 c4          	vaddsd %xmm4,%xmm0,%xmm0
    6bc9:	c5 fb 59 c3          	vmulsd %xmm3,%xmm0,%xmm0
    6bcd:	c5 f9 c5 c8 03       	vpextrw $0x3,%xmm0,%ecx
    6bd2:	81 e1 f0 7f 00 00    	and    $0x7ff0,%ecx
    6bd8:	83 f9 00             	cmp    $0x0,%ecx
    6bdb:	0f 84 05 00 00 00    	je     6be6 <Stub<AMD64MathStub.exp>+0x1c6>
    6be1:	e9 62 01 00 00       	jmpq   6d48 <Stub<AMD64MathStub.exp>+0x328>
    6be6:	c5 cb 59 f3          	vmulsd %xmm3,%xmm6,%xmm6
    6bea:	c5 db 59 e3          	vmulsd %xmm3,%xmm4,%xmm4
    6bee:	c5 fa 6f c6          	vmovdqu %xmm6,%xmm0
    6bf2:	c5 c9 ef f4          	vpxor  %xmm4,%xmm6,%xmm6
    6bf6:	c5 c9 72 e6 1f       	vpsrad $0x1f,%xmm6,%xmm6
    6bfb:	c5 f9 70 f6 55       	vpshufd $0x55,%xmm6,%xmm6
    6c00:	c5 f9 73 f0 01       	vpsllq $0x1,%xmm0,%xmm0
    6c05:	c5 f9 73 d0 01       	vpsrlq $0x1,%xmm0,%xmm0
    6c0a:	c5 f9 ef c6          	vpxor  %xmm6,%xmm0,%xmm0
    6c0e:	c5 c9 73 d6 3f       	vpsrlq $0x3f,%xmm6,%xmm6
    6c13:	c5 f9 d4 c6          	vpaddq %xmm6,%xmm0,%xmm0
    6c17:	c5 f9 d4 c4          	vpaddq %xmm4,%xmm0,%xmm0
    6c1b:	c7 04 24 0f 00 00 00 	movl   $0xf,(%rsp)
    6c22:	e9 15 01 00 00       	jmpq   6d3c <Stub<AMD64MathStub.exp>+0x31c>
    6c27:	c5 fb 58 c4          	vaddsd %xmm4,%xmm0,%xmm0
    6c2b:	c5 fb 59 c3          	vmulsd %xmm3,%xmm0,%xmm0
    6c2f:	e9 14 01 00 00       	jmpq   6d48 <Stub<AMD64MathStub.exp>+0x328>
    6c34:	c5 fb 58 c4          	vaddsd %xmm4,%xmm0,%xmm0
    6c38:	c5 fb 59 c3          	vmulsd %xmm3,%xmm0,%xmm0
    6c3c:	c5 f9 c5 c8 03       	vpextrw $0x3,%xmm0,%ecx
    6c41:	81 e1 f0 7f 00 00    	and    $0x7ff0,%ecx
    6c47:	81 f9 f0 7f 00 00    	cmp    $0x7ff0,%ecx
    6c4d:	0f 83 46 00 00 00    	jae    6c99 <Stub<AMD64MathStub.exp>+0x279>
    6c53:	e9 f0 00 00 00       	jmpq   6d48 <Stub<AMD64MathStub.exp>+0x328>
    6c58:	c5 e1 fe de          	vpaddd %xmm6,%xmm3,%xmm3
    6c5c:	c5 f9 58 c2          	vaddpd %xmm2,%xmm0,%xmm0
    6c60:	c5 fb 59 c3          	vmulsd %xmm3,%xmm0,%xmm0
    6c64:	c7 04 24 0f 00 00 00 	movl   $0xf,(%rsp)
    6c6b:	e9 cc 00 00 00       	jmpq   6d3c <Stub<AMD64MathStub.exp>+0x31c>
    6c70:	81 f8 00 00 f0 7f    	cmp    $0x7ff00000,%eax
    6c76:	0f 83 42 00 00 00    	jae    6cbe <Stub<AMD64MathStub.exp>+0x29e>
    6c7c:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    6c80:	81 f8 00 00 00 80    	cmp    $0x80000000,%eax
    6c86:	0f 83 19 00 00 00    	jae    6ca5 <Stub<AMD64MathStub.exp>+0x285>
    6c8c:	c4 c1 7b 10 05 9b b9 	vmovsd 0xb99b(%rip),%xmm0        # 12630 <data.M24.0>
    6c93:	00 00 
    6c95:	c5 fb 59 c0          	vmulsd %xmm0,%xmm0,%xmm0
    6c99:	c7 04 24 0e 00 00 00 	movl   $0xe,(%rsp)
    6ca0:	e9 97 00 00 00       	jmpq   6d3c <Stub<AMD64MathStub.exp>+0x31c>
    6ca5:	c4 c1 7b 10 05 8a b9 	vmovsd 0xb98a(%rip),%xmm0        # 12638 <data.M24.8>
    6cac:	00 00 
    6cae:	c5 fb 59 c0          	vmulsd %xmm0,%xmm0,%xmm0
    6cb2:	c7 04 24 0f 00 00 00 	movl   $0xf,(%rsp)
    6cb9:	e9 7e 00 00 00       	jmpq   6d3c <Stub<AMD64MathStub.exp>+0x31c>
    6cbe:	8b 54 24 08          	mov    0x8(%rsp),%edx
    6cc2:	81 f8 00 00 f0 7f    	cmp    $0x7ff00000,%eax
    6cc8:	0f 87 35 00 00 00    	ja     6d03 <Stub<AMD64MathStub.exp>+0x2e3>
    6cce:	83 fa 00             	cmp    $0x0,%edx
    6cd1:	0f 85 2c 00 00 00    	jne    6d03 <Stub<AMD64MathStub.exp>+0x2e3>
    6cd7:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    6cdb:	81 f8 00 00 f0 7f    	cmp    $0x7ff00000,%eax
    6ce1:	0f 85 0e 00 00 00    	jne    6cf5 <Stub<AMD64MathStub.exp>+0x2d5>
    6ce7:	c4 c1 7b 10 05 50 b9 	vmovsd 0xb950(%rip),%xmm0        # 12640 <data.M24.16>
    6cee:	00 00 
    6cf0:	e9 53 00 00 00       	jmpq   6d48 <Stub<AMD64MathStub.exp>+0x328>
    6cf5:	c4 c1 7b 10 05 4a b9 	vmovsd 0xb94a(%rip),%xmm0        # 12648 <data.M24.24>
    6cfc:	00 00 
    6cfe:	e9 45 00 00 00       	jmpq   6d48 <Stub<AMD64MathStub.exp>+0x328>
    6d03:	c5 fb 10 44 24 08    	vmovsd 0x8(%rsp),%xmm0
    6d09:	c5 fb 58 c0          	vaddsd %xmm0,%xmm0,%xmm0
    6d0d:	e9 36 00 00 00       	jmpq   6d48 <Stub<AMD64MathStub.exp>+0x328>
    6d12:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    6d16:	81 e0 ff ff ff 7f    	and    $0x7fffffff,%eax
    6d1c:	81 f8 00 00 90 40    	cmp    $0x40900000,%eax
    6d22:	0f 83 48 ff ff ff    	jae    6c70 <Stub<AMD64MathStub.exp>+0x250>
    6d28:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
    6d2e:	c4 c1 7b 58 05 19 b9 	vaddsd 0xb919(%rip),%xmm0,%xmm0        # 12650 <data.M24.32>
    6d35:	00 00 
    6d37:	e9 0c 00 00 00       	jmpq   6d48 <Stub<AMD64MathStub.exp>+0x328>
    6d3c:	c5 f9 d6 44 24 10    	vmovq  %xmm0,0x10(%rsp)
    6d42:	c5 fa 7e 44 24 10    	vmovq  0x10(%rsp),%xmm0
    6d48:	48 83 c4 18          	add    $0x18,%rsp
    6d4c:	c3                   	retq   
	...
    6d7d:	00 00                	add    %al,(%rax)
    6d7f:	00 19                	add    %bl,(%rcx)
	...

0000000000006da0 <Stub<AMD64MathStub.log>>:
    6da0:	48 83 ec 18          	sub    $0x18,%rsp
    6da4:	c5 fb 11 04 24       	vmovsd %xmm0,(%rsp)
    6da9:	48 b8 00 00 00 00 00 	movabs $0x3ff0000000000000,%rax
    6db0:	00 f0 3f 
    6db3:	c4 e1 f9 6e d0       	vmovq  %rax,%xmm2
    6db8:	48 ba 00 00 00 00 00 	movabs $0x77f0000000000000,%rdx
    6dbf:	00 f0 77 
    6dc2:	c4 e1 f9 6e da       	vmovq  %rdx,%xmm3
    6dc7:	b9 00 80 00 00       	mov    $0x8000,%ecx
    6dcc:	c5 f9 6e e1          	vmovd  %ecx,%xmm4
    6dd0:	49 b8 00 00 00 00 00 	movabs $0xffffe00000000000,%r8
    6dd7:	e0 ff ff 
    6dda:	c4 c1 f9 6e e8       	vmovq  %r8,%xmm5
    6ddf:	c5 fa 6f c8          	vmovdqu %xmm0,%xmm1
    6de3:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    6de8:	c5 f9 eb c2          	vpor   %xmm2,%xmm0,%xmm0
    6dec:	b9 e0 3f 00 00       	mov    $0x3fe0,%ecx
    6df1:	c5 f9 73 d0 1b       	vpsrlq $0x1b,%xmm0,%xmm0
    6df6:	4c 8d 1d 63 b8 00 00 	lea    0xb863(%rip),%r11        # 12660 <data.M25.16>
    6dfd:	c5 f9 72 d0 02       	vpsrld $0x2,%xmm0,%xmm0
    6e02:	c5 f8 53 c0          	vrcpps %xmm0,%xmm0
    6e06:	c5 f1 73 f1 0c       	vpsllq $0xc,%xmm1,%xmm1
    6e0b:	c5 f9 70 f5 e4       	vpshufd $0xe4,%xmm5,%xmm6
    6e10:	c5 f1 73 d1 0c       	vpsrlq $0xc,%xmm1,%xmm1
    6e15:	83 e8 10             	sub    $0x10,%eax
    6e18:	81 f8 e0 7f 00 00    	cmp    $0x7fe0,%eax
    6e1e:	0f 83 d8 00 00 00    	jae    6efc <Stub<AMD64MathStub.log>+0x15c>
    6e24:	c5 f9 fe c4          	vpaddd %xmm4,%xmm0,%xmm0
    6e28:	c5 f1 eb cb          	vpor   %xmm3,%xmm1,%xmm1
    6e2c:	c5 f9 7e c2          	vmovd  %xmm0,%edx
    6e30:	c5 f9 73 f0 1d       	vpsllq $0x1d,%xmm0,%xmm0
    6e35:	c5 d1 db e9          	vpand  %xmm1,%xmm5,%xmm5
    6e39:	c5 f9 db c6          	vpand  %xmm6,%xmm0,%xmm0
    6e3d:	c5 f3 5c cd          	vsubsd %xmm5,%xmm1,%xmm1
    6e41:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    6e45:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    6e4b:	2b c1                	sub    %ecx,%eax
    6e4d:	c5 c3 2a f8          	vcvtsi2sd %eax,%xmm7,%xmm7
    6e51:	c5 f3 59 c8          	vmulsd %xmm0,%xmm1,%xmm1
    6e55:	c4 c1 7a 7e 35 12 c0 	vmovq  0xc012(%rip),%xmm6        # 12e70 <data.M25.0>
    6e5c:	00 00 
    6e5e:	c4 c1 7a 6f 1d 19 c0 	vmovdqu 0xc019(%rip),%xmm3        # 12e80 <data.M25.2080>
    6e65:	00 00 
    6e67:	c5 d3 5c ea          	vsubsd %xmm2,%xmm5,%xmm5
    6e6b:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    6e71:	c1 ea 0c             	shr    $0xc,%edx
    6e74:	c4 c1 7a 6f 04 13    	vmovdqu (%r11,%rdx,1),%xmm0
    6e7a:	c4 c1 7a 6f 25 0d c0 	vmovdqu 0xc00d(%rip),%xmm4        # 12e90 <data.M25.2096>
    6e81:	00 00 
    6e83:	c5 f3 58 cd          	vaddsd %xmm5,%xmm1,%xmm1
    6e87:	c4 c1 7a 6f 15 10 c0 	vmovdqu 0xc010(%rip),%xmm2        # 12ea0 <data.M25.2112>
    6e8e:	00 00 
    6e90:	c5 cb 59 f7          	vmulsd %xmm7,%xmm6,%xmm6
    6e94:	c5 fb 12 e9          	vmovddup %xmm1,%xmm5
    6e98:	c4 c1 43 59 3d 0f c0 	vmulsd 0xc00f(%rip),%xmm7,%xmm7        # 12eb0 <data.M25.8>
    6e9f:	00 00 
    6ea1:	c5 e3 59 d9          	vmulsd %xmm1,%xmm3,%xmm3
    6ea5:	c5 fb 58 c6          	vaddsd %xmm6,%xmm0,%xmm0
    6ea9:	c5 d9 59 e5          	vmulpd %xmm5,%xmm4,%xmm4
    6ead:	c5 d1 59 ed          	vmulpd %xmm5,%xmm5,%xmm5
    6eb1:	c5 fb 12 f0          	vmovddup %xmm0,%xmm6
    6eb5:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
    6eb9:	c5 d9 58 e2          	vaddpd %xmm2,%xmm4,%xmm4
    6ebd:	c5 e1 59 dd          	vmulpd %xmm5,%xmm3,%xmm3
    6ec1:	c5 cb 5c f0          	vsubsd %xmm0,%xmm6,%xmm6
    6ec5:	c5 db 59 e1          	vmulsd %xmm1,%xmm4,%xmm4
    6ec9:	c5 f9 70 d0 ee       	vpshufd $0xee,%xmm0,%xmm2
    6ece:	c5 f3 58 ce          	vaddsd %xmm6,%xmm1,%xmm1
    6ed2:	c5 d3 59 ed          	vmulsd %xmm5,%xmm5,%xmm5
    6ed6:	c5 c3 58 fa          	vaddsd %xmm2,%xmm7,%xmm7
    6eda:	c5 d9 58 e3          	vaddpd %xmm3,%xmm4,%xmm4
    6ede:	c5 f3 58 cf          	vaddsd %xmm7,%xmm1,%xmm1
    6ee2:	c5 d9 59 e5          	vmulpd %xmm5,%xmm4,%xmm4
    6ee6:	c5 f3 58 cc          	vaddsd %xmm4,%xmm1,%xmm1
    6eea:	c5 f9 70 ec ee       	vpshufd $0xee,%xmm4,%xmm5
    6eef:	c5 f3 58 cd          	vaddsd %xmm5,%xmm1,%xmm1
    6ef3:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
    6ef7:	e9 10 01 00 00       	jmpq   700c <Stub<AMD64MathStub.log>+0x26c>
    6efc:	c5 fa 7e 04 24       	vmovq  (%rsp),%xmm0
    6f01:	c5 fa 7e 0c 24       	vmovq  (%rsp),%xmm1
    6f06:	83 c0 10             	add    $0x10,%eax
    6f09:	81 f8 00 80 00 00    	cmp    $0x8000,%eax
    6f0f:	0f 83 84 00 00 00    	jae    6f99 <Stub<AMD64MathStub.log>+0x1f9>
    6f15:	83 f8 10             	cmp    $0x10,%eax
    6f18:	0f 82 15 00 00 00    	jb     6f33 <Stub<AMD64MathStub.log>+0x193>
    6f1e:	c5 fb 58 c0          	vaddsd %xmm0,%xmm0,%xmm0
    6f22:	e9 e5 00 00 00       	jmpq   700c <Stub<AMD64MathStub.log>+0x26c>
    6f27:	77 f5                	ja     6f1e <Stub<AMD64MathStub.log>+0x17e>
    6f29:	83 fa 00             	cmp    $0x0,%edx
    6f2c:	77 f0                	ja     6f1e <Stub<AMD64MathStub.log>+0x17e>
    6f2e:	e9 8c 00 00 00       	jmpq   6fbf <Stub<AMD64MathStub.log>+0x21f>
    6f33:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
    6f37:	c5 f3 58 c8          	vaddsd %xmm0,%xmm1,%xmm1
    6f3b:	c5 f9 7e ca          	vmovd  %xmm1,%edx
    6f3f:	c5 f1 73 d1 20       	vpsrlq $0x20,%xmm1,%xmm1
    6f44:	c5 f9 7e c9          	vmovd  %xmm1,%ecx
    6f48:	0b d1                	or     %ecx,%edx
    6f4a:	83 fa 00             	cmp    $0x0,%edx
    6f4d:	0f 84 8f 00 00 00    	je     6fe2 <Stub<AMD64MathStub.log>+0x242>
    6f53:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
    6f57:	b8 f0 47 00 00       	mov    $0x47f0,%eax
    6f5c:	c5 f1 c4 c8 03       	vpinsrw $0x3,%eax,%xmm1,%xmm1
    6f61:	c5 fb 59 c1          	vmulsd %xmm1,%xmm0,%xmm0
    6f65:	c5 fa 6f c8          	vmovdqu %xmm0,%xmm1
    6f69:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    6f6e:	c5 f9 eb c2          	vpor   %xmm2,%xmm0,%xmm0
    6f72:	c5 f9 73 d0 1b       	vpsrlq $0x1b,%xmm0,%xmm0
    6f77:	b9 f0 47 00 00       	mov    $0x47f0,%ecx
    6f7c:	c5 f9 72 d0 02       	vpsrld $0x2,%xmm0,%xmm0
    6f81:	c5 f8 53 c0          	vrcpps %xmm0,%xmm0
    6f85:	c5 f1 73 f1 0c       	vpsllq $0xc,%xmm1,%xmm1
    6f8a:	c5 f9 70 f5 e4       	vpshufd $0xe4,%xmm5,%xmm6
    6f8f:	c5 f1 73 d1 0c       	vpsrlq $0xc,%xmm1,%xmm1
    6f94:	e9 8b fe ff ff       	jmpq   6e24 <Stub<AMD64MathStub.log>+0x84>
    6f99:	c5 f9 7e ca          	vmovd  %xmm1,%edx
    6f9d:	c5 f1 73 d1 20       	vpsrlq $0x20,%xmm1,%xmm1
    6fa2:	c5 f9 7e c9          	vmovd  %xmm1,%ecx
    6fa6:	03 c9                	add    %ecx,%ecx
    6fa8:	81 f9 00 00 e0 ff    	cmp    $0xffe00000,%ecx
    6fae:	0f 83 73 ff ff ff    	jae    6f27 <Stub<AMD64MathStub.log>+0x187>
    6fb4:	0b d1                	or     %ecx,%edx
    6fb6:	83 fa 00             	cmp    $0x0,%edx
    6fb9:	0f 84 23 00 00 00    	je     6fe2 <Stub<AMD64MathStub.log>+0x242>
    6fbf:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
    6fc3:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    6fc7:	b8 f0 7f 00 00       	mov    $0x7ff0,%eax
    6fcc:	c5 f1 c4 c8 03       	vpinsrw $0x3,%eax,%xmm1,%xmm1
    6fd1:	c5 fb 59 c1          	vmulsd %xmm1,%xmm0,%xmm0
    6fd5:	c7 44 24 10 03 00 00 	movl   $0x3,0x10(%rsp)
    6fdc:	00 
    6fdd:	e9 1e 00 00 00       	jmpq   7000 <Stub<AMD64MathStub.log>+0x260>
    6fe2:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
    6fe6:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    6fea:	b8 f0 bf 00 00       	mov    $0xbff0,%eax
    6fef:	c5 f9 c4 c0 03       	vpinsrw $0x3,%eax,%xmm0,%xmm0
    6ff4:	c5 fb 5e c1          	vdivsd %xmm1,%xmm0,%xmm0
    6ff8:	c7 44 24 10 02 00 00 	movl   $0x2,0x10(%rsp)
    6fff:	00 
    7000:	c5 f9 d6 44 24 08    	vmovq  %xmm0,0x8(%rsp)
    7006:	c5 fa 7e 44 24 08    	vmovq  0x8(%rsp),%xmm0
    700c:	48 83 c4 18          	add    $0x18,%rsp
    7010:	c3                   	retq   
	...
    707d:	00 00                	add    %al,(%rax)
    707f:	00 1a                	add    %bl,(%rdx)
	...

00000000000070a0 <Stub<AMD64MathStub.log10>>:
    70a0:	48 83 ec 18          	sub    $0x18,%rsp
    70a4:	c5 fb 11 04 24       	vmovsd %xmm0,(%rsp)
    70a9:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
    70ad:	b8 f0 3f 00 00       	mov    $0x3ff0,%eax
    70b2:	c5 e9 c4 d0 03       	vpinsrw $0x3,%eax,%xmm2,%xmm2
    70b7:	b9 00 00 de 3e       	mov    $0x3ede0000,%ecx
    70bc:	c5 f9 6e f9          	vmovd  %ecx,%xmm7
    70c0:	c5 e1 57 db          	vxorpd %xmm3,%xmm3,%xmm3
    70c4:	ba f0 77 00 00       	mov    $0x77f0,%edx
    70c9:	c5 e1 c4 da 03       	vpinsrw $0x3,%edx,%xmm3,%xmm3
    70ce:	c5 fa 6f c8          	vmovdqu %xmm0,%xmm1
    70d2:	ba 00 80 00 00       	mov    $0x8000,%edx
    70d7:	c5 f9 6e e2          	vmovd  %edx,%xmm4
    70db:	c4 c1 7a 6f 2d dc bd 	vmovdqu 0xbddc(%rip),%xmm5        # 12ec0 <data.M26.32>
    70e2:	00 00 
    70e4:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    70e9:	c5 f9 eb c2          	vpor   %xmm2,%xmm0,%xmm0
    70ed:	b9 e0 3f 00 00       	mov    $0x3fe0,%ecx
    70f2:	c5 f9 73 d0 1b       	vpsrlq $0x1b,%xmm0,%xmm0
    70f7:	c4 c1 7a 6f 15 d0 bd 	vmovdqu 0xbdd0(%rip),%xmm2        # 12ed0 <data.M26.0>
    70fe:	00 00 
    7100:	c5 f9 72 d0 02       	vpsrld $0x2,%xmm0,%xmm0
    7105:	c5 f8 53 c0          	vrcpps %xmm0,%xmm0
    7109:	c5 f1 73 f1 0c       	vpsllq $0xc,%xmm1,%xmm1
    710e:	c5 f9 70 f5 4e       	vpshufd $0x4e,%xmm5,%xmm6
    7113:	c5 f1 73 d1 0c       	vpsrlq $0xc,%xmm1,%xmm1
    7118:	83 e8 10             	sub    $0x10,%eax
    711b:	81 f8 e0 7f 00 00    	cmp    $0x7fe0,%eax
    7121:	0f 83 fa 00 00 00    	jae    7221 <Stub<AMD64MathStub.log10>+0x181>
    7127:	c5 fa 59 c7          	vmulss %xmm7,%xmm0,%xmm0
    712b:	c5 f1 eb cb          	vpor   %xmm3,%xmm1,%xmm1
    712f:	4c 8d 1d aa bd 00 00 	lea    0xbdaa(%rip),%r11        # 12ee0 <data.M26.48>
    7136:	c5 d1 54 e9          	vandpd %xmm1,%xmm5,%xmm5
    713a:	c5 f9 fe c4          	vpaddd %xmm4,%xmm0,%xmm0
    713e:	c5 f3 5c cd          	vsubsd %xmm5,%xmm1,%xmm1
    7142:	c5 f9 7e c2          	vmovd  %xmm0,%edx
    7146:	c5 f9 73 f0 1d       	vpsllq $0x1d,%xmm0,%xmm0
    714b:	c5 f9 54 c6          	vandpd %xmm6,%xmm0,%xmm0
    714f:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    7155:	2b c1                	sub    %ecx,%eax
    7157:	c5 c3 2a f8          	vcvtsi2sd %eax,%xmm7,%xmm7
    715b:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    715f:	c5 f3 59 c8          	vmulsd %xmm0,%xmm1,%xmm1
    7163:	c4 c1 7a 7e 35 84 c5 	vmovq  0xc584(%rip),%xmm6        # 136f0 <data.M26.8>
    716a:	00 00 
    716c:	c4 c1 7a 6f 1d 8b c5 	vmovdqu 0xc58b(%rip),%xmm3        # 13700 <data.M26.2112>
    7173:	00 00 
    7175:	c5 d3 5c ea          	vsubsd %xmm2,%xmm5,%xmm5
    7179:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    717f:	c1 ea 0c             	shr    $0xc,%edx
    7182:	c4 c1 7a 6f 84 13 20 	vmovdqu -0x5e0(%r11,%rdx,1),%xmm0
    7189:	fa ff ff 
    718c:	c4 c1 7a 6f 25 7b c5 	vmovdqu 0xc57b(%rip),%xmm4        # 13710 <data.M26.2128>
    7193:	00 00 
    7195:	c5 f3 58 cd          	vaddsd %xmm5,%xmm1,%xmm1
    7199:	c4 c1 7a 6f 15 7e c5 	vmovdqu 0xc57e(%rip),%xmm2        # 13720 <data.M26.2144>
    71a0:	00 00 
    71a2:	c5 cb 59 f7          	vmulsd %xmm7,%xmm6,%xmm6
    71a6:	c5 f9 70 e9 44       	vpshufd $0x44,%xmm1,%xmm5
    71ab:	c4 c1 43 59 3d 7c c5 	vmulsd 0xc57c(%rip),%xmm7,%xmm7        # 13730 <data.M26.16>
    71b2:	00 00 
    71b4:	c5 e3 59 d9          	vmulsd %xmm1,%xmm3,%xmm3
    71b8:	c5 fb 58 c6          	vaddsd %xmm6,%xmm0,%xmm0
    71bc:	c5 d9 59 e5          	vmulpd %xmm5,%xmm4,%xmm4
    71c0:	c4 c1 7a 7e 35 6f c5 	vmovq  0xc56f(%rip),%xmm6        # 13738 <data.M26.24>
    71c7:	00 00 
    71c9:	c5 d1 59 ed          	vmulpd %xmm5,%xmm5,%xmm5
    71cd:	c5 d9 58 e2          	vaddpd %xmm2,%xmm4,%xmm4
    71d1:	c5 e1 59 dd          	vmulpd %xmm5,%xmm3,%xmm3
    71d5:	c5 f9 70 d0 e4       	vpshufd $0xe4,%xmm0,%xmm2
    71da:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
    71de:	c5 db 59 e1          	vmulsd %xmm1,%xmm4,%xmm4
    71e2:	c5 eb 5c d0          	vsubsd %xmm0,%xmm2,%xmm2
    71e6:	c5 cb 59 f1          	vmulsd %xmm1,%xmm6,%xmm6
    71ea:	c5 f3 58 ca          	vaddsd %xmm2,%xmm1,%xmm1
    71ee:	c5 f9 70 d0 ee       	vpshufd $0xee,%xmm0,%xmm2
    71f3:	c5 d3 59 ed          	vmulsd %xmm5,%xmm5,%xmm5
    71f7:	c5 c3 58 fa          	vaddsd %xmm2,%xmm7,%xmm7
    71fb:	c5 f3 58 ce          	vaddsd %xmm6,%xmm1,%xmm1
    71ff:	c5 d9 58 e3          	vaddpd %xmm3,%xmm4,%xmm4
    7203:	c5 f3 58 cf          	vaddsd %xmm7,%xmm1,%xmm1
    7207:	c5 d9 59 e5          	vmulpd %xmm5,%xmm4,%xmm4
    720b:	c5 f3 58 cc          	vaddsd %xmm4,%xmm1,%xmm1
    720f:	c5 f9 70 ec ee       	vpshufd $0xee,%xmm4,%xmm5
    7214:	c5 f3 58 cd          	vaddsd %xmm5,%xmm1,%xmm1
    7218:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
    721c:	e9 27 01 00 00       	jmpq   7348 <Stub<AMD64MathStub.log10>+0x2a8>
    7221:	c5 fa 7e 04 24       	vmovq  (%rsp),%xmm0
    7226:	c5 fa 7e 0c 24       	vmovq  (%rsp),%xmm1
    722b:	83 c0 10             	add    $0x10,%eax
    722e:	81 f8 00 80 00 00    	cmp    $0x8000,%eax
    7234:	0f 83 9b 00 00 00    	jae    72d5 <Stub<AMD64MathStub.log10>+0x235>
    723a:	83 f8 10             	cmp    $0x10,%eax
    723d:	0f 82 15 00 00 00    	jb     7258 <Stub<AMD64MathStub.log10>+0x1b8>
    7243:	c5 fb 58 c0          	vaddsd %xmm0,%xmm0,%xmm0
    7247:	e9 fc 00 00 00       	jmpq   7348 <Stub<AMD64MathStub.log10>+0x2a8>
    724c:	77 f5                	ja     7243 <Stub<AMD64MathStub.log10>+0x1a3>
    724e:	83 fa 00             	cmp    $0x0,%edx
    7251:	77 f0                	ja     7243 <Stub<AMD64MathStub.log10>+0x1a3>
    7253:	e9 a3 00 00 00       	jmpq   72fb <Stub<AMD64MathStub.log10>+0x25b>
    7258:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
    725c:	c5 f3 58 c8          	vaddsd %xmm0,%xmm1,%xmm1
    7260:	c5 f9 7e ca          	vmovd  %xmm1,%edx
    7264:	c5 f1 73 d1 20       	vpsrlq $0x20,%xmm1,%xmm1
    7269:	c5 f9 7e c9          	vmovd  %xmm1,%ecx
    726d:	0b d1                	or     %ecx,%edx
    726f:	83 fa 00             	cmp    $0x0,%edx
    7272:	0f 84 a6 00 00 00    	je     731e <Stub<AMD64MathStub.log10>+0x27e>
    7278:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
    727c:	b8 f0 47 00 00       	mov    $0x47f0,%eax
    7281:	c5 f1 c4 c8 03       	vpinsrw $0x3,%eax,%xmm1,%xmm1
    7286:	c5 fb 59 c1          	vmulsd %xmm1,%xmm0,%xmm0
    728a:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
    728e:	b8 f0 3f 00 00       	mov    $0x3ff0,%eax
    7293:	c5 e9 c4 d0 03       	vpinsrw $0x3,%eax,%xmm2,%xmm2
    7298:	c5 fa 6f c8          	vmovdqu %xmm0,%xmm1
    729c:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    72a1:	c5 f9 eb c2          	vpor   %xmm2,%xmm0,%xmm0
    72a5:	b9 f0 47 00 00       	mov    $0x47f0,%ecx
    72aa:	c5 f9 73 d0 1b       	vpsrlq $0x1b,%xmm0,%xmm0
    72af:	c4 c1 7a 6f 15 18 bc 	vmovdqu 0xbc18(%rip),%xmm2        # 12ed0 <data.M26.0>
    72b6:	00 00 
    72b8:	c5 f9 72 d0 02       	vpsrld $0x2,%xmm0,%xmm0
    72bd:	c5 f8 53 c0          	vrcpps %xmm0,%xmm0
    72c1:	c5 f1 73 f1 0c       	vpsllq $0xc,%xmm1,%xmm1
    72c6:	c5 f9 70 f5 4e       	vpshufd $0x4e,%xmm5,%xmm6
    72cb:	c5 f1 73 d1 0c       	vpsrlq $0xc,%xmm1,%xmm1
    72d0:	e9 52 fe ff ff       	jmpq   7127 <Stub<AMD64MathStub.log10>+0x87>
    72d5:	c5 f9 7e ca          	vmovd  %xmm1,%edx
    72d9:	c5 f1 73 d1 20       	vpsrlq $0x20,%xmm1,%xmm1
    72de:	c5 f9 7e c9          	vmovd  %xmm1,%ecx
    72e2:	03 c9                	add    %ecx,%ecx
    72e4:	81 f9 00 00 e0 ff    	cmp    $0xffe00000,%ecx
    72ea:	0f 83 5c ff ff ff    	jae    724c <Stub<AMD64MathStub.log10>+0x1ac>
    72f0:	0b d1                	or     %ecx,%edx
    72f2:	83 fa 00             	cmp    $0x0,%edx
    72f5:	0f 84 23 00 00 00    	je     731e <Stub<AMD64MathStub.log10>+0x27e>
    72fb:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
    72ff:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    7303:	b8 f0 7f 00 00       	mov    $0x7ff0,%eax
    7308:	c5 f1 c4 c8 03       	vpinsrw $0x3,%eax,%xmm1,%xmm1
    730d:	c5 fb 59 c1          	vmulsd %xmm1,%xmm0,%xmm0
    7311:	c7 44 24 10 09 00 00 	movl   $0x9,0x10(%rsp)
    7318:	00 
    7319:	e9 1e 00 00 00       	jmpq   733c <Stub<AMD64MathStub.log10>+0x29c>
    731e:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
    7322:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    7326:	b8 f0 bf 00 00       	mov    $0xbff0,%eax
    732b:	c5 f9 c4 c0 03       	vpinsrw $0x3,%eax,%xmm0,%xmm0
    7330:	c5 fb 5e c1          	vdivsd %xmm1,%xmm0,%xmm0
    7334:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%rsp)
    733b:	00 
    733c:	c5 f9 d6 44 24 08    	vmovq  %xmm0,0x8(%rsp)
    7342:	c5 fa 7e 44 24 08    	vmovq  0x8(%rsp),%xmm0
    7348:	48 83 c4 18          	add    $0x18,%rsp
    734c:	c3                   	retq   
	...
    737d:	00 00                	add    %al,(%rax)
    737f:	00 1b                	add    %bl,(%rbx)
	...

00000000000073a0 <Stub<AMD64MathStub.pow>>:
    73a0:	48 83 ec 28          	sub    $0x28,%rsp
    73a4:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
    73aa:	c5 fb 11 4c 24 10    	vmovsd %xmm1,0x10(%rsp)
    73b0:	c4 c1 f9 7e c8       	vmovq  %xmm1,%r8
    73b5:	4d 3b 05 84 c3 00 00 	cmp    0xc384(%rip),%r8        # 13740 <data.M27.0>
    73bc:	75 09                	jne    73c7 <Stub<AMD64MathStub.pow>+0x27>
    73be:	c5 fb 59 c0          	vmulsd %xmm0,%xmm0,%xmm0
    73c2:	e9 e1 10 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    73c7:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    73cc:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
    73d0:	49 b9 00 00 00 00 00 	movabs $0x3ff0000000000000,%r9
    73d7:	00 f0 3f 
    73da:	c4 c1 f9 6e d1       	vmovq  %r9,%xmm2
    73df:	41 b8 00 00 b9 3f    	mov    $0x3fb90000,%r8d
    73e5:	c4 c1 f9 6e f8       	vmovq  %r8,%xmm7
    73ea:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
    73ee:	49 ba 00 00 00 00 00 	movabs $0x77f0000000000000,%r10
    73f5:	00 f0 77 
    73f8:	c4 c1 f9 6e ca       	vmovq  %r10,%xmm1
    73fd:	c5 fa 6f d8          	vmovdqu %xmm0,%xmm3
    7401:	ba f0 7f 00 00       	mov    $0x7ff0,%edx
    7406:	23 d0                	and    %eax,%edx
    7408:	81 ea f0 3f 00 00    	sub    $0x3ff0,%edx
    740e:	8b ca                	mov    %edx,%ecx
    7410:	c1 fa 1f             	sar    $0x1f,%edx
    7413:	03 ca                	add    %edx,%ecx
    7415:	33 ca                	xor    %edx,%ecx
    7417:	c5 f9 eb c2          	vpor   %xmm2,%xmm0,%xmm0
    741b:	c4 c1 7a 6f 35 2c c3 	vmovdqu 0xc32c(%rip),%xmm6        # 13750 <data.M27.80>
    7422:	00 00 
    7424:	c5 f9 73 d0 1b       	vpsrlq $0x1b,%xmm0,%xmm0
    7429:	c4 c1 7a 7e 15 2e c3 	vmovq  0xc32e(%rip),%xmm2        # 13760 <data.M27.96>
    7430:	00 00 
    7432:	c5 f9 72 d0 02       	vpsrld $0x2,%xmm0,%xmm0
    7437:	83 c1 10             	add    $0x10,%ecx
    743a:	0f bd c9             	bsr    %ecx,%ecx
    743d:	c5 f8 53 c0          	vrcpps %xmm0,%xmm0
    7441:	c5 e1 73 f3 0c       	vpsllq $0xc,%xmm3,%xmm3
    7446:	41 bb 00 20 00 00    	mov    $0x2000,%r11d
    744c:	c4 c1 f9 6e e3       	vmovq  %r11,%xmm4
    7451:	c5 e1 73 d3 0c       	vpsrlq $0xc,%xmm3,%xmm3
    7456:	83 e8 10             	sub    $0x10,%eax
    7459:	81 f8 e0 7f 00 00    	cmp    $0x7fe0,%eax
    745f:	0f 83 12 02 00 00    	jae    7677 <Stub<AMD64MathStub.pow>+0x2d7>
    7465:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    746b:	c5 fa 59 c7          	vmulss %xmm7,%xmm0,%xmm0
    746f:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    7474:	83 e9 04             	sub    $0x4,%ecx
    7477:	d3 e2                	shl    %cl,%edx
    7479:	48 c1 e2 20          	shl    $0x20,%rdx
    747d:	c4 e1 f9 6e ea       	vmovq  %rdx,%xmm5
    7482:	c5 e1 eb d9          	vpor   %xmm1,%xmm3,%xmm3
    7486:	81 e8 df 3f 00 00    	sub    $0x3fdf,%eax
    748c:	83 f8 01             	cmp    $0x1,%eax
    748f:	0f 86 21 0c 00 00    	jbe    80b6 <Stub<AMD64MathStub.pow>+0xd16>
    7495:	c5 f9 fe c4          	vpaddd %xmm4,%xmm0,%xmm0
    7499:	c5 d1 db eb          	vpand  %xmm3,%xmm5,%xmm5
    749d:	c5 f9 7e c2          	vmovd  %xmm0,%edx
    74a1:	c5 f9 73 f0 1d       	vpsllq $0x1d,%xmm0,%xmm0
    74a6:	c5 e3 5c dd          	vsubsd %xmm5,%xmm3,%xmm3
    74aa:	c5 f9 db c6          	vpand  %xmm6,%xmm0,%xmm0
    74ae:	83 e8 01             	sub    $0x1,%eax
    74b1:	c1 f8 04             	sar    $0x4,%eax
    74b4:	c5 c3 2a f8          	vcvtsi2sd %eax,%xmm7,%xmm7
    74b8:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    74bc:	c5 e3 59 d8          	vmulsd %xmm0,%xmm3,%xmm3
    74c0:	c4 c1 7a 6f 0d a7 c2 	vmovdqu 0xc2a7(%rip),%xmm1        # 13770 <data.M27.112>
    74c7:	00 00 
    74c9:	4c 8d 1d b0 c2 00 00 	lea    0xc2b0(%rip),%r11        # 13780 <data.M27.128>
    74d0:	c5 d3 5c ea          	vsubsd %xmm2,%xmm5,%xmm5
    74d4:	c4 c1 7a 6f 25 b3 e2 	vmovdqu 0xe2b3(%rip),%xmm4        # 15790 <data.M27.8336>
    74db:	00 00 
    74dd:	8b c8                	mov    %eax,%ecx
    74df:	c1 f8 1f             	sar    $0x1f,%eax
    74e2:	03 c8                	add    %eax,%ecx
    74e4:	33 c1                	xor    %ecx,%eax
    74e6:	83 c0 01             	add    $0x1,%eax
    74e9:	0f bd c0             	bsr    %eax,%eax
    74ec:	c5 d1 14 eb          	vunpcklpd %xmm3,%xmm5,%xmm5
    74f0:	c4 c1 7a 6f 35 a7 e2 	vmovdqu 0xe2a7(%rip),%xmm6        # 157a0 <data.M27.8352>
    74f7:	00 00 
    74f9:	c5 e3 58 dd          	vaddsd %xmm5,%xmm3,%xmm3
    74fd:	81 e2 00 c0 ff 00    	and    $0xffc000,%edx
    7503:	c1 ea 0a             	shr    $0xa,%edx
    7506:	c4 c1 51 58 ac 13 c0 	vaddpd -0xe40(%r11,%rdx,1),%xmm5,%xmm5
    750d:	f1 ff ff 
    7510:	c4 c1 7a 6f 05 97 e2 	vmovdqu 0xe297(%rip),%xmm0        # 157b0 <data.M27.8368>
    7517:	00 00 
    7519:	c5 f9 70 d3 44       	vpshufd $0x44,%xmm3,%xmm2
    751e:	c5 e3 59 db          	vmulsd %xmm3,%xmm3,%xmm3
    7522:	c5 f1 59 ca          	vmulpd %xmm2,%xmm1,%xmm1
    7526:	c5 d9 59 e2          	vmulpd %xmm2,%xmm4,%xmm4
    752a:	c5 d3 58 ef          	vaddsd %xmm7,%xmm5,%xmm5
    752e:	c5 eb 59 d3          	vmulsd %xmm3,%xmm2,%xmm2
    7532:	c5 c9 58 f1          	vaddpd %xmm1,%xmm6,%xmm6
    7536:	c5 e3 59 db          	vmulsd %xmm3,%xmm3,%xmm3
    753a:	c5 f9 58 c4          	vaddpd %xmm4,%xmm0,%xmm0
    753e:	c5 fa 7e 4c 24 10    	vmovq  0x10(%rsp),%xmm1
    7544:	66 8b 4c 24 16       	mov    0x16(%rsp),%cx
    7549:	c5 f9 70 fd ee       	vpshufd $0xee,%xmm5,%xmm7
    754e:	c4 c1 7a 7e 25 69 e2 	vmovq  0xe269(%rip),%xmm4        # 157c0 <data.M27.8>
    7555:	00 00 
    7557:	c5 c9 59 f2          	vmulpd %xmm2,%xmm6,%xmm6
    755b:	c5 f9 70 db 44       	vpshufd $0x44,%xmm3,%xmm3
    7560:	c5 f9 59 c2          	vmulpd %xmm2,%xmm0,%xmm0
    7564:	c1 e0 04             	shl    $0x4,%eax
    7567:	81 e8 00 3e 00 00    	sub    $0x3e00,%eax
    756d:	81 e1 f0 7f 00 00    	and    $0x7ff0,%ecx
    7573:	03 c1                	add    %ecx,%eax
    7575:	c5 e1 59 de          	vmulpd %xmm6,%xmm3,%xmm3
    7579:	81 f8 70 02 00 00    	cmp    $0x270,%eax
    757f:	0f 83 b5 02 00 00    	jae    783a <Stub<AMD64MathStub.pow>+0x49a>
    7585:	c5 c9 57 f6          	vxorpd %xmm6,%xmm6,%xmm6
    7589:	ba b8 42 00 00       	mov    $0x42b8,%edx
    758e:	c5 c9 c4 f2 03       	vpinsrw $0x3,%edx,%xmm6,%xmm6
    7593:	c5 fa 6f d1          	vmovdqu %xmm1,%xmm2
    7597:	c5 d9 db e1          	vpand  %xmm1,%xmm4,%xmm4
    759b:	c5 f3 5c cc          	vsubsd %xmm4,%xmm1,%xmm1
    759f:	c5 db 59 e5          	vmulsd %xmm5,%xmm4,%xmm4
    75a3:	c5 fb 58 c7          	vaddsd %xmm7,%xmm0,%xmm0
    75a7:	c5 f3 59 cd          	vmulsd %xmm5,%xmm1,%xmm1
    75ab:	c5 fa 6f fe          	vmovdqu %xmm6,%xmm7
    75af:	c5 cb 58 f4          	vaddsd %xmm4,%xmm6,%xmm6
    75b3:	4c 8d 1d 16 e2 00 00 	lea    0xe216(%rip),%r11        # 157d0 <data.M27.8384>
    75ba:	c5 e1 58 d8          	vaddpd %xmm0,%xmm3,%xmm3
    75be:	c5 f9 7e f2          	vmovd  %xmm6,%edx
    75c2:	c5 cb 5c f7          	vsubsd %xmm7,%xmm6,%xmm6
    75c6:	c5 f9 70 c3 ee       	vpshufd $0xee,%xmm3,%xmm0
    75cb:	c5 db 5c e6          	vsubsd %xmm6,%xmm4,%xmm4
    75cf:	c5 fb 58 c3          	vaddsd %xmm3,%xmm0,%xmm0
    75d3:	8b ca                	mov    %edx,%ecx
    75d5:	81 e2 ff 00 00 00    	and    $0xff,%edx
    75db:	03 d2                	add    %edx,%edx
    75dd:	c4 c1 7a 6f 2c d3    	vmovdqu (%r11,%rdx,8),%xmm5
    75e3:	c5 db 58 e1          	vaddsd %xmm1,%xmm4,%xmm4
    75e7:	c5 eb 59 d0          	vmulsd %xmm0,%xmm2,%xmm2
    75eb:	c4 c1 7a 6f 3d dc f1 	vmovdqu 0xf1dc(%rip),%xmm7        # 167d0 <data.M27.12480>
    75f2:	00 00 
    75f4:	c4 c1 7a 6f 1d e3 f1 	vmovdqu 0xf1e3(%rip),%xmm3        # 167e0 <data.M27.12496>
    75fb:	00 00 
    75fd:	c1 e1 0c             	shl    $0xc,%ecx
    7600:	41 33 c8             	xor    %r8d,%ecx
    7603:	81 e1 00 00 f0 ff    	and    $0xfff00000,%ecx
    7609:	c4 e1 f9 6e f1       	vmovq  %rcx,%xmm6
    760e:	c5 eb 58 d4          	vaddsd %xmm4,%xmm2,%xmm2
    7612:	49 b9 ef 39 fa fe 42 	movabs $0x3fe62e42fefa39ef,%r9
    7619:	2e e6 3f 
    761c:	c4 c1 f9 6e c9       	vmovq  %r9,%xmm1
    7621:	c5 f9 70 c2 44       	vpshufd $0x44,%xmm2,%xmm0
    7626:	c5 f9 70 e2 44       	vpshufd $0x44,%xmm2,%xmm4
    762b:	c5 f3 59 ca          	vmulsd %xmm2,%xmm1,%xmm1
    762f:	c5 f9 70 f6 11       	vpshufd $0x11,%xmm6,%xmm6
    7634:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    7638:	c5 c1 59 fc          	vmulpd %xmm4,%xmm7,%xmm7
    763c:	c5 d1 fe ee          	vpaddd %xmm6,%xmm5,%xmm5
    7640:	c5 f3 59 cd          	vmulsd %xmm5,%xmm1,%xmm1
    7644:	c5 f9 70 f5 ee       	vpshufd $0xee,%xmm5,%xmm6
    7649:	c5 fb 59 c0          	vmulsd %xmm0,%xmm0,%xmm0
    764d:	c5 e1 58 df          	vaddpd %xmm7,%xmm3,%xmm3
    7651:	c5 f3 58 ce          	vaddsd %xmm6,%xmm1,%xmm1
    7655:	c5 f9 59 c3          	vmulpd %xmm3,%xmm0,%xmm0
    7659:	c5 f9 70 d8 ee       	vpshufd $0xee,%xmm0,%xmm3
    765e:	c5 fb 59 c5          	vmulsd %xmm5,%xmm0,%xmm0
    7662:	c5 e3 59 dd          	vmulsd %xmm5,%xmm3,%xmm3
    7666:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
    766a:	c5 fb 58 c3          	vaddsd %xmm3,%xmm0,%xmm0
    766e:	c5 fb 58 c5          	vaddsd %xmm5,%xmm0,%xmm0
    7672:	e9 31 0e 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7677:	83 c0 10             	add    $0x10,%eax
    767a:	ba f0 7f 00 00       	mov    $0x7ff0,%edx
    767f:	23 d0                	and    %eax,%edx
    7681:	81 fa f0 7f 00 00    	cmp    $0x7ff0,%edx
    7687:	0f 84 2b 03 00 00    	je     79b8 <Stub<AMD64MathStub.pow>+0x618>
    768d:	a9 00 80 00 00       	test   $0x8000,%eax
    7692:	0f 85 d1 05 00 00    	jne    7c69 <Stub<AMD64MathStub.pow>+0x8c9>
    7698:	c5 fa 7e 44 24 08    	vmovq  0x8(%rsp),%xmm0
    769e:	c5 fa 7e 5c 24 08    	vmovq  0x8(%rsp),%xmm3
    76a4:	c5 f9 7e da          	vmovd  %xmm3,%edx
    76a8:	c5 e1 73 d3 20       	vpsrlq $0x20,%xmm3,%xmm3
    76ad:	c5 f9 7e d9          	vmovd  %xmm3,%ecx
    76b1:	0b d1                	or     %ecx,%edx
    76b3:	83 fa 00             	cmp    $0x0,%edx
    76b6:	0f 84 ee 07 00 00    	je     7eaa <Stub<AMD64MathStub.pow>+0xb0a>
    76bc:	c5 e1 57 db          	vxorpd %xmm3,%xmm3,%xmm3
    76c0:	b8 f0 47 00 00       	mov    $0x47f0,%eax
    76c5:	c5 e1 c4 d8 03       	vpinsrw $0x3,%eax,%xmm3,%xmm3
    76ca:	c5 fb 59 c3          	vmulsd %xmm3,%xmm0,%xmm0
    76ce:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
    76d2:	b8 f0 3f 00 00       	mov    $0x3ff0,%eax
    76d7:	c5 e9 c4 d0 03       	vpinsrw $0x3,%eax,%xmm2,%xmm2
    76dc:	c5 fa 6f d8          	vmovdqu %xmm0,%xmm3
    76e0:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    76e5:	c5 f9 eb c2          	vpor   %xmm2,%xmm0,%xmm0
    76e9:	b9 f0 47 00 00       	mov    $0x47f0,%ecx
    76ee:	c5 f9 73 d0 1b       	vpsrlq $0x1b,%xmm0,%xmm0
    76f3:	c4 c1 7a 7e 15 64 c0 	vmovq  0xc064(%rip),%xmm2        # 13760 <data.M27.96>
    76fa:	00 00 
    76fc:	c5 f9 72 d0 02       	vpsrld $0x2,%xmm0,%xmm0
    7701:	c5 f8 53 c0          	vrcpps %xmm0,%xmm0
    7705:	c5 e1 73 f3 0c       	vpsllq $0xc,%xmm3,%xmm3
    770a:	c4 c1 7a 6f 35 3d c0 	vmovdqu 0xc03d(%rip),%xmm6        # 13750 <data.M27.80>
    7711:	00 00 
    7713:	c5 e1 73 d3 0c       	vpsrlq $0xc,%xmm3,%xmm3
    7718:	c5 fa 59 c7          	vmulss %xmm7,%xmm0,%xmm0
    771c:	ba 00 fc ff ff       	mov    $0xfffffc00,%edx
    7721:	c5 f9 6e ea          	vmovd  %edx,%xmm5
    7725:	c5 e1 eb d9          	vpor   %xmm1,%xmm3,%xmm3
    7729:	c5 f9 fe c4          	vpaddd %xmm4,%xmm0,%xmm0
    772d:	c5 d1 73 f5 20       	vpsllq $0x20,%xmm5,%xmm5
    7732:	c5 f9 7e c2          	vmovd  %xmm0,%edx
    7736:	c5 f9 73 f0 1d       	vpsllq $0x1d,%xmm0,%xmm0
    773b:	c5 d1 db eb          	vpand  %xmm3,%xmm5,%xmm5
    773f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    7745:	c5 f9 db c6          	vpand  %xmm6,%xmm0,%xmm0
    7749:	c5 e3 5c dd          	vsubsd %xmm5,%xmm3,%xmm3
    774d:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    7753:	81 e8 f0 47 00 00    	sub    $0x47f0,%eax
    7759:	c1 f8 04             	sar    $0x4,%eax
    775c:	c5 c3 2a f8          	vcvtsi2sd %eax,%xmm7,%xmm7
    7760:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    7764:	e9 53 fd ff ff       	jmpq   74bc <Stub<AMD64MathStub.pow>+0x11c>
    7769:	c5 fa 7e 44 24 08    	vmovq  0x8(%rsp),%xmm0
    776f:	c5 fa 7e 5c 24 08    	vmovq  0x8(%rsp),%xmm3
    7775:	c5 f9 7e da          	vmovd  %xmm3,%edx
    7779:	c5 e1 73 d3 20       	vpsrlq $0x20,%xmm3,%xmm3
    777e:	c5 f9 7e d9          	vmovd  %xmm3,%ecx
    7782:	0b d1                	or     %ecx,%edx
    7784:	83 fa 00             	cmp    $0x0,%edx
    7787:	0f 84 1d 07 00 00    	je     7eaa <Stub<AMD64MathStub.pow>+0xb0a>
    778d:	c5 e1 57 db          	vxorpd %xmm3,%xmm3,%xmm3
    7791:	b8 f0 47 00 00       	mov    $0x47f0,%eax
    7796:	c5 e1 c4 d8 03       	vpinsrw $0x3,%eax,%xmm3,%xmm3
    779b:	c5 fb 59 c3          	vmulsd %xmm3,%xmm0,%xmm0
    779f:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
    77a3:	b8 f0 3f 00 00       	mov    $0x3ff0,%eax
    77a8:	c5 e9 c4 d0 03       	vpinsrw $0x3,%eax,%xmm2,%xmm2
    77ad:	c5 fa 6f d8          	vmovdqu %xmm0,%xmm3
    77b1:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    77b6:	c5 f9 eb c2          	vpor   %xmm2,%xmm0,%xmm0
    77ba:	b9 f0 47 00 00       	mov    $0x47f0,%ecx
    77bf:	c5 f9 73 d0 1b       	vpsrlq $0x1b,%xmm0,%xmm0
    77c4:	c4 c1 7a 7e 15 93 bf 	vmovq  0xbf93(%rip),%xmm2        # 13760 <data.M27.96>
    77cb:	00 00 
    77cd:	c5 f9 72 d0 02       	vpsrld $0x2,%xmm0,%xmm0
    77d2:	c5 f8 53 c0          	vrcpps %xmm0,%xmm0
    77d6:	c5 e1 73 f3 0c       	vpsllq $0xc,%xmm3,%xmm3
    77db:	c4 c1 7a 6f 35 6c bf 	vmovdqu 0xbf6c(%rip),%xmm6        # 13750 <data.M27.80>
    77e2:	00 00 
    77e4:	c5 e1 73 d3 0c       	vpsrlq $0xc,%xmm3,%xmm3
    77e9:	c5 fa 59 c7          	vmulss %xmm7,%xmm0,%xmm0
    77ed:	ba 00 fc ff ff       	mov    $0xfffffc00,%edx
    77f2:	c5 f9 6e ea          	vmovd  %edx,%xmm5
    77f6:	c5 e1 eb d9          	vpor   %xmm1,%xmm3,%xmm3
    77fa:	c5 f9 fe c4          	vpaddd %xmm4,%xmm0,%xmm0
    77fe:	c5 d1 73 f5 20       	vpsllq $0x20,%xmm5,%xmm5
    7803:	c5 f9 7e c2          	vmovd  %xmm0,%edx
    7807:	c5 f9 73 f0 1d       	vpsllq $0x1d,%xmm0,%xmm0
    780c:	c5 d1 db eb          	vpand  %xmm3,%xmm5,%xmm5
    7810:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    7816:	c5 f9 db c6          	vpand  %xmm6,%xmm0,%xmm0
    781a:	c5 e3 5c dd          	vsubsd %xmm5,%xmm3,%xmm3
    781e:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    7824:	81 e8 f0 47 00 00    	sub    $0x47f0,%eax
    782a:	c1 f8 04             	sar    $0x4,%eax
    782d:	c5 c3 2a f8          	vcvtsi2sd %eax,%xmm7,%xmm7
    7831:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    7835:	e9 82 fc ff ff       	jmpq   74bc <Stub<AMD64MathStub.pow>+0x11c>
    783a:	83 f8 00             	cmp    $0x0,%eax
    783d:	0f 8c db 05 00 00    	jl     7e1e <Stub<AMD64MathStub.pow>+0xa7e>
    7843:	81 f8 f0 02 00 00    	cmp    $0x2f0,%eax
    7849:	0f 83 63 07 00 00    	jae    7fb2 <Stub<AMD64MathStub.pow>+0xc12>
    784f:	c5 fb 58 c7          	vaddsd %xmm7,%xmm0,%xmm0
    7853:	c4 c1 7a 7e 15 94 ef 	vmovq  0xef94(%rip),%xmm2        # 167f0 <data.M27.16>
    785a:	00 00 
    785c:	c5 e1 58 d8          	vaddpd %xmm0,%xmm3,%xmm3
    7860:	c5 c9 57 f6          	vxorpd %xmm6,%xmm6,%xmm6
    7864:	b8 b8 42 00 00       	mov    $0x42b8,%eax
    7869:	c5 c9 c4 f0 03       	vpinsrw $0x3,%eax,%xmm6,%xmm6
    786e:	c5 f9 70 c3 ee       	vpshufd $0xee,%xmm3,%xmm0
    7873:	c5 fb 58 c3          	vaddsd %xmm3,%xmm0,%xmm0
    7877:	c5 fa 6f dd          	vmovdqu %xmm5,%xmm3
    787b:	c5 d3 58 e8          	vaddsd %xmm0,%xmm5,%xmm5
    787f:	c5 fa 6f e2          	vmovdqu %xmm2,%xmm4
    7883:	c5 e3 5c dd          	vsubsd %xmm5,%xmm3,%xmm3
    7887:	c5 fa 6f fd          	vmovdqu %xmm5,%xmm7
    788b:	c5 d1 db ea          	vpand  %xmm2,%xmm5,%xmm5
    788f:	c5 fa 6f d1          	vmovdqu %xmm1,%xmm2
    7893:	c5 d9 db e1          	vpand  %xmm1,%xmm4,%xmm4
    7897:	c5 c3 5c fd          	vsubsd %xmm5,%xmm7,%xmm7
    789b:	c5 fb 58 c3          	vaddsd %xmm3,%xmm0,%xmm0
    789f:	c5 f3 5c cc          	vsubsd %xmm4,%xmm1,%xmm1
    78a3:	c5 db 59 e5          	vmulsd %xmm5,%xmm4,%xmm4
    78a7:	c5 fb 58 c7          	vaddsd %xmm7,%xmm0,%xmm0
    78ab:	c5 eb 59 d0          	vmulsd %xmm0,%xmm2,%xmm2
    78af:	c5 fa 6f fe          	vmovdqu %xmm6,%xmm7
    78b3:	c5 f3 59 cd          	vmulsd %xmm5,%xmm1,%xmm1
    78b7:	c5 cb 58 f4          	vaddsd %xmm4,%xmm6,%xmm6
    78bb:	c5 f9 7e f0          	vmovd  %xmm6,%eax
    78bf:	c5 cb 5c f7          	vsubsd %xmm7,%xmm6,%xmm6
    78c3:	4c 8d 1d 06 df 00 00 	lea    0xdf06(%rip),%r11        # 157d0 <data.M27.8384>
    78ca:	c5 eb 58 d1          	vaddsd %xmm1,%xmm2,%xmm2
    78ce:	c4 c1 7a 6f 3d f9 ee 	vmovdqu 0xeef9(%rip),%xmm7        # 167d0 <data.M27.12480>
    78d5:	00 00 
    78d7:	c4 c1 7a 6f 1d 00 ef 	vmovdqu 0xef00(%rip),%xmm3        # 167e0 <data.M27.12496>
    78de:	00 00 
    78e0:	c5 db 5c e6          	vsubsd %xmm6,%xmm4,%xmm4
    78e4:	c5 f9 c5 d6 03       	vpextrw $0x3,%xmm6,%edx
    78e9:	8b c8                	mov    %eax,%ecx
    78eb:	81 e0 ff 00 00 00    	and    $0xff,%eax
    78f1:	03 c0                	add    %eax,%eax
    78f3:	c4 c1 7a 6f 2c c3    	vmovdqu (%r11,%rax,8),%xmm5
    78f9:	c5 eb 58 d4          	vaddsd %xmm4,%xmm2,%xmm2
    78fd:	c1 f9 08             	sar    $0x8,%ecx
    7900:	8b c1                	mov    %ecx,%eax
    7902:	d1 f9                	sar    %ecx
    7904:	2b c1                	sub    %ecx,%eax
    7906:	c1 e1 14             	shl    $0x14,%ecx
    7909:	41 33 c8             	xor    %r8d,%ecx
    790c:	c5 f9 6e f1          	vmovd  %ecx,%xmm6
    7910:	c4 c1 7a 7e 0d e7 ee 	vmovq  0xeee7(%rip),%xmm1        # 16800 <data.M27.12512>
    7917:	00 00 
    7919:	81 e2 ff 7f 00 00    	and    $0x7fff,%edx
    791f:	81 fa 91 40 00 00    	cmp    $0x4091,%edx
    7925:	0f 87 87 06 00 00    	ja     7fb2 <Stub<AMD64MathStub.pow>+0xc12>
    792b:	c5 f9 70 c2 44       	vpshufd $0x44,%xmm2,%xmm0
    7930:	c5 f9 70 e2 44       	vpshufd $0x44,%xmm2,%xmm4
    7935:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    7939:	c5 c1 59 fc          	vmulpd %xmm4,%xmm7,%xmm7
    793d:	c5 f9 70 f6 11       	vpshufd $0x11,%xmm6,%xmm6
    7942:	c5 f3 59 ca          	vmulsd %xmm2,%xmm1,%xmm1
    7946:	c5 fb 59 c0          	vmulsd %xmm0,%xmm0,%xmm0
    794a:	c5 d1 fe ee          	vpaddd %xmm6,%xmm5,%xmm5
    794e:	c5 e1 58 df          	vaddpd %xmm7,%xmm3,%xmm3
    7952:	c5 f3 59 cd          	vmulsd %xmm5,%xmm1,%xmm1
    7956:	c5 f9 70 f5 ee       	vpshufd $0xee,%xmm5,%xmm6
    795b:	c5 f9 59 c3          	vmulpd %xmm3,%xmm0,%xmm0
    795f:	c5 f3 58 ce          	vaddsd %xmm6,%xmm1,%xmm1
    7963:	c5 f9 70 d8 ee       	vpshufd $0xee,%xmm0,%xmm3
    7968:	c5 fb 59 c5          	vmulsd %xmm5,%xmm0,%xmm0
    796c:	c5 e3 59 dd          	vmulsd %xmm5,%xmm3,%xmm3
    7970:	c1 e0 04             	shl    $0x4,%eax
    7973:	c5 d9 57 e4          	vxorpd %xmm4,%xmm4,%xmm4
    7977:	81 c0 f0 3f 00 00    	add    $0x3ff0,%eax
    797d:	c5 d9 c4 e0 03       	vpinsrw $0x3,%eax,%xmm4,%xmm4
    7982:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
    7986:	c5 fb 58 c3          	vaddsd %xmm3,%xmm0,%xmm0
    798a:	c5 fa 6f c8          	vmovdqu %xmm0,%xmm1
    798e:	c5 fb 58 c5          	vaddsd %xmm5,%xmm0,%xmm0
    7992:	c5 fb 59 c4          	vmulsd %xmm4,%xmm0,%xmm0
    7996:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    799b:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    79a1:	0f 84 ae 06 00 00    	je     8055 <Stub<AMD64MathStub.pow>+0xcb5>
    79a7:	81 f8 f0 7f 00 00    	cmp    $0x7ff0,%eax
    79ad:	0f 84 5c 06 00 00    	je     800f <Stub<AMD64MathStub.pow>+0xc6f>
    79b3:	e9 f0 0a 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    79b8:	c5 fa 7e 4c 24 10    	vmovq  0x10(%rsp),%xmm1
    79be:	c5 fa 7e 44 24 08    	vmovq  0x8(%rsp),%xmm0
    79c4:	c5 fa 6f d0          	vmovdqu %xmm0,%xmm2
    79c8:	c5 f9 7e d0          	vmovd  %xmm2,%eax
    79cc:	c5 e9 73 d2 14       	vpsrlq $0x14,%xmm2,%xmm2
    79d1:	c5 f9 7e d2          	vmovd  %xmm2,%edx
    79d5:	0b c2                	or     %edx,%eax
    79d7:	0f 84 4b 00 00 00    	je     7a28 <Stub<AMD64MathStub.pow>+0x688>
    79dd:	c5 f9 7e c8          	vmovd  %xmm1,%eax
    79e1:	c5 f1 73 d1 20       	vpsrlq $0x20,%xmm1,%xmm1
    79e6:	c5 f9 7e ca          	vmovd  %xmm1,%edx
    79ea:	8b ca                	mov    %edx,%ecx
    79ec:	03 d2                	add    %edx,%edx
    79ee:	0b c2                	or     %edx,%eax
    79f0:	0f 84 09 00 00 00    	je     79ff <Stub<AMD64MathStub.pow>+0x65f>
    79f6:	c5 fb 58 c0          	vaddsd %xmm0,%xmm0,%xmm0
    79fa:	e9 a9 0a 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    79ff:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    7a03:	b8 f0 3f 00 00       	mov    $0x3ff0,%eax
    7a08:	c5 f9 c4 c0 03       	vpinsrw $0x3,%eax,%xmm0,%xmm0
    7a0d:	c7 04 24 1d 00 00 00 	movl   $0x1d,(%rsp)
    7a14:	e9 83 0a 00 00       	jmpq   849c <Stub<AMD64MathStub.pow>+0x10fc>
    7a19:	c5 fa 7e 44 24 10    	vmovq  0x10(%rsp),%xmm0
    7a1f:	c5 f9 58 c0          	vaddpd %xmm0,%xmm0,%xmm0
    7a23:	e9 80 0a 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7a28:	c5 f9 7e c8          	vmovd  %xmm1,%eax
    7a2c:	c5 fa 6f d1          	vmovdqu %xmm1,%xmm2
    7a30:	c5 f1 73 d1 20       	vpsrlq $0x20,%xmm1,%xmm1
    7a35:	c5 f9 7e ca          	vmovd  %xmm1,%edx
    7a39:	8b ca                	mov    %edx,%ecx
    7a3b:	03 d2                	add    %edx,%edx
    7a3d:	0b c2                	or     %edx,%eax
    7a3f:	0f 84 bd 03 00 00    	je     7e02 <Stub<AMD64MathStub.pow>+0xa62>
    7a45:	c5 f9 c5 c2 03       	vpextrw $0x3,%xmm2,%eax
    7a4a:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    7a50:	81 f8 f0 7f 00 00    	cmp    $0x7ff0,%eax
    7a56:	0f 85 11 00 00 00    	jne    7a6d <Stub<AMD64MathStub.pow>+0x6cd>
    7a5c:	c5 f9 7e d0          	vmovd  %xmm2,%eax
    7a60:	c5 e9 73 d2 14       	vpsrlq $0x14,%xmm2,%xmm2
    7a65:	c5 f9 7e d2          	vmovd  %xmm2,%edx
    7a69:	0b c2                	or     %edx,%eax
    7a6b:	75 ac                	jne    7a19 <Stub<AMD64MathStub.pow>+0x679>
    7a6d:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    7a72:	a9 00 80 00 00       	test   $0x8000,%eax
    7a77:	0f 85 36 00 00 00    	jne    7ab3 <Stub<AMD64MathStub.pow>+0x713>
    7a7d:	f7 c1 00 00 00 80    	test   $0x80000000,%ecx
    7a83:	0f 85 8c 03 00 00    	jne    7e15 <Stub<AMD64MathStub.pow>+0xa75>
    7a89:	e9 1a 0a 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7a8e:	c5 fa 7e 4c 24 10    	vmovq  0x10(%rsp),%xmm1
    7a94:	c5 f9 7e c8          	vmovd  %xmm1,%eax
    7a98:	a9 01 00 00 00       	test   $0x1,%eax
    7a9d:	0f 85 b0 00 00 00    	jne    7b53 <Stub<AMD64MathStub.pow>+0x7b3>
    7aa3:	a9 02 00 00 00       	test   $0x2,%eax
    7aa8:	0f 85 76 00 00 00    	jne    7b24 <Stub<AMD64MathStub.pow>+0x784>
    7aae:	e9 a0 00 00 00       	jmpq   7b53 <Stub<AMD64MathStub.pow>+0x7b3>
    7ab3:	c1 e9 14             	shr    $0x14,%ecx
    7ab6:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
    7abc:	81 f9 33 04 00 00    	cmp    $0x433,%ecx
    7ac2:	0f 87 8b 00 00 00    	ja     7b53 <Stub<AMD64MathStub.pow>+0x7b3>
    7ac8:	0f 84 af 00 00 00    	je     7b7d <Stub<AMD64MathStub.pow>+0x7dd>
    7ace:	81 f9 32 04 00 00    	cmp    $0x432,%ecx
    7ad4:	77 b8                	ja     7a8e <Stub<AMD64MathStub.pow>+0x6ee>
    7ad6:	81 f9 ff 03 00 00    	cmp    $0x3ff,%ecx
    7adc:	0f 82 71 00 00 00    	jb     7b53 <Stub<AMD64MathStub.pow>+0x7b3>
    7ae2:	c5 fa 7e 4c 24 10    	vmovq  0x10(%rsp),%xmm1
    7ae8:	b8 38 43 00 00       	mov    $0x4338,%eax
    7aed:	c5 e1 57 db          	vxorpd %xmm3,%xmm3,%xmm3
    7af1:	c5 e1 c4 d8 03       	vpinsrw $0x3,%eax,%xmm3,%xmm3
    7af6:	c5 fa 6f e3          	vmovdqu %xmm3,%xmm4
    7afa:	c5 e3 58 d9          	vaddsd %xmm1,%xmm3,%xmm3
    7afe:	c5 db 5c e3          	vsubsd %xmm3,%xmm4,%xmm4
    7b02:	c5 f3 58 cc          	vaddsd %xmm4,%xmm1,%xmm1
    7b06:	c5 f9 c5 c1 03       	vpextrw $0x3,%xmm1,%eax
    7b0b:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    7b11:	0f 85 3c 00 00 00    	jne    7b53 <Stub<AMD64MathStub.pow>+0x7b3>
    7b17:	c5 f9 7e d8          	vmovd  %xmm3,%eax
    7b1b:	83 e0 01             	and    $0x1,%eax
    7b1e:	0f 84 2f 00 00 00    	je     7b53 <Stub<AMD64MathStub.pow>+0x7b3>
    7b24:	c5 fa 7e 4c 24 10    	vmovq  0x10(%rsp),%xmm1
    7b2a:	c5 f9 c5 c1 03       	vpextrw $0x3,%xmm1,%eax
    7b2f:	81 e0 00 80 00 00    	and    $0x8000,%eax
    7b35:	0f 85 05 00 00 00    	jne    7b40 <Stub<AMD64MathStub.pow>+0x7a0>
    7b3b:	e9 68 09 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7b40:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    7b44:	b8 00 80 00 00       	mov    $0x8000,%eax
    7b49:	c5 f9 c4 c0 03       	vpinsrw $0x3,%eax,%xmm0,%xmm0
    7b4e:	e9 55 09 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7b53:	c5 fa 7e 4c 24 10    	vmovq  0x10(%rsp),%xmm1
    7b59:	c5 f9 c5 c1 03       	vpextrw $0x3,%xmm1,%eax
    7b5e:	81 e0 00 80 00 00    	and    $0x8000,%eax
    7b64:	0f 85 ab 02 00 00    	jne    7e15 <Stub<AMD64MathStub.pow>+0xa75>
    7b6a:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    7b6e:	b8 f0 7f 00 00       	mov    $0x7ff0,%eax
    7b73:	c5 f9 c4 c0 03       	vpinsrw $0x3,%eax,%xmm0,%xmm0
    7b78:	e9 2b 09 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7b7d:	c5 fa 7e 4c 24 10    	vmovq  0x10(%rsp),%xmm1
    7b83:	c5 f9 7e c8          	vmovd  %xmm1,%eax
    7b87:	83 e0 01             	and    $0x1,%eax
    7b8a:	74 c7                	je     7b53 <Stub<AMD64MathStub.pow>+0x7b3>
    7b8c:	eb 96                	jmp    7b24 <Stub<AMD64MathStub.pow>+0x784>
    7b8e:	c5 f9 7e c8          	vmovd  %xmm1,%eax
    7b92:	c5 f1 73 d1 14       	vpsrlq $0x14,%xmm1,%xmm1
    7b97:	c5 f9 7e ca          	vmovd  %xmm1,%edx
    7b9b:	0b c2                	or     %edx,%eax
    7b9d:	0f 84 0f 00 00 00    	je     7bb2 <Stub<AMD64MathStub.pow>+0x812>
    7ba3:	c5 fa 7e 44 24 10    	vmovq  0x10(%rsp),%xmm0
    7ba9:	c5 fb 58 c0          	vaddsd %xmm0,%xmm0,%xmm0
    7bad:	e9 f6 08 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7bb2:	c5 fa 7e 44 24 08    	vmovq  0x8(%rsp),%xmm0
    7bb8:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    7bbd:	81 f8 f0 bf 00 00    	cmp    $0xbff0,%eax
    7bc3:	0f 85 28 00 00 00    	jne    7bf1 <Stub<AMD64MathStub.pow>+0x851>
    7bc9:	c5 f9 7e c1          	vmovd  %xmm0,%ecx
    7bcd:	c5 f9 73 d0 14       	vpsrlq $0x14,%xmm0,%xmm0
    7bd2:	c5 f9 7e c2          	vmovd  %xmm0,%edx
    7bd6:	0b ca                	or     %edx,%ecx
    7bd8:	0f 85 13 00 00 00    	jne    7bf1 <Stub<AMD64MathStub.pow>+0x851>
    7bde:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    7be2:	b8 f8 7f 00 00       	mov    $0x7ff8,%eax
    7be7:	c5 f9 c4 c0 03       	vpinsrw $0x3,%eax,%xmm0,%xmm0
    7bec:	e9 b7 08 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7bf1:	c5 fa 7e 4c 24 10    	vmovq  0x10(%rsp),%xmm1
    7bf7:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    7bfd:	81 e8 f0 3f 00 00    	sub    $0x3ff0,%eax
    7c03:	c5 f9 c5 d1 03       	vpextrw $0x3,%xmm1,%edx
    7c08:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    7c0c:	33 c2                	xor    %edx,%eax
    7c0e:	81 e0 00 80 00 00    	and    $0x8000,%eax
    7c14:	0f 84 05 00 00 00    	je     7c1f <Stub<AMD64MathStub.pow>+0x87f>
    7c1a:	e9 89 08 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7c1f:	b9 f0 7f 00 00       	mov    $0x7ff0,%ecx
    7c24:	c5 f9 c4 c1 03       	vpinsrw $0x3,%ecx,%xmm0,%xmm0
    7c29:	e9 7a 08 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7c2e:	c5 f9 7e c8          	vmovd  %xmm1,%eax
    7c32:	81 fa 20 43 00 00    	cmp    $0x4320,%edx
    7c38:	0f 87 1b 00 00 00    	ja     7c59 <Stub<AMD64MathStub.pow>+0x8b9>
    7c3e:	a9 01 00 00 00       	test   $0x1,%eax
    7c43:	0f 85 35 01 00 00    	jne    7d7e <Stub<AMD64MathStub.pow>+0x9de>
    7c49:	a9 02 00 00 00       	test   $0x2,%eax
    7c4e:	0f 84 4c 01 00 00    	je     7da0 <Stub<AMD64MathStub.pow>+0xa00>
    7c54:	e9 c3 00 00 00       	jmpq   7d1c <Stub<AMD64MathStub.pow>+0x97c>
    7c59:	a9 01 00 00 00       	test   $0x1,%eax
    7c5e:	0f 84 3c 01 00 00    	je     7da0 <Stub<AMD64MathStub.pow>+0xa00>
    7c64:	e9 b3 00 00 00       	jmpq   7d1c <Stub<AMD64MathStub.pow>+0x97c>
    7c69:	c5 fa 7e 54 24 08    	vmovq  0x8(%rsp),%xmm2
    7c6f:	c5 f9 7e d0          	vmovd  %xmm2,%eax
    7c73:	c5 e9 73 d2 1f       	vpsrlq $0x1f,%xmm2,%xmm2
    7c78:	c5 f9 7e d1          	vmovd  %xmm2,%ecx
    7c7c:	0b c1                	or     %ecx,%eax
    7c7e:	0f 84 26 02 00 00    	je     7eaa <Stub<AMD64MathStub.pow>+0xb0a>
    7c84:	c5 fa 7e 4c 24 10    	vmovq  0x10(%rsp),%xmm1
    7c8a:	c5 f9 c5 d1 03       	vpextrw $0x3,%xmm1,%edx
    7c8f:	c5 f9 7e c8          	vmovd  %xmm1,%eax
    7c93:	c5 fa 6f d1          	vmovdqu %xmm1,%xmm2
    7c97:	c5 e9 73 d2 20       	vpsrlq $0x20,%xmm2,%xmm2
    7c9c:	c5 f9 7e d1          	vmovd  %xmm2,%ecx
    7ca0:	03 c9                	add    %ecx,%ecx
    7ca2:	0b c8                	or     %eax,%ecx
    7ca4:	0f 84 d3 01 00 00    	je     7e7d <Stub<AMD64MathStub.pow>+0xadd>
    7caa:	81 e2 f0 7f 00 00    	and    $0x7ff0,%edx
    7cb0:	81 fa f0 7f 00 00    	cmp    $0x7ff0,%edx
    7cb6:	0f 84 d2 fe ff ff    	je     7b8e <Stub<AMD64MathStub.pow>+0x7ee>
    7cbc:	81 fa 30 43 00 00    	cmp    $0x4330,%edx
    7cc2:	0f 87 d8 00 00 00    	ja     7da0 <Stub<AMD64MathStub.pow>+0xa00>
    7cc8:	81 fa 20 43 00 00    	cmp    $0x4320,%edx
    7cce:	0f 83 5a ff ff ff    	jae    7c2e <Stub<AMD64MathStub.pow>+0x88e>
    7cd4:	81 fa f0 3f 00 00    	cmp    $0x3ff0,%edx
    7cda:	0f 82 9e 00 00 00    	jb     7d7e <Stub<AMD64MathStub.pow>+0x9de>
    7ce0:	b8 38 43 00 00       	mov    $0x4338,%eax
    7ce5:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
    7ce9:	c5 e9 c4 d0 03       	vpinsrw $0x3,%eax,%xmm2,%xmm2
    7cee:	c5 fa 6f e2          	vmovdqu %xmm2,%xmm4
    7cf2:	c5 eb 58 d1          	vaddsd %xmm1,%xmm2,%xmm2
    7cf6:	c5 db 5c e2          	vsubsd %xmm2,%xmm4,%xmm4
    7cfa:	c5 f3 58 cc          	vaddsd %xmm4,%xmm1,%xmm1
    7cfe:	c5 f9 c5 c1 03       	vpextrw $0x3,%xmm1,%eax
    7d03:	81 e0 ff 7f 00 00    	and    $0x7fff,%eax
    7d09:	0f 85 6f 00 00 00    	jne    7d7e <Stub<AMD64MathStub.pow>+0x9de>
    7d0f:	c5 f9 7e d0          	vmovd  %xmm2,%eax
    7d13:	83 e0 01             	and    $0x1,%eax
    7d16:	0f 84 84 00 00 00    	je     7da0 <Stub<AMD64MathStub.pow>+0xa00>
    7d1c:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
    7d20:	ba f0 77 00 00       	mov    $0x77f0,%edx
    7d25:	c5 f1 c4 ca 03       	vpinsrw $0x3,%edx,%xmm1,%xmm1
    7d2a:	c4 c1 7a 7e 15 2d ba 	vmovq  0xba2d(%rip),%xmm2        # 13760 <data.M27.96>
    7d31:	00 00 
    7d33:	c5 fa 7e 64 24 08    	vmovq  0x8(%rsp),%xmm4
    7d39:	c5 f9 c5 c4 03       	vpextrw $0x3,%xmm4,%eax
    7d3e:	ba 00 20 00 00       	mov    $0x2000,%edx
    7d43:	c5 f9 6e e2          	vmovd  %edx,%xmm4
    7d47:	81 e0 ff 7f 00 00    	and    $0x7fff,%eax
    7d4d:	83 e8 10             	sub    $0x10,%eax
    7d50:	0f 8c 13 fa ff ff    	jl     7769 <Stub<AMD64MathStub.pow>+0x3c9>
    7d56:	8b d0                	mov    %eax,%edx
    7d58:	81 e2 f0 7f 00 00    	and    $0x7ff0,%edx
    7d5e:	81 ea f0 3f 00 00    	sub    $0x3ff0,%edx
    7d64:	8b ca                	mov    %edx,%ecx
    7d66:	c1 fa 1f             	sar    $0x1f,%edx
    7d69:	03 ca                	add    %edx,%ecx
    7d6b:	33 ca                	xor    %edx,%ecx
    7d6d:	83 c1 10             	add    $0x10,%ecx
    7d70:	0f bd c9             	bsr    %ecx,%ecx
    7d73:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
    7d79:	e9 ed f6 ff ff       	jmpq   746b <Stub<AMD64MathStub.pow>+0xcb>
    7d7e:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
    7d82:	b8 f0 7f 00 00       	mov    $0x7ff0,%eax
    7d87:	c5 f1 c4 c8 03       	vpinsrw $0x3,%eax,%xmm1,%xmm1
    7d8c:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    7d90:	c5 fb 59 c1          	vmulsd %xmm1,%xmm0,%xmm0
    7d94:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%rsp)
    7d9b:	e9 fc 06 00 00       	jmpq   849c <Stub<AMD64MathStub.pow>+0x10fc>
    7da0:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
    7da4:	ba f0 77 00 00       	mov    $0x77f0,%edx
    7da9:	c5 f1 c4 ca 03       	vpinsrw $0x3,%edx,%xmm1,%xmm1
    7dae:	c4 c1 7a 7e 15 a9 b9 	vmovq  0xb9a9(%rip),%xmm2        # 13760 <data.M27.96>
    7db5:	00 00 
    7db7:	c5 fa 7e 64 24 08    	vmovq  0x8(%rsp),%xmm4
    7dbd:	c5 f9 c5 c4 03       	vpextrw $0x3,%xmm4,%eax
    7dc2:	ba 00 20 00 00       	mov    $0x2000,%edx
    7dc7:	c5 f9 6e e2          	vmovd  %edx,%xmm4
    7dcb:	81 e0 ff 7f 00 00    	and    $0x7fff,%eax
    7dd1:	83 e8 10             	sub    $0x10,%eax
    7dd4:	0f 8c be f8 ff ff    	jl     7698 <Stub<AMD64MathStub.pow>+0x2f8>
    7dda:	8b d0                	mov    %eax,%edx
    7ddc:	81 e2 f0 7f 00 00    	and    $0x7ff0,%edx
    7de2:	81 ea f0 3f 00 00    	sub    $0x3ff0,%edx
    7de8:	8b ca                	mov    %edx,%ecx
    7dea:	c1 fa 1f             	sar    $0x1f,%edx
    7ded:	03 ca                	add    %edx,%ecx
    7def:	33 ca                	xor    %edx,%ecx
    7df1:	83 c1 10             	add    $0x10,%ecx
    7df4:	0f bd c9             	bsr    %ecx,%ecx
    7df7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    7dfd:	e9 69 f6 ff ff       	jmpq   746b <Stub<AMD64MathStub.pow>+0xcb>
    7e02:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    7e06:	b8 f0 3f 00 00       	mov    $0x3ff0,%eax
    7e0b:	c5 f9 c4 c0 03       	vpinsrw $0x3,%eax,%xmm0,%xmm0
    7e10:	e9 93 06 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7e15:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    7e19:	e9 8a 06 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7e1e:	81 c0 80 01 00 00    	add    $0x180,%eax
    7e24:	83 f8 00             	cmp    $0x0,%eax
    7e27:	0f 8c 50 00 00 00    	jl     7e7d <Stub<AMD64MathStub.pow>+0xadd>
    7e2d:	c5 d3 59 e9          	vmulsd %xmm1,%xmm5,%xmm5
    7e31:	c5 fb 58 c7          	vaddsd %xmm7,%xmm0,%xmm0
    7e35:	41 c1 e8 1f          	shr    $0x1f,%r8d
    7e39:	c5 e1 58 d8          	vaddpd %xmm0,%xmm3,%xmm3
    7e3d:	c5 f9 70 c3 ee       	vpshufd $0xee,%xmm3,%xmm0
    7e42:	c5 e3 58 d8          	vaddsd %xmm0,%xmm3,%xmm3
    7e46:	4c 8d 1d c3 e9 00 00 	lea    0xe9c3(%rip),%r11        # 16810 <data.M27.32>
    7e4d:	c4 81 7a 7e 24 c3    	vmovq  (%r11,%r8,8),%xmm4
    7e53:	c5 f3 59 cb          	vmulsd %xmm3,%xmm1,%xmm1
    7e57:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    7e5b:	b8 f0 3f 00 00       	mov    $0x3ff0,%eax
    7e60:	41 c1 e0 0f          	shl    $0xf,%r8d
    7e64:	41 0b c0             	or     %r8d,%eax
    7e67:	c5 f9 c4 c0 03       	vpinsrw $0x3,%eax,%xmm0,%xmm0
    7e6c:	c5 d3 58 e9          	vaddsd %xmm1,%xmm5,%xmm5
    7e70:	c5 d3 59 ec          	vmulsd %xmm4,%xmm5,%xmm5
    7e74:	c5 fb 58 c5          	vaddsd %xmm5,%xmm0,%xmm0
    7e78:	e9 2b 06 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7e7d:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    7e81:	b8 f0 3f 00 00       	mov    $0x3ff0,%eax
    7e86:	c5 f9 c4 c0 03       	vpinsrw $0x3,%eax,%xmm0,%xmm0
    7e8b:	e9 18 06 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7e90:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    7e94:	b8 f0 3f 00 00       	mov    $0x3ff0,%eax
    7e99:	c5 f9 c4 c0 03       	vpinsrw $0x3,%eax,%xmm0,%xmm0
    7e9e:	c7 04 24 1a 00 00 00 	movl   $0x1a,(%rsp)
    7ea5:	e9 f2 05 00 00       	jmpq   849c <Stub<AMD64MathStub.pow>+0x10fc>
    7eaa:	c5 fa 7e 4c 24 10    	vmovq  0x10(%rsp),%xmm1
    7eb0:	c5 fa 6f d1          	vmovdqu %xmm1,%xmm2
    7eb4:	c5 f9 c5 c1 03       	vpextrw $0x3,%xmm1,%eax
    7eb9:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    7ebf:	81 f8 f0 7f 00 00    	cmp    $0x7ff0,%eax
    7ec5:	0f 85 15 00 00 00    	jne    7ee0 <Stub<AMD64MathStub.pow>+0xb40>
    7ecb:	c5 f9 7e d0          	vmovd  %xmm2,%eax
    7ecf:	c5 e9 73 d2 14       	vpsrlq $0x14,%xmm2,%xmm2
    7ed4:	c5 f9 7e d2          	vmovd  %xmm2,%edx
    7ed8:	0b c2                	or     %edx,%eax
    7eda:	0f 85 39 fb ff ff    	jne    7a19 <Stub<AMD64MathStub.pow>+0x679>
    7ee0:	c5 f9 7e c8          	vmovd  %xmm1,%eax
    7ee4:	c5 f1 73 d1 20       	vpsrlq $0x20,%xmm1,%xmm1
    7ee9:	c5 f9 7e ca          	vmovd  %xmm1,%edx
    7eed:	8b ca                	mov    %edx,%ecx
    7eef:	03 d2                	add    %edx,%edx
    7ef1:	0b c2                	or     %edx,%eax
    7ef3:	74 9b                	je     7e90 <Stub<AMD64MathStub.pow>+0xaf0>
    7ef5:	c1 ea 15             	shr    $0x15,%edx
    7ef8:	81 fa 33 04 00 00    	cmp    $0x433,%edx
    7efe:	0f 87 7c 00 00 00    	ja     7f80 <Stub<AMD64MathStub.pow>+0xbe0>
    7f04:	0f 84 65 00 00 00    	je     7f6f <Stub<AMD64MathStub.pow>+0xbcf>
    7f0a:	81 fa ff 03 00 00    	cmp    $0x3ff,%edx
    7f10:	0f 82 6a 00 00 00    	jb     7f80 <Stub<AMD64MathStub.pow>+0xbe0>
    7f16:	c5 fa 7e 4c 24 10    	vmovq  0x10(%rsp),%xmm1
    7f1c:	b8 38 43 00 00       	mov    $0x4338,%eax
    7f21:	c5 e1 57 db          	vxorpd %xmm3,%xmm3,%xmm3
    7f25:	c5 e1 c4 d8 03       	vpinsrw $0x3,%eax,%xmm3,%xmm3
    7f2a:	c5 fa 6f e3          	vmovdqu %xmm3,%xmm4
    7f2e:	c5 e3 58 d9          	vaddsd %xmm1,%xmm3,%xmm3
    7f32:	c5 db 5c e3          	vsubsd %xmm3,%xmm4,%xmm4
    7f36:	c5 f3 58 cc          	vaddsd %xmm4,%xmm1,%xmm1
    7f3a:	c5 f9 c5 c1 03       	vpextrw $0x3,%xmm1,%eax
    7f3f:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    7f45:	0f 85 35 00 00 00    	jne    7f80 <Stub<AMD64MathStub.pow>+0xbe0>
    7f4b:	c5 f9 7e d8          	vmovd  %xmm3,%eax
    7f4f:	83 e0 01             	and    $0x1,%eax
    7f52:	0f 84 28 00 00 00    	je     7f80 <Stub<AMD64MathStub.pow>+0xbe0>
    7f58:	c5 fa 7e 44 24 08    	vmovq  0x8(%rsp),%xmm0
    7f5e:	f7 c1 00 00 00 80    	test   $0x80000000,%ecx
    7f64:	0f 85 26 00 00 00    	jne    7f90 <Stub<AMD64MathStub.pow>+0xbf0>
    7f6a:	e9 39 05 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    7f6f:	c5 fa 7e 4c 24 10    	vmovq  0x10(%rsp),%xmm1
    7f75:	c5 f9 7e c8          	vmovd  %xmm1,%eax
    7f79:	a9 01 00 00 00       	test   $0x1,%eax
    7f7e:	75 d8                	jne    7f58 <Stub<AMD64MathStub.pow>+0xbb8>
    7f80:	f7 c1 00 00 00 80    	test   $0x80000000,%ecx
    7f86:	0f 84 89 fe ff ff    	je     7e15 <Stub<AMD64MathStub.pow>+0xa75>
    7f8c:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    7f90:	b8 f0 3f 00 00       	mov    $0x3ff0,%eax
    7f95:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
    7f99:	c5 f1 c4 c8 03       	vpinsrw $0x3,%eax,%xmm1,%xmm1
    7f9e:	c5 f3 5e c8          	vdivsd %xmm0,%xmm1,%xmm1
    7fa2:	c5 fa 6f c1          	vmovdqu %xmm1,%xmm0
    7fa6:	c7 04 24 1b 00 00 00 	movl   $0x1b,(%rsp)
    7fad:	e9 ea 04 00 00       	jmpq   849c <Stub<AMD64MathStub.pow>+0x10fc>
    7fb2:	c5 fa 7e 54 24 08    	vmovq  0x8(%rsp),%xmm2
    7fb8:	c5 fa 7e 74 24 10    	vmovq  0x10(%rsp),%xmm6
    7fbe:	c5 f9 c5 c2 03       	vpextrw $0x3,%xmm2,%eax
    7fc3:	c5 f9 c5 d6 03       	vpextrw $0x3,%xmm6,%edx
    7fc8:	b9 f0 7f 00 00       	mov    $0x7ff0,%ecx
    7fcd:	23 ca                	and    %edx,%ecx
    7fcf:	81 f9 f0 7f 00 00    	cmp    $0x7ff0,%ecx
    7fd5:	0f 84 05 04 00 00    	je     83e0 <Stub<AMD64MathStub.pow>+0x1040>
    7fdb:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    7fe1:	81 e8 f0 3f 00 00    	sub    $0x3ff0,%eax
    7fe7:	33 d0                	xor    %eax,%edx
    7fe9:	f7 c2 00 80 00 00    	test   $0x8000,%edx
    7fef:	0f 85 26 00 00 00    	jne    801b <Stub<AMD64MathStub.pow>+0xc7b>
    7ff5:	b8 e0 7f 00 00       	mov    $0x7fe0,%eax
    7ffa:	c5 f9 c4 c0 03       	vpinsrw $0x3,%eax,%xmm0,%xmm0
    7fff:	41 c1 e8 10          	shr    $0x10,%r8d
    8003:	41 0b c0             	or     %r8d,%eax
    8006:	c5 f1 c4 c8 03       	vpinsrw $0x3,%eax,%xmm1,%xmm1
    800b:	c5 fb 59 c1          	vmulsd %xmm1,%xmm0,%xmm0
    800f:	c7 04 24 18 00 00 00 	movl   $0x18,(%rsp)
    8016:	e9 81 04 00 00       	jmpq   849c <Stub<AMD64MathStub.pow>+0x10fc>
    801b:	b8 10 00 00 00       	mov    $0x10,%eax
    8020:	c5 f9 c4 c0 03       	vpinsrw $0x3,%eax,%xmm0,%xmm0
    8025:	c5 fb 59 c0          	vmulsd %xmm0,%xmm0,%xmm0
    8029:	41 f7 c0 00 00 00 80 	test   $0x80000000,%r8d
    8030:	0f 84 13 00 00 00    	je     8049 <Stub<AMD64MathStub.pow>+0xca9>
    8036:	49 b9 00 00 00 00 00 	movabs $0x8000000000000000,%r9
    803d:	00 00 80 
    8040:	c4 c1 f9 6e d1       	vmovq  %r9,%xmm2
    8045:	c5 f9 57 c2          	vxorpd %xmm2,%xmm0,%xmm0
    8049:	c7 04 24 19 00 00 00 	movl   $0x19,(%rsp)
    8050:	e9 47 04 00 00       	jmpq   849c <Stub<AMD64MathStub.pow>+0x10fc>
    8055:	c5 f9 c5 cd 03       	vpextrw $0x3,%xmm5,%ecx
    805a:	c5 f9 c5 d4 03       	vpextrw $0x3,%xmm4,%edx
    805f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    8064:	81 e1 f0 7f 00 00    	and    $0x7ff0,%ecx
    806a:	81 e9 f0 3f 00 00    	sub    $0x3ff0,%ecx
    8070:	81 e2 f0 7f 00 00    	and    $0x7ff0,%edx
    8076:	03 d1                	add    %ecx,%edx
    8078:	b9 e1 ff ff ff       	mov    $0xffffffe1,%ecx
    807d:	c1 fa 04             	sar    $0x4,%edx
    8080:	2b ca                	sub    %edx,%ecx
    8082:	0f 8e 0b 00 00 00    	jle    8093 <Stub<AMD64MathStub.pow>+0xcf3>
    8088:	83 f9 14             	cmp    $0x14,%ecx
    808b:	0f 87 23 00 00 00    	ja     80b4 <Stub<AMD64MathStub.pow>+0xd14>
    8091:	d3 e0                	shl    %cl,%eax
    8093:	c5 f9 6e c0          	vmovd  %eax,%xmm0
    8097:	c5 f9 73 f0 20       	vpsllq $0x20,%xmm0,%xmm0
    809c:	c5 f9 db c5          	vpand  %xmm5,%xmm0,%xmm0
    80a0:	c5 d3 5c e8          	vsubsd %xmm0,%xmm5,%xmm5
    80a4:	c5 d3 58 e9          	vaddsd %xmm1,%xmm5,%xmm5
    80a8:	c5 fb 59 c4          	vmulsd %xmm4,%xmm0,%xmm0
    80ac:	c5 d3 59 ec          	vmulsd %xmm4,%xmm5,%xmm5
    80b0:	c5 fb 58 c5          	vaddsd %xmm5,%xmm0,%xmm0
    80b4:	eb 93                	jmp    8049 <Stub<AMD64MathStub.pow>+0xca9>
    80b6:	66 8b 4c 24 16       	mov    0x16(%rsp),%cx
    80bb:	ba 00 00 00 80       	mov    $0x80000000,%edx
    80c0:	c5 f9 6e ca          	vmovd  %edx,%xmm1
    80c4:	c5 c1 57 ff          	vxorpd %xmm7,%xmm7,%xmm7
    80c8:	c5 f9 fe c4          	vpaddd %xmm4,%xmm0,%xmm0
    80cc:	c5 f9 7e c2          	vmovd  %xmm0,%edx
    80d0:	c5 f9 73 f0 1d       	vpsllq $0x1d,%xmm0,%xmm0
    80d5:	c5 f1 d4 cb          	vpaddq %xmm3,%xmm1,%xmm1
    80d9:	c5 d1 db e9          	vpand  %xmm1,%xmm5,%xmm5
    80dd:	81 e1 f0 7f 00 00    	and    $0x7ff0,%ecx
    80e3:	81 f9 b0 40 00 00    	cmp    $0x40b0,%ecx
    80e9:	0f 8c b7 f3 ff ff    	jl     74a6 <Stub<AMD64MathStub.pow>+0x106>
    80ef:	c5 f9 db c6          	vpand  %xmm6,%xmm0,%xmm0
    80f3:	c5 e3 5c dd          	vsubsd %xmm5,%xmm3,%xmm3
    80f7:	81 c0 df 3f 00 00    	add    $0x3fdf,%eax
    80fd:	c1 e8 04             	shr    $0x4,%eax
    8100:	81 e8 fe 03 00 00    	sub    $0x3fe,%eax
    8106:	c5 c3 2a f8          	vcvtsi2sd %eax,%xmm7,%xmm7
    810a:	c5 d1 59 e8          	vmulpd %xmm0,%xmm5,%xmm5
    810e:	4c 8d 1d 6b b6 00 00 	lea    0xb66b(%rip),%r11        # 13780 <data.M27.128>
    8115:	c4 c1 7a 7e 25 02 e7 	vmovq  0xe702(%rip),%xmm4        # 16820 <data.M27.48>
    811c:	00 00 
    811e:	c5 e3 59 d8          	vmulsd %xmm0,%xmm3,%xmm3
    8122:	c4 c1 7a 7e 35 f5 e6 	vmovq  0xe6f5(%rip),%xmm6        # 16820 <data.M27.48>
    8129:	00 00 
    812b:	c5 d3 5c ea          	vsubsd %xmm2,%xmm5,%xmm5
    812f:	c4 c1 7a 7e 0d f0 e6 	vmovq  0xe6f0(%rip),%xmm1        # 16828 <data.M27.56>
    8136:	00 00 
    8138:	c5 f9 70 d3 44       	vpshufd $0x44,%xmm3,%xmm2
    813d:	c5 d1 14 eb          	vunpcklpd %xmm3,%xmm5,%xmm5
    8141:	c5 e3 58 dd          	vaddsd %xmm5,%xmm3,%xmm3
    8145:	c4 c1 7a 7e 05 da e6 	vmovq  0xe6da(%rip),%xmm0        # 16828 <data.M27.56>
    814c:	00 00 
    814e:	81 e2 00 c0 ff 00    	and    $0xffc000,%edx
    8154:	c1 ea 0a             	shr    $0xa,%edx
    8157:	c4 c1 41 58 bc 13 c0 	vaddpd -0xe40(%r11,%rdx,1),%xmm7,%xmm7
    815e:	f1 ff ff 
    8161:	c5 db 59 e5          	vmulsd %xmm5,%xmm4,%xmm4
    8165:	c5 fb 59 c5          	vmulsd %xmm5,%xmm0,%xmm0
    8169:	c5 cb 59 f2          	vmulsd %xmm2,%xmm6,%xmm6
    816d:	c5 f3 59 ca          	vmulsd %xmm2,%xmm1,%xmm1
    8171:	c5 fa 6f d5          	vmovdqu %xmm5,%xmm2
    8175:	c5 db 59 e5          	vmulsd %xmm5,%xmm4,%xmm4
    8179:	c5 d3 58 e8          	vaddsd %xmm0,%xmm5,%xmm5
    817d:	c5 fa 6f c7          	vmovdqu %xmm7,%xmm0
    8181:	c5 eb 58 d3          	vaddsd %xmm3,%xmm2,%xmm2
    8185:	c5 c3 58 fd          	vaddsd %xmm5,%xmm7,%xmm7
    8189:	c5 cb 59 f2          	vmulsd %xmm2,%xmm6,%xmm6
    818d:	c5 fb 5c c7          	vsubsd %xmm7,%xmm0,%xmm0
    8191:	c5 fa 6f d7          	vmovdqu %xmm7,%xmm2
    8195:	c5 c3 58 fc          	vaddsd %xmm4,%xmm7,%xmm7
    8199:	c5 fb 58 c5          	vaddsd %xmm5,%xmm0,%xmm0
    819d:	c5 eb 5c d7          	vsubsd %xmm7,%xmm2,%xmm2
    81a1:	c5 db 58 e2          	vaddsd %xmm2,%xmm4,%xmm4
    81a5:	c5 f9 70 d5 ee       	vpshufd $0xee,%xmm5,%xmm2
    81aa:	c5 fa 6f ef          	vmovdqu %xmm7,%xmm5
    81ae:	c5 c3 58 fa          	vaddsd %xmm2,%xmm7,%xmm7
    81b2:	c5 db 58 e0          	vaddsd %xmm0,%xmm4,%xmm4
    81b6:	c4 c1 7a 6f 05 b1 b5 	vmovdqu 0xb5b1(%rip),%xmm0        # 13770 <data.M27.112>
    81bd:	00 00 
    81bf:	c5 d3 5c ef          	vsubsd %xmm7,%xmm5,%xmm5
    81c3:	c5 cb 58 f4          	vaddsd %xmm4,%xmm6,%xmm6
    81c7:	c5 fa 6f e7          	vmovdqu %xmm7,%xmm4
    81cb:	c5 d3 58 ea          	vaddsd %xmm2,%xmm5,%xmm5
    81cf:	c5 c3 58 f9          	vaddsd %xmm1,%xmm7,%xmm7
    81d3:	c4 c1 7a 6f 15 54 e6 	vmovdqu 0xe654(%rip),%xmm2        # 16830 <data.M27.12528>
    81da:	00 00 
    81dc:	c5 db 5c e7          	vsubsd %xmm7,%xmm4,%xmm4
    81e0:	c5 cb 58 f5          	vaddsd %xmm5,%xmm6,%xmm6
    81e4:	c5 db 58 e1          	vaddsd %xmm1,%xmm4,%xmm4
    81e8:	c5 f9 70 ef ee       	vpshufd $0xee,%xmm7,%xmm5
    81ed:	c5 f9 28 cf          	vmovapd %xmm7,%xmm1
    81f1:	c5 c3 58 fd          	vaddsd %xmm5,%xmm7,%xmm7
    81f5:	c5 f3 5c cf          	vsubsd %xmm7,%xmm1,%xmm1
    81f9:	c5 f3 58 cd          	vaddsd %xmm5,%xmm1,%xmm1
    81fd:	c4 c1 7a 6f 2d 3a e6 	vmovdqu 0xe63a(%rip),%xmm5        # 16840 <data.M27.12544>
    8204:	00 00 
    8206:	c5 f9 70 db 44       	vpshufd $0x44,%xmm3,%xmm3
    820b:	c5 cb 58 f4          	vaddsd %xmm4,%xmm6,%xmm6
    820f:	c5 cb 58 f1          	vaddsd %xmm1,%xmm6,%xmm6
    8213:	c4 c1 7a 6f 0d 84 d5 	vmovdqu 0xd584(%rip),%xmm1        # 157a0 <data.M27.8352>
    821a:	00 00 
    821c:	c5 f9 59 c3          	vmulpd %xmm3,%xmm0,%xmm0
    8220:	c5 e9 59 d3          	vmulpd %xmm3,%xmm2,%xmm2
    8224:	c5 f9 70 e3 44       	vpshufd $0x44,%xmm3,%xmm4
    8229:	c5 e1 59 db          	vmulpd %xmm3,%xmm3,%xmm3
    822d:	c5 f9 58 c1          	vaddpd %xmm1,%xmm0,%xmm0
    8231:	c5 d1 58 ea          	vaddpd %xmm2,%xmm5,%xmm5
    8235:	c5 db 59 e3          	vmulsd %xmm3,%xmm4,%xmm4
    8239:	c4 c1 7a 7e 15 0e e6 	vmovq  0xe60e(%rip),%xmm2        # 16850 <data.M27.12560>
    8240:	00 00 
    8242:	c5 e1 59 db          	vmulpd %xmm3,%xmm3,%xmm3
    8246:	c5 fa 7e 4c 24 10    	vmovq  0x10(%rsp),%xmm1
    824c:	66 8b 4c 24 16       	mov    0x16(%rsp),%cx
    8251:	c5 f9 59 c4          	vmulpd %xmm4,%xmm0,%xmm0
    8255:	c5 f9 c5 c7 03       	vpextrw $0x3,%xmm7,%eax
    825a:	c5 d1 59 ec          	vmulpd %xmm4,%xmm5,%xmm5
    825e:	c5 f9 59 c3          	vmulpd %xmm3,%xmm0,%xmm0
    8262:	c4 c1 7a 7e 25 f5 e5 	vmovq  0xe5f5(%rip),%xmm4        # 16860 <data.M27.64>
    8269:	00 00 
    826b:	c5 e9 db d7          	vpand  %xmm7,%xmm2,%xmm2
    826f:	c5 d3 58 ee          	vaddsd %xmm6,%xmm5,%xmm5
    8273:	c5 c3 5c fa          	vsubsd %xmm2,%xmm7,%xmm7
    8277:	c5 d1 58 e8          	vaddpd %xmm0,%xmm5,%xmm5
    827b:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    8281:	81 e8 f0 3f 00 00    	sub    $0x3ff0,%eax
    8287:	81 e1 f0 7f 00 00    	and    $0x7ff0,%ecx
    828d:	81 f9 f0 7f 00 00    	cmp    $0x7ff0,%ecx
    8293:	0f 84 47 01 00 00    	je     83e0 <Stub<AMD64MathStub.pow>+0x1040>
    8299:	03 c8                	add    %eax,%ecx
    829b:	81 f9 c0 40 00 00    	cmp    $0x40c0,%ecx
    82a1:	0f 83 9e 01 00 00    	jae    8445 <Stub<AMD64MathStub.pow>+0x10a5>
    82a7:	c5 f9 70 c5 ee       	vpshufd $0xee,%xmm5,%xmm0
    82ac:	c5 d9 db e1          	vpand  %xmm1,%xmm4,%xmm4
    82b0:	c5 fa 6f d9          	vmovdqu %xmm1,%xmm3
    82b4:	c5 d3 58 e8          	vaddsd %xmm0,%xmm5,%xmm5
    82b8:	c5 f3 5c cc          	vsubsd %xmm4,%xmm1,%xmm1
    82bc:	c5 c9 57 f6          	vxorpd %xmm6,%xmm6,%xmm6
    82c0:	ba b8 42 00 00       	mov    $0x42b8,%edx
    82c5:	c5 c9 c4 f2 03       	vpinsrw $0x3,%edx,%xmm6,%xmm6
    82ca:	c5 c3 58 fd          	vaddsd %xmm5,%xmm7,%xmm7
    82ce:	c5 db 59 e2          	vmulsd %xmm2,%xmm4,%xmm4
    82d2:	c5 f3 59 ca          	vmulsd %xmm2,%xmm1,%xmm1
    82d6:	c5 fa 6f ee          	vmovdqu %xmm6,%xmm5
    82da:	c5 e3 59 df          	vmulsd %xmm7,%xmm3,%xmm3
    82de:	c5 cb 58 f4          	vaddsd %xmm4,%xmm6,%xmm6
    82e2:	c5 f3 58 cb          	vaddsd %xmm3,%xmm1,%xmm1
    82e6:	c4 c1 7a 6f 3d e1 e4 	vmovdqu 0xe4e1(%rip),%xmm7        # 167d0 <data.M27.12480>
    82ed:	00 00 
    82ef:	c5 f9 7e f2          	vmovd  %xmm6,%edx
    82f3:	c5 cb 5c f5          	vsubsd %xmm5,%xmm6,%xmm6
    82f7:	4c 8d 1d d2 d4 00 00 	lea    0xd4d2(%rip),%r11        # 157d0 <data.M27.8384>
    82fe:	c4 c1 7a 6f 1d d9 e4 	vmovdqu 0xe4d9(%rip),%xmm3        # 167e0 <data.M27.12496>
    8305:	00 00 
    8307:	c4 c1 7a 7e 15 f0 e4 	vmovq  0xe4f0(%rip),%xmm2        # 16800 <data.M27.12512>
    830e:	00 00 
    8310:	c5 db 5c e6          	vsubsd %xmm6,%xmm4,%xmm4
    8314:	8b ca                	mov    %edx,%ecx
    8316:	81 e2 ff 00 00 00    	and    $0xff,%edx
    831c:	03 d2                	add    %edx,%edx
    831e:	c4 c1 7a 6f 2c d3    	vmovdqu (%r11,%rdx,8),%xmm5
    8324:	c5 db 58 e1          	vaddsd %xmm1,%xmm4,%xmm4
    8328:	c5 f9 c5 d6 03       	vpextrw $0x3,%xmm6,%edx
    832d:	c1 e9 08             	shr    $0x8,%ecx
    8330:	8b c1                	mov    %ecx,%eax
    8332:	c1 e9 01             	shr    $0x1,%ecx
    8335:	2b c1                	sub    %ecx,%eax
    8337:	c1 e1 14             	shl    $0x14,%ecx
    833a:	c5 f9 6e f1          	vmovd  %ecx,%xmm6
    833e:	c5 f9 70 c4 44       	vpshufd $0x44,%xmm4,%xmm0
    8343:	c5 f9 70 cc 44       	vpshufd $0x44,%xmm4,%xmm1
    8348:	c5 f9 59 c0          	vmulpd %xmm0,%xmm0,%xmm0
    834c:	c5 c1 59 f9          	vmulpd %xmm1,%xmm7,%xmm7
    8350:	c5 f9 70 f6 11       	vpshufd $0x11,%xmm6,%xmm6
    8355:	c5 eb 59 d4          	vmulsd %xmm4,%xmm2,%xmm2
    8359:	81 e2 ff 7f 00 00    	and    $0x7fff,%edx
    835f:	81 fa 91 40 00 00    	cmp    $0x4091,%edx
    8365:	0f 87 47 fc ff ff    	ja     7fb2 <Stub<AMD64MathStub.pow>+0xc12>
    836b:	c5 fb 59 c0          	vmulsd %xmm0,%xmm0,%xmm0
    836f:	c5 d1 fe ee          	vpaddd %xmm6,%xmm5,%xmm5
    8373:	c5 e1 58 df          	vaddpd %xmm7,%xmm3,%xmm3
    8377:	c5 eb 59 d5          	vmulsd %xmm5,%xmm2,%xmm2
    837b:	c5 f9 70 f5 ee       	vpshufd $0xee,%xmm5,%xmm6
    8380:	c5 f9 59 c3          	vmulpd %xmm3,%xmm0,%xmm0
    8384:	c5 eb 58 d6          	vaddsd %xmm6,%xmm2,%xmm2
    8388:	c5 f9 70 d8 ee       	vpshufd $0xee,%xmm0,%xmm3
    838d:	81 c0 ff 03 00 00    	add    $0x3ff,%eax
    8393:	c1 e0 14             	shl    $0x14,%eax
    8396:	41 0b c0             	or     %r8d,%eax
    8399:	c5 f9 6e e0          	vmovd  %eax,%xmm4
    839d:	c5 fb 59 c5          	vmulsd %xmm5,%xmm0,%xmm0
    83a1:	c5 e3 59 dd          	vmulsd %xmm5,%xmm3,%xmm3
    83a5:	c5 fb 58 c2          	vaddsd %xmm2,%xmm0,%xmm0
    83a9:	c5 d9 73 f4 20       	vpsllq $0x20,%xmm4,%xmm4
    83ae:	c5 fb 58 c3          	vaddsd %xmm3,%xmm0,%xmm0
    83b2:	c5 fa 6f c8          	vmovdqu %xmm0,%xmm1
    83b6:	c5 fb 58 c5          	vaddsd %xmm5,%xmm0,%xmm0
    83ba:	c5 fb 59 c4          	vmulsd %xmm4,%xmm0,%xmm0
    83be:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    83c3:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    83c9:	0f 84 86 fc ff ff    	je     8055 <Stub<AMD64MathStub.pow>+0xcb5>
    83cf:	81 f8 f0 7f 00 00    	cmp    $0x7ff0,%eax
    83d5:	0f 84 34 fc ff ff    	je     800f <Stub<AMD64MathStub.pow>+0xc6f>
    83db:	e9 c8 00 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    83e0:	c5 fa 7e 44 24 08    	vmovq  0x8(%rsp),%xmm0
    83e6:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
    83ea:	b8 f0 bf 00 00       	mov    $0xbff0,%eax
    83ef:	c5 e9 c4 d0 03       	vpinsrw $0x3,%eax,%xmm2,%xmm2
    83f4:	c5 eb 58 d0          	vaddsd %xmm0,%xmm2,%xmm2
    83f8:	c5 f9 c5 c2 03       	vpextrw $0x3,%xmm2,%eax
    83fd:	83 f8 00             	cmp    $0x0,%eax
    8400:	0f 85 13 00 00 00    	jne    8419 <Stub<AMD64MathStub.pow>+0x1079>
    8406:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    840a:	b8 f8 7f 00 00       	mov    $0x7ff8,%eax
    840f:	c5 f9 c4 c0 03       	vpinsrw $0x3,%eax,%xmm0,%xmm0
    8414:	e9 8f 00 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    8419:	c5 fa 7e 4c 24 10    	vmovq  0x10(%rsp),%xmm1
    841f:	c5 f9 7e ca          	vmovd  %xmm1,%edx
    8423:	c5 fa 6f d9          	vmovdqu %xmm1,%xmm3
    8427:	c5 e1 73 d3 14       	vpsrlq $0x14,%xmm3,%xmm3
    842c:	c5 f9 7e d9          	vmovd  %xmm3,%ecx
    8430:	0b ca                	or     %edx,%ecx
    8432:	0f 84 29 00 00 00    	je     8461 <Stub<AMD64MathStub.pow>+0x10c1>
    8438:	c5 f3 58 c9          	vaddsd %xmm1,%xmm1,%xmm1
    843c:	c5 fa 6f c1          	vmovdqu %xmm1,%xmm0
    8440:	e9 63 00 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    8445:	c5 f9 c5 c1 03       	vpextrw $0x3,%xmm1,%eax
    844a:	c5 f9 c5 ca 03       	vpextrw $0x3,%xmm2,%ecx
    844f:	33 c1                	xor    %ecx,%eax
    8451:	a9 00 80 00 00       	test   $0x8000,%eax
    8456:	0f 84 99 fb ff ff    	je     7ff5 <Stub<AMD64MathStub.pow>+0xc55>
    845c:	e9 ba fb ff ff       	jmpq   801b <Stub<AMD64MathStub.pow>+0xc7b>
    8461:	c5 f9 c5 c0 03       	vpextrw $0x3,%xmm0,%eax
    8466:	81 e0 f0 7f 00 00    	and    $0x7ff0,%eax
    846c:	c5 f9 c5 d1 03       	vpextrw $0x3,%xmm1,%edx
    8471:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    8475:	81 e8 f0 3f 00 00    	sub    $0x3ff0,%eax
    847b:	33 c2                	xor    %edx,%eax
    847d:	a9 00 80 00 00       	test   $0x8000,%eax
    8482:	0f 84 05 00 00 00    	je     848d <Stub<AMD64MathStub.pow>+0x10ed>
    8488:	e9 1b 00 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    848d:	ba f0 7f 00 00       	mov    $0x7ff0,%edx
    8492:	c5 f9 c4 c2 03       	vpinsrw $0x3,%edx,%xmm0,%xmm0
    8497:	e9 0c 00 00 00       	jmpq   84a8 <Stub<AMD64MathStub.pow>+0x1108>
    849c:	c5 f9 d6 44 24 18    	vmovq  %xmm0,0x18(%rsp)
    84a2:	c5 fa 7e 44 24 18    	vmovq  0x18(%rsp),%xmm0
    84a8:	48 83 c4 28          	add    $0x28,%rsp
    84ac:	c3                   	retq   
	...
    84fd:	00 00                	add    %al,(%rax)
    84ff:	00 1c 00             	add    %bl,(%rax,%rax,1)
	...

0000000000008520 <Stub<new_instance(KlassPointer)Object>>:
    8520:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    8527:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    852e:	00 
    852f:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    8534:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    8539:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    853e:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    8543:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    854a:	49 8b ff             	mov    %r15,%rdi
    854d:	c5 f8 77             	vzeroupper 
    8550:	e8 33 2a 00 00       	callq  af88 <plt._aot_jvmci_runtime_new_instance>
    8555:	90                   	nop
    8556:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    855d:	00 00 00 00 
    8561:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    8568:	00 00 00 00 
    856c:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    8573:	00 00 00 00 
    8577:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    857c:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    8581:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    8586:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    858b:	49 8b 47 08          	mov    0x8(%r15),%rax
    858f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    8596:	00 
    8597:	48 85 c0             	test   %rax,%rax
    859a:	0f 84 36 00 00 00    	je     85d6 <Stub<new_instance(KlassPointer)Object>+0xb6>
    85a0:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    85a7:	00 00 00 00 
    85ab:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    85b2:	97 ff ff ff 
    85b6:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    85bd:	00 00 00 00 
    85c1:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    85c8:	00 
    85c9:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    85d0:	e9 bb 29 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    85d5:	90                   	nop
    85d6:	49 8b 87 c0 03 00 00 	mov    0x3c0(%r15),%rax
    85dd:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    85e4:	00 00 00 00 
    85e8:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    85ef:	00 
    85f0:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    85f7:	c3                   	retq   
	...
    8600:	1d 00 00 00 00       	sbb    $0x0,%eax
	...

0000000000008620 <Stub<new_array(KlassPointer,int)Object>>:
    8620:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    8627:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    862e:	00 
    862f:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    8634:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    8639:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    863e:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    8643:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    864a:	49 8b ff             	mov    %r15,%rdi
    864d:	c5 f8 77             	vzeroupper 
    8650:	e8 43 29 00 00       	callq  af98 <plt._aot_jvmci_runtime_new_array>
    8655:	90                   	nop
    8656:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    865d:	00 00 00 00 
    8661:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    8668:	00 00 00 00 
    866c:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    8673:	00 00 00 00 
    8677:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    867c:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    8681:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    8686:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    868b:	49 8b 47 08          	mov    0x8(%r15),%rax
    868f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    8696:	00 
    8697:	48 85 c0             	test   %rax,%rax
    869a:	0f 84 36 00 00 00    	je     86d6 <Stub<new_array(KlassPointer,int)Object>+0xb6>
    86a0:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    86a7:	00 00 00 00 
    86ab:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    86b2:	97 ff ff ff 
    86b6:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    86bd:	00 00 00 00 
    86c1:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    86c8:	00 
    86c9:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    86d0:	e9 bb 28 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    86d5:	90                   	nop
    86d6:	49 8b 87 c0 03 00 00 	mov    0x3c0(%r15),%rax
    86dd:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    86e4:	00 00 00 00 
    86e8:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    86ef:	00 
    86f0:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    86f7:	c3                   	retq   
	...
    8700:	1e                   	(bad)  
	...

0000000000008720 <Stub<new_multi_array(KlassPointer,int,Word)Object>>:
    8720:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    8727:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    872e:	00 
    872f:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    8734:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    8739:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    873e:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    8743:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    874a:	49 8b ff             	mov    %r15,%rdi
    874d:	c5 f8 77             	vzeroupper 
    8750:	e8 4b 28 00 00       	callq  afa0 <plt._aot_jvmci_runtime_new_multi_array>
    8755:	90                   	nop
    8756:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    875d:	00 00 00 00 
    8761:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    8768:	00 00 00 00 
    876c:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    8773:	00 00 00 00 
    8777:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    877c:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    8781:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    8786:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    878b:	49 8b 47 08          	mov    0x8(%r15),%rax
    878f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    8796:	00 
    8797:	48 85 c0             	test   %rax,%rax
    879a:	0f 84 36 00 00 00    	je     87d6 <Stub<new_multi_array(KlassPointer,int,Word)Object>+0xb6>
    87a0:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    87a7:	00 00 00 00 
    87ab:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    87b2:	97 ff ff ff 
    87b6:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    87bd:	00 00 00 00 
    87c1:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    87c8:	00 
    87c9:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    87d0:	e9 bb 27 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    87d5:	90                   	nop
    87d6:	49 8b 87 c0 03 00 00 	mov    0x3c0(%r15),%rax
    87dd:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    87e4:	00 00 00 00 
    87e8:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    87ef:	00 
    87f0:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    87f7:	c3                   	retq   
	...
    8800:	1f                   	(bad)  
	...

0000000000008820 <Stub<dynamic_new_instance(Class)Object>>:
    8820:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    8827:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    882e:	00 
    882f:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    8834:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    8839:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    883e:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    8843:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    884a:	49 8b ff             	mov    %r15,%rdi
    884d:	c5 f8 77             	vzeroupper 
    8850:	e8 53 27 00 00       	callq  afa8 <plt._aot_jvmci_runtime_dynamic_new_instance>
    8855:	90                   	nop
    8856:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    885d:	00 00 00 00 
    8861:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    8868:	00 00 00 00 
    886c:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    8873:	00 00 00 00 
    8877:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    887c:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    8881:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    8886:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    888b:	49 8b 47 08          	mov    0x8(%r15),%rax
    888f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    8896:	00 
    8897:	48 85 c0             	test   %rax,%rax
    889a:	0f 84 36 00 00 00    	je     88d6 <Stub<dynamic_new_instance(Class)Object>+0xb6>
    88a0:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    88a7:	00 00 00 00 
    88ab:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    88b2:	97 ff ff ff 
    88b6:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    88bd:	00 00 00 00 
    88c1:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    88c8:	00 
    88c9:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    88d0:	e9 bb 26 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    88d5:	90                   	nop
    88d6:	49 8b 87 c0 03 00 00 	mov    0x3c0(%r15),%rax
    88dd:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    88e4:	00 00 00 00 
    88e8:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    88ef:	00 
    88f0:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    88f7:	c3                   	retq   
	...
    8900:	20 00                	and    %al,(%rax)
	...

0000000000008920 <Stub<new_instance_or_null(KlassPointer)Object>>:
    8920:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    8927:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    892e:	00 
    892f:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    8934:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    8939:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    893e:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    8943:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    894a:	49 8b ff             	mov    %r15,%rdi
    894d:	c5 f8 77             	vzeroupper 
    8950:	e8 5b 26 00 00       	callq  afb0 <plt._aot_jvmci_runtime_new_instance_or_null>
    8955:	90                   	nop
    8956:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    895d:	00 00 00 00 
    8961:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    8968:	00 00 00 00 
    896c:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    8973:	00 00 00 00 
    8977:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    897c:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    8981:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    8986:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    898b:	49 8b 47 08          	mov    0x8(%r15),%rax
    898f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    8996:	00 
    8997:	48 85 c0             	test   %rax,%rax
    899a:	0f 84 36 00 00 00    	je     89d6 <Stub<new_instance_or_null(KlassPointer)Object>+0xb6>
    89a0:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    89a7:	00 00 00 00 
    89ab:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    89b2:	97 ff ff ff 
    89b6:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    89bd:	00 00 00 00 
    89c1:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    89c8:	00 
    89c9:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    89d0:	e9 bb 25 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    89d5:	90                   	nop
    89d6:	49 8b 87 c0 03 00 00 	mov    0x3c0(%r15),%rax
    89dd:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    89e4:	00 00 00 00 
    89e8:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    89ef:	00 
    89f0:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    89f7:	c3                   	retq   
	...
    8a00:	21 00                	and    %eax,(%rax)
	...

0000000000008a20 <Stub<new_array_or_null(KlassPointer,int)Object>>:
    8a20:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    8a27:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    8a2e:	00 
    8a2f:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    8a34:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    8a39:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    8a3e:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    8a43:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    8a4a:	49 8b ff             	mov    %r15,%rdi
    8a4d:	c5 f8 77             	vzeroupper 
    8a50:	e8 63 25 00 00       	callq  afb8 <plt._aot_jvmci_runtime_new_array_or_null>
    8a55:	90                   	nop
    8a56:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    8a5d:	00 00 00 00 
    8a61:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    8a68:	00 00 00 00 
    8a6c:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    8a73:	00 00 00 00 
    8a77:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    8a7c:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    8a81:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    8a86:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    8a8b:	49 8b 47 08          	mov    0x8(%r15),%rax
    8a8f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    8a96:	00 
    8a97:	48 85 c0             	test   %rax,%rax
    8a9a:	0f 84 36 00 00 00    	je     8ad6 <Stub<new_array_or_null(KlassPointer,int)Object>+0xb6>
    8aa0:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    8aa7:	00 00 00 00 
    8aab:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    8ab2:	97 ff ff ff 
    8ab6:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    8abd:	00 00 00 00 
    8ac1:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    8ac8:	00 
    8ac9:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    8ad0:	e9 bb 24 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    8ad5:	90                   	nop
    8ad6:	49 8b 87 c0 03 00 00 	mov    0x3c0(%r15),%rax
    8add:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    8ae4:	00 00 00 00 
    8ae8:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    8aef:	00 
    8af0:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    8af7:	c3                   	retq   
	...
    8b00:	22 00                	and    (%rax),%al
	...

0000000000008b20 <Stub<new_multi_array_or_null(KlassPointer,int,Word)Object>>:
    8b20:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    8b27:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    8b2e:	00 
    8b2f:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    8b34:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    8b39:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    8b3e:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    8b43:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    8b4a:	49 8b ff             	mov    %r15,%rdi
    8b4d:	c5 f8 77             	vzeroupper 
    8b50:	e8 6b 24 00 00       	callq  afc0 <plt._aot_jvmci_runtime_new_multi_array_or_null>
    8b55:	90                   	nop
    8b56:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    8b5d:	00 00 00 00 
    8b61:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    8b68:	00 00 00 00 
    8b6c:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    8b73:	00 00 00 00 
    8b77:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    8b7c:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    8b81:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    8b86:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    8b8b:	49 8b 47 08          	mov    0x8(%r15),%rax
    8b8f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    8b96:	00 
    8b97:	48 85 c0             	test   %rax,%rax
    8b9a:	0f 84 36 00 00 00    	je     8bd6 <Stub<new_multi_array_or_null(KlassPointer,int,Word)Object>+0xb6>
    8ba0:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    8ba7:	00 00 00 00 
    8bab:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    8bb2:	97 ff ff ff 
    8bb6:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    8bbd:	00 00 00 00 
    8bc1:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    8bc8:	00 
    8bc9:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    8bd0:	e9 bb 23 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    8bd5:	90                   	nop
    8bd6:	49 8b 87 c0 03 00 00 	mov    0x3c0(%r15),%rax
    8bdd:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    8be4:	00 00 00 00 
    8be8:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    8bef:	00 
    8bf0:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    8bf7:	c3                   	retq   
	...
    8c00:	23 00                	and    (%rax),%eax
	...

0000000000008c20 <Stub<dynamic_new_instance_or_null(Class)Object>>:
    8c20:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    8c27:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    8c2e:	00 
    8c2f:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    8c34:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    8c39:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    8c3e:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    8c43:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    8c4a:	49 8b ff             	mov    %r15,%rdi
    8c4d:	c5 f8 77             	vzeroupper 
    8c50:	e8 73 23 00 00       	callq  afc8 <plt._aot_jvmci_runtime_dynamic_new_instance_or_null>
    8c55:	90                   	nop
    8c56:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    8c5d:	00 00 00 00 
    8c61:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    8c68:	00 00 00 00 
    8c6c:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    8c73:	00 00 00 00 
    8c77:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    8c7c:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    8c81:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    8c86:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    8c8b:	49 8b 47 08          	mov    0x8(%r15),%rax
    8c8f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    8c96:	00 
    8c97:	48 85 c0             	test   %rax,%rax
    8c9a:	0f 84 36 00 00 00    	je     8cd6 <Stub<dynamic_new_instance_or_null(Class)Object>+0xb6>
    8ca0:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    8ca7:	00 00 00 00 
    8cab:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    8cb2:	97 ff ff ff 
    8cb6:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    8cbd:	00 00 00 00 
    8cc1:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    8cc8:	00 
    8cc9:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    8cd0:	e9 bb 22 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    8cd5:	90                   	nop
    8cd6:	49 8b 87 c0 03 00 00 	mov    0x3c0(%r15),%rax
    8cdd:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    8ce4:	00 00 00 00 
    8ce8:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    8cef:	00 
    8cf0:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    8cf7:	c3                   	retq   
	...
    8d00:	24 00                	and    $0x0,%al
	...

0000000000008d20 <Stub<UnwindExceptionToCallerStub.unwindExceptionToCaller>>:
    8d20:	48 83 ec 28          	sub    $0x28,%rsp
    8d24:	48 89 6c 24 20       	mov    %rbp,0x20(%rsp)
    8d29:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
    8d2e:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    8d33:	49 8b 8f 60 04 00 00 	mov    0x460(%r15),%rcx
    8d3a:	48 85 c9             	test   %rcx,%rcx
    8d3d:	0f 84 51 00 00 00    	je     8d94 <Stub<UnwindExceptionToCallerStub.unwindExceptionToCaller>+0x74>
    8d43:	4c 8d 05 1e db 00 00 	lea    0xdb1e(%rip),%r8        # 16868 <data.M36.0>
    8d4a:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    8d51:	bf 01 00 00 00       	mov    $0x1,%edi
    8d56:	49 8b f0             	mov    %r8,%rsi
    8d59:	48 8b d1             	mov    %rcx,%rdx
    8d5c:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx
    8d63:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8
    8d6a:	c5 f8 77             	vzeroupper 
    8d6d:	e8 06 22 00 00       	callq  af78 <plt._aot_jvmci_runtime_vm_message>
    8d72:	90                   	nop
    8d73:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    8d7a:	00 00 00 00 
    8d7e:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    8d85:	00 00 00 00 
    8d89:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    8d90:	00 00 00 00 
    8d94:	49 8b 97 68 04 00 00 	mov    0x468(%r15),%rdx
    8d9b:	48 85 d2             	test   %rdx,%rdx
    8d9e:	0f 84 4b 00 00 00    	je     8def <Stub<UnwindExceptionToCallerStub.unwindExceptionToCaller>+0xcf>
    8da4:	48 8d 35 ed da 00 00 	lea    0xdaed(%rip),%rsi        # 16898 <data.M36.48>
    8dab:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    8db2:	bf 01 00 00 00       	mov    $0x1,%edi
    8db7:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx
    8dbe:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8
    8dc5:	c5 f8 77             	vzeroupper 
    8dc8:	e8 ab 21 00 00       	callq  af78 <plt._aot_jvmci_runtime_vm_message>
    8dcd:	90                   	nop
    8dce:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    8dd5:	00 00 00 00 
    8dd9:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    8de0:	00 00 00 00 
    8de4:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    8deb:	00 00 00 00 
    8def:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
    8df4:	48 85 f6             	test   %rsi,%rsi
    8df7:	0f 84 59 00 00 00    	je     8e56 <Stub<UnwindExceptionToCallerStub.unwindExceptionToCaller>+0x136>
    8dfd:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
    8e02:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    8e09:	49 8b ff             	mov    %r15,%rdi
    8e0c:	48 8b f2             	mov    %rdx,%rsi
    8e0f:	c5 f8 77             	vzeroupper 
    8e12:	e8 b9 21 00 00       	callq  afd0 <plt._aot_exception_handler_for_return_address>
    8e17:	90                   	nop
    8e18:	4c 8b d0             	mov    %rax,%r10
    8e1b:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    8e22:	00 00 00 00 
    8e26:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    8e2d:	00 00 00 00 
    8e31:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    8e38:	00 00 00 00 
    8e3c:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    8e41:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
    8e46:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
    8e4b:	48 83 c4 28          	add    $0x28,%rsp
    8e4f:	48 83 c4 08          	add    $0x8,%rsp
    8e53:	41 ff e2             	jmpq   *%r10
    8e56:	48 8d 15 6b da 00 00 	lea    0xda6b(%rip),%rdx        # 168c8 <data.M36.92>
    8e5d:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    8e64:	bf 01 00 00 00       	mov    $0x1,%edi
    8e69:	48 8b f2             	mov    %rdx,%rsi
    8e6c:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
    8e73:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx
    8e7a:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8
    8e81:	c5 f8 77             	vzeroupper 
    8e84:	e8 ef 20 00 00       	callq  af78 <plt._aot_jvmci_runtime_vm_message>
    8e89:	90                   	nop
    8e8a:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    8e91:	00 00 00 00 
    8e95:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    8e9c:	00 00 00 00 
    8ea0:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    8ea7:	00 00 00 00 
    8eab:	e9 4d ff ff ff       	jmpq   8dfd <Stub<UnwindExceptionToCallerStub.unwindExceptionToCaller>+0xdd>
	...
    8f00:	25 00 00 00 00       	and    $0x0,%eax
	...

0000000000008f20 <Stub<VerifyOopStub.verifyOop>>:
    8f20:	48 8b c6             	mov    %rsi,%rax
    8f23:	c3                   	retq   
	...
    8f80:	26 00 00             	add    %al,%es:(%rax)
	...

0000000000008fa0 <Stub<ArrayStoreExceptionStub.createArrayStoreException>>:
    8fa0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    8fa7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    8fae:	00 
    8faf:	8b 7e 08             	mov    0x8(%rsi),%edi
    8fb2:	48 8d 35 2f d9 00 00 	lea    0xd92f(%rip),%rsi        # 168e8 <data.M38.0>
    8fb9:	48 8b 15 f0 e0 20 00 	mov    0x20e0f0(%rip),%rdx        # 2170b0 <_aot_narrow_klass_base_address>
    8fc0:	4c 8d 14 fa          	lea    (%rdx,%rdi,8),%r10
    8fc4:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    8fc9:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    8fce:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    8fd3:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    8fd8:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    8fdf:	49 8b ff             	mov    %r15,%rdi
    8fe2:	49 8b d2             	mov    %r10,%rdx
    8fe5:	c5 f8 77             	vzeroupper 
    8fe8:	e8 eb 1f 00 00       	callq  afd8 <plt._aot_jvmci_runtime_throw_klass_external_name_exception>
    8fed:	90                   	nop
    8fee:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    8ff5:	00 00 00 00 
    8ff9:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    9000:	00 00 00 00 
    9004:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    900b:	00 00 00 00 
    900f:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    9014:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    9019:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    901e:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    9023:	49 8b 47 08          	mov    0x8(%r15),%rax
    9027:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    902e:	00 
    902f:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    9036:	00 
    9037:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    903e:	c3                   	retq   
	...
    907f:	00 27                	add    %ah,(%rdi)
	...

00000000000090a0 <Stub<ClassCastExceptionStub.createClassCastException>>:
    90a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    90a7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    90ae:	00 
    90af:	48 8b ca             	mov    %rdx,%rcx
    90b2:	8b 7e 08             	mov    0x8(%rsi),%edi
    90b5:	48 8d 35 4c d8 00 00 	lea    0xd84c(%rip),%rsi        # 16908 <data.M39.0>
    90bc:	48 8b 15 ed df 20 00 	mov    0x20dfed(%rip),%rdx        # 2170b0 <_aot_narrow_klass_base_address>
    90c3:	4c 8d 14 fa          	lea    (%rdx,%rdi,8),%r10
    90c7:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    90cc:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    90d1:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    90d6:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    90db:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    90e2:	49 8b ff             	mov    %r15,%rdi
    90e5:	49 8b d2             	mov    %r10,%rdx
    90e8:	c5 f8 77             	vzeroupper 
    90eb:	e8 f0 1e 00 00       	callq  afe0 <plt._aot_jvmci_runtime_throw_class_cast_exception>
    90f0:	90                   	nop
    90f1:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    90f8:	00 00 00 00 
    90fc:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    9103:	00 00 00 00 
    9107:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    910e:	00 00 00 00 
    9112:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    9117:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    911c:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    9121:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    9126:	49 8b 47 08          	mov    0x8(%r15),%rax
    912a:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    9131:	00 
    9132:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    9139:	00 
    913a:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9141:	c3                   	retq   
	...
    917e:	00 00                	add    %al,(%rax)
    9180:	28 00                	sub    %al,(%rax)
	...

00000000000091a0 <Stub<NullPointerExceptionStub.createNullPointerException>>:
    91a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    91a7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    91ae:	00 
    91af:	48 8d 35 72 d7 00 00 	lea    0xd772(%rip),%rsi        # 16928 <data.M40.0>
    91b6:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    91bb:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    91c0:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    91c5:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    91ca:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    91d1:	49 8b ff             	mov    %r15,%rdi
    91d4:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
    91db:	c5 f8 77             	vzeroupper 
    91de:	e8 05 1e 00 00       	callq  afe8 <plt._aot_jvmci_runtime_throw_and_post_jvmti_exception>
    91e3:	90                   	nop
    91e4:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    91eb:	00 00 00 00 
    91ef:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    91f6:	00 00 00 00 
    91fa:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    9201:	00 00 00 00 
    9205:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    920a:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    920f:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    9214:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    9219:	49 8b 47 08          	mov    0x8(%r15),%rax
    921d:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    9224:	00 
    9225:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    922c:	00 
    922d:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9234:	c3                   	retq   
	...
    927d:	00 00                	add    %al,(%rax)
    927f:	00 29                	add    %ch,(%rcx)
	...

00000000000092a0 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>>:
    92a0:	48 81 ec 38 01 00 00 	sub    $0x138,%rsp
    92a7:	48 89 ac 24 30 01 00 	mov    %rbp,0x130(%rsp)
    92ae:	00 
    92af:	8b fa                	mov    %edx,%edi
    92b1:	4c 8d 94 24 f0 00 00 	lea    0xf0(%rsp),%r10
    92b8:	00 
    92b9:	48 8d 05 88 d6 00 00 	lea    0xd688(%rip),%rax        # 16948 <data.M41.0>
    92c0:	ba 00 00 00 00       	mov    $0x0,%edx
    92c5:	e9 0c 00 00 00       	jmpq   92d6 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x36>
    92ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    92d0:	47 88 04 1a          	mov    %r8b,(%r10,%r11,1)
    92d4:	ff c2                	inc    %edx
    92d6:	4c 63 da             	movslq %edx,%r11
    92d9:	46 0f be 04 18       	movsbl (%rax,%r11,1),%r8d
    92de:	45 85 c0             	test   %r8d,%r8d
    92e1:	75 ed                	jne    92d0 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x30>
    92e3:	48 63 f6             	movslq %esi,%rsi
    92e6:	4c 8b c6             	mov    %rsi,%r8
    92e9:	49 f7 d8             	neg    %r8
    92ec:	48 83 fe 01          	cmp    $0x1,%rsi
    92f0:	0f 8c fb 01 00 00    	jl     94f1 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x251>
    92f6:	ba 00 00 00 00       	mov    $0x0,%edx
    92fb:	48 8b c6             	mov    %rsi,%rax
    92fe:	49 b9 67 66 66 66 66 	movabs $0x6666666666666667,%r9
    9305:	66 66 66 
    9308:	e9 13 00 00 00       	jmpq   9320 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x80>
    930d:	66 66 90             	data16 xchg %ax,%ax
    9310:	8b ca                	mov    %edx,%ecx
    9312:	ff c1                	inc    %ecx
    9314:	49 f7 e9             	imul   %r9
    9317:	48 c1 ea 02          	shr    $0x2,%rdx
    931b:	48 8b c2             	mov    %rdx,%rax
    931e:	8b d1                	mov    %ecx,%edx
    9320:	48 83 f8 01          	cmp    $0x1,%rax
    9324:	7d ea                	jge    9310 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x70>
    9326:	48 85 f6             	test   %rsi,%rsi
    9329:	0f 8c 03 00 00 00    	jl     9332 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x92>
    932f:	4c 8b c6             	mov    %rsi,%r8
    9332:	49 8b c2             	mov    %r10,%rax
    9335:	49 03 c3             	add    %r11,%rax
    9338:	48 63 d2             	movslq %edx,%rdx
    933b:	4c 8b d8             	mov    %rax,%r11
    933e:	4c 03 da             	add    %rdx,%r11
    9341:	49 8b cb             	mov    %r11,%rcx
    9344:	e9 0d 00 00 00       	jmpq   9356 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0xb6>
    9349:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    9350:	48 ff c9             	dec    %rcx
    9353:	4c 8b c2             	mov    %rdx,%r8
    9356:	49 8b c0             	mov    %r8,%rax
    9359:	49 f7 e9             	imul   %r9
    935c:	48 c1 fa 02          	sar    $0x2,%rdx
    9360:	49 8b c0             	mov    %r8,%rax
    9363:	48 c1 e8 3f          	shr    $0x3f,%rax
    9367:	48 03 d0             	add    %rax,%rdx
    936a:	48 8b c2             	mov    %rdx,%rax
    936d:	48 c1 e0 03          	shl    $0x3,%rax
    9371:	48 8b da             	mov    %rdx,%rbx
    9374:	48 d1 e3             	shl    %rbx
    9377:	48 03 c3             	add    %rbx,%rax
    937a:	4c 2b c0             	sub    %rax,%r8
    937d:	49 8d 40 30          	lea    0x30(%r8),%rax
    9381:	88 41 ff             	mov    %al,-0x1(%rcx)
    9384:	48 83 fa 01          	cmp    $0x1,%rdx
    9388:	7d c6                	jge    9350 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0xb0>
    938a:	48 85 f6             	test   %rsi,%rsi
    938d:	0f 8c 74 01 00 00    	jl     9507 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x267>
    9393:	48 8d 05 b6 d5 00 00 	lea    0xd5b6(%rip),%rax        # 16950 <data.M41.7>
    939a:	ba 00 00 00 00       	mov    $0x0,%edx
    939f:	e9 12 00 00 00       	jmpq   93b6 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x116>
    93a4:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    93aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    93b0:	45 88 04 33          	mov    %r8b,(%r11,%rsi,1)
    93b4:	ff c2                	inc    %edx
    93b6:	48 63 f2             	movslq %edx,%rsi
    93b9:	44 0f be 04 30       	movsbl (%rax,%rsi,1),%r8d
    93be:	45 85 c0             	test   %r8d,%r8d
    93c1:	75 ed                	jne    93b0 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x110>
    93c3:	48 63 ff             	movslq %edi,%rdi
    93c6:	4c 8b c7             	mov    %rdi,%r8
    93c9:	49 f7 d8             	neg    %r8
    93cc:	48 83 ff 01          	cmp    $0x1,%rdi
    93d0:	0f 8c 3a 01 00 00    	jl     9510 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x270>
    93d6:	ba 00 00 00 00       	mov    $0x0,%edx
    93db:	48 8b c7             	mov    %rdi,%rax
    93de:	e9 1d 00 00 00       	jmpq   9400 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x160>
    93e3:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    93ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    93f0:	8b ca                	mov    %edx,%ecx
    93f2:	ff c1                	inc    %ecx
    93f4:	49 f7 e9             	imul   %r9
    93f7:	48 c1 ea 02          	shr    $0x2,%rdx
    93fb:	48 8b c2             	mov    %rdx,%rax
    93fe:	8b d1                	mov    %ecx,%edx
    9400:	48 83 f8 01          	cmp    $0x1,%rax
    9404:	7d ea                	jge    93f0 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x150>
    9406:	48 85 ff             	test   %rdi,%rdi
    9409:	0f 8c 03 00 00 00    	jl     9412 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x172>
    940f:	4c 8b c7             	mov    %rdi,%r8
    9412:	4c 03 de             	add    %rsi,%r11
    9415:	48 63 f2             	movslq %edx,%rsi
    9418:	49 8b c3             	mov    %r11,%rax
    941b:	48 03 c6             	add    %rsi,%rax
    941e:	48 8b c8             	mov    %rax,%rcx
    9421:	e9 10 00 00 00       	jmpq   9436 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x196>
    9426:	66 66 0f 1f 84 00 00 	data16 nopw 0x0(%rax,%rax,1)
    942d:	00 00 00 
    9430:	48 ff c9             	dec    %rcx
    9433:	4c 8b c2             	mov    %rdx,%r8
    9436:	49 8b c0             	mov    %r8,%rax
    9439:	49 f7 e9             	imul   %r9
    943c:	48 c1 fa 02          	sar    $0x2,%rdx
    9440:	49 8b d8             	mov    %r8,%rbx
    9443:	48 c1 eb 3f          	shr    $0x3f,%rbx
    9447:	48 03 d3             	add    %rbx,%rdx
    944a:	48 8b da             	mov    %rdx,%rbx
    944d:	48 c1 e3 03          	shl    $0x3,%rbx
    9451:	48 8b c2             	mov    %rdx,%rax
    9454:	48 d1 e0             	shl    %rax
    9457:	48 03 d8             	add    %rax,%rbx
    945a:	4c 2b c3             	sub    %rbx,%r8
    945d:	4d 8d 40 30          	lea    0x30(%r8),%r8
    9461:	44 88 41 ff          	mov    %r8b,-0x1(%rcx)
    9465:	48 83 fa 01          	cmp    $0x1,%rdx
    9469:	7d c5                	jge    9430 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x190>
    946b:	48 85 ff             	test   %rdi,%rdi
    946e:	0f 8c 8a 00 00 00    	jl     94fe <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x25e>
    9474:	41 c6 04 33 00       	movb   $0x0,(%r11,%rsi,1)
    9479:	48 8d 35 f0 d4 00 00 	lea    0xd4f0(%rip),%rsi        # 16970 <data.M41.34>
    9480:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
    9485:	4c 89 6c 24 60       	mov    %r13,0x60(%rsp)
    948a:	4c 89 74 24 68       	mov    %r14,0x68(%rsp)
    948f:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    9496:	49 8b ff             	mov    %r15,%rdi
    9499:	49 8b d2             	mov    %r10,%rdx
    949c:	c5 f8 77             	vzeroupper 
    949f:	e8 44 1b 00 00       	callq  afe8 <plt._aot_jvmci_runtime_throw_and_post_jvmti_exception>
    94a4:	90                   	nop
    94a5:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    94ac:	00 00 00 00 
    94b0:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    94b7:	00 00 00 00 
    94bb:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    94c2:	00 00 00 00 
    94c6:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
    94cb:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
    94d0:	4c 8b 74 24 68       	mov    0x68(%rsp),%r14
    94d5:	49 8b 47 08          	mov    0x8(%r15),%rax
    94d9:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    94e0:	00 
    94e1:	48 8b ac 24 30 01 00 	mov    0x130(%rsp),%rbp
    94e8:	00 
    94e9:	48 81 c4 38 01 00 00 	add    $0x138,%rsp
    94f0:	c3                   	retq   
    94f1:	ba 01 00 00 00       	mov    $0x1,%edx
    94f6:	49 8b c0             	mov    %r8,%rax
    94f9:	e9 00 fe ff ff       	jmpq   92fe <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x5e>
    94fe:	c6 41 fe 2d          	movb   $0x2d,-0x2(%rcx)
    9502:	e9 6d ff ff ff       	jmpq   9474 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x1d4>
    9507:	c6 41 fe 2d          	movb   $0x2d,-0x2(%rcx)
    950b:	e9 83 fe ff ff       	jmpq   9393 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0xf3>
    9510:	ba 01 00 00 00       	mov    $0x1,%edx
    9515:	49 8b c0             	mov    %r8,%rax
    9518:	e9 e3 fe ff ff       	jmpq   9400 <Stub<OutOfBoundsExceptionStub.createOutOfBoundsException>+0x160>
	...
    957d:	00 00                	add    %al,(%rax)
    957f:	00 2a                	add    %ch,(%rdx)
	...

00000000000095a0 <Stub<DivisionByZeroExceptionStub.createDivisionByZeroException>>:
    95a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    95a7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    95ae:	00 
    95af:	48 8d 35 ea d3 00 00 	lea    0xd3ea(%rip),%rsi        # 169a0 <data.M42.0>
    95b6:	48 8d 15 03 d4 00 00 	lea    0xd403(%rip),%rdx        # 169c0 <data.M42.30>
    95bd:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    95c2:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    95c7:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    95cc:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    95d1:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    95d8:	49 8b ff             	mov    %r15,%rdi
    95db:	c5 f8 77             	vzeroupper 
    95de:	e8 05 1a 00 00       	callq  afe8 <plt._aot_jvmci_runtime_throw_and_post_jvmti_exception>
    95e3:	90                   	nop
    95e4:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    95eb:	00 00 00 00 
    95ef:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    95f6:	00 00 00 00 
    95fa:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    9601:	00 00 00 00 
    9605:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    960a:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    960f:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    9614:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    9619:	49 8b 47 08          	mov    0x8(%r15),%rax
    961d:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    9624:	00 
    9625:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    962c:	00 
    962d:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9634:	c3                   	retq   
	...
    967d:	00 00                	add    %al,(%rax)
    967f:	00 2b                	add    %ch,(%rbx)
	...

00000000000096a0 <Stub<IntegerExactOverflowExceptionStub.createIntegerExactOverflowException>>:
    96a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    96a7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    96ae:	00 
    96af:	48 8d 35 1a d3 00 00 	lea    0xd31a(%rip),%rsi        # 169d0 <data.M43.0>
    96b6:	48 8d 15 33 d3 00 00 	lea    0xd333(%rip),%rdx        # 169f0 <data.M43.30>
    96bd:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    96c2:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    96c7:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    96cc:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    96d1:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    96d8:	49 8b ff             	mov    %r15,%rdi
    96db:	c5 f8 77             	vzeroupper 
    96de:	e8 05 19 00 00       	callq  afe8 <plt._aot_jvmci_runtime_throw_and_post_jvmti_exception>
    96e3:	90                   	nop
    96e4:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    96eb:	00 00 00 00 
    96ef:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    96f6:	00 00 00 00 
    96fa:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    9701:	00 00 00 00 
    9705:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    970a:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    970f:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    9714:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    9719:	49 8b 47 08          	mov    0x8(%r15),%rax
    971d:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    9724:	00 
    9725:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    972c:	00 
    972d:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9734:	c3                   	retq   
	...
    977d:	00 00                	add    %al,(%rax)
    977f:	00 2c 00             	add    %ch,(%rax,%rax,1)
	...

00000000000097a0 <Stub<LongExactOverflowExceptionStub.createLongExactOverflowException>>:
    97a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    97a7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    97ae:	00 
    97af:	48 8d 35 52 d2 00 00 	lea    0xd252(%rip),%rsi        # 16a08 <data.M44.0>
    97b6:	48 8d 15 6b d2 00 00 	lea    0xd26b(%rip),%rdx        # 16a28 <data.M44.30>
    97bd:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    97c2:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    97c7:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    97cc:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    97d1:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    97d8:	49 8b ff             	mov    %r15,%rdi
    97db:	c5 f8 77             	vzeroupper 
    97de:	e8 05 18 00 00       	callq  afe8 <plt._aot_jvmci_runtime_throw_and_post_jvmti_exception>
    97e3:	90                   	nop
    97e4:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    97eb:	00 00 00 00 
    97ef:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    97f6:	00 00 00 00 
    97fa:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    9801:	00 00 00 00 
    9805:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    980a:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    980f:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    9814:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    9819:	49 8b 47 08          	mov    0x8(%r15),%rax
    981d:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    9824:	00 
    9825:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    982c:	00 
    982d:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9834:	c3                   	retq   
	...
    987d:	00 00                	add    %al,(%rax)
    987f:	00 2d 00 00 00 00    	add    %ch,0x0(%rip)        # 9885 <Stub<LongExactOverflowExceptionStub.createLongExactOverflowException>+0xe5>
	...

00000000000098a0 <Stub<identity_hashcode(Object)int>>:
    98a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    98a7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    98ae:	00 
    98af:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    98b4:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    98b9:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    98be:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    98c3:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    98ca:	49 8b ff             	mov    %r15,%rdi
    98cd:	c5 f8 77             	vzeroupper 
    98d0:	e8 1b 17 00 00       	callq  aff0 <plt._aot_jvmci_runtime_identity_hash_code>
    98d5:	90                   	nop
    98d6:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    98dd:	00 00 00 00 
    98e1:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    98e8:	00 00 00 00 
    98ec:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    98f3:	00 00 00 00 
    98f7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    98fc:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    9901:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    9906:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    990b:	4d 8b 57 08          	mov    0x8(%r15),%r10
    990f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    9916:	00 
    9917:	4d 85 d2             	test   %r10,%r10
    991a:	0f 84 2b 00 00 00    	je     994b <Stub<identity_hashcode(Object)int>+0xab>
    9920:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    9927:	97 ff ff ff 
    992b:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    9932:	00 00 00 00 
    9936:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    993d:	00 
    993e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9945:	e9 46 16 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    994a:	90                   	nop
    994b:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    9952:	00 
    9953:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    995a:	c3                   	retq   
	...
    997f:	00 2e                	add    %ch,(%rsi)
	...

00000000000099a0 <Stub<registerFinalizer(Object)void>>:
    99a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    99a7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    99ae:	00 
    99af:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    99b4:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    99b9:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    99be:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    99c3:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    99ca:	49 8b ff             	mov    %r15,%rdi
    99cd:	c5 f8 77             	vzeroupper 
    99d0:	e8 23 16 00 00       	callq  aff8 <plt._aot_register_finalizer>
    99d5:	90                   	nop
    99d6:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    99dd:	00 00 00 00 
    99e1:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    99e8:	00 00 00 00 
    99ec:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    99f3:	00 00 00 00 
    99f7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    99fc:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    9a01:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    9a06:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    9a0b:	4d 8b 57 08          	mov    0x8(%r15),%r10
    9a0f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    9a16:	00 
    9a17:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    9a1e:	00 00 00 00 
    9a22:	4d 85 d2             	test   %r10,%r10
    9a25:	0f 84 2b 00 00 00    	je     9a56 <Stub<registerFinalizer(Object)void>+0xb6>
    9a2b:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    9a32:	97 ff ff ff 
    9a36:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    9a3d:	00 00 00 00 
    9a41:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    9a48:	00 
    9a49:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9a50:	e9 3b 15 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    9a55:	90                   	nop
    9a56:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    9a5d:	00 
    9a5e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9a65:	c3                   	retq   
	...
    9a7e:	00 00                	add    %al,(%rax)
    9a80:	2f                   	(bad)  
	...

0000000000009aa0 <Stub<monitorenter(Object,Word)void>>:
    9aa0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    9aa7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    9aae:	00 
    9aaf:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    9ab4:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    9ab9:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    9abe:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    9ac3:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    9aca:	49 8b ff             	mov    %r15,%rdi
    9acd:	c5 f8 77             	vzeroupper 
    9ad0:	e8 2b 15 00 00       	callq  b000 <plt._aot_jvmci_runtime_monitorenter>
    9ad5:	90                   	nop
    9ad6:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    9add:	00 00 00 00 
    9ae1:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    9ae8:	00 00 00 00 
    9aec:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    9af3:	00 00 00 00 
    9af7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    9afc:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    9b01:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    9b06:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    9b0b:	4d 8b 57 08          	mov    0x8(%r15),%r10
    9b0f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    9b16:	00 
    9b17:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    9b1e:	00 00 00 00 
    9b22:	4d 85 d2             	test   %r10,%r10
    9b25:	0f 84 2b 00 00 00    	je     9b56 <Stub<monitorenter(Object,Word)void>+0xb6>
    9b2b:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    9b32:	97 ff ff ff 
    9b36:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    9b3d:	00 00 00 00 
    9b41:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    9b48:	00 
    9b49:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9b50:	e9 3b 14 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    9b55:	90                   	nop
    9b56:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    9b5d:	00 
    9b5e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9b65:	c3                   	retq   
	...
    9b7e:	00 00                	add    %al,(%rax)
    9b80:	30 00                	xor    %al,(%rax)
	...

0000000000009ba0 <Stub<monitorexit(Object,Word)void>>:
    9ba0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    9ba7:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
    9bac:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
    9bb1:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
    9bb6:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    9bbd:	49 8b ff             	mov    %r15,%rdi
    9bc0:	c5 f8 77             	vzeroupper 
    9bc3:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    9bc8:	e8 3b 14 00 00       	callq  b008 <plt._aot_jvmci_runtime_monitorexit>
    9bcd:	90                   	nop
    9bce:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    9bd5:	00 00 00 00 
    9bd9:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    9be0:	00 00 00 00 
    9be4:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    9beb:	00 00 00 00 
    9bef:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
    9bf4:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
    9bf9:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
    9bfe:	4d 8b 57 08          	mov    0x8(%r15),%r10
    9c02:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    9c09:	00 
    9c0a:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    9c11:	00 00 00 00 
    9c15:	4d 85 d2             	test   %r10,%r10
    9c18:	0f 84 28 00 00 00    	je     9c46 <Stub<monitorexit(Object,Word)void>+0xa6>
    9c1e:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    9c25:	97 ff ff ff 
    9c29:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    9c30:	00 00 00 00 
    9c34:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    9c39:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9c40:	e9 4b 13 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    9c45:	90                   	nop
    9c46:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    9c4b:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9c52:	c3                   	retq   
	...
    9c7f:	00 31                	add    %dh,(%rcx)
	...

0000000000009ca0 <Stub<object_notify(Object)boolean>>:
    9ca0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    9ca7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    9cae:	00 
    9caf:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    9cb4:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    9cb9:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    9cbe:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    9cc3:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    9cca:	49 8b ff             	mov    %r15,%rdi
    9ccd:	c5 f8 77             	vzeroupper 
    9cd0:	e8 3b 13 00 00       	callq  b010 <plt._aot_object_notify>
    9cd5:	90                   	nop
    9cd6:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    9cdd:	00 00 00 00 
    9ce1:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    9ce8:	00 00 00 00 
    9cec:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    9cf3:	00 00 00 00 
    9cf7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    9cfc:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    9d01:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    9d06:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    9d0b:	4d 8b 57 08          	mov    0x8(%r15),%r10
    9d0f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    9d16:	00 
    9d17:	4d 85 d2             	test   %r10,%r10
    9d1a:	0f 84 2b 00 00 00    	je     9d4b <Stub<object_notify(Object)boolean>+0xab>
    9d20:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    9d27:	97 ff ff ff 
    9d2b:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    9d32:	00 00 00 00 
    9d36:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    9d3d:	00 
    9d3e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9d45:	e9 46 12 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    9d4a:	90                   	nop
    9d4b:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    9d52:	00 
    9d53:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9d5a:	c3                   	retq   
	...
    9d7f:	00 32                	add    %dh,(%rdx)
	...

0000000000009da0 <Stub<object_notifyAll(Object)boolean>>:
    9da0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    9da7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    9dae:	00 
    9daf:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    9db4:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    9db9:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    9dbe:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    9dc3:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    9dca:	49 8b ff             	mov    %r15,%rdi
    9dcd:	c5 f8 77             	vzeroupper 
    9dd0:	e8 43 12 00 00       	callq  b018 <plt._aot_object_notifyAll>
    9dd5:	90                   	nop
    9dd6:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    9ddd:	00 00 00 00 
    9de1:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    9de8:	00 00 00 00 
    9dec:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    9df3:	00 00 00 00 
    9df7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    9dfc:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    9e01:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    9e06:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    9e0b:	4d 8b 57 08          	mov    0x8(%r15),%r10
    9e0f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    9e16:	00 
    9e17:	4d 85 d2             	test   %r10,%r10
    9e1a:	0f 84 2b 00 00 00    	je     9e4b <Stub<object_notifyAll(Object)boolean>+0xab>
    9e20:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    9e27:	97 ff ff ff 
    9e2b:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    9e32:	00 00 00 00 
    9e36:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    9e3d:	00 
    9e3e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9e45:	e9 46 11 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    9e4a:	90                   	nop
    9e4b:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    9e52:	00 
    9e53:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9e5a:	c3                   	retq   
	...
    9e7f:	00 33                	add    %dh,(%rbx)
	...

0000000000009ea0 <Stub<logPrintf(Word,long,long,long)void>>:
    9ea0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    9ea7:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
    9eac:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
    9eb1:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
    9eb6:	49 8b ff             	mov    %r15,%rdi
    9eb9:	c5 f8 77             	vzeroupper 
    9ebc:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    9ec1:	e8 5a 11 00 00       	callq  b020 <plt._aot_jvmci_runtime_log_printf>
    9ec6:	90                   	nop
    9ec7:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
    9ecc:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
    9ed1:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
    9ed6:	4d 8b 57 08          	mov    0x8(%r15),%r10
    9eda:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    9ee1:	00 
    9ee2:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    9ee9:	00 00 00 00 
    9eed:	4d 85 d2             	test   %r10,%r10
    9ef0:	0f 84 28 00 00 00    	je     9f1e <Stub<logPrintf(Word,long,long,long)void>+0x7e>
    9ef6:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    9efd:	97 ff ff ff 
    9f01:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    9f08:	00 00 00 00 
    9f0c:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    9f11:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9f18:	e9 73 10 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    9f1d:	90                   	nop
    9f1e:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    9f23:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    9f2a:	c3                   	retq   
	...
    9f7f:	00 34 00             	add    %dh,(%rax,%rax,1)
	...

0000000000009fa0 <Stub<logObject(Object,boolean,boolean)void>>:
    9fa0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    9fa7:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
    9fac:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
    9fb1:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
    9fb6:	49 8b ff             	mov    %r15,%rdi
    9fb9:	c5 f8 77             	vzeroupper 
    9fbc:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    9fc1:	e8 62 10 00 00       	callq  b028 <plt._aot_jvmci_runtime_log_object>
    9fc6:	90                   	nop
    9fc7:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
    9fcc:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
    9fd1:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
    9fd6:	4d 8b 57 08          	mov    0x8(%r15),%r10
    9fda:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    9fe1:	00 
    9fe2:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    9fe9:	00 00 00 00 
    9fed:	4d 85 d2             	test   %r10,%r10
    9ff0:	0f 84 28 00 00 00    	je     a01e <Stub<logObject(Object,boolean,boolean)void>+0x7e>
    9ff6:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    9ffd:	97 ff ff ff 
    a001:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    a008:	00 00 00 00 
    a00c:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    a011:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a018:	e9 73 0f 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    a01d:	90                   	nop
    a01e:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    a023:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a02a:	c3                   	retq   
	...
    a07f:	00 35 00 00 00 00    	add    %dh,0x0(%rip)        # a085 <Stub<logObject(Object,boolean,boolean)void>+0xe5>
	...

000000000000a0a0 <Stub<logPrimitive(int,long,boolean)void>>:
    a0a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    a0a7:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
    a0ac:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
    a0b1:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
    a0b6:	49 8b ff             	mov    %r15,%rdi
    a0b9:	c5 f8 77             	vzeroupper 
    a0bc:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    a0c1:	e8 6a 0f 00 00       	callq  b030 <plt._aot_jvmci_runtime_log_primitive>
    a0c6:	90                   	nop
    a0c7:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
    a0cc:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
    a0d1:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
    a0d6:	4d 8b 57 08          	mov    0x8(%r15),%r10
    a0da:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    a0e1:	00 
    a0e2:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    a0e9:	00 00 00 00 
    a0ed:	4d 85 d2             	test   %r10,%r10
    a0f0:	0f 84 28 00 00 00    	je     a11e <Stub<logPrimitive(int,long,boolean)void>+0x7e>
    a0f6:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    a0fd:	97 ff ff ff 
    a101:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    a108:	00 00 00 00 
    a10c:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    a111:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a118:	e9 73 0e 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    a11d:	90                   	nop
    a11e:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    a123:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a12a:	c3                   	retq   
	...
    a17f:	00 36                	add    %dh,(%rsi)
	...

000000000000a1a0 <Stub<vm_error(Object,Object,long)void>>:
    a1a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    a1a7:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
    a1ac:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
    a1b1:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
    a1b6:	49 8b ff             	mov    %r15,%rdi
    a1b9:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    a1be:	e8 75 0e 00 00       	callq  b038 <plt._aot_jvmci_runtime_vm_error>
    a1c3:	90                   	nop
    a1c4:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
    a1c9:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
    a1ce:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
    a1d3:	4d 8b 57 08          	mov    0x8(%r15),%r10
    a1d7:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    a1de:	00 
    a1df:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    a1e6:	00 00 00 00 
    a1ea:	4d 85 d2             	test   %r10,%r10
    a1ed:	0f 84 28 00 00 00    	je     a21b <Stub<vm_error(Object,Object,long)void>+0x7b>
    a1f3:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    a1fa:	97 ff ff ff 
    a1fe:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    a205:	00 00 00 00 
    a209:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    a20e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a215:	e9 76 0d 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    a21a:	90                   	nop
    a21b:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    a220:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a227:	c3                   	retq   
	...
    a280:	37                   	(bad)  
	...

000000000000a2a0 <Stub<OSR_migration_end(long)void>>:
    a2a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    a2a7:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
    a2ac:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
    a2b1:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
    a2b6:	48 8b fe             	mov    %rsi,%rdi
    a2b9:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    a2be:	e8 7d 0d 00 00       	callq  b040 <plt._aot_OSR_migration_end>
    a2c3:	90                   	nop
    a2c4:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
    a2c9:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
    a2ce:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
    a2d3:	4d 8b 57 08          	mov    0x8(%r15),%r10
    a2d7:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    a2de:	00 
    a2df:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    a2e6:	00 00 00 00 
    a2ea:	4d 85 d2             	test   %r10,%r10
    a2ed:	0f 84 28 00 00 00    	je     a31b <Stub<OSR_migration_end(long)void>+0x7b>
    a2f3:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    a2fa:	97 ff ff ff 
    a2fe:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    a305:	00 00 00 00 
    a309:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    a30e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a315:	e9 76 0c 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    a31a:	90                   	nop
    a31b:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    a320:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a327:	c3                   	retq   
	...
    a380:	38 00                	cmp    %al,(%rax)
	...

000000000000a3a0 <Stub<write_barrier_pre(Object)void>>:
    a3a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    a3a7:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
    a3ac:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
    a3b1:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
    a3b6:	49 8b ff             	mov    %r15,%rdi
    a3b9:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    a3be:	e8 85 0c 00 00       	callq  b048 <plt._aot_jvmci_runtime_write_barrier_pre>
    a3c3:	90                   	nop
    a3c4:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
    a3c9:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
    a3ce:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
    a3d3:	4d 8b 57 08          	mov    0x8(%r15),%r10
    a3d7:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    a3de:	00 
    a3df:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    a3e6:	00 00 00 00 
    a3ea:	4d 85 d2             	test   %r10,%r10
    a3ed:	0f 84 28 00 00 00    	je     a41b <Stub<write_barrier_pre(Object)void>+0x7b>
    a3f3:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    a3fa:	97 ff ff ff 
    a3fe:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    a405:	00 00 00 00 
    a409:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    a40e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a415:	e9 76 0b 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    a41a:	90                   	nop
    a41b:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    a420:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a427:	c3                   	retq   
	...
    a480:	39 00                	cmp    %eax,(%rax)
	...

000000000000a4a0 <Stub<write_barrier_post(Word)void>>:
    a4a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    a4a7:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
    a4ac:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
    a4b1:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
    a4b6:	49 8b ff             	mov    %r15,%rdi
    a4b9:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    a4be:	e8 8d 0b 00 00       	callq  b050 <plt._aot_jvmci_runtime_write_barrier_post>
    a4c3:	90                   	nop
    a4c4:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
    a4c9:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
    a4ce:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
    a4d3:	4d 8b 57 08          	mov    0x8(%r15),%r10
    a4d7:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    a4de:	00 
    a4df:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    a4e6:	00 00 00 00 
    a4ea:	4d 85 d2             	test   %r10,%r10
    a4ed:	0f 84 28 00 00 00    	je     a51b <Stub<write_barrier_post(Word)void>+0x7b>
    a4f3:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    a4fa:	97 ff ff ff 
    a4fe:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    a505:	00 00 00 00 
    a509:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    a50e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a515:	e9 76 0a 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    a51a:	90                   	nop
    a51b:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    a520:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a527:	c3                   	retq   
	...
    a580:	3a 00                	cmp    (%rax),%al
	...

000000000000a5a0 <Stub<validate_object(Word,Word)boolean>>:
    a5a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    a5a7:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
    a5ac:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
    a5b1:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
    a5b6:	49 8b ff             	mov    %r15,%rdi
    a5b9:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    a5be:	e8 95 0a 00 00       	callq  b058 <plt._aot_jvmci_runtime_validate_object>
    a5c3:	90                   	nop
    a5c4:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
    a5c9:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
    a5ce:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
    a5d3:	4d 8b 57 08          	mov    0x8(%r15),%r10
    a5d7:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    a5de:	00 
    a5df:	4d 85 d2             	test   %r10,%r10
    a5e2:	0f 84 28 00 00 00    	je     a610 <Stub<validate_object(Word,Word)boolean>+0x70>
    a5e8:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    a5ef:	97 ff ff ff 
    a5f3:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    a5fa:	00 00 00 00 
    a5fe:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    a603:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a60a:	e9 81 09 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    a60f:	90                   	nop
    a610:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    a615:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a61c:	c3                   	retq   
	...
    a67d:	00 00                	add    %al,(%rax)
    a67f:	00 3b                	add    %bh,(%rbx)
	...

000000000000a6a0 <Stub<resolve_string_by_symbol(Word,Word)Object>>:
    a6a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    a6a7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    a6ae:	00 
    a6af:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    a6b4:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    a6b9:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    a6be:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    a6c3:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    a6ca:	49 8b ff             	mov    %r15,%rdi
    a6cd:	c5 f8 77             	vzeroupper 
    a6d0:	e8 8b 09 00 00       	callq  b060 <plt._aot_resolve_string_by_symbol>
    a6d5:	90                   	nop
    a6d6:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    a6dd:	00 00 00 00 
    a6e1:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    a6e8:	00 00 00 00 
    a6ec:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    a6f3:	00 00 00 00 
    a6f7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    a6fc:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    a701:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    a706:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    a70b:	49 8b 47 08          	mov    0x8(%r15),%rax
    a70f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    a716:	00 
    a717:	48 85 c0             	test   %rax,%rax
    a71a:	0f 84 36 00 00 00    	je     a756 <Stub<resolve_string_by_symbol(Word,Word)Object>+0xb6>
    a720:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    a727:	00 00 00 00 
    a72b:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    a732:	97 ff ff ff 
    a736:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    a73d:	00 00 00 00 
    a741:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    a748:	00 
    a749:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a750:	e9 3b 08 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    a755:	90                   	nop
    a756:	49 8b 87 c0 03 00 00 	mov    0x3c0(%r15),%rax
    a75d:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    a764:	00 00 00 00 
    a768:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    a76f:	00 
    a770:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a777:	c3                   	retq   
	...
    a780:	3c 00                	cmp    $0x0,%al
	...

000000000000a7a0 <Stub<resolve_dynamic_invoke(Word)Object>>:
    a7a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    a7a7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    a7ae:	00 
    a7af:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    a7b4:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    a7b9:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    a7be:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    a7c3:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    a7ca:	49 8b ff             	mov    %r15,%rdi
    a7cd:	c5 f8 77             	vzeroupper 
    a7d0:	e8 93 08 00 00       	callq  b068 <plt._aot_resolve_dynamic_invoke>
    a7d5:	90                   	nop
    a7d6:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    a7dd:	00 00 00 00 
    a7e1:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    a7e8:	00 00 00 00 
    a7ec:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    a7f3:	00 00 00 00 
    a7f7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    a7fc:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    a801:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    a806:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    a80b:	49 8b 47 08          	mov    0x8(%r15),%rax
    a80f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    a816:	00 
    a817:	48 85 c0             	test   %rax,%rax
    a81a:	0f 84 36 00 00 00    	je     a856 <Stub<resolve_dynamic_invoke(Word)Object>+0xb6>
    a820:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    a827:	00 00 00 00 
    a82b:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    a832:	97 ff ff ff 
    a836:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    a83d:	00 00 00 00 
    a841:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    a848:	00 
    a849:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a850:	e9 3b 07 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    a855:	90                   	nop
    a856:	49 8b 87 c0 03 00 00 	mov    0x3c0(%r15),%rax
    a85d:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    a864:	00 00 00 00 
    a868:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    a86f:	00 
    a870:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a877:	c3                   	retq   
	...
    a880:	3d 00 00 00 00       	cmp    $0x0,%eax
	...

000000000000a8a0 <Stub<resolve_klass_by_symbol(Word,Word)Word>>:
    a8a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    a8a7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    a8ae:	00 
    a8af:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    a8b4:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    a8b9:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    a8be:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    a8c3:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    a8ca:	49 8b ff             	mov    %r15,%rdi
    a8cd:	c5 f8 77             	vzeroupper 
    a8d0:	e8 9b 07 00 00       	callq  b070 <plt._aot_resolve_klass_by_symbol>
    a8d5:	90                   	nop
    a8d6:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    a8dd:	00 00 00 00 
    a8e1:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    a8e8:	00 00 00 00 
    a8ec:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    a8f3:	00 00 00 00 
    a8f7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    a8fc:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    a901:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    a906:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    a90b:	4d 8b 57 08          	mov    0x8(%r15),%r10
    a90f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    a916:	00 
    a917:	4d 85 d2             	test   %r10,%r10
    a91a:	0f 84 2b 00 00 00    	je     a94b <Stub<resolve_klass_by_symbol(Word,Word)Word>+0xab>
    a920:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    a927:	97 ff ff ff 
    a92b:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    a932:	00 00 00 00 
    a936:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    a93d:	00 
    a93e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a945:	e9 46 06 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    a94a:	90                   	nop
    a94b:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    a952:	00 
    a953:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    a95a:	c3                   	retq   
	...
    a97f:	00 3e                	add    %bh,(%rsi)
	...

000000000000a9a0 <Stub<resolve_method_by_symbol_and_load_counters(Word,Word,Word)Word>>:
    a9a0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    a9a7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    a9ae:	00 
    a9af:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    a9b4:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    a9b9:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    a9be:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    a9c3:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    a9ca:	49 8b ff             	mov    %r15,%rdi
    a9cd:	c5 f8 77             	vzeroupper 
    a9d0:	e8 a3 06 00 00       	callq  b078 <plt._aot_resolve_method_by_symbol_and_load_counters>
    a9d5:	90                   	nop
    a9d6:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    a9dd:	00 00 00 00 
    a9e1:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    a9e8:	00 00 00 00 
    a9ec:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    a9f3:	00 00 00 00 
    a9f7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    a9fc:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    aa01:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    aa06:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    aa0b:	4d 8b 57 08          	mov    0x8(%r15),%r10
    aa0f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    aa16:	00 
    aa17:	4d 85 d2             	test   %r10,%r10
    aa1a:	0f 84 2b 00 00 00    	je     aa4b <Stub<resolve_method_by_symbol_and_load_counters(Word,Word,Word)Word>+0xab>
    aa20:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    aa27:	97 ff ff ff 
    aa2b:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    aa32:	00 00 00 00 
    aa36:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    aa3d:	00 
    aa3e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    aa45:	e9 46 05 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    aa4a:	90                   	nop
    aa4b:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    aa52:	00 
    aa53:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    aa5a:	c3                   	retq   
	...
    aa7f:	00 3f                	add    %bh,(%rdi)
	...

000000000000aaa0 <Stub<initialize_klass_by_symbol(Word,Word)Word>>:
    aaa0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    aaa7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    aaae:	00 
    aaaf:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    aab4:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    aab9:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    aabe:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    aac3:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    aaca:	49 8b ff             	mov    %r15,%rdi
    aacd:	c5 f8 77             	vzeroupper 
    aad0:	e8 ab 05 00 00       	callq  b080 <plt._aot_initialize_klass_by_symbol>
    aad5:	90                   	nop
    aad6:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    aadd:	00 00 00 00 
    aae1:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    aae8:	00 00 00 00 
    aaec:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    aaf3:	00 00 00 00 
    aaf7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    aafc:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    ab01:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    ab06:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    ab0b:	4d 8b 57 08          	mov    0x8(%r15),%r10
    ab0f:	4d 85 d2             	test   %r10,%r10
    ab12:	0f 84 2b 00 00 00    	je     ab43 <Stub<initialize_klass_by_symbol(Word,Word)Word>+0xa3>
    ab18:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    ab1f:	97 ff ff ff 
    ab23:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    ab2a:	00 00 00 00 
    ab2e:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    ab35:	00 
    ab36:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    ab3d:	e9 4e 04 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    ab42:	90                   	nop
    ab43:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    ab4a:	00 
    ab4b:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    ab52:	c3                   	retq   
	...
    ab7f:	00 40 00             	add    %al,0x0(%rax)
	...

000000000000aba0 <Stub<invocation_event(MethodCountersPointer)void>>:
    aba0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    aba7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    abae:	00 
    abaf:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    abb4:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    abb9:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    abbe:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    abc3:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    abca:	49 8b ff             	mov    %r15,%rdi
    abcd:	c5 f8 77             	vzeroupper 
    abd0:	e8 b3 04 00 00       	callq  b088 <plt._aot_invocation_event>
    abd5:	90                   	nop
    abd6:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    abdd:	00 00 00 00 
    abe1:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    abe8:	00 00 00 00 
    abec:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    abf3:	00 00 00 00 
    abf7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    abfc:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    ac01:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    ac06:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    ac0b:	4d 8b 57 08          	mov    0x8(%r15),%r10
    ac0f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    ac16:	00 
    ac17:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    ac1e:	00 00 00 00 
    ac22:	4d 85 d2             	test   %r10,%r10
    ac25:	0f 84 2b 00 00 00    	je     ac56 <Stub<invocation_event(MethodCountersPointer)void>+0xb6>
    ac2b:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    ac32:	97 ff ff ff 
    ac36:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    ac3d:	00 00 00 00 
    ac41:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    ac48:	00 
    ac49:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    ac50:	e9 3b 03 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    ac55:	90                   	nop
    ac56:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    ac5d:	00 
    ac5e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    ac65:	c3                   	retq   
	...
    ac7e:	00 00                	add    %al,(%rax)
    ac80:	41 00 00             	add    %al,(%r8)
	...

000000000000aca0 <Stub<backedge_event(MethodCountersPointer,int,int)void>>:
    aca0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    aca7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    acae:	00 
    acaf:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    acb4:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    acb9:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    acbe:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    acc3:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    acca:	49 8b ff             	mov    %r15,%rdi
    accd:	c5 f8 77             	vzeroupper 
    acd0:	e8 bb 03 00 00       	callq  b090 <plt._aot_backedge_event>
    acd5:	90                   	nop
    acd6:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    acdd:	00 00 00 00 
    ace1:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    ace8:	00 00 00 00 
    acec:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    acf3:	00 00 00 00 
    acf7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    acfc:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    ad01:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    ad06:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    ad0b:	4d 8b 57 08          	mov    0x8(%r15),%r10
    ad0f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    ad16:	00 
    ad17:	49 c7 87 c0 03 00 00 	movq   $0x0,0x3c0(%r15)
    ad1e:	00 00 00 00 
    ad22:	4d 85 d2             	test   %r10,%r10
    ad25:	0f 84 2b 00 00 00    	je     ad56 <Stub<backedge_event(MethodCountersPointer,int,int)void>+0xb6>
    ad2b:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    ad32:	97 ff ff ff 
    ad36:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    ad3d:	00 00 00 00 
    ad41:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    ad48:	00 
    ad49:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    ad50:	e9 3b 02 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    ad55:	90                   	nop
    ad56:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    ad5d:	00 
    ad5e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    ad65:	c3                   	retq   
	...
    ad7e:	00 00                	add    %al,(%rax)
    ad80:	42 00 00             	rex.X add %al,(%rax)
	...

000000000000ada0 <Stub<thread_is_interrupted(Thread,boolean)boolean>>:
    ada0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    ada7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    adae:	00 
    adaf:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    adb4:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    adb9:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    adbe:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    adc3:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    adca:	49 8b ff             	mov    %r15,%rdi
    adcd:	c5 f8 77             	vzeroupper 
    add0:	e8 c3 02 00 00       	callq  b098 <plt._aot_jvmci_runtime_thread_is_interrupted>
    add5:	90                   	nop
    add6:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    addd:	00 00 00 00 
    ade1:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    ade8:	00 00 00 00 
    adec:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    adf3:	00 00 00 00 
    adf7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    adfc:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    ae01:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    ae06:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    ae0b:	4d 8b 57 08          	mov    0x8(%r15),%r10
    ae0f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    ae16:	00 
    ae17:	4d 85 d2             	test   %r10,%r10
    ae1a:	0f 84 2b 00 00 00    	je     ae4b <Stub<thread_is_interrupted(Thread,boolean)boolean>+0xab>
    ae20:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    ae27:	97 ff ff ff 
    ae2b:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    ae32:	00 00 00 00 
    ae36:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    ae3d:	00 
    ae3e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    ae45:	e9 46 01 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    ae4a:	90                   	nop
    ae4b:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    ae52:	00 
    ae53:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    ae5a:	c3                   	retq   
	...
    ae7f:	00 43 00             	add    %al,0x0(%rbx)
	...

000000000000aea0 <Stub<test_deoptimize_call_int(int)int>>:
    aea0:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
    aea7:	48 89 ac 24 f0 00 00 	mov    %rbp,0xf0(%rsp)
    aeae:	00 
    aeaf:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
    aeb4:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
    aeb9:	4c 89 6c 24 50       	mov    %r13,0x50(%rsp)
    aebe:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
    aec3:	49 89 a7 60 03 00 00 	mov    %rsp,0x360(%r15)
    aeca:	49 8b ff             	mov    %r15,%rdi
    aecd:	c5 f8 77             	vzeroupper 
    aed0:	e8 cb 01 00 00       	callq  b0a0 <plt._aot_jvmci_runtime_test_deoptimize_call_int>
    aed5:	90                   	nop
    aed6:	49 c7 87 60 03 00 00 	movq   $0x0,0x360(%r15)
    aedd:	00 00 00 00 
    aee1:	49 c7 87 70 03 00 00 	movq   $0x0,0x370(%r15)
    aee8:	00 00 00 00 
    aeec:	49 c7 87 68 03 00 00 	movq   $0x0,0x368(%r15)
    aef3:	00 00 00 00 
    aef7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    aefc:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    af01:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
    af06:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
    af0b:	4d 8b 57 08          	mov    0x8(%r15),%r10
    af0f:	49 c7 47 08 00 00 00 	movq   $0x0,0x8(%r15)
    af16:	00 
    af17:	4d 85 d2             	test   %r10,%r10
    af1a:	0f 84 2b 00 00 00    	je     af4b <Stub<test_deoptimize_call_int(int)int>+0xab>
    af20:	41 c7 87 24 04 00 00 	movl   $0xffffff97,0x424(%r15)
    af27:	97 ff ff ff 
    af2b:	49 c7 87 30 04 00 00 	movq   $0x0,0x430(%r15)
    af32:	00 00 00 00 
    af36:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    af3d:	00 
    af3e:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    af45:	e9 46 00 00 00       	jmpq   af90 <plt._aot_deopt_blob_uncommon_trap>
    af4a:	90                   	nop
    af4b:	48 8b ac 24 f0 00 00 	mov    0xf0(%rsp),%rbp
    af52:	00 
    af53:	48 81 c4 f8 00 00 00 	add    $0xf8,%rsp
    af5a:	c3                   	retq   
    af5b:	00 00                	add    %al,(%rax)
    af5d:	00 00                	add    %al,(%rax)
	...

000000000000af60 <plt._aot_ic_miss_stub>:
    af60:	ff 25 8a c2 20 00 66 90                             .%.. .f.

000000000000af68 <plt._aot_handle_wrong_method_stub>:
    af68:	ff 25 6a c1 20 00 66 90                             .%j. .f.

000000000000af70 <plt._aot_deopt_blob_unpack>:
    af70:	ff 25 d2 c2 20 00 66 90                             .%.. .f.

000000000000af78 <plt._aot_jvmci_runtime_vm_message>:
    af78:	ff 25 6a c4 20 00 66 90                             .%j. .f.

000000000000af80 <plt._aot_jvmci_runtime_exception_handler_for_pc>:
    af80:	ff 25 9a c3 20 00 66 90                             .%.. .f.

000000000000af88 <plt._aot_jvmci_runtime_new_instance>:
    af88:	ff 25 5a c2 20 00 66 90                             .%Z. .f.

000000000000af90 <plt._aot_deopt_blob_uncommon_trap>:
    af90:	ff 25 4a c4 20 00 66 90                             .%J. .f.

000000000000af98 <plt._aot_jvmci_runtime_new_array>:
    af98:	ff 25 5a c1 20 00 66 90                             .%Z. .f.

000000000000afa0 <plt._aot_jvmci_runtime_new_multi_array>:
    afa0:	ff 25 82 c3 20 00 66 90                             .%.. .f.

000000000000afa8 <plt._aot_jvmci_runtime_dynamic_new_instance>:
    afa8:	ff 25 fa c1 20 00 66 90                             .%.. .f.

000000000000afb0 <plt._aot_jvmci_runtime_new_instance_or_null>:
    afb0:	ff 25 fa c3 20 00 66 90                             .%.. .f.

000000000000afb8 <plt._aot_jvmci_runtime_new_array_or_null>:
    afb8:	ff 25 42 c2 20 00 66 90                             .%B. .f.

000000000000afc0 <plt._aot_jvmci_runtime_new_multi_array_or_null>:
    afc0:	ff 25 52 c2 20 00 66 90                             .%R. .f.

000000000000afc8 <plt._aot_jvmci_runtime_dynamic_new_instance_or_null>:
    afc8:	ff 25 8a c2 20 00 66 90                             .%.. .f.

000000000000afd0 <plt._aot_exception_handler_for_return_address>:
    afd0:	ff 25 32 c2 20 00 66 90                             .%2. .f.

000000000000afd8 <plt._aot_jvmci_runtime_throw_klass_external_name_exception>:
    afd8:	ff 25 7a c1 20 00 66 90                             .%z. .f.

000000000000afe0 <plt._aot_jvmci_runtime_throw_class_cast_exception>:
    afe0:	ff 25 b2 c2 20 00 66 90                             .%.. .f.

000000000000afe8 <plt._aot_jvmci_runtime_throw_and_post_jvmti_exception>:
    afe8:	ff 25 b2 c2 20 00 66 90                             .%.. .f.

000000000000aff0 <plt._aot_jvmci_runtime_identity_hash_code>:
    aff0:	ff 25 ca c3 20 00 66 90                             .%.. .f.

000000000000aff8 <plt._aot_register_finalizer>:
    aff8:	ff 25 d2 c1 20 00 66 90                             .%.. .f.

000000000000b000 <plt._aot_jvmci_runtime_monitorenter>:
    b000:	ff 25 f2 c2 20 00 66 90                             .%.. .f.

000000000000b008 <plt._aot_jvmci_runtime_monitorexit>:
    b008:	ff 25 aa c3 20 00 66 90                             .%.. .f.

000000000000b010 <plt._aot_object_notify>:
    b010:	ff 25 ba c2 20 00 66 90                             .%.. .f.

000000000000b018 <plt._aot_object_notifyAll>:
    b018:	ff 25 52 c3 20 00 66 90                             .%R. .f.

000000000000b020 <plt._aot_jvmci_runtime_log_printf>:
    b020:	ff 25 ca c3 20 00 66 90                             .%.. .f.

000000000000b028 <plt._aot_jvmci_runtime_log_object>:
    b028:	ff 25 4a c1 20 00 66 90                             .%J. .f.

000000000000b030 <plt._aot_jvmci_runtime_log_primitive>:
    b030:	ff 25 ca c3 20 00 66 90                             .%.. .f.

000000000000b038 <plt._aot_jvmci_runtime_vm_error>:
    b038:	ff 25 52 c2 20 00 66 90                             .%R. .f.

000000000000b040 <plt._aot_OSR_migration_end>:
    b040:	ff 25 c2 c3 20 00 66 90                             .%.. .f.

000000000000b048 <plt._aot_jvmci_runtime_write_barrier_pre>:
    b048:	ff 25 12 c2 20 00 66 90                             .%.. .f.

000000000000b050 <plt._aot_jvmci_runtime_write_barrier_post>:
    b050:	ff 25 d2 c1 20 00 66 90                             .%.. .f.

000000000000b058 <plt._aot_jvmci_runtime_validate_object>:
    b058:	ff 25 f2 c0 20 00 66 90                             .%.. .f.

000000000000b060 <plt._aot_resolve_string_by_symbol>:
    b060:	ff 25 7a c2 20 00 66 90                             .%z. .f.

000000000000b068 <plt._aot_resolve_dynamic_invoke>:
    b068:	ff 25 a2 c2 20 00 66 90                             .%.. .f.

000000000000b070 <plt._aot_resolve_klass_by_symbol>:
    b070:	ff 25 f2 c2 20 00 66 90                             .%.. .f.

000000000000b078 <plt._aot_resolve_method_by_symbol_and_load_counters>:
    b078:	ff 25 d2 c2 20 00 66 90                             .%.. .f.

000000000000b080 <plt._aot_initialize_klass_by_symbol>:
    b080:	ff 25 fa c1 20 00 66 90                             .%.. .f.

000000000000b088 <plt._aot_invocation_event>:
    b088:	ff 25 ea c2 20 00 66 90                             .%.. .f.

000000000000b090 <plt._aot_backedge_event>:
    b090:	ff 25 9a c2 20 00 66 90                             .%.. .f.

000000000000b098 <plt._aot_jvmci_runtime_thread_is_interrupted>:
    b098:	ff 25 4a c2 20 00 66 90                             .%J. .f.

000000000000b0a0 <plt._aot_jvmci_runtime_test_deoptimize_call_int>:
    b0a0:	ff 25 e2 c1 20 00 66 90                             .%.. .f.
