	.file	"test.cxx"
	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
.LC0:
	.string	"TOP "
.LC1:
	.string	"virtual void Top::print()"
	.section	.text._ZN3Top5printEv,"axG",@progbits,_ZN3Top5printEv,comdat
	.align 2
	.weak	_ZN3Top5printEv
	.type	_ZN3Top5printEv, @function
_ZN3Top5printEv:
.LFB1522:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	leaq	.LC0(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1522:
	.size	_ZN3Top5printEv, .-_ZN3Top5printEv
	.section	.rodata
.LC2:
	.string	"BOTTOM "
.LC3:
	.string	"virtual void Bottom::print()"
	.section	.text._ZN6Bottom5printEv,"axG",@progbits,_ZN6Bottom5printEv,comdat
	.align 2
	.weak	_ZN6Bottom5printEv
	.type	_ZN6Bottom5printEv, @function
_ZN6Bottom5printEv:
.LFB1523:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	leaq	.LC2(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1523:
	.size	_ZN6Bottom5printEv, .-_ZN6Bottom5printEv
	.section	.text._ZN3TopC2Ev,"axG",@progbits,_ZN3TopC5Ev,comdat
	.align 2
	.weak	_ZN3TopC2Ev
	.type	_ZN3TopC2Ev, @function
_ZN3TopC2Ev:
.LFB1527:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	leaq	16+_ZTV3Top(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1527:
	.size	_ZN3TopC2Ev, .-_ZN3TopC2Ev
	.weak	_ZN3TopC1Ev
	.set	_ZN3TopC1Ev,_ZN3TopC2Ev
	.section	.text._ZN6BottomC2Ev,"axG",@progbits,_ZN6BottomC5Ev,comdat
	.align 2
	.weak	_ZN6BottomC2Ev
	.type	_ZN6BottomC2Ev, @function
_ZN6BottomC2Ev:
.LFB1529:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN3TopC2Ev
	leaq	16+_ZTV6Bottom(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1529:
	.size	_ZN6BottomC2Ev, .-_ZN6BottomC2Ev
	.weak	_ZN6BottomC1Ev
	.set	_ZN6BottomC1Ev,_ZN6BottomC2Ev
	.text
	.globl	main
	.type	main, @function
main:
.LFB1524:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movl	$8, %edi
	call	_Znwm@PLT
	movq	%rax, %rbx
	movq	$0, (%rbx)
	movq	%rbx, %rdi
	call	_ZN6BottomC1Ev
	movq	%rbx, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN3Top5printEv
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	*%rdx
	movl	$0, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1524:
	.size	main, .-main
	.weak	_ZTV6Bottom
	.section	.data.rel.ro.local._ZTV6Bottom,"awG",@progbits,_ZTV6Bottom,comdat
	.align 8
	.type	_ZTV6Bottom, @object
	.size	_ZTV6Bottom, 24
_ZTV6Bottom:
	.quad	0
	.quad	_ZTI6Bottom
	.quad	_ZN6Bottom5printEv
	.weak	_ZTV3Top
	.section	.data.rel.ro.local._ZTV3Top,"awG",@progbits,_ZTV3Top,comdat
	.align 8
	.type	_ZTV3Top, @object
	.size	_ZTV3Top, 24
_ZTV3Top:
	.quad	0
	.quad	_ZTI3Top
	.quad	_ZN3Top5printEv
	.weak	_ZTI6Bottom
	.section	.data.rel.ro._ZTI6Bottom,"awG",@progbits,_ZTI6Bottom,comdat
	.align 8
	.type	_ZTI6Bottom, @object
	.size	_ZTI6Bottom, 24
_ZTI6Bottom:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTS6Bottom
	.quad	_ZTI3Top
	.weak	_ZTS6Bottom
	.section	.rodata._ZTS6Bottom,"aG",@progbits,_ZTS6Bottom,comdat
	.align 8
	.type	_ZTS6Bottom, @object
	.size	_ZTS6Bottom, 8
_ZTS6Bottom:
	.string	"6Bottom"
	.weak	_ZTI3Top
	.section	.data.rel.ro._ZTI3Top,"awG",@progbits,_ZTI3Top,comdat
	.align 8
	.type	_ZTI3Top, @object
	.size	_ZTI3Top, 16
_ZTI3Top:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTS3Top
	.weak	_ZTS3Top
	.section	.rodata._ZTS3Top,"aG",@progbits,_ZTS3Top,comdat
	.type	_ZTS3Top, @object
	.size	_ZTS3Top, 5
_ZTS3Top:
	.string	"3Top"
	.text
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB2019:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L9
	cmpl	$65535, -8(%rbp)
	jne	.L9
	leaq	_ZStL8__ioinit(%rip), %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	__cxa_atexit@PLT
.L9:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2019:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB2020:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2020:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
