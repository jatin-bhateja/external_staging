CompileCommand: print App.micro_vector bool print = true
SCALAR : [Time] 428 ms   [Res] 99999000000000

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 227 ------------------------
{method}
 - this oop:          0x00007fa2d0811818
 - method holder:     'App'
 - constants:         0x00007fa2d0811090 constant pool [134]/operands[15] {0x00007fa2d0811090} for 'App' cache=0x00007fa2d0b00000
 - access:            0xc1000001  public 
 - name:              'micro_vector'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        7
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007fa32900e220
 - adapters:          AHE@0x00007fa32c3c5270: 0xbbbb0000 i2c: 0x00007fa32907ffe0 c2i: 0x00007fa3290800cc c2iUV: 0x00007fa329080096 c2iNCI: 0x00007fa329080109
 - compiled entry     0x00007fa3290800cc
 - code size:         106
 - code start:        0x00007fa2d0811798
 - code end (excl):   0x00007fa2d0811802
 - method data:       0x00007fa2d0b00bb8
 - checked ex length: 0
 - linenumber start:  0x00007fa2d0811802
 - localvar length:   0

------------------------ OptoAssembly for Compile_id = 227 -----------------------
#
#  void ( App:NotNull *, int[int:>=0]:exact *, int[int:>=0]:exact *, int[int:>=0]:exact * )
#
#r018 rsi:rsi   : parm 0: App:NotNull *
#r016 rdx:rdx   : parm 1: int[int:>=0]:exact *
#r010 rcx:rcx   : parm 2: int[int:>=0]:exact *
#r004 r8:r8   : parm 3: int[int:>=0]:exact *
# -- Old rsp -- Framesize: 192 --
#r583 rsp+188: in_preserve
#r582 rsp+184: return address
#r581 rsp+180: in_preserve
#r580 rsp+176: saved fp register
#r579 rsp+172: pad2, stack alignment
#r578 rsp+168: pad2, stack alignment
#r577 rsp+164: Fixed slot 1
#r576 rsp+160: Fixed slot 0
#r623 rsp+156: spill
#r622 rsp+152: spill
#r621 rsp+148: spill
#r620 rsp+144: spill
#r619 rsp+140: spill
#r618 rsp+136: spill
#r617 rsp+132: spill
#r616 rsp+128: spill
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
#r589 rsp+20: spill
#r588 rsp+16: spill
#r587 rsp+12: spill
#r586 rsp+ 8: spill
#r585 rsp+ 4: spill
#r584 rsp+ 0: spill
#
000     N317: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
000     movl    rscratch1, [j_rarg0 + oopDesc::klass_offset_in_bytes()]	# compressed klass
	decode_klass_not_null rscratch1, rscratch1
	cmpq    rax, rscratch1	 # Inline cache check
	jne     SharedRuntime::_ic_miss_stub
	nop	# nops to align entry point

        nop 	# 4 bytes pad for loops and calls

020     B1: #	out( B27 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
020     # stack bang (512 bytes)
	pushq   rbp	# Save rbp
	subq    rsp, #176	# Create frame

