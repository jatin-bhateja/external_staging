CompileCommand: print App.micro_vector_masked bool print = true
OpenJDK 64-Bit Server VM warning: printing of assembly code is enabled; turning on DebugNonSafepoints to gain additional output
SCALAR : [Time] 10 ms   [Res] 93000000
VECTOR : [Time] 13 ms   [Res] 93000000

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 292 ------------------------
{method}
 - this oop:          0x00007fd398811948
 - method holder:     'App'
 - constants:         0x00007fd398811088 constant pool [129]/operands[15] {0x00007fd398811088} for 'App' cache=0x00007fd398b00000
 - access:            0xc1000001  public 
 - name:              'micro_vector_masked'
 - signature:         '([I[I[I)V'
 - max stack:         7
 - max locals:        8
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007fd3e100e220
 - adapters:          AHE@0x00007fd3e43a44a0: 0xbbbb0000 i2c: 0x00007fd3e107f6e0 c2i: 0x00007fd3e107f7cc c2iUV: 0x00007fd3e107f796 c2iNCI: 0x00007fd3e107f809
 - compiled entry     0x00007fd3e107f7cc
 - code size:         152
 - code start:        0x00007fd398811898
 - code end (excl):   0x00007fd398811930
 - method data:       0x00007fd398b2b000
 - checked ex length: 0
 - linenumber start:  0x00007fd398811930
 - localvar length:   0

------------------------ OptoAssembly for Compile_id = 292 -----------------------
#
#  void ( App:NotNull *, int[int:>=0]:exact *, int[int:>=0]:exact *, int[int:>=0]:exact * )
#
#r018 rsi:rsi   : parm 0: App:NotNull *
#r016 rdx:rdx   : parm 1: int[int:>=0]:exact *
#r010 rcx:rcx   : parm 2: int[int:>=0]:exact *
#r004 r8:r8   : parm 3: int[int:>=0]:exact *
# -- Old rsp -- Framesize: 160 --
#r583 rsp+156: in_preserve
#r582 rsp+152: return address
#r581 rsp+148: in_preserve
#r580 rsp+144: saved fp register
#r579 rsp+140: pad2, stack alignment
#r578 rsp+136: pad2, stack alignment
#r577 rsp+132: Fixed slot 1
#r576 rsp+128: Fixed slot 0
#r615 rsp+124: spill
#r614 rsp+120: spill
#r613 rsp+116: spill
#r612 rsp+112: spill
#r611 rsp+108: spill
#r610 rsp+104: spill
#r609 rsp+100: spill
#r608 rsp+96: spill
#r607 rsp+92: spill
#r606 rsp+88: spill
#r605 rsp+84: spill
#r604 rsp+80: spill
#r603 rsp+76: spill
#r602 rsp+72: spill
#r601 rsp+68: spill
#r600 rsp+64: spill
#r599 rsp+60: spill
#r598 rsp+56: spill
#r597 rsp+52: spill
#r596 rsp+48: spill
#r595 rsp+44: spill
#r594 rsp+40: spill
#r593 rsp+36: spill
#r592 rsp+32: spill
#r591 rsp+28: spill
#r590 rsp+24: spill
#r589 rsp+20: outgoing argument
#r588 rsp+16: outgoing argument
#r587 rsp+12: outgoing argument
#r586 rsp+ 8: outgoing argument
#r585 rsp+ 4: outgoing argument
#r584 rsp+ 0: outgoing argument
#
0000    N2743: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
0000    movl    rscratch1, [j_rarg0 + oopDesc::klass_offset_in_bytes()]	# compressed klass
	decode_klass_not_null rscratch1, rscratch1
	cmpq    rax, rscratch1	 # Inline cache check
	jne     SharedRuntime::_ic_miss_stub
	nop	# nops to align entry point

        nop 	# 4 bytes pad for loops and calls

0020    B1: #	out( B208 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
0020    # stack bang (712 bytes)
	pushq   rbp	# Save rbp
	subq    rsp, #144	# Create frame

002f    movq    RAX, R8	# spill
0032    movq    [rsp + #24], RSI	# spill
0037    movq    [rsp + #56], RDX	# spill
        nop 	# 4 bytes pad for loops and calls
0040    movl    RBX, [RDX + #12 (8-bit)]	# range
0043    NullCheck RDX

0043    B2: #	out( B209 B3 ) <- in( B1 )  Freq: 0.999999
0043    movl    RBP, [RSI + #12 (8-bit)]	# compressed ptr ! Field: App.SPECIES
0046    movl    R10, [R12 + RBP << 3 + #8] (compressed oop addressing)	# compressed klass ptr
004b    NullCheck RBP

004b    B3: #	out( B160 B4 ) <- in( B2 )  Freq: 0.999998
004b    cmpl    R10, narrowklass: precise klass jdk/incubator/vector/IntVector$IntSpecies: 0x00007fd368213b90:Constant:exact *	# compressed klass ptr
0052    jne,u   B160  P=0.000001 C=-1.000000

0058    B4: #	out( B177 B5 ) <- in( B3 )  Freq: 0.999997
0058    decode_heap_oop_not_null R10,RBP
005c    # checkcastPP of R10
005c    movl    R9, [R10 + #12 (8-bit)]	# int ! Field: jdk/incubator/vector/AbstractSpecies.laneCount (constant)
0060    movl    RSI, R9	# spill
0063    decl    RSI	# int
0065    movl    RBP, R9	# spill
0068    andl    RBP, RSI	# int
006a    testl   RBP, RBP
006c    jne     B177  P=0.000000 C=7521.000000

0072    B5: #	out( B7 B6 ) <- in( B4 )  Freq: 0.999996
0072    andnl  RDI, RSI, RBX
0077    movl    RDX, RBX	# spill
0079    addl    RDX, #-7	# int
        nop 	# 4 bytes pad for loops and calls
0080    testl   RDI, RDI
0082    jg,s   B7  P=0.749904 C=7793.000000

0084    B6: #	out( B19 ) <- in( B5 )  Freq: 0.250095
0084    xorl    R11, R11	# int
0087    movq    R14, RCX	# spill
008a    movq    R13, R8	# spill
008d    jmp     B19

0092    B7: #	out( B174 B8 ) <- in( B5 )  Freq: 0.749901
0092    movq    R14, RCX	# spill
0095    movl    R8, [RCX + #12 (8-bit)]	# range
0099    NullCheck RCX

0099    B8: #	out( B172 B9 ) <- in( B7 )  Freq: 0.7499
0099    subl    R8, R9	# int
009c    incl    R8	# int
        nop 	# 1 bytes pad for loops and calls
00a0    testl   R8, R8
00a3    jl     B172  P=0.000001 C=-1.000000

00a9    B9: #	out( B173 B10 ) <- in( B8 )  Freq: 0.7499
00a9    movl    R11, [R10 + #68 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.dummyVector (constant)
00ad    movl    RCX, [R12 + R11 << 3 + #8] (compressed oop addressing)	# compressed klass ptr
00b2    NullCheck R11

00b2    B10: #	out( B176 B11 ) <- in( B9 )  Freq: 0.749899
00b2    cmpl    RCX, narrowklass: precise klass jdk/incubator/vector/Int256Vector: 0x00007fd354189640:Constant:exact *	# compressed klass ptr
00b8    jne,u   B176  P=0.000001 C=-1.000000

00be    B11: #	out( B175 B12 ) <- in( B10 )  Freq: 0.749898
00be    movq    R13, RAX	# spill
00c1    movl    RAX, [RAX + #12 (8-bit)]	# range
00c4    NullCheck RAX

00c4    B12: #	out( B175 B13 ) <- in( B11 )  Freq: 0.749897
00c4    subl    RAX, R9	# int
00c7    incl    RAX	# int
00c9    testl   RAX, RAX
00cb    jl     B175  P=0.000001 C=-1.000000

00d1    B13: #	out( B175 B14 ) <- in( B12 )  Freq: 0.749897
00d1    testl   RDX, RDX
00d3    jl     B175  P=0.000001 C=-1.000000

00d9    B14: #	out( B15 ) <- in( B13 )  Freq: 0.749896
00d9    # castII of RAX
00d9    # castII of R8
00d9    movl    RCX, RDX	# spill
00db    # castII of RCX
00db    xorl    R11, R11	# int
        nop 	# 2 bytes pad for loops and calls

00e0    B15: #	out( B155 B16 ) <- in( B14 B18 ) Loop( B15-B18 inner ) Freq: 2.9984
00e0    cmpl    R11, R8	# unsigned
00e3    jnb,u   B155  P=0.000001 C=-1.000000

00e9    B16: #	out( B156 B17 ) <- in( B15 )  Freq: 2.9984
00e9    # castII of R11
00e9    load_vector XMM0,[R14 + #16 + R11 << #2]
00f0    cmpl    R11, RAX	# unsigned
00f3    jnb,u   B156  P=0.000001 C=-1.000000

00f9    B17: #	out( B157 B18 ) <- in( B16 )  Freq: 2.9984
00f9    vpaddd  XMM0,XMM0,[R13 + #16 + R11 << #2]	! add packedI
0100    cmpl    R11, RCX	# unsigned
0103    jnb,u   B157  P=0.000001 C=-1.000000

0109    B18: #	out( B15 B19 ) <- in( B17 )  Freq: 2.99839
0109    movq    RBP, [rsp + #56]	# spill
010e    store_vector [RBP + #16 + R11 << #2],XMM0
	
0115    # TLS is in R15
0115    movq    RBP, [R15 + #304 (32-bit)]	# ptr
011c    addl    R11, R9	# int
011f    testl   rax, [RBP]	# Safepoint: poll for GC        # App::micro_vector_masked @ bci:76 (line 43) L[0]=rsp + #24 L[1]=rsp + #56 L[2]=R14 L[3]=R13 L[4]=R11 L[5]=_ L[6]=_ L[7]=_
        # OopMap {r10=Oop r13=Oop r14=Oop [24]=Oop [56]=Oop off=287/0x11f}
0122    cmpl    R11, RDI
0125    jl,s   B15  P=0.749904 C=5844.000000

0127    B19: #	out( B179 B20 ) <- in( B18 B6 )  Freq: 0.999982
0127    movl    RCX, RBX	# spill
0129    andl    RCX, RSI	# int
012b    movl    R8, #1	# long (unsigned 32-bit)
0131    salq    R8, RCX
0134    decq    R8	# long
0137    cmpl    R9, #64
        nop 	# 5 bytes pad for loops and calls
0140    jge     B179  P=0.000000 C=1431.000000

0146    B20: #	out( B180 B21 ) <- in( B19 )  Freq: 0.999982
0146    movl    RCX, #64	# int
014b    subl    RCX, R9	# int
014e    salq    R8, RCX
0151    sarq    R8, RCX
0154    movq    RSI, R8	# spill
0157    sarq    RSI, #1
        nop 	# 6 bytes pad for loops and calls
0160    cmpq    R8, RSI
0163    je     B180  P=0.000000 C=1431.000000

0169    B21: #	out( B158 B22 ) <- in( B20 )  Freq: 0.999981
0169    cmpl    R9, #1048576	# unsigned
0170    jnbe,u   B158  P=0.000001 C=-1.000000

0176    B22: #	out( B23 ) <- in( B21 )  Freq: 0.99998
0176    movslq  RCX, R9	# i2l

0179    B23: #	out( B149 B24 ) <- in( B22 B158 )  Freq: 0.999981
        nop 	# 7 bytes pad for loops and calls
0180    cmpl    R9, #1048576	# unsigned
0187    jnbe,u   B149  P=0.000001 C=-1.000000

018d    B24: #	out( B149 B25 ) <- in( B23 )  Freq: 0.99998
018d    # TLS is in R15
018d    movq    RBP, [R15 + #328 (32-bit)]	# ptr
0194    addq    RCX, #23	# long
0198    movq    RDI, RCX	# spill
019b    andq    RDI, #-8	# long
019f    movq    RAX, RBP	# spill
01a2    addq    RAX, RDI	# ptr
01a5    # TLS is in R15
01a5    cmpq    RAX, [R15 + #344 (32-bit)]	# raw ptr
01ac    jnb,u   B149  P=0.000100 C=-1.000000

01b2    B25: #	out( B26 ) <- in( B24 )  Freq: 0.99988
01b2    # TLS is in R15
01b2    movq    [R15 + #328 (32-bit)], RAX	# ptr
01b9    PREFETCHW [RAX + #192 (32-bit)]	# Prefetch allocation into level 1 cache and mark modified
01c0    movq    [RBP], #1	# long
01c8    PREFETCHW [RAX + #256 (32-bit)]	# Prefetch allocation into level 1 cache and mark modified
01cf    movl    [RBP + #8 (8-bit)], narrowklass: precise klass [Z: 0x00007fd3e445a840:Constant:exact *	# compressed klass ptr
01d6    movl    [RBP + #12 (8-bit)], R9	# int
01da    PREFETCHW [RAX + #320 (32-bit)]	# Prefetch allocation into level 1 cache and mark modified
01e1    movq    RDI, RBP	# spill
01e4    addq    RDI, #16	# ptr
01e8    PREFETCHW [RAX + #384 (32-bit)]	# Prefetch allocation into level 1 cache and mark modified
01ef    shrq    RCX, #3
01f3    addq    RCX, #-2	# long
01f7    xorq    rax, rax	# ClearArray:
	cmp     InitArrayShortSize,rcx
	jg      LARGE
	dec     rcx
	js      DONE	# Zero length
	mov     rax,(rdi,rcx,8)	# LOOP
	dec     rcx
	jge     LOOP
	jmp     DONE
	# LARGE:
	shlq    rcx,3	# Convert doublewords to bytes
	rep     stosb	# Store rax to *rdi++ while rcx--
	# DONE

0217    B26: #	out( B95 B27 ) <- in( B150 B25 )  Freq: 0.999981
0217    
0217    MEMBAR-storestore (empty encoding)
0217    movq    RCX, RBP	# spill
021a    # checkcastPP of RCX
021a    movl    RDI, R9	# spill
021d    # castII of RDI
        nop 	# 3 bytes pad for loops and calls
0220    testl   RDI, RDI
0222    jle     B95  P=0.111154 C=12883.000000

0228    B27: #	out( B166 B28 ) <- in( B26 )  Freq: 0.888829
0228    testl   RDI, RDI
022a    je     B166  P=0.000001 C=-1.000000

0230    B28: #	out( B165 B29 ) <- in( B27 )  Freq: 0.888828
0230    movl    [rsp + #32], RDI	# spill
0234    decl    RDI	# int
0236    cmpl    RDI, [RSP + #32 (32-bit)]	# unsigned
        nop 	# 6 bytes pad for loops and calls
0240    jnb,u   B165  P=0.000001 C=-1.000000

0246    B29: #	out( B96 B30 ) <- in( B28 )  Freq: 0.888827
0246    testq   R8, #1	# long
024d    je     B96  P=0.125055 C=11451.000000

0253    B30: #	out( B31 ) <- in( B29 )  Freq: 0.777675
0253    movl    R8, #1	# int

0259    B31: #	out( B167 B32 ) <- in( B96 B30 )  Freq: 0.888827
0259    movb    [RCX + #16 (8-bit)], R8	# byte
025d    movl    R8, [rsp + #32]	# spill
0262    addl    R8, #-3	# int
0266    movl    RAX, R8	# spill
0269    cmpl    RDI, R8
026c    movl    R8, #-2147483648	# int
0272    movl    RDI, R8	# spill
0275    movl    R8, RAX	# spill
0278    cmovll R8, RDI	# signed, int
027c    movl    [rsp + #36], R8	# spill
0281    cmpl    R8, #1
0285    jle     B167  P=0.000001 C=-1.000000

028b    B32: #	out( B170 B33 ) <- in( B31 )  Freq: 0.888826
028b    movl    R8, [rsp + #32]	# spill
0290    cmpl    R8, #1	# unsigned
0294    jbe,u   B170  P=0.000001 C=-1.000000

029a    B33: #	out( B171 B34 ) <- in( B32 )  Freq: 0.888825
        nop 	# 6 bytes pad for loops and calls
02a0    cmpl    R8, #4	# unsigned
02a4    jbe,u   B171  P=0.000001 C=-1.000000

02aa    B34: #	out( B51 ) <- in( B33 )  Freq: 0.888824
02aa    movl    RAX, #1	# int
02af    jmp     B51

02b4    B35: #	out( B36 ) <- in( B44 ) top-of-loop Freq: 62.9426
02b4    movl    R11, #1	# int

02ba    B36: #	out( B49 B37 ) <- in( B45 B35 ) top-of-loop Freq: 71.9389
02ba    sarq    RSI, #1
02bd    movq    RDX, RSI	# spill
02c0    movslq  RCX, RAX	# i2l
02c3    movdq   RSI, XMM2	# spill
02c8    movb    [RSI + #16 + RCX], R8	# byte
02cd    movb    [RSI + #17 + RCX], RDI	# byte
02d2    movb    [RSI + #18 + RCX], R9	# byte
02d7    movb    [RSI + #19 + RCX], R11	# byte
02dc    sarq    RDX, #1
02df    movq    R8, RDX	# spill
02e2    addl    RAX, #4	# int
02e5    cmpl    RAX, RBP
02e7    jge     B49	# loop end  P=0.111154 C=11451.000000

02ed    B37: #	out( B38 ) <- in( B36 )  Freq: 63.9426
02ed    movdl   R9, XMM1	# spill
02f2    movdl   RDX, XMM0	# spill
02f6    movdl   R11, XMM3	# spill
02fb    movq    RSI, R8	# spill
02fe    movdq   RCX, XMM2	# spill

0303    B38: #	out( B46 B39 ) <- in( B51 B37 ) Loop( B38-B37 inner main of N526 strip mined) Freq: 71.9389
0303    testq   RSI, #1	# long
030a    je     B46  P=0.125055 C=11451.000000

0310    B39: #	out( B40 ) <- in( B38 )  Freq: 62.9426
0310    movl    R8, #1	# int

0316    B40: #	out( B47 B41 ) <- in( B46 B39 )  Freq: 71.9389
0316    movq    RDI, RSI	# spill
0319    shrq    RDI, #1
        nop 	# 4 bytes pad for loops and calls
0320    testq   RDI, #1	# long
0327    je     B47  P=0.125055 C=11451.000000

032d    B41: #	out( B42 ) <- in( B40 )  Freq: 62.9426
032d    movl    RDI, #1	# int

0332    B42: #	out( B48 B43 ) <- in( B47 B41 )  Freq: 71.9389
0332    movdq   XMM2, RCX	# spill
0337    movdl   XMM3, R11	# spill
033c    movdl   XMM0, RDX	# spill
0340    movdl   XMM1, R9	# spill
0345    sarq    RSI, #1
0348    movq    R11, RSI	# spill
034b    shrq    R11, #1
034e    testq   R11, #1	# long
0355    je     B48  P=0.125055 C=11451.000000

035b    B43: #	out( B44 ) <- in( B42 )  Freq: 62.9426
035b    movl    R9, #1	# int

0361    B44: #	out( B35 B45 ) <- in( B48 B43 )  Freq: 71.9389
0361    sarq    RSI, #1
0364    movq    R11, RSI	# spill
0367    shrq    R11, #1
036a    testq   R11, #1	# long
0371    jne     B35  P=0.874945 C=11451.000000

0377    B45: #	out( B36 ) <- in( B44 )  Freq: 8.99629
0377    xorl    R11, R11	# int
037a    jmp     B36

037f    B46: #	out( B40 ) <- in( B38 )  Freq: 8.99629
037f    xorl    R8, R8	# int
0382    jmp,s   B40

0384    B47: #	out( B42 ) <- in( B40 )  Freq: 8.99629
0384    xorl    RDI, RDI	# int
0386    jmp,s   B42

0388    B48: #	out( B44 ) <- in( B42 )  Freq: 8.99629
0388    xorl    R9, R9	# int
038b    jmp,s   B44

038d    B49: #	out( B52 B50 ) <- in( B36 )  Freq: 7.99631
038d    # TLS is in R15
038d    movq    R11, [R15 + #304 (32-bit)]	# ptr
0394    testl   rax, [R11]	# Safepoint: poll for GC        # jdk.incubator.vector.VectorMask::fromLong @ bci:135 (line 255) L[0]=_ L[1]=_ L[2]=_ L[3]=R10 L[4]=_ L[5]=RDX L[6]=_ L[7]=RSI L[8]=RAX
        # App::micro_vector_masked @ bci:101 (line 51) L[0]=rsp + #24 L[1]=rsp + #56 L[2]=R14 L[3]=R13 L[4]=XMM3 L[5]=_ L[6]=_ L[7]=_
        # OopMap {r10=Oop rsi=Oop r13=Oop r14=Oop xmm2=Oop [24]=Oop [56]=Oop off=916/0x394}
0397    cmpl    RAX, [RSP + #36 (32-bit)]
039b    jge,s   B52  P=0.111154 C=11451.000000

039d    B50: #	out( B51 ) <- in( B49 )  Freq: 7.10749
039d    movdl   R9, XMM1	# spill
03a2    movdl   RDX, XMM0	# spill
03a6    movdl   R11, XMM3	# spill
03ab    movq    RSI, R8	# spill
03ae    movdq   RCX, XMM2	# spill

03b3    B51: #	out( B38 ) <- in( B34 B50 ) Loop( B51-B50 ) Freq: 7.99631
03b3    movl    RBP, [rsp + #36]	# spill
03b7    subl    RBP, RAX	# int
03b9    movl    RDI, [rsp + #36]	# spill
03bd    xorl    R8, R8	# int
03c0    cmpl    RDI, RAX
03c2    cmovll RBP, R8	# signed, int
03c6    cmpl    RBP, #4000	# unsigned
03cc    movl    R8, #4000	# int
03d2    cmovlnbe RBP, R8	# unsigned, int
03d6    addl    RBP, RAX	# int
03d8    jmp     B38

03dd    B52: #	out( B53 ) <- in( B49 )  Freq: 0.888824
03dd    movdl   R9, XMM1	# spill
03e2    movdl   RDX, XMM0	# spill
03e6    movdl   R11, XMM3	# spill
03eb    movq    RSI, R8	# spill
03ee    movdq   RCX, XMM2	# spill

03f3    B53: #	out( B59 B54 ) <- in( B167 B52 )  Freq: 0.888825
03f3    cmpl    RAX, [RSP + #32 (32-bit)]
03f7    jge,s   B59  P=0.500000 C=-1.000000

03f9    B54: #	out( B55 ) <- in( B53 )  Freq: 0.444413
03f9    # castII of RAX
        nop 	# 3 bytes pad for loops and calls

03fc    B55: #	out( B97 B56 ) <- in( B54 B58 ) Loop( B55-B58 inner post of N1170) Freq: 0.888825
        nop 	# 4 bytes pad for loops and calls
0400    testq   RSI, #1	# long
0407    je     B97  P=0.125055 C=11451.000000

040d    B56: #	out( B57 ) <- in( B55 )  Freq: 0.777674
040d    movl    R8, #1	# int

0413    B57: #	out( B59 B58 ) <- in( B97 B56 )  Freq: 0.888825
0413    movb    [RCX + #16 + RAX], R8	# byte
0418    incl    RAX	# int
        nop 	# 6 bytes pad for loops and calls
0420    cmpl    RAX, [RSP + #32 (32-bit)]
0424    jge,s   B59	# loop end  P=0.500000 C=11451.000000

0426    B58: #	out( B55 ) <- in( B57 )  Freq: 0.444413
0426    sarq    RSI, #1
0429    jmp,s   B55

042b    B59: #	out( B60 ) <- in( B57 B53 )  Freq: 0.888825
042b    movq    [rsp + #64], R14	# spill
0430    movq    [rsp + #40], R13	# spill
0435    movl    [rsp + #80], RBX	# spill
0439    movl    R8, R9	# spill
043c    movl    [rsp + #84], RDX	# spill
0440    movl    [rsp + #72], R11	# spill
0445    movq    RBX, RCX	# spill

0448    B60: #	out( B225 B61 ) <- in( B59 B95 )  Freq: 0.999977
0448    movl    R11, [R10 + #48 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.maskType (constant)
044c    decode_heap_oop RSI,R11
0478    movl    R9, #16	# long (unsigned 32-bit)
047e    movq    RDX, java/lang/Class:exact *	# ptr
0488    movl    RCX, R8	# spill
048b    movq    R8, RBX	# spill
048e    movq    RDI, RBX	# spill
0491    xorl    R11, R11	# int
0494    movl    [rsp + #0], R11	# spill
0498    movq    [rsp + #8], R10	# spill
049d    movq    R10, jdk/incubator/vector/VectorMask$$Lambda$53+0x00000008000aa6e0:exact *	# ptr
04a7    movq    [rsp + #16], R10	# spill
04ac    call,static  jdk.internal.vm.vector.VectorSupport::load
        # jdk.incubator.vector.VectorMask::fromArray @ bci:46 (line 208) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # jdk.incubator.vector.VectorMask::fromValues @ bci:17 (line 183) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.VectorMask::fromLong @ bci:141 (line 259) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_ L[8]=_
        # App::micro_vector_masked @ bci:101 (line 51) L[0]=rsp + #24 L[1]=rsp + #56 L[2]=rsp + #64 L[3]=rsp + #40 L[4]=rsp + #72 L[5]=_ L[6]=_ L[7]=_
        # OopMap {[24]=Oop [40]=Oop [56]=Oop [64]=Oop off=1204/0x4b4}

04b4    B61: #	out( B210 B62 ) <- in( B60 )  Freq: 0.999957
        # Block is sole successor of call
04b4    movl    R10, [RAX + #8 (8-bit)]	# compressed klass ptr
04b8    NullCheck RAX

04b8    B62: #	out( B161 B63 ) <- in( B61 )  Freq: 0.999956
04b8    movq    R11, precise klass jdk/incubator/vector/VectorMask: 0x00007fd368216960:Constant:exact *	# ptr
04c2    decode_and_move_klass_not_null R8,R10
04cf    movq    R10, [R8 + #80 (8-bit)]	# class
04d3    cmpq    R10, R11	# ptr
04d6    jne,u   B161  P=0.000001 C=-1.000000

04dc    B63: #	out( B211 B64 ) <- in( B62 )  Freq: 0.999955
04dc    movq    R8, RAX	# spill
04df    # checkcastPP of R8
04df    movq    RAX, [rsp + #24]	# spill
04e4    movl    RBP, [RAX + #12 (8-bit)]	# compressed ptr ! Field: App.SPECIES
04e7    movl    R11, [R12 + RBP << 3 + #8] (compressed oop addressing)	# compressed klass ptr
04ec    NullCheck RBP

04ec    B64: #	out( B203 B65 ) <- in( B63 )  Freq: 0.999954
04ec    cmpl    R11, narrowklass: precise klass jdk/incubator/vector/IntVector$IntSpecies: 0x00007fd368213b90:Constant:exact *	# compressed klass ptr
04f3    jne,u   B203  P=0.000000 C=-1.000000

04f9    B65: #	out( B178 B66 ) <- in( B64 )  Freq: 0.999954
04f9    decode_heap_oop_not_null RBX,RBP
04fd    # checkcastPP of RBX
04fd    movl    R9, [rsp + #72]	# spill
0502    testl   R9, R9
0505    jl     B178  P=0.000000 C=5564.000000

050b    B66: #	out( B212 B67 ) <- in( B65 )  Freq: 0.999954
050b    movq    RDI, [rsp + #64]	# spill
0510    movl    R11, [RDI + #12 (8-bit)]	# range
0514    NullCheck RDI

0514    B67: #	out( B181 B68 ) <- in( B66 )  Freq: 0.999953
0514    movl    RCX, [RBX + #12 (8-bit)]	# int ! Field: jdk/incubator/vector/AbstractSpecies.laneCount (constant)
0517    movl    RBP, R11	# spill
051a    subl    RBP, RCX	# int
        nop 	# 4 bytes pad for loops and calls
0520    cmpl    R9, RBP
0523    jle     B181  P=0.000000 C=5564.000000

0529    B68: #	out( B204 B69 ) <- in( B67 )  Freq: 0.999952
0529    movl    R10, [R8 + #8 (8-bit)]	# compressed klass ptr
052d    cmpl    R10, narrowklass: precise klass jdk/incubator/vector/Int256Vector$Int256Mask: 0x00007fd35410d0d0:Constant:exact *	# compressed klass ptr
0534    jne,u   B204  P=0.000000 C=-1.000000

053a    B69: #	out( B182 B70 ) <- in( B68 )  Freq: 0.999952
053a    movq    RDX, R8	# spill
053d    # checkcastPP of RDX
053d    movl    RBP, [RBX + #44 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.vectorType (constant)
0540    cmpl    RBP, narrowoop: java/lang/Class:exact *	# compressed ptr
0546    je,u   B182  P=0.000000 C=6813.000000

054c    B70: #	out( B162 B71 ) <- in( B69 )  Freq: 0.999952
054c    movl    RBP, [RBX + #28 (8-bit)]	# int ! Field: jdk/incubator/vector/AbstractSpecies.vectorBitSize (constant)
054f    cmpl    RBP, #256
0555    jne     B162  P=0.000001 C=6813.000000

055b    B71: #	out( B183 B72 ) <- in( B70 )  Freq: 0.999951
055b    movl    R10, [RDX + #12 (8-bit)]	# compressed ptr ! Field: jdk/internal/vm/vector/VectorSupport$VectorPayload.payload (constant)
055f    movl    RSI, R11	# spill
0562    subl    RSI, [RSP + #72 (32-bit)]	# int
0566    load_vector XMM0,[R12 + R10 << 3 + #16] (compressed oop addressing)
056d    movq    R10, int[int:8]<ciTypeArray length=8 type=<ciTypeArrayKlass name=[I ident=1229 address=0x00007fd3e445aa50> ident=1584 address=0x00007fd3682df790> *	# ptr
0577    load_vector XMM1,[R10 + #16 (8-bit)]
057d    cmpl    RSI, #8
0580    movl    R10, #8	# int
0586    cmovlge RSI, R10	# signed, int
058a    xorl    RCX, RCX	# int
058c    testl   RSI, RSI
058e    cmovlle RSI, RCX	# signed, int
0591    replicateI XMM2,RSI
059a    vallones XMM4
059e    vector_loadmask_byte XMM3,XMM0
	
05ab    vector_compare XMM0,XMM1,XMM2,#7	! using R10 as TEMP
05b7    vpand   XMM0,XMM0,XMM3	! and vectors
05bb    vector_test_any_true RBP,XMM0,XMM4	! using RFLAGS as TEMP
05c8    testl   RBP, RBP
05ca    jne     B183  P=0.000000 C=6886.000000

05d0    B72: #	out( B151 B73 ) <- in( B71 )  Freq: 0.99995
05d0    # TLS is in R15
05d0    movq    RCX, [R15 + #328 (32-bit)]	# ptr
05d7    movq    R10, RCX	# spill
05da    addq    R10, #24	# ptr
05de    # TLS is in R15
        nop 	# 2 bytes pad for loops and calls
05e0    cmpq    R10, [R15 + #344 (32-bit)]	# raw ptr
05e7    jnb,u   B151  P=0.000100 C=-1.000000

05ed    B73: #	out( B74 ) <- in( B72 )  Freq: 0.99985
05ed    # TLS is in R15
05ed    movq    [R15 + #328 (32-bit)], R10	# ptr
05f4    PREFETCHW [R10 + #192 (32-bit)]	# Prefetch allocation into level 1 cache and mark modified
05fc    movq    [RCX], #1	# long
0603    movl    [RCX + #8 (8-bit)], narrowklass: precise klass jdk/incubator/vector/IntVector$$Lambda$63+0x00000008000acb58: 0x00007fd35410b130:Constant:exact *	# compressed klass ptr
060a    movl    [RCX + #20 (8-bit)], R12	# int (R12_heapbase==0)
060e    movq    RBP, [rsp + #24]	# spill
0613    movq    [rsp + #48], R8	# spill
0618    movq    [rsp + #64], RBX	# spill
061d    movq    [rsp + #72], RDX	# spill
0622    vmovdqu [rsp + 96],XMM4	# spill

0628    B74: #	out( B228 B75 ) <- in( B152 B73 )  Freq: 0.99995
0628    movl    [RCX + #12 (8-bit)], R9	# int
062c    movl    [rsp + #24], R9	# spill
0631    encode_heap_oop_not_null R10,RDI
067a    movl    [RCX + #16 (8-bit)], R10	# compressed ptr
067e    
067e    # checkcastPP of RCX
067e    MEMBAR-release ! (empty encoding)
067e    # checkcastPP of RCX
067e    movq    RSI, [rsp + #64]	# spill
0683    movq    RDX, [rsp + #72]	# spill
0688    call,static  jdk.incubator.vector.IntVector$IntSpecies::vOp
        # jdk.incubator.vector.IntVector::fromArray @ bci:64 (line 2728) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_
        # App::micro_vector_masked @ bci:115 (line 52) L[0]=RBP L[1]=rsp + #56 L[2]=_ L[3]=rsp + #40 L[4]=rsp + #24 L[5]=_ L[6]=_ L[7]=rsp + #48
        # OopMap {rbp=Oop [40]=Oop [48]=Oop [56]=Oop [72]=Oop off=1680/0x690}

0690    B75: #	out( B213 B76 ) <- in( B74 )  Freq: 0.99993
        # Block is sole successor of call
0690    movq    [rsp + #64], RAX	# spill
0695    movl    R10, [RBP + #12 (8-bit)]	# compressed ptr ! Field: App.SPECIES
        nop 	# 7 bytes pad for loops and calls
06a0    movl    R11, [R12 + R10 << 3 + #8] (compressed oop addressing)	# compressed klass ptr
06a5    NullCheck R10

06a5    B76: #	out( B205 B77 ) <- in( B75 )  Freq: 0.999929
06a5    cmpl    R11, narrowklass: precise klass jdk/incubator/vector/IntVector$IntSpecies: 0x00007fd368213b90:Constant:exact *	# compressed klass ptr
06ac    jne,u   B205  P=0.000000 C=-1.000000

06b2    B77: #	out( B214 B78 ) <- in( B76 )  Freq: 0.999929
06b2    movq    R8, [rsp + #40]	# spill
06b7    movl    R11, [R8 + #12 (8-bit)]	# range
06bb    NullCheck R8

06bb    B78: #	out( B184 B79 ) <- in( B77 )  Freq: 0.999928
06bb    decode_heap_oop_not_null RBX,R10
06bf    # checkcastPP of RBX
06bf    movl    R9, [RBX + #12 (8-bit)]	# int ! Field: jdk/incubator/vector/AbstractSpecies.laneCount (constant)
06c3    movl    RBP, R11	# spill
06c6    subl    RBP, R9	# int
06c9    movl    R10, [rsp + #24]	# spill
06ce    cmpl    R10, RBP
06d1    jle     B184  P=0.000000 C=5564.000000

06d7    B79: #	out( B185 B80 ) <- in( B78 )  Freq: 0.999928
06d7    movl    RBP, [RBX + #44 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.vectorType (constant)
        nop 	# 6 bytes pad for loops and calls
06e0    cmpl    RBP, narrowoop: java/lang/Class:exact *	# compressed ptr
06e6    je,u   B185  P=0.000000 C=6813.000000

06ec    B80: #	out( B163 B81 ) <- in( B79 )  Freq: 0.999927
06ec    movl    RBP, [RBX + #28 (8-bit)]	# int ! Field: jdk/incubator/vector/AbstractSpecies.vectorBitSize (constant)
06ef    cmpl    RBP, #256
06f5    jne     B163  P=0.000001 C=6813.000000

06fb    B81: #	out( B186 B82 ) <- in( B80 )  Freq: 0.999926
06fb    movl    RDI, R11	# spill
06fe    subl    RDI, R10	# int
0701    movq    RDX, [rsp + #72]	# spill
0706    movl    RCX, [RDX + #12 (8-bit)]	# compressed ptr ! Field: jdk/internal/vm/vector/VectorSupport$VectorPayload.payload (constant)
0709    movq    R9, int[int:8]<ciTypeArray length=8 type=<ciTypeArrayKlass name=[I ident=1229 address=0x00007fd3e445aa50> ident=1584 address=0x00007fd3682df790> *	# ptr
0713    load_vector XMM1,[R9 + #16 (8-bit)]
0719    load_vector XMM0,[R12 + RCX << 3 + #16] (compressed oop addressing)
0720    cmpl    RDI, #8
0723    movl    R9, #8	# int
0729    cmovlge RDI, R9	# signed, int
072d    xorl    RCX, RCX	# int
072f    testl   RDI, RDI
0731    cmovlle RDI, RCX	# signed, int
0734    replicateI XMM2,RDI
073d    vector_compare XMM1,XMM1,XMM2,#7	! using R9 as TEMP
0749    vector_loadmask_byte XMM2,XMM0
	
0756    vpand   XMM1,XMM1,XMM2	! and vectors
075a    vmovdqu XMM0,[rsp + 96]	# spill
0760    vector_test_any_true RBP,XMM1,XMM0	! using RFLAGS as TEMP
076d    testl   RBP, RBP
076f    jne     B186  P=0.000000 C=6886.000000

0775    B82: #	out( B153 B83 ) <- in( B81 )  Freq: 0.999926
0775    # TLS is in R15
0775    movq    RCX, [R15 + #328 (32-bit)]	# ptr
077c    movq    R11, RCX	# spill
077f    addq    R11, #24	# ptr
0783    # TLS is in R15
0783    cmpq    R11, [R15 + #344 (32-bit)]	# raw ptr
078a    jnb,u   B153  P=0.000100 C=-1.000000

0790    B83: #	out( B84 ) <- in( B82 )  Freq: 0.999826
0790    # TLS is in R15
0790    movq    [R15 + #328 (32-bit)], R11	# ptr
0797    PREFETCHW [R11 + #192 (32-bit)]	# Prefetch allocation into level 1 cache and mark modified
079f    movq    [RCX], #1	# long
07a6    movl    [RCX + #8 (8-bit)], narrowklass: precise klass jdk/incubator/vector/IntVector$$Lambda$63+0x00000008000acb58: 0x00007fd35410b130:Constant:exact *	# compressed klass ptr
07ad    movl    [RCX + #20 (8-bit)], R12	# int (R12_heapbase==0)
07b1    pushq   [rsp + #72]	# 64-bit mem-mem spill
	popq    [rsp + #32]
07bb    movq    [rsp + #40], RBX	# spill

07c0    B84: #	out( B226 B85 ) <- in( B154 B83 )  Freq: 0.999926
07c0    movl    [RCX + #12 (8-bit)], R10	# int
07c4    movl    [rsp + #72], R10	# spill
07c9    encode_heap_oop_not_null R11,R8
0812    movl    [RCX + #16 (8-bit)], R11	# compressed ptr
0816    
0816    # checkcastPP of RCX
0816    MEMBAR-release ! (empty encoding)
0816    # checkcastPP of RCX
0816    movq    RSI, [rsp + #40]	# spill
081b    movq    RDX, [rsp + #32]	# spill
0820    call,static  jdk.incubator.vector.IntVector$IntSpecies::vOp
        # jdk.incubator.vector.IntVector::fromArray @ bci:64 (line 2728) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_
        # App::micro_vector_masked @ bci:129 (line 53) L[0]=_ L[1]=rsp + #56 L[2]=_ L[3]=_ L[4]=rsp + #72 L[5]=rsp + #64 L[6]=_ L[7]=rsp + #32
        # OopMap {[32]=Oop [56]=Oop [64]=Oop off=2088/0x828}

0828    B85: #	out( B159 B86 ) <- in( B84 )  Freq: 0.999906
        # Block is sole successor of call
0828    movq    RCX, RAX	# spill
082b    movq    RBP, [rsp + #64]	# spill
0830    testq   RBP, RBP	# ptr
0833    je     B159  P=0.000001 C=-1.000000

0839    B86: #	out( B224 B87 ) <- in( B85 )  Freq: 0.999905
0839    movq    RDX, jdk/incubator/vector/VectorOperators$AssociativeImpl:exact *	# ptr
0843    movq    RSI, RBP	# spill
0846    movq    rax, #Universe::non_oop_word()
	call,dynamic  jdk.incubator.vector.IntVector::lanewise
        # jdk.incubator.vector.IntVector::lanewise @ bci:70 (line 688) L[0]=_ L[1]=_ L[2]=_ L[3]=rsp + #32 L[4]=_ L[5]=_ STK[0]=RBP
        # jdk.incubator.vector.IntVector::add @ bci:6 (line 1133) L[0]=_ L[1]=_ L[2]=_
        # App::micro_vector_masked @ bci:140 (line 54) L[0]=_ L[1]=rsp + #56 L[2]=_ L[3]=_ L[4]=rsp + #72 L[5]=_ L[6]=_ L[7]=rsp + #32
        # OopMap {rbp=Oop [32]=Oop [56]=Oop off=2136/0x858}

0858    B87: #	out( B223 B88 ) <- in( B86 )  Freq: 0.999885
        # Block is sole successor of call
0858    movq    RSI, RBP	# spill
085b    movq    RDX, RAX	# spill
085e    movq    RCX, [rsp + #32]	# spill
        nop 	# 3 bytes pad for loops and calls
0866    movq    rax, #Universe::non_oop_word()
	call,dynamic  jdk.incubator.vector.IntVector::blend
        # jdk.incubator.vector.IntVector::lanewise @ bci:74 (line 688) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_
        # jdk.incubator.vector.IntVector::add @ bci:6 (line 1133) L[0]=_ L[1]=_ L[2]=_
        # App::micro_vector_masked @ bci:140 (line 54) L[0]=_ L[1]=rsp + #56 L[2]=_ L[3]=_ L[4]=rsp + #72 L[5]=_ L[6]=_ L[7]=rsp + #32
        # OopMap {[32]=Oop [56]=Oop off=2168/0x878}

0878    B88: #	out( B215 B89 ) <- in( B87 )  Freq: 0.999865
        # Block is sole successor of call
        nop 	# 8 bytes pad for loops and calls
0880    movl    R11, [RAX + #8 (8-bit)]	# compressed klass ptr
0884    NullCheck RAX

0884    B89: #	out( B98 B90 ) <- in( B88 )  Freq: 0.999864
0884    movl    [rsp + #64], R11	# spill
0889    movq    R8, [rsp + #32]	# spill
088e    movl    R10, [R8 + #12 (8-bit)]	# compressed ptr ! Field: jdk/internal/vm/vector/VectorSupport$VectorPayload.payload (constant)
0892    load_vector XMM0,[R12 + R10 << 3 + #16] (compressed oop addressing)
0899    vector_loadmask_byte XMM1,XMM0
	
08a6    vmovdqu XMM0,[rsp + 96]	# spill
08ac    vector_test R11,XMM1, XMM0	! using RFLAGS as TEMP
08b9    testl   R11, R11
        nop 	# 4 bytes pad for loops and calls
08c0    je     B98  P=0.100000 C=-1.000000

08c6    B90: #	out( B168 B91 ) <- in( B89 )  Freq: 0.899877
08c6    movl    R11, [rsp + #64]	# spill
08cb    cmpl    R11, narrowklass: precise klass jdk/incubator/vector/Int256Vector: 0x00007fd354189640:Constant:exact *	# compressed klass ptr
08d2    jne,u   B168  P=0.000001 C=-1.000000

08d8    B91: #	out( B169 B92 ) <- in( B90 )  Freq: 0.899877
08d8    # checkcastPP of RAX
08d8    movl    R10, [rsp + #84]	# spill
        nop 	# 3 bytes pad for loops and calls
08e0    testl   R10, R10
08e3    jl     B169  P=0.000001 C=-1.000000

08e9    B92: #	out( B164 B93 ) <- in( B91 )  Freq: 0.899876
08e9    # castII of R10
08e9    movl    R9, [rsp + #72]	# spill
08ee    cmpl    R9, R10	# unsigned
08f1    jnb,u   B164  P=0.000001 C=-1.000000

08f7    B93: #	out( B94 ) <- in( B92 )  Freq: 0.899875
08f7    movl    R11, [RAX + #12 (8-bit)]	# compressed ptr ! Field: jdk/internal/vm/vector/VectorSupport$VectorPayload.payload (constant)
08fb    load_vector XMM0,[R12 + R11 << 3 + #16] (compressed oop addressing)
0902    # castII of R9
0902    movq    R10, [rsp + #56]	# spill
0907    store_vector [R10 + #16 + R9 << #2],XMM0
	

090e    B94: #	out( N2743 ) <- in( B147 B140 B108 B93 )  Freq: 0.999857
090e    vzeroupper
	addq    rsp, 144	# Destroy frame
	popq    rbp
	cmpq     rsp, poll_offset[r15_thread] 
	ja       #safepoint_stub	# Safepoint: poll for GC

0926    ret

0927    B95: #	out( B60 ) <- in( B26 )  Freq: 0.111152
0927    movq    [rsp + #64], R14	# spill
092c    movq    [rsp + #40], R13	# spill
0931    movl    [rsp + #80], RBX	# spill
0935    movl    R8, R9	# spill
0938    movl    [rsp + #84], RDX	# spill
093c    movl    [rsp + #72], R11	# spill
0941    movq    RBX, RCX	# spill
0944    jmp     B60

0949    B96: #	out( B31 ) <- in( B29 )  Freq: 0.111152
0949    xorl    R8, R8	# int
094c    jmp     B31

0951    B97: #	out( B57 ) <- in( B55 )  Freq: 0.111152
0951    xorl    R8, R8	# int
0954    jmp     B57

0959    B98: #	out( B222 B99 ) <- in( B89 )  Freq: 0.0999864
0959    movq    [rsp + #48], RAX	# spill
095e    pushq   [rsp + #32]	# 64-bit mem-mem spill
	popq    [rsp + #40]
0968    movq    RSI, RAX	# spill
096b    movl    RBP, [rsp + #72]	# spill
        nop 	# 3 bytes pad for loops and calls
0972    movq    rax, #Universe::non_oop_word()
	call,dynamic  jdk.incubator.vector.IntVector::vspecies
        # jdk.incubator.vector.IntVector::intoArray @ bci:17 (line 3004) L[0]=rsp + #48 L[1]=rsp + #56 L[2]=RBP L[3]=rsp + #32 L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {[32]=Oop [40]=Oop [48]=Oop [56]=Oop off=2436/0x984}

0984    B99: #	out( B216 B100 ) <- in( B98 )  Freq: 0.0999844
        # Block is sole successor of call
0984    movl    RBP, [RAX + #44 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.vectorType (constant)
0987    NullCheck RAX

0987    B100: #	out( B201 B101 ) <- in( B99 )  Freq: 0.0999843
0987    cmpl    RBP, narrowoop: java/lang/Class:exact *	# compressed ptr
098d    je,u   B201  P=0.000000 C=6813.000000

0993    B101: #	out( B191 B102 ) <- in( B100 )  Freq: 0.0999843
0993    movl    RBP, [RAX + #28 (8-bit)]	# int ! Field: jdk/incubator/vector/AbstractSpecies.vectorBitSize (constant)
        nop 	# 10 bytes pad for loops and calls
09a0    cmpl    RBP, #256
09a6    jne     B191  P=0.000001 C=6813.000000

09ac    B102: #	out( B202 B103 ) <- in( B101 )  Freq: 0.0999842
09ac    movq    R9, [rsp + #32]	# spill
09b1    movl    R10, [R9 + #12 (8-bit)]	# compressed ptr ! Field: jdk/internal/vm/vector/VectorSupport$VectorPayload.payload (constant)
09b5    movl    R8, [rsp + #80]	# spill
09ba    subl    R8, [RSP + #72 (32-bit)]	# int
09bf    load_vector XMM0,[R12 + R10 << 3 + #16] (compressed oop addressing)
09c6    movq    R10, int[int:8]<ciTypeArray length=8 type=<ciTypeArrayKlass name=[I ident=1229 address=0x00007fd3e445aa50> ident=1584 address=0x00007fd3682df790> *	# ptr
09d0    load_vector XMM1,[R10 + #16 (8-bit)]
09d6    cmpl    R8, #8
09da    movl    R10, #8	# int
09e0    cmovlge R8, R10	# signed, int
09e4    xorl    R11, R11	# int
09e7    testl   R8, R8
09ea    cmovlle R8, R11	# signed, int
09ee    replicateI XMM2,R8
09f8    vector_compare XMM1,XMM1,XMM2,#7	! using R10 as TEMP
0a04    vector_loadmask_byte XMM2,XMM0
	
0a11    vpand   XMM1,XMM1,XMM2	! and vectors
0a15    vmovdqu XMM0,[rsp + 96]	# spill
0a1b    vector_test_any_true RBP,XMM1,XMM0	! using RFLAGS as TEMP
0a28    testl   RBP, RBP
0a2a    jne     B202  P=0.000000 C=6886.000000

0a30    B103: #	out( B192 B104 ) <- in( B102 )  Freq: 0.0999841
0a30    movl    R10, [rsp + #64]	# spill
        nop 	# 11 bytes pad for loops and calls
0a40    cmpl    R10, narrowklass: precise klass jdk/incubator/vector/Int256Vector: 0x00007fd354189640:Constant:exact *	# compressed klass ptr
0a47    jne,u   B192  P=0.000001 C=-1.000000

0a4d    B104: #	out( B217 B105 ) <- in( B103 )  Freq: 0.099984
0a4d    movq    R10, [rsp + #48]	# spill
0a52    # checkcastPP of R10
0a52    
0a52    MEMBAR-acquire ! (empty encoding)
0a52    # checkcastPP of R10
0a52    movl    RCX, [R10 + #12 (8-bit)]	# compressed ptr ! Field: jdk/internal/vm/vector/VectorSupport$VectorPayload.payload (constant)
        nop 	# 10 bytes pad for loops and calls
0a60    movl    R11, [R12 + RCX << 3 + #8] (compressed oop addressing)	# compressed klass ptr
0a65    NullCheck RCX

0a65    B105: #	out( B206 B106 ) <- in( B104 )  Freq: 0.0999839
0a65    cmpl    R11, narrowklass: precise klass [I: 0x00007fd3e445aa50:Constant:exact *	# compressed klass ptr
0a6c    jne,u   B206  P=0.000000 C=-1.000000

0a72    B106: #	out( B218 B107 ) <- in( B105 )  Freq: 0.0999839
0a72    
0a72    MEMBAR-acquire ! (empty encoding)
0a72    movq    R10, [rsp + #32]	# spill
0a77    # checkcastPP of R10
0a77    movl    R11, [R10 + #12 (8-bit)]	# compressed ptr ! Field: jdk/internal/vm/vector/VectorSupport$VectorPayload.payload (constant)
0a7b    decode_heap_oop_not_null R9,RCX
0a7f    # checkcastPP of R9
        nop 	# 1 bytes pad for loops and calls
0a80    movl    R10, [R12 + R11 << 3 + #8] (compressed oop addressing)	# compressed klass ptr
0a85    NullCheck R11

0a85    B107: #	out( B207 B108 ) <- in( B106 )  Freq: 0.0999838
0a85    cmpl    R10, narrowklass: precise klass [Z: 0x00007fd3e445a840:Constant:exact *	# compressed klass ptr
0a8c    jne,u   B207  P=0.000000 C=-1.000000

0a92    B108: #	out( B94 B109 ) <- in( B107 )  Freq: 0.0999838
0a92    movl    RAX, [R9 + #12 (8-bit)]	# range
0a96    testl   RAX, RAX	# unsigned
0a98    jbe,u   B94  P=0.111145 C=16438.000000

0a9e    B109: #	out( B193 B110 ) <- in( B108 )  Freq: 0.0888711
0a9e    decode_heap_oop_not_null RBX,R11
0aa2    # checkcastPP of RBX
0aa2    movl    RCX, [RBX + #12 (8-bit)]	# range
0aa5    testl   RCX, RCX	# unsigned
0aa7    jbe,u   B193  P=0.000001 C=-1.000000

0aad    B110: #	out( B193 B111 ) <- in( B109 )  Freq: 0.088871
0aad    movl    R11, RAX	# spill
0ab0    decl    R11	# int
0ab3    cmpl    R11, RCX	# unsigned
0ab6    jnb,u   B193  P=0.000001 C=-1.000000

0abc    B111: #	out( B112 ) <- in( B110 )  Freq: 0.0888709
0abc    movslq  RDX, [RSP + #72 (32-bit)]	# int -> long
0ac1    movq    R10, RDX	# spill
0ac4    negq    R10	# long
0ac7    movl    R8, R10	# l2i
0aca    movl    RDI, #2147483647	# int
0acf    cmpq    R10, #2147483647
0ad6    cmovlg R8, RDI	# signed, int
0ada    movl    R11, #1	# int
0ae0    cmpl    R8, R11
0ae3    movl    R10, #1	# int
0ae9    cmovllt R8, R10	# max
0aed    cmpl    R8, RAX
0af0    cmovlgt R8, RAX	# min
0af4    xorl    R10, R10	# int

0af7    B112: #	out( B148 B113 ) <- in( B111 B117 ) Loop( B112-B117 inner pre of N1180) Freq: 0.177742
0af7    movslq  RSI, R10	# i2l
0afa    movzbl  RDI, [RBX + #16 + RSI]	# ubyte
        nop 	# 1 bytes pad for loops and calls
0b00    testl   RDI, RDI
0b02    je     B148  P=0.125043 C=14611.000000

0b08    B113: #	out( B187 B114 ) <- in( B112 )  Freq: 0.155516
0b08    cmpl    R10, RAX	# unsigned
0b0b    jnb,u   B187  P=0.000001 C=-1.000000

0b11    B114: #	out( B189 B115 ) <- in( B113 )  Freq: 0.155516
0b11    movl    RBP, [R9 + #16 + RSI << #2]	# int
0b16    movl    R11, R10	# spill
0b19    addl    R11, [RSP + #72 (32-bit)]	# int
0b1e    movl    R14, R11	# spill
0b21    cmpl    R11, [RSP + #80 (32-bit)]	# unsigned
0b26    jnb,u   B189  P=0.000001 C=-1.000000

0b2c    B115: #	out( B116 ) <- in( B114 )  Freq: 0.155516
0b2c    addq    RSI, RDX	# long
0b2f    movq    RDI, [rsp + #56]	# spill
0b34    movl    [RDI + #16 + RSI << #2], RBP	# int

0b38    B116: #	out( B118 B117 ) <- in( B115 B148 )  Freq: 0.177741
0b38    incl    R10	# int
        nop 	# 5 bytes pad for loops and calls
0b40    cmpl    R10, R8
0b43    jge,s   B118	# loop end  P=0.500000 C=14611.000000

0b45    B117: #	out( B112 ) <- in( B116 )  Freq: 0.0888706
0b45    movq    [rsp + #56], RDI	# spill
0b4a    jmp,s   B112

0b4c    B118: #	out( B140 B119 ) <- in( B116 )  Freq: 0.0888706
0b4c    movslq  RBP, [RSP + #80 (32-bit)]	# int -> long
0b51    movq    R11, RBP	# spill
0b54    subq    R11, RDX	# long
0b57    movl    R8, R11	# l2i
0b5a    cmpl    R8, RAX
0b5d    cmovlgt R8, RAX	# min
0b61    cmpl    R8, RAX
0b64    cmovlgt R8, RAX	# min
0b68    movl    R11, R8	# spill
0b6b    addl    R11, #-3	# int
0b6f    cmpl    R8, R11
0b72    movl    R8, #-2147483648	# int
0b78    cmovll R11, R8	# signed, int
        nop 	# 4 bytes pad for loops and calls
0b80    cmpl    R10, R11
0b83    jge     B140  P=0.000001 C=-1.000000

0b89    B119: #	out( B194 B120 ) <- in( B118 )  Freq: 0.0888705
0b89    # castII of R10
0b89    cmpl    R10, RCX	# unsigned
0b8c    jnb,u   B194  P=0.000001 C=-1.000000

0b92    B120: #	out( B195 B121 ) <- in( B119 )  Freq: 0.0888704
0b92    cmpl    R10, RAX	# unsigned
0b95    jnb,u   B195  P=0.000001 C=-1.000000

0b9b    B121: #	out( B196 B122 ) <- in( B120 )  Freq: 0.0888704
0b9b    movslq  R8, R10	# i2l
0b9e    addq    R8, RDX	# long
0ba1    cmpq    R8, RBP	# unsigned
0ba4    jnb,u   B196  P=0.000001 C=-1.000000

0baa    B122: #	out( B197 B123 ) <- in( B121 )  Freq: 0.0888703
0baa    movl    RSI, R10	# spill
0bad    addl    RSI, #3	# int
0bb0    movslq  R8, RSI	# i2l
0bb3    addq    R8, RDX	# long
0bb6    cmpq    R8, RBP	# unsigned
0bb9    jnb,u   B197  P=0.000001 C=-1.000000

0bbf    B123: #	out( B198 B124 ) <- in( B122 )  Freq: 0.0888702
        nop 	# 1 bytes pad for loops and calls
0bc0    cmpl    RSI, RAX	# unsigned
0bc2    jnb,u   B198  P=0.000001 C=-1.000000

0bc8    B124: #	out( B199 B125 ) <- in( B123 )  Freq: 0.0888701
0bc8    cmpl    R10, RAX	# unsigned
0bcb    jnb,u   B199  P=0.000001 C=-1.000000

0bd1    B125: #	out( B200 B126 ) <- in( B124 )  Freq: 0.08887
0bd1    cmpl    R10, RCX	# unsigned
0bd4    jnb,u   B200  P=0.000001 C=-1.000000

0bda    B126: #	out( B139 B127 ) <- in( B125 )  Freq: 0.0888699
0bda    cmpl    RSI, RCX	# unsigned
        nop 	# 4 bytes pad for loops and calls
0be0    jb,u   B139  P=0.999999 C=-1.000000

0be6    B127: #	out( N2743 ) <- in( B126 )  Freq: 9.005e-08
0be6    stop	# ShouldNotReachHere
        nop 	# 6 bytes pad for loops and calls

0c00    B128: #	out( B129 ) <- in( B136 ) top-of-loop Freq: 6.29451
0c00    movl    RSI, [R9 + #28 + RSI << #2]	# int
0c05    movl    [RDI + #28 + RDX << #2], RSI	# int

0c09    B129: #	out( B138 B130 ) <- in( B128 B137 ) top-of-loop Freq: 7.19408
0c09    addl    R10, #4	# int
0c0d    cmpl    R10, R8
0c10    jge     B138	# loop end  P=0.111145 C=14611.000000

0c16    B130: #	out( B132 B131 ) <- in( B139 B129 ) Loop( B130-B129 inner main of N1161 strip mined) Freq: 7.19408
0c16    movl    RDX, R10	# spill
0c19    addl    RDX, [RSP + #72 (32-bit)]	# int
0c1d    movslq  RSI, R10	# i2l
0c20    movzbl  RCX, [RBX + #16 + RSI]	# ubyte
0c25    testl   RCX, RCX
0c27    je,s   B132  P=0.125043 C=14611.000000

0c29    B131: #	out( B132 ) <- in( B130 )  Freq: 6.29451
0c29    movl    RSI, [R9 + #16 + RSI << #2]	# int
0c2e    movl    [RDI + #16 + RDX << #2], RSI	# int

0c32    B132: #	out( B134 B133 ) <- in( B131 B130 )  Freq: 7.19408
0c32    movslq  RDX, RDX	# i2l
0c35    movslq  RSI, R10	# i2l
0c38    movzbl  RCX, [RBX + #17 + RSI]	# ubyte
        nop 	# 3 bytes pad for loops and calls
0c40    testl   RCX, RCX
0c42    je,s   B134  P=0.125043 C=14611.000000

0c44    B133: #	out( B134 ) <- in( B132 )  Freq: 6.29451
0c44    movl    RCX, [R9 + #20 + RSI << #2]	# int
0c49    movl    [RDI + #20 + RDX << #2], RCX	# int

0c4d    B134: #	out( B136 B135 ) <- in( B133 B132 )  Freq: 7.19408
0c4d    movzbl  RCX, [RBX + #18 + RSI]	# ubyte
0c52    testl   RCX, RCX
0c54    je,s   B136  P=0.125043 C=14611.000000

0c56    B135: #	out( B136 ) <- in( B134 )  Freq: 6.29451
0c56    movl    RCX, [R9 + #24 + RSI << #2]	# int
0c5b    movl    [RDI + #24 + RDX << #2], RCX	# int

0c5f    B136: #	out( B128 B137 ) <- in( B135 B134 )  Freq: 7.19408
0c5f    movzbl  RCX, [RBX + #19 + RSI]	# ubyte
0c64    testl   RCX, RCX
0c66    jne,s   B128  P=0.874957 C=14611.000000

0c68    B137: #	out( B129 ) <- in( B136 )  Freq: 0.899568
0c68    jmp,s   B129

0c6a    B138: #	out( B140 B139 ) <- in( B129 )  Freq: 0.799585
0c6a    # TLS is in R15
0c6a    movq    R8, [R15 + #304 (32-bit)]	# ptr
0c71    testl   rax, [R8]	# Safepoint: poll for GC        # jdk.incubator.vector.IntVector::stOp @ bci:53 (line 353) L[0]=_ L[1]=RDI L[2]=rsp + #72 L[3]=_ L[4]=#Ptr0x00007fd36829e060 L[5]=R9 L[6]=RBX L[7]=R10
        # jdk.incubator.vector.IntVector::intoArray @ bci:41 (line 3006) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {r9=Oop rbx=Oop rdi=Oop off=3185/0xc71}
0c74    cmpl    R10, R11
0c77    jge,s   B140  P=0.111145 C=14611.000000

0c79    B139: #	out( B130 ) <- in( B126 B138 ) Loop( B139-B138 ) Freq: 0.799585
0c79    movl    R8, R11	# spill
0c7c    subl    R8, R10	# int
0c7f    xorl    RDX, RDX	# int
0c81    cmpl    R11, R10
0c84    cmovll R8, RDX	# signed, int
0c88    cmpl    R8, #4000	# unsigned
0c8f    movl    RDX, #4000	# int
0c94    cmovlnbe R8, RDX	# unsigned, int
0c98    addl    R8, R10	# int
        nop 	# 5 bytes pad for loops and calls
0ca0    jmp     B130

0ca5    B140: #	out( B94 B141 ) <- in( B118 B138 )  Freq: 0.0888699
0ca5    cmpl    R10, RAX
0ca8    jge     B94  P=0.500000 C=-1.000000

0cae    B141: #	out( B142 ) <- in( B140 )  Freq: 0.044435
0cae    # castII of R10
        nop 	# 2 bytes pad for loops and calls

0cb0    B142: #	out( B146 B143 ) <- in( B141 B146 ) Loop( B142-B146 inner post of N1180) Freq: 0.0888697
0cb0    movslq  R8, R10	# i2l
0cb3    movzbl  RCX, [RBX + #16 + R8]	# ubyte
0cb9    testl   RCX, RCX
0cbb    je,s   B146  P=0.125043 C=14611.000000

0cbd    B143: #	out( B188 B144 ) <- in( B142 )  Freq: 0.0777572
        nop 	# 3 bytes pad for loops and calls
0cc0    cmpl    R10, RAX	# unsigned
0cc3    jnb,u   B188  P=0.000001 C=-1.000000

0cc9    B144: #	out( B190 B145 ) <- in( B143 )  Freq: 0.0777571
0cc9    movl    R11, [R9 + #16 + R8 << #2]	# int
0cce    movl    R8, R10	# spill
0cd1    addl    R8, [RSP + #72 (32-bit)]	# int
        nop 	# 10 bytes pad for loops and calls
0ce0    cmpl    R8, [RSP + #80 (32-bit)]	# unsigned
0ce5    jnb,u   B190  P=0.000001 C=-1.000000

0ceb    B145: #	out( B146 ) <- in( B144 )  Freq: 0.0777571
0ceb    movl    [RDI + #16 + R8 << #2], R11	# int

0cf0    B146: #	out( B142 B147 ) <- in( B145 B142 )  Freq: 0.0888696
0cf0    incl    R10	# int
0cf3    cmpl    R10, RAX
0cf6    jl,s   B142	# loop end  P=0.500000 C=14611.000000

0cf8    B147: #	out( B94 ) <- in( B146 )  Freq: 0.0444348
0cf8    jmp     B94

0cfd    B148: #	out( B116 ) <- in( B112 )  Freq: 0.0222253
0cfd    movq    RDI, [rsp + #56]	# spill
0d02    jmp     B116

0d07    B149: #	out( B221 B150 ) <- in( B23 B24 )  Freq: 0.000101028
0d07    movq    [rsp + #88], RSI	# spill
0d0c    movq    [rsp + #80], R8	# spill
0d11    movl    [rsp + #76], R11	# spill
0d16    movl    [rsp + #72], RDX	# spill
0d1a    movl    [rsp + #52], R9	# spill
0d1f    movq    [rsp + #64], R10	# spill
0d24    movl    [rsp + #48], RBX	# spill
0d28    movq    [rsp + #40], R13	# spill
0d2d    movq    [rsp + #32], R14	# spill
0d32    movq    RBP, [rsp + #56]	# spill
0d37    movq    RSI, precise klass [Z: 0x00007fd3e445a840:Constant:exact *	# ptr
0d41    movl    RDX, R9	# spill
0d44    call,static  wrapper for: _new_array_Java
        # jdk.incubator.vector.VectorMask::fromLong @ bci:92 (line 254) L[0]=_ L[1]=_ L[2]=_ L[3]=rsp + #64 L[4]=_ L[5]=rsp + #80 L[6]=_ L[7]=_ L[8]=_
        # App::micro_vector_masked @ bci:101 (line 51) L[0]=rsp + #24 L[1]=RBP L[2]=rsp + #32 L[3]=rsp + #40 L[4]=rsp + #76 L[5]=_ L[6]=_ L[7]=_
        # OopMap {rbp=Oop [24]=Oop [32]=Oop [40]=Oop [64]=Oop off=3404/0xd4c}

0d4c    B150: #	out( B26 ) <- in( B149 )  Freq: 0.000101026
        # Block is sole successor of call
0d4c    movq    [rsp + #56], RBP	# spill
0d51    movq    R14, [rsp + #32]	# spill
0d56    movq    R13, [rsp + #40]	# spill
0d5b    movl    RBX, [rsp + #48]	# spill
0d5f    movq    R10, [rsp + #64]	# spill
0d64    movl    R9, [rsp + #52]	# spill
0d69    movl    RDX, [rsp + #72]	# spill
0d6d    movl    R11, [rsp + #76]	# spill
0d72    movq    R8, [rsp + #80]	# spill
0d77    movq    RSI, [rsp + #88]	# spill
0d7c    movq    RBP, RAX	# spill
        nop 	# 1 bytes pad for loops and calls
0d80    jmp     B26

0d85    B151: #	out( B220 B152 ) <- in( B72 )  Freq: 0.000100012
0d85    vmovdqu [rsp + 96],XMM4	# spill
0d8b    movq    [rsp + #72], RDX	# spill
0d90    movq    [rsp + #64], RBX	# spill
0d95    movq    [rsp + #48], R8	# spill
0d9a    movl    [rsp + #32], R9	# spill
0d9f    movq    [rsp + #24], RDI	# spill
0da4    movq    RBP, RAX	# spill
0da7    movq    RSI, precise klass jdk/incubator/vector/IntVector$$Lambda$63+0x00000008000acb58: 0x00007fd35410b130:Constant:exact *	# ptr
        nop 	# 3 bytes pad for loops and calls
0db4    call,static  wrapper for: _new_instance_Java
        # java.lang.invoke.DirectMethodHandle::allocateInstance @ bci:12 (line 522) L[0]=_ L[1]=_
        # java.lang.invoke.LambdaForm$DMH/0x00000008000d4800::newInvokeSpecial @ bci:1 L[0]=#Ptr0x00007fd354002990 L[1]=rsp + #24 L[2]=rsp + #32 L[3]=_ L[4]=_
        # java.lang.invoke.LambdaForm$MH/0x00000008000d5000::linkToTargetMethod @ bci:6 L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:59 (line 2728) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ STK[0]=rsp + #64 STK[1]=rsp + #72
        # App::micro_vector_masked @ bci:115 (line 52) L[0]=RBP L[1]=rsp + #56 L[2]=_ L[3]=rsp + #40 L[4]=rsp + #32 L[5]=_ L[6]=_ L[7]=rsp + #48
        # OopMap {rbp=Oop [24]=Oop [40]=Oop [48]=Oop [56]=Oop [64]=Oop [72]=Oop off=3516/0xdbc}

0dbc    B152: #	out( B74 ) <- in( B151 )  Freq: 0.00010001
        # Block is sole successor of call
0dbc    movq    RCX, RAX	# spill
0dbf    movq    RDI, [rsp + #24]	# spill
0dc4    movl    R9, [rsp + #32]	# spill
0dc9    jmp     B74

0dce    B153: #	out( B219 B154 ) <- in( B82 )  Freq: 0.000100009
0dce    movq    [rsp + #40], RBX	# spill
0dd3    pushq   [rsp + #72]	# 64-bit mem-mem spill
	popq    [rsp + #32]
0ddd    movq    RBP, R8	# spill
0de0    movq    RSI, precise klass jdk/incubator/vector/IntVector$$Lambda$63+0x00000008000acb58: 0x00007fd35410b130:Constant:exact *	# ptr
        nop 	# 2 bytes pad for loops and calls
0dec    call,static  wrapper for: _new_instance_Java
        # java.lang.invoke.DirectMethodHandle::allocateInstance @ bci:12 (line 522) L[0]=_ L[1]=_
        # java.lang.invoke.LambdaForm$DMH/0x00000008000d4800::newInvokeSpecial @ bci:1 L[0]=#Ptr0x00007fd354002990 L[1]=RBP L[2]=rsp + #24 L[3]=_ L[4]=_
        # java.lang.invoke.LambdaForm$MH/0x00000008000d5000::linkToTargetMethod @ bci:6 L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:59 (line 2728) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ STK[0]=rsp + #40 STK[1]=rsp + #72
        # App::micro_vector_masked @ bci:129 (line 53) L[0]=_ L[1]=rsp + #56 L[2]=_ L[3]=_ L[4]=rsp + #24 L[5]=rsp + #64 L[6]=_ L[7]=rsp + #72
        # OopMap {rbp=Oop [32]=Oop [40]=Oop [56]=Oop [64]=Oop [72]=Oop off=3572/0xdf4}

0df4    B154: #	out( B84 ) <- in( B153 )  Freq: 0.000100007
        # Block is sole successor of call
0df4    movq    RCX, RAX	# spill
0df7    movq    R8, RBP	# spill
0dfa    movl    R10, [rsp + #24]	# spill
        nop 	# 1 bytes pad for loops and calls
0e00    jmp     B84

0e05    B155: #	out( N2743 ) <- in( B15 )  Freq: 3.03822e-06
0e05    movl    RSI, #-28	# int
0e0a    movq    RBP, [rsp + #24]	# spill
0e0f    movq    R9, [rsp + #56]	# spill
0e14    movq    [rsp + #24], R9	# spill
0e19    movq    [rsp + #40], R13	# spill
0e1e    movq    [rsp + #56], R10	# spill
0e23    movq    [rsp + #64], R14	# spill
0e28    movl    [rsp + #52], R11	# spill
0e2d    movl    [rsp + #72], R8	# spill
        nop 	# 2 bytes pad for loops and calls
0e34    call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #52 STK[1]=rsp + #72 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2689) L[0]=rsp + #56 L[1]=rsp + #64 L[2]=_ L[3]=_
        # App::micro_vector_masked @ bci:32 (line 44) L[0]=RBP L[1]=rsp + #24 L[2]=rsp + #64 L[3]=rsp + #40 L[4]=rsp + #52 L[5]=_ L[6]=_ L[7]=_
        # OopMap {rbp=Oop [24]=Oop [40]=Oop [56]=Oop [64]=Oop off=3644/0xe3c}
0e3c    stop	# ShouldNotReachHere

0e50    B156: #	out( N2743 ) <- in( B16 )  Freq: 3.03821e-06
0e50    movl    RSI, #-28	# int
0e55    movq    RBP, [rsp + #24]	# spill
0e5a    movq    R8, [rsp + #56]	# spill
0e5f    movq    [rsp + #24], R8	# spill
0e64    movq    [rsp + #32], R14	# spill
0e69    movq    [rsp + #56], R10	# spill
0e6e    movq    [rsp + #64], R13	# spill
0e73    movl    [rsp + #52], R11	# spill
0e78    movl    [rsp + #72], RAX	# spill
0e7c    vmovdqu [rsp + 96],XMM0	# spill
        nop 	# 2 bytes pad for loops and calls
0e84    call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #52 STK[1]=rsp + #72 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2689) L[0]=rsp + #56 L[1]=rsp + #64 L[2]=_ L[3]=_
        # App::micro_vector_masked @ bci:44 (line 45) L[0]=RBP L[1]=rsp + #24 L[2]=rsp + #32 L[3]=rsp + #64 L[4]=rsp + #52 L[5]=#ScObj0 L[6]=_ L[7]=_
        # ScObj0 jdk/incubator/vector/Int256Vector={ [payload :0]=rsp + #96 }
        # OopMap {rbp=Oop [24]=Oop [32]=Oop [56]=Oop [64]=Oop off=3724/0xe8c}
0e8c    stop	# ShouldNotReachHere

0ea0    B157: #	out( N2743 ) <- in( B17 )  Freq: 3.03821e-06
0ea0    movl    RSI, #-28	# int
0ea5    movq    RBP, [rsp + #24]	# spill
0eaa    movq    [rsp + #32], R14	# spill
0eaf    movq    [rsp + #40], R13	# spill
0eb4    movl    [rsp + #52], R11	# spill
0eb9    movl    [rsp + #64], RCX	# spill
0ebd    vmovdqu [rsp + 96],XMM0	# spill
        nop 	# 1 bytes pad for loops and calls
0ec4    call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #52 STK[1]=rsp + #64 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:7 (line 2960) L[0]=#ScObj0 L[1]=rsp + #56 L[2]=_ L[3]=_
        # ScObj0 jdk/incubator/vector/Int256Vector={ [payload :0]=rsp + #96 }
        # App::micro_vector_masked @ bci:59 (line 46) L[0]=RBP L[1]=rsp + #56 L[2]=rsp + #32 L[3]=rsp + #40 L[4]=rsp + #52 L[5]=_ L[6]=_ L[7]=_
        # OopMap {rbp=Oop [32]=Oop [40]=Oop [56]=Oop off=3788/0xecc}
0ecc    stop	# ShouldNotReachHere

0ee0    B158: #	out( B23 ) <- in( B21 )  Freq: 1.01326e-06
0ee0    movslq  RCX, R9	# i2l
0ee3    jmp     B23

0ee8    B159: #	out( N2743 ) <- in( B85 )  Freq: 1.01318e-06
0ee8    movl    RSI, #-10	# int
0eed    movq    RBP, RAX	# spill
0ef0    call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector_masked @ bci:140 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_ STK[0]=#NULL STK[1]=RBP STK[2]=rsp + #32
        # OopMap {rbp=Oop [32]=Oop off=3832/0xef8}
0ef8    stop	# ShouldNotReachHere

0f0c    B160: #	out( N2743 ) <- in( B3 )  Freq: 9.99998e-07
0f0c    movl    RSI, #-34	# int
0f11    movq    [rsp + #32], RDX	# spill
0f16    movq    [rsp + #40], RCX	# spill
0f1b    movq    [rsp + #48], R8	# spill
0f20    movl    [rsp + #56], RBX	# spill
0f24    call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector_masked @ bci:17 (line 43) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=rsp + #40 L[3]=rsp + #48 L[4]=#0 L[5]=_ L[6]=_ L[7]=_ STK[0]=#0 STK[1]=RBP STK[2]=rsp + #56
        # OopMap {rbp=NarrowOop [24]=Oop [32]=Oop [40]=Oop [48]=Oop off=3884/0xf2c}
0f2c    stop	# ShouldNotReachHere

0f40    B161: #	out( N2743 ) <- in( B62 )  Freq: 9.99956e-07
0f40    movl    RSI, #-34	# int
0f45    movq    RBP, RAX	# spill
0f48    call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.VectorMask::fromArray @ bci:49 (line 208) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ STK[0]=RBP
        # jdk.incubator.vector.VectorMask::fromValues @ bci:17 (line 183) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.VectorMask::fromLong @ bci:141 (line 259) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_ L[8]=_
        # App::micro_vector_masked @ bci:101 (line 51) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {rbp=Oop off=3920/0xf50}
0f50    stop	# ShouldNotReachHere

0f64    B162: #	out( N2743 ) <- in( B70 )  Freq: 9.99952e-07
0f64    movl    RSI, #-187	# int
0f69    movq    R10, [rsp + #56]	# spill
0f6e    movq    [rsp + #32], R10	# spill
0f73    pushq   [rsp + #64]	# 64-bit mem-mem spill
	popq    [rsp + #56]
0f7d    movq    [rsp - #8], rax	# 32-bit mem-mem spill
	movl    rax, [rsp + #72]
	movl    [rsp + #52], rax
	movq    rax, [rsp - #8]
0f8f    movq    [rsp - #8], rax	# 32-bit mem-mem spill
	movl    rax, [rsp + #72]
	movl    [rsp + #64], rax
	movq    rax, [rsp - #8]
0fa1    movq    [rsp + #80], R8	# spill
0fa6    movq    [rsp + #88], RBX	# spill
0fab    movq    [rsp + #96], RDX	# spill
0fb0    movl    [rsp + #68], R11	# spill
        nop 	# 3 bytes pad for loops and calls
0fb8    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.IntVector$IntSpecies::iota @ bci:17 (line 3664) L[0]=_ STK[0]=RBP
        # jdk.incubator.vector.IntVector::checkMaskFromIndexSize @ bci:8 (line 3312) L[0]=_ L[1]=_ L[2]=_ L[3]=#1 L[4]=_ STK[0]=rsp + #96 STK[1]=rsp + #52 STK[2]=rsp + #68
        # jdk.incubator.vector.IntVector::fromArray @ bci:51 (line 2727) L[0]=_ L[1]=rsp + #56 L[2]=rsp + #64 L[3]=rsp + #80 L[4]=rsp + #88 L[5]=_
        # App::micro_vector_masked @ bci:115 (line 52) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=_ L[3]=rsp + #40 L[4]=rsp + #52 L[5]=_ L[6]=_ L[7]=rsp + #80
        # OopMap {[24]=Oop [32]=Oop [40]=Oop [56]=Oop [80]=Oop [88]=Oop [96]=Oop off=4032/0xfc0}
0fc0    stop	# ShouldNotReachHere

0fd4    B163: #	out( N2743 ) <- in( B80 )  Freq: 9.99927e-07
0fd4    movl    RSI, #-187	# int
0fd9    movq    R9, [rsp + #56]	# spill
0fde    movq    [rsp + #24], R9	# spill
0fe3    movl    [rsp + #36], R10	# spill
0fe8    movl    [rsp + #48], R10	# spill
0fed    movq    [rsp + #56], RAX	# spill
0ff2    movq    [rsp + #80], RBX	# spill
0ff7    movl    [rsp + #52], R11	# spill
0ffc    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.IntVector$IntSpecies::iota @ bci:17 (line 3664) L[0]=_ STK[0]=RBP
        # jdk.incubator.vector.IntVector::checkMaskFromIndexSize @ bci:8 (line 3312) L[0]=_ L[1]=_ L[2]=_ L[3]=#1 L[4]=_ STK[0]=rsp + #72 STK[1]=rsp + #36 STK[2]=rsp + #52
        # jdk.incubator.vector.IntVector::fromArray @ bci:51 (line 2727) L[0]=_ L[1]=rsp + #40 L[2]=rsp + #48 L[3]=rsp + #72 L[4]=rsp + #80 L[5]=_
        # App::micro_vector_masked @ bci:129 (line 53) L[0]=_ L[1]=rsp + #24 L[2]=_ L[3]=_ L[4]=rsp + #36 L[5]=rsp + #56 L[6]=_ L[7]=rsp + #72
        # OopMap {[24]=Oop [40]=Oop [56]=Oop [72]=Oop [80]=Oop off=4100/0x1004}
1004    stop	# ShouldNotReachHere

1018    B164: #	out( N2743 ) <- in( B92 )  Freq: 9.11825e-07
1018    movl    RSI, #-28	# int
101d    movq    [rsp + #32], RAX	# spill
1022    movl    [rsp + #28], R10	# spill
        nop 	# 1 bytes pad for loops and calls
1028    call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #72 STK[1]=rsp + #28 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:7 (line 2960) L[0]=rsp + #32 L[1]=rsp + #56 L[2]=_ L[3]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:10 (line 3001) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {[32]=Oop [56]=Oop off=4144/0x1030}
1030    stop	# ShouldNotReachHere

1044    B165: #	out( B166 ) <- in( B28 )  Freq: 9.00631e-07
1044    movl    RDI, [rsp + #32]	# spill

1048    B166: #	out( N2743 ) <- in( B165 B27 )  Freq: 1.80126e-06
1048    movl    RSI, #-138	# int
104d    movq    RBP, [rsp + #24]	# spill
1052    movq    R9, [rsp + #56]	# spill
1057    movq    [rsp + #24], R9	# spill
105c    movq    [rsp + #32], R14	# spill
1061    movq    [rsp + #40], R13	# spill
1066    movl    [rsp + #48], R11	# spill
106b    movq    [rsp + #56], R10	# spill
1070    movq    [rsp + #64], RCX	# spill
1075    movq    [rsp + #72], R8	# spill
107a    movl    [rsp + #52], RDI	# spill
        nop 	# 2 bytes pad for loops and calls
1080    call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.VectorMask::fromLong @ bci:104 (line 255) L[0]=_ L[1]=_ L[2]=_ L[3]=rsp + #56 L[4]=_ L[5]=rsp + #72 L[6]=_ L[7]=rsp + #64 L[8]=#0 STK[0]=#0 STK[1]=rsp + #52
        # App::micro_vector_masked @ bci:101 (line 51) L[0]=RBP L[1]=rsp + #24 L[2]=rsp + #32 L[3]=rsp + #40 L[4]=rsp + #48 L[5]=_ L[6]=_ L[7]=_
        # OopMap {rbp=Oop [24]=Oop [32]=Oop [40]=Oop [56]=Oop [64]=Oop off=4232/0x1088}
1088    stop	# ShouldNotReachHere

109c    B167: #	out( B53 ) <- in( B31 )  Freq: 9.0063e-07
109c    movl    RAX, #1	# int
10a1    jmp     B53

10a6    B168: #	out( N2743 ) <- in( B90 )  Freq: 8.99877e-07
10a6    movl    RSI, #-34	# int
10ab    movq    [rsp + #40], RAX	# spill
10b0    call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::intoArray @ bci:2 (line 2960) L[0]=rsp + #40 L[1]=rsp + #56 L[2]=_ L[3]=_ STK[0]=rsp + #72 STK[1]=rsp + #40
        # jdk.incubator.vector.IntVector::intoArray @ bci:10 (line 3001) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {[40]=Oop [56]=Oop off=4280/0x10b8}
10b8    stop	# ShouldNotReachHere

10cc    B169: #	out( N2743 ) <- in( B91 )  Freq: 8.99877e-07
10cc    movl    RSI, #-52	# int
10d1    movq    [rsp + #32], RAX	# spill
        nop 	# 2 bytes pad for loops and calls
10d8    call,static  wrapper for: uncommon_trap(reason='intrinsic_or_type_checked_inlining' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #72 STK[1]=rsp + #84 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:7 (line 2960) L[0]=rsp + #32 L[1]=rsp + #56 L[2]=_ L[3]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:10 (line 3001) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {[32]=Oop [56]=Oop off=4320/0x10e0}
10e0    stop	# ShouldNotReachHere

10f4    B170: #	out( N2743 ) <- in( B32 )  Freq: 8.88826e-07
10f4    stop	# ShouldNotReachHere

1108    B171: #	out( N2743 ) <- in( B33 )  Freq: 8.88825e-07
1108    stop	# ShouldNotReachHere

111c    B172: #	out( B175 ) <- in( B8 )  Freq: 7.499e-07
111c    movq    R13, RAX	# spill
        nop 	# 1 bytes pad for loops and calls
1120    jmp,s   B175

1122    B173: #	out( B175 ) <- in( B9 )  Freq: 7.59858e-07
1122    movq    R13, RAX	# spill
1125    jmp,s   B175

1127    B174: #	out( B175 ) <- in( B7 )  Freq: 7.59859e-07
1127    movq    R13, RAX	# spill

112a    B175: #	out( N2743 ) <- in( B13 B174 B172 B173 B176 B11 B12 )  Freq: 5.27917e-06
112a    movl    RSI, #-138	# int
112f    movq    RBP, [rsp + #24]	# spill
1134    movq    [rsp + #32], R14	# spill
1139    movq    [rsp + #40], R13	# spill
113e    movl    [rsp + #48], RDI	# spill
        nop 	# 2 bytes pad for loops and calls
1144    call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_vector_masked @ bci:22 (line 43) L[0]=RBP L[1]=rsp + #56 L[2]=rsp + #32 L[3]=rsp + #40 L[4]=#0 L[5]=_ L[6]=_ L[7]=_ STK[0]=#0 STK[1]=rsp + #48
        # OopMap {rbp=Oop [32]=Oop [40]=Oop [56]=Oop off=4428/0x114c}
114c    stop	# ShouldNotReachHere

1160    B176: #	out( B175 ) <- in( B10 )  Freq: 7.49899e-07
1160    movq    R13, RAX	# spill
1163    jmp,s   B175

1165    B177: #	out( N2743 ) <- in( B4 )  Freq: 4.99998e-07
1165    movl    RSI, #-187	# int
116a    movq    [rsp + #32], RDX	# spill
116f    movq    [rsp + #40], RCX	# spill
1174    movq    [rsp + #48], R8	# spill
1179    movl    [rsp + #56], RBX	# spill
117d    movl    [rsp + #60], R9	# spill
        nop 	# 2 bytes pad for loops and calls
1184    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.VectorIntrinsics::roundDown @ bci:5 (line 106) L[0]=rsp + #56 L[1]=rsp + #60 STK[0]=RBP
        # jdk.incubator.vector.AbstractSpecies::loopBound @ bci:5 (line 203) L[0]=_ L[1]=_
        # App::micro_vector_masked @ bci:17 (line 43) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=rsp + #40 L[3]=rsp + #48 L[4]=#0 L[5]=_ L[6]=_ L[7]=_ STK[0]=#0
        # OopMap {[24]=Oop [32]=Oop [40]=Oop [48]=Oop off=4492/0x118c}
118c    stop	# ShouldNotReachHere

11a0    B178: #	out( N2743 ) <- in( B65 )  Freq: 4.99977e-07
11a0    movl    RSI, #-187	# int
11a5    movq    RBP, [rsp + #24]	# spill
11aa    movq    R10, [rsp + #56]	# spill
11af    movq    [rsp + #24], R10	# spill
11b4    movq    R10, [rsp + #40]	# spill
11b9    movq    [rsp + #32], R10	# spill
11be    movq    R10, [rsp + #64]	# spill
11c3    movq    [rsp + #48], R10	# spill
11c8    movq    [rsp - #8], rax	# 32-bit mem-mem spill
	movl    rax, [rsp + #72]
	movl    [rsp + #44], rax
	movq    rax, [rsp - #8]
11da    movq    [rsp - #8], rax	# 32-bit mem-mem spill
	movl    rax, [rsp + #72]
	movl    [rsp + #56], rax
	movq    rax, [rsp - #8]
11ec    movq    [rsp + #80], R8	# spill
11f1    movq    [rsp + #88], RBX	# spill
        nop 	# 2 bytes pad for loops and calls
11f8    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:7 (line 2721) L[0]=rsp + #88 L[1]=rsp + #48 L[2]=rsp + #56 L[3]=rsp + #80 L[4]=rsp + #88 L[5]=_ STK[0]=rsp + #44
        # App::micro_vector_masked @ bci:115 (line 52) L[0]=RBP L[1]=rsp + #24 L[2]=_ L[3]=rsp + #32 L[4]=rsp + #44 L[5]=_ L[6]=_ L[7]=rsp + #80
        # OopMap {rbp=Oop [24]=Oop [32]=Oop [48]=Oop [80]=Oop [88]=Oop off=4608/0x1200}
1200    stop	# ShouldNotReachHere

1214    B179: #	out( N2743 ) <- in( B19 )  Freq: 4.76829e-07
1214    movl    RSI, #-187	# int
1219    movq    RBP, [rsp + #24]	# spill
121e    movq    RCX, [rsp + #56]	# spill
1223    movq    [rsp + #24], RCX	# spill
1228    movq    [rsp + #32], R14	# spill
122d    movq    [rsp + #40], R13	# spill
1232    movl    [rsp + #48], R11	# spill
1237    movq    [rsp + #56], R10	# spill
123c    movq    [rsp + #64], R8	# spill
1241    movl    [rsp + #72], R9	# spill
        nop 	# 2 bytes pad for loops and calls
1248    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.VectorMask::fromLong @ bci:15 (line 242) L[0]=_ L[1]=rsp + #64 L[2]=_ L[3]=rsp + #56 L[4]=rsp + #72 L[5]=_ L[6]=_ L[7]=_ L[8]=_ STK[0]=rsp + #72 STK[1]=#64
        # App::micro_vector_masked @ bci:101 (line 51) L[0]=RBP L[1]=rsp + #24 L[2]=rsp + #32 L[3]=rsp + #40 L[4]=rsp + #48 L[5]=_ L[6]=_ L[7]=_
        # OopMap {rbp=Oop [24]=Oop [32]=Oop [40]=Oop [56]=Oop off=4688/0x1250}
1250    stop	# ShouldNotReachHere

1264    B180: #	out( N2743 ) <- in( B20 )  Freq: 4.76828e-07
1264    cmpq    R8, RSI	# CmpL3
	movl    RBP, -1
	jl,s    done
	setne   RBP
	movzbl  RBP, RBP
	done:
1276    movl    RSI, #-187	# int
127b    movq    RCX, [rsp + #56]	# spill
1280    movq    [rsp + #32], RCX	# spill
1285    movq    [rsp + #40], R14	# spill
128a    movq    [rsp + #48], R13	# spill
128f    movl    [rsp + #56], R11	# spill
1294    movq    [rsp + #64], R10	# spill
1299    movq    [rsp + #72], R8	# spill
129e    movl    [rsp + #60], R9	# spill
        nop 	# 1 bytes pad for loops and calls
12a4    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.VectorMask::fromLong @ bci:40 (line 247) L[0]=_ L[1]=rsp + #72 L[2]=_ L[3]=rsp + #64 L[4]=rsp + #60 L[5]=_ L[6]=_ L[7]=_ L[8]=_ STK[0]=RBP
        # App::micro_vector_masked @ bci:101 (line 51) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=rsp + #40 L[3]=rsp + #48 L[4]=rsp + #56 L[5]=_ L[6]=_ L[7]=_
        # OopMap {[24]=Oop [32]=Oop [40]=Oop [48]=Oop [64]=Oop off=4780/0x12ac}
12ac    stop	# ShouldNotReachHere

12c0    B181: #	out( N2743 ) <- in( B67 )  Freq: 4.76815e-07
12c0    movl    RSI, #-187	# int
12c5    movq    R10, [rsp + #56]	# spill
12ca    movq    [rsp + #32], R10	# spill
12cf    pushq   [rsp + #64]	# 64-bit mem-mem spill
	popq    [rsp + #56]
12d9    movq    [rsp - #8], rax	# 32-bit mem-mem spill
	movl    rax, [rsp + #72]
	movl    [rsp + #52], rax
	movq    rax, [rsp - #8]
12eb    movq    [rsp - #8], rax	# 32-bit mem-mem spill
	movl    rax, [rsp + #72]
	movl    [rsp + #64], rax
	movq    rax, [rsp - #8]
12fd    movq    [rsp + #80], R8	# spill
1302    movq    [rsp + #88], RBX	# spill
        nop 	# 1 bytes pad for loops and calls
1308    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:20 (line 2721) L[0]=_ L[1]=rsp + #56 L[2]=rsp + #64 L[3]=rsp + #80 L[4]=rsp + #88 L[5]=_ STK[0]=rsp + #52 STK[1]=RBP
        # App::micro_vector_masked @ bci:115 (line 52) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=_ L[3]=rsp + #40 L[4]=rsp + #52 L[5]=_ L[6]=_ L[7]=rsp + #80
        # OopMap {[24]=Oop [32]=Oop [40]=Oop [56]=Oop [80]=Oop [88]=Oop off=4880/0x1310}
1310    stop	# ShouldNotReachHere

1324    B182: #	out( N2743 ) <- in( B69 )  Freq: 4.76814e-07
1324    movl    RSI, #-187	# int
1329    movq    R10, [rsp + #56]	# spill
132e    movq    [rsp + #32], R10	# spill
1333    pushq   [rsp + #64]	# 64-bit mem-mem spill
	popq    [rsp + #56]
133d    movq    [rsp - #8], rax	# 32-bit mem-mem spill
	movl    rax, [rsp + #72]
	movl    [rsp + #52], rax
	movq    rax, [rsp - #8]
134f    movq    [rsp - #8], rax	# 32-bit mem-mem spill
	movl    rax, [rsp + #72]
	movl    [rsp + #64], rax
	movq    rax, [rsp - #8]
1361    movq    [rsp + #80], R8	# spill
1366    movq    [rsp + #96], RDX	# spill
136b    movl    [rsp + #68], R11	# spill
1370    movq    [rsp + #104], RBX	# spill
        nop 	# 3 bytes pad for loops and calls
1378    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.IntVector$IntSpecies::iota @ bci:6 (line 3662) L[0]=rsp + #104 STK[0]=RBP STK[1]=#Ptr0x00007fd35410e3b0
        # jdk.incubator.vector.IntVector::checkMaskFromIndexSize @ bci:8 (line 3312) L[0]=_ L[1]=_ L[2]=_ L[3]=#1 L[4]=_ STK[0]=rsp + #96 STK[1]=rsp + #52 STK[2]=rsp + #68
        # jdk.incubator.vector.IntVector::fromArray @ bci:51 (line 2727) L[0]=_ L[1]=rsp + #56 L[2]=rsp + #64 L[3]=rsp + #80 L[4]=rsp + #104 L[5]=_
        # App::micro_vector_masked @ bci:115 (line 52) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=_ L[3]=rsp + #40 L[4]=rsp + #52 L[5]=_ L[6]=_ L[7]=rsp + #80
        # OopMap {rbp=NarrowOop [24]=Oop [32]=Oop [40]=Oop [56]=Oop [80]=Oop [96]=Oop [104]=Oop off=4992/0x1380}
1380    stop	# ShouldNotReachHere

1394    B183: #	out( N2743 ) <- in( B71 )  Freq: 4.76814e-07
1394    movl    RSI, #-187	# int
1399    movq    R10, [rsp + #56]	# spill
139e    movq    [rsp + #32], R10	# spill
13a3    pushq   [rsp + #64]	# 64-bit mem-mem spill
	popq    [rsp + #56]
13ad    movq    [rsp - #8], rax	# 32-bit mem-mem spill
	movl    rax, [rsp + #72]
	movl    [rsp + #52], rax
	movq    rax, [rsp - #8]
13bf    movq    [rsp - #8], rax	# 32-bit mem-mem spill
	movl    rax, [rsp + #72]
	movl    [rsp + #64], rax
	movq    rax, [rsp - #8]
13d1    movq    [rsp + #80], R8	# spill
13d6    movq    [rsp + #88], RBX	# spill
13db    movl    [rsp + #68], R11	# spill
13e0    vmovdqu [rsp + 96],XMM0	# spill
        nop 	# 2 bytes pad for loops and calls
13e8    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.AbstractMask::checkIndexByLane @ bci:150 (line 240) L[0]=_ L[1]=rsp + #52 L[2]=rsp + #68 L[3]=_ L[4]=#1 L[5]=_ L[6]=#ScObj0 L[7]=_ L[8]=_ L[9]=_ STK[0]=RBP
        # ScObj0 jdk/incubator/vector/Int256Vector$Int256Mask={ [payload :0]=rsp + #96 }
        # jdk.incubator.vector.IntVector::checkMaskFromIndexSize @ bci:12 (line 3312) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:51 (line 2727) L[0]=_ L[1]=rsp + #56 L[2]=rsp + #64 L[3]=rsp + #80 L[4]=rsp + #88 L[5]=_
        # App::micro_vector_masked @ bci:115 (line 52) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=_ L[3]=rsp + #40 L[4]=rsp + #52 L[5]=_ L[6]=_ L[7]=rsp + #80
        # OopMap {[24]=Oop [32]=Oop [40]=Oop [56]=Oop [80]=Oop [88]=Oop off=5104/0x13f0}
13f0    stop	# ShouldNotReachHere

1404    B184: #	out( N2743 ) <- in( B78 )  Freq: 4.76803e-07
1404    movl    RSI, #-187	# int
1409    movq    R11, [rsp + #56]	# spill
140e    movq    [rsp + #24], R11	# spill
1413    movl    [rsp + #36], R10	# spill
1418    movl    [rsp + #48], R10	# spill
141d    movq    [rsp + #56], RAX	# spill
1422    movq    [rsp + #80], RBX	# spill
        nop 	# 1 bytes pad for loops and calls
1428    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:20 (line 2721) L[0]=_ L[1]=rsp + #40 L[2]=rsp + #48 L[3]=rsp + #72 L[4]=rsp + #80 L[5]=_ STK[0]=rsp + #36 STK[1]=RBP
        # App::micro_vector_masked @ bci:129 (line 53) L[0]=_ L[1]=rsp + #24 L[2]=_ L[3]=_ L[4]=rsp + #36 L[5]=rsp + #56 L[6]=_ L[7]=rsp + #72
        # OopMap {[24]=Oop [40]=Oop [56]=Oop [72]=Oop [80]=Oop off=5168/0x1430}
1430    stop	# ShouldNotReachHere

1444    B185: #	out( N2743 ) <- in( B79 )  Freq: 4.76803e-07
1444    movl    RSI, #-187	# int
1449    movq    R9, [rsp + #56]	# spill
144e    movq    [rsp + #24], R9	# spill
1453    movl    [rsp + #36], R10	# spill
1458    movl    [rsp + #48], R10	# spill
145d    movq    [rsp + #56], RAX	# spill
1462    movl    [rsp + #52], R11	# spill
1467    movq    [rsp + #96], RBX	# spill
146c    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.IntVector$IntSpecies::iota @ bci:6 (line 3662) L[0]=rsp + #96 STK[0]=RBP STK[1]=#Ptr0x00007fd35410e3b0
        # jdk.incubator.vector.IntVector::checkMaskFromIndexSize @ bci:8 (line 3312) L[0]=_ L[1]=_ L[2]=_ L[3]=#1 L[4]=_ STK[0]=rsp + #72 STK[1]=rsp + #36 STK[2]=rsp + #52
        # jdk.incubator.vector.IntVector::fromArray @ bci:51 (line 2727) L[0]=_ L[1]=rsp + #40 L[2]=rsp + #48 L[3]=rsp + #72 L[4]=rsp + #96 L[5]=_
        # App::micro_vector_masked @ bci:129 (line 53) L[0]=_ L[1]=rsp + #24 L[2]=_ L[3]=_ L[4]=rsp + #36 L[5]=rsp + #56 L[6]=_ L[7]=rsp + #72
        # OopMap {rbp=NarrowOop [24]=Oop [40]=Oop [56]=Oop [72]=Oop [96]=Oop off=5236/0x1474}
1474    stop	# ShouldNotReachHere

1488    B186: #	out( N2743 ) <- in( B81 )  Freq: 4.76802e-07
1488    movl    RSI, #-187	# int
148d    movq    R9, [rsp + #56]	# spill
1492    movq    [rsp + #24], R9	# spill
1497    movl    [rsp + #36], R10	# spill
149c    movl    [rsp + #48], R10	# spill
14a1    movq    [rsp + #56], RAX	# spill
14a6    movq    [rsp + #80], RBX	# spill
14ab    movl    [rsp + #52], R11	# spill
14b0    vmovdqu [rsp + 96],XMM1	# spill
        nop 	# 2 bytes pad for loops and calls
14b8    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.AbstractMask::checkIndexByLane @ bci:150 (line 240) L[0]=_ L[1]=rsp + #36 L[2]=rsp + #52 L[3]=_ L[4]=#1 L[5]=_ L[6]=#ScObj0 L[7]=_ L[8]=_ L[9]=_ STK[0]=RBP
        # ScObj0 jdk/incubator/vector/Int256Vector$Int256Mask={ [payload :0]=rsp + #96 }
        # jdk.incubator.vector.IntVector::checkMaskFromIndexSize @ bci:12 (line 3312) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:51 (line 2727) L[0]=_ L[1]=rsp + #40 L[2]=rsp + #48 L[3]=rsp + #72 L[4]=rsp + #80 L[5]=_
        # App::micro_vector_masked @ bci:129 (line 53) L[0]=_ L[1]=rsp + #24 L[2]=_ L[3]=_ L[4]=rsp + #36 L[5]=rsp + #56 L[6]=_ L[7]=rsp + #72
        # OopMap {[24]=Oop [40]=Oop [56]=Oop [72]=Oop [80]=Oop off=5312/0x14c0}
14c0    stop	# ShouldNotReachHere

14d4    B187: #	out( B188 ) <- in( B113 )  Freq: 1.57581e-07
14d4    movq    RDI, [rsp + #56]	# spill

14d9    B188: #	out( N2743 ) <- in( B143 B187 )  Freq: 2.36371e-07
14d9    movl    RSI, #-28	# int
14de    movl    R8, [rsp + #72]	# spill
14e3    movq    [rsp + #40], RBX	# spill
14e8    movq    [rsp + #48], RDI	# spill
14ed    movl    [rsp + #56], R8	# spill
14f2    movl    [rsp + #60], R10	# spill
14f7    movq    [rsp + #64], R9	# spill
14fc    movl    [rsp + #72], R10	# spill
        nop 	# 3 bytes pad for loops and calls
1504    call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # jdk.incubator.vector.IntVector::stOp @ bci:44 (line 355) L[0]=_ L[1]=rsp + #48 L[2]=rsp + #56 L[3]=_ L[4]=#Ptr0x00007fd36829e060 L[5]=rsp + #64 L[6]=rsp + #40 L[7]=rsp + #60 STK[0]=#Ptr0x00007fd36829e060 STK[1]=rsp + #48 STK[2]=rsp + #56 STK[3]=rsp + #72 STK[4]=rsp + #64 STK[5]=rsp + #60
        # jdk.incubator.vector.IntVector::intoArray @ bci:41 (line 3006) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {[40]=Oop [48]=Oop [64]=Oop off=5388/0x150c}
150c    stop	# ShouldNotReachHere

1520    B189: #	out( B190 ) <- in( B114 )  Freq: 1.57581e-07
1520    movq    RDI, [rsp + #56]	# spill
1525    movl    R11, RBP	# spill
1528    movl    R8, R14	# spill

152b    B190: #	out( N2743 ) <- in( B144 B189 )  Freq: 2.36371e-07
152b    movl    RSI, #-28	# int
1530    movq    [rsp + #32], R9	# spill
1535    movq    [rsp + #40], RBX	# spill
153a    movl    [rsp + #28], R10	# spill
153f    movq    [rsp + #48], RDI	# spill
1544    movl    [rsp + #56], R8	# spill
1549    movl    [rsp + #60], R11	# spill
        nop 	# 2 bytes pad for loops and calls
1550    call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # jdk.incubator.vector.IntVector::lambda$intoArray$82 @ bci:5 (line 3006) L[0]=_ L[1]=_ L[2]=_ L[3]=_ STK[0]=rsp + #48 STK[1]=rsp + #56 STK[2]=rsp + #60
        # jdk.incubator.vector.IntVector$$Lambda$67/0x00000008000ad640::apply @ bci:8 L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # jdk.incubator.vector.IntVector::stOp @ bci:45 (line 355) L[0]=_ L[1]=rsp + #48 L[2]=rsp + #72 L[3]=_ L[4]=#Ptr0x00007fd36829e060 L[5]=rsp + #32 L[6]=rsp + #40 L[7]=rsp + #28
        # jdk.incubator.vector.IntVector::intoArray @ bci:41 (line 3006) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {[32]=Oop [40]=Oop [48]=Oop off=5464/0x1558}
1558    stop	# ShouldNotReachHere

156c    B191: #	out( N2743 ) <- in( B101 )  Freq: 9.99843e-08
156c    movl    RSI, #-187	# int
1571    movq    R10, [rsp + #56]	# spill
1576    movq    [rsp + #24], R10	# spill
157b    movl    R11, [rsp + #72]	# spill
1580    movl    R10, R11	# spill
1583    movl    [rsp + #36], R10	# spill
1588    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.IntVector$IntSpecies::iota @ bci:17 (line 3664) L[0]=_ STK[0]=RBP
        # jdk.incubator.vector.IntVector::checkMaskFromIndexSize @ bci:8 (line 3312) L[0]=_ L[1]=_ L[2]=_ L[3]=#1 L[4]=_ STK[0]=rsp + #40 STK[1]=rsp + #72 STK[2]=rsp + #80
        # jdk.incubator.vector.IntVector::intoArray @ bci:29 (line 3005) L[0]=rsp + #48 L[1]=rsp + #24 L[2]=rsp + #36 L[3]=rsp + #40 L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {[24]=Oop [40]=Oop [48]=Oop off=5520/0x1590}
1590    stop	# ShouldNotReachHere

15a4    B192: #	out( N2743 ) <- in( B103 )  Freq: 9.99841e-08
15a4    movl    RSI, #-34	# int
        nop 	# 3 bytes pad for loops and calls
15ac    call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::stOp @ bci:1 (line 351) L[0]=_ L[1]=rsp + #56 L[2]=rsp + #72 L[3]=rsp + #32 L[4]=#Ptr0x00007fd36829e060 L[5]=_ L[6]=_ L[7]=_ STK[0]=rsp + #48
        # jdk.incubator.vector.IntVector::intoArray @ bci:41 (line 3006) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {[32]=Oop [48]=Oop [56]=Oop off=5556/0x15b4}
15b4    stop	# ShouldNotReachHere

15c8    B193: #	out( N2743 ) <- in( B110 B109 )  Freq: 1.78922e-07
15c8    movl    RSI, #-138	# int
15cd    movq    [rsp + #32], R9	# spill
15d2    movq    [rsp + #40], RBX	# spill
15d7    movl    [rsp + #28], RAX	# spill
        nop 	# 1 bytes pad for loops and calls
15dc    call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::stOp @ bci:23 (line 353) L[0]=_ L[1]=rsp + #56 L[2]=rsp + #72 L[3]=_ L[4]=#Ptr0x00007fd36829e060 L[5]=rsp + #32 L[6]=rsp + #40 L[7]=#0 STK[0]=#0 STK[1]=rsp + #28
        # jdk.incubator.vector.IntVector::intoArray @ bci:41 (line 3006) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {[32]=Oop [40]=Oop [56]=Oop off=5604/0x15e4}
15e4    stop	# ShouldNotReachHere

15f8    B194: #	out( N2743 ) <- in( B119 )  Freq: 9.00506e-08
15f8    stop	# ShouldNotReachHere

160c    B195: #	out( N2743 ) <- in( B120 )  Freq: 9.00506e-08
160c    stop	# ShouldNotReachHere

1620    B196: #	out( N2743 ) <- in( B121 )  Freq: 9.00505e-08
1620    stop	# ShouldNotReachHere

1634    B197: #	out( N2743 ) <- in( B122 )  Freq: 9.00504e-08
1634    stop	# ShouldNotReachHere

1648    B198: #	out( N2743 ) <- in( B123 )  Freq: 9.00503e-08
1648    stop	# ShouldNotReachHere

165c    B199: #	out( N2743 ) <- in( B124 )  Freq: 9.00502e-08
165c    stop	# ShouldNotReachHere

1670    B200: #	out( N2743 ) <- in( B125 )  Freq: 9.00501e-08
1670    stop	# ShouldNotReachHere

1684    B201: #	out( N2743 ) <- in( B100 )  Freq: 4.76762e-08
1684    movl    RSI, #-187	# int
1689    movq    R10, [rsp + #56]	# spill
168e    movq    [rsp + #24], R10	# spill
1693    movl    R10, [rsp + #72]	# spill
1698    movl    [rsp + #36], R10	# spill
169d    movq    [rsp + #72], RAX	# spill
        nop 	# 2 bytes pad for loops and calls
16a4    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.IntVector$IntSpecies::iota @ bci:6 (line 3662) L[0]=rsp + #72 STK[0]=RBP STK[1]=#Ptr0x00007fd35410e3b0
        # jdk.incubator.vector.IntVector::checkMaskFromIndexSize @ bci:8 (line 3312) L[0]=_ L[1]=_ L[2]=_ L[3]=#1 L[4]=_ STK[0]=rsp + #40 STK[1]=rsp + #36 STK[2]=rsp + #80
        # jdk.incubator.vector.IntVector::intoArray @ bci:29 (line 3005) L[0]=rsp + #48 L[1]=rsp + #24 L[2]=rsp + #36 L[3]=rsp + #40 L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {rbp=NarrowOop [24]=Oop [40]=Oop [48]=Oop [72]=Oop off=5804/0x16ac}
16ac    stop	# ShouldNotReachHere

16c0    B202: #	out( N2743 ) <- in( B102 )  Freq: 4.76762e-08
16c0    movl    RSI, #-187	# int
16c5    movq    R10, [rsp + #56]	# spill
16ca    movq    [rsp + #24], R10	# spill
16cf    movl    R11, [rsp + #72]	# spill
16d4    movl    R10, R11	# spill
16d7    movl    [rsp + #36], R10	# spill
16dc    movq    R10, [rsp + #48]	# spill
16e1    movq    [rsp + #40], R10	# spill
16e6    movq    [rsp + #48], R9	# spill
16eb    movl    R11, [rsp + #80]	# spill
16f0    movl    [rsp + #56], R11	# spill
16f5    vmovdqu [rsp + 64],XMM1	# spill
        nop 	# 1 bytes pad for loops and calls
16fc    call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.AbstractMask::checkIndexByLane @ bci:150 (line 240) L[0]=_ L[1]=rsp + #36 L[2]=rsp + #56 L[3]=_ L[4]=#1 L[5]=_ L[6]=#ScObj0 L[7]=_ L[8]=_ L[9]=_ STK[0]=RBP
        # ScObj0 jdk/incubator/vector/Int256Vector$Int256Mask={ [payload :0]=rsp + #64 }
        # jdk.incubator.vector.IntVector::checkMaskFromIndexSize @ bci:12 (line 3312) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:29 (line 3005) L[0]=rsp + #40 L[1]=rsp + #24 L[2]=rsp + #36 L[3]=rsp + #48 L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {[24]=Oop [40]=Oop [48]=Oop off=5892/0x1704}
1704    stop	# ShouldNotReachHere

1718    B203: #	out( N2743 ) <- in( B64 )  Freq: 1e-35
1718    movl    RSI, #-34	# int
171d    movq    R10, [rsp + #56]	# spill
1722    movq    [rsp + #32], R10	# spill
1727    movq    R10, [rsp + #64]	# spill
172c    movq    [rsp + #56], R10	# spill
1731    movl    R11, [rsp + #72]	# spill
1736    movl    [rsp + #52], R11	# spill
173b    movq    [rsp + #72], R8	# spill
1740    call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:1 (line 2720) L[0]=RBP L[1]=rsp + #56 L[2]=rsp + #52 L[3]=rsp + #72 L[4]=_ L[5]=_ STK[0]=RBP
        # App::micro_vector_masked @ bci:115 (line 52) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=_ L[3]=rsp + #40 L[4]=rsp + #52 L[5]=_ L[6]=_ L[7]=rsp + #72
        # OopMap {rbp=NarrowOop [24]=Oop [32]=Oop [40]=Oop [56]=Oop [72]=Oop off=5960/0x1748}
1748    stop	# ShouldNotReachHere

175c    B204: #	out( N2743 ) <- in( B68 )  Freq: 1e-35
175c    movl    RSI, #-34	# int
1761    movq    RBP, [rsp + #24]	# spill
1766    movq    R10, [rsp + #56]	# spill
176b    movq    [rsp + #24], R10	# spill
1770    movq    R10, [rsp + #40]	# spill
1775    movq    [rsp + #32], R10	# spill
177a    pushq   [rsp + #64]	# 64-bit mem-mem spill
	popq    [rsp + #48]
1784    movq    [rsp - #8], rax	# 32-bit mem-mem spill
	movl    rax, [rsp + #72]
	movl    [rsp + #44], rax
	movq    rax, [rsp - #8]
1796    movq    [rsp - #8], rax	# 32-bit mem-mem spill
	movl    rax, [rsp + #72]
	movl    [rsp + #56], rax
	movq    rax, [rsp - #8]
17a8    movq    [rsp + #72], R8	# spill
17ad    movq    [rsp + #88], RBX	# spill
17b2    movl    [rsp + #60], R11	# spill
17b7    movq    [rsp + #96], R8	# spill
17bc    call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::checkMaskFromIndexSize @ bci:1 (line 3311) L[0]=rsp + #44 L[1]=rsp + #88 L[2]=_ L[3]=#1 L[4]=rsp + #60 STK[0]=rsp + #72
        # jdk.incubator.vector.IntVector::fromArray @ bci:51 (line 2727) L[0]=_ L[1]=rsp + #48 L[2]=rsp + #56 L[3]=rsp + #96 L[4]=rsp + #88 L[5]=_
        # App::micro_vector_masked @ bci:115 (line 52) L[0]=RBP L[1]=rsp + #24 L[2]=_ L[3]=rsp + #32 L[4]=rsp + #44 L[5]=_ L[6]=_ L[7]=rsp + #72
        # OopMap {rbp=Oop [24]=Oop [32]=Oop [48]=Oop [72]=Oop [88]=Oop [96]=Oop off=6084/0x17c4}
17c4    stop	# ShouldNotReachHere

17d8    B205: #	out( N2743 ) <- in( B76 )  Freq: 1e-35
17d8    movl    RSI, #-34	# int
17dd    movq    RBP, [rsp + #56]	# spill
17e2    movq    R11, [rsp + #40]	# spill
17e7    movq    [rsp + #32], R11	# spill
17ec    movq    [rsp + #40], RAX	# spill
17f1    movl    [rsp + #60], R10	# spill
        nop 	# 2 bytes pad for loops and calls
17f8    call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:1 (line 2720) L[0]=rsp + #60 L[1]=rsp + #32 L[2]=rsp + #24 L[3]=rsp + #72 L[4]=_ L[5]=_ STK[0]=rsp + #60
        # App::micro_vector_masked @ bci:129 (line 53) L[0]=_ L[1]=RBP L[2]=_ L[3]=_ L[4]=rsp + #24 L[5]=rsp + #40 L[6]=_ L[7]=rsp + #72
        # OopMap {rbp=Oop [32]=Oop [40]=Oop [60]=NarrowOop [72]=Oop off=6144/0x1800}
1800    stop	# ShouldNotReachHere

1814    B206: #	out( N2743 ) <- in( B105 )  Freq: 1e-35
1814    movl    RSI, #-34	# int
1819    movl    [rsp + #28], RCX	# spill
        nop 	# 3 bytes pad for loops and calls
1820    call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.Int256Vector::vec @ bci:4 (line 117) L[0]=_ STK[0]=rsp + #28
        # jdk.incubator.vector.IntVector::stOp @ bci:1 (line 351) L[0]=_ L[1]=rsp + #56 L[2]=rsp + #72 L[3]=rsp + #32 L[4]=#Ptr0x00007fd36829e060 L[5]=_ L[6]=_ L[7]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:41 (line 3006) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {[28]=NarrowOop [32]=Oop [56]=Oop off=6184/0x1828}
1828    stop	# ShouldNotReachHere

183c    B207: #	out( N2743 ) <- in( B107 )  Freq: 1e-35
183c    movl    RSI, #-34	# int
1841    movq    [rsp + #32], R9	# spill
1846    movl    [rsp + #28], R11	# spill
        nop 	# 1 bytes pad for loops and calls
184c    call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.Int256Vector$Int256Mask::getBits @ bci:4 (line 569) L[0]=_ STK[0]=rsp + #28
        # jdk.incubator.vector.IntVector::stOp @ bci:10 (line 352) L[0]=_ L[1]=rsp + #56 L[2]=rsp + #72 L[3]=_ L[4]=#Ptr0x00007fd36829e060 L[5]=rsp + #32 L[6]=_ L[7]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:41 (line 3006) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {[28]=NarrowOop [32]=Oop [56]=Oop off=6228/0x1854}
1854    stop	# ShouldNotReachHere

1868    B208: #	out( N2743 ) <- in( B1 )  Freq: 1.01328e-06
1868    movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
1870    call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector_masked @ bci:16 (line 43) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_ STK[0]=_ STK[1]=_ STK[2]=#NULL
        # OopMap {off=6264/0x1878}
1878    stop	# ShouldNotReachHere

188c    B209: #	out( N2743 ) <- in( B2 )  Freq: 1.01328e-06
188c    movl    RSI, #-10	# int
1891    movl    RBP, RBX	# spill
        nop 	# 1 bytes pad for loops and calls
1894    call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector_masked @ bci:17 (line 43) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_ STK[0]=_ STK[1]=#NULL STK[2]=RBP
        # OopMap {off=6300/0x189c}
189c    stop	# ShouldNotReachHere

18b0    B210: #	out( N2743 ) <- in( B61 )  Freq: 1.01324e-06
18b0    movl    RSI, #-12	# int
18b5    movq    RBP, [rsp + #24]	# spill
        nop 	# 2 bytes pad for loops and calls
18bc    call,static  wrapper for: uncommon_trap(reason='null_check' action='make_not_entrant' debug_id='0')
        # jdk.incubator.vector.VectorMask::fromArray @ bci:49 (line 208) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ STK[0]=#NULL
        # jdk.incubator.vector.VectorMask::fromValues @ bci:17 (line 183) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.VectorMask::fromLong @ bci:141 (line 259) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_ L[8]=_
        # App::micro_vector_masked @ bci:101 (line 51) L[0]=RBP L[1]=rsp + #56 L[2]=rsp + #64 L[3]=rsp + #40 L[4]=rsp + #72 L[5]=_ L[6]=_ L[7]=_
        # OopMap {rbp=Oop [40]=Oop [56]=Oop [64]=Oop off=6340/0x18c4}
18c4    stop	# ShouldNotReachHere

18d8    B211: #	out( N2743 ) <- in( B63 )  Freq: 1.01323e-06
18d8    movl    RSI, #-12	# int
18dd    movq    RBP, [rsp + #24]	# spill
18e2    movq    R10, [rsp + #56]	# spill
18e7    movq    [rsp + #24], R10	# spill
18ec    movq    R10, [rsp + #40]	# spill
18f1    movq    [rsp + #32], R10	# spill
18f6    movq    R10, [rsp + #64]	# spill
18fb    movq    [rsp + #48], R10	# spill
1900    movq    [rsp + #64], R8	# spill
        nop 	# 3 bytes pad for loops and calls
1908    call,static  wrapper for: uncommon_trap(reason='null_check' action='make_not_entrant' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:1 (line 2720) L[0]=#NULL L[1]=rsp + #48 L[2]=rsp + #72 L[3]=rsp + #64 L[4]=_ L[5]=_ STK[0]=#NULL
        # App::micro_vector_masked @ bci:115 (line 52) L[0]=RBP L[1]=rsp + #24 L[2]=_ L[3]=rsp + #32 L[4]=rsp + #72 L[5]=_ L[6]=_ L[7]=rsp + #64
        # OopMap {rbp=Oop [24]=Oop [32]=Oop [48]=Oop [64]=Oop off=6416/0x1910}
1910    stop	# ShouldNotReachHere

1924    B212: #	out( N2743 ) <- in( B66 )  Freq: 1.01323e-06
1924    movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
192c    call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:12 (line 2721) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ STK[0]=_ STK[1]=#NULL
        # App::micro_vector_masked @ bci:115 (line 52) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {off=6452/0x1934}
1934    stop	# ShouldNotReachHere

1948    B213: #	out( N2743 ) <- in( B75 )  Freq: 1.01321e-06
1948    movl    RSI, #-12	# int
194d    movq    RBP, [rsp + #56]	# spill
1952    movq    R10, [rsp + #40]	# spill
1957    movq    [rsp + #32], R10	# spill
195c    call,static  wrapper for: uncommon_trap(reason='null_check' action='make_not_entrant' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:1 (line 2720) L[0]=#NULL L[1]=rsp + #32 L[2]=rsp + #24 L[3]=rsp + #72 L[4]=_ L[5]=_ STK[0]=#NULL
        # App::micro_vector_masked @ bci:129 (line 53) L[0]=_ L[1]=RBP L[2]=_ L[3]=_ L[4]=rsp + #24 L[5]=rsp + #64 L[6]=_ L[7]=rsp + #72
        # OopMap {rbp=Oop [32]=Oop [64]=Oop [72]=Oop off=6500/0x1964}
1964    stop	# ShouldNotReachHere

1978    B214: #	out( N2743 ) <- in( B77 )  Freq: 1.01321e-06
1978    movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
1980    call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:12 (line 2721) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ STK[0]=_ STK[1]=#NULL
        # App::micro_vector_masked @ bci:129 (line 53) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {off=6536/0x1988}
1988    stop	# ShouldNotReachHere

199c    B215: #	out( N2743 ) <- in( B88 )  Freq: 1.01314e-06
199c    movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
19a4    call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_ STK[0]=#NULL STK[1]=rsp + #56 STK[2]=rsp + #72 STK[3]=rsp + #32
        # OopMap {[32]=Oop [56]=Oop off=6572/0x19ac}
19ac    stop	# ShouldNotReachHere

19c0    B216: #	out( N2743 ) <- in( B99 )  Freq: 1.01312e-07
19c0    movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
19c8    call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::checkMaskFromIndexSize @ bci:8 (line 3312) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ STK[0]=_ STK[1]=_ STK[2]=_ STK[3]=#NULL
        # jdk.incubator.vector.IntVector::intoArray @ bci:29 (line 3005) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {off=6608/0x19d0}
19d0    stop	# ShouldNotReachHere

19e4    B217: #	out( N2743 ) <- in( B104 )  Freq: 1.01312e-07
19e4    movl    RSI, #-12	# int
        nop 	# 3 bytes pad for loops and calls
19ec    call,static  wrapper for: uncommon_trap(reason='null_check' action='make_not_entrant' debug_id='0')
        # jdk.incubator.vector.Int256Vector::vec @ bci:4 (line 117) L[0]=_ STK[0]=#NULL
        # jdk.incubator.vector.IntVector::stOp @ bci:1 (line 351) L[0]=_ L[1]=rsp + #56 L[2]=rsp + #72 L[3]=rsp + #32 L[4]=#Ptr0x00007fd36829e060 L[5]=_ L[6]=_ L[7]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:41 (line 3006) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {[32]=Oop [56]=Oop off=6644/0x19f4}
19f4    stop	# ShouldNotReachHere

1a08    B218: #	out( N2743 ) <- in( B106 )  Freq: 1.01312e-07
1a08    movl    RSI, #-12	# int
1a0d    movq    [rsp + #32], R9	# spill
        nop 	# 2 bytes pad for loops and calls
1a14    call,static  wrapper for: uncommon_trap(reason='null_check' action='make_not_entrant' debug_id='0')
        # jdk.incubator.vector.Int256Vector$Int256Mask::getBits @ bci:4 (line 569) L[0]=_ STK[0]=#NULL
        # jdk.incubator.vector.IntVector::stOp @ bci:10 (line 352) L[0]=_ L[1]=rsp + #56 L[2]=rsp + #72 L[3]=_ L[4]=#Ptr0x00007fd36829e060 L[5]=rsp + #32 L[6]=_ L[7]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:41 (line 3006) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # App::micro_vector_masked @ bci:148 (line 54) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ L[7]=_
        # OopMap {[32]=Oop [56]=Oop off=6684/0x1a1c}
1a1c    stop	# ShouldNotReachHere

1a30    B219: #	out( B227 ) <- in( B153 )  Freq: 1.00009e-09
1a30    # exception oop is in rax; no code emitted
1a30    jmp     B227

1a35    B220: #	out( B229 ) <- in( B151 )  Freq: 1.00012e-09
1a35    # exception oop is in rax; no code emitted
1a35    jmp     B229

1a3a    B221: #	out( B230 ) <- in( B149 )  Freq: 1.01028e-09
1a3a    # exception oop is in rax; no code emitted
1a3a    movq    RSI, RAX	# spill
        nop 	# 3 bytes pad for loops and calls
1a40    jmp     B230

1a45    B222: #	out( B230 ) <- in( B98 )  Freq: 9.99864e-07
1a45    # exception oop is in rax; no code emitted
1a45    movq    RSI, RAX	# spill
1a48    jmp,s   B230

1a4a    B223: #	out( B230 ) <- in( B87 )  Freq: 9.99885e-06
1a4a    # exception oop is in rax; no code emitted
1a4a    movq    RSI, RAX	# spill
1a4d    jmp,s   B230

1a4f    B224: #	out( B230 ) <- in( B86 )  Freq: 9.99905e-06
1a4f    # exception oop is in rax; no code emitted
1a4f    movq    RSI, RAX	# spill
1a52    jmp,s   B230

1a54    B225: #	out( B230 ) <- in( B60 )  Freq: 9.99977e-06
1a54    # exception oop is in rax; no code emitted
1a54    movq    RSI, RAX	# spill
1a57    jmp,s   B230

1a59    B226: #	out( B227 ) <- in( B84 )  Freq: 9.99926e-06
1a59    # exception oop is in rax; no code emitted

1a59    B227: #	out( B230 ) <- in( B219 B226 )  Freq: 1.00003e-05
1a59    movq    RSI, RAX	# spill
1a5c    jmp,s   B230

1a5e    B228: #	out( B229 ) <- in( B74 )  Freq: 9.9995e-06
1a5e    # exception oop is in rax; no code emitted

1a5e    B229: #	out( B230 ) <- in( B220 B228 )  Freq: 1.00005e-05
1a5e    movq    RSI, RAX	# spill

1a61    B230: #	out( N2743 ) <- in( B224 B227 B229 B223 B221 B222 B225 )  Freq: 5.09993e-05
1a61    vzeroupper
	addq    rsp, 144	# Destroy frame
	popq    rbp

1a6c    jmp     rethrow_stub

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    2904  292             App::micro_vector_masked (152 bytes)
 total in heap  [0x00007fd3e11a6f90,0x00007fd3e11ab780] = 18416
 relocation     [0x00007fd3e11a7108,0x00007fd3e11a7520] = 1048
 main code      [0x00007fd3e11a7520,0x00007fd3e11a8fc0] = 6816
 stub code      [0x00007fd3e11a8fc0,0x00007fd3e11a9008] = 72
 oops           [0x00007fd3e11a9008,0x00007fd3e11a9050] = 72
 metadata       [0x00007fd3e11a9050,0x00007fd3e11a9268] = 536
 scopes data    [0x00007fd3e11a9268,0x00007fd3e11a9fb0] = 3400
 scopes pcs     [0x00007fd3e11a9fb0,0x00007fd3e11ab610] = 5728
 dependencies   [0x00007fd3e11ab610,0x00007fd3e11ab630] = 32
 handler table  [0x00007fd3e11ab630,0x00007fd3e11ab708] = 216
 nul chk table  [0x00007fd3e11ab708,0x00007fd3e11ab780] = 120

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Entry Point]
  # {method} {0x00007fd398811948} 'micro_vector_masked' '([I[I[I)V' in 'App'
  # this:     rsi:rsi   = 'App'
  # parm0:    rdx:rdx   = '[I'
  # parm1:    rcx:rcx   = '[I'
  # parm2:    r8:r8     = '[I'
  #           [sp+0xa0]  (sp of caller)
 ;; N2743: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fd3e11a7520:   mov    0x8(%rsi),%r10d
  0x00007fd3e11a7524:   movabs $0x800000000,%r11
  0x00007fd3e11a752e:   add    %r11,%r10
  0x00007fd3e11a7531:   cmp    %r10,%rax
  0x00007fd3e11a7534:   jne    0x00007fd3e1115920           ;   {runtime_call ic_miss_stub}
  0x00007fd3e11a753a:   nop
  0x00007fd3e11a753b:   nop
  0x00007fd3e11a753c:   nop
  0x00007fd3e11a753d:   nop
  0x00007fd3e11a753e:   nop
  0x00007fd3e11a753f:   nop
[Verified Entry Point]
 ;; B1: #	out( B208 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fd3e11a7540:   mov    %eax,-0x16000(%rsp)
  0x00007fd3e11a7547:   push   %rbp
  0x00007fd3e11a7548:   sub    $0x90,%rsp
  0x00007fd3e11a754f:   mov    %r8,%rax
  0x00007fd3e11a7552:   mov    %rsi,0x18(%rsp)
  0x00007fd3e11a7557:   mov    %rdx,0x38(%rsp)
  0x00007fd3e11a755c:   nop
  0x00007fd3e11a755d:   nop
  0x00007fd3e11a755e:   nop
  0x00007fd3e11a755f:   nop
  0x00007fd3e11a7560:   mov    0xc(%rdx),%ebx               ; implicit exception: dispatches to 0x00007fd3e11a8d88
                                                            ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B2: #	out( B209 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007fd3e11a7563:   mov    0xc(%rsi),%ebp               ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a7566:   mov    0x8(%r12,%rbp,8),%r10d       ; implicit exception: dispatches to 0x00007fd3e11a8dac
 ;; B3: #	out( B160 B4 ) <- in( B2 )  Freq: 0.999998
  0x00007fd3e11a756b:   cmp    $0x94b80,%r10d               ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {metadata('jdk/incubator/vector/IntVector$IntSpecies')}
  0x00007fd3e11a7572:   jne    0x00007fd3e11a842c
 ;; B4: #	out( B177 B5 ) <- in( B3 )  Freq: 0.999997
  0x00007fd3e11a7578:   lea    (%r12,%rbp,8),%r10           ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a757c:   mov    0xc(%r10),%r9d               ;*isub {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@42 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7580:   mov    %r9d,%esi
  0x00007fd3e11a7583:   dec    %esi
  0x00007fd3e11a7585:   mov    %r9d,%ebp
  0x00007fd3e11a7588:   and    %esi,%ebp
  0x00007fd3e11a758a:   test   %ebp,%ebp
  0x00007fd3e11a758c:   jne    0x00007fd3e11a8685
 ;; B5: #	out( B7 B6 ) <- in( B4 )  Freq: 0.999996
  0x00007fd3e11a7592:   andn   %ebx,%esi,%edi
  0x00007fd3e11a7597:   mov    %ebx,%edx
  0x00007fd3e11a7599:   add    $0xfffffff9,%edx
  0x00007fd3e11a759c:   nop
  0x00007fd3e11a759d:   nop
  0x00007fd3e11a759e:   nop
  0x00007fd3e11a759f:   nop
  0x00007fd3e11a75a0:   test   %edi,%edi
  0x00007fd3e11a75a2:   jg     0x00007fd3e11a75b2
 ;; B6: #	out( B19 ) <- in( B5 )  Freq: 0.250095
  0x00007fd3e11a75a4:   xor    %r11d,%r11d
  0x00007fd3e11a75a7:   mov    %rcx,%r14
  0x00007fd3e11a75aa:   mov    %r8,%r13
  0x00007fd3e11a75ad:   jmpq   0x00007fd3e11a7647
 ;; B7: #	out( B174 B8 ) <- in( B5 )  Freq: 0.749901
  0x00007fd3e11a75b2:   mov    %rcx,%r14
  0x00007fd3e11a75b5:   mov    0xc(%rcx),%r8d               ; implicit exception: dispatches to 0x00007fd3e11a8647
 ;; B8: #	out( B172 B9 ) <- in( B7 )  Freq: 0.7499
  0x00007fd3e11a75b9:   sub    %r9d,%r8d
  0x00007fd3e11a75bc:   inc    %r8d
  0x00007fd3e11a75bf:   nop
  0x00007fd3e11a75c0:   test   %r8d,%r8d
  0x00007fd3e11a75c3:   jl     0x00007fd3e11a863c           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B9: #	out( B173 B10 ) <- in( B8 )  Freq: 0.7499
  0x00007fd3e11a75c9:   mov    0x44(%r10),%r11d             ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@34 (line 3209)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a75cd:   mov    0x8(%r12,%r11,8),%ecx        ; implicit exception: dispatches to 0x00007fd3e11a8642
 ;; B10: #	out( B176 B11 ) <- in( B9 )  Freq: 0.749899
  0x00007fd3e11a75d2:   cmp    $0x98110,%ecx                ;   {metadata('jdk/incubator/vector/Int256Vector')}
  0x00007fd3e11a75d8:   jne    0x00007fd3e11a8680
 ;; B11: #	out( B175 B12 ) <- in( B10 )  Freq: 0.749898
  0x00007fd3e11a75de:   mov    %rax,%r13
  0x00007fd3e11a75e1:   mov    0xc(%rax),%eax               ; implicit exception: dispatches to 0x00007fd3e11a864a
 ;; B12: #	out( B175 B13 ) <- in( B11 )  Freq: 0.749897
  0x00007fd3e11a75e4:   sub    %r9d,%eax
  0x00007fd3e11a75e7:   inc    %eax
  0x00007fd3e11a75e9:   test   %eax,%eax                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a75eb:   jl     0x00007fd3e11a864a
 ;; B13: #	out( B175 B14 ) <- in( B12 )  Freq: 0.749897
  0x00007fd3e11a75f1:   test   %edx,%edx
  0x00007fd3e11a75f3:   jl     0x00007fd3e11a864a           ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
 ;; B14: #	out( B15 ) <- in( B13 )  Freq: 0.749896
  0x00007fd3e11a75f9:   mov    %edx,%ecx                    ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a75fb:   xor    %r11d,%r11d
  0x00007fd3e11a75fe:   nop
  0x00007fd3e11a75ff:   nop                                 ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
 ;; B15: #	out( B155 B16 ) <- in( B14 B18 ) Loop( B15-B18 inner ) Freq: 2.9984
  0x00007fd3e11a7600:   cmp    %r8d,%r11d
  0x00007fd3e11a7603:   jae    0x00007fd3e11a8325           ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
 ;; B16: #	out( B156 B17 ) <- in( B15 )  Freq: 2.9984
  0x00007fd3e11a7609:   vmovdqu 0x10(%r14,%r11,4),%ymm0     ;*invokevirtual dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7610:   cmp    %eax,%r11d
  0x00007fd3e11a7613:   jae    0x00007fd3e11a8370           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B17: #	out( B157 B18 ) <- in( B16 )  Freq: 2.9984
  0x00007fd3e11a7619:   vpaddd 0x10(%r13,%r11,4),%ymm0,%ymm0;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7620:   cmp    %ecx,%r11d
  0x00007fd3e11a7623:   jae    0x00007fd3e11a83c0
 ;; B18: #	out( B15 B19 ) <- in( B17 )  Freq: 2.99839
  0x00007fd3e11a7629:   mov    0x38(%rsp),%rbp              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a762e:   vmovdqu %ymm0,0x10(%rbp,%r11,4)     ;*invokevirtual opCodeRaw {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a7635:   mov    0x130(%r15),%rbp             ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a763c:   add    %r9d,%r11d                   ; ImmutableOopMap {r10=Oop r13=Oop r14=Oop [24]=Oop [56]=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector_masked@76 (line 43)
  0x00007fd3e11a763f:   test   %eax,0x0(%rbp)               ;   {poll}
  0x00007fd3e11a7642:   cmp    %edi,%r11d
  0x00007fd3e11a7645:   jl     0x00007fd3e11a7600
 ;; B19: #	out( B179 B20 ) <- in( B18 B6 )  Freq: 0.999982
  0x00007fd3e11a7647:   mov    %ebx,%ecx
  0x00007fd3e11a7649:   and    %esi,%ecx
  0x00007fd3e11a764b:   mov    $0x1,%r8d
  0x00007fd3e11a7651:   shl    %cl,%r8
  0x00007fd3e11a7654:   dec    %r8
  0x00007fd3e11a7657:   cmp    $0x40,%r9d
  0x00007fd3e11a765b:   nop
  0x00007fd3e11a765c:   nop
  0x00007fd3e11a765d:   nop
  0x00007fd3e11a765e:   nop
  0x00007fd3e11a765f:   nop
  0x00007fd3e11a7660:   jge    0x00007fd3e11a8734
 ;; B20: #	out( B180 B21 ) <- in( B19 )  Freq: 0.999982
  0x00007fd3e11a7666:   mov    $0x40,%ecx
  0x00007fd3e11a766b:   sub    %r9d,%ecx
  0x00007fd3e11a766e:   shl    %cl,%r8
  0x00007fd3e11a7671:   sar    %cl,%r8
  0x00007fd3e11a7674:   mov    %r8,%rsi
  0x00007fd3e11a7677:   sar    %rsi
  0x00007fd3e11a767a:   nop
  0x00007fd3e11a767b:   nop
  0x00007fd3e11a767c:   nop
  0x00007fd3e11a767d:   nop
  0x00007fd3e11a767e:   nop
  0x00007fd3e11a767f:   nop
  0x00007fd3e11a7680:   cmp    %rsi,%r8
  0x00007fd3e11a7683:   je     0x00007fd3e11a8784
 ;; B21: #	out( B158 B22 ) <- in( B20 )  Freq: 0.999981
  0x00007fd3e11a7689:   cmp    $0x100000,%r9d
  0x00007fd3e11a7690:   ja     0x00007fd3e11a8400           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B22: #	out( B23 ) <- in( B21 )  Freq: 0.99998
  0x00007fd3e11a7696:   movslq %r9d,%rcx                    ;*invokevirtual sameSpecies {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractVector::check@2 (line 124)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@7 (line 602)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
 ;; B23: #	out( B149 B24 ) <- in( B22 B158 )  Freq: 0.999981
  0x00007fd3e11a7699:   nop
  0x00007fd3e11a769a:   nop
  0x00007fd3e11a769b:   nop
  0x00007fd3e11a769c:   nop
  0x00007fd3e11a769d:   nop
  0x00007fd3e11a769e:   nop
  0x00007fd3e11a769f:   nop
  0x00007fd3e11a76a0:   cmp    $0x100000,%r9d
  0x00007fd3e11a76a7:   ja     0x00007fd3e11a8227           ;*invokevirtual opCodeRaw {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
 ;; B24: #	out( B149 B25 ) <- in( B23 )  Freq: 0.99998
  0x00007fd3e11a76ad:   mov    0x148(%r15),%rbp             ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a76b4:   add    $0x17,%rcx
  0x00007fd3e11a76b8:   mov    %rcx,%rdi
  0x00007fd3e11a76bb:   and    $0xfffffffffffffff8,%rdi
  0x00007fd3e11a76bf:   mov    %rbp,%rax
  0x00007fd3e11a76c2:   add    %rdi,%rax                    ;*invokevirtual opCodeRaw {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a76c5:   cmp    0x158(%r15),%rax             ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a76cc:   jae    0x00007fd3e11a8227           ;*invokevirtual opCodeRaw {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
 ;; B25: #	out( B26 ) <- in( B24 )  Freq: 0.99988
  0x00007fd3e11a76d2:   mov    %rax,0x148(%r15)
  0x00007fd3e11a76d9:   prefetchw 0xc0(%rax)
  0x00007fd3e11a76e0:   movq   $0x1,0x0(%rbp)
  0x00007fd3e11a76e8:   prefetchw 0x100(%rax)
  0x00007fd3e11a76ef:   movl   $0x40000,0x8(%rbp)           ;   {metadata({type array bool})}
  0x00007fd3e11a76f6:   mov    %r9d,0xc(%rbp)
  0x00007fd3e11a76fa:   prefetchw 0x140(%rax)
  0x00007fd3e11a7701:   mov    %rbp,%rdi
  0x00007fd3e11a7704:   add    $0x10,%rdi
  0x00007fd3e11a7708:   prefetchw 0x180(%rax)
  0x00007fd3e11a770f:   shr    $0x3,%rcx
  0x00007fd3e11a7713:   add    $0xfffffffffffffffe,%rcx
  0x00007fd3e11a7717:   xor    %rax,%rax
  0x00007fd3e11a771a:   cmp    $0x8,%rcx
  0x00007fd3e11a771e:   jg     0x00007fd3e11a7730
  0x00007fd3e11a7720:   dec    %rcx
  0x00007fd3e11a7723:   js     0x00007fd3e11a7737
 ;; LOOP:
  0x00007fd3e11a7725:   mov    %rax,(%rdi,%rcx,8)
  0x00007fd3e11a7729:   dec    %rcx
  0x00007fd3e11a772c:   jge    0x00007fd3e11a7725
  0x00007fd3e11a772e:   jmp    0x00007fd3e11a7737
 ;; LONG:
  0x00007fd3e11a7730:   shl    $0x3,%rcx
  0x00007fd3e11a7734:   rep rex.W stos %al,%es:(%rdi)
 ;; DONE:
 ;; B26: #	out( B95 B27 ) <- in( B150 B25 )  Freq: 0.999981
  0x00007fd3e11a7737:   mov    %rbp,%rcx
  0x00007fd3e11a773a:   mov    %r9d,%edi                    ;*invokevirtual vectorType {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@6 (line 3210)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a773d:   nop
  0x00007fd3e11a773e:   nop
  0x00007fd3e11a773f:   nop
  0x00007fd3e11a7740:   test   %edi,%edi
  0x00007fd3e11a7742:   jle    0x00007fd3e11a7e47
 ;; B27: #	out( B166 B28 ) <- in( B26 )  Freq: 0.888829
  0x00007fd3e11a7748:   test   %edi,%edi
  0x00007fd3e11a774a:   je     0x00007fd3e11a8568
 ;; B28: #	out( B165 B29 ) <- in( B27 )  Freq: 0.888828
  0x00007fd3e11a7750:   mov    %edi,0x20(%rsp)
  0x00007fd3e11a7754:   dec    %edi
  0x00007fd3e11a7756:   cmp    0x20(%rsp),%edi
  0x00007fd3e11a775a:   nop
  0x00007fd3e11a775b:   nop
  0x00007fd3e11a775c:   nop
  0x00007fd3e11a775d:   nop
  0x00007fd3e11a775e:   nop
  0x00007fd3e11a775f:   nop
  0x00007fd3e11a7760:   jae    0x00007fd3e11a8564
 ;; B29: #	out( B96 B30 ) <- in( B28 )  Freq: 0.888827
  0x00007fd3e11a7766:   test   $0x1,%r8
  0x00007fd3e11a776d:   je     0x00007fd3e11a7e69           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B30: #	out( B31 ) <- in( B29 )  Freq: 0.777675
  0x00007fd3e11a7773:   mov    $0x1,%r8d                    ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector_masked@59 (line 46)
 ;; B31: #	out( B167 B32 ) <- in( B96 B30 )  Freq: 0.888827
  0x00007fd3e11a7779:   mov    %r8b,0x10(%rcx)              ;*invokevirtual invokeBasic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
                                                            ; - jdk.incubator.vector.IntVector::intoArray@37 (line 2964)
                                                            ; - App::micro_vector_masked@59 (line 46)
  0x00007fd3e11a777d:   mov    0x20(%rsp),%r8d
  0x00007fd3e11a7782:   add    $0xfffffffd,%r8d
  0x00007fd3e11a7786:   mov    %r8d,%eax
  0x00007fd3e11a7789:   cmp    %r8d,%edi
  0x00007fd3e11a778c:   mov    $0x80000000,%r8d
  0x00007fd3e11a7792:   mov    %r8d,%edi
  0x00007fd3e11a7795:   mov    %eax,%r8d
  0x00007fd3e11a7798:   cmovl  %edi,%r8d
  0x00007fd3e11a779c:   mov    %r8d,0x24(%rsp)
  0x00007fd3e11a77a1:   cmp    $0x1,%r8d
  0x00007fd3e11a77a5:   jle    0x00007fd3e11a85bc
 ;; B32: #	out( B170 B33 ) <- in( B31 )  Freq: 0.888826
  0x00007fd3e11a77ab:   mov    0x20(%rsp),%r8d
  0x00007fd3e11a77b0:   cmp    $0x1,%r8d
  0x00007fd3e11a77b4:   jbe    0x00007fd3e11a8614
 ;; B33: #	out( B171 B34 ) <- in( B32 )  Freq: 0.888825
  0x00007fd3e11a77ba:   nop
  0x00007fd3e11a77bb:   nop
  0x00007fd3e11a77bc:   nop
  0x00007fd3e11a77bd:   nop
  0x00007fd3e11a77be:   nop
  0x00007fd3e11a77bf:   nop
  0x00007fd3e11a77c0:   cmp    $0x4,%r8d
  0x00007fd3e11a77c4:   jbe    0x00007fd3e11a8628
 ;; B34: #	out( B51 ) <- in( B33 )  Freq: 0.888824
  0x00007fd3e11a77ca:   mov    $0x1,%eax
  0x00007fd3e11a77cf:   jmpq   0x00007fd3e11a78d3           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B35: #	out( B36 ) <- in( B44 ) top-of-loop Freq: 62.9426
  0x00007fd3e11a77d4:   mov    $0x1,%r11d                   ;*invokevirtual elementType {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@10 (line 3210)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
 ;; B36: #	out( B49 B37 ) <- in( B45 B35 ) top-of-loop Freq: 71.9389
  0x00007fd3e11a77da:   sar    %rsi
  0x00007fd3e11a77dd:   mov    %rsi,%rdx                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a77e0:   movslq %eax,%rcx                    ;*invokevirtual maskType {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@21 (line 209)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
  0x00007fd3e11a77e3:   vmovq  %xmm2,%rsi                   ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a77e8:   mov    %r8b,0x10(%rsi,%rcx,1)
  0x00007fd3e11a77ed:   mov    %dil,0x11(%rsi,%rcx,1)       ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
  0x00007fd3e11a77f2:   mov    %r9b,0x12(%rsi,%rcx,1)       ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector_masked@17 (line 43)
  0x00007fd3e11a77f7:   mov    %r11b,0x13(%rsi,%rcx,1)      ;*invokevirtual invokeBasic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@26 (line 3211)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a77fc:   sar    %rdx
  0x00007fd3e11a77ff:   mov    %rdx,%r8
  0x00007fd3e11a7802:   add    $0x4,%eax
  0x00007fd3e11a7805:   cmp    %ebp,%eax
  0x00007fd3e11a7807:   jge    0x00007fd3e11a78ad
 ;; B37: #	out( B38 ) <- in( B36 )  Freq: 63.9426
  0x00007fd3e11a780d:   vmovd  %xmm1,%r9d
  0x00007fd3e11a7812:   vmovd  %xmm0,%edx
  0x00007fd3e11a7816:   vmovd  %xmm3,%r11d
  0x00007fd3e11a781b:   mov    %r8,%rsi
  0x00007fd3e11a781e:   vmovq  %xmm2,%rcx
 ;; B38: #	out( B46 B39 ) <- in( B51 B37 ) Loop( B38-B37 inner main of N526 strip mined) Freq: 71.9389
  0x00007fd3e11a7823:   test   $0x1,%rsi
  0x00007fd3e11a782a:   je     0x00007fd3e11a789f           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B39: #	out( B40 ) <- in( B38 )  Freq: 62.9426
  0x00007fd3e11a7830:   mov    $0x1,%r8d                    ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
 ;; B40: #	out( B47 B41 ) <- in( B46 B39 )  Freq: 71.9389
  0x00007fd3e11a7836:   mov    %rsi,%rdi
  0x00007fd3e11a7839:   shr    %rdi
  0x00007fd3e11a783c:   nop
  0x00007fd3e11a783d:   nop
  0x00007fd3e11a783e:   nop
  0x00007fd3e11a783f:   nop
  0x00007fd3e11a7840:   test   $0x1,%rdi
  0x00007fd3e11a7847:   je     0x00007fd3e11a78a4           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B41: #	out( B42 ) <- in( B40 )  Freq: 62.9426
  0x00007fd3e11a784d:   mov    $0x1,%edi                    ;*invokestatic checkFromIndexSize {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
 ;; B42: #	out( B48 B43 ) <- in( B47 B41 )  Freq: 71.9389
  0x00007fd3e11a7852:   vmovq  %rcx,%xmm2
  0x00007fd3e11a7857:   vmovd  %r11d,%xmm3
  0x00007fd3e11a785c:   vmovd  %edx,%xmm0
  0x00007fd3e11a7860:   vmovd  %r9d,%xmm1
  0x00007fd3e11a7865:   sar    %rsi
  0x00007fd3e11a7868:   mov    %rsi,%r11
  0x00007fd3e11a786b:   shr    %r11
  0x00007fd3e11a786e:   test   $0x1,%r11
  0x00007fd3e11a7875:   je     0x00007fd3e11a78a8           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B43: #	out( B44 ) <- in( B42 )  Freq: 62.9426
  0x00007fd3e11a787b:   mov    $0x1,%r9d                    ;*getfield laneCount {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
                                                            ; - App::micro_vector_masked@17 (line 43)
 ;; B44: #	out( B35 B45 ) <- in( B48 B43 )  Freq: 71.9389
  0x00007fd3e11a7881:   sar    %rsi
  0x00007fd3e11a7884:   mov    %rsi,%r11
  0x00007fd3e11a7887:   shr    %r11
  0x00007fd3e11a788a:   test   $0x1,%r11                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7891:   jne    0x00007fd3e11a77d4
 ;; B45: #	out( B36 ) <- in( B44 )  Freq: 8.99629
  0x00007fd3e11a7897:   xor    %r11d,%r11d
  0x00007fd3e11a789a:   jmpq   0x00007fd3e11a77da
 ;; B46: #	out( B40 ) <- in( B38 )  Freq: 8.99629
  0x00007fd3e11a789f:   xor    %r8d,%r8d
  0x00007fd3e11a78a2:   jmp    0x00007fd3e11a7836
 ;; B47: #	out( B42 ) <- in( B40 )  Freq: 8.99629
  0x00007fd3e11a78a4:   xor    %edi,%edi
  0x00007fd3e11a78a6:   jmp    0x00007fd3e11a7852
 ;; B48: #	out( B44 ) <- in( B42 )  Freq: 8.99629
  0x00007fd3e11a78a8:   xor    %r9d,%r9d
  0x00007fd3e11a78ab:   jmp    0x00007fd3e11a7881           ;*invokevirtual opCodeRaw {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
 ;; B49: #	out( B52 B50 ) <- in( B36 )  Freq: 7.99631
  0x00007fd3e11a78ad:   mov    0x130(%r15),%r11             ; ImmutableOopMap {r10=Oop rsi=Oop r13=Oop r14=Oop xmm2=Oop [24]=Oop [56]=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.VectorMask::fromLong@135 (line 255)
                                                            ; - App::micro_vector_masked@101 (line 51)
  0x00007fd3e11a78b4:   test   %eax,(%r11)                  ;   {poll}
  0x00007fd3e11a78b7:   cmp    0x24(%rsp),%eax
  0x00007fd3e11a78bb:   jge    0x00007fd3e11a78fd
 ;; B50: #	out( B51 ) <- in( B49 )  Freq: 7.10749
  0x00007fd3e11a78bd:   vmovd  %xmm1,%r9d
  0x00007fd3e11a78c2:   vmovd  %xmm0,%edx
  0x00007fd3e11a78c6:   vmovd  %xmm3,%r11d
  0x00007fd3e11a78cb:   mov    %r8,%rsi
  0x00007fd3e11a78ce:   vmovq  %xmm2,%rcx
 ;; B51: #	out( B38 ) <- in( B34 B50 ) Loop( B51-B50 ) Freq: 7.99631
  0x00007fd3e11a78d3:   mov    0x24(%rsp),%ebp
  0x00007fd3e11a78d7:   sub    %eax,%ebp
  0x00007fd3e11a78d9:   mov    0x24(%rsp),%edi
  0x00007fd3e11a78dd:   xor    %r8d,%r8d
  0x00007fd3e11a78e0:   cmp    %eax,%edi
  0x00007fd3e11a78e2:   cmovl  %r8d,%ebp
  0x00007fd3e11a78e6:   cmp    $0xfa0,%ebp
  0x00007fd3e11a78ec:   mov    $0xfa0,%r8d
  0x00007fd3e11a78f2:   cmova  %r8d,%ebp
  0x00007fd3e11a78f6:   add    %eax,%ebp
  0x00007fd3e11a78f8:   jmpq   0x00007fd3e11a7823
 ;; B52: #	out( B53 ) <- in( B49 )  Freq: 0.888824
  0x00007fd3e11a78fd:   vmovd  %xmm1,%r9d
  0x00007fd3e11a7902:   vmovd  %xmm0,%edx
  0x00007fd3e11a7906:   vmovd  %xmm3,%r11d
  0x00007fd3e11a790b:   mov    %r8,%rsi
  0x00007fd3e11a790e:   vmovq  %xmm2,%rcx
 ;; B53: #	out( B59 B54 ) <- in( B167 B52 )  Freq: 0.888825
  0x00007fd3e11a7913:   cmp    0x20(%rsp),%eax
  0x00007fd3e11a7917:   jge    0x00007fd3e11a794b           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B54: #	out( B55 ) <- in( B53 )  Freq: 0.444413
  0x00007fd3e11a7919:   nop
  0x00007fd3e11a791a:   nop
  0x00007fd3e11a791b:   nop                                 ;*invokestatic arrayAddress {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@31 (line 2964)
                                                            ; - App::micro_vector_masked@59 (line 46)
 ;; B55: #	out( B97 B56 ) <- in( B54 B58 ) Loop( B55-B58 inner post of N1170) Freq: 0.888825
  0x00007fd3e11a791c:   nop
  0x00007fd3e11a791d:   nop
  0x00007fd3e11a791e:   nop
  0x00007fd3e11a791f:   nop
  0x00007fd3e11a7920:   test   $0x1,%rsi
  0x00007fd3e11a7927:   je     0x00007fd3e11a7e71           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B56: #	out( B57 ) <- in( B55 )  Freq: 0.777674
  0x00007fd3e11a792d:   mov    $0x1,%r8d                    ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@37 (line 2964)
                                                            ; - App::micro_vector_masked@59 (line 46)
 ;; B57: #	out( B59 B58 ) <- in( B97 B56 )  Freq: 0.888825
  0x00007fd3e11a7933:   mov    %r8b,0x10(%rcx,%rax,1)
  0x00007fd3e11a7938:   inc    %eax
  0x00007fd3e11a793a:   nop
  0x00007fd3e11a793b:   nop
  0x00007fd3e11a793c:   nop
  0x00007fd3e11a793d:   nop
  0x00007fd3e11a793e:   nop
  0x00007fd3e11a793f:   nop
  0x00007fd3e11a7940:   cmp    0x20(%rsp),%eax
  0x00007fd3e11a7944:   jge    0x00007fd3e11a794b           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B58: #	out( B55 ) <- in( B57 )  Freq: 0.444413
  0x00007fd3e11a7946:   sar    %rsi
  0x00007fd3e11a7949:   jmp    0x00007fd3e11a791c
 ;; B59: #	out( B60 ) <- in( B57 B53 )  Freq: 0.888825
  0x00007fd3e11a794b:   mov    %r14,0x40(%rsp)
  0x00007fd3e11a7950:   mov    %r13,0x28(%rsp)
  0x00007fd3e11a7955:   mov    %ebx,0x50(%rsp)
  0x00007fd3e11a7959:   mov    %r9d,%r8d
  0x00007fd3e11a795c:   mov    %edx,0x54(%rsp)
  0x00007fd3e11a7960:   mov    %r11d,0x48(%rsp)
  0x00007fd3e11a7965:   mov    %rcx,%rbx                    ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@8 (line 2689)
                                                            ; - App::micro_vector_masked@44 (line 45)
 ;; B60: #	out( B225 B61 ) <- in( B59 B95 )  Freq: 0.999977
  0x00007fd3e11a7968:   mov    0x30(%r10),%r11d
  0x00007fd3e11a796c:   mov    %r11,%rsi
  0x00007fd3e11a796f:   push   %r10
  0x00007fd3e11a7971:   cmp    0xcbbfef8(%rip),%r12        # 0x00007fd3edd67870
                                                            ;   {external_word}
  0x00007fd3e11a7978:   je     0x00007fd3e11a7992
 ;; MacroAssembler::decode_heap_oop: heap base corrupted?
  0x00007fd3e11a797e:   movabs $0x7fd3ed315180,%rdi         ;   {external_word}
  0x00007fd3e11a7988:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a798c:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a7991:   hlt    
  0x00007fd3e11a7992:   pop    %r10
  0x00007fd3e11a7994:   shl    $0x3,%rsi                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7998:   mov    $0x10,%r9d
  0x00007fd3e11a799e:   movabs $0x1010002b0,%rdx            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@8 (line 2689)
                                                            ; - App::micro_vector_masked@44 (line 45)
                                                            ;   {oop(a 'java/lang/Class'{0x00000001010002b0} = int)}
  0x00007fd3e11a79a8:   mov    %r8d,%ecx
  0x00007fd3e11a79ab:   mov    %rbx,%r8
  0x00007fd3e11a79ae:   mov    %rbx,%rdi
  0x00007fd3e11a79b1:   xor    %r11d,%r11d
  0x00007fd3e11a79b4:   mov    %r11d,(%rsp)
  0x00007fd3e11a79b8:   mov    %r10,0x8(%rsp)
  0x00007fd3e11a79bd:   movabs $0x101be6120,%r10            ;   {oop(a 'jdk/incubator/vector/VectorMask$$Lambda$53+0x00000008000aa6e0'{0x0000000101be6120})}
  0x00007fd3e11a79c7:   mov    %r10,0x10(%rsp)
  0x00007fd3e11a79cc:   vzeroupper 
  0x00007fd3e11a79cf:   callq  0x00007fd3e1195ce0           ; ImmutableOopMap {[24]=Oop [40]=Oop [56]=Oop [64]=Oop }
                                                            ;*invokestatic load {reexecute=0 rethrow=0 return_oop=1}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@46 (line 208)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
                                                            ;   {static_call}
 ;; B61: #	out( B210 B62 ) <- in( B60 )  Freq: 0.999957
  0x00007fd3e11a79d4:   mov    0x8(%rax),%r10d              ; implicit exception: dispatches to 0x00007fd3e11a8dd0
 ;; B62: #	out( B161 B63 ) <- in( B61 )  Freq: 0.999956
  0x00007fd3e11a79d8:   movabs $0x800096638,%r11            ;   {metadata('jdk/incubator/vector/VectorMask')}
  0x00007fd3e11a79e2:   movabs $0x800000000,%r8
  0x00007fd3e11a79ec:   add    %r10,%r8
  0x00007fd3e11a79ef:   mov    0x50(%r8),%r10
  0x00007fd3e11a79f3:   cmp    %r11,%r10                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a79f6:   jne    0x00007fd3e11a8460
 ;; B63: #	out( B211 B64 ) <- in( B62 )  Freq: 0.999955
  0x00007fd3e11a79fc:   mov    %rax,%r8                     ;*invokestatic arrayAddress {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@20 (line 3211)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a79ff:   mov    0x18(%rsp),%rax              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7a04:   mov    0xc(%rax),%ebp               ;*invokevirtual fromArray0 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a7a07:   mov    0x8(%r12,%rbp,8),%r11d       ; implicit exception: dispatches to 0x00007fd3e11a8df8
 ;; B64: #	out( B203 B65 ) <- in( B63 )  Freq: 0.999954
  0x00007fd3e11a7a0c:   cmp    $0x94b80,%r11d               ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {metadata('jdk/incubator/vector/IntVector$IntSpecies')}
  0x00007fd3e11a7a13:   jne    0x00007fd3e11a8c38
 ;; B65: #	out( B178 B66 ) <- in( B64 )  Freq: 0.999954
  0x00007fd3e11a7a19:   lea    (%r12,%rbp,8),%rbx           ;*invokestatic arrayAddress {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@20 (line 3211)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7a1d:   mov    0x48(%rsp),%r9d
  0x00007fd3e11a7a22:   test   %r9d,%r9d
  0x00007fd3e11a7a25:   jl     0x00007fd3e11a86c0
 ;; B66: #	out( B212 B67 ) <- in( B65 )  Freq: 0.999954
  0x00007fd3e11a7a2b:   mov    0x40(%rsp),%rdi
  0x00007fd3e11a7a30:   mov    0xc(%rdi),%r11d              ; implicit exception: dispatches to 0x00007fd3e11a8e44
                                                            ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B67: #	out( B181 B68 ) <- in( B66 )  Freq: 0.999953
  0x00007fd3e11a7a34:   mov    0xc(%rbx),%ecx               ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a7a37:   mov    %r11d,%ebp
  0x00007fd3e11a7a3a:   sub    %ecx,%ebp
  0x00007fd3e11a7a3c:   nop
  0x00007fd3e11a7a3d:   nop
  0x00007fd3e11a7a3e:   nop
  0x00007fd3e11a7a3f:   nop
  0x00007fd3e11a7a40:   cmp    %ebp,%r9d
  0x00007fd3e11a7a43:   jle    0x00007fd3e11a87e0           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B68: #	out( B204 B69 ) <- in( B67 )  Freq: 0.999952
  0x00007fd3e11a7a49:   mov    0x8(%r8),%r10d               ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@10 (line 775)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a7a4d:   cmp    $0x98750,%r10d               ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {metadata('jdk/incubator/vector/Int256Vector$Int256Mask')}
  0x00007fd3e11a7a54:   jne    0x00007fd3e11a8c7c
 ;; B69: #	out( B182 B70 ) <- in( B68 )  Freq: 0.999952
  0x00007fd3e11a7a5a:   mov    %r8,%rdx                     ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7a5d:   mov    0x2c(%rbx),%ebp              ;*invokevirtual dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a7a60:   cmp    $0x20311f82,%ebp             ;   {oop(a 'java/lang/Class'{0x000000010188fc10} = 'jdk/incubator/vector/IntMaxVector')}
  0x00007fd3e11a7a66:   je     0x00007fd3e11a8844           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B70: #	out( B162 B71 ) <- in( B69 )  Freq: 0.999952
  0x00007fd3e11a7a6c:   mov    0x1c(%rbx),%ebp              ;*ladd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::arrayAddress@9 (line 3349)
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@20 (line 3211)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7a6f:   cmp    $0x100,%ebp
  0x00007fd3e11a7a75:   jne    0x00007fd3e11a8484           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B71: #	out( B183 B72 ) <- in( B70 )  Freq: 0.999951
  0x00007fd3e11a7a7b:   mov    0xc(%rdx),%r10d              ;*invokevirtual length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@222 (line 634)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a7a7f:   mov    %r11d,%esi
  0x00007fd3e11a7a82:   sub    0x48(%rsp),%esi
  0x00007fd3e11a7a86:   vmovq  0x10(%r12,%r10,8),%xmm0
  0x00007fd3e11a7a8d:   movabs $0x101964de8,%r10            ;   {oop([I{0x0000000101964de8})}
  0x00007fd3e11a7a97:   vmovdqu 0x10(%r10),%ymm1
  0x00007fd3e11a7a9d:   cmp    $0x8,%esi                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7aa0:   mov    $0x8,%r10d
  0x00007fd3e11a7aa6:   cmovge %r10d,%esi                   ;*invokespecial dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a7aaa:   xor    %ecx,%ecx
  0x00007fd3e11a7aac:   test   %esi,%esi
  0x00007fd3e11a7aae:   cmovle %ecx,%esi
  0x00007fd3e11a7ab1:   vmovd  %esi,%xmm2
  0x00007fd3e11a7ab5:   vpbroadcastd %xmm2,%ymm2
  0x00007fd3e11a7aba:   vpcmpeqb %ymm4,%ymm4,%ymm4
  0x00007fd3e11a7abe:   vpxor  %ymm3,%ymm3,%ymm3
  0x00007fd3e11a7ac2:   vpsubb %ymm0,%ymm3,%ymm3
  0x00007fd3e11a7ac6:   vpmovsxbd %xmm3,%ymm3
  0x00007fd3e11a7acb:   vpcmpgtd %ymm1,%ymm2,%ymm0
  0x00007fd3e11a7acf:   vpxor  -0x120537(%rip),%ymm0,%ymm0        # Stub::vector_all_bits_set
                                                            ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {external_word}
  0x00007fd3e11a7ad7:   vpand  %ymm3,%ymm0,%ymm0            ;*invokevirtual invokeBasic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@26 (line 3211)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7adb:   vptest %ymm4,%ymm0
  0x00007fd3e11a7ae0:   setne  %bpl
  0x00007fd3e11a7ae4:   movzbl %bpl,%ebp
  0x00007fd3e11a7ae8:   test   %ebp,%ebp                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7aea:   jne    0x00007fd3e11a88b4
 ;; B72: #	out( B151 B73 ) <- in( B71 )  Freq: 0.99995
  0x00007fd3e11a7af0:   mov    0x148(%r15),%rcx
  0x00007fd3e11a7af7:   mov    %rcx,%r10
  0x00007fd3e11a7afa:   add    $0x18,%r10                   ;*invokevirtual opCodeRaw {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a7afe:   nop
  0x00007fd3e11a7aff:   nop
  0x00007fd3e11a7b00:   cmp    0x158(%r15),%r10             ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7b07:   jae    0x00007fd3e11a82a5           ;*invokevirtual opCodeRaw {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
 ;; B73: #	out( B74 ) <- in( B72 )  Freq: 0.99985
  0x00007fd3e11a7b0d:   mov    %r10,0x148(%r15)
  0x00007fd3e11a7b14:   prefetchw 0xc0(%r10)
  0x00007fd3e11a7b1c:   movq   $0x1,(%rcx)
  0x00007fd3e11a7b23:   movl   $0xacb58,0x8(%rcx)           ;   {metadata('jdk/incubator/vector/IntVector$$Lambda$63+0x00000008000acb58')}
  0x00007fd3e11a7b2a:   mov    %r12d,0x14(%rcx)
  0x00007fd3e11a7b2e:   mov    0x18(%rsp),%rbp
  0x00007fd3e11a7b33:   mov    %r8,0x30(%rsp)
  0x00007fd3e11a7b38:   mov    %rbx,0x40(%rsp)
  0x00007fd3e11a7b3d:   mov    %rdx,0x48(%rsp)
  0x00007fd3e11a7b42:   vmovdqu %ymm4,0x60(%rsp)            ;*ifeq {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@16 (line 775)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
 ;; B74: #	out( B228 B75 ) <- in( B152 B73 )  Freq: 0.99995
  0x00007fd3e11a7b48:   mov    %r9d,0xc(%rcx)               ;*invokevirtual opCode {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a7b4c:   mov    %r9d,0x18(%rsp)
  0x00007fd3e11a7b51:   push   %r10
  0x00007fd3e11a7b53:   cmp    0xcbbfd16(%rip),%r12        # 0x00007fd3edd67870
                                                            ;   {external_word}
  0x00007fd3e11a7b5a:   je     0x00007fd3e11a7b74
 ;; MacroAssembler::encode_heap_oop_not_null2: heap base corrupted?
  0x00007fd3e11a7b60:   movabs $0x7fd3ed3150d0,%rdi         ;   {external_word}
  0x00007fd3e11a7b6a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a7b6e:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a7b73:   hlt    
  0x00007fd3e11a7b74:   pop    %r10
  0x00007fd3e11a7b76:   test   %rdi,%rdi
  0x00007fd3e11a7b79:   jne    0x00007fd3e11a7b93
 ;; null oop passed to encode_heap_oop_not_null2
  0x00007fd3e11a7b7f:   movabs $0x7fd3ed315110,%rdi         ;   {external_word}
  0x00007fd3e11a7b89:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a7b8d:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a7b92:   hlt    
  0x00007fd3e11a7b93:   mov    %rdi,%r10
  0x00007fd3e11a7b96:   shr    $0x3,%r10                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7b9a:   mov    %r10d,0x10(%rcx)             ;*synchronization entry
                                                            ; - jdk.incubator.vector.Int256Vector::vspecies@-1 (line 86)
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@1 (line 3208)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a7b9e:   mov    0x40(%rsp),%rsi
  0x00007fd3e11a7ba3:   mov    0x48(%rsp),%rdx
  0x00007fd3e11a7ba8:   vzeroupper 
  0x00007fd3e11a7bab:   callq  0x00007fd3e1191f80           ; ImmutableOopMap {rbp=Oop [40]=Oop [48]=Oop [56]=Oop [72]=Oop }
                                                            ;*invokevirtual vOp {reexecute=0 rethrow=0 return_oop=1}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@64 (line 2728)
                                                            ; - App::micro_vector_masked@115 (line 52)
                                                            ;   {optimized virtual_call}
 ;; B75: #	out( B213 B76 ) <- in( B74 )  Freq: 0.99993
  0x00007fd3e11a7bb0:   mov    %rax,0x40(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7bb5:   mov    0xc(%rbp),%r10d              ;*synchronization entry
                                                            ; - App::micro_vector_masked@-1 (line 32)
  0x00007fd3e11a7bb9:   nop
  0x00007fd3e11a7bba:   nop
  0x00007fd3e11a7bbb:   nop
  0x00007fd3e11a7bbc:   nop
  0x00007fd3e11a7bbd:   nop
  0x00007fd3e11a7bbe:   nop
  0x00007fd3e11a7bbf:   nop
  0x00007fd3e11a7bc0:   mov    0x8(%r12,%r10,8),%r11d       ; implicit exception: dispatches to 0x00007fd3e11a8e68
 ;; B76: #	out( B205 B77 ) <- in( B75 )  Freq: 0.999929
  0x00007fd3e11a7bc5:   cmp    $0x94b80,%r11d               ;   {metadata('jdk/incubator/vector/IntVector$IntSpecies')}
  0x00007fd3e11a7bcc:   jne    0x00007fd3e11a8cf8
 ;; B77: #	out( B214 B78 ) <- in( B76 )  Freq: 0.999929
  0x00007fd3e11a7bd2:   mov    0x28(%rsp),%r8               ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7bd7:   mov    0xc(%r8),%r11d               ; implicit exception: dispatches to 0x00007fd3e11a8e98
 ;; B78: #	out( B184 B79 ) <- in( B77 )  Freq: 0.999928
  0x00007fd3e11a7bdb:   lea    (%r12,%r10,8),%rbx           ;*invokevirtual dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7bdf:   mov    0xc(%rbx),%r9d               ;*ifnull {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 296)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a7be3:   mov    %r11d,%ebp
  0x00007fd3e11a7be6:   sub    %r9d,%ebp
  0x00007fd3e11a7be9:   mov    0x18(%rsp),%r10d
  0x00007fd3e11a7bee:   cmp    %ebp,%r10d
  0x00007fd3e11a7bf1:   jle    0x00007fd3e11a8924           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B79: #	out( B185 B80 ) <- in( B78 )  Freq: 0.999928
  0x00007fd3e11a7bf7:   mov    0x2c(%rbx),%ebp              ;*ifnull {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 296)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a7bfa:   nop
  0x00007fd3e11a7bfb:   nop
  0x00007fd3e11a7bfc:   nop
  0x00007fd3e11a7bfd:   nop
  0x00007fd3e11a7bfe:   nop
  0x00007fd3e11a7bff:   nop
  0x00007fd3e11a7c00:   cmp    $0x20311f82,%ebp             ;   {oop(a 'java/lang/Class'{0x000000010188fc10} = 'jdk/incubator/vector/IntMaxVector')}
  0x00007fd3e11a7c06:   je     0x00007fd3e11a8964           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B80: #	out( B163 B81 ) <- in( B79 )  Freq: 0.999927
  0x00007fd3e11a7c0c:   mov    0x1c(%rbx),%ebp              ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7c0f:   cmp    $0x100,%ebp
  0x00007fd3e11a7c15:   jne    0x00007fd3e11a84f4
 ;; B81: #	out( B186 B82 ) <- in( B80 )  Freq: 0.999926
  0x00007fd3e11a7c1b:   mov    %r11d,%edi
  0x00007fd3e11a7c1e:   sub    %r10d,%edi
  0x00007fd3e11a7c21:   mov    0x48(%rsp),%rdx              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7c26:   mov    0xc(%rdx),%ecx               ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@24 (line 775)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a7c29:   movabs $0x101964de8,%r9             ;   {oop([I{0x0000000101964de8})}
  0x00007fd3e11a7c33:   vmovdqu 0x10(%r9),%ymm1
  0x00007fd3e11a7c39:   vmovq  0x10(%r12,%rcx,8),%xmm0
  0x00007fd3e11a7c40:   cmp    $0x8,%edi                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7c43:   mov    $0x8,%r9d
  0x00007fd3e11a7c49:   cmovge %r9d,%edi                    ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a7c4d:   xor    %ecx,%ecx
  0x00007fd3e11a7c4f:   test   %edi,%edi
  0x00007fd3e11a7c51:   cmovle %ecx,%edi
  0x00007fd3e11a7c54:   vmovd  %edi,%xmm2
  0x00007fd3e11a7c58:   vpbroadcastd %xmm2,%ymm2
  0x00007fd3e11a7c5d:   vpcmpgtd %ymm1,%ymm2,%ymm1
  0x00007fd3e11a7c61:   vpxor  -0x1206c9(%rip),%ymm1,%ymm1        # Stub::vector_all_bits_set
                                                            ;   {external_word}
  0x00007fd3e11a7c69:   vpxor  %ymm2,%ymm2,%ymm2
  0x00007fd3e11a7c6d:   vpsubb %ymm0,%ymm2,%ymm2
  0x00007fd3e11a7c71:   vpmovsxbd %xmm2,%ymm2               ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7c76:   vpand  %ymm2,%ymm1,%ymm1            ;*invokevirtual dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7c7a:   vmovdqu 0x60(%rsp),%ymm0
  0x00007fd3e11a7c80:   vptest %ymm0,%ymm1
  0x00007fd3e11a7c85:   setne  %bpl
  0x00007fd3e11a7c89:   movzbl %bpl,%ebp
  0x00007fd3e11a7c8d:   test   %ebp,%ebp                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7c8f:   jne    0x00007fd3e11a89a8
 ;; B82: #	out( B153 B83 ) <- in( B81 )  Freq: 0.999926
  0x00007fd3e11a7c95:   mov    0x148(%r15),%rcx
  0x00007fd3e11a7c9c:   mov    %rcx,%r11
  0x00007fd3e11a7c9f:   add    $0x18,%r11                   ;*invokevirtual opCodeRaw {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a7ca3:   cmp    0x158(%r15),%r11             ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7caa:   jae    0x00007fd3e11a82ee           ;*invokevirtual opCodeRaw {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
 ;; B83: #	out( B84 ) <- in( B82 )  Freq: 0.999826
  0x00007fd3e11a7cb0:   mov    %r11,0x148(%r15)
  0x00007fd3e11a7cb7:   prefetchw 0xc0(%r11)
  0x00007fd3e11a7cbf:   movq   $0x1,(%rcx)
  0x00007fd3e11a7cc6:   movl   $0xacb58,0x8(%rcx)           ;   {metadata('jdk/incubator/vector/IntVector$$Lambda$63+0x00000008000acb58')}
  0x00007fd3e11a7ccd:   mov    %r12d,0x14(%rcx)
  0x00007fd3e11a7cd1:   rex.W pushq 0x48(%rsp)
  0x00007fd3e11a7cd6:   rex.W popq 0x20(%rsp)
  0x00007fd3e11a7cdb:   mov    %rbx,0x28(%rsp)              ;*if_icmpne {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@26 (line 775)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
 ;; B84: #	out( B226 B85 ) <- in( B154 B83 )  Freq: 0.999926
  0x00007fd3e11a7ce0:   mov    %r10d,0xc(%rcx)              ;*invokevirtual opCode {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a7ce4:   mov    %r10d,0x48(%rsp)
  0x00007fd3e11a7ce9:   push   %r10
  0x00007fd3e11a7ceb:   cmp    0xcbbfb7e(%rip),%r12        # 0x00007fd3edd67870
                                                            ;   {external_word}
  0x00007fd3e11a7cf2:   je     0x00007fd3e11a7d0c
 ;; MacroAssembler::encode_heap_oop_not_null2: heap base corrupted?
  0x00007fd3e11a7cf8:   movabs $0x7fd3ed3150d0,%rdi         ;   {external_word}
  0x00007fd3e11a7d02:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a7d06:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a7d0b:   hlt    
  0x00007fd3e11a7d0c:   pop    %r10
  0x00007fd3e11a7d0e:   test   %r8,%r8
  0x00007fd3e11a7d11:   jne    0x00007fd3e11a7d2b
 ;; null oop passed to encode_heap_oop_not_null2
  0x00007fd3e11a7d17:   movabs $0x7fd3ed315110,%rdi         ;   {external_word}
  0x00007fd3e11a7d21:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a7d25:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a7d2a:   hlt    
  0x00007fd3e11a7d2b:   mov    %r8,%r11
  0x00007fd3e11a7d2e:   shr    $0x3,%r11                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7d32:   mov    %r11d,0x10(%rcx)             ;*invokespecial fromArray0Template {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a7d36:   mov    0x28(%rsp),%rsi
  0x00007fd3e11a7d3b:   mov    0x20(%rsp),%rdx
  0x00007fd3e11a7d40:   vzeroupper 
  0x00007fd3e11a7d43:   callq  0x00007fd3e1191f80           ; ImmutableOopMap {[32]=Oop [56]=Oop [64]=Oop }
                                                            ;*invokevirtual vOp {reexecute=0 rethrow=0 return_oop=1}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@64 (line 2728)
                                                            ; - App::micro_vector_masked@129 (line 53)
                                                            ;   {optimized virtual_call}
 ;; B85: #	out( B159 B86 ) <- in( B84 )  Freq: 0.999906
  0x00007fd3e11a7d48:   mov    %rax,%rcx
  0x00007fd3e11a7d4b:   mov    0x40(%rsp),%rbp
  0x00007fd3e11a7d50:   test   %rbp,%rbp
  0x00007fd3e11a7d53:   je     0x00007fd3e11a8408           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B86: #	out( B224 B87 ) <- in( B85 )  Freq: 0.999905
  0x00007fd3e11a7d59:   movabs $0x101985c88,%rdx            ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
                                                            ; - App::micro_vector_masked@44 (line 45)
                                                            ;   {oop(a 'jdk/incubator/vector/VectorOperators$AssociativeImpl'{0x0000000101985c88})}
  0x00007fd3e11a7d63:   mov    %rbp,%rsi
  0x00007fd3e11a7d66:   vzeroupper 
  0x00007fd3e11a7d69:   movabs $0x800098110,%rax
  0x00007fd3e11a7d73:   callq  0x00007fd3e1179400           ; ImmutableOopMap {rbp=Oop [32]=Oop [56]=Oop }
                                                            ;*invokevirtual lanewise {reexecute=0 rethrow=0 return_oop=1}
                                                            ; - jdk.incubator.vector.IntVector::lanewise@70 (line 688)
                                                            ; - jdk.incubator.vector.IntVector::add@6 (line 1133)
                                                            ; - App::micro_vector_masked@140 (line 54)
                                                            ;   {virtual_call}
 ;; B87: #	out( B223 B88 ) <- in( B86 )  Freq: 0.999885
  0x00007fd3e11a7d78:   mov    %rbp,%rsi
  0x00007fd3e11a7d7b:   mov    %rax,%rdx
  0x00007fd3e11a7d7e:   mov    0x20(%rsp),%rcx              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7d83:   nop
  0x00007fd3e11a7d84:   nop
  0x00007fd3e11a7d85:   nop
  0x00007fd3e11a7d86:   vzeroupper 
  0x00007fd3e11a7d89:   movabs $0xffffffffffffffff,%rax
  0x00007fd3e11a7d93:   callq  0x00007fd3e1112440           ; ImmutableOopMap {[32]=Oop [56]=Oop }
                                                            ;*invokevirtual blend {reexecute=0 rethrow=0 return_oop=1}
                                                            ; - jdk.incubator.vector.IntVector::lanewise@74 (line 688)
                                                            ; - jdk.incubator.vector.IntVector::add@6 (line 1133)
                                                            ; - App::micro_vector_masked@140 (line 54)
                                                            ;   {virtual_call}
 ;; B88: #	out( B215 B89 ) <- in( B87 )  Freq: 0.999865
  0x00007fd3e11a7d98:   nop
  0x00007fd3e11a7d99:   nop
  0x00007fd3e11a7d9a:   nop
  0x00007fd3e11a7d9b:   nop
  0x00007fd3e11a7d9c:   nop
  0x00007fd3e11a7d9d:   nop
  0x00007fd3e11a7d9e:   nop
  0x00007fd3e11a7d9f:   nop
  0x00007fd3e11a7da0:   mov    0x8(%rax),%r11d              ; implicit exception: dispatches to 0x00007fd3e11a8ebc
 ;; B89: #	out( B98 B90 ) <- in( B88 )  Freq: 0.999864
  0x00007fd3e11a7da4:   mov    %r11d,0x40(%rsp)
  0x00007fd3e11a7da9:   mov    0x20(%rsp),%r8               ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7dae:   mov    0xc(%r8),%r10d               ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@233 (line 634)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a7db2:   vmovq  0x10(%r12,%r10,8),%xmm0
  0x00007fd3e11a7db9:   vpxor  %ymm1,%ymm1,%ymm1
  0x00007fd3e11a7dbd:   vpsubb %ymm0,%ymm1,%ymm1
  0x00007fd3e11a7dc1:   vpmovsxbd %xmm1,%ymm1
  0x00007fd3e11a7dc6:   vmovdqu 0x60(%rsp),%ymm0
  0x00007fd3e11a7dcc:   vptest %ymm0,%ymm1
  0x00007fd3e11a7dd1:   setb   %r11b
  0x00007fd3e11a7dd5:   movzbl %r11b,%r11d
  0x00007fd3e11a7dd9:   test   %r11d,%r11d
  0x00007fd3e11a7ddc:   nop
  0x00007fd3e11a7ddd:   nop
  0x00007fd3e11a7dde:   nop
  0x00007fd3e11a7ddf:   nop
  0x00007fd3e11a7de0:   je     0x00007fd3e11a7e79
 ;; B90: #	out( B168 B91 ) <- in( B89 )  Freq: 0.899877
  0x00007fd3e11a7de6:   mov    0x40(%rsp),%r11d
  0x00007fd3e11a7deb:   cmp    $0x98110,%r11d               ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {metadata('jdk/incubator/vector/Int256Vector')}
  0x00007fd3e11a7df2:   jne    0x00007fd3e11a85c6           ;*getfield dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
 ;; B91: #	out( B169 B92 ) <- in( B90 )  Freq: 0.899877
  0x00007fd3e11a7df8:   mov    0x54(%rsp),%r10d
  0x00007fd3e11a7dfd:   nop
  0x00007fd3e11a7dfe:   nop
  0x00007fd3e11a7dff:   nop
  0x00007fd3e11a7e00:   test   %r10d,%r10d                  ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7e03:   jl     0x00007fd3e11a85ec           ;*getfield dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
 ;; B92: #	out( B164 B93 ) <- in( B91 )  Freq: 0.899876
  0x00007fd3e11a7e09:   mov    0x48(%rsp),%r9d
  0x00007fd3e11a7e0e:   cmp    %r10d,%r9d
  0x00007fd3e11a7e11:   jae    0x00007fd3e11a8538           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B93: #	out( B94 ) <- in( B92 )  Freq: 0.899875
  0x00007fd3e11a7e17:   mov    0xc(%rax),%r11d              ;*aload_0 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCodeRaw@0 (line 786)
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a7e1b:   vmovdqu 0x10(%r12,%r11,8),%ymm0
  0x00007fd3e11a7e22:   mov    0x38(%rsp),%r10
  0x00007fd3e11a7e27:   vmovdqu %ymm0,0x10(%r10,%r9,4)      ;*iand {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorIntrinsics::roundDown@14 (line 108)
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
                                                            ; - App::micro_vector_masked@17 (line 43)
 ;; B94: #	out( N2743 ) <- in( B147 B140 B108 B93 )  Freq: 0.999857
  0x00007fd3e11a7e2e:   vzeroupper 
  0x00007fd3e11a7e31:   add    $0x90,%rsp
  0x00007fd3e11a7e38:   pop    %rbp
  0x00007fd3e11a7e39:   cmp    0x128(%r15),%rsp             ;   {poll_return}
  0x00007fd3e11a7e40:   ja     0x00007fd3e11a8f91
  0x00007fd3e11a7e46:   retq   
 ;; B95: #	out( B60 ) <- in( B26 )  Freq: 0.111152
  0x00007fd3e11a7e47:   mov    %r14,0x40(%rsp)
  0x00007fd3e11a7e4c:   mov    %r13,0x28(%rsp)
  0x00007fd3e11a7e51:   mov    %ebx,0x50(%rsp)
  0x00007fd3e11a7e55:   mov    %r9d,%r8d
  0x00007fd3e11a7e58:   mov    %edx,0x54(%rsp)
  0x00007fd3e11a7e5c:   mov    %r11d,0x48(%rsp)
  0x00007fd3e11a7e61:   mov    %rcx,%rbx
  0x00007fd3e11a7e64:   jmpq   0x00007fd3e11a7968
 ;; B96: #	out( B31 ) <- in( B29 )  Freq: 0.111152
  0x00007fd3e11a7e69:   xor    %r8d,%r8d
  0x00007fd3e11a7e6c:   jmpq   0x00007fd3e11a7779
 ;; B97: #	out( B57 ) <- in( B55 )  Freq: 0.111152
  0x00007fd3e11a7e71:   xor    %r8d,%r8d
  0x00007fd3e11a7e74:   jmpq   0x00007fd3e11a7933
 ;; B98: #	out( B222 B99 ) <- in( B89 )  Freq: 0.0999864
  0x00007fd3e11a7e79:   mov    %rax,0x30(%rsp)
  0x00007fd3e11a7e7e:   rex.W pushq 0x20(%rsp)
  0x00007fd3e11a7e83:   rex.W popq 0x28(%rsp)
  0x00007fd3e11a7e88:   mov    %rax,%rsi
  0x00007fd3e11a7e8b:   mov    0x48(%rsp),%ebp              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7e8f:   nop
  0x00007fd3e11a7e90:   nop
  0x00007fd3e11a7e91:   nop
  0x00007fd3e11a7e92:   vzeroupper 
  0x00007fd3e11a7e95:   movabs $0x800098110,%rax
  0x00007fd3e11a7e9f:   callq  0x00007fd3e11623a0           ; ImmutableOopMap {[32]=Oop [40]=Oop [48]=Oop [56]=Oop }
                                                            ;*invokevirtual vspecies {reexecute=0 rethrow=0 return_oop=1}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@17 (line 3004)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {virtual_call}
 ;; B99: #	out( B216 B100 ) <- in( B98 )  Freq: 0.0999844
  0x00007fd3e11a7ea4:   mov    0x2c(%rax),%ebp              ; implicit exception: dispatches to 0x00007fd3e11a8ee0
 ;; B100: #	out( B201 B101 ) <- in( B99 )  Freq: 0.0999843
  0x00007fd3e11a7ea7:   cmp    $0x20311f82,%ebp             ;   {oop(a 'java/lang/Class'{0x000000010188fc10} = 'jdk/incubator/vector/IntMaxVector')}
  0x00007fd3e11a7ead:   je     0x00007fd3e11a8ba4           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B101: #	out( B191 B102 ) <- in( B100 )  Freq: 0.0999843
  0x00007fd3e11a7eb3:   mov    0x1c(%rax),%ebp              ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@26 (line 3211)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7eb6:   nop
  0x00007fd3e11a7eb7:   nop
  0x00007fd3e11a7eb8:   nop
  0x00007fd3e11a7eb9:   nop
  0x00007fd3e11a7eba:   nop
  0x00007fd3e11a7ebb:   nop
  0x00007fd3e11a7ebc:   nop
  0x00007fd3e11a7ebd:   nop
  0x00007fd3e11a7ebe:   nop
  0x00007fd3e11a7ebf:   nop
  0x00007fd3e11a7ec0:   cmp    $0x100,%ebp
  0x00007fd3e11a7ec6:   jne    0x00007fd3e11a8a8c
 ;; B102: #	out( B202 B103 ) <- in( B101 )  Freq: 0.0999842
  0x00007fd3e11a7ecc:   mov    0x20(%rsp),%r9               ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7ed1:   mov    0xc(%r9),%r10d               ;*ifeq {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@16 (line 775)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a7ed5:   mov    0x50(%rsp),%r8d
  0x00007fd3e11a7eda:   sub    0x48(%rsp),%r8d
  0x00007fd3e11a7edf:   vmovq  0x10(%r12,%r10,8),%xmm0
  0x00007fd3e11a7ee6:   movabs $0x101964de8,%r10            ;   {oop([I{0x0000000101964de8})}
  0x00007fd3e11a7ef0:   vmovdqu 0x10(%r10),%ymm1
  0x00007fd3e11a7ef6:   cmp    $0x8,%r8d                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7efa:   mov    $0x8,%r10d
  0x00007fd3e11a7f00:   cmovge %r10d,%r8d                   ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a7f04:   xor    %r11d,%r11d
  0x00007fd3e11a7f07:   test   %r8d,%r8d
  0x00007fd3e11a7f0a:   cmovle %r11d,%r8d
  0x00007fd3e11a7f0e:   vmovd  %r8d,%xmm2
  0x00007fd3e11a7f13:   vpbroadcastd %xmm2,%ymm2
  0x00007fd3e11a7f18:   vpcmpgtd %ymm1,%ymm2,%ymm1
  0x00007fd3e11a7f1c:   vpxor  -0x120984(%rip),%ymm1,%ymm1        # Stub::vector_all_bits_set
                                                            ;   {external_word}
  0x00007fd3e11a7f24:   vpxor  %ymm2,%ymm2,%ymm2
  0x00007fd3e11a7f28:   vpsubb %ymm0,%ymm2,%ymm2
  0x00007fd3e11a7f2c:   vpmovsxbd %xmm2,%ymm2               ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7f31:   vpand  %ymm2,%ymm1,%ymm1            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7f35:   vmovdqu 0x60(%rsp),%ymm0
  0x00007fd3e11a7f3b:   vptest %ymm0,%ymm1
  0x00007fd3e11a7f40:   setne  %bpl
  0x00007fd3e11a7f44:   movzbl %bpl,%ebp
  0x00007fd3e11a7f48:   test   %ebp,%ebp
  0x00007fd3e11a7f4a:   jne    0x00007fd3e11a8be0
 ;; B103: #	out( B192 B104 ) <- in( B102 )  Freq: 0.0999841
  0x00007fd3e11a7f50:   mov    0x40(%rsp),%r10d
  0x00007fd3e11a7f55:   nop
  0x00007fd3e11a7f56:   nop
  0x00007fd3e11a7f57:   nop
  0x00007fd3e11a7f58:   nop
  0x00007fd3e11a7f59:   nop
  0x00007fd3e11a7f5a:   nop
  0x00007fd3e11a7f5b:   nop
  0x00007fd3e11a7f5c:   nop
  0x00007fd3e11a7f5d:   nop
  0x00007fd3e11a7f5e:   nop
  0x00007fd3e11a7f5f:   nop
  0x00007fd3e11a7f60:   cmp    $0x98110,%r10d               ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {metadata('jdk/incubator/vector/Int256Vector')}
  0x00007fd3e11a7f67:   jne    0x00007fd3e11a8ac4
 ;; B104: #	out( B217 B105 ) <- in( B103 )  Freq: 0.099984
  0x00007fd3e11a7f6d:   mov    0x30(%rsp),%r10              ;*invokestatic opCode {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a7f72:   mov    0xc(%r10),%ecx               ;*invokespecial fromArray0Template {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a7f76:   nop
  0x00007fd3e11a7f77:   nop
  0x00007fd3e11a7f78:   nop
  0x00007fd3e11a7f79:   nop
  0x00007fd3e11a7f7a:   nop
  0x00007fd3e11a7f7b:   nop
  0x00007fd3e11a7f7c:   nop
  0x00007fd3e11a7f7d:   nop
  0x00007fd3e11a7f7e:   nop
  0x00007fd3e11a7f7f:   nop
  0x00007fd3e11a7f80:   mov    0x8(%r12,%rcx,8),%r11d       ; implicit exception: dispatches to 0x00007fd3e11a8f04
 ;; B105: #	out( B206 B106 ) <- in( B104 )  Freq: 0.0999839
  0x00007fd3e11a7f85:   cmp    $0x40c30,%r11d               ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {metadata({type array int})}
  0x00007fd3e11a7f8c:   jne    0x00007fd3e11a8d34           ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
 ;; B106: #	out( B218 B107 ) <- in( B105 )  Freq: 0.0999839
  0x00007fd3e11a7f92:   mov    0x20(%rsp),%r10              ;*invokevirtual opKind {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators::opKind@5 (line 409)
                                                            ; - jdk.incubator.vector.IntVector::opKind@2 (line 71)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@15 (line 603)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a7f97:   mov    0xc(%r10),%r11d              ;*invokevirtual vspecies {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@1 (line 3208)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@44 (line 45)
  0x00007fd3e11a7f9b:   lea    (%r12,%rcx,8),%r9            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7f9f:   nop
  0x00007fd3e11a7fa0:   mov    0x8(%r12,%r11,8),%r10d       ; implicit exception: dispatches to 0x00007fd3e11a8f28
 ;; B107: #	out( B207 B108 ) <- in( B106 )  Freq: 0.0999838
  0x00007fd3e11a7fa5:   cmp    $0x40000,%r10d               ;   {metadata({type array bool})}
  0x00007fd3e11a7fac:   jne    0x00007fd3e11a8d5c           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B108: #	out( B94 B109 ) <- in( B107 )  Freq: 0.0999838
  0x00007fd3e11a7fb2:   mov    0xc(%r9),%eax                ;*invokespecial dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7fb6:   test   %eax,%eax                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a7fb8:   jbe    0x00007fd3e11a7e2e
 ;; B109: #	out( B193 B110 ) <- in( B108 )  Freq: 0.0888711
  0x00007fd3e11a7fbe:   lea    (%r12,%r11,8),%rbx           ;*ifnull {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 296)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a7fc2:   mov    0xc(%rbx),%ecx               ;*invokestatic opCode {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a7fc5:   test   %ecx,%ecx
  0x00007fd3e11a7fc7:   jbe    0x00007fd3e11a8ae8
 ;; B110: #	out( B193 B111 ) <- in( B109 )  Freq: 0.088871
  0x00007fd3e11a7fcd:   mov    %eax,%r11d
  0x00007fd3e11a7fd0:   dec    %r11d
  0x00007fd3e11a7fd3:   cmp    %ecx,%r11d
  0x00007fd3e11a7fd6:   jae    0x00007fd3e11a8ae8
 ;; B111: #	out( B112 ) <- in( B110 )  Freq: 0.0888709
  0x00007fd3e11a7fdc:   movslq 0x48(%rsp),%rdx
  0x00007fd3e11a7fe1:   mov    %rdx,%r10
  0x00007fd3e11a7fe4:   neg    %r10
  0x00007fd3e11a7fe7:   mov    %r10d,%r8d
  0x00007fd3e11a7fea:   mov    $0x7fffffff,%edi
  0x00007fd3e11a7fef:   cmp    $0x7fffffff,%r10
  0x00007fd3e11a7ff6:   cmovg  %edi,%r8d
  0x00007fd3e11a7ffa:   mov    $0x1,%r11d
  0x00007fd3e11a8000:   cmp    %r11d,%r8d
  0x00007fd3e11a8003:   mov    $0x1,%r10d
  0x00007fd3e11a8009:   cmovl  %r10d,%r8d
  0x00007fd3e11a800d:   cmp    %eax,%r8d
  0x00007fd3e11a8010:   cmovg  %eax,%r8d
  0x00007fd3e11a8014:   xor    %r10d,%r10d                  ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B112: #	out( B148 B113 ) <- in( B111 B117 ) Loop( B112-B117 inner pre of N1180) Freq: 0.177742
  0x00007fd3e11a8017:   movslq %r10d,%rsi                   ;*invokestatic fromLong {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector_masked@101 (line 51)
  0x00007fd3e11a801a:   movzbl 0x10(%rbx,%rsi,1),%edi       ;*invokevirtual getClass {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@215 (line 634)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a801f:   nop
  0x00007fd3e11a8020:   test   %edi,%edi
  0x00007fd3e11a8022:   je     0x00007fd3e11a821d
 ;; B113: #	out( B187 B114 ) <- in( B112 )  Freq: 0.155516
  0x00007fd3e11a8028:   cmp    %eax,%r10d
  0x00007fd3e11a802b:   jae    0x00007fd3e11a89f4           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B114: #	out( B189 B115 ) <- in( B113 )  Freq: 0.155516
  0x00007fd3e11a8031:   mov    0x10(%r9,%rsi,4),%ebp        ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector_masked@90 (line 51)
  0x00007fd3e11a8036:   mov    %r10d,%r11d
  0x00007fd3e11a8039:   add    0x48(%rsp),%r11d
  0x00007fd3e11a803e:   mov    %r11d,%r14d
  0x00007fd3e11a8041:   cmp    0x50(%rsp),%r11d
  0x00007fd3e11a8046:   jae    0x00007fd3e11a8a40
 ;; B115: #	out( B116 ) <- in( B114 )  Freq: 0.155516
  0x00007fd3e11a804c:   add    %rdx,%rsi
  0x00007fd3e11a804f:   mov    0x38(%rsp),%rdi
  0x00007fd3e11a8054:   mov    %ebp,0x10(%rdi,%rsi,4)
 ;; B116: #	out( B118 B117 ) <- in( B115 B148 )  Freq: 0.177741
  0x00007fd3e11a8058:   inc    %r10d
  0x00007fd3e11a805b:   nop
  0x00007fd3e11a805c:   nop
  0x00007fd3e11a805d:   nop
  0x00007fd3e11a805e:   nop
  0x00007fd3e11a805f:   nop
  0x00007fd3e11a8060:   cmp    %r8d,%r10d
  0x00007fd3e11a8063:   jge    0x00007fd3e11a806c
 ;; B117: #	out( B112 ) <- in( B116 )  Freq: 0.0888706
  0x00007fd3e11a8065:   mov    %rdi,0x38(%rsp)
  0x00007fd3e11a806a:   jmp    0x00007fd3e11a8017
 ;; B118: #	out( B140 B119 ) <- in( B116 )  Freq: 0.0888706
  0x00007fd3e11a806c:   movslq 0x50(%rsp),%rbp
  0x00007fd3e11a8071:   mov    %rbp,%r11
  0x00007fd3e11a8074:   sub    %rdx,%r11
  0x00007fd3e11a8077:   mov    %r11d,%r8d
  0x00007fd3e11a807a:   cmp    %eax,%r8d
  0x00007fd3e11a807d:   cmovg  %eax,%r8d
  0x00007fd3e11a8081:   cmp    %eax,%r8d
  0x00007fd3e11a8084:   cmovg  %eax,%r8d
  0x00007fd3e11a8088:   mov    %r8d,%r11d
  0x00007fd3e11a808b:   add    $0xfffffffd,%r11d
  0x00007fd3e11a808f:   cmp    %r11d,%r8d
  0x00007fd3e11a8092:   mov    $0x80000000,%r8d
  0x00007fd3e11a8098:   cmovl  %r8d,%r11d
  0x00007fd3e11a809c:   nop
  0x00007fd3e11a809d:   nop
  0x00007fd3e11a809e:   nop
  0x00007fd3e11a809f:   nop
  0x00007fd3e11a80a0:   cmp    %r11d,%r10d
  0x00007fd3e11a80a3:   jge    0x00007fd3e11a81c5
 ;; B119: #	out( B194 B120 ) <- in( B118 )  Freq: 0.0888705
  0x00007fd3e11a80a9:   cmp    %ecx,%r10d
  0x00007fd3e11a80ac:   jae    0x00007fd3e11a8b18
 ;; B120: #	out( B195 B121 ) <- in( B119 )  Freq: 0.0888704
  0x00007fd3e11a80b2:   cmp    %eax,%r10d
  0x00007fd3e11a80b5:   jae    0x00007fd3e11a8b2c
 ;; B121: #	out( B196 B122 ) <- in( B120 )  Freq: 0.0888704
  0x00007fd3e11a80bb:   movslq %r10d,%r8
  0x00007fd3e11a80be:   add    %rdx,%r8
  0x00007fd3e11a80c1:   cmp    %rbp,%r8
  0x00007fd3e11a80c4:   jae    0x00007fd3e11a8b40
 ;; B122: #	out( B197 B123 ) <- in( B121 )  Freq: 0.0888703
  0x00007fd3e11a80ca:   mov    %r10d,%esi
  0x00007fd3e11a80cd:   add    $0x3,%esi
  0x00007fd3e11a80d0:   movslq %esi,%r8
  0x00007fd3e11a80d3:   add    %rdx,%r8
  0x00007fd3e11a80d6:   cmp    %rbp,%r8
  0x00007fd3e11a80d9:   jae    0x00007fd3e11a8b54
 ;; B123: #	out( B198 B124 ) <- in( B122 )  Freq: 0.0888702
  0x00007fd3e11a80df:   nop
  0x00007fd3e11a80e0:   cmp    %eax,%esi
  0x00007fd3e11a80e2:   jae    0x00007fd3e11a8b68
 ;; B124: #	out( B199 B125 ) <- in( B123 )  Freq: 0.0888701
  0x00007fd3e11a80e8:   cmp    %eax,%r10d
  0x00007fd3e11a80eb:   jae    0x00007fd3e11a8b7c
 ;; B125: #	out( B200 B126 ) <- in( B124 )  Freq: 0.08887
  0x00007fd3e11a80f1:   cmp    %ecx,%r10d
  0x00007fd3e11a80f4:   jae    0x00007fd3e11a8b90
 ;; B126: #	out( B139 B127 ) <- in( B125 )  Freq: 0.0888699
  0x00007fd3e11a80fa:   cmp    %ecx,%esi
  0x00007fd3e11a80fc:   nop
  0x00007fd3e11a80fd:   nop
  0x00007fd3e11a80fe:   nop
  0x00007fd3e11a80ff:   nop
  0x00007fd3e11a8100:   jb     0x00007fd3e11a8199
 ;; B127: #	out( N2743 ) <- in( B126 )  Freq: 9.005e-08
  0x00007fd3e11a8106:   movabs $0x7fd3ed2fd078,%rdi         ;   {external_word}
  0x00007fd3e11a8110:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8114:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8119:   hlt    
  0x00007fd3e11a811a:   nop
  0x00007fd3e11a811b:   nop
  0x00007fd3e11a811c:   nop
  0x00007fd3e11a811d:   nop
  0x00007fd3e11a811e:   nop
  0x00007fd3e11a811f:   nop
 ;; B128: #	out( B129 ) <- in( B136 ) top-of-loop Freq: 6.29451
  0x00007fd3e11a8120:   mov    0x1c(%r9,%rsi,4),%esi        ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8125:   mov    %esi,0x1c(%rdi,%rdx,4)
 ;; B129: #	out( B138 B130 ) <- in( B128 B137 ) top-of-loop Freq: 7.19408
  0x00007fd3e11a8129:   add    $0x4,%r10d
  0x00007fd3e11a812d:   cmp    %r8d,%r10d
  0x00007fd3e11a8130:   jge    0x00007fd3e11a818a           ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
 ;; B130: #	out( B132 B131 ) <- in( B139 B129 ) Loop( B130-B129 inner main of N1161 strip mined) Freq: 7.19408
  0x00007fd3e11a8136:   mov    %r10d,%edx
  0x00007fd3e11a8139:   add    0x48(%rsp),%edx              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a813d:   movslq %r10d,%rsi                   ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
  0x00007fd3e11a8140:   movzbl 0x10(%rbx,%rsi,1),%ecx       ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@46 (line 208)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
  0x00007fd3e11a8145:   test   %ecx,%ecx
  0x00007fd3e11a8147:   je     0x00007fd3e11a8152
 ;; B131: #	out( B132 ) <- in( B130 )  Freq: 6.29451
  0x00007fd3e11a8149:   mov    0x10(%r9,%rsi,4),%esi        ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a814e:   mov    %esi,0x10(%rdi,%rdx,4)       ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
 ;; B132: #	out( B134 B133 ) <- in( B131 B130 )  Freq: 7.19408
  0x00007fd3e11a8152:   movslq %edx,%rdx
  0x00007fd3e11a8155:   movslq %r10d,%rsi                   ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8158:   movzbl 0x11(%rbx,%rsi,1),%ecx       ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@46 (line 208)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
  0x00007fd3e11a815d:   nop
  0x00007fd3e11a815e:   nop
  0x00007fd3e11a815f:   nop
  0x00007fd3e11a8160:   test   %ecx,%ecx
  0x00007fd3e11a8162:   je     0x00007fd3e11a816d
 ;; B133: #	out( B134 ) <- in( B132 )  Freq: 6.29451
  0x00007fd3e11a8164:   mov    0x14(%r9,%rsi,4),%ecx        ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8169:   mov    %ecx,0x14(%rdi,%rdx,4)       ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
 ;; B134: #	out( B136 B135 ) <- in( B133 B132 )  Freq: 7.19408
  0x00007fd3e11a816d:   movzbl 0x12(%rbx,%rsi,1),%ecx       ;*invokestatic requireLength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@11 (line 182)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
  0x00007fd3e11a8172:   test   %ecx,%ecx
  0x00007fd3e11a8174:   je     0x00007fd3e11a817f
 ;; B135: #	out( B136 ) <- in( B134 )  Freq: 6.29451
  0x00007fd3e11a8176:   mov    0x18(%r9,%rsi,4),%ecx        ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a817b:   mov    %ecx,0x18(%rdi,%rdx,4)       ;*invokestatic requireLengthFailed {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorIntrinsics::requireLength@7 (line 59)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@11 (line 182)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
 ;; B136: #	out( B128 B137 ) <- in( B135 B134 )  Freq: 7.19408
  0x00007fd3e11a817f:   movzbl 0x13(%rbx,%rsi,1),%ecx       ;*invokevirtual getClass {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@215 (line 634)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a8184:   test   %ecx,%ecx                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8186:   jne    0x00007fd3e11a8120
 ;; B137: #	out( B129 ) <- in( B136 )  Freq: 0.899568
  0x00007fd3e11a8188:   jmp    0x00007fd3e11a8129           ;*invokevirtual opCodeRaw {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
                                                            ; - jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
                                                            ; - jdk.incubator.vector.IntVector::opCode@7 (line 62)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
 ;; B138: #	out( B140 B139 ) <- in( B129 )  Freq: 0.799585
  0x00007fd3e11a818a:   mov    0x130(%r15),%r8              ; ImmutableOopMap {r9=Oop rbx=Oop rdi=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.IntVector::stOp@53 (line 353)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8191:   test   %eax,(%r8)                   ;   {poll}
  0x00007fd3e11a8194:   cmp    %r11d,%r10d
  0x00007fd3e11a8197:   jge    0x00007fd3e11a81c5           ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
 ;; B139: #	out( B130 ) <- in( B126 B138 ) Loop( B139-B138 ) Freq: 0.799585
  0x00007fd3e11a8199:   mov    %r11d,%r8d
  0x00007fd3e11a819c:   sub    %r10d,%r8d
  0x00007fd3e11a819f:   xor    %edx,%edx
  0x00007fd3e11a81a1:   cmp    %r10d,%r11d
  0x00007fd3e11a81a4:   cmovl  %edx,%r8d
  0x00007fd3e11a81a8:   cmp    $0xfa0,%r8d
  0x00007fd3e11a81af:   mov    $0xfa0,%edx
  0x00007fd3e11a81b4:   cmova  %edx,%r8d
  0x00007fd3e11a81b8:   add    %r10d,%r8d
  0x00007fd3e11a81bb:   nop
  0x00007fd3e11a81bc:   nop
  0x00007fd3e11a81bd:   nop
  0x00007fd3e11a81be:   nop
  0x00007fd3e11a81bf:   nop
  0x00007fd3e11a81c0:   jmpq   0x00007fd3e11a8136
 ;; B140: #	out( B94 B141 ) <- in( B118 B138 )  Freq: 0.0888699
  0x00007fd3e11a81c5:   cmp    %eax,%r10d
  0x00007fd3e11a81c8:   jge    0x00007fd3e11a7e2e           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B141: #	out( B142 ) <- in( B140 )  Freq: 0.044435
  0x00007fd3e11a81ce:   nop
  0x00007fd3e11a81cf:   nop                                 ;*synchronization entry
                                                            ; - App::micro_vector_masked@-1 (line 32)
 ;; B142: #	out( B146 B143 ) <- in( B141 B146 ) Loop( B142-B146 inner post of N1180) Freq: 0.0888697
  0x00007fd3e11a81d0:   movslq %r10d,%r8                    ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector_masked@22 (line 43)
  0x00007fd3e11a81d3:   movzbl 0x10(%rbx,%r8,1),%ecx        ;*ifne {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
                                                            ; - App::micro_vector_masked@17 (line 43)
  0x00007fd3e11a81d9:   test   %ecx,%ecx
  0x00007fd3e11a81db:   je     0x00007fd3e11a8210
 ;; B143: #	out( B188 B144 ) <- in( B142 )  Freq: 0.0777572
  0x00007fd3e11a81dd:   nop
  0x00007fd3e11a81de:   nop
  0x00007fd3e11a81df:   nop
  0x00007fd3e11a81e0:   cmp    %eax,%r10d
  0x00007fd3e11a81e3:   jae    0x00007fd3e11a89f9           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B144: #	out( B190 B145 ) <- in( B143 )  Freq: 0.0777571
  0x00007fd3e11a81e9:   mov    0x10(%r9,%r8,4),%r11d        ;*ifne {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
                                                            ; - App::micro_vector_masked@17 (line 43)
  0x00007fd3e11a81ee:   mov    %r10d,%r8d
  0x00007fd3e11a81f1:   add    0x48(%rsp),%r8d
  0x00007fd3e11a81f6:   nop
  0x00007fd3e11a81f7:   nop
  0x00007fd3e11a81f8:   nop
  0x00007fd3e11a81f9:   nop
  0x00007fd3e11a81fa:   nop
  0x00007fd3e11a81fb:   nop
  0x00007fd3e11a81fc:   nop
  0x00007fd3e11a81fd:   nop
  0x00007fd3e11a81fe:   nop
  0x00007fd3e11a81ff:   nop
  0x00007fd3e11a8200:   cmp    0x50(%rsp),%r8d
  0x00007fd3e11a8205:   jae    0x00007fd3e11a8a4b           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B145: #	out( B146 ) <- in( B144 )  Freq: 0.0777571
  0x00007fd3e11a820b:   mov    %r11d,0x10(%rdi,%r8,4)       ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector_masked@22 (line 43)
 ;; B146: #	out( B142 B147 ) <- in( B145 B142 )  Freq: 0.0888696
  0x00007fd3e11a8210:   inc    %r10d
  0x00007fd3e11a8213:   cmp    %eax,%r10d
  0x00007fd3e11a8216:   jl     0x00007fd3e11a81d0
 ;; B147: #	out( B94 ) <- in( B146 )  Freq: 0.0444348
  0x00007fd3e11a8218:   jmpq   0x00007fd3e11a7e2e
 ;; B148: #	out( B116 ) <- in( B112 )  Freq: 0.0222253
  0x00007fd3e11a821d:   mov    0x38(%rsp),%rdi
  0x00007fd3e11a8222:   jmpq   0x00007fd3e11a8058
 ;; B149: #	out( B221 B150 ) <- in( B23 B24 )  Freq: 0.000101028
  0x00007fd3e11a8227:   mov    %rsi,0x58(%rsp)
  0x00007fd3e11a822c:   mov    %r8,0x50(%rsp)
  0x00007fd3e11a8231:   mov    %r11d,0x4c(%rsp)
  0x00007fd3e11a8236:   mov    %edx,0x48(%rsp)
  0x00007fd3e11a823a:   mov    %r9d,0x34(%rsp)
  0x00007fd3e11a823f:   mov    %r10,0x40(%rsp)
  0x00007fd3e11a8244:   mov    %ebx,0x30(%rsp)
  0x00007fd3e11a8248:   mov    %r13,0x28(%rsp)
  0x00007fd3e11a824d:   mov    %r14,0x20(%rsp)
  0x00007fd3e11a8252:   mov    0x38(%rsp),%rbp              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8257:   movabs $0x800040000,%rsi            ;*invokevirtual vspecies {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@1 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
                                                            ;   {metadata({type array bool})}
  0x00007fd3e11a8261:   mov    %r9d,%edx
  0x00007fd3e11a8264:   vzeroupper 
  0x00007fd3e11a8267:   callq  0x00007fd3e1058620           ; ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop [40]=Oop [64]=Oop }
                                                            ;*newarray {reexecute=0 rethrow=0 return_oop=1}
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@92 (line 254)
                                                            ; - App::micro_vector_masked@101 (line 51)
                                                            ;   {runtime_call _new_array_Java}
 ;; B150: #	out( B26 ) <- in( B149 )  Freq: 0.000101026
  0x00007fd3e11a826c:   mov    %rbp,0x38(%rsp)
  0x00007fd3e11a8271:   mov    0x20(%rsp),%r14
  0x00007fd3e11a8276:   mov    0x28(%rsp),%r13
  0x00007fd3e11a827b:   mov    0x30(%rsp),%ebx
  0x00007fd3e11a827f:   mov    0x40(%rsp),%r10
  0x00007fd3e11a8284:   mov    0x34(%rsp),%r9d
  0x00007fd3e11a8289:   mov    0x48(%rsp),%edx
  0x00007fd3e11a828d:   mov    0x4c(%rsp),%r11d
  0x00007fd3e11a8292:   mov    0x50(%rsp),%r8
  0x00007fd3e11a8297:   mov    0x58(%rsp),%rsi
  0x00007fd3e11a829c:   mov    %rax,%rbp
  0x00007fd3e11a829f:   nop
  0x00007fd3e11a82a0:   jmpq   0x00007fd3e11a7737
 ;; B151: #	out( B220 B152 ) <- in( B72 )  Freq: 0.000100012
  0x00007fd3e11a82a5:   vmovdqu %ymm4,0x60(%rsp)
  0x00007fd3e11a82ab:   mov    %rdx,0x48(%rsp)
  0x00007fd3e11a82b0:   mov    %rbx,0x40(%rsp)
  0x00007fd3e11a82b5:   mov    %r8,0x30(%rsp)
  0x00007fd3e11a82ba:   mov    %r9d,0x20(%rsp)
  0x00007fd3e11a82bf:   mov    %rdi,0x18(%rsp)
  0x00007fd3e11a82c4:   mov    %rax,%rbp                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a82c7:   movabs $0x8000acb58,%rsi            ;*invokevirtual longToElementBits {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@3 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
                                                            ;   {metadata('jdk/incubator/vector/IntVector$$Lambda$63+0x00000008000acb58')}
  0x00007fd3e11a82d1:   nop
  0x00007fd3e11a82d2:   nop
  0x00007fd3e11a82d3:   nop
  0x00007fd3e11a82d4:   vzeroupper 
  0x00007fd3e11a82d7:   callq  0x00007fd3e1058920           ; ImmutableOopMap {rbp=Oop [24]=Oop [40]=Oop [48]=Oop [56]=Oop [64]=Oop [72]=Oop }
                                                            ;*invokevirtual allocateInstance {reexecute=0 rethrow=0 return_oop=1}
                                                            ; - java.lang.invoke.DirectMethodHandle::allocateInstance@12 (line 522)
                                                            ; - java.lang.invoke.LambdaForm$DMH/0x00000008000d4800::newInvokeSpecial@1
                                                            ; - java.lang.invoke.LambdaForm$MH/0x00000008000d5000::linkToTargetMethod@6
                                                            ; - jdk.incubator.vector.IntVector::fromArray@59 (line 2728)
                                                            ; - App::micro_vector_masked@115 (line 52)
                                                            ;   {runtime_call _new_instance_Java}
 ;; B152: #	out( B74 ) <- in( B151 )  Freq: 0.00010001
  0x00007fd3e11a82dc:   mov    %rax,%rcx
  0x00007fd3e11a82df:   mov    0x18(%rsp),%rdi
  0x00007fd3e11a82e4:   mov    0x20(%rsp),%r9d
  0x00007fd3e11a82e9:   jmpq   0x00007fd3e11a7b48
 ;; B153: #	out( B219 B154 ) <- in( B82 )  Freq: 0.000100009
  0x00007fd3e11a82ee:   mov    %rbx,0x28(%rsp)
  0x00007fd3e11a82f3:   rex.W pushq 0x48(%rsp)
  0x00007fd3e11a82f8:   rex.W popq 0x20(%rsp)
  0x00007fd3e11a82fd:   mov    %r8,%rbp                     ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8300:   movabs $0x8000acb58,%rsi            ;*invokevirtual laneCount {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@14 (line 3210)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@44 (line 45)
                                                            ;   {metadata('jdk/incubator/vector/IntVector$$Lambda$63+0x00000008000acb58')}
  0x00007fd3e11a830a:   nop
  0x00007fd3e11a830b:   nop
  0x00007fd3e11a830c:   vzeroupper 
  0x00007fd3e11a830f:   callq  0x00007fd3e1058920           ; ImmutableOopMap {rbp=Oop [32]=Oop [40]=Oop [56]=Oop [64]=Oop [72]=Oop }
                                                            ;*invokevirtual allocateInstance {reexecute=0 rethrow=0 return_oop=1}
                                                            ; - java.lang.invoke.DirectMethodHandle::allocateInstance@12 (line 522)
                                                            ; - java.lang.invoke.LambdaForm$DMH/0x00000008000d4800::newInvokeSpecial@1
                                                            ; - java.lang.invoke.LambdaForm$MH/0x00000008000d5000::linkToTargetMethod@6
                                                            ; - jdk.incubator.vector.IntVector::fromArray@59 (line 2728)
                                                            ; - App::micro_vector_masked@129 (line 53)
                                                            ;   {runtime_call _new_instance_Java}
 ;; B154: #	out( B84 ) <- in( B153 )  Freq: 0.000100007
  0x00007fd3e11a8314:   mov    %rax,%rcx
  0x00007fd3e11a8317:   mov    %rbp,%r8
  0x00007fd3e11a831a:   mov    0x18(%rsp),%r10d
  0x00007fd3e11a831f:   nop
  0x00007fd3e11a8320:   jmpq   0x00007fd3e11a7ce0           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B155: #	out( N2743 ) <- in( B15 )  Freq: 3.03822e-06
  0x00007fd3e11a8325:   mov    $0xffffffe4,%esi             ;*invokevirtual broadcastBits {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a832a:   mov    0x18(%rsp),%rbp
  0x00007fd3e11a832f:   mov    0x38(%rsp),%r9
  0x00007fd3e11a8334:   mov    %r9,0x18(%rsp)
  0x00007fd3e11a8339:   mov    %r13,0x28(%rsp)
  0x00007fd3e11a833e:   mov    %r10,0x38(%rsp)
  0x00007fd3e11a8343:   mov    %r14,0x40(%rsp)
  0x00007fd3e11a8348:   mov    %r11d,0x34(%rsp)
  0x00007fd3e11a834d:   mov    %r8d,0x48(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8352:   nop
  0x00007fd3e11a8353:   nop
  0x00007fd3e11a8354:   vzeroupper 
  0x00007fd3e11a8357:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=Oop [24]=Oop [40]=Oop [56]=Oop [64]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a835c:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8366:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a836a:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a836f:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B156: #	out( N2743 ) <- in( B16 )  Freq: 3.03821e-06
  0x00007fd3e11a8370:   mov    $0xffffffe4,%esi             ;*synchronization entry
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@-1 (line 295)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a8375:   mov    0x18(%rsp),%rbp
  0x00007fd3e11a837a:   mov    0x38(%rsp),%r8
  0x00007fd3e11a837f:   mov    %r8,0x18(%rsp)
  0x00007fd3e11a8384:   mov    %r14,0x20(%rsp)
  0x00007fd3e11a8389:   mov    %r10,0x38(%rsp)
  0x00007fd3e11a838e:   mov    %r13,0x40(%rsp)
  0x00007fd3e11a8393:   mov    %r11d,0x34(%rsp)
  0x00007fd3e11a8398:   mov    %eax,0x48(%rsp)
  0x00007fd3e11a839c:   vmovdqu %ymm0,0x60(%rsp)            ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a83a2:   nop
  0x00007fd3e11a83a3:   nop
  0x00007fd3e11a83a4:   vzeroupper 
  0x00007fd3e11a83a7:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop [56]=Oop [64]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@44 (line 45)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a83ac:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a83b6:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a83ba:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a83bf:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B157: #	out( N2743 ) <- in( B17 )  Freq: 3.03821e-06
  0x00007fd3e11a83c0:   mov    $0xffffffe4,%esi             ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a83c5:   mov    0x18(%rsp),%rbp
  0x00007fd3e11a83ca:   mov    %r14,0x20(%rsp)
  0x00007fd3e11a83cf:   mov    %r13,0x28(%rsp)
  0x00007fd3e11a83d4:   mov    %r11d,0x34(%rsp)
  0x00007fd3e11a83d9:   mov    %ecx,0x40(%rsp)
  0x00007fd3e11a83dd:   vmovdqu %ymm0,0x60(%rsp)            ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a83e3:   nop
  0x00007fd3e11a83e4:   vzeroupper 
  0x00007fd3e11a83e7:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=Oop [32]=Oop [40]=Oop [56]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - App::micro_vector_masked@59 (line 46)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a83ec:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a83f6:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a83fa:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a83ff:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B158: #	out( B23 ) <- in( B21 )  Freq: 1.01326e-06
  0x00007fd3e11a8400:   movslq %r9d,%rcx                    ;*invokevirtual opKind {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorOperators::opKind@5 (line 409)
                                                            ; - jdk.incubator.vector.IntVector::opKind@2 (line 71)
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@15 (line 603)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector_masked@53 (line 46)
  0x00007fd3e11a8403:   jmpq   0x00007fd3e11a7699           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B159: #	out( N2743 ) <- in( B85 )  Freq: 1.01318e-06
  0x00007fd3e11a8408:   mov    $0xfffffff6,%esi             ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a840d:   mov    %rax,%rbp
  0x00007fd3e11a8410:   vzeroupper 
  0x00007fd3e11a8413:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=Oop [32]=Oop }
                                                            ;*invokevirtual add {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector_masked@140 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8418:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8422:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8426:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a842b:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B160: #	out( N2743 ) <- in( B3 )  Freq: 9.99998e-07
  0x00007fd3e11a842c:   mov    $0xffffffde,%esi             ;*invokespecial broadcastTemplate {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8431:   mov    %rdx,0x20(%rsp)
  0x00007fd3e11a8436:   mov    %rcx,0x28(%rsp)
  0x00007fd3e11a843b:   mov    %r8,0x30(%rsp)
  0x00007fd3e11a8440:   mov    %ebx,0x38(%rsp)
  0x00007fd3e11a8444:   vzeroupper 
  0x00007fd3e11a8447:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=NarrowOop [24]=Oop [32]=Oop [40]=Oop [48]=Oop }
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector_masked@17 (line 43)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a844c:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8456:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a845a:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a845f:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B161: #	out( N2743 ) <- in( B62 )  Freq: 9.99956e-07
  0x00007fd3e11a8460:   mov    $0xffffffde,%esi             ;*invokestatic broadcastCoerced {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8465:   mov    %rax,%rbp
  0x00007fd3e11a8468:   vzeroupper 
  0x00007fd3e11a846b:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8470:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a847a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a847e:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8483:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B162: #	out( N2743 ) <- in( B70 )  Freq: 9.99952e-07
  0x00007fd3e11a8484:   mov    $0xffffff45,%esi             ;*isub {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@41 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a8489:   mov    0x38(%rsp),%r10
  0x00007fd3e11a848e:   mov    %r10,0x20(%rsp)
  0x00007fd3e11a8493:   rex.W pushq 0x40(%rsp)
  0x00007fd3e11a8498:   rex.W popq 0x38(%rsp)
  0x00007fd3e11a849d:   mov    %rax,-0x8(%rsp)
  0x00007fd3e11a84a2:   mov    0x48(%rsp),%eax
  0x00007fd3e11a84a6:   mov    %eax,0x34(%rsp)
  0x00007fd3e11a84aa:   mov    -0x8(%rsp),%rax
  0x00007fd3e11a84af:   mov    %rax,-0x8(%rsp)
  0x00007fd3e11a84b4:   mov    0x48(%rsp),%eax
  0x00007fd3e11a84b8:   mov    %eax,0x40(%rsp)
  0x00007fd3e11a84bc:   mov    -0x8(%rsp),%rax
  0x00007fd3e11a84c1:   mov    %r8,0x50(%rsp)
  0x00007fd3e11a84c6:   mov    %rbx,0x58(%rsp)
  0x00007fd3e11a84cb:   mov    %rdx,0x60(%rsp)
  0x00007fd3e11a84d0:   mov    %r11d,0x44(%rsp)             ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a84d5:   nop
  0x00007fd3e11a84d6:   nop
  0x00007fd3e11a84d7:   nop
  0x00007fd3e11a84d8:   vzeroupper 
  0x00007fd3e11a84db:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[24]=Oop [32]=Oop [40]=Oop [56]=Oop [80]=Oop [88]=Oop [96]=Oop }
                                                            ;*lookupswitch {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.IntVector$IntSpecies::iota@17 (line 3664)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a84e0:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a84ea:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a84ee:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a84f3:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B163: #	out( N2743 ) <- in( B80 )  Freq: 9.99927e-07
  0x00007fd3e11a84f4:   mov    $0xffffff45,%esi             ;*invokevirtual broadcastBits {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a84f9:   mov    0x38(%rsp),%r9
  0x00007fd3e11a84fe:   mov    %r9,0x18(%rsp)
  0x00007fd3e11a8503:   mov    %r10d,0x24(%rsp)
  0x00007fd3e11a8508:   mov    %r10d,0x30(%rsp)
  0x00007fd3e11a850d:   mov    %rax,0x38(%rsp)
  0x00007fd3e11a8512:   mov    %rbx,0x50(%rsp)
  0x00007fd3e11a8517:   mov    %r11d,0x34(%rsp)
  0x00007fd3e11a851c:   vzeroupper 
  0x00007fd3e11a851f:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[24]=Oop [40]=Oop [56]=Oop [72]=Oop [80]=Oop }
                                                            ;*lookupswitch {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.IntVector$IntSpecies::iota@17 (line 3664)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@129 (line 53)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8524:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a852e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8532:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8537:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B164: #	out( N2743 ) <- in( B92 )  Freq: 9.11825e-07
  0x00007fd3e11a8538:   mov    $0xffffffe4,%esi             ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a853d:   mov    %rax,0x20(%rsp)
  0x00007fd3e11a8542:   mov    %r10d,0x1c(%rsp)             ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8547:   nop
  0x00007fd3e11a8548:   vzeroupper 
  0x00007fd3e11a854b:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[32]=Oop [56]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@10 (line 3001)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8550:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a855a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a855e:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8563:   hlt    
 ;; B165: #	out( B166 ) <- in( B28 )  Freq: 9.00631e-07
  0x00007fd3e11a8564:   mov    0x20(%rsp),%edi              ;*invokevirtual vectorType {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@6 (line 3210)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
 ;; B166: #	out( N2743 ) <- in( B165 B27 )  Freq: 1.80126e-06
  0x00007fd3e11a8568:   mov    $0xffffff76,%esi             ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a856d:   mov    0x18(%rsp),%rbp
  0x00007fd3e11a8572:   mov    0x38(%rsp),%r9
  0x00007fd3e11a8577:   mov    %r9,0x18(%rsp)
  0x00007fd3e11a857c:   mov    %r14,0x20(%rsp)
  0x00007fd3e11a8581:   mov    %r13,0x28(%rsp)
  0x00007fd3e11a8586:   mov    %r11d,0x30(%rsp)
  0x00007fd3e11a858b:   mov    %r10,0x38(%rsp)
  0x00007fd3e11a8590:   mov    %rcx,0x40(%rsp)
  0x00007fd3e11a8595:   mov    %r8,0x48(%rsp)
  0x00007fd3e11a859a:   mov    %edi,0x34(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a859e:   nop
  0x00007fd3e11a859f:   nop
  0x00007fd3e11a85a0:   vzeroupper 
  0x00007fd3e11a85a3:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop [40]=Oop [56]=Oop [64]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.VectorMask::fromLong@104 (line 255)
                                                            ; - App::micro_vector_masked@101 (line 51)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a85a8:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a85b2:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a85b6:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a85bb:   hlt    
 ;; B167: #	out( B53 ) <- in( B31 )  Freq: 9.0063e-07
  0x00007fd3e11a85bc:   mov    $0x1,%eax
  0x00007fd3e11a85c1:   jmpq   0x00007fd3e11a7913           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B168: #	out( N2743 ) <- in( B90 )  Freq: 8.99877e-07
  0x00007fd3e11a85c6:   mov    $0xffffffde,%esi             ;*invokevirtual invokeBasic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a85cb:   mov    %rax,0x28(%rsp)
  0x00007fd3e11a85d0:   vzeroupper 
  0x00007fd3e11a85d3:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[40]=Oop [56]=Oop }
                                                            ;*invokevirtual length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@2 (line 2960)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@10 (line 3001)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a85d8:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a85e2:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a85e6:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a85eb:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B169: #	out( N2743 ) <- in( B91 )  Freq: 8.99877e-07
  0x00007fd3e11a85ec:   mov    $0xffffffcc,%esi             ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a85f1:   mov    %rax,0x20(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a85f6:   nop
  0x00007fd3e11a85f7:   nop
  0x00007fd3e11a85f8:   vzeroupper 
  0x00007fd3e11a85fb:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[32]=Oop [56]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@10 (line 3001)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8600:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a860a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a860e:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8613:   hlt    
 ;; B170: #	out( N2743 ) <- in( B32 )  Freq: 8.88826e-07
  0x00007fd3e11a8614:   movabs $0x7fd3ed2fd078,%rdi         ;   {external_word}
  0x00007fd3e11a861e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8622:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8627:   hlt    
 ;; B171: #	out( N2743 ) <- in( B33 )  Freq: 8.88825e-07
  0x00007fd3e11a8628:   movabs $0x7fd3ed2fd078,%rdi         ;   {external_word}
  0x00007fd3e11a8632:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8636:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a863b:   hlt    
 ;; B172: #	out( B175 ) <- in( B8 )  Freq: 7.499e-07
  0x00007fd3e11a863c:   mov    %rax,%r13
  0x00007fd3e11a863f:   nop
  0x00007fd3e11a8640:   jmp    0x00007fd3e11a864a
 ;; B173: #	out( B175 ) <- in( B9 )  Freq: 7.59858e-07
  0x00007fd3e11a8642:   mov    %rax,%r13
  0x00007fd3e11a8645:   jmp    0x00007fd3e11a864a
 ;; B174: #	out( B175 ) <- in( B7 )  Freq: 7.59859e-07
  0x00007fd3e11a8647:   mov    %rax,%r13                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B175: #	out( N2743 ) <- in( B13 B174 B172 B173 B176 B11 B12 )  Freq: 5.27917e-06
  0x00007fd3e11a864a:   mov    $0xffffff76,%esi             ;*invokevirtual vspecies {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@1 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a864f:   mov    0x18(%rsp),%rbp
  0x00007fd3e11a8654:   mov    %r14,0x20(%rsp)
  0x00007fd3e11a8659:   mov    %r13,0x28(%rsp)
  0x00007fd3e11a865e:   mov    %edi,0x30(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8662:   nop
  0x00007fd3e11a8663:   nop
  0x00007fd3e11a8664:   vzeroupper 
  0x00007fd3e11a8667:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=Oop [32]=Oop [40]=Oop [56]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector_masked@22 (line 43)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a866c:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8676:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a867a:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a867f:   hlt    
 ;; B176: #	out( B175 ) <- in( B10 )  Freq: 7.49899e-07
  0x00007fd3e11a8680:   mov    %rax,%r13
  0x00007fd3e11a8683:   jmp    0x00007fd3e11a864a           ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B177: #	out( N2743 ) <- in( B4 )  Freq: 4.99998e-07
  0x00007fd3e11a8685:   mov    $0xffffff45,%esi             ;*aload_0 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@0 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a868a:   mov    %rdx,0x20(%rsp)
  0x00007fd3e11a868f:   mov    %rcx,0x28(%rsp)
  0x00007fd3e11a8694:   mov    %r8,0x30(%rsp)
  0x00007fd3e11a8699:   mov    %ebx,0x38(%rsp)
  0x00007fd3e11a869d:   mov    %r9d,0x3c(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a86a2:   nop
  0x00007fd3e11a86a3:   nop
  0x00007fd3e11a86a4:   vzeroupper 
  0x00007fd3e11a86a7:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[24]=Oop [32]=Oop [40]=Oop [48]=Oop }
                                                            ;*ifne {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
                                                            ; - App::micro_vector_masked@17 (line 43)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a86ac:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a86b6:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a86ba:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a86bf:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B178: #	out( N2743 ) <- in( B65 )  Freq: 4.99977e-07
  0x00007fd3e11a86c0:   mov    $0xffffff45,%esi             ;*invokestatic broadcastCoerced {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a86c5:   mov    0x18(%rsp),%rbp
  0x00007fd3e11a86ca:   mov    0x38(%rsp),%r10
  0x00007fd3e11a86cf:   mov    %r10,0x18(%rsp)
  0x00007fd3e11a86d4:   mov    0x28(%rsp),%r10
  0x00007fd3e11a86d9:   mov    %r10,0x20(%rsp)
  0x00007fd3e11a86de:   mov    0x40(%rsp),%r10
  0x00007fd3e11a86e3:   mov    %r10,0x30(%rsp)
  0x00007fd3e11a86e8:   mov    %rax,-0x8(%rsp)
  0x00007fd3e11a86ed:   mov    0x48(%rsp),%eax
  0x00007fd3e11a86f1:   mov    %eax,0x2c(%rsp)
  0x00007fd3e11a86f5:   mov    -0x8(%rsp),%rax
  0x00007fd3e11a86fa:   mov    %rax,-0x8(%rsp)
  0x00007fd3e11a86ff:   mov    0x48(%rsp),%eax
  0x00007fd3e11a8703:   mov    %eax,0x38(%rsp)
  0x00007fd3e11a8707:   mov    -0x8(%rsp),%rax
  0x00007fd3e11a870c:   mov    %r8,0x50(%rsp)
  0x00007fd3e11a8711:   mov    %rbx,0x58(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8716:   nop
  0x00007fd3e11a8717:   nop
  0x00007fd3e11a8718:   vzeroupper 
  0x00007fd3e11a871b:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop [48]=Oop [80]=Oop [88]=Oop }
                                                            ;*iflt {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.IntVector::fromArray@7 (line 2721)
                                                            ; - App::micro_vector_masked@115 (line 52)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8720:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a872a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a872e:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8733:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B179: #	out( N2743 ) <- in( B19 )  Freq: 4.76829e-07
  0x00007fd3e11a8734:   mov    $0xffffff45,%esi             ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8739:   mov    0x18(%rsp),%rbp
  0x00007fd3e11a873e:   mov    0x38(%rsp),%rcx
  0x00007fd3e11a8743:   mov    %rcx,0x18(%rsp)
  0x00007fd3e11a8748:   mov    %r14,0x20(%rsp)
  0x00007fd3e11a874d:   mov    %r13,0x28(%rsp)
  0x00007fd3e11a8752:   mov    %r11d,0x30(%rsp)
  0x00007fd3e11a8757:   mov    %r10,0x38(%rsp)
  0x00007fd3e11a875c:   mov    %r8,0x40(%rsp)
  0x00007fd3e11a8761:   mov    %r9d,0x48(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8766:   nop
  0x00007fd3e11a8767:   nop
  0x00007fd3e11a8768:   vzeroupper 
  0x00007fd3e11a876b:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop [40]=Oop [56]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.VectorMask::fromLong@15 (line 242)
                                                            ; - App::micro_vector_masked@101 (line 51)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8770:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a877a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a877e:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8783:   hlt    
 ;; B180: #	out( N2743 ) <- in( B20 )  Freq: 4.76828e-07
  0x00007fd3e11a8784:   cmp    %rsi,%r8
  0x00007fd3e11a8787:   mov    $0xffffffff,%ebp
  0x00007fd3e11a878c:   jl     0x00007fd3e11a8796
  0x00007fd3e11a878e:   setne  %bpl
  0x00007fd3e11a8792:   movzbl %bpl,%ebp                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8796:   mov    $0xffffff45,%esi             ;*invokevirtual invokeBasic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a879b:   mov    0x38(%rsp),%rcx
  0x00007fd3e11a87a0:   mov    %rcx,0x20(%rsp)
  0x00007fd3e11a87a5:   mov    %r14,0x28(%rsp)
  0x00007fd3e11a87aa:   mov    %r13,0x30(%rsp)
  0x00007fd3e11a87af:   mov    %r11d,0x38(%rsp)
  0x00007fd3e11a87b4:   mov    %r10,0x40(%rsp)
  0x00007fd3e11a87b9:   mov    %r8,0x48(%rsp)
  0x00007fd3e11a87be:   mov    %r9d,0x3c(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a87c3:   nop
  0x00007fd3e11a87c4:   vzeroupper 
  0x00007fd3e11a87c7:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[24]=Oop [32]=Oop [40]=Oop [48]=Oop [64]=Oop }
                                                            ;*ifne {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.VectorMask::fromLong@40 (line 247)
                                                            ; - App::micro_vector_masked@101 (line 51)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a87cc:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a87d6:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a87da:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a87df:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B181: #	out( N2743 ) <- in( B67 )  Freq: 4.76815e-07
  0x00007fd3e11a87e0:   mov    $0xffffff45,%esi             ;*invokestatic broadcastCoerced {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a87e5:   mov    0x38(%rsp),%r10
  0x00007fd3e11a87ea:   mov    %r10,0x20(%rsp)
  0x00007fd3e11a87ef:   rex.W pushq 0x40(%rsp)
  0x00007fd3e11a87f4:   rex.W popq 0x38(%rsp)
  0x00007fd3e11a87f9:   mov    %rax,-0x8(%rsp)
  0x00007fd3e11a87fe:   mov    0x48(%rsp),%eax
  0x00007fd3e11a8802:   mov    %eax,0x34(%rsp)
  0x00007fd3e11a8806:   mov    -0x8(%rsp),%rax
  0x00007fd3e11a880b:   mov    %rax,-0x8(%rsp)
  0x00007fd3e11a8810:   mov    0x48(%rsp),%eax
  0x00007fd3e11a8814:   mov    %eax,0x40(%rsp)
  0x00007fd3e11a8818:   mov    -0x8(%rsp),%rax
  0x00007fd3e11a881d:   mov    %r8,0x50(%rsp)
  0x00007fd3e11a8822:   mov    %rbx,0x58(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8827:   nop
  0x00007fd3e11a8828:   vzeroupper 
  0x00007fd3e11a882b:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[24]=Oop [32]=Oop [40]=Oop [56]=Oop [80]=Oop [88]=Oop }
                                                            ;*if_icmpgt {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.IntVector::fromArray@20 (line 2721)
                                                            ; - App::micro_vector_masked@115 (line 52)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8830:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a883a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a883e:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8843:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B182: #	out( N2743 ) <- in( B69 )  Freq: 4.76814e-07
  0x00007fd3e11a8844:   mov    $0xffffff45,%esi             ;*invokestatic broadcastCoerced {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8849:   mov    0x38(%rsp),%r10
  0x00007fd3e11a884e:   mov    %r10,0x20(%rsp)
  0x00007fd3e11a8853:   rex.W pushq 0x40(%rsp)
  0x00007fd3e11a8858:   rex.W popq 0x38(%rsp)
  0x00007fd3e11a885d:   mov    %rax,-0x8(%rsp)
  0x00007fd3e11a8862:   mov    0x48(%rsp),%eax
  0x00007fd3e11a8866:   mov    %eax,0x34(%rsp)
  0x00007fd3e11a886a:   mov    -0x8(%rsp),%rax
  0x00007fd3e11a886f:   mov    %rax,-0x8(%rsp)
  0x00007fd3e11a8874:   mov    0x48(%rsp),%eax
  0x00007fd3e11a8878:   mov    %eax,0x40(%rsp)
  0x00007fd3e11a887c:   mov    -0x8(%rsp),%rax
  0x00007fd3e11a8881:   mov    %r8,0x50(%rsp)
  0x00007fd3e11a8886:   mov    %rdx,0x60(%rsp)
  0x00007fd3e11a888b:   mov    %r11d,0x44(%rsp)
  0x00007fd3e11a8890:   mov    %rbx,0x68(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8895:   nop
  0x00007fd3e11a8896:   nop
  0x00007fd3e11a8897:   nop
  0x00007fd3e11a8898:   vzeroupper 
  0x00007fd3e11a889b:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=NarrowOop [24]=Oop [32]=Oop [40]=Oop [56]=Oop [80]=Oop [96]=Oop [104]=Oop }
                                                            ;*if_acmpne {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.IntVector$IntSpecies::iota@6 (line 3662)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a88a0:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a88aa:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a88ae:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a88b3:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B183: #	out( N2743 ) <- in( B71 )  Freq: 4.76814e-07
  0x00007fd3e11a88b4:   mov    $0xffffff45,%esi             ;*invokevirtual invokeBasic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@26 (line 3211)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a88b9:   mov    0x38(%rsp),%r10
  0x00007fd3e11a88be:   mov    %r10,0x20(%rsp)
  0x00007fd3e11a88c3:   rex.W pushq 0x40(%rsp)
  0x00007fd3e11a88c8:   rex.W popq 0x38(%rsp)
  0x00007fd3e11a88cd:   mov    %rax,-0x8(%rsp)
  0x00007fd3e11a88d2:   mov    0x48(%rsp),%eax
  0x00007fd3e11a88d6:   mov    %eax,0x34(%rsp)
  0x00007fd3e11a88da:   mov    -0x8(%rsp),%rax
  0x00007fd3e11a88df:   mov    %rax,-0x8(%rsp)
  0x00007fd3e11a88e4:   mov    0x48(%rsp),%eax
  0x00007fd3e11a88e8:   mov    %eax,0x40(%rsp)
  0x00007fd3e11a88ec:   mov    -0x8(%rsp),%rax
  0x00007fd3e11a88f1:   mov    %r8,0x50(%rsp)
  0x00007fd3e11a88f6:   mov    %rbx,0x58(%rsp)
  0x00007fd3e11a88fb:   mov    %r11d,0x44(%rsp)
  0x00007fd3e11a8900:   vmovdqu %ymm0,0x60(%rsp)            ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8906:   nop
  0x00007fd3e11a8907:   nop
  0x00007fd3e11a8908:   vzeroupper 
  0x00007fd3e11a890b:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[24]=Oop [32]=Oop [40]=Oop [56]=Oop [80]=Oop [88]=Oop }
                                                            ;*ifeq {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.AbstractMask::checkIndexByLane@150 (line 240)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8910:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a891a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a891e:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8923:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B184: #	out( N2743 ) <- in( B78 )  Freq: 4.76803e-07
  0x00007fd3e11a8924:   mov    $0xffffff45,%esi             ;*invokevirtual broadcastBits {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8929:   mov    0x38(%rsp),%r11
  0x00007fd3e11a892e:   mov    %r11,0x18(%rsp)
  0x00007fd3e11a8933:   mov    %r10d,0x24(%rsp)
  0x00007fd3e11a8938:   mov    %r10d,0x30(%rsp)
  0x00007fd3e11a893d:   mov    %rax,0x38(%rsp)
  0x00007fd3e11a8942:   mov    %rbx,0x50(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8947:   nop
  0x00007fd3e11a8948:   vzeroupper 
  0x00007fd3e11a894b:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[24]=Oop [40]=Oop [56]=Oop [72]=Oop [80]=Oop }
                                                            ;*if_icmpgt {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.IntVector::fromArray@20 (line 2721)
                                                            ; - App::micro_vector_masked@129 (line 53)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8950:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a895a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a895e:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8963:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B185: #	out( N2743 ) <- in( B79 )  Freq: 4.76803e-07
  0x00007fd3e11a8964:   mov    $0xffffff45,%esi             ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8969:   mov    0x38(%rsp),%r9
  0x00007fd3e11a896e:   mov    %r9,0x18(%rsp)
  0x00007fd3e11a8973:   mov    %r10d,0x24(%rsp)
  0x00007fd3e11a8978:   mov    %r10d,0x30(%rsp)
  0x00007fd3e11a897d:   mov    %rax,0x38(%rsp)
  0x00007fd3e11a8982:   mov    %r11d,0x34(%rsp)
  0x00007fd3e11a8987:   mov    %rbx,0x60(%rsp)
  0x00007fd3e11a898c:   vzeroupper 
  0x00007fd3e11a898f:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=NarrowOop [24]=Oop [40]=Oop [56]=Oop [72]=Oop [96]=Oop }
                                                            ;*if_acmpne {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.IntVector$IntSpecies::iota@6 (line 3662)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@129 (line 53)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8994:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a899e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a89a2:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a89a7:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B186: #	out( N2743 ) <- in( B81 )  Freq: 4.76802e-07
  0x00007fd3e11a89a8:   mov    $0xffffff45,%esi             ;*invokevirtual dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a89ad:   mov    0x38(%rsp),%r9
  0x00007fd3e11a89b2:   mov    %r9,0x18(%rsp)
  0x00007fd3e11a89b7:   mov    %r10d,0x24(%rsp)
  0x00007fd3e11a89bc:   mov    %r10d,0x30(%rsp)
  0x00007fd3e11a89c1:   mov    %rax,0x38(%rsp)
  0x00007fd3e11a89c6:   mov    %rbx,0x50(%rsp)
  0x00007fd3e11a89cb:   mov    %r11d,0x34(%rsp)
  0x00007fd3e11a89d0:   vmovdqu %ymm1,0x60(%rsp)            ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a89d6:   nop
  0x00007fd3e11a89d7:   nop
  0x00007fd3e11a89d8:   vzeroupper 
  0x00007fd3e11a89db:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[24]=Oop [40]=Oop [56]=Oop [72]=Oop [80]=Oop }
                                                            ;*ifeq {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.AbstractMask::checkIndexByLane@150 (line 240)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@129 (line 53)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a89e0:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a89ea:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a89ee:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a89f3:   hlt                                 ;*invokestatic fromArray {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
 ;; B187: #	out( B188 ) <- in( B113 )  Freq: 1.57581e-07
  0x00007fd3e11a89f4:   mov    0x38(%rsp),%rdi
 ;; B188: #	out( N2743 ) <- in( B143 B187 )  Freq: 2.36371e-07
  0x00007fd3e11a89f9:   mov    $0xffffffe4,%esi
  0x00007fd3e11a89fe:   mov    0x48(%rsp),%r8d
  0x00007fd3e11a8a03:   mov    %rbx,0x28(%rsp)
  0x00007fd3e11a8a08:   mov    %rdi,0x30(%rsp)
  0x00007fd3e11a8a0d:   mov    %r8d,0x38(%rsp)
  0x00007fd3e11a8a12:   mov    %r10d,0x3c(%rsp)
  0x00007fd3e11a8a17:   mov    %r9,0x40(%rsp)
  0x00007fd3e11a8a1c:   mov    %r10d,0x48(%rsp)             ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8a21:   nop
  0x00007fd3e11a8a22:   nop
  0x00007fd3e11a8a23:   nop
  0x00007fd3e11a8a24:   vzeroupper 
  0x00007fd3e11a8a27:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[40]=Oop [48]=Oop [64]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::stOp@44 (line 355)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8a2c:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8a36:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8a3a:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8a3f:   hlt                                 ;*invokestatic checkFromIndexSize {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
 ;; B189: #	out( B190 ) <- in( B114 )  Freq: 1.57581e-07
  0x00007fd3e11a8a40:   mov    0x38(%rsp),%rdi
  0x00007fd3e11a8a45:   mov    %ebp,%r11d
  0x00007fd3e11a8a48:   mov    %r14d,%r8d
 ;; B190: #	out( N2743 ) <- in( B144 B189 )  Freq: 2.36371e-07
  0x00007fd3e11a8a4b:   mov    $0xffffffe4,%esi
  0x00007fd3e11a8a50:   mov    %r9,0x20(%rsp)
  0x00007fd3e11a8a55:   mov    %rbx,0x28(%rsp)
  0x00007fd3e11a8a5a:   mov    %r10d,0x1c(%rsp)
  0x00007fd3e11a8a5f:   mov    %rdi,0x30(%rsp)
  0x00007fd3e11a8a64:   mov    %r8d,0x38(%rsp)
  0x00007fd3e11a8a69:   mov    %r11d,0x3c(%rsp)             ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8a6e:   nop
  0x00007fd3e11a8a6f:   nop
  0x00007fd3e11a8a70:   vzeroupper 
  0x00007fd3e11a8a73:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[32]=Oop [40]=Oop [48]=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lambda$intoArray$82@5 (line 3006)
                                                            ; - jdk.incubator.vector.IntVector$$Lambda$67/0x00000008000ad640::apply@8
                                                            ; - jdk.incubator.vector.IntVector::stOp@45 (line 355)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8a78:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8a82:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8a86:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8a8b:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B191: #	out( N2743 ) <- in( B101 )  Freq: 9.99843e-08
  0x00007fd3e11a8a8c:   mov    $0xffffff45,%esi             ;*invokevirtual broadcastBits {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8a91:   mov    0x38(%rsp),%r10
  0x00007fd3e11a8a96:   mov    %r10,0x18(%rsp)
  0x00007fd3e11a8a9b:   mov    0x48(%rsp),%r11d
  0x00007fd3e11a8aa0:   mov    %r11d,%r10d
  0x00007fd3e11a8aa3:   mov    %r10d,0x24(%rsp)
  0x00007fd3e11a8aa8:   vzeroupper 
  0x00007fd3e11a8aab:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[24]=Oop [40]=Oop [48]=Oop }
                                                            ;*lookupswitch {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.IntVector$IntSpecies::iota@17 (line 3664)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@29 (line 3005)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8ab0:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8aba:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8abe:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8ac3:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B192: #	out( N2743 ) <- in( B103 )  Freq: 9.99841e-08
  0x00007fd3e11a8ac4:   mov    $0xffffffde,%esi             ;*aload_0 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@0 (line 3503)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8ac9:   nop
  0x00007fd3e11a8aca:   nop
  0x00007fd3e11a8acb:   nop
  0x00007fd3e11a8acc:   vzeroupper 
  0x00007fd3e11a8acf:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[32]=Oop [48]=Oop [56]=Oop }
                                                            ;*invokevirtual vec {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8ad4:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8ade:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8ae2:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8ae7:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B193: #	out( N2743 ) <- in( B110 B109 )  Freq: 1.78922e-07
  0x00007fd3e11a8ae8:   mov    $0xffffff76,%esi             ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8aed:   mov    %r9,0x20(%rsp)
  0x00007fd3e11a8af2:   mov    %rbx,0x28(%rsp)
  0x00007fd3e11a8af7:   mov    %eax,0x1c(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8afb:   nop
  0x00007fd3e11a8afc:   vzeroupper 
  0x00007fd3e11a8aff:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[32]=Oop [40]=Oop [56]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.IntVector::stOp@23 (line 353)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8b04:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8b0e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8b12:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8b17:   hlt    
 ;; B194: #	out( N2743 ) <- in( B119 )  Freq: 9.00506e-08
  0x00007fd3e11a8b18:   movabs $0x7fd3ed2fd078,%rdi         ;   {external_word}
  0x00007fd3e11a8b22:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8b26:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8b2b:   hlt    
 ;; B195: #	out( N2743 ) <- in( B120 )  Freq: 9.00506e-08
  0x00007fd3e11a8b2c:   movabs $0x7fd3ed2fd968,%rdi         ;   {external_word}
  0x00007fd3e11a8b36:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8b3a:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8b3f:   hlt    
 ;; B196: #	out( N2743 ) <- in( B121 )  Freq: 9.00505e-08
  0x00007fd3e11a8b40:   movabs $0x7fd3ed2fd968,%rdi         ;   {external_word}
  0x00007fd3e11a8b4a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8b4e:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8b53:   hlt    
 ;; B197: #	out( N2743 ) <- in( B122 )  Freq: 9.00504e-08
  0x00007fd3e11a8b54:   movabs $0x7fd3ed2fd078,%rdi         ;   {external_word}
  0x00007fd3e11a8b5e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8b62:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8b67:   hlt    
 ;; B198: #	out( N2743 ) <- in( B123 )  Freq: 9.00503e-08
  0x00007fd3e11a8b68:   movabs $0x7fd3ed2fd078,%rdi         ;   {external_word}
  0x00007fd3e11a8b72:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8b76:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8b7b:   hlt    
 ;; B199: #	out( N2743 ) <- in( B124 )  Freq: 9.00502e-08
  0x00007fd3e11a8b7c:   movabs $0x7fd3ed2fd078,%rdi         ;   {external_word}
  0x00007fd3e11a8b86:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8b8a:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8b8f:   hlt    
 ;; B200: #	out( N2743 ) <- in( B125 )  Freq: 9.00501e-08
  0x00007fd3e11a8b90:   movabs $0x7fd3ed2fd078,%rdi         ;   {external_word}
  0x00007fd3e11a8b9a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8b9e:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8ba3:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B201: #	out( N2743 ) <- in( B100 )  Freq: 4.76762e-08
  0x00007fd3e11a8ba4:   mov    $0xffffff45,%esi             ;*invokevirtual broadcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8ba9:   mov    0x38(%rsp),%r10
  0x00007fd3e11a8bae:   mov    %r10,0x18(%rsp)
  0x00007fd3e11a8bb3:   mov    0x48(%rsp),%r10d
  0x00007fd3e11a8bb8:   mov    %r10d,0x24(%rsp)
  0x00007fd3e11a8bbd:   mov    %rax,0x48(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8bc2:   nop
  0x00007fd3e11a8bc3:   nop
  0x00007fd3e11a8bc4:   vzeroupper 
  0x00007fd3e11a8bc7:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=NarrowOop [24]=Oop [40]=Oop [48]=Oop [72]=Oop }
                                                            ;*if_acmpne {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.IntVector$IntSpecies::iota@6 (line 3662)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@29 (line 3005)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8bcc:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8bd6:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8bda:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8bdf:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B202: #	out( N2743 ) <- in( B102 )  Freq: 4.76762e-08
  0x00007fd3e11a8be0:   mov    $0xffffff45,%esi             ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a8be5:   mov    0x38(%rsp),%r10
  0x00007fd3e11a8bea:   mov    %r10,0x18(%rsp)
  0x00007fd3e11a8bef:   mov    0x48(%rsp),%r11d
  0x00007fd3e11a8bf4:   mov    %r11d,%r10d
  0x00007fd3e11a8bf7:   mov    %r10d,0x24(%rsp)
  0x00007fd3e11a8bfc:   mov    0x30(%rsp),%r10
  0x00007fd3e11a8c01:   mov    %r10,0x28(%rsp)
  0x00007fd3e11a8c06:   mov    %r9,0x30(%rsp)
  0x00007fd3e11a8c0b:   mov    0x50(%rsp),%r11d
  0x00007fd3e11a8c10:   mov    %r11d,0x38(%rsp)
  0x00007fd3e11a8c15:   vmovdqu %ymm1,0x40(%rsp)            ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8c1b:   nop
  0x00007fd3e11a8c1c:   vzeroupper 
  0x00007fd3e11a8c1f:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[24]=Oop [40]=Oop [48]=Oop }
                                                            ;*ifeq {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.AbstractMask::checkIndexByLane@150 (line 240)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@29 (line 3005)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8c24:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8c2e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8c32:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8c37:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B203: #	out( N2743 ) <- in( B64 )  Freq: 1e-35
  0x00007fd3e11a8c38:   mov    $0xffffffde,%esi             ;*invokestatic broadcastCoerced {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8c3d:   mov    0x38(%rsp),%r10
  0x00007fd3e11a8c42:   mov    %r10,0x20(%rsp)
  0x00007fd3e11a8c47:   mov    0x40(%rsp),%r10
  0x00007fd3e11a8c4c:   mov    %r10,0x38(%rsp)
  0x00007fd3e11a8c51:   mov    0x48(%rsp),%r11d
  0x00007fd3e11a8c56:   mov    %r11d,0x34(%rsp)
  0x00007fd3e11a8c5b:   mov    %r8,0x48(%rsp)
  0x00007fd3e11a8c60:   vzeroupper 
  0x00007fd3e11a8c63:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=NarrowOop [24]=Oop [32]=Oop [40]=Oop [56]=Oop [72]=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@1 (line 2720)
                                                            ; - App::micro_vector_masked@115 (line 52)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8c68:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8c72:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8c76:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8c7b:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B204: #	out( N2743 ) <- in( B68 )  Freq: 1e-35
  0x00007fd3e11a8c7c:   mov    $0xffffffde,%esi             ;*invokestatic checkFromIndexSize {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a8c81:   mov    0x18(%rsp),%rbp
  0x00007fd3e11a8c86:   mov    0x38(%rsp),%r10
  0x00007fd3e11a8c8b:   mov    %r10,0x18(%rsp)
  0x00007fd3e11a8c90:   mov    0x28(%rsp),%r10
  0x00007fd3e11a8c95:   mov    %r10,0x20(%rsp)
  0x00007fd3e11a8c9a:   rex.W pushq 0x40(%rsp)
  0x00007fd3e11a8c9f:   rex.W popq 0x30(%rsp)
  0x00007fd3e11a8ca4:   mov    %rax,-0x8(%rsp)
  0x00007fd3e11a8ca9:   mov    0x48(%rsp),%eax
  0x00007fd3e11a8cad:   mov    %eax,0x2c(%rsp)
  0x00007fd3e11a8cb1:   mov    -0x8(%rsp),%rax
  0x00007fd3e11a8cb6:   mov    %rax,-0x8(%rsp)
  0x00007fd3e11a8cbb:   mov    0x48(%rsp),%eax
  0x00007fd3e11a8cbf:   mov    %eax,0x38(%rsp)
  0x00007fd3e11a8cc3:   mov    -0x8(%rsp),%rax
  0x00007fd3e11a8cc8:   mov    %r8,0x48(%rsp)
  0x00007fd3e11a8ccd:   mov    %rbx,0x58(%rsp)
  0x00007fd3e11a8cd2:   mov    %r11d,0x3c(%rsp)
  0x00007fd3e11a8cd7:   mov    %r8,0x60(%rsp)
  0x00007fd3e11a8cdc:   vzeroupper 
  0x00007fd3e11a8cdf:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop [48]=Oop [72]=Oop [88]=Oop [96]=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@1 (line 3311)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8ce4:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8cee:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8cf2:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8cf7:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B205: #	out( N2743 ) <- in( B76 )  Freq: 1e-35
  0x00007fd3e11a8cf8:   mov    $0xffffffde,%esi             ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8cfd:   mov    0x38(%rsp),%rbp
  0x00007fd3e11a8d02:   mov    0x28(%rsp),%r11
  0x00007fd3e11a8d07:   mov    %r11,0x20(%rsp)
  0x00007fd3e11a8d0c:   mov    %rax,0x28(%rsp)
  0x00007fd3e11a8d11:   mov    %r10d,0x3c(%rsp)             ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8d16:   nop
  0x00007fd3e11a8d17:   nop
  0x00007fd3e11a8d18:   vzeroupper 
  0x00007fd3e11a8d1b:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=Oop [32]=Oop [40]=Oop [60]=NarrowOop [72]=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@1 (line 2720)
                                                            ; - App::micro_vector_masked@129 (line 53)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8d20:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8d2a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8d2e:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8d33:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B206: #	out( N2743 ) <- in( B105 )  Freq: 1e-35
  0x00007fd3e11a8d34:   mov    $0xffffffde,%esi             ;*invokevirtual broadcastBits {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8d39:   mov    %ecx,0x1c(%rsp)              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8d3d:   nop
  0x00007fd3e11a8d3e:   nop
  0x00007fd3e11a8d3f:   nop
  0x00007fd3e11a8d40:   vzeroupper 
  0x00007fd3e11a8d43:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[28]=NarrowOop [32]=Oop [56]=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.Int256Vector::vec@4 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8d48:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8d52:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8d56:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8d5b:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B207: #	out( N2743 ) <- in( B107 )  Freq: 1e-35
  0x00007fd3e11a8d5c:   mov    $0xffffffde,%esi             ;*invokevirtual broadcastBits {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8d61:   mov    %r9,0x20(%rsp)
  0x00007fd3e11a8d66:   mov    %r11d,0x1c(%rsp)             ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8d6b:   nop
  0x00007fd3e11a8d6c:   vzeroupper 
  0x00007fd3e11a8d6f:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[28]=NarrowOop [32]=Oop [56]=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.Int256Vector$Int256Mask::getBits@4 (line 569)
                                                            ; - jdk.incubator.vector.IntVector::stOp@10 (line 352)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8d74:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8d7e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8d82:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8d87:   hlt    
 ;; B208: #	out( N2743 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007fd3e11a8d88:   mov    $0xfffffff6,%esi             ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8d8d:   nop
  0x00007fd3e11a8d8e:   nop
  0x00007fd3e11a8d8f:   nop
  0x00007fd3e11a8d90:   vzeroupper 
  0x00007fd3e11a8d93:   callq  0x00007fd3e1116540           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector_masked@16 (line 43)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8d98:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8da2:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8da6:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8dab:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B209: #	out( N2743 ) <- in( B2 )  Freq: 1.01328e-06
  0x00007fd3e11a8dac:   mov    $0xfffffff6,%esi             ;*invokespecial broadcastTemplate {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8db1:   mov    %ebx,%ebp                    ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8db3:   nop
  0x00007fd3e11a8db4:   vzeroupper 
  0x00007fd3e11a8db7:   callq  0x00007fd3e1116540           ; ImmutableOopMap {}
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector_masked@17 (line 43)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8dbc:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8dc6:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8dca:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8dcf:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B210: #	out( N2743 ) <- in( B61 )  Freq: 1.01324e-06
  0x00007fd3e11a8dd0:   mov    $0xfffffff4,%esi             ;*synchronization entry
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@-1 (line 3503)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8dd5:   mov    0x18(%rsp),%rbp              ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8dda:   nop
  0x00007fd3e11a8ddb:   nop
  0x00007fd3e11a8ddc:   vzeroupper 
  0x00007fd3e11a8ddf:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=Oop [40]=Oop [56]=Oop [64]=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
                                                            ; - jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
                                                            ; - jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
                                                            ; - App::micro_vector_masked@101 (line 51)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8de4:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8dee:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8df2:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8df7:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B211: #	out( N2743 ) <- in( B63 )  Freq: 1.01323e-06
  0x00007fd3e11a8df8:   mov    $0xfffffff4,%esi             ;*synchronization entry
                                                            ; - jdk.incubator.vector.AbstractSpecies::laneCount@-1 (line 125)
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@14 (line 3210)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a8dfd:   mov    0x18(%rsp),%rbp
  0x00007fd3e11a8e02:   mov    0x38(%rsp),%r10
  0x00007fd3e11a8e07:   mov    %r10,0x18(%rsp)
  0x00007fd3e11a8e0c:   mov    0x28(%rsp),%r10
  0x00007fd3e11a8e11:   mov    %r10,0x20(%rsp)
  0x00007fd3e11a8e16:   mov    0x40(%rsp),%r10
  0x00007fd3e11a8e1b:   mov    %r10,0x30(%rsp)
  0x00007fd3e11a8e20:   mov    %r8,0x40(%rsp)               ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8e25:   nop
  0x00007fd3e11a8e26:   nop
  0x00007fd3e11a8e27:   nop
  0x00007fd3e11a8e28:   vzeroupper 
  0x00007fd3e11a8e2b:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop [48]=Oop [64]=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@1 (line 2720)
                                                            ; - App::micro_vector_masked@115 (line 52)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8e30:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8e3a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8e3e:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8e43:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B212: #	out( N2743 ) <- in( B66 )  Freq: 1.01323e-06
  0x00007fd3e11a8e44:   mov    $0xfffffff6,%esi             ;*invokestatic fromArray {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector_masked@32 (line 44)
  0x00007fd3e11a8e49:   nop
  0x00007fd3e11a8e4a:   nop
  0x00007fd3e11a8e4b:   nop
  0x00007fd3e11a8e4c:   vzeroupper 
  0x00007fd3e11a8e4f:   callq  0x00007fd3e1116540           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@12 (line 2721)
                                                            ; - App::micro_vector_masked@115 (line 52)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8e54:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8e5e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8e62:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8e67:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B213: #	out( N2743 ) <- in( B75 )  Freq: 1.01321e-06
  0x00007fd3e11a8e68:   mov    $0xfffffff4,%esi             ;*aload_0 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@0
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8e6d:   mov    0x38(%rsp),%rbp
  0x00007fd3e11a8e72:   mov    0x28(%rsp),%r10
  0x00007fd3e11a8e77:   mov    %r10,0x20(%rsp)
  0x00007fd3e11a8e7c:   vzeroupper 
  0x00007fd3e11a8e7f:   callq  0x00007fd3e1116540           ; ImmutableOopMap {rbp=Oop [32]=Oop [64]=Oop [72]=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@1 (line 2720)
                                                            ; - App::micro_vector_masked@129 (line 53)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8e84:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8e8e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8e92:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8e97:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B214: #	out( N2743 ) <- in( B77 )  Freq: 1.01321e-06
  0x00007fd3e11a8e98:   mov    $0xfffffff6,%esi             ;*invokevirtual broadcastBits {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8e9d:   nop
  0x00007fd3e11a8e9e:   nop
  0x00007fd3e11a8e9f:   nop
  0x00007fd3e11a8ea0:   vzeroupper 
  0x00007fd3e11a8ea3:   callq  0x00007fd3e1116540           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@12 (line 2721)
                                                            ; - App::micro_vector_masked@129 (line 53)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8ea8:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8eb2:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8eb6:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8ebb:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B215: #	out( N2743 ) <- in( B88 )  Freq: 1.01314e-06
  0x00007fd3e11a8ebc:   mov    $0xfffffff6,%esi             ;*synchronization entry
                                                            ; - java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@-1
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8ec1:   nop
  0x00007fd3e11a8ec2:   nop
  0x00007fd3e11a8ec3:   nop
  0x00007fd3e11a8ec4:   vzeroupper 
  0x00007fd3e11a8ec7:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[32]=Oop [56]=Oop }
                                                            ;*invokevirtual intoArray {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8ecc:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8ed6:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8eda:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8edf:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B216: #	out( N2743 ) <- in( B99 )  Freq: 1.01312e-07
  0x00007fd3e11a8ee0:   mov    $0xfffffff6,%esi             ;*invokedynamic {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8ee5:   nop
  0x00007fd3e11a8ee6:   nop
  0x00007fd3e11a8ee7:   nop
  0x00007fd3e11a8ee8:   vzeroupper 
  0x00007fd3e11a8eeb:   callq  0x00007fd3e1116540           ; ImmutableOopMap {}
                                                            ;*invokevirtual iota {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@29 (line 3005)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8ef0:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8efa:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8efe:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8f03:   hlt                                 ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
 ;; B217: #	out( N2743 ) <- in( B104 )  Freq: 1.01312e-07
  0x00007fd3e11a8f04:   mov    $0xfffffff4,%esi             ;*i2l {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::toBits@1 (line 403)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::longToElementBits@21 (line 3531)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::broadcast@3 (line 3519)
                                                            ; - jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
                                                            ; - jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
                                                            ; - jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
                                                            ; - jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
                                                            ; - App::micro_vector_masked@115 (line 52)
  0x00007fd3e11a8f09:   nop
  0x00007fd3e11a8f0a:   nop
  0x00007fd3e11a8f0b:   nop
  0x00007fd3e11a8f0c:   vzeroupper 
  0x00007fd3e11a8f0f:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[32]=Oop [56]=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.Int256Vector::vec@4 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8f14:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8f1e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8f22:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8f27:   hlt    
 ;; B218: #	out( N2743 ) <- in( B106 )  Freq: 1.01312e-07
  0x00007fd3e11a8f28:   mov    $0xfffffff4,%esi
  0x00007fd3e11a8f2d:   mov    %r9,0x20(%rsp)               ;*synchronization entry
                                                            ; - jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
                                                            ; - jdk.incubator.vector.Int256Vector::vec@1 (line 117)
                                                            ; - jdk.incubator.vector.IntVector::stOp@1 (line 351)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
  0x00007fd3e11a8f32:   nop
  0x00007fd3e11a8f33:   nop
  0x00007fd3e11a8f34:   vzeroupper 
  0x00007fd3e11a8f37:   callq  0x00007fd3e1116540           ; ImmutableOopMap {[32]=Oop [56]=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.Int256Vector$Int256Mask::getBits@4 (line 569)
                                                            ; - jdk.incubator.vector.IntVector::stOp@10 (line 352)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
                                                            ; - App::micro_vector_masked@148 (line 54)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd3e11a8f3c:   movabs $0x7fd3ed1657b8,%rdi         ;   {external_word}
  0x00007fd3e11a8f46:   and    $0xfffffffffffffff0,%rsp
  0x00007fd3e11a8f4a:   callq  0x00007fd3ec92aff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd3e11a8f4f:   hlt    
 ;; B219: #	out( B227 ) <- in( B153 )  Freq: 1.00009e-09
  0x00007fd3e11a8f50:   jmpq   0x00007fd3e11a8f79           ;*invokespecial fromArray0Template {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
 ;; B220: #	out( B229 ) <- in( B151 )  Freq: 1.00012e-09
  0x00007fd3e11a8f55:   jmpq   0x00007fd3e11a8f7e
 ;; B221: #	out( B230 ) <- in( B149 )  Freq: 1.01028e-09
  0x00007fd3e11a8f5a:   mov    %rax,%rsi
  0x00007fd3e11a8f5d:   nop
  0x00007fd3e11a8f5e:   nop
  0x00007fd3e11a8f5f:   nop
  0x00007fd3e11a8f60:   jmpq   0x00007fd3e11a8f81
 ;; B222: #	out( B230 ) <- in( B98 )  Freq: 9.99864e-07
  0x00007fd3e11a8f65:   mov    %rax,%rsi
  0x00007fd3e11a8f68:   jmp    0x00007fd3e11a8f81
 ;; B223: #	out( B230 ) <- in( B87 )  Freq: 9.99885e-06
  0x00007fd3e11a8f6a:   mov    %rax,%rsi
  0x00007fd3e11a8f6d:   jmp    0x00007fd3e11a8f81
 ;; B224: #	out( B230 ) <- in( B86 )  Freq: 9.99905e-06
  0x00007fd3e11a8f6f:   mov    %rax,%rsi
  0x00007fd3e11a8f72:   jmp    0x00007fd3e11a8f81
 ;; B225: #	out( B230 ) <- in( B60 )  Freq: 9.99977e-06
  0x00007fd3e11a8f74:   mov    %rax,%rsi
  0x00007fd3e11a8f77:   jmp    0x00007fd3e11a8f81
 ;; B226: #	out( B227 ) <- in( B84 )  Freq: 9.99926e-06
 ;; B227: #	out( B230 ) <- in( B219 B226 )  Freq: 1.00003e-05
  0x00007fd3e11a8f79:   mov    %rax,%rsi
  0x00007fd3e11a8f7c:   jmp    0x00007fd3e11a8f81           ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
                                                            ; - App::micro_vector_masked@32 (line 44)
 ;; B228: #	out( B229 ) <- in( B74 )  Freq: 9.9995e-06
 ;; B229: #	out( B230 ) <- in( B220 B228 )  Freq: 1.00005e-05
  0x00007fd3e11a8f7e:   mov    %rax,%rsi                    ;*ifne {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
                                                            ; - App::micro_vector_masked@17 (line 43)
 ;; B230: #	out( N2743 ) <- in( B224 B227 B229 B223 B221 B222 B225 )  Freq: 5.09993e-05
  0x00007fd3e11a8f81:   vzeroupper 
  0x00007fd3e11a8f84:   add    $0x90,%rsp
  0x00007fd3e11a8f8b:   pop    %rbp
  0x00007fd3e11a8f8c:   jmpq   0x00007fd3e10549a0           ;*getstatic TYPE {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::elementType@0 (line 3476)
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@10 (line 3210)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector_masked@32 (line 44)
                                                            ;   {runtime_call _rethrow_Java}
  0x00007fd3e11a8f91:   movabs $0x7fd3e11a7e39,%r10         ;   {internal_word}
  0x00007fd3e11a8f9b:   mov    %r10,0x3e8(%r15)
  0x00007fd3e11a8fa2:   jmpq   0x00007fd3e1117220           ;   {runtime_call SafepointBlob}
  0x00007fd3e11a8fa7:   hlt    
  0x00007fd3e11a8fa8:   hlt    
  0x00007fd3e11a8fa9:   hlt    
  0x00007fd3e11a8faa:   hlt    
  0x00007fd3e11a8fab:   hlt    
  0x00007fd3e11a8fac:   hlt    
  0x00007fd3e11a8fad:   hlt    
  0x00007fd3e11a8fae:   hlt    
  0x00007fd3e11a8faf:   hlt    
  0x00007fd3e11a8fb0:   hlt    
  0x00007fd3e11a8fb1:   hlt    
  0x00007fd3e11a8fb2:   hlt    
  0x00007fd3e11a8fb3:   hlt    
  0x00007fd3e11a8fb4:   hlt    
  0x00007fd3e11a8fb5:   hlt    
  0x00007fd3e11a8fb6:   hlt    
  0x00007fd3e11a8fb7:   hlt    
  0x00007fd3e11a8fb8:   hlt    
  0x00007fd3e11a8fb9:   hlt    
  0x00007fd3e11a8fba:   hlt    
  0x00007fd3e11a8fbb:   hlt    
  0x00007fd3e11a8fbc:   hlt    
  0x00007fd3e11a8fbd:   hlt    
  0x00007fd3e11a8fbe:   hlt    
  0x00007fd3e11a8fbf:   hlt    
[Stub Code]
  0x00007fd3e11a8fc0:   movabs $0x0,%rbx                    ;   {no_reloc}
  0x00007fd3e11a8fca:   jmpq   0x00007fd3e11a8fca           ;   {runtime_call}
  0x00007fd3e11a8fcf:   movabs $0x0,%rbx                    ;   {static_stub}
  0x00007fd3e11a8fd9:   jmpq   0x00007fd3e11a8fd9           ;   {runtime_call}
  0x00007fd3e11a8fde:   movabs $0x0,%rbx                    ;   {static_stub}
  0x00007fd3e11a8fe8:   jmpq   0x00007fd3e11a8fe8           ;   {runtime_call}
[Exception Handler]
  0x00007fd3e11a8fed:   jmpq   0x00007fd3e105c6a0           ;   {runtime_call ExceptionBlob}
[Deopt Handler Code]
  0x00007fd3e11a8ff2:   callq  0x00007fd3e11a8ff7
  0x00007fd3e11a8ff7:   subq   $0x5,(%rsp)
  0x00007fd3e11a8ffc:   jmpq   0x00007fd3e1116860           ;   {runtime_call DeoptimizationBlob}
  0x00007fd3e11a9001:   hlt    
  0x00007fd3e11a9002:   hlt    
  0x00007fd3e11a9003:   hlt    
  0x00007fd3e11a9004:   hlt    
  0x00007fd3e11a9005:   hlt    
  0x00007fd3e11a9006:   hlt    
  0x00007fd3e11a9007:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007fd3e11a9008:   0x000000010188fc10 a 'java/lang/Class'{0x000000010188fc10} = 'jdk/incubator/vector/IntMaxVector'
  0x00007fd3e11a9010:   0x0000000101c35c58 a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
  0x00007fd3e11a9018:   0x0000000101c29e60 a 'java/lang/invoke/DirectMethodHandle$Constructor'{0x0000000101c29e60}
  0x00007fd3e11a9020:   0x000000010188b460 a 'java/lang/Class'{0x000000010188b460} = 'jdk/incubator/vector/Int256Vector'
  0x00007fd3e11a9028:   0x000000010188b500 a 'java/lang/Class'{0x000000010188b500} = 'jdk/incubator/vector/Int256Vector$Int256Mask'
  0x00007fd3e11a9030:   0x000000010110df10 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110df10}
  0x00007fd3e11a9038:   0x0000000101127628 a 'java/lang/Class'{0x0000000101127628} = 'java/lang/invoke/LambdaForm$MH+0x0000000800005800'
  0x00007fd3e11a9040:   0x0000000101bf3650 a 'java/lang/Class'{0x0000000101bf3650} = 'java/lang/invoke/LambdaForm$MH+0x00000008000d5000'
  0x00007fd3e11a9048:   0x0000000101bec7c8 a 'java/lang/Class'{0x0000000101bec7c8} = 'java/lang/invoke/LambdaForm$DMH+0x00000008000d4800'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007fd3e11a9050:   0x00007fd398811948 {method} {0x00007fd398811948} 'micro_vector_masked' '([I[I[I)V' in 'App'
  0x00007fd3e11a9058:   0x00007fd398812e38 {method} {0x00007fd398812e38} 'intoArray' '([IILjdk/incubator/vector/VectorMask;)V' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a9060:   0x00007fd39881d998 {method} {0x00007fd39881d998} 'stOp' '(Ljava/lang/Object;ILjdk/incubator/vector/VectorMask;Ljdk/incubator/vector/IntVector$FStOp;)V' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a9068:   0x00007fd398a4a240 {method} {0x00007fd398a4a240} 'vec' '()[I' in 'jdk/incubator/vector/Int256Vector'
  0x00007fd3e11a9070:   0x00007fd39853f890 {method} {0x00007fd39853f890} 'getPayload' '()Ljava/lang/Object;' in 'jdk/internal/vm/vector/VectorSupport$VectorPayload'
  0x00007fd3e11a9078:   0x00007fd398812728 {method} {0x00007fd398812728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a9080:   0x00007fd398a184c0 {method} {0x00007fd398a184c0} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fd3e11a9088:   0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fd3e11a9090:   0x00007fd398a84090 {method} {0x00007fd398a84090} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007fd3e11a9098:   0x00007fd398a4d300 {method} {0x00007fd398a4d300} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fd3e11a90a0:   0x00007fd398813798 {method} {0x00007fd398813798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a90a8:   0x0000000800098110 'jdk/incubator/vector/Int256Vector'
  0x00007fd3e11a90b0:   0x00007fd398560ca0 {method} {0x00007fd398560ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
  0x00007fd3e11a90b8:   0x00007fd39881f8d8 {method} {0x00007fd39881f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a90c0:   0x00007fd398a4e770 {method} {0x00007fd398a4e770} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fd3e11a90c8:   0x00007fd398a4b6d0 {method} {0x00007fd398a4b6d0} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fd3e11a90d0:   0x00007fd39881e8d8 {method} {0x00007fd39881e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a90d8:   0x00007fd39881c2c8 {method} {0x00007fd39881c2c8} 'opCode' '(Ljdk/incubator/vector/VectorOperators$Operator;)I' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a90e0:   0x00007fd398a146b8 {method} {0x00007fd398a146b8} 'opCode' '(Ljdk/incubator/vector/VectorOperators$Operator;II)I' in 'jdk/incubator/vector/VectorOperators'
  0x00007fd3e11a90e8:   0x00007fd398aeee40 {method} {0x00007fd398aeee40} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fd3e11a90f0:   0x00007fd398a0a230 {method} {0x00007fd398a0a230} 'check' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractVector'
  0x00007fd3e11a90f8:   0x0000000800040000 {type array bool}
  0x00007fd3e11a9100:   0x00007fd398812d08 {method} {0x00007fd398812d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a9108:   0x00007fd39880aa78 {method} {0x00007fd39880aa78} 'linkToTargetMethod' '(Ljava/lang/Object;)Ljava/lang/Object;' in 'java/lang/invoke/LambdaForm$MH+0x0000000800005800'
  0x00007fd3e11a9110:   0x00007fd398a34820 {method} {0x00007fd398a34820} 'fromLong' '(Ljdk/incubator/vector/VectorSpecies;J)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
  0x00007fd3e11a9118:   0x00007fd398a34518 {method} {0x00007fd398a34518} 'fromValues' '(Ljdk/incubator/vector/VectorSpecies;[Z)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
  0x00007fd3e11a9120:   0x00007fd398a34658 {method} {0x00007fd398a34658} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[ZI)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
  0x00007fd3e11a9128:   0x00007fd398a1e098 {method} {0x00007fd398a1e098} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fd3e11a9130:   0x0000000800098750 'jdk/incubator/vector/Int256Vector$Int256Mask'
  0x00007fd3e11a9138:   0x00007fd398a00408 {method} {0x00007fd398a00408} 'arrayAddress' '([II)J' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a9140:   0x00000008000acb58 'jdk/incubator/vector/IntVector$$Lambda$63+0x00000008000acb58'
  0x00007fd3e11a9148:   0x00007fd398a49c80 {method} {0x00007fd398a49c80} 'vspecies' '()Ljdk/incubator/vector/IntVector$IntSpecies;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fd3e11a9150:   0x00007fd398812880 {method} {0x00007fd398812880} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[IILjdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a9158:   0x00007fd398a1eb98 {method} {0x00007fd398a1eb98} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fd3e11a9160:   0x00007fd39881faa8 {method} {0x00007fd39881faa8} 'add' '(Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a9168:   0x00007fd39881ea38 {method} {0x00007fd39881ea38} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a9170:   0x00007fd398aeef18 {method} {0x00007fd398aeef18} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fd3e11a9178:   0x00007fd398a84398 {method} {0x00007fd398a84398} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007fd3e11a9180:   0x0000000800040c30 {type array int}
  0x00007fd3e11a9188:   0x00007fd39881c490 {method} {0x00007fd39881c490} 'opKind' '(Ljdk/incubator/vector/VectorOperators$Operator;I)Z' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a9190:   0x00007fd398a14798 {method} {0x00007fd398a14798} 'opKind' '(Ljdk/incubator/vector/VectorOperators$Operator;I)Z' in 'jdk/incubator/vector/VectorOperators'
  0x00007fd3e11a9198:   0x00007fd398a83e80 {method} {0x00007fd398a83e80} 'requireLength' '(II)V' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007fd3e11a91a0:   0x00007fd398a000f8 {method} {0x00007fd398a000f8} 'checkMaskFromIndexSize' '(ILjdk/incubator/vector/IntVector$IntSpecies;Ljdk/incubator/vector/VectorMask;II)V' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a91a8:   0x00007fd398a33148 {method} {0x00007fd398a33148} 'checkIndexByLane' '(IILjdk/incubator/vector/Vector;I)V' in 'jdk/incubator/vector/AbstractMask'
  0x00007fd3e11a91b0:   0x00007fd398a332d8 {method} {0x00007fd398a332d8} 'checkIndex0' '(IILjdk/incubator/vector/Vector;I)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/AbstractMask'
  0x00007fd3e11a91b8:   0x00007fd398a4f8c8 {method} {0x00007fd398a4f8c8} 'broadcast' '(J)Ljdk/incubator/vector/Vector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fd3e11a91c0:   0x00007fd398a4a400 {method} {0x00007fd398a4a400} 'broadcast' '(J)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fd3e11a91c8:   0x00007fd39881e4c0 {method} {0x00007fd39881e4c0} 'broadcastTemplate' '(J)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a91d0:   0x00007fd398a17f88 {method} {0x00007fd398a17f88} 'broadcast' '(J)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fd3e11a91d8:   0x00007fd398b25e80 {method} {0x00007fd398b25e80} 'linkToTargetMethod' '(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;' in 'java/lang/invoke/LambdaForm$MH+0x00000008000d5000'
  0x00007fd3e11a91e0:   0x00007fd398b24f00 {method} {0x00007fd398b24f00} 'newInvokeSpecial' '(Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;' in 'java/lang/invoke/LambdaForm$DMH+0x00000008000d4800'
  0x00007fd3e11a91e8:   0x00007fd3984820b0 {method} {0x00007fd3984820b0} 'allocateInstance' '(Ljava/lang/Object;)Ljava/lang/Object;' in 'java/lang/invoke/DirectMethodHandle'
  0x00007fd3e11a91f0:   0x00007fd398a17dc0 {method} {0x00007fd398a17dc0} 'broadcastBits' '(J)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fd3e11a91f8:   0x00007fd398a18ea8 {method} {0x00007fd398a18ea8} 'iota' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fd3e11a9200:   0x00007fd398baad20 {method} {0x00007fd398baad20} 'apply' '(Ljava/lang/Object;III)V' in 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'
  0x00007fd3e11a9208:   0x00007fd398a04120 {method} {0x00007fd398a04120} 'lambda$intoArray$82' '([IIII)V' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a9210:   0x00007fd398a522f0 {method} {0x00007fd398a522f0} 'getBits' '()[Z' in 'jdk/incubator/vector/Int256Vector$Int256Mask'
  0x00007fd3e11a9218:   0x00007fd398a1d690 {method} {0x00007fd398a1d690} 'laneCount' '()I' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fd3e11a9220:   0x00007fd398a18088 {method} {0x00007fd398a18088} 'longToElementBits' '(J)J' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fd3e11a9228:   0x00007fd39881ddf0 {method} {0x00007fd39881ddf0} 'toBits' '(I)J' in 'jdk/incubator/vector/IntVector'
  0x00007fd3e11a9230:   0x00007fd398a17a40 {method} {0x00007fd398a17a40} 'elementType' '()Ljava/lang/Class;' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fd3e11a9238:   0x00007fd398a1d5c0 {method} {0x00007fd398a1d5c0} 'length' '()I' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fd3e11a9240:   0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
  0x00007fd3e11a9248:   0x00007fd398aef2a8 {method} {0x00007fd398aef2a8} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fd3e11a9250:   0x00007fd398a118b0 {method} {0x00007fd398a118b0} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
  0x00007fd3e11a9258:   0x00000008000a37e8 'jdk/incubator/vector/VectorOperators$ComparisonImpl'
  0x00007fd3e11a9260:   0x00007fd398a320f8 {method} {0x00007fd398a320f8} 'vectorSpecies' '()Ljdk/incubator/vector/VectorSpecies;' in 'jdk/incubator/vector/AbstractMask'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007fd3e11a751f offset=ffffffff bits=0):
PcDesc(pc=0x00007fd3e11a7563 offset=43 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7566 offset=46 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7572 offset=52 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a757c offset=5c bits=0):   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7580 offset=60 bits=0):   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@42 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a75c9 offset=a9 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a75cd offset=ad bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@34 (line 3209)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a75eb offset=cb bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a75f9 offset=d9 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a75fb offset=db bits=0):   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7600 offset=e0 bits=0):   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7609 offset=e9 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7610 offset=f0 bits=0):   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7619 offset=f9 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7620 offset=100 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a762e offset=10e bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7635 offset=115 bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a763c offset=11c bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a763f offset=11f bits=1):   App::micro_vector_masked@76 (line 43)  reexecute=true
   Locals
    - l0: stack[24],oop
    - l1: stack[56],oop
    - l2: reg r14 [28],oop
    - l3: reg r13 [26],oop
    - l4: reg r11 [22],int
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a7696 offset=176 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7699 offset=179 bits=0):   jdk.incubator.vector.AbstractVector::check@2 (line 124)
   jdk.incubator.vector.IntVector::lanewiseTemplate@7 (line 602)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a76ad offset=18d bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a76b4 offset=194 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a76c5 offset=1a5 bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a76cc offset=1ac bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a76d2 offset=1b2 bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a773d offset=21d bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@6 (line 3210)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7773 offset=253 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7779 offset=259 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector_masked@59 (line 46)
PcDesc(pc=0x00007fd3e11a777d offset=25d bits=0):   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
   jdk.incubator.vector.IntVector::intoArray@37 (line 2964)
   App::micro_vector_masked@59 (line 46)
PcDesc(pc=0x00007fd3e11a77d4 offset=2b4 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a77da offset=2ba bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@10 (line 3210)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a77e0 offset=2c0 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a77e3 offset=2c3 bits=0):   jdk.incubator.vector.VectorMask::fromArray@21 (line 209)
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a77e8 offset=2c8 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a77f2 offset=2d2 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a77f7 offset=2d7 bits=0):   App::micro_vector_masked@17 (line 43)
PcDesc(pc=0x00007fd3e11a77fc offset=2dc bits=0):   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
   jdk.incubator.vector.IntVector::fromArray0Template@26 (line 3211)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7830 offset=310 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7836 offset=316 bits=0):   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a784d offset=32d bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7852 offset=332 bits=0):   jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a787b offset=35b bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7881 offset=361 bits=0):   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
   App::micro_vector_masked@17 (line 43)
PcDesc(pc=0x00007fd3e11a7891 offset=371 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a78ad offset=38d bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a78b4 offset=394 bits=1):   jdk.incubator.vector.VectorMask::fromLong@135 (line 255)  reexecute=true
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: reg r10 [20],oop
    - l4: empty
    - l5: 0
    - l6: reg rdx [4],long
    - l7: reg rsi [12],oop
    - l8: reg rax [0],int
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: stack[24],oop
    - l1: stack[56],oop
    - l2: reg r14 [28],oop
    - l3: reg r13 [26],oop
    - l4: reg xmm3 [96],int
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a7919 offset=3f9 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a791c offset=3fc bits=0):   jdk.incubator.vector.IntVector::intoArray@31 (line 2964)
   App::micro_vector_masked@59 (line 46)
PcDesc(pc=0x00007fd3e11a792d offset=40d bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7933 offset=413 bits=0):   jdk.incubator.vector.IntVector::intoArray@37 (line 2964)
   App::micro_vector_masked@59 (line 46)
PcDesc(pc=0x00007fd3e11a7946 offset=426 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7968 offset=448 bits=0):   jdk.incubator.vector.IntVector::fromArray@8 (line 2689)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7998 offset=478 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a79a8 offset=488 bits=0):   jdk.incubator.vector.IntVector::fromArray@8 (line 2689)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a79d4 offset=4b4 bits=4):   jdk.incubator.vector.VectorMask::fromArray@46 (line 208)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
    - l8: empty
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: stack[24],oop
    - l1: stack[56],oop
    - l2: stack[64],oop
    - l3: stack[40],oop
    - l4: stack[72]
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a79f6 offset=4d6 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a79ff offset=4df bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@20 (line 3211)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7a04 offset=4e4 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7a07 offset=4e7 bits=0):   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7a13 offset=4f3 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7a1d offset=4fd bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@20 (line 3211)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7a34 offset=514 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7a37 offset=517 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7a49 offset=529 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7a4d offset=52d bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@10 (line 775)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7a54 offset=534 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7a5d offset=53d bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7a60 offset=540 bits=0):   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7a6c offset=54c bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7a6f offset=54f bits=0):   jdk.incubator.vector.IntVector::arrayAddress@9 (line 3349)
   jdk.incubator.vector.IntVector::fromArray0Template@20 (line 3211)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7a7b offset=55b bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7a7f offset=55f bits=0):   jdk.incubator.vector.IntVector::lanewiseTemplate@222 (line 634)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7aa0 offset=580 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7aaa offset=58a bits=0):   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7ad7 offset=5b7 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7adb offset=5bb bits=0):   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
   jdk.incubator.vector.IntVector::fromArray0Template@26 (line 3211)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7aea offset=5ca bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7afe offset=5de bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7b07 offset=5e7 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7b0d offset=5ed bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7b48 offset=628 bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@16 (line 775)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7b4c offset=62c bits=0):   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7b9a offset=67a bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7b9e offset=67e bits=0):   jdk.incubator.vector.Int256Vector::vspecies@-1 (line 86)
   jdk.incubator.vector.IntVector::fromArray0Template@1 (line 3208)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7bb0 offset=690 bits=4):   jdk.incubator.vector.IntVector::fromArray@64 (line 2728)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[56],oop
    - l2: empty
    - l3: stack[40],oop
    - l4: stack[24]
    - l5: empty
    - l6: empty
    - l7: stack[48],oop
PcDesc(pc=0x00007fd3e11a7bb5 offset=695 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7bb9 offset=699 bits=0):   App::micro_vector_masked@-1 (line 32)
PcDesc(pc=0x00007fd3e11a7bd7 offset=6b7 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7bdf offset=6bf bits=0):   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7be3 offset=6c3 bits=0):   jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 296)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7bf7 offset=6d7 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7bfa offset=6da bits=0):   jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 296)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7c0c offset=6ec bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7c0f offset=6ef bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7c26 offset=706 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7c29 offset=709 bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@24 (line 775)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7c43 offset=723 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7c4d offset=72d bits=0):   jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7c76 offset=756 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7c7a offset=75a bits=0):   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7c8f offset=76f bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7ca3 offset=783 bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7caa offset=78a bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7cb0 offset=790 bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7ce0 offset=7c0 bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@26 (line 775)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7ce4 offset=7c4 bits=0):   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7d32 offset=812 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7d36 offset=816 bits=0):   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7d48 offset=828 bits=4):   jdk.incubator.vector.IntVector::fromArray@64 (line 2728)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
    - l4: stack[72]
    - l5: stack[64],oop
    - l6: empty
    - l7: stack[32],oop
PcDesc(pc=0x00007fd3e11a7d59 offset=839 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7d63 offset=843 bits=0):   jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7d78 offset=858 bits=4):   jdk.incubator.vector.IntVector::lanewise@70 (line 688)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: stack[32],oop
    - l4: empty
    - l5: empty
   Expression stack
    - @0: reg rbp [10],oop
   jdk.incubator.vector.IntVector::add@6 (line 1133)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   App::micro_vector_masked@140 (line 54)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
    - l4: stack[72]
    - l5: empty
    - l6: empty
    - l7: stack[32],oop
PcDesc(pc=0x00007fd3e11a7d83 offset=863 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7d98 offset=878 bits=4):   jdk.incubator.vector.IntVector::lanewise@74 (line 688)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
   jdk.incubator.vector.IntVector::add@6 (line 1133)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   App::micro_vector_masked@140 (line 54)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
    - l4: stack[72]
    - l5: empty
    - l6: empty
    - l7: stack[32],oop
PcDesc(pc=0x00007fd3e11a7dae offset=88e bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7db2 offset=892 bits=0):   jdk.incubator.vector.IntVector::lanewiseTemplate@233 (line 634)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7df2 offset=8d2 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7df8 offset=8d8 bits=0):   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7e03 offset=8e3 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7e09 offset=8e9 bits=0):   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7e17 offset=8f7 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7e1b offset=8fb bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCodeRaw@0 (line 786)
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7e2e offset=90e bits=0):   jdk.incubator.vector.VectorIntrinsics::roundDown@14 (line 108)
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   App::micro_vector_masked@17 (line 43)
PcDesc(pc=0x00007fd3e11a7e8f offset=96f bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7ea4 offset=984 bits=4):   jdk.incubator.vector.IntVector::intoArray@17 (line 3004)
   Locals
    - l0: stack[48],oop
    - l1: stack[56],oop
    - l2: reg rbp [10],int
    - l3: stack[32],oop
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a7eb3 offset=993 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7eb6 offset=996 bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@26 (line 3211)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7ed1 offset=9b1 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7ed5 offset=9b5 bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@16 (line 775)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7efa offset=9da bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7f04 offset=9e4 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7f31 offset=a11 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7f35 offset=a15 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7f67 offset=a47 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7f72 offset=a52 bits=0):   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7f76 offset=a56 bits=0):   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7f8c offset=a6c bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7f92 offset=a72 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7f97 offset=a77 bits=0):   jdk.incubator.vector.VectorOperators::opKind@5 (line 409)
   jdk.incubator.vector.IntVector::opKind@2 (line 71)
   jdk.incubator.vector.IntVector::lanewiseTemplate@15 (line 603)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a7f9b offset=a7b bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@1 (line 3208)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a7f9f offset=a7f bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7fb2 offset=a92 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7fb6 offset=a96 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7fb8 offset=a98 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a7fc2 offset=aa2 bits=0):   jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 296)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a7fc5 offset=aa5 bits=0):   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a8017 offset=af7 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a801a offset=afa bits=0):   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a801f offset=aff bits=0):   jdk.incubator.vector.IntVector::lanewiseTemplate@215 (line 634)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a8031 offset=b11 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8036 offset=b16 bits=0):   App::micro_vector_masked@90 (line 51)
PcDesc(pc=0x00007fd3e11a8125 offset=c05 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8136 offset=c16 bits=0):   jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a813d offset=c1d bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8140 offset=c20 bits=0):   jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a8145 offset=c25 bits=0):   jdk.incubator.vector.VectorMask::fromArray@46 (line 208)
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a814e offset=c2e bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8152 offset=c32 bits=0):   jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a8158 offset=c38 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a815d offset=c3d bits=0):   jdk.incubator.vector.VectorMask::fromArray@46 (line 208)
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a8169 offset=c49 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a816d offset=c4d bits=0):   jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a8172 offset=c52 bits=0):   jdk.incubator.vector.VectorMask::fromValues@11 (line 182)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a817b offset=c5b bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a817f offset=c5f bits=0):   jdk.incubator.vector.VectorIntrinsics::requireLength@7 (line 59)
   jdk.incubator.vector.VectorMask::fromValues@11 (line 182)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a8184 offset=c64 bits=0):   jdk.incubator.vector.IntVector::lanewiseTemplate@215 (line 634)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a8186 offset=c66 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a818a offset=c6a bits=0):   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a8191 offset=c71 bits=1):   jdk.incubator.vector.IntVector::stOp@53 (line 353)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdi [14],oop
    - l2: stack[72]
    - l3: empty
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: reg r9 [18],oop
    - l6: reg rbx [6],oop
    - l7: reg r10 [20],int
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8199 offset=c79 bits=0):   jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a81ce offset=cae bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a81d0 offset=cb0 bits=0):   App::micro_vector_masked@-1 (line 32)
PcDesc(pc=0x00007fd3e11a81d3 offset=cb3 bits=0):   App::micro_vector_masked@22 (line 43)
PcDesc(pc=0x00007fd3e11a81d9 offset=cb9 bits=0):   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   App::micro_vector_masked@17 (line 43)
PcDesc(pc=0x00007fd3e11a81e9 offset=cc9 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a81ee offset=cce bits=0):   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   App::micro_vector_masked@17 (line 43)
PcDesc(pc=0x00007fd3e11a820b offset=ceb bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8210 offset=cf0 bits=0):   App::micro_vector_masked@22 (line 43)
PcDesc(pc=0x00007fd3e11a8257 offset=d37 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8261 offset=d41 bits=0):   jdk.incubator.vector.IntVector::broadcastTemplate@1 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a826c offset=d4c bits=4):   jdk.incubator.vector.VectorMask::fromLong@92 (line 254)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: stack[64],oop
    - l4: empty
    - l5: 0
    - l6: stack[80],long
    - l7: empty
    - l8: empty
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: stack[24],oop
    - l1: reg rbp [10],oop
    - l2: stack[32],oop
    - l3: stack[40],oop
    - l4: stack[76]
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a82c7 offset=da7 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a82d1 offset=db1 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcast@3 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a82dc offset=dbc bits=4):   java.lang.invoke.DirectMethodHandle::allocateInstance@12 (line 522)
   Locals
    - l0: empty
    - l1: empty
   java.lang.invoke.LambdaForm$DMH/0x00000008000d4800::newInvokeSpecial@1
   Locals
    - l0: a 'java/lang/invoke/DirectMethodHandle$Constructor'{0x0000000101c29e60}
    - l1: stack[24],oop
    - l2: stack[32]
    - l3: empty
    - l4: empty
   java.lang.invoke.LambdaForm$MH/0x00000008000d5000::linkToTargetMethod@6
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::fromArray@59 (line 2728)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
   Expression stack
    - @0: stack[64],oop
    - @1: stack[72],oop
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[56],oop
    - l2: empty
    - l3: stack[40],oop
    - l4: stack[32]
    - l5: empty
    - l6: empty
    - l7: stack[48],oop
PcDesc(pc=0x00007fd3e11a8300 offset=de0 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a830a offset=dea bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@14 (line 3210)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@44 (line 45)
PcDesc(pc=0x00007fd3e11a8314 offset=df4 bits=4):   java.lang.invoke.DirectMethodHandle::allocateInstance@12 (line 522)
   Locals
    - l0: empty
    - l1: empty
   java.lang.invoke.LambdaForm$DMH/0x00000008000d4800::newInvokeSpecial@1
   Locals
    - l0: a 'java/lang/invoke/DirectMethodHandle$Constructor'{0x0000000101c29e60}
    - l1: reg rbp [10],oop
    - l2: stack[24]
    - l3: empty
    - l4: empty
   java.lang.invoke.LambdaForm$MH/0x00000008000d5000::linkToTargetMethod@6
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::fromArray@59 (line 2728)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
   Expression stack
    - @0: stack[40],oop
    - @1: stack[72],oop
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
    - l4: stack[24]
    - l5: stack[64],oop
    - l6: empty
    - l7: stack[72],oop
PcDesc(pc=0x00007fd3e11a8325 offset=e05 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a832a offset=e0a bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8352 offset=e32 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a835c offset=e3c bits=0):   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[52]
    - @1: stack[72]
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[56],oop
    - l1: stack[64],oop
    - l2: empty
    - l3: empty
   App::micro_vector_masked@32 (line 44)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: stack[64],oop
    - l3: stack[40],oop
    - l4: stack[52]
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8370 offset=e50 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8375 offset=e55 bits=0):   jdk.incubator.vector.AbstractSpecies::dummyVector@-1 (line 295)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a83a2 offset=e82 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a83ac offset=e8c bits=0):   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[52]
    - @1: stack[72]
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[56],oop
    - l1: stack[64],oop
    - l2: empty
    - l3: empty
   App::micro_vector_masked@44 (line 45)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: stack[32],oop
    - l3: stack[64],oop
    - l4: stack[52]
    - l5: obj[920]
    - l6: empty
    - l7: empty
   Objects
    - 920: jdk.incubator.vector.Int256Vector stack[96]Wrong location type 7
PcDesc(pc=0x00007fd3e11a83c0 offset=ea0 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a83c5 offset=ea5 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a83e3 offset=ec3 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a83ec offset=ecc bits=0):   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[52]
    - @1: stack[64]
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: obj[994]
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
   App::micro_vector_masked@59 (line 46)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[56],oop
    - l2: stack[32],oop
    - l3: stack[40],oop
    - l4: stack[52]
    - l5: empty
    - l6: empty
    - l7: empty
   Objects
    - 994: jdk.incubator.vector.Int256Vector stack[96]Wrong location type 7
PcDesc(pc=0x00007fd3e11a8400 offset=ee0 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8403 offset=ee3 bits=0):   jdk.incubator.vector.VectorOperators::opKind@5 (line 409)
   jdk.incubator.vector.IntVector::opKind@2 (line 71)
   jdk.incubator.vector.IntVector::lanewiseTemplate@15 (line 603)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector_masked@53 (line 46)
PcDesc(pc=0x00007fd3e11a8408 offset=ee8 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a840d offset=eed bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8418 offset=ef8 bits=0):   App::micro_vector_masked@140 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: NULL
    - @1: reg rbp [10],oop
    - @2: stack[32],oop
PcDesc(pc=0x00007fd3e11a842c offset=f0c bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8431 offset=f11 bits=0):   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a844c offset=f2c bits=0):   App::micro_vector_masked@17 (line 43)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[40],oop
    - l3: stack[48],oop
    - l4: 0
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],narrowoop
    - @2: stack[56]
PcDesc(pc=0x00007fd3e11a8460 offset=f40 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8465 offset=f45 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8470 offset=f50 bits=0):   jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: reg rbp [10],oop
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
    - l8: empty
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8484 offset=f64 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8489 offset=f69 bits=0):   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@41 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a84d5 offset=fb5 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a84e0 offset=fc0 bits=1):   jdk.incubator.vector.IntVector$IntSpecies::iota@17 (line 3664)  reexecute=true
   Locals
    - l0: empty
   Expression stack
    - @0: reg rbp [10],int
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: 1
    - l4: empty
   Expression stack
    - @0: stack[96],oop
    - @1: stack[52]
    - @2: stack[68]
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[64]
    - l3: stack[80],oop
    - l4: stack[88],oop
    - l5: empty
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: stack[40],oop
    - l4: stack[52]
    - l5: empty
    - l6: empty
    - l7: stack[80],oop
PcDesc(pc=0x00007fd3e11a84f4 offset=fd4 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a84f9 offset=fd9 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8524 offset=1004 bits=1):   jdk.incubator.vector.IntVector$IntSpecies::iota@17 (line 3664)  reexecute=true
   Locals
    - l0: empty
   Expression stack
    - @0: reg rbp [10],int
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: 1
    - l4: empty
   Expression stack
    - @0: stack[72],oop
    - @1: stack[36]
    - @2: stack[52]
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   Locals
    - l0: empty
    - l1: stack[40],oop
    - l2: stack[48]
    - l3: stack[72],oop
    - l4: stack[80],oop
    - l5: empty
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
    - l4: stack[36]
    - l5: stack[56],oop
    - l6: empty
    - l7: stack[72],oop
PcDesc(pc=0x00007fd3e11a8538 offset=1018 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a853d offset=101d bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8547 offset=1027 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8550 offset=1030 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[72]
    - @1: stack[28]
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: stack[32],oop
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
   jdk.incubator.vector.IntVector::intoArray@10 (line 3001)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8568 offset=1048 bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@6 (line 3210)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a856d offset=104d bits=0):   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a859e offset=107e bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a85a8 offset=1088 bits=1):   jdk.incubator.vector.VectorMask::fromLong@104 (line 255)  reexecute=true
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: stack[56],oop
    - l4: empty
    - l5: 0
    - l6: stack[72],long
    - l7: stack[64],oop
    - l8: 0
   Expression stack
    - @0: 0
    - @1: stack[52]
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: stack[32],oop
    - l3: stack[40],oop
    - l4: stack[48]
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a85c6 offset=10a6 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a85cb offset=10ab bits=0):   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a85d8 offset=10b8 bits=0):   jdk.incubator.vector.IntVector::intoArray@2 (line 2960)
   Locals
    - l0: stack[40],oop
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
   Expression stack
    - @0: stack[72]
    - @1: stack[40],oop
   jdk.incubator.vector.IntVector::intoArray@10 (line 3001)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a85ec offset=10cc bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a85f1 offset=10d1 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a85f6 offset=10d6 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8600 offset=10e0 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[72]
    - @1: stack[84]
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: stack[32],oop
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
   jdk.incubator.vector.IntVector::intoArray@10 (line 3001)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a864a offset=112a bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a864f offset=112f bits=0):   jdk.incubator.vector.IntVector::broadcastTemplate@1 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8662 offset=1142 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a866c offset=114c bits=1):   App::micro_vector_masked@22 (line 43)  reexecute=true
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[56],oop
    - l2: stack[32],oop
    - l3: stack[40],oop
    - l4: 0
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: 0
    - @1: stack[48]
PcDesc(pc=0x00007fd3e11a8685 offset=1165 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a868a offset=116a bits=0):   jdk.incubator.vector.IntVector::broadcastTemplate@0 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a86a2 offset=1182 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a86ac offset=118c bits=1):   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
   Locals
    - l0: stack[56]
    - l1: stack[60]
   Expression stack
    - @0: reg rbp [10],int
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   Locals
    - l0: empty
    - l1: empty
   App::micro_vector_masked@17 (line 43)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[40],oop
    - l3: stack[48],oop
    - l4: 0
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: 0
PcDesc(pc=0x00007fd3e11a86c0 offset=11a0 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a86c5 offset=11a5 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8716 offset=11f6 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8720 offset=1200 bits=1):   jdk.incubator.vector.IntVector::fromArray@7 (line 2721)  reexecute=true
   Locals
    - l0: stack[88],oop
    - l1: stack[48],oop
    - l2: stack[56]
    - l3: stack[80],oop
    - l4: stack[88],oop
    - l5: empty
   Expression stack
    - @0: stack[44]
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: stack[32],oop
    - l4: stack[44]
    - l5: empty
    - l6: empty
    - l7: stack[80],oop
PcDesc(pc=0x00007fd3e11a8734 offset=1214 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8739 offset=1219 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8766 offset=1246 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8770 offset=1250 bits=1):   jdk.incubator.vector.VectorMask::fromLong@15 (line 242)  reexecute=true
   Locals
    - l0: empty
    - l1: 0
    - l2: stack[64],long
    - l3: stack[56],oop
    - l4: stack[72]
    - l5: empty
    - l6: empty
    - l7: empty
    - l8: empty
   Expression stack
    - @0: stack[72]
    - @1: 64
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: stack[32],oop
    - l3: stack[40],oop
    - l4: stack[48]
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8796 offset=1276 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a879b offset=127b bits=0):   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a87c3 offset=12a3 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a87cc offset=12ac bits=1):   jdk.incubator.vector.VectorMask::fromLong@40 (line 247)  reexecute=true
   Locals
    - l0: empty
    - l1: 0
    - l2: stack[72],long
    - l3: stack[64],oop
    - l4: stack[60]
    - l5: empty
    - l6: empty
    - l7: empty
    - l8: empty
   Expression stack
    - @0: reg rbp [10],int
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[40],oop
    - l3: stack[48],oop
    - l4: stack[56]
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a87e0 offset=12c0 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a87e5 offset=12c5 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8827 offset=1307 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8830 offset=1310 bits=1):   jdk.incubator.vector.IntVector::fromArray@20 (line 2721)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[64]
    - l3: stack[80],oop
    - l4: stack[88],oop
    - l5: empty
   Expression stack
    - @0: stack[52]
    - @1: reg rbp [10],int
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: stack[40],oop
    - l4: stack[52]
    - l5: empty
    - l6: empty
    - l7: stack[80],oop
PcDesc(pc=0x00007fd3e11a8844 offset=1324 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8849 offset=1329 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8895 offset=1375 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a88a0 offset=1380 bits=1):   jdk.incubator.vector.IntVector$IntSpecies::iota@6 (line 3662)  reexecute=true
   Locals
    - l0: stack[104],oop
   Expression stack
    - @0: reg rbp [10],narrowoop
    - @1: a 'java/lang/Class'{0x000000010188fc10} = 'jdk/incubator/vector/IntMaxVector'
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: 1
    - l4: empty
   Expression stack
    - @0: stack[96],oop
    - @1: stack[52]
    - @2: stack[68]
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[64]
    - l3: stack[80],oop
    - l4: stack[104],oop
    - l5: empty
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: stack[40],oop
    - l4: stack[52]
    - l5: empty
    - l6: empty
    - l7: stack[80],oop
PcDesc(pc=0x00007fd3e11a88b4 offset=1394 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a88b9 offset=1399 bits=0):   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
   jdk.incubator.vector.IntVector::fromArray0Template@26 (line 3211)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a8906 offset=13e6 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8910 offset=13f0 bits=1):   jdk.incubator.vector.AbstractMask::checkIndexByLane@150 (line 240)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[52]
    - l2: stack[68]
    - l3: empty
    - l4: 1
    - l5: empty
    - l6: obj[1058]
    - l7: empty
    - l8: empty
    - l9: empty
   Expression stack
    - @0: reg rbp [10],int
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[64]
    - l3: stack[80],oop
    - l4: stack[88],oop
    - l5: empty
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: stack[40],oop
    - l4: stack[52]
    - l5: empty
    - l6: empty
    - l7: stack[80],oop
   Objects
    - 1058: jdk.incubator.vector.Int256Vector$Int256Mask stack[96]Wrong location type 7
PcDesc(pc=0x00007fd3e11a8924 offset=1404 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8929 offset=1409 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8947 offset=1427 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8950 offset=1430 bits=1):   jdk.incubator.vector.IntVector::fromArray@20 (line 2721)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[40],oop
    - l2: stack[48]
    - l3: stack[72],oop
    - l4: stack[80],oop
    - l5: empty
   Expression stack
    - @0: stack[36]
    - @1: reg rbp [10],int
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
    - l4: stack[36]
    - l5: stack[56],oop
    - l6: empty
    - l7: stack[72],oop
PcDesc(pc=0x00007fd3e11a8964 offset=1444 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8969 offset=1449 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8994 offset=1474 bits=1):   jdk.incubator.vector.IntVector$IntSpecies::iota@6 (line 3662)  reexecute=true
   Locals
    - l0: stack[96],oop
   Expression stack
    - @0: reg rbp [10],narrowoop
    - @1: a 'java/lang/Class'{0x000000010188fc10} = 'jdk/incubator/vector/IntMaxVector'
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: 1
    - l4: empty
   Expression stack
    - @0: stack[72],oop
    - @1: stack[36]
    - @2: stack[52]
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   Locals
    - l0: empty
    - l1: stack[40],oop
    - l2: stack[48]
    - l3: stack[72],oop
    - l4: stack[96],oop
    - l5: empty
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
    - l4: stack[36]
    - l5: stack[56],oop
    - l6: empty
    - l7: stack[72],oop
PcDesc(pc=0x00007fd3e11a89a8 offset=1488 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a89ad offset=148d bits=0):   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a89d6 offset=14b6 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a89e0 offset=14c0 bits=1):   jdk.incubator.vector.AbstractMask::checkIndexByLane@150 (line 240)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[36]
    - l2: stack[52]
    - l3: empty
    - l4: 1
    - l5: empty
    - l6: obj[890]
    - l7: empty
    - l8: empty
    - l9: empty
   Expression stack
    - @0: reg rbp [10],int
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   Locals
    - l0: empty
    - l1: stack[40],oop
    - l2: stack[48]
    - l3: stack[72],oop
    - l4: stack[80],oop
    - l5: empty
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
    - l4: stack[36]
    - l5: stack[56],oop
    - l6: empty
    - l7: stack[72],oop
   Objects
    - 890: jdk.incubator.vector.Int256Vector$Int256Mask stack[96]Wrong location type 7
PcDesc(pc=0x00007fd3e11a89f4 offset=14d4 bits=0):   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a8a21 offset=1501 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8a2c offset=150c bits=0):   jdk.incubator.vector.IntVector::stOp@44 (line 355)
   Locals
    - l0: empty
    - l1: stack[48],oop
    - l2: stack[56]
    - l3: empty
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: stack[64],oop
    - l6: stack[40],oop
    - l7: stack[60]
   Expression stack
    - @0: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - @1: stack[48],oop
    - @2: stack[56]
    - @3: stack[72]
    - @4: stack[64],oop
    - @5: stack[60]
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8a40 offset=1520 bits=0):   jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   App::micro_vector_masked@101 (line 51)
PcDesc(pc=0x00007fd3e11a8a6e offset=154e bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8a78 offset=1558 bits=0):   jdk.incubator.vector.IntVector::lambda$intoArray$82@5 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: stack[48],oop
    - @1: stack[56]
    - @2: stack[60]
   jdk.incubator.vector.IntVector$$Lambda$67/0x00000008000ad640::apply@8
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   jdk.incubator.vector.IntVector::stOp@45 (line 355)
   Locals
    - l0: empty
    - l1: stack[48],oop
    - l2: stack[72]
    - l3: empty
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: stack[32],oop
    - l6: stack[40],oop
    - l7: stack[28]
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8a8c offset=156c bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8a91 offset=1571 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8ab0 offset=1590 bits=1):   jdk.incubator.vector.IntVector$IntSpecies::iota@17 (line 3664)  reexecute=true
   Locals
    - l0: empty
   Expression stack
    - @0: reg rbp [10],int
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: 1
    - l4: empty
   Expression stack
    - @0: stack[40],oop
    - @1: stack[72]
    - @2: stack[80]
   jdk.incubator.vector.IntVector::intoArray@29 (line 3005)
   Locals
    - l0: stack[48],oop
    - l1: stack[24],oop
    - l2: stack[36]
    - l3: stack[40],oop
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8ac4 offset=15a4 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8ac9 offset=15a9 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@0 (line 3503)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8ad4 offset=15b4 bits=0):   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[72]
    - l3: stack[32],oop
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: stack[48],oop
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8ae8 offset=15c8 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8aed offset=15cd bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8afb offset=15db bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8b04 offset=15e4 bits=1):   jdk.incubator.vector.IntVector::stOp@23 (line 353)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[72]
    - l3: empty
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: stack[32],oop
    - l6: stack[40],oop
    - l7: 0
   Expression stack
    - @0: 0
    - @1: stack[28]
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8ba4 offset=1684 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8ba9 offset=1689 bits=0):   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8bc2 offset=16a2 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8bcc offset=16ac bits=1):   jdk.incubator.vector.IntVector$IntSpecies::iota@6 (line 3662)  reexecute=true
   Locals
    - l0: stack[72],oop
   Expression stack
    - @0: reg rbp [10],narrowoop
    - @1: a 'java/lang/Class'{0x000000010188fc10} = 'jdk/incubator/vector/IntMaxVector'
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: 1
    - l4: empty
   Expression stack
    - @0: stack[40],oop
    - @1: stack[36]
    - @2: stack[80]
   jdk.incubator.vector.IntVector::intoArray@29 (line 3005)
   Locals
    - l0: stack[48],oop
    - l1: stack[24],oop
    - l2: stack[36]
    - l3: stack[40],oop
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8be0 offset=16c0 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8be5 offset=16c5 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a8c1b offset=16fb bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8c24 offset=1704 bits=1):   jdk.incubator.vector.AbstractMask::checkIndexByLane@150 (line 240)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[36]
    - l2: stack[56]
    - l3: empty
    - l4: 1
    - l5: empty
    - l6: obj[875]
    - l7: empty
    - l8: empty
    - l9: empty
   Expression stack
    - @0: reg rbp [10],int
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   jdk.incubator.vector.IntVector::intoArray@29 (line 3005)
   Locals
    - l0: stack[40],oop
    - l1: stack[24],oop
    - l2: stack[36]
    - l3: stack[48],oop
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
   Objects
    - 875: jdk.incubator.vector.Int256Vector$Int256Mask stack[64]Wrong location type 7
PcDesc(pc=0x00007fd3e11a8c38 offset=1718 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8c3d offset=171d bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8c68 offset=1748 bits=0):   jdk.incubator.vector.IntVector::fromArray@1 (line 2720)
   Locals
    - l0: reg rbp [10],narrowoop
    - l1: stack[56],oop
    - l2: stack[52]
    - l3: stack[72],oop
    - l4: empty
    - l5: empty
   Expression stack
    - @0: reg rbp [10],narrowoop
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: stack[40],oop
    - l4: stack[52]
    - l5: empty
    - l6: empty
    - l7: stack[72],oop
PcDesc(pc=0x00007fd3e11a8c7c offset=175c bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8c81 offset=1761 bits=0):   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a8ce4 offset=17c4 bits=0):   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@1 (line 3311)
   Locals
    - l0: stack[44]
    - l1: stack[88],oop
    - l2: empty
    - l3: 1
    - l4: stack[60]
   Expression stack
    - @0: stack[72],oop
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   Locals
    - l0: empty
    - l1: stack[48],oop
    - l2: stack[56]
    - l3: stack[96],oop
    - l4: stack[88],oop
    - l5: empty
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: stack[32],oop
    - l4: stack[44]
    - l5: empty
    - l6: empty
    - l7: stack[72],oop
PcDesc(pc=0x00007fd3e11a8cf8 offset=17d8 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8cfd offset=17dd bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8d16 offset=17f6 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8d20 offset=1800 bits=0):   jdk.incubator.vector.IntVector::fromArray@1 (line 2720)
   Locals
    - l0: stack[60],narrowoop
    - l1: stack[32],oop
    - l2: stack[24]
    - l3: stack[72],oop
    - l4: empty
    - l5: empty
   Expression stack
    - @0: stack[60],narrowoop
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: empty
    - l3: empty
    - l4: stack[24]
    - l5: stack[40],oop
    - l6: empty
    - l7: stack[72],oop
PcDesc(pc=0x00007fd3e11a8d34 offset=1814 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8d39 offset=1819 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8d3d offset=181d bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8d48 offset=1828 bits=0):   jdk.incubator.vector.Int256Vector::vec@4 (line 117)
   Locals
    - l0: empty
   Expression stack
    - @0: stack[28],narrowoop
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[72]
    - l3: stack[32],oop
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: empty
    - l6: empty
    - l7: empty
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8d5c offset=183c bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8d61 offset=1841 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8d6b offset=184b bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8d74 offset=1854 bits=0):   jdk.incubator.vector.Int256Vector$Int256Mask::getBits@4 (line 569)
   Locals
    - l0: empty
   Expression stack
    - @0: stack[28],narrowoop
   jdk.incubator.vector.IntVector::stOp@10 (line 352)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[72]
    - l3: empty
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: stack[32],oop
    - l6: empty
    - l7: empty
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8d8d offset=186d bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8d98 offset=1878 bits=0):   App::micro_vector_masked@16 (line 43)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: NULL
PcDesc(pc=0x00007fd3e11a8dac offset=188c bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8db1 offset=1891 bits=0):   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8db3 offset=1893 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8dbc offset=189c bits=0):   App::micro_vector_masked@17 (line 43)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: empty
    - @1: NULL
    - @2: reg rbp [10],int
PcDesc(pc=0x00007fd3e11a8dd0 offset=18b0 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8dd5 offset=18b5 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@-1 (line 3503)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8dda offset=18ba bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8de4 offset=18c4 bits=0):   jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: NULL
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
    - l8: empty
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[56],oop
    - l2: stack[64],oop
    - l3: stack[40],oop
    - l4: stack[72]
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8df8 offset=18d8 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8dfd offset=18dd bits=0):   jdk.incubator.vector.AbstractSpecies::laneCount@-1 (line 125)
   jdk.incubator.vector.IntVector::fromArray0Template@14 (line 3210)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a8e25 offset=1905 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8e30 offset=1910 bits=0):   jdk.incubator.vector.IntVector::fromArray@1 (line 2720)
   Locals
    - l0: NULL
    - l1: stack[48],oop
    - l2: stack[72]
    - l3: stack[64],oop
    - l4: empty
    - l5: empty
   Expression stack
    - @0: NULL
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: stack[32],oop
    - l4: stack[72]
    - l5: empty
    - l6: empty
    - l7: stack[64],oop
PcDesc(pc=0x00007fd3e11a8e44 offset=1924 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8e49 offset=1929 bits=0):   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a8e54 offset=1934 bits=0):   jdk.incubator.vector.IntVector::fromArray@12 (line 2721)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
   Expression stack
    - @0: empty
    - @1: NULL
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8e68 offset=1948 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8e6d offset=194d bits=0):   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@0
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8e84 offset=1964 bits=0):   jdk.incubator.vector.IntVector::fromArray@1 (line 2720)
   Locals
    - l0: NULL
    - l1: stack[32],oop
    - l2: stack[24]
    - l3: stack[72],oop
    - l4: empty
    - l5: empty
   Expression stack
    - @0: NULL
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: empty
    - l3: empty
    - l4: stack[24]
    - l5: stack[64],oop
    - l6: empty
    - l7: stack[72],oop
PcDesc(pc=0x00007fd3e11a8e98 offset=1978 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8e9d offset=197d bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8ea8 offset=1988 bits=0):   jdk.incubator.vector.IntVector::fromArray@12 (line 2721)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
   Expression stack
    - @0: empty
    - @1: NULL
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8ebc offset=199c bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8ec1 offset=19a1 bits=0):   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@-1
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8ecc offset=19ac bits=0):   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: NULL
    - @1: stack[56],oop
    - @2: stack[72]
    - @3: stack[32],oop
PcDesc(pc=0x00007fd3e11a8ee0 offset=19c0 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8ee5 offset=19c5 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8ef0 offset=19d0 bits=0):   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: empty
    - @3: NULL
   jdk.incubator.vector.IntVector::intoArray@29 (line 3005)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8f04 offset=19e4 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8f09 offset=19e9 bits=0):   jdk.incubator.vector.IntVector::toBits@1 (line 403)
   jdk.incubator.vector.IntVector$IntSpecies::longToElementBits@21 (line 3531)
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@3 (line 3519)
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   App::micro_vector_masked@115 (line 52)
PcDesc(pc=0x00007fd3e11a8f14 offset=19f4 bits=0):   jdk.incubator.vector.Int256Vector::vec@4 (line 117)
   Locals
    - l0: empty
   Expression stack
    - @0: NULL
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[72]
    - l3: stack[32],oop
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: empty
    - l6: empty
    - l7: empty
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8f32 offset=1a12 bits=0):   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   App::micro_vector_masked@148 (line 54)
PcDesc(pc=0x00007fd3e11a8f3c offset=1a1c bits=0):   jdk.incubator.vector.Int256Vector$Int256Mask::getBits@4 (line 569)
   Locals
    - l0: empty
   Expression stack
    - @0: NULL
   jdk.incubator.vector.IntVector::stOp@10 (line 352)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[72]
    - l3: empty
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: stack[32],oop
    - l6: empty
    - l7: empty
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
PcDesc(pc=0x00007fd3e11a8f55 offset=1a35 bits=0):   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a8f7e offset=1a5e bits=0):   jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a8f81 offset=1a61 bits=0):   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   App::micro_vector_masked@17 (line 43)
PcDesc(pc=0x00007fd3e11a8f91 offset=1a71 bits=0):   jdk.incubator.vector.IntVector$IntSpecies::elementType@0 (line 3476)
   jdk.incubator.vector.IntVector::fromArray0Template@10 (line 3210)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector_masked@32 (line 44)
PcDesc(pc=0x00007fd3e11a9009 offset=1ae9 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 58 OopMaps

ImmutableOopMap {r10=Oop r13=Oop r14=Oop [24]=Oop [56]=Oop } pc offsets: 287 
ImmutableOopMap {r10=Oop rsi=Oop r13=Oop r14=Oop xmm2=Oop [24]=Oop [56]=Oop } pc offsets: 916 
ImmutableOopMap {[24]=Oop [40]=Oop [56]=Oop [64]=Oop } pc offsets: 1204 
ImmutableOopMap {rbp=Oop [40]=Oop [48]=Oop [56]=Oop [72]=Oop } pc offsets: 1680 
ImmutableOopMap {[32]=Oop [56]=Oop [64]=Oop } pc offsets: 2088 
ImmutableOopMap {rbp=Oop [32]=Oop [56]=Oop } pc offsets: 2136 
ImmutableOopMap {[32]=Oop [56]=Oop } pc offsets: 2168 
ImmutableOopMap {[32]=Oop [40]=Oop [48]=Oop [56]=Oop } pc offsets: 2436 
ImmutableOopMap {r9=Oop rbx=Oop rdi=Oop } pc offsets: 3185 
ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop [40]=Oop [64]=Oop } pc offsets: 3404 
ImmutableOopMap {rbp=Oop [24]=Oop [40]=Oop [48]=Oop [56]=Oop [64]=Oop [72]=Oop } pc offsets: 3516 
ImmutableOopMap {rbp=Oop [32]=Oop [40]=Oop [56]=Oop [64]=Oop [72]=Oop } pc offsets: 3572 
ImmutableOopMap {rbp=Oop [24]=Oop [40]=Oop [56]=Oop [64]=Oop } pc offsets: 3644 
ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop [56]=Oop [64]=Oop } pc offsets: 3724 
ImmutableOopMap {rbp=Oop [32]=Oop [40]=Oop [56]=Oop } pc offsets: 3788 
ImmutableOopMap {rbp=Oop [32]=Oop } pc offsets: 3832 
ImmutableOopMap {rbp=NarrowOop [24]=Oop [32]=Oop [40]=Oop [48]=Oop } pc offsets: 3884 
ImmutableOopMap {rbp=Oop } pc offsets: 3920 
ImmutableOopMap {[24]=Oop [32]=Oop [40]=Oop [56]=Oop [80]=Oop [88]=Oop [96]=Oop } pc offsets: 4032 
ImmutableOopMap {[24]=Oop [40]=Oop [56]=Oop [72]=Oop [80]=Oop } pc offsets: 4100 
ImmutableOopMap {[32]=Oop [56]=Oop } pc offsets: 4144 
ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop [40]=Oop [56]=Oop [64]=Oop } pc offsets: 4232 
ImmutableOopMap {[40]=Oop [56]=Oop } pc offsets: 4280 
ImmutableOopMap {[32]=Oop [56]=Oop } pc offsets: 4320 
ImmutableOopMap {rbp=Oop [32]=Oop [40]=Oop [56]=Oop } pc offsets: 4428 
ImmutableOopMap {[24]=Oop [32]=Oop [40]=Oop [48]=Oop } pc offsets: 4492 
ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop [48]=Oop [80]=Oop [88]=Oop } pc offsets: 4608 
ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop [40]=Oop [56]=Oop } pc offsets: 4688 
ImmutableOopMap {[24]=Oop [32]=Oop [40]=Oop [48]=Oop [64]=Oop } pc offsets: 4780 
ImmutableOopMap {[24]=Oop [32]=Oop [40]=Oop [56]=Oop [80]=Oop [88]=Oop } pc offsets: 4880 
ImmutableOopMap {rbp=NarrowOop [24]=Oop [32]=Oop [40]=Oop [56]=Oop [80]=Oop [96]=Oop [104]=Oop } pc offsets: 4992 
ImmutableOopMap {[24]=Oop [32]=Oop [40]=Oop [56]=Oop [80]=Oop [88]=Oop } pc offsets: 5104 
ImmutableOopMap {[24]=Oop [40]=Oop [56]=Oop [72]=Oop [80]=Oop } pc offsets: 5168 
ImmutableOopMap {rbp=NarrowOop [24]=Oop [40]=Oop [56]=Oop [72]=Oop [96]=Oop } pc offsets: 5236 
ImmutableOopMap {[24]=Oop [40]=Oop [56]=Oop [72]=Oop [80]=Oop } pc offsets: 5312 
ImmutableOopMap {[40]=Oop [48]=Oop [64]=Oop } pc offsets: 5388 
ImmutableOopMap {[32]=Oop [40]=Oop [48]=Oop } pc offsets: 5464 
ImmutableOopMap {[24]=Oop [40]=Oop [48]=Oop } pc offsets: 5520 
ImmutableOopMap {[32]=Oop [48]=Oop [56]=Oop } pc offsets: 5556 
ImmutableOopMap {[32]=Oop [40]=Oop [56]=Oop } pc offsets: 5604 
ImmutableOopMap {rbp=NarrowOop [24]=Oop [40]=Oop [48]=Oop [72]=Oop } pc offsets: 5804 
ImmutableOopMap {[24]=Oop [40]=Oop [48]=Oop } pc offsets: 5892 
ImmutableOopMap {rbp=NarrowOop [24]=Oop [32]=Oop [40]=Oop [56]=Oop [72]=Oop } pc offsets: 5960 
ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop [48]=Oop [72]=Oop [88]=Oop [96]=Oop } pc offsets: 6084 
ImmutableOopMap {rbp=Oop [32]=Oop [40]=Oop [60]=NarrowOop [72]=Oop } pc offsets: 6144 
ImmutableOopMap {[28]=NarrowOop [32]=Oop [56]=Oop } pc offsets: 6184 6228 
ImmutableOopMap {} pc offsets: 6264 6300 
ImmutableOopMap {rbp=Oop [40]=Oop [56]=Oop [64]=Oop } pc offsets: 6340 
ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop [48]=Oop [64]=Oop } pc offsets: 6416 
ImmutableOopMap {} pc offsets: 6452 
ImmutableOopMap {rbp=Oop [32]=Oop [64]=Oop [72]=Oop } pc offsets: 6500 
ImmutableOopMap {} pc offsets: 6536 
ImmutableOopMap {[32]=Oop [56]=Oop } pc offsets: 6572 
ImmutableOopMap {} pc offsets: 6608 
ImmutableOopMap {[32]=Oop [56]=Oop } pc offsets: 6644 6684 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007fd3e11a7563 offset=43):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7563 offset=43):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7563 offset=43):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7563 offset=43):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7563 offset=43):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7566 offset=46):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
ScopeDesc(pc=0x00007fd3e11a7566 offset=46):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7566 offset=46):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7572 offset=52):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7572 offset=52):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7572 offset=52):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7572 offset=52):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7572 offset=52):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a757c offset=5c):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
ScopeDesc(pc=0x00007fd3e11a757c offset=5c):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a757c offset=5c):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7580 offset=60):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@42 (line 74)
ScopeDesc(pc=0x00007fd3e11a7580 offset=60):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fd3e11a7580 offset=60):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a75c9 offset=a9):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a75c9 offset=a9):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a75c9 offset=a9):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a75c9 offset=a9):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a75c9 offset=a9):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a75cd offset=ad):
   jdk.incubator.vector.IntVector::fromArray0Template@34 (line 3209)
ScopeDesc(pc=0x00007fd3e11a75cd offset=ad):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a75cd offset=ad):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a75cd offset=ad):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a75eb offset=cb):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a75eb offset=cb):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a75eb offset=cb):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a75eb offset=cb):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a75eb offset=cb):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a75f9 offset=d9):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fd3e11a75f9 offset=d9):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fd3e11a75f9 offset=d9):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fd3e11a75f9 offset=d9):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a75fb offset=db):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
ScopeDesc(pc=0x00007fd3e11a75fb offset=db):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a75fb offset=db):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7600 offset=e0):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fd3e11a7600 offset=e0):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fd3e11a7600 offset=e0):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7609 offset=e9):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fd3e11a7609 offset=e9):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fd3e11a7609 offset=e9):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fd3e11a7609 offset=e9):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7610 offset=f0):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7610 offset=f0):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7619 offset=f9):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7619 offset=f9):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7619 offset=f9):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7619 offset=f9):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7619 offset=f9):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7620 offset=100):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
ScopeDesc(pc=0x00007fd3e11a7620 offset=100):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7620 offset=100):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a762e offset=10e):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a762e offset=10e):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a762e offset=10e):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a762e offset=10e):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a762e offset=10e):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7635 offset=115):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
ScopeDesc(pc=0x00007fd3e11a7635 offset=115):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a7635 offset=115):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a7635 offset=115):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7635 offset=115):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7635 offset=115):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7635 offset=115):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7635 offset=115):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a763c offset=11c):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a763c offset=11c):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a763c offset=11c):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a763c offset=11c):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a763c offset=11c):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a763f offset=11f):
   App::micro_vector_masked@76 (line 43)  reexecute=true
   Locals
    - l0: stack[24],oop
    - l1: stack[56],oop
    - l2: reg r14 [28],oop
    - l3: reg r13 [26],oop
    - l4: reg r11 [22],int
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a7696 offset=176):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7696 offset=176):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7696 offset=176):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7696 offset=176):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7696 offset=176):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7699 offset=179):
   jdk.incubator.vector.AbstractVector::check@2 (line 124)
ScopeDesc(pc=0x00007fd3e11a7699 offset=179):
   jdk.incubator.vector.IntVector::lanewiseTemplate@7 (line 602)
ScopeDesc(pc=0x00007fd3e11a7699 offset=179):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7699 offset=179):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7699 offset=179):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7699 offset=179):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a76ad offset=18d):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
ScopeDesc(pc=0x00007fd3e11a76ad offset=18d):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a76ad offset=18d):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a76ad offset=18d):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a76ad offset=18d):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a76ad offset=18d):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a76ad offset=18d):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a76ad offset=18d):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a76b4 offset=194):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a76b4 offset=194):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a76b4 offset=194):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a76b4 offset=194):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a76b4 offset=194):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a76c5 offset=1a5):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
ScopeDesc(pc=0x00007fd3e11a76c5 offset=1a5):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a76c5 offset=1a5):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a76c5 offset=1a5):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a76c5 offset=1a5):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a76c5 offset=1a5):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a76c5 offset=1a5):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a76c5 offset=1a5):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a76cc offset=1ac):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a76cc offset=1ac):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a76cc offset=1ac):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a76cc offset=1ac):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a76cc offset=1ac):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a76d2 offset=1b2):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
ScopeDesc(pc=0x00007fd3e11a76d2 offset=1b2):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a76d2 offset=1b2):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a76d2 offset=1b2):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a76d2 offset=1b2):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a76d2 offset=1b2):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a76d2 offset=1b2):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a76d2 offset=1b2):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a773d offset=21d):
   jdk.incubator.vector.IntVector::fromArray0Template@6 (line 3210)
ScopeDesc(pc=0x00007fd3e11a773d offset=21d):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a773d offset=21d):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a773d offset=21d):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7773 offset=253):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7773 offset=253):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7773 offset=253):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7773 offset=253):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7773 offset=253):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7779 offset=259):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fd3e11a7779 offset=259):
   App::micro_vector_masked@59 (line 46)
ScopeDesc(pc=0x00007fd3e11a777d offset=25d):
   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
ScopeDesc(pc=0x00007fd3e11a777d offset=25d):
   jdk.incubator.vector.IntVector::intoArray@37 (line 2964)
ScopeDesc(pc=0x00007fd3e11a777d offset=25d):
   App::micro_vector_masked@59 (line 46)
ScopeDesc(pc=0x00007fd3e11a77d4 offset=2b4):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a77d4 offset=2b4):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a77d4 offset=2b4):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a77d4 offset=2b4):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a77d4 offset=2b4):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a77da offset=2ba):
   jdk.incubator.vector.IntVector::fromArray0Template@10 (line 3210)
ScopeDesc(pc=0x00007fd3e11a77da offset=2ba):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a77da offset=2ba):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a77da offset=2ba):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a77e0 offset=2c0):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a77e0 offset=2c0):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a77e0 offset=2c0):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a77e0 offset=2c0):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a77e0 offset=2c0):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a77e3 offset=2c3):
   jdk.incubator.vector.VectorMask::fromArray@21 (line 209)
ScopeDesc(pc=0x00007fd3e11a77e3 offset=2c3):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
ScopeDesc(pc=0x00007fd3e11a77e3 offset=2c3):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a77e3 offset=2c3):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a77e8 offset=2c8):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a77e8 offset=2c8):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a77e8 offset=2c8):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a77e8 offset=2c8):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a77e8 offset=2c8):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a77f2 offset=2d2):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fd3e11a77f2 offset=2d2):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fd3e11a77f2 offset=2d2):
   jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
ScopeDesc(pc=0x00007fd3e11a77f2 offset=2d2):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
ScopeDesc(pc=0x00007fd3e11a77f2 offset=2d2):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a77f2 offset=2d2):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a77f7 offset=2d7):
   App::micro_vector_masked@17 (line 43)
ScopeDesc(pc=0x00007fd3e11a77fc offset=2dc):
   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
ScopeDesc(pc=0x00007fd3e11a77fc offset=2dc):
   jdk.incubator.vector.IntVector::fromArray0Template@26 (line 3211)
ScopeDesc(pc=0x00007fd3e11a77fc offset=2dc):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a77fc offset=2dc):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a77fc offset=2dc):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7830 offset=310):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7830 offset=310):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7830 offset=310):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7830 offset=310):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7830 offset=310):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7836 offset=316):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fd3e11a7836 offset=316):
   jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
ScopeDesc(pc=0x00007fd3e11a7836 offset=316):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
ScopeDesc(pc=0x00007fd3e11a7836 offset=316):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a7836 offset=316):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a784d offset=32d):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a784d offset=32d):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a784d offset=32d):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a784d offset=32d):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a784d offset=32d):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7852 offset=332):
   jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
ScopeDesc(pc=0x00007fd3e11a7852 offset=332):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
ScopeDesc(pc=0x00007fd3e11a7852 offset=332):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a7852 offset=332):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a787b offset=35b):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a787b offset=35b):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a787b offset=35b):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a787b offset=35b):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a787b offset=35b):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7881 offset=361):
   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
ScopeDesc(pc=0x00007fd3e11a7881 offset=361):
   App::micro_vector_masked@17 (line 43)
ScopeDesc(pc=0x00007fd3e11a7891 offset=371):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7891 offset=371):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7891 offset=371):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7891 offset=371):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7891 offset=371):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a78ad offset=38d):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
ScopeDesc(pc=0x00007fd3e11a78ad offset=38d):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a78ad offset=38d):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a78ad offset=38d):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a78ad offset=38d):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a78ad offset=38d):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a78ad offset=38d):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a78ad offset=38d):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a78b4 offset=394):
   jdk.incubator.vector.VectorMask::fromLong@135 (line 255)  reexecute=true
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: reg r10 [20],oop
    - l4: empty
    - l5: 0
    - l6: reg rdx [4],long
    - l7: reg rsi [12],oop
    - l8: reg rax [0],int
ScopeDesc(pc=0x00007fd3e11a78b4 offset=394):
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: stack[24],oop
    - l1: stack[56],oop
    - l2: reg r14 [28],oop
    - l3: reg r13 [26],oop
    - l4: reg xmm3 [96],int
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a7919 offset=3f9):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7919 offset=3f9):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7919 offset=3f9):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7919 offset=3f9):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7919 offset=3f9):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a791c offset=3fc):
   jdk.incubator.vector.IntVector::intoArray@31 (line 2964)
ScopeDesc(pc=0x00007fd3e11a791c offset=3fc):
   App::micro_vector_masked@59 (line 46)
ScopeDesc(pc=0x00007fd3e11a792d offset=40d):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a792d offset=40d):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a792d offset=40d):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a792d offset=40d):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a792d offset=40d):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7933 offset=413):
   jdk.incubator.vector.IntVector::intoArray@37 (line 2964)
ScopeDesc(pc=0x00007fd3e11a7933 offset=413):
   App::micro_vector_masked@59 (line 46)
ScopeDesc(pc=0x00007fd3e11a7946 offset=426):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7946 offset=426):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7946 offset=426):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7946 offset=426):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7946 offset=426):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7968 offset=448):
   jdk.incubator.vector.IntVector::fromArray@8 (line 2689)
ScopeDesc(pc=0x00007fd3e11a7968 offset=448):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7998 offset=478):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7998 offset=478):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7998 offset=478):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7998 offset=478):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7998 offset=478):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a79a8 offset=488):
   jdk.incubator.vector.IntVector::fromArray@8 (line 2689)
ScopeDesc(pc=0x00007fd3e11a79a8 offset=488):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a79d4 offset=4b4):
   jdk.incubator.vector.VectorMask::fromArray@46 (line 208)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a79d4 offset=4b4):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fd3e11a79d4 offset=4b4):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
    - l8: empty
ScopeDesc(pc=0x00007fd3e11a79d4 offset=4b4):
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: stack[24],oop
    - l1: stack[56],oop
    - l2: stack[64],oop
    - l3: stack[40],oop
    - l4: stack[72]
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a79f6 offset=4d6):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a79f6 offset=4d6):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a79f6 offset=4d6):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a79f6 offset=4d6):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a79f6 offset=4d6):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a79ff offset=4df):
   jdk.incubator.vector.IntVector::fromArray0Template@20 (line 3211)
ScopeDesc(pc=0x00007fd3e11a79ff offset=4df):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a79ff offset=4df):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a79ff offset=4df):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7a04 offset=4e4):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7a04 offset=4e4):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7a04 offset=4e4):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7a04 offset=4e4):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7a04 offset=4e4):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7a07 offset=4e7):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7a07 offset=4e7):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7a13 offset=4f3):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7a13 offset=4f3):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7a13 offset=4f3):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7a13 offset=4f3):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7a13 offset=4f3):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7a1d offset=4fd):
   jdk.incubator.vector.IntVector::fromArray0Template@20 (line 3211)
ScopeDesc(pc=0x00007fd3e11a7a1d offset=4fd):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a7a1d offset=4fd):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7a1d offset=4fd):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7a34 offset=514):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7a34 offset=514):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7a34 offset=514):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7a34 offset=514):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7a34 offset=514):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7a37 offset=517):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fd3e11a7a37 offset=517):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fd3e11a7a37 offset=517):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fd3e11a7a37 offset=517):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7a49 offset=529):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7a49 offset=529):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7a49 offset=529):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7a49 offset=529):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7a49 offset=529):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7a4d offset=52d):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@10 (line 775)
ScopeDesc(pc=0x00007fd3e11a7a4d offset=52d):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a7a4d offset=52d):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a7a4d offset=52d):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7a4d offset=52d):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7a4d offset=52d):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7a4d offset=52d):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7a4d offset=52d):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7a54 offset=534):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7a54 offset=534):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7a54 offset=534):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7a54 offset=534):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7a54 offset=534):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7a5d offset=53d):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fd3e11a7a5d offset=53d):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fd3e11a7a5d offset=53d):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fd3e11a7a5d offset=53d):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7a60 offset=540):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7a60 offset=540):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7a6c offset=54c):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7a6c offset=54c):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7a6c offset=54c):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7a6c offset=54c):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7a6c offset=54c):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7a6f offset=54f):
   jdk.incubator.vector.IntVector::arrayAddress@9 (line 3349)
ScopeDesc(pc=0x00007fd3e11a7a6f offset=54f):
   jdk.incubator.vector.IntVector::fromArray0Template@20 (line 3211)
ScopeDesc(pc=0x00007fd3e11a7a6f offset=54f):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a7a6f offset=54f):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7a6f offset=54f):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7a7b offset=55b):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7a7b offset=55b):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7a7b offset=55b):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7a7b offset=55b):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7a7b offset=55b):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7a7f offset=55f):
   jdk.incubator.vector.IntVector::lanewiseTemplate@222 (line 634)
ScopeDesc(pc=0x00007fd3e11a7a7f offset=55f):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7a7f offset=55f):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7a7f offset=55f):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7a7f offset=55f):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7aa0 offset=580):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7aa0 offset=580):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7aa0 offset=580):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7aa0 offset=580):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7aa0 offset=580):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7aaa offset=58a):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007fd3e11a7aaa offset=58a):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7aaa offset=58a):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7ad7 offset=5b7):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7ad7 offset=5b7):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7ad7 offset=5b7):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7ad7 offset=5b7):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7ad7 offset=5b7):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7adb offset=5bb):
   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
ScopeDesc(pc=0x00007fd3e11a7adb offset=5bb):
   jdk.incubator.vector.IntVector::fromArray0Template@26 (line 3211)
ScopeDesc(pc=0x00007fd3e11a7adb offset=5bb):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a7adb offset=5bb):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7adb offset=5bb):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7aea offset=5ca):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7aea offset=5ca):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7aea offset=5ca):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7aea offset=5ca):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7aea offset=5ca):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7afe offset=5de):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
ScopeDesc(pc=0x00007fd3e11a7afe offset=5de):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a7afe offset=5de):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a7afe offset=5de):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7afe offset=5de):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7afe offset=5de):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7afe offset=5de):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7afe offset=5de):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7b07 offset=5e7):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7b07 offset=5e7):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7b07 offset=5e7):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7b07 offset=5e7):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7b07 offset=5e7):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7b0d offset=5ed):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
ScopeDesc(pc=0x00007fd3e11a7b0d offset=5ed):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a7b0d offset=5ed):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a7b0d offset=5ed):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7b0d offset=5ed):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7b0d offset=5ed):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7b0d offset=5ed):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7b0d offset=5ed):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7b48 offset=628):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@16 (line 775)
ScopeDesc(pc=0x00007fd3e11a7b48 offset=628):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a7b48 offset=628):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a7b48 offset=628):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7b48 offset=628):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7b48 offset=628):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7b48 offset=628):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7b48 offset=628):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7b4c offset=62c):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a7b4c offset=62c):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a7b4c offset=62c):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7b4c offset=62c):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7b4c offset=62c):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7b4c offset=62c):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7b4c offset=62c):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7b9a offset=67a):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7b9a offset=67a):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7b9a offset=67a):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7b9a offset=67a):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7b9a offset=67a):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7b9e offset=67e):
   jdk.incubator.vector.Int256Vector::vspecies@-1 (line 86)
ScopeDesc(pc=0x00007fd3e11a7b9e offset=67e):
   jdk.incubator.vector.IntVector::fromArray0Template@1 (line 3208)
ScopeDesc(pc=0x00007fd3e11a7b9e offset=67e):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a7b9e offset=67e):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7b9e offset=67e):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7bb0 offset=690):
   jdk.incubator.vector.IntVector::fromArray@64 (line 2728)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
ScopeDesc(pc=0x00007fd3e11a7bb0 offset=690):
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[56],oop
    - l2: empty
    - l3: stack[40],oop
    - l4: stack[24]
    - l5: empty
    - l6: empty
    - l7: stack[48],oop
ScopeDesc(pc=0x00007fd3e11a7bb5 offset=695):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7bb5 offset=695):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7bb5 offset=695):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7bb5 offset=695):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7bb5 offset=695):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7bb9 offset=699):
   App::micro_vector_masked@-1 (line 32)
ScopeDesc(pc=0x00007fd3e11a7bd7 offset=6b7):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7bd7 offset=6b7):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7bd7 offset=6b7):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7bd7 offset=6b7):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7bd7 offset=6b7):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7bdf offset=6bf):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7bdf offset=6bf):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7be3 offset=6c3):
   jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 296)
ScopeDesc(pc=0x00007fd3e11a7be3 offset=6c3):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007fd3e11a7be3 offset=6c3):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7be3 offset=6c3):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7bf7 offset=6d7):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7bf7 offset=6d7):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7bf7 offset=6d7):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7bf7 offset=6d7):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7bf7 offset=6d7):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7bfa offset=6da):
   jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 296)
ScopeDesc(pc=0x00007fd3e11a7bfa offset=6da):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007fd3e11a7bfa offset=6da):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7bfa offset=6da):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7c0c offset=6ec):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7c0c offset=6ec):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7c0c offset=6ec):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7c0c offset=6ec):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7c0c offset=6ec):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7c0f offset=6ef):
   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
ScopeDesc(pc=0x00007fd3e11a7c0f offset=6ef):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a7c0f offset=6ef):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7c0f offset=6ef):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7c26 offset=706):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7c26 offset=706):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7c26 offset=706):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7c26 offset=706):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7c26 offset=706):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7c29 offset=709):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@24 (line 775)
ScopeDesc(pc=0x00007fd3e11a7c29 offset=709):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a7c29 offset=709):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a7c29 offset=709):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7c29 offset=709):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7c29 offset=709):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7c29 offset=709):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7c29 offset=709):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7c43 offset=723):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7c43 offset=723):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7c43 offset=723):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7c43 offset=723):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7c43 offset=723):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7c4d offset=72d):
   jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
ScopeDesc(pc=0x00007fd3e11a7c4d offset=72d):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7c76 offset=756):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7c76 offset=756):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7c76 offset=756):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7c76 offset=756):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7c76 offset=756):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7c7a offset=75a):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7c7a offset=75a):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7c8f offset=76f):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7c8f offset=76f):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7c8f offset=76f):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7c8f offset=76f):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7c8f offset=76f):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7ca3 offset=783):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
ScopeDesc(pc=0x00007fd3e11a7ca3 offset=783):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a7ca3 offset=783):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a7ca3 offset=783):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7ca3 offset=783):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7ca3 offset=783):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7ca3 offset=783):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7ca3 offset=783):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7caa offset=78a):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7caa offset=78a):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7caa offset=78a):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7caa offset=78a):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7caa offset=78a):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7cb0 offset=790):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
ScopeDesc(pc=0x00007fd3e11a7cb0 offset=790):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a7cb0 offset=790):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a7cb0 offset=790):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7cb0 offset=790):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7cb0 offset=790):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7cb0 offset=790):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7cb0 offset=790):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7ce0 offset=7c0):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@26 (line 775)
ScopeDesc(pc=0x00007fd3e11a7ce0 offset=7c0):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a7ce0 offset=7c0):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a7ce0 offset=7c0):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7ce0 offset=7c0):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7ce0 offset=7c0):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7ce0 offset=7c0):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7ce0 offset=7c0):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7ce4 offset=7c4):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a7ce4 offset=7c4):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a7ce4 offset=7c4):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7ce4 offset=7c4):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7ce4 offset=7c4):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7ce4 offset=7c4):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7ce4 offset=7c4):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7d32 offset=812):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7d32 offset=812):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7d32 offset=812):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7d32 offset=812):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7d32 offset=812):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7d36 offset=816):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a7d36 offset=816):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7d36 offset=816):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7d48 offset=828):
   jdk.incubator.vector.IntVector::fromArray@64 (line 2728)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
ScopeDesc(pc=0x00007fd3e11a7d48 offset=828):
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
    - l4: stack[72]
    - l5: stack[64],oop
    - l6: empty
    - l7: stack[32],oop
ScopeDesc(pc=0x00007fd3e11a7d59 offset=839):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7d59 offset=839):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7d59 offset=839):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7d59 offset=839):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7d59 offset=839):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7d63 offset=843):
   jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
ScopeDesc(pc=0x00007fd3e11a7d63 offset=843):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7d78 offset=858):
   jdk.incubator.vector.IntVector::lanewise@70 (line 688)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: stack[32],oop
    - l4: empty
    - l5: empty
   Expression stack
    - @0: reg rbp [10],oop
ScopeDesc(pc=0x00007fd3e11a7d78 offset=858):
   jdk.incubator.vector.IntVector::add@6 (line 1133)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fd3e11a7d78 offset=858):
   App::micro_vector_masked@140 (line 54)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
    - l4: stack[72]
    - l5: empty
    - l6: empty
    - l7: stack[32],oop
ScopeDesc(pc=0x00007fd3e11a7d83 offset=863):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7d83 offset=863):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7d83 offset=863):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7d83 offset=863):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7d83 offset=863):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7d98 offset=878):
   jdk.incubator.vector.IntVector::lanewise@74 (line 688)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
ScopeDesc(pc=0x00007fd3e11a7d98 offset=878):
   jdk.incubator.vector.IntVector::add@6 (line 1133)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fd3e11a7d98 offset=878):
   App::micro_vector_masked@140 (line 54)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
    - l4: stack[72]
    - l5: empty
    - l6: empty
    - l7: stack[32],oop
ScopeDesc(pc=0x00007fd3e11a7dae offset=88e):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7dae offset=88e):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7dae offset=88e):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7dae offset=88e):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7dae offset=88e):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7db2 offset=892):
   jdk.incubator.vector.IntVector::lanewiseTemplate@233 (line 634)
ScopeDesc(pc=0x00007fd3e11a7db2 offset=892):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7db2 offset=892):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7db2 offset=892):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7db2 offset=892):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7df2 offset=8d2):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7df2 offset=8d2):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7df2 offset=8d2):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7df2 offset=8d2):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7df2 offset=8d2):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7df8 offset=8d8):
   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
ScopeDesc(pc=0x00007fd3e11a7df8 offset=8d8):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007fd3e11a7df8 offset=8d8):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7df8 offset=8d8):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7e03 offset=8e3):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7e03 offset=8e3):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7e03 offset=8e3):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7e03 offset=8e3):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7e03 offset=8e3):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7e09 offset=8e9):
   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
ScopeDesc(pc=0x00007fd3e11a7e09 offset=8e9):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007fd3e11a7e09 offset=8e9):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7e09 offset=8e9):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7e17 offset=8f7):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7e17 offset=8f7):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7e17 offset=8f7):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7e17 offset=8f7):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7e17 offset=8f7):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7e1b offset=8fb):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCodeRaw@0 (line 786)
ScopeDesc(pc=0x00007fd3e11a7e1b offset=8fb):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
ScopeDesc(pc=0x00007fd3e11a7e1b offset=8fb):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a7e1b offset=8fb):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a7e1b offset=8fb):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7e1b offset=8fb):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7e1b offset=8fb):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7e1b offset=8fb):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7e1b offset=8fb):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7e2e offset=90e):
   jdk.incubator.vector.VectorIntrinsics::roundDown@14 (line 108)
ScopeDesc(pc=0x00007fd3e11a7e2e offset=90e):
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
ScopeDesc(pc=0x00007fd3e11a7e2e offset=90e):
   App::micro_vector_masked@17 (line 43)
ScopeDesc(pc=0x00007fd3e11a7e8f offset=96f):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7e8f offset=96f):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7e8f offset=96f):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7e8f offset=96f):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7e8f offset=96f):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7ea4 offset=984):
   jdk.incubator.vector.IntVector::intoArray@17 (line 3004)
   Locals
    - l0: stack[48],oop
    - l1: stack[56],oop
    - l2: reg rbp [10],int
    - l3: stack[32],oop
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a7ea4 offset=984):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a7eb3 offset=993):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7eb3 offset=993):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7eb3 offset=993):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7eb3 offset=993):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7eb3 offset=993):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7eb6 offset=996):
   jdk.incubator.vector.IntVector::fromArray0Template@26 (line 3211)
ScopeDesc(pc=0x00007fd3e11a7eb6 offset=996):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a7eb6 offset=996):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7eb6 offset=996):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7ed1 offset=9b1):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7ed1 offset=9b1):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7ed1 offset=9b1):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7ed1 offset=9b1):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7ed1 offset=9b1):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7ed5 offset=9b5):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@16 (line 775)
ScopeDesc(pc=0x00007fd3e11a7ed5 offset=9b5):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a7ed5 offset=9b5):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a7ed5 offset=9b5):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7ed5 offset=9b5):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7ed5 offset=9b5):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7ed5 offset=9b5):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7ed5 offset=9b5):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7efa offset=9da):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7efa offset=9da):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7efa offset=9da):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7efa offset=9da):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7efa offset=9da):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7f04 offset=9e4):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
ScopeDesc(pc=0x00007fd3e11a7f04 offset=9e4):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7f04 offset=9e4):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7f31 offset=a11):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7f31 offset=a11):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7f31 offset=a11):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7f31 offset=a11):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7f31 offset=a11):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7f35 offset=a15):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fd3e11a7f35 offset=a15):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fd3e11a7f35 offset=a15):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fd3e11a7f35 offset=a15):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7f67 offset=a47):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7f67 offset=a47):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7f67 offset=a47):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7f67 offset=a47):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7f67 offset=a47):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7f72 offset=a52):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a7f72 offset=a52):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7f72 offset=a52):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7f72 offset=a52):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7f72 offset=a52):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7f72 offset=a52):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7f76 offset=a56):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a7f76 offset=a56):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7f76 offset=a56):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7f8c offset=a6c):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7f8c offset=a6c):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7f8c offset=a6c):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7f8c offset=a6c):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7f8c offset=a6c):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7f92 offset=a72):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fd3e11a7f92 offset=a72):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fd3e11a7f92 offset=a72):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fd3e11a7f92 offset=a72):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7f97 offset=a77):
   jdk.incubator.vector.VectorOperators::opKind@5 (line 409)
ScopeDesc(pc=0x00007fd3e11a7f97 offset=a77):
   jdk.incubator.vector.IntVector::opKind@2 (line 71)
ScopeDesc(pc=0x00007fd3e11a7f97 offset=a77):
   jdk.incubator.vector.IntVector::lanewiseTemplate@15 (line 603)
ScopeDesc(pc=0x00007fd3e11a7f97 offset=a77):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7f97 offset=a77):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7f97 offset=a77):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7f97 offset=a77):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a7f9b offset=a7b):
   jdk.incubator.vector.IntVector::fromArray0Template@1 (line 3208)
ScopeDesc(pc=0x00007fd3e11a7f9b offset=a7b):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a7f9b offset=a7b):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7f9b offset=a7b):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a7f9f offset=a7f):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fd3e11a7f9f offset=a7f):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fd3e11a7f9f offset=a7f):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fd3e11a7f9f offset=a7f):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7fb2 offset=a92):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7fb2 offset=a92):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7fb2 offset=a92):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7fb2 offset=a92):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7fb2 offset=a92):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7fb6 offset=a96):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007fd3e11a7fb6 offset=a96):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7fb6 offset=a96):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7fb8 offset=a98):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a7fb8 offset=a98):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a7fb8 offset=a98):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a7fb8 offset=a98):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a7fb8 offset=a98):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a7fc2 offset=aa2):
   jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 296)
ScopeDesc(pc=0x00007fd3e11a7fc2 offset=aa2):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007fd3e11a7fc2 offset=aa2):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a7fc2 offset=aa2):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a7fc5 offset=aa5):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a7fc5 offset=aa5):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a7fc5 offset=aa5):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a7fc5 offset=aa5):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a7fc5 offset=aa5):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a8017 offset=af7):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8017 offset=af7):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8017 offset=af7):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8017 offset=af7):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8017 offset=af7):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a801a offset=afa):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a801f offset=aff):
   jdk.incubator.vector.IntVector::lanewiseTemplate@215 (line 634)
ScopeDesc(pc=0x00007fd3e11a801f offset=aff):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a801f offset=aff):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a801f offset=aff):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a801f offset=aff):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a8031 offset=b11):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8031 offset=b11):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8031 offset=b11):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8031 offset=b11):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8031 offset=b11):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8036 offset=b16):
   App::micro_vector_masked@90 (line 51)
ScopeDesc(pc=0x00007fd3e11a8125 offset=c05):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8125 offset=c05):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8125 offset=c05):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8125 offset=c05):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8125 offset=c05):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8136 offset=c16):
   jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
ScopeDesc(pc=0x00007fd3e11a8136 offset=c16):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
ScopeDesc(pc=0x00007fd3e11a8136 offset=c16):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a8136 offset=c16):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a813d offset=c1d):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a813d offset=c1d):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a813d offset=c1d):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a813d offset=c1d):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a813d offset=c1d):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8140 offset=c20):
   jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
ScopeDesc(pc=0x00007fd3e11a8140 offset=c20):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
ScopeDesc(pc=0x00007fd3e11a8140 offset=c20):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a8140 offset=c20):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a8145 offset=c25):
   jdk.incubator.vector.VectorMask::fromArray@46 (line 208)
ScopeDesc(pc=0x00007fd3e11a8145 offset=c25):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
ScopeDesc(pc=0x00007fd3e11a8145 offset=c25):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a8145 offset=c25):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a814e offset=c2e):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a814e offset=c2e):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a814e offset=c2e):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a814e offset=c2e):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a814e offset=c2e):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8152 offset=c32):
   jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
ScopeDesc(pc=0x00007fd3e11a8152 offset=c32):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
ScopeDesc(pc=0x00007fd3e11a8152 offset=c32):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a8152 offset=c32):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a8158 offset=c38):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8158 offset=c38):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8158 offset=c38):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8158 offset=c38):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8158 offset=c38):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a815d offset=c3d):
   jdk.incubator.vector.VectorMask::fromArray@46 (line 208)
ScopeDesc(pc=0x00007fd3e11a815d offset=c3d):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
ScopeDesc(pc=0x00007fd3e11a815d offset=c3d):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a815d offset=c3d):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a8169 offset=c49):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8169 offset=c49):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8169 offset=c49):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8169 offset=c49):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8169 offset=c49):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a816d offset=c4d):
   jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
ScopeDesc(pc=0x00007fd3e11a816d offset=c4d):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
ScopeDesc(pc=0x00007fd3e11a816d offset=c4d):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a816d offset=c4d):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a8172 offset=c52):
   jdk.incubator.vector.VectorMask::fromValues@11 (line 182)
ScopeDesc(pc=0x00007fd3e11a8172 offset=c52):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a8172 offset=c52):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a817b offset=c5b):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a817b offset=c5b):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a817b offset=c5b):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a817b offset=c5b):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a817b offset=c5b):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a817f offset=c5f):
   jdk.incubator.vector.VectorIntrinsics::requireLength@7 (line 59)
ScopeDesc(pc=0x00007fd3e11a817f offset=c5f):
   jdk.incubator.vector.VectorMask::fromValues@11 (line 182)
ScopeDesc(pc=0x00007fd3e11a817f offset=c5f):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a817f offset=c5f):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a8184 offset=c64):
   jdk.incubator.vector.IntVector::lanewiseTemplate@215 (line 634)
ScopeDesc(pc=0x00007fd3e11a8184 offset=c64):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a8184 offset=c64):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a8184 offset=c64):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a8184 offset=c64):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a8186 offset=c66):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8186 offset=c66):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8186 offset=c66):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8186 offset=c66):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8186 offset=c66):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a818a offset=c6a):
   jdk.incubator.vector.VectorOperators$OperatorImpl::opCode@1 (line 774)
ScopeDesc(pc=0x00007fd3e11a818a offset=c6a):
   jdk.incubator.vector.VectorOperators::opCode@6 (line 403)
ScopeDesc(pc=0x00007fd3e11a818a offset=c6a):
   jdk.incubator.vector.IntVector::opCode@7 (line 62)
ScopeDesc(pc=0x00007fd3e11a818a offset=c6a):
   jdk.incubator.vector.IntVector::lanewiseTemplate@207 (line 632)
ScopeDesc(pc=0x00007fd3e11a818a offset=c6a):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a818a offset=c6a):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a818a offset=c6a):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a818a offset=c6a):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a8191 offset=c71):
   jdk.incubator.vector.IntVector::stOp@53 (line 353)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdi [14],oop
    - l2: stack[72]
    - l3: empty
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: reg r9 [18],oop
    - l6: reg rbx [6],oop
    - l7: reg r10 [20],int
ScopeDesc(pc=0x00007fd3e11a8191 offset=c71):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8191 offset=c71):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8199 offset=c79):
   jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
ScopeDesc(pc=0x00007fd3e11a8199 offset=c79):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
ScopeDesc(pc=0x00007fd3e11a8199 offset=c79):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a8199 offset=c79):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a81ce offset=cae):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a81ce offset=cae):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a81ce offset=cae):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a81ce offset=cae):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a81ce offset=cae):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a81d0 offset=cb0):
   App::micro_vector_masked@-1 (line 32)
ScopeDesc(pc=0x00007fd3e11a81d3 offset=cb3):
   App::micro_vector_masked@22 (line 43)
ScopeDesc(pc=0x00007fd3e11a81d9 offset=cb9):
   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
ScopeDesc(pc=0x00007fd3e11a81d9 offset=cb9):
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
ScopeDesc(pc=0x00007fd3e11a81d9 offset=cb9):
   App::micro_vector_masked@17 (line 43)
ScopeDesc(pc=0x00007fd3e11a81e9 offset=cc9):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a81e9 offset=cc9):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a81e9 offset=cc9):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a81e9 offset=cc9):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a81e9 offset=cc9):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a81ee offset=cce):
   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
ScopeDesc(pc=0x00007fd3e11a81ee offset=cce):
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
ScopeDesc(pc=0x00007fd3e11a81ee offset=cce):
   App::micro_vector_masked@17 (line 43)
ScopeDesc(pc=0x00007fd3e11a820b offset=ceb):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a820b offset=ceb):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a820b offset=ceb):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a820b offset=ceb):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a820b offset=ceb):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8210 offset=cf0):
   App::micro_vector_masked@22 (line 43)
ScopeDesc(pc=0x00007fd3e11a8257 offset=d37):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8257 offset=d37):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8257 offset=d37):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8257 offset=d37):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8257 offset=d37):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8261 offset=d41):
   jdk.incubator.vector.IntVector::broadcastTemplate@1 (line 534)
ScopeDesc(pc=0x00007fd3e11a8261 offset=d41):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8261 offset=d41):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8261 offset=d41):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8261 offset=d41):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8261 offset=d41):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8261 offset=d41):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8261 offset=d41):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a826c offset=d4c):
   jdk.incubator.vector.VectorMask::fromLong@92 (line 254)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: stack[64],oop
    - l4: empty
    - l5: 0
    - l6: stack[80],long
    - l7: empty
    - l8: empty
ScopeDesc(pc=0x00007fd3e11a826c offset=d4c):
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: stack[24],oop
    - l1: reg rbp [10],oop
    - l2: stack[32],oop
    - l3: stack[40],oop
    - l4: stack[76]
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a82c7 offset=da7):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a82c7 offset=da7):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a82c7 offset=da7):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a82c7 offset=da7):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a82c7 offset=da7):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a82d1 offset=db1):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@3 (line 3519)
ScopeDesc(pc=0x00007fd3e11a82d1 offset=db1):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a82d1 offset=db1):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a82d1 offset=db1):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a82d1 offset=db1):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a82d1 offset=db1):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a82d1 offset=db1):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a82d1 offset=db1):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a82d1 offset=db1):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a82dc offset=dbc):
   java.lang.invoke.DirectMethodHandle::allocateInstance@12 (line 522)
   Locals
    - l0: empty
    - l1: empty
ScopeDesc(pc=0x00007fd3e11a82dc offset=dbc):
   java.lang.invoke.LambdaForm$DMH/0x00000008000d4800::newInvokeSpecial@1
   Locals
    - l0: a 'java/lang/invoke/DirectMethodHandle$Constructor'{0x0000000101c29e60}
    - l1: stack[24],oop
    - l2: stack[32]
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a82dc offset=dbc):
   java.lang.invoke.LambdaForm$MH/0x00000008000d5000::linkToTargetMethod@6
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fd3e11a82dc offset=dbc):
   jdk.incubator.vector.IntVector::fromArray@59 (line 2728)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
   Expression stack
    - @0: stack[64],oop
    - @1: stack[72],oop
ScopeDesc(pc=0x00007fd3e11a82dc offset=dbc):
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[56],oop
    - l2: empty
    - l3: stack[40],oop
    - l4: stack[32]
    - l5: empty
    - l6: empty
    - l7: stack[48],oop
ScopeDesc(pc=0x00007fd3e11a8300 offset=de0):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8300 offset=de0):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8300 offset=de0):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8300 offset=de0):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8300 offset=de0):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a830a offset=dea):
   jdk.incubator.vector.IntVector::fromArray0Template@14 (line 3210)
ScopeDesc(pc=0x00007fd3e11a830a offset=dea):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a830a offset=dea):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a830a offset=dea):
   App::micro_vector_masked@44 (line 45)
ScopeDesc(pc=0x00007fd3e11a8314 offset=df4):
   java.lang.invoke.DirectMethodHandle::allocateInstance@12 (line 522)
   Locals
    - l0: empty
    - l1: empty
ScopeDesc(pc=0x00007fd3e11a8314 offset=df4):
   java.lang.invoke.LambdaForm$DMH/0x00000008000d4800::newInvokeSpecial@1
   Locals
    - l0: a 'java/lang/invoke/DirectMethodHandle$Constructor'{0x0000000101c29e60}
    - l1: reg rbp [10],oop
    - l2: stack[24]
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8314 offset=df4):
   java.lang.invoke.LambdaForm$MH/0x00000008000d5000::linkToTargetMethod@6
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fd3e11a8314 offset=df4):
   jdk.incubator.vector.IntVector::fromArray@59 (line 2728)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
   Expression stack
    - @0: stack[40],oop
    - @1: stack[72],oop
ScopeDesc(pc=0x00007fd3e11a8314 offset=df4):
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
    - l4: stack[24]
    - l5: stack[64],oop
    - l6: empty
    - l7: stack[72],oop
ScopeDesc(pc=0x00007fd3e11a8325 offset=e05):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8325 offset=e05):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8325 offset=e05):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8325 offset=e05):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8325 offset=e05):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a832a offset=e0a):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a832a offset=e0a):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a832a offset=e0a):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a832a offset=e0a):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a832a offset=e0a):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a832a offset=e0a):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a832a offset=e0a):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a832a offset=e0a):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a832a offset=e0a):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8352 offset=e32):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8352 offset=e32):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8352 offset=e32):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8352 offset=e32):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8352 offset=e32):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a835c offset=e3c):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[52]
    - @1: stack[72]
    - @2: NULL
ScopeDesc(pc=0x00007fd3e11a835c offset=e3c):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fd3e11a835c offset=e3c):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[56],oop
    - l1: stack[64],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fd3e11a835c offset=e3c):
   App::micro_vector_masked@32 (line 44)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: stack[64],oop
    - l3: stack[40],oop
    - l4: stack[52]
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8370 offset=e50):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8370 offset=e50):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8370 offset=e50):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8370 offset=e50):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8370 offset=e50):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8375 offset=e55):
   jdk.incubator.vector.AbstractSpecies::dummyVector@-1 (line 295)
ScopeDesc(pc=0x00007fd3e11a8375 offset=e55):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007fd3e11a8375 offset=e55):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a8375 offset=e55):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a83a2 offset=e82):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a83a2 offset=e82):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a83a2 offset=e82):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a83a2 offset=e82):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a83a2 offset=e82):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a83ac offset=e8c):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[52]
    - @1: stack[72]
    - @2: NULL
ScopeDesc(pc=0x00007fd3e11a83ac offset=e8c):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fd3e11a83ac offset=e8c):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[56],oop
    - l1: stack[64],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fd3e11a83ac offset=e8c):
   App::micro_vector_masked@44 (line 45)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: stack[32],oop
    - l3: stack[64],oop
    - l4: stack[52]
    - l5: obj[920]
    - l6: empty
    - l7: empty
   Objects
    - 920: jdk.incubator.vector.Int256Vector stack[96]Wrong location type 7
ScopeDesc(pc=0x00007fd3e11a83c0 offset=ea0):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a83c0 offset=ea0):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a83c0 offset=ea0):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a83c0 offset=ea0):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a83c0 offset=ea0):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a83c5 offset=ea5):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3574)
ScopeDesc(pc=0x00007fd3e11a83c5 offset=ea5):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a83c5 offset=ea5):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a83e3 offset=ec3):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a83e3 offset=ec3):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a83e3 offset=ec3):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a83e3 offset=ec3):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a83e3 offset=ec3):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a83ec offset=ecc):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[52]
    - @1: stack[64]
    - @2: NULL
ScopeDesc(pc=0x00007fd3e11a83ec offset=ecc):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fd3e11a83ec offset=ecc):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: obj[994]
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fd3e11a83ec offset=ecc):
   App::micro_vector_masked@59 (line 46)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[56],oop
    - l2: stack[32],oop
    - l3: stack[40],oop
    - l4: stack[52]
    - l5: empty
    - l6: empty
    - l7: empty
   Objects
    - 994: jdk.incubator.vector.Int256Vector stack[96]Wrong location type 7
ScopeDesc(pc=0x00007fd3e11a8400 offset=ee0):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8400 offset=ee0):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8400 offset=ee0):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8400 offset=ee0):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8400 offset=ee0):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8403 offset=ee3):
   jdk.incubator.vector.VectorOperators::opKind@5 (line 409)
ScopeDesc(pc=0x00007fd3e11a8403 offset=ee3):
   jdk.incubator.vector.IntVector::opKind@2 (line 71)
ScopeDesc(pc=0x00007fd3e11a8403 offset=ee3):
   jdk.incubator.vector.IntVector::lanewiseTemplate@15 (line 603)
ScopeDesc(pc=0x00007fd3e11a8403 offset=ee3):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fd3e11a8403 offset=ee3):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fd3e11a8403 offset=ee3):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fd3e11a8403 offset=ee3):
   App::micro_vector_masked@53 (line 46)
ScopeDesc(pc=0x00007fd3e11a8408 offset=ee8):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8408 offset=ee8):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8408 offset=ee8):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8408 offset=ee8):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8408 offset=ee8):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a840d offset=eed):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
ScopeDesc(pc=0x00007fd3e11a840d offset=eed):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a840d offset=eed):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a840d offset=eed):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a840d offset=eed):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a840d offset=eed):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a840d offset=eed):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a840d offset=eed):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a840d offset=eed):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a840d offset=eed):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8418 offset=ef8):
   App::micro_vector_masked@140 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: NULL
    - @1: reg rbp [10],oop
    - @2: stack[32],oop
ScopeDesc(pc=0x00007fd3e11a842c offset=f0c):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a842c offset=f0c):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a842c offset=f0c):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a842c offset=f0c):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a842c offset=f0c):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8431 offset=f11):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8431 offset=f11):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8431 offset=f11):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8431 offset=f11):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8431 offset=f11):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8431 offset=f11):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8431 offset=f11):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a844c offset=f2c):
   App::micro_vector_masked@17 (line 43)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[40],oop
    - l3: stack[48],oop
    - l4: 0
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],narrowoop
    - @2: stack[56]
ScopeDesc(pc=0x00007fd3e11a8460 offset=f40):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8460 offset=f40):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8460 offset=f40):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8460 offset=f40):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8460 offset=f40):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8465 offset=f45):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
ScopeDesc(pc=0x00007fd3e11a8465 offset=f45):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8465 offset=f45):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8465 offset=f45):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8465 offset=f45):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8465 offset=f45):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8465 offset=f45):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8465 offset=f45):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8465 offset=f45):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8465 offset=f45):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8470 offset=f50):
   jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: reg rbp [10],oop
ScopeDesc(pc=0x00007fd3e11a8470 offset=f50):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fd3e11a8470 offset=f50):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
    - l8: empty
ScopeDesc(pc=0x00007fd3e11a8470 offset=f50):
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8484 offset=f64):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8484 offset=f64):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8484 offset=f64):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8484 offset=f64):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8484 offset=f64):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8489 offset=f69):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@41 (line 74)
ScopeDesc(pc=0x00007fd3e11a8489 offset=f69):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fd3e11a8489 offset=f69):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a84d5 offset=fb5):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a84d5 offset=fb5):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a84d5 offset=fb5):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a84d5 offset=fb5):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a84d5 offset=fb5):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a84e0 offset=fc0):
   jdk.incubator.vector.IntVector$IntSpecies::iota@17 (line 3664)  reexecute=true
   Locals
    - l0: empty
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007fd3e11a84e0 offset=fc0):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: 1
    - l4: empty
   Expression stack
    - @0: stack[96],oop
    - @1: stack[52]
    - @2: stack[68]
ScopeDesc(pc=0x00007fd3e11a84e0 offset=fc0):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[64]
    - l3: stack[80],oop
    - l4: stack[88],oop
    - l5: empty
ScopeDesc(pc=0x00007fd3e11a84e0 offset=fc0):
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: stack[40],oop
    - l4: stack[52]
    - l5: empty
    - l6: empty
    - l7: stack[80],oop
ScopeDesc(pc=0x00007fd3e11a84f4 offset=fd4):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a84f4 offset=fd4):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a84f4 offset=fd4):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a84f4 offset=fd4):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a84f4 offset=fd4):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a84f9 offset=fd9):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a84f9 offset=fd9):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a84f9 offset=fd9):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a84f9 offset=fd9):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a84f9 offset=fd9):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a84f9 offset=fd9):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a84f9 offset=fd9):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a84f9 offset=fd9):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a84f9 offset=fd9):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8524 offset=1004):
   jdk.incubator.vector.IntVector$IntSpecies::iota@17 (line 3664)  reexecute=true
   Locals
    - l0: empty
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007fd3e11a8524 offset=1004):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: 1
    - l4: empty
   Expression stack
    - @0: stack[72],oop
    - @1: stack[36]
    - @2: stack[52]
ScopeDesc(pc=0x00007fd3e11a8524 offset=1004):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   Locals
    - l0: empty
    - l1: stack[40],oop
    - l2: stack[48]
    - l3: stack[72],oop
    - l4: stack[80],oop
    - l5: empty
ScopeDesc(pc=0x00007fd3e11a8524 offset=1004):
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
    - l4: stack[36]
    - l5: stack[56],oop
    - l6: empty
    - l7: stack[72],oop
ScopeDesc(pc=0x00007fd3e11a8538 offset=1018):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8538 offset=1018):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8538 offset=1018):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8538 offset=1018):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8538 offset=1018):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a853d offset=101d):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
ScopeDesc(pc=0x00007fd3e11a853d offset=101d):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a853d offset=101d):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a853d offset=101d):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a853d offset=101d):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a853d offset=101d):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a853d offset=101d):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a853d offset=101d):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a853d offset=101d):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a853d offset=101d):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8547 offset=1027):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8547 offset=1027):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8547 offset=1027):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8547 offset=1027):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8547 offset=1027):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8550 offset=1030):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[72]
    - @1: stack[28]
    - @2: NULL
ScopeDesc(pc=0x00007fd3e11a8550 offset=1030):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fd3e11a8550 offset=1030):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: stack[32],oop
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fd3e11a8550 offset=1030):
   jdk.incubator.vector.IntVector::intoArray@10 (line 3001)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8550 offset=1030):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8568 offset=1048):
   jdk.incubator.vector.IntVector::fromArray0Template@6 (line 3210)
ScopeDesc(pc=0x00007fd3e11a8568 offset=1048):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a8568 offset=1048):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a8568 offset=1048):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a856d offset=104d):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fd3e11a856d offset=104d):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fd3e11a856d offset=104d):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a859e offset=107e):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a859e offset=107e):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a859e offset=107e):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a859e offset=107e):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a859e offset=107e):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a85a8 offset=1088):
   jdk.incubator.vector.VectorMask::fromLong@104 (line 255)  reexecute=true
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: stack[56],oop
    - l4: empty
    - l5: 0
    - l6: stack[72],long
    - l7: stack[64],oop
    - l8: 0
   Expression stack
    - @0: 0
    - @1: stack[52]
ScopeDesc(pc=0x00007fd3e11a85a8 offset=1088):
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: stack[32],oop
    - l3: stack[40],oop
    - l4: stack[48]
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a85c6 offset=10a6):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a85c6 offset=10a6):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a85c6 offset=10a6):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a85c6 offset=10a6):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a85c6 offset=10a6):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a85cb offset=10ab):
   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
ScopeDesc(pc=0x00007fd3e11a85cb offset=10ab):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
ScopeDesc(pc=0x00007fd3e11a85cb offset=10ab):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a85cb offset=10ab):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a85cb offset=10ab):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a85cb offset=10ab):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a85cb offset=10ab):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a85cb offset=10ab):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a85cb offset=10ab):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a85cb offset=10ab):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a85cb offset=10ab):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a85d8 offset=10b8):
   jdk.incubator.vector.IntVector::intoArray@2 (line 2960)
   Locals
    - l0: stack[40],oop
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
   Expression stack
    - @0: stack[72]
    - @1: stack[40],oop
ScopeDesc(pc=0x00007fd3e11a85d8 offset=10b8):
   jdk.incubator.vector.IntVector::intoArray@10 (line 3001)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a85d8 offset=10b8):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a85ec offset=10cc):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a85ec offset=10cc):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a85ec offset=10cc):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a85ec offset=10cc):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a85ec offset=10cc):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a85f1 offset=10d1):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fd3e11a85f1 offset=10d1):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fd3e11a85f1 offset=10d1):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fd3e11a85f1 offset=10d1):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a85f6 offset=10d6):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a85f6 offset=10d6):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a85f6 offset=10d6):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a85f6 offset=10d6):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a85f6 offset=10d6):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8600 offset=10e0):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[72]
    - @1: stack[84]
    - @2: NULL
ScopeDesc(pc=0x00007fd3e11a8600 offset=10e0):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fd3e11a8600 offset=10e0):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: stack[32],oop
    - l1: stack[56],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fd3e11a8600 offset=10e0):
   jdk.incubator.vector.IntVector::intoArray@10 (line 3001)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8600 offset=10e0):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a864a offset=112a):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a864a offset=112a):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a864a offset=112a):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a864a offset=112a):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a864a offset=112a):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a864f offset=112f):
   jdk.incubator.vector.IntVector::broadcastTemplate@1 (line 534)
ScopeDesc(pc=0x00007fd3e11a864f offset=112f):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a864f offset=112f):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a864f offset=112f):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a864f offset=112f):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a864f offset=112f):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a864f offset=112f):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a864f offset=112f):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8662 offset=1142):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8662 offset=1142):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8662 offset=1142):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8662 offset=1142):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8662 offset=1142):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a866c offset=114c):
   App::micro_vector_masked@22 (line 43)  reexecute=true
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[56],oop
    - l2: stack[32],oop
    - l3: stack[40],oop
    - l4: 0
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: 0
    - @1: stack[48]
ScopeDesc(pc=0x00007fd3e11a8685 offset=1165):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8685 offset=1165):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8685 offset=1165):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8685 offset=1165):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8685 offset=1165):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a868a offset=116a):
   jdk.incubator.vector.IntVector::broadcastTemplate@0 (line 534)
ScopeDesc(pc=0x00007fd3e11a868a offset=116a):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a868a offset=116a):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a868a offset=116a):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a868a offset=116a):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a868a offset=116a):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a868a offset=116a):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a868a offset=116a):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a86a2 offset=1182):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a86a2 offset=1182):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a86a2 offset=1182):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a86a2 offset=1182):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a86a2 offset=1182):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a86ac offset=118c):
   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
   Locals
    - l0: stack[56]
    - l1: stack[60]
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007fd3e11a86ac offset=118c):
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   Locals
    - l0: empty
    - l1: empty
ScopeDesc(pc=0x00007fd3e11a86ac offset=118c):
   App::micro_vector_masked@17 (line 43)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[40],oop
    - l3: stack[48],oop
    - l4: 0
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: 0
ScopeDesc(pc=0x00007fd3e11a86c0 offset=11a0):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a86c0 offset=11a0):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a86c0 offset=11a0):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a86c0 offset=11a0):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a86c0 offset=11a0):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a86c5 offset=11a5):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
ScopeDesc(pc=0x00007fd3e11a86c5 offset=11a5):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a86c5 offset=11a5):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a86c5 offset=11a5):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a86c5 offset=11a5):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a86c5 offset=11a5):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a86c5 offset=11a5):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a86c5 offset=11a5):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a86c5 offset=11a5):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a86c5 offset=11a5):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8716 offset=11f6):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8716 offset=11f6):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8716 offset=11f6):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8716 offset=11f6):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8716 offset=11f6):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8720 offset=1200):
   jdk.incubator.vector.IntVector::fromArray@7 (line 2721)  reexecute=true
   Locals
    - l0: stack[88],oop
    - l1: stack[48],oop
    - l2: stack[56]
    - l3: stack[80],oop
    - l4: stack[88],oop
    - l5: empty
   Expression stack
    - @0: stack[44]
ScopeDesc(pc=0x00007fd3e11a8720 offset=1200):
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: stack[32],oop
    - l4: stack[44]
    - l5: empty
    - l6: empty
    - l7: stack[80],oop
ScopeDesc(pc=0x00007fd3e11a8734 offset=1214):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8734 offset=1214):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8734 offset=1214):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8734 offset=1214):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8734 offset=1214):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8739 offset=1219):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
ScopeDesc(pc=0x00007fd3e11a8739 offset=1219):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8739 offset=1219):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8739 offset=1219):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8739 offset=1219):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8739 offset=1219):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8739 offset=1219):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8739 offset=1219):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8739 offset=1219):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8739 offset=1219):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8766 offset=1246):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8766 offset=1246):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8766 offset=1246):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8766 offset=1246):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8766 offset=1246):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8770 offset=1250):
   jdk.incubator.vector.VectorMask::fromLong@15 (line 242)  reexecute=true
   Locals
    - l0: empty
    - l1: 0
    - l2: stack[64],long
    - l3: stack[56],oop
    - l4: stack[72]
    - l5: empty
    - l6: empty
    - l7: empty
    - l8: empty
   Expression stack
    - @0: stack[72]
    - @1: 64
ScopeDesc(pc=0x00007fd3e11a8770 offset=1250):
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: stack[32],oop
    - l3: stack[40],oop
    - l4: stack[48]
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8796 offset=1276):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8796 offset=1276):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8796 offset=1276):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8796 offset=1276):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8796 offset=1276):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a879b offset=127b):
   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
ScopeDesc(pc=0x00007fd3e11a879b offset=127b):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
ScopeDesc(pc=0x00007fd3e11a879b offset=127b):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a879b offset=127b):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a879b offset=127b):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a879b offset=127b):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a879b offset=127b):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a879b offset=127b):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a879b offset=127b):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a879b offset=127b):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a879b offset=127b):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a87c3 offset=12a3):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a87c3 offset=12a3):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a87c3 offset=12a3):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a87c3 offset=12a3):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a87c3 offset=12a3):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a87cc offset=12ac):
   jdk.incubator.vector.VectorMask::fromLong@40 (line 247)  reexecute=true
   Locals
    - l0: empty
    - l1: 0
    - l2: stack[72],long
    - l3: stack[64],oop
    - l4: stack[60]
    - l5: empty
    - l6: empty
    - l7: empty
    - l8: empty
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007fd3e11a87cc offset=12ac):
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[40],oop
    - l3: stack[48],oop
    - l4: stack[56]
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a87e0 offset=12c0):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a87e0 offset=12c0):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a87e0 offset=12c0):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a87e0 offset=12c0):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a87e0 offset=12c0):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a87e5 offset=12c5):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
ScopeDesc(pc=0x00007fd3e11a87e5 offset=12c5):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a87e5 offset=12c5):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a87e5 offset=12c5):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a87e5 offset=12c5):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a87e5 offset=12c5):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a87e5 offset=12c5):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a87e5 offset=12c5):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a87e5 offset=12c5):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a87e5 offset=12c5):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8827 offset=1307):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8827 offset=1307):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8827 offset=1307):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8827 offset=1307):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8827 offset=1307):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8830 offset=1310):
   jdk.incubator.vector.IntVector::fromArray@20 (line 2721)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[64]
    - l3: stack[80],oop
    - l4: stack[88],oop
    - l5: empty
   Expression stack
    - @0: stack[52]
    - @1: reg rbp [10],int
ScopeDesc(pc=0x00007fd3e11a8830 offset=1310):
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: stack[40],oop
    - l4: stack[52]
    - l5: empty
    - l6: empty
    - l7: stack[80],oop
ScopeDesc(pc=0x00007fd3e11a8844 offset=1324):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8844 offset=1324):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8844 offset=1324):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8844 offset=1324):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8844 offset=1324):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8849 offset=1329):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
ScopeDesc(pc=0x00007fd3e11a8849 offset=1329):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8849 offset=1329):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8849 offset=1329):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8849 offset=1329):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8849 offset=1329):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8849 offset=1329):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8849 offset=1329):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8849 offset=1329):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8849 offset=1329):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8895 offset=1375):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8895 offset=1375):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8895 offset=1375):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8895 offset=1375):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8895 offset=1375):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a88a0 offset=1380):
   jdk.incubator.vector.IntVector$IntSpecies::iota@6 (line 3662)  reexecute=true
   Locals
    - l0: stack[104],oop
   Expression stack
    - @0: reg rbp [10],narrowoop
    - @1: a 'java/lang/Class'{0x000000010188fc10} = 'jdk/incubator/vector/IntMaxVector'
ScopeDesc(pc=0x00007fd3e11a88a0 offset=1380):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: 1
    - l4: empty
   Expression stack
    - @0: stack[96],oop
    - @1: stack[52]
    - @2: stack[68]
ScopeDesc(pc=0x00007fd3e11a88a0 offset=1380):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[64]
    - l3: stack[80],oop
    - l4: stack[104],oop
    - l5: empty
ScopeDesc(pc=0x00007fd3e11a88a0 offset=1380):
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: stack[40],oop
    - l4: stack[52]
    - l5: empty
    - l6: empty
    - l7: stack[80],oop
ScopeDesc(pc=0x00007fd3e11a88b4 offset=1394):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a88b4 offset=1394):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a88b4 offset=1394):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a88b4 offset=1394):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a88b4 offset=1394):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a88b9 offset=1399):
   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@4
ScopeDesc(pc=0x00007fd3e11a88b9 offset=1399):
   jdk.incubator.vector.IntVector::fromArray0Template@26 (line 3211)
ScopeDesc(pc=0x00007fd3e11a88b9 offset=1399):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a88b9 offset=1399):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a88b9 offset=1399):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a8906 offset=13e6):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8906 offset=13e6):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8906 offset=13e6):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8906 offset=13e6):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8906 offset=13e6):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8910 offset=13f0):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@150 (line 240)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[52]
    - l2: stack[68]
    - l3: empty
    - l4: 1
    - l5: empty
    - l6: obj[1058]
    - l7: empty
    - l8: empty
    - l9: empty
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007fd3e11a8910 offset=13f0):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8910 offset=13f0):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[64]
    - l3: stack[80],oop
    - l4: stack[88],oop
    - l5: empty
ScopeDesc(pc=0x00007fd3e11a8910 offset=13f0):
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: stack[40],oop
    - l4: stack[52]
    - l5: empty
    - l6: empty
    - l7: stack[80],oop
   Objects
    - 1058: jdk.incubator.vector.Int256Vector$Int256Mask stack[96]Wrong location type 7
ScopeDesc(pc=0x00007fd3e11a8924 offset=1404):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8924 offset=1404):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8924 offset=1404):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8924 offset=1404):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8924 offset=1404):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8929 offset=1409):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8929 offset=1409):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8929 offset=1409):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8929 offset=1409):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8929 offset=1409):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8929 offset=1409):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8929 offset=1409):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8929 offset=1409):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8929 offset=1409):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8947 offset=1427):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8947 offset=1427):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8947 offset=1427):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8947 offset=1427):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8947 offset=1427):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8950 offset=1430):
   jdk.incubator.vector.IntVector::fromArray@20 (line 2721)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[40],oop
    - l2: stack[48]
    - l3: stack[72],oop
    - l4: stack[80],oop
    - l5: empty
   Expression stack
    - @0: stack[36]
    - @1: reg rbp [10],int
ScopeDesc(pc=0x00007fd3e11a8950 offset=1430):
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
    - l4: stack[36]
    - l5: stack[56],oop
    - l6: empty
    - l7: stack[72],oop
ScopeDesc(pc=0x00007fd3e11a8964 offset=1444):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8964 offset=1444):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8964 offset=1444):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8964 offset=1444):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8964 offset=1444):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8969 offset=1449):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
ScopeDesc(pc=0x00007fd3e11a8969 offset=1449):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8969 offset=1449):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8969 offset=1449):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8969 offset=1449):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8969 offset=1449):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8969 offset=1449):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8969 offset=1449):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8969 offset=1449):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8969 offset=1449):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8994 offset=1474):
   jdk.incubator.vector.IntVector$IntSpecies::iota@6 (line 3662)  reexecute=true
   Locals
    - l0: stack[96],oop
   Expression stack
    - @0: reg rbp [10],narrowoop
    - @1: a 'java/lang/Class'{0x000000010188fc10} = 'jdk/incubator/vector/IntMaxVector'
ScopeDesc(pc=0x00007fd3e11a8994 offset=1474):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: 1
    - l4: empty
   Expression stack
    - @0: stack[72],oop
    - @1: stack[36]
    - @2: stack[52]
ScopeDesc(pc=0x00007fd3e11a8994 offset=1474):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   Locals
    - l0: empty
    - l1: stack[40],oop
    - l2: stack[48]
    - l3: stack[72],oop
    - l4: stack[96],oop
    - l5: empty
ScopeDesc(pc=0x00007fd3e11a8994 offset=1474):
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
    - l4: stack[36]
    - l5: stack[56],oop
    - l6: empty
    - l7: stack[72],oop
ScopeDesc(pc=0x00007fd3e11a89a8 offset=1488):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a89a8 offset=1488):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a89a8 offset=1488):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a89a8 offset=1488):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a89a8 offset=1488):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a89ad offset=148d):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fd3e11a89ad offset=148d):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a89d6 offset=14b6):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a89d6 offset=14b6):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a89d6 offset=14b6):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a89d6 offset=14b6):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a89d6 offset=14b6):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a89e0 offset=14c0):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@150 (line 240)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[36]
    - l2: stack[52]
    - l3: empty
    - l4: 1
    - l5: empty
    - l6: obj[890]
    - l7: empty
    - l8: empty
    - l9: empty
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007fd3e11a89e0 offset=14c0):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a89e0 offset=14c0):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   Locals
    - l0: empty
    - l1: stack[40],oop
    - l2: stack[48]
    - l3: stack[72],oop
    - l4: stack[80],oop
    - l5: empty
ScopeDesc(pc=0x00007fd3e11a89e0 offset=14c0):
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
    - l4: stack[36]
    - l5: stack[56],oop
    - l6: empty
    - l7: stack[72],oop
   Objects
    - 890: jdk.incubator.vector.Int256Vector$Int256Mask stack[96]Wrong location type 7
ScopeDesc(pc=0x00007fd3e11a89f4 offset=14d4):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
ScopeDesc(pc=0x00007fd3e11a89f4 offset=14d4):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a89f4 offset=14d4):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a8a21 offset=1501):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8a21 offset=1501):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8a21 offset=1501):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8a21 offset=1501):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8a21 offset=1501):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8a2c offset=150c):
   jdk.incubator.vector.IntVector::stOp@44 (line 355)
   Locals
    - l0: empty
    - l1: stack[48],oop
    - l2: stack[56]
    - l3: empty
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: stack[64],oop
    - l6: stack[40],oop
    - l7: stack[60]
   Expression stack
    - @0: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - @1: stack[48],oop
    - @2: stack[56]
    - @3: stack[72]
    - @4: stack[64],oop
    - @5: stack[60]
ScopeDesc(pc=0x00007fd3e11a8a2c offset=150c):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8a2c offset=150c):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8a40 offset=1520):
   jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
ScopeDesc(pc=0x00007fd3e11a8a40 offset=1520):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
ScopeDesc(pc=0x00007fd3e11a8a40 offset=1520):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
ScopeDesc(pc=0x00007fd3e11a8a40 offset=1520):
   App::micro_vector_masked@101 (line 51)
ScopeDesc(pc=0x00007fd3e11a8a6e offset=154e):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8a6e offset=154e):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8a6e offset=154e):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8a6e offset=154e):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8a6e offset=154e):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8a78 offset=1558):
   jdk.incubator.vector.IntVector::lambda$intoArray$82@5 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: stack[48],oop
    - @1: stack[56]
    - @2: stack[60]
ScopeDesc(pc=0x00007fd3e11a8a78 offset=1558):
   jdk.incubator.vector.IntVector$$Lambda$67/0x00000008000ad640::apply@8
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8a78 offset=1558):
   jdk.incubator.vector.IntVector::stOp@45 (line 355)
   Locals
    - l0: empty
    - l1: stack[48],oop
    - l2: stack[72]
    - l3: empty
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: stack[32],oop
    - l6: stack[40],oop
    - l7: stack[28]
ScopeDesc(pc=0x00007fd3e11a8a78 offset=1558):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8a78 offset=1558):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8a8c offset=156c):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8a8c offset=156c):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8a8c offset=156c):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8a8c offset=156c):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8a8c offset=156c):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8a91 offset=1571):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8a91 offset=1571):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8a91 offset=1571):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8a91 offset=1571):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8a91 offset=1571):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8a91 offset=1571):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8a91 offset=1571):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8a91 offset=1571):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8a91 offset=1571):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8ab0 offset=1590):
   jdk.incubator.vector.IntVector$IntSpecies::iota@17 (line 3664)  reexecute=true
   Locals
    - l0: empty
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007fd3e11a8ab0 offset=1590):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: 1
    - l4: empty
   Expression stack
    - @0: stack[40],oop
    - @1: stack[72]
    - @2: stack[80]
ScopeDesc(pc=0x00007fd3e11a8ab0 offset=1590):
   jdk.incubator.vector.IntVector::intoArray@29 (line 3005)
   Locals
    - l0: stack[48],oop
    - l1: stack[24],oop
    - l2: stack[36]
    - l3: stack[40],oop
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8ab0 offset=1590):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8ac4 offset=15a4):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8ac4 offset=15a4):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8ac4 offset=15a4):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8ac4 offset=15a4):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8ac4 offset=15a4):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8ac9 offset=15a9):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@0 (line 3503)
ScopeDesc(pc=0x00007fd3e11a8ac9 offset=15a9):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8ac9 offset=15a9):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8ac9 offset=15a9):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8ac9 offset=15a9):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8ac9 offset=15a9):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8ac9 offset=15a9):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8ac9 offset=15a9):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8ac9 offset=15a9):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8ac9 offset=15a9):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8ad4 offset=15b4):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[72]
    - l3: stack[32],oop
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: stack[48],oop
ScopeDesc(pc=0x00007fd3e11a8ad4 offset=15b4):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8ad4 offset=15b4):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8ae8 offset=15c8):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8ae8 offset=15c8):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8ae8 offset=15c8):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8ae8 offset=15c8):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8ae8 offset=15c8):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8aed offset=15cd):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
ScopeDesc(pc=0x00007fd3e11a8aed offset=15cd):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8aed offset=15cd):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8aed offset=15cd):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8aed offset=15cd):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8aed offset=15cd):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8aed offset=15cd):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8aed offset=15cd):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8aed offset=15cd):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8aed offset=15cd):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8afb offset=15db):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8afb offset=15db):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8afb offset=15db):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8afb offset=15db):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8afb offset=15db):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8b04 offset=15e4):
   jdk.incubator.vector.IntVector::stOp@23 (line 353)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[72]
    - l3: empty
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: stack[32],oop
    - l6: stack[40],oop
    - l7: 0
   Expression stack
    - @0: 0
    - @1: stack[28]
ScopeDesc(pc=0x00007fd3e11a8b04 offset=15e4):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8b04 offset=15e4):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8ba4 offset=1684):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8ba4 offset=1684):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8ba4 offset=1684):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8ba4 offset=1684):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8ba4 offset=1684):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8ba9 offset=1689):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8ba9 offset=1689):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8ba9 offset=1689):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8ba9 offset=1689):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8ba9 offset=1689):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8ba9 offset=1689):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8ba9 offset=1689):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8ba9 offset=1689):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8bc2 offset=16a2):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8bc2 offset=16a2):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8bc2 offset=16a2):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8bc2 offset=16a2):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8bc2 offset=16a2):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8bcc offset=16ac):
   jdk.incubator.vector.IntVector$IntSpecies::iota@6 (line 3662)  reexecute=true
   Locals
    - l0: stack[72],oop
   Expression stack
    - @0: reg rbp [10],narrowoop
    - @1: a 'java/lang/Class'{0x000000010188fc10} = 'jdk/incubator/vector/IntMaxVector'
ScopeDesc(pc=0x00007fd3e11a8bcc offset=16ac):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: 1
    - l4: empty
   Expression stack
    - @0: stack[40],oop
    - @1: stack[36]
    - @2: stack[80]
ScopeDesc(pc=0x00007fd3e11a8bcc offset=16ac):
   jdk.incubator.vector.IntVector::intoArray@29 (line 3005)
   Locals
    - l0: stack[48],oop
    - l1: stack[24],oop
    - l2: stack[36]
    - l3: stack[40],oop
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8bcc offset=16ac):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8be0 offset=16c0):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8be0 offset=16c0):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8be0 offset=16c0):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8be0 offset=16c0):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8be0 offset=16c0):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8be5 offset=16c5):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fd3e11a8be5 offset=16c5):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fd3e11a8be5 offset=16c5):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fd3e11a8be5 offset=16c5):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a8c1b offset=16fb):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8c1b offset=16fb):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8c1b offset=16fb):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8c1b offset=16fb):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8c1b offset=16fb):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8c24 offset=1704):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@150 (line 240)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[36]
    - l2: stack[56]
    - l3: empty
    - l4: 1
    - l5: empty
    - l6: obj[875]
    - l7: empty
    - l8: empty
    - l9: empty
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007fd3e11a8c24 offset=1704):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8c24 offset=1704):
   jdk.incubator.vector.IntVector::intoArray@29 (line 3005)
   Locals
    - l0: stack[40],oop
    - l1: stack[24],oop
    - l2: stack[36]
    - l3: stack[48],oop
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8c24 offset=1704):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
   Objects
    - 875: jdk.incubator.vector.Int256Vector$Int256Mask stack[64]Wrong location type 7
ScopeDesc(pc=0x00007fd3e11a8c38 offset=1718):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8c38 offset=1718):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8c38 offset=1718):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8c38 offset=1718):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8c38 offset=1718):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8c3d offset=171d):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@18 (line 3504)
ScopeDesc(pc=0x00007fd3e11a8c3d offset=171d):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8c3d offset=171d):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8c3d offset=171d):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8c3d offset=171d):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8c3d offset=171d):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8c3d offset=171d):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8c3d offset=171d):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8c3d offset=171d):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8c3d offset=171d):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8c68 offset=1748):
   jdk.incubator.vector.IntVector::fromArray@1 (line 2720)
   Locals
    - l0: reg rbp [10],narrowoop
    - l1: stack[56],oop
    - l2: stack[52]
    - l3: stack[72],oop
    - l4: empty
    - l5: empty
   Expression stack
    - @0: reg rbp [10],narrowoop
ScopeDesc(pc=0x00007fd3e11a8c68 offset=1748):
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: stack[40],oop
    - l4: stack[52]
    - l5: empty
    - l6: empty
    - l7: stack[72],oop
ScopeDesc(pc=0x00007fd3e11a8c7c offset=175c):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8c7c offset=175c):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8c7c offset=175c):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8c7c offset=175c):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8c7c offset=175c):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8c81 offset=1761):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fd3e11a8c81 offset=1761):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a8ce4 offset=17c4):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@1 (line 3311)
   Locals
    - l0: stack[44]
    - l1: stack[88],oop
    - l2: empty
    - l3: 1
    - l4: stack[60]
   Expression stack
    - @0: stack[72],oop
ScopeDesc(pc=0x00007fd3e11a8ce4 offset=17c4):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
   Locals
    - l0: empty
    - l1: stack[48],oop
    - l2: stack[56]
    - l3: stack[96],oop
    - l4: stack[88],oop
    - l5: empty
ScopeDesc(pc=0x00007fd3e11a8ce4 offset=17c4):
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: stack[32],oop
    - l4: stack[44]
    - l5: empty
    - l6: empty
    - l7: stack[72],oop
ScopeDesc(pc=0x00007fd3e11a8cf8 offset=17d8):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8cf8 offset=17d8):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8cf8 offset=17d8):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8cf8 offset=17d8):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8cf8 offset=17d8):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8cfd offset=17dd):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
ScopeDesc(pc=0x00007fd3e11a8cfd offset=17dd):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8cfd offset=17dd):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8cfd offset=17dd):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8cfd offset=17dd):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8cfd offset=17dd):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8cfd offset=17dd):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8cfd offset=17dd):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8cfd offset=17dd):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8cfd offset=17dd):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8d16 offset=17f6):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8d16 offset=17f6):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8d16 offset=17f6):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8d16 offset=17f6):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8d16 offset=17f6):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8d20 offset=1800):
   jdk.incubator.vector.IntVector::fromArray@1 (line 2720)
   Locals
    - l0: stack[60],narrowoop
    - l1: stack[32],oop
    - l2: stack[24]
    - l3: stack[72],oop
    - l4: empty
    - l5: empty
   Expression stack
    - @0: stack[60],narrowoop
ScopeDesc(pc=0x00007fd3e11a8d20 offset=1800):
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: empty
    - l3: empty
    - l4: stack[24]
    - l5: stack[40],oop
    - l6: empty
    - l7: stack[72],oop
ScopeDesc(pc=0x00007fd3e11a8d34 offset=1814):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8d34 offset=1814):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8d34 offset=1814):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8d34 offset=1814):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8d34 offset=1814):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8d39 offset=1819):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8d39 offset=1819):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8d39 offset=1819):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8d39 offset=1819):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8d39 offset=1819):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8d39 offset=1819):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8d39 offset=1819):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8d39 offset=1819):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8d39 offset=1819):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8d3d offset=181d):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8d3d offset=181d):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8d3d offset=181d):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8d3d offset=181d):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8d3d offset=181d):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8d48 offset=1828):
   jdk.incubator.vector.Int256Vector::vec@4 (line 117)
   Locals
    - l0: empty
   Expression stack
    - @0: stack[28],narrowoop
ScopeDesc(pc=0x00007fd3e11a8d48 offset=1828):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[72]
    - l3: stack[32],oop
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8d48 offset=1828):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8d48 offset=1828):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8d5c offset=183c):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8d5c offset=183c):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8d5c offset=183c):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8d5c offset=183c):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8d5c offset=183c):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8d61 offset=1841):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8d61 offset=1841):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8d61 offset=1841):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8d61 offset=1841):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8d61 offset=1841):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8d61 offset=1841):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8d61 offset=1841):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8d61 offset=1841):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8d61 offset=1841):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8d6b offset=184b):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8d6b offset=184b):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8d6b offset=184b):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8d6b offset=184b):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8d6b offset=184b):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8d74 offset=1854):
   jdk.incubator.vector.Int256Vector$Int256Mask::getBits@4 (line 569)
   Locals
    - l0: empty
   Expression stack
    - @0: stack[28],narrowoop
ScopeDesc(pc=0x00007fd3e11a8d74 offset=1854):
   jdk.incubator.vector.IntVector::stOp@10 (line 352)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[72]
    - l3: empty
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: stack[32],oop
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8d74 offset=1854):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8d74 offset=1854):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8d8d offset=186d):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8d8d offset=186d):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8d8d offset=186d):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8d8d offset=186d):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8d8d offset=186d):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8d98 offset=1878):
   App::micro_vector_masked@16 (line 43)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: NULL
ScopeDesc(pc=0x00007fd3e11a8dac offset=188c):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8dac offset=188c):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8dac offset=188c):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8dac offset=188c):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8dac offset=188c):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8db1 offset=1891):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8db1 offset=1891):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8db1 offset=1891):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8db1 offset=1891):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8db1 offset=1891):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8db1 offset=1891):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8db1 offset=1891):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8db3 offset=1893):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8db3 offset=1893):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8db3 offset=1893):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8db3 offset=1893):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8db3 offset=1893):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8dbc offset=189c):
   App::micro_vector_masked@17 (line 43)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: empty
    - @1: NULL
    - @2: reg rbp [10],int
ScopeDesc(pc=0x00007fd3e11a8dd0 offset=18b0):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8dd0 offset=18b0):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8dd0 offset=18b0):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8dd0 offset=18b0):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8dd0 offset=18b0):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8dd5 offset=18b5):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@-1 (line 3503)
ScopeDesc(pc=0x00007fd3e11a8dd5 offset=18b5):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8dd5 offset=18b5):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8dd5 offset=18b5):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8dd5 offset=18b5):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8dd5 offset=18b5):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8dd5 offset=18b5):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8dd5 offset=18b5):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8dd5 offset=18b5):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8dd5 offset=18b5):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8dda offset=18ba):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8dda offset=18ba):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8dda offset=18ba):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8dda offset=18ba):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8dda offset=18ba):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8de4 offset=18c4):
   jdk.incubator.vector.VectorMask::fromArray@49 (line 208)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: NULL
ScopeDesc(pc=0x00007fd3e11a8de4 offset=18c4):
   jdk.incubator.vector.VectorMask::fromValues@17 (line 183)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fd3e11a8de4 offset=18c4):
   jdk.incubator.vector.VectorMask::fromLong@141 (line 259)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
    - l8: empty
ScopeDesc(pc=0x00007fd3e11a8de4 offset=18c4):
   App::micro_vector_masked@101 (line 51)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[56],oop
    - l2: stack[64],oop
    - l3: stack[40],oop
    - l4: stack[72]
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8df8 offset=18d8):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8df8 offset=18d8):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8df8 offset=18d8):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8df8 offset=18d8):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8df8 offset=18d8):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8dfd offset=18dd):
   jdk.incubator.vector.AbstractSpecies::laneCount@-1 (line 125)
ScopeDesc(pc=0x00007fd3e11a8dfd offset=18dd):
   jdk.incubator.vector.IntVector::fromArray0Template@14 (line 3210)
ScopeDesc(pc=0x00007fd3e11a8dfd offset=18dd):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a8dfd offset=18dd):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a8dfd offset=18dd):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a8e25 offset=1905):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8e25 offset=1905):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8e25 offset=1905):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8e25 offset=1905):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8e25 offset=1905):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8e30 offset=1910):
   jdk.incubator.vector.IntVector::fromArray@1 (line 2720)
   Locals
    - l0: NULL
    - l1: stack[48],oop
    - l2: stack[72]
    - l3: stack[64],oop
    - l4: empty
    - l5: empty
   Expression stack
    - @0: NULL
ScopeDesc(pc=0x00007fd3e11a8e30 offset=1910):
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: stack[32],oop
    - l4: stack[72]
    - l5: empty
    - l6: empty
    - l7: stack[64],oop
ScopeDesc(pc=0x00007fd3e11a8e44 offset=1924):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8e44 offset=1924):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8e44 offset=1924):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8e44 offset=1924):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8e44 offset=1924):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8e49 offset=1929):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a8e54 offset=1934):
   jdk.incubator.vector.IntVector::fromArray@12 (line 2721)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
   Expression stack
    - @0: empty
    - @1: NULL
ScopeDesc(pc=0x00007fd3e11a8e54 offset=1934):
   App::micro_vector_masked@115 (line 52)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8e68 offset=1948):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8e68 offset=1948):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8e68 offset=1948):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8e68 offset=1948):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8e68 offset=1948):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8e6d offset=194d):
   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@0
ScopeDesc(pc=0x00007fd3e11a8e6d offset=194d):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
ScopeDesc(pc=0x00007fd3e11a8e6d offset=194d):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8e6d offset=194d):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8e6d offset=194d):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8e6d offset=194d):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8e6d offset=194d):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8e6d offset=194d):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8e6d offset=194d):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8e6d offset=194d):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8e6d offset=194d):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8e84 offset=1964):
   jdk.incubator.vector.IntVector::fromArray@1 (line 2720)
   Locals
    - l0: NULL
    - l1: stack[32],oop
    - l2: stack[24]
    - l3: stack[72],oop
    - l4: empty
    - l5: empty
   Expression stack
    - @0: NULL
ScopeDesc(pc=0x00007fd3e11a8e84 offset=1964):
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: empty
    - l3: empty
    - l4: stack[24]
    - l5: stack[64],oop
    - l6: empty
    - l7: stack[72],oop
ScopeDesc(pc=0x00007fd3e11a8e98 offset=1978):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8e98 offset=1978):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8e98 offset=1978):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8e98 offset=1978):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8e98 offset=1978):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8e9d offset=197d):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8e9d offset=197d):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8e9d offset=197d):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8e9d offset=197d):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8e9d offset=197d):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8e9d offset=197d):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8e9d offset=197d):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8e9d offset=197d):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8e9d offset=197d):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8ea8 offset=1988):
   jdk.incubator.vector.IntVector::fromArray@12 (line 2721)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
   Expression stack
    - @0: empty
    - @1: NULL
ScopeDesc(pc=0x00007fd3e11a8ea8 offset=1988):
   App::micro_vector_masked@129 (line 53)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8ebc offset=199c):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8ebc offset=199c):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8ebc offset=199c):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8ebc offset=199c):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8ebc offset=199c):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8ec1 offset=19a1):
   java.lang.invoke.LambdaForm$MH/0x0000000800005800::linkToTargetMethod@-1
ScopeDesc(pc=0x00007fd3e11a8ec1 offset=19a1):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
ScopeDesc(pc=0x00007fd3e11a8ec1 offset=19a1):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8ec1 offset=19a1):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8ec1 offset=19a1):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8ec1 offset=19a1):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8ec1 offset=19a1):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8ec1 offset=19a1):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8ec1 offset=19a1):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8ec1 offset=19a1):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8ec1 offset=19a1):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8ecc offset=19ac):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
   Expression stack
    - @0: NULL
    - @1: stack[56],oop
    - @2: stack[72]
    - @3: stack[32],oop
ScopeDesc(pc=0x00007fd3e11a8ee0 offset=19c0):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8ee0 offset=19c0):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8ee0 offset=19c0):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8ee0 offset=19c0):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8ee0 offset=19c0):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8ee5 offset=19c5):
   jdk.incubator.vector.IntVector$IntSpecies::broadcastBits@13 (line 3503)
ScopeDesc(pc=0x00007fd3e11a8ee5 offset=19c5):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@6 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8ee5 offset=19c5):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8ee5 offset=19c5):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8ee5 offset=19c5):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8ee5 offset=19c5):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8ee5 offset=19c5):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8ee5 offset=19c5):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8ee5 offset=19c5):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8ee5 offset=19c5):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8ef0 offset=19d0):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@8 (line 3312)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: empty
    - @3: NULL
ScopeDesc(pc=0x00007fd3e11a8ef0 offset=19d0):
   jdk.incubator.vector.IntVector::intoArray@29 (line 3005)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8ef0 offset=19d0):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8f04 offset=19e4):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8f04 offset=19e4):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8f04 offset=19e4):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8f04 offset=19e4):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8f04 offset=19e4):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8f09 offset=19e9):
   jdk.incubator.vector.IntVector::toBits@1 (line 403)
ScopeDesc(pc=0x00007fd3e11a8f09 offset=19e9):
   jdk.incubator.vector.IntVector$IntSpecies::longToElementBits@21 (line 3531)
ScopeDesc(pc=0x00007fd3e11a8f09 offset=19e9):
   jdk.incubator.vector.IntVector$IntSpecies::broadcast@3 (line 3519)
ScopeDesc(pc=0x00007fd3e11a8f09 offset=19e9):
   jdk.incubator.vector.IntVector::broadcastTemplate@5 (line 534)
ScopeDesc(pc=0x00007fd3e11a8f09 offset=19e9):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 131)
ScopeDesc(pc=0x00007fd3e11a8f09 offset=19e9):
   jdk.incubator.vector.Int256Vector::broadcast@2 (line 41)
ScopeDesc(pc=0x00007fd3e11a8f09 offset=19e9):
   jdk.incubator.vector.AbstractMask::checkIndex0@22 (line 258)
ScopeDesc(pc=0x00007fd3e11a8f09 offset=19e9):
   jdk.incubator.vector.AbstractMask::checkIndexByLane@25 (line 223)
ScopeDesc(pc=0x00007fd3e11a8f09 offset=19e9):
   jdk.incubator.vector.IntVector::checkMaskFromIndexSize@12 (line 3312)
ScopeDesc(pc=0x00007fd3e11a8f09 offset=19e9):
   jdk.incubator.vector.IntVector::fromArray@51 (line 2727)
ScopeDesc(pc=0x00007fd3e11a8f09 offset=19e9):
   App::micro_vector_masked@115 (line 52)
ScopeDesc(pc=0x00007fd3e11a8f14 offset=19f4):
   jdk.incubator.vector.Int256Vector::vec@4 (line 117)
   Locals
    - l0: empty
   Expression stack
    - @0: NULL
ScopeDesc(pc=0x00007fd3e11a8f14 offset=19f4):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[72]
    - l3: stack[32],oop
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8f14 offset=19f4):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8f14 offset=19f4):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8f32 offset=1a12):
   jdk.internal.vm.vector.VectorSupport$VectorPayload::getPayload@-1 (line 101)
ScopeDesc(pc=0x00007fd3e11a8f32 offset=1a12):
   jdk.incubator.vector.Int256Vector::vec@1 (line 117)
ScopeDesc(pc=0x00007fd3e11a8f32 offset=1a12):
   jdk.incubator.vector.IntVector::stOp@1 (line 351)
ScopeDesc(pc=0x00007fd3e11a8f32 offset=1a12):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
ScopeDesc(pc=0x00007fd3e11a8f32 offset=1a12):
   App::micro_vector_masked@148 (line 54)
ScopeDesc(pc=0x00007fd3e11a8f3c offset=1a1c):
   jdk.incubator.vector.Int256Vector$Int256Mask::getBits@4 (line 569)
   Locals
    - l0: empty
   Expression stack
    - @0: NULL
ScopeDesc(pc=0x00007fd3e11a8f3c offset=1a1c):
   jdk.incubator.vector.IntVector::stOp@10 (line 352)
   Locals
    - l0: empty
    - l1: stack[56],oop
    - l2: stack[72]
    - l3: empty
    - l4: a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
    - l5: stack[32],oop
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8f3c offset=1a1c):
   jdk.incubator.vector.IntVector::intoArray@41 (line 3006)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007fd3e11a8f3c offset=1a1c):
   App::micro_vector_masked@148 (line 54)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
    - l7: empty
ScopeDesc(pc=0x00007fd3e11a8f55 offset=1a35):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a8f55 offset=1a35):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a8f55 offset=1a35):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a8f7e offset=1a5e):
   jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
ScopeDesc(pc=0x00007fd3e11a8f7e offset=1a5e):
   App::micro_vector_masked@32 (line 44)
ScopeDesc(pc=0x00007fd3e11a8f81 offset=1a61):
   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
ScopeDesc(pc=0x00007fd3e11a8f81 offset=1a61):
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
ScopeDesc(pc=0x00007fd3e11a8f81 offset=1a61):
   App::micro_vector_masked@17 (line 43)
ScopeDesc(pc=0x00007fd3e11a8f91 offset=1a71):
   jdk.incubator.vector.IntVector$IntSpecies::elementType@0 (line 3476)
ScopeDesc(pc=0x00007fd3e11a8f91 offset=1a71):
   jdk.incubator.vector.IntVector::fromArray0Template@10 (line 3210)
ScopeDesc(pc=0x00007fd3e11a8f91 offset=1a71):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fd3e11a8f91 offset=1a71):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fd3e11a8f91 offset=1a71):
   App::micro_vector_masked@32 (line 44)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007fd3e11a7108: 6014
relocInfo@0x00007fd3e11a7108 [type=6(runtime_call) addr=0x00007fd3e11a7534 offset=20] | [destination=0x00007fd3e1115920]
         @0x00007fd3e11a710a: f008cc37
relocInfo@0x00007fd3e11a710c [type=12(metadata) addr=0x00007fd3e11a756b offset=55 format=3 data=8] | [metadata_addr=0x00007fd3e11a9088 *=0x0000000800094b80 offset=0]metadata_value=0x0000000800094b80: 'jdk/incubator/vector/IntVector$IntSpecies'
         @0x00007fd3e11a710e: f00ccc67
relocInfo@0x00007fd3e11a7110 [type=12(metadata) addr=0x00007fd3e11a75d2 offset=103 format=3 data=12] | [metadata_addr=0x00007fd3e11a90a8 *=0x0000000800098110 offset=0]metadata_value=0x0000000800098110: 'jdk/incubator/vector/Int256Vector'
         @0x00007fd3e11a7112: a06d
relocInfo@0x00007fd3e11a7112 [type=10(poll) addr=0x00007fd3e11a763f offset=109]
         @0x00007fd3e11a7114: f016ccb0
relocInfo@0x00007fd3e11a7116 [type=12(metadata) addr=0x00007fd3e11a76ef offset=176 format=3 data=22] | [metadata_addr=0x00007fd3e11a90f8 *=0x0000000800040000 offset=0]metadata_value=0x0000000800040000: {type array bool}
         @0x00007fd3e11a7118: a1c5
relocInfo@0x00007fd3e11a7118 [type=10(poll) addr=0x00007fd3e11a78b4 offset=453]
         @0x00007fd3e11a711a: f803edd678707fd374bd
relocInfo@0x00007fd3e11a7122 [type=7(external_word) addr=0x00007fd3e11a7971 offset=189 format=1 data={edd678707fd3}] | [target=0x00007fd3edd67870]
         @0x00007fd3e11a7124: f803ed3151807fd3700d
relocInfo@0x00007fd3e11a712c [type=7(external_word) addr=0x00007fd3e11a797e offset=13 data={ed3151807fd3}] | [target=0x00007fd3ed315180]
         @0x00007fd3e11a712e: 640e
relocInfo@0x00007fd3e11a712e [type=6(runtime_call) addr=0x00007fd3e11a798c offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7130: 1012
relocInfo@0x00007fd3e11a7130 [type=1(oop) addr=0x00007fd3e11a799e offset=18] | [oop_addr=0x00007fd3e11a79a0 *=0x00000001010002b0 offset=0]
         @0x00007fd3e11a7132: 101f
relocInfo@0x00007fd3e11a7132 [type=1(oop) addr=0x00007fd3e11a79bd offset=31] | [oop_addr=0x00007fd3e11a79bf *=0x0000000101be6120 offset=0]
         @0x00007fd3e11a7134: 4412
relocInfo@0x00007fd3e11a7134 [type=4(static_call) addr=0x00007fd3e11a79cf offset=18 format=1] | [destination=0x00007fd3e1195ce0 metadata=0x0000000000000000]
         @0x00007fd3e11a7136: c009
relocInfo@0x00007fd3e11a7136 [type=12(metadata) addr=0x00007fd3e11a79d8 offset=9] | [metadata_addr=0x00007fd3e11a79da *=0x0000000800096638 offset=0]metadata_value=0x0000000800096638: 'jdk/incubator/vector/VectorMask'
         @0x00007fd3e11a7138: f008cc34
relocInfo@0x00007fd3e11a713a [type=12(metadata) addr=0x00007fd3e11a7a0c offset=52 format=3 data=8] | [metadata_addr=0x00007fd3e11a9088 *=0x0000000800094b80 offset=0]metadata_value=0x0000000800094b80: 'jdk/incubator/vector/IntVector$IntSpecies'
         @0x00007fd3e11a713c: f01dcc41
relocInfo@0x00007fd3e11a713e [type=12(metadata) addr=0x00007fd3e11a7a4d offset=65 format=3 data=29] | [metadata_addr=0x00007fd3e11a9130 *=0x0000000800098750 offset=0]metadata_value=0x0000000800098750: 'jdk/incubator/vector/Int256Vector$Int256Mask'
         @0x00007fd3e11a7140: f0011c13
relocInfo@0x00007fd3e11a7142 [type=1(oop) addr=0x00007fd3e11a7a60 offset=19 format=3 data=1] | [oop_addr=0x00007fd3e11a9008 *=0x000000010188fc10 offset=0]
         @0x00007fd3e11a7144: 102d
relocInfo@0x00007fd3e11a7144 [type=1(oop) addr=0x00007fd3e11a7a8d offset=45] | [oop_addr=0x00007fd3e11a7a8f *=0x0000000101964de8 offset=0]
         @0x00007fd3e11a7146: f803e10875a07fd37442
relocInfo@0x00007fd3e11a714e [type=7(external_word) addr=0x00007fd3e11a7acf offset=66 format=1 data={e10875a07fd3}] | [target=0x00007fd3e10875a0]
         @0x00007fd3e11a7150: f01fcc54
relocInfo@0x00007fd3e11a7152 [type=12(metadata) addr=0x00007fd3e11a7b23 offset=84 format=3 data=31] | [metadata_addr=0x00007fd3e11a9140 *=0x00000008000acb58 offset=0]metadata_value=0x00000008000acb58: 'jdk/incubator/vector/IntVector$$Lambda$63+0x00000008000acb58'
         @0x00007fd3e11a7154: f803edd678707fd37430
relocInfo@0x00007fd3e11a715c [type=7(external_word) addr=0x00007fd3e11a7b53 offset=48 format=1 data={edd678707fd3}] | [target=0x00007fd3edd67870]
         @0x00007fd3e11a715e: f803ed3150d07fd3700d
relocInfo@0x00007fd3e11a7166 [type=7(external_word) addr=0x00007fd3e11a7b60 offset=13 data={ed3150d07fd3}] | [target=0x00007fd3ed3150d0]
         @0x00007fd3e11a7168: 640e
relocInfo@0x00007fd3e11a7168 [type=6(runtime_call) addr=0x00007fd3e11a7b6e offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a716a: f803ed3151107fd37011
relocInfo@0x00007fd3e11a7172 [type=7(external_word) addr=0x00007fd3e11a7b7f offset=17 data={ed3151107fd3}] | [target=0x00007fd3ed315110]
         @0x00007fd3e11a7174: 640e
relocInfo@0x00007fd3e11a7174 [type=6(runtime_call) addr=0x00007fd3e11a7b8d offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7176: 341e
relocInfo@0x00007fd3e11a7176 [type=3(opt_virtual_call) addr=0x00007fd3e11a7bab offset=30 format=1] | [destination=0x00007fd3e1191f80 metadata=0x0000000000000000]
         @0x00007fd3e11a7178: f008cc1a
relocInfo@0x00007fd3e11a717a [type=12(metadata) addr=0x00007fd3e11a7bc5 offset=26 format=3 data=8] | [metadata_addr=0x00007fd3e11a9088 *=0x0000000800094b80 offset=0]metadata_value=0x0000000800094b80: 'jdk/incubator/vector/IntVector$IntSpecies'
         @0x00007fd3e11a717c: f0011c3b
relocInfo@0x00007fd3e11a717e [type=1(oop) addr=0x00007fd3e11a7c00 offset=59 format=3 data=1] | [oop_addr=0x00007fd3e11a9008 *=0x000000010188fc10 offset=0]
         @0x00007fd3e11a7180: 1029
relocInfo@0x00007fd3e11a7180 [type=1(oop) addr=0x00007fd3e11a7c29 offset=41] | [oop_addr=0x00007fd3e11a7c2b *=0x0000000101964de8 offset=0]
         @0x00007fd3e11a7182: f803e10875a07fd37438
relocInfo@0x00007fd3e11a718a [type=7(external_word) addr=0x00007fd3e11a7c61 offset=56 format=1 data={e10875a07fd3}] | [target=0x00007fd3e10875a0]
         @0x00007fd3e11a718c: f01fcc65
relocInfo@0x00007fd3e11a718e [type=12(metadata) addr=0x00007fd3e11a7cc6 offset=101 format=3 data=31] | [metadata_addr=0x00007fd3e11a9140 *=0x00000008000acb58 offset=0]metadata_value=0x00000008000acb58: 'jdk/incubator/vector/IntVector$$Lambda$63+0x00000008000acb58'
         @0x00007fd3e11a7190: f803edd678707fd37425
relocInfo@0x00007fd3e11a7198 [type=7(external_word) addr=0x00007fd3e11a7ceb offset=37 format=1 data={edd678707fd3}] | [target=0x00007fd3edd67870]
         @0x00007fd3e11a719a: f803ed3150d07fd3700d
relocInfo@0x00007fd3e11a71a2 [type=7(external_word) addr=0x00007fd3e11a7cf8 offset=13 data={ed3150d07fd3}] | [target=0x00007fd3ed3150d0]
         @0x00007fd3e11a71a4: 640e
relocInfo@0x00007fd3e11a71a4 [type=6(runtime_call) addr=0x00007fd3e11a7d06 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a71a6: f803ed3151107fd37011
relocInfo@0x00007fd3e11a71ae [type=7(external_word) addr=0x00007fd3e11a7d17 offset=17 data={ed3151107fd3}] | [target=0x00007fd3ed315110]
         @0x00007fd3e11a71b0: 640e
relocInfo@0x00007fd3e11a71b0 [type=6(runtime_call) addr=0x00007fd3e11a7d25 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a71b2: 341e
relocInfo@0x00007fd3e11a71b2 [type=3(opt_virtual_call) addr=0x00007fd3e11a7d43 offset=30 format=1] | [destination=0x00007fd3e1191f80 metadata=0x0000000000000000]
         @0x00007fd3e11a71b4: 1016
relocInfo@0x00007fd3e11a71b4 [type=1(oop) addr=0x00007fd3e11a7d59 offset=22] | [oop_addr=0x00007fd3e11a7d5b *=0x0000000101985c88 offset=0]
         @0x00007fd3e11a71b6: f00a241a
relocInfo@0x00007fd3e11a71b8 [type=2(virtual_call) addr=0x00007fd3e11a7d73 offset=26 format=1 data=10] | [destination=0x00007fd3e1179400 cached_value=0x00007fd3e11a7d69 metadata=0x0000000000000000]
         @0x00007fd3e11a71ba: f00a2420
relocInfo@0x00007fd3e11a71bc [type=2(virtual_call) addr=0x00007fd3e11a7d93 offset=32 format=1 data=10] | [destination=0x00007fd3e1112480 cached_value=0x00007fd3e11a7d89 metadata=0x0000000000000000]
         @0x00007fd3e11a71be: f00ccc58
relocInfo@0x00007fd3e11a71c0 [type=12(metadata) addr=0x00007fd3e11a7deb offset=88 format=3 data=12] | [metadata_addr=0x00007fd3e11a90a8 *=0x0000000800098110 offset=0]metadata_value=0x0000000800098110: 'jdk/incubator/vector/Int256Vector'
         @0x00007fd3e11a71c2: b04e
relocInfo@0x00007fd3e11a71c2 [type=11(poll_return) addr=0x00007fd3e11a7e39 offset=78]
         @0x00007fd3e11a71c4: f00a2466
relocInfo@0x00007fd3e11a71c6 [type=2(virtual_call) addr=0x00007fd3e11a7e9f offset=102 format=1 data=10] | [destination=0x00007fd3e11623a0 cached_value=0x00007fd3e11a7e95 metadata=0x0000000000000000]
         @0x00007fd3e11a71c8: f0011c08
relocInfo@0x00007fd3e11a71ca [type=1(oop) addr=0x00007fd3e11a7ea7 offset=8 format=3 data=1] | [oop_addr=0x00007fd3e11a9008 *=0x000000010188fc10 offset=0]
         @0x00007fd3e11a71cc: 103f
relocInfo@0x00007fd3e11a71cc [type=1(oop) addr=0x00007fd3e11a7ee6 offset=63] | [oop_addr=0x00007fd3e11a7ee8 *=0x0000000101964de8 offset=0]
         @0x00007fd3e11a71ce: f803e10875a07fd37436
relocInfo@0x00007fd3e11a71d6 [type=7(external_word) addr=0x00007fd3e11a7f1c offset=54 format=1 data={e10875a07fd3}] | [target=0x00007fd3e10875a0]
         @0x00007fd3e11a71d8: f00ccc44
relocInfo@0x00007fd3e11a71da [type=12(metadata) addr=0x00007fd3e11a7f60 offset=68 format=3 data=12] | [metadata_addr=0x00007fd3e11a90a8 *=0x0000000800098110 offset=0]metadata_value=0x0000000800098110: 'jdk/incubator/vector/Int256Vector'
         @0x00007fd3e11a71dc: f027cc25
relocInfo@0x00007fd3e11a71de [type=12(metadata) addr=0x00007fd3e11a7f85 offset=37 format=3 data=39] | [metadata_addr=0x00007fd3e11a9180 *=0x0000000800040c30 offset=0]metadata_value=0x0000000800040c30: {type array int}
         @0x00007fd3e11a71e0: f016cc20
relocInfo@0x00007fd3e11a71e2 [type=12(metadata) addr=0x00007fd3e11a7fa5 offset=32 format=3 data=22] | [metadata_addr=0x00007fd3e11a90f8 *=0x0000000800040000 offset=0]metadata_value=0x0000000800040000: {type array bool}
         @0x00007fd3e11a71e4: f803ed2fd0787fd37161
relocInfo@0x00007fd3e11a71ec [type=7(external_word) addr=0x00007fd3e11a8106 offset=353 data={ed2fd0787fd3}] | [target=0x00007fd3ed2fd078]
         @0x00007fd3e11a71ee: 640e
relocInfo@0x00007fd3e11a71ee [type=6(runtime_call) addr=0x00007fd3e11a8114 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a71f0: a07d
relocInfo@0x00007fd3e11a71f0 [type=10(poll) addr=0x00007fd3e11a8191 offset=125]
         @0x00007fd3e11a71f2: c0c6
relocInfo@0x00007fd3e11a71f2 [type=12(metadata) addr=0x00007fd3e11a8257 offset=198] | [metadata_addr=0x00007fd3e11a8259 *=0x0000000800040000 offset=0]metadata_value=0x0000000800040000: {type array bool}
         @0x00007fd3e11a71f4: 6410
relocInfo@0x00007fd3e11a71f4 [type=6(runtime_call) addr=0x00007fd3e11a8267 offset=16 format=1] | [destination=0x00007fd3e1058620]
         @0x00007fd3e11a71f6: c060
relocInfo@0x00007fd3e11a71f6 [type=12(metadata) addr=0x00007fd3e11a82c7 offset=96] | [metadata_addr=0x00007fd3e11a82c9 *=0x00000008000acb58 offset=0]metadata_value=0x00000008000acb58: 'jdk/incubator/vector/IntVector$$Lambda$63+0x00000008000acb58'
         @0x00007fd3e11a71f8: 6410
relocInfo@0x00007fd3e11a71f8 [type=6(runtime_call) addr=0x00007fd3e11a82d7 offset=16 format=1] | [destination=0x00007fd3e1058920]
         @0x00007fd3e11a71fa: c029
relocInfo@0x00007fd3e11a71fa [type=12(metadata) addr=0x00007fd3e11a8300 offset=41] | [metadata_addr=0x00007fd3e11a8302 *=0x00000008000acb58 offset=0]metadata_value=0x00000008000acb58: 'jdk/incubator/vector/IntVector$$Lambda$63+0x00000008000acb58'
         @0x00007fd3e11a71fc: 640f
relocInfo@0x00007fd3e11a71fc [type=6(runtime_call) addr=0x00007fd3e11a830f offset=15 format=1] | [destination=0x00007fd3e1058920]
         @0x00007fd3e11a71fe: 6448
relocInfo@0x00007fd3e11a71fe [type=6(runtime_call) addr=0x00007fd3e11a8357 offset=72 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7200: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7208 [type=7(external_word) addr=0x00007fd3e11a835c offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a720a: 640e
relocInfo@0x00007fd3e11a720a [type=6(runtime_call) addr=0x00007fd3e11a836a offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a720c: 643d
relocInfo@0x00007fd3e11a720c [type=6(runtime_call) addr=0x00007fd3e11a83a7 offset=61 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a720e: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7216 [type=7(external_word) addr=0x00007fd3e11a83ac offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7218: 640e
relocInfo@0x00007fd3e11a7218 [type=6(runtime_call) addr=0x00007fd3e11a83ba offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a721a: 642d
relocInfo@0x00007fd3e11a721a [type=6(runtime_call) addr=0x00007fd3e11a83e7 offset=45 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a721c: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7224 [type=7(external_word) addr=0x00007fd3e11a83ec offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7226: 640e
relocInfo@0x00007fd3e11a7226 [type=6(runtime_call) addr=0x00007fd3e11a83fa offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7228: 6419
relocInfo@0x00007fd3e11a7228 [type=6(runtime_call) addr=0x00007fd3e11a8413 offset=25 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a722a: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7232 [type=7(external_word) addr=0x00007fd3e11a8418 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7234: 640e
relocInfo@0x00007fd3e11a7234 [type=6(runtime_call) addr=0x00007fd3e11a8426 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7236: 6421
relocInfo@0x00007fd3e11a7236 [type=6(runtime_call) addr=0x00007fd3e11a8447 offset=33 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7238: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7240 [type=7(external_word) addr=0x00007fd3e11a844c offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7242: 640e
relocInfo@0x00007fd3e11a7242 [type=6(runtime_call) addr=0x00007fd3e11a845a offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7244: 6411
relocInfo@0x00007fd3e11a7244 [type=6(runtime_call) addr=0x00007fd3e11a846b offset=17 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7246: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a724e [type=7(external_word) addr=0x00007fd3e11a8470 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7250: 640e
relocInfo@0x00007fd3e11a7250 [type=6(runtime_call) addr=0x00007fd3e11a847e offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7252: 645d
relocInfo@0x00007fd3e11a7252 [type=6(runtime_call) addr=0x00007fd3e11a84db offset=93 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7254: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a725c [type=7(external_word) addr=0x00007fd3e11a84e0 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a725e: 640e
relocInfo@0x00007fd3e11a725e [type=6(runtime_call) addr=0x00007fd3e11a84ee offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7260: 6431
relocInfo@0x00007fd3e11a7260 [type=6(runtime_call) addr=0x00007fd3e11a851f offset=49 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7262: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a726a [type=7(external_word) addr=0x00007fd3e11a8524 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a726c: 640e
relocInfo@0x00007fd3e11a726c [type=6(runtime_call) addr=0x00007fd3e11a8532 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a726e: 6419
relocInfo@0x00007fd3e11a726e [type=6(runtime_call) addr=0x00007fd3e11a854b offset=25 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7270: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7278 [type=7(external_word) addr=0x00007fd3e11a8550 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a727a: 640e
relocInfo@0x00007fd3e11a727a [type=6(runtime_call) addr=0x00007fd3e11a855e offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a727c: 6445
relocInfo@0x00007fd3e11a727c [type=6(runtime_call) addr=0x00007fd3e11a85a3 offset=69 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a727e: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7286 [type=7(external_word) addr=0x00007fd3e11a85a8 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7288: 640e
relocInfo@0x00007fd3e11a7288 [type=6(runtime_call) addr=0x00007fd3e11a85b6 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a728a: 641d
relocInfo@0x00007fd3e11a728a [type=6(runtime_call) addr=0x00007fd3e11a85d3 offset=29 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a728c: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7294 [type=7(external_word) addr=0x00007fd3e11a85d8 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7296: 640e
relocInfo@0x00007fd3e11a7296 [type=6(runtime_call) addr=0x00007fd3e11a85e6 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7298: 6415
relocInfo@0x00007fd3e11a7298 [type=6(runtime_call) addr=0x00007fd3e11a85fb offset=21 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a729a: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a72a2 [type=7(external_word) addr=0x00007fd3e11a8600 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a72a4: 640e
relocInfo@0x00007fd3e11a72a4 [type=6(runtime_call) addr=0x00007fd3e11a860e offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a72a6: f803ed2fd0787fd37006
relocInfo@0x00007fd3e11a72ae [type=7(external_word) addr=0x00007fd3e11a8614 offset=6 data={ed2fd0787fd3}] | [target=0x00007fd3ed2fd078]
         @0x00007fd3e11a72b0: 640e
relocInfo@0x00007fd3e11a72b0 [type=6(runtime_call) addr=0x00007fd3e11a8622 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a72b2: f803ed2fd0787fd37006
relocInfo@0x00007fd3e11a72ba [type=7(external_word) addr=0x00007fd3e11a8628 offset=6 data={ed2fd0787fd3}] | [target=0x00007fd3ed2fd078]
         @0x00007fd3e11a72bc: 640e
relocInfo@0x00007fd3e11a72bc [type=6(runtime_call) addr=0x00007fd3e11a8636 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a72be: 6431
relocInfo@0x00007fd3e11a72be [type=6(runtime_call) addr=0x00007fd3e11a8667 offset=49 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a72c0: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a72c8 [type=7(external_word) addr=0x00007fd3e11a866c offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a72ca: 640e
relocInfo@0x00007fd3e11a72ca [type=6(runtime_call) addr=0x00007fd3e11a867a offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a72cc: 642d
relocInfo@0x00007fd3e11a72cc [type=6(runtime_call) addr=0x00007fd3e11a86a7 offset=45 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a72ce: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a72d6 [type=7(external_word) addr=0x00007fd3e11a86ac offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a72d8: 640e
relocInfo@0x00007fd3e11a72d8 [type=6(runtime_call) addr=0x00007fd3e11a86ba offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a72da: 6461
relocInfo@0x00007fd3e11a72da [type=6(runtime_call) addr=0x00007fd3e11a871b offset=97 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a72dc: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a72e4 [type=7(external_word) addr=0x00007fd3e11a8720 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a72e6: 640e
relocInfo@0x00007fd3e11a72e6 [type=6(runtime_call) addr=0x00007fd3e11a872e offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a72e8: 643d
relocInfo@0x00007fd3e11a72e8 [type=6(runtime_call) addr=0x00007fd3e11a876b offset=61 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a72ea: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a72f2 [type=7(external_word) addr=0x00007fd3e11a8770 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a72f4: 640e
relocInfo@0x00007fd3e11a72f4 [type=6(runtime_call) addr=0x00007fd3e11a877e offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a72f6: 6449
relocInfo@0x00007fd3e11a72f6 [type=6(runtime_call) addr=0x00007fd3e11a87c7 offset=73 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a72f8: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7300 [type=7(external_word) addr=0x00007fd3e11a87cc offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7302: 640e
relocInfo@0x00007fd3e11a7302 [type=6(runtime_call) addr=0x00007fd3e11a87da offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7304: 6451
relocInfo@0x00007fd3e11a7304 [type=6(runtime_call) addr=0x00007fd3e11a882b offset=81 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7306: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a730e [type=7(external_word) addr=0x00007fd3e11a8830 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7310: 640e
relocInfo@0x00007fd3e11a7310 [type=6(runtime_call) addr=0x00007fd3e11a883e offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7312: 645d
relocInfo@0x00007fd3e11a7312 [type=6(runtime_call) addr=0x00007fd3e11a889b offset=93 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7314: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a731c [type=7(external_word) addr=0x00007fd3e11a88a0 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a731e: 640e
relocInfo@0x00007fd3e11a731e [type=6(runtime_call) addr=0x00007fd3e11a88ae offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7320: 645d
relocInfo@0x00007fd3e11a7320 [type=6(runtime_call) addr=0x00007fd3e11a890b offset=93 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7322: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a732a [type=7(external_word) addr=0x00007fd3e11a8910 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a732c: 640e
relocInfo@0x00007fd3e11a732c [type=6(runtime_call) addr=0x00007fd3e11a891e offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a732e: 642d
relocInfo@0x00007fd3e11a732e [type=6(runtime_call) addr=0x00007fd3e11a894b offset=45 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7330: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7338 [type=7(external_word) addr=0x00007fd3e11a8950 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a733a: 640e
relocInfo@0x00007fd3e11a733a [type=6(runtime_call) addr=0x00007fd3e11a895e offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a733c: 6431
relocInfo@0x00007fd3e11a733c [type=6(runtime_call) addr=0x00007fd3e11a898f offset=49 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a733e: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7346 [type=7(external_word) addr=0x00007fd3e11a8994 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7348: 640e
relocInfo@0x00007fd3e11a7348 [type=6(runtime_call) addr=0x00007fd3e11a89a2 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a734a: 6439
relocInfo@0x00007fd3e11a734a [type=6(runtime_call) addr=0x00007fd3e11a89db offset=57 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a734c: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7354 [type=7(external_word) addr=0x00007fd3e11a89e0 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7356: 640e
relocInfo@0x00007fd3e11a7356 [type=6(runtime_call) addr=0x00007fd3e11a89ee offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7358: 6439
relocInfo@0x00007fd3e11a7358 [type=6(runtime_call) addr=0x00007fd3e11a8a27 offset=57 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a735a: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7362 [type=7(external_word) addr=0x00007fd3e11a8a2c offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7364: 640e
relocInfo@0x00007fd3e11a7364 [type=6(runtime_call) addr=0x00007fd3e11a8a3a offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7366: 6439
relocInfo@0x00007fd3e11a7366 [type=6(runtime_call) addr=0x00007fd3e11a8a73 offset=57 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7368: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7370 [type=7(external_word) addr=0x00007fd3e11a8a78 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7372: 640e
relocInfo@0x00007fd3e11a7372 [type=6(runtime_call) addr=0x00007fd3e11a8a86 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7374: 6425
relocInfo@0x00007fd3e11a7374 [type=6(runtime_call) addr=0x00007fd3e11a8aab offset=37 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7376: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a737e [type=7(external_word) addr=0x00007fd3e11a8ab0 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7380: 640e
relocInfo@0x00007fd3e11a7380 [type=6(runtime_call) addr=0x00007fd3e11a8abe offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7382: 6411
relocInfo@0x00007fd3e11a7382 [type=6(runtime_call) addr=0x00007fd3e11a8acf offset=17 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7384: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a738c [type=7(external_word) addr=0x00007fd3e11a8ad4 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a738e: 640e
relocInfo@0x00007fd3e11a738e [type=6(runtime_call) addr=0x00007fd3e11a8ae2 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7390: 641d
relocInfo@0x00007fd3e11a7390 [type=6(runtime_call) addr=0x00007fd3e11a8aff offset=29 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7392: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a739a [type=7(external_word) addr=0x00007fd3e11a8b04 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a739c: 640e
relocInfo@0x00007fd3e11a739c [type=6(runtime_call) addr=0x00007fd3e11a8b12 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a739e: f803ed2fd0787fd37006
relocInfo@0x00007fd3e11a73a6 [type=7(external_word) addr=0x00007fd3e11a8b18 offset=6 data={ed2fd0787fd3}] | [target=0x00007fd3ed2fd078]
         @0x00007fd3e11a73a8: 640e
relocInfo@0x00007fd3e11a73a8 [type=6(runtime_call) addr=0x00007fd3e11a8b26 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a73aa: f803ed2fd9687fd37006
relocInfo@0x00007fd3e11a73b2 [type=7(external_word) addr=0x00007fd3e11a8b2c offset=6 data={ed2fd9687fd3}] | [target=0x00007fd3ed2fd968]
         @0x00007fd3e11a73b4: 640e
relocInfo@0x00007fd3e11a73b4 [type=6(runtime_call) addr=0x00007fd3e11a8b3a offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a73b6: f803ed2fd9687fd37006
relocInfo@0x00007fd3e11a73be [type=7(external_word) addr=0x00007fd3e11a8b40 offset=6 data={ed2fd9687fd3}] | [target=0x00007fd3ed2fd968]
         @0x00007fd3e11a73c0: 640e
relocInfo@0x00007fd3e11a73c0 [type=6(runtime_call) addr=0x00007fd3e11a8b4e offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a73c2: f803ed2fd0787fd37006
relocInfo@0x00007fd3e11a73ca [type=7(external_word) addr=0x00007fd3e11a8b54 offset=6 data={ed2fd0787fd3}] | [target=0x00007fd3ed2fd078]
         @0x00007fd3e11a73cc: 640e
relocInfo@0x00007fd3e11a73cc [type=6(runtime_call) addr=0x00007fd3e11a8b62 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a73ce: f803ed2fd0787fd37006
relocInfo@0x00007fd3e11a73d6 [type=7(external_word) addr=0x00007fd3e11a8b68 offset=6 data={ed2fd0787fd3}] | [target=0x00007fd3ed2fd078]
         @0x00007fd3e11a73d8: 640e
relocInfo@0x00007fd3e11a73d8 [type=6(runtime_call) addr=0x00007fd3e11a8b76 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a73da: f803ed2fd0787fd37006
relocInfo@0x00007fd3e11a73e2 [type=7(external_word) addr=0x00007fd3e11a8b7c offset=6 data={ed2fd0787fd3}] | [target=0x00007fd3ed2fd078]
         @0x00007fd3e11a73e4: 640e
relocInfo@0x00007fd3e11a73e4 [type=6(runtime_call) addr=0x00007fd3e11a8b8a offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a73e6: f803ed2fd0787fd37006
relocInfo@0x00007fd3e11a73ee [type=7(external_word) addr=0x00007fd3e11a8b90 offset=6 data={ed2fd0787fd3}] | [target=0x00007fd3ed2fd078]
         @0x00007fd3e11a73f0: 640e
relocInfo@0x00007fd3e11a73f0 [type=6(runtime_call) addr=0x00007fd3e11a8b9e offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a73f2: 6429
relocInfo@0x00007fd3e11a73f2 [type=6(runtime_call) addr=0x00007fd3e11a8bc7 offset=41 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a73f4: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a73fc [type=7(external_word) addr=0x00007fd3e11a8bcc offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a73fe: 640e
relocInfo@0x00007fd3e11a73fe [type=6(runtime_call) addr=0x00007fd3e11a8bda offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7400: 6445
relocInfo@0x00007fd3e11a7400 [type=6(runtime_call) addr=0x00007fd3e11a8c1f offset=69 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7402: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a740a [type=7(external_word) addr=0x00007fd3e11a8c24 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a740c: 640e
relocInfo@0x00007fd3e11a740c [type=6(runtime_call) addr=0x00007fd3e11a8c32 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a740e: 6431
relocInfo@0x00007fd3e11a740e [type=6(runtime_call) addr=0x00007fd3e11a8c63 offset=49 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7410: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7418 [type=7(external_word) addr=0x00007fd3e11a8c68 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a741a: 640e
relocInfo@0x00007fd3e11a741a [type=6(runtime_call) addr=0x00007fd3e11a8c76 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a741c: 6469
relocInfo@0x00007fd3e11a741c [type=6(runtime_call) addr=0x00007fd3e11a8cdf offset=105 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a741e: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7426 [type=7(external_word) addr=0x00007fd3e11a8ce4 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7428: 640e
relocInfo@0x00007fd3e11a7428 [type=6(runtime_call) addr=0x00007fd3e11a8cf2 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a742a: 6429
relocInfo@0x00007fd3e11a742a [type=6(runtime_call) addr=0x00007fd3e11a8d1b offset=41 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a742c: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7434 [type=7(external_word) addr=0x00007fd3e11a8d20 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7436: 640e
relocInfo@0x00007fd3e11a7436 [type=6(runtime_call) addr=0x00007fd3e11a8d2e offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7438: 6415
relocInfo@0x00007fd3e11a7438 [type=6(runtime_call) addr=0x00007fd3e11a8d43 offset=21 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a743a: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7442 [type=7(external_word) addr=0x00007fd3e11a8d48 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7444: 640e
relocInfo@0x00007fd3e11a7444 [type=6(runtime_call) addr=0x00007fd3e11a8d56 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7446: 6419
relocInfo@0x00007fd3e11a7446 [type=6(runtime_call) addr=0x00007fd3e11a8d6f offset=25 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7448: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7450 [type=7(external_word) addr=0x00007fd3e11a8d74 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7452: 640e
relocInfo@0x00007fd3e11a7452 [type=6(runtime_call) addr=0x00007fd3e11a8d82 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7454: 6411
relocInfo@0x00007fd3e11a7454 [type=6(runtime_call) addr=0x00007fd3e11a8d93 offset=17 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7456: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a745e [type=7(external_word) addr=0x00007fd3e11a8d98 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7460: 640e
relocInfo@0x00007fd3e11a7460 [type=6(runtime_call) addr=0x00007fd3e11a8da6 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7462: 6411
relocInfo@0x00007fd3e11a7462 [type=6(runtime_call) addr=0x00007fd3e11a8db7 offset=17 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7464: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a746c [type=7(external_word) addr=0x00007fd3e11a8dbc offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a746e: 640e
relocInfo@0x00007fd3e11a746e [type=6(runtime_call) addr=0x00007fd3e11a8dca offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a7470: 6415
relocInfo@0x00007fd3e11a7470 [type=6(runtime_call) addr=0x00007fd3e11a8ddf offset=21 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7472: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a747a [type=7(external_word) addr=0x00007fd3e11a8de4 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a747c: 640e
relocInfo@0x00007fd3e11a747c [type=6(runtime_call) addr=0x00007fd3e11a8df2 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a747e: 6439
relocInfo@0x00007fd3e11a747e [type=6(runtime_call) addr=0x00007fd3e11a8e2b offset=57 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a7480: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7488 [type=7(external_word) addr=0x00007fd3e11a8e30 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a748a: 640e
relocInfo@0x00007fd3e11a748a [type=6(runtime_call) addr=0x00007fd3e11a8e3e offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a748c: 6411
relocInfo@0x00007fd3e11a748c [type=6(runtime_call) addr=0x00007fd3e11a8e4f offset=17 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a748e: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a7496 [type=7(external_word) addr=0x00007fd3e11a8e54 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a7498: 640e
relocInfo@0x00007fd3e11a7498 [type=6(runtime_call) addr=0x00007fd3e11a8e62 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a749a: 641d
relocInfo@0x00007fd3e11a749a [type=6(runtime_call) addr=0x00007fd3e11a8e7f offset=29 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a749c: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a74a4 [type=7(external_word) addr=0x00007fd3e11a8e84 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a74a6: 640e
relocInfo@0x00007fd3e11a74a6 [type=6(runtime_call) addr=0x00007fd3e11a8e92 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a74a8: 6411
relocInfo@0x00007fd3e11a74a8 [type=6(runtime_call) addr=0x00007fd3e11a8ea3 offset=17 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a74aa: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a74b2 [type=7(external_word) addr=0x00007fd3e11a8ea8 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a74b4: 640e
relocInfo@0x00007fd3e11a74b4 [type=6(runtime_call) addr=0x00007fd3e11a8eb6 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a74b6: 6411
relocInfo@0x00007fd3e11a74b6 [type=6(runtime_call) addr=0x00007fd3e11a8ec7 offset=17 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a74b8: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a74c0 [type=7(external_word) addr=0x00007fd3e11a8ecc offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a74c2: 640e
relocInfo@0x00007fd3e11a74c2 [type=6(runtime_call) addr=0x00007fd3e11a8eda offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a74c4: 6411
relocInfo@0x00007fd3e11a74c4 [type=6(runtime_call) addr=0x00007fd3e11a8eeb offset=17 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a74c6: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a74ce [type=7(external_word) addr=0x00007fd3e11a8ef0 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a74d0: 640e
relocInfo@0x00007fd3e11a74d0 [type=6(runtime_call) addr=0x00007fd3e11a8efe offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a74d2: 6411
relocInfo@0x00007fd3e11a74d2 [type=6(runtime_call) addr=0x00007fd3e11a8f0f offset=17 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a74d4: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a74dc [type=7(external_word) addr=0x00007fd3e11a8f14 offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a74de: 640e
relocInfo@0x00007fd3e11a74de [type=6(runtime_call) addr=0x00007fd3e11a8f22 offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a74e0: 6415
relocInfo@0x00007fd3e11a74e0 [type=6(runtime_call) addr=0x00007fd3e11a8f37 offset=21 format=1] | [destination=0x00007fd3e1116540]
         @0x00007fd3e11a74e2: f803ed1657b87fd37005
relocInfo@0x00007fd3e11a74ea [type=7(external_word) addr=0x00007fd3e11a8f3c offset=5 data={ed1657b87fd3}] | [target=0x00007fd3ed1657b8]
         @0x00007fd3e11a74ec: 640e
relocInfo@0x00007fd3e11a74ec [type=6(runtime_call) addr=0x00007fd3e11a8f4a offset=14 format=1] | [destination=0x00007fd3ec92aff4]
         @0x00007fd3e11a74ee: 6442
relocInfo@0x00007fd3e11a74ee [type=6(runtime_call) addr=0x00007fd3e11a8f8c offset=66 format=1] | [destination=0x00007fd3e10549a0]
         @0x00007fd3e11a74f0: f80111588005
relocInfo@0x00007fd3e11a74f4 [type=8(internal_word) addr=0x00007fd3e11a8f91 offset=5 data=4440] | [target=0x00007fd3e11a7e39]
         @0x00007fd3e11a74f6: 6411
relocInfo@0x00007fd3e11a74f6 [type=6(runtime_call) addr=0x00007fd3e11a8fa2 offset=17 format=1] | [destination=0x00007fd3e1117220]
         @0x00007fd3e11a74f8: 001e
relocInfo@0x00007fd3e11a74f8 [type=0(none) addr=0x00007fd3e11a8fc0 offset=30]
         @0x00007fd3e11a74fa: f801fb515000
relocInfo@0x00007fd3e11a74fe [type=5(static_stub) addr=0x00007fd3e11a8fc0 offset=0 data=-1199] | [static_call=0x00007fd3e11a79cf]
         @0x00007fd3e11a7500: c000
relocInfo@0x00007fd3e11a7500 [type=12(metadata) addr=0x00007fd3e11a8fc0 offset=0] | [metadata_addr=0x00007fd3e11a8fc2 *=0x0000000000000000 offset=0]
         @0x00007fd3e11a7502: 640a
relocInfo@0x00007fd3e11a7502 [type=6(runtime_call) addr=0x00007fd3e11a8fca offset=10 format=1] | [destination=0xffffffffffffffff]
         @0x00007fd3e11a7504: f801f9755005
relocInfo@0x00007fd3e11a7508 [type=5(static_stub) addr=0x00007fd3e11a8fcf offset=5 data=-1675] | [static_call=0x00007fd3e11a7bab]
         @0x00007fd3e11a750a: c000
relocInfo@0x00007fd3e11a750a [type=12(metadata) addr=0x00007fd3e11a8fcf offset=0] | [metadata_addr=0x00007fd3e11a8fd1 *=0x0000000000000000 offset=0]
         @0x00007fd3e11a750c: 640a
relocInfo@0x00007fd3e11a750c [type=6(runtime_call) addr=0x00007fd3e11a8fd9 offset=10 format=1] | [destination=0xffffffffffffffff]
         @0x00007fd3e11a750e: f801f7dd5005
relocInfo@0x00007fd3e11a7512 [type=5(static_stub) addr=0x00007fd3e11a8fde offset=5 data=-2083] | [static_call=0x00007fd3e11a7d43]
         @0x00007fd3e11a7514: c000
relocInfo@0x00007fd3e11a7514 [type=12(metadata) addr=0x00007fd3e11a8fde offset=0] | [metadata_addr=0x00007fd3e11a8fe0 *=0x0000000000000000 offset=0]
         @0x00007fd3e11a7516: 640a
relocInfo@0x00007fd3e11a7516 [type=6(runtime_call) addr=0x00007fd3e11a8fe8 offset=10 format=1] | [destination=0xffffffffffffffff]
         @0x00007fd3e11a7518: 6405
relocInfo@0x00007fd3e11a7518 [type=6(runtime_call) addr=0x00007fd3e11a8fed offset=5 format=1] | [destination=0x00007fd3e105c6a0]
         @0x00007fd3e11a751a: 640f
relocInfo@0x00007fd3e11a751a [type=6(runtime_call) addr=0x00007fd3e11a8ffc offset=15 format=1] | [destination=0x00007fd3e1116860]
         @0x00007fd3e11a751c: 0000
relocInfo@0x00007fd3e11a751c [type=0(none) addr=0x00007fd3e11a8ffc offset=0]
         @0x00007fd3e11a751e: 0000
relocInfo@0x00007fd3e11a751e [type=0(none) addr=0x00007fd3e11a8ffc offset=0]
         @0x00007fd3e11a7520: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.IntVector$IntSpecies
  method  = {method} {0x00007fd398a1d5c0} 'length' '()I' in 'jdk/incubator/vector/AbstractSpecies'
   [nmethod<=klass]jdk.incubator.vector.IntVector$IntSpecies
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fd398aef2a8} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fd398aeee40} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fd398aeef18} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$ImplCache
  method  = {method} {0x00007fd398a118b0} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$ImplCache
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$ComparisonImpl
  method  = {method} {0x00007fd398aeee40} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$ComparisonImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$ComparisonImpl
  method  = {method} {0x00007fd398aeef18} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$ComparisonImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.Int256Vector$Int256Mask
  method  = {method} {0x00007fd398a33148} 'checkIndexByLane' '(IILjdk/incubator/vector/Vector;I)V' in 'jdk/incubator/vector/AbstractMask'
   [nmethod<=klass]jdk.incubator.vector.Int256Vector$Int256Mask
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.Int256Vector$Int256Mask
  method  = {method} {0x00007fd398a320f8} 'vectorSpecies' '()Ljdk/incubator/vector/VectorSpecies;' in 'jdk/incubator/vector/AbstractMask'
   [nmethod<=klass]jdk.incubator.vector.Int256Vector$Int256Mask
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 216 bytes)
catch_pco = 1204 (1 entries)
  bci -1 at scope depth 0 -> pco 6740
catch_pco = 1680 (1 entries)
  bci -1 at scope depth 0 -> pco 6750
catch_pco = 2088 (1 entries)
  bci -1 at scope depth 0 -> pco 6745
catch_pco = 2136 (1 entries)
  bci -1 at scope depth 0 -> pco 6735
catch_pco = 2168 (1 entries)
  bci -1 at scope depth 0 -> pco 6730
catch_pco = 2436 (1 entries)
  bci -1 at scope depth 0 -> pco 6725
catch_pco = 3404 (1 entries)
  bci -1 at scope depth 0 -> pco 6714
catch_pco = 3516 (1 entries)
  bci -1 at scope depth 0 -> pco 6709
catch_pco = 3572 (1 entries)
  bci -1 at scope depth 0 -> pco 6704
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 14 entries, 116 bytes):
{
   < 0x00007fd3e11a7560, 0x00007fd3e11a8d88 > < 0x00007fd3e11a7566, 0x00007fd3e11a8dac > < 0x00007fd3e11a75b5, 0x00007fd3e11a8647 > 
   < 0x00007fd3e11a75cd, 0x00007fd3e11a8642 > < 0x00007fd3e11a75e1, 0x00007fd3e11a864a > < 0x00007fd3e11a79d4, 0x00007fd3e11a8dd0 > 
   < 0x00007fd3e11a7a07, 0x00007fd3e11a8df8 > < 0x00007fd3e11a7a30, 0x00007fd3e11a8e44 > < 0x00007fd3e11a7bc0, 0x00007fd3e11a8e68 > 
   < 0x00007fd3e11a7bd7, 0x00007fd3e11a8e98 > < 0x00007fd3e11a7da0, 0x00007fd3e11a8ebc > < 0x00007fd3e11a7ea4, 0x00007fd3e11a8ee0 > 
   < 0x00007fd3e11a7f80, 0x00007fd3e11a8f04 > < 0x00007fd3e11a7fa0, 0x00007fd3e11a8f28 > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
# 0: 0x0000000000000000 NULL-oop
# 1: 0x000000010188fc10 a 'java/lang/Class'{0x000000010188fc10} = 'jdk/incubator/vector/IntMaxVector'
# 2: 0x0000000101c35c58 a 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'{0x0000000101c35c58}
# 3: 0x0000000101c29e60 a 'java/lang/invoke/DirectMethodHandle$Constructor'{0x0000000101c29e60}
# 4: 0x000000010188b460 a 'java/lang/Class'{0x000000010188b460} = 'jdk/incubator/vector/Int256Vector'
# 5: 0x000000010188b500 a 'java/lang/Class'{0x000000010188b500} = 'jdk/incubator/vector/Int256Vector$Int256Mask'
# 6: 0x000000010110df10 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110df10}
# 7: 0x0000000101127628 a 'java/lang/Class'{0x0000000101127628} = 'java/lang/invoke/LambdaForm$MH+0x0000000800005800'
# 8: 0x0000000101bf3650 a 'java/lang/Class'{0x0000000101bf3650} = 'java/lang/invoke/LambdaForm$MH+0x00000008000d5000'
# 9: 0x0000000101bec7c8 a 'java/lang/Class'{0x0000000101bec7c8} = 'java/lang/invoke/LambdaForm$DMH+0x00000008000d4800'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
# 0: 0x0000000000000000 NULL-oop
# 1: 0x00007fd398811948 {method} {0x00007fd398811948} 'micro_vector_masked' '([I[I[I)V' in 'App'
# 2: 0x00007fd398812e38 {method} {0x00007fd398812e38} 'intoArray' '([IILjdk/incubator/vector/VectorMask;)V' in 'jdk/incubator/vector/IntVector'
# 3: 0x00007fd39881d998 {method} {0x00007fd39881d998} 'stOp' '(Ljava/lang/Object;ILjdk/incubator/vector/VectorMask;Ljdk/incubator/vector/IntVector$FStOp;)V' in 'jdk/incubator/vector/IntVector'
# 4: 0x00007fd398a4a240 {method} {0x00007fd398a4a240} 'vec' '()[I' in 'jdk/incubator/vector/Int256Vector'
# 5: 0x00007fd39853f890 {method} {0x00007fd39853f890} 'getPayload' '()Ljava/lang/Object;' in 'jdk/internal/vm/vector/VectorSupport$VectorPayload'
# 6: 0x00007fd398812728 {method} {0x00007fd398812728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
# 7: 0x00007fd398a184c0 {method} {0x00007fd398a184c0} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
# 8: 0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
# 9: 0x00007fd398a84090 {method} {0x00007fd398a84090} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
#10: 0x00007fd398a4d300 {method} {0x00007fd398a4d300} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
#11: 0x00007fd398813798 {method} {0x00007fd398813798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#12: 0x0000000800098110 'jdk/incubator/vector/Int256Vector'
#13: 0x00007fd398560ca0 {method} {0x00007fd398560ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
#14: 0x00007fd39881f8d8 {method} {0x00007fd39881f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#15: 0x00007fd398a4e770 {method} {0x00007fd398a4e770} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
#16: 0x00007fd398a4b6d0 {method} {0x00007fd398a4b6d0} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
#17: 0x00007fd39881e8d8 {method} {0x00007fd39881e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#18: 0x00007fd39881c2c8 {method} {0x00007fd39881c2c8} 'opCode' '(Ljdk/incubator/vector/VectorOperators$Operator;)I' in 'jdk/incubator/vector/IntVector'
#19: 0x00007fd398a146b8 {method} {0x00007fd398a146b8} 'opCode' '(Ljdk/incubator/vector/VectorOperators$Operator;II)I' in 'jdk/incubator/vector/VectorOperators'
#20: 0x00007fd398aeee40 {method} {0x00007fd398aeee40} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#21: 0x00007fd398a0a230 {method} {0x00007fd398a0a230} 'check' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractVector'
#22: 0x0000000800040000 {type array bool}
#23: 0x00007fd398812d08 {method} {0x00007fd398812d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
#24: 0x00007fd39880aa78 {method} {0x00007fd39880aa78} 'linkToTargetMethod' '(Ljava/lang/Object;)Ljava/lang/Object;' in 'java/lang/invoke/LambdaForm$MH+0x0000000800005800'
#25: 0x00007fd398a34820 {method} {0x00007fd398a34820} 'fromLong' '(Ljdk/incubator/vector/VectorSpecies;J)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
#26: 0x00007fd398a34518 {method} {0x00007fd398a34518} 'fromValues' '(Ljdk/incubator/vector/VectorSpecies;[Z)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
#27: 0x00007fd398a34658 {method} {0x00007fd398a34658} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[ZI)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
#28: 0x00007fd398a1e098 {method} {0x00007fd398a1e098} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
#29: 0x0000000800098750 'jdk/incubator/vector/Int256Vector$Int256Mask'
#30: 0x00007fd398a00408 {method} {0x00007fd398a00408} 'arrayAddress' '([II)J' in 'jdk/incubator/vector/IntVector'
#31: 0x00000008000acb58 'jdk/incubator/vector/IntVector$$Lambda$63+0x00000008000acb58'
#32: 0x00007fd398a49c80 {method} {0x00007fd398a49c80} 'vspecies' '()Ljdk/incubator/vector/IntVector$IntSpecies;' in 'jdk/incubator/vector/Int256Vector'
#33: 0x00007fd398812880 {method} {0x00007fd398812880} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[IILjdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#34: 0x00007fd398a1eb98 {method} {0x00007fd398a1eb98} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
#35: 0x00007fd39881faa8 {method} {0x00007fd39881faa8} 'add' '(Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#36: 0x00007fd39881ea38 {method} {0x00007fd39881ea38} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#37: 0x00007fd398aeef18 {method} {0x00007fd398aeef18} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#38: 0x00007fd398a84398 {method} {0x00007fd398a84398} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
#39: 0x0000000800040c30 {type array int}
#40: 0x00007fd39881c490 {method} {0x00007fd39881c490} 'opKind' '(Ljdk/incubator/vector/VectorOperators$Operator;I)Z' in 'jdk/incubator/vector/IntVector'
#41: 0x00007fd398a14798 {method} {0x00007fd398a14798} 'opKind' '(Ljdk/incubator/vector/VectorOperators$Operator;I)Z' in 'jdk/incubator/vector/VectorOperators'
#42: 0x00007fd398a83e80 {method} {0x00007fd398a83e80} 'requireLength' '(II)V' in 'jdk/incubator/vector/VectorIntrinsics'
#43: 0x00007fd398a000f8 {method} {0x00007fd398a000f8} 'checkMaskFromIndexSize' '(ILjdk/incubator/vector/IntVector$IntSpecies;Ljdk/incubator/vector/VectorMask;II)V' in 'jdk/incubator/vector/IntVector'
#44: 0x00007fd398a33148 {method} {0x00007fd398a33148} 'checkIndexByLane' '(IILjdk/incubator/vector/Vector;I)V' in 'jdk/incubator/vector/AbstractMask'
#45: 0x00007fd398a332d8 {method} {0x00007fd398a332d8} 'checkIndex0' '(IILjdk/incubator/vector/Vector;I)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/AbstractMask'
#46: 0x00007fd398a4f8c8 {method} {0x00007fd398a4f8c8} 'broadcast' '(J)Ljdk/incubator/vector/Vector;' in 'jdk/incubator/vector/Int256Vector'
#47: 0x00007fd398a4a400 {method} {0x00007fd398a4a400} 'broadcast' '(J)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
#48: 0x00007fd39881e4c0 {method} {0x00007fd39881e4c0} 'broadcastTemplate' '(J)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#49: 0x00007fd398a17f88 {method} {0x00007fd398a17f88} 'broadcast' '(J)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
#50: 0x00007fd398b25e80 {method} {0x00007fd398b25e80} 'linkToTargetMethod' '(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;' in 'java/lang/invoke/LambdaForm$MH+0x00000008000d5000'
#51: 0x00007fd398b24f00 {method} {0x00007fd398b24f00} 'newInvokeSpecial' '(Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;' in 'java/lang/invoke/LambdaForm$DMH+0x00000008000d4800'
#52: 0x00007fd3984820b0 {method} {0x00007fd3984820b0} 'allocateInstance' '(Ljava/lang/Object;)Ljava/lang/Object;' in 'java/lang/invoke/DirectMethodHandle'
#53: 0x00007fd398a17dc0 {method} {0x00007fd398a17dc0} 'broadcastBits' '(J)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
#54: 0x00007fd398a18ea8 {method} {0x00007fd398a18ea8} 'iota' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
#55: 0x00007fd398baad20 {method} {0x00007fd398baad20} 'apply' '(Ljava/lang/Object;III)V' in 'jdk/incubator/vector/IntVector$$Lambda$67+0x00000008000ad640'
#56: 0x00007fd398a04120 {method} {0x00007fd398a04120} 'lambda$intoArray$82' '([IIII)V' in 'jdk/incubator/vector/IntVector'
#57: 0x00007fd398a522f0 {method} {0x00007fd398a522f0} 'getBits' '()[Z' in 'jdk/incubator/vector/Int256Vector$Int256Mask'
#58: 0x00007fd398a1d690 {method} {0x00007fd398a1d690} 'laneCount' '()I' in 'jdk/incubator/vector/AbstractSpecies'
#59: 0x00007fd398a18088 {method} {0x00007fd398a18088} 'longToElementBits' '(J)J' in 'jdk/incubator/vector/IntVector$IntSpecies'
#60: 0x00007fd39881ddf0 {method} {0x00007fd39881ddf0} 'toBits' '(I)J' in 'jdk/incubator/vector/IntVector'
#61: 0x00007fd398a17a40 {method} {0x00007fd398a17a40} 'elementType' '()Ljava/lang/Class;' in 'jdk/incubator/vector/IntVector$IntSpecies'
#62: 0x00007fd398a1d5c0 {method} {0x00007fd398a1d5c0} 'length' '()I' in 'jdk/incubator/vector/AbstractSpecies'
#63: 0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
#64: 0x00007fd398aef2a8 {method} {0x00007fd398aef2a8} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#65: 0x00007fd398a118b0 {method} {0x00007fd398a118b0} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
#66: 0x00000008000a37e8 'jdk/incubator/vector/VectorOperators$ComparisonImpl'
#67: 0x00007fd398a320f8 {method} {0x00007fd398a320f8} 'vectorSpecies' '()Ljdk/incubator/vector/VectorSpecies;' in 'jdk/incubator/vector/AbstractMask'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VECTOR_MASKED : [Time] 140 ms   [Res] 93000000
------------------------------------------------------------------------
App::micro_vector_masked([I[I[I)V
  interpreter_invocation_count:    10420 
  invocation_counter:               5000 
  backedge_counter:                 5003 
  mdo size: 1040 bytes

0 iconst_0
1 istore #4
3 aconst_null
4 astore #5
6 aconst_null
7 astore #6
9 fast_iload #4
11 fast_aaccess_0
12 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
15 aload_1
16 arraylength
17 invokeinterface 18 <jdk/incubator/vector/VectorSpecies.loopBound(I)I> 
  0   bci: 17   VirtualCallData     count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/IntVector$IntSpecies'(38381 1.00)
22 if_icmpge 79
  56  bci: 22   BranchData          taken(9596) displacement(256)
                                    not taken(28785)
25 fast_aaccess_0
26 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
29 aload_2
30 fast_iload #4
32 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  88  bci: 32   CounterData         count(28785)
35 astore #5
37 fast_aaccess_0
38 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
41 aload_3
42 fast_iload #4
44 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  104 bci: 44   CounterData         count(28785)
47 astore #6
49 aload #5
51 aload #6
53 invokevirtual 28 <jdk/incubator/vector/IntVector.add(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;> 
  120 bci: 53   VirtualCallData     count(28785) nonprofiled_count(0) entries(0)
56 aload_1
57 fast_iload #4
59 invokevirtual 32 <jdk/incubator/vector/IntVector.intoArray([II)V> 
  176 bci: 59   VirtualCallData     count(28785) nonprofiled_count(0) entries(0)
62 fast_iload #4
64 fast_aaccess_0
65 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
68 invokeinterface 36 <jdk/incubator/vector/VectorSpecies.length()I> 
  232 bci: 68   VirtualCallData     count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/IntVector$IntSpecies'(28785 1.00)
73 iadd
74 istore #4
76 goto 9
  288 bci: 76   JumpData            taken(28785) displacement(-288)
79 fast_aaccess_0
80 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
83 lconst_1
84 aload_1
85 arraylength
86 fast_aaccess_0
87 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
90 invokeinterface 36 <jdk/incubator/vector/VectorSpecies.length()I> 
  312 bci: 90   VirtualCallData     count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/IntVector$IntSpecies'(9596 1.00)
95 iconst_1
96 isub
97 iand
98 lshl
99 lconst_1
100 lsub
101 invokestatic 40 <jdk/incubator/vector/VectorMask.fromLong(Ljdk/incubator/vector/VectorSpecies;J)Ljdk/incubator/vector/VectorMask;> 
  368 bci: 101  CounterData         count(9596)
104 astore #7
106 fast_aaccess_0
107 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
110 aload_2
111 fast_iload #4
113 aload #7
115 invokestatic 46 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[IILjdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;> 
  384 bci: 115  CounterData         count(9596)
118 astore #5
120 fast_aaccess_0
121 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
124 aload_3
125 fast_iload #4
127 aload #7
129 invokestatic 46 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[IILjdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;> 
  400 bci: 129  CounterData         count(9596)
132 astore #6
134 aload #5
136 aload #6
138 aload #7
140 invokevirtual 49 <jdk/incubator/vector/IntVector.add(Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;> 
  416 bci: 140  VirtualCallData     count(9596) nonprofiled_count(0) entries(0)
143 aload_1
144 fast_iload #4
146 aload #7
148 invokevirtual 52 <jdk/incubator/vector/IntVector.intoArray([IILjdk/incubator/vector/VectorMask;)V> 
  472 bci: 148  VirtualCallData     count(9596) nonprofiled_count(0) entries(0)
151 return
------------------------------------------------------------------------
Total MDO size: 1040 bytes
