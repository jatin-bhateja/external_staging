CompileCommand: print mul.workload bool print = true

============================= C2-compiled nmethod ==============================
#r018 rsi:rsi   : parm 0: int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact *
#r016 rdx:rdx   : parm 1: int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact *
# -- Old rsp -- Framesize: 96 --
#r591 rsp+92: in_preserve
#r590 rsp+88: return address
#r589 rsp+84: in_preserve
#r588 rsp+80: saved fp register
#r587 rsp+76: pad2, stack alignment
#r586 rsp+72: pad2, stack alignment
#r585 rsp+68: Fixed slot 1
#r584 rsp+64: Fixed slot 0
#r607 rsp+60: spill
#r606 rsp+56: spill
#r605 rsp+52: spill
#r604 rsp+48: spill
#r603 rsp+44: spill
#r602 rsp+40: spill
#r601 rsp+36: spill
#r600 rsp+32: spill
#r599 rsp+28: spill
#r598 rsp+24: spill
#r597 rsp+20: outgoing argument
#r596 rsp+16: outgoing argument
#r595 rsp+12: outgoing argument
#r594 rsp+ 8: outgoing argument
#r593 rsp+ 4: outgoing argument
#r592 rsp+ 0: outgoing argument
#
----------------------- MetaData before Compile_id = 272 ------------------------
{method}
 - this oop:          0x00007ff470603600
 - method holder:     'mul'
 - constants:         0x00007ff470603078 constant pool [111]/operands[10] {0x00007ff470603078} for 'mul' cache=0x00007ff470603980
 - access:            0x9  public static 
 - flags:             0x4080   queued_for_compilation  has_loops_flag_init 
 - name:              'workload'
 - signature:         '([I[I)V'
 - max stack:         5
 - max locals:        5
 - size of params:    2
 - method size:       14
 - vtable index:      -2
 - i2i entry:         0x00007ff4b500c740
 - adapters:          AHE@0x00007ff4b838f610: 0xbb i2c: 0x00007ff4b505cb80 c2i: 0x00007ff4b505cc71 c2iUV: 0x00007ff4b505cc3f c2iNCI: 0x00007ff4b505ccab
 - compiled entry     0x00007ff4b505cc71
 - code size:         46
 - code start:        0x00007ff4706035c8
 - code end (excl):   0x00007ff4706035f6
 - method data:       0x00007ff470603c30
 - checked ex length: 0
 - linenumber start:  0x00007ff4706035f6
 - localvar length:   0

------------------------ OptoAssembly for Compile_id = 272 -----------------------
#
#  void ( int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact *, int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact * )
#
000     N1: #	out( B1 ) <- in( B31 B27 B32 B23 B20 B33 B28 B34 B24 B35 B25 B21 B37 B29 B30 B26 B36 B19 B22 )  Freq: 1

000     B1: #	out( B31 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
000     # stack bang (504 bytes)
	pushq   rbp	# Save rbp
	subq    rsp, #80	# Create frame

