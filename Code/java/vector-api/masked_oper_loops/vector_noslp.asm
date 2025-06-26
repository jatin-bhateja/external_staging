CompileCommand: print App.micro_vector bool print = true
SCALAR : [Time] 419 ms   [Res] 99999000000000

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 227 ------------------------
{method}
 - this oop:          0x00007fe010811818
 - method holder:     'App'
 - constants:         0x00007fe010811090 constant pool [134]/operands[15] {0x00007fe010811090} for 'App' cache=0x00007fe010b00000
 - access:            0xc1000001  public 
 - name:              'micro_vector'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        7
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007fe06900e220
 - adapters:          AHE@0x00007fe06c3c5270: 0xbbbb0000 i2c: 0x00007fe06907ffe0 c2i: 0x00007fe0690800cc c2iUV: 0x00007fe069080096 c2iNCI: 0x00007fe069080109
 - compiled entry     0x00007fe0690800cc
 - code size:         106
 - code start:        0x00007fe010811798
 - code end (excl):   0x00007fe010811802
 - method data:       0x00007fe010b00bb8
 - checked ex length: 0
 - linenumber start:  0x00007fe010811802
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
045     cmpl    R11, narrowklass: precise klass jdk/incubator/vector/IntVector$IntSpecies: 0x00007fdfe40e0580:Constant:exact *	# compressed klass ptr
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
067     jne     B25  P=0.000000 C=11423.000000

06d     B5: #	out( B18 B6 ) <- in( B4 )  Freq: 0.999996
06d     andnl  R10, R10, R14
072     xorl    RBX, RBX	# int
074     testl   R10, R10
077     jle     B18  P=0.000158 C=252893.000000

07d     B6: #	out( B24 B7 ) <- in( B5 )  Freq: 0.999838
        nop 	# 3 bytes pad for loops and calls
