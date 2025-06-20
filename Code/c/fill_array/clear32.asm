
clear32.out:     file format elf64-x86-64


Disassembly of section .init:

0000000000400b78 <_init>:
  400b78:	48 83 ec 08          	sub    $0x8,%rsp
  400b7c:	48 8b 05 6d 54 20 00 	mov    0x20546d(%rip),%rax        # 605ff0 <__gmon_start__>
  400b83:	48 85 c0             	test   %rax,%rax
  400b86:	74 05                	je     400b8d <_init+0x15>
  400b88:	e8 93 01 00 00       	callq  400d20 <.plt.got>
  400b8d:	48 83 c4 08          	add    $0x8,%rsp
  400b91:	c3                   	retq   

Disassembly of section .plt:

0000000000400ba0 <.plt>:
  400ba0:	ff 35 62 54 20 00    	pushq  0x205462(%rip)        # 606008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400ba6:	ff 25 64 54 20 00    	jmpq   *0x205464(%rip)        # 606010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400bac:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400bb0 <printf@plt>:
  400bb0:	ff 25 62 54 20 00    	jmpq   *0x205462(%rip)        # 606018 <printf@GLIBC_2.2.5>
  400bb6:	68 00 00 00 00       	pushq  $0x0
  400bbb:	e9 e0 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400bc0 <__fprintf_chk@plt>:
  400bc0:	ff 25 5a 54 20 00    	jmpq   *0x20545a(%rip)        # 606020 <__fprintf_chk@GLIBC_2.3.4>
  400bc6:	68 01 00 00 00       	pushq  $0x1
  400bcb:	e9 d0 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400bd0 <exit@plt>:
  400bd0:	ff 25 52 54 20 00    	jmpq   *0x205452(%rip)        # 606028 <exit@GLIBC_2.2.5>
  400bd6:	68 02 00 00 00       	pushq  $0x2
  400bdb:	e9 c0 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400be0 <__printf_chk@plt>:
  400be0:	ff 25 4a 54 20 00    	jmpq   *0x20544a(%rip)        # 606030 <__printf_chk@GLIBC_2.3.4>
  400be6:	68 03 00 00 00       	pushq  $0x3
  400beb:	e9 b0 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400bf0 <malloc@plt>:
  400bf0:	ff 25 42 54 20 00    	jmpq   *0x205442(%rip)        # 606038 <malloc@GLIBC_2.2.5>
  400bf6:	68 04 00 00 00       	pushq  $0x4
  400bfb:	e9 a0 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400c00 <__libc_start_main@plt>:
  400c00:	ff 25 3a 54 20 00    	jmpq   *0x20543a(%rip)        # 606040 <__libc_start_main@GLIBC_2.2.5>
  400c06:	68 05 00 00 00       	pushq  $0x5
  400c0b:	e9 90 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400c10 <catgets@plt>:
  400c10:	ff 25 32 54 20 00    	jmpq   *0x205432(%rip)        # 606048 <catgets@GLIBC_2.2.5>
  400c16:	68 06 00 00 00       	pushq  $0x6
  400c1b:	e9 80 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400c20 <free@plt>:
  400c20:	ff 25 2a 54 20 00    	jmpq   *0x20542a(%rip)        # 606050 <free@GLIBC_2.2.5>
  400c26:	68 07 00 00 00       	pushq  $0x7
  400c2b:	e9 70 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400c30 <strlen@plt>:
  400c30:	ff 25 22 54 20 00    	jmpq   *0x205422(%rip)        # 606058 <strlen@GLIBC_2.2.5>
  400c36:	68 08 00 00 00       	pushq  $0x8
  400c3b:	e9 60 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400c40 <__vsprintf_chk@plt>:
  400c40:	ff 25 1a 54 20 00    	jmpq   *0x20541a(%rip)        # 606060 <__vsprintf_chk@GLIBC_2.3.4>
  400c46:	68 09 00 00 00       	pushq  $0x9
  400c4b:	e9 50 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400c50 <atol@plt>:
  400c50:	ff 25 12 54 20 00    	jmpq   *0x205412(%rip)        # 606068 <atol@GLIBC_2.2.5>
  400c56:	68 0a 00 00 00       	pushq  $0xa
  400c5b:	e9 40 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400c60 <fputs@plt>:
  400c60:	ff 25 0a 54 20 00    	jmpq   *0x20540a(%rip)        # 606070 <fputs@GLIBC_2.2.5>
  400c66:	68 0b 00 00 00       	pushq  $0xb
  400c6b:	e9 30 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400c70 <strchr@plt>:
  400c70:	ff 25 02 54 20 00    	jmpq   *0x205402(%rip)        # 606078 <strchr@GLIBC_2.2.5>
  400c76:	68 0c 00 00 00       	pushq  $0xc
  400c7b:	e9 20 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400c80 <setenv@plt>:
  400c80:	ff 25 fa 53 20 00    	jmpq   *0x2053fa(%rip)        # 606080 <setenv@GLIBC_2.2.5>
  400c86:	68 0d 00 00 00       	pushq  $0xd
  400c8b:	e9 10 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400c90 <catopen@plt>:
  400c90:	ff 25 f2 53 20 00    	jmpq   *0x2053f2(%rip)        # 606088 <catopen@GLIBC_2.2.5>
  400c96:	68 0e 00 00 00       	pushq  $0xe
  400c9b:	e9 00 ff ff ff       	jmpq   400ba0 <.plt>

0000000000400ca0 <getenv@plt>:
  400ca0:	ff 25 ea 53 20 00    	jmpq   *0x2053ea(%rip)        # 606090 <getenv@GLIBC_2.2.5>
  400ca6:	68 0f 00 00 00       	pushq  $0xf
  400cab:	e9 f0 fe ff ff       	jmpq   400ba0 <.plt>

0000000000400cb0 <__errno_location@plt>:
  400cb0:	ff 25 e2 53 20 00    	jmpq   *0x2053e2(%rip)        # 606098 <__errno_location@GLIBC_2.2.5>
  400cb6:	68 10 00 00 00       	pushq  $0x10
  400cbb:	e9 e0 fe ff ff       	jmpq   400ba0 <.plt>

0000000000400cc0 <__stack_chk_fail@plt>:
  400cc0:	ff 25 da 53 20 00    	jmpq   *0x2053da(%rip)        # 6060a0 <__stack_chk_fail@GLIBC_2.4>
  400cc6:	68 11 00 00 00       	pushq  $0x11
  400ccb:	e9 d0 fe ff ff       	jmpq   400ba0 <.plt>

0000000000400cd0 <strncpy@plt>:
  400cd0:	ff 25 d2 53 20 00    	jmpq   *0x2053d2(%rip)        # 6060a8 <strncpy@GLIBC_2.2.5>
  400cd6:	68 12 00 00 00       	pushq  $0x12
  400cdb:	e9 c0 fe ff ff       	jmpq   400ba0 <.plt>

0000000000400ce0 <__gxx_personality_v0@plt>:
  400ce0:	ff 25 ca 53 20 00    	jmpq   *0x2053ca(%rip)        # 6060b0 <__gxx_personality_v0@CXXABI_1.3>
  400ce6:	68 13 00 00 00       	pushq  $0x13
  400ceb:	e9 b0 fe ff ff       	jmpq   400ba0 <.plt>

0000000000400cf0 <fprintf@plt>:
  400cf0:	ff 25 c2 53 20 00    	jmpq   *0x2053c2(%rip)        # 6060b8 <fprintf@GLIBC_2.2.5>
  400cf6:	68 14 00 00 00       	pushq  $0x14
  400cfb:	e9 a0 fe ff ff       	jmpq   400ba0 <.plt>

0000000000400d00 <__strncat_chk@plt>:
  400d00:	ff 25 ba 53 20 00    	jmpq   *0x2053ba(%rip)        # 6060c0 <__strncat_chk@GLIBC_2.3.4>
  400d06:	68 15 00 00 00       	pushq  $0x15
  400d0b:	e9 90 fe ff ff       	jmpq   400ba0 <.plt>

0000000000400d10 <strtod@plt>:
  400d10:	ff 25 b2 53 20 00    	jmpq   *0x2053b2(%rip)        # 6060c8 <strtod@GLIBC_2.2.5>
  400d16:	68 16 00 00 00       	pushq  $0x16
  400d1b:	e9 80 fe ff ff       	jmpq   400ba0 <.plt>

Disassembly of section .plt.got:

0000000000400d20 <.plt.got>:
  400d20:	ff 25 ca 52 20 00    	jmpq   *0x2052ca(%rip)        # 605ff0 <__gmon_start__>
  400d26:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400d30 <_start>:
  400d30:	31 ed                	xor    %ebp,%ebp
  400d32:	49 89 d1             	mov    %rdx,%r9
  400d35:	5e                   	pop    %rsi
  400d36:	48 89 e2             	mov    %rsp,%rdx
  400d39:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400d3d:	50                   	push   %rax
  400d3e:	54                   	push   %rsp
  400d3f:	49 c7 c0 70 34 40 00 	mov    $0x403470,%r8
  400d46:	48 c7 c1 00 34 40 00 	mov    $0x403400,%rcx
  400d4d:	48 c7 c7 20 0e 40 00 	mov    $0x400e20,%rdi
  400d54:	e8 a7 fe ff ff       	callq  400c00 <__libc_start_main@plt>
  400d59:	f4                   	hlt    
  400d5a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400d60 <deregister_tm_clones>:
  400d60:	b8 e7 60 60 00       	mov    $0x6060e7,%eax
  400d65:	55                   	push   %rbp
  400d66:	48 2d e0 60 60 00    	sub    $0x6060e0,%rax
  400d6c:	48 83 f8 0e          	cmp    $0xe,%rax
  400d70:	48 89 e5             	mov    %rsp,%rbp
  400d73:	77 02                	ja     400d77 <deregister_tm_clones+0x17>
  400d75:	5d                   	pop    %rbp
  400d76:	c3                   	retq   
  400d77:	b8 00 00 00 00       	mov    $0x0,%eax
  400d7c:	48 85 c0             	test   %rax,%rax
  400d7f:	74 f4                	je     400d75 <deregister_tm_clones+0x15>
  400d81:	5d                   	pop    %rbp
  400d82:	bf e0 60 60 00       	mov    $0x6060e0,%edi
  400d87:	ff e0                	jmpq   *%rax
  400d89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400d90 <register_tm_clones>:
  400d90:	b8 e0 60 60 00       	mov    $0x6060e0,%eax
  400d95:	55                   	push   %rbp
  400d96:	48 2d e0 60 60 00    	sub    $0x6060e0,%rax
  400d9c:	48 c1 f8 03          	sar    $0x3,%rax
  400da0:	48 89 e5             	mov    %rsp,%rbp
  400da3:	48 89 c2             	mov    %rax,%rdx
  400da6:	48 c1 ea 3f          	shr    $0x3f,%rdx
  400daa:	48 01 d0             	add    %rdx,%rax
  400dad:	48 d1 f8             	sar    %rax
  400db0:	75 02                	jne    400db4 <register_tm_clones+0x24>
  400db2:	5d                   	pop    %rbp
  400db3:	c3                   	retq   
  400db4:	ba 00 00 00 00       	mov    $0x0,%edx
  400db9:	48 85 d2             	test   %rdx,%rdx
  400dbc:	74 f4                	je     400db2 <register_tm_clones+0x22>
  400dbe:	5d                   	pop    %rbp
  400dbf:	48 89 c6             	mov    %rax,%rsi
  400dc2:	bf e0 60 60 00       	mov    $0x6060e0,%edi
  400dc7:	ff e2                	jmpq   *%rdx
  400dc9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400dd0 <__do_global_dtors_aux>:
  400dd0:	80 3d 21 53 20 00 00 	cmpb   $0x0,0x205321(%rip)        # 6060f8 <completed.6355>
  400dd7:	75 11                	jne    400dea <__do_global_dtors_aux+0x1a>
  400dd9:	55                   	push   %rbp
  400dda:	48 89 e5             	mov    %rsp,%rbp
  400ddd:	e8 7e ff ff ff       	callq  400d60 <deregister_tm_clones>
  400de2:	5d                   	pop    %rbp
  400de3:	c6 05 0e 53 20 00 01 	movb   $0x1,0x20530e(%rip)        # 6060f8 <completed.6355>
  400dea:	f3 c3                	repz retq 
  400dec:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400df0 <frame_dummy>:
  400df0:	48 83 3d 00 4c 20 00 	cmpq   $0x0,0x204c00(%rip)        # 6059f8 <__JCR_END__>
  400df7:	00 
  400df8:	74 1e                	je     400e18 <frame_dummy+0x28>
  400dfa:	b8 00 00 00 00       	mov    $0x0,%eax
  400dff:	48 85 c0             	test   %rax,%rax
  400e02:	74 14                	je     400e18 <frame_dummy+0x28>
  400e04:	55                   	push   %rbp
  400e05:	bf f8 59 60 00       	mov    $0x6059f8,%edi
  400e0a:	48 89 e5             	mov    %rsp,%rbp
  400e0d:	ff d0                	callq  *%rax
  400e0f:	5d                   	pop    %rbp
  400e10:	e9 7b ff ff ff       	jmpq   400d90 <register_tm_clones>
  400e15:	0f 1f 00             	nopl   (%rax)
  400e18:	e9 73 ff ff ff       	jmpq   400d90 <register_tm_clones>
  400e1d:	0f 1f 00             	nopl   (%rax)

0000000000400e20 <main>:
  400e20:	55                   	push   %rbp
  400e21:	48 89 e5             	mov    %rsp,%rbp
  400e24:	48 83 e4 80          	and    $0xffffffffffffff80,%rsp
  400e28:	41 54                	push   %r12
  400e2a:	41 55                	push   %r13
  400e2c:	41 56                	push   %r14
  400e2e:	41 57                	push   %r15
  400e30:	53                   	push   %rbx
  400e31:	48 83 ec 58          	sub    $0x58,%rsp
  400e35:	48 89 f3             	mov    %rsi,%rbx
  400e38:	41 89 fc             	mov    %edi,%r12d
  400e3b:	bf 03 00 00 00       	mov    $0x3,%edi
  400e40:	31 f6                	xor    %esi,%esi
  400e42:	e8 f9 02 00 00       	callq  401140 <__intel_new_feature_proc_init>
  400e47:	c5 f8 ae 1c 24       	vstmxcsr (%rsp)
  400e4c:	81 0c 24 40 80 00 00 	orl    $0x8040,(%rsp)
  400e53:	c5 f8 ae 14 24       	vldmxcsr (%rsp)
  400e58:	41 83 fc 04          	cmp    $0x4,%r12d
  400e5c:	74 28                	je     400e86 <main+0x66>
  400e5e:	bf a0 34 40 00       	mov    $0x4034a0,%edi
  400e63:	48 8b 35 76 52 20 00 	mov    0x205276(%rip),%rsi        # 6060e0 <stderr@@GLIBC_2.2.5>
  400e6a:	e8 f1 fd ff ff       	callq  400c60 <fputs@plt>
  400e6f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  400e74:	48 83 c4 58          	add    $0x58,%rsp
  400e78:	5b                   	pop    %rbx
  400e79:	41 5f                	pop    %r15
  400e7b:	41 5e                	pop    %r14
  400e7d:	41 5d                	pop    %r13
  400e7f:	41 5c                	pop    %r12
  400e81:	48 89 ec             	mov    %rbp,%rsp
  400e84:	5d                   	pop    %rbp
  400e85:	c3                   	retq   
  400e86:	bf 00 80 00 00       	mov    $0x8000,%edi
  400e8b:	be 40 00 00 00       	mov    $0x40,%esi
  400e90:	e8 2b 02 00 00       	callq  4010c0 <_mm_malloc>
  400e95:	49 89 c6             	mov    %rax,%r14
  400e98:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  400e9c:	e8 af fd ff ff       	callq  400c50 <atol@plt>
  400ea1:	49 89 c4             	mov    %rax,%r12
  400ea4:	31 f6                	xor    %esi,%esi
  400ea6:	4d 01 e6             	add    %r12,%r14
  400ea9:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
  400ead:	e8 5e fe ff ff       	callq  400d10 <strtod@plt>
  400eb2:	4d 89 e5             	mov    %r12,%r13
  400eb5:	be 20 35 40 00       	mov    $0x403520,%esi
  400eba:	49 f7 dd             	neg    %r13
  400ebd:	4c 89 e2             	mov    %r12,%rdx
  400ec0:	49 81 c5 00 80 00 00 	add    $0x8000,%r13
  400ec7:	b8 01 00 00 00       	mov    $0x1,%eax
  400ecc:	62 c1 fe 00 7b c5    	vcvtusi2ss %r13,%xmm16,%xmm16
  400ed2:	c5 fb 5a c0          	vcvtsd2ss %xmm0,%xmm0,%xmm0
  400ed6:	62 f1 7e 00 59 c8    	vmulss %xmm0,%xmm16,%xmm1
  400edc:	c5 fa 5a c0          	vcvtss2sd %xmm0,%xmm0,%xmm0
  400ee0:	62 71 fe 08 78 e9    	vcvttss2usi %xmm1,%r13
  400ee6:	48 8b 3d 03 52 20 00 	mov    0x205203(%rip),%rdi        # 6060f0 <stdout@@GLIBC_2.2.5>
  400eed:	e8 fe fd ff ff       	callq  400cf0 <fprintf@plt>
  400ef2:	be 40 35 40 00       	mov    $0x403540,%esi
  400ef7:	4c 89 ea             	mov    %r13,%rdx
  400efa:	31 c0                	xor    %eax,%eax
  400efc:	48 8b 3d ed 51 20 00 	mov    0x2051ed(%rip),%rdi        # 6060f0 <stdout@@GLIBC_2.2.5>
  400f03:	e8 e8 fd ff ff       	callq  400cf0 <fprintf@plt>
  400f08:	c5 fe 6f 05 f0 25 00 	vmovdqu 0x25f0(%rip),%ymm0        # 403500 <il0_peep_printf_format_0+0x60>
  400f0f:	00 
  400f10:	45 31 ff             	xor    %r15d,%r15d
  400f13:	c5 fe 7f 04 24       	vmovdqu %ymm0,(%rsp)
  400f18:	45 31 e4             	xor    %r12d,%r12d
  400f1b:	c5 fe 7f 44 24 20    	vmovdqu %ymm0,0x20(%rsp)
  400f21:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
  400f25:	c5 f8 77             	vzeroupper 
  400f28:	e8 23 fd ff ff       	callq  400c50 <atol@plt>
  400f2d:	83 f8 01             	cmp    $0x1,%eax
  400f30:	74 4e                	je     400f80 <main+0x160>
  400f32:	31 db                	xor    %ebx,%ebx
  400f34:	4c 89 f7             	mov    %r14,%rdi
  400f37:	be 01 00 00 00       	mov    $0x1,%esi
  400f3c:	4c 89 ea             	mov    %r13,%rdx
  400f3f:	b9 01 00 00 00       	mov    $0x1,%ecx
  400f44:	e8 67 00 00 00       	callq  400fb0 <_Z15array_clear_repPhlli>
  400f49:	0f b6 c0             	movzbl %al,%eax
  400f4c:	ff c3                	inc    %ebx
  400f4e:	49 01 c7             	add    %rax,%r15
  400f51:	49 ff c4             	inc    %r12
  400f54:	81 fb 00 00 00 02    	cmp    $0x2000000,%ebx
  400f5a:	7c d8                	jl     400f34 <main+0x114>
  400f5c:	bf 58 35 40 00       	mov    $0x403558,%edi
  400f61:	4c 89 e6             	mov    %r12,%rsi
  400f64:	4c 89 fa             	mov    %r15,%rdx
  400f67:	31 c0                	xor    %eax,%eax
  400f69:	e8 42 fc ff ff       	callq  400bb0 <printf@plt>
  400f6e:	48 83 c4 58          	add    $0x58,%rsp
  400f72:	5b                   	pop    %rbx
  400f73:	41 5f                	pop    %r15
  400f75:	41 5e                	pop    %r14
  400f77:	41 5d                	pop    %r13
  400f79:	41 5c                	pop    %r12
  400f7b:	48 89 ec             	mov    %rbp,%rsp
  400f7e:	5d                   	pop    %rbp
  400f7f:	c3                   	retq   
  400f80:	31 db                	xor    %ebx,%ebx
  400f82:	4c 89 f7             	mov    %r14,%rdi
  400f85:	4c 89 ee             	mov    %r13,%rsi
  400f88:	ba 01 00 00 00       	mov    $0x1,%edx
  400f8d:	48 8d 0c 24          	lea    (%rsp),%rcx
  400f91:	e8 3a 00 00 00       	callq  400fd0 <_Z15array_clear_vecPhliS_>
  400f96:	0f b6 c0             	movzbl %al,%eax
  400f99:	ff c3                	inc    %ebx
  400f9b:	49 01 c7             	add    %rax,%r15
  400f9e:	49 ff c4             	inc    %r12
  400fa1:	81 fb 00 00 00 02    	cmp    $0x2000000,%ebx
  400fa7:	7c d9                	jl     400f82 <main+0x162>
  400fa9:	eb b1                	jmp    400f5c <main+0x13c>
  400fab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400fb0 <_Z15array_clear_repPhlli>:
  400fb0:	b8 01 00 00 00       	mov    $0x1,%eax
  400fb5:	48 89 7c 24 f8       	mov    %rdi,-0x8(%rsp)
  400fba:	48 8b 7c 24 f8       	mov    -0x8(%rsp),%rdi
  400fbf:	48 89 d1             	mov    %rdx,%rcx
  400fc2:	f3 aa                	rep stos %al,%es:(%rdi)
  400fc4:	8b 47 f8             	mov    -0x8(%rdi),%eax
  400fc7:	c3                   	retq   
  400fc8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  400fcf:	00 

0000000000400fd0 <_Z15array_clear_vecPhliS_>:
  400fd0:	49 89 c9             	mov    %rcx,%r9
  400fd3:	48 89 7c 24 f8       	mov    %rdi,-0x8(%rsp)
  400fd8:	62 d1 7e 28 6f 01    	vmovdqu32 (%r9),%ymm0

0000000000400fde <block_32>:
  400fde:	48 83 fe 20          	cmp    $0x20,%rsi
  400fe2:	7f 1f                	jg     401003 <block_64>
  400fe4:	48 c7 c0 01 00 00 00 	mov    $0x1,%rax
  400feb:	c4 e2 c9 f7 c0       	shlx   %rsi,%rax,%rax
  400ff0:	48 ff c8             	dec    %rax
  400ff3:	c4 e1 fb 92 c8       	kmovq  %rax,%k1
  400ff8:	62 f1 7f 29 7f 07    	vmovdqu8 %ymm0,(%rdi){%k1}
  400ffe:	e9 9e 00 00 00       	jmpq   4010a1 <exit>

0000000000401003 <block_64>:
  401003:	48 83 fe 40          	cmp    $0x40,%rsi
  401007:	7f 28                	jg     401031 <aligned_loop>
  401009:	c5 fe 7f 07          	vmovdqu %ymm0,(%rdi)
  40100d:	48 83 ee 20          	sub    $0x20,%rsi
  401011:	48 83 c7 20          	add    $0x20,%rdi
  401015:	48 c7 c0 01 00 00 00 	mov    $0x1,%rax
  40101c:	c4 e2 c9 f7 c0       	shlx   %rsi,%rax,%rax
  401021:	48 ff c8             	dec    %rax
  401024:	c4 e1 fb 92 c8       	kmovq  %rax,%k1
  401029:	62 f1 7f 29 7f 07    	vmovdqu8 %ymm0,(%rdi){%k1}
  40102f:	eb 70                	jmp    4010a1 <exit>

0000000000401031 <aligned_loop>:
  401031:	48 8b 7c 24 f8       	mov    -0x8(%rsp),%rdi
  401036:	48 8b 4c 24 f8       	mov    -0x8(%rsp),%rcx
  40103b:	48 83 e1 1f          	and    $0x1f,%rcx
  40103f:	48 f7 d9             	neg    %rcx
  401042:	48 83 c1 20          	add    $0x20,%rcx
  401046:	48 c7 c0 01 00 00 00 	mov    $0x1,%rax
  40104d:	c4 e2 f1 f7 c0       	shlx   %rcx,%rax,%rax
  401052:	48 ff c8             	dec    %rax
  401055:	c4 e1 fb 92 c8       	kmovq  %rax,%k1
  40105a:	62 f1 7f 29 7f 07    	vmovdqu8 %ymm0,(%rdi){%k1}
  401060:	48 01 cf             	add    %rcx,%rdi
  401063:	48 29 ce             	sub    %rcx,%rsi
  401066:	48 83 fe 40          	cmp    $0x40,%rsi
  40106a:	7e 1b                	jle    401087 <tail>