01a     movq    [rsp + #32], RDX	# spill
01f     movq    [rsp + #24], RSI	# spill
024     movq    R10, java/lang/Class (java/io/Serializable,java/lang/constant/Constable,java/lang/reflect/AnnotatedElement,java/lang/invoke/TypeDescriptor,java/lang/reflect/GenericDeclaration,java/lang/reflect/Type,java/lang/invoke/TypeDescriptor$OfField):exact *	# ptr
02e     movl    R9, [R10 + #112 (8-bit)]	# compressed ptr ! Field: mul.SPECIES
032     movl    R8, [R10 + #116 (8-bit)]	# compressed ptr ! Field: mul.mask_arr
        nop 	# 10 bytes pad for loops and calls
040     movl    R10, [R12 + R9 << 3 + #8] (compressed oop addressing)	# compressed klass ptr
045     NullCheck R9

045     B2: #	out( B27 B3 ) <- in( B1 )  Freq: 0.999999
045     cmpl    R10, narrowklass: precise jdk/incubator/vector/IntVector$IntSpecies: 0x00007ff430021118 (jdk/incubator/vector/VectorSpecies):Constant:exact *	# compressed klass ptr
04c     jne,u   B27  P=0.000000 C=-1.000000

052     B3: #	out( B32 B4 ) <- in( B2 )  Freq: 0.999999
052     movl    R10, [R12 + R8 << 3 + #12] (compressed oop addressing)	# range
057     NullCheck R8

057     B4: #	out( B23 B5 ) <- in( B3 )  Freq: 0.999998
057     decode_heap_oop_not_null R11,R9
05b     movq    RBX, R11	# spill
05e     # checkcastPP of RBX
05e     movl    R11, [RBX + #12 (8-bit)]	# int ! Field: jdk/incubator/vector/AbstractSpecies.laneCount (constant)
062     subl    R10, R11	# int
065     leal    RBP, [R10 + #1]
069     testl   RBP, RBP
06b     jl     B23  P=0.000001 C=-1.000000

071     B5: #	out( B20 B6 ) <- in( B4 )  Freq: 0.999997
071     cmpl    R10, #-1
075     je     B20  P=0.000001 C=-1.000000

07b     B6: #	out( B30 B7 ) <- in( B5 )  Freq: 0.999996
07b     movl    R9, [RBX + #48 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.maskType (constant)
07f     decode_heap_oop_not_null R8,R8
083     decode_heap_oop RSI,R9
0ab     movl    R9, #16	# long (unsigned 32-bit)
0b1     movq    RDX, java/lang/Class (java/io/Serializable,java/lang/constant/Constable,java/lang/reflect/AnnotatedElement,java/lang/invoke/TypeDescriptor,java/lang/reflect/GenericDeclaration,java/lang/reflect/Type,java/lang/invoke/TypeDescriptor$OfField):exact *	# ptr
0bb     movl    RCX, R11	# spill
0be     movq    RDI, R8	# spill
0c1     xorl    R10, R10	# long
0c4     movq    [rsp + #0], R10	# spill
0c8     movq    [rsp + #8], RBX	# spill
0cd     movq    R10, jdk/incubator/vector/VectorMask$$Lambda+0x00000008000e1098 (jdk/internal/vm/vector/VectorSupport$LoadOperation):exact *	# ptr
0d7     movq    [rsp + #16], R10	# spill
0dc     call,static  jdk.internal.vm.vector.VectorSupport::load
        # jdk.incubator.vector.VectorMask::fromArray @ bci:47 (line 208) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # mul::workload @ bci:7 (line 8) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=_ L[3]=_ L[4]=_
        # OopMap {[24]=Oop [32]=Oop off=228/0xe4}

0ec     B7: #	out( B33 B8 ) <- in( B6 )  Freq: 0.999976
        # Block is sole successor of call
0ec     movl    R10, [RAX + #8 (8-bit)]	# compressed klass ptr
0f0     NullCheck RAX

0f0     B8: #	out( B28 B9 ) <- in( B7 )  Freq: 0.999975
0f0     cmpl    R10, narrowklass: precise jdk/incubator/vector/Int256Vector$Int256Mask: 0x00007ff430021278:Constant:exact *	# compressed klass ptr
0f7     jne,u   B28  P=0.000000 C=-1.000000

0fd     B9: #	out( B34 B10 ) <- in( B8 )  Freq: 0.999975
0fd     movq    R10, java/lang/Class (java/io/Serializable,java/lang/constant/Constable,java/lang/reflect/AnnotatedElement,java/lang/invoke/TypeDescriptor,java/lang/reflect/GenericDeclaration,java/lang/reflect/Type,java/lang/invoke/TypeDescriptor$OfField):exact *	# ptr
107     movl    RBP, [R10 + #112 (8-bit)]	# compressed ptr ! Field: mul.SPECIES
10b     movl    R10, [R12 + RBP << 3 + #8] (compressed oop addressing)	# compressed klass ptr
110     NullCheck RBP

110     B10: #	out( B24 B11 ) <- in( B9 )  Freq: 0.999974
110     # checkcastPP of RAX
110     cmpl    R10, narrowklass: precise jdk/incubator/vector/IntVector$IntSpecies: 0x00007ff430021118 (jdk/incubator/vector/VectorSpecies):Constant:exact *	# compressed klass ptr
117     jne,u   B24  P=0.000001 C=-1.000000

11d     B11: #	out( B35 B12 ) <- in( B10 )  Freq: 0.999973
11d     movq    R8, [rsp + #24]	# spill
122     movl    R10, [R8 + #12 (8-bit)]	# range
126     NullCheck R8

126     B12: #	out( B25 B13 ) <- in( B11 )  Freq: 0.999972
126     decode_heap_oop_not_null R9,RBP
12a     # checkcastPP of R9
12a     movl    R11, [R9 + #12 (8-bit)]	# int ! Field: jdk/incubator/vector/AbstractSpecies.laneCount (constant)
12e     subl    R10, R11	# int
131     leal    RBP, [R10 + #1]
135     testl   RBP, RBP
137     jl     B25  P=0.000001 C=-1.000000

13d     B13: #	out( B21 B14 ) <- in( B12 )  Freq: 0.999971
        nop 	# 3 bytes pad for loops and calls
140     cmpl    R10, #-1
144     je     B21  P=0.000001 C=-1.000000

14a     B14: #	out( B37 B15 ) <- in( B13 )  Freq: 0.99997
14a     movl    RBP, [R9 + #72 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.dummyVector (constant)
14e     movl    R11, [R12 + RBP << 3 + #8] (compressed oop addressing)	# compressed klass ptr
153     NullCheck RBP

153     B15: #	out( B29 B16 ) <- in( B14 )  Freq: 0.999969
        nop 	# 13 bytes pad for loops and calls
160     cmpl    R11, narrowklass: precise jdk/incubator/vector/Int256Vector: 0x00007ff43001ba58:Constant:exact *	# compressed klass ptr
167     jne,u   B29  P=0.000000 C=-1.000000

16d     B16: #	out( B36 B17 ) <- in( B15 )  Freq: 0.999969
16d     movq    R9, [rsp + #32]	# spill
172     movl    R11, [R9 + #12 (8-bit)]	# range
176     NullCheck R9

176     B17: #	out( B26 B18 ) <- in( B16 )  Freq: 0.999968
176     movl    R10, [RAX + #12 (8-bit)]	# compressed ptr ! Field: jdk/internal/vm/vector/VectorSupport$VectorPayload.payload (constant)
17a     load_vector XMM2,[R8 + #16 (8-bit)]
180     load_vector XMM0,[R12 + R10 << 3 + #16] (compressed oop addressing)
187     leal    RBP, [R11 + #-7]
18b     vector_loadmask_byte K7, XMM0	! using XMM1 as TEMP
199     vpmul_masked XMM2, XMM2, XMM2, K7	! mul masked operation
        nop 	# 1 bytes pad for loops and calls
1a0     testl   RBP, RBP
1a2     jl     B26  P=0.000001 C=-1.000000

1a8     B18: #	out( B22 B19 ) <- in( B17 )  Freq: 0.999967
1a8     cmpl    R11, #7
1ac     je     B22  P=0.000001 C=-1.000000

1b2     B19: #	out( N1 ) <- in( B18 )  Freq: 0.999966
1b2     store_vector [R9 + #16 (8-bit)],XMM2
	
1b8     vzeroupper
	addq    rsp, 80	# Destroy frame
	popq    rbp
	cmpq    rsp, poll_offset[r15_thread] 
	ja      #safepoint_stub	# Safepoint: poll for GC

1cd     ret

1ce     B20: #	out( N1 ) <- in( B5 )  Freq: 1.01328e-06
1ce     movl    RSI, #-28	# int
1d3     movl    [rsp + #40], R8	# spill
1d8     movq    [rsp + #48], RBX	# spill
1dd     movl    [rsp + #44], R11	# spill
        nop 	# 2 bytes pad for loops and calls
1e4     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 385) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#null
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.VectorMask::fromArray @ bci:16 (line 207) L[0]=_ L[1]=rsp + #40 L[2]=_ L[3]=rsp + #48 L[4]=rsp + #44
        # mul::workload @ bci:7 (line 8) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=_ L[3]=_ L[4]=_
        # OopMap {[24]=Oop [32]=Oop [40]=NarrowOop [48]=Oop off=492/0x1ec}
1f4     stop	# ShouldNotReachHere

208     B21: #	out( N1 ) <- in( B13 )  Freq: 1.01325e-06
208     movl    RSI, #-28	# int
20d     movq    [rsp + #48], RAX	# spill
212     movq    [rsp + #56], R9	# spill
        nop 	# 1 bytes pad for loops and calls
218     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 385) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#null
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2941) L[0]=rsp + #56 L[1]=rsp + #24 L[2]=_ L[3]=_
        # mul::workload @ bci:16 (line 9) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=rsp + #48 L[3]=_ L[4]=_
        # OopMap {[24]=Oop [32]=Oop [48]=Oop [56]=Oop off=544/0x220}
228     stop	# ShouldNotReachHere

23c     B22: #	out( N1 ) <- in( B18 )  Freq: 1.01325e-06
23c     movl    RSI, #-28	# int
241     movq    [rsp + #24], R9	# spill
246     vmovdqu [rsp + 32],XMM2	# spill
24c     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 385) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#null
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:7 (line 3214) L[0]=#ScObj0 L[1]=rsp + #24 L[2]=_ L[3]=_
        # ScObj0 jdk/incubator/vector/Int256Vector={ [payload :0]=rsp + #32 }
        # mul::workload @ bci:42 (line 11) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # OopMap {[24]=Oop off=596/0x254}
25c     stop	# ShouldNotReachHere

270     B23: #	out( N1 ) <- in( B4 )  Freq: 9.99998e-07
270     movl    RSI, #-52	# int
275     movl    [rsp + #40], R8	# spill
27a     movq    [rsp + #48], RBX	# spill
27f     movl    [rsp + #44], R11	# spill
284     call,static  wrapper for: uncommon_trap(reason='intrinsic_or_type_checked_inlining' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 385) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#null
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.VectorMask::fromArray @ bci:16 (line 207) L[0]=_ L[1]=rsp + #40 L[2]=_ L[3]=rsp + #48 L[4]=rsp + #44
        # mul::workload @ bci:7 (line 8) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=_ L[3]=_ L[4]=_
        # OopMap {[24]=Oop [32]=Oop [40]=NarrowOop [48]=Oop off=652/0x28c}
294     stop	# ShouldNotReachHere

2a8     B24: #	out( N1 ) <- in( B10 )  Freq: 9.99974e-07
2a8     movl    RSI, #-34	# int
2ad     movq    [rsp + #48], RAX	# spill
        nop 	# 2 bytes pad for loops and calls
2b4     call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:2 (line 2941) L[0]=RBP L[1]=rsp + #24 L[2]=_ L[3]=_ STK[0]=#0 STK[1]=RBP
        # mul::workload @ bci:16 (line 9) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=rsp + #48 L[3]=_ L[4]=_
        # OopMap {rbp=NarrowOop [24]=Oop [32]=Oop [48]=Oop off=700/0x2bc}
2c4     stop	# ShouldNotReachHere

2d8     B25: #	out( N1 ) <- in( B12 )  Freq: 9.99972e-07
2d8     movl    RSI, #-52	# int
2dd     movq    [rsp + #48], RAX	# spill
2e2     movq    [rsp + #56], R9	# spill
        nop 	# 1 bytes pad for loops and calls
2e8     call,static  wrapper for: uncommon_trap(reason='intrinsic_or_type_checked_inlining' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 385) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#null
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2941) L[0]=rsp + #56 L[1]=rsp + #24 L[2]=_ L[3]=_
        # mul::workload @ bci:16 (line 9) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=rsp + #48 L[3]=_ L[4]=_
        # OopMap {[24]=Oop [32]=Oop [48]=Oop [56]=Oop off=752/0x2f0}
2f8     stop	# ShouldNotReachHere

30c     B26: #	out( N1 ) <- in( B17 )  Freq: 9.99968e-07
30c     movl    RSI, #-52	# int
311     movq    [rsp + #24], R9	# spill
316     vmovdqu [rsp + 32],XMM2	# spill
31c     call,static  wrapper for: uncommon_trap(reason='intrinsic_or_type_checked_inlining' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 385) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#null
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:7 (line 3214) L[0]=#ScObj0 L[1]=rsp + #24 L[2]=_ L[3]=_
        # ScObj0 jdk/incubator/vector/Int256Vector={ [payload :0]=rsp + #32 }
        # mul::workload @ bci:42 (line 11) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # OopMap {[24]=Oop off=804/0x324}
32c     stop	# ShouldNotReachHere

340     B27: #	out( N1 ) <- in( B2 )  Freq: 1e-35
340     movl    RSI, #-34	# int
345     movq    RBP, [rsp + #24]	# spill
34a     movq    [rsp + #24], RDX	# spill
34f     movl    [rsp + #32], R8	# spill
354     movl    [rsp + #36], R9	# spill
        nop 	# 3 bytes pad for loops and calls
35c     call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.VectorMask::fromArray @ bci:1 (line 205) L[0]=_ L[1]=rsp + #32 L[2]=#0 L[3]=_ L[4]=_ STK[0]=rsp + #36
        # mul::workload @ bci:7 (line 8) L[0]=RBP L[1]=rsp + #24 L[2]=_ L[3]=_ L[4]=_
        # OopMap {rbp=Oop [24]=Oop [32]=NarrowOop [36]=NarrowOop off=868/0x364}
36c     stop	# ShouldNotReachHere

380     B28: #	out( N1 ) <- in( B8 )  Freq: 1e-35
380     movl    RSI, #-34	# int
385     movq    RBP, [rsp + #24]	# spill
38a     movq    R10, [rsp + #32]	# spill
38f     movq    [rsp + #24], R10	# spill
394     movq    [rsp + #32], RAX	# spill
        nop 	# 3 bytes pad for loops and calls
39c     call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.VectorMask::fromArray @ bci:50 (line 208) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ STK[0]=rsp + #32
        # mul::workload @ bci:7 (line 8) L[0]=RBP L[1]=rsp + #24 L[2]=_ L[3]=_ L[4]=_
        # OopMap {rbp=Oop [24]=Oop [32]=Oop off=932/0x3a4}
3ac     stop	# ShouldNotReachHere

3c0     B29: #	out( N1 ) <- in( B15 )  Freq: 1e-35
3c0     movl    RSI, #-34	# int
3c5     movq    [rsp + #48], RAX	# spill
        nop 	# 2 bytes pad for loops and calls
3cc     call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector$IntSpecies::dummyVector @ bci:4 (line 3907) L[0]=_ STK[0]=RBP
        # jdk.incubator.vector.IntVector::fromArray @ bci:19 (line 2943) L[0]=_ L[1]=rsp + #24 L[2]=#0 L[3]=_
        # mul::workload @ bci:16 (line 9) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=rsp + #48 L[3]=_ L[4]=_
        # OopMap {rbp=NarrowOop [24]=Oop [32]=Oop [48]=Oop off=980/0x3d4}
3dc     stop	# ShouldNotReachHere

3f0     B30: #	out( N1 ) <- in( B6 )  Freq: 9.99996e-06
3f0     # exception oop is in rax; no code emitted
3f0     movq    RSI, RAX	# spill
3f3     vzeroupper
	addq    rsp, 80	# Destroy frame
	popq    rbp

3fb     jmp     rethrow_stub

400     B31: #	out( N1 ) <- in( B1 )  Freq: 1.01328e-06
400     movl    RSI, #-12	# int
405     movq    RBP, [rsp + #24]	# spill
40a     movq    [rsp + #24], RDX	# spill
40f     movl    [rsp + #32], R8	# spill
414     call,static  wrapper for: uncommon_trap(reason='null_check' action='make_not_entrant' debug_id='0')
        # jdk.incubator.vector.VectorMask::fromArray @ bci:1 (line 205) L[0]=_ L[1]=rsp + #32 L[2]=#0 L[3]=_ L[4]=_ STK[0]=#null
        # mul::workload @ bci:7 (line 8) L[0]=RBP L[1]=rsp + #24 L[2]=_ L[3]=_ L[4]=_
        # OopMap {rbp=Oop [24]=Oop [32]=NarrowOop off=1052/0x41c}
424     stop	# ShouldNotReachHere

438     B32: #	out( N1 ) <- in( B3 )  Freq: 1.01328e-06
438     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
440     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.VectorMask::fromArray @ bci:15 (line 207) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ STK[0]=_ STK[1]=_ STK[2]=#null
        # mul::workload @ bci:7 (line 8) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # OopMap {off=1096/0x448}
450     stop	# ShouldNotReachHere

464     B33: #	out( N1 ) <- in( B7 )  Freq: 1.01325e-06
464     movl    RSI, #-12	# int
469     movq    RBP, [rsp + #24]	# spill
        nop 	# 2 bytes pad for loops and calls
470     call,static  wrapper for: uncommon_trap(reason='null_check' action='make_not_entrant' debug_id='0')
        # jdk.incubator.vector.VectorMask::fromArray @ bci:50 (line 208) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ STK[0]=#null
        # mul::workload @ bci:7 (line 8) L[0]=RBP L[1]=rsp + #32 L[2]=_ L[3]=_ L[4]=_
        # OopMap {rbp=Oop [32]=Oop off=1144/0x478}
480     stop	# ShouldNotReachHere

494     B34: #	out( N1 ) <- in( B9 )  Freq: 1.01325e-06
494     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
49c     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:2 (line 2941) L[0]=_ L[1]=_ L[2]=_ L[3]=_ STK[0]=_ STK[1]=#null
        # mul::workload @ bci:16 (line 9) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # OopMap {off=1188/0x4a4}
4ac     stop	# ShouldNotReachHere

4c0     B35: #	out( N1 ) <- in( B11 )  Freq: 1.01325e-06
4c0     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
4c8     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:8 (line 2941) L[0]=_ L[1]=_ L[2]=_ L[3]=_ STK[0]=_ STK[1]=_ STK[2]=#null
        # mul::workload @ bci:16 (line 9) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # OopMap {off=1232/0x4d0}
4d8     stop	# ShouldNotReachHere

4ec     B36: #	out( N1 ) <- in( B16 )  Freq: 1.01325e-06
4ec     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
4f4     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::intoArray @ bci:6 (line 3214) L[0]=_ L[1]=_ L[2]=_ L[3]=_ STK[0]=_ STK[1]=_ STK[2]=#null
        # mul::workload @ bci:42 (line 11) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # OopMap {off=1276/0x4fc}
504     stop	# ShouldNotReachHere

518     B37: #	out( N1 ) <- in( B14 )  Freq: 4.76823e-07
518     movl    RSI, #-187	# int
51d     movq    [rsp + #48], RAX	# spill
522     movq    [rsp + #56], R9	# spill
        nop 	# 1 bytes pad for loops and calls
528     call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.AbstractSpecies::dummyVector @ bci:6 (line 318) L[0]=rsp + #56 L[1]=RBP STK[0]=RBP
        # jdk.incubator.vector.IntVector$IntSpecies::dummyVector @ bci:1 (line 3907) L[0]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:19 (line 2943) L[0]=_ L[1]=rsp + #24 L[2]=#0 L[3]=_
        # mul::workload @ bci:16 (line 9) L[0]=rsp + #24 L[1]=rsp + #32 L[2]=rsp + #48 L[3]=_ L[4]=_
        # OopMap {rbp=NarrowOop [24]=Oop [32]=Oop [48]=Oop [56]=Oop off=1328/0x530}
538     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    1913  272             mul::workload (46 bytes)
 total in heap  [0x00007ff4b5208a10,0x00007ff4b5209a30] = 4128
 relocation     [0x00007ff4b5208b80,0x00007ff4b5208ce0] = 352
 main code      [0x00007ff4b5208ce0,0x00007ff4b5209250] = 1392
 stub code      [0x00007ff4b5209250,0x00007ff4b5209278] = 40
 oops           [0x00007ff4b5209278,0x00007ff4b5209288] = 16
 metadata       [0x00007ff4b5209288,0x00007ff4b5209368] = 224
 scopes data    [0x00007ff4b5209368,0x00007ff4b52095f8] = 656
 scopes pcs     [0x00007ff4b52095f8,0x00007ff4b52099b8] = 960
 dependencies   [0x00007ff4b52099b8,0x00007ff4b52099d8] = 32
 handler table  [0x00007ff4b52099d8,0x00007ff4b52099f0] = 24
 nul chk table  [0x00007ff4b52099f0,0x00007ff4b5209a30] = 64

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007ff470603600} 'workload' '([I[I)V' in 'mul'
  # parm0:    rsi:rsi   = '[I'
  # parm1:    rdx:rdx   = '[I'
  #           [sp+0x60]  (sp of caller)
 ;; N1: #	out( B1 ) <- in( B31 B27 B32 B23 B20 B33 B28 B34 B24 B35 B25 B21 B37 B29 B30 B26 B36 B19 B22 )  Freq: 1
 ;; B1: #	out( B31 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007ff4b5208ce0:   mov    %eax,-0x18000(%rsp)
  0x00007ff4b5208ce7:   push   %rbp
  0x00007ff4b5208ce8:   sub    $0x50,%rsp
  0x00007ff4b5208cec:   cmpl   $0x1,0x20(%r15)
  0x00007ff4b5208cf4:   jne    0x00007ff4b5209242           ;*synchronization entry
                                                            ; - mul::workload@-1 (line 8)
  0x00007ff4b5208cfa:   mov    %rdx,0x20(%rsp)
  0x00007ff4b5208cff:   mov    %rsi,0x18(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b5208d04:   movabs $0x11f91fc88,%r10            ;   {oop(a 'java/lang/Class'{0x000000011f91fc88} = 'mul')}
  0x00007ff4b5208d0e:   mov    0x70(%r10),%r9d              ;*getstatic SPECIES {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - mul::workload@0 (line 8)
  0x00007ff4b5208d12:   mov    0x74(%r10),%r8d              ;*getstatic mask_arr {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - mul::workload@3 (line 8)
  0x00007ff4b5208d16:   nop
  0x00007ff4b5208d17:   nop
  0x00007ff4b5208d18:   nop
  0x00007ff4b5208d19:   nop
  0x00007ff4b5208d1a:   nop
  0x00007ff4b5208d1b:   nop
  0x00007ff4b5208d1c:   nop
  0x00007ff4b5208d1d:   nop
  0x00007ff4b5208d1e:   nop
  0x00007ff4b5208d1f:   nop
  0x00007ff4b5208d20:   mov    0x8(%r12,%r9,8),%r10d        ; implicit exception: dispatches to 0x00007ff4b52090e0
 ;; B2: #	out( B27 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007ff4b5208d25:   cmp    $0xd9fa8,%r10d               ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
                                                            ;   {metadata('jdk/incubator/vector/IntVector$IntSpecies')}
  0x00007ff4b5208d2c:   jne    0x00007ff4b5209020
 ;; B3: #	out( B32 B4 ) <- in( B2 )  Freq: 0.999999
  0x00007ff4b5208d32:   mov    0xc(%r12,%r8,8),%r10d        ; implicit exception: dispatches to 0x00007ff4b5209118
 ;; B4: #	out( B23 B5 ) <- in( B3 )  Freq: 0.999998
  0x00007ff4b5208d37:   lea    (%r12,%r9,8),%r11
  0x00007ff4b5208d3b:   mov    %r11,%rbx                    ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@1 (line 205)
                                                            ; - mul::workload@7 (line 8)
  0x00007ff4b5208d3e:   mov    0xc(%rbx),%r11d              ;*getfield laneCount {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::laneCount@1 (line 130)
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@6 (line 206)
                                                            ; - mul::workload@7 (line 8)
  0x00007ff4b5208d42:   sub    %r11d,%r10d
  0x00007ff4b5208d45:   lea    0x1(%r10),%ebp
  0x00007ff4b5208d49:   test   %ebp,%ebp
  0x00007ff4b5208d4b:   jl     0x00007ff4b5208f50
 ;; B5: #	out( B20 B6 ) <- in( B4 )  Freq: 0.999997
  0x00007ff4b5208d51:   cmp    $0xffffffff,%r10d
  0x00007ff4b5208d55:   je     0x00007ff4b5208eae
 ;; B6: #	out( B30 B7 ) <- in( B5 )  Freq: 0.999996
  0x00007ff4b5208d5b:   mov    0x30(%rbx),%r9d
  0x00007ff4b5208d5f:   shl    $0x3,%r8                     ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b5208d63:   mov    %r9,%rsi
  0x00007ff4b5208d66:   cmp    0xb42bb43(%rip),%r12        # 0x00007ff4c06348b0
                                                            ;   {external_word}
  0x00007ff4b5208d6d:   je     0x00007ff4b5208d87
 ;; MacroAssembler::decode_heap_oop: heap base corrupted?
  0x00007ff4b5208d73:   movabs $0x7ff4bfbfb4b0,%rdi         ;   {external_word}
  0x00007ff4b5208d7d:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b5208d81:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b5208d86:   hlt    
  0x00007ff4b5208d87:   shl    $0x3,%rsi
  0x00007ff4b5208d8b:   mov    $0x10,%r9d
  0x00007ff4b5208d91:   movabs $0x11f0002a0,%rdx            ;   {oop(a 'java/lang/Class'{0x000000011f0002a0} = int)}
  0x00007ff4b5208d9b:   mov    %r11d,%ecx
  0x00007ff4b5208d9e:   mov    %r8,%rdi
  0x00007ff4b5208da1:   xor    %r10d,%r10d
  0x00007ff4b5208da4:   mov    %r10,(%rsp)
  0x00007ff4b5208da8:   mov    %rbx,0x8(%rsp)
  0x00007ff4b5208dad:   movabs $0x11f953ec0,%r10            ;   {oop(a 'jdk/incubator/vector/VectorMask$$Lambda+0x00000008000e1098'{0x000000011f953ec0})}
  0x00007ff4b5208db7:   mov    %r10,0x10(%rsp)
  0x00007ff4b5208dbc:   vzeroupper 
  0x00007ff4b5208dbf:   callq  0x00007ff4b51fd9e0           ; ImmutableOopMap {[24]=Oop [32]=Oop }
                                                            ;*invokestatic load {reexecute=0 rethrow=0 return_oop=1}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@47 (line 208)
                                                            ; - mul::workload@7 (line 8)
                                                            ;   {static_call}
  0x00007ff4b5208dc4:   nopl   0x3b4(%rax,%rax,1)           ;   {other}
 ;; B7: #	out( B33 B8 ) <- in( B6 )  Freq: 0.999976
  0x00007ff4b5208dcc:   mov    0x8(%rax),%r10d              ; implicit exception: dispatches to 0x00007ff4b5209144
 ;; B8: #	out( B28 B9 ) <- in( B7 )  Freq: 0.999975
  0x00007ff4b5208dd0:   cmp    $0xde730,%r10d               ;   {metadata('jdk/incubator/vector/Int256Vector$Int256Mask')}
  0x00007ff4b5208dd7:   jne    0x00007ff4b5209060           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
 ;; B9: #	out( B34 B10 ) <- in( B8 )  Freq: 0.999975
  0x00007ff4b5208ddd:   movabs $0x11f91fc88,%r10            ;   {oop(a 'java/lang/Class'{0x000000011f91fc88} = 'mul')}
  0x00007ff4b5208de7:   mov    0x70(%r10),%ebp              ;*getstatic SPECIES {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - mul::workload@11 (line 9)
  0x00007ff4b5208deb:   mov    0x8(%r12,%rbp,8),%r10d       ; implicit exception: dispatches to 0x00007ff4b5209174
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@50 (line 208)
                                                            ; - mul::workload@7 (line 8)
 ;; B10: #	out( B24 B11 ) <- in( B9 )  Freq: 0.999974
  0x00007ff4b5208df0:   cmp    $0xd9fa8,%r10d               ;   {metadata('jdk/incubator/vector/IntVector$IntSpecies')}
  0x00007ff4b5208df7:   jne    0x00007ff4b5208f88
 ;; B11: #	out( B35 B12 ) <- in( B10 )  Freq: 0.999973
  0x00007ff4b5208dfd:   mov    0x18(%rsp),%r8               ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b5208e02:   mov    0xc(%r8),%r10d               ; implicit exception: dispatches to 0x00007ff4b52091a0
 ;; B12: #	out( B25 B13 ) <- in( B11 )  Freq: 0.999972
  0x00007ff4b5208e06:   lea    (%r12,%rbp,8),%r9            ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@2 (line 2941)
                                                            ; - mul::workload@16 (line 9)
  0x00007ff4b5208e0a:   mov    0xc(%r9),%r11d               ;*getfield laneCount {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::length@1 (line 121)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@2 (line 2941)
                                                            ; - mul::workload@16 (line 9)
  0x00007ff4b5208e0e:   sub    %r11d,%r10d
  0x00007ff4b5208e11:   lea    0x1(%r10),%ebp
  0x00007ff4b5208e15:   test   %ebp,%ebp
  0x00007ff4b5208e17:   jl     0x00007ff4b5208fb8
 ;; B13: #	out( B21 B14 ) <- in( B12 )  Freq: 0.999971
  0x00007ff4b5208e1d:   nop
  0x00007ff4b5208e1e:   nop
  0x00007ff4b5208e1f:   nop
  0x00007ff4b5208e20:   cmp    $0xffffffff,%r10d
  0x00007ff4b5208e24:   je     0x00007ff4b5208ee8           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
 ;; B14: #	out( B37 B15 ) <- in( B13 )  Freq: 0.99997
  0x00007ff4b5208e2a:   mov    0x48(%r9),%ebp               ;*getfield dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 317)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3907)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2943)
                                                            ; - mul::workload@16 (line 9)
  0x00007ff4b5208e2e:   mov    0x8(%r12,%rbp,8),%r11d       ; implicit exception: dispatches to 0x00007ff4b52091f8
 ;; B15: #	out( B29 B16 ) <- in( B14 )  Freq: 0.999969
  0x00007ff4b5208e33:   nop
  0x00007ff4b5208e34:   nop
  0x00007ff4b5208e35:   nop
  0x00007ff4b5208e36:   nop
  0x00007ff4b5208e37:   nop
  0x00007ff4b5208e38:   nop
  0x00007ff4b5208e39:   nop
  0x00007ff4b5208e3a:   nop
  0x00007ff4b5208e3b:   nop
  0x00007ff4b5208e3c:   nop
  0x00007ff4b5208e3d:   nop
  0x00007ff4b5208e3e:   nop
  0x00007ff4b5208e3f:   nop
  0x00007ff4b5208e40:   cmp    $0xde0a0,%r11d               ;   {metadata('jdk/incubator/vector/Int256Vector')}
  0x00007ff4b5208e47:   jne    0x00007ff4b52090a0
 ;; B16: #	out( B36 B17 ) <- in( B15 )  Freq: 0.999969
  0x00007ff4b5208e4d:   mov    0x20(%rsp),%r9
  0x00007ff4b5208e52:   mov    0xc(%r9),%r11d               ; implicit exception: dispatches to 0x00007ff4b52091cc
 ;; B17: #	out( B26 B18 ) <- in( B16 )  Freq: 0.999968
  0x00007ff4b5208e56:   mov    0xc(%rax),%r10d              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b5208e5a:   vmovdqu 0x10(%r8),%ymm2             ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@32 (line 3430)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 880)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2943)
                                                            ; - mul::workload@16 (line 9)
  0x00007ff4b5208e60:   vmovq  0x10(%r12,%r10,8),%xmm0
  0x00007ff4b5208e67:   lea    -0x7(%r11),%ebp
  0x00007ff4b5208e6b:   vpxor  %xmm1,%xmm1,%xmm1
  0x00007ff4b5208e6f:   vpsubb %xmm0,%xmm1,%xmm1
  0x00007ff4b5208e73:   vpmovb2m %xmm1,%k7                  ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b5208e79:   vpmulld %ymm2,%ymm2,%ymm2{%k7}      ;*invokestatic binaryOp {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@192 (line 834)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@9 (line 276)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@4 (line 41)
                                                            ; - mul::workload@37 (line 11)
  0x00007ff4b5208e7f:   nop
  0x00007ff4b5208e80:   test   %ebp,%ebp
  0x00007ff4b5208e82:   jl     0x00007ff4b5208fec
 ;; B18: #	out( B22 B19 ) <- in( B17 )  Freq: 0.999967
  0x00007ff4b5208e88:   cmp    $0x7,%r11d
  0x00007ff4b5208e8c:   je     0x00007ff4b5208f1c
 ;; B19: #	out( N1 ) <- in( B18 )  Freq: 0.999966
  0x00007ff4b5208e92:   vmovdqu %ymm2,0x10(%r9)
  0x00007ff4b5208e98:   vzeroupper 
  0x00007ff4b5208e9b:   add    $0x50,%rsp
  0x00007ff4b5208e9f:   pop    %rbp
  0x00007ff4b5208ea0:   cmp    0x488(%r15),%rsp             ;   {poll_return}
  0x00007ff4b5208ea7:   ja     0x00007ff4b520922c
  0x00007ff4b5208ead:   retq   
 ;; B20: #	out( N1 ) <- in( B5 )  Freq: 1.01328e-06
  0x00007ff4b5208eae:   mov    $0xffffffe4,%esi
  0x00007ff4b5208eb3:   mov    %r8d,0x28(%rsp)
  0x00007ff4b5208eb8:   mov    %rbx,0x30(%rsp)
  0x00007ff4b5208ebd:   mov    %r11d,0x2c(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b5208ec2:   nop
  0x00007ff4b5208ec3:   nop
  0x00007ff4b5208ec4:   vzeroupper 
  0x00007ff4b5208ec7:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {[24]=Oop [32]=Oop [40]=NarrowOop [48]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
                                                            ; - mul::workload@7 (line 8)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b5208ecc:   nopl   0x10004bc(%rax,%rax,1)       ;   {other}
  0x00007ff4b5208ed4:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b5208ede:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b5208ee2:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b5208ee7:   hlt    
 ;; B21: #	out( N1 ) <- in( B13 )  Freq: 1.01325e-06
  0x00007ff4b5208ee8:   mov    $0xffffffe4,%esi
  0x00007ff4b5208eed:   mov    %rax,0x30(%rsp)
  0x00007ff4b5208ef2:   mov    %r9,0x38(%rsp)               ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b5208ef7:   nop
  0x00007ff4b5208ef8:   vzeroupper 
  0x00007ff4b5208efb:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {[24]=Oop [32]=Oop [48]=Oop [56]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2941)
                                                            ; - mul::workload@16 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b5208f00:   nopl   0x20004f0(%rax,%rax,1)       ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
                                                            ;   {other}
  0x00007ff4b5208f08:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b5208f12:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b5208f16:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b5208f1b:   hlt    
 ;; B22: #	out( N1 ) <- in( B18 )  Freq: 1.01325e-06
  0x00007ff4b5208f1c:   mov    $0xffffffe4,%esi
  0x00007ff4b5208f21:   mov    %r9,0x18(%rsp)
  0x00007ff4b5208f26:   vmovdqu %ymm2,0x20(%rsp)
  0x00007ff4b5208f2c:   vzeroupper 
  0x00007ff4b5208f2f:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {[24]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 3214)
                                                            ; - mul::workload@42 (line 11)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b5208f34:   nopl   0x3000524(%rax,%rax,1)       ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
                                                            ;   {other}
  0x00007ff4b5208f3c:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b5208f46:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b5208f4a:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b5208f4f:   hlt    
 ;; B23: #	out( N1 ) <- in( B4 )  Freq: 9.99998e-07
  0x00007ff4b5208f50:   mov    $0xffffffcc,%esi
  0x00007ff4b5208f55:   mov    %r8d,0x28(%rsp)
  0x00007ff4b5208f5a:   mov    %rbx,0x30(%rsp)
  0x00007ff4b5208f5f:   mov    %r11d,0x2c(%rsp)
  0x00007ff4b5208f64:   vzeroupper 
  0x00007ff4b5208f67:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {[24]=Oop [32]=Oop [40]=NarrowOop [48]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
                                                            ; - mul::workload@7 (line 8)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b5208f6c:   nopl   0x400055c(%rax,%rax,1)       ;   {other}
  0x00007ff4b5208f74:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b5208f7e:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b5208f82:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b5208f87:   hlt    
 ;; B24: #	out( N1 ) <- in( B10 )  Freq: 9.99974e-07
  0x00007ff4b5208f88:   mov    $0xffffffde,%esi
  0x00007ff4b5208f8d:   mov    %rax,0x30(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b5208f92:   nop
  0x00007ff4b5208f93:   nop
  0x00007ff4b5208f94:   vzeroupper 
  0x00007ff4b5208f97:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {rbp=NarrowOop [24]=Oop [32]=Oop [48]=Oop }
                                                            ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@2 (line 2941)
                                                            ; - mul::workload@16 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b5208f9c:   nopl   0x500058c(%rax,%rax,1)       ;   {other}
  0x00007ff4b5208fa4:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b5208fae:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b5208fb2:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b5208fb7:   hlt    
 ;; B25: #	out( N1 ) <- in( B12 )  Freq: 9.99972e-07
  0x00007ff4b5208fb8:   mov    $0xffffffcc,%esi
  0x00007ff4b5208fbd:   mov    %rax,0x30(%rsp)
  0x00007ff4b5208fc2:   mov    %r9,0x38(%rsp)               ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b5208fc7:   nop
  0x00007ff4b5208fc8:   vzeroupper 
  0x00007ff4b5208fcb:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {[24]=Oop [32]=Oop [48]=Oop [56]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2941)
                                                            ; - mul::workload@16 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b5208fd0:   nopl   0x60005c0(%rax,%rax,1)       ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
                                                            ;   {other}
  0x00007ff4b5208fd8:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b5208fe2:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b5208fe6:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b5208feb:   hlt    
 ;; B26: #	out( N1 ) <- in( B17 )  Freq: 9.99968e-07
  0x00007ff4b5208fec:   mov    $0xffffffcc,%esi
  0x00007ff4b5208ff1:   mov    %r9,0x18(%rsp)
  0x00007ff4b5208ff6:   vmovdqu %ymm2,0x20(%rsp)
  0x00007ff4b5208ffc:   vzeroupper 
  0x00007ff4b5208fff:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {[24]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 3214)
                                                            ; - mul::workload@42 (line 11)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b5209004:   nopl   0x70005f4(%rax,%rax,1)       ;   {other}
  0x00007ff4b520900c:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b5209016:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b520901a:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b520901f:   hlt    
 ;; B27: #	out( N1 ) <- in( B2 )  Freq: 1e-35
  0x00007ff4b5209020:   mov    $0xffffffde,%esi
  0x00007ff4b5209025:   mov    0x18(%rsp),%rbp
  0x00007ff4b520902a:   mov    %rdx,0x18(%rsp)
  0x00007ff4b520902f:   mov    %r8d,0x20(%rsp)
  0x00007ff4b5209034:   mov    %r9d,0x24(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b5209039:   nop
  0x00007ff4b520903a:   nop
  0x00007ff4b520903b:   nop
  0x00007ff4b520903c:   vzeroupper 
  0x00007ff4b520903f:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {rbp=Oop [24]=Oop [32]=NarrowOop [36]=NarrowOop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@1 (line 205)
                                                            ; - mul::workload@7 (line 8)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b5209044:   nopl   0x8000634(%rax,%rax,1)       ;   {other}
  0x00007ff4b520904c:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b5209056:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b520905a:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b520905f:   hlt    
 ;; B28: #	out( N1 ) <- in( B8 )  Freq: 1e-35
  0x00007ff4b5209060:   mov    $0xffffffde,%esi
  0x00007ff4b5209065:   mov    0x18(%rsp),%rbp
  0x00007ff4b520906a:   mov    0x20(%rsp),%r10
  0x00007ff4b520906f:   mov    %r10,0x18(%rsp)
  0x00007ff4b5209074:   mov    %rax,0x20(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b5209079:   nop
  0x00007ff4b520907a:   nop
  0x00007ff4b520907b:   nop
  0x00007ff4b520907c:   vzeroupper 
  0x00007ff4b520907f:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@50 (line 208)
                                                            ; - mul::workload@7 (line 8)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b5209084:   nopl   0x9000674(%rax,%rax,1)       ;   {other}
  0x00007ff4b520908c:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b5209096:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b520909a:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b520909f:   hlt    
 ;; B29: #	out( N1 ) <- in( B15 )  Freq: 1e-35
  0x00007ff4b52090a0:   mov    $0xffffffde,%esi
  0x00007ff4b52090a5:   mov    %rax,0x30(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b52090aa:   nop
  0x00007ff4b52090ab:   nop
  0x00007ff4b52090ac:   vzeroupper 
  0x00007ff4b52090af:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {rbp=NarrowOop [24]=Oop [32]=Oop [48]=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3907)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2943)
                                                            ; - mul::workload@16 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b52090b4:   nopl   0xa0006a4(%rax,%rax,1)       ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
                                                            ;   {other}
  0x00007ff4b52090bc:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b52090c6:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b52090ca:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b52090cf:   hlt                                 ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@47 (line 208)
                                                            ; - mul::workload@7 (line 8)
 ;; B30: #	out( N1 ) <- in( B6 )  Freq: 9.99996e-06
  0x00007ff4b52090d0:   mov    %rax,%rsi
  0x00007ff4b52090d3:   vzeroupper 
  0x00007ff4b52090d6:   add    $0x50,%rsp
  0x00007ff4b52090da:   pop    %rbp
  0x00007ff4b52090db:   jmpq   0x00007ff4b514c9a0           ;   {runtime_call _rethrow_Java}
 ;; B31: #	out( N1 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007ff4b52090e0:   mov    $0xfffffff4,%esi
  0x00007ff4b52090e5:   mov    0x18(%rsp),%rbp
  0x00007ff4b52090ea:   mov    %rdx,0x18(%rsp)
  0x00007ff4b52090ef:   mov    %r8d,0x20(%rsp)
  0x00007ff4b52090f4:   vzeroupper 
  0x00007ff4b52090f7:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {rbp=Oop [24]=Oop [32]=NarrowOop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@1 (line 205)
                                                            ; - mul::workload@7 (line 8)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b52090fc:   nopl   0xb0006ec(%rax,%rax,1)       ;   {other}
  0x00007ff4b5209104:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b520910e:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b5209112:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b5209117:   hlt    
 ;; B32: #	out( N1 ) <- in( B3 )  Freq: 1.01328e-06
  0x00007ff4b5209118:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b520911d:   nop
  0x00007ff4b520911e:   nop
  0x00007ff4b520911f:   nop
  0x00007ff4b5209120:   vzeroupper 
  0x00007ff4b5209123:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@15 (line 207)
                                                            ; - mul::workload@7 (line 8)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b5209128:   nopl   0xc000718(%rax,%rax,1)       ;   {other}
  0x00007ff4b5209130:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b520913a:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b520913e:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b5209143:   hlt    
 ;; B33: #	out( N1 ) <- in( B7 )  Freq: 1.01325e-06
  0x00007ff4b5209144:   mov    $0xfffffff4,%esi
  0x00007ff4b5209149:   mov    0x18(%rsp),%rbp              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b520914e:   nop
  0x00007ff4b520914f:   nop
  0x00007ff4b5209150:   vzeroupper 
  0x00007ff4b5209153:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {rbp=Oop [32]=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@50 (line 208)
                                                            ; - mul::workload@7 (line 8)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b5209158:   nopl   0xd000748(%rax,%rax,1)       ;   {other}
  0x00007ff4b5209160:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b520916a:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b520916e:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b5209173:   hlt    
 ;; B34: #	out( N1 ) <- in( B9 )  Freq: 1.01325e-06
  0x00007ff4b5209174:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b5209179:   nop
  0x00007ff4b520917a:   nop
  0x00007ff4b520917b:   nop
  0x00007ff4b520917c:   vzeroupper 
  0x00007ff4b520917f:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {}
                                                            ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@2 (line 2941)
                                                            ; - mul::workload@16 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b5209184:   nopl   0xe000774(%rax,%rax,1)       ;   {other}
  0x00007ff4b520918c:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b5209196:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b520919a:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b520919f:   hlt    
 ;; B35: #	out( N1 ) <- in( B11 )  Freq: 1.01325e-06
  0x00007ff4b52091a0:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b52091a5:   nop
  0x00007ff4b52091a6:   nop
  0x00007ff4b52091a7:   nop
  0x00007ff4b52091a8:   vzeroupper 
  0x00007ff4b52091ab:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@8 (line 2941)
                                                            ; - mul::workload@16 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b52091b0:   nopl   0xf0007a0(%rax,%rax,1)       ;   {other}
  0x00007ff4b52091b8:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b52091c2:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b52091c6:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b52091cb:   hlt    
 ;; B36: #	out( N1 ) <- in( B16 )  Freq: 1.01325e-06
  0x00007ff4b52091cc:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b52091d1:   nop
  0x00007ff4b52091d2:   nop
  0x00007ff4b52091d3:   nop
  0x00007ff4b52091d4:   vzeroupper 
  0x00007ff4b52091d7:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@6 (line 3214)
                                                            ; - mul::workload@42 (line 11)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b52091dc:   nopl   0x100007cc(%rax,%rax,1)      ;   {other}
  0x00007ff4b52091e4:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b52091ee:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b52091f2:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b52091f7:   hlt    
 ;; B37: #	out( N1 ) <- in( B14 )  Freq: 4.76823e-07
  0x00007ff4b52091f8:   mov    $0xffffff45,%esi
  0x00007ff4b52091fd:   mov    %rax,0x30(%rsp)
  0x00007ff4b5209202:   mov    %r9,0x38(%rsp)               ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
  0x00007ff4b5209207:   nop
  0x00007ff4b5209208:   vzeroupper 
  0x00007ff4b520920b:   callq  0x00007ff4b5120b20           ; ImmutableOopMap {rbp=NarrowOop [24]=Oop [32]=Oop [48]=Oop [56]=Oop }
                                                            ;*ifnull {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 318)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3907)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2943)
                                                            ; - mul::workload@16 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007ff4b5209210:   nopl   0x11000800(%rax,%rax,1)      ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@42 (line 11)
                                                            ;   {other}
  0x00007ff4b5209218:   movabs $0x7ff4bf9eaf50,%rdi         ;   {external_word}
  0x00007ff4b5209222:   and    $0xfffffffffffffff0,%rsp
  0x00007ff4b5209226:   callq  0x00007ff4bef553f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007ff4b520922b:   hlt                                 ;*ifnull {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 318)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3907)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2943)
                                                            ; - mul::workload@16 (line 9)
  0x00007ff4b520922c:   movabs $0x7ff4b5208ea0,%r10         ;   {internal_word}
  0x00007ff4b5209236:   mov    %r10,0x4a0(%r15)
  0x00007ff4b520923d:   jmpq   0x00007ff4b511f9a0           ;   {runtime_call SafepointBlob}
  0x00007ff4b5209242:   callq  Stub::nmethod_entry_barrier  ;   {runtime_call StubRoutines (final stubs)}
  0x00007ff4b5209247:   jmpq   0x00007ff4b5208cfa
  0x00007ff4b520924c:   hlt    
  0x00007ff4b520924d:   hlt    
  0x00007ff4b520924e:   hlt    
  0x00007ff4b520924f:   hlt    
[Stub Code]
  0x00007ff4b5209250:   movabs $0x0,%rbx                    ;   {no_reloc}
  0x00007ff4b520925a:   jmpq   0x00007ff4b520925a           ;   {runtime_call}
[Exception Handler]
  0x00007ff4b520925f:   jmpq   0x00007ff4b5028a20           ;   {runtime_call ExceptionBlob}
[Deopt Handler Code]
  0x00007ff4b5209264:   callq  0x00007ff4b5209269
  0x00007ff4b5209269:   subq   $0x5,(%rsp)
  0x00007ff4b520926e:   jmpq   0x00007ff4b5120e60           ;   {runtime_call DeoptimizationBlob}
  0x00007ff4b5209273:   hlt    
  0x00007ff4b5209274:   hlt    
  0x00007ff4b5209275:   hlt    
  0x00007ff4b5209276:   hlt    
  0x00007ff4b5209277:   hlt    
--------------------------------------------------------------------------------
[/Disassembly]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007ff4b5209278:   0x000000011f946d80 a 'java/lang/Class'{0x000000011f946d80} = 'jdk/incubator/vector/Int256Vector'
  0x00007ff4b5209280:   0x000000011f81d798 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000011f81d798}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007ff4b5209288:   0x00007ff470603600 {method} {0x00007ff470603600} 'workload' '([I[I)V' in 'mul'
  0x00007ff4b5209290:   0x00007ff470789bd0 {method} {0x00007ff470789bd0} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
  0x00007ff4b5209298:   0x00000008000d9fa8 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007ff4b52092a0:   0x00007ff4706817d8 {method} {0x00007ff4706817d8} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[ZI)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
  0x00007ff4b52092a8:   0x00007ff4707e3058 {method} {0x00007ff4707e3058} 'laneCount' '()I' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007ff4b52092b0:   0x00000008000de730 'jdk/incubator/vector/Int256Vector$Int256Mask'
  0x00007ff4b52092b8:   0x00007ff4707893a0 {method} {0x00007ff4707893a0} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007ff4b52092c0:   0x00007ff4707e2f80 {method} {0x00007ff4707e2f80} 'length' '()I' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007ff4b52092c8:   0x00007ff4707dd5a0 {method} {0x00007ff4707dd5a0} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007ff4b52092d0:   0x00007ff4707e4940 {method} {0x00007ff4707e4940} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007ff4b52092d8:   0x00000008000de0a0 'jdk/incubator/vector/Int256Vector'
  0x00007ff4b52092e0:   0x00007ff4706a2200 {method} {0x00007ff4706a2200} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007ff4b52092e8:   0x00007ff47078a4a8 {method} {0x00007ff47078a4a8} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007ff4b52092f0:   0x00007ff4706a40f8 {method} {0x00007ff4706a40f8} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007ff4b52092f8:   0x00007ff47069ff88 {method} {0x00007ff47069ff88} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007ff4b5209300:   0x00007ff470781c98 {method} {0x00007ff470781c98} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljava/lang/Class;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007ff4b5209308:   0x00007ff4706d3370 {method} {0x00007ff4706d3370} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007ff4b5209310:   0x00007ff4701a1258 {method} {0x00007ff4701a1258} 'checkIndex' '(II)I' in 'java/util/Objects'
  0x00007ff4b5209318:   0x00007ff4707feab0 {method} {0x00007ff4707feab0} 'check' '(Ljava/lang/Class;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/AbstractMask'
  0x00007ff4b5209320:   0x00000008000dbed0 'jdk/incubator/vector/VectorMask'
  0x00007ff4b5209328:   0x00007ff4706827e0 {method} {0x00007ff4706827e0} 'check' '(Ljava/lang/Class;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
  0x00007ff4b5209330:   0x00000008000e7938 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
  0x00007ff4b5209338:   0x00007ff47063da08 {method} {0x00007ff47063da08} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007ff4b5209340:   0x00000008000e7120 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007ff4b5209348:   0x00007ff47063d540 {method} {0x00007ff47063d540} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007ff4b5209350:   0x00007ff47063d630 {method} {0x00007ff47063d630} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007ff4b5209358:   0x00007ff4707d6bc0 {method} {0x00007ff4707d6bc0} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
  0x00007ff4b5209360:   0x00000008000d8d58 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007ff4b5208cdf offset=ffffffff bits=0):
PcDesc(pc=0x00007ff4b5208cfa offset=1a bits=0):
   mul::workload@-1 (line 8)
PcDesc(pc=0x00007ff4b5208d04 offset=24 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5208d12 offset=32 bits=0):
   mul::workload@0 (line 8)
PcDesc(pc=0x00007ff4b5208d16 offset=36 bits=0):
   mul::workload@3 (line 8)
PcDesc(pc=0x00007ff4b5208d2c offset=4c bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5208d3e offset=5e bits=0):
   jdk.incubator.vector.VectorMask::fromArray@1 (line 205)
   mul::workload@7 (line 8)
PcDesc(pc=0x00007ff4b5208d42 offset=62 bits=0):
   jdk.incubator.vector.AbstractSpecies::laneCount@1 (line 130)
   jdk.incubator.vector.VectorMask::fromArray@6 (line 206)
   mul::workload@7 (line 8)
PcDesc(pc=0x00007ff4b5208d63 offset=83 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5208dc4 offset=e4 bits=4):
   jdk.incubator.vector.VectorMask::fromArray@47 (line 208)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   mul::workload@7 (line 8)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b5208ddd offset=fd bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5208deb offset=10b bits=0):
   mul::workload@11 (line 9)
PcDesc(pc=0x00007ff4b5208df0 offset=110 bits=0):
   jdk.incubator.vector.VectorMask::fromArray@50 (line 208)
   mul::workload@7 (line 8)
PcDesc(pc=0x00007ff4b5208e02 offset=122 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5208e0a offset=12a bits=0):
   jdk.incubator.vector.IntVector::fromArray@2 (line 2941)
   mul::workload@16 (line 9)
PcDesc(pc=0x00007ff4b5208e0e offset=12e bits=0):
   jdk.incubator.vector.AbstractSpecies::length@1 (line 121)
   jdk.incubator.vector.IntVector::fromArray@2 (line 2941)
   mul::workload@16 (line 9)
PcDesc(pc=0x00007ff4b5208e2a offset=14a bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5208e2e offset=14e bits=0):
   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 317)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3907)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2943)
   mul::workload@16 (line 9)
PcDesc(pc=0x00007ff4b5208e5a offset=17a bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5208e60 offset=180 bits=0):
   jdk.incubator.vector.IntVector::fromArray0Template@32 (line 3430)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 880)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2943)
   mul::workload@16 (line 9)
PcDesc(pc=0x00007ff4b5208e79 offset=199 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5208e7f offset=19f bits=0):
   jdk.incubator.vector.IntVector::lanewiseTemplate@192 (line 834)
   jdk.incubator.vector.Int256Vector::lanewise@9 (line 276)
   jdk.incubator.vector.Int256Vector::lanewise@4 (line 41)
   mul::workload@37 (line 11)
PcDesc(pc=0x00007ff4b5208ec2 offset=1e2 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5208ecc offset=1ec bits=0):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
   Locals
    - l0: empty
    - l1: stack[40],narrowoop
    - l2: empty
    - l3: stack[48],oop
    - l4: stack[44]
   mul::workload@7 (line 8)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b5208ef7 offset=217 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5208f00 offset=220 bits=0):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::fromArray@9 (line 2941)
   Locals
    - l0: stack[56],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
   mul::workload@16 (line 9)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[48],oop
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b5208f08 offset=228 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5208f34 offset=254 bits=0):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::intoArray@7 (line 3214)
   Locals
    - l0: obj[248]
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
   mul::workload@42 (line 11)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Objects
    - 248: jdk.incubator.vector.Int256Vector stack[32],vector
PcDesc(pc=0x00007ff4b5208f3c offset=25c bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5208f6c offset=28c bits=0):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
   Locals
    - l0: empty
    - l1: stack[40],narrowoop
    - l2: empty
    - l3: stack[48],oop
    - l4: stack[44]
   mul::workload@7 (line 8)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b5208f92 offset=2b2 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5208f9c offset=2bc bits=0):
   jdk.incubator.vector.IntVector::fromArray@2 (line 2941)
   Locals
    - l0: reg rbp [10],narrowoop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],narrowoop
   mul::workload@16 (line 9)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[48],oop
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b5208fc7 offset=2e7 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5208fd0 offset=2f0 bits=0):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::fromArray@9 (line 2941)
   Locals
    - l0: stack[56],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
   mul::workload@16 (line 9)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[48],oop
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b5208fd8 offset=2f8 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5209004 offset=324 bits=0):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::intoArray@7 (line 3214)
   Locals
    - l0: obj[219]
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
   mul::workload@42 (line 11)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Objects
    - 219: jdk.incubator.vector.Int256Vector stack[32],vector
PcDesc(pc=0x00007ff4b5209039 offset=359 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5209044 offset=364 bits=0):
   jdk.incubator.vector.VectorMask::fromArray@1 (line 205)
   Locals
    - l0: empty
    - l1: stack[32],narrowoop
    - l2: 0
    - l3: empty
    - l4: empty
   Expression stack
    - @0: stack[36],narrowoop
   mul::workload@7 (line 8)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b5209079 offset=399 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5209084 offset=3a4 bits=0):
   jdk.incubator.vector.VectorMask::fromArray@50 (line 208)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: stack[32],oop
   mul::workload@7 (line 8)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b52090aa offset=3ca bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b52090b4 offset=3d4 bits=0):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3907)
   Locals
    - l0: empty
   Expression stack
    - @0: reg rbp [10],narrowoop
   jdk.incubator.vector.IntVector::fromArray@19 (line 2943)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: 0
    - l3: empty
   mul::workload@16 (line 9)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[48],oop
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b52090bc offset=3dc bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b52090d0 offset=3f0 bits=0):
   jdk.incubator.vector.VectorMask::fromArray@47 (line 208)
   mul::workload@7 (line 8)
PcDesc(pc=0x00007ff4b52090fc offset=41c bits=0):
   jdk.incubator.vector.VectorMask::fromArray@1 (line 205)
   Locals
    - l0: empty
    - l1: stack[32],narrowoop
    - l2: 0
    - l3: empty
    - l4: empty
   Expression stack
    - @0: nullptr
   mul::workload@7 (line 8)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b520911d offset=43d bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5209128 offset=448 bits=0):
   jdk.incubator.vector.VectorMask::fromArray@15 (line 207)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: nullptr
   mul::workload@7 (line 8)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b520914e offset=46e bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5209158 offset=478 bits=0):
   jdk.incubator.vector.VectorMask::fromArray@50 (line 208)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: nullptr
   mul::workload@7 (line 8)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b5209179 offset=499 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5209184 offset=4a4 bits=0):
   jdk.incubator.vector.IntVector::fromArray@2 (line 2941)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: empty
    - @1: nullptr
   mul::workload@16 (line 9)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b52091a5 offset=4c5 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b52091b0 offset=4d0 bits=0):
   jdk.incubator.vector.IntVector::fromArray@8 (line 2941)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: nullptr
   mul::workload@16 (line 9)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b52091d1 offset=4f1 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b52091dc offset=4fc bits=0):
   jdk.incubator.vector.IntVector::intoArray@6 (line 3214)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: nullptr
   mul::workload@42 (line 11)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b5209207 offset=527 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b5209210 offset=530 bits=1):
   jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 318)  reexecute=true
   Locals
    - l0: stack[56],oop
    - l1: reg rbp [10],narrowoop
   Expression stack
    - @0: reg rbp [10],narrowoop
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3907)
   Locals
    - l0: empty
   jdk.incubator.vector.IntVector::fromArray@19 (line 2943)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: 0
    - l3: empty
   mul::workload@16 (line 9)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[48],oop
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007ff4b5209218 offset=538 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@42 (line 11)
PcDesc(pc=0x00007ff4b520922c offset=54c bits=0):
   jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 318)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3907)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2943)
   mul::workload@16 (line 9)
PcDesc(pc=0x00007ff4b5209279 offset=599 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 18 OopMaps

ImmutableOopMap {[24]=Oop [32]=Oop } pc offsets: 228 
ImmutableOopMap {[24]=Oop [32]=Oop [40]=NarrowOop [48]=Oop } pc offsets: 492 
ImmutableOopMap {[24]=Oop [32]=Oop [48]=Oop [56]=Oop } pc offsets: 544 
ImmutableOopMap {[24]=Oop } pc offsets: 596 
ImmutableOopMap {[24]=Oop [32]=Oop [40]=NarrowOop [48]=Oop } pc offsets: 652 
ImmutableOopMap {rbp=NarrowOop [24]=Oop [32]=Oop [48]=Oop } pc offsets: 700 
ImmutableOopMap {[24]=Oop [32]=Oop [48]=Oop [56]=Oop } pc offsets: 752 
ImmutableOopMap {[24]=Oop } pc offsets: 804 
ImmutableOopMap {rbp=Oop [24]=Oop [32]=NarrowOop [36]=NarrowOop } pc offsets: 868 
ImmutableOopMap {rbp=Oop [24]=Oop [32]=Oop } pc offsets: 932 
ImmutableOopMap {rbp=NarrowOop [24]=Oop [32]=Oop [48]=Oop } pc offsets: 980 
ImmutableOopMap {rbp=Oop [24]=Oop [32]=NarrowOop } pc offsets: 1052 
ImmutableOopMap {} pc offsets: 1096 
ImmutableOopMap {rbp=Oop [32]=Oop } pc offsets: 1144 
ImmutableOopMap {} pc offsets: 1188 1232 1276 
ImmutableOopMap {rbp=NarrowOop [24]=Oop [32]=Oop [48]=Oop [56]=Oop } pc offsets: 1328 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007ff4b5208cfa offset=1a):
   mul::workload@-1 (line 8)
ScopeDesc(pc=0x00007ff4b5208d04 offset=24):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208d04 offset=24):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5208d12 offset=32):
   mul::workload@0 (line 8)
ScopeDesc(pc=0x00007ff4b5208d16 offset=36):
   mul::workload@3 (line 8)
ScopeDesc(pc=0x00007ff4b5208d2c offset=4c):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208d2c offset=4c):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5208d3e offset=5e):
   jdk.incubator.vector.VectorMask::fromArray@1 (line 205)
ScopeDesc(pc=0x00007ff4b5208d3e offset=5e):
   mul::workload@7 (line 8)
ScopeDesc(pc=0x00007ff4b5208d42 offset=62):
   jdk.incubator.vector.AbstractSpecies::laneCount@1 (line 130)
ScopeDesc(pc=0x00007ff4b5208d42 offset=62):
   jdk.incubator.vector.VectorMask::fromArray@6 (line 206)
ScopeDesc(pc=0x00007ff4b5208d42 offset=62):
   mul::workload@7 (line 8)
ScopeDesc(pc=0x00007ff4b5208d63 offset=83):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208d63 offset=83):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5208dc4 offset=e4):
   jdk.incubator.vector.VectorMask::fromArray@47 (line 208)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b5208dc4 offset=e4):
   mul::workload@7 (line 8)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b5208ddd offset=fd):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208ddd offset=fd):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5208deb offset=10b):
   mul::workload@11 (line 9)
ScopeDesc(pc=0x00007ff4b5208df0 offset=110):
   jdk.incubator.vector.VectorMask::fromArray@50 (line 208)
ScopeDesc(pc=0x00007ff4b5208df0 offset=110):
   mul::workload@7 (line 8)
ScopeDesc(pc=0x00007ff4b5208e02 offset=122):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208e02 offset=122):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5208e0a offset=12a):
   jdk.incubator.vector.IntVector::fromArray@2 (line 2941)
ScopeDesc(pc=0x00007ff4b5208e0a offset=12a):
   mul::workload@16 (line 9)
ScopeDesc(pc=0x00007ff4b5208e0e offset=12e):
   jdk.incubator.vector.AbstractSpecies::length@1 (line 121)
ScopeDesc(pc=0x00007ff4b5208e0e offset=12e):
   jdk.incubator.vector.IntVector::fromArray@2 (line 2941)
ScopeDesc(pc=0x00007ff4b5208e0e offset=12e):
   mul::workload@16 (line 9)
ScopeDesc(pc=0x00007ff4b5208e2a offset=14a):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208e2a offset=14a):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5208e2e offset=14e):
   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 317)
ScopeDesc(pc=0x00007ff4b5208e2e offset=14e):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3907)
ScopeDesc(pc=0x00007ff4b5208e2e offset=14e):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2943)
ScopeDesc(pc=0x00007ff4b5208e2e offset=14e):
   mul::workload@16 (line 9)
ScopeDesc(pc=0x00007ff4b5208e5a offset=17a):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208e5a offset=17a):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5208e60 offset=180):
   jdk.incubator.vector.IntVector::fromArray0Template@32 (line 3430)
ScopeDesc(pc=0x00007ff4b5208e60 offset=180):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 880)
ScopeDesc(pc=0x00007ff4b5208e60 offset=180):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2943)
ScopeDesc(pc=0x00007ff4b5208e60 offset=180):
   mul::workload@16 (line 9)
ScopeDesc(pc=0x00007ff4b5208e79 offset=199):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208e79 offset=199):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5208e7f offset=19f):
   jdk.incubator.vector.IntVector::lanewiseTemplate@192 (line 834)
ScopeDesc(pc=0x00007ff4b5208e7f offset=19f):
   jdk.incubator.vector.Int256Vector::lanewise@9 (line 276)
ScopeDesc(pc=0x00007ff4b5208e7f offset=19f):
   jdk.incubator.vector.Int256Vector::lanewise@4 (line 41)
ScopeDesc(pc=0x00007ff4b5208e7f offset=19f):
   mul::workload@37 (line 11)
ScopeDesc(pc=0x00007ff4b5208ec2 offset=1e2):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208ec2 offset=1e2):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5208ecc offset=1ec):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
ScopeDesc(pc=0x00007ff4b5208ecc offset=1ec):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007ff4b5208ecc offset=1ec):
   jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
   Locals
    - l0: empty
    - l1: stack[40],narrowoop
    - l2: empty
    - l3: stack[48],oop
    - l4: stack[44]
ScopeDesc(pc=0x00007ff4b5208ecc offset=1ec):
   mul::workload@7 (line 8)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b5208ef7 offset=217):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208ef7 offset=217):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5208f00 offset=220):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