080     movl    R9, [RCX + #12 (8-bit)]	# range
084     NullCheck RCX

084     B7: #	out( B24 B8 ) <- in( B6 )  Freq: 0.999837
084     subl    R9, RAX	# int
087     incl    R9	# int
08a     testl   R9, R9
08d     jl     B24  P=0.000001 C=-1.000000

093     B8: #	out( B24 B9 ) <- in( B7 )  Freq: 0.999836
093     movl    R11, [R13 + #68 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.dummyVector (constant)
        nop 	# 9 bytes pad for loops and calls
0a0     movl    R11, [R12 + R11 << 3 + #8] (compressed oop addressing)	# compressed klass ptr
0a5     NullCheck R11

0a5     B9: #	out( B24 B10 ) <- in( B8 )  Freq: 0.999835
0a5     cmpl    R11, narrowklass: precise klass jdk/incubator/vector/Int512Vector: 0x00007fdfe42cc9c0:Constant:exact *	# compressed klass ptr
0ac     jne,u   B24  P=0.000001 C=-1.000000

0b2     B10: #	out( B24 B11 ) <- in( B9 )  Freq: 0.999834
0b2     movl    R11, [R8 + #12 (8-bit)]	# range
0b6     NullCheck R8

0b6     B11: #	out( B24 B12 ) <- in( B10 )  Freq: 0.999833
0b6     subl    R11, RAX	# int
0b9     incl    R11	# int
        nop 	# 4 bytes pad for loops and calls
0c0     testl   R11, R11
0c3     jl     B24  P=0.000001 C=-1.000000

0c9     B12: #	out( B24 B13 ) <- in( B11 )  Freq: 0.999832
0c9     movl    RDI, R14	# spill
0cc     addl    RDI, #-15	# int
0cf     testl   RDI, RDI
0d1     jl     B24  P=0.000001 C=-1.000000

0d7     B13: #	out( B14 ) <- in( B12 )  Freq: 0.999831
0d7     # castII of R11
0d7     # castII of R9
0d7     # castII of RDI
0d7     # TLS is in R15
        nop 	# 9 bytes pad for loops and calls

0e0     B14: #	out( B20 B15 ) <- in( B13 B17 ) Loop( B14-B17 inner ) Freq: 6201.27
0e0     cmpl    RBX, R9	# unsigned
0e3     jnb,u   B20  P=0.000001 C=-1.000000

0e9     B15: #	out( B21 B16 ) <- in( B14 )  Freq: 6201.26
0e9     # castII of RBX
0e9     load_vector XMM1,[RCX + #16 + RBX << #2]
0f4     cmpl    RBX, R11	# unsigned
0f7     jnb,u   B21  P=0.000001 C=-1.000000

0fd     B16: #	out( B22 B17 ) <- in( B15 )  Freq: 6201.26
0fd     vpaddd  XMM1,XMM1,[R8 + #16 + RBX << #2]	! add packedI
108     cmpl    RBX, RDI	# unsigned
10a     jnb,u   B22  P=0.000001 C=-1.000000

110     B17: #	out( B14 B18 ) <- in( B16 )  Freq: 6201.25
110     store_vector [RDX + #16 + RBX << #2],XMM1
	
11b     addl    RBX, RAX	# int
11d     movq    RSI, [R15 + #304 (32-bit)]	# ptr
124     testl   rax, [RSI]	# Safepoint: poll for GC        # App::micro_vector @ bci:76 (line 20) L[0]=XMM0 L[1]=RDX L[2]=RCX L[3]=R8 L[4]=RBX L[5]=_ L[6]=_
        # OopMap {r8=Oop rcx=Oop rdx=Oop r13=Oop xmm0=Oop off=292/0x124}
126     cmpl    RBX, R10
129     jl,s   B14  P=0.999842 C=252852.000000

12b     B18: #	out( B26 B19 ) <- in( B17 B5 )  Freq: 0.981139
12b     cmpl    RBX, R14
12e     jl     B26  P=0.000000 C=40.000000

134     B19: #	out( N317 ) <- in( B18 )  Freq: 0.981138
134     vzeroupper
	addq    rsp, 176	# Destroy frame
	popq    rbp
	cmpq     rsp, poll_offset[r15_thread] 
	ja       #safepoint_stub	# Safepoint: poll for GC

14c     ret

14d     B20: #	out( N317 ) <- in( B14 )  Freq: 0.00628362
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

190     B21: #	out( N317 ) <- in( B15 )  Freq: 0.00628361
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

1e0     B22: #	out( N317 ) <- in( B16 )  Freq: 0.0062836
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

264     B24: #	out( N317 ) <- in( B11 B12 B6 B7 B8 B9 B10 )  Freq: 7.03868e-06
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

2e0     B26: #	out( N317 ) <- in( B18 )  Freq: 4.67843e-07
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

Compiled method (c2)    7274  227             App::micro_vector (106 bytes)
 total in heap  [0x00007fe069176a90,0x00007fe0691775b0] = 2848
 relocation     [0x00007fe069176c08,0x00007fe069176ca0] = 152
 main code      [0x00007fe069176ca0,0x00007fe069177020] = 896
 stub code      [0x00007fe069177020,0x00007fe069177038] = 24
 oops           [0x00007fe069177038,0x00007fe069177048] = 16
 metadata       [0x00007fe069177048,0x00007fe0691770f8] = 176
 scopes data    [0x00007fe0691770f8,0x00007fe069177320] = 552
 scopes pcs     [0x00007fe069177320,0x00007fe069177570] = 592
 dependencies   [0x00007fe069177570,0x00007fe069177580] = 16
 nul chk table  [0x00007fe069177580,0x00007fe0691775b0] = 48

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Entry Point]
  # {method} {0x00007fe010811818} 'micro_vector' '([I[I[I)V' in 'App'
  # this:     rsi:rsi   = 'App'
  # parm0:    rdx:rdx   = '[I'
  # parm1:    rcx:rcx   = '[I'
  # parm2:    r8:r8     = '[I'
  #           [sp+0xc0]  (sp of caller)
 ;; N317: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fe069176ca0:   mov    0x8(%rsi),%r10d
  0x00007fe069176ca4:   movabs $0x800000000,%r11
  0x00007fe069176cae:   add    %r11,%r10
  0x00007fe069176cb1:   cmp    %r10,%rax
  0x00007fe069176cb4:   jne    0x00007fe069115c20           ;   {runtime_call ic_miss_stub}
  0x00007fe069176cba:   nop
  0x00007fe069176cbb:   nop
  0x00007fe069176cbc:   nop
  0x00007fe069176cbd:   nop
  0x00007fe069176cbe:   nop
  0x00007fe069176cbf:   nop
[Verified Entry Point]
 ;; B1: #	out( B27 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fe069176cc0:   mov    %eax,-0x16000(%rsp)
  0x00007fe069176cc7:   push   %rbp
  0x00007fe069176cc8:   sub    $0xb0,%rsp                   ;*synchronization entry
                                                            ; - App::micro_vector@-1 (line 15)
  0x00007fe069176ccf:   vmovq  %rsi,%xmm0
  0x00007fe069176cd4:   mov    0xc(%rdx),%r14d              ; implicit exception: dispatches to 0x00007fe069176fb8
                                                            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B2: #	out( B28 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007fe069176cd8:   mov    0xc(%rsi),%ebp               ;*getfield SPECIES {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@12 (line 20)
  0x00007fe069176cdb:   nop
  0x00007fe069176cdc:   nop
  0x00007fe069176cdd:   nop
  0x00007fe069176cde:   nop
  0x00007fe069176cdf:   nop
  0x00007fe069176ce0:   mov    0x8(%r12,%rbp,8),%r11d       ; implicit exception: dispatches to 0x00007fe069176fdc
 ;; B3: #	out( B23 B4 ) <- in( B2 )  Freq: 0.999998
  0x00007fe069176ce5:   cmp    $0x94b80,%r11d               ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
                                                            ;   {metadata('jdk/incubator/vector/IntVector$IntSpecies')}
  0x00007fe069176cec:   jne    0x00007fe069176ec8
 ;; B4: #	out( B25 B5 ) <- in( B3 )  Freq: 0.999997
  0x00007fe069176cf2:   lea    (%r12,%rbp,8),%r13           ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
  0x00007fe069176cf6:   mov    0xc(%r13),%eax               ;*getfield laneCount {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
                                                            ; - App::micro_vector@17 (line 20)
  0x00007fe069176cfa:   mov    %eax,%r10d
  0x00007fe069176cfd:   dec    %r10d
  0x00007fe069176d00:   mov    %eax,%ebp
  0x00007fe069176d02:   and    %r10d,%ebp
  0x00007fe069176d05:   test   %ebp,%ebp
  0x00007fe069176d07:   jne    0x00007fe069176f40
 ;; B5: #	out( B18 B6 ) <- in( B4 )  Freq: 0.999996
  0x00007fe069176d0d:   andn   %r14d,%r10d,%r10d
  0x00007fe069176d12:   xor    %ebx,%ebx
  0x00007fe069176d14:   test   %r10d,%r10d
  0x00007fe069176d17:   jle    0x00007fe069176dcb
 ;; B6: #	out( B24 B7 ) <- in( B5 )  Freq: 0.999838
  0x00007fe069176d1d:   nop
  0x00007fe069176d1e:   nop
  0x00007fe069176d1f:   nop
  0x00007fe069176d20:   mov    0xc(%rcx),%r9d               ; implicit exception: dispatches to 0x00007fe069176f04
 ;; B7: #	out( B24 B8 ) <- in( B6 )  Freq: 0.999837
  0x00007fe069176d24:   sub    %eax,%r9d
  0x00007fe069176d27:   inc    %r9d
  0x00007fe069176d2a:   test   %r9d,%r9d
  0x00007fe069176d2d:   jl     0x00007fe069176f04           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B8: #	out( B24 B9 ) <- in( B7 )  Freq: 0.999836
  0x00007fe069176d33:   mov    0x44(%r13),%r11d             ;*getfield dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007fe069176d37:   nop
  0x00007fe069176d38:   nop
  0x00007fe069176d39:   nop
  0x00007fe069176d3a:   nop
  0x00007fe069176d3b:   nop
  0x00007fe069176d3c:   nop
  0x00007fe069176d3d:   nop
  0x00007fe069176d3e:   nop
  0x00007fe069176d3f:   nop
  0x00007fe069176d40:   mov    0x8(%r12,%r11,8),%r11d       ; implicit exception: dispatches to 0x00007fe069176f04
 ;; B9: #	out( B24 B10 ) <- in( B8 )  Freq: 0.999835
  0x00007fe069176d45:   cmp    $0x98c90,%r11d               ;   {metadata('jdk/incubator/vector/Int512Vector')}
  0x00007fe069176d4c:   jne    0x00007fe069176f04
 ;; B10: #	out( B24 B11 ) <- in( B9 )  Freq: 0.999834
  0x00007fe069176d52:   mov    0xc(%r8),%r11d               ; implicit exception: dispatches to 0x00007fe069176f04
 ;; B11: #	out( B24 B12 ) <- in( B10 )  Freq: 0.999833
  0x00007fe069176d56:   sub    %eax,%r11d
  0x00007fe069176d59:   inc    %r11d
  0x00007fe069176d5c:   nop
  0x00007fe069176d5d:   nop
  0x00007fe069176d5e:   nop
  0x00007fe069176d5f:   nop
  0x00007fe069176d60:   test   %r11d,%r11d
  0x00007fe069176d63:   jl     0x00007fe069176f04
 ;; B12: #	out( B24 B13 ) <- in( B11 )  Freq: 0.999832
  0x00007fe069176d69:   mov    %r14d,%edi                   ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe069176d6c:   add    $0xfffffff1,%edi
  0x00007fe069176d6f:   test   %edi,%edi
  0x00007fe069176d71:   jl     0x00007fe069176f04           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@76 (line 20)
 ;; B13: #	out( B14 ) <- in( B12 )  Freq: 0.999831
  0x00007fe069176d77:   nop
  0x00007fe069176d78:   nop
  0x00007fe069176d79:   nop
  0x00007fe069176d7a:   nop
  0x00007fe069176d7b:   nop
  0x00007fe069176d7c:   nop
  0x00007fe069176d7d:   nop
  0x00007fe069176d7e:   nop
  0x00007fe069176d7f:   nop
 ;; B14: #	out( B20 B15 ) <- in( B13 B17 ) Loop( B14-B17 inner ) Freq: 6201.27
  0x00007fe069176d80:   cmp    %r9d,%ebx
  0x00007fe069176d83:   jae    0x00007fe069176ded           ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
 ;; B15: #	out( B21 B16 ) <- in( B14 )  Freq: 6201.26
  0x00007fe069176d89:   vmovdqu32 0x10(%rcx,%rbx,4),%zmm1   ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
                                                            ; - jdk.incubator.vector.Int512Vector::fromArray0@3 (line 805)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007fe069176d94:   cmp    %r11d,%ebx
  0x00007fe069176d97:   jae    0x00007fe069176e30           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B16: #	out( B22 B17 ) <- in( B15 )  Freq: 6201.26
  0x00007fe069176d9d:   vpaddd 0x10(%r8,%rbx,4),%zmm1,%zmm1 ;*invokestatic binaryOp {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
                                                            ; - jdk.incubator.vector.Int512Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int512Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector@53 (line 23)
  0x00007fe069176da8:   cmp    %edi,%ebx
  0x00007fe069176daa:   jae    0x00007fe069176e80
 ;; B17: #	out( B14 B18 ) <- in( B16 )  Freq: 6201.25
  0x00007fe069176db0:   vmovdqu32 %zmm1,0x10(%rdx,%rbx,4)   ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe069176dbb:   add    %eax,%ebx
  0x00007fe069176dbd:   mov    0x130(%r15),%rsi             ; ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop r13=Oop xmm0=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@76 (line 20)
  0x00007fe069176dc4:   test   %eax,(%rsi)                  ;   {poll}
  0x00007fe069176dc6:   cmp    %r10d,%ebx                   ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe069176dc9:   jl     0x00007fe069176d80           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@22 (line 20)
 ;; B18: #	out( B26 B19 ) <- in( B17 B5 )  Freq: 0.981139
  0x00007fe069176dcb:   cmp    %r14d,%ebx
  0x00007fe069176dce:   jl     0x00007fe069176f80
 ;; B19: #	out( N317 ) <- in( B18 )  Freq: 0.981138
  0x00007fe069176dd4:   vzeroupper 
  0x00007fe069176dd7:   add    $0xb0,%rsp
  0x00007fe069176dde:   pop    %rbp
  0x00007fe069176ddf:   cmp    0x128(%r15),%rsp             ;   {poll_return}
  0x00007fe069176de6:   ja     0x00007fe069177000
  0x00007fe069176dec:   retq   
 ;; B20: #	out( N317 ) <- in( B14 )  Freq: 0.00628362
  0x00007fe069176ded:   mov    $0xffffffe4,%esi
  0x00007fe069176df2:   vmovq  %xmm0,%rbp
  0x00007fe069176df7:   mov    %rdx,(%rsp)
  0x00007fe069176dfb:   mov    %r8,0x10(%rsp)
  0x00007fe069176e00:   mov    %rcx,0x20(%rsp)
  0x00007fe069176e05:   mov    %ebx,0x1c(%rsp)
  0x00007fe069176e09:   mov    %r9d,0x28(%rsp)
  0x00007fe069176e0e:   mov    %r13,0x30(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe069176e13:   nop
  0x00007fe069176e14:   vzeroupper 
  0x00007fe069176e17:   callq  0x00007fe0691191c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop [32]=Oop [48]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe069176e1c:   movabs $0x7fe0734377b8,%rdi         ;   {external_word}
  0x00007fe069176e26:   and    $0xfffffffffffffff0,%rsp
  0x00007fe069176e2a:   callq  0x00007fe072bfcff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe069176e2f:   hlt    
 ;; B21: #	out( N317 ) <- in( B15 )  Freq: 0.00628361
  0x00007fe069176e30:   mov    $0xffffffe4,%esi
  0x00007fe069176e35:   vmovq  %xmm0,%rbp
  0x00007fe069176e3a:   mov    %rdx,(%rsp)
  0x00007fe069176e3e:   mov    %rcx,0x8(%rsp)
  0x00007fe069176e43:   mov    %r8,0x20(%rsp)
  0x00007fe069176e48:   mov    %ebx,0x1c(%rsp)
  0x00007fe069176e4c:   mov    %r11d,0x28(%rsp)
  0x00007fe069176e51:   vmovdqu64 %zmm1,0x60(%rsp)
  0x00007fe069176e5c:   mov    %r13,0x30(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe069176e61:   nop
  0x00007fe069176e62:   nop
  0x00007fe069176e63:   nop
  0x00007fe069176e64:   vzeroupper 
  0x00007fe069176e67:   callq  0x00007fe0691191c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [32]=Oop [48]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@44 (line 22)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe069176e6c:   movabs $0x7fe0734377b8,%rdi         ;   {external_word}
  0x00007fe069176e76:   and    $0xfffffffffffffff0,%rsp
  0x00007fe069176e7a:   callq  0x00007fe072bfcff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe069176e7f:   hlt    
 ;; B22: #	out( N317 ) <- in( B16 )  Freq: 0.0062836
  0x00007fe069176e80:   mov    $0xffffffe4,%esi
  0x00007fe069176e85:   vmovq  %xmm0,%rbp
  0x00007fe069176e8a:   mov    %rcx,0x8(%rsp)
  0x00007fe069176e8f:   mov    %r8,0x10(%rsp)
  0x00007fe069176e94:   mov    %rdx,0x20(%rsp)
  0x00007fe069176e99:   mov    %ebx,0x1c(%rsp)
  0x00007fe069176e9d:   mov    %edi,0x28(%rsp)
  0x00007fe069176ea1:   vmovdqu64 %zmm1,0x60(%rsp)
  0x00007fe069176eac:   vzeroupper 
  0x00007fe069176eaf:   callq  0x00007fe0691191c0           ; ImmutableOopMap {rbp=Oop [8]=Oop [16]=Oop [32]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - App::micro_vector@59 (line 23)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe069176eb4:   movabs $0x7fe0734377b8,%rdi         ;   {external_word}
  0x00007fe069176ebe:   and    $0xfffffffffffffff0,%rsp
  0x00007fe069176ec2:   callq  0x00007fe072bfcff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe069176ec7:   hlt    
 ;; B23: #	out( N317 ) <- in( B3 )  Freq: 9.99998e-07
  0x00007fe069176ec8:   mov    $0xffffffde,%esi
  0x00007fe069176ecd:   vmovsd %xmm0,(%rsp)
  0x00007fe069176ed2:   mov    %rdx,0x8(%rsp)
  0x00007fe069176ed7:   mov    %rcx,0x10(%rsp)
  0x00007fe069176edc:   mov    %r8,0x18(%rsp)
  0x00007fe069176ee1:   mov    %r14d,0x20(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe069176ee6:   nop
  0x00007fe069176ee7:   nop
  0x00007fe069176ee8:   vzeroupper 
  0x00007fe069176eeb:   callq  0x00007fe0691191c0           ; ImmutableOopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe069176ef0:   movabs $0x7fe0734377b8,%rdi         ;   {external_word}
  0x00007fe069176efa:   and    $0xfffffffffffffff0,%rsp
  0x00007fe069176efe:   callq  0x00007fe072bfcff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe069176f03:   hlt    
 ;; B24: #	out( N317 ) <- in( B11 B12 B6 B7 B8 B9 B10 )  Freq: 7.03868e-06
  0x00007fe069176f04:   mov    $0xffffff76,%esi
  0x00007fe069176f09:   vmovq  %xmm0,%rbp
  0x00007fe069176f0e:   mov    %rdx,(%rsp)
  0x00007fe069176f12:   mov    %rcx,0x8(%rsp)
  0x00007fe069176f17:   mov    %r8,0x10(%rsp)
  0x00007fe069176f1c:   mov    %r10d,0x18(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe069176f21:   nop
  0x00007fe069176f22:   nop
  0x00007fe069176f23:   nop
  0x00007fe069176f24:   vzeroupper 
  0x00007fe069176f27:   callq  0x00007fe0691191c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@22 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe069176f2c:   movabs $0x7fe0734377b8,%rdi         ;   {external_word}
  0x00007fe069176f36:   and    $0xfffffffffffffff0,%rsp
  0x00007fe069176f3a:   callq  0x00007fe072bfcff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe069176f3f:   hlt    
 ;; B25: #	out( N317 ) <- in( B4 )  Freq: 4.99998e-07
  0x00007fe069176f40:   mov    $0xffffff45,%esi
  0x00007fe069176f45:   vmovsd %xmm0,(%rsp)
  0x00007fe069176f4a:   mov    %rdx,0x8(%rsp)
  0x00007fe069176f4f:   mov    %rcx,0x10(%rsp)
  0x00007fe069176f54:   mov    %r8,0x18(%rsp)
  0x00007fe069176f59:   mov    %eax,0x20(%rsp)
  0x00007fe069176f5d:   mov    %r14d,0x24(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe069176f62:   nop
  0x00007fe069176f63:   nop
  0x00007fe069176f64:   vzeroupper 
  0x00007fe069176f67:   callq  0x00007fe0691191c0           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*ifne {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe069176f6c:   movabs $0x7fe0734377b8,%rdi         ;   {external_word}
  0x00007fe069176f76:   and    $0xfffffffffffffff0,%rsp
  0x00007fe069176f7a:   callq  0x00007fe072bfcff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe069176f7f:   hlt    
 ;; B26: #	out( N317 ) <- in( B18 )  Freq: 4.67843e-07
  0x00007fe069176f80:   mov    $0xffffff45,%esi
  0x00007fe069176f85:   mov    %rdx,%rbp
  0x00007fe069176f88:   mov    %rcx,(%rsp)
  0x00007fe069176f8c:   mov    %r8,0x8(%rsp)
  0x00007fe069176f91:   mov    %ebx,0x14(%rsp)
  0x00007fe069176f95:   mov    %r14d,0x18(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe069176f9a:   nop
  0x00007fe069176f9b:   nop
  0x00007fe069176f9c:   vzeroupper 
  0x00007fe069176f9f:   callq  0x00007fe0691191c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@83 (line 25)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe069176fa4:   movabs $0x7fe0734377b8,%rdi         ;   {external_word}
  0x00007fe069176fae:   and    $0xfffffffffffffff0,%rsp
  0x00007fe069176fb2:   callq  0x00007fe072bfcff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe069176fb7:   hlt    
 ;; B27: #	out( N317 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007fe069176fb8:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe069176fbd:   nop
  0x00007fe069176fbe:   nop
  0x00007fe069176fbf:   nop
  0x00007fe069176fc0:   vzeroupper 
  0x00007fe069176fc3:   callq  0x00007fe0691191c0           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@16 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe069176fc8:   movabs $0x7fe0734377b8,%rdi         ;   {external_word}
  0x00007fe069176fd2:   and    $0xfffffffffffffff0,%rsp
  0x00007fe069176fd6:   callq  0x00007fe072bfcff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe069176fdb:   hlt    
 ;; B28: #	out( N317 ) <- in( B2 )  Freq: 1.01328e-06
  0x00007fe069176fdc:   mov    $0xfffffff6,%esi
  0x00007fe069176fe1:   mov    %r14d,%ebp
  0x00007fe069176fe4:   vzeroupper 
  0x00007fe069176fe7:   callq  0x00007fe0691191c0           ; ImmutableOopMap {}
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe069176fec:   movabs $0x7fe0734377b8,%rdi         ;   {external_word}
  0x00007fe069176ff6:   and    $0xfffffffffffffff0,%rsp
  0x00007fe069176ffa:   callq  0x00007fe072bfcff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe069176fff:   hlt                                 ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe069177000:   movabs $0x7fe069176ddf,%r10         ;   {internal_word}
  0x00007fe06917700a:   mov    %r10,0x3e8(%r15)
  0x00007fe069177011:   jmpq   0x00007fe069118020           ;   {runtime_call SafepointBlob}
  0x00007fe069177016:   hlt    
  0x00007fe069177017:   hlt    
  0x00007fe069177018:   hlt    
  0x00007fe069177019:   hlt    
  0x00007fe06917701a:   hlt    
  0x00007fe06917701b:   hlt    
  0x00007fe06917701c:   hlt    
  0x00007fe06917701d:   hlt    
  0x00007fe06917701e:   hlt    
  0x00007fe06917701f:   hlt    
[Exception Handler]
  0x00007fe069177020:   jmpq   0x00007fe06905cfa0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007fe069177025:   callq  0x00007fe06917702a
  0x00007fe06917702a:   subq   $0x5,(%rsp)
  0x00007fe06917702f:   jmpq   0x00007fe0691194e0           ;   {runtime_call DeoptimizationBlob}
  0x00007fe069177034:   hlt    
  0x00007fe069177035:   hlt    
  0x00007fe069177036:   hlt    
  0x00007fe069177037:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007fe069177038:   0x00000000fb000020 a 'java/lang/Class'{0x00000000fb000020} = 'jdk/incubator/vector/Int512Vector'
  0x00007fe069177040:   0x00000000fb004fd0 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x00000000fb004fd0}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007fe069177048:   0x00007fe010811818 {method} {0x00007fe010811818} 'micro_vector' '([I[I[I)V' in 'App'
  0x00007fe069177050:   0x00007fe010812d08 {method} {0x00007fe010812d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
  0x00007fe069177058:   0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fe069177060:   0x00007fe010a1e040 {method} {0x00007fe010a1e040} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fe069177068:   0x00007fe010812728 {method} {0x00007fe010812728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fe069177070:   0x00007fe010a18468 {method} {0x00007fe010a18468} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fe069177078:   0x00007fe010a1eb40 {method} {0x00007fe010a1eb40} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fe069177080:   0x0000000800098c90 'jdk/incubator/vector/Int512Vector'
  0x00007fe069177088:   0x00007fe010a84038 {method} {0x00007fe010a84038} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007fe069177090:   0x00007fe010560ca0 {method} {0x00007fe010560ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
  0x00007fe069177098:   0x00007fe010a5ac10 {method} {0x00007fe010a5ac10} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int512Vector'
  0x00007fe0691770a0:   0x00007fe010813798 {method} {0x00007fe010813798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fe0691770a8:   0x00007fe01081f8d8 {method} {0x00007fe01081f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fe0691770b0:   0x00007fe010a5c080 {method} {0x00007fe010a5c080} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int512Vector'
  0x00007fe0691770b8:   0x00007fe010a58f18 {method} {0x00007fe010a58f18} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int512Vector;' in 'jdk/incubator/vector/Int512Vector'
  0x00007fe0691770c0:   0x00007fe01081e8d8 {method} {0x00007fe01081e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fe0691770c8:   0x00007fe010a84340 {method} {0x00007fe010a84340} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007fe0691770d0:   0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
  0x00007fe0691770d8:   0x00007fe010aef250 {method} {0x00007fe010aef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fe0691770e0:   0x00007fe010aeede8 {method} {0x00007fe010aeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fe0691770e8:   0x00007fe010aeeec0 {method} {0x00007fe010aeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fe0691770f0:   0x00007fe010a11968 {method} {0x00007fe010a11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007fe069176c9f offset=ffffffff bits=0):
PcDesc(pc=0x00007fe069176ccf offset=2f bits=0):   App::micro_vector@-1 (line 15)
PcDesc(pc=0x00007fe069176cd8 offset=38 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069176cdb offset=3b bits=0):   App::micro_vector@12 (line 20)
PcDesc(pc=0x00007fe069176cec offset=4c bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069176cf6 offset=56 bits=0):   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007fe069176cfa offset=5a bits=0):   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007fe069176d33 offset=93 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069176d37 offset=97 bits=0):   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fe069176d6c offset=cc bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069176d77 offset=d7 bits=0):   App::micro_vector@76 (line 20)
PcDesc(pc=0x00007fe069176d89 offset=e9 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fe069176d94 offset=f4 bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
   jdk.incubator.vector.Int512Vector::fromArray0@3 (line 805)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fe069176d9d offset=fd bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069176da8 offset=108 bits=0):   jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
   jdk.incubator.vector.Int512Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int512Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector@53 (line 23)
PcDesc(pc=0x00007fe069176dbb offset=11b bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069176dc4 offset=124 bits=1):   App::micro_vector@76 (line 20)  reexecute=true
   Locals
    - l0: reg xmm0 [48],oop
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rbx [6],int
    - l5: empty
    - l6: empty
PcDesc(pc=0x00007fe069176dc9 offset=129 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069176dcb offset=12b bits=0):   App::micro_vector@22 (line 20)
PcDesc(pc=0x00007fe069176e13 offset=173 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069176e1c offset=17c bits=0):   java.util.Objects::checkIndex@3 (line 359)
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
PcDesc(pc=0x00007fe069176e61 offset=1c1 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069176e6c offset=1cc bits=0):   java.util.Objects::checkIndex@3 (line 359)
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
PcDesc(pc=0x00007fe069176eb4 offset=214 bits=0):   java.util.Objects::checkIndex@3 (line 359)
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
PcDesc(pc=0x00007fe069176ee6 offset=246 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069176ef0 offset=250 bits=0):   App::micro_vector@17 (line 20)
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
PcDesc(pc=0x00007fe069176f21 offset=281 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069176f2c offset=28c bits=1):   App::micro_vector@22 (line 20)  reexecute=true
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
PcDesc(pc=0x00007fe069176f62 offset=2c2 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069176f6c offset=2cc bits=1):   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
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
PcDesc(pc=0x00007fe069176f9a offset=2fa bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069176fa4 offset=304 bits=1):   App::micro_vector@83 (line 25)  reexecute=true
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
PcDesc(pc=0x00007fe069176fbd offset=31d bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069176fc8 offset=328 bits=0):   App::micro_vector@16 (line 20)
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
PcDesc(pc=0x00007fe069176fec offset=34c bits=0):   App::micro_vector@17 (line 20)
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
PcDesc(pc=0x00007fe069177000 offset=360 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe069177039 offset=399 bits=0):
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
ScopeDesc(pc=0x00007fe069176ccf offset=2f):
   App::micro_vector@-1 (line 15)
ScopeDesc(pc=0x00007fe069176cd8 offset=38):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069176cd8 offset=38):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe069176cdb offset=3b):
   App::micro_vector@12 (line 20)
ScopeDesc(pc=0x00007fe069176cec offset=4c):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069176cec offset=4c):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe069176cf6 offset=56):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007fe069176cfa offset=5a):
   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
ScopeDesc(pc=0x00007fe069176cfa offset=5a):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007fe069176d33 offset=93):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069176d33 offset=93):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe069176d37 offset=97):
   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
ScopeDesc(pc=0x00007fe069176d37 offset=97):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007fe069176d37 offset=97):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fe069176d37 offset=97):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fe069176d6c offset=cc):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069176d6c offset=cc):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe069176d77 offset=d7):
   App::micro_vector@76 (line 20)
ScopeDesc(pc=0x00007fe069176d89 offset=e9):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fe069176d89 offset=e9):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fe069176d89 offset=e9):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fe069176d89 offset=e9):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fe069176d94 offset=f4):
   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
ScopeDesc(pc=0x00007fe069176d94 offset=f4):
   jdk.incubator.vector.Int512Vector::fromArray0@3 (line 805)
ScopeDesc(pc=0x00007fe069176d94 offset=f4):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fe069176d94 offset=f4):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fe069176d9d offset=fd):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069176d9d offset=fd):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe069176da8 offset=108):
   jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
ScopeDesc(pc=0x00007fe069176da8 offset=108):
   jdk.incubator.vector.Int512Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fe069176da8 offset=108):
   jdk.incubator.vector.Int512Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fe069176da8 offset=108):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fe069176da8 offset=108):
   App::micro_vector@53 (line 23)