000000000040106c <mainloop>:
  40106c:	62 f1 7e 28 7f 07    	vmovdqu32 %ymm0,(%rdi)
  401072:	62 f1 7e 28 7f 47 01 	vmovdqu32 %ymm0,0x20(%rdi)
  401079:	48 83 c7 40          	add    $0x40,%rdi
  40107d:	48 83 ee 40          	sub    $0x40,%rsi
  401081:	48 83 fe 40          	cmp    $0x40,%rsi
  401085:	77 e5                	ja     40106c <mainloop>

0000000000401087 <tail>:
  401087:	48 c7 c0 01 00 00 00 	mov    $0x1,%rax
  40108e:	c4 e2 c9 f7 c0       	shlx   %rsi,%rax,%rax
  401093:	48 ff c8             	dec    %rax
  401096:	c4 e1 fb 92 c8       	kmovq  %rax,%k1
  40109b:	62 f1 7f 29 7f 07    	vmovdqu8 %ymm0,(%rdi){%k1}

00000000004010a1 <exit>:
  4010a1:	44 8b 57 f8          	mov    -0x8(%rdi),%r10d
  4010a5:	44 89 d0             	mov    %r10d,%eax
  4010a8:	c5 f8 77             	vzeroupper 
  4010ab:	c3                   	retq   
  4010ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004010b0 <_Z8init_memPhc>:
  4010b0:	c3                   	retq   
  4010b1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4010b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4010bd:	00 00 00 

00000000004010c0 <_mm_malloc>:
  4010c0:	f3 0f 1e fa          	repz nop %edx
  4010c4:	41 55                	push   %r13
  4010c6:	49 89 f5             	mov    %rsi,%r13
  4010c9:	4a 8d 44 2f 08       	lea    0x8(%rdi,%r13,1),%rax
  4010ce:	48 3b f8             	cmp    %rax,%rdi
  4010d1:	77 3d                	ja     401110 <_mm_malloc+0x50>
  4010d3:	4c 3b e8             	cmp    %rax,%r13
  4010d6:	77 38                	ja     401110 <_mm_malloc+0x50>
  4010d8:	48 89 c7             	mov    %rax,%rdi
  4010db:	e8 10 fb ff ff       	callq  400bf0 <malloc@plt>
  4010e0:	48 89 c1             	mov    %rax,%rcx
  4010e3:	48 85 c9             	test   %rcx,%rcx
  4010e6:	74 23                	je     40110b <_mm_malloc+0x4b>
  4010e8:	b8 08 00 00 00       	mov    $0x8,%eax
  4010ed:	49 83 fd 08          	cmp    $0x8,%r13
  4010f1:	4c 0f 42 e8          	cmovb  %rax,%r13
  4010f5:	49 8d 55 ff          	lea    -0x1(%r13),%rdx
  4010f9:	48 f7 d2             	not    %rdx
  4010fc:	4a 8d 44 29 07       	lea    0x7(%rcx,%r13,1),%rax
  401101:	48 23 c2             	and    %rdx,%rax
  401104:	48 89 48 f8          	mov    %rcx,-0x8(%rax)
  401108:	41 5d                	pop    %r13
  40110a:	c3                   	retq   
  40110b:	33 c0                	xor    %eax,%eax
  40110d:	41 5d                	pop    %r13
  40110f:	c3                   	retq   
  401110:	33 c0                	xor    %eax,%eax
  401112:	41 5d                	pop    %r13
  401114:	c3                   	retq   
  401115:	0f 1f 40 00          	nopl   0x0(%rax)
  401119:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000401120 <_mm_free>:
  401120:	f3 0f 1e fa          	repz nop %edx
  401124:	48 85 ff             	test   %rdi,%rdi
  401127:	75 01                	jne    40112a <_mm_free+0xa>
  401129:	c3                   	retq   
  40112a:	48 8b 7f f8          	mov    -0x8(%rdi),%rdi
  40112e:	e9 ed fa ff ff       	jmpq   400c20 <free@plt>
  401133:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401138:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40113f:	00 

0000000000401140 <__intel_new_feature_proc_init>:
  401140:	f3 0f 1e fa          	repz nop %edx
  401144:	41 56                	push   %r14
  401146:	41 89 fe             	mov    %edi,%r14d
  401149:	33 ff                	xor    %edi,%edi
  40114b:	e8 70 00 00 00       	callq  4011c0 <__intel_new_feature_proc_init_n>
  401150:	be 06 00 00 00       	mov    $0x6,%esi
  401155:	48 8d 3d c4 59 20 00 	lea    0x2059c4(%rip),%rdi        # 606b20 <__intel_cpu_feature_indicator>
  40115c:	e8 bf 0b 00 00       	callq  401d20 <__libirc_get_cpu_feature>
  401161:	83 f8 01             	cmp    $0x1,%eax
  401164:	74 44                	je     4011aa <__intel_new_feature_proc_init+0x6a>
  401166:	85 c0                	test   %eax,%eax
  401168:	7c 03                	jl     40116d <__intel_new_feature_proc_init+0x2d>
  40116a:	41 5e                	pop    %r14
  40116c:	c3                   	retq   
  40116d:	33 f6                	xor    %esi,%esi
  40116f:	bf 01 00 00 00       	mov    $0x1,%edi
  401174:	33 d2                	xor    %edx,%edx
  401176:	33 c0                	xor    %eax,%eax
  401178:	e8 73 06 00 00       	callq  4017f0 <__libirc_print>
  40117d:	bf 01 00 00 00       	mov    $0x1,%edi
  401182:	be 3a 00 00 00       	mov    $0x3a,%esi
  401187:	33 d2                	xor    %edx,%edx
  401189:	33 c0                	xor    %eax,%eax
  40118b:	e8 60 06 00 00       	callq  4017f0 <__libirc_print>
  401190:	33 f6                	xor    %esi,%esi
  401192:	bf 01 00 00 00       	mov    $0x1,%edi
  401197:	33 d2                	xor    %edx,%edx
  401199:	33 c0                	xor    %eax,%eax
  40119b:	e8 50 06 00 00       	callq  4017f0 <__libirc_print>
  4011a0:	bf 01 00 00 00       	mov    $0x1,%edi
  4011a5:	e8 26 fa ff ff       	callq  400bd0 <exit@plt>
  4011aa:	33 ff                	xor    %edi,%edi
  4011ac:	44 89 f6             	mov    %r14d,%esi
  4011af:	41 5e                	pop    %r14
  4011b1:	e9 4a 21 00 00       	jmpq   403300 <__intel_proc_init_ftzdazule>
  4011b6:	0f 1f 00             	nopl   (%rax)
  4011b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004011c0 <__intel_new_feature_proc_init_n>:
  4011c0:	f3 0f 1e fa          	repz nop %edx
  4011c4:	41 54                	push   %r12
  4011c6:	41 55                	push   %r13
  4011c8:	41 56                	push   %r14
  4011ca:	48 81 ec 40 04 00 00 	sub    $0x440,%rsp
  4011d1:	49 89 f6             	mov    %rsi,%r14
  4011d4:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4011db:	00 00 
  4011dd:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4011e1:	48 33 c4             	xor    %rsp,%rax
  4011e4:	48 89 84 24 30 04 00 	mov    %rax,0x430(%rsp)
  4011eb:	00 
  4011ec:	4c 63 ef             	movslq %edi,%r13
  4011ef:	f3 0f 7f 44 24 20    	movdqu %xmm0,0x20(%rsp)
  4011f5:	4c 8d 25 24 59 20 00 	lea    0x205924(%rip),%r12        # 606b20 <__intel_cpu_feature_indicator>
  4011fc:	49 83 3c 24 00       	cmpq   $0x0,(%r12)
  401201:	0f 84 19 03 00 00    	je     401520 <__intel_new_feature_proc_init_n+0x360>
  401207:	49 83 fd 02          	cmp    $0x2,%r13
  40120b:	0f 8d 7c 02 00 00    	jge    40148d <__intel_new_feature_proc_init_n+0x2cd>
  401211:	4c 89 f0             	mov    %r14,%rax
  401214:	4b 8b 14 ec          	mov    (%r12,%r13,8),%rdx
  401218:	48 23 c2             	and    %rdx,%rax
  40121b:	49 3b c6             	cmp    %r14,%rax
  40121e:	75 28                	jne    401248 <__intel_new_feature_proc_init_n+0x88>
  401220:	48 8b 84 24 30 04 00 	mov    0x430(%rsp),%rax
  401227:	00 
  401228:	48 33 c4             	xor    %rsp,%rax
  40122b:	64 48 3b 04 25 28 00 	cmp    %fs:0x28,%rax
  401232:	00 00 
  401234:	0f 85 65 02 00 00    	jne    40149f <__intel_new_feature_proc_init_n+0x2df>
  40123a:	48 81 c4 40 04 00 00 	add    $0x440,%rsp
  401241:	41 5e                	pop    %r14
  401243:	41 5d                	pop    %r13
  401245:	41 5c                	pop    %r12
  401247:	c3                   	retq   
  401248:	48 f7 d2             	not    %rdx
  40124b:	bf 39 00 00 00       	mov    $0x39,%edi
  401250:	49 23 d6             	and    %r14,%rdx
  401253:	45 33 f6             	xor    %r14d,%r14d
  401256:	33 f6                	xor    %esi,%esi
  401258:	33 c0                	xor    %eax,%eax
  40125a:	4a 89 54 ec 20       	mov    %rdx,0x20(%rsp,%r13,8)
  40125f:	e8 fc 02 00 00       	callq  401560 <__libirc_get_msg>
  401264:	c6 44 24 30 00       	movb   $0x0,0x30(%rsp)
  401269:	45 33 ed             	xor    %r13d,%r13d
  40126c:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  401271:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  401277:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
  40127c:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
  401281:	48 89 2c 24          	mov    %rbp,(%rsp)
  401285:	44 89 e0             	mov    %r12d,%eax
  401288:	e8 a3 08 00 00       	callq  401b30 <__libirc_get_feature_bitpos>
  40128d:	85 c0                	test   %eax,%eax
  40128f:	0f 8c 1d 01 00 00    	jl     4013b2 <__intel_new_feature_proc_init_n+0x1f2>
  401295:	44 89 e6             	mov    %r12d,%esi
  401298:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  40129d:	e8 7e 0a 00 00       	callq  401d20 <__libirc_get_cpu_feature>
  4012a2:	85 c0                	test   %eax,%eax
  4012a4:	0f 84 08 01 00 00    	je     4013b2 <__intel_new_feature_proc_init_n+0x1f2>
  4012aa:	44 89 e6             	mov    %r12d,%esi
  4012ad:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  4012b2:	e8 69 0a 00 00       	callq  401d20 <__libirc_get_cpu_feature>
  4012b7:	85 c0                	test   %eax,%eax
  4012b9:	0f 8c 3e 02 00 00    	jl     4014fd <__intel_new_feature_proc_init_n+0x33d>
  4012bf:	44 89 e7             	mov    %r12d,%edi
  4012c2:	e8 39 08 00 00       	callq  401b00 <__libirc_get_feature_name>
  4012c7:	48 89 c3             	mov    %rax,%rbx
  4012ca:	48 85 db             	test   %rbx,%rbx
  4012cd:	0f 84 07 02 00 00    	je     4014da <__intel_new_feature_proc_init_n+0x31a>
  4012d3:	80 3b 00             	cmpb   $0x0,(%rbx)
  4012d6:	0f 84 fe 01 00 00    	je     4014da <__intel_new_feature_proc_init_n+0x31a>
  4012dc:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
  4012e1:	0f 84 9f 00 00 00    	je     401386 <__intel_new_feature_proc_init_n+0x1c6>
  4012e7:	4d 85 f6             	test   %r14,%r14
  4012ea:	0f 84 91 00 00 00    	je     401381 <__intel_new_feature_proc_init_n+0x1c1>
  4012f0:	4c 89 f7             	mov    %r14,%rdi
  4012f3:	e8 38 f9 ff ff       	callq  400c30 <strlen@plt>
  4012f8:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  4012fd:	49 89 c7             	mov    %rax,%r15
  401300:	e8 2b f9 ff ff       	callq  400c30 <strlen@plt>
  401305:	48 89 df             	mov    %rbx,%rdi
  401308:	48 89 c5             	mov    %rax,%rbp
  40130b:	e8 20 f9 ff ff       	callq  400c30 <strlen@plt>
  401310:	4d 03 fd             	add    %r13,%r15
  401313:	4c 03 fd             	add    %rbp,%r15
  401316:	49 8d 4c 07 02       	lea    0x2(%r15,%rax,1),%rcx
  40131b:	48 81 f9 00 04 00 00 	cmp    $0x400,%rcx
  401322:	0f 83 7c 01 00 00    	jae    4014a4 <__intel_new_feature_proc_init_n+0x2e4>
  401328:	49 f7 dd             	neg    %r13
  40132b:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  401330:	49 81 c5 ff 03 00 00 	add    $0x3ff,%r13
  401337:	48 8d 35 36 22 00 00 	lea    0x2236(%rip),%rsi        # 403574 <il0_peep_printf_format_0+0xd4>
  40133e:	4c 89 ea             	mov    %r13,%rdx
  401341:	b9 00 04 00 00       	mov    $0x400,%ecx
  401346:	e8 b5 f9 ff ff       	callq  400d00 <__strncat_chk@plt>
  40134b:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  401350:	e8 db f8 ff ff       	callq  400c30 <strlen@plt>
  401355:	48 63 d0             	movslq %eax,%rdx
  401358:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  40135d:	48 f7 da             	neg    %rdx
  401360:	4c 89 f6             	mov    %r14,%rsi
  401363:	48 81 c2 ff 03 00 00 	add    $0x3ff,%rdx
  40136a:	b9 00 04 00 00       	mov    $0x400,%ecx
  40136f:	e8 8c f9 ff ff       	callq  400d00 <__strncat_chk@plt>
  401374:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  401379:	e8 b2 f8 ff ff       	callq  400c30 <strlen@plt>
  40137e:	4c 63 e8             	movslq %eax,%r13
  401381:	49 89 de             	mov    %rbx,%r14
  401384:	eb 2c                	jmp    4013b2 <__intel_new_feature_proc_init_n+0x1f2>
  401386:	49 f7 dd             	neg    %r13
  401389:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  40138e:	49 81 c5 ff 03 00 00 	add    $0x3ff,%r13
  401395:	48 89 de             	mov    %rbx,%rsi
  401398:	4c 89 ea             	mov    %r13,%rdx
  40139b:	b9 00 04 00 00       	mov    $0x400,%ecx
  4013a0:	e8 5b f9 ff ff       	callq  400d00 <__strncat_chk@plt>
  4013a5:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4013aa:	e8 81 f8 ff ff       	callq  400c30 <strlen@plt>
  4013af:	4c 63 e8             	movslq %eax,%r13
  4013b2:	41 ff c4             	inc    %r12d
  4013b5:	41 83 fc 40          	cmp    $0x40,%r12d
  4013b9:	0f 8c c6 fe ff ff    	jl     401285 <__intel_new_feature_proc_init_n+0xc5>
  4013bf:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4013c4:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
  4013c9:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  4013ce:	48 8b 2c 24          	mov    (%rsp),%rbp
  4013d2:	4d 85 f6             	test   %r14,%r14
  4013d5:	74 48                	je     40141f <__intel_new_feature_proc_init_n+0x25f>
  4013d7:	49 f7 dd             	neg    %r13
  4013da:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4013df:	49 81 c5 ff 03 00 00 	add    $0x3ff,%r13
  4013e6:	48 89 c6             	mov    %rax,%rsi
  4013e9:	4c 89 ea             	mov    %r13,%rdx
  4013ec:	b9 00 04 00 00       	mov    $0x400,%ecx
  4013f1:	e8 0a f9 ff ff       	callq  400d00 <__strncat_chk@plt>
  4013f6:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4013fb:	e8 30 f8 ff ff       	callq  400c30 <strlen@plt>
  401400:	48 63 d0             	movslq %eax,%rdx
  401403:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  401408:	48 f7 da             	neg    %rdx
  40140b:	4c 89 f6             	mov    %r14,%rsi
  40140e:	48 81 c2 ff 03 00 00 	add    $0x3ff,%rdx
  401415:	b9 00 04 00 00       	mov    $0x400,%ecx
  40141a:	e8 e1 f8 ff ff       	callq  400d00 <__strncat_chk@plt>
  40141f:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
  401424:	75 3d                	jne    401463 <__intel_new_feature_proc_init_n+0x2a3>
  401426:	33 f6                	xor    %esi,%esi
  401428:	bf 01 00 00 00       	mov    $0x1,%edi
  40142d:	33 d2                	xor    %edx,%edx
  40142f:	33 c0                	xor    %eax,%eax
  401431:	e8 ba 03 00 00       	callq  4017f0 <__libirc_print>
  401436:	bf 01 00 00 00       	mov    $0x1,%edi
  40143b:	be 3a 00 00 00       	mov    $0x3a,%esi
  401440:	33 d2                	xor    %edx,%edx
  401442:	33 c0                	xor    %eax,%eax
  401444:	e8 a7 03 00 00       	callq  4017f0 <__libirc_print>
  401449:	33 f6                	xor    %esi,%esi
  40144b:	bf 01 00 00 00       	mov    $0x1,%edi
  401450:	33 d2                	xor    %edx,%edx
  401452:	33 c0                	xor    %eax,%eax
  401454:	e8 97 03 00 00       	callq  4017f0 <__libirc_print>
  401459:	bf 01 00 00 00       	mov    $0x1,%edi
  40145e:	e8 6d f7 ff ff       	callq  400bd0 <exit@plt>
  401463:	33 f6                	xor    %esi,%esi
  401465:	bf 01 00 00 00       	mov    $0x1,%edi
  40146a:	33 d2                	xor    %edx,%edx
  40146c:	33 c0                	xor    %eax,%eax
  40146e:	e8 7d 03 00 00       	callq  4017f0 <__libirc_print>
  401473:	bf 01 00 00 00       	mov    $0x1,%edi
  401478:	be 38 00 00 00       	mov    $0x38,%esi
  40147d:	89 fa                	mov    %edi,%edx
  40147f:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
  401484:	33 c0                	xor    %eax,%eax
  401486:	e8 65 03 00 00       	callq  4017f0 <__libirc_print>
  40148b:	eb bc                	jmp    401449 <__intel_new_feature_proc_init_n+0x289>
  40148d:	33 f6                	xor    %esi,%esi
  40148f:	bf 01 00 00 00       	mov    $0x1,%edi
  401494:	33 d2                	xor    %edx,%edx
  401496:	33 c0                	xor    %eax,%eax
  401498:	e8 53 03 00 00       	callq  4017f0 <__libirc_print>
  40149d:	eb 97                	jmp    401436 <__intel_new_feature_proc_init_n+0x276>
  40149f:	e8 1c f8 ff ff       	callq  400cc0 <__stack_chk_fail@plt>
  4014a4:	49 f7 dd             	neg    %r13
  4014a7:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4014ac:	49 81 c5 ff 03 00 00 	add    $0x3ff,%r13
  4014b3:	b9 00 04 00 00       	mov    $0x400,%ecx
  4014b8:	48 8b 47 e8          	mov    -0x18(%rdi),%rax
  4014bc:	48 89 c6             	mov    %rax,%rsi
  4014bf:	4c 89 ea             	mov    %r13,%rdx
  4014c2:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
  4014c7:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  4014cc:	48 8b 2c 24          	mov    (%rsp),%rbp
  4014d0:	e8 2b f8 ff ff       	callq  400d00 <__strncat_chk@plt>
  4014d5:	e9 1c ff ff ff       	jmpq   4013f6 <__intel_new_feature_proc_init_n+0x236>
  4014da:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
  4014df:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  4014e4:	48 8b 2c 24          	mov    (%rsp),%rbp
  4014e8:	33 f6                	xor    %esi,%esi
  4014ea:	bf 01 00 00 00       	mov    $0x1,%edi
  4014ef:	33 d2                	xor    %edx,%edx
  4014f1:	33 c0                	xor    %eax,%eax
  4014f3:	e8 f8 02 00 00       	callq  4017f0 <__libirc_print>
  4014f8:	e9 39 ff ff ff       	jmpq   401436 <__intel_new_feature_proc_init_n+0x276>
  4014fd:	33 f6                	xor    %esi,%esi
  4014ff:	bf 01 00 00 00       	mov    $0x1,%edi
  401504:	33 d2                	xor    %edx,%edx
  401506:	33 c0                	xor    %eax,%eax
  401508:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
  40150d:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  401512:	48 8b 2c 24          	mov    (%rsp),%rbp
  401516:	e8 d5 02 00 00       	callq  4017f0 <__libirc_print>
  40151b:	e9 16 ff ff ff       	jmpq   401436 <__intel_new_feature_proc_init_n+0x276>
  401520:	33 c0                	xor    %eax,%eax
  401522:	e8 59 12 00 00       	callq  402780 <__intel_cpu_features_init>
  401527:	85 c0                	test   %eax,%eax
  401529:	75 0b                	jne    401536 <__intel_new_feature_proc_init_n+0x376>
  40152b:	49 83 3c 24 00       	cmpq   $0x0,(%r12)
  401530:	0f 85 d1 fc ff ff    	jne    401207 <__intel_new_feature_proc_init_n+0x47>
  401536:	33 f6                	xor    %esi,%esi
  401538:	bf 01 00 00 00       	mov    $0x1,%edi
  40153d:	33 d2                	xor    %edx,%edx
  40153f:	33 c0                	xor    %eax,%eax
  401541:	e8 aa 02 00 00       	callq  4017f0 <__libirc_print>
  401546:	bf 01 00 00 00       	mov    $0x1,%edi
  40154b:	be 3b 00 00 00       	mov    $0x3b,%esi
  401550:	33 d2                	xor    %edx,%edx
  401552:	33 c0                	xor    %eax,%eax
  401554:	e8 97 02 00 00       	callq  4017f0 <__libirc_print>
  401559:	e9 eb fe ff ff       	jmpq   401449 <__intel_new_feature_proc_init_n+0x289>
  40155e:	66 90                	xchg   %ax,%ax

