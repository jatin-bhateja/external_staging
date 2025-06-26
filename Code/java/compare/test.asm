	.file	"test.cpp"
	.intel_syntax noprefix
# GNU C++14 (Ubuntu 7.5.0-3ubuntu1~18.04) version 7.5.0 (x86_64-linux-gnu)
#	compiled by GNU C version 7.5.0, GMP version 6.1.2, MPFR version 4.0.1, MPC version 1.1.0, isl version isl-0.19-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu -D_GNU_SOURCE test.cpp
# -masm=intel -mtune=generic -march=x86-64 -O2 -fverbose-asm
# -fno-dwarf2-cfi-asm -fstack-protector-strong -Wformat -Wformat-security
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -falign-labels -fasynchronous-unwind-tables -fauto-inc-dec
# -fbranch-count-reg -fcaller-saves -fchkp-check-incomplete-type
# -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
# -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
# -fchkp-use-static-bounds -fchkp-use-static-const-bounds
# -fchkp-use-wrappers -fcode-hoisting -fcombine-stack-adjustments -fcommon
# -fcompare-elim -fcprop-registers -fcrossjumping -fcse-follow-jumps
# -fdefer-pop -fdelete-null-pointer-checks -fdevirtualize
# -fdevirtualize-speculatively -fearly-inlining
# -feliminate-unused-debug-types -fexceptions -fexpensive-optimizations
# -fforward-propagate -ffp-int-builtin-inexact -ffunction-cse -fgcse
# -fgcse-lm -fgnu-runtime -fgnu-unique -fguess-branch-probability
# -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
# -findirect-inlining -finline -finline-atomics
# -finline-functions-called-once -finline-small-functions -fipa-bit-cp
# -fipa-cp -fipa-icf -fipa-icf-functions -fipa-icf-variables -fipa-profile
# -fipa-pure-const -fipa-ra -fipa-reference -fipa-sra -fipa-vrp
# -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
# -fmath-errno -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2 -fplt
# -fprefetch-loop-arrays -free -freg-struct-return -freorder-blocks
# -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fschedule-insns2
# -fsemantic-interposition -fshow-column -fshrink-wrap
# -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
# -fsplit-wide-types -fssa-backprop -fssa-phiopt -fstack-protector-strong
# -fstdarg-opt -fstore-merging -fstrict-aliasing -fstrict-overflow
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim
# -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
# -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
# -ftree-vrp -funit-at-a-time -funwind-tables -fverbose-asm
# -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -malign-stringops -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387 -mfxsr
# -mglibc -mieee-fp -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone
# -msse -msse2 -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,std::ctype<char>::do_widen(char) const,comdat
	.align 2
	.p2align 4,,15
	.weak	std::ctype<char>::do_widen(char) const
	.type	std::ctype<char>::do_widen(char) const, @function
std::ctype<char>::do_widen(char) const:
.LFB1321:
# /usr/include/c++/7/bits/locale_facets.h:1083:       { return __c; }
	mov	eax, esi	#, __c
	ret
.LFE1321:
	.size	std::ctype<char>::do_widen(char) const, .-std::ctype<char>::do_widen(char) const
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Argument type : "
.LC1:
	.string	"\nReturn type : "
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB1565:
	push	rbp	#
.LCFI0:
	push	rbx	#
.LCFI1:
# /usr/include/c++/7/ostream:561: 	__ostream_insert(__out, __s,
	lea	rsi, .LC0[rip]	#,
	lea	rdi, std::cout[rip]	#,
	mov	edx, 16	#,
# test.cpp:17: int main() {
	sub	rsp, 8	#,
.LCFI2:
# /usr/include/c++/7/ostream:561: 	__ostream_insert(__out, __s,
	call	std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@PLT	#
# test.cpp:9:     std::cout << "Argument type : " << typeid(arr).name() << "\nReturn type : " << typeid(T).name() << std::endl;
	mov	rbx, QWORD PTR typeinfo for int*[rip+8]	# iftmp.1_74, MEM[(const char * *)&typeinfo for int* + 8B]
# /usr/include/c++/7/typeinfo:100:     { return __name[0] == '*' ? __name + 1 : __name; }
	cmp	BYTE PTR [rbx], 42	# *_72,
	je	.L34	#,