ScopeDesc(pc=0x00007fe069176dbb offset=11b):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069176dbb offset=11b):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe069176dc4 offset=124):
   App::micro_vector@76 (line 20)  reexecute=true
   Locals
    - l0: reg xmm0 [48],oop
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rbx [6],int
    - l5: empty
    - l6: empty
ScopeDesc(pc=0x00007fe069176dc9 offset=129):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069176dc9 offset=129):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe069176dcb offset=12b):
   App::micro_vector@22 (line 20)
ScopeDesc(pc=0x00007fe069176e13 offset=173):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069176e13 offset=173):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe069176e1c offset=17c):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007fe069176e1c offset=17c):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fe069176e1c offset=17c):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[48],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fe069176e1c offset=17c):
   App::micro_vector@32 (line 21)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[32],oop
    - l3: stack[16],oop
    - l4: stack[28]
    - l5: empty
    - l6: empty
ScopeDesc(pc=0x00007fe069176e61 offset=1c1):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069176e61 offset=1c1):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe069176e6c offset=1cc):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007fe069176e6c offset=1cc):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fe069176e6c offset=1cc):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[48],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fe069176e6c offset=1cc):
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
ScopeDesc(pc=0x00007fe069176eb4 offset=214):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007fe069176eb4 offset=214):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fe069176eb4 offset=214):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: obj[175]
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fe069176eb4 offset=214):
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
ScopeDesc(pc=0x00007fe069176ee6 offset=246):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069176ee6 offset=246):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe069176ef0 offset=250):
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
ScopeDesc(pc=0x00007fe069176f21 offset=281):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069176f21 offset=281):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe069176f2c offset=28c):
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
ScopeDesc(pc=0x00007fe069176f62 offset=2c2):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069176f62 offset=2c2):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe069176f6c offset=2cc):
   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
   Locals
    - l0: stack[36]
    - l1: stack[32]
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007fe069176f6c offset=2cc):
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   Locals
    - l0: empty
    - l1: empty
