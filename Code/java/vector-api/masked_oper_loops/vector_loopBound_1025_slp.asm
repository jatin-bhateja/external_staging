CompileCommand: dontinline App.micro_vector bool dontinline = true
CompileCommand: print App.micro_vector bool print = true
OpenJDK 64-Bit Server VM warning: printing of assembly code is enabled; turning on DebugNonSafepoints to gain additional output
Warning:  TraceDependencies results may be inflated by VerifyDependencies
SCALAR : [Time] 16 ms   [Res] 104960000000

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 198 ------------------------
{method}
 - this oop:          0x00007fe22d811818
 - method holder:     'App'
 - constants:         0x00007fe22d811090 constant pool [134]/operands[15] {0x00007fe22d811090} for 'App' cache=0x00007fe22db00000
 - access:            0xc1000001  public 
 - name:              'micro_vector'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        7
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007fe28500e220
 - adapters:          AHE@0x00007fe2883b6230: 0xbbbb0000 i2c: 0x00007fe28507f6e0 c2i: 0x00007fe28507f7cc c2iUV: 0x00007fe28507f796 c2iNCI: 0x00007fe28507f809
 - compiled entry     0x00007fe28507f7cc
 - code size:         106
 - code start:        0x00007fe22d811798
 - code end (excl):   0x00007fe22d811802
 - method data:       0x00007fe22db00bb8
 - checked ex length: 0
 - linenumber start:  0x00007fe22d811802
 - localvar length:   0

------------------------ OptoAssembly for Compile_id = 198 -----------------------
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
000     N496: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
000     movl    rscratch1, [j_rarg0 + oopDesc::klass_offset_in_bytes()]	# compressed klass
	decode_klass_not_null rscratch1, rscratch1
	cmpq    rax, rscratch1	 # Inline cache check
	jne     SharedRuntime::_ic_miss_stub
	nop	# nops to align entry point

        nop 	# 4 bytes pad for loops and calls

020     B1: #	out( B45 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
020     # stack bang (512 bytes)
	pushq   rbp	# Save rbp
	subq    rsp, #112	# Create frame