ScopeDesc(pc=0x00007ff4b5208f00 offset=220):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007ff4b5208f00 offset=220):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2941)
   Locals
    - l0: stack[56],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007ff4b5208f00 offset=220):
   mul::workload@16 (line 9)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[48],oop
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b5208f08 offset=228):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208f08 offset=228):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5208f34 offset=254):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
ScopeDesc(pc=0x00007ff4b5208f34 offset=254):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007ff4b5208f34 offset=254):
   jdk.incubator.vector.IntVector::intoArray@7 (line 3214)
   Locals
    - l0: obj[248]
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007ff4b5208f34 offset=254):
   mul::workload@42 (line 11)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Objects
    - 248: jdk.incubator.vector.Int256Vector stack[32],vector
ScopeDesc(pc=0x00007ff4b5208f3c offset=25c):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208f3c offset=25c):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5208f6c offset=28c):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
ScopeDesc(pc=0x00007ff4b5208f6c offset=28c):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007ff4b5208f6c offset=28c):
   jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
   Locals
    - l0: empty
    - l1: stack[40],narrowoop
    - l2: empty
    - l3: stack[48],oop
    - l4: stack[44]
ScopeDesc(pc=0x00007ff4b5208f6c offset=28c):
   mul::workload@7 (line 8)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b5208f92 offset=2b2):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208f92 offset=2b2):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5208f9c offset=2bc):
   jdk.incubator.vector.IntVector::fromArray@2 (line 2941)
   Locals
    - l0: reg rbp [10],narrowoop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],narrowoop