ScopeDesc(pc=0x00007fe069176f6c offset=2cc):
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
ScopeDesc(pc=0x00007fe069176f9a offset=2fa):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069176f9a offset=2fa):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe069176fa4 offset=304):
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
ScopeDesc(pc=0x00007fe069176fbd offset=31d):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069176fbd offset=31d):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe069176fc8 offset=328):
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
ScopeDesc(pc=0x00007fe069176fec offset=34c):
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
ScopeDesc(pc=0x00007fe069177000 offset=360):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe069177000 offset=360):
   App::micro_vector@59 (line 23)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007fe069176c08: 6014
relocInfo@0x00007fe069176c08 [type=6(runtime_call) addr=0x00007fe069176cb4 offset=20] | [destination=0x00007fe069115c20]
         @0x00007fe069176c0a: f003cc31
relocInfo@0x00007fe069176c0c [type=12(metadata) addr=0x00007fe069176ce5 offset=49 format=3 data=3] | [metadata_addr=0x00007fe069177058 *=0x0000000800094b80 offset=0]metadata_value=0x0000000800094b80: 'jdk/incubator/vector/IntVector$IntSpecies'
         @0x00007fe069176c0e: f008cc60
relocInfo@0x00007fe069176c10 [type=12(metadata) addr=0x00007fe069176d45 offset=96 format=3 data=8] | [metadata_addr=0x00007fe069177080 *=0x0000000800098c90 offset=0]metadata_value=0x0000000800098c90: 'jdk/incubator/vector/Int512Vector'
         @0x00007fe069176c12: a07f