.L4:
# /usr/include/c++/7/bits/char_traits.h:320: 	return __builtin_strlen(__s);
	mov	rdi, rbx	#, iftmp.1_74
	call	strlen@PLT	#
# /usr/include/c++/7/ostream:561: 	__ostream_insert(__out, __s,
	mov	rsi, rbx	#, iftmp.1_74
	lea	rdi, std::cout[rip]	#,
	lea	rbx, std::cout[rip]	# tmp270,
	mov	rdx, rax	#, tmp195
	call	std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@PLT	#
.L5:
	lea	rsi, .LC1[rip]	#,
	lea	rdi, std::cout[rip]	#,
	mov	edx, 15	#,
	call	std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@PLT	#
# test.cpp:9:     std::cout << "Argument type : " << typeid(arr).name() << "\nReturn type : " << typeid(T).name() << std::endl;
	mov	rbp, QWORD PTR typeinfo for int[rip+8]	# iftmp.1_79, MEM[(const char * *)&typeinfo for int + 8B]
# /usr/include/c++/7/typeinfo:100:     { return __name[0] == '*' ? __name + 1 : __name; }
	cmp	BYTE PTR 0[rbp], 42	# *_77,
	je	.L35	#,
.L6:
# /usr/include/c++/7/bits/char_traits.h:320: 	return __builtin_strlen(__s);
	mov	rdi, rbp	#, iftmp.1_79
	call	strlen@PLT	#
# /usr/include/c++/7/ostream:561: 	__ostream_insert(__out, __s,
	lea	rdi, std::cout[rip]	#,
	mov	rdx, rax	#, tmp205
	mov	rsi, rbp	#, iftmp.1_79
	call	std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@PLT	#
.L7:
# /usr/include/c++/7/ostream:591:     { return flush(__os.put(__os.widen('\n'))); }
	mov	rax, QWORD PTR std::cout[rip]	# cout._vptr.basic_ostream, cout._vptr.basic_ostream
# /usr/include/c++/7/bits/basic_ios.h:450:       { return __check_facet(_M_ctype).widen(__c); }
	mov	rax, QWORD PTR -24[rax]	# MEM[(long int *)_99 + -24B], MEM[(long int *)_99 + -24B]
	mov	rbp, QWORD PTR 240[rbx+rax]	# _115, MEM[(const struct basic_ios *)_102]._M_ctype
# /usr/include/c++/7/bits/basic_ios.h:49:       if (!__f)
	test	rbp, rbp	# _115
	je	.L15	#,
# /usr/include/c++/7/bits/locale_facets.h:874: 	if (_M_widen_ok)
	cmp	BYTE PTR 56[rbp], 0	# MEM[(const struct ctype *)_115]._M_widen_ok,
	je	.L9	#,
# /usr/include/c++/7/bits/locale_facets.h:875: 	  return _M_widen[static_cast<unsigned char>(__c)];
	movsx	esi, BYTE PTR 67[rbp]	#, MEM[(const struct ctype *)_115]._M_widen
.L10:
# /usr/include/c++/7/ostream:591:     { return flush(__os.put(__os.widen('\n'))); }
	lea	rdi, std::cout[rip]	#,
	call	std::basic_ostream<char, std::char_traits<char> >::put(char)@PLT	#
# /usr/include/c++/7/ostream:613:     { return __os.flush(); }
	mov	rdi, rax	#, _105
	call	std::basic_ostream<char, std::char_traits<char> >::flush()@PLT	#
# test.cpp:22:   std::cout << obj.doSum(arri, 4) << std::endl;
	lea	rdi, std::cout[rip]	#,
	mov	esi, 10	#,
	call	std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@PLT	#
# /usr/include/c++/7/ostream:113: 	return __pf(*this);
	mov	rdi, rax	#, _17
	call	std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@PLT	#
# /usr/include/c++/7/ostream:561: 	__ostream_insert(__out, __s,
	lea	rsi, .LC0[rip]	#,
	lea	rdi, std::cout[rip]	#,
	mov	edx, 16	#,
	call	std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@PLT	#