ScopeDesc(pc=0x00007ff4b5208f9c offset=2bc):
   mul::workload@16 (line 9)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[48],oop
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b5208fc7 offset=2e7):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208fc7 offset=2e7):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5208fd0 offset=2f0):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
ScopeDesc(pc=0x00007ff4b5208fd0 offset=2f0):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007ff4b5208fd0 offset=2f0):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2941)
   Locals
    - l0: stack[56],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007ff4b5208fd0 offset=2f0):
   mul::workload@16 (line 9)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[48],oop
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b5208fd8 offset=2f8):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5208fd8 offset=2f8):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5209004 offset=324):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
ScopeDesc(pc=0x00007ff4b5209004 offset=324):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007ff4b5209004 offset=324):
   jdk.incubator.vector.IntVector::intoArray@7 (line 3214)
   Locals
    - l0: obj[219]
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007ff4b5209004 offset=324):
   mul::workload@42 (line 11)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Objects
    - 219: jdk.incubator.vector.Int256Vector stack[32],vector
ScopeDesc(pc=0x00007ff4b5209039 offset=359):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5209039 offset=359):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5209044 offset=364):
   jdk.incubator.vector.VectorMask::fromArray@1 (line 205)
   Locals
    - l0: empty
    - l1: stack[32],narrowoop
    - l2: 0
    - l3: empty
    - l4: empty
   Expression stack
    - @0: stack[36],narrowoop