relocInfo@0x00007fe069176c12 [type=10(poll) addr=0x00007fe069176dc4 offset=127]
         @0x00007fe069176c14: b01b
relocInfo@0x00007fe069176c14 [type=11(poll_return) addr=0x00007fe069176ddf offset=27]
         @0x00007fe069176c16: 6438
relocInfo@0x00007fe069176c16 [type=6(runtime_call) addr=0x00007fe069176e17 offset=56 format=1] | [destination=0x00007fe0691191c0]
         @0x00007fe069176c18: f803734377b87fe07005
relocInfo@0x00007fe069176c20 [type=7(external_word) addr=0x00007fe069176e1c offset=5 data={734377b87fe0}] | [target=0x00007fe0734377b8]
         @0x00007fe069176c22: 640e
relocInfo@0x00007fe069176c22 [type=6(runtime_call) addr=0x00007fe069176e2a offset=14 format=1] | [destination=0x00007fe072bfcff4]
         @0x00007fe069176c24: 643d
relocInfo@0x00007fe069176c24 [type=6(runtime_call) addr=0x00007fe069176e67 offset=61 format=1] | [destination=0x00007fe0691191c0]
         @0x00007fe069176c26: f803734377b87fe07005
relocInfo@0x00007fe069176c2e [type=7(external_word) addr=0x00007fe069176e6c offset=5 data={734377b87fe0}] | [target=0x00007fe0734377b8]
         @0x00007fe069176c30: 640e