# test.cpp:9:     std::cout << "Argument type : " << typeid(arr).name() << "\nReturn type : " << typeid(T).name() << std::endl;
	mov	rbp, QWORD PTR typeinfo for long*[rip+8]	# iftmp.1_55, MEM[(const char * *)&typeinfo for long* + 8B]
# /usr/include/c++/7/typeinfo:100:     { return __name[0] == '*' ? __name + 1 : __name; }
	cmp	BYTE PTR 0[rbp], 42	# *_53,
	je	.L36	#,
.L11:
# /usr/include/c++/7/bits/char_traits.h:320: 	return __builtin_strlen(__s);
	mov	rdi, rbp	#, iftmp.1_55
	call	strlen@PLT	#
# /usr/include/c++/7/ostream:561: 	__ostream_insert(__out, __s,
	lea	rdi, std::cout[rip]	#,
	mov	rdx, rax	#, tmp222
	mov	rsi, rbp	#, iftmp.1_55
	call	std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@PLT	#
.L12:
	lea	rsi, .LC1[rip]	#,
	lea	rdi, std::cout[rip]	#,
	mov	edx, 15	#,
	call	std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@PLT	#
# test.cpp:9:     std::cout << "Argument type : " << typeid(arr).name() << "\nReturn type : " << typeid(T).name() << std::endl;
	mov	rbp, QWORD PTR typeinfo for long[rip+8]	# iftmp.1_60, MEM[(const char * *)&typeinfo for long + 8B]
# /usr/include/c++/7/typeinfo:100:     { return __name[0] == '*' ? __name + 1 : __name; }
	cmp	BYTE PTR 0[rbp], 42	# *_58,
	je	.L37	#,
.L13:
# /usr/include/c++/7/bits/char_traits.h:320: 	return __builtin_strlen(__s);
	mov	rdi, rbp	#, iftmp.1_60
	call	strlen@PLT	#
# /usr/include/c++/7/ostream:561: 	__ostream_insert(__out, __s,
	lea	rdi, std::cout[rip]	#,
	mov	rdx, rax	#, tmp232
	mov	rsi, rbp	#, iftmp.1_60
	call	std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@PLT	#
.L14:
# /usr/include/c++/7/ostream:591:     { return flush(__os.put(__os.widen('\n'))); }
	mov	rax, QWORD PTR std::cout[rip]	# cout._vptr.basic_ostream, cout._vptr.basic_ostream
# /usr/include/c++/7/bits/basic_ios.h:450:       { return __check_facet(_M_ctype).widen(__c); }
	mov	rax, QWORD PTR -24[rax]	# MEM[(long int *)_142 + -24B], MEM[(long int *)_142 + -24B]
	mov	rbp, QWORD PTR 240[rbx+rax]	# _158, MEM[(const struct basic_ios *)_145]._M_ctype
# /usr/include/c++/7/bits/basic_ios.h:49:       if (!__f)
	test	rbp, rbp	# _158
	je	.L15	#,
# /usr/include/c++/7/bits/locale_facets.h:874: 	if (_M_widen_ok)
	cmp	BYTE PTR 56[rbp], 0	# MEM[(const struct ctype *)_158]._M_widen_ok,
	je	.L16	#,
# /usr/include/c++/7/bits/locale_facets.h:875: 	  return _M_widen[static_cast<unsigned char>(__c)];
	movsx	esi, BYTE PTR 67[rbp]	#, MEM[(const struct ctype *)_158]._M_widen
.L17:
# /usr/include/c++/7/ostream:591:     { return flush(__os.put(__os.widen('\n'))); }
	lea	rdi, std::cout[rip]	#,
	call	std::basic_ostream<char, std::char_traits<char> >::put(char)@PLT	#
# /usr/include/c++/7/ostream:613:     { return __os.flush(); }
	mov	rdi, rax	#, _148
	call	std::basic_ostream<char, std::char_traits<char> >::flush()@PLT	#
# /usr/include/c++/7/ostream:167:       { return _M_insert(__n); }
	lea	rdi, std::cout[rip]	#,
	mov	esi, 10	#,
	call	std::basic_ostream<char, std::char_traits<char> >& std::basic_ostream<char, std::char_traits<char> >::_M_insert<long>(long)@PLT	#
# /usr/include/c++/7/ostream:113: 	return __pf(*this);
	mov	rdi, rax	#, _26
	call	std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@PLT	#