ScopeDesc(pc=0x00007ff4b5209044 offset=364):
   mul::workload@7 (line 8)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b5209079 offset=399):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5209079 offset=399):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5209084 offset=3a4):
   jdk.incubator.vector.VectorMask::fromArray@50 (line 208)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: stack[32],oop
ScopeDesc(pc=0x00007ff4b5209084 offset=3a4):
   mul::workload@7 (line 8)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b52090aa offset=3ca):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b52090aa offset=3ca):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b52090b4 offset=3d4):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@4 (line 3907)
   Locals
    - l0: empty
   Expression stack
    - @0: reg rbp [10],narrowoop
ScopeDesc(pc=0x00007ff4b52090b4 offset=3d4):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2943)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: 0
    - l3: empty
ScopeDesc(pc=0x00007ff4b52090b4 offset=3d4):
   mul::workload@16 (line 9)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[48],oop
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b52090bc offset=3dc):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b52090bc offset=3dc):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b52090d0 offset=3f0):
   jdk.incubator.vector.VectorMask::fromArray@47 (line 208)
ScopeDesc(pc=0x00007ff4b52090d0 offset=3f0):
   mul::workload@7 (line 8)
ScopeDesc(pc=0x00007ff4b52090fc offset=41c):
   jdk.incubator.vector.VectorMask::fromArray@1 (line 205)
   Locals
    - l0: empty
    - l1: stack[32],narrowoop
    - l2: 0
    - l3: empty
    - l4: empty
   Expression stack
    - @0: nullptr