relocInfo@0x00007fe069176c30 [type=6(runtime_call) addr=0x00007fe069176e7a offset=14 format=1] | [destination=0x00007fe072bfcff4]
         @0x00007fe069176c32: 6435
relocInfo@0x00007fe069176c32 [type=6(runtime_call) addr=0x00007fe069176eaf offset=53 format=1] | [destination=0x00007fe0691191c0]
         @0x00007fe069176c34: f803734377b87fe07005
relocInfo@0x00007fe069176c3c [type=7(external_word) addr=0x00007fe069176eb4 offset=5 data={734377b87fe0}] | [target=0x00007fe0734377b8]
         @0x00007fe069176c3e: 640e
relocInfo@0x00007fe069176c3e [type=6(runtime_call) addr=0x00007fe069176ec2 offset=14 format=1] | [destination=0x00007fe072bfcff4]
         @0x00007fe069176c40: 6429
relocInfo@0x00007fe069176c40 [type=6(runtime_call) addr=0x00007fe069176eeb offset=41 format=1] | [destination=0x00007fe0691191c0]
         @0x00007fe069176c42: f803734377b87fe07005
relocInfo@0x00007fe069176c4a [type=7(external_word) addr=0x00007fe069176ef0 offset=5 data={734377b87fe0}] | [target=0x00007fe0734377b8]
         @0x00007fe069176c4c: 640e