# /usr/include/c++/7/ostream:561: 	__ostream_insert(__out, __s,
	lea	rsi, .LC0[rip]	#,
	lea	rdi, std::cout[rip]	#,
	mov	edx, 16	#,
	call	std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@PLT	#
# test.cpp:9:     std::cout << "Argument type : " << typeid(arr).name() << "\nReturn type : " << typeid(T).name() << std::endl;
	mov	rbp, QWORD PTR typeinfo for float*[rip+8]	# iftmp.1_36, MEM[(const char * *)&typeinfo for float* + 8B]
# /usr/include/c++/7/typeinfo:100:     { return __name[0] == '*' ? __name + 1 : __name; }
	cmp	BYTE PTR 0[rbp], 42	# *_34,
	je	.L38	#,
.L18:
# /usr/include/c++/7/bits/char_traits.h:320: 	return __builtin_strlen(__s);
	mov	rdi, rbp	#, iftmp.1_36
	call	strlen@PLT	#
# /usr/include/c++/7/ostream:561: 	__ostream_insert(__out, __s,
	lea	rdi, std::cout[rip]	#,
	mov	rdx, rax	#, tmp249
	mov	rsi, rbp	#, iftmp.1_36
	call	std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@PLT	#
.L19:
	lea	rsi, .LC1[rip]	#,
	lea	rdi, std::cout[rip]	#,
	mov	edx, 15	#,
	call	std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@PLT	#
# test.cpp:9:     std::cout << "Argument type : " << typeid(arr).name() << "\nReturn type : " << typeid(T).name() << std::endl;
	mov	rbp, QWORD PTR typeinfo for float[rip+8]	# iftmp.1_41, MEM[(const char * *)&typeinfo for float + 8B]
# /usr/include/c++/7/typeinfo:100:     { return __name[0] == '*' ? __name + 1 : __name; }
	cmp	BYTE PTR 0[rbp], 42	# *_39,
	je	.L39	#,
.L20:
# /usr/include/c++/7/bits/char_traits.h:320: 	return __builtin_strlen(__s);
	mov	rdi, rbp	#, iftmp.1_41
	call	strlen@PLT	#
# /usr/include/c++/7/ostream:561: 	__ostream_insert(__out, __s,
	lea	rdi, std::cout[rip]	#,
	mov	rdx, rax	#, tmp259
	mov	rsi, rbp	#, iftmp.1_41
	call	std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@PLT	#
.L21:
# /usr/include/c++/7/ostream:591:     { return flush(__os.put(__os.widen('\n'))); }
	mov	rax, QWORD PTR std::cout[rip]	# cout._vptr.basic_ostream, cout._vptr.basic_ostream
# /usr/include/c++/7/bits/basic_ios.h:450:       { return __check_facet(_M_ctype).widen(__c); }
	mov	rax, QWORD PTR -24[rax]	# MEM[(long int *)_185 + -24B], MEM[(long int *)_185 + -24B]
	mov	rbx, QWORD PTR 240[rbx+rax]	# _201, MEM[(const struct basic_ios *)_188]._M_ctype
# /usr/include/c++/7/bits/basic_ios.h:49:       if (!__f)
	test	rbx, rbx	# _201
	je	.L15	#,
# /usr/include/c++/7/bits/locale_facets.h:874: 	if (_M_widen_ok)
	cmp	BYTE PTR 56[rbx], 0	# MEM[(const struct ctype *)_201]._M_widen_ok,
	je	.L22	#,
# /usr/include/c++/7/bits/locale_facets.h:875: 	  return _M_widen[static_cast<unsigned char>(__c)];
	movsx	esi, BYTE PTR 67[rbx]	#, MEM[(const struct ctype *)_201]._M_widen
.L23:
# /usr/include/c++/7/ostream:591:     { return flush(__os.put(__os.widen('\n'))); }
	lea	rdi, std::cout[rip]	#,
	call	std::basic_ostream<char, std::char_traits<char> >::put(char)@PLT	#
# /usr/include/c++/7/ostream:613:     { return __os.flush(); }
	mov	rdi, rax	#, _191
	call	std::basic_ostream<char, std::char_traits<char> >::flush()@PLT	#