ScopeDesc(pc=0x00007ff4b52090fc offset=41c):
   mul::workload@7 (line 8)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b520911d offset=43d):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b520911d offset=43d):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5209128 offset=448):
   jdk.incubator.vector.VectorMask::fromArray@15 (line 207)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: nullptr
ScopeDesc(pc=0x00007ff4b5209128 offset=448):
   mul::workload@7 (line 8)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b520914e offset=46e):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b520914e offset=46e):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5209158 offset=478):
   jdk.incubator.vector.VectorMask::fromArray@50 (line 208)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: nullptr
ScopeDesc(pc=0x00007ff4b5209158 offset=478):
   mul::workload@7 (line 8)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b5209179 offset=499):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5209179 offset=499):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5209184 offset=4a4):
   jdk.incubator.vector.IntVector::fromArray@2 (line 2941)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: empty
    - @1: nullptr
ScopeDesc(pc=0x00007ff4b5209184 offset=4a4):
   mul::workload@16 (line 9)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b52091a5 offset=4c5):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b52091a5 offset=4c5):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b52091b0 offset=4d0):
   jdk.incubator.vector.IntVector::fromArray@8 (line 2941)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: nullptr
ScopeDesc(pc=0x00007ff4b52091b0 offset=4d0):
   mul::workload@16 (line 9)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b52091d1 offset=4f1):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b52091d1 offset=4f1):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b52091dc offset=4fc):
   jdk.incubator.vector.IntVector::intoArray@6 (line 3214)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: nullptr