relocInfo@0x00007fe069176c4c [type=6(runtime_call) addr=0x00007fe069176efe offset=14 format=1] | [destination=0x00007fe072bfcff4]
         @0x00007fe069176c4e: 6429
relocInfo@0x00007fe069176c4e [type=6(runtime_call) addr=0x00007fe069176f27 offset=41 format=1] | [destination=0x00007fe0691191c0]
         @0x00007fe069176c50: f803734377b87fe07005
relocInfo@0x00007fe069176c58 [type=7(external_word) addr=0x00007fe069176f2c offset=5 data={734377b87fe0}] | [target=0x00007fe0734377b8]
         @0x00007fe069176c5a: 640e
relocInfo@0x00007fe069176c5a [type=6(runtime_call) addr=0x00007fe069176f3a offset=14 format=1] | [destination=0x00007fe072bfcff4]
         @0x00007fe069176c5c: 642d
relocInfo@0x00007fe069176c5c [type=6(runtime_call) addr=0x00007fe069176f67 offset=45 format=1] | [destination=0x00007fe0691191c0]
         @0x00007fe069176c5e: f803734377b87fe07005
relocInfo@0x00007fe069176c66 [type=7(external_word) addr=0x00007fe069176f6c offset=5 data={734377b87fe0}] | [target=0x00007fe0734377b8]
         @0x00007fe069176c68: 640e
relocInfo@0x00007fe069176c68 [type=6(runtime_call) addr=0x00007fe069176f7a offset=14 format=1] | [destination=0x00007fe072bfcff4]
         @0x00007fe069176c6a: 6425
relocInfo@0x00007fe069176c6a [type=6(runtime_call) addr=0x00007fe069176f9f offset=37 format=1] | [destination=0x00007fe0691191c0]
         @0x00007fe069176c6c: f803734377b87fe07005
relocInfo@0x00007fe069176c74 [type=7(external_word) addr=0x00007fe069176fa4 offset=5 data={734377b87fe0}] | [target=0x00007fe0734377b8]
         @0x00007fe069176c76: 640e
relocInfo@0x00007fe069176c76 [type=6(runtime_call) addr=0x00007fe069176fb2 offset=14 format=1] | [destination=0x00007fe072bfcff4]
         @0x00007fe069176c78: 6411
relocInfo@0x00007fe069176c78 [type=6(runtime_call) addr=0x00007fe069176fc3 offset=17 format=1] | [destination=0x00007fe0691191c0]
         @0x00007fe069176c7a: f803734377b87fe07005
relocInfo@0x00007fe069176c82 [type=7(external_word) addr=0x00007fe069176fc8 offset=5 data={734377b87fe0}] | [target=0x00007fe0734377b8]
         @0x00007fe069176c84: 640e