# /usr/include/c++/7/ostream:228: 	return _M_insert(static_cast<double>(__f));
	movsd	xmm0, QWORD PTR .LC2[rip]	#,
	lea	rdi, std::cout[rip]	#,
	call	std::basic_ostream<char, std::char_traits<char> >& std::basic_ostream<char, std::char_traits<char> >::_M_insert<double>(double)@PLT	#
# /usr/include/c++/7/ostream:113: 	return __pf(*this);
	mov	rdi, rax	#, _28
	call	std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@PLT	#
# test.cpp:26: }
	add	rsp, 8	#,
.LCFI3:
	xor	eax, eax	#
	pop	rbx	#
.LCFI4:
	pop	rbp	#
.LCFI5:
	ret
.L9:
.LCFI6:
# /usr/include/c++/7/bits/locale_facets.h:876: 	this->_M_widen_init();
	mov	rdi, rbp	#, _115
	call	std::ctype<char>::_M_widen_init() const@PLT	#
# /usr/include/c++/7/bits/locale_facets.h:877: 	return this->do_widen(__c);
	mov	rax, QWORD PTR 0[rbp]	# MEM[(const struct ctype *)_115].D.29884._vptr.facet, MEM[(const struct ctype *)_115].D.29884._vptr.facet
	lea	rcx, std::ctype<char>::do_widen(char) const[rip]	# tmp212,
	mov	esi, 10	#,
	mov	rdx, QWORD PTR 48[rax]	# _125, MEM[(int (*__vtbl_ptr_type) () *)_124 + 48B]
	cmp	rdx, rcx	# _125, tmp212
	je	.L10	#,
	mov	esi, 10	#,
	mov	rdi, rbp	#, _115
	call	rdx	# _125
	movsx	esi, al	#,
	jmp	.L10	#
.L22:
# /usr/include/c++/7/bits/locale_facets.h:876: 	this->_M_widen_init();
	mov	rdi, rbx	#, _201
	call	std::ctype<char>::_M_widen_init() const@PLT	#
# /usr/include/c++/7/bits/locale_facets.h:877: 	return this->do_widen(__c);
	mov	rax, QWORD PTR [rbx]	# MEM[(const struct ctype *)_201].D.29884._vptr.facet, MEM[(const struct ctype *)_201].D.29884._vptr.facet
	lea	rcx, std::ctype<char>::do_widen(char) const[rip]	# tmp266,
	mov	esi, 10	#,
	mov	rdx, QWORD PTR 48[rax]	# _211, MEM[(int (*__vtbl_ptr_type) () *)_210 + 48B]
	cmp	rdx, rcx	# _211, tmp266
	je	.L23	#,
	mov	esi, 10	#,
	mov	rdi, rbx	#, _201
	call	rdx	# _211
	movsx	esi, al	#,
	jmp	.L23	#
.L16:
# /usr/include/c++/7/bits/locale_facets.h:876: 	this->_M_widen_init();
	mov	rdi, rbp	#, _158
	call	std::ctype<char>::_M_widen_init() const@PLT	#
# /usr/include/c++/7/bits/locale_facets.h:877: 	return this->do_widen(__c);
	mov	rax, QWORD PTR 0[rbp]	# MEM[(const struct ctype *)_158].D.29884._vptr.facet, MEM[(const struct ctype *)_158].D.29884._vptr.facet
	lea	rcx, std::ctype<char>::do_widen(char) const[rip]	# tmp239,
	mov	esi, 10	#,
	mov	rdx, QWORD PTR 48[rax]	# _168, MEM[(int (*__vtbl_ptr_type) () *)_167 + 48B]
	cmp	rdx, rcx	# _168, tmp239
	je	.L17	#,
	mov	esi, 10	#,
	mov	rdi, rbp	#, _158
	call	rdx	# _168
	movsx	esi, al	#,
	jmp	.L17	#
.L38:
# /usr/include/c++/7/ostream:558:       if (!__s)
	add	rbp, 1	# iftmp.1_36,
	jne	.L18	#,
# /usr/include/c++/7/ostream:559: 	__out.setstate(ios_base::badbit);
	mov	rax, QWORD PTR std::cout[rip]	# cout._vptr.basic_ostream, cout._vptr.basic_ostream
	mov	rdi, QWORD PTR -24[rax]	# _182, MEM[(long int *)_179 + -24B]
	add	rdi, rbx	# _182, tmp270