0000000000401560 <__libirc_get_msg>:
  401560:	f3 0f 1e fa          	repz nop %edx
  401564:	41 54                	push   %r12
  401566:	41 55                	push   %r13
  401568:	41 56                	push   %r14
  40156a:	48 81 ec 50 01 00 00 	sub    $0x150,%rsp
  401571:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  401576:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
  40157b:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
  401580:	4c 89 4c 24 28       	mov    %r9,0x28(%rsp)
  401585:	44 0f b6 d8          	movzbl %al,%r11d
  401589:	4a 8d 04 9d 00 00 00 	lea    0x0(,%r11,4),%rax
  401590:	00 
  401591:	4c 8d 1d 2f 00 00 00 	lea    0x2f(%rip),%r11        # 4015c7 <__libirc_get_msg+0x67>
  401598:	4c 2b d8             	sub    %rax,%r11
  40159b:	48 8d 84 24 af 00 00 	lea    0xaf(%rsp),%rax
  4015a2:	00 
  4015a3:	3e 41 ff e3          	ds jmpq *%r11
  4015a7:	0f 29 78 f1          	movaps %xmm7,-0xf(%rax)
  4015ab:	0f 29 70 e1          	movaps %xmm6,-0x1f(%rax)
  4015af:	0f 29 68 d1          	movaps %xmm5,-0x2f(%rax)
  4015b3:	0f 29 60 c1          	movaps %xmm4,-0x3f(%rax)
  4015b7:	0f 29 58 b1          	movaps %xmm3,-0x4f(%rax)
  4015bb:	0f 29 50 a1          	movaps %xmm2,-0x5f(%rax)
  4015bf:	0f 29 48 91          	movaps %xmm1,-0x6f(%rax)
  4015c3:	0f 29 40 81          	movaps %xmm0,-0x7f(%rax)
  4015c7:	41 89 fd             	mov    %edi,%r13d
  4015ca:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4015d1:	00 00 
  4015d3:	41 89 f6             	mov    %esi,%r14d
  4015d6:	48 33 c4             	xor    %rsp,%rax
  4015d9:	48 89 84 24 48 01 00 	mov    %rax,0x148(%rsp)
  4015e0:	00 
  4015e1:	45 85 ed             	test   %r13d,%r13d
  4015e4:	0f 84 87 00 00 00    	je     401671 <__libirc_get_msg+0x111>
  4015ea:	83 3d e3 4a 20 00 00 	cmpl   $0x0,0x204ae3(%rip)        # 6060d4 <first_msg>
  4015f1:	74 5b                	je     40164e <__libirc_get_msg+0xee>
  4015f3:	48 8d 3d 7e 1f 00 00 	lea    0x1f7e(%rip),%rdi        # 403578 <il0_peep_printf_format_0+0xd8>
  4015fa:	33 f6                	xor    %esi,%esi
  4015fc:	c7 05 ce 4a 20 00 00 	movl   $0x0,0x204ace(%rip)        # 6060d4 <first_msg>
  401603:	00 00 00 
  401606:	e8 85 f6 ff ff       	callq  400c90 <catopen@plt>
  40160b:	48 89 05 ee 4e 20 00 	mov    %rax,0x204eee(%rip)        # 606500 <message_catalog>
  401612:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  401616:	0f 84 0d 01 00 00    	je     401729 <__libirc_get_msg+0x1c9>
  40161c:	48 8b 3d dd 4e 20 00 	mov    0x204edd(%rip),%rdi        # 606500 <message_catalog>
  401623:	c7 05 ab 4a 20 00 00 	movl   $0x0,0x204aab(%rip)        # 6060d8 <use_internal_msg>
  40162a:	00 00 00 
  40162d:	49 63 c5             	movslq %r13d,%rax
  401630:	4c 8d 05 d1 43 20 00 	lea    0x2043d1(%rip),%r8        # 605a08 <irc_msgtab+0x8>
  401637:	48 c1 e0 04          	shl    $0x4,%rax
  40163b:	be 01 00 00 00       	mov    $0x1,%esi
  401640:	44 89 ea             	mov    %r13d,%edx
  401643:	4a 8b 0c 00          	mov    (%rax,%r8,1),%rcx
  401647:	e8 c4 f5 ff ff       	callq  400c10 <catgets@plt>
  40164c:	eb 2a                	jmp    401678 <__libirc_get_msg+0x118>
  40164e:	8b 05 84 4a 20 00    	mov    0x204a84(%rip),%eax        # 6060d8 <use_internal_msg>
  401654:	85 c0                	test   %eax,%eax
  401656:	0f 84 7d 01 00 00    	je     4017d9 <__libirc_get_msg+0x279>
  40165c:	4d 63 ed             	movslq %r13d,%r13
  40165f:	48 8d 05 a2 43 20 00 	lea    0x2043a2(%rip),%rax        # 605a08 <irc_msgtab+0x8>
  401666:	49 c1 e5 04          	shl    $0x4,%r13
  40166a:	49 8b 44 05 00       	mov    0x0(%r13,%rax,1),%rax
  40166f:	eb 07                	jmp    401678 <__libirc_get_msg+0x118>
  401671:	48 8d 05 f8 1e 00 00 	lea    0x1ef8(%rip),%rax        # 403570 <il0_peep_printf_format_0+0xd0>
  401678:	45 85 f6             	test   %r14d,%r14d
  40167b:	0f 8e 80 00 00 00    	jle    401701 <__libirc_get_msg+0x1a1>
  401681:	c7 84 24 b0 00 00 00 	movl   $0x10,0xb0(%rsp)
  401688:	10 00 00 00 
  40168c:	48 8d 94 24 70 01 00 	lea    0x170(%rsp),%rdx
  401693:	00 
  401694:	c7 84 24 b4 00 00 00 	movl   $0x30,0xb4(%rsp)
  40169b:	30 00 00 00 
  40169f:	48 8d 34 24          	lea    (%rsp),%rsi
  4016a3:	48 89 96 b8 00 00 00 	mov    %rdx,0xb8(%rsi)
  4016aa:	48 89 b6 c0 00 00 00 	mov    %rsi,0xc0(%rsi)
  4016b1:	48 8d 3d 48 4a 20 00 	lea    0x204a48(%rip),%rdi        # 606100 <get_msg_buf>
  4016b8:	be 01 00 00 00       	mov    $0x1,%esi
  4016bd:	ba 00 02 00 00       	mov    $0x200,%edx
  4016c2:	48 89 c1             	mov    %rax,%rcx
  4016c5:	4c 8d 84 24 b0 00 00 	lea    0xb0(%rsp),%r8
  4016cc:	00 
  4016cd:	e8 6e f5 ff ff       	callq  400c40 <__vsprintf_chk@plt>
  4016d2:	48 8b 84 24 48 01 00 	mov    0x148(%rsp),%rax
  4016d9:	00 
  4016da:	48 33 c4             	xor    %rsp,%rax
  4016dd:	64 48 3b 04 25 28 00 	cmp    %fs:0x28,%rax
  4016e4:	00 00 
  4016e6:	0f 85 e8 00 00 00    	jne    4017d4 <__libirc_get_msg+0x274>
  4016ec:	48 8d 05 0d 4a 20 00 	lea    0x204a0d(%rip),%rax        # 606100 <get_msg_buf>
  4016f3:	48 81 c4 50 01 00 00 	add    $0x150,%rsp
  4016fa:	41 5e                	pop    %r14
  4016fc:	41 5d                	pop    %r13
  4016fe:	41 5c                	pop    %r12
  401700:	c3                   	retq   
  401701:	48 8b 94 24 48 01 00 	mov    0x148(%rsp),%rdx
  401708:	00 
  401709:	48 33 d4             	xor    %rsp,%rdx
  40170c:	64 48 3b 14 25 28 00 	cmp    %fs:0x28,%rdx
  401713:	00 00 
  401715:	0f 85 b9 00 00 00    	jne    4017d4 <__libirc_get_msg+0x274>
  40171b:	48 81 c4 50 01 00 00 	add    $0x150,%rsp
  401722:	41 5e                	pop    %r14
  401724:	41 5d                	pop    %r13
  401726:	41 5c                	pop    %r12
  401728:	c3                   	retq   
  401729:	48 8d 3d e8 23 00 00 	lea    0x23e8(%rip),%rdi        # 403b18 <il0_peep_printf_format_0+0x678>
  401730:	e8 6b f5 ff ff       	callq  400ca0 <getenv@plt>
  401735:	48 85 c0             	test   %rax,%rax
  401738:	0f 84 80 00 00 00    	je     4017be <__libirc_get_msg+0x25e>
  40173e:	48 89 c6             	mov    %rax,%rsi
  401741:	48 8d bc 24 c8 00 00 	lea    0xc8(%rsp),%rdi
  401748:	00 
  401749:	ba 80 00 00 00       	mov    $0x80,%edx
  40174e:	e8 7d f5 ff ff       	callq  400cd0 <strncpy@plt>
  401753:	be 2e 00 00 00       	mov    $0x2e,%esi
  401758:	48 8d bc 24 c8 00 00 	lea    0xc8(%rsp),%rdi
  40175f:	00 
  401760:	e8 0b f5 ff ff       	callq  400c70 <strchr@plt>
  401765:	49 89 c4             	mov    %rax,%r12
  401768:	4d 85 e4             	test   %r12,%r12
  40176b:	74 51                	je     4017be <__libirc_get_msg+0x25e>
  40176d:	48 8d 3d a4 23 00 00 	lea    0x23a4(%rip),%rdi        # 403b18 <il0_peep_printf_format_0+0x678>
  401774:	48 8d b4 24 c8 00 00 	lea    0xc8(%rsp),%rsi
  40177b:	00 
  40177c:	ba 01 00 00 00       	mov    $0x1,%edx
  401781:	41 c6 04 24 00       	movb   $0x0,(%r12)
  401786:	e8 f5 f4 ff ff       	callq  400c80 <setenv@plt>
  40178b:	48 8d 3d e6 1d 00 00 	lea    0x1de6(%rip),%rdi        # 403578 <il0_peep_printf_format_0+0xd8>
  401792:	33 f6                	xor    %esi,%esi
  401794:	e8 f7 f4 ff ff       	callq  400c90 <catopen@plt>
  401799:	48 8d 3d 78 23 00 00 	lea    0x2378(%rip),%rdi        # 403b18 <il0_peep_printf_format_0+0x678>
  4017a0:	48 8d b4 24 c8 00 00 	lea    0xc8(%rsp),%rsi
  4017a7:	00 
  4017a8:	ba 01 00 00 00       	mov    $0x1,%edx
  4017ad:	48 89 05 4c 4d 20 00 	mov    %rax,0x204d4c(%rip)        # 606500 <message_catalog>
  4017b4:	41 c6 04 24 2e       	movb   $0x2e,(%r12)
  4017b9:	e8 c2 f4 ff ff       	callq  400c80 <setenv@plt>
  4017be:	48 8b 3d 3b 4d 20 00 	mov    0x204d3b(%rip),%rdi        # 606500 <message_catalog>
  4017c5:	48 83 ff ff          	cmp    $0xffffffffffffffff,%rdi
  4017c9:	0f 85 54 fe ff ff    	jne    401623 <__libirc_get_msg+0xc3>
  4017cf:	e9 7a fe ff ff       	jmpq   40164e <__libirc_get_msg+0xee>
  4017d4:	e8 e7 f4 ff ff       	callq  400cc0 <__stack_chk_fail@plt>
  4017d9:	48 8b 3d 20 4d 20 00 	mov    0x204d20(%rip),%rdi        # 606500 <message_catalog>
  4017e0:	e9 48 fe ff ff       	jmpq   40162d <__libirc_get_msg+0xcd>
  4017e5:	0f 1f 40 00          	nopl   0x0(%rax)
  4017e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004017f0 <__libirc_print>:
  4017f0:	f3 0f 1e fa          	repz nop %edx
  4017f4:	41 56                	push   %r14
  4017f6:	41 57                	push   %r15
  4017f8:	53                   	push   %rbx
  4017f9:	55                   	push   %rbp
  4017fa:	48 81 ec 58 01 00 00 	sub    $0x158,%rsp
  401801:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
  401806:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
  40180b:	4c 89 4c 24 28       	mov    %r9,0x28(%rsp)
  401810:	44 0f b6 d8          	movzbl %al,%r11d
  401814:	4a 8d 04 9d 00 00 00 	lea    0x0(,%r11,4),%rax
  40181b:	00 
  40181c:	4c 8d 1d 2f 00 00 00 	lea    0x2f(%rip),%r11        # 401852 <__libirc_print+0x62>
  401823:	4c 2b d8             	sub    %rax,%r11
  401826:	48 8d 84 24 af 00 00 	lea    0xaf(%rsp),%rax
  40182d:	00 
  40182e:	3e 41 ff e3          	ds jmpq *%r11
  401832:	0f 29 78 f1          	movaps %xmm7,-0xf(%rax)
  401836:	0f 29 70 e1          	movaps %xmm6,-0x1f(%rax)
  40183a:	0f 29 68 d1          	movaps %xmm5,-0x2f(%rax)
  40183e:	0f 29 60 c1          	movaps %xmm4,-0x3f(%rax)
  401842:	0f 29 58 b1          	movaps %xmm3,-0x4f(%rax)
  401846:	0f 29 50 a1          	movaps %xmm2,-0x5f(%rax)
  40184a:	0f 29 48 91          	movaps %xmm1,-0x6f(%rax)
  40184e:	0f 29 40 81          	movaps %xmm0,-0x7f(%rax)
  401852:	41 89 f6             	mov    %esi,%r14d
  401855:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40185c:	00 00 
  40185e:	41 89 d7             	mov    %edx,%r15d
  401861:	48 33 c4             	xor    %rsp,%rax
  401864:	89 fd                	mov    %edi,%ebp
  401866:	48 89 84 24 48 01 00 	mov    %rax,0x148(%rsp)
  40186d:	00 
  40186e:	45 85 f6             	test   %r14d,%r14d
  401871:	75 44                	jne    4018b7 <__libirc_print+0xc7>
  401873:	83 fd 01             	cmp    $0x1,%ebp
  401876:	0f 84 72 01 00 00    	je     4019ee <__libirc_print+0x1fe>
  40187c:	bf 01 00 00 00       	mov    $0x1,%edi
  401881:	48 8d 35 cc 1c 00 00 	lea    0x1ccc(%rip),%rsi        # 403554 <il0_peep_printf_format_0+0xb4>
  401888:	33 c0                	xor    %eax,%eax
  40188a:	e8 51 f3 ff ff       	callq  400be0 <__printf_chk@plt>
  40188f:	48 8b 84 24 48 01 00 	mov    0x148(%rsp),%rax
  401896:	00 
  401897:	48 33 c4             	xor    %rsp,%rax
  40189a:	64 48 3b 04 25 28 00 	cmp    %fs:0x28,%rax
  4018a1:	00 00 
  4018a3:	0f 85 40 01 00 00    	jne    4019e9 <__libirc_print+0x1f9>
  4018a9:	48 81 c4 58 01 00 00 	add    $0x158,%rsp
  4018b0:	5d                   	pop    %rbp
  4018b1:	5b                   	pop    %rbx
  4018b2:	41 5f                	pop    %r15
  4018b4:	41 5e                	pop    %r14
  4018b6:	c3                   	retq   
  4018b7:	83 3d 16 48 20 00 00 	cmpl   $0x0,0x204816(%rip)        # 6060d4 <first_msg>
  4018be:	74 3c                	je     4018fc <__libirc_print+0x10c>
  4018c0:	48 8d 3d b1 1c 00 00 	lea    0x1cb1(%rip),%rdi        # 403578 <il0_peep_printf_format_0+0xd8>
  4018c7:	33 f6                	xor    %esi,%esi
  4018c9:	c7 05 01 48 20 00 00 	movl   $0x0,0x204801(%rip)        # 6060d4 <first_msg>
  4018d0:	00 00 00 
  4018d3:	e8 b8 f3 ff ff       	callq  400c90 <catopen@plt>
  4018d8:	48 89 05 21 4c 20 00 	mov    %rax,0x204c21(%rip)        # 606500 <message_catalog>
  4018df:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  4018e3:	0f 84 27 01 00 00    	je     401a10 <__libirc_print+0x220>
  4018e9:	48 8b 3d 10 4c 20 00 	mov    0x204c10(%rip),%rdi        # 606500 <message_catalog>
  4018f0:	c7 05 de 47 20 00 00 	movl   $0x0,0x2047de(%rip)        # 6060d8 <use_internal_msg>
  4018f7:	00 00 00 
  4018fa:	eb 22                	jmp    40191e <__libirc_print+0x12e>
  4018fc:	8b 05 d6 47 20 00    	mov    0x2047d6(%rip),%eax        # 6060d8 <use_internal_msg>
  401902:	85 c0                	test   %eax,%eax
  401904:	0f 84 dd 01 00 00    	je     401ae7 <__libirc_print+0x2f7>
  40190a:	4d 63 f6             	movslq %r14d,%r14
  40190d:	48 8d 05 f4 40 20 00 	lea    0x2040f4(%rip),%rax        # 605a08 <irc_msgtab+0x8>
  401914:	49 c1 e6 04          	shl    $0x4,%r14
  401918:	49 8b 0c 06          	mov    (%r14,%rax,1),%rcx
  40191c:	eb 22                	jmp    401940 <__libirc_print+0x150>
  40191e:	49 63 c6             	movslq %r14d,%rax
  401921:	48 8d 1d e0 40 20 00 	lea    0x2040e0(%rip),%rbx        # 605a08 <irc_msgtab+0x8>
  401928:	48 c1 e0 04          	shl    $0x4,%rax
  40192c:	be 01 00 00 00       	mov    $0x1,%esi
  401931:	44 89 f2             	mov    %r14d,%edx
  401934:	48 8b 0c 18          	mov    (%rax,%rbx,1),%rcx
  401938:	e8 d3 f2 ff ff       	callq  400c10 <catgets@plt>
  40193d:	48 89 c1             	mov    %rax,%rcx
  401940:	45 85 ff             	test   %r15d,%r15d
  401943:	7e 55                	jle    40199a <__libirc_print+0x1aa>
  401945:	c7 84 24 b0 00 00 00 	movl   $0x18,0xb0(%rsp)
  40194c:	18 00 00 00 
  401950:	48 8d 84 24 80 01 00 	lea    0x180(%rsp),%rax
  401957:	00 
  401958:	c7 84 24 b4 00 00 00 	movl   $0x30,0xb4(%rsp)
  40195f:	30 00 00 00 
  401963:	48 8d 1c 24          	lea    (%rsp),%rbx
  401967:	48 89 83 b8 00 00 00 	mov    %rax,0xb8(%rbx)
  40196e:	48 89 9b c0 00 00 00 	mov    %rbx,0xc0(%rbx)
  401975:	48 8d 3d 84 49 20 00 	lea    0x204984(%rip),%rdi        # 606300 <print_buf>
  40197c:	be 01 00 00 00       	mov    $0x1,%esi
  401981:	ba 00 02 00 00       	mov    $0x200,%edx
  401986:	4c 8d 84 24 b0 00 00 	lea    0xb0(%rsp),%r8
  40198d:	00 
  40198e:	e8 ad f2 ff ff       	callq  400c40 <__vsprintf_chk@plt>
  401993:	48 8d 0d 66 49 20 00 	lea    0x204966(%rip),%rcx        # 606300 <print_buf>
  40199a:	83 fd 01             	cmp    $0x1,%ebp
  40199d:	0f 84 10 01 00 00    	je     401ab3 <__libirc_print+0x2c3>
  4019a3:	bf 01 00 00 00       	mov    $0x1,%edi
  4019a8:	48 89 ce             	mov    %rcx,%rsi
  4019ab:	33 c0                	xor    %eax,%eax
  4019ad:	e8 2e f2 ff ff       	callq  400be0 <__printf_chk@plt>
  4019b2:	bf 01 00 00 00       	mov    $0x1,%edi
  4019b7:	48 8d 35 96 1b 00 00 	lea    0x1b96(%rip),%rsi        # 403554 <il0_peep_printf_format_0+0xb4>
  4019be:	33 c0                	xor    %eax,%eax
  4019c0:	e8 1b f2 ff ff       	callq  400be0 <__printf_chk@plt>
  4019c5:	48 8b 84 24 48 01 00 	mov    0x148(%rsp),%rax
  4019cc:	00 
  4019cd:	48 33 c4             	xor    %rsp,%rax
  4019d0:	64 48 3b 04 25 28 00 	cmp    %fs:0x28,%rax
  4019d7:	00 00 
  4019d9:	75 0e                	jne    4019e9 <__libirc_print+0x1f9>
  4019db:	48 81 c4 58 01 00 00 	add    $0x158,%rsp
  4019e2:	5d                   	pop    %rbp
  4019e3:	5b                   	pop    %rbx
  4019e4:	41 5f                	pop    %r15
  4019e6:	41 5e                	pop    %r14
  4019e8:	c3                   	retq   
  4019e9:	e8 d2 f2 ff ff       	callq  400cc0 <__stack_chk_fail@plt>
  4019ee:	48 8b 05 03 46 20 00 	mov    0x204603(%rip),%rax        # 605ff8 <stderr@@GLIBC_2.2.5-0xe8>
  4019f5:	be 01 00 00 00       	mov    $0x1,%esi
  4019fa:	48 8d 15 53 1b 00 00 	lea    0x1b53(%rip),%rdx        # 403554 <il0_peep_printf_format_0+0xb4>
  401a01:	48 8b 38             	mov    (%rax),%rdi
  401a04:	33 c0                	xor    %eax,%eax
  401a06:	e8 b5 f1 ff ff       	callq  400bc0 <__fprintf_chk@plt>
  401a0b:	e9 7f fe ff ff       	jmpq   40188f <__libirc_print+0x9f>
  401a10:	48 8d 3d 01 21 00 00 	lea    0x2101(%rip),%rdi        # 403b18 <il0_peep_printf_format_0+0x678>
  401a17:	e8 84 f2 ff ff       	callq  400ca0 <getenv@plt>
  401a1c:	48 85 c0             	test   %rax,%rax
  401a1f:	74 7c                	je     401a9d <__libirc_print+0x2ad>
  401a21:	48 89 c6             	mov    %rax,%rsi
  401a24:	48 8d bc 24 c8 00 00 	lea    0xc8(%rsp),%rdi
  401a2b:	00 
  401a2c:	ba 80 00 00 00       	mov    $0x80,%edx
  401a31:	e8 9a f2 ff ff       	callq  400cd0 <strncpy@plt>
  401a36:	be 2e 00 00 00       	mov    $0x2e,%esi
  401a3b:	48 8d bc 24 c8 00 00 	lea    0xc8(%rsp),%rdi
  401a42:	00 
  401a43:	e8 28 f2 ff ff       	callq  400c70 <strchr@plt>
  401a48:	48 89 c3             	mov    %rax,%rbx
  401a4b:	48 85 db             	test   %rbx,%rbx
  401a4e:	74 4d                	je     401a9d <__libirc_print+0x2ad>
  401a50:	48 8d 3d c1 20 00 00 	lea    0x20c1(%rip),%rdi        # 403b18 <il0_peep_printf_format_0+0x678>
  401a57:	48 8d b4 24 c8 00 00 	lea    0xc8(%rsp),%rsi
  401a5e:	00 
  401a5f:	ba 01 00 00 00       	mov    $0x1,%edx
  401a64:	c6 03 00             	movb   $0x0,(%rbx)
  401a67:	e8 14 f2 ff ff       	callq  400c80 <setenv@plt>
  401a6c:	48 8d 3d 05 1b 00 00 	lea    0x1b05(%rip),%rdi        # 403578 <il0_peep_printf_format_0+0xd8>
  401a73:	33 f6                	xor    %esi,%esi
  401a75:	e8 16 f2 ff ff       	callq  400c90 <catopen@plt>
  401a7a:	48 8d 3d 97 20 00 00 	lea    0x2097(%rip),%rdi        # 403b18 <il0_peep_printf_format_0+0x678>
  401a81:	48 8d b4 24 c8 00 00 	lea    0xc8(%rsp),%rsi
  401a88:	00 
  401a89:	ba 01 00 00 00       	mov    $0x1,%edx
  401a8e:	48 89 05 6b 4a 20 00 	mov    %rax,0x204a6b(%rip)        # 606500 <message_catalog>
  401a95:	c6 03 2e             	movb   $0x2e,(%rbx)
  401a98:	e8 e3 f1 ff ff       	callq  400c80 <setenv@plt>
  401a9d:	48 8b 3d 5c 4a 20 00 	mov    0x204a5c(%rip),%rdi        # 606500 <message_catalog>
  401aa4:	48 83 ff ff          	cmp    $0xffffffffffffffff,%rdi
  401aa8:	0f 85 42 fe ff ff    	jne    4018f0 <__libirc_print+0x100>
  401aae:	e9 49 fe ff ff       	jmpq   4018fc <__libirc_print+0x10c>
  401ab3:	48 8b 1d 3e 45 20 00 	mov    0x20453e(%rip),%rbx        # 605ff8 <stderr@@GLIBC_2.2.5-0xe8>
  401aba:	be 01 00 00 00       	mov    $0x1,%esi
  401abf:	48 89 ca             	mov    %rcx,%rdx
  401ac2:	33 c0                	xor    %eax,%eax
  401ac4:	48 8b 3b             	mov    (%rbx),%rdi
  401ac7:	e8 f4 f0 ff ff       	callq  400bc0 <__fprintf_chk@plt>
  401acc:	be 01 00 00 00       	mov    $0x1,%esi
  401ad1:	48 8d 15 7c 1a 00 00 	lea    0x1a7c(%rip),%rdx        # 403554 <il0_peep_printf_format_0+0xb4>
  401ad8:	33 c0                	xor    %eax,%eax
  401ada:	48 8b 3b             	mov    (%rbx),%rdi
  401add:	e8 de f0 ff ff       	callq  400bc0 <__fprintf_chk@plt>
  401ae2:	e9 de fe ff ff       	jmpq   4019c5 <__libirc_print+0x1d5>
  401ae7:	48 8b 3d 12 4a 20 00 	mov    0x204a12(%rip),%rdi        # 606500 <message_catalog>
  401aee:	e9 2b fe ff ff       	jmpq   40191e <__libirc_print+0x12e>
  401af3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401af8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  401aff:	00 

