CompileCommand: dontinline App.micro_vector bool dontinline = true
CompileCommand: print App.micro_vector bool print = true
OpenJDK 64-Bit Server VM warning: printing of assembly code is enabled; turning on DebugNonSafepoints to gain additional output
Warning:  TraceDependencies results may be inflated by VerifyDependencies
SCALAR : [Time] 12 ms   [Res] 7200000

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 187 ------------------------
{method}
 - this oop:          0x00007f8a65811818
 - method holder:     'App'
 - constants:         0x00007f8a65811090 constant pool [134]/operands[15] {0x00007f8a65811090} for 'App' cache=0x00007f8a65b00000
 - access:            0xc1000001  public 
 - name:              'micro_vector'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        7
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007f8abd00e220
 - adapters:          AHE@0x00007f8ac03b6230: 0xbbbb0000 i2c: 0x00007f8abd07f6e0 c2i: 0x00007f8abd07f7cc c2iUV: 0x00007f8abd07f796 c2iNCI: 0x00007f8abd07f809
 - compiled entry     0x00007f8abd07f7cc
 - code size:         106
 - code start:        0x00007f8a65811798
 - code end (excl):   0x00007f8a65811802
 - method data:       0x00007f8a65b00bb8
 - checked ex length: 0
 - linenumber start:  0x00007f8a65811802
 - localvar length:   0

------------------------ OptoAssembly for Compile_id = 187 -----------------------
#
#  void ( App:NotNull *, int[int:>=0]:exact *, int[int:>=0]:exact *, int[int:>=0]:exact * )
#
#r018 rsi:rsi   : parm 0: App:NotNull *
#r016 rdx:rdx   : parm 1: int[int:>=0]:exact *
#r010 rcx:rcx   : parm 2: int[int:>=0]:exact *
#r004 r8:r8   : parm 3: int[int:>=0]:exact *
# -- Old rsp -- Framesize: 128 --
#r583 rsp+124: in_preserve
#r582 rsp+120: return address
#r581 rsp+116: in_preserve
#r580 rsp+112: saved fp register
#r579 rsp+108: pad2, stack alignment
#r578 rsp+104: pad2, stack alignment
#r577 rsp+100: Fixed slot 1
#r576 rsp+96: Fixed slot 0
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
000     N497: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
000     movl    rscratch1, [j_rarg0 + oopDesc::klass_offset_in_bytes()]	# compressed klass
	decode_klass_not_null rscratch1, rscratch1
	cmpq    rax, rscratch1	 # Inline cache check
	jne     SharedRuntime::_ic_miss_stub
	nop	# nops to align entry point

        nop 	# 4 bytes pad for loops and calls

020     B1: #	out( B43 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
020     # stack bang (512 bytes)
	pushq   rbp	# Save rbp
	subq    rsp, #112	# Create frame