02f     movdq   XMM0, RSI	# spill
034     movl    R14, [RDX + #12 (8-bit)]	# range
038     NullCheck RDX

038     B2: #	out( B28 B3 ) <- in( B1 )  Freq: 0.999999
038     movl    RBP, [RSI + #12 (8-bit)]	# compressed ptr ! Field: App.SPECIES
        nop 	# 5 bytes pad for loops and calls
040     movl    R11, [R12 + RBP << 3 + #8] (compressed oop addressing)	# compressed klass ptr
045     NullCheck RBP

045     B3: #	out( B23 B4 ) <- in( B2 )  Freq: 0.999998
045     cmpl    R11, narrowklass: precise klass jdk/incubator/vector/IntVector$IntSpecies: 0x00007fa2a41daca0:Constant:exact *	# compressed klass ptr
04c     jne,u   B23  P=0.000001 C=-1.000000

052     B4: #	out( B25 B5 ) <- in( B3 )  Freq: 0.999997
052     decode_heap_oop_not_null R13,RBP
056     # checkcastPP of R13
056     movl    RAX, [R13 + #12 (8-bit)]	# int ! Field: jdk/incubator/vector/AbstractSpecies.laneCount (constant)
05a     movl    R10, RAX	# spill
05d     decl    R10	# int
060     movl    RBP, RAX	# spill
062     andl    RBP, R10	# int
065     testl   RBP, RBP
067     jne     B25  P=0.000000 C=15019.000000

06d     B5: #	out( B18 B6 ) <- in( B4 )  Freq: 0.999996
06d     andnl  R10, R10, R14
072     xorl    RBX, RBX	# int
074     testl   R10, R10
077     jle     B18  P=0.000162 C=247088.000000

07d     B6: #	out( B24 B7 ) <- in( B5 )  Freq: 0.999835
        nop 	# 3 bytes pad for loops and calls
080     movl    R9, [RCX + #12 (8-bit)]	# range
084     NullCheck RCX

084     B7: #	out( B24 B8 ) <- in( B6 )  Freq: 0.999834
084     subl    R9, RAX	# int
087     incl    R9	# int
08a     testl   R9, R9
08d     jl     B24  P=0.000001 C=-1.000000

093     B8: #	out( B24 B9 ) <- in( B7 )  Freq: 0.999833
093     movl    R11, [R13 + #68 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.dummyVector (constant)
        nop 	# 9 bytes pad for loops and calls
0a0     movl    R11, [R12 + R11 << 3 + #8] (compressed oop addressing)	# compressed klass ptr
0a5     NullCheck R11

0a5     B9: #	out( B24 B10 ) <- in( B8 )  Freq: 0.999832
0a5     cmpl    R11, narrowklass: precise klass jdk/incubator/vector/Int512Vector: 0x00007fa2a43b52b0:Constant:exact *	# compressed klass ptr
0ac     jne,u   B24  P=0.000001 C=-1.000000

0b2     B10: #	out( B24 B11 ) <- in( B9 )  Freq: 0.999831
0b2     movl    R11, [R8 + #12 (8-bit)]	# range
0b6     NullCheck R8

0b6     B11: #	out( B24 B12 ) <- in( B10 )  Freq: 0.99983
0b6     subl    R11, RAX	# int
0b9     incl    R11	# int
        nop 	# 4 bytes pad for loops and calls
0c0     testl   R11, R11
0c3     jl     B24  P=0.000001 C=-1.000000

0c9     B12: #	out( B24 B13 ) <- in( B11 )  Freq: 0.999829
0c9     movl    RDI, R14	# spill
0cc     addl    RDI, #-15	# int
0cf     testl   RDI, RDI
0d1     jl     B24  P=0.000001 C=-1.000000

0d7     B13: #	out( B14 ) <- in( B12 )  Freq: 0.999828
0d7     # castII of R11
0d7     # castII of R9
0d7     # castII of RDI
0d7     # TLS is in R15
        nop 	# 9 bytes pad for loops and calls

0e0     B14: #	out( B20 B15 ) <- in( B13 B17 ) Loop( B14-B17 inner ) Freq: 6062.3
0e0     cmpl    RBX, R9	# unsigned
0e3     jnb,u   B20  P=0.000001 C=-1.000000

0e9     B15: #	out( B21 B16 ) <- in( B14 )  Freq: 6062.29
0e9     # castII of RBX
0e9     load_vector XMM1,[RCX + #16 + RBX << #2]
0f4     cmpl    RBX, R11	# unsigned
0f7     jnb,u   B21  P=0.000001 C=-1.000000

0fd     B16: #	out( B22 B17 ) <- in( B15 )  Freq: 6062.28
0fd     vpaddd  XMM1,XMM1,[R8 + #16 + RBX << #2]	! add packedI
108     cmpl    RBX, RDI	# unsigned
10a     jnb,u   B22  P=0.000001 C=-1.000000

110     B17: #	out( B14 B18 ) <- in( B16 )  Freq: 6062.28
110     store_vector [RDX + #16 + RBX << #2],XMM1
	
11b     addl    RBX, RAX	# int
11d     movq    RSI, [R15 + #304 (32-bit)]	# ptr
124     testl   rax, [RSI]	# Safepoint: poll for GC        # App::micro_vector @ bci:76 (line 20) L[0]=XMM0 L[1]=RDX L[2]=RCX L[3]=R8 L[4]=RBX L[5]=_ L[6]=_
        # OopMap {r8=Oop rcx=Oop rdx=Oop r13=Oop xmm0=Oop off=292/0x124}
126     cmpl    RBX, R10
129     jl,s   B14  P=0.999838 C=247048.000000

12b     B18: #	out( B26 B19 ) <- in( B17 B5 )  Freq: 0.981561
12b     cmpl    RBX, R14
12e     jl     B26  P=0.000000 C=40.000000

134     B19: #	out( N317 ) <- in( B18 )  Freq: 0.981561
134     vzeroupper
	addq    rsp, 176	# Destroy frame
	popq    rbp
	cmpq     rsp, poll_offset[r15_thread] 
	ja       #safepoint_stub	# Safepoint: poll for GC

14c     ret

14d     B20: #	out( N317 ) <- in( B14 )  Freq: 0.0061428
14d     movl    RSI, #-28	# int
152     movdq   RBP, XMM0	# spill
157     movq    [rsp + #0], RDX	# spill
15b     movq    [rsp + #16], R8	# spill
160     movq    [rsp + #32], RCX	# spill
165     movl    [rsp + #28], RBX	# spill
169     movl    [rsp + #40], R9	# spill
16e     movq    [rsp + #48], R13	# spill
        nop 	# 1 bytes pad for loops and calls
174     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #28 STK[1]=rsp + #40 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2689) L[0]=rsp + #48 L[1]=rsp + #32 L[2]=_ L[3]=_
        # App::micro_vector @ bci:32 (line 21) L[0]=RBP L[1]=rsp + #0 L[2]=rsp + #32 L[3]=rsp + #16 L[4]=rsp + #28 L[5]=_ L[6]=_
        # OopMap {rbp=Oop [0]=Oop [16]=Oop [32]=Oop [48]=Oop off=380/0x17c}
17c     stop	# ShouldNotReachHere

190     B21: #	out( N317 ) <- in( B15 )  Freq: 0.00614279
190     movl    RSI, #-28	# int
195     movdq   RBP, XMM0	# spill
19a     movq    [rsp + #0], RDX	# spill
19e     movq    [rsp + #8], RCX	# spill
1a3     movq    [rsp + #32], R8	# spill
1a8     movl    [rsp + #28], RBX	# spill
1ac     movl    [rsp + #40], R11	# spill
1b1     vmovdqu [rsp + 96],XMM1	# spill
1bc     movq    [rsp + #48], R13	# spill
        nop 	# 3 bytes pad for loops and calls
1c4     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #28 STK[1]=rsp + #40 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2689) L[0]=rsp + #48 L[1]=rsp + #32 L[2]=_ L[3]=_
        # App::micro_vector @ bci:44 (line 22) L[0]=RBP L[1]=rsp + #0 L[2]=rsp + #8 L[3]=rsp + #32 L[4]=rsp + #28 L[5]=#ScObj0 L[6]=_
        # ScObj0 jdk/incubator/vector/Int512Vector={ [payload :0]=rsp + #96 }
        # OopMap {rbp=Oop [0]=Oop [8]=Oop [32]=Oop [48]=Oop off=460/0x1cc}
1cc     stop	# ShouldNotReachHere

1e0     B22: #	out( N317 ) <- in( B16 )  Freq: 0.00614278
1e0     movl    RSI, #-28	# int
1e5     movdq   RBP, XMM0	# spill
1ea     movq    [rsp + #8], RCX	# spill
1ef     movq    [rsp + #16], R8	# spill
1f4     movq    [rsp + #32], RDX	# spill
1f9     movl    [rsp + #28], RBX	# spill
1fd     movl    [rsp + #40], RDI	# spill
201     vmovdqu [rsp + 96],XMM1	# spill
20c     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #28 STK[1]=rsp + #40 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:7 (line 2960) L[0]=#ScObj0 L[1]=rsp + #32 L[2]=_ L[3]=_
        # ScObj0 jdk/incubator/vector/Int512Vector={ [payload :0]=rsp + #96 }
        # App::micro_vector @ bci:59 (line 23) L[0]=RBP L[1]=rsp + #32 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=rsp + #28 L[5]=_ L[6]=_
        # OopMap {rbp=Oop [8]=Oop [16]=Oop [32]=Oop off=532/0x214}
214     stop	# ShouldNotReachHere

228     B23: #	out( N317 ) <- in( B3 )  Freq: 9.99998e-07
228     movl    RSI, #-34	# int
22d     movsd   [rsp + #0], XMM0	# spill
232     movq    [rsp + #8], RDX	# spill
237     movq    [rsp + #16], RCX	# spill
23c     movq    [rsp + #24], R8	# spill
241     movl    [rsp + #32], R14	# spill
        nop 	# 2 bytes pad for loops and calls
248     call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:17 (line 20) L[0]=rsp + #0 L[1]=rsp + #8 L[2]=rsp + #16 L[3]=rsp + #24 L[4]=#0 L[5]=_ L[6]=_ STK[0]=#0 STK[1]=RBP STK[2]=rsp + #32
        # OopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop off=592/0x250}
250     stop	# ShouldNotReachHere

264     B24: #	out( N317 ) <- in( B11 B12 B6 B7 B8 B9 B10 )  Freq: 7.03865e-06
264     movl    RSI, #-138	# int
269     movdq   RBP, XMM0	# spill
26e     movq    [rsp + #0], RDX	# spill
272     movq    [rsp + #8], RCX	# spill
277     movq    [rsp + #16], R8	# spill
27c     movl    [rsp + #24], R10	# spill
        nop 	# 3 bytes pad for loops and calls
284     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:22 (line 20) L[0]=RBP L[1]=rsp + #0 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=#0 L[5]=_ L[6]=_ STK[0]=#0 STK[1]=rsp + #24
        # OopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop off=652/0x28c}
28c     stop	# ShouldNotReachHere

2a0     B25: #	out( N317 ) <- in( B4 )  Freq: 4.99998e-07
2a0     movl    RSI, #-187	# int
2a5     movsd   [rsp + #0], XMM0	# spill
2aa     movq    [rsp + #8], RDX	# spill
2af     movq    [rsp + #16], RCX	# spill
2b4     movq    [rsp + #24], R8	# spill
2b9     movl    [rsp + #32], RAX	# spill
2bd     movl    [rsp + #36], R14	# spill
        nop 	# 2 bytes pad for loops and calls
2c4     call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.VectorIntrinsics::roundDown @ bci:5 (line 106) L[0]=rsp + #36 L[1]=rsp + #32 STK[0]=RBP
        # jdk.incubator.vector.AbstractSpecies::loopBound @ bci:5 (line 203) L[0]=_ L[1]=_
        # App::micro_vector @ bci:17 (line 20) L[0]=rsp + #0 L[1]=rsp + #8 L[2]=rsp + #16 L[3]=rsp + #24 L[4]=#0 L[5]=_ L[6]=_ STK[0]=#0
        # OopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop off=716/0x2cc}
2cc     stop	# ShouldNotReachHere

2e0     B26: #	out( N317 ) <- in( B18 )  Freq: 4.68045e-07
2e0     movl    RSI, #-187	# int
2e5     movq    RBP, RDX	# spill
2e8     movq    [rsp + #0], RCX	# spill
2ec     movq    [rsp + #8], R8	# spill
2f1     movl    [rsp + #20], RBX	# spill
2f5     movl    [rsp + #24], R14	# spill
        nop 	# 2 bytes pad for loops and calls
2fc     call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # App::micro_vector @ bci:83 (line 25) L[0]=_ L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #8 L[4]=rsp + #20 L[5]=_ L[6]=_ STK[0]=rsp + #20 STK[1]=rsp + #24
        # OopMap {rbp=Oop [0]=Oop [8]=Oop off=772/0x304}
304     stop	# ShouldNotReachHere

318     B27: #	out( N317 ) <- in( B1 )  Freq: 1.01328e-06
318     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
320     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:16 (line 20) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ STK[0]=_ STK[1]=_ STK[2]=#NULL
        # OopMap {off=808/0x328}
328     stop	# ShouldNotReachHere

33c     B28: #	out( N317 ) <- in( B2 )  Freq: 1.01328e-06
33c     movl    RSI, #-10	# int
341     movl    RBP, R14	# spill
344     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:17 (line 20) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ STK[0]=_ STK[1]=#NULL STK[2]=RBP
        # OopMap {off=844/0x34c}
34c     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    7309  227             App::micro_vector (106 bytes)
 total in heap  [0x00007fa32917f010,0x00007fa32917fb30] = 2848
 relocation     [0x00007fa32917f188,0x00007fa32917f220] = 152
 main code      [0x00007fa32917f220,0x00007fa32917f5a0] = 896
 stub code      [0x00007fa32917f5a0,0x00007fa32917f5b8] = 24
 oops           [0x00007fa32917f5b8,0x00007fa32917f5c8] = 16
 metadata       [0x00007fa32917f5c8,0x00007fa32917f678] = 176
 scopes data    [0x00007fa32917f678,0x00007fa32917f8a0] = 552
 scopes pcs     [0x00007fa32917f8a0,0x00007fa32917faf0] = 592
 dependencies   [0x00007fa32917faf0,0x00007fa32917fb00] = 16
 nul chk table  [0x00007fa32917fb00,0x00007fa32917fb30] = 48

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Entry Point]
  # {method} {0x00007fa2d0811818} 'micro_vector' '([I[I[I)V' in 'App'
  # this:     rsi:rsi   = 'App'
  # parm0:    rdx:rdx   = '[I'
  # parm1:    rcx:rcx   = '[I'
  # parm2:    r8:r8     = '[I'
  #           [sp+0xc0]  (sp of caller)
 ;; N317: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fa32917f220:   mov    0x8(%rsi),%r10d
  0x00007fa32917f224:   movabs $0x800000000,%r11
  0x00007fa32917f22e:   add    %r11,%r10
  0x00007fa32917f231:   cmp    %r10,%rax
  0x00007fa32917f234:   jne    0x00007fa329115c20           ;   {runtime_call ic_miss_stub}
  0x00007fa32917f23a:   nop
  0x00007fa32917f23b:   nop
  0x00007fa32917f23c:   nop
  0x00007fa32917f23d:   nop
  0x00007fa32917f23e:   nop
  0x00007fa32917f23f:   nop
[Verified Entry Point]
 ;; B1: #	out( B27 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fa32917f240:   mov    %eax,-0x16000(%rsp)
  0x00007fa32917f247:   push   %rbp
  0x00007fa32917f248:   sub    $0xb0,%rsp                   ;*synchronization entry
                                                            ; - App::micro_vector@-1 (line 15)
  0x00007fa32917f24f:   vmovq  %rsi,%xmm0
  0x00007fa32917f254:   mov    0xc(%rdx),%r14d              ; implicit exception: dispatches to 0x00007fa32917f538
                                                            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B2: #	out( B28 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007fa32917f258:   mov    0xc(%rsi),%ebp               ;*getfield SPECIES {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@12 (line 20)
  0x00007fa32917f25b:   nop
  0x00007fa32917f25c:   nop
  0x00007fa32917f25d:   nop
  0x00007fa32917f25e:   nop
  0x00007fa32917f25f:   nop
  0x00007fa32917f260:   mov    0x8(%r12,%rbp,8),%r11d       ; implicit exception: dispatches to 0x00007fa32917f55c
 ;; B3: #	out( B23 B4 ) <- in( B2 )  Freq: 0.999998
  0x00007fa32917f265:   cmp    $0x94b80,%r11d               ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
                                                            ;   {metadata('jdk/incubator/vector/IntVector$IntSpecies')}
  0x00007fa32917f26c:   jne    0x00007fa32917f448
 ;; B4: #	out( B25 B5 ) <- in( B3 )  Freq: 0.999997
  0x00007fa32917f272:   lea    (%r12,%rbp,8),%r13           ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
  0x00007fa32917f276:   mov    0xc(%r13),%eax               ;*getfield laneCount {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
                                                            ; - App::micro_vector@17 (line 20)
  0x00007fa32917f27a:   mov    %eax,%r10d
  0x00007fa32917f27d:   dec    %r10d
  0x00007fa32917f280:   mov    %eax,%ebp
  0x00007fa32917f282:   and    %r10d,%ebp
  0x00007fa32917f285:   test   %ebp,%ebp
  0x00007fa32917f287:   jne    0x00007fa32917f4c0
 ;; B5: #	out( B18 B6 ) <- in( B4 )  Freq: 0.999996
  0x00007fa32917f28d:   andn   %r14d,%r10d,%r10d
  0x00007fa32917f292:   xor    %ebx,%ebx
  0x00007fa32917f294:   test   %r10d,%r10d
  0x00007fa32917f297:   jle    0x00007fa32917f34b
 ;; B6: #	out( B24 B7 ) <- in( B5 )  Freq: 0.999835
  0x00007fa32917f29d:   nop
  0x00007fa32917f29e:   nop
  0x00007fa32917f29f:   nop
  0x00007fa32917f2a0:   mov    0xc(%rcx),%r9d               ; implicit exception: dispatches to 0x00007fa32917f484
 ;; B7: #	out( B24 B8 ) <- in( B6 )  Freq: 0.999834
  0x00007fa32917f2a4:   sub    %eax,%r9d
  0x00007fa32917f2a7:   inc    %r9d
  0x00007fa32917f2aa:   test   %r9d,%r9d
  0x00007fa32917f2ad:   jl     0x00007fa32917f484           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B8: #	out( B24 B9 ) <- in( B7 )  Freq: 0.999833
  0x00007fa32917f2b3:   mov    0x44(%r13),%r11d             ;*getfield dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007fa32917f2b7:   nop
  0x00007fa32917f2b8:   nop
  0x00007fa32917f2b9:   nop
  0x00007fa32917f2ba:   nop
  0x00007fa32917f2bb:   nop
  0x00007fa32917f2bc:   nop
  0x00007fa32917f2bd:   nop
  0x00007fa32917f2be:   nop
  0x00007fa32917f2bf:   nop
  0x00007fa32917f2c0:   mov    0x8(%r12,%r11,8),%r11d       ; implicit exception: dispatches to 0x00007fa32917f484
 ;; B9: #	out( B24 B10 ) <- in( B8 )  Freq: 0.999832
  0x00007fa32917f2c5:   cmp    $0x98c90,%r11d               ;   {metadata('jdk/incubator/vector/Int512Vector')}
  0x00007fa32917f2cc:   jne    0x00007fa32917f484
 ;; B10: #	out( B24 B11 ) <- in( B9 )  Freq: 0.999831
  0x00007fa32917f2d2:   mov    0xc(%r8),%r11d               ; implicit exception: dispatches to 0x00007fa32917f484
 ;; B11: #	out( B24 B12 ) <- in( B10 )  Freq: 0.99983
  0x00007fa32917f2d6:   sub    %eax,%r11d
  0x00007fa32917f2d9:   inc    %r11d
  0x00007fa32917f2dc:   nop
  0x00007fa32917f2dd:   nop
  0x00007fa32917f2de:   nop
  0x00007fa32917f2df:   nop
  0x00007fa32917f2e0:   test   %r11d,%r11d
  0x00007fa32917f2e3:   jl     0x00007fa32917f484
 ;; B12: #	out( B24 B13 ) <- in( B11 )  Freq: 0.999829
  0x00007fa32917f2e9:   mov    %r14d,%edi                   ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fa32917f2ec:   add    $0xfffffff1,%edi
  0x00007fa32917f2ef:   test   %edi,%edi
  0x00007fa32917f2f1:   jl     0x00007fa32917f484           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@76 (line 20)
 ;; B13: #	out( B14 ) <- in( B12 )  Freq: 0.999828
  0x00007fa32917f2f7:   nop
  0x00007fa32917f2f8:   nop
  0x00007fa32917f2f9:   nop
  0x00007fa32917f2fa:   nop
  0x00007fa32917f2fb:   nop
  0x00007fa32917f2fc:   nop
  0x00007fa32917f2fd:   nop
  0x00007fa32917f2fe:   nop
  0x00007fa32917f2ff:   nop
 ;; B14: #	out( B20 B15 ) <- in( B13 B17 ) Loop( B14-B17 inner ) Freq: 6062.3
  0x00007fa32917f300:   cmp    %r9d,%ebx
  0x00007fa32917f303:   jae    0x00007fa32917f36d           ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
 ;; B15: #	out( B21 B16 ) <- in( B14 )  Freq: 6062.29
  0x00007fa32917f309:   vmovdqu32 0x10(%rcx,%rbx,4),%zmm1   ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
                                                            ; - jdk.incubator.vector.Int512Vector::fromArray0@3 (line 805)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007fa32917f314:   cmp    %r11d,%ebx
  0x00007fa32917f317:   jae    0x00007fa32917f3b0           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B16: #	out( B22 B17 ) <- in( B15 )  Freq: 6062.28
  0x00007fa32917f31d:   vpaddd 0x10(%r8,%rbx,4),%zmm1,%zmm1 ;*invokestatic binaryOp {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
                                                            ; - jdk.incubator.vector.Int512Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int512Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector@53 (line 23)
  0x00007fa32917f328:   cmp    %edi,%ebx
  0x00007fa32917f32a:   jae    0x00007fa32917f400
 ;; B17: #	out( B14 B18 ) <- in( B16 )  Freq: 6062.28
  0x00007fa32917f330:   vmovdqu32 %zmm1,0x10(%rdx,%rbx,4)   ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fa32917f33b:   add    %eax,%ebx
  0x00007fa32917f33d:   mov    0x130(%r15),%rsi             ; ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop r13=Oop xmm0=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@76 (line 20)
  0x00007fa32917f344:   test   %eax,(%rsi)                  ;   {poll}
  0x00007fa32917f346:   cmp    %r10d,%ebx                   ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fa32917f349:   jl     0x00007fa32917f300           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@22 (line 20)
 ;; B18: #	out( B26 B19 ) <- in( B17 B5 )  Freq: 0.981561
  0x00007fa32917f34b:   cmp    %r14d,%ebx
  0x00007fa32917f34e:   jl     0x00007fa32917f500
 ;; B19: #	out( N317 ) <- in( B18 )  Freq: 0.981561
  0x00007fa32917f354:   vzeroupper 
  0x00007fa32917f357:   add    $0xb0,%rsp
  0x00007fa32917f35e:   pop    %rbp
  0x00007fa32917f35f:   cmp    0x128(%r15),%rsp             ;   {poll_return}
  0x00007fa32917f366:   ja     0x00007fa32917f580
  0x00007fa32917f36c:   retq   
 ;; B20: #	out( N317 ) <- in( B14 )  Freq: 0.0061428
  0x00007fa32917f36d:   mov    $0xffffffe4,%esi
  0x00007fa32917f372:   vmovq  %xmm0,%rbp
  0x00007fa32917f377:   mov    %rdx,(%rsp)
  0x00007fa32917f37b:   mov    %r8,0x10(%rsp)
  0x00007fa32917f380:   mov    %rcx,0x20(%rsp)
  0x00007fa32917f385:   mov    %ebx,0x1c(%rsp)
  0x00007fa32917f389:   mov    %r9d,0x28(%rsp)
  0x00007fa32917f38e:   mov    %r13,0x30(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fa32917f393:   nop
  0x00007fa32917f394:   vzeroupper 
  0x00007fa32917f397:   callq  0x00007fa3291191c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop [32]=Oop [48]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fa32917f39c:   movabs $0x7fa3334da7b8,%rdi         ;   {external_word}
  0x00007fa32917f3a6:   and    $0xfffffffffffffff0,%rsp
  0x00007fa32917f3aa:   callq  0x00007fa332c9fff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fa32917f3af:   hlt    
 ;; B21: #	out( N317 ) <- in( B15 )  Freq: 0.00614279
  0x00007fa32917f3b0:   mov    $0xffffffe4,%esi
  0x00007fa32917f3b5:   vmovq  %xmm0,%rbp
  0x00007fa32917f3ba:   mov    %rdx,(%rsp)
  0x00007fa32917f3be:   mov    %rcx,0x8(%rsp)
  0x00007fa32917f3c3:   mov    %r8,0x20(%rsp)
  0x00007fa32917f3c8:   mov    %ebx,0x1c(%rsp)
  0x00007fa32917f3cc:   mov    %r11d,0x28(%rsp)
  0x00007fa32917f3d1:   vmovdqu64 %zmm1,0x60(%rsp)
  0x00007fa32917f3dc:   mov    %r13,0x30(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fa32917f3e1:   nop
  0x00007fa32917f3e2:   nop
  0x00007fa32917f3e3:   nop
  0x00007fa32917f3e4:   vzeroupper 
  0x00007fa32917f3e7:   callq  0x00007fa3291191c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [32]=Oop [48]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@44 (line 22)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fa32917f3ec:   movabs $0x7fa3334da7b8,%rdi         ;   {external_word}
  0x00007fa32917f3f6:   and    $0xfffffffffffffff0,%rsp
  0x00007fa32917f3fa:   callq  0x00007fa332c9fff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fa32917f3ff:   hlt    
 ;; B22: #	out( N317 ) <- in( B16 )  Freq: 0.00614278
  0x00007fa32917f400:   mov    $0xffffffe4,%esi
  0x00007fa32917f405:   vmovq  %xmm0,%rbp
  0x00007fa32917f40a:   mov    %rcx,0x8(%rsp)
  0x00007fa32917f40f:   mov    %r8,0x10(%rsp)
  0x00007fa32917f414:   mov    %rdx,0x20(%rsp)
  0x00007fa32917f419:   mov    %ebx,0x1c(%rsp)
  0x00007fa32917f41d:   mov    %edi,0x28(%rsp)
  0x00007fa32917f421:   vmovdqu64 %zmm1,0x60(%rsp)
  0x00007fa32917f42c:   vzeroupper 
  0x00007fa32917f42f:   callq  0x00007fa3291191c0           ; ImmutableOopMap {rbp=Oop [8]=Oop [16]=Oop [32]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - App::micro_vector@59 (line 23)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fa32917f434:   movabs $0x7fa3334da7b8,%rdi         ;   {external_word}
  0x00007fa32917f43e:   and    $0xfffffffffffffff0,%rsp
  0x00007fa32917f442:   callq  0x00007fa332c9fff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fa32917f447:   hlt    
 ;; B23: #	out( N317 ) <- in( B3 )  Freq: 9.99998e-07
  0x00007fa32917f448:   mov    $0xffffffde,%esi
  0x00007fa32917f44d:   vmovsd %xmm0,(%rsp)
  0x00007fa32917f452:   mov    %rdx,0x8(%rsp)
  0x00007fa32917f457:   mov    %rcx,0x10(%rsp)
  0x00007fa32917f45c:   mov    %r8,0x18(%rsp)
  0x00007fa32917f461:   mov    %r14d,0x20(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fa32917f466:   nop
  0x00007fa32917f467:   nop
  0x00007fa32917f468:   vzeroupper 
  0x00007fa32917f46b:   callq  0x00007fa3291191c0           ; ImmutableOopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fa32917f470:   movabs $0x7fa3334da7b8,%rdi         ;   {external_word}
  0x00007fa32917f47a:   and    $0xfffffffffffffff0,%rsp
  0x00007fa32917f47e:   callq  0x00007fa332c9fff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fa32917f483:   hlt    
 ;; B24: #	out( N317 ) <- in( B11 B12 B6 B7 B8 B9 B10 )  Freq: 7.03865e-06
  0x00007fa32917f484:   mov    $0xffffff76,%esi
  0x00007fa32917f489:   vmovq  %xmm0,%rbp
  0x00007fa32917f48e:   mov    %rdx,(%rsp)
  0x00007fa32917f492:   mov    %rcx,0x8(%rsp)
  0x00007fa32917f497:   mov    %r8,0x10(%rsp)
  0x00007fa32917f49c:   mov    %r10d,0x18(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fa32917f4a1:   nop
  0x00007fa32917f4a2:   nop
  0x00007fa32917f4a3:   nop
  0x00007fa32917f4a4:   vzeroupper 
  0x00007fa32917f4a7:   callq  0x00007fa3291191c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@22 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fa32917f4ac:   movabs $0x7fa3334da7b8,%rdi         ;   {external_word}
  0x00007fa32917f4b6:   and    $0xfffffffffffffff0,%rsp
  0x00007fa32917f4ba:   callq  0x00007fa332c9fff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fa32917f4bf:   hlt    
 ;; B25: #	out( N317 ) <- in( B4 )  Freq: 4.99998e-07
  0x00007fa32917f4c0:   mov    $0xffffff45,%esi
  0x00007fa32917f4c5:   vmovsd %xmm0,(%rsp)
  0x00007fa32917f4ca:   mov    %rdx,0x8(%rsp)
  0x00007fa32917f4cf:   mov    %rcx,0x10(%rsp)
  0x00007fa32917f4d4:   mov    %r8,0x18(%rsp)
  0x00007fa32917f4d9:   mov    %eax,0x20(%rsp)
  0x00007fa32917f4dd:   mov    %r14d,0x24(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fa32917f4e2:   nop
  0x00007fa32917f4e3:   nop
  0x00007fa32917f4e4:   vzeroupper 
  0x00007fa32917f4e7:   callq  0x00007fa3291191c0           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*ifne {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fa32917f4ec:   movabs $0x7fa3334da7b8,%rdi         ;   {external_word}
  0x00007fa32917f4f6:   and    $0xfffffffffffffff0,%rsp
  0x00007fa32917f4fa:   callq  0x00007fa332c9fff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fa32917f4ff:   hlt    
 ;; B26: #	out( N317 ) <- in( B18 )  Freq: 4.68045e-07
  0x00007fa32917f500:   mov    $0xffffff45,%esi
  0x00007fa32917f505:   mov    %rdx,%rbp
  0x00007fa32917f508:   mov    %rcx,(%rsp)
  0x00007fa32917f50c:   mov    %r8,0x8(%rsp)
  0x00007fa32917f511:   mov    %ebx,0x14(%rsp)
  0x00007fa32917f515:   mov    %r14d,0x18(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fa32917f51a:   nop
  0x00007fa32917f51b:   nop
  0x00007fa32917f51c:   vzeroupper 
  0x00007fa32917f51f:   callq  0x00007fa3291191c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@83 (line 25)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fa32917f524:   movabs $0x7fa3334da7b8,%rdi         ;   {external_word}
  0x00007fa32917f52e:   and    $0xfffffffffffffff0,%rsp
  0x00007fa32917f532:   callq  0x00007fa332c9fff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fa32917f537:   hlt    
 ;; B27: #	out( N317 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007fa32917f538:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fa32917f53d:   nop
  0x00007fa32917f53e:   nop
  0x00007fa32917f53f:   nop
  0x00007fa32917f540:   vzeroupper 
  0x00007fa32917f543:   callq  0x00007fa3291191c0           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@16 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fa32917f548:   movabs $0x7fa3334da7b8,%rdi         ;   {external_word}
  0x00007fa32917f552:   and    $0xfffffffffffffff0,%rsp
  0x00007fa32917f556:   callq  0x00007fa332c9fff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fa32917f55b:   hlt    
 ;; B28: #	out( N317 ) <- in( B2 )  Freq: 1.01328e-06
  0x00007fa32917f55c:   mov    $0xfffffff6,%esi
  0x00007fa32917f561:   mov    %r14d,%ebp
  0x00007fa32917f564:   vzeroupper 
  0x00007fa32917f567:   callq  0x00007fa3291191c0           ; ImmutableOopMap {}
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fa32917f56c:   movabs $0x7fa3334da7b8,%rdi         ;   {external_word}
  0x00007fa32917f576:   and    $0xfffffffffffffff0,%rsp
  0x00007fa32917f57a:   callq  0x00007fa332c9fff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fa32917f57f:   hlt                                 ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fa32917f580:   movabs $0x7fa32917f35f,%r10         ;   {internal_word}
  0x00007fa32917f58a:   mov    %r10,0x3e8(%r15)
  0x00007fa32917f591:   jmpq   0x00007fa329118020           ;   {runtime_call SafepointBlob}
  0x00007fa32917f596:   hlt    
  0x00007fa32917f597:   hlt    
  0x00007fa32917f598:   hlt    
  0x00007fa32917f599:   hlt    
  0x00007fa32917f59a:   hlt    
  0x00007fa32917f59b:   hlt    
  0x00007fa32917f59c:   hlt    
  0x00007fa32917f59d:   hlt    
  0x00007fa32917f59e:   hlt    
  0x00007fa32917f59f:   hlt    
[Exception Handler]
  0x00007fa32917f5a0:   jmpq   0x00007fa32905cfa0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007fa32917f5a5:   callq  0x00007fa32917f5aa
  0x00007fa32917f5aa:   subq   $0x5,(%rsp)
  0x00007fa32917f5af:   jmpq   0x00007fa3291194e0           ;   {runtime_call DeoptimizationBlob}
  0x00007fa32917f5b4:   hlt    
  0x00007fa32917f5b5:   hlt    
  0x00007fa32917f5b6:   hlt    
  0x00007fa32917f5b7:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007fa32917f5b8:   0x00000000fb0011b0 a 'java/lang/Class'{0x00000000fb0011b0} = 'jdk/incubator/vector/Int512Vector'
  0x00007fa32917f5c0:   0x00000000fb0001c8 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x00000000fb0001c8}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007fa32917f5c8:   0x00007fa2d0811818 {method} {0x00007fa2d0811818} 'micro_vector' '([I[I[I)V' in 'App'
  0x00007fa32917f5d0:   0x00007fa2d0812d08 {method} {0x00007fa2d0812d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
  0x00007fa32917f5d8:   0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fa32917f5e0:   0x00007fa2d0a1e040 {method} {0x00007fa2d0a1e040} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fa32917f5e8:   0x00007fa2d0812728 {method} {0x00007fa2d0812728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fa32917f5f0:   0x00007fa2d0a18468 {method} {0x00007fa2d0a18468} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fa32917f5f8:   0x00007fa2d0a1eb40 {method} {0x00007fa2d0a1eb40} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fa32917f600:   0x0000000800098c90 'jdk/incubator/vector/Int512Vector'
  0x00007fa32917f608:   0x00007fa2d0a84038 {method} {0x00007fa2d0a84038} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007fa32917f610:   0x00007fa2d0560ca0 {method} {0x00007fa2d0560ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
  0x00007fa32917f618:   0x00007fa2d0a5ac10 {method} {0x00007fa2d0a5ac10} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int512Vector'
  0x00007fa32917f620:   0x00007fa2d0813798 {method} {0x00007fa2d0813798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fa32917f628:   0x00007fa2d081f8d8 {method} {0x00007fa2d081f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fa32917f630:   0x00007fa2d0a5c080 {method} {0x00007fa2d0a5c080} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int512Vector'
  0x00007fa32917f638:   0x00007fa2d0a58f18 {method} {0x00007fa2d0a58f18} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int512Vector;' in 'jdk/incubator/vector/Int512Vector'
  0x00007fa32917f640:   0x00007fa2d081e8d8 {method} {0x00007fa2d081e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fa32917f648:   0x00007fa2d0a84340 {method} {0x00007fa2d0a84340} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007fa32917f650:   0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
  0x00007fa32917f658:   0x00007fa2d0aef250 {method} {0x00007fa2d0aef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fa32917f660:   0x00007fa2d0aeede8 {method} {0x00007fa2d0aeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fa32917f668:   0x00007fa2d0aeeec0 {method} {0x00007fa2d0aeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fa32917f670:   0x00007fa2d0a11968 {method} {0x00007fa2d0a11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007fa32917f21f offset=ffffffff bits=0):
PcDesc(pc=0x00007fa32917f24f offset=2f bits=0):   App::micro_vector@-1 (line 15)
PcDesc(pc=0x00007fa32917f258 offset=38 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f25b offset=3b bits=0):   App::micro_vector@12 (line 20)
PcDesc(pc=0x00007fa32917f26c offset=4c bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f276 offset=56 bits=0):   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007fa32917f27a offset=5a bits=0):   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007fa32917f2b3 offset=93 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f2b7 offset=97 bits=0):   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fa32917f2ec offset=cc bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f2f7 offset=d7 bits=0):   App::micro_vector@76 (line 20)
PcDesc(pc=0x00007fa32917f309 offset=e9 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fa32917f314 offset=f4 bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
   jdk.incubator.vector.Int512Vector::fromArray0@3 (line 805)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fa32917f31d offset=fd bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f328 offset=108 bits=0):   jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
   jdk.incubator.vector.Int512Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int512Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector@53 (line 23)
PcDesc(pc=0x00007fa32917f33b offset=11b bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f344 offset=124 bits=1):   App::micro_vector@76 (line 20)  reexecute=true
   Locals
    - l0: reg xmm0 [48],oop
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rbx [6],int
    - l5: empty
    - l6: empty
PcDesc(pc=0x00007fa32917f349 offset=129 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f34b offset=12b bits=0):   App::micro_vector@22 (line 20)
PcDesc(pc=0x00007fa32917f393 offset=173 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f39c offset=17c bits=0):   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[48],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
   App::micro_vector@32 (line 21)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[32],oop
    - l3: stack[16],oop
    - l4: stack[28]
    - l5: empty
    - l6: empty
PcDesc(pc=0x00007fa32917f3e1 offset=1c1 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f3ec offset=1cc bits=0):   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[48],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
   App::micro_vector@44 (line 22)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[32],oop
    - l4: stack[28]
    - l5: obj[183]
    - l6: empty
   Objects
    - 183: jdk.incubator.vector.Int512Vector stack[96]Wrong location type 7
PcDesc(pc=0x00007fa32917f434 offset=214 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: obj[175]
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
   App::micro_vector@59 (line 23)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[32],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: stack[28]
    - l5: empty
    - l6: empty
   Objects
    - 175: jdk.incubator.vector.Int512Vector stack[96]Wrong location type 7
PcDesc(pc=0x00007fa32917f466 offset=246 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f470 offset=250 bits=0):   App::micro_vector@17 (line 20)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: stack[16],oop
    - l3: stack[24],oop
    - l4: 0
    - l5: empty
    - l6: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],narrowoop
    - @2: stack[32]
PcDesc(pc=0x00007fa32917f4a1 offset=281 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f4ac offset=28c bits=1):   App::micro_vector@22 (line 20)  reexecute=true
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: 0
    - l5: empty
    - l6: empty
   Expression stack
    - @0: 0
    - @1: stack[24]
PcDesc(pc=0x00007fa32917f4e2 offset=2c2 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f4ec offset=2cc bits=1):   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
   Locals
    - l0: stack[36]
    - l1: stack[32]
   Expression stack
    - @0: reg rbp [10],int
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   Locals
    - l0: empty
    - l1: empty
   App::micro_vector@17 (line 20)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: stack[16],oop
    - l3: stack[24],oop
    - l4: 0
    - l5: empty
    - l6: empty
   Expression stack
    - @0: 0
PcDesc(pc=0x00007fa32917f51a offset=2fa bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f524 offset=304 bits=1):   App::micro_vector@83 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[20]
    - l5: empty
    - l6: empty
   Expression stack
    - @0: stack[20]
    - @1: stack[24]
PcDesc(pc=0x00007fa32917f53d offset=31d bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f548 offset=328 bits=0):   App::micro_vector@16 (line 20)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: NULL
PcDesc(pc=0x00007fa32917f56c offset=34c bits=0):   App::micro_vector@17 (line 20)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
   Expression stack
    - @0: empty
    - @1: NULL
    - @2: reg rbp [10],int
PcDesc(pc=0x00007fa32917f580 offset=360 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fa32917f5b9 offset=399 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 10 OopMaps

ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop r13=Oop xmm0=Oop } pc offsets: 292 
ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop [32]=Oop [48]=Oop } pc offsets: 380 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [32]=Oop [48]=Oop } pc offsets: 460 
ImmutableOopMap {rbp=Oop [8]=Oop [16]=Oop [32]=Oop } pc offsets: 532 
ImmutableOopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop } pc offsets: 592 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop } pc offsets: 652 
ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop } pc offsets: 716 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop } pc offsets: 772 
ImmutableOopMap {} pc offsets: 808 844 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007fa32917f24f offset=2f):
   App::micro_vector@-1 (line 15)
ScopeDesc(pc=0x00007fa32917f258 offset=38):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f258 offset=38):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fa32917f25b offset=3b):
   App::micro_vector@12 (line 20)
ScopeDesc(pc=0x00007fa32917f26c offset=4c):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f26c offset=4c):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fa32917f276 offset=56):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007fa32917f27a offset=5a):
   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
ScopeDesc(pc=0x00007fa32917f27a offset=5a):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007fa32917f2b3 offset=93):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f2b3 offset=93):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fa32917f2b7 offset=97):
   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
ScopeDesc(pc=0x00007fa32917f2b7 offset=97):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007fa32917f2b7 offset=97):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fa32917f2b7 offset=97):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fa32917f2ec offset=cc):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f2ec offset=cc):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fa32917f2f7 offset=d7):
   App::micro_vector@76 (line 20)
ScopeDesc(pc=0x00007fa32917f309 offset=e9):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fa32917f309 offset=e9):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fa32917f309 offset=e9):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fa32917f309 offset=e9):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fa32917f314 offset=f4):
   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
ScopeDesc(pc=0x00007fa32917f314 offset=f4):
   jdk.incubator.vector.Int512Vector::fromArray0@3 (line 805)
ScopeDesc(pc=0x00007fa32917f314 offset=f4):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fa32917f314 offset=f4):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fa32917f31d offset=fd):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f31d offset=fd):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fa32917f328 offset=108):
   jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
ScopeDesc(pc=0x00007fa32917f328 offset=108):
   jdk.incubator.vector.Int512Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fa32917f328 offset=108):
   jdk.incubator.vector.Int512Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fa32917f328 offset=108):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fa32917f328 offset=108):
   App::micro_vector@53 (line 23)
ScopeDesc(pc=0x00007fa32917f33b offset=11b):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f33b offset=11b):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fa32917f344 offset=124):
   App::micro_vector@76 (line 20)  reexecute=true
   Locals
    - l0: reg xmm0 [48],oop
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rbx [6],int
    - l5: empty
    - l6: empty
ScopeDesc(pc=0x00007fa32917f349 offset=129):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f349 offset=129):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fa32917f34b offset=12b):
   App::micro_vector@22 (line 20)
ScopeDesc(pc=0x00007fa32917f393 offset=173):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f393 offset=173):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fa32917f39c offset=17c):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007fa32917f39c offset=17c):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fa32917f39c offset=17c):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[48],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fa32917f39c offset=17c):
   App::micro_vector@32 (line 21)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[32],oop
    - l3: stack[16],oop
    - l4: stack[28]
    - l5: empty
    - l6: empty
ScopeDesc(pc=0x00007fa32917f3e1 offset=1c1):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f3e1 offset=1c1):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fa32917f3ec offset=1cc):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007fa32917f3ec offset=1cc):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fa32917f3ec offset=1cc):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[48],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fa32917f3ec offset=1cc):
   App::micro_vector@44 (line 22)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[32],oop
    - l4: stack[28]
    - l5: obj[183]
    - l6: empty
   Objects
    - 183: jdk.incubator.vector.Int512Vector stack[96]Wrong location type 7
ScopeDesc(pc=0x00007fa32917f434 offset=214):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007fa32917f434 offset=214):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fa32917f434 offset=214):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: obj[175]
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fa32917f434 offset=214):
   App::micro_vector@59 (line 23)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[32],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: stack[28]
    - l5: empty
    - l6: empty
   Objects
    - 175: jdk.incubator.vector.Int512Vector stack[96]Wrong location type 7
ScopeDesc(pc=0x00007fa32917f466 offset=246):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f466 offset=246):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fa32917f470 offset=250):
   App::micro_vector@17 (line 20)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: stack[16],oop
    - l3: stack[24],oop
    - l4: 0
    - l5: empty
    - l6: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],narrowoop
    - @2: stack[32]
ScopeDesc(pc=0x00007fa32917f4a1 offset=281):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f4a1 offset=281):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fa32917f4ac offset=28c):
   App::micro_vector@22 (line 20)  reexecute=true
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: 0
    - l5: empty
    - l6: empty
   Expression stack
    - @0: 0
    - @1: stack[24]
ScopeDesc(pc=0x00007fa32917f4e2 offset=2c2):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f4e2 offset=2c2):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fa32917f4ec offset=2cc):
   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
   Locals
    - l0: stack[36]
    - l1: stack[32]
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007fa32917f4ec offset=2cc):
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   Locals
    - l0: empty
    - l1: empty
ScopeDesc(pc=0x00007fa32917f4ec offset=2cc):
   App::micro_vector@17 (line 20)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: stack[16],oop
    - l3: stack[24],oop
    - l4: 0
    - l5: empty
    - l6: empty
   Expression stack
    - @0: 0
ScopeDesc(pc=0x00007fa32917f51a offset=2fa):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f51a offset=2fa):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fa32917f524 offset=304):
   App::micro_vector@83 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[20]
    - l5: empty
    - l6: empty
   Expression stack
    - @0: stack[20]
    - @1: stack[24]
ScopeDesc(pc=0x00007fa32917f53d offset=31d):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f53d offset=31d):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fa32917f548 offset=328):
   App::micro_vector@16 (line 20)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: NULL
ScopeDesc(pc=0x00007fa32917f56c offset=34c):
   App::micro_vector@17 (line 20)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
   Expression stack
    - @0: empty
    - @1: NULL
    - @2: reg rbp [10],int
ScopeDesc(pc=0x00007fa32917f580 offset=360):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fa32917f580 offset=360):
   App::micro_vector@59 (line 23)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007fa32917f188: 6014
relocInfo@0x00007fa32917f188 [type=6(runtime_call) addr=0x00007fa32917f234 offset=20] | [destination=0x00007fa329115c20]
         @0x00007fa32917f18a: f003cc31
relocInfo@0x00007fa32917f18c [type=12(metadata) addr=0x00007fa32917f265 offset=49 format=3 data=3] | [metadata_addr=0x00007fa32917f5d8 *=0x0000000800094b80 offset=0]metadata_value=0x0000000800094b80: 'jdk/incubator/vector/IntVector$IntSpecies'
         @0x00007fa32917f18e: f008cc60
relocInfo@0x00007fa32917f190 [type=12(metadata) addr=0x00007fa32917f2c5 offset=96 format=3 data=8] | [metadata_addr=0x00007fa32917f600 *=0x0000000800098c90 offset=0]metadata_value=0x0000000800098c90: 'jdk/incubator/vector/Int512Vector'
         @0x00007fa32917f192: a07f
relocInfo@0x00007fa32917f192 [type=10(poll) addr=0x00007fa32917f344 offset=127]
         @0x00007fa32917f194: b01b
relocInfo@0x00007fa32917f194 [type=11(poll_return) addr=0x00007fa32917f35f offset=27]
         @0x00007fa32917f196: 6438
relocInfo@0x00007fa32917f196 [type=6(runtime_call) addr=0x00007fa32917f397 offset=56 format=1] | [destination=0x00007fa3291191c0]
         @0x00007fa32917f198: f803334da7b87fa37005
relocInfo@0x00007fa32917f1a0 [type=7(external_word) addr=0x00007fa32917f39c offset=5 data={334da7b87fa3}] | [target=0x00007fa3334da7b8]
         @0x00007fa32917f1a2: 640e
relocInfo@0x00007fa32917f1a2 [type=6(runtime_call) addr=0x00007fa32917f3aa offset=14 format=1] | [destination=0x00007fa332c9fff4]
         @0x00007fa32917f1a4: 643d
relocInfo@0x00007fa32917f1a4 [type=6(runtime_call) addr=0x00007fa32917f3e7 offset=61 format=1] | [destination=0x00007fa3291191c0]
         @0x00007fa32917f1a6: f803334da7b87fa37005
relocInfo@0x00007fa32917f1ae [type=7(external_word) addr=0x00007fa32917f3ec offset=5 data={334da7b87fa3}] | [target=0x00007fa3334da7b8]
         @0x00007fa32917f1b0: 640e
relocInfo@0x00007fa32917f1b0 [type=6(runtime_call) addr=0x00007fa32917f3fa offset=14 format=1] | [destination=0x00007fa332c9fff4]
         @0x00007fa32917f1b2: 6435
relocInfo@0x00007fa32917f1b2 [type=6(runtime_call) addr=0x00007fa32917f42f offset=53 format=1] | [destination=0x00007fa3291191c0]
         @0x00007fa32917f1b4: f803334da7b87fa37005
relocInfo@0x00007fa32917f1bc [type=7(external_word) addr=0x00007fa32917f434 offset=5 data={334da7b87fa3}] | [target=0x00007fa3334da7b8]
         @0x00007fa32917f1be: 640e
relocInfo@0x00007fa32917f1be [type=6(runtime_call) addr=0x00007fa32917f442 offset=14 format=1] | [destination=0x00007fa332c9fff4]
         @0x00007fa32917f1c0: 6429
relocInfo@0x00007fa32917f1c0 [type=6(runtime_call) addr=0x00007fa32917f46b offset=41 format=1] | [destination=0x00007fa3291191c0]
         @0x00007fa32917f1c2: f803334da7b87fa37005
relocInfo@0x00007fa32917f1ca [type=7(external_word) addr=0x00007fa32917f470 offset=5 data={334da7b87fa3}] | [target=0x00007fa3334da7b8]
         @0x00007fa32917f1cc: 640e
relocInfo@0x00007fa32917f1cc [type=6(runtime_call) addr=0x00007fa32917f47e offset=14 format=1] | [destination=0x00007fa332c9fff4]
         @0x00007fa32917f1ce: 6429
relocInfo@0x00007fa32917f1ce [type=6(runtime_call) addr=0x00007fa32917f4a7 offset=41 format=1] | [destination=0x00007fa3291191c0]
         @0x00007fa32917f1d0: f803334da7b87fa37005
relocInfo@0x00007fa32917f1d8 [type=7(external_word) addr=0x00007fa32917f4ac offset=5 data={334da7b87fa3}] | [target=0x00007fa3334da7b8]
         @0x00007fa32917f1da: 640e
relocInfo@0x00007fa32917f1da [type=6(runtime_call) addr=0x00007fa32917f4ba offset=14 format=1] | [destination=0x00007fa332c9fff4]
         @0x00007fa32917f1dc: 642d
relocInfo@0x00007fa32917f1dc [type=6(runtime_call) addr=0x00007fa32917f4e7 offset=45 format=1] | [destination=0x00007fa3291191c0]
         @0x00007fa32917f1de: f803334da7b87fa37005
relocInfo@0x00007fa32917f1e6 [type=7(external_word) addr=0x00007fa32917f4ec offset=5 data={334da7b87fa3}] | [target=0x00007fa3334da7b8]
         @0x00007fa32917f1e8: 640e
relocInfo@0x00007fa32917f1e8 [type=6(runtime_call) addr=0x00007fa32917f4fa offset=14 format=1] | [destination=0x00007fa332c9fff4]
         @0x00007fa32917f1ea: 6425
relocInfo@0x00007fa32917f1ea [type=6(runtime_call) addr=0x00007fa32917f51f offset=37 format=1] | [destination=0x00007fa3291191c0]
         @0x00007fa32917f1ec: f803334da7b87fa37005
relocInfo@0x00007fa32917f1f4 [type=7(external_word) addr=0x00007fa32917f524 offset=5 data={334da7b87fa3}] | [target=0x00007fa3334da7b8]
         @0x00007fa32917f1f6: 640e
relocInfo@0x00007fa32917f1f6 [type=6(runtime_call) addr=0x00007fa32917f532 offset=14 format=1] | [destination=0x00007fa332c9fff4]
         @0x00007fa32917f1f8: 6411
relocInfo@0x00007fa32917f1f8 [type=6(runtime_call) addr=0x00007fa32917f543 offset=17 format=1] | [destination=0x00007fa3291191c0]
         @0x00007fa32917f1fa: f803334da7b87fa37005
relocInfo@0x00007fa32917f202 [type=7(external_word) addr=0x00007fa32917f548 offset=5 data={334da7b87fa3}] | [target=0x00007fa3334da7b8]
         @0x00007fa32917f204: 640e
relocInfo@0x00007fa32917f204 [type=6(runtime_call) addr=0x00007fa32917f556 offset=14 format=1] | [destination=0x00007fa332c9fff4]
         @0x00007fa32917f206: 6411
relocInfo@0x00007fa32917f206 [type=6(runtime_call) addr=0x00007fa32917f567 offset=17 format=1] | [destination=0x00007fa3291191c0]
         @0x00007fa32917f208: f803334da7b87fa37005
relocInfo@0x00007fa32917f210 [type=7(external_word) addr=0x00007fa32917f56c offset=5 data={334da7b87fa3}] | [target=0x00007fa3334da7b8]
         @0x00007fa32917f212: 640e
relocInfo@0x00007fa32917f212 [type=6(runtime_call) addr=0x00007fa32917f57a offset=14 format=1] | [destination=0x00007fa332c9fff4]
         @0x00007fa32917f214: f2218006
relocInfo@0x00007fa32917f216 [type=8(internal_word) addr=0x00007fa32917f580 offset=6 data=545] | [target=0x00007fa32917f35f]
         @0x00007fa32917f218: 6411
relocInfo@0x00007fa32917f218 [type=6(runtime_call) addr=0x00007fa32917f591 offset=17 format=1] | [destination=0x00007fa329118020]
         @0x00007fa32917f21a: 000f
relocInfo@0x00007fa32917f21a [type=0(none) addr=0x00007fa32917f5a0 offset=15]
         @0x00007fa32917f21c: 6400
relocInfo@0x00007fa32917f21c [type=6(runtime_call) addr=0x00007fa32917f5a0 offset=0 format=1] | [destination=0x00007fa32905cfa0]
         @0x00007fa32917f21e: 640f
relocInfo@0x00007fa32917f21e [type=6(runtime_call) addr=0x00007fa32917f5af offset=15 format=1] | [destination=0x00007fa3291194e0]
         @0x00007fa32917f220: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fa2d0aef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fa2d0aeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fa2d0aeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$ImplCache
  method  = {method} {0x00007fa2d0a11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$ImplCache
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 5 entries, 44 bytes):
{
   < 0x00007fa32917f254, 0x00007fa32917f538 > < 0x00007fa32917f260, 0x00007fa32917f55c > < 0x00007fa32917f2a0, 0x00007fa32917f484 > 
   < 0x00007fa32917f2c0, 0x00007fa32917f484 > < 0x00007fa32917f2d2, 0x00007fa32917f484 > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x00000000fb0011b0 a 'java/lang/Class'{0x00000000fb0011b0} = 'jdk/incubator/vector/Int512Vector'
#2: 0x00000000fb0001c8 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x00000000fb0001c8}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
# 0: 0x0000000000000000 NULL-oop
# 1: 0x00007fa2d0811818 {method} {0x00007fa2d0811818} 'micro_vector' '([I[I[I)V' in 'App'
# 2: 0x00007fa2d0812d08 {method} {0x00007fa2d0812d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
# 3: 0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
# 4: 0x00007fa2d0a1e040 {method} {0x00007fa2d0a1e040} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
# 5: 0x00007fa2d0812728 {method} {0x00007fa2d0812728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
# 6: 0x00007fa2d0a18468 {method} {0x00007fa2d0a18468} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
# 7: 0x00007fa2d0a1eb40 {method} {0x00007fa2d0a1eb40} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
# 8: 0x0000000800098c90 'jdk/incubator/vector/Int512Vector'
# 9: 0x00007fa2d0a84038 {method} {0x00007fa2d0a84038} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
#10: 0x00007fa2d0560ca0 {method} {0x00007fa2d0560ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
#11: 0x00007fa2d0a5ac10 {method} {0x00007fa2d0a5ac10} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int512Vector'
#12: 0x00007fa2d0813798 {method} {0x00007fa2d0813798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#13: 0x00007fa2d081f8d8 {method} {0x00007fa2d081f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#14: 0x00007fa2d0a5c080 {method} {0x00007fa2d0a5c080} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int512Vector'
#15: 0x00007fa2d0a58f18 {method} {0x00007fa2d0a58f18} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int512Vector;' in 'jdk/incubator/vector/Int512Vector'
#16: 0x00007fa2d081e8d8 {method} {0x00007fa2d081e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#17: 0x00007fa2d0a84340 {method} {0x00007fa2d0a84340} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
#18: 0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
#19: 0x00007fa2d0aef250 {method} {0x00007fa2d0aef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#20: 0x00007fa2d0aeede8 {method} {0x00007fa2d0aeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#21: 0x00007fa2d0aeeec0 {method} {0x00007fa2d0aeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#22: 0x00007fa2d0a11968 {method} {0x00007fa2d0a11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VECTOR : [Time] 243 ms   [Res] 99999000000000
VECTOR_MASKED : [Time] 2871 ms   [Res] 999990000000000
------------------------------------------------------------------------
App::micro_vector([I[I[I)V
  interpreter_invocation_count:       60 
  invocation_counter:              10000 
  backedge_counter:                 6013 
  mdo size: 880 bytes

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
                                    'jdk/incubator/vector/IntVector$IntSpecies'(371761 1.00)
22 if_icmpge 79
  56  bci: 22   BranchData          taken(60) displacement(256)
                                    not taken(371701)
25 fast_aaccess_0
26 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
29 aload_2
30 fast_iload #4
32 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  88  bci: 32   CounterData         count(371701)
35 astore #5
37 fast_aaccess_0
38 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
41 aload_3
42 fast_iload #4
44 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  104 bci: 44   CounterData         count(371701)
47 astore #6
49 aload #5
51 aload #6
53 invokevirtual 28 <jdk/incubator/vector/IntVector.add(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;> 
  120 bci: 53   VirtualCallData     count(371701) nonprofiled_count(0) entries(0)
56 aload_1
57 fast_iload #4
59 invokevirtual 32 <jdk/incubator/vector/IntVector.intoArray([II)V> 
  176 bci: 59   VirtualCallData     count(371701) nonprofiled_count(0) entries(0)
62 fast_iload #4
64 fast_aaccess_0
65 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
68 invokeinterface 36 <jdk/incubator/vector/VectorSpecies.length()I> 
  232 bci: 68   VirtualCallData     count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/IntVector$IntSpecies'(371701 1.00)
73 iadd
74 istore #4
76 goto 9
  288 bci: 76   JumpData            taken(371701) displacement(-288)
79 fast_iload #4
81 aload_1
82 arraylength
83 if_icmpge 105
  312 bci: 83   BranchData          taken(60) displacement(56)
                                    not taken(0)
86 aload_1
87 iload #4
89 aload_2
90 iload #4
92 iaload
93 aload_3
94 iload #4
96 iaload
97 iadd
98 iastore
99 iinc #4 1
102 goto 79
  344 bci: 102  JumpData            taken(0) displacement(-32)
105 return
------------------------------------------------------------------------
Total MDO size: 880 bytes