0000000000401b00 <__libirc_get_feature_name>:
  401b00:	f3 0f 1e fa          	repz nop %edx
  401b04:	56                   	push   %rsi
  401b05:	83 3d 34 50 20 00 00 	cmpl   $0x0,0x205034(%rip)        # 606b40 <__libirc_isa_info_initialized>
  401b0c:	74 13                	je     401b21 <__libirc_get_feature_name+0x21>
  401b0e:	89 ff                	mov    %edi,%edi
  401b10:	48 8d 05 09 4a 20 00 	lea    0x204a09(%rip),%rax        # 606520 <proc_info_features>
  401b17:	48 8d 14 7f          	lea    (%rdi,%rdi,2),%rdx
  401b1b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  401b1f:	59                   	pop    %rcx
  401b20:	c3                   	retq   
  401b21:	e8 fa 02 00 00       	callq  401e20 <__libirc_isa_init_once>
  401b26:	85 c0                	test   %eax,%eax
  401b28:	75 e4                	jne    401b0e <__libirc_get_feature_name+0xe>
  401b2a:	33 c0                	xor    %eax,%eax
  401b2c:	59                   	pop    %rcx
  401b2d:	c3                   	retq   
  401b2e:	66 90                	xchg   %ax,%ax

0000000000401b30 <__libirc_get_feature_bitpos>:
  401b30:	f3 0f 1e fa          	repz nop %edx
  401b34:	55                   	push   %rbp
  401b35:	89 c5                	mov    %eax,%ebp
  401b37:	83 3d 02 50 20 00 00 	cmpl   $0x0,0x205002(%rip)        # 606b40 <__libirc_isa_info_initialized>
  401b3e:	74 25                	je     401b65 <__libirc_get_feature_bitpos+0x35>
  401b40:	48 8d 05 e1 49 20 00 	lea    0x2049e1(%rip),%rax        # 606528 <proc_info_features+0x8>
  401b47:	4c 8d 54 6d 00       	lea    0x0(%rbp,%rbp,2),%r10
  401b4c:	42 8b 04 d0          	mov    (%rax,%r10,8),%eax
  401b50:	83 f8 ff             	cmp    $0xffffffff,%eax
  401b53:	7c 09                	jl     401b5e <__libirc_get_feature_bitpos+0x2e>
  401b55:	3d 80 00 00 00       	cmp    $0x80,%eax
  401b5a:	7d 02                	jge    401b5e <__libirc_get_feature_bitpos+0x2e>
  401b5c:	5d                   	pop    %rbp
  401b5d:	c3                   	retq   
  401b5e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  401b63:	5d                   	pop    %rbp
  401b64:	c3                   	retq   
  401b65:	e8 b6 02 00 00       	callq  401e20 <__libirc_isa_init_once>
  401b6a:	85 c0                	test   %eax,%eax
  401b6c:	75 d2                	jne    401b40 <__libirc_get_feature_bitpos+0x10>
  401b6e:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  401b73:	5d                   	pop    %rbp
  401b74:	c3                   	retq   
  401b75:	0f 1f 40 00          	nopl   0x0(%rax)
  401b79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000401b80 <__libirc_get_disable_mask>:
  401b80:	48 83 ec 28          	sub    $0x28,%rsp
  401b84:	49 89 f9             	mov    %rdi,%r9
  401b87:	4d 89 c8             	mov    %r9,%r8
  401b8a:	33 ff                	xor    %edi,%edi
  401b8c:	49 f7 d8             	neg    %r8
  401b8f:	33 d2                	xor    %edx,%edx
  401b91:	4d 85 c9             	test   %r9,%r9
  401b94:	0f 84 7d 01 00 00    	je     401d17 <__libirc_get_disable_mask+0x197>
  401b9a:	48 85 f6             	test   %rsi,%rsi
  401b9d:	0f 84 74 01 00 00    	je     401d17 <__libirc_get_disable_mask+0x197>
  401ba3:	41 8a 09             	mov    (%r9),%cl
  401ba6:	84 c9                	test   %cl,%cl
  401ba8:	0f 84 40 01 00 00    	je     401cee <__libirc_get_disable_mask+0x16e>
  401bae:	80 f9 2c             	cmp    $0x2c,%cl
  401bb1:	74 15                	je     401bc8 <__libirc_get_disable_mask+0x48>
  401bb3:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
  401bb8:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
  401bbd:	48 89 1c 24          	mov    %rbx,(%rsp)
  401bc1:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
  401bc6:	eb 4b                	jmp    401c13 <__libirc_get_disable_mask+0x93>
  401bc8:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
  401bcd:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
  401bd2:	48 89 1c 24          	mov    %rbx,(%rsp)
  401bd6:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
  401bdb:	49 ff c1             	inc    %r9
  401bde:	49 ff c8             	dec    %r8
  401be1:	41 8a 09             	mov    (%r9),%cl
  401be4:	80 f9 2c             	cmp    $0x2c,%cl
  401be7:	75 2a                	jne    401c13 <__libirc_get_disable_mask+0x93>
  401be9:	49 ff c1             	inc    %r9
  401bec:	49 ff c8             	dec    %r8
  401bef:	41 8a 09             	mov    (%r9),%cl
  401bf2:	80 f9 2c             	cmp    $0x2c,%cl
  401bf5:	75 1c                	jne    401c13 <__libirc_get_disable_mask+0x93>
  401bf7:	49 ff c1             	inc    %r9
  401bfa:	49 ff c8             	dec    %r8
  401bfd:	41 8a 09             	mov    (%r9),%cl
  401c00:	80 f9 2c             	cmp    $0x2c,%cl
  401c03:	75 0e                	jne    401c13 <__libirc_get_disable_mask+0x93>
  401c05:	49 ff c1             	inc    %r9
  401c08:	49 ff c8             	dec    %r8
  401c0b:	41 8a 09             	mov    (%r9),%cl
  401c0e:	80 f9 2c             	cmp    $0x2c,%cl
  401c11:	74 f2                	je     401c05 <__libirc_get_disable_mask+0x85>
  401c13:	84 c9                	test   %cl,%cl
  401c15:	0f 84 c0 00 00 00    	je     401cdb <__libirc_get_disable_mask+0x15b>
  401c1b:	4d 89 cf             	mov    %r9,%r15
  401c1e:	49 ff c1             	inc    %r9
  401c21:	4c 89 c1             	mov    %r8,%rcx
  401c24:	49 ff c8             	dec    %r8
  401c27:	41 8a 19             	mov    (%r9),%bl
  401c2a:	80 fb 2c             	cmp    $0x2c,%bl
  401c2d:	74 19                	je     401c48 <__libirc_get_disable_mask+0xc8>
  401c2f:	84 db                	test   %bl,%bl
  401c31:	0f 84 cc 00 00 00    	je     401d03 <__libirc_get_disable_mask+0x183>
  401c37:	4c 89 cf             	mov    %r9,%rdi
  401c3a:	49 ff c1             	inc    %r9
  401c3d:	49 ff c8             	dec    %r8
  401c40:	41 8a 19             	mov    (%r9),%bl
  401c43:	80 fb 2c             	cmp    $0x2c,%bl
  401c46:	75 e7                	jne    401c2f <__libirc_get_disable_mask+0xaf>
  401c48:	4c 8d 74 39 01       	lea    0x1(%rcx,%rdi,1),%r14
  401c4d:	4d 85 ff             	test   %r15,%r15
  401c50:	74 89                	je     401bdb <__libirc_get_disable_mask+0x5b>
  401c52:	4d 85 f6             	test   %r14,%r14
  401c55:	74 84                	je     401bdb <__libirc_get_disable_mask+0x5b>
  401c57:	83 3d e2 4e 20 00 00 	cmpl   $0x0,0x204ee2(%rip)        # 606b40 <__libirc_isa_info_initialized>
  401c5e:	0f 84 91 00 00 00    	je     401cf5 <__libirc_get_disable_mask+0x175>
  401c64:	41 ba 01 00 00 00    	mov    $0x1,%r10d
  401c6a:	b9 01 00 00 00       	mov    $0x1,%ecx
  401c6f:	48 8d 2d ba 48 20 00 	lea    0x2048ba(%rip),%rbp        # 606530 <proc_info_features+0x10>
  401c76:	4f 8d 14 52          	lea    (%r10,%r10,2),%r10
  401c7a:	4e 8b 5c d5 00       	mov    0x0(%rbp,%r10,8),%r11
  401c7f:	4d 85 db             	test   %r11,%r11
  401c82:	74 21                	je     401ca5 <__libirc_get_disable_mask+0x125>
  401c84:	45 33 d2             	xor    %r10d,%r10d
  401c87:	4d 85 f6             	test   %r14,%r14
  401c8a:	76 12                	jbe    401c9e <__libirc_get_disable_mask+0x11e>
  401c8c:	43 8a 04 3a          	mov    (%r10,%r15,1),%al
  401c90:	43 3a 04 1a          	cmp    (%r10,%r11,1),%al
  401c94:	75 0f                	jne    401ca5 <__libirc_get_disable_mask+0x125>
  401c96:	49 ff c2             	inc    %r10
  401c99:	4d 3b d6             	cmp    %r14,%r10
  401c9c:	72 ee                	jb     401c8c <__libirc_get_disable_mask+0x10c>
  401c9e:	43 80 3c 33 00       	cmpb   $0x0,(%r11,%r14,1)
  401ca3:	74 0c                	je     401cb1 <__libirc_get_disable_mask+0x131>
  401ca5:	ff c1                	inc    %ecx
  401ca7:	41 89 ca             	mov    %ecx,%r10d
  401caa:	83 f9 40             	cmp    $0x40,%ecx
  401cad:	72 c7                	jb     401c76 <__libirc_get_disable_mask+0xf6>
  401caf:	eb 18                	jmp    401cc9 <__libirc_get_disable_mask+0x149>
  401cb1:	85 c9                	test   %ecx,%ecx
  401cb3:	74 14                	je     401cc9 <__libirc_get_disable_mask+0x149>
  401cb5:	83 f9 01             	cmp    $0x1,%ecx
  401cb8:	74 0f                	je     401cc9 <__libirc_get_disable_mask+0x149>
  401cba:	48 89 f0             	mov    %rsi,%rax
  401cbd:	e8 ee 00 00 00       	callq  401db0 <__libirc_set_cpu_feature>
  401cc2:	83 f8 01             	cmp    $0x1,%eax
  401cc5:	48 83 d2 00          	adc    $0x0,%rdx
  401cc9:	84 db                	test   %bl,%bl
  401ccb:	74 0e                	je     401cdb <__libirc_get_disable_mask+0x15b>
  401ccd:	80 fb 2c             	cmp    $0x2c,%bl
  401cd0:	0f 85 45 ff ff ff    	jne    401c1b <__libirc_get_disable_mask+0x9b>
  401cd6:	e9 00 ff ff ff       	jmpq   401bdb <__libirc_get_disable_mask+0x5b>
  401cdb:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
  401ce0:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
  401ce5:	48 8b 1c 24          	mov    (%rsp),%rbx
  401ce9:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
  401cee:	89 d0                	mov    %edx,%eax
  401cf0:	48 83 c4 28          	add    $0x28,%rsp
  401cf4:	c3                   	retq   
  401cf5:	e8 26 01 00 00       	callq  401e20 <__libirc_isa_init_once>
  401cfa:	85 c0                	test   %eax,%eax
  401cfc:	74 cb                	je     401cc9 <__libirc_get_disable_mask+0x149>
  401cfe:	e9 61 ff ff ff       	jmpq   401c64 <__libirc_get_disable_mask+0xe4>
  401d03:	4c 8d 74 39 01       	lea    0x1(%rcx,%rdi,1),%r14
  401d08:	4d 85 ff             	test   %r15,%r15
  401d0b:	74 ce                	je     401cdb <__libirc_get_disable_mask+0x15b>
  401d0d:	4d 85 f6             	test   %r14,%r14
  401d10:	74 c9                	je     401cdb <__libirc_get_disable_mask+0x15b>
  401d12:	e9 40 ff ff ff       	jmpq   401c57 <__libirc_get_disable_mask+0xd7>
  401d17:	33 c0                	xor    %eax,%eax
  401d19:	48 83 c4 28          	add    $0x28,%rsp
  401d1d:	c3                   	retq   
  401d1e:	66 90                	xchg   %ax,%ax

0000000000401d20 <__libirc_get_cpu_feature>:
  401d20:	f3 0f 1e fa          	repz nop %edx
  401d24:	56                   	push   %rsi
  401d25:	83 3d 14 4e 20 00 00 	cmpl   $0x0,0x204e14(%rip)        # 606b40 <__libirc_isa_info_initialized>
  401d2c:	74 49                	je     401d77 <__libirc_get_cpu_feature+0x57>
  401d2e:	89 f6                	mov    %esi,%esi
  401d30:	48 8d 05 f1 47 20 00 	lea    0x2047f1(%rip),%rax        # 606528 <proc_info_features+0x8>
  401d37:	48 8d 14 76          	lea    (%rsi,%rsi,2),%rdx
  401d3b:	44 8b 04 d0          	mov    (%rax,%rdx,8),%r8d
  401d3f:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
  401d43:	7c 27                	jl     401d6c <__libirc_get_cpu_feature+0x4c>
  401d45:	41 81 f8 80 00 00 00 	cmp    $0x80,%r8d
  401d4c:	7d 1e                	jge    401d6c <__libirc_get_cpu_feature+0x4c>
  401d4e:	45 85 c0             	test   %r8d,%r8d
  401d51:	7c 1f                	jl     401d72 <__libirc_get_cpu_feature+0x52>
  401d53:	49 63 d0             	movslq %r8d,%rdx
  401d56:	33 c0                	xor    %eax,%eax
  401d58:	48 c1 ea 06          	shr    $0x6,%rdx
  401d5c:	48 63 ca             	movslq %edx,%rcx
  401d5f:	48 8b 34 cf          	mov    (%rdi,%rcx,8),%rsi
  401d63:	4c 0f a3 c6          	bt     %r8,%rsi
  401d67:	0f 92 c0             	setb   %al
  401d6a:	59                   	pop    %rcx
  401d6b:	c3                   	retq   
  401d6c:	41 b8 fd ff ff ff    	mov    $0xfffffffd,%r8d
  401d72:	44 89 c0             	mov    %r8d,%eax
  401d75:	59                   	pop    %rcx
  401d76:	c3                   	retq   
  401d77:	e8 a4 00 00 00       	callq  401e20 <__libirc_isa_init_once>
  401d7c:	85 c0                	test   %eax,%eax
  401d7e:	75 ae                	jne    401d2e <__libirc_get_cpu_feature+0xe>
  401d80:	41 b8 fe ff ff ff    	mov    $0xfffffffe,%r8d
  401d86:	eb ea                	jmp    401d72 <__libirc_get_cpu_feature+0x52>
  401d88:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  401d8f:	00 

0000000000401d90 <__intel_set_cpu_indicator>:
  401d90:	4c 8b 51 08          	mov    0x8(%rcx),%r10
  401d94:	4c 8b 19             	mov    (%rcx),%r11
  401d97:	4c 89 50 08          	mov    %r10,0x8(%rax)
  401d9b:	4c 89 18             	mov    %r11,(%rax)
  401d9e:	33 c0                	xor    %eax,%eax
  401da0:	c3                   	retq   
  401da1:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  401da8:	00 
  401da9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000401db0 <__libirc_set_cpu_feature>:
  401db0:	41 56                	push   %r14
  401db2:	49 89 c6             	mov    %rax,%r14
  401db5:	83 3d 84 4d 20 00 00 	cmpl   $0x0,0x204d84(%rip)        # 606b40 <__libirc_isa_info_initialized>
  401dbc:	74 44                	je     401e02 <__libirc_set_cpu_feature+0x52>
  401dbe:	89 c9                	mov    %ecx,%ecx
  401dc0:	48 8d 05 61 47 20 00 	lea    0x204761(%rip),%rax        # 606528 <proc_info_features+0x8>
  401dc7:	4c 8d 14 49          	lea    (%rcx,%rcx,2),%r10
  401dcb:	42 8b 04 d0          	mov    (%rax,%r10,8),%eax
  401dcf:	83 f8 ff             	cmp    $0xffffffff,%eax
  401dd2:	7c 26                	jl     401dfa <__libirc_set_cpu_feature+0x4a>
  401dd4:	3d 80 00 00 00       	cmp    $0x80,%eax
  401dd9:	7d 1f                	jge    401dfa <__libirc_set_cpu_feature+0x4a>
  401ddb:	85 c0                	test   %eax,%eax
  401ddd:	7c 20                	jl     401dff <__libirc_set_cpu_feature+0x4f>
  401ddf:	48 63 c8             	movslq %eax,%rcx
  401de2:	48 c1 e9 06          	shr    $0x6,%rcx
  401de6:	4c 63 d9             	movslq %ecx,%r11
  401de9:	4f 8b 14 de          	mov    (%r14,%r11,8),%r10
  401ded:	49 0f ab c2          	bts    %rax,%r10
  401df1:	33 c0                	xor    %eax,%eax
  401df3:	4f 89 14 de          	mov    %r10,(%r14,%r11,8)
  401df7:	41 5e                	pop    %r14
  401df9:	c3                   	retq   
  401dfa:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  401dff:	41 5e                	pop    %r14
  401e01:	c3                   	retq   
  401e02:	e8 19 00 00 00       	callq  401e20 <__libirc_isa_init_once>
  401e07:	85 c0                	test   %eax,%eax
  401e09:	75 b3                	jne    401dbe <__libirc_set_cpu_feature+0xe>
  401e0b:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  401e10:	41 5e                	pop    %r14
  401e12:	c3                   	retq   
  401e13:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401e18:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  401e1f:	00 