02c     movdq   XMM1, R8	# spill
031     movq    R14, RSI	# spill
034     movl    R13, [RDX + #12 (8-bit)]	# range
038     NullCheck RDX

038     B2: #	out( B44 B3 ) <- in( B1 )  Freq: 0.999999
038     movl    RBP, [RSI + #12 (8-bit)]	# compressed ptr ! Field: App.SPECIES
        nop 	# 5 bytes pad for loops and calls
040     movl    R11, [R12 + RBP << 3 + #8] (compressed oop addressing)	# compressed klass ptr
045     NullCheck RBP

045     B3: #	out( B39 B4 ) <- in( B2 )  Freq: 0.999998
045     cmpl    R11, narrowklass: precise klass jdk/incubator/vector/IntVector$IntSpecies: 0x00007f8a4408d450:Constant:exact *	# compressed klass ptr
04c     jne,u   B39  P=0.000001 C=-1.000000

052     B4: #	out( B42 B5 ) <- in( B3 )  Freq: 0.999997
052     decode_heap_oop_not_null R8,RBP
056     # checkcastPP of R8
056     movl    RDI, [R8 + #12 (8-bit)]	# int ! Field: jdk/incubator/vector/AbstractSpecies.laneCount (constant)
05a     movl    R10, RDI	# spill
05d     decl    R10	# int
060     movl    RBP, RDI	# spill
062     andl    RBP, R10	# int
065     testl   RBP, RBP
067     jne     B42  P=0.000000 C=7403.000000

06d     B5: #	out( B7 B6 ) <- in( B4 )  Freq: 0.999996
06d     andnl  R9, R10, R13
072     # TLS is in R15
072     xorl    RBP, RBP	# int
074     testl   R9, R9
077     jg,s   B7  P=0.500100 C=4975.000000

079     B6: #	out( B21 ) <- in( B5 )  Freq: 0.499898
079     xorl    RBX, RBX	# int
        nop 	# 5 bytes pad for loops and calls
080     jmp     B21

085     B7: #	out( B41 B8 ) <- in( B5 )  Freq: 0.500099
085     movl    R10, [RCX + #12 (8-bit)]	# range
089     NullCheck RCX

089     B8: #	out( B41 B9 ) <- in( B7 )  Freq: 0.500098
089     subl    R10, RDI	# int
08c     incl    R10	# int
08f     testl   R10, R10
092     jl     B41  P=0.000001 C=-1.000000

098     B9: #	out( B41 B10 ) <- in( B8 )  Freq: 0.500098
098     movl    R11, [R8 + #68 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.dummyVector (constant)
        nop 	# 4 bytes pad for loops and calls
0a0     movl    RBX, [R12 + R11 << 3 + #8] (compressed oop addressing)	# compressed klass ptr
0a5     NullCheck R11

0a5     B10: #	out( B41 B11 ) <- in( B9 )  Freq: 0.500097
0a5     cmpl    RBX, narrowklass: precise klass jdk/incubator/vector/Int256Vector: 0x00007f8a442a89f0:Constant:exact *	# compressed klass ptr
0ab     jne,u   B41  P=0.000001 C=-1.000000

0b1     B11: #	out( B41 B12 ) <- in( B10 )  Freq: 0.500097
0b1     movdq   R11, XMM1	# spill
0b6     movl    RAX, [R11 + #12 (8-bit)]	# range
0ba     NullCheck R11

0ba     B12: #	out( B41 B13 ) <- in( B11 )  Freq: 0.500096
0ba     subl    RAX, RDI	# int
0bc     incl    RAX	# int
        nop 	# 2 bytes pad for loops and calls
0c0     testl   RAX, RAX
0c2     jl     B41  P=0.000001 C=-1.000000

0c8     B13: #	out( B41 B14 ) <- in( B12 )  Freq: 0.500096
0c8     movl    R11, R13	# spill
0cb     addl    R11, #-7	# int
0cf     testl   R11, R11
0d2     jl     B41  P=0.000001 C=-1.000000

0d8     B14: #	out( B16 ) <- in( B13 )  Freq: 0.500095
0d8     # castII of RAX
0d8     # castII of R10
0d8     # castII of R11
0d8     xorl    RBX, RBX	# int
0da     jmp,s   B16
        nop 	# 4 bytes pad for loops and calls

0e0     B15: #	out( B16 ) <- in( B19 ) top-of-loop Freq: 0.500293
0e0     movq    RCX, RSI	# spill

0e3     B16: #	out( B36 B17 ) <- in( B14 B15 ) Loop( B16-B15 inner ) Freq: 1.00039
0e3     cmpl    RBX, R10	# unsigned
0e6     jnb,u   B36  P=0.000001 C=-1.000000

0ec     B17: #	out( B37 B18 ) <- in( B16 )  Freq: 1.00039
0ec     # castII of RBX
0ec     load_vector XMM0,[RCX + #16 + RBX << #2]
0f2     cmpl    RBX, RAX	# unsigned
0f4     jnb,u   B37  P=0.000001 C=-1.000000

0fa     B18: #	out( B38 B19 ) <- in( B17 )  Freq: 1.00039
0fa     movdq   RSI, XMM1	# spill
0ff     vpaddd  XMM0,XMM0,[RSI + #16 + RBX << #2]	! add packedI
105     cmpl    RBX, R11	# unsigned
108     jnb,u   B38  P=0.000001 C=-1.000000

10e     B19: #	out( B15 B20 ) <- in( B18 )  Freq: 1.00039
10e     movq    RSI, RCX	# spill
111     store_vector [RDX + #16 + RBX << #2],XMM0
	
117     movq    RCX, [R15 + #304 (32-bit)]	# ptr
11e     addl    RBX, RDI	# int
120     testl   rax, [RCX]	# Safepoint: poll for GC        # App::micro_vector @ bci:76 (line 20) L[0]=R14 L[1]=RDX L[2]=RSI L[3]=XMM1 L[4]=_ L[5]=_ L[6]=RBX
        # OopMap {r8=Oop rdx=Oop rsi=Oop r14=Oop xmm1=Oop off=288/0x120}
122     cmpl    RBX, R9
125     jl,s   B15  P=0.500100 C=2487.000000

127     B20: #	out( B21 ) <- in( B19 )  Freq: 0.500092
127     movq    RCX, RSI	# spill

12a     B21: #	out( B35 B22 ) <- in( B20 B6 )  Freq: 0.99999
12a     cmpl    RBX, R13
12d     jge     B35  P=0.500100 C=4975.000000

133     B22: #	out( B40 B23 ) <- in( B21 )  Freq: 0.499894
133     movl    R10, [RCX + #12 (8-bit)]	# range
137     NullCheck RCX

137     B23: #	out( B40 B24 ) <- in( B22 )  Freq: 0.499894
137     cmpl    RBX, R10	# unsigned
        nop 	# 6 bytes pad for loops and calls
140     jnb,u   B40  P=0.000001 C=-1.000000

146     B24: #	out( B40 B25 ) <- in( B23 )  Freq: 0.499893
146     movl    R11, R13	# spill
149     decl    R11	# int
14c     cmpl    R11, R10	# unsigned
14f     jnb,u   B40  P=0.000001 C=-1.000000

155     B25: #	out( B40 B26 ) <- in( B24 )  Freq: 0.499893
155     movdq   R10, XMM1	# spill
        nop 	# 6 bytes pad for loops and calls
160     movl    R8, [R10 + #12 (8-bit)]	# range
164     NullCheck R10

164     B26: #	out( B40 B27 ) <- in( B25 )  Freq: 0.499892
164     cmpl    RBX, R8	# unsigned
167     jnb,u   B40  P=0.000001 C=-1.000000

16d     B27: #	out( B40 B28 ) <- in( B26 )  Freq: 0.499892
16d     cmpl    R11, R8	# unsigned
170     jnb,u   B40  P=0.000001 C=-1.000000

176     B28: #	out( B40 B29 ) <- in( B27 )  Freq: 0.499891
176     cmpl    RBX, R13	# unsigned
179     jnb,u   B40  P=0.000001 C=-1.000000

17f     B29: #	out( B40 B30 ) <- in( B28 )  Freq: 0.499891
        nop 	# 1 bytes pad for loops and calls
180     cmpl    R11, R13	# unsigned
183     jnb,u   B40  P=0.000001 C=-1.000000

189     B30: #	out( B40 B31 ) <- in( B29 )  Freq: 0.49989
189     movl    R10, RBX	# spill
18c     incl    R10	# int
18f     decl    R10	# int
192     cmpl    R10, R13	# unsigned
195     jnb,u   B40  P=0.000001 C=-1.000000

19b     B31: #	out( B32 ) <- in( B30 )  Freq: 0.49989
19b     movl    R10, #1000	# int

1a1     B32: #	out( B33 ) <- in( B31 B34 ) Loop( B32-B34 ) Freq: 0.999579
1a1     movl    R11, R13	# spill
1a4     subl    R11, RBX	# int
1a7     cmpl    R13, RBX
1aa     cmovll R11, RBP	# signed, int
1ae     cmpl    R11, #1000	# unsigned
1b5     cmovlnbe R11, R10	# unsigned, int
1b9     addl    R11, RBX	# int

1bc     B33: #	out( B33 B34 ) <- in( B32 B33 ) Loop( B33-B33 inner  strip mined) Freq: 1.99876
1bc     movdq   R8, XMM1	# spill
1c1     movl    R8, [R8 + #16 + RBX << #2]	# int
1c6     addl    R8, [RCX + #16 + RBX << #2]	# int
1cb     movl    [RDX + #16 + RBX << #2], R8	# int
1d0     incl    RBX	# int
1d2     cmpl    RBX, R11
1d5     jl,s   B33	# loop end  P=0.499900 C=2487.000000

1d7     B34: #	out( B32 B35 ) <- in( B33 )  Freq: 0.999579
1d7     movq    R11, [R15 + #304 (32-bit)]	# ptr
1de     testl   rax, [R11]	# Safepoint: poll for GC        # App::micro_vector @ bci:102 (line 25) L[0]=_ L[1]=RDX L[2]=RCX L[3]=XMM1 L[4]=_ L[5]=_ L[6]=RBX
        # OopMap {rcx=Oop rdx=Oop xmm1=Oop off=478/0x1de}
1e1     cmpl    RBX, R13
1e4     jl,s   B32  P=0.499900 C=2487.000000

1e6     B35: #	out( N497 ) <- in( B34 B21 )  Freq: 0.999985
1e6     vzeroupper
	addq    rsp, 112	# Destroy frame
	popq    rbp
	cmpq     rsp, poll_offset[r15_thread] 
	ja       #safepoint_stub	# Safepoint: poll for GC

1fb     ret

1fc     B36: #	out( N497 ) <- in( B16 )  Freq: 1.01367e-06
1fc     movl    RSI, #-28	# int
201     movq    RBP, RDX	# spill
204     movsd   [rsp + #8], XMM1	# spill
20a     movq    [rsp + #24], RCX	# spill
20f     movl    [rsp + #20], RBX	# spill
213     movl    [rsp + #32], R10	# spill
218     movq    [rsp + #40], R14	# spill
21d     movq    [rsp + #48], R8	# spill
        nop 	# 2 bytes pad for loops and calls
224     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #20 STK[1]=rsp + #32 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2689) L[0]=rsp + #48 L[1]=rsp + #24 L[2]=_ L[3]=_
        # App::micro_vector @ bci:32 (line 21) L[0]=rsp + #40 L[1]=RBP L[2]=rsp + #24 L[3]=rsp + #8 L[4]=_ L[5]=_ L[6]=rsp + #20
        # OopMap {rbp=Oop [8]=Oop [24]=Oop [40]=Oop [48]=Oop off=556/0x22c}
22c     stop	# ShouldNotReachHere

240     B37: #	out( N497 ) <- in( B17 )  Freq: 1.01367e-06
240     movl    RSI, #-28	# int
245     movq    RBP, RDX	# spill
248     movq    [rsp + #0], RCX	# spill
24c     movsd   [rsp + #24], XMM1	# spill
252     movl    [rsp + #20], RBX	# spill
256     movq    [rsp + #32], R14	# spill
25b     movq    [rsp + #40], R8	# spill
260     movl    [rsp + #48], RAX	# spill
264     vmovdqu [rsp + 64],XMM0	# spill
        nop 	# 2 bytes pad for loops and calls
26c     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #20 STK[1]=rsp + #48 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2689) L[0]=rsp + #40 L[1]=rsp + #24 L[2]=_ L[3]=_
        # App::micro_vector @ bci:44 (line 22) L[0]=rsp + #32 L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #24 L[4]=#ScObj0 L[5]=_ L[6]=rsp + #20
        # ScObj0 jdk/incubator/vector/Int256Vector={ [payload :0]=rsp + #64 }
        # OopMap {rbp=Oop [0]=Oop [24]=Oop [32]=Oop [40]=Oop off=628/0x274}
274     stop	# ShouldNotReachHere

288     B38: #	out( N497 ) <- in( B18 )  Freq: 1.01367e-06
288     movl    RSI, #-28	# int
28d     movq    [rsp + #0], RCX	# spill
291     movsd   [rsp + #8], XMM1	# spill
297     movq    [rsp + #24], RDX	# spill
29c     movl    [rsp + #20], RBX	# spill
2a0     movq    [rsp + #32], R14	# spill
2a5     movl    [rsp + #40], R11	# spill
2aa     vmovdqu [rsp + 64],XMM0	# spill
2b0     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #20 STK[1]=rsp + #40 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:7 (line 2960) L[0]=#ScObj0 L[1]=rsp + #24 L[2]=_ L[3]=_
        # ScObj0 jdk/incubator/vector/Int256Vector={ [payload :0]=rsp + #64 }
        # App::micro_vector @ bci:59 (line 23) L[0]=rsp + #32 L[1]=rsp + #24 L[2]=rsp + #0 L[3]=rsp + #8 L[4]=_ L[5]=_ L[6]=rsp + #20
        # OopMap {[0]=Oop [8]=Oop [24]=Oop [32]=Oop off=696/0x2b8}
2b8     stop	# ShouldNotReachHere

2cc     B39: #	out( N497 ) <- in( B3 )  Freq: 9.99998e-07
2cc     movl    RSI, #-34	# int
2d1     movq    [rsp + #0], RDX	# spill
2d5     movq    [rsp + #8], RCX	# spill
2da     movq    [rsp + #16], R8	# spill
2df     movq    [rsp + #24], R14	# spill
2e4     movl    [rsp + #32], R13	# spill
        nop 	# 3 bytes pad for loops and calls
2ec     call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:17 (line 20) L[0]=rsp + #24 L[1]=rsp + #0 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=_ L[5]=_ L[6]=#0 STK[0]=#0 STK[1]=RBP STK[2]=rsp + #32
        # OopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop off=756/0x2f4}
2f4     stop	# ShouldNotReachHere

308     B40: #	out( N497 ) <- in( B30 B22 B23 B24 B28 B29 B25 B26 B27 )  Freq: 4.55877e-06
308     movl    RSI, #-138	# int
30d     movq    RBP, RDX	# spill
310     movq    [rsp + #0], RCX	# spill
314     movsd   [rsp + #8], XMM1	# spill
31a     movl    [rsp + #20], RBX	# spill
31e     movl    [rsp + #24], R13	# spill
        nop 	# 1 bytes pad for loops and calls
324     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:83 (line 25) L[0]=_ L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #8 L[4]=_ L[5]=_ L[6]=rsp + #20 STK[0]=rsp + #20 STK[1]=rsp + #24
        # OopMap {rbp=Oop [0]=Oop [8]=Oop off=812/0x32c}
32c     stop	# ShouldNotReachHere

340     B41: #	out( N497 ) <- in( B12 B13 B7 B8 B9 B10 B11 )  Freq: 3.5206e-06
340     movl    RSI, #-138	# int
345     movq    RBP, RDX	# spill
348     movq    [rsp + #0], RCX	# spill
34c     movsd   [rsp + #8], XMM1	# spill
352     movq    [rsp + #16], R14	# spill
357     movl    [rsp + #24], R9	# spill
35c     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:22 (line 20) L[0]=rsp + #16 L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #8 L[4]=_ L[5]=_ L[6]=#0 STK[0]=#0 STK[1]=rsp + #24
        # OopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop off=868/0x364}
364     stop	# ShouldNotReachHere

378     B42: #	out( N497 ) <- in( B4 )  Freq: 4.99998e-07
378     movl    RSI, #-187	# int
37d     movq    [rsp + #0], RDX	# spill
381     movq    [rsp + #8], RCX	# spill
386     movsd   [rsp + #16], XMM1	# spill
38c     movq    [rsp + #24], R14	# spill
391     movl    [rsp + #32], R13	# spill
396     movl    [rsp + #36], RDI	# spill
        nop 	# 2 bytes pad for loops and calls
39c     call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.VectorIntrinsics::roundDown @ bci:5 (line 106) L[0]=rsp + #32 L[1]=rsp + #36 STK[0]=RBP
        # jdk.incubator.vector.AbstractSpecies::loopBound @ bci:5 (line 203) L[0]=_ L[1]=_
        # App::micro_vector @ bci:17 (line 20) L[0]=rsp + #24 L[1]=rsp + #0 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=_ L[5]=_ L[6]=#0 STK[0]=#0
        # OopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop off=932/0x3a4}
3a4     stop	# ShouldNotReachHere

3b8     B43: #	out( N497 ) <- in( B1 )  Freq: 1.01328e-06
3b8     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
3c0     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:16 (line 20) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ STK[0]=_ STK[1]=_ STK[2]=#NULL
        # OopMap {off=968/0x3c8}
3c8     stop	# ShouldNotReachHere

3dc     B44: #	out( N497 ) <- in( B2 )  Freq: 1.01328e-06
3dc     movl    RSI, #-10	# int
3e1     movl    RBP, R13	# spill
3e4     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:17 (line 20) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ STK[0]=_ STK[1]=#NULL STK[2]=RBP
        # OopMap {off=1004/0x3ec}
3ec     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    1957  187             App::micro_vector (106 bytes)
 total in heap  [0x00007f8abd164c10,0x00007f8abd1658b8] = 3240
 relocation     [0x00007f8abd164d88,0x00007f8abd164e28] = 160
 main code      [0x00007f8abd164e40,0x00007f8abd165260] = 1056
 stub code      [0x00007f8abd165260,0x00007f8abd165278] = 24
 oops           [0x00007f8abd165278,0x00007f8abd165288] = 16
 metadata       [0x00007f8abd165288,0x00007f8abd165338] = 176
 scopes data    [0x00007f8abd165338,0x00007f8abd1655b8] = 640
 scopes pcs     [0x00007f8abd1655b8,0x00007f8abd165868] = 688
 dependencies   [0x00007f8abd165868,0x00007f8abd165878] = 16
 nul chk table  [0x00007f8abd165878,0x00007f8abd1658b8] = 64

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Entry Point]
  # {method} {0x00007f8a65811818} 'micro_vector' '([I[I[I)V' in 'App'
  # this:     rsi:rsi   = 'App'
  # parm0:    rdx:rdx   = '[I'
  # parm1:    rcx:rcx   = '[I'
  # parm2:    r8:r8     = '[I'
  #           [sp+0x80]  (sp of caller)
 ;; N497: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f8abd164e40:   mov    0x8(%rsi),%r10d
  0x00007f8abd164e44:   movabs $0x800000000,%r11
  0x00007f8abd164e4e:   add    %r11,%r10
  0x00007f8abd164e51:   cmp    %r10,%rax
  0x00007f8abd164e54:   jne    0x00007f8abd115920           ;   {runtime_call ic_miss_stub}
  0x00007f8abd164e5a:   nop
  0x00007f8abd164e5b:   nop
  0x00007f8abd164e5c:   nop
  0x00007f8abd164e5d:   nop
  0x00007f8abd164e5e:   nop
  0x00007f8abd164e5f:   nop
[Verified Entry Point]
 ;; B1: #	out( B43 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f8abd164e60:   mov    %eax,-0x16000(%rsp)
  0x00007f8abd164e67:   push   %rbp
  0x00007f8abd164e68:   sub    $0x70,%rsp                   ;*synchronization entry
                                                            ; - App::micro_vector@-1 (line 15)
  0x00007f8abd164e6c:   vmovq  %r8,%xmm1
  0x00007f8abd164e71:   mov    %rsi,%r14
  0x00007f8abd164e74:   mov    0xc(%rdx),%r13d              ; implicit exception: dispatches to 0x00007f8abd1651f8
                                                            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B2: #	out( B44 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007f8abd164e78:   mov    0xc(%rsi),%ebp               ;*getfield SPECIES {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@12 (line 20)
  0x00007f8abd164e7b:   nop
  0x00007f8abd164e7c:   nop
  0x00007f8abd164e7d:   nop
  0x00007f8abd164e7e:   nop
  0x00007f8abd164e7f:   nop
  0x00007f8abd164e80:   mov    0x8(%r12,%rbp,8),%r11d       ; implicit exception: dispatches to 0x00007f8abd16521c
 ;; B3: #	out( B39 B4 ) <- in( B2 )  Freq: 0.999998
  0x00007f8abd164e85:   cmp    $0x94b80,%r11d               ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
                                                            ;   {metadata('jdk/incubator/vector/IntVector$IntSpecies')}
  0x00007f8abd164e8c:   jne    0x00007f8abd16510c
 ;; B4: #	out( B42 B5 ) <- in( B3 )  Freq: 0.999997
  0x00007f8abd164e92:   lea    (%r12,%rbp,8),%r8            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
  0x00007f8abd164e96:   mov    0xc(%r8),%edi                ;*getfield laneCount {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
                                                            ; - App::micro_vector@17 (line 20)
  0x00007f8abd164e9a:   mov    %edi,%r10d
  0x00007f8abd164e9d:   dec    %r10d
  0x00007f8abd164ea0:   mov    %edi,%ebp
  0x00007f8abd164ea2:   and    %r10d,%ebp
  0x00007f8abd164ea5:   test   %ebp,%ebp
  0x00007f8abd164ea7:   jne    0x00007f8abd1651b8           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B5: #	out( B7 B6 ) <- in( B4 )  Freq: 0.999996
  0x00007f8abd164ead:   andn   %r13d,%r10d,%r9d             ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@76 (line 20)
  0x00007f8abd164eb2:   xor    %ebp,%ebp
  0x00007f8abd164eb4:   test   %r9d,%r9d
  0x00007f8abd164eb7:   jg     0x00007f8abd164ec5
 ;; B6: #	out( B21 ) <- in( B5 )  Freq: 0.499898
  0x00007f8abd164eb9:   xor    %ebx,%ebx
  0x00007f8abd164ebb:   nop
  0x00007f8abd164ebc:   nop
  0x00007f8abd164ebd:   nop
  0x00007f8abd164ebe:   nop
  0x00007f8abd164ebf:   nop
  0x00007f8abd164ec0:   jmpq   0x00007f8abd164f6a
 ;; B7: #	out( B41 B8 ) <- in( B5 )  Freq: 0.500099
  0x00007f8abd164ec5:   mov    0xc(%rcx),%r10d              ; implicit exception: dispatches to 0x00007f8abd165180
 ;; B8: #	out( B41 B9 ) <- in( B7 )  Freq: 0.500098
  0x00007f8abd164ec9:   sub    %edi,%r10d
  0x00007f8abd164ecc:   inc    %r10d
  0x00007f8abd164ecf:   test   %r10d,%r10d
  0x00007f8abd164ed2:   jl     0x00007f8abd165180           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B9: #	out( B41 B10 ) <- in( B8 )  Freq: 0.500098
  0x00007f8abd164ed8:   mov    0x44(%r8),%r11d              ;*getfield dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007f8abd164edc:   nop
  0x00007f8abd164edd:   nop
  0x00007f8abd164ede:   nop
  0x00007f8abd164edf:   nop
  0x00007f8abd164ee0:   mov    0x8(%r12,%r11,8),%ebx        ; implicit exception: dispatches to 0x00007f8abd165180
 ;; B10: #	out( B41 B11 ) <- in( B9 )  Freq: 0.500097
  0x00007f8abd164ee5:   cmp    $0x98110,%ebx                ;   {metadata('jdk/incubator/vector/Int256Vector')}
  0x00007f8abd164eeb:   jne    0x00007f8abd165180
 ;; B11: #	out( B41 B12 ) <- in( B10 )  Freq: 0.500097
  0x00007f8abd164ef1:   vmovq  %xmm1,%r11
  0x00007f8abd164ef6:   mov    0xc(%r11),%eax               ; implicit exception: dispatches to 0x00007f8abd165180
 ;; B12: #	out( B41 B13 ) <- in( B11 )  Freq: 0.500096
  0x00007f8abd164efa:   sub    %edi,%eax
  0x00007f8abd164efc:   inc    %eax
  0x00007f8abd164efe:   nop
  0x00007f8abd164eff:   nop
  0x00007f8abd164f00:   test   %eax,%eax
  0x00007f8abd164f02:   jl     0x00007f8abd165180
 ;; B13: #	out( B41 B14 ) <- in( B12 )  Freq: 0.500096
  0x00007f8abd164f08:   mov    %r13d,%r11d                  ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f8abd164f0b:   add    $0xfffffff9,%r11d
  0x00007f8abd164f0f:   test   %r11d,%r11d
  0x00007f8abd164f12:   jl     0x00007f8abd165180           ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B14: #	out( B16 ) <- in( B13 )  Freq: 0.500095
  0x00007f8abd164f18:   xor    %ebx,%ebx
  0x00007f8abd164f1a:   jmp    0x00007f8abd164f23
  0x00007f8abd164f1c:   nop
  0x00007f8abd164f1d:   nop
  0x00007f8abd164f1e:   nop
  0x00007f8abd164f1f:   nop
 ;; B15: #	out( B16 ) <- in( B19 ) top-of-loop Freq: 0.500293
  0x00007f8abd164f20:   mov    %rsi,%rcx
 ;; B16: #	out( B36 B17 ) <- in( B14 B15 ) Loop( B16-B15 inner ) Freq: 1.00039
  0x00007f8abd164f23:   cmp    %r10d,%ebx
  0x00007f8abd164f26:   jae    0x00007f8abd16503c           ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
 ;; B17: #	out( B37 B18 ) <- in( B16 )  Freq: 1.00039
  0x00007f8abd164f2c:   vmovdqu 0x10(%rcx,%rbx,4),%ymm0     ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007f8abd164f32:   cmp    %eax,%ebx
  0x00007f8abd164f34:   jae    0x00007f8abd165080
 ;; B18: #	out( B38 B19 ) <- in( B17 )  Freq: 1.00039
  0x00007f8abd164f3a:   vmovq  %xmm1,%rsi                   ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f8abd164f3f:   vpaddd 0x10(%rsi,%rbx,4),%ymm0,%ymm0;*invokestatic binaryOp {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector@53 (line 23)
  0x00007f8abd164f45:   cmp    %r11d,%ebx
  0x00007f8abd164f48:   jae    0x00007f8abd1650c8
 ;; B19: #	out( B15 B20 ) <- in( B18 )  Freq: 1.00039
  0x00007f8abd164f4e:   mov    %rcx,%rsi
  0x00007f8abd164f51:   vmovdqu %ymm0,0x10(%rdx,%rbx,4)
  0x00007f8abd164f57:   mov    0x130(%r15),%rcx             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f8abd164f5e:   add    %edi,%ebx                    ; ImmutableOopMap {r8=Oop rdx=Oop rsi=Oop r14=Oop xmm1=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@76 (line 20)
  0x00007f8abd164f60:   test   %eax,(%rcx)                  ;   {poll}
  0x00007f8abd164f62:   cmp    %r9d,%ebx
  0x00007f8abd164f65:   jl     0x00007f8abd164f20
 ;; B20: #	out( B21 ) <- in( B19 )  Freq: 0.500092
  0x00007f8abd164f67:   mov    %rsi,%rcx
 ;; B21: #	out( B35 B22 ) <- in( B20 B6 )  Freq: 0.99999
  0x00007f8abd164f6a:   cmp    %r13d,%ebx
  0x00007f8abd164f6d:   jge    0x00007f8abd165026
 ;; B22: #	out( B40 B23 ) <- in( B21 )  Freq: 0.499894
  0x00007f8abd164f73:   mov    0xc(%rcx),%r10d              ; implicit exception: dispatches to 0x00007f8abd165148
 ;; B23: #	out( B40 B24 ) <- in( B22 )  Freq: 0.499894
  0x00007f8abd164f77:   cmp    %r10d,%ebx
  0x00007f8abd164f7a:   nop
  0x00007f8abd164f7b:   nop
  0x00007f8abd164f7c:   nop
  0x00007f8abd164f7d:   nop
  0x00007f8abd164f7e:   nop
  0x00007f8abd164f7f:   nop
  0x00007f8abd164f80:   jae    0x00007f8abd165148
 ;; B24: #	out( B40 B25 ) <- in( B23 )  Freq: 0.499893
  0x00007f8abd164f86:   mov    %r13d,%r11d
  0x00007f8abd164f89:   dec    %r11d
  0x00007f8abd164f8c:   cmp    %r10d,%r11d
  0x00007f8abd164f8f:   jae    0x00007f8abd165148
 ;; B25: #	out( B40 B26 ) <- in( B24 )  Freq: 0.499893
  0x00007f8abd164f95:   vmovq  %xmm1,%r10                   ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f8abd164f9a:   nop
  0x00007f8abd164f9b:   nop
  0x00007f8abd164f9c:   nop
  0x00007f8abd164f9d:   nop
  0x00007f8abd164f9e:   nop
  0x00007f8abd164f9f:   nop
  0x00007f8abd164fa0:   mov    0xc(%r10),%r8d               ; implicit exception: dispatches to 0x00007f8abd165148
 ;; B26: #	out( B40 B27 ) <- in( B25 )  Freq: 0.499892
  0x00007f8abd164fa4:   cmp    %r8d,%ebx
  0x00007f8abd164fa7:   jae    0x00007f8abd165148
 ;; B27: #	out( B40 B28 ) <- in( B26 )  Freq: 0.499892
  0x00007f8abd164fad:   cmp    %r8d,%r11d
  0x00007f8abd164fb0:   jae    0x00007f8abd165148
 ;; B28: #	out( B40 B29 ) <- in( B27 )  Freq: 0.499891
  0x00007f8abd164fb6:   cmp    %r13d,%ebx
  0x00007f8abd164fb9:   jae    0x00007f8abd165148
 ;; B29: #	out( B40 B30 ) <- in( B28 )  Freq: 0.499891
  0x00007f8abd164fbf:   nop
  0x00007f8abd164fc0:   cmp    %r13d,%r11d
  0x00007f8abd164fc3:   jae    0x00007f8abd165148
 ;; B30: #	out( B40 B31 ) <- in( B29 )  Freq: 0.49989
  0x00007f8abd164fc9:   mov    %ebx,%r10d
  0x00007f8abd164fcc:   inc    %r10d
  0x00007f8abd164fcf:   dec    %r10d
  0x00007f8abd164fd2:   cmp    %r13d,%r10d
  0x00007f8abd164fd5:   jae    0x00007f8abd165148
 ;; B31: #	out( B32 ) <- in( B30 )  Freq: 0.49989
  0x00007f8abd164fdb:   mov    $0x3e8,%r10d
 ;; B32: #	out( B33 ) <- in( B31 B34 ) Loop( B32-B34 ) Freq: 0.999579
  0x00007f8abd164fe1:   mov    %r13d,%r11d
  0x00007f8abd164fe4:   sub    %ebx,%r11d
  0x00007f8abd164fe7:   cmp    %ebx,%r13d
  0x00007f8abd164fea:   cmovl  %ebp,%r11d
  0x00007f8abd164fee:   cmp    $0x3e8,%r11d
  0x00007f8abd164ff5:   cmova  %r10d,%r11d
  0x00007f8abd164ff9:   add    %ebx,%r11d                   ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B33: #	out( B33 B34 ) <- in( B32 B33 ) Loop( B33-B33 inner  strip mined) Freq: 1.99876
  0x00007f8abd164ffc:   vmovq  %xmm1,%r8
  0x00007f8abd165001:   mov    0x10(%r8,%rbx,4),%r8d
  0x00007f8abd165006:   add    0x10(%rcx,%rbx,4),%r8d       ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f8abd16500b:   mov    %r8d,0x10(%rdx,%rbx,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@98 (line 26)
  0x00007f8abd165010:   inc    %ebx
  0x00007f8abd165012:   cmp    %r11d,%ebx
  0x00007f8abd165015:   jl     0x00007f8abd164ffc           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@102 (line 25)
 ;; B34: #	out( B32 B35 ) <- in( B33 )  Freq: 0.999579
  0x00007f8abd165017:   mov    0x130(%r15),%r11             ; ImmutableOopMap {rcx=Oop rdx=Oop xmm1=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@102 (line 25)
  0x00007f8abd16501e:   test   %eax,(%r11)                  ;   {poll}
  0x00007f8abd165021:   cmp    %r13d,%ebx
  0x00007f8abd165024:   jl     0x00007f8abd164fe1           ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
 ;; B35: #	out( N497 ) <- in( B34 B21 )  Freq: 0.999985
  0x00007f8abd165026:   vzeroupper 
  0x00007f8abd165029:   add    $0x70,%rsp
  0x00007f8abd16502d:   pop    %rbp
  0x00007f8abd16502e:   cmp    0x128(%r15),%rsp             ;   {poll_return}
  0x00007f8abd165035:   ja     0x00007f8abd165240
  0x00007f8abd16503b:   retq   
 ;; B36: #	out( N497 ) <- in( B16 )  Freq: 1.01367e-06
  0x00007f8abd16503c:   mov    $0xffffffe4,%esi
  0x00007f8abd165041:   mov    %rdx,%rbp
  0x00007f8abd165044:   vmovsd %xmm1,0x8(%rsp)
  0x00007f8abd16504a:   mov    %rcx,0x18(%rsp)
  0x00007f8abd16504f:   mov    %ebx,0x14(%rsp)
  0x00007f8abd165053:   mov    %r10d,0x20(%rsp)
  0x00007f8abd165058:   mov    %r14,0x28(%rsp)
  0x00007f8abd16505d:   mov    %r8,0x30(%rsp)               ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f8abd165062:   nop
  0x00007f8abd165063:   nop
  0x00007f8abd165064:   vzeroupper 
  0x00007f8abd165067:   callq  0x00007f8abd116540           ; ImmutableOopMap {rbp=Oop [8]=Oop [24]=Oop [40]=Oop [48]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f8abd16506c:   movabs $0x7f8ac840f7b8,%rdi         ;   {external_word}
  0x00007f8abd165076:   and    $0xfffffffffffffff0,%rsp
  0x00007f8abd16507a:   callq  0x00007f8ac7bd4ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f8abd16507f:   hlt    
 ;; B37: #	out( N497 ) <- in( B17 )  Freq: 1.01367e-06
  0x00007f8abd165080:   mov    $0xffffffe4,%esi
  0x00007f8abd165085:   mov    %rdx,%rbp
  0x00007f8abd165088:   mov    %rcx,(%rsp)
  0x00007f8abd16508c:   vmovsd %xmm1,0x18(%rsp)
  0x00007f8abd165092:   mov    %ebx,0x14(%rsp)
  0x00007f8abd165096:   mov    %r14,0x20(%rsp)
  0x00007f8abd16509b:   mov    %r8,0x28(%rsp)
  0x00007f8abd1650a0:   mov    %eax,0x30(%rsp)
  0x00007f8abd1650a4:   vmovdqu %ymm0,0x40(%rsp)            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f8abd1650aa:   nop
  0x00007f8abd1650ab:   nop
  0x00007f8abd1650ac:   vzeroupper 
  0x00007f8abd1650af:   callq  0x00007f8abd116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [24]=Oop [32]=Oop [40]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@44 (line 22)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f8abd1650b4:   movabs $0x7f8ac840f7b8,%rdi         ;   {external_word}
  0x00007f8abd1650be:   and    $0xfffffffffffffff0,%rsp
  0x00007f8abd1650c2:   callq  0x00007f8ac7bd4ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f8abd1650c7:   hlt    
 ;; B38: #	out( N497 ) <- in( B18 )  Freq: 1.01367e-06
  0x00007f8abd1650c8:   mov    $0xffffffe4,%esi
  0x00007f8abd1650cd:   mov    %rcx,(%rsp)
  0x00007f8abd1650d1:   vmovsd %xmm1,0x8(%rsp)
  0x00007f8abd1650d7:   mov    %rdx,0x18(%rsp)
  0x00007f8abd1650dc:   mov    %ebx,0x14(%rsp)
  0x00007f8abd1650e0:   mov    %r14,0x20(%rsp)
  0x00007f8abd1650e5:   mov    %r11d,0x28(%rsp)
  0x00007f8abd1650ea:   vmovdqu %ymm0,0x40(%rsp)
  0x00007f8abd1650f0:   vzeroupper 
  0x00007f8abd1650f3:   callq  0x00007f8abd116540           ; ImmutableOopMap {[0]=Oop [8]=Oop [24]=Oop [32]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - App::micro_vector@59 (line 23)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f8abd1650f8:   movabs $0x7f8ac840f7b8,%rdi         ;   {external_word}
  0x00007f8abd165102:   and    $0xfffffffffffffff0,%rsp
  0x00007f8abd165106:   callq  0x00007f8ac7bd4ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f8abd16510b:   hlt    
 ;; B39: #	out( N497 ) <- in( B3 )  Freq: 9.99998e-07
  0x00007f8abd16510c:   mov    $0xffffffde,%esi
  0x00007f8abd165111:   mov    %rdx,(%rsp)
  0x00007f8abd165115:   mov    %rcx,0x8(%rsp)
  0x00007f8abd16511a:   mov    %r8,0x10(%rsp)
  0x00007f8abd16511f:   mov    %r14,0x18(%rsp)
  0x00007f8abd165124:   mov    %r13d,0x20(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f8abd165129:   nop
  0x00007f8abd16512a:   nop
  0x00007f8abd16512b:   nop
  0x00007f8abd16512c:   vzeroupper 
  0x00007f8abd16512f:   callq  0x00007f8abd116540           ; ImmutableOopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f8abd165134:   movabs $0x7f8ac840f7b8,%rdi         ;   {external_word}
  0x00007f8abd16513e:   and    $0xfffffffffffffff0,%rsp
  0x00007f8abd165142:   callq  0x00007f8ac7bd4ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f8abd165147:   hlt    
 ;; B40: #	out( N497 ) <- in( B30 B22 B23 B24 B28 B29 B25 B26 B27 )  Freq: 4.55877e-06
  0x00007f8abd165148:   mov    $0xffffff76,%esi
  0x00007f8abd16514d:   mov    %rdx,%rbp
  0x00007f8abd165150:   mov    %rcx,(%rsp)
  0x00007f8abd165154:   vmovsd %xmm1,0x8(%rsp)
  0x00007f8abd16515a:   mov    %ebx,0x14(%rsp)
  0x00007f8abd16515e:   mov    %r13d,0x18(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f8abd165163:   nop
  0x00007f8abd165164:   vzeroupper 
  0x00007f8abd165167:   callq  0x00007f8abd116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@83 (line 25)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f8abd16516c:   movabs $0x7f8ac840f7b8,%rdi         ;   {external_word}
  0x00007f8abd165176:   and    $0xfffffffffffffff0,%rsp
  0x00007f8abd16517a:   callq  0x00007f8ac7bd4ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f8abd16517f:   hlt    
 ;; B41: #	out( N497 ) <- in( B12 B13 B7 B8 B9 B10 B11 )  Freq: 3.5206e-06
  0x00007f8abd165180:   mov    $0xffffff76,%esi
  0x00007f8abd165185:   mov    %rdx,%rbp
  0x00007f8abd165188:   mov    %rcx,(%rsp)
  0x00007f8abd16518c:   vmovsd %xmm1,0x8(%rsp)
  0x00007f8abd165192:   mov    %r14,0x10(%rsp)
  0x00007f8abd165197:   mov    %r9d,0x18(%rsp)
  0x00007f8abd16519c:   vzeroupper 
  0x00007f8abd16519f:   callq  0x00007f8abd116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@22 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f8abd1651a4:   movabs $0x7f8ac840f7b8,%rdi         ;   {external_word}
  0x00007f8abd1651ae:   and    $0xfffffffffffffff0,%rsp
  0x00007f8abd1651b2:   callq  0x00007f8ac7bd4ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f8abd1651b7:   hlt    
 ;; B42: #	out( N497 ) <- in( B4 )  Freq: 4.99998e-07
  0x00007f8abd1651b8:   mov    $0xffffff45,%esi
  0x00007f8abd1651bd:   mov    %rdx,(%rsp)
  0x00007f8abd1651c1:   mov    %rcx,0x8(%rsp)
  0x00007f8abd1651c6:   vmovsd %xmm1,0x10(%rsp)
  0x00007f8abd1651cc:   mov    %r14,0x18(%rsp)
  0x00007f8abd1651d1:   mov    %r13d,0x20(%rsp)
  0x00007f8abd1651d6:   mov    %edi,0x24(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f8abd1651da:   nop
  0x00007f8abd1651db:   nop
  0x00007f8abd1651dc:   vzeroupper 
  0x00007f8abd1651df:   callq  0x00007f8abd116540           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*ifne {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f8abd1651e4:   movabs $0x7f8ac840f7b8,%rdi         ;   {external_word}
  0x00007f8abd1651ee:   and    $0xfffffffffffffff0,%rsp
  0x00007f8abd1651f2:   callq  0x00007f8ac7bd4ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f8abd1651f7:   hlt    
 ;; B43: #	out( N497 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007f8abd1651f8:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f8abd1651fd:   nop
  0x00007f8abd1651fe:   nop
  0x00007f8abd1651ff:   nop
  0x00007f8abd165200:   vzeroupper 
  0x00007f8abd165203:   callq  0x00007f8abd116540           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@16 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f8abd165208:   movabs $0x7f8ac840f7b8,%rdi         ;   {external_word}
  0x00007f8abd165212:   and    $0xfffffffffffffff0,%rsp
  0x00007f8abd165216:   callq  0x00007f8ac7bd4ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f8abd16521b:   hlt    
 ;; B44: #	out( N497 ) <- in( B2 )  Freq: 1.01328e-06
  0x00007f8abd16521c:   mov    $0xfffffff6,%esi
  0x00007f8abd165221:   mov    %r13d,%ebp
  0x00007f8abd165224:   vzeroupper 
  0x00007f8abd165227:   callq  0x00007f8abd116540           ; ImmutableOopMap {}
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f8abd16522c:   movabs $0x7f8ac840f7b8,%rdi         ;   {external_word}
  0x00007f8abd165236:   and    $0xfffffffffffffff0,%rsp
  0x00007f8abd16523a:   callq  0x00007f8ac7bd4ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f8abd16523f:   hlt                                 ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f8abd165240:   movabs $0x7f8abd16502e,%r10         ;   {internal_word}
  0x00007f8abd16524a:   mov    %r10,0x3e8(%r15)
  0x00007f8abd165251:   jmpq   0x00007f8abd117220           ;   {runtime_call SafepointBlob}
  0x00007f8abd165256:   hlt    
  0x00007f8abd165257:   hlt    
  0x00007f8abd165258:   hlt    
  0x00007f8abd165259:   hlt    
  0x00007f8abd16525a:   hlt    
  0x00007f8abd16525b:   hlt    
  0x00007f8abd16525c:   hlt    
  0x00007f8abd16525d:   hlt    
  0x00007f8abd16525e:   hlt    
  0x00007f8abd16525f:   hlt    
[Exception Handler]
  0x00007f8abd165260:   jmpq   0x00007f8abd05c6a0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f8abd165265:   callq  0x00007f8abd16526a
  0x00007f8abd16526a:   subq   $0x5,(%rsp)
  0x00007f8abd16526f:   jmpq   0x00007f8abd116860           ;   {runtime_call DeoptimizationBlob}
  0x00007f8abd165274:   hlt    
  0x00007f8abd165275:   hlt    
  0x00007f8abd165276:   hlt    
  0x00007f8abd165277:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007f8abd165278:   0x000000010188b2c0 a 'java/lang/Class'{0x000000010188b2c0} = 'jdk/incubator/vector/Int256Vector'
  0x00007f8abd165280:   0x000000010110de40 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de40}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007f8abd165288:   0x00007f8a65811818 {method} {0x00007f8a65811818} 'micro_vector' '([I[I[I)V' in 'App'
  0x00007f8abd165290:   0x00007f8a65812d08 {method} {0x00007f8a65812d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
  0x00007f8abd165298:   0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007f8abd1652a0:   0x00007f8a65a1e040 {method} {0x00007f8a65a1e040} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007f8abd1652a8:   0x00007f8a65812728 {method} {0x00007f8a65812728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007f8abd1652b0:   0x00007f8a65a18468 {method} {0x00007f8a65a18468} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007f8abd1652b8:   0x00007f8a65a1eb40 {method} {0x00007f8a65a1eb40} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007f8abd1652c0:   0x0000000800098110 'jdk/incubator/vector/Int256Vector'
  0x00007f8abd1652c8:   0x00007f8a65a84038 {method} {0x00007f8a65a84038} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007f8abd1652d0:   0x00007f8a65560ca0 {method} {0x00007f8a65560ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
  0x00007f8abd1652d8:   0x00007f8a65a4d2a8 {method} {0x00007f8a65a4d2a8} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007f8abd1652e0:   0x00007f8a65813798 {method} {0x00007f8a65813798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007f8abd1652e8:   0x00007f8a6581f8d8 {method} {0x00007f8a6581f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007f8abd1652f0:   0x00007f8a65a4e718 {method} {0x00007f8a65a4e718} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007f8abd1652f8:   0x00007f8a65a4b678 {method} {0x00007f8a65a4b678} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007f8abd165300:   0x00007f8a6581e8d8 {method} {0x00007f8a6581e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007f8abd165308:   0x00007f8a65a84340 {method} {0x00007f8a65a84340} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007f8abd165310:   0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
  0x00007f8abd165318:   0x00007f8a65aef250 {method} {0x00007f8a65aef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007f8abd165320:   0x00007f8a65aeede8 {method} {0x00007f8a65aeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007f8abd165328:   0x00007f8a65aeeec0 {method} {0x00007f8a65aeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007f8abd165330:   0x00007f8a65a11968 {method} {0x00007f8a65a11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007f8abd164e3f offset=ffffffff bits=0):
PcDesc(pc=0x00007f8abd164e6c offset=2c bits=0):   App::micro_vector@-1 (line 15)
PcDesc(pc=0x00007f8abd164e78 offset=38 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd164e7b offset=3b bits=0):   App::micro_vector@12 (line 20)
PcDesc(pc=0x00007f8abd164e8c offset=4c bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd164e96 offset=56 bits=0):   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007f8abd164e9a offset=5a bits=0):   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007f8abd164ead offset=6d bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd164eb2 offset=72 bits=0):   App::micro_vector@76 (line 20)
PcDesc(pc=0x00007f8abd164ed8 offset=98 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd164edc offset=9c bits=0):   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007f8abd164f0b offset=cb bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd164f18 offset=d8 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd164f2c offset=ec bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007f8abd164f32 offset=f2 bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007f8abd164f3f offset=ff bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd164f45 offset=105 bits=0):   jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector@53 (line 23)
PcDesc(pc=0x00007f8abd164f5e offset=11e bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd164f60 offset=120 bits=1):   App::micro_vector@76 (line 20)  reexecute=true
   Locals
    - l0: reg r14 [28],oop
    - l1: reg rdx [4],oop
    - l2: reg rsi [12],oop
    - l3: reg xmm1 [64],oop
    - l4: empty
    - l5: empty
    - l6: reg rbx [6],int
PcDesc(pc=0x00007f8abd164f9a offset=15a bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd164ffc offset=1bc bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007f8abd16500b offset=1cb bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd165010 offset=1d0 bits=0):   App::micro_vector@98 (line 26)
PcDesc(pc=0x00007f8abd165017 offset=1d7 bits=0):   App::micro_vector@102 (line 25)
PcDesc(pc=0x00007f8abd16501e offset=1de bits=1):   App::micro_vector@102 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg xmm1 [64],oop
    - l4: empty
    - l5: empty
    - l6: reg rbx [6],int
PcDesc(pc=0x00007f8abd165026 offset=1e6 bits=0):   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007f8abd165062 offset=222 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd16506c offset=22c bits=0):   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[20]
    - @1: stack[32]
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[48],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
   App::micro_vector@32 (line 21)
   Locals
    - l0: stack[40],oop
    - l1: reg rbp [10],oop
    - l2: stack[24],oop
    - l3: stack[8],oop
    - l4: empty
    - l5: empty
    - l6: stack[20]
PcDesc(pc=0x00007f8abd1650aa offset=26a bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd1650b4 offset=274 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[20]
    - @1: stack[48]
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[40],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
   App::micro_vector@44 (line 22)
   Locals
    - l0: stack[32],oop
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[24],oop
    - l4: obj[265]
    - l5: empty
    - l6: stack[20]
   Objects
    - 265: jdk.incubator.vector.Int256Vector stack[64]Wrong location type 7
PcDesc(pc=0x00007f8abd1650f8 offset=2b8 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[20]
    - @1: stack[40]
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: obj[216]
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
   App::micro_vector@59 (line 23)
   Locals
    - l0: stack[32],oop
    - l1: stack[24],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: empty
    - l5: empty
    - l6: stack[20]
   Objects
    - 216: jdk.incubator.vector.Int256Vector stack[64]Wrong location type 7
PcDesc(pc=0x00007f8abd165129 offset=2e9 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd165134 offset=2f4 bits=0):   App::micro_vector@17 (line 20)
   Locals
    - l0: stack[24],oop
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: empty
    - l5: empty
    - l6: 0
   Expression stack
    - @0: 0
    - @1: reg rbp [10],narrowoop
    - @2: stack[32]
PcDesc(pc=0x00007f8abd165163 offset=323 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd16516c offset=32c bits=1):   App::micro_vector@83 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: empty
    - l5: empty
    - l6: stack[20]
   Expression stack
    - @0: stack[20]
    - @1: stack[24]
PcDesc(pc=0x00007f8abd1651a4 offset=364 bits=1):   App::micro_vector@22 (line 20)  reexecute=true
   Locals
    - l0: stack[16],oop
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: empty
    - l5: empty
    - l6: 0
   Expression stack
    - @0: 0
    - @1: stack[24]
PcDesc(pc=0x00007f8abd1651da offset=39a bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd1651e4 offset=3a4 bits=1):   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
   Locals
    - l0: stack[32]
    - l1: stack[36]
   Expression stack
    - @0: reg rbp [10],int
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   Locals
    - l0: empty
    - l1: empty
   App::micro_vector@17 (line 20)
   Locals
    - l0: stack[24],oop
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: empty
    - l5: empty
    - l6: 0
   Expression stack
    - @0: 0
PcDesc(pc=0x00007f8abd1651fd offset=3bd bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd165208 offset=3c8 bits=0):   App::micro_vector@16 (line 20)
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
PcDesc(pc=0x00007f8abd16522c offset=3ec bits=0):   App::micro_vector@17 (line 20)
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
PcDesc(pc=0x00007f8abd165240 offset=400 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f8abd165279 offset=439 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 11 OopMaps

ImmutableOopMap {r8=Oop rdx=Oop rsi=Oop r14=Oop xmm1=Oop } pc offsets: 288 
ImmutableOopMap {rcx=Oop rdx=Oop xmm1=Oop } pc offsets: 478 
ImmutableOopMap {rbp=Oop [8]=Oop [24]=Oop [40]=Oop [48]=Oop } pc offsets: 556 
ImmutableOopMap {rbp=Oop [0]=Oop [24]=Oop [32]=Oop [40]=Oop } pc offsets: 628 
ImmutableOopMap {[0]=Oop [8]=Oop [24]=Oop [32]=Oop } pc offsets: 696 
ImmutableOopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop } pc offsets: 756 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop } pc offsets: 812 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop } pc offsets: 868 
ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop } pc offsets: 932 
ImmutableOopMap {} pc offsets: 968 1004 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007f8abd164e6c offset=2c):
   App::micro_vector@-1 (line 15)
ScopeDesc(pc=0x00007f8abd164e78 offset=38):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd164e78 offset=38):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd164e7b offset=3b):
   App::micro_vector@12 (line 20)
ScopeDesc(pc=0x00007f8abd164e8c offset=4c):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd164e8c offset=4c):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd164e96 offset=56):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007f8abd164e9a offset=5a):
   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
ScopeDesc(pc=0x00007f8abd164e9a offset=5a):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007f8abd164ead offset=6d):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd164ead offset=6d):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd164eb2 offset=72):
   App::micro_vector@76 (line 20)
ScopeDesc(pc=0x00007f8abd164ed8 offset=98):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd164ed8 offset=98):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd164edc offset=9c):
   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
ScopeDesc(pc=0x00007f8abd164edc offset=9c):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007f8abd164edc offset=9c):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007f8abd164edc offset=9c):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007f8abd164f0b offset=cb):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd164f0b offset=cb):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd164f18 offset=d8):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007f8abd164f18 offset=d8):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007f8abd164f18 offset=d8):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
ScopeDesc(pc=0x00007f8abd164f18 offset=d8):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd164f2c offset=ec):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007f8abd164f2c offset=ec):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007f8abd164f2c offset=ec):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007f8abd164f2c offset=ec):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007f8abd164f32 offset=f2):
   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
ScopeDesc(pc=0x00007f8abd164f32 offset=f2):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007f8abd164f32 offset=f2):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007f8abd164f32 offset=f2):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007f8abd164f3f offset=ff):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd164f3f offset=ff):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd164f45 offset=105):
   jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
ScopeDesc(pc=0x00007f8abd164f45 offset=105):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007f8abd164f45 offset=105):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007f8abd164f45 offset=105):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007f8abd164f45 offset=105):
   App::micro_vector@53 (line 23)
ScopeDesc(pc=0x00007f8abd164f5e offset=11e):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd164f5e offset=11e):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd164f60 offset=120):
   App::micro_vector@76 (line 20)  reexecute=true
   Locals
    - l0: reg r14 [28],oop
    - l1: reg rdx [4],oop
    - l2: reg rsi [12],oop
    - l3: reg xmm1 [64],oop
    - l4: empty
    - l5: empty
    - l6: reg rbx [6],int
ScopeDesc(pc=0x00007f8abd164f9a offset=15a):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd164f9a offset=15a):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd164ffc offset=1bc):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007f8abd16500b offset=1cb):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd16500b offset=1cb):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd165010 offset=1d0):
   App::micro_vector@98 (line 26)
ScopeDesc(pc=0x00007f8abd165017 offset=1d7):
   App::micro_vector@102 (line 25)
ScopeDesc(pc=0x00007f8abd16501e offset=1de):
   App::micro_vector@102 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg xmm1 [64],oop
    - l4: empty
    - l5: empty
    - l6: reg rbx [6],int
ScopeDesc(pc=0x00007f8abd165026 offset=1e6):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007f8abd165062 offset=222):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd165062 offset=222):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd16506c offset=22c):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[20]
    - @1: stack[32]
    - @2: NULL
ScopeDesc(pc=0x00007f8abd16506c offset=22c):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007f8abd16506c offset=22c):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[48],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007f8abd16506c offset=22c):
   App::micro_vector@32 (line 21)
   Locals
    - l0: stack[40],oop
    - l1: reg rbp [10],oop
    - l2: stack[24],oop
    - l3: stack[8],oop
    - l4: empty
    - l5: empty
    - l6: stack[20]
ScopeDesc(pc=0x00007f8abd1650aa offset=26a):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd1650aa offset=26a):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd1650b4 offset=274):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[20]
    - @1: stack[48]
    - @2: NULL
ScopeDesc(pc=0x00007f8abd1650b4 offset=274):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007f8abd1650b4 offset=274):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[40],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007f8abd1650b4 offset=274):
   App::micro_vector@44 (line 22)
   Locals
    - l0: stack[32],oop
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[24],oop
    - l4: obj[265]
    - l5: empty
    - l6: stack[20]
   Objects
    - 265: jdk.incubator.vector.Int256Vector stack[64]Wrong location type 7
ScopeDesc(pc=0x00007f8abd1650f8 offset=2b8):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[20]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007f8abd1650f8 offset=2b8):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007f8abd1650f8 offset=2b8):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: obj[216]
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007f8abd1650f8 offset=2b8):
   App::micro_vector@59 (line 23)
   Locals
    - l0: stack[32],oop
    - l1: stack[24],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: empty
    - l5: empty
    - l6: stack[20]
   Objects
    - 216: jdk.incubator.vector.Int256Vector stack[64]Wrong location type 7
ScopeDesc(pc=0x00007f8abd165129 offset=2e9):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd165129 offset=2e9):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd165134 offset=2f4):
   App::micro_vector@17 (line 20)
   Locals
    - l0: stack[24],oop
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: empty
    - l5: empty
    - l6: 0
   Expression stack
    - @0: 0
    - @1: reg rbp [10],narrowoop
    - @2: stack[32]
ScopeDesc(pc=0x00007f8abd165163 offset=323):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd165163 offset=323):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd16516c offset=32c):
   App::micro_vector@83 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: empty
    - l5: empty
    - l6: stack[20]
   Expression stack
    - @0: stack[20]
    - @1: stack[24]
ScopeDesc(pc=0x00007f8abd1651a4 offset=364):
   App::micro_vector@22 (line 20)  reexecute=true
   Locals
    - l0: stack[16],oop
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: empty
    - l5: empty
    - l6: 0
   Expression stack
    - @0: 0
    - @1: stack[24]
ScopeDesc(pc=0x00007f8abd1651da offset=39a):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd1651da offset=39a):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd1651e4 offset=3a4):
   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
   Locals
    - l0: stack[32]
    - l1: stack[36]
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007f8abd1651e4 offset=3a4):
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   Locals
    - l0: empty
    - l1: empty
ScopeDesc(pc=0x00007f8abd1651e4 offset=3a4):
   App::micro_vector@17 (line 20)
   Locals
    - l0: stack[24],oop
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: empty
    - l5: empty
    - l6: 0
   Expression stack
    - @0: 0
ScopeDesc(pc=0x00007f8abd1651fd offset=3bd):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd1651fd offset=3bd):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f8abd165208 offset=3c8):
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
ScopeDesc(pc=0x00007f8abd16522c offset=3ec):
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
ScopeDesc(pc=0x00007f8abd165240 offset=400):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f8abd165240 offset=400):
   App::micro_vector@59 (line 23)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007f8abd164d88: 6014
relocInfo@0x00007f8abd164d88 [type=6(runtime_call) addr=0x00007f8abd164e54 offset=20] | [destination=0x00007f8abd115920]
         @0x00007f8abd164d8a: f003cc31
relocInfo@0x00007f8abd164d8c [type=12(metadata) addr=0x00007f8abd164e85 offset=49 format=3 data=3] | [metadata_addr=0x00007f8abd165298 *=0x0000000800094b80 offset=0]metadata_value=0x0000000800094b80: 'jdk/incubator/vector/IntVector$IntSpecies'
         @0x00007f8abd164d8e: f008cc60
relocInfo@0x00007f8abd164d90 [type=12(metadata) addr=0x00007f8abd164ee5 offset=96 format=3 data=8] | [metadata_addr=0x00007f8abd1652c0 *=0x0000000800098110 offset=0]metadata_value=0x0000000800098110: 'jdk/incubator/vector/Int256Vector'
         @0x00007f8abd164d92: a07b
relocInfo@0x00007f8abd164d92 [type=10(poll) addr=0x00007f8abd164f60 offset=123]
         @0x00007f8abd164d94: a0be
relocInfo@0x00007f8abd164d94 [type=10(poll) addr=0x00007f8abd16501e offset=190]
         @0x00007f8abd164d96: b010
relocInfo@0x00007f8abd164d96 [type=11(poll_return) addr=0x00007f8abd16502e offset=16]
         @0x00007f8abd164d98: 6439
relocInfo@0x00007f8abd164d98 [type=6(runtime_call) addr=0x00007f8abd165067 offset=57 format=1] | [destination=0x00007f8abd116540]
         @0x00007f8abd164d9a: f803c840f7b87f8a7005
relocInfo@0x00007f8abd164da2 [type=7(external_word) addr=0x00007f8abd16506c offset=5 data={c840f7b87f8a}] | [target=0x00007f8ac840f7b8]
         @0x00007f8abd164da4: 640e
relocInfo@0x00007f8abd164da4 [type=6(runtime_call) addr=0x00007f8abd16507a offset=14 format=1] | [destination=0x00007f8ac7bd4ff4]
         @0x00007f8abd164da6: 6435
relocInfo@0x00007f8abd164da6 [type=6(runtime_call) addr=0x00007f8abd1650af offset=53 format=1] | [destination=0x00007f8abd116540]
         @0x00007f8abd164da8: f803c840f7b87f8a7005
relocInfo@0x00007f8abd164db0 [type=7(external_word) addr=0x00007f8abd1650b4 offset=5 data={c840f7b87f8a}] | [target=0x00007f8ac840f7b8]
         @0x00007f8abd164db2: 640e
relocInfo@0x00007f8abd164db2 [type=6(runtime_call) addr=0x00007f8abd1650c2 offset=14 format=1] | [destination=0x00007f8ac7bd4ff4]
         @0x00007f8abd164db4: 6431
relocInfo@0x00007f8abd164db4 [type=6(runtime_call) addr=0x00007f8abd1650f3 offset=49 format=1] | [destination=0x00007f8abd116540]
         @0x00007f8abd164db6: f803c840f7b87f8a7005
relocInfo@0x00007f8abd164dbe [type=7(external_word) addr=0x00007f8abd1650f8 offset=5 data={c840f7b87f8a}] | [target=0x00007f8ac840f7b8]
         @0x00007f8abd164dc0: 640e
relocInfo@0x00007f8abd164dc0 [type=6(runtime_call) addr=0x00007f8abd165106 offset=14 format=1] | [destination=0x00007f8ac7bd4ff4]
         @0x00007f8abd164dc2: 6429
relocInfo@0x00007f8abd164dc2 [type=6(runtime_call) addr=0x00007f8abd16512f offset=41 format=1] | [destination=0x00007f8abd116540]
         @0x00007f8abd164dc4: f803c840f7b87f8a7005
relocInfo@0x00007f8abd164dcc [type=7(external_word) addr=0x00007f8abd165134 offset=5 data={c840f7b87f8a}] | [target=0x00007f8ac840f7b8]
         @0x00007f8abd164dce: 640e
relocInfo@0x00007f8abd164dce [type=6(runtime_call) addr=0x00007f8abd165142 offset=14 format=1] | [destination=0x00007f8ac7bd4ff4]
         @0x00007f8abd164dd0: 6425
relocInfo@0x00007f8abd164dd0 [type=6(runtime_call) addr=0x00007f8abd165167 offset=37 format=1] | [destination=0x00007f8abd116540]
         @0x00007f8abd164dd2: f803c840f7b87f8a7005
relocInfo@0x00007f8abd164dda [type=7(external_word) addr=0x00007f8abd16516c offset=5 data={c840f7b87f8a}] | [target=0x00007f8ac840f7b8]
         @0x00007f8abd164ddc: 640e
relocInfo@0x00007f8abd164ddc [type=6(runtime_call) addr=0x00007f8abd16517a offset=14 format=1] | [destination=0x00007f8ac7bd4ff4]
         @0x00007f8abd164dde: 6425
relocInfo@0x00007f8abd164dde [type=6(runtime_call) addr=0x00007f8abd16519f offset=37 format=1] | [destination=0x00007f8abd116540]
         @0x00007f8abd164de0: f803c840f7b87f8a7005
relocInfo@0x00007f8abd164de8 [type=7(external_word) addr=0x00007f8abd1651a4 offset=5 data={c840f7b87f8a}] | [target=0x00007f8ac840f7b8]
         @0x00007f8abd164dea: 640e
relocInfo@0x00007f8abd164dea [type=6(runtime_call) addr=0x00007f8abd1651b2 offset=14 format=1] | [destination=0x00007f8ac7bd4ff4]
         @0x00007f8abd164dec: 642d
relocInfo@0x00007f8abd164dec [type=6(runtime_call) addr=0x00007f8abd1651df offset=45 format=1] | [destination=0x00007f8abd116540]
         @0x00007f8abd164dee: f803c840f7b87f8a7005
relocInfo@0x00007f8abd164df6 [type=7(external_word) addr=0x00007f8abd1651e4 offset=5 data={c840f7b87f8a}] | [target=0x00007f8ac840f7b8]
         @0x00007f8abd164df8: 640e
relocInfo@0x00007f8abd164df8 [type=6(runtime_call) addr=0x00007f8abd1651f2 offset=14 format=1] | [destination=0x00007f8ac7bd4ff4]
         @0x00007f8abd164dfa: 6411
relocInfo@0x00007f8abd164dfa [type=6(runtime_call) addr=0x00007f8abd165203 offset=17 format=1] | [destination=0x00007f8abd116540]
         @0x00007f8abd164dfc: f803c840f7b87f8a7005
relocInfo@0x00007f8abd164e04 [type=7(external_word) addr=0x00007f8abd165208 offset=5 data={c840f7b87f8a}] | [target=0x00007f8ac840f7b8]
         @0x00007f8abd164e06: 640e
relocInfo@0x00007f8abd164e06 [type=6(runtime_call) addr=0x00007f8abd165216 offset=14 format=1] | [destination=0x00007f8ac7bd4ff4]
         @0x00007f8abd164e08: 6411
relocInfo@0x00007f8abd164e08 [type=6(runtime_call) addr=0x00007f8abd165227 offset=17 format=1] | [destination=0x00007f8abd116540]
         @0x00007f8abd164e0a: f803c840f7b87f8a7005
relocInfo@0x00007f8abd164e12 [type=7(external_word) addr=0x00007f8abd16522c offset=5 data={c840f7b87f8a}] | [target=0x00007f8ac840f7b8]
         @0x00007f8abd164e14: 640e
relocInfo@0x00007f8abd164e14 [type=6(runtime_call) addr=0x00007f8abd16523a offset=14 format=1] | [destination=0x00007f8ac7bd4ff4]
         @0x00007f8abd164e16: f2128006
relocInfo@0x00007f8abd164e18 [type=8(internal_word) addr=0x00007f8abd165240 offset=6 data=530] | [target=0x00007f8abd16502e]
         @0x00007f8abd164e1a: 6411
relocInfo@0x00007f8abd164e1a [type=6(runtime_call) addr=0x00007f8abd165251 offset=17 format=1] | [destination=0x00007f8abd117220]
         @0x00007f8abd164e1c: 000f
relocInfo@0x00007f8abd164e1c [type=0(none) addr=0x00007f8abd165260 offset=15]
         @0x00007f8abd164e1e: 6400
relocInfo@0x00007f8abd164e1e [type=6(runtime_call) addr=0x00007f8abd165260 offset=0 format=1] | [destination=0x00007f8abd05c6a0]
         @0x00007f8abd164e20: 640f
relocInfo@0x00007f8abd164e20 [type=6(runtime_call) addr=0x00007f8abd16526f offset=15 format=1] | [destination=0x00007f8abd116860]
         @0x00007f8abd164e22: 0000
relocInfo@0x00007f8abd164e22 [type=0(none) addr=0x00007f8abd16526f offset=0]
         @0x00007f8abd164e24: 0000
relocInfo@0x00007f8abd164e24 [type=0(none) addr=0x00007f8abd16526f offset=0]
         @0x00007f8abd164e26: 0000
relocInfo@0x00007f8abd164e26 [type=0(none) addr=0x00007f8abd16526f offset=0]
         @0x00007f8abd164e28: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007f8a65aef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007f8a65aeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007f8a65aeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$ImplCache
  method  = {method} {0x00007f8a65a11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$ImplCache
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 7 entries, 60 bytes):
{
   < 0x00007f8abd164e74, 0x00007f8abd1651f8 > < 0x00007f8abd164e80, 0x00007f8abd16521c > < 0x00007f8abd164ec5, 0x00007f8abd165180 > 
   < 0x00007f8abd164ee0, 0x00007f8abd165180 > < 0x00007f8abd164ef6, 0x00007f8abd165180 > < 0x00007f8abd164f73, 0x00007f8abd165148 > 
   < 0x00007f8abd164fa0, 0x00007f8abd165148 > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x000000010188b2c0 a 'java/lang/Class'{0x000000010188b2c0} = 'jdk/incubator/vector/Int256Vector'
#2: 0x000000010110de40 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de40}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
# 0: 0x0000000000000000 NULL-oop
# 1: 0x00007f8a65811818 {method} {0x00007f8a65811818} 'micro_vector' '([I[I[I)V' in 'App'
# 2: 0x00007f8a65812d08 {method} {0x00007f8a65812d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
# 3: 0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
# 4: 0x00007f8a65a1e040 {method} {0x00007f8a65a1e040} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
# 5: 0x00007f8a65812728 {method} {0x00007f8a65812728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
# 6: 0x00007f8a65a18468 {method} {0x00007f8a65a18468} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
# 7: 0x00007f8a65a1eb40 {method} {0x00007f8a65a1eb40} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
# 8: 0x0000000800098110 'jdk/incubator/vector/Int256Vector'
# 9: 0x00007f8a65a84038 {method} {0x00007f8a65a84038} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
#10: 0x00007f8a65560ca0 {method} {0x00007f8a65560ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
#11: 0x00007f8a65a4d2a8 {method} {0x00007f8a65a4d2a8} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
#12: 0x00007f8a65813798 {method} {0x00007f8a65813798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#13: 0x00007f8a6581f8d8 {method} {0x00007f8a6581f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#14: 0x00007f8a65a4e718 {method} {0x00007f8a65a4e718} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
#15: 0x00007f8a65a4b678 {method} {0x00007f8a65a4b678} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
#16: 0x00007f8a6581e8d8 {method} {0x00007f8a6581e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#17: 0x00007f8a65a84340 {method} {0x00007f8a65a84340} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
#18: 0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
#19: 0x00007f8a65aef250 {method} {0x00007f8a65aef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#20: 0x00007f8a65aeede8 {method} {0x00007f8a65aeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#21: 0x00007f8a65aeeec0 {method} {0x00007f8a65aeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#22: 0x00007f8a65a11968 {method} {0x00007f8a65a11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VECTOR : [Time] 15 ms   [Res] 7200000
VECTOR_MASKED : [Time] 119 ms   [Res] 7200000
------------------------------------------------------------------------
App::micro_vector([I[I[I)V
  interpreter_invocation_count:     6535 
  invocation_counter:               5000 
  backedge_counter:                 5002 
  mdo size: 880 bytes

0 aconst_null
1 astore #4
3 aconst_null
4 astore #5
6 iconst_0
7 istore #6
9 fast_iload #6
11 fast_aaccess_0
12 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
15 aload_1
16 arraylength
17 invokeinterface 18 <jdk/incubator/vector/VectorSpecies.loopBound(I)I> 
  0   bci: 17   VirtualCallData     count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/IntVector$IntSpecies'(10870 1.00)
22 if_icmpge 79
  56  bci: 22   BranchData          taken(5435) displacement(256)
                                    not taken(5435)
25 fast_aaccess_0
26 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
29 aload_2
30 fast_iload #6
32 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  88  bci: 32   CounterData         count(5435)
35 astore #4
37 fast_aaccess_0
38 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
41 aload_3
42 fast_iload #6
44 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  104 bci: 44   CounterData         count(5435)
47 astore #5
49 aload #4
51 aload #5
53 invokevirtual 28 <jdk/incubator/vector/IntVector.add(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;> 
  120 bci: 53   VirtualCallData     count(5435) nonprofiled_count(0) entries(0)
56 aload_1
57 fast_iload #6
59 invokevirtual 32 <jdk/incubator/vector/IntVector.intoArray([II)V> 
  176 bci: 59   VirtualCallData     count(5435) nonprofiled_count(0) entries(0)
62 fast_iload #6
64 fast_aaccess_0
65 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
68 invokeinterface 36 <jdk/incubator/vector/VectorSpecies.length()I> 
  232 bci: 68   VirtualCallData     count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/IntVector$IntSpecies'(5435 1.00)
73 iadd
74 istore #6
76 goto 9
  288 bci: 76   JumpData            taken(5435) displacement(-288)
79 fast_iload #6
81 aload_1
82 arraylength
83 if_icmpge 105
  312 bci: 83   BranchData          taken(5436) displacement(56)
                                    not taken(5435)
86 aload_1
87 fast_iload #6
89 aload_2
90 fast_iload #6
92 iaload
93 aload_3
94 fast_iload #6
96 iaload
97 iadd
98 iastore
99 iinc #6 1
102 goto 79
  344 bci: 102  JumpData            taken(5435) displacement(-32)
105 return
------------------------------------------------------------------------
Total MDO size: 880 bytes