# /usr/include/c++/7/bits/ios_base.h:170:   { return _Ios_Iostate(static_cast<int>(__a) | static_cast<int>(__b)); }
	mov	esi, DWORD PTR 32[rdi]	# tmp246, MEM[(_Ios_Iostate *)_182 + 32B]
	or	esi, 1	# tmp246,
# /usr/include/c++/7/bits/basic_ios.h:158:       { this->clear(this->rdstate() | __state); }
	call	std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@PLT	#
	jmp	.L19	#
.L37:
# /usr/include/c++/7/ostream:558:       if (!__s)
	add	rbp, 1	# iftmp.1_60,
	jne	.L13	#,
# /usr/include/c++/7/ostream:559: 	__out.setstate(ios_base::badbit);
	mov	rax, QWORD PTR std::cout[rip]	# cout._vptr.basic_ostream, cout._vptr.basic_ostream
	mov	rdi, QWORD PTR -24[rax]	# _155, MEM[(long int *)_152 + -24B]
	add	rdi, rbx	# _155, tmp270
# /usr/include/c++/7/bits/ios_base.h:170:   { return _Ios_Iostate(static_cast<int>(__a) | static_cast<int>(__b)); }
	mov	esi, DWORD PTR 32[rdi]	# tmp229, MEM[(_Ios_Iostate *)_155 + 32B]
	or	esi, 1	# tmp229,
# /usr/include/c++/7/bits/basic_ios.h:158:       { this->clear(this->rdstate() | __state); }
	call	std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@PLT	#
	jmp	.L14	#
.L36:
# /usr/include/c++/7/ostream:558:       if (!__s)
	add	rbp, 1	# iftmp.1_55,
	jne	.L11	#,
# /usr/include/c++/7/ostream:559: 	__out.setstate(ios_base::badbit);
	mov	rax, QWORD PTR std::cout[rip]	# cout._vptr.basic_ostream, cout._vptr.basic_ostream
	mov	rdi, QWORD PTR -24[rax]	# _139, MEM[(long int *)_136 + -24B]
	add	rdi, rbx	# _139, tmp270
# /usr/include/c++/7/bits/ios_base.h:170:   { return _Ios_Iostate(static_cast<int>(__a) | static_cast<int>(__b)); }
	mov	esi, DWORD PTR 32[rdi]	# tmp219, MEM[(_Ios_Iostate *)_139 + 32B]
	or	esi, 1	# tmp219,
# /usr/include/c++/7/bits/basic_ios.h:158:       { this->clear(this->rdstate() | __state); }
	call	std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@PLT	#
	jmp	.L12	#
.L39:
# /usr/include/c++/7/ostream:558:       if (!__s)
	add	rbp, 1	# iftmp.1_41,
	jne	.L20	#,
# /usr/include/c++/7/ostream:559: 	__out.setstate(ios_base::badbit);
	mov	rax, QWORD PTR std::cout[rip]	# cout._vptr.basic_ostream, cout._vptr.basic_ostream
	mov	rdi, QWORD PTR -24[rax]	# _198, MEM[(long int *)_195 + -24B]
	add	rdi, rbx	# _198, tmp270
# /usr/include/c++/7/bits/ios_base.h:170:   { return _Ios_Iostate(static_cast<int>(__a) | static_cast<int>(__b)); }
	mov	esi, DWORD PTR 32[rdi]	# tmp256, MEM[(_Ios_Iostate *)_198 + 32B]
	or	esi, 1	# tmp256,
# /usr/include/c++/7/bits/basic_ios.h:158:       { this->clear(this->rdstate() | __state); }
	call	std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@PLT	#
	jmp	.L21	#
.L35:
# /usr/include/c++/7/ostream:558:       if (!__s)
	add	rbp, 1	# iftmp.1_79,
	jne	.L6	#,
# /usr/include/c++/7/ostream:559: 	__out.setstate(ios_base::badbit);
	mov	rax, QWORD PTR std::cout[rip]	# cout._vptr.basic_ostream, cout._vptr.basic_ostream
	mov	rdi, QWORD PTR -24[rax]	# _112, MEM[(long int *)_109 + -24B]
	add	rdi, rbx	# _112, tmp270