0000000000401e20 <__libirc_isa_init_once>:
  401e20:	83 3d 19 4d 20 00 00 	cmpl   $0x0,0x204d19(%rip)        # 606b40 <__libirc_isa_info_initialized>
  401e27:	74 06                	je     401e2f <__libirc_isa_init_once+0xf>
  401e29:	b8 01 00 00 00       	mov    $0x1,%eax
  401e2e:	c3                   	retq   
  401e2f:	48 89 54 24 f8       	mov    %rdx,-0x8(%rsp)
  401e34:	45 32 db             	xor    %r11b,%r11b
  401e37:	45 33 d2             	xor    %r10d,%r10d
  401e3a:	48 8d 05 17 47 20 00 	lea    0x204717(%rip),%rax        # 606558 <proc_info_features+0x38>
  401e41:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  401e46:	41 fe c3             	inc    %r11b
  401e49:	41 89 54 02 e8       	mov    %edx,-0x18(%r10,%rax,1)
  401e4e:	41 89 14 02          	mov    %edx,(%r10,%rax,1)
  401e52:	49 83 c2 30          	add    $0x30,%r10
  401e56:	41 80 fb 1f          	cmp    $0x1f,%r11b
  401e5a:	72 ea                	jb     401e46 <__libirc_isa_init_once+0x26>
  401e5c:	4c 8d 15 9d 23 00 00 	lea    0x239d(%rip),%r10        # 404200 <il0_peep_printf_format_0+0xd60>
  401e63:	4c 8d 1d a6 23 00 00 	lea    0x23a6(%rip),%r11        # 404210 <il0_peep_printf_format_0+0xd70>
  401e6a:	4c 89 15 c7 46 20 00 	mov    %r10,0x2046c7(%rip)        # 606538 <proc_info_features+0x18>
  401e71:	4c 8d 15 9c 23 00 00 	lea    0x239c(%rip),%r10        # 404214 <il0_peep_printf_format_0+0xd74>
  401e78:	4c 89 1d d1 46 20 00 	mov    %r11,0x2046d1(%rip)        # 606550 <proc_info_features+0x30>
  401e7f:	4c 8d 1d 96 23 00 00 	lea    0x2396(%rip),%r11        # 40421c <il0_peep_printf_format_0+0xd7c>
  401e86:	4c 89 15 db 46 20 00 	mov    %r10,0x2046db(%rip)        # 606568 <proc_info_features+0x48>
  401e8d:	4c 8d 15 8c 23 00 00 	lea    0x238c(%rip),%r10        # 404220 <il0_peep_printf_format_0+0xd80>
  401e94:	4c 89 1d f5 46 20 00 	mov    %r11,0x2046f5(%rip)        # 606590 <proc_info_features+0x70>
  401e9b:	4c 8d 1d 82 23 00 00 	lea    0x2382(%rip),%r11        # 404224 <il0_peep_printf_format_0+0xd84>
  401ea2:	4c 89 15 d7 46 20 00 	mov    %r10,0x2046d7(%rip)        # 606580 <proc_info_features+0x60>
  401ea9:	4c 8d 15 7c 23 00 00 	lea    0x237c(%rip),%r10        # 40422c <il0_peep_printf_format_0+0xd8c>
  401eb0:	4c 89 1d e1 46 20 00 	mov    %r11,0x2046e1(%rip)        # 606598 <proc_info_features+0x78>
  401eb7:	4c 8d 1d 72 23 00 00 	lea    0x2372(%rip),%r11        # 404230 <il0_peep_printf_format_0+0xd90>
  401ebe:	4c 89 15 fb 46 20 00 	mov    %r10,0x2046fb(%rip)        # 6065c0 <proc_info_features+0xa0>
  401ec5:	4c 8d 15 68 23 00 00 	lea    0x2368(%rip),%r10        # 404234 <il0_peep_printf_format_0+0xd94>
  401ecc:	4c 89 1d dd 46 20 00 	mov    %r11,0x2046dd(%rip)        # 6065b0 <proc_info_features+0x90>
  401ed3:	4c 8d 1d 62 23 00 00 	lea    0x2362(%rip),%r11        # 40423c <il0_peep_printf_format_0+0xd9c>
  401eda:	4c 89 15 f7 46 20 00 	mov    %r10,0x2046f7(%rip)        # 6065d8 <proc_info_features+0xb8>
  401ee1:	4c 8d 15 5c 23 00 00 	lea    0x235c(%rip),%r10        # 404244 <il0_peep_printf_format_0+0xda4>
  401ee8:	4c 89 1d d9 46 20 00 	mov    %r11,0x2046d9(%rip)        # 6065c8 <proc_info_features+0xa8>
  401eef:	4c 8d 1d 56 23 00 00 	lea    0x2356(%rip),%r11        # 40424c <il0_peep_printf_format_0+0xdac>
  401ef6:	4c 89 15 f3 46 20 00 	mov    %r10,0x2046f3(%rip)        # 6065f0 <proc_info_features+0xd0>
  401efd:	4c 8d 15 50 23 00 00 	lea    0x2350(%rip),%r10        # 404254 <il0_peep_printf_format_0+0xdb4>
  401f04:	4c 89 1d d5 46 20 00 	mov    %r11,0x2046d5(%rip)        # 6065e0 <proc_info_features+0xc0>
  401f0b:	4c 8d 1d 4a 23 00 00 	lea    0x234a(%rip),%r11        # 40425c <il0_peep_printf_format_0+0xdbc>
  401f12:	4c 89 15 ef 46 20 00 	mov    %r10,0x2046ef(%rip)        # 606608 <proc_info_features+0xe8>
  401f19:	4c 8d 15 44 23 00 00 	lea    0x2344(%rip),%r10        # 404264 <il0_peep_printf_format_0+0xdc4>
  401f20:	4c 89 1d d1 46 20 00 	mov    %r11,0x2046d1(%rip)        # 6065f8 <proc_info_features+0xd8>
  401f27:	4c 8d 1d 3e 23 00 00 	lea    0x233e(%rip),%r11        # 40426c <il0_peep_printf_format_0+0xdcc>
  401f2e:	4c 89 15 eb 46 20 00 	mov    %r10,0x2046eb(%rip)        # 606620 <proc_info_features+0x100>
  401f35:	4c 8d 15 38 23 00 00 	lea    0x2338(%rip),%r10        # 404274 <il0_peep_printf_format_0+0xdd4>
  401f3c:	4c 89 1d cd 46 20 00 	mov    %r11,0x2046cd(%rip)        # 606610 <proc_info_features+0xf0>
  401f43:	4c 8d 1d 32 23 00 00 	lea    0x2332(%rip),%r11        # 40427c <il0_peep_printf_format_0+0xddc>
  401f4a:	4c 89 15 e7 46 20 00 	mov    %r10,0x2046e7(%rip)        # 606638 <proc_info_features+0x118>
  401f51:	4c 8d 15 2c 23 00 00 	lea    0x232c(%rip),%r10        # 404284 <il0_peep_printf_format_0+0xde4>
  401f58:	4c 89 1d c9 46 20 00 	mov    %r11,0x2046c9(%rip)        # 606628 <proc_info_features+0x108>
  401f5f:	4c 8d 1d 26 23 00 00 	lea    0x2326(%rip),%r11        # 40428c <il0_peep_printf_format_0+0xdec>
  401f66:	4c 89 15 e3 46 20 00 	mov    %r10,0x2046e3(%rip)        # 606650 <proc_info_features+0x130>
  401f6d:	4c 8d 15 20 23 00 00 	lea    0x2320(%rip),%r10        # 404294 <il0_peep_printf_format_0+0xdf4>
  401f74:	4c 89 1d c5 46 20 00 	mov    %r11,0x2046c5(%rip)        # 606640 <proc_info_features+0x120>
  401f7b:	4c 8d 1d 1a 23 00 00 	lea    0x231a(%rip),%r11        # 40429c <il0_peep_printf_format_0+0xdfc>
  401f82:	4c 89 15 df 46 20 00 	mov    %r10,0x2046df(%rip)        # 606668 <proc_info_features+0x148>
  401f89:	4c 8d 15 14 23 00 00 	lea    0x2314(%rip),%r10        # 4042a4 <il0_peep_printf_format_0+0xe04>
  401f90:	4c 89 1d c1 46 20 00 	mov    %r11,0x2046c1(%rip)        # 606658 <proc_info_features+0x138>
  401f97:	4c 8d 1d 0e 23 00 00 	lea    0x230e(%rip),%r11        # 4042ac <il0_peep_printf_format_0+0xe0c>
  401f9e:	4c 89 15 db 46 20 00 	mov    %r10,0x2046db(%rip)        # 606680 <proc_info_features+0x160>
  401fa5:	4c 8d 15 0c 23 00 00 	lea    0x230c(%rip),%r10        # 4042b8 <il0_peep_printf_format_0+0xe18>
  401fac:	4c 89 1d bd 46 20 00 	mov    %r11,0x2046bd(%rip)        # 606670 <proc_info_features+0x150>
  401fb3:	4c 8d 1d 02 23 00 00 	lea    0x2302(%rip),%r11        # 4042bc <il0_peep_printf_format_0+0xe1c>
  401fba:	4c 89 15 d7 46 20 00 	mov    %r10,0x2046d7(%rip)        # 606698 <proc_info_features+0x178>
  401fc1:	4c 8d 15 f8 22 00 00 	lea    0x22f8(%rip),%r10        # 4042c0 <il0_peep_printf_format_0+0xe20>
  401fc8:	4c 89 1d b9 46 20 00 	mov    %r11,0x2046b9(%rip)        # 606688 <proc_info_features+0x168>
  401fcf:	4c 8d 1d ee 22 00 00 	lea    0x22ee(%rip),%r11        # 4042c4 <il0_peep_printf_format_0+0xe24>
  401fd6:	4c 89 15 d3 46 20 00 	mov    %r10,0x2046d3(%rip)        # 6066b0 <proc_info_features+0x190>
  401fdd:	4c 8d 15 e4 22 00 00 	lea    0x22e4(%rip),%r10        # 4042c8 <il0_peep_printf_format_0+0xe28>
  401fe4:	4c 89 1d b5 46 20 00 	mov    %r11,0x2046b5(%rip)        # 6066a0 <proc_info_features+0x180>
  401feb:	4c 8d 1d de 22 00 00 	lea    0x22de(%rip),%r11        # 4042d0 <il0_peep_printf_format_0+0xe30>
  401ff2:	4c 89 15 cf 46 20 00 	mov    %r10,0x2046cf(%rip)        # 6066c8 <proc_info_features+0x1a8>
  401ff9:	4c 8d 15 d8 22 00 00 	lea    0x22d8(%rip),%r10        # 4042d8 <il0_peep_printf_format_0+0xe38>
  402000:	4c 89 1d b1 46 20 00 	mov    %r11,0x2046b1(%rip)        # 6066b8 <proc_info_features+0x198>
  402007:	4c 8d 1d d2 22 00 00 	lea    0x22d2(%rip),%r11        # 4042e0 <il0_peep_printf_format_0+0xe40>
  40200e:	4c 89 15 cb 46 20 00 	mov    %r10,0x2046cb(%rip)        # 6066e0 <proc_info_features+0x1c0>
  402015:	4c 8d 15 cc 22 00 00 	lea    0x22cc(%rip),%r10        # 4042e8 <il0_peep_printf_format_0+0xe48>
  40201c:	4c 89 1d ad 46 20 00 	mov    %r11,0x2046ad(%rip)        # 6066d0 <proc_info_features+0x1b0>
  402023:	4c 8d 1d c2 22 00 00 	lea    0x22c2(%rip),%r11        # 4042ec <il0_peep_printf_format_0+0xe4c>
  40202a:	4c 89 15 c7 46 20 00 	mov    %r10,0x2046c7(%rip)        # 6066f8 <proc_info_features+0x1d8>
  402031:	4c 8d 15 b8 22 00 00 	lea    0x22b8(%rip),%r10        # 4042f0 <il0_peep_printf_format_0+0xe50>
  402038:	4c 89 1d a9 46 20 00 	mov    %r11,0x2046a9(%rip)        # 6066e8 <proc_info_features+0x1c8>
  40203f:	4c 8d 1d ae 22 00 00 	lea    0x22ae(%rip),%r11        # 4042f4 <il0_peep_printf_format_0+0xe54>
  402046:	4c 89 15 c3 46 20 00 	mov    %r10,0x2046c3(%rip)        # 606710 <proc_info_features+0x1f0>
  40204d:	4c 8d 15 a4 22 00 00 	lea    0x22a4(%rip),%r10        # 4042f8 <il0_peep_printf_format_0+0xe58>
  402054:	4c 89 1d a5 46 20 00 	mov    %r11,0x2046a5(%rip)        # 606700 <proc_info_features+0x1e0>
  40205b:	4c 8d 1d 9e 22 00 00 	lea    0x229e(%rip),%r11        # 404300 <il0_peep_printf_format_0+0xe60>
  402062:	4c 89 15 bf 46 20 00 	mov    %r10,0x2046bf(%rip)        # 606728 <proc_info_features+0x208>
  402069:	4c 8d 15 98 22 00 00 	lea    0x2298(%rip),%r10        # 404308 <il0_peep_printf_format_0+0xe68>
  402070:	4c 89 1d a1 46 20 00 	mov    %r11,0x2046a1(%rip)        # 606718 <proc_info_features+0x1f8>
  402077:	4c 8d 1d 8e 22 00 00 	lea    0x228e(%rip),%r11        # 40430c <il0_peep_printf_format_0+0xe6c>
  40207e:	4c 89 15 bb 46 20 00 	mov    %r10,0x2046bb(%rip)        # 606740 <proc_info_features+0x220>
  402085:	4c 8d 15 84 22 00 00 	lea    0x2284(%rip),%r10        # 404310 <il0_peep_printf_format_0+0xe70>
  40208c:	4c 89 1d 9d 46 20 00 	mov    %r11,0x20469d(%rip)        # 606730 <proc_info_features+0x210>
  402093:	4c 8d 1d 7a 22 00 00 	lea    0x227a(%rip),%r11        # 404314 <il0_peep_printf_format_0+0xe74>
  40209a:	4c 89 15 b7 46 20 00 	mov    %r10,0x2046b7(%rip)        # 606758 <proc_info_features+0x238>
  4020a1:	4c 8d 15 70 22 00 00 	lea    0x2270(%rip),%r10        # 404318 <il0_peep_printf_format_0+0xe78>
  4020a8:	4c 89 1d 99 46 20 00 	mov    %r11,0x204699(%rip)        # 606748 <proc_info_features+0x228>
  4020af:	4c 8d 1d 6a 22 00 00 	lea    0x226a(%rip),%r11        # 404320 <il0_peep_printf_format_0+0xe80>
  4020b6:	4c 89 15 b3 46 20 00 	mov    %r10,0x2046b3(%rip)        # 606770 <proc_info_features+0x250>
  4020bd:	4c 8d 15 64 22 00 00 	lea    0x2264(%rip),%r10        # 404328 <il0_peep_printf_format_0+0xe88>
  4020c4:	4c 89 1d 95 46 20 00 	mov    %r11,0x204695(%rip)        # 606760 <proc_info_features+0x240>
  4020cb:	4c 8d 1d 5e 22 00 00 	lea    0x225e(%rip),%r11        # 404330 <il0_peep_printf_format_0+0xe90>
  4020d2:	4c 89 15 af 46 20 00 	mov    %r10,0x2046af(%rip)        # 606788 <proc_info_features+0x268>
  4020d9:	4c 8d 15 58 22 00 00 	lea    0x2258(%rip),%r10        # 404338 <il0_peep_printf_format_0+0xe98>
  4020e0:	4c 89 1d 91 46 20 00 	mov    %r11,0x204691(%rip)        # 606778 <proc_info_features+0x258>
  4020e7:	4c 8d 1d 56 22 00 00 	lea    0x2256(%rip),%r11        # 404344 <il0_peep_printf_format_0+0xea4>
  4020ee:	4c 89 15 ab 46 20 00 	mov    %r10,0x2046ab(%rip)        # 6067a0 <proc_info_features+0x280>
  4020f5:	4c 8d 15 54 22 00 00 	lea    0x2254(%rip),%r10        # 404350 <il0_peep_printf_format_0+0xeb0>
  4020fc:	4c 89 1d 8d 46 20 00 	mov    %r11,0x20468d(%rip)        # 606790 <proc_info_features+0x270>
  402103:	4c 8d 1d 4e 22 00 00 	lea    0x224e(%rip),%r11        # 404358 <il0_peep_printf_format_0+0xeb8>
  40210a:	4c 89 15 a7 46 20 00 	mov    %r10,0x2046a7(%rip)        # 6067b8 <proc_info_features+0x298>
  402111:	4c 8d 15 48 22 00 00 	lea    0x2248(%rip),%r10        # 404360 <il0_peep_printf_format_0+0xec0>
  402118:	4c 89 1d 89 46 20 00 	mov    %r11,0x204689(%rip)        # 6067a8 <proc_info_features+0x288>
  40211f:	4c 8d 1d 42 22 00 00 	lea    0x2242(%rip),%r11        # 404368 <il0_peep_printf_format_0+0xec8>
  402126:	4c 89 15 93 46 20 00 	mov    %r10,0x204693(%rip)        # 6067c0 <proc_info_features+0x2a0>
  40212d:	4c 8d 15 38 22 00 00 	lea    0x2238(%rip),%r10        # 40436c <il0_peep_printf_format_0+0xecc>
  402134:	4c 89 1d ad 46 20 00 	mov    %r11,0x2046ad(%rip)        # 6067e8 <proc_info_features+0x2c8>
  40213b:	4c 8d 1d 2e 22 00 00 	lea    0x222e(%rip),%r11        # 404370 <il0_peep_printf_format_0+0xed0>
  402142:	4c 89 15 8f 46 20 00 	mov    %r10,0x20468f(%rip)        # 6067d8 <proc_info_features+0x2b8>
  402149:	4c 8d 15 28 22 00 00 	lea    0x2228(%rip),%r10        # 404378 <il0_peep_printf_format_0+0xed8>
  402150:	4c 89 1d a9 46 20 00 	mov    %r11,0x2046a9(%rip)        # 606800 <proc_info_features+0x2e0>
  402157:	4c 8d 1d 22 22 00 00 	lea    0x2222(%rip),%r11        # 404380 <il0_peep_printf_format_0+0xee0>
  40215e:	4c 89 15 8b 46 20 00 	mov    %r10,0x20468b(%rip)        # 6067f0 <proc_info_features+0x2d0>
  402165:	4c 8d 15 20 22 00 00 	lea    0x2220(%rip),%r10        # 40438c <il0_peep_printf_format_0+0xeec>
  40216c:	4c 89 1d a5 46 20 00 	mov    %r11,0x2046a5(%rip)        # 606818 <proc_info_features+0x2f8>
  402173:	4c 8d 1d 22 22 00 00 	lea    0x2222(%rip),%r11        # 40439c <il0_peep_printf_format_0+0xefc>
  40217a:	4c 89 15 87 46 20 00 	mov    %r10,0x204687(%rip)        # 606808 <proc_info_features+0x2e8>
  402181:	4c 8d 15 20 22 00 00 	lea    0x2220(%rip),%r10        # 4043a8 <il0_peep_printf_format_0+0xf08>
  402188:	4c 89 1d b9 46 20 00 	mov    %r11,0x2046b9(%rip)        # 606848 <proc_info_features+0x328>
  40218f:	4c 8d 1d 1e 22 00 00 	lea    0x221e(%rip),%r11        # 4043b4 <il0_peep_printf_format_0+0xf14>
  402196:	4c 89 15 9b 46 20 00 	mov    %r10,0x20469b(%rip)        # 606838 <proc_info_features+0x318>
  40219d:	4c 8d 15 1c 22 00 00 	lea    0x221c(%rip),%r10        # 4043c0 <il0_peep_printf_format_0+0xf20>
  4021a4:	4c 89 1d b5 46 20 00 	mov    %r11,0x2046b5(%rip)        # 606860 <proc_info_features+0x340>
  4021ab:	4c 8d 1d 1a 22 00 00 	lea    0x221a(%rip),%r11        # 4043cc <il0_peep_printf_format_0+0xf2c>
  4021b2:	4c 89 15 97 46 20 00 	mov    %r10,0x204697(%rip)        # 606850 <proc_info_features+0x330>
  4021b9:	4c 8d 15 18 22 00 00 	lea    0x2218(%rip),%r10        # 4043d8 <il0_peep_printf_format_0+0xf38>
  4021c0:	4c 89 1d b1 46 20 00 	mov    %r11,0x2046b1(%rip)        # 606878 <proc_info_features+0x358>
  4021c7:	4c 8d 1d 16 22 00 00 	lea    0x2216(%rip),%r11        # 4043e4 <il0_peep_printf_format_0+0xf44>
  4021ce:	4c 89 15 93 46 20 00 	mov    %r10,0x204693(%rip)        # 606868 <proc_info_features+0x348>
  4021d5:	4c 8d 15 0c 22 00 00 	lea    0x220c(%rip),%r10        # 4043e8 <il0_peep_printf_format_0+0xf48>
  4021dc:	4c 89 1d ad 46 20 00 	mov    %r11,0x2046ad(%rip)        # 606890 <proc_info_features+0x370>
  4021e3:	4c 8d 1d 02 22 00 00 	lea    0x2202(%rip),%r11        # 4043ec <il0_peep_printf_format_0+0xf4c>
  4021ea:	4c 89 15 8f 46 20 00 	mov    %r10,0x20468f(%rip)        # 606880 <proc_info_features+0x360>
  4021f1:	4c 8d 15 f8 21 00 00 	lea    0x21f8(%rip),%r10        # 4043f0 <il0_peep_printf_format_0+0xf50>
  4021f8:	4c 89 1d a9 46 20 00 	mov    %r11,0x2046a9(%rip)        # 6068a8 <proc_info_features+0x388>
  4021ff:	4c 8d 1d ee 21 00 00 	lea    0x21ee(%rip),%r11        # 4043f4 <il0_peep_printf_format_0+0xf54>
  402206:	4c 89 15 8b 46 20 00 	mov    %r10,0x20468b(%rip)        # 606898 <proc_info_features+0x378>
  40220d:	4c 8d 15 ec 21 00 00 	lea    0x21ec(%rip),%r10        # 404400 <il0_peep_printf_format_0+0xf60>
  402214:	4c 89 1d a5 46 20 00 	mov    %r11,0x2046a5(%rip)        # 6068c0 <proc_info_features+0x3a0>
  40221b:	4c 8d 1d ea 21 00 00 	lea    0x21ea(%rip),%r11        # 40440c <il0_peep_printf_format_0+0xf6c>
  402222:	4c 89 15 87 46 20 00 	mov    %r10,0x204687(%rip)        # 6068b0 <proc_info_features+0x390>
  402229:	4c 8d 15 e8 21 00 00 	lea    0x21e8(%rip),%r10        # 404418 <il0_peep_printf_format_0+0xf78>
  402230:	4c 89 1d a1 46 20 00 	mov    %r11,0x2046a1(%rip)        # 6068d8 <proc_info_features+0x3b8>
  402237:	4c 8d 1d e6 21 00 00 	lea    0x21e6(%rip),%r11        # 404424 <il0_peep_printf_format_0+0xf84>
  40223e:	4c 89 15 83 46 20 00 	mov    %r10,0x204683(%rip)        # 6068c8 <proc_info_features+0x3a8>
  402245:	4c 8d 15 e4 21 00 00 	lea    0x21e4(%rip),%r10        # 404430 <il0_peep_printf_format_0+0xf90>
  40224c:	4c 89 1d 9d 46 20 00 	mov    %r11,0x20469d(%rip)        # 6068f0 <proc_info_features+0x3d0>
  402253:	4c 8d 1d e2 21 00 00 	lea    0x21e2(%rip),%r11        # 40443c <il0_peep_printf_format_0+0xf9c>
  40225a:	4c 89 15 7f 46 20 00 	mov    %r10,0x20467f(%rip)        # 6068e0 <proc_info_features+0x3c0>
  402261:	4c 8d 15 e4 21 00 00 	lea    0x21e4(%rip),%r10        # 40444c <il0_peep_printf_format_0+0xfac>
  402268:	4c 89 1d 99 46 20 00 	mov    %r11,0x204699(%rip)        # 606908 <proc_info_features+0x3e8>
  40226f:	4c 8d 1d e6 21 00 00 	lea    0x21e6(%rip),%r11        # 40445c <il0_peep_printf_format_0+0xfbc>
  402276:	4c 89 15 7b 46 20 00 	mov    %r10,0x20467b(%rip)        # 6068f8 <proc_info_features+0x3d8>
  40227d:	4c 8d 15 e8 21 00 00 	lea    0x21e8(%rip),%r10        # 40446c <il0_peep_printf_format_0+0xfcc>
  402284:	4c 89 1d 95 46 20 00 	mov    %r11,0x204695(%rip)        # 606920 <proc_info_features+0x400>
  40228b:	4c 8d 1d ea 21 00 00 	lea    0x21ea(%rip),%r11        # 40447c <il0_peep_printf_format_0+0xfdc>
  402292:	4c 89 15 77 46 20 00 	mov    %r10,0x204677(%rip)        # 606910 <proc_info_features+0x3f0>
  402299:	4c 8d 15 ec 21 00 00 	lea    0x21ec(%rip),%r10        # 40448c <il0_peep_printf_format_0+0xfec>
  4022a0:	4c 89 1d 91 46 20 00 	mov    %r11,0x204691(%rip)        # 606938 <proc_info_features+0x418>
  4022a7:	4c 8d 1d f2 21 00 00 	lea    0x21f2(%rip),%r11        # 4044a0 <il0_peep_printf_format_0+0x1000>
  4022ae:	4c 89 15 73 46 20 00 	mov    %r10,0x204673(%rip)        # 606928 <proc_info_features+0x408>
  4022b5:	4c 8d 15 f4 21 00 00 	lea    0x21f4(%rip),%r10        # 4044b0 <il0_peep_printf_format_0+0x1010>
  4022bc:	4c 89 1d 8d 46 20 00 	mov    %r11,0x20468d(%rip)        # 606950 <proc_info_features+0x430>
  4022c3:	4c 8d 1d f6 21 00 00 	lea    0x21f6(%rip),%r11        # 4044c0 <il0_peep_printf_format_0+0x1020>
  4022ca:	4c 89 15 6f 46 20 00 	mov    %r10,0x20466f(%rip)        # 606940 <proc_info_features+0x420>
  4022d1:	4c 8d 15 f4 21 00 00 	lea    0x21f4(%rip),%r10        # 4044cc <il0_peep_printf_format_0+0x102c>
  4022d8:	4c 89 1d 89 46 20 00 	mov    %r11,0x204689(%rip)        # 606968 <proc_info_features+0x448>
  4022df:	4c 8d 1d f6 21 00 00 	lea    0x21f6(%rip),%r11        # 4044dc <il0_peep_printf_format_0+0x103c>
  4022e6:	4c 89 15 6b 46 20 00 	mov    %r10,0x20466b(%rip)        # 606958 <proc_info_features+0x438>
  4022ed:	4c 8d 15 f0 21 00 00 	lea    0x21f0(%rip),%r10        # 4044e4 <il0_peep_printf_format_0+0x1044>
  4022f4:	4c 89 1d 85 46 20 00 	mov    %r11,0x204685(%rip)        # 606980 <proc_info_features+0x460>
  4022fb:	4c 8d 1d ea 21 00 00 	lea    0x21ea(%rip),%r11        # 4044ec <il0_peep_printf_format_0+0x104c>
  402302:	4c 89 15 67 46 20 00 	mov    %r10,0x204667(%rip)        # 606970 <proc_info_features+0x450>
  402309:	4c 8d 15 e4 21 00 00 	lea    0x21e4(%rip),%r10        # 4044f4 <il0_peep_printf_format_0+0x1054>
  402310:	4c 89 1d 81 46 20 00 	mov    %r11,0x204681(%rip)        # 606998 <proc_info_features+0x478>
  402317:	4c 8d 1d de 21 00 00 	lea    0x21de(%rip),%r11        # 4044fc <il0_peep_printf_format_0+0x105c>
  40231e:	4c 89 15 63 46 20 00 	mov    %r10,0x204663(%rip)        # 606988 <proc_info_features+0x468>
  402325:	4c 8d 15 dc 21 00 00 	lea    0x21dc(%rip),%r10        # 404508 <il0_peep_printf_format_0+0x1068>
  40232c:	4c 89 1d 7d 46 20 00 	mov    %r11,0x20467d(%rip)        # 6069b0 <proc_info_features+0x490>
  402333:	4c 8d 1d da 21 00 00 	lea    0x21da(%rip),%r11        # 404514 <il0_peep_printf_format_0+0x1074>
  40233a:	4c 89 15 5f 46 20 00 	mov    %r10,0x20465f(%rip)        # 6069a0 <proc_info_features+0x480>
  402341:	4c 8d 15 d8 21 00 00 	lea    0x21d8(%rip),%r10        # 404520 <il0_peep_printf_format_0+0x1080>
  402348:	4c 89 1d 79 46 20 00 	mov    %r11,0x204679(%rip)        # 6069c8 <proc_info_features+0x4a8>
  40234f:	4c 8d 1d d6 21 00 00 	lea    0x21d6(%rip),%r11        # 40452c <il0_peep_printf_format_0+0x108c>
  402356:	4c 89 15 5b 46 20 00 	mov    %r10,0x20465b(%rip)        # 6069b8 <proc_info_features+0x498>
  40235d:	4c 8d 15 d0 21 00 00 	lea    0x21d0(%rip),%r10        # 404534 <il0_peep_printf_format_0+0x1094>
  402364:	4c 89 1d 75 46 20 00 	mov    %r11,0x204675(%rip)        # 6069e0 <proc_info_features+0x4c0>
  40236b:	4c 8d 1d ca 21 00 00 	lea    0x21ca(%rip),%r11        # 40453c <il0_peep_printf_format_0+0x109c>
  402372:	4c 89 15 57 46 20 00 	mov    %r10,0x204657(%rip)        # 6069d0 <proc_info_features+0x4b0>
  402379:	4c 8d 15 c4 21 00 00 	lea    0x21c4(%rip),%r10        # 404544 <il0_peep_printf_format_0+0x10a4>
  402380:	4c 89 1d 71 46 20 00 	mov    %r11,0x204671(%rip)        # 6069f8 <proc_info_features+0x4d8>
  402387:	4c 8d 1d be 21 00 00 	lea    0x21be(%rip),%r11        # 40454c <il0_peep_printf_format_0+0x10ac>
  40238e:	4c 89 15 53 46 20 00 	mov    %r10,0x204653(%rip)        # 6069e8 <proc_info_features+0x4c8>
  402395:	4c 8d 15 b4 21 00 00 	lea    0x21b4(%rip),%r10        # 404550 <il0_peep_printf_format_0+0x10b0>
  40239c:	4c 89 1d 6d 46 20 00 	mov    %r11,0x20466d(%rip)        # 606a10 <proc_info_features+0x4f0>
  4023a3:	4c 8d 1d aa 21 00 00 	lea    0x21aa(%rip),%r11        # 404554 <il0_peep_printf_format_0+0x10b4>
  4023aa:	4c 89 15 4f 46 20 00 	mov    %r10,0x20464f(%rip)        # 606a00 <proc_info_features+0x4e0>
  4023b1:	4c 8d 15 a4 21 00 00 	lea    0x21a4(%rip),%r10        # 40455c <il0_peep_printf_format_0+0x10bc>
  4023b8:	4c 89 1d 69 46 20 00 	mov    %r11,0x204669(%rip)        # 606a28 <proc_info_features+0x508>
  4023bf:	4c 8d 1d 9e 21 00 00 	lea    0x219e(%rip),%r11        # 404564 <il0_peep_printf_format_0+0x10c4>
  4023c6:	4c 89 15 4b 46 20 00 	mov    %r10,0x20464b(%rip)        # 606a18 <proc_info_features+0x4f8>
  4023cd:	4c 8d 15 94 21 00 00 	lea    0x2194(%rip),%r10        # 404568 <il0_peep_printf_format_0+0x10c8>
  4023d4:	4c 89 1d 65 46 20 00 	mov    %r11,0x204665(%rip)        # 606a40 <proc_info_features+0x520>
  4023db:	4c 8d 1d 8a 21 00 00 	lea    0x218a(%rip),%r11        # 40456c <il0_peep_printf_format_0+0x10cc>
  4023e2:	4c 89 15 47 46 20 00 	mov    %r10,0x204647(%rip)        # 606a30 <proc_info_features+0x510>
  4023e9:	4c 8d 15 88 21 00 00 	lea    0x2188(%rip),%r10        # 404578 <il0_peep_printf_format_0+0x10d8>
  4023f0:	4c 89 1d 61 46 20 00 	mov    %r11,0x204661(%rip)        # 606a58 <proc_info_features+0x538>
  4023f7:	4c 8d 1d 86 21 00 00 	lea    0x2186(%rip),%r11        # 404584 <il0_peep_printf_format_0+0x10e4>
  4023fe:	4c 89 15 43 46 20 00 	mov    %r10,0x204643(%rip)        # 606a48 <proc_info_features+0x528>
  402405:	4c 8d 15 80 21 00 00 	lea    0x2180(%rip),%r10        # 40458c <il0_peep_printf_format_0+0x10ec>
  40240c:	4c 89 1d 5d 46 20 00 	mov    %r11,0x20465d(%rip)        # 606a70 <proc_info_features+0x550>
  402413:	4c 8d 1d 7a 21 00 00 	lea    0x217a(%rip),%r11        # 404594 <il0_peep_printf_format_0+0x10f4>
  40241a:	4c 89 15 3f 46 20 00 	mov    %r10,0x20463f(%rip)        # 606a60 <proc_info_features+0x540>
  402421:	4c 8d 15 80 21 00 00 	lea    0x2180(%rip),%r10        # 4045a8 <il0_peep_printf_format_0+0x1108>
  402428:	4c 89 1d 59 46 20 00 	mov    %r11,0x204659(%rip)        # 606a88 <proc_info_features+0x568>
  40242f:	4c 8d 1d 86 21 00 00 	lea    0x2186(%rip),%r11        # 4045bc <il0_peep_printf_format_0+0x111c>
  402436:	4c 89 15 3b 46 20 00 	mov    %r10,0x20463b(%rip)        # 606a78 <proc_info_features+0x558>
  40243d:	4c 8d 15 84 21 00 00 	lea    0x2184(%rip),%r10        # 4045c8 <il0_peep_printf_format_0+0x1128>
  402444:	4c 89 1d 55 46 20 00 	mov    %r11,0x204655(%rip)        # 606aa0 <proc_info_features+0x580>
  40244b:	4c 8d 1d 82 21 00 00 	lea    0x2182(%rip),%r11        # 4045d4 <il0_peep_printf_format_0+0x1134>
  402452:	4c 89 15 37 46 20 00 	mov    %r10,0x204637(%rip)        # 606a90 <proc_info_features+0x570>
  402459:	4c 8d 15 7c 21 00 00 	lea    0x217c(%rip),%r10        # 4045dc <il0_peep_printf_format_0+0x113c>
  402460:	4c 89 1d 51 46 20 00 	mov    %r11,0x204651(%rip)        # 606ab8 <proc_info_features+0x598>
  402467:	4c 8d 1d 76 21 00 00 	lea    0x2176(%rip),%r11        # 4045e4 <il0_peep_printf_format_0+0x1144>
  40246e:	4c 89 15 33 46 20 00 	mov    %r10,0x204633(%rip)        # 606aa8 <proc_info_features+0x588>
  402475:	4c 8d 15 74 21 00 00 	lea    0x2174(%rip),%r10        # 4045f0 <il0_peep_printf_format_0+0x1150>
  40247c:	4c 89 1d 4d 46 20 00 	mov    %r11,0x20464d(%rip)        # 606ad0 <proc_info_features+0x5b0>
  402483:	4c 8d 1d 72 21 00 00 	lea    0x2172(%rip),%r11        # 4045fc <il0_peep_printf_format_0+0x115c>
  40248a:	4c 89 15 2f 46 20 00 	mov    %r10,0x20462f(%rip)        # 606ac0 <proc_info_features+0x5a0>
  402491:	4c 8d 15 6c 21 00 00 	lea    0x216c(%rip),%r10        # 404604 <il0_peep_printf_format_0+0x1164>
  402498:	4c 89 1d 49 46 20 00 	mov    %r11,0x204649(%rip)        # 606ae8 <proc_info_features+0x5c8>
  40249f:	4c 8d 1d 66 21 00 00 	lea    0x2166(%rip),%r11        # 40460c <il0_peep_printf_format_0+0x116c>
  4024a6:	4c 89 15 2b 46 20 00 	mov    %r10,0x20462b(%rip)        # 606ad8 <proc_info_features+0x5b8>
  4024ad:	4c 8d 15 64 21 00 00 	lea    0x2164(%rip),%r10        # 404618 <il0_peep_printf_format_0+0x1178>
  4024b4:	48 8b 54 24 f8       	mov    -0x8(%rsp),%rdx
  4024b9:	b8 01 00 00 00       	mov    $0x1,%eax
  4024be:	4c 89 1d 3b 46 20 00 	mov    %r11,0x20463b(%rip)        # 606b00 <proc_info_features+0x5e0>
  4024c5:	4c 8d 1d 58 21 00 00 	lea    0x2158(%rip),%r11        # 404624 <il0_peep_printf_format_0+0x1184>
  4024cc:	4c 89 15 1d 46 20 00 	mov    %r10,0x20461d(%rip)        # 606af0 <proc_info_features+0x5d0>
  4024d3:	4c 8d 15 52 21 00 00 	lea    0x2152(%rip),%r10        # 40462c <il0_peep_printf_format_0+0x118c>
  4024da:	c7 05 5c 40 20 00 00 	movl   $0x0,0x20405c(%rip)        # 606540 <proc_info_features+0x20>
  4024e1:	00 00 00 
  4024e4:	89 05 6e 40 20 00    	mov    %eax,0x20406e(%rip)        # 606558 <proc_info_features+0x38>
  4024ea:	c7 05 7c 40 20 00 02 	movl   $0x2,0x20407c(%rip)        # 606570 <proc_info_features+0x50>
  4024f1:	00 00 00 
  4024f4:	c7 05 8a 40 20 00 03 	movl   $0x3,0x20408a(%rip)        # 606588 <proc_info_features+0x68>
  4024fb:	00 00 00 
  4024fe:	c7 05 98 40 20 00 04 	movl   $0x4,0x204098(%rip)        # 6065a0 <proc_info_features+0x80>
  402505:	00 00 00 
  402508:	c7 05 a6 40 20 00 05 	movl   $0x5,0x2040a6(%rip)        # 6065b8 <proc_info_features+0x98>
  40250f:	00 00 00 
  402512:	c7 05 b4 40 20 00 06 	movl   $0x6,0x2040b4(%rip)        # 6065d0 <proc_info_features+0xb0>
  402519:	00 00 00 
  40251c:	c7 05 c2 40 20 00 07 	movl   $0x7,0x2040c2(%rip)        # 6065e8 <proc_info_features+0xc8>
  402523:	00 00 00 
  402526:	c7 05 d0 40 20 00 08 	movl   $0x8,0x2040d0(%rip)        # 606600 <proc_info_features+0xe0>
  40252d:	00 00 00 
  402530:	c7 05 de 40 20 00 09 	movl   $0x9,0x2040de(%rip)        # 606618 <proc_info_features+0xf8>
  402537:	00 00 00 
  40253a:	c7 05 ec 40 20 00 0a 	movl   $0xa,0x2040ec(%rip)        # 606630 <proc_info_features+0x110>
  402541:	00 00 00 
  402544:	c7 05 fa 40 20 00 0b 	movl   $0xb,0x2040fa(%rip)        # 606648 <proc_info_features+0x128>
  40254b:	00 00 00 
  40254e:	c7 05 08 41 20 00 0c 	movl   $0xc,0x204108(%rip)        # 606660 <proc_info_features+0x140>
  402555:	00 00 00 
  402558:	c7 05 16 41 20 00 0d 	movl   $0xd,0x204116(%rip)        # 606678 <proc_info_features+0x158>
  40255f:	00 00 00 
  402562:	c7 05 24 41 20 00 0e 	movl   $0xe,0x204124(%rip)        # 606690 <proc_info_features+0x170>
  402569:	00 00 00 
  40256c:	c7 05 32 41 20 00 10 	movl   $0x10,0x204132(%rip)        # 6066a8 <proc_info_features+0x188>
  402573:	00 00 00 
  402576:	c7 05 40 41 20 00 0f 	movl   $0xf,0x204140(%rip)        # 6066c0 <proc_info_features+0x1a0>
  40257d:	00 00 00 
  402580:	c7 05 4e 41 20 00 11 	movl   $0x11,0x20414e(%rip)        # 6066d8 <proc_info_features+0x1b8>
  402587:	00 00 00 
  40258a:	c7 05 5c 41 20 00 12 	movl   $0x12,0x20415c(%rip)        # 6066f0 <proc_info_features+0x1d0>
  402591:	00 00 00 
  402594:	c7 05 6a 41 20 00 13 	movl   $0x13,0x20416a(%rip)        # 606708 <proc_info_features+0x1e8>
  40259b:	00 00 00 
  40259e:	c7 05 78 41 20 00 14 	movl   $0x14,0x204178(%rip)        # 606720 <proc_info_features+0x200>
  4025a5:	00 00 00 
  4025a8:	c7 05 86 41 20 00 15 	movl   $0x15,0x204186(%rip)        # 606738 <proc_info_features+0x218>
  4025af:	00 00 00 
  4025b2:	c7 05 94 41 20 00 16 	movl   $0x16,0x204194(%rip)        # 606750 <proc_info_features+0x230>
  4025b9:	00 00 00 
  4025bc:	c7 05 a2 41 20 00 17 	movl   $0x17,0x2041a2(%rip)        # 606768 <proc_info_features+0x248>
  4025c3:	00 00 00 
  4025c6:	c7 05 b0 41 20 00 1b 	movl   $0x1b,0x2041b0(%rip)        # 606780 <proc_info_features+0x260>
  4025cd:	00 00 00 
  4025d0:	c7 05 be 41 20 00 18 	movl   $0x18,0x2041be(%rip)        # 606798 <proc_info_features+0x278>
  4025d7:	00 00 00 
  4025da:	c7 05 cc 41 20 00 19 	movl   $0x19,0x2041cc(%rip)        # 6067b0 <proc_info_features+0x290>
  4025e1:	00 00 00 
  4025e4:	c7 05 da 41 20 00 1a 	movl   $0x1a,0x2041da(%rip)        # 6067c8 <proc_info_features+0x2a8>
  4025eb:	00 00 00 
  4025ee:	c7 05 e8 41 20 00 1c 	movl   $0x1c,0x2041e8(%rip)        # 6067e0 <proc_info_features+0x2c0>
  4025f5:	00 00 00 
  4025f8:	c7 05 f6 41 20 00 1d 	movl   $0x1d,0x2041f6(%rip)        # 6067f8 <proc_info_features+0x2d8>
  4025ff:	00 00 00 
  402602:	c7 05 04 42 20 00 1e 	movl   $0x1e,0x204204(%rip)        # 606810 <proc_info_features+0x2f0>
  402609:	00 00 00 
  40260c:	c7 05 12 42 20 00 ff 	movl   $0xffffffff,0x204212(%rip)        # 606828 <proc_info_features+0x308>
  402613:	ff ff ff 
  402616:	c7 05 20 42 20 00 20 	movl   $0x20,0x204220(%rip)        # 606840 <proc_info_features+0x320>
  40261d:	00 00 00 
  402620:	c7 05 2e 42 20 00 21 	movl   $0x21,0x20422e(%rip)        # 606858 <proc_info_features+0x338>
  402627:	00 00 00 
  40262a:	c7 05 3c 42 20 00 22 	movl   $0x22,0x20423c(%rip)        # 606870 <proc_info_features+0x350>
  402631:	00 00 00 
  402634:	c7 05 4a 42 20 00 23 	movl   $0x23,0x20424a(%rip)        # 606888 <proc_info_features+0x368>
  40263b:	00 00 00 
  40263e:	c7 05 58 42 20 00 24 	movl   $0x24,0x204258(%rip)        # 6068a0 <proc_info_features+0x380>
  402645:	00 00 00 
  402648:	c7 05 66 42 20 00 25 	movl   $0x25,0x204266(%rip)        # 6068b8 <proc_info_features+0x398>
  40264f:	00 00 00 
  402652:	c7 05 74 42 20 00 26 	movl   $0x26,0x204274(%rip)        # 6068d0 <proc_info_features+0x3b0>
  402659:	00 00 00 
  40265c:	c7 05 82 42 20 00 27 	movl   $0x27,0x204282(%rip)        # 6068e8 <proc_info_features+0x3c8>
  402663:	00 00 00 
  402666:	c7 05 90 42 20 00 28 	movl   $0x28,0x204290(%rip)        # 606900 <proc_info_features+0x3e0>
  40266d:	00 00 00 
  402670:	c7 05 9e 42 20 00 29 	movl   $0x29,0x20429e(%rip)        # 606918 <proc_info_features+0x3f8>
  402677:	00 00 00 
  40267a:	c7 05 ac 42 20 00 2a 	movl   $0x2a,0x2042ac(%rip)        # 606930 <proc_info_features+0x410>
  402681:	00 00 00 
  402684:	c7 05 ba 42 20 00 2b 	movl   $0x2b,0x2042ba(%rip)        # 606948 <proc_info_features+0x428>
  40268b:	00 00 00 
  40268e:	c7 05 c8 42 20 00 2c 	movl   $0x2c,0x2042c8(%rip)        # 606960 <proc_info_features+0x440>
  402695:	00 00 00 
  402698:	c7 05 d6 42 20 00 2d 	movl   $0x2d,0x2042d6(%rip)        # 606978 <proc_info_features+0x458>
  40269f:	00 00 00 
  4026a2:	c7 05 e4 42 20 00 2e 	movl   $0x2e,0x2042e4(%rip)        # 606990 <proc_info_features+0x470>
  4026a9:	00 00 00 
  4026ac:	c7 05 f2 42 20 00 2f 	movl   $0x2f,0x2042f2(%rip)        # 6069a8 <proc_info_features+0x488>
  4026b3:	00 00 00 
  4026b6:	c7 05 00 43 20 00 30 	movl   $0x30,0x204300(%rip)        # 6069c0 <proc_info_features+0x4a0>
  4026bd:	00 00 00 
  4026c0:	c7 05 0e 43 20 00 31 	movl   $0x31,0x20430e(%rip)        # 6069d8 <proc_info_features+0x4b8>
  4026c7:	00 00 00 
  4026ca:	c7 05 1c 43 20 00 32 	movl   $0x32,0x20431c(%rip)        # 6069f0 <proc_info_features+0x4d0>
  4026d1:	00 00 00 
  4026d4:	c7 05 2a 43 20 00 33 	movl   $0x33,0x20432a(%rip)        # 606a08 <proc_info_features+0x4e8>
  4026db:	00 00 00 
  4026de:	c7 05 38 43 20 00 34 	movl   $0x34,0x204338(%rip)        # 606a20 <proc_info_features+0x500>
  4026e5:	00 00 00 
  4026e8:	c7 05 46 43 20 00 35 	movl   $0x35,0x204346(%rip)        # 606a38 <proc_info_features+0x518>
  4026ef:	00 00 00 
  4026f2:	c7 05 54 43 20 00 36 	movl   $0x36,0x204354(%rip)        # 606a50 <proc_info_features+0x530>
  4026f9:	00 00 00 
  4026fc:	c7 05 62 43 20 00 37 	movl   $0x37,0x204362(%rip)        # 606a68 <proc_info_features+0x548>
  402703:	00 00 00 
  402706:	c7 05 70 43 20 00 38 	movl   $0x38,0x204370(%rip)        # 606a80 <proc_info_features+0x560>
  40270d:	00 00 00 
  402710:	c7 05 7e 43 20 00 40 	movl   $0x40,0x20437e(%rip)        # 606a98 <proc_info_features+0x578>
  402717:	00 00 00 
  40271a:	c7 05 8c 43 20 00 41 	movl   $0x41,0x20438c(%rip)        # 606ab0 <proc_info_features+0x590>
  402721:	00 00 00 
  402724:	c7 05 9a 43 20 00 42 	movl   $0x42,0x20439a(%rip)        # 606ac8 <proc_info_features+0x5a8>
  40272b:	00 00 00 
  40272e:	c7 05 a8 43 20 00 43 	movl   $0x43,0x2043a8(%rip)        # 606ae0 <proc_info_features+0x5c0>
  402735:	00 00 00 
  402738:	c7 05 b6 43 20 00 44 	movl   $0x44,0x2043b6(%rip)        # 606af8 <proc_info_features+0x5d8>
  40273f:	00 00 00 
  402742:	c7 05 c4 43 20 00 45 	movl   $0x45,0x2043c4(%rip)        # 606b10 <proc_info_features+0x5f0>
  402749:	00 00 00 
  40274c:	4c 89 1d c5 43 20 00 	mov    %r11,0x2043c5(%rip)        # 606b18 <proc_info_features+0x5f8>
  402753:	4c 89 15 ae 43 20 00 	mov    %r10,0x2043ae(%rip)        # 606b08 <proc_info_features+0x5e8>
  40275a:	89 05 e0 43 20 00    	mov    %eax,0x2043e0(%rip)        # 606b40 <__libirc_isa_info_initialized>
  402760:	c3                   	retq   
  402761:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402768:	00 
  402769:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000402770 <__intel_cpu_features_init_x>:
  402770:	f3 0f 1e fa          	repz nop %edx
  402774:	33 c0                	xor    %eax,%eax
  402776:	e9 15 00 00 00       	jmpq   402790 <__intel_cpu_features_init_body>
  40277b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000402780 <__intel_cpu_features_init>:
  402780:	f3 0f 1e fa          	repz nop %edx
  402784:	b8 01 00 00 00       	mov    $0x1,%eax
  402789:	e9 02 00 00 00       	jmpq   402790 <__intel_cpu_features_init_body>
  40278e:	66 90                	xchg   %ax,%ax