ScopeDesc(pc=0x00007ff4b52091dc offset=4fc):
   mul::workload@42 (line 11)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b5209207 offset=527):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5209207 offset=527):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b5209210 offset=530):
   jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 318)  reexecute=true
   Locals
    - l0: stack[56],oop
    - l1: reg rbp [10],narrowoop
   Expression stack
    - @0: reg rbp [10],narrowoop
ScopeDesc(pc=0x00007ff4b5209210 offset=530):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3907)
   Locals
    - l0: empty
ScopeDesc(pc=0x00007ff4b5209210 offset=530):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2943)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: 0
    - l3: empty
ScopeDesc(pc=0x00007ff4b5209210 offset=530):
   mul::workload@16 (line 9)
   Locals
    - l0: stack[24],oop
    - l1: stack[32],oop
    - l2: stack[48],oop
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007ff4b5209218 offset=538):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007ff4b5209218 offset=538):
   mul::workload@42 (line 11)
ScopeDesc(pc=0x00007ff4b520922c offset=54c):
   jdk.incubator.vector.AbstractSpecies::dummyVector@6 (line 318)
ScopeDesc(pc=0x00007ff4b520922c offset=54c):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3907)
ScopeDesc(pc=0x00007ff4b520922c offset=54c):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2943)
ScopeDesc(pc=0x00007ff4b520922c offset=54c):
   mul::workload@16 (line 9)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007ff4b5208b80: 0824
relocInfo@0x00007ff4b5208b80 [type=1(oop) addr=0x00007ff4b5208d04 offset=36] | [oop_addr=0x00007ff4b5208d06 *=0x000000011f91fc88 offset=0]
         @0x00007ff4b5208b82: 78036321
relocInfo@0x00007ff4b5208b84 [type=12(metadata) addr=0x00007ff4b5208d25 offset=33 format=3 data=3] | [metadata_addr=0x00007ff4b5209298 *=0x00000008000d9fa8 offset=0]metadata_value=0x00000008000d9fa8: 'jdk/incubator/vector/IntVector$IntSpecies'
         @0x00007ff4b5208b86: 7c03c06348b07ff43941
relocInfo@0x00007ff4b5208b8e [type=7(external_word) addr=0x00007ff4b5208d66 offset=65 format=1 data={c06348b07ff4}] | [target=0x00007ff4c06348b0]
         @0x00007ff4b5208b90: 7c03bfbfb4b07ff4380d
relocInfo@0x00007ff4b5208b98 [type=7(external_word) addr=0x00007ff4b5208d73 offset=13 data={bfbfb4b07ff4}] | [target=0x00007ff4bfbfb4b0]
         @0x00007ff4b5208b9a: 310e