# /usr/include/c++/7/bits/ios_base.h:170:   { return _Ios_Iostate(static_cast<int>(__a) | static_cast<int>(__b)); }
	mov	esi, DWORD PTR 32[rdi]	# tmp202, MEM[(_Ios_Iostate *)_112 + 32B]
	or	esi, 1	# tmp202,
# /usr/include/c++/7/bits/basic_ios.h:158:       { this->clear(this->rdstate() | __state); }
	call	std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@PLT	#
	jmp	.L7	#
.L34:
# /usr/include/c++/7/ostream:558:       if (!__s)
	add	rbx, 1	# iftmp.1_74,
	jne	.L4	#,
# /usr/include/c++/7/ostream:559: 	__out.setstate(ios_base::badbit);
	mov	rax, QWORD PTR std::cout[rip]	# cout._vptr.basic_ostream, cout._vptr.basic_ostream
	lea	rbx, std::cout[rip]	# tmp270,
	mov	rdi, QWORD PTR -24[rax]	# _96, MEM[(long int *)_93 + -24B]
	add	rdi, rbx	# _96, tmp270
# /usr/include/c++/7/bits/ios_base.h:170:   { return _Ios_Iostate(static_cast<int>(__a) | static_cast<int>(__b)); }
	mov	esi, DWORD PTR 32[rdi]	# tmp192, MEM[(_Ios_Iostate *)_96 + 32B]
	or	esi, 1	# tmp192,
# /usr/include/c++/7/bits/basic_ios.h:158:       { this->clear(this->rdstate() | __state); }
	call	std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@PLT	#
	jmp	.L5	#
.L15:
# /usr/include/c++/7/bits/basic_ios.h:50: 	__throw_bad_cast();
	call	std::__throw_bad_cast()@PLT	#
.LFE1565:
	.size	main, .-main
	.p2align 4,,15
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB2059:
# /usr/include/c++/7/iostream:74:   static ios_base::Init __ioinit;
	lea	rdi, std::__ioinit[rip]	#,
# test.cpp:26: }
	sub	rsp, 8	#,
.LCFI7:
# /usr/include/c++/7/iostream:74:   static ios_base::Init __ioinit;
	call	std::ios_base::Init::Init()@PLT	#
	mov	rdi, QWORD PTR std::ios_base::Init::~Init()@GOTPCREL[rip]	#,
	lea	rdx, __dso_handle[rip]	#,
	lea	rsi, std::__ioinit[rip]	#,
# test.cpp:26: }
	add	rsp, 8	#,
.LCFI8:
# /usr/include/c++/7/iostream:74:   static ios_base::Init __ioinit;
	jmp	__cxa_atexit@PLT	#
.LFE2059:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.local	std::__ioinit
	.comm	std::__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	2684354560
	.long	1076271513
	.section	.eh_frame,"a",@progbits
.Lframe1:
	.long	.LECIE1-.LSCIE1
.LSCIE1:
	.long	0
	.byte	0x3
	.string	"zR"
	.uleb128 0x1
	.sleb128 -8
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1b
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.byte	0x90
	.uleb128 0x1
	.align 8
.LECIE1:
.LSFDE1:
	.long	.LEFDE1-.LASFDE1
.LASFDE1:
	.long	.LASFDE1-.Lframe1
	.long	.LFB1321-.
	.long	.LFE1321-.LFB1321
	.uleb128 0
	.align 8
.LEFDE1:
.LSFDE3:
	.long	.LEFDE3-.LASFDE3
.LASFDE3:
	.long	.LASFDE3-.Lframe1
	.long	.LFB1565-.
	.long	.LFE1565-.LFB1565
	.uleb128 0
	.byte	0x4
	.long	.LCFI0-.LFB1565
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xa
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0xb
	.align 8
.LEFDE3:
.LSFDE5:
	.long	.LEFDE5-.LASFDE5
.LASFDE5:
	.long	.LASFDE5-.Lframe1
	.long	.LFB2059-.
	.long	.LFE2059-.LFB2059
	.uleb128 0
	.byte	0x4
	.long	.LCFI7-.LFB2059
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x8
	.align 8
.LEFDE5:
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