0000000000402790 <__intel_cpu_features_init_body>:
  402790:	52                   	push   %rdx
  402791:	51                   	push   %rcx
  402792:	53                   	push   %rbx
  402793:	56                   	push   %rsi
  402794:	57                   	push   %rdi
  402795:	41 50                	push   %r8
  402797:	41 51                	push   %r9
  402799:	41 55                	push   %r13
  40279b:	41 57                	push   %r15
  40279d:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
  4027a4:	41 89 c5             	mov    %eax,%r13d
  4027a7:	0f 11 84 24 f0 00 00 	movups %xmm0,0xf0(%rsp)
  4027ae:	00 
  4027af:	40 32 f6             	xor    %sil,%sil
  4027b2:	44 0f 11 bc 24 10 01 	movups %xmm15,0x110(%rsp)
  4027b9:	00 00 
  4027bb:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4027bf:	44 0f 11 b4 24 00 01 	movups %xmm14,0x100(%rsp)
  4027c6:	00 00 
  4027c8:	44 0f 11 ac 24 e0 00 	movups %xmm13,0xe0(%rsp)
  4027cf:	00 00 
  4027d1:	44 0f 11 a4 24 d0 00 	movups %xmm12,0xd0(%rsp)
  4027d8:	00 00 
  4027da:	44 0f 11 9c 24 c0 00 	movups %xmm11,0xc0(%rsp)
  4027e1:	00 00 
  4027e3:	44 0f 11 94 24 b0 00 	movups %xmm10,0xb0(%rsp)
  4027ea:	00 00 
  4027ec:	44 0f 11 8c 24 a0 00 	movups %xmm9,0xa0(%rsp)
  4027f3:	00 00 
  4027f5:	44 0f 11 84 24 90 00 	movups %xmm8,0x90(%rsp)
  4027fc:	00 00 
  4027fe:	0f 11 bc 24 80 00 00 	movups %xmm7,0x80(%rsp)
  402805:	00 
  402806:	0f 11 74 24 70       	movups %xmm6,0x70(%rsp)
  40280b:	0f 11 6c 24 60       	movups %xmm5,0x60(%rsp)
  402810:	0f 11 64 24 50       	movups %xmm4,0x50(%rsp)
  402815:	0f 11 5c 24 40       	movups %xmm3,0x40(%rsp)
  40281a:	0f 11 54 24 30       	movups %xmm2,0x30(%rsp)
  40281f:	0f 11 4c 24 20       	movups %xmm1,0x20(%rsp)
  402824:	f3 0f 7f 04 24       	movdqu %xmm0,(%rsp)
  402829:	f3 0f 7f 44 24 10    	movdqu %xmm0,0x10(%rsp)
  40282f:	b9 01 00 00 00       	mov    $0x1,%ecx
  402834:	48 8d 04 24          	lea    (%rsp),%rax
  402838:	e8 73 f5 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  40283d:	85 c0                	test   %eax,%eax
  40283f:	0f 85 57 08 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402845:	33 c0                	xor    %eax,%eax
  402847:	0f a2                	cpuid  
  402849:	89 84 24 20 01 00 00 	mov    %eax,0x120(%rsp)
  402850:	89 9c 24 24 01 00 00 	mov    %ebx,0x124(%rsp)
  402857:	89 8c 24 28 01 00 00 	mov    %ecx,0x128(%rsp)
  40285e:	89 94 24 2c 01 00 00 	mov    %edx,0x12c(%rsp)
  402865:	83 bc 24 20 01 00 00 	cmpl   $0x0,0x120(%rsp)
  40286c:	00 
  40286d:	0f 84 9b 09 00 00    	je     40320e <__intel_cpu_features_init_body+0xa7e>
  402873:	41 83 fd 01          	cmp    $0x1,%r13d
  402877:	0f 84 43 0a 00 00    	je     4032c0 <__intel_cpu_features_init_body+0xb30>
  40287d:	b8 01 00 00 00       	mov    $0x1,%eax
  402882:	0f a2                	cpuid  
  402884:	89 cf                	mov    %ecx,%edi
  402886:	f6 c2 01             	test   $0x1,%dl
  402889:	74 16                	je     4028a1 <__intel_cpu_features_init_body+0x111>
  40288b:	b9 02 00 00 00       	mov    $0x2,%ecx
  402890:	48 8d 04 24          	lea    (%rsp),%rax
  402894:	e8 17 f5 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402899:	85 c0                	test   %eax,%eax
  40289b:	0f 85 fb 07 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  4028a1:	f7 c2 00 80 00 00    	test   $0x8000,%edx
  4028a7:	74 16                	je     4028bf <__intel_cpu_features_init_body+0x12f>
  4028a9:	b9 03 00 00 00       	mov    $0x3,%ecx
  4028ae:	48 8d 04 24          	lea    (%rsp),%rax
  4028b2:	e8 f9 f4 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  4028b7:	85 c0                	test   %eax,%eax
  4028b9:	0f 85 dd 07 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  4028bf:	f7 c2 00 00 80 00    	test   $0x800000,%edx
  4028c5:	74 16                	je     4028dd <__intel_cpu_features_init_body+0x14d>
  4028c7:	b9 04 00 00 00       	mov    $0x4,%ecx
  4028cc:	48 8d 04 24          	lea    (%rsp),%rax
  4028d0:	e8 db f4 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  4028d5:	85 c0                	test   %eax,%eax
  4028d7:	0f 85 bf 07 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  4028dd:	f7 c2 00 00 00 01    	test   $0x1000000,%edx
  4028e3:	75 11                	jne    4028f6 <__intel_cpu_features_init_body+0x166>
  4028e5:	f7 c7 00 00 00 40    	test   $0x40000000,%edi
  4028eb:	0f 85 83 01 00 00    	jne    402a74 <__intel_cpu_features_init_body+0x2e4>
  4028f1:	e9 99 01 00 00       	jmpq   402a8f <__intel_cpu_features_init_body+0x2ff>
  4028f6:	b9 05 00 00 00       	mov    $0x5,%ecx
  4028fb:	48 8d 04 24          	lea    (%rsp),%rax
  4028ff:	e8 ac f4 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402904:	85 c0                	test   %eax,%eax
  402906:	0f 85 90 07 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  40290c:	f7 c2 00 00 00 02    	test   $0x2000000,%edx
  402912:	74 16                	je     40292a <__intel_cpu_features_init_body+0x19a>
  402914:	b9 06 00 00 00       	mov    $0x6,%ecx
  402919:	48 8d 04 24          	lea    (%rsp),%rax
  40291d:	e8 8e f4 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402922:	85 c0                	test   %eax,%eax
  402924:	0f 85 72 07 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  40292a:	f7 c2 00 00 00 04    	test   $0x4000000,%edx
  402930:	74 16                	je     402948 <__intel_cpu_features_init_body+0x1b8>
  402932:	b9 07 00 00 00       	mov    $0x7,%ecx
  402937:	48 8d 04 24          	lea    (%rsp),%rax
  40293b:	e8 70 f4 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402940:	85 c0                	test   %eax,%eax
  402942:	0f 85 54 07 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402948:	f7 c7 01 00 00 00    	test   $0x1,%edi
  40294e:	74 16                	je     402966 <__intel_cpu_features_init_body+0x1d6>
  402950:	b9 08 00 00 00       	mov    $0x8,%ecx
  402955:	48 8d 04 24          	lea    (%rsp),%rax
  402959:	e8 52 f4 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  40295e:	85 c0                	test   %eax,%eax
  402960:	0f 85 36 07 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402966:	f7 c7 00 02 00 00    	test   $0x200,%edi
  40296c:	74 16                	je     402984 <__intel_cpu_features_init_body+0x1f4>
  40296e:	b9 09 00 00 00       	mov    $0x9,%ecx
  402973:	48 8d 04 24          	lea    (%rsp),%rax
  402977:	e8 34 f4 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  40297c:	85 c0                	test   %eax,%eax
  40297e:	0f 85 18 07 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402984:	f7 c7 00 00 40 00    	test   $0x400000,%edi
  40298a:	74 16                	je     4029a2 <__intel_cpu_features_init_body+0x212>
  40298c:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402991:	48 8d 04 24          	lea    (%rsp),%rax
  402995:	e8 16 f4 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  40299a:	85 c0                	test   %eax,%eax
  40299c:	0f 85 fa 06 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  4029a2:	f7 c7 00 00 08 00    	test   $0x80000,%edi
  4029a8:	74 16                	je     4029c0 <__intel_cpu_features_init_body+0x230>
  4029aa:	b9 0a 00 00 00       	mov    $0xa,%ecx
  4029af:	48 8d 04 24          	lea    (%rsp),%rax
  4029b3:	e8 f8 f3 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  4029b8:	85 c0                	test   %eax,%eax
  4029ba:	0f 85 dc 06 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  4029c0:	f7 c7 00 00 10 00    	test   $0x100000,%edi
  4029c6:	74 16                	je     4029de <__intel_cpu_features_init_body+0x24e>
  4029c8:	b9 0b 00 00 00       	mov    $0xb,%ecx
  4029cd:	48 8d 04 24          	lea    (%rsp),%rax
  4029d1:	e8 da f3 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  4029d6:	85 c0                	test   %eax,%eax
  4029d8:	0f 85 be 06 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  4029de:	f7 c7 00 00 80 00    	test   $0x800000,%edi
  4029e4:	74 16                	je     4029fc <__intel_cpu_features_init_body+0x26c>
  4029e6:	b9 0d 00 00 00       	mov    $0xd,%ecx
  4029eb:	48 8d 04 24          	lea    (%rsp),%rax
  4029ef:	e8 bc f3 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  4029f4:	85 c0                	test   %eax,%eax
  4029f6:	0f 85 a0 06 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  4029fc:	f7 c7 02 00 00 00    	test   $0x2,%edi
  402a02:	74 16                	je     402a1a <__intel_cpu_features_init_body+0x28a>
  402a04:	b9 0e 00 00 00       	mov    $0xe,%ecx
  402a09:	48 8d 04 24          	lea    (%rsp),%rax
  402a0d:	e8 9e f3 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402a12:	85 c0                	test   %eax,%eax
  402a14:	0f 85 82 06 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402a1a:	f7 c7 00 00 00 02    	test   $0x2000000,%edi
  402a20:	74 16                	je     402a38 <__intel_cpu_features_init_body+0x2a8>
  402a22:	b9 0f 00 00 00       	mov    $0xf,%ecx
  402a27:	48 8d 04 24          	lea    (%rsp),%rax
  402a2b:	e8 80 f3 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402a30:	85 c0                	test   %eax,%eax
  402a32:	0f 85 64 06 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402a38:	b8 07 00 00 00       	mov    $0x7,%eax
  402a3d:	33 c9                	xor    %ecx,%ecx
  402a3f:	0f a2                	cpuid  
  402a41:	40 b6 01             	mov    $0x1,%sil
  402a44:	41 89 df             	mov    %ebx,%r15d
  402a47:	41 89 d0             	mov    %edx,%r8d
  402a4a:	41 89 c9             	mov    %ecx,%r9d
  402a4d:	41 f7 c7 00 00 00 20 	test   $0x20000000,%r15d
  402a54:	74 16                	je     402a6c <__intel_cpu_features_init_body+0x2dc>
  402a56:	b9 24 00 00 00       	mov    $0x24,%ecx
  402a5b:	48 8d 04 24          	lea    (%rsp),%rax
  402a5f:	e8 4c f3 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402a64:	85 c0                	test   %eax,%eax
  402a66:	0f 85 30 06 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402a6c:	f7 c7 00 00 00 40    	test   $0x40000000,%edi
  402a72:	74 2d                	je     402aa1 <__intel_cpu_features_init_body+0x311>
  402a74:	b9 12 00 00 00       	mov    $0x12,%ecx
  402a79:	48 8d 04 24          	lea    (%rsp),%rax
  402a7d:	e8 2e f3 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402a82:	85 c0                	test   %eax,%eax
  402a84:	0f 85 12 06 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402a8a:	40 84 f6             	test   %sil,%sil
  402a8d:	75 12                	jne    402aa1 <__intel_cpu_features_init_body+0x311>
  402a8f:	b8 07 00 00 00       	mov    $0x7,%eax
  402a94:	33 c9                	xor    %ecx,%ecx
  402a96:	0f a2                	cpuid  
  402a98:	41 89 d0             	mov    %edx,%r8d
  402a9b:	41 89 c9             	mov    %ecx,%r9d
  402a9e:	41 89 df             	mov    %ebx,%r15d
  402aa1:	44 89 f8             	mov    %r15d,%eax
  402aa4:	25 08 01 00 00       	and    $0x108,%eax
  402aa9:	3d 08 01 00 00       	cmp    $0x108,%eax
  402aae:	75 16                	jne    402ac6 <__intel_cpu_features_init_body+0x336>
  402ab0:	b9 14 00 00 00       	mov    $0x14,%ecx
  402ab5:	48 8d 04 24          	lea    (%rsp),%rax
  402ab9:	e8 f2 f2 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402abe:	85 c0                	test   %eax,%eax
  402ac0:	0f 85 d6 05 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402ac6:	41 f7 c7 04 00 00 00 	test   $0x4,%r15d
  402acd:	74 16                	je     402ae5 <__intel_cpu_features_init_body+0x355>
  402acf:	b9 36 00 00 00       	mov    $0x36,%ecx
  402ad4:	48 8d 04 24          	lea    (%rsp),%rax
  402ad8:	e8 d3 f2 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402add:	85 c0                	test   %eax,%eax
  402adf:	0f 85 b7 05 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402ae5:	41 f7 c7 10 00 00 00 	test   $0x10,%r15d
  402aec:	74 16                	je     402b04 <__intel_cpu_features_init_body+0x374>
  402aee:	b9 16 00 00 00       	mov    $0x16,%ecx
  402af3:	48 8d 04 24          	lea    (%rsp),%rax
  402af7:	e8 b4 f2 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402afc:	85 c0                	test   %eax,%eax
  402afe:	0f 85 98 05 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402b04:	41 f7 c7 00 08 00 00 	test   $0x800,%r15d
  402b0b:	74 16                	je     402b23 <__intel_cpu_features_init_body+0x393>
  402b0d:	b9 17 00 00 00       	mov    $0x17,%ecx
  402b12:	48 8d 04 24          	lea    (%rsp),%rax
  402b16:	e8 95 f2 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402b1b:	85 c0                	test   %eax,%eax
  402b1d:	0f 85 79 05 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402b23:	41 f7 c7 00 00 08 00 	test   $0x80000,%r15d
  402b2a:	74 16                	je     402b42 <__intel_cpu_features_init_body+0x3b2>
  402b2c:	b9 1d 00 00 00       	mov    $0x1d,%ecx
  402b31:	48 8d 04 24          	lea    (%rsp),%rax
  402b35:	e8 76 f2 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402b3a:	85 c0                	test   %eax,%eax
  402b3c:	0f 85 5a 05 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402b42:	41 f7 c7 00 00 04 00 	test   $0x40000,%r15d
  402b49:	74 16                	je     402b61 <__intel_cpu_features_init_body+0x3d1>
  402b4b:	b9 1e 00 00 00       	mov    $0x1e,%ecx
  402b50:	48 8d 04 24          	lea    (%rsp),%rax
  402b54:	e8 57 f2 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402b59:	85 c0                	test   %eax,%eax
  402b5b:	0f 85 3b 05 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402b61:	41 f7 c7 00 00 00 01 	test   $0x1000000,%r15d
  402b68:	74 16                	je     402b80 <__intel_cpu_features_init_body+0x3f0>
  402b6a:	b9 32 00 00 00       	mov    $0x32,%ecx
  402b6f:	48 8d 04 24          	lea    (%rsp),%rax
  402b73:	e8 38 f2 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402b78:	85 c0                	test   %eax,%eax
  402b7a:	0f 85 1c 05 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402b80:	b8 01 00 00 80       	mov    $0x80000001,%eax
  402b85:	0f a2                	cpuid  
  402b87:	f6 c1 20             	test   $0x20,%cl
  402b8a:	74 16                	je     402ba2 <__intel_cpu_features_init_body+0x412>
  402b8c:	b9 15 00 00 00       	mov    $0x15,%ecx
  402b91:	48 8d 04 24          	lea    (%rsp),%rax
  402b95:	e8 16 f2 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402b9a:	85 c0                	test   %eax,%eax
  402b9c:	0f 85 fa 04 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402ba2:	b8 08 00 00 80       	mov    $0x80000008,%eax
  402ba7:	0f a2                	cpuid  
  402ba9:	f7 c3 00 02 00 00    	test   $0x200,%ebx
  402baf:	74 16                	je     402bc7 <__intel_cpu_features_init_body+0x437>
  402bb1:	b9 37 00 00 00       	mov    $0x37,%ecx
  402bb6:	48 8d 04 24          	lea    (%rsp),%rax
  402bba:	e8 f1 f1 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402bbf:	85 c0                	test   %eax,%eax
  402bc1:	0f 85 d5 04 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402bc7:	41 f7 c1 20 00 00 00 	test   $0x20,%r9d
  402bce:	74 16                	je     402be6 <__intel_cpu_features_init_body+0x456>
  402bd0:	b9 3d 00 00 00       	mov    $0x3d,%ecx
  402bd5:	48 8d 04 24          	lea    (%rsp),%rax
  402bd9:	e8 d2 f1 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402bde:	85 c0                	test   %eax,%eax
  402be0:	0f 85 b6 04 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402be6:	41 f7 c1 80 00 00 00 	test   $0x80,%r9d
  402bed:	74 16                	je     402c05 <__intel_cpu_features_init_body+0x475>
  402bef:	b9 35 00 00 00       	mov    $0x35,%ecx
  402bf4:	48 8d 04 24          	lea    (%rsp),%rax
  402bf8:	e8 b3 f1 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402bfd:	85 c0                	test   %eax,%eax
  402bff:	0f 85 97 04 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402c05:	41 f7 c1 00 01 00 00 	test   $0x100,%r9d
  402c0c:	74 16                	je     402c24 <__intel_cpu_features_init_body+0x494>
  402c0e:	b9 2e 00 00 00       	mov    $0x2e,%ecx
  402c13:	48 8d 04 24          	lea    (%rsp),%rax
  402c17:	e8 94 f1 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402c1c:	85 c0                	test   %eax,%eax
  402c1e:	0f 85 78 04 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402c24:	41 f7 c1 00 00 40 00 	test   $0x400000,%r9d
  402c2b:	74 16                	je     402c43 <__intel_cpu_features_init_body+0x4b3>
  402c2d:	b9 33 00 00 00       	mov    $0x33,%ecx
  402c32:	48 8d 04 24          	lea    (%rsp),%rax
  402c36:	e8 75 f1 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402c3b:	85 c0                	test   %eax,%eax
  402c3d:	0f 85 59 04 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402c43:	41 f7 c1 00 00 00 01 	test   $0x1000000,%r9d
  402c4a:	74 16                	je     402c62 <__intel_cpu_features_init_body+0x4d2>
  402c4c:	b9 3a 00 00 00       	mov    $0x3a,%ecx
  402c51:	48 8d 04 24          	lea    (%rsp),%rax
  402c55:	e8 56 f1 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402c5a:	85 c0                	test   %eax,%eax
  402c5c:	0f 85 3a 04 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402c62:	41 f7 c1 00 00 00 08 	test   $0x8000000,%r9d
  402c69:	74 16                	je     402c81 <__intel_cpu_features_init_body+0x4f1>
  402c6b:	b9 3b 00 00 00       	mov    $0x3b,%ecx
  402c70:	48 8d 04 24          	lea    (%rsp),%rax
  402c74:	e8 37 f1 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402c79:	85 c0                	test   %eax,%eax
  402c7b:	0f 85 1b 04 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402c81:	41 f7 c1 00 00 00 10 	test   $0x10000000,%r9d
  402c88:	74 16                	je     402ca0 <__intel_cpu_features_init_body+0x510>
  402c8a:	b9 3c 00 00 00       	mov    $0x3c,%ecx
  402c8f:	48 8d 04 24          	lea    (%rsp),%rax
  402c93:	e8 18 f1 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402c98:	85 c0                	test   %eax,%eax
  402c9a:	0f 85 fc 03 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402ca0:	41 f7 c1 00 00 00 20 	test   $0x20000000,%r9d
  402ca7:	74 16                	je     402cbf <__intel_cpu_features_init_body+0x52f>
  402ca9:	b9 3f 00 00 00       	mov    $0x3f,%ecx
  402cae:	48 8d 04 24          	lea    (%rsp),%rax
  402cb2:	e8 f9 f0 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402cb7:	85 c0                	test   %eax,%eax
  402cb9:	0f 85 dd 03 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402cbf:	41 f7 c0 00 00 10 00 	test   $0x100000,%r8d
  402cc6:	74 16                	je     402cde <__intel_cpu_features_init_body+0x54e>
  402cc8:	b9 34 00 00 00       	mov    $0x34,%ecx
  402ccd:	48 8d 04 24          	lea    (%rsp),%rax
  402cd1:	e8 da f0 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402cd6:	85 c0                	test   %eax,%eax
  402cd8:	0f 85 be 03 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402cde:	41 f7 c0 00 00 04 00 	test   $0x40000,%r8d
  402ce5:	74 16                	je     402cfd <__intel_cpu_features_init_body+0x56d>
  402ce7:	b9 38 00 00 00       	mov    $0x38,%ecx
  402cec:	48 8d 04 24          	lea    (%rsp),%rax
  402cf0:	e8 bb f0 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402cf5:	85 c0                	test   %eax,%eax
  402cf7:	0f 85 9f 03 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402cfd:	b8 14 00 00 00       	mov    $0x14,%eax
  402d02:	33 c9                	xor    %ecx,%ecx
  402d04:	0f a2                	cpuid  
  402d06:	f6 c3 10             	test   $0x10,%bl
  402d09:	74 16                	je     402d21 <__intel_cpu_features_init_body+0x591>
  402d0b:	b9 1b 00 00 00       	mov    $0x1b,%ecx
  402d10:	48 8d 04 24          	lea    (%rsp),%rax
  402d14:	e8 97 f0 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402d19:	85 c0                	test   %eax,%eax
  402d1b:	0f 85 7b 03 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402d21:	f7 c7 00 00 00 08    	test   $0x8000000,%edi
  402d27:	0f 84 fa 03 00 00    	je     403127 <__intel_cpu_features_init_body+0x997>
  402d2d:	b9 01 00 00 00       	mov    $0x1,%ecx
  402d32:	48 8d 04 24          	lea    (%rsp),%rax
  402d36:	e8 75 f0 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402d3b:	85 c0                	test   %eax,%eax
  402d3d:	0f 85 59 03 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402d43:	33 c9                	xor    %ecx,%ecx
  402d45:	0f 01 d0             	xgetbv 
  402d48:	89 c2                	mov    %eax,%edx
  402d4a:	89 d1                	mov    %edx,%ecx
  402d4c:	83 e1 06             	and    $0x6,%ecx
  402d4f:	83 f9 06             	cmp    $0x6,%ecx
  402d52:	0f 85 cf 03 00 00    	jne    403127 <__intel_cpu_features_init_body+0x997>
  402d58:	b9 01 00 00 00       	mov    $0x1,%ecx
  402d5d:	48 8d 04 24          	lea    (%rsp),%rax
  402d61:	e8 4a f0 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402d66:	85 c0                	test   %eax,%eax
  402d68:	0f 85 2e 03 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402d6e:	f7 c7 00 00 00 10    	test   $0x10000000,%edi
  402d74:	74 54                	je     402dca <__intel_cpu_features_init_body+0x63a>
  402d76:	b9 10 00 00 00       	mov    $0x10,%ecx
  402d7b:	48 8d 04 24          	lea    (%rsp),%rax
  402d7f:	e8 2c f0 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402d84:	85 c0                	test   %eax,%eax
  402d86:	0f 85 10 03 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402d8c:	41 f7 c1 00 02 00 00 	test   $0x200,%r9d
  402d93:	74 16                	je     402dab <__intel_cpu_features_init_body+0x61b>
  402d95:	b9 2f 00 00 00       	mov    $0x2f,%ecx
  402d9a:	48 8d 04 24          	lea    (%rsp),%rax
  402d9e:	e8 0d f0 ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402da3:	85 c0                	test   %eax,%eax
  402da5:	0f 85 f1 02 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402dab:	41 f7 c1 00 04 00 00 	test   $0x400,%r9d
  402db2:	74 16                	je     402dca <__intel_cpu_features_init_body+0x63a>
  402db4:	b9 30 00 00 00       	mov    $0x30,%ecx
  402db9:	48 8d 04 24          	lea    (%rsp),%rax
  402dbd:	e8 ee ef ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402dc2:	85 c0                	test   %eax,%eax
  402dc4:	0f 85 d2 02 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402dca:	f7 c7 00 00 00 20    	test   $0x20000000,%edi
  402dd0:	74 16                	je     402de8 <__intel_cpu_features_init_body+0x658>
  402dd2:	b9 11 00 00 00       	mov    $0x11,%ecx
  402dd7:	48 8d 04 24          	lea    (%rsp),%rax
  402ddb:	e8 d0 ef ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402de0:	85 c0                	test   %eax,%eax
  402de2:	0f 85 b4 02 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402de8:	41 f7 c7 20 00 00 00 	test   $0x20,%r15d
  402def:	74 16                	je     402e07 <__intel_cpu_features_init_body+0x677>
  402df1:	b9 18 00 00 00       	mov    $0x18,%ecx
  402df6:	48 8d 04 24          	lea    (%rsp),%rax
  402dfa:	e8 b1 ef ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402dff:	85 c0                	test   %eax,%eax
  402e01:	0f 85 95 02 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402e07:	f7 c7 00 10 00 00    	test   $0x1000,%edi
  402e0d:	74 16                	je     402e25 <__intel_cpu_features_init_body+0x695>
  402e0f:	b9 13 00 00 00       	mov    $0x13,%ecx
  402e14:	48 8d 04 24          	lea    (%rsp),%rax
  402e18:	e8 93 ef ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402e1d:	85 c0                	test   %eax,%eax
  402e1f:	0f 85 77 02 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402e25:	89 d0                	mov    %edx,%eax
  402e27:	83 e0 18             	and    $0x18,%eax
  402e2a:	83 f8 18             	cmp    $0x18,%eax
  402e2d:	75 35                	jne    402e64 <__intel_cpu_features_init_body+0x6d4>
  402e2f:	b9 01 00 00 00       	mov    $0x1,%ecx
  402e34:	48 8d 04 24          	lea    (%rsp),%rax
  402e38:	e8 73 ef ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402e3d:	85 c0                	test   %eax,%eax
  402e3f:	0f 85 57 02 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402e45:	41 f7 c7 00 40 00 00 	test   $0x4000,%r15d
  402e4c:	74 16                	je     402e64 <__intel_cpu_features_init_body+0x6d4>
  402e4e:	b9 25 00 00 00       	mov    $0x25,%ecx
  402e53:	48 8d 04 24          	lea    (%rsp),%rax
  402e57:	e8 54 ef ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402e5c:	85 c0                	test   %eax,%eax
  402e5e:	0f 85 38 02 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402e64:	81 e2 e0 00 00 00    	and    $0xe0,%edx
  402e6a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
  402e70:	0f 85 b1 02 00 00    	jne    403127 <__intel_cpu_features_init_body+0x997>
  402e76:	b9 01 00 00 00       	mov    $0x1,%ecx
  402e7b:	48 8d 04 24          	lea    (%rsp),%rax
  402e7f:	e8 2c ef ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402e84:	85 c0                	test   %eax,%eax
  402e86:	0f 85 10 02 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402e8c:	41 f7 c7 00 00 01 00 	test   $0x10000,%r15d
  402e93:	74 16                	je     402eab <__intel_cpu_features_init_body+0x71b>
  402e95:	b9 19 00 00 00       	mov    $0x19,%ecx
  402e9a:	48 8d 04 24          	lea    (%rsp),%rax
  402e9e:	e8 0d ef ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402ea3:	85 c0                	test   %eax,%eax
  402ea5:	0f 85 f1 01 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402eab:	41 f7 c7 00 00 00 10 	test   $0x10000000,%r15d
  402eb2:	74 16                	je     402eca <__intel_cpu_features_init_body+0x73a>
  402eb4:	b9 23 00 00 00       	mov    $0x23,%ecx
  402eb9:	48 8d 04 24          	lea    (%rsp),%rax
  402ebd:	e8 ee ee ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402ec2:	85 c0                	test   %eax,%eax
  402ec4:	0f 85 d2 01 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402eca:	41 f7 c7 00 00 00 08 	test   $0x8000000,%r15d
  402ed1:	74 16                	je     402ee9 <__intel_cpu_features_init_body+0x759>
  402ed3:	b9 21 00 00 00       	mov    $0x21,%ecx
  402ed8:	48 8d 04 24          	lea    (%rsp),%rax
  402edc:	e8 cf ee ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402ee1:	85 c0                	test   %eax,%eax
  402ee3:	0f 85 b3 01 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402ee9:	41 f7 c7 00 00 00 04 	test   $0x4000000,%r15d
  402ef0:	74 16                	je     402f08 <__intel_cpu_features_init_body+0x778>
  402ef2:	b9 22 00 00 00       	mov    $0x22,%ecx
  402ef7:	48 8d 04 24          	lea    (%rsp),%rax
  402efb:	e8 b0 ee ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402f00:	85 c0                	test   %eax,%eax
  402f02:	0f 85 94 01 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402f08:	41 f7 c7 00 00 02 00 	test   $0x20000,%r15d
  402f0f:	74 16                	je     402f27 <__intel_cpu_features_init_body+0x797>
  402f11:	b9 1a 00 00 00       	mov    $0x1a,%ecx
  402f16:	48 8d 04 24          	lea    (%rsp),%rax
  402f1a:	e8 91 ee ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402f1f:	85 c0                	test   %eax,%eax
  402f21:	0f 85 75 01 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402f27:	41 f7 c7 00 00 00 40 	test   $0x40000000,%r15d
  402f2e:	74 16                	je     402f46 <__intel_cpu_features_init_body+0x7b6>
  402f30:	b9 26 00 00 00       	mov    $0x26,%ecx
  402f35:	48 8d 04 24          	lea    (%rsp),%rax
  402f39:	e8 72 ee ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402f3e:	85 c0                	test   %eax,%eax
  402f40:	0f 85 56 01 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402f46:	44 89 f8             	mov    %r15d,%eax
  402f49:	25 00 00 00 80       	and    $0x80000000,%eax
  402f4e:	3d 00 00 00 80       	cmp    $0x80000000,%eax
  402f53:	75 16                	jne    402f6b <__intel_cpu_features_init_body+0x7db>
  402f55:	b9 27 00 00 00       	mov    $0x27,%ecx
  402f5a:	48 8d 04 24          	lea    (%rsp),%rax
  402f5e:	e8 4d ee ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402f63:	85 c0                	test   %eax,%eax
  402f65:	0f 85 31 01 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402f6b:	41 f7 c7 00 00 20 00 	test   $0x200000,%r15d
  402f72:	74 16                	je     402f8a <__intel_cpu_features_init_body+0x7fa>
  402f74:	b9 1f 00 00 00       	mov    $0x1f,%ecx
  402f79:	48 8d 04 24          	lea    (%rsp),%rax
  402f7d:	e8 2e ee ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402f82:	85 c0                	test   %eax,%eax
  402f84:	0f 85 12 01 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402f8a:	41 f7 c1 02 00 00 00 	test   $0x2,%r9d
  402f91:	74 16                	je     402fa9 <__intel_cpu_features_init_body+0x819>
  402f93:	b9 28 00 00 00       	mov    $0x28,%ecx
  402f98:	48 8d 04 24          	lea    (%rsp),%rax
  402f9c:	e8 0f ee ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402fa1:	85 c0                	test   %eax,%eax
  402fa3:	0f 85 f3 00 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402fa9:	41 f7 c1 00 40 00 00 	test   $0x4000,%r9d
  402fb0:	74 16                	je     402fc8 <__intel_cpu_features_init_body+0x838>
  402fb2:	b9 2b 00 00 00       	mov    $0x2b,%ecx
  402fb7:	48 8d 04 24          	lea    (%rsp),%rax
  402fbb:	e8 f0 ed ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402fc0:	85 c0                	test   %eax,%eax
  402fc2:	0f 85 d4 00 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402fc8:	41 f7 c0 04 00 00 00 	test   $0x4,%r8d
  402fcf:	74 16                	je     402fe7 <__intel_cpu_features_init_body+0x857>
  402fd1:	b9 2a 00 00 00       	mov    $0x2a,%ecx
  402fd6:	48 8d 04 24          	lea    (%rsp),%rax
  402fda:	e8 d1 ed ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402fdf:	85 c0                	test   %eax,%eax
  402fe1:	0f 85 b5 00 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  402fe7:	41 f7 c0 08 00 00 00 	test   $0x8,%r8d
  402fee:	74 16                	je     403006 <__intel_cpu_features_init_body+0x876>
  402ff0:	b9 29 00 00 00       	mov    $0x29,%ecx
  402ff5:	48 8d 04 24          	lea    (%rsp),%rax
  402ff9:	e8 b2 ed ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  402ffe:	85 c0                	test   %eax,%eax
  403000:	0f 85 96 00 00 00    	jne    40309c <__intel_cpu_features_init_body+0x90c>
  403006:	41 f7 c1 00 10 00 00 	test   $0x1000,%r9d
  40300d:	74 12                	je     403021 <__intel_cpu_features_init_body+0x891>
  40300f:	b9 2c 00 00 00       	mov    $0x2c,%ecx
  403014:	48 8d 04 24          	lea    (%rsp),%rax
  403018:	e8 93 ed ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  40301d:	85 c0                	test   %eax,%eax
  40301f:	75 7b                	jne    40309c <__intel_cpu_features_init_body+0x90c>
  403021:	41 f7 c1 40 00 00 00 	test   $0x40,%r9d
  403028:	74 12                	je     40303c <__intel_cpu_features_init_body+0x8ac>
  40302a:	b9 2d 00 00 00       	mov    $0x2d,%ecx
  40302f:	48 8d 04 24          	lea    (%rsp),%rax
  403033:	e8 78 ed ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  403038:	85 c0                	test   %eax,%eax
  40303a:	75 60                	jne    40309c <__intel_cpu_features_init_body+0x90c>
  40303c:	41 f7 c1 00 08 00 00 	test   $0x800,%r9d
  403043:	74 12                	je     403057 <__intel_cpu_features_init_body+0x8c7>
  403045:	b9 31 00 00 00       	mov    $0x31,%ecx
  40304a:	48 8d 04 24          	lea    (%rsp),%rax
  40304e:	e8 5d ed ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  403053:	85 c0                	test   %eax,%eax
  403055:	75 45                	jne    40309c <__intel_cpu_features_init_body+0x90c>
  403057:	b8 07 00 00 00       	mov    $0x7,%eax
  40305c:	b9 01 00 00 00       	mov    $0x1,%ecx
  403061:	0f a2                	cpuid  
  403063:	a8 20                	test   $0x20,%al
  403065:	74 12                	je     403079 <__intel_cpu_features_init_body+0x8e9>
  403067:	b9 3e 00 00 00       	mov    $0x3e,%ecx
  40306c:	48 8d 04 24          	lea    (%rsp),%rax
  403070:	e8 3b ed ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  403075:	85 c0                	test   %eax,%eax
  403077:	75 23                	jne    40309c <__intel_cpu_features_init_body+0x90c>
  403079:	41 f7 c0 00 01 00 00 	test   $0x100,%r8d
  403080:	0f 84 a1 00 00 00    	je     403127 <__intel_cpu_features_init_body+0x997>
  403086:	b9 39 00 00 00       	mov    $0x39,%ecx
  40308b:	48 8d 04 24          	lea    (%rsp),%rax
  40308f:	e8 1c ed ff ff       	callq  401db0 <__libirc_set_cpu_feature>
  403094:	85 c0                	test   %eax,%eax
  403096:	0f 84 8b 00 00 00    	je     403127 <__intel_cpu_features_init_body+0x997>
  40309c:	0f 10 84 24 f0 00 00 	movups 0xf0(%rsp),%xmm0
  4030a3:	00 
  4030a4:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  4030a9:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  4030ae:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
  4030b3:	0f 10 64 24 50       	movups 0x50(%rsp),%xmm4
  4030b8:	0f 10 6c 24 60       	movups 0x60(%rsp),%xmm5
  4030bd:	0f 10 74 24 70       	movups 0x70(%rsp),%xmm6
  4030c2:	0f 10 bc 24 80 00 00 	movups 0x80(%rsp),%xmm7
  4030c9:	00 
  4030ca:	44 0f 10 84 24 90 00 	movups 0x90(%rsp),%xmm8
  4030d1:	00 00 
  4030d3:	44 0f 10 8c 24 a0 00 	movups 0xa0(%rsp),%xmm9
  4030da:	00 00 
  4030dc:	44 0f 10 94 24 b0 00 	movups 0xb0(%rsp),%xmm10
  4030e3:	00 00 
  4030e5:	44 0f 10 9c 24 c0 00 	movups 0xc0(%rsp),%xmm11
  4030ec:	00 00 
  4030ee:	44 0f 10 a4 24 d0 00 	movups 0xd0(%rsp),%xmm12
  4030f5:	00 00 
  4030f7:	44 0f 10 ac 24 e0 00 	movups 0xe0(%rsp),%xmm13
  4030fe:	00 00 
  403100:	44 0f 10 b4 24 00 01 	movups 0x100(%rsp),%xmm14
  403107:	00 00 
  403109:	44 0f 10 bc 24 10 01 	movups 0x110(%rsp),%xmm15
  403110:	00 00 
  403112:	48 81 c4 30 01 00 00 	add    $0x130,%rsp
  403119:	41 5f                	pop    %r15
  40311b:	41 5d                	pop    %r13
  40311d:	41 59                	pop    %r9
  40311f:	41 58                	pop    %r8
  403121:	5f                   	pop    %rdi
  403122:	5e                   	pop    %rsi
  403123:	5b                   	pop    %rbx
  403124:	59                   	pop    %rcx
  403125:	5a                   	pop    %rdx
  403126:	c3                   	retq   
  403127:	48 8d 3d 06 15 00 00 	lea    0x1506(%rip),%rdi        # 404634 <il0_peep_printf_format_0+0x1194>
  40312e:	e8 6d db ff ff       	callq  400ca0 <getenv@plt>
  403133:	48 89 c3             	mov    %rax,%rbx
  403136:	e8 75 db ff ff       	callq  400cb0 <__errno_location@plt>
  40313b:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  403141:	48 85 db             	test   %rbx,%rbx
  403144:	74 21                	je     403167 <__intel_cpu_features_init_body+0x9d7>
  403146:	48 89 df             	mov    %rbx,%rdi
  403149:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  40314e:	e8 2d ea ff ff       	callq  401b80 <__libirc_get_disable_mask>
  403153:	85 c0                	test   %eax,%eax
  403155:	7e 10                	jle    403167 <__intel_cpu_features_init_body+0x9d7>
  403157:	f3 0f 6f 44 24 10    	movdqu 0x10(%rsp),%xmm0
  40315d:	66 0f df 04 24       	pandn  (%rsp),%xmm0
  403162:	f3 0f 7f 04 24       	movdqu %xmm0,(%rsp)
  403167:	41 83 fd 01          	cmp    $0x1,%r13d
  40316b:	0f 84 3a 01 00 00    	je     4032ab <__intel_cpu_features_init_body+0xb1b>
  403171:	48 8d 05 b8 39 20 00 	lea    0x2039b8(%rip),%rax        # 606b30 <__intel_cpu_feature_indicator_x>
  403178:	48 8d 0c 24          	lea    (%rsp),%rcx
  40317c:	e8 0f ec ff ff       	callq  401d90 <__intel_set_cpu_indicator>
  403181:	0f 10 84 24 f0 00 00 	movups 0xf0(%rsp),%xmm0
  403188:	00 
  403189:	33 c0                	xor    %eax,%eax
  40318b:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  403190:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  403195:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
  40319a:	0f 10 64 24 50       	movups 0x50(%rsp),%xmm4
  40319f:	0f 10 6c 24 60       	movups 0x60(%rsp),%xmm5
  4031a4:	0f 10 74 24 70       	movups 0x70(%rsp),%xmm6
  4031a9:	0f 10 bc 24 80 00 00 	movups 0x80(%rsp),%xmm7
  4031b0:	00 
  4031b1:	44 0f 10 84 24 90 00 	movups 0x90(%rsp),%xmm8
  4031b8:	00 00 
  4031ba:	44 0f 10 8c 24 a0 00 	movups 0xa0(%rsp),%xmm9
  4031c1:	00 00 
  4031c3:	44 0f 10 94 24 b0 00 	movups 0xb0(%rsp),%xmm10
  4031ca:	00 00 
  4031cc:	44 0f 10 9c 24 c0 00 	movups 0xc0(%rsp),%xmm11
  4031d3:	00 00 
  4031d5:	44 0f 10 a4 24 d0 00 	movups 0xd0(%rsp),%xmm12
  4031dc:	00 00 
  4031de:	44 0f 10 ac 24 e0 00 	movups 0xe0(%rsp),%xmm13
  4031e5:	00 00 
  4031e7:	44 0f 10 b4 24 00 01 	movups 0x100(%rsp),%xmm14
  4031ee:	00 00 
  4031f0:	44 0f 10 bc 24 10 01 	movups 0x110(%rsp),%xmm15
  4031f7:	00 00 
  4031f9:	48 81 c4 30 01 00 00 	add    $0x130,%rsp
  403200:	41 5f                	pop    %r15
  403202:	41 5d                	pop    %r13
  403204:	41 59                	pop    %r9
  403206:	41 58                	pop    %r8
  403208:	5f                   	pop    %rdi
  403209:	5e                   	pop    %rsi
  40320a:	5b                   	pop    %rbx
  40320b:	59                   	pop    %rcx
  40320c:	5a                   	pop    %rdx
  40320d:	c3                   	retq   
  40320e:	48 8d 05 0b 39 20 00 	lea    0x20390b(%rip),%rax        # 606b20 <__intel_cpu_feature_indicator>
  403215:	48 8d 0c 24          	lea    (%rsp),%rcx
  403219:	e8 72 eb ff ff       	callq  401d90 <__intel_set_cpu_indicator>
  40321e:	0f 10 84 24 f0 00 00 	movups 0xf0(%rsp),%xmm0
  403225:	00 
  403226:	33 c0                	xor    %eax,%eax
  403228:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  40322d:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  403232:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
  403237:	0f 10 64 24 50       	movups 0x50(%rsp),%xmm4
  40323c:	0f 10 6c 24 60       	movups 0x60(%rsp),%xmm5
  403241:	0f 10 74 24 70       	movups 0x70(%rsp),%xmm6
  403246:	0f 10 bc 24 80 00 00 	movups 0x80(%rsp),%xmm7
  40324d:	00 
  40324e:	44 0f 10 84 24 90 00 	movups 0x90(%rsp),%xmm8
  403255:	00 00 
  403257:	44 0f 10 8c 24 a0 00 	movups 0xa0(%rsp),%xmm9
  40325e:	00 00 
  403260:	44 0f 10 94 24 b0 00 	movups 0xb0(%rsp),%xmm10
  403267:	00 00 
  403269:	44 0f 10 9c 24 c0 00 	movups 0xc0(%rsp),%xmm11
  403270:	00 00 
  403272:	44 0f 10 a4 24 d0 00 	movups 0xd0(%rsp),%xmm12
  403279:	00 00 
  40327b:	44 0f 10 ac 24 e0 00 	movups 0xe0(%rsp),%xmm13
  403282:	00 00 
  403284:	44 0f 10 b4 24 00 01 	movups 0x100(%rsp),%xmm14
  40328b:	00 00 
  40328d:	44 0f 10 bc 24 10 01 	movups 0x110(%rsp),%xmm15
  403294:	00 00 
  403296:	48 81 c4 30 01 00 00 	add    $0x130,%rsp
  40329d:	41 5f                	pop    %r15
  40329f:	41 5d                	pop    %r13
  4032a1:	41 59                	pop    %r9
  4032a3:	41 58                	pop    %r8
  4032a5:	5f                   	pop    %rdi
  4032a6:	5e                   	pop    %rsi
  4032a7:	5b                   	pop    %rbx
  4032a8:	59                   	pop    %rcx
  4032a9:	5a                   	pop    %rdx
  4032aa:	c3                   	retq   
  4032ab:	48 8d 05 6e 38 20 00 	lea    0x20386e(%rip),%rax        # 606b20 <__intel_cpu_feature_indicator>
  4032b2:	48 8d 0c 24          	lea    (%rsp),%rcx
  4032b6:	e8 d5 ea ff ff       	callq  401d90 <__intel_set_cpu_indicator>
  4032bb:	e9 b1 fe ff ff       	jmpq   403171 <__intel_cpu_features_init_body+0x9e1>
  4032c0:	81 bc 24 24 01 00 00 	cmpl   $0x756e6547,0x124(%rsp)
  4032c7:	47 65 6e 75 
  4032cb:	0f 85 3d ff ff ff    	jne    40320e <__intel_cpu_features_init_body+0xa7e>
  4032d1:	81 bc 24 2c 01 00 00 	cmpl   $0x49656e69,0x12c(%rsp)
  4032d8:	69 6e 65 49 
  4032dc:	0f 85 2c ff ff ff    	jne    40320e <__intel_cpu_features_init_body+0xa7e>
  4032e2:	81 bc 24 28 01 00 00 	cmpl   $0x6c65746e,0x128(%rsp)
  4032e9:	6e 74 65 6c 
  4032ed:	0f 85 1b ff ff ff    	jne    40320e <__intel_cpu_features_init_body+0xa7e>
  4032f3:	e9 85 f5 ff ff       	jmpq   40287d <__intel_cpu_features_init_body+0xed>
  4032f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4032ff:	00 