relocInfo@0x00007fe069176c84 [type=6(runtime_call) addr=0x00007fe069176fd6 offset=14 format=1] | [destination=0x00007fe072bfcff4]
         @0x00007fe069176c86: 6411
relocInfo@0x00007fe069176c86 [type=6(runtime_call) addr=0x00007fe069176fe7 offset=17 format=1] | [destination=0x00007fe0691191c0]
         @0x00007fe069176c88: f803734377b87fe07005
relocInfo@0x00007fe069176c90 [type=7(external_word) addr=0x00007fe069176fec offset=5 data={734377b87fe0}] | [target=0x00007fe0734377b8]
         @0x00007fe069176c92: 640e
relocInfo@0x00007fe069176c92 [type=6(runtime_call) addr=0x00007fe069176ffa offset=14 format=1] | [destination=0x00007fe072bfcff4]
         @0x00007fe069176c94: f2218006
relocInfo@0x00007fe069176c96 [type=8(internal_word) addr=0x00007fe069177000 offset=6 data=545] | [target=0x00007fe069176ddf]
         @0x00007fe069176c98: 6411
relocInfo@0x00007fe069176c98 [type=6(runtime_call) addr=0x00007fe069177011 offset=17 format=1] | [destination=0x00007fe069118020]
         @0x00007fe069176c9a: 000f
relocInfo@0x00007fe069176c9a [type=0(none) addr=0x00007fe069177020 offset=15]
         @0x00007fe069176c9c: 6400
relocInfo@0x00007fe069176c9c [type=6(runtime_call) addr=0x00007fe069177020 offset=0 format=1] | [destination=0x00007fe06905cfa0]
         @0x00007fe069176c9e: 640f
relocInfo@0x00007fe069176c9e [type=6(runtime_call) addr=0x00007fe06917702f offset=15 format=1] | [destination=0x00007fe0691194e0]
         @0x00007fe069176ca0: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fe010aef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fe010aeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fe010aeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$ImplCache
  method  = {method} {0x00007fe010a11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$ImplCache
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 5 entries, 44 bytes):
{
   < 0x00007fe069176cd4, 0x00007fe069176fb8 > < 0x00007fe069176ce0, 0x00007fe069176fdc > < 0x00007fe069176d20, 0x00007fe069176f04 > 
   < 0x00007fe069176d40, 0x00007fe069176f04 > < 0x00007fe069176d52, 0x00007fe069176f04 > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x00000000fb000020 a 'java/lang/Class'{0x00000000fb000020} = 'jdk/incubator/vector/Int512Vector'
#2: 0x00000000fb004fd0 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x00000000fb004fd0}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
# 0: 0x0000000000000000 NULL-oop
# 1: 0x00007fe010811818 {method} {0x00007fe010811818} 'micro_vector' '([I[I[I)V' in 'App'
# 2: 0x00007fe010812d08 {method} {0x00007fe010812d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
# 3: 0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
# 4: 0x00007fe010a1e040 {method} {0x00007fe010a1e040} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
# 5: 0x00007fe010812728 {method} {0x00007fe010812728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
# 6: 0x00007fe010a18468 {method} {0x00007fe010a18468} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
# 7: 0x00007fe010a1eb40 {method} {0x00007fe010a1eb40} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
# 8: 0x0000000800098c90 'jdk/incubator/vector/Int512Vector'
# 9: 0x00007fe010a84038 {method} {0x00007fe010a84038} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
#10: 0x00007fe010560ca0 {method} {0x00007fe010560ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
#11: 0x00007fe010a5ac10 {method} {0x00007fe010a5ac10} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int512Vector'
#12: 0x00007fe010813798 {method} {0x00007fe010813798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#13: 0x00007fe01081f8d8 {method} {0x00007fe01081f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#14: 0x00007fe010a5c080 {method} {0x00007fe010a5c080} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int512Vector'
#15: 0x00007fe010a58f18 {method} {0x00007fe010a58f18} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int512Vector;' in 'jdk/incubator/vector/Int512Vector'
#16: 0x00007fe01081e8d8 {method} {0x00007fe01081e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#17: 0x00007fe010a84340 {method} {0x00007fe010a84340} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
#18: 0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
#19: 0x00007fe010aef250 {method} {0x00007fe010aef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#20: 0x00007fe010aeede8 {method} {0x00007fe010aeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#21: 0x00007fe010aeeec0 {method} {0x00007fe010aeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#22: 0x00007fe010a11968 {method} {0x00007fe010a11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VECTOR : [Time] 229 ms   [Res] 99999000000000
VECTOR_MASKED : [Time] 2905 ms   [Res] 999990000000000
------------------------------------------------------------------------
App::micro_vector([I[I[I)V
  interpreter_invocation_count:       61 
  invocation_counter:              10000 
  backedge_counter:                 5095 
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
                                    'jdk/incubator/vector/IntVector$IntSpecies'(378012 1.00)
22 if_icmpge 79
  56  bci: 22   BranchData          taken(61) displacement(256)
                                    not taken(377951)
25 fast_aaccess_0
26 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
29 aload_2
30 fast_iload #4
32 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  88  bci: 32   CounterData         count(377951)
35 astore #5
37 fast_aaccess_0
38 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
41 aload_3
42 fast_iload #4
44 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  104 bci: 44   CounterData         count(377951)
47 astore #6
49 aload #5
51 aload #6
53 invokevirtual 28 <jdk/incubator/vector/IntVector.add(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;> 
  120 bci: 53   VirtualCallData     count(377951) nonprofiled_count(0) entries(0)
56 aload_1
57 fast_iload #4
59 invokevirtual 32 <jdk/incubator/vector/IntVector.intoArray([II)V> 
  176 bci: 59   VirtualCallData     count(377951) nonprofiled_count(0) entries(0)
62 fast_iload #4
64 fast_aaccess_0
65 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
68 invokeinterface 36 <jdk/incubator/vector/VectorSpecies.length()I> 
  232 bci: 68   VirtualCallData     count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/IntVector$IntSpecies'(377951 1.00)
73 iadd
74 istore #4
76 goto 9
  288 bci: 76   JumpData            taken(377951) displacement(-288)
79 fast_iload #4
81 aload_1
82 arraylength
83 if_icmpge 105
  312 bci: 83   BranchData          taken(61) displacement(56)
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