02c     movq    RDI, R8	# spill
02f     movq    R10, RCX	# spill
032     movq    RCX, RDX	# spill
035     movl    R14, [RDX + #12 (8-bit)]	# range
039     NullCheck RDX

039     B2: #	out( B46 B3 ) <- in( B1 )  Freq: 0.999999
039     movq    RAX, RSI	# spill
03c     movl    RBP, [RSI + #12 (8-bit)]	# compressed ptr ! Field: App.SPECIES
        nop 	# 1 bytes pad for loops and calls
040     movl    R11, [R12 + RBP << 3 + #8] (compressed oop addressing)	# compressed klass ptr
045     NullCheck RBP

045     B3: #	out( B37 B4 ) <- in( B2 )  Freq: 0.999998
045     cmpl    R11, narrowklass: precise klass jdk/incubator/vector/IntVector$IntSpecies: 0x00007fe20c25eca0:Constant:exact *	# compressed klass ptr
04c     jne,u   B37  P=0.000001 C=-1.000000

052     B4: #	out( B44 B5 ) <- in( B3 )  Freq: 0.999997
052     decode_heap_oop_not_null R13,RBP
056     # checkcastPP of R13
056     movl    RDX, [R13 + #12 (8-bit)]	# int ! Field: jdk/incubator/vector/AbstractSpecies.laneCount (constant)
05a     movl    R11, RDX	# spill
05d     decl    R11	# int
060     movl    RBP, RDX	# spill
062     andl    RBP, R11	# int
065     testl   RBP, RBP
067     jne     B44  P=0.000000 C=15116.000000

06d     B5: #	out( B33 B6 ) <- in( B4 )  Freq: 0.999996
06d     andnl  R11, R11, R14
072     # TLS is in R15
072     testl   R11, R11
075     jle     B33  P=0.007769 C=11842.000000

07b     B6: #	out( B40 B7 ) <- in( B5 )  Freq: 0.992228
07b     movq    R9, R10	# spill
        nop 	# 2 bytes pad for loops and calls
080     movl    R8, [R10 + #12 (8-bit)]	# range
084     NullCheck R10

084     B7: #	out( B38 B8 ) <- in( B6 )  Freq: 0.992227
084     subl    R8, RDX	# int
087     incl    R8	# int
08a     testl   R8, R8
08d     jl     B38  P=0.000001 C=-1.000000

093     B8: #	out( B39 B9 ) <- in( B7 )  Freq: 0.992226
093     movl    RBX, [R13 + #68 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.dummyVector (constant)
        nop 	# 9 bytes pad for loops and calls
0a0     movl    R10, [R12 + RBX << 3 + #8] (compressed oop addressing)	# compressed klass ptr
0a5     NullCheck RBX

0a5     B9: #	out( B42 B10 ) <- in( B8 )  Freq: 0.992225
0a5     cmpl    R10, narrowklass: precise klass jdk/incubator/vector/Int256Vector: 0x00007fe1f421eea0:Constant:exact *	# compressed klass ptr
0ac     jne,u   B42  P=0.000001 C=-1.000000

0b2     B10: #	out( B41 B11 ) <- in( B9 )  Freq: 0.992224
0b2     movq    RBX, RDI	# spill
0b5     movl    RDI, [RBX + #12 (8-bit)]	# range
0b8     NullCheck RBX

0b8     B11: #	out( B41 B12 ) <- in( B10 )  Freq: 0.992223
0b8     subl    RDI, RDX	# int
0ba     incl    RDI	# int
        nop 	# 4 bytes pad for loops and calls
0c0     testl   RDI, RDI
0c2     jl     B41  P=0.000001 C=-1.000000

0c8     B12: #	out( B41 B13 ) <- in( B11 )  Freq: 0.992222
0c8     movl    R10, R14	# spill
0cb     addl    R10, #-7	# int
0cf     testl   R10, R10
0d2     jl     B41  P=0.000001 C=-1.000000

0d8     B13: #	out( B14 ) <- in( B12 )  Freq: 0.992221
0d8     # castII of RDI
0d8     # castII of R8
0d8     # castII of R10
0d8     xorl    RBP, RBP	# int
        nop 	# 6 bytes pad for loops and calls

0e0     B14: #	out( B34 B15 ) <- in( B13 B17 ) Loop( B14-B17 inner ) Freq: 127.667
0e0     cmpl    RBP, R8	# unsigned
0e3     jnb,u   B34  P=0.000001 C=-1.000000

0e9     B15: #	out( B35 B16 ) <- in( B14 )  Freq: 127.667
0e9     # castII of RBP
0e9     load_vector XMM0,[R9 + #16 + RBP << #2]
0f0     cmpl    RBP, RDI	# unsigned
0f2     jnb,u   B35  P=0.000001 C=-1.000000

0f8     B16: #	out( B36 B17 ) <- in( B15 )  Freq: 127.667
0f8     vpaddd  XMM0,XMM0,[RBX + #16 + RBP << #2]	! add packedI
        nop 	# 2 bytes pad for loops and calls
100     cmpl    RBP, R10	# unsigned
103     jnb,u   B36  P=0.000001 C=-1.000000

109     B17: #	out( B14 B18 ) <- in( B16 )  Freq: 127.667
109     store_vector [RCX + #16 + RBP << #2],XMM0
	
10f     movq    RSI, [R15 + #304 (32-bit)]	# ptr
116     addl    RBP, RDX	# int
118     testl   rax, [RSI]	# Safepoint: poll for GC        # App::micro_vector @ bci:76 (line 20) L[0]=RAX L[1]=RCX L[2]=R9 L[3]=RBX L[4]=_ L[5]=_ L[6]=RBP
        # OopMap {r9=Oop rcx=Oop rbx=Oop rax=Oop r13=Oop off=280/0x118}
        nop 	# 6 bytes pad for loops and calls
120     cmpl    RBP, R11
123     jl,s   B14  P=0.992231 C=11749.000000

125     B18: #	out( B32 B19 ) <- in( B17 B33 )  Freq: 0.999601
125     cmpl    RBP, R14
128     jge     B32  P=0.500000 C=184.000000

12e     B19: #	out( B43 B20 ) <- in( B18 )  Freq: 0.499801
12e     movl    R10, [R9 + #12 (8-bit)]	# range
132     NullCheck R9

132     B20: #	out( B43 B21 ) <- in( B19 )  Freq: 0.4998
132     cmpl    RBP, R10	# unsigned
135     jnb,u   B43  P=0.000001 C=-1.000000

13b     B21: #	out( B43 B22 ) <- in( B20 )  Freq: 0.4998
13b     movl    R11, R14	# spill
13e     decl    R11	# int
141     cmpl    R11, R10	# unsigned
144     jnb,u   B43  P=0.000001 C=-1.000000

14a     B22: #	out( B43 B23 ) <- in( B21 )  Freq: 0.499799
14a     movl    R8, [RBX + #12 (8-bit)]	# range
14e     NullCheck RBX

14e     B23: #	out( B43 B24 ) <- in( B22 )  Freq: 0.499799
14e     cmpl    RBP, R8	# unsigned
151     jnb,u   B43  P=0.000001 C=-1.000000

157     B24: #	out( B43 B25 ) <- in( B23 )  Freq: 0.499798
157     cmpl    R11, R8	# unsigned
        nop 	# 6 bytes pad for loops and calls
160     jnb,u   B43  P=0.000001 C=-1.000000

166     B25: #	out( B43 B26 ) <- in( B24 )  Freq: 0.499798
166     cmpl    RBP, R14	# unsigned
169     jnb,u   B43  P=0.000001 C=-1.000000

16f     B26: #	out( B43 B27 ) <- in( B25 )  Freq: 0.499797
16f     cmpl    R11, R14	# unsigned
172     jnb,u   B43  P=0.000001 C=-1.000000

178     B27: #	out( B43 B28 ) <- in( B26 )  Freq: 0.499797
178     movl    R10, RBP	# spill
17b     incl    R10	# int
17e     decl    R10	# int
181     cmpl    R10, R14	# unsigned
184     jnb,u   B43  P=0.000001 C=-1.000000

18a     B28: #	out( B29 ) <- in( B27 )  Freq: 0.499796
18a     movl    R10, #1000	# int

190     B29: #	out( B30 ) <- in( B28 B31 ) Loop( B29-B31 ) Freq: 0.999592
190     movl    R11, R14	# spill
193     subl    R11, RBP	# int
196     xorl    RDI, RDI	# int
198     cmpl    R14, RBP
19b     cmovll R11, RDI	# signed, int
19f     cmpl    R11, #1000	# unsigned
1a6     cmovlnbe R11, R10	# unsigned, int
1aa     addl    R11, RBP	# int

1ad     B30: #	out( B30 B31 ) <- in( B29 B30 ) Loop( B30-B30 inner  strip mined) Freq: 1.99918
1ad     movl    R8, [RBX + #16 + RBP << #2]	# int
1b2     addl    R8, [R9 + #16 + RBP << #2]	# int
1b7     movl    [RCX + #16 + RBP << #2], R8	# int
1bc     incl    RBP	# int
        nop 	# 2 bytes pad for loops and calls
1c0     cmpl    RBP, R11
1c3     jl,s   B30	# loop end  P=0.500000 C=92.000000

1c5     B31: #	out( B29 B32 ) <- in( B30 )  Freq: 0.999592
1c5     movq    R11, [R15 + #304 (32-bit)]	# ptr
1cc     testl   rax, [R11]	# Safepoint: poll for GC        # App::micro_vector @ bci:102 (line 25) L[0]=_ L[1]=RCX L[2]=R9 L[3]=RBX L[4]=_ L[5]=_ L[6]=RBP
        # OopMap {r9=Oop rcx=Oop rbx=Oop off=460/0x1cc}
1cf     cmpl    RBP, R14
1d2     jl,s   B29  P=0.500000 C=92.000000

1d4     B32: #	out( N496 ) <- in( B31 B18 )  Freq: 0.999597
1d4     vzeroupper
	addq    rsp, 112	# Destroy frame
	popq    rbp
	cmpq     rsp, poll_offset[r15_thread] 
	ja       #safepoint_stub	# Safepoint: poll for GC

1e9     ret

1ea     B33: #	out( B18 ) <- in( B5 )  Freq: 0.00776893
1ea     xorl    RBP, RBP	# int
1ec     movq    R9, R10	# spill
1ef     movq    RBX, R8	# spill
1f2     jmp     B18

1f7     B34: #	out( N496 ) <- in( B14 )  Freq: 0.000129362
1f7     movl    RSI, #-28	# int
1fc     movq    [rsp + #0], RAX	# spill
200     movq    [rsp + #8], RCX	# spill
205     movq    [rsp + #24], RBX	# spill
20a     movq    [rsp + #32], R13	# spill
20f     movq    [rsp + #40], R9	# spill
214     movl    [rsp + #48], R8	# spill
        nop 	# 3 bytes pad for loops and calls
21c     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=RBP STK[1]=rsp + #48 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2689) L[0]=rsp + #32 L[1]=rsp + #40 L[2]=_ L[3]=_
        # App::micro_vector @ bci:32 (line 21) L[0]=rsp + #0 L[1]=rsp + #8 L[2]=rsp + #40 L[3]=rsp + #24 L[4]=_ L[5]=_ L[6]=RBP
        # OopMap {[0]=Oop [8]=Oop [24]=Oop [32]=Oop [40]=Oop off=548/0x224}
224     stop	# ShouldNotReachHere

238     B35: #	out( N496 ) <- in( B15 )  Freq: 0.000129362
238     movl    RSI, #-28	# int
23d     movq    [rsp + #0], RAX	# spill
241     movq    [rsp + #8], RCX	# spill
246     movq    [rsp + #16], R9	# spill
24b     movq    [rsp + #32], R13	# spill
250     movq    [rsp + #40], RBX	# spill
255     movl    [rsp + #48], RDI	# spill
259     vmovdqu [rsp + 64],XMM0	# spill
        nop 	# 1 bytes pad for loops and calls
260     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=RBP STK[1]=rsp + #48 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2689) L[0]=rsp + #32 L[1]=rsp + #40 L[2]=_ L[3]=_
        # App::micro_vector @ bci:44 (line 22) L[0]=rsp + #0 L[1]=rsp + #8 L[2]=rsp + #16 L[3]=rsp + #40 L[4]=#ScObj0 L[5]=_ L[6]=RBP
        # ScObj0 jdk/incubator/vector/Int256Vector={ [payload :0]=rsp + #64 }
        # OopMap {[0]=Oop [8]=Oop [16]=Oop [32]=Oop [40]=Oop off=616/0x268}
268     stop	# ShouldNotReachHere

27c     B36: #	out( N496 ) <- in( B16 )  Freq: 0.000129362
27c     movl    RSI, #-28	# int
281     movq    [rsp + #0], RAX	# spill
285     movq    [rsp + #16], R9	# spill
28a     movq    [rsp + #24], RBX	# spill
28f     movq    [rsp + #32], RCX	# spill
294     movl    [rsp + #40], R10	# spill
299     vmovdqu [rsp + 64],XMM0	# spill
        nop 	# 1 bytes pad for loops and calls
2a0     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=RBP STK[1]=rsp + #40 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:7 (line 2960) L[0]=#ScObj0 L[1]=rsp + #32 L[2]=_ L[3]=_
        # ScObj0 jdk/incubator/vector/Int256Vector={ [payload :0]=rsp + #64 }
        # App::micro_vector @ bci:59 (line 23) L[0]=rsp + #0 L[1]=rsp + #32 L[2]=rsp + #16 L[3]=rsp + #24 L[4]=_ L[5]=_ L[6]=RBP
        # OopMap {[0]=Oop [16]=Oop [24]=Oop [32]=Oop off=680/0x2a8}
2a8     stop	# ShouldNotReachHere

2bc     B37: #	out( N496 ) <- in( B3 )  Freq: 9.99998e-07
2bc     movl    RSI, #-34	# int
2c1     movq    [rsp + #0], RAX	# spill
2c5     movq    [rsp + #8], RDX	# spill
2ca     movq    [rsp + #16], R10	# spill
2cf     movq    [rsp + #24], R8	# spill
2d4     movl    [rsp + #32], R14	# spill
        nop 	# 3 bytes pad for loops and calls
2dc     call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:17 (line 20) L[0]=rsp + #0 L[1]=rsp + #8 L[2]=rsp + #16 L[3]=rsp + #24 L[4]=_ L[5]=_ L[6]=#0 STK[0]=#0 STK[1]=RBP STK[2]=rsp + #32
        # OopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop off=740/0x2e4}
2e4     stop	# ShouldNotReachHere

2f8     B38: #	out( B41 ) <- in( B7 )  Freq: 9.92227e-07
2f8     movq    RBX, RDI	# spill
2fb     jmp,s   B41

2fd     B39: #	out( B41 ) <- in( B8 )  Freq: 1.0054e-06
2fd     movq    RBX, RDI	# spill
300     jmp,s   B41

302     B40: #	out( B41 ) <- in( B6 )  Freq: 1.0054e-06
302     movq    RBX, RDI	# spill

305     B41: #	out( N496 ) <- in( B11 B12 B40 B38 B39 B42 B10 )  Freq: 6.9851e-06
305     movl    RSI, #-138	# int
30a     movq    RBP, RAX	# spill
30d     movq    [rsp + #0], RCX	# spill
311     movq    [rsp + #8], R9	# spill
316     movq    [rsp + #16], RBX	# spill
31b     movl    [rsp + #24], R11	# spill
320     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:22 (line 20) L[0]=RBP L[1]=rsp + #0 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=_ L[5]=_ L[6]=#0 STK[0]=#0 STK[1]=rsp + #24
        # OopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop off=808/0x328}
328     stop	# ShouldNotReachHere

33c     B42: #	out( B41 ) <- in( B9 )  Freq: 9.92225e-07
33c     movq    RBX, RDI	# spill
        nop 	# 1 bytes pad for loops and calls
340     jmp,s   B41

342     B43: #	out( N496 ) <- in( B27 B19 B20 B21 B25 B26 B22 B23 B24 )  Freq: 4.55792e-06
342     movl    RSI, #-138	# int
347     movq    [rsp + #0], RCX	# spill
34b     movq    [rsp + #8], R9	# spill
350     movq    [rsp + #16], RBX	# spill
355     movl    [rsp + #24], R14	# spill
        nop 	# 2 bytes pad for loops and calls
35c     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:83 (line 25) L[0]=_ L[1]=rsp + #0 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=_ L[5]=_ L[6]=RBP STK[0]=RBP STK[1]=rsp + #24
        # OopMap {[0]=Oop [8]=Oop [16]=Oop off=868/0x364}
364     stop	# ShouldNotReachHere

378     B44: #	out( N496 ) <- in( B4 )  Freq: 4.99998e-07
378     movl    RSI, #-187	# int
37d     movq    [rsp + #0], RAX	# spill
381     movq    [rsp + #8], RCX	# spill
386     movq    [rsp + #16], R10	# spill
38b     movq    [rsp + #24], R8	# spill
390     movl    [rsp + #32], R14	# spill
395     movl    [rsp + #36], RDX	# spill
        nop 	# 3 bytes pad for loops and calls
39c     call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.VectorIntrinsics::roundDown @ bci:5 (line 106) L[0]=rsp + #32 L[1]=rsp + #36 STK[0]=RBP
        # jdk.incubator.vector.AbstractSpecies::loopBound @ bci:5 (line 203) L[0]=_ L[1]=_
        # App::micro_vector @ bci:17 (line 20) L[0]=rsp + #0 L[1]=rsp + #8 L[2]=rsp + #16 L[3]=rsp + #24 L[4]=_ L[5]=_ L[6]=#0 STK[0]=#0
        # OopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop off=932/0x3a4}
3a4     stop	# ShouldNotReachHere

3b8     B45: #	out( N496 ) <- in( B1 )  Freq: 1.01328e-06
3b8     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
3c0     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:16 (line 20) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ STK[0]=_ STK[1]=_ STK[2]=#NULL
        # OopMap {off=968/0x3c8}
3c8     stop	# ShouldNotReachHere

3dc     B46: #	out( N496 ) <- in( B2 )  Freq: 1.01328e-06
3dc     movl    RSI, #-10	# int
3e1     movl    RBP, R14	# spill
3e4     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:17 (line 20) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ STK[0]=_ STK[1]=#NULL STK[2]=RBP
        # OopMap {off=1004/0x3ec}
3ec     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    2176  198             App::micro_vector (106 bytes)
 total in heap  [0x00007fe28516fa90,0x00007fe285170738] = 3240
 relocation     [0x00007fe28516fc08,0x00007fe28516fca8] = 160
 main code      [0x00007fe28516fcc0,0x00007fe2851700e0] = 1056
 stub code      [0x00007fe2851700e0,0x00007fe2851700f8] = 24
 oops           [0x00007fe2851700f8,0x00007fe285170108] = 16
 metadata       [0x00007fe285170108,0x00007fe2851701b8] = 176
 scopes data    [0x00007fe2851701b8,0x00007fe285170428] = 624
 scopes pcs     [0x00007fe285170428,0x00007fe2851706e8] = 704
 dependencies   [0x00007fe2851706e8,0x00007fe2851706f8] = 16
 nul chk table  [0x00007fe2851706f8,0x00007fe285170738] = 64

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Entry Point]
  # {method} {0x00007fe22d811818} 'micro_vector' '([I[I[I)V' in 'App'
  # this:     rsi:rsi   = 'App'
  # parm0:    rdx:rdx   = '[I'
  # parm1:    rcx:rcx   = '[I'
  # parm2:    r8:r8     = '[I'
  #           [sp+0x80]  (sp of caller)
 ;; N496: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fe28516fcc0:   mov    0x8(%rsi),%r10d
  0x00007fe28516fcc4:   movabs $0x800000000,%r11
  0x00007fe28516fcce:   add    %r11,%r10
  0x00007fe28516fcd1:   cmp    %r10,%rax
  0x00007fe28516fcd4:   jne    0x00007fe285115920           ;   {runtime_call ic_miss_stub}
  0x00007fe28516fcda:   nop
  0x00007fe28516fcdb:   nop
  0x00007fe28516fcdc:   nop
  0x00007fe28516fcdd:   nop
  0x00007fe28516fcde:   nop
  0x00007fe28516fcdf:   nop
[Verified Entry Point]
 ;; B1: #	out( B45 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fe28516fce0:   mov    %eax,-0x16000(%rsp)
  0x00007fe28516fce7:   push   %rbp
  0x00007fe28516fce8:   sub    $0x70,%rsp                   ;*synchronization entry
                                                            ; - App::micro_vector@-1 (line 15)
  0x00007fe28516fcec:   mov    %r8,%rdi
  0x00007fe28516fcef:   mov    %rcx,%r10
  0x00007fe28516fcf2:   mov    %rdx,%rcx
  0x00007fe28516fcf5:   mov    0xc(%rdx),%r14d              ; implicit exception: dispatches to 0x00007fe285170078
 ;; B2: #	out( B46 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007fe28516fcf9:   mov    %rsi,%rax                    ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe28516fcfc:   mov    0xc(%rsi),%ebp               ;*getfield SPECIES {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@12 (line 20)
  0x00007fe28516fcff:   nop
  0x00007fe28516fd00:   mov    0x8(%r12,%rbp,8),%r11d       ; implicit exception: dispatches to 0x00007fe28517009c
 ;; B3: #	out( B37 B4 ) <- in( B2 )  Freq: 0.999998
  0x00007fe28516fd05:   cmp    $0x94b80,%r11d               ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
                                                            ;   {metadata('jdk/incubator/vector/IntVector$IntSpecies')}
  0x00007fe28516fd0c:   jne    0x00007fe28516ff7c
 ;; B4: #	out( B44 B5 ) <- in( B3 )  Freq: 0.999997
  0x00007fe28516fd12:   lea    (%r12,%rbp,8),%r13           ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
  0x00007fe28516fd16:   mov    0xc(%r13),%edx               ;*getfield laneCount {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
                                                            ; - App::micro_vector@17 (line 20)
  0x00007fe28516fd1a:   mov    %edx,%r11d
  0x00007fe28516fd1d:   dec    %r11d
  0x00007fe28516fd20:   mov    %edx,%ebp
  0x00007fe28516fd22:   and    %r11d,%ebp
  0x00007fe28516fd25:   test   %ebp,%ebp
  0x00007fe28516fd27:   jne    0x00007fe285170038           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B5: #	out( B33 B6 ) <- in( B4 )  Freq: 0.999996
  0x00007fe28516fd2d:   andn   %r14d,%r11d,%r11d            ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@76 (line 20)
  0x00007fe28516fd32:   test   %r11d,%r11d
  0x00007fe28516fd35:   jle    0x00007fe28516feaa
 ;; B6: #	out( B40 B7 ) <- in( B5 )  Freq: 0.992228
  0x00007fe28516fd3b:   mov    %r10,%r9
  0x00007fe28516fd3e:   nop
  0x00007fe28516fd3f:   nop
  0x00007fe28516fd40:   mov    0xc(%r10),%r8d               ; implicit exception: dispatches to 0x00007fe28516ffc2
 ;; B7: #	out( B38 B8 ) <- in( B6 )  Freq: 0.992227
  0x00007fe28516fd44:   sub    %edx,%r8d
  0x00007fe28516fd47:   inc    %r8d
  0x00007fe28516fd4a:   test   %r8d,%r8d
  0x00007fe28516fd4d:   jl     0x00007fe28516ffb8           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B8: #	out( B39 B9 ) <- in( B7 )  Freq: 0.992226
  0x00007fe28516fd53:   mov    0x44(%r13),%ebx              ;*getfield dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007fe28516fd57:   nop
  0x00007fe28516fd58:   nop
  0x00007fe28516fd59:   nop
  0x00007fe28516fd5a:   nop
  0x00007fe28516fd5b:   nop
  0x00007fe28516fd5c:   nop
  0x00007fe28516fd5d:   nop
  0x00007fe28516fd5e:   nop
  0x00007fe28516fd5f:   nop
  0x00007fe28516fd60:   mov    0x8(%r12,%rbx,8),%r10d       ; implicit exception: dispatches to 0x00007fe28516ffbd
 ;; B9: #	out( B42 B10 ) <- in( B8 )  Freq: 0.992225
  0x00007fe28516fd65:   cmp    $0x98110,%r10d               ;   {metadata('jdk/incubator/vector/Int256Vector')}
  0x00007fe28516fd6c:   jne    0x00007fe28516fffc
 ;; B10: #	out( B41 B11 ) <- in( B9 )  Freq: 0.992224
  0x00007fe28516fd72:   mov    %rdi,%rbx
  0x00007fe28516fd75:   mov    0xc(%rbx),%edi               ; implicit exception: dispatches to 0x00007fe28516ffc5
 ;; B11: #	out( B41 B12 ) <- in( B10 )  Freq: 0.992223
  0x00007fe28516fd78:   sub    %edx,%edi
  0x00007fe28516fd7a:   inc    %edi
  0x00007fe28516fd7c:   nop
  0x00007fe28516fd7d:   nop
  0x00007fe28516fd7e:   nop
  0x00007fe28516fd7f:   nop
  0x00007fe28516fd80:   test   %edi,%edi
  0x00007fe28516fd82:   jl     0x00007fe28516ffc5
 ;; B12: #	out( B41 B13 ) <- in( B11 )  Freq: 0.992222
  0x00007fe28516fd88:   mov    %r14d,%r10d                  ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe28516fd8b:   add    $0xfffffff9,%r10d
  0x00007fe28516fd8f:   test   %r10d,%r10d
  0x00007fe28516fd92:   jl     0x00007fe28516ffc5           ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B13: #	out( B14 ) <- in( B12 )  Freq: 0.992221
  0x00007fe28516fd98:   xor    %ebp,%ebp
  0x00007fe28516fd9a:   nop
  0x00007fe28516fd9b:   nop
  0x00007fe28516fd9c:   nop
  0x00007fe28516fd9d:   nop
  0x00007fe28516fd9e:   nop
  0x00007fe28516fd9f:   nop
 ;; B14: #	out( B34 B15 ) <- in( B13 B17 ) Loop( B14-B17 inner ) Freq: 127.667
  0x00007fe28516fda0:   cmp    %r8d,%ebp
  0x00007fe28516fda3:   jae    0x00007fe28516feb7           ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
 ;; B15: #	out( B35 B16 ) <- in( B14 )  Freq: 127.667
  0x00007fe28516fda9:   vmovdqu 0x10(%r9,%rbp,4),%ymm0      ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007fe28516fdb0:   cmp    %edi,%ebp
  0x00007fe28516fdb2:   jae    0x00007fe28516fef8           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B16: #	out( B36 B17 ) <- in( B15 )  Freq: 127.667
  0x00007fe28516fdb8:   vpaddd 0x10(%rbx,%rbp,4),%ymm0,%ymm0;*invokestatic binaryOp {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector@53 (line 23)
  0x00007fe28516fdbe:   nop
  0x00007fe28516fdbf:   nop
  0x00007fe28516fdc0:   cmp    %r10d,%ebp
  0x00007fe28516fdc3:   jae    0x00007fe28516ff3c
 ;; B17: #	out( B14 B18 ) <- in( B16 )  Freq: 127.667
  0x00007fe28516fdc9:   vmovdqu %ymm0,0x10(%rcx,%rbp,4)
  0x00007fe28516fdcf:   mov    0x130(%r15),%rsi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe28516fdd6:   add    %edx,%ebp                    ; ImmutableOopMap {r9=Oop rcx=Oop rbx=Oop rax=Oop r13=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@76 (line 20)
  0x00007fe28516fdd8:   test   %eax,(%rsi)                  ;   {poll}
  0x00007fe28516fdda:   nop
  0x00007fe28516fddb:   nop
  0x00007fe28516fddc:   nop
  0x00007fe28516fddd:   nop
  0x00007fe28516fdde:   nop
  0x00007fe28516fddf:   nop
  0x00007fe28516fde0:   cmp    %r11d,%ebp
  0x00007fe28516fde3:   jl     0x00007fe28516fda0
 ;; B18: #	out( B32 B19 ) <- in( B17 B33 )  Freq: 0.999601
  0x00007fe28516fde5:   cmp    %r14d,%ebp
  0x00007fe28516fde8:   jge    0x00007fe28516fe94
 ;; B19: #	out( B43 B20 ) <- in( B18 )  Freq: 0.499801
  0x00007fe28516fdee:   mov    0xc(%r9),%r10d               ; implicit exception: dispatches to 0x00007fe285170002
 ;; B20: #	out( B43 B21 ) <- in( B19 )  Freq: 0.4998
  0x00007fe28516fdf2:   cmp    %r10d,%ebp
  0x00007fe28516fdf5:   jae    0x00007fe285170002
 ;; B21: #	out( B43 B22 ) <- in( B20 )  Freq: 0.4998
  0x00007fe28516fdfb:   mov    %r14d,%r11d
  0x00007fe28516fdfe:   dec    %r11d
  0x00007fe28516fe01:   cmp    %r10d,%r11d
  0x00007fe28516fe04:   jae    0x00007fe285170002           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B22: #	out( B43 B23 ) <- in( B21 )  Freq: 0.499799
  0x00007fe28516fe0a:   mov    0xc(%rbx),%r8d               ; implicit exception: dispatches to 0x00007fe285170002
 ;; B23: #	out( B43 B24 ) <- in( B22 )  Freq: 0.499799
  0x00007fe28516fe0e:   cmp    %r8d,%ebp
  0x00007fe28516fe11:   jae    0x00007fe285170002
 ;; B24: #	out( B43 B25 ) <- in( B23 )  Freq: 0.499798
  0x00007fe28516fe17:   cmp    %r8d,%r11d
  0x00007fe28516fe1a:   nop
  0x00007fe28516fe1b:   nop
  0x00007fe28516fe1c:   nop
  0x00007fe28516fe1d:   nop
  0x00007fe28516fe1e:   nop
  0x00007fe28516fe1f:   nop
  0x00007fe28516fe20:   jae    0x00007fe285170002
 ;; B25: #	out( B43 B26 ) <- in( B24 )  Freq: 0.499798
  0x00007fe28516fe26:   cmp    %r14d,%ebp
  0x00007fe28516fe29:   jae    0x00007fe285170002
 ;; B26: #	out( B43 B27 ) <- in( B25 )  Freq: 0.499797
  0x00007fe28516fe2f:   cmp    %r14d,%r11d
  0x00007fe28516fe32:   jae    0x00007fe285170002
 ;; B27: #	out( B43 B28 ) <- in( B26 )  Freq: 0.499797
  0x00007fe28516fe38:   mov    %ebp,%r10d
  0x00007fe28516fe3b:   inc    %r10d
  0x00007fe28516fe3e:   dec    %r10d
  0x00007fe28516fe41:   cmp    %r14d,%r10d
  0x00007fe28516fe44:   jae    0x00007fe285170002
 ;; B28: #	out( B29 ) <- in( B27 )  Freq: 0.499796
  0x00007fe28516fe4a:   mov    $0x3e8,%r10d
 ;; B29: #	out( B30 ) <- in( B28 B31 ) Loop( B29-B31 ) Freq: 0.999592
  0x00007fe28516fe50:   mov    %r14d,%r11d
  0x00007fe28516fe53:   sub    %ebp,%r11d
  0x00007fe28516fe56:   xor    %edi,%edi
  0x00007fe28516fe58:   cmp    %ebp,%r14d
  0x00007fe28516fe5b:   cmovl  %edi,%r11d
  0x00007fe28516fe5f:   cmp    $0x3e8,%r11d
  0x00007fe28516fe66:   cmova  %r10d,%r11d
  0x00007fe28516fe6a:   add    %ebp,%r11d                   ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B30: #	out( B30 B31 ) <- in( B29 B30 ) Loop( B30-B30 inner  strip mined) Freq: 1.99918
  0x00007fe28516fe6d:   mov    0x10(%rbx,%rbp,4),%r8d
  0x00007fe28516fe72:   add    0x10(%r9,%rbp,4),%r8d        ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe28516fe77:   mov    %r8d,0x10(%rcx,%rbp,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@98 (line 26)
  0x00007fe28516fe7c:   inc    %ebp
  0x00007fe28516fe7e:   nop
  0x00007fe28516fe7f:   nop
  0x00007fe28516fe80:   cmp    %r11d,%ebp
  0x00007fe28516fe83:   jl     0x00007fe28516fe6d           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@102 (line 25)
 ;; B31: #	out( B29 B32 ) <- in( B30 )  Freq: 0.999592
  0x00007fe28516fe85:   mov    0x130(%r15),%r11             ; ImmutableOopMap {r9=Oop rcx=Oop rbx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@102 (line 25)
  0x00007fe28516fe8c:   test   %eax,(%r11)                  ;   {poll}
  0x00007fe28516fe8f:   cmp    %r14d,%ebp
  0x00007fe28516fe92:   jl     0x00007fe28516fe50           ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
 ;; B32: #	out( N496 ) <- in( B31 B18 )  Freq: 0.999597
  0x00007fe28516fe94:   vzeroupper 
  0x00007fe28516fe97:   add    $0x70,%rsp
  0x00007fe28516fe9b:   pop    %rbp
  0x00007fe28516fe9c:   cmp    0x128(%r15),%rsp             ;   {poll_return}
  0x00007fe28516fea3:   ja     0x00007fe2851700c0
  0x00007fe28516fea9:   retq   
 ;; B33: #	out( B18 ) <- in( B5 )  Freq: 0.00776893
  0x00007fe28516feaa:   xor    %ebp,%ebp
  0x00007fe28516feac:   mov    %r10,%r9
  0x00007fe28516feaf:   mov    %r8,%rbx
  0x00007fe28516feb2:   jmpq   0x00007fe28516fde5
 ;; B34: #	out( N496 ) <- in( B14 )  Freq: 0.000129362
  0x00007fe28516feb7:   mov    $0xffffffe4,%esi
  0x00007fe28516febc:   mov    %rax,(%rsp)
  0x00007fe28516fec0:   mov    %rcx,0x8(%rsp)
  0x00007fe28516fec5:   mov    %rbx,0x18(%rsp)
  0x00007fe28516feca:   mov    %r13,0x20(%rsp)
  0x00007fe28516fecf:   mov    %r9,0x28(%rsp)
  0x00007fe28516fed4:   mov    %r8d,0x30(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe28516fed9:   nop
  0x00007fe28516feda:   nop
  0x00007fe28516fedb:   nop
  0x00007fe28516fedc:   vzeroupper 
  0x00007fe28516fedf:   callq  0x00007fe285116540           ; ImmutableOopMap {[0]=Oop [8]=Oop [24]=Oop [32]=Oop [40]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe28516fee4:   movabs $0x7fe2901037b8,%rdi         ;   {external_word}
  0x00007fe28516feee:   and    $0xfffffffffffffff0,%rsp
  0x00007fe28516fef2:   callq  0x00007fe28f8c8ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe28516fef7:   hlt    
 ;; B35: #	out( N496 ) <- in( B15 )  Freq: 0.000129362
  0x00007fe28516fef8:   mov    $0xffffffe4,%esi
  0x00007fe28516fefd:   mov    %rax,(%rsp)
  0x00007fe28516ff01:   mov    %rcx,0x8(%rsp)
  0x00007fe28516ff06:   mov    %r9,0x10(%rsp)
  0x00007fe28516ff0b:   mov    %r13,0x20(%rsp)
  0x00007fe28516ff10:   mov    %rbx,0x28(%rsp)
  0x00007fe28516ff15:   mov    %edi,0x30(%rsp)
  0x00007fe28516ff19:   vmovdqu %ymm0,0x40(%rsp)            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe28516ff1f:   nop
  0x00007fe28516ff20:   vzeroupper 
  0x00007fe28516ff23:   callq  0x00007fe285116540           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop [32]=Oop [40]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@44 (line 22)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe28516ff28:   movabs $0x7fe2901037b8,%rdi         ;   {external_word}
  0x00007fe28516ff32:   and    $0xfffffffffffffff0,%rsp
  0x00007fe28516ff36:   callq  0x00007fe28f8c8ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe28516ff3b:   hlt    
 ;; B36: #	out( N496 ) <- in( B16 )  Freq: 0.000129362
  0x00007fe28516ff3c:   mov    $0xffffffe4,%esi
  0x00007fe28516ff41:   mov    %rax,(%rsp)
  0x00007fe28516ff45:   mov    %r9,0x10(%rsp)
  0x00007fe28516ff4a:   mov    %rbx,0x18(%rsp)
  0x00007fe28516ff4f:   mov    %rcx,0x20(%rsp)
  0x00007fe28516ff54:   mov    %r10d,0x28(%rsp)
  0x00007fe28516ff59:   vmovdqu %ymm0,0x40(%rsp)            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe28516ff5f:   nop
  0x00007fe28516ff60:   vzeroupper 
  0x00007fe28516ff63:   callq  0x00007fe285116540           ; ImmutableOopMap {[0]=Oop [16]=Oop [24]=Oop [32]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - App::micro_vector@59 (line 23)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe28516ff68:   movabs $0x7fe2901037b8,%rdi         ;   {external_word}
  0x00007fe28516ff72:   and    $0xfffffffffffffff0,%rsp
  0x00007fe28516ff76:   callq  0x00007fe28f8c8ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe28516ff7b:   hlt    
 ;; B37: #	out( N496 ) <- in( B3 )  Freq: 9.99998e-07
  0x00007fe28516ff7c:   mov    $0xffffffde,%esi
  0x00007fe28516ff81:   mov    %rax,(%rsp)
  0x00007fe28516ff85:   mov    %rdx,0x8(%rsp)
  0x00007fe28516ff8a:   mov    %r10,0x10(%rsp)
  0x00007fe28516ff8f:   mov    %r8,0x18(%rsp)
  0x00007fe28516ff94:   mov    %r14d,0x20(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe28516ff99:   nop
  0x00007fe28516ff9a:   nop
  0x00007fe28516ff9b:   nop
  0x00007fe28516ff9c:   vzeroupper 
  0x00007fe28516ff9f:   callq  0x00007fe285116540           ; ImmutableOopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe28516ffa4:   movabs $0x7fe2901037b8,%rdi         ;   {external_word}
  0x00007fe28516ffae:   and    $0xfffffffffffffff0,%rsp
  0x00007fe28516ffb2:   callq  0x00007fe28f8c8ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe28516ffb7:   hlt    
 ;; B38: #	out( B41 ) <- in( B7 )  Freq: 9.92227e-07
  0x00007fe28516ffb8:   mov    %rdi,%rbx
  0x00007fe28516ffbb:   jmp    0x00007fe28516ffc5
 ;; B39: #	out( B41 ) <- in( B8 )  Freq: 1.0054e-06
  0x00007fe28516ffbd:   mov    %rdi,%rbx
  0x00007fe28516ffc0:   jmp    0x00007fe28516ffc5
 ;; B40: #	out( B41 ) <- in( B6 )  Freq: 1.0054e-06
  0x00007fe28516ffc2:   mov    %rdi,%rbx
 ;; B41: #	out( N496 ) <- in( B11 B12 B40 B38 B39 B42 B10 )  Freq: 6.9851e-06
  0x00007fe28516ffc5:   mov    $0xffffff76,%esi
  0x00007fe28516ffca:   mov    %rax,%rbp
  0x00007fe28516ffcd:   mov    %rcx,(%rsp)
  0x00007fe28516ffd1:   mov    %r9,0x8(%rsp)
  0x00007fe28516ffd6:   mov    %rbx,0x10(%rsp)
  0x00007fe28516ffdb:   mov    %r11d,0x18(%rsp)
  0x00007fe28516ffe0:   vzeroupper 
  0x00007fe28516ffe3:   callq  0x00007fe285116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@22 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe28516ffe8:   movabs $0x7fe2901037b8,%rdi         ;   {external_word}
  0x00007fe28516fff2:   and    $0xfffffffffffffff0,%rsp
  0x00007fe28516fff6:   callq  0x00007fe28f8c8ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe28516fffb:   hlt    
 ;; B42: #	out( B41 ) <- in( B9 )  Freq: 9.92225e-07
  0x00007fe28516fffc:   mov    %rdi,%rbx
  0x00007fe28516ffff:   nop
  0x00007fe285170000:   jmp    0x00007fe28516ffc5
 ;; B43: #	out( N496 ) <- in( B27 B19 B20 B21 B25 B26 B22 B23 B24 )  Freq: 4.55792e-06
  0x00007fe285170002:   mov    $0xffffff76,%esi
  0x00007fe285170007:   mov    %rcx,(%rsp)
  0x00007fe28517000b:   mov    %r9,0x8(%rsp)
  0x00007fe285170010:   mov    %rbx,0x10(%rsp)
  0x00007fe285170015:   mov    %r14d,0x18(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe28517001a:   nop
  0x00007fe28517001b:   nop
  0x00007fe28517001c:   vzeroupper 
  0x00007fe28517001f:   callq  0x00007fe285116540           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@83 (line 25)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe285170024:   movabs $0x7fe2901037b8,%rdi         ;   {external_word}
  0x00007fe28517002e:   and    $0xfffffffffffffff0,%rsp
  0x00007fe285170032:   callq  0x00007fe28f8c8ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe285170037:   hlt    
 ;; B44: #	out( N496 ) <- in( B4 )  Freq: 4.99998e-07
  0x00007fe285170038:   mov    $0xffffff45,%esi
  0x00007fe28517003d:   mov    %rax,(%rsp)
  0x00007fe285170041:   mov    %rcx,0x8(%rsp)
  0x00007fe285170046:   mov    %r10,0x10(%rsp)
  0x00007fe28517004b:   mov    %r8,0x18(%rsp)
  0x00007fe285170050:   mov    %r14d,0x20(%rsp)
  0x00007fe285170055:   mov    %edx,0x24(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe285170059:   nop
  0x00007fe28517005a:   nop
  0x00007fe28517005b:   nop
  0x00007fe28517005c:   vzeroupper 
  0x00007fe28517005f:   callq  0x00007fe285116540           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*ifne {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe285170064:   movabs $0x7fe2901037b8,%rdi         ;   {external_word}
  0x00007fe28517006e:   and    $0xfffffffffffffff0,%rsp
  0x00007fe285170072:   callq  0x00007fe28f8c8ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe285170077:   hlt    
 ;; B45: #	out( N496 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007fe285170078:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe28517007d:   nop
  0x00007fe28517007e:   nop
  0x00007fe28517007f:   nop
  0x00007fe285170080:   vzeroupper 
  0x00007fe285170083:   callq  0x00007fe285116540           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@16 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe285170088:   movabs $0x7fe2901037b8,%rdi         ;   {external_word}
  0x00007fe285170092:   and    $0xfffffffffffffff0,%rsp
  0x00007fe285170096:   callq  0x00007fe28f8c8ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe28517009b:   hlt    
 ;; B46: #	out( N496 ) <- in( B2 )  Freq: 1.01328e-06
  0x00007fe28517009c:   mov    $0xfffffff6,%esi
  0x00007fe2851700a1:   mov    %r14d,%ebp
  0x00007fe2851700a4:   vzeroupper 
  0x00007fe2851700a7:   callq  0x00007fe285116540           ; ImmutableOopMap {}
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fe2851700ac:   movabs $0x7fe2901037b8,%rdi         ;   {external_word}
  0x00007fe2851700b6:   and    $0xfffffffffffffff0,%rsp
  0x00007fe2851700ba:   callq  0x00007fe28f8c8ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fe2851700bf:   hlt                                 ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fe2851700c0:   movabs $0x7fe28516fe9c,%r10         ;   {internal_word}
  0x00007fe2851700ca:   mov    %r10,0x3e8(%r15)
  0x00007fe2851700d1:   jmpq   0x00007fe285117220           ;   {runtime_call SafepointBlob}
  0x00007fe2851700d6:   hlt    
  0x00007fe2851700d7:   hlt    
  0x00007fe2851700d8:   hlt    
  0x00007fe2851700d9:   hlt    
  0x00007fe2851700da:   hlt    
  0x00007fe2851700db:   hlt    
  0x00007fe2851700dc:   hlt    
  0x00007fe2851700dd:   hlt    
  0x00007fe2851700de:   hlt    
  0x00007fe2851700df:   hlt    
[Exception Handler]
  0x00007fe2851700e0:   jmpq   0x00007fe28505c6a0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007fe2851700e5:   callq  0x00007fe2851700ea
  0x00007fe2851700ea:   subq   $0x5,(%rsp)
  0x00007fe2851700ef:   jmpq   0x00007fe285116860           ;   {runtime_call DeoptimizationBlob}
  0x00007fe2851700f4:   hlt    
  0x00007fe2851700f5:   hlt    
  0x00007fe2851700f6:   hlt    
  0x00007fe2851700f7:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007fe2851700f8:   0x000000010188e260 a 'java/lang/Class'{0x000000010188e260} = 'jdk/incubator/vector/Int256Vector'
  0x00007fe285170100:   0x000000010110de40 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de40}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007fe285170108:   0x00007fe22d811818 {method} {0x00007fe22d811818} 'micro_vector' '([I[I[I)V' in 'App'
  0x00007fe285170110:   0x00007fe22d812d08 {method} {0x00007fe22d812d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
  0x00007fe285170118:   0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fe285170120:   0x00007fe22da1e040 {method} {0x00007fe22da1e040} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fe285170128:   0x00007fe22d812728 {method} {0x00007fe22d812728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fe285170130:   0x00007fe22da18468 {method} {0x00007fe22da18468} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fe285170138:   0x00007fe22da1eb40 {method} {0x00007fe22da1eb40} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fe285170140:   0x0000000800098110 'jdk/incubator/vector/Int256Vector'
  0x00007fe285170148:   0x00007fe22da84038 {method} {0x00007fe22da84038} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007fe285170150:   0x00007fe22d560ca0 {method} {0x00007fe22d560ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
  0x00007fe285170158:   0x00007fe22da4d2a8 {method} {0x00007fe22da4d2a8} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fe285170160:   0x00007fe22d813798 {method} {0x00007fe22d813798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fe285170168:   0x00007fe22d81f8d8 {method} {0x00007fe22d81f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fe285170170:   0x00007fe22da4e718 {method} {0x00007fe22da4e718} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fe285170178:   0x00007fe22da4b678 {method} {0x00007fe22da4b678} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fe285170180:   0x00007fe22d81e8d8 {method} {0x00007fe22d81e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fe285170188:   0x00007fe22da84340 {method} {0x00007fe22da84340} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007fe285170190:   0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
  0x00007fe285170198:   0x00007fe22daef250 {method} {0x00007fe22daef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fe2851701a0:   0x00007fe22daeede8 {method} {0x00007fe22daeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fe2851701a8:   0x00007fe22daeeec0 {method} {0x00007fe22daeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fe2851701b0:   0x00007fe22da11968 {method} {0x00007fe22da11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007fe28516fcbf offset=ffffffff bits=0):
PcDesc(pc=0x00007fe28516fcec offset=2c bits=0):   App::micro_vector@-1 (line 15)
PcDesc(pc=0x00007fe28516fcfc offset=3c bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe28516fcff offset=3f bits=0):   App::micro_vector@12 (line 20)
PcDesc(pc=0x00007fe28516fd0c offset=4c bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe28516fd16 offset=56 bits=0):   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007fe28516fd1a offset=5a bits=0):   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007fe28516fd2d offset=6d bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe28516fd32 offset=72 bits=0):   App::micro_vector@76 (line 20)
PcDesc(pc=0x00007fe28516fd53 offset=93 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe28516fd57 offset=97 bits=0):   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fe28516fd8b offset=cb bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe28516fd98 offset=d8 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe28516fda9 offset=e9 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fe28516fdb0 offset=f0 bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fe28516fdb8 offset=f8 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe28516fdbe offset=fe bits=0):   jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector@53 (line 23)
PcDesc(pc=0x00007fe28516fdd6 offset=116 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe28516fdd8 offset=118 bits=1):   App::micro_vector@76 (line 20)  reexecute=true
   Locals
    - l0: reg rax [0],oop
    - l1: reg rcx [2],oop
    - l2: reg r9 [18],oop
    - l3: reg rbx [6],oop
    - l4: empty
    - l5: empty
    - l6: reg rbp [10],int
PcDesc(pc=0x00007fe28516fe0a offset=14a bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe28516fe6d offset=1ad bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007fe28516fe77 offset=1b7 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe28516fe7c offset=1bc bits=0):   App::micro_vector@98 (line 26)
PcDesc(pc=0x00007fe28516fe85 offset=1c5 bits=0):   App::micro_vector@102 (line 25)
PcDesc(pc=0x00007fe28516fe8c offset=1cc bits=1):   App::micro_vector@102 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rcx [2],oop
    - l2: reg r9 [18],oop
    - l3: reg rbx [6],oop
    - l4: empty
    - l5: empty
    - l6: reg rbp [10],int
PcDesc(pc=0x00007fe28516fe94 offset=1d4 bits=0):   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007fe28516fed9 offset=219 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe28516fee4 offset=224 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: reg rbp [10],int
    - @1: stack[48]
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[32],oop
    - l1: stack[40],oop
    - l2: empty
    - l3: empty
   App::micro_vector@32 (line 21)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: stack[40],oop
    - l3: stack[24],oop
    - l4: empty
    - l5: empty
    - l6: reg rbp [10],int
PcDesc(pc=0x00007fe28516ff1f offset=25f bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe28516ff28 offset=268 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: reg rbp [10],int
    - @1: stack[48]
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[32],oop
    - l1: stack[40],oop
    - l2: empty
    - l3: empty
   App::micro_vector@44 (line 22)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: stack[16],oop
    - l3: stack[40],oop
    - l4: obj[264]
    - l5: empty
    - l6: reg rbp [10],int
   Objects
    - 264: jdk.incubator.vector.Int256Vector stack[64]Wrong location type 7
PcDesc(pc=0x00007fe28516ff5f offset=29f bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe28516ff68 offset=2a8 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: reg rbp [10],int
    - @1: stack[40]
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: obj[272]
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
   App::micro_vector@59 (line 23)
   Locals
    - l0: stack[0],oop
    - l1: stack[32],oop
    - l2: stack[16],oop
    - l3: stack[24],oop
    - l4: empty
    - l5: empty
    - l6: reg rbp [10],int
   Objects
    - 272: jdk.incubator.vector.Int256Vector stack[64]Wrong location type 7
PcDesc(pc=0x00007fe28516ff99 offset=2d9 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe28516ffa4 offset=2e4 bits=0):   App::micro_vector@17 (line 20)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: stack[16],oop
    - l3: stack[24],oop
    - l4: empty
    - l5: empty
    - l6: 0
   Expression stack
    - @0: 0
    - @1: reg rbp [10],narrowoop
    - @2: stack[32]
PcDesc(pc=0x00007fe28516ffe8 offset=328 bits=1):   App::micro_vector@22 (line 20)  reexecute=true
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: empty
    - l5: empty
    - l6: 0
   Expression stack
    - @0: 0
    - @1: stack[24]
PcDesc(pc=0x00007fe28517001a offset=35a bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe285170024 offset=364 bits=1):   App::micro_vector@83 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: empty
    - l5: empty
    - l6: reg rbp [10],int
   Expression stack
    - @0: reg rbp [10],int
    - @1: stack[24]
PcDesc(pc=0x00007fe285170059 offset=399 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe285170064 offset=3a4 bits=1):   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
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
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: stack[16],oop
    - l3: stack[24],oop
    - l4: empty
    - l5: empty
    - l6: 0
   Expression stack
    - @0: 0
PcDesc(pc=0x00007fe28517007d offset=3bd bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe285170088 offset=3c8 bits=0):   App::micro_vector@16 (line 20)
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
PcDesc(pc=0x00007fe2851700ac offset=3ec bits=0):   App::micro_vector@17 (line 20)
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
PcDesc(pc=0x00007fe2851700c0 offset=400 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fe2851700f9 offset=439 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 11 OopMaps

ImmutableOopMap {r9=Oop rcx=Oop rbx=Oop rax=Oop r13=Oop } pc offsets: 280 
ImmutableOopMap {r9=Oop rcx=Oop rbx=Oop } pc offsets: 460 
ImmutableOopMap {[0]=Oop [8]=Oop [24]=Oop [32]=Oop [40]=Oop } pc offsets: 548 
ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop [32]=Oop [40]=Oop } pc offsets: 616 
ImmutableOopMap {[0]=Oop [16]=Oop [24]=Oop [32]=Oop } pc offsets: 680 
ImmutableOopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop } pc offsets: 740 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop } pc offsets: 808 
ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop } pc offsets: 868 
ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop } pc offsets: 932 
ImmutableOopMap {} pc offsets: 968 1004 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007fe28516fcec offset=2c):
   App::micro_vector@-1 (line 15)
ScopeDesc(pc=0x00007fe28516fcfc offset=3c):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28516fcfc offset=3c):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe28516fcff offset=3f):
   App::micro_vector@12 (line 20)
ScopeDesc(pc=0x00007fe28516fd0c offset=4c):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28516fd0c offset=4c):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe28516fd16 offset=56):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007fe28516fd1a offset=5a):
   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
ScopeDesc(pc=0x00007fe28516fd1a offset=5a):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007fe28516fd2d offset=6d):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28516fd2d offset=6d):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe28516fd32 offset=72):
   App::micro_vector@76 (line 20)
ScopeDesc(pc=0x00007fe28516fd53 offset=93):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28516fd53 offset=93):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe28516fd57 offset=97):
   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
ScopeDesc(pc=0x00007fe28516fd57 offset=97):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007fe28516fd57 offset=97):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fe28516fd57 offset=97):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fe28516fd8b offset=cb):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28516fd8b offset=cb):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe28516fd98 offset=d8):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fe28516fd98 offset=d8):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fe28516fd98 offset=d8):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
ScopeDesc(pc=0x00007fe28516fd98 offset=d8):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe28516fda9 offset=e9):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fe28516fda9 offset=e9):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fe28516fda9 offset=e9):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fe28516fda9 offset=e9):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fe28516fdb0 offset=f0):
   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
ScopeDesc(pc=0x00007fe28516fdb0 offset=f0):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fe28516fdb0 offset=f0):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fe28516fdb0 offset=f0):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fe28516fdb8 offset=f8):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28516fdb8 offset=f8):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe28516fdbe offset=fe):
   jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
ScopeDesc(pc=0x00007fe28516fdbe offset=fe):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fe28516fdbe offset=fe):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fe28516fdbe offset=fe):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fe28516fdbe offset=fe):
   App::micro_vector@53 (line 23)
ScopeDesc(pc=0x00007fe28516fdd6 offset=116):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28516fdd6 offset=116):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe28516fdd8 offset=118):
   App::micro_vector@76 (line 20)  reexecute=true
   Locals
    - l0: reg rax [0],oop
    - l1: reg rcx [2],oop
    - l2: reg r9 [18],oop
    - l3: reg rbx [6],oop
    - l4: empty
    - l5: empty
    - l6: reg rbp [10],int
ScopeDesc(pc=0x00007fe28516fe0a offset=14a):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28516fe0a offset=14a):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe28516fe6d offset=1ad):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007fe28516fe77 offset=1b7):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28516fe77 offset=1b7):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe28516fe7c offset=1bc):
   App::micro_vector@98 (line 26)
ScopeDesc(pc=0x00007fe28516fe85 offset=1c5):
   App::micro_vector@102 (line 25)
ScopeDesc(pc=0x00007fe28516fe8c offset=1cc):
   App::micro_vector@102 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rcx [2],oop
    - l2: reg r9 [18],oop
    - l3: reg rbx [6],oop
    - l4: empty
    - l5: empty
    - l6: reg rbp [10],int
ScopeDesc(pc=0x00007fe28516fe94 offset=1d4):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007fe28516fed9 offset=219):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28516fed9 offset=219):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe28516fee4 offset=224):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: reg rbp [10],int
    - @1: stack[48]
    - @2: NULL
ScopeDesc(pc=0x00007fe28516fee4 offset=224):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fe28516fee4 offset=224):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[32],oop
    - l1: stack[40],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fe28516fee4 offset=224):
   App::micro_vector@32 (line 21)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: stack[40],oop
    - l3: stack[24],oop
    - l4: empty
    - l5: empty
    - l6: reg rbp [10],int
ScopeDesc(pc=0x00007fe28516ff1f offset=25f):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28516ff1f offset=25f):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe28516ff28 offset=268):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: reg rbp [10],int
    - @1: stack[48]
    - @2: NULL
ScopeDesc(pc=0x00007fe28516ff28 offset=268):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fe28516ff28 offset=268):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[32],oop
    - l1: stack[40],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fe28516ff28 offset=268):
   App::micro_vector@44 (line 22)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: stack[16],oop
    - l3: stack[40],oop
    - l4: obj[264]
    - l5: empty
    - l6: reg rbp [10],int
   Objects
    - 264: jdk.incubator.vector.Int256Vector stack[64]Wrong location type 7
ScopeDesc(pc=0x00007fe28516ff5f offset=29f):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28516ff5f offset=29f):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe28516ff68 offset=2a8):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: reg rbp [10],int
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007fe28516ff68 offset=2a8):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fe28516ff68 offset=2a8):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: obj[272]
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fe28516ff68 offset=2a8):
   App::micro_vector@59 (line 23)
   Locals
    - l0: stack[0],oop
    - l1: stack[32],oop
    - l2: stack[16],oop
    - l3: stack[24],oop
    - l4: empty
    - l5: empty
    - l6: reg rbp [10],int
   Objects
    - 272: jdk.incubator.vector.Int256Vector stack[64]Wrong location type 7
ScopeDesc(pc=0x00007fe28516ff99 offset=2d9):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28516ff99 offset=2d9):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe28516ffa4 offset=2e4):
   App::micro_vector@17 (line 20)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: stack[16],oop
    - l3: stack[24],oop
    - l4: empty
    - l5: empty
    - l6: 0
   Expression stack
    - @0: 0
    - @1: reg rbp [10],narrowoop
    - @2: stack[32]
ScopeDesc(pc=0x00007fe28516ffe8 offset=328):
   App::micro_vector@22 (line 20)  reexecute=true
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: empty
    - l5: empty
    - l6: 0
   Expression stack
    - @0: 0
    - @1: stack[24]
ScopeDesc(pc=0x00007fe28517001a offset=35a):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28517001a offset=35a):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe285170024 offset=364):
   App::micro_vector@83 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: empty
    - l5: empty
    - l6: reg rbp [10],int
   Expression stack
    - @0: reg rbp [10],int
    - @1: stack[24]
ScopeDesc(pc=0x00007fe285170059 offset=399):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe285170059 offset=399):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe285170064 offset=3a4):
   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
   Locals
    - l0: stack[32]
    - l1: stack[36]
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007fe285170064 offset=3a4):
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   Locals
    - l0: empty
    - l1: empty
ScopeDesc(pc=0x00007fe285170064 offset=3a4):
   App::micro_vector@17 (line 20)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: stack[16],oop
    - l3: stack[24],oop
    - l4: empty
    - l5: empty
    - l6: 0
   Expression stack
    - @0: 0
ScopeDesc(pc=0x00007fe28517007d offset=3bd):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe28517007d offset=3bd):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fe285170088 offset=3c8):
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
ScopeDesc(pc=0x00007fe2851700ac offset=3ec):
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
ScopeDesc(pc=0x00007fe2851700c0 offset=400):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fe2851700c0 offset=400):
   App::micro_vector@59 (line 23)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007fe28516fc08: 6014
relocInfo@0x00007fe28516fc08 [type=6(runtime_call) addr=0x00007fe28516fcd4 offset=20] | [destination=0x00007fe285115920]
         @0x00007fe28516fc0a: f003cc31
relocInfo@0x00007fe28516fc0c [type=12(metadata) addr=0x00007fe28516fd05 offset=49 format=3 data=3] | [metadata_addr=0x00007fe285170118 *=0x0000000800094b80 offset=0]metadata_value=0x0000000800094b80: 'jdk/incubator/vector/IntVector$IntSpecies'
         @0x00007fe28516fc0e: f008cc60
relocInfo@0x00007fe28516fc10 [type=12(metadata) addr=0x00007fe28516fd65 offset=96 format=3 data=8] | [metadata_addr=0x00007fe285170140 *=0x0000000800098110 offset=0]metadata_value=0x0000000800098110: 'jdk/incubator/vector/Int256Vector'
         @0x00007fe28516fc12: a073
relocInfo@0x00007fe28516fc12 [type=10(poll) addr=0x00007fe28516fdd8 offset=115]
         @0x00007fe28516fc14: a0b4
relocInfo@0x00007fe28516fc14 [type=10(poll) addr=0x00007fe28516fe8c offset=180]
         @0x00007fe28516fc16: b010
relocInfo@0x00007fe28516fc16 [type=11(poll_return) addr=0x00007fe28516fe9c offset=16]
         @0x00007fe28516fc18: 6443
relocInfo@0x00007fe28516fc18 [type=6(runtime_call) addr=0x00007fe28516fedf offset=67 format=1] | [destination=0x00007fe285116540]
         @0x00007fe28516fc1a: f803901037b87fe27005
relocInfo@0x00007fe28516fc22 [type=7(external_word) addr=0x00007fe28516fee4 offset=5 data={901037b87fe2}] | [target=0x00007fe2901037b8]
         @0x00007fe28516fc24: 640e
relocInfo@0x00007fe28516fc24 [type=6(runtime_call) addr=0x00007fe28516fef2 offset=14 format=1] | [destination=0x00007fe28f8c8ff4]
         @0x00007fe28516fc26: 6431
relocInfo@0x00007fe28516fc26 [type=6(runtime_call) addr=0x00007fe28516ff23 offset=49 format=1] | [destination=0x00007fe285116540]
         @0x00007fe28516fc28: f803901037b87fe27005
relocInfo@0x00007fe28516fc30 [type=7(external_word) addr=0x00007fe28516ff28 offset=5 data={901037b87fe2}] | [target=0x00007fe2901037b8]
         @0x00007fe28516fc32: 640e
relocInfo@0x00007fe28516fc32 [type=6(runtime_call) addr=0x00007fe28516ff36 offset=14 format=1] | [destination=0x00007fe28f8c8ff4]
         @0x00007fe28516fc34: 642d
relocInfo@0x00007fe28516fc34 [type=6(runtime_call) addr=0x00007fe28516ff63 offset=45 format=1] | [destination=0x00007fe285116540]
         @0x00007fe28516fc36: f803901037b87fe27005
relocInfo@0x00007fe28516fc3e [type=7(external_word) addr=0x00007fe28516ff68 offset=5 data={901037b87fe2}] | [target=0x00007fe2901037b8]
         @0x00007fe28516fc40: 640e
relocInfo@0x00007fe28516fc40 [type=6(runtime_call) addr=0x00007fe28516ff76 offset=14 format=1] | [destination=0x00007fe28f8c8ff4]
         @0x00007fe28516fc42: 6429
relocInfo@0x00007fe28516fc42 [type=6(runtime_call) addr=0x00007fe28516ff9f offset=41 format=1] | [destination=0x00007fe285116540]
         @0x00007fe28516fc44: f803901037b87fe27005
relocInfo@0x00007fe28516fc4c [type=7(external_word) addr=0x00007fe28516ffa4 offset=5 data={901037b87fe2}] | [target=0x00007fe2901037b8]
         @0x00007fe28516fc4e: 640e
relocInfo@0x00007fe28516fc4e [type=6(runtime_call) addr=0x00007fe28516ffb2 offset=14 format=1] | [destination=0x00007fe28f8c8ff4]
         @0x00007fe28516fc50: 6431
relocInfo@0x00007fe28516fc50 [type=6(runtime_call) addr=0x00007fe28516ffe3 offset=49 format=1] | [destination=0x00007fe285116540]
         @0x00007fe28516fc52: f803901037b87fe27005
relocInfo@0x00007fe28516fc5a [type=7(external_word) addr=0x00007fe28516ffe8 offset=5 data={901037b87fe2}] | [target=0x00007fe2901037b8]
         @0x00007fe28516fc5c: 640e
relocInfo@0x00007fe28516fc5c [type=6(runtime_call) addr=0x00007fe28516fff6 offset=14 format=1] | [destination=0x00007fe28f8c8ff4]
         @0x00007fe28516fc5e: 6429
relocInfo@0x00007fe28516fc5e [type=6(runtime_call) addr=0x00007fe28517001f offset=41 format=1] | [destination=0x00007fe285116540]
         @0x00007fe28516fc60: f803901037b87fe27005
relocInfo@0x00007fe28516fc68 [type=7(external_word) addr=0x00007fe285170024 offset=5 data={901037b87fe2}] | [target=0x00007fe2901037b8]
         @0x00007fe28516fc6a: 640e
relocInfo@0x00007fe28516fc6a [type=6(runtime_call) addr=0x00007fe285170032 offset=14 format=1] | [destination=0x00007fe28f8c8ff4]
         @0x00007fe28516fc6c: 642d
relocInfo@0x00007fe28516fc6c [type=6(runtime_call) addr=0x00007fe28517005f offset=45 format=1] | [destination=0x00007fe285116540]
         @0x00007fe28516fc6e: f803901037b87fe27005
relocInfo@0x00007fe28516fc76 [type=7(external_word) addr=0x00007fe285170064 offset=5 data={901037b87fe2}] | [target=0x00007fe2901037b8]
         @0x00007fe28516fc78: 640e
relocInfo@0x00007fe28516fc78 [type=6(runtime_call) addr=0x00007fe285170072 offset=14 format=1] | [destination=0x00007fe28f8c8ff4]
         @0x00007fe28516fc7a: 6411
relocInfo@0x00007fe28516fc7a [type=6(runtime_call) addr=0x00007fe285170083 offset=17 format=1] | [destination=0x00007fe285116540]
         @0x00007fe28516fc7c: f803901037b87fe27005
relocInfo@0x00007fe28516fc84 [type=7(external_word) addr=0x00007fe285170088 offset=5 data={901037b87fe2}] | [target=0x00007fe2901037b8]
         @0x00007fe28516fc86: 640e
relocInfo@0x00007fe28516fc86 [type=6(runtime_call) addr=0x00007fe285170096 offset=14 format=1] | [destination=0x00007fe28f8c8ff4]
         @0x00007fe28516fc88: 6411
relocInfo@0x00007fe28516fc88 [type=6(runtime_call) addr=0x00007fe2851700a7 offset=17 format=1] | [destination=0x00007fe285116540]
         @0x00007fe28516fc8a: f803901037b87fe27005
relocInfo@0x00007fe28516fc92 [type=7(external_word) addr=0x00007fe2851700ac offset=5 data={901037b87fe2}] | [target=0x00007fe2901037b8]
         @0x00007fe28516fc94: 640e
relocInfo@0x00007fe28516fc94 [type=6(runtime_call) addr=0x00007fe2851700ba offset=14 format=1] | [destination=0x00007fe28f8c8ff4]
         @0x00007fe28516fc96: f2248006
relocInfo@0x00007fe28516fc98 [type=8(internal_word) addr=0x00007fe2851700c0 offset=6 data=548] | [target=0x00007fe28516fe9c]
         @0x00007fe28516fc9a: 6411
relocInfo@0x00007fe28516fc9a [type=6(runtime_call) addr=0x00007fe2851700d1 offset=17 format=1] | [destination=0x00007fe285117220]
         @0x00007fe28516fc9c: 000f
relocInfo@0x00007fe28516fc9c [type=0(none) addr=0x00007fe2851700e0 offset=15]
         @0x00007fe28516fc9e: 6400
relocInfo@0x00007fe28516fc9e [type=6(runtime_call) addr=0x00007fe2851700e0 offset=0 format=1] | [destination=0x00007fe28505c6a0]
         @0x00007fe28516fca0: 640f
relocInfo@0x00007fe28516fca0 [type=6(runtime_call) addr=0x00007fe2851700ef offset=15 format=1] | [destination=0x00007fe285116860]
         @0x00007fe28516fca2: 0000
relocInfo@0x00007fe28516fca2 [type=0(none) addr=0x00007fe2851700ef offset=0]
         @0x00007fe28516fca4: 0000
relocInfo@0x00007fe28516fca4 [type=0(none) addr=0x00007fe2851700ef offset=0]
         @0x00007fe28516fca6: 0000
relocInfo@0x00007fe28516fca6 [type=0(none) addr=0x00007fe2851700ef offset=0]
         @0x00007fe28516fca8: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fe22daef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fe22daeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fe22daeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$ImplCache
  method  = {method} {0x00007fe22da11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$ImplCache
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 7 entries, 60 bytes):
{
   < 0x00007fe28516fcf5, 0x00007fe285170078 > < 0x00007fe28516fd00, 0x00007fe28517009c > < 0x00007fe28516fd40, 0x00007fe28516ffc2 > 
   < 0x00007fe28516fd60, 0x00007fe28516ffbd > < 0x00007fe28516fd75, 0x00007fe28516ffc5 > < 0x00007fe28516fdee, 0x00007fe285170002 > 
   < 0x00007fe28516fe0a, 0x00007fe285170002 > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x000000010188e260 a 'java/lang/Class'{0x000000010188e260} = 'jdk/incubator/vector/Int256Vector'
#2: 0x000000010110de40 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de40}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
# 0: 0x0000000000000000 NULL-oop
# 1: 0x00007fe22d811818 {method} {0x00007fe22d811818} 'micro_vector' '([I[I[I)V' in 'App'
# 2: 0x00007fe22d812d08 {method} {0x00007fe22d812d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
# 3: 0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
# 4: 0x00007fe22da1e040 {method} {0x00007fe22da1e040} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
# 5: 0x00007fe22d812728 {method} {0x00007fe22d812728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
# 6: 0x00007fe22da18468 {method} {0x00007fe22da18468} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
# 7: 0x00007fe22da1eb40 {method} {0x00007fe22da1eb40} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
# 8: 0x0000000800098110 'jdk/incubator/vector/Int256Vector'
# 9: 0x00007fe22da84038 {method} {0x00007fe22da84038} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
#10: 0x00007fe22d560ca0 {method} {0x00007fe22d560ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
#11: 0x00007fe22da4d2a8 {method} {0x00007fe22da4d2a8} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
#12: 0x00007fe22d813798 {method} {0x00007fe22d813798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#13: 0x00007fe22d81f8d8 {method} {0x00007fe22d81f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#14: 0x00007fe22da4e718 {method} {0x00007fe22da4e718} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
#15: 0x00007fe22da4b678 {method} {0x00007fe22da4b678} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
#16: 0x00007fe22d81e8d8 {method} {0x00007fe22d81e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#17: 0x00007fe22da84340 {method} {0x00007fe22da84340} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
#18: 0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
#19: 0x00007fe22daef250 {method} {0x00007fe22daef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#20: 0x00007fe22daeede8 {method} {0x00007fe22daeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#21: 0x00007fe22daeeec0 {method} {0x00007fe22daeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#22: 0x00007fe22da11968 {method} {0x00007fe22da11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VECTOR : [Time] 24 ms   [Res] 104960000000
VECTOR_MASKED : [Time] 131 ms   [Res] 104960000000
------------------------------------------------------------------------
App::micro_vector([I[I[I)V
  interpreter_invocation_count:      403 
  invocation_counter:               5000 
  backedge_counter:                 5129 
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
                                    'jdk/incubator/vector/IntVector$IntSpecies'(48713 1.00)
22 if_icmpge 79
  56  bci: 22   BranchData          taken(378) displacement(256)
                                    not taken(48335)
25 fast_aaccess_0
26 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
29 aload_2
30 fast_iload #6
32 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  88  bci: 32   CounterData         count(48335)
35 astore #4
37 fast_aaccess_0
38 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
41 aload_3
42 fast_iload #6
44 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  104 bci: 44   CounterData         count(48335)
47 astore #5
49 aload #4
51 aload #5
53 invokevirtual 28 <jdk/incubator/vector/IntVector.add(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;> 
  120 bci: 53   VirtualCallData     count(48335) nonprofiled_count(0) entries(0)
56 aload_1
57 fast_iload #6
59 invokevirtual 32 <jdk/incubator/vector/IntVector.intoArray([II)V> 
  176 bci: 59   VirtualCallData     count(48335) nonprofiled_count(0) entries(0)
62 fast_iload #6
64 fast_aaccess_0
65 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
68 invokeinterface 36 <jdk/incubator/vector/VectorSpecies.length()I> 
  232 bci: 68   VirtualCallData     count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/IntVector$IntSpecies'(48335 1.00)
73 iadd
74 istore #6
76 goto 9
  288 bci: 76   JumpData            taken(48335) displacement(-288)
79 fast_iload #6
81 aload_1
82 arraylength
83 if_icmpge 105
  312 bci: 83   BranchData          taken(378) displacement(56)
                                    not taken(378)
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
  344 bci: 102  JumpData            taken(378) displacement(-32)
105 return
------------------------------------------------------------------------
Total MDO size: 880 bytes