0000000000403300 <__intel_proc_init_ftzdazule>:
  403300:	f3 0f 1e fa          	repz nop %edx
  403304:	48 81 ec 08 02 00 00 	sub    $0x208,%rsp
  40330b:	89 f2                	mov    %esi,%edx
  40330d:	89 f1                	mov    %esi,%ecx
  40330f:	83 e2 04             	and    $0x4,%edx
  403312:	83 e1 02             	and    $0x2,%ecx
  403315:	74 22                	je     403339 <__intel_proc_init_ftzdazule+0x39>
  403317:	f7 c7 02 00 00 00    	test   $0x2,%edi
  40331d:	74 38                	je     403357 <__intel_proc_init_ftzdazule+0x57>
  40331f:	85 d2                	test   %edx,%edx
  403321:	74 08                	je     40332b <__intel_proc_init_ftzdazule+0x2b>
  403323:	f7 c7 04 00 00 00    	test   $0x4,%edi
  403329:	74 2c                	je     403357 <__intel_proc_init_ftzdazule+0x57>
  40332b:	f7 c6 01 00 00 00    	test   $0x1,%esi
  403331:	0f 85 aa 00 00 00    	jne    4033e1 <__intel_proc_init_ftzdazule+0xe1>
  403337:	eb 68                	jmp    4033a1 <__intel_proc_init_ftzdazule+0xa1>
  403339:	85 d2                	test   %edx,%edx
  40333b:	0f 84 90 00 00 00    	je     4033d1 <__intel_proc_init_ftzdazule+0xd1>
  403341:	f7 c7 04 00 00 00    	test   $0x4,%edi
  403347:	74 0e                	je     403357 <__intel_proc_init_ftzdazule+0x57>
  403349:	f7 c6 01 00 00 00    	test   $0x1,%esi
  40334f:	0f 85 8c 00 00 00    	jne    4033e1 <__intel_proc_init_ftzdazule+0xe1>
  403355:	eb 5f                	jmp    4033b6 <__intel_proc_init_ftzdazule+0xb6>
  403357:	b8 00 02 00 00       	mov    $0x200,%eax
  40335c:	66 0f ef c0          	pxor   %xmm0,%xmm0
  403360:	f3 0f 7f 44 04 f0    	movdqu %xmm0,-0x10(%rsp,%rax,1)
  403366:	f3 0f 7f 44 04 e0    	movdqu %xmm0,-0x20(%rsp,%rax,1)
  40336c:	f3 0f 7f 44 04 d0    	movdqu %xmm0,-0x30(%rsp,%rax,1)
  403372:	f3 0f 7f 44 04 c0    	movdqu %xmm0,-0x40(%rsp,%rax,1)
  403378:	48 83 e8 40          	sub    $0x40,%rax
  40337c:	75 e2                	jne    403360 <__intel_proc_init_ftzdazule+0x60>
  40337e:	0f ae 04 24          	fxsave (%rsp)
  403382:	33 ff                	xor    %edi,%edi
  403384:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  403388:	a8 40                	test   $0x40,%al
  40338a:	0f 44 cf             	cmove  %edi,%ecx
  40338d:	a9 00 00 02 00       	test   $0x20000,%eax
  403392:	0f 44 d7             	cmove  %edi,%edx
  403395:	f7 c6 01 00 00 00    	test   $0x1,%esi
  40339b:	75 44                	jne    4033e1 <__intel_proc_init_ftzdazule+0xe1>
  40339d:	85 c9                	test   %ecx,%ecx
  40339f:	74 11                	je     4033b2 <__intel_proc_init_ftzdazule+0xb2>
  4033a1:	0f ae 1c 24          	stmxcsr (%rsp)
  4033a5:	8b 04 24             	mov    (%rsp),%eax
  4033a8:	83 c8 40             	or     $0x40,%eax
  4033ab:	89 04 24             	mov    %eax,(%rsp)
  4033ae:	0f ae 14 24          	ldmxcsr (%rsp)
  4033b2:	85 d2                	test   %edx,%edx
  4033b4:	74 23                	je     4033d9 <__intel_proc_init_ftzdazule+0xd9>
  4033b6:	0f ae 1c 24          	stmxcsr (%rsp)
  4033ba:	8b 04 24             	mov    (%rsp),%eax
  4033bd:	0d 00 00 02 00       	or     $0x20000,%eax
  4033c2:	89 04 24             	mov    %eax,(%rsp)
  4033c5:	0f ae 14 24          	ldmxcsr (%rsp)
  4033c9:	48 81 c4 08 02 00 00 	add    $0x208,%rsp
  4033d0:	c3                   	retq   
  4033d1:	f7 c6 01 00 00 00    	test   $0x1,%esi
  4033d7:	75 08                	jne    4033e1 <__intel_proc_init_ftzdazule+0xe1>
  4033d9:	48 81 c4 08 02 00 00 	add    $0x208,%rsp
  4033e0:	c3                   	retq   
  4033e1:	0f ae 1c 24          	stmxcsr (%rsp)
  4033e5:	8b 04 24             	mov    (%rsp),%eax
  4033e8:	0d 00 80 00 00       	or     $0x8000,%eax
  4033ed:	89 04 24             	mov    %eax,(%rsp)
  4033f0:	0f ae 14 24          	ldmxcsr (%rsp)
  4033f4:	eb a7                	jmp    40339d <__intel_proc_init_ftzdazule+0x9d>
  4033f6:	0f 1f 00             	nopl   (%rax)
  4033f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000403400 <__libc_csu_init>:
  403400:	41 57                	push   %r15
  403402:	41 89 ff             	mov    %edi,%r15d
  403405:	41 56                	push   %r14
  403407:	49 89 f6             	mov    %rsi,%r14
  40340a:	41 55                	push   %r13
  40340c:	49 89 d5             	mov    %rdx,%r13
  40340f:	41 54                	push   %r12
  403411:	4c 8d 25 d0 25 20 00 	lea    0x2025d0(%rip),%r12        # 6059e8 <__frame_dummy_init_array_entry>
  403418:	55                   	push   %rbp
  403419:	48 8d 2d d0 25 20 00 	lea    0x2025d0(%rip),%rbp        # 6059f0 <__init_array_end>
  403420:	53                   	push   %rbx
  403421:	4c 29 e5             	sub    %r12,%rbp
  403424:	31 db                	xor    %ebx,%ebx
  403426:	48 c1 fd 03          	sar    $0x3,%rbp
  40342a:	48 83 ec 08          	sub    $0x8,%rsp
  40342e:	e8 45 d7 ff ff       	callq  400b78 <_init>
  403433:	48 85 ed             	test   %rbp,%rbp
  403436:	74 1e                	je     403456 <__libc_csu_init+0x56>
  403438:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40343f:	00 
  403440:	4c 89 ea             	mov    %r13,%rdx
  403443:	4c 89 f6             	mov    %r14,%rsi
  403446:	44 89 ff             	mov    %r15d,%edi
  403449:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40344d:	48 83 c3 01          	add    $0x1,%rbx
  403451:	48 39 eb             	cmp    %rbp,%rbx
  403454:	75 ea                	jne    403440 <__libc_csu_init+0x40>
  403456:	48 83 c4 08          	add    $0x8,%rsp
  40345a:	5b                   	pop    %rbx
  40345b:	5d                   	pop    %rbp
  40345c:	41 5c                	pop    %r12
  40345e:	41 5d                	pop    %r13
  403460:	41 5e                	pop    %r14
  403462:	41 5f                	pop    %r15
  403464:	c3                   	retq   
  403465:	90                   	nop
  403466:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40346d:	00 00 00 

0000000000403470 <__libc_csu_fini>:
  403470:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000403474 <_fini>:
  403474:	48 83 ec 08          	sub    $0x8,%rsp
  403478:	48 83 c4 08          	add    $0x8,%rsp
  40347c:	c3                   	retq   