relocInfo@0x00007ff4b5208b9a [type=6(runtime_call) addr=0x00007ff4b5208d81 offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208b9c: 0810
relocInfo@0x00007ff4b5208b9c [type=1(oop) addr=0x00007ff4b5208d91 offset=16] | [oop_addr=0x00007ff4b5208d93 *=0x000000011f0002a0 offset=0]
         @0x00007ff4b5208b9e: 081c
relocInfo@0x00007ff4b5208b9e [type=1(oop) addr=0x00007ff4b5208dad offset=28] | [oop_addr=0x00007ff4b5208daf *=0x000000011f953ec0 offset=0]
         @0x00007ff4b5208ba0: 2112
relocInfo@0x00007ff4b5208ba0 [type=4(static_call) addr=0x00007ff4b5208dbf offset=18 format=1] | [destination=0x00007ff4b51fd9e0 metadata=0x0000000000000000]
         @0x00007ff4b5208ba2: 8005
relocInfo@0x00007ff4b5208ba2 [type=16(post_call_nop) addr=0x00007ff4b5208dc4 offset=5]
         @0x00007ff4b5208ba4: 7806630c
relocInfo@0x00007ff4b5208ba6 [type=12(metadata) addr=0x00007ff4b5208dd0 offset=12 format=3 data=6] | [metadata_addr=0x00007ff4b52092b0 *=0x00000008000de730 offset=0]metadata_value=0x00000008000de730: 'jdk/incubator/vector/Int256Vector$Int256Mask'
         @0x00007ff4b5208ba8: 080d
relocInfo@0x00007ff4b5208ba8 [type=1(oop) addr=0x00007ff4b5208ddd offset=13] | [oop_addr=0x00007ff4b5208ddf *=0x000000011f91fc88 offset=0]
         @0x00007ff4b5208baa: 78036313
relocInfo@0x00007ff4b5208bac [type=12(metadata) addr=0x00007ff4b5208df0 offset=19 format=3 data=3] | [metadata_addr=0x00007ff4b5209298 *=0x00000008000d9fa8 offset=0]metadata_value=0x00000008000d9fa8: 'jdk/incubator/vector/IntVector$IntSpecies'
         @0x00007ff4b5208bae: 780b6350
relocInfo@0x00007ff4b5208bb0 [type=12(metadata) addr=0x00007ff4b5208e40 offset=80 format=3 data=11] | [metadata_addr=0x00007ff4b52092d8 *=0x00000008000de0a0 offset=0]metadata_value=0x00000008000de0a0: 'jdk/incubator/vector/Int256Vector'
         @0x00007ff4b5208bb2: 5860
relocInfo@0x00007ff4b5208bb2 [type=11(poll_return) addr=0x00007ff4b5208ea0 offset=96]
         @0x00007ff4b5208bb4: 3127
relocInfo@0x00007ff4b5208bb4 [type=6(runtime_call) addr=0x00007ff4b5208ec7 offset=39 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208bb6: 8005
relocInfo@0x00007ff4b5208bb6 [type=16(post_call_nop) addr=0x00007ff4b5208ecc offset=5]
         @0x00007ff4b5208bb8: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208bc0 [type=7(external_word) addr=0x00007ff4b5208ed4 offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208bc2: 310e
relocInfo@0x00007ff4b5208bc2 [type=6(runtime_call) addr=0x00007ff4b5208ee2 offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208bc4: 3119
relocInfo@0x00007ff4b5208bc4 [type=6(runtime_call) addr=0x00007ff4b5208efb offset=25 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208bc6: 8005
relocInfo@0x00007ff4b5208bc6 [type=16(post_call_nop) addr=0x00007ff4b5208f00 offset=5]
         @0x00007ff4b5208bc8: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208bd0 [type=7(external_word) addr=0x00007ff4b5208f08 offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208bd2: 310e
relocInfo@0x00007ff4b5208bd2 [type=6(runtime_call) addr=0x00007ff4b5208f16 offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208bd4: 3119
relocInfo@0x00007ff4b5208bd4 [type=6(runtime_call) addr=0x00007ff4b5208f2f offset=25 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208bd6: 8005
relocInfo@0x00007ff4b5208bd6 [type=16(post_call_nop) addr=0x00007ff4b5208f34 offset=5]
         @0x00007ff4b5208bd8: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208be0 [type=7(external_word) addr=0x00007ff4b5208f3c offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208be2: 310e
relocInfo@0x00007ff4b5208be2 [type=6(runtime_call) addr=0x00007ff4b5208f4a offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208be4: 311d
relocInfo@0x00007ff4b5208be4 [type=6(runtime_call) addr=0x00007ff4b5208f67 offset=29 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208be6: 8005
relocInfo@0x00007ff4b5208be6 [type=16(post_call_nop) addr=0x00007ff4b5208f6c offset=5]
         @0x00007ff4b5208be8: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208bf0 [type=7(external_word) addr=0x00007ff4b5208f74 offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208bf2: 310e
relocInfo@0x00007ff4b5208bf2 [type=6(runtime_call) addr=0x00007ff4b5208f82 offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208bf4: 3115
relocInfo@0x00007ff4b5208bf4 [type=6(runtime_call) addr=0x00007ff4b5208f97 offset=21 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208bf6: 8005
relocInfo@0x00007ff4b5208bf6 [type=16(post_call_nop) addr=0x00007ff4b5208f9c offset=5]
         @0x00007ff4b5208bf8: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208c00 [type=7(external_word) addr=0x00007ff4b5208fa4 offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208c02: 310e
relocInfo@0x00007ff4b5208c02 [type=6(runtime_call) addr=0x00007ff4b5208fb2 offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208c04: 3119
relocInfo@0x00007ff4b5208c04 [type=6(runtime_call) addr=0x00007ff4b5208fcb offset=25 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208c06: 8005
relocInfo@0x00007ff4b5208c06 [type=16(post_call_nop) addr=0x00007ff4b5208fd0 offset=5]
         @0x00007ff4b5208c08: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208c10 [type=7(external_word) addr=0x00007ff4b5208fd8 offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208c12: 310e
relocInfo@0x00007ff4b5208c12 [type=6(runtime_call) addr=0x00007ff4b5208fe6 offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208c14: 3119
relocInfo@0x00007ff4b5208c14 [type=6(runtime_call) addr=0x00007ff4b5208fff offset=25 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208c16: 8005
relocInfo@0x00007ff4b5208c16 [type=16(post_call_nop) addr=0x00007ff4b5209004 offset=5]
         @0x00007ff4b5208c18: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208c20 [type=7(external_word) addr=0x00007ff4b520900c offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208c22: 310e
relocInfo@0x00007ff4b5208c22 [type=6(runtime_call) addr=0x00007ff4b520901a offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208c24: 3125
relocInfo@0x00007ff4b5208c24 [type=6(runtime_call) addr=0x00007ff4b520903f offset=37 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208c26: 8005
relocInfo@0x00007ff4b5208c26 [type=16(post_call_nop) addr=0x00007ff4b5209044 offset=5]
         @0x00007ff4b5208c28: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208c30 [type=7(external_word) addr=0x00007ff4b520904c offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208c32: 310e
relocInfo@0x00007ff4b5208c32 [type=6(runtime_call) addr=0x00007ff4b520905a offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208c34: 3125
relocInfo@0x00007ff4b5208c34 [type=6(runtime_call) addr=0x00007ff4b520907f offset=37 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208c36: 8005
relocInfo@0x00007ff4b5208c36 [type=16(post_call_nop) addr=0x00007ff4b5209084 offset=5]
         @0x00007ff4b5208c38: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208c40 [type=7(external_word) addr=0x00007ff4b520908c offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208c42: 310e
relocInfo@0x00007ff4b5208c42 [type=6(runtime_call) addr=0x00007ff4b520909a offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208c44: 3115
relocInfo@0x00007ff4b5208c44 [type=6(runtime_call) addr=0x00007ff4b52090af offset=21 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208c46: 8005
relocInfo@0x00007ff4b5208c46 [type=16(post_call_nop) addr=0x00007ff4b52090b4 offset=5]
         @0x00007ff4b5208c48: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208c50 [type=7(external_word) addr=0x00007ff4b52090bc offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208c52: 310e
relocInfo@0x00007ff4b5208c52 [type=6(runtime_call) addr=0x00007ff4b52090ca offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208c54: 3111
relocInfo@0x00007ff4b5208c54 [type=6(runtime_call) addr=0x00007ff4b52090db offset=17 format=1] | [destination=0x00007ff4b514c9a0]
         @0x00007ff4b5208c56: 311c
relocInfo@0x00007ff4b5208c56 [type=6(runtime_call) addr=0x00007ff4b52090f7 offset=28 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208c58: 8005
relocInfo@0x00007ff4b5208c58 [type=16(post_call_nop) addr=0x00007ff4b52090fc offset=5]
         @0x00007ff4b5208c5a: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208c62 [type=7(external_word) addr=0x00007ff4b5209104 offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208c64: 310e
relocInfo@0x00007ff4b5208c64 [type=6(runtime_call) addr=0x00007ff4b5209112 offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208c66: 3111
relocInfo@0x00007ff4b5208c66 [type=6(runtime_call) addr=0x00007ff4b5209123 offset=17 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208c68: 8005
relocInfo@0x00007ff4b5208c68 [type=16(post_call_nop) addr=0x00007ff4b5209128 offset=5]
         @0x00007ff4b5208c6a: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208c72 [type=7(external_word) addr=0x00007ff4b5209130 offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208c74: 310e
relocInfo@0x00007ff4b5208c74 [type=6(runtime_call) addr=0x00007ff4b520913e offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208c76: 3115
relocInfo@0x00007ff4b5208c76 [type=6(runtime_call) addr=0x00007ff4b5209153 offset=21 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208c78: 8005
relocInfo@0x00007ff4b5208c78 [type=16(post_call_nop) addr=0x00007ff4b5209158 offset=5]
         @0x00007ff4b5208c7a: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208c82 [type=7(external_word) addr=0x00007ff4b5209160 offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208c84: 310e
relocInfo@0x00007ff4b5208c84 [type=6(runtime_call) addr=0x00007ff4b520916e offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208c86: 3111
relocInfo@0x00007ff4b5208c86 [type=6(runtime_call) addr=0x00007ff4b520917f offset=17 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208c88: 8005
relocInfo@0x00007ff4b5208c88 [type=16(post_call_nop) addr=0x00007ff4b5209184 offset=5]
         @0x00007ff4b5208c8a: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208c92 [type=7(external_word) addr=0x00007ff4b520918c offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208c94: 310e
relocInfo@0x00007ff4b5208c94 [type=6(runtime_call) addr=0x00007ff4b520919a offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208c96: 3111
relocInfo@0x00007ff4b5208c96 [type=6(runtime_call) addr=0x00007ff4b52091ab offset=17 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208c98: 8005
relocInfo@0x00007ff4b5208c98 [type=16(post_call_nop) addr=0x00007ff4b52091b0 offset=5]
         @0x00007ff4b5208c9a: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208ca2 [type=7(external_word) addr=0x00007ff4b52091b8 offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208ca4: 310e
relocInfo@0x00007ff4b5208ca4 [type=6(runtime_call) addr=0x00007ff4b52091c6 offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208ca6: 3111
relocInfo@0x00007ff4b5208ca6 [type=6(runtime_call) addr=0x00007ff4b52091d7 offset=17 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208ca8: 8005
relocInfo@0x00007ff4b5208ca8 [type=16(post_call_nop) addr=0x00007ff4b52091dc offset=5]
         @0x00007ff4b5208caa: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208cb2 [type=7(external_word) addr=0x00007ff4b52091e4 offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208cb4: 310e
relocInfo@0x00007ff4b5208cb4 [type=6(runtime_call) addr=0x00007ff4b52091f2 offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208cb6: 3119
relocInfo@0x00007ff4b5208cb6 [type=6(runtime_call) addr=0x00007ff4b520920b offset=25 format=1] | [destination=0x00007ff4b5120b20]
         @0x00007ff4b5208cb8: 8005
relocInfo@0x00007ff4b5208cb8 [type=16(post_call_nop) addr=0x00007ff4b5209210 offset=5]
         @0x00007ff4b5208cba: 7c03bf9eaf507ff43808
relocInfo@0x00007ff4b5208cc2 [type=7(external_word) addr=0x00007ff4b5209218 offset=8 data={bf9eaf507ff4}] | [target=0x00007ff4bf9eaf50]
         @0x00007ff4b5208cc4: 310e
relocInfo@0x00007ff4b5208cc4 [type=6(runtime_call) addr=0x00007ff4b5209226 offset=14 format=1] | [destination=0x00007ff4bef553f2]
         @0x00007ff4b5208cc6: 7b8c4006
relocInfo@0x00007ff4b5208cc8 [type=8(internal_word) addr=0x00007ff4b520922c offset=6 data=908] | [target=0x00007ff4b5208ea0]
         @0x00007ff4b5208cca: 3111
relocInfo@0x00007ff4b5208cca [type=6(runtime_call) addr=0x00007ff4b520923d offset=17 format=1] | [destination=0x00007ff4b511f9a0]
         @0x00007ff4b5208ccc: 3105
relocInfo@0x00007ff4b5208ccc [type=6(runtime_call) addr=0x00007ff4b5209242 offset=5 format=1] | [destination=0x00007ff4b50662a0]
         @0x00007ff4b5208cce: 000e
relocInfo@0x00007ff4b5208cce [type=0(none) addr=0x00007ff4b5209250 offset=14]
         @0x00007ff4b5208cd0: 7c01ff212800
relocInfo@0x00007ff4b5208cd4 [type=5(static_stub) addr=0x00007ff4b5209250 offset=0 data=-223] | [static_call=0x00007ff4b5208dbf]
         @0x00007ff4b5208cd6: 6000
relocInfo@0x00007ff4b5208cd6 [type=12(metadata) addr=0x00007ff4b5209250 offset=0] | [metadata_addr=0x00007ff4b5209252 *=0x0000000000000000 offset=0]
         @0x00007ff4b5208cd8: 310a
relocInfo@0x00007ff4b5208cd8 [type=6(runtime_call) addr=0x00007ff4b520925a offset=10 format=1] | [destination=0xffffffffffffffff]
         @0x00007ff4b5208cda: 3105
relocInfo@0x00007ff4b5208cda [type=6(runtime_call) addr=0x00007ff4b520925f offset=5 format=1] | [destination=0x00007ff4b5028a20]
         @0x00007ff4b5208cdc: 310f
relocInfo@0x00007ff4b5208cdc [type=6(runtime_call) addr=0x00007ff4b520926e offset=15 format=1] | [destination=0x00007ff4b5120e60]
         @0x00007ff4b5208cde: 0000
relocInfo@0x00007ff4b5208cde [type=0(none) addr=0x00007ff4b520926e offset=0]
         @0x00007ff4b5208ce0: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.Int256Vector$Int256Mask
  method  = {method} {0x00007ff4707feab0} 'check' '(Ljava/lang/Class;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/AbstractMask'
  class   = jdk.incubator.vector.VectorMask
  method  = *{method} {0x00007ff4706827e0} 'check' '(Ljava/lang/Class;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
   [nmethod<=klass]jdk.incubator.vector.Int256Vector$Int256Mask
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007ff47063da08} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  class   = jdk.incubator.vector.VectorOperators$OperatorImpl
  method  = {method} {0x00007ff47063da08} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007ff47063d540} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  class   = jdk.incubator.vector.VectorOperators$OperatorImpl
  method  = {method} {0x00007ff47063d540} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007ff47063d630} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  class   = jdk.incubator.vector.VectorOperators$OperatorImpl
  method  = {method} {0x00007ff47063d630} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.VectorOperators$ImplCache
  method  = {method} {0x00007ff4707d6bc0} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
  class   = jdk.incubator.vector.VectorOperators$ImplCache
  method  = {method} {0x00007ff4707d6bc0} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$ImplCache
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 24 bytes)
catch_pco = 228 (pc=0x00007ff4b5208dc4, 1 entries)
  bci -1 at scope depth 0 -> pco 1008 (pc=0x00007ff4b52090d0)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 7 entries, 60 bytes):
{
   < 0x00007ff4b5208d20, 0x00007ff4b52090e0 > < 0x00007ff4b5208d32, 0x00007ff4b5209118 > < 0x00007ff4b5208dcc, 0x00007ff4b5209144 > 
   < 0x00007ff4b5208deb, 0x00007ff4b5209174 > < 0x00007ff4b5208e02, 0x00007ff4b52091a0 > < 0x00007ff4b5208e2e, 0x00007ff4b52091f8 > 
   < 0x00007ff4b5208e52, 0x00007ff4b52091cc > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 nullptr-oop
#1: 0x000000011f946d80 a 'java/lang/Class'{0x000000011f946d80} = 'jdk/incubator/vector/Int256Vector'
#2: 0x000000011f81d798 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000011f81d798}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
# 0: 0x0000000000000000 nullptr-oop
# 1: 0x00007ff470603600 {method} {0x00007ff470603600} 'workload' '([I[I)V' in 'mul'
# 2: 0x00007ff470789bd0 {method} {0x00007ff470789bd0} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
# 3: 0x00000008000d9fa8 'jdk/incubator/vector/IntVector$IntSpecies'
# 4: 0x00007ff4706817d8 {method} {0x00007ff4706817d8} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[ZI)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
# 5: 0x00007ff4707e3058 {method} {0x00007ff4707e3058} 'laneCount' '()I' in 'jdk/incubator/vector/AbstractSpecies'
# 6: 0x00000008000de730 'jdk/incubator/vector/Int256Vector$Int256Mask'
# 7: 0x00007ff4707893a0 {method} {0x00007ff4707893a0} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
# 8: 0x00007ff4707e2f80 {method} {0x00007ff4707e2f80} 'length' '()I' in 'jdk/incubator/vector/AbstractSpecies'
# 9: 0x00007ff4707dd5a0 {method} {0x00007ff4707dd5a0} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
#10: 0x00007ff4707e4940 {method} {0x00007ff4707e4940} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
#11: 0x00000008000de0a0 'jdk/incubator/vector/Int256Vector'
#12: 0x00007ff4706a2200 {method} {0x00007ff4706a2200} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
#13: 0x00007ff47078a4a8 {method} {0x00007ff47078a4a8} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#14: 0x00007ff4706a40f8 {method} {0x00007ff4706a40f8} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
#15: 0x00007ff47069ff88 {method} {0x00007ff47069ff88} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
#16: 0x00007ff470781c98 {method} {0x00007ff470781c98} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljava/lang/Class;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#17: 0x00007ff4706d3370 {method} {0x00007ff4706d3370} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
#18: 0x00007ff4701a1258 {method} {0x00007ff4701a1258} 'checkIndex' '(II)I' in 'java/util/Objects'
#19: 0x00007ff4707feab0 {method} {0x00007ff4707feab0} 'check' '(Ljava/lang/Class;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/AbstractMask'
#20: 0x00000008000dbed0 'jdk/incubator/vector/VectorMask'
#21: 0x00007ff4706827e0 {method} {0x00007ff4706827e0} 'check' '(Ljava/lang/Class;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
#22: 0x00000008000e7938 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
#23: 0x00007ff47063da08 {method} {0x00007ff47063da08} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#24: 0x00000008000e7120 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#25: 0x00007ff47063d540 {method} {0x00007ff47063d540} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#26: 0x00007ff47063d630 {method} {0x00007ff47063d630} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#27: 0x00007ff4707d6bc0 {method} {0x00007ff4707d6bc0} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
#28: 0x00000008000d8d58 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Time = 10
1 
4 
9 
16 
5 
6 
7 
8 
------------------------------------------------------------------------
static mul::workload([I[I)V
  interpreter_invocation_count:       73740
  invocation_counter:                 73740
  backedge_counter:                       0
  decompile_count:                        0
  mdo size: 584 bytes

   0 getstatic 7 <mul.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
   3 getstatic 13 <mul.mask_arr/[Z> 
   6 iconst_0
   7 invokestatic 17 <jdk/incubator/vector/VectorMask.fromArray(Ljdk/incubator/vector/VectorSpecies;[ZI)Ljdk/incubator/vector/VectorMask;> 
  0    bci: 7    CounterData        count(72077)
  10 astore_2
  11 getstatic 7 <mul.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
  14 fast_aload_0
  15 iconst_0
  16 invokestatic 23 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  16   bci: 16   CounterData        count(72077)
  19 astore_3
  20 getstatic 7 <mul.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
  23 fast_aload_0
  24 iconst_0
  25 invokestatic 23 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  32   bci: 25   CounterData        count(72077)
  28 astore #4
  30 aload #4
  32 getstatic 28 <jdk/incubator/vector/VectorOperators.MUL/Ljdk/incubator/vector/VectorOperators$Associative;> 
  35 aload_3
  36 aload_2
  37 invokevirtual 34 <jdk/incubator/vector/IntVector.lanewise(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;> 
  48   bci: 37   VirtualCallData    count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/Int256Vector'(72077 1.00)
  40 aload_1
  41 iconst_0
  42 invokevirtual 38 <jdk/incubator/vector/IntVector.intoArray([II)V> 
  104  bci: 42   VirtualCallData    count(72077) nonprofiled_count(0) entries(0)
  45 return
------------------------------------------------------------------------
Total MDO size: 584 bytes
