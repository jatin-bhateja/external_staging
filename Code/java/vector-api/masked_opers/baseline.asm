CompileCommand: print mul.workload bool print = true
WARNING: Using incubator modules: jdk.incubator.vector

============================= C2-compiled nmethod ==============================
#r018 rsi:rsi   : parm 0: int[int:>=0]:exact *
#r016 rdx:rdx   : parm 1: int[int:>=0]:exact *
# -- Old rsp -- Framesize: 96 --
#r591 rsp+92: in_preserve
#r590 rsp+88: return address
#r589 rsp+84: in_preserve
#r588 rsp+80: saved fp register
#r587 rsp+76: Fixed slot 3
#r586 rsp+72: Fixed slot 2
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
#r597 rsp+20: spill
#r596 rsp+16: spill
#r595 rsp+12: spill
#r594 rsp+ 8: spill
#r593 rsp+ 4: spill
#r592 rsp+ 0: spill
#
----------------------- MetaData before Compile_id = 167 ------------------------
{method}
 - this oop:          0x00007fab004015f0
 - method holder:     'mul'
 - constants:         0x00007fab00401078 constant pool [106]/operands[10] {0x00007fab00401078} for 'mul' cache=0x00007fab00401978
 - access:            0x81000009  public static 
 - name:              'workload'
 - signature:         '([I[I)V'
 - max stack:         4
 - max locals:        4
 - size of params:    2
 - method size:       16
 - vtable index:      -2
 - i2i entry:         0x00007fab48bef580
 - adapters:          AHE@0x00007fab5430fc10: 0xbb000000 i2c: 0x00007fab48c5fa80 c2i: 0x00007fab48c5fb61 c2iVE: 0x00007fab48c5fb61 c2iVROE: 0x00007fab48c5fb61 c2iUE: 0x00007fab48c5fb2f c2iUVE: 0x00007fab48c5fb2f c2iNCI: 0x00007fab48c5fb9b
 - compiled entry           0x00007fab48c5fb61
 - compiled inline entry    0x00007fab48c5fb61
 - compiled inline ro entry 0x00007fab48c5fb61
 - code size:         32
 - code start:        0x00007fab004015c8
 - code end (excl):   0x00007fab004015e8
 - method data:       0x00007fab00401c30
 - checked ex length: 0
 - linenumber start:  0x00007fab004015e8
 - localvar length:   0

------------------------ OptoAssembly for Compile_id = 167 -----------------------
#
#  void ( int[int:>=0]:exact *, int[int:>=0]:exact * )
#
000     N1: #	out( B1 ) <- in( B18 B14 B19 B15 B12 B21 B17 B11 B16 B20 B13 )  Freq: 1

000     B1: #	out( B18 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
000     # stack bang (488 bytes)
	pushq   rbp	# Save rbp
	subq    rsp, #80	# Create frame

01a     movq    R10, RSI	# spill
01d     movq    R11, java/lang/Class:exact *	# ptr
027     movl    R9, [R11 + #120 (8-bit)]	# compressed ptr ! Field: mul.SPECIES
02b     movl    R8, [R12 + R9 << 3 + #8] (compressed oop addressing)	# compressed klass ptr
030     NullCheck R9

030     B2: #	out( B14 B3 ) <- in( B1 )  Freq: 0.999999
030     cmpl    R8, narrowklass: precise jdk/incubator/vector/IntVector$IntSpecies: 0x00007faae00e41b0:Constant:exact *	# compressed klass ptr
037     jne,u   B14  P=0.000001 C=-1.000000

03d     B3: #	out( B19 B4 ) <- in( B2 )  Freq: 0.999998
        nop 	# 3 bytes pad for loops and calls
040     movl    R11, [RSI + #12 (8-bit)]	# range
044     NullCheck RSI

044     B4: #	out( B15 B5 ) <- in( B3 )  Freq: 0.999997
044     decode_heap_oop_not_null R8,R9
048     # checkcastPP of R8
048     subl    R11, [R8 + #12 (8-bit)]	# int
04c     leal    RBP, [R11 + #1]
050     testl   RBP, RBP
052     jl     B15  P=0.000001 C=-1.000000

058     B5: #	out( B12 B6 ) <- in( B4 )  Freq: 0.999996
        nop 	# 8 bytes pad for loops and calls
060     cmpl    R11, #-1
064     je     B12  P=0.000001 C=-1.000000

06a     B6: #	out( B21 B7 ) <- in( B5 )  Freq: 0.999995
06a     movl    RBP, [R8 + #72 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.dummyVectorMF (constant)
06e     movl    R11, [R12 + RBP << 3 + #8] (compressed oop addressing)	# compressed klass ptr
073     NullCheck RBP

073     B7: #	out( B17 B8 ) <- in( B6 )  Freq: 0.999994
        nop 	# 13 bytes pad for loops and calls
080     cmpl    R11, narrowklass: precise jdk/incubator/vector/Int256Vector: 0x00007faae00e06f0:Constant:exact *	# compressed klass ptr
087     jne,u   B17  P=0.000000 C=-1.000000

08d     B8: #	out( B20 B9 ) <- in( B7 )  Freq: 0.999994
08d     movl    R11, [RDX + #12 (8-bit)]	# range
091     NullCheck RDX

091     B9: #	out( B16 B10 ) <- in( B8 )  Freq: 0.999993
091     load_vector XMM0,[RSI + #16 (8-bit)]
096     vpmulld XMM0,XMM0,XMM0	! mul packedI
09b     leal    RBP, [R11 + #-7]
        nop 	# 1 bytes pad for loops and calls
0a0     testl   RBP, RBP
0a2     jl     B16  P=0.000001 C=-1.000000

0a8     B10: #	out( B13 B11 ) <- in( B9 )  Freq: 0.999992
0a8     cmpl    R11, #7
0ac     je,s   B13  P=0.000001 C=-1.000000

0ae     B11: #	out( N1 ) <- in( B10 )  Freq: 0.999991
0ae     store_vector [RDX + #16 (8-bit)],XMM0
	
0b3     vzeroupper
	addq    rsp, 80	# Destroy frame
	popq    rbp
	cmpq    rsp, poll_offset[r15_thread] 
	ja      #safepoint_stub	# Safepoint: poll for GC

0c8     ret

0c9     B12: #	out( N1 ) <- in( B5 )  Freq: 1.01327e-06
0c9     movl    RSI, #-28	# int
0ce     movq    [rsp + #8], RDX	# spill
0d3     movq    [rsp + #16], R10	# spill
0d8     movq    [rsp + #24], R8	# spill
        nop 	# 3 bytes pad for loops and calls
0e0     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 473) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 3064) L[0]=rsp + #24 L[1]=rsp + #16 L[2]=_ L[3]=_
        # mul::workload @ bci:5 (line 9) L[0]=rsp + #16 L[1]=rsp + #8 L[2]=_ L[3]=_
        # OopMap {[8]=Oop [16]=Oop [24]=Oop off=232/0xe8}
0e8     stop	# ShouldNotReachHere

0fc     B13: #	out( N1 ) <- in( B10 )  Freq: 1.01327e-06
0fc     movl    RSI, #-28	# int
101     movq    [rsp + #0], RDX	# spill
105     vmovdqu [rsp + 32],XMM0	# spill
        nop 	# 1 bytes pad for loops and calls
10c     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 473) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:7 (line 3337) L[0]=#ScObj0 L[1]=rsp + #0 L[2]=_ L[3]=_
        # ScObj0 jdk/incubator/vector/Int256Vector={ [mfield :0]=#0 }
        # mul::workload @ bci:28 (line 11) L[0]=_ L[1]=_ L[2]=_ L[3]=_
        # OopMap {[0]=Oop off=276/0x114}
114     stop	# ShouldNotReachHere

128     B14: #	out( N1 ) <- in( B2 )  Freq: 9.99999e-07
128     movl    RSI, #-34	# int
12d     movq    [rsp + #0], RDX	# spill
131     movq    [rsp + #16], R10	# spill
136     movl    [rsp + #12], R9	# spill
        nop 	# 1 bytes pad for loops and calls
13c     call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:2 (line 3064) L[0]=rsp + #12 L[1]=rsp + #16 L[2]=_ L[3]=_ STK[0]=#0 STK[1]=rsp + #12
        # mul::workload @ bci:5 (line 9) L[0]=rsp + #16 L[1]=rsp + #0 L[2]=_ L[3]=_
        # OopMap {[0]=Oop [12]=NarrowOop [16]=Oop off=324/0x144}
144     stop	# ShouldNotReachHere

158     B15: #	out( N1 ) <- in( B4 )  Freq: 9.99997e-07
158     movl    RSI, #-52	# int
15d     movq    [rsp + #8], RDX	# spill
162     movq    [rsp + #16], R10	# spill
167     movq    [rsp + #24], R8	# spill
16c     call,static  wrapper for: uncommon_trap(reason='intrinsic_or_type_checked_inlining' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 473) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 3064) L[0]=rsp + #24 L[1]=rsp + #16 L[2]=_ L[3]=_
        # mul::workload @ bci:5 (line 9) L[0]=rsp + #16 L[1]=rsp + #8 L[2]=_ L[3]=_
        # OopMap {[8]=Oop [16]=Oop [24]=Oop off=372/0x174}
174     stop	# ShouldNotReachHere

188     B16: #	out( N1 ) <- in( B9 )  Freq: 9.99993e-07
188     movl    RSI, #-52	# int
18d     movq    [rsp + #0], RDX	# spill
191     vmovdqu [rsp + 32],XMM0	# spill
        nop 	# 1 bytes pad for loops and calls
198     call,static  wrapper for: uncommon_trap(reason='intrinsic_or_type_checked_inlining' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 473) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:7 (line 3337) L[0]=#ScObj0 L[1]=rsp + #0 L[2]=_ L[3]=_
        # ScObj0 jdk/incubator/vector/Int256Vector={ [mfield :0]=#0 }
        # mul::workload @ bci:28 (line 11) L[0]=_ L[1]=_ L[2]=_ L[3]=_
        # OopMap {[0]=Oop off=416/0x1a0}
1a0     stop	# ShouldNotReachHere

1b4     B17: #	out( N1 ) <- in( B7 )  Freq: 1e-35
1b4     movl    RSI, #-34	# int
1b9     movq    [rsp + #8], RDX	# spill
1be     movq    [rsp + #16], R10	# spill
        nop 	# 1 bytes pad for loops and calls
1c4     call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector$IntSpecies::dummyVectorMF @ bci:4 (line 4030) L[0]=_ STK[0]=RBP
        # jdk.incubator.vector.IntVector::fromArray @ bci:19 (line 3066) L[0]=_ L[1]=rsp + #16 L[2]=#0 L[3]=_
        # mul::workload @ bci:5 (line 9) L[0]=rsp + #16 L[1]=rsp + #8 L[2]=_ L[3]=_
        # OopMap {rbp=NarrowOop [8]=Oop [16]=Oop off=460/0x1cc}
1cc     stop	# ShouldNotReachHere

1e0     B18: #	out( N1 ) <- in( B1 )  Freq: 1.01328e-06
1e0     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
1e8     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:2 (line 3064) L[0]=_ L[1]=_ L[2]=_ L[3]=_ STK[0]=_ STK[1]=#NULL
        # mul::workload @ bci:5 (line 9) L[0]=_ L[1]=_ L[2]=_ L[3]=_
        # OopMap {off=496/0x1f0}
1f0     stop	# ShouldNotReachHere

204     B19: #	out( N1 ) <- in( B3 )  Freq: 1.01328e-06
204     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
20c     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:8 (line 3064) L[0]=_ L[1]=_ L[2]=_ L[3]=_ STK[0]=_ STK[1]=_ STK[2]=#NULL
        # mul::workload @ bci:5 (line 9) L[0]=_ L[1]=_ L[2]=_ L[3]=_
        # OopMap {off=532/0x214}
214     stop	# ShouldNotReachHere

228     B20: #	out( N1 ) <- in( B8 )  Freq: 1.01327e-06
228     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
230     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::intoArray @ bci:6 (line 3337) L[0]=_ L[1]=_ L[2]=_ L[3]=_ STK[0]=_ STK[1]=_ STK[2]=#NULL
        # mul::workload @ bci:28 (line 11) L[0]=_ L[1]=_ L[2]=_ L[3]=_
        # OopMap {off=568/0x238}
238     stop	# ShouldNotReachHere

24c     B21: #	out( N1 ) <- in( B6 )  Freq: 4.76835e-07
24c     movl    RSI, #-187	# int
251     movq    [rsp + #8], RDX	# spill
256     movq    [rsp + #16], R10	# spill
25b     movq    [rsp + #24], R8	# spill
260     call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.AbstractSpecies::dummyVectorMF @ bci:6 (line 323) L[0]=rsp + #24 L[1]=RBP STK[0]=RBP
        # jdk.incubator.vector.IntVector$IntSpecies::dummyVectorMF @ bci:1 (line 4030) L[0]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:19 (line 3066) L[0]=_ L[1]=rsp + #16 L[2]=#0 L[3]=_
        # mul::workload @ bci:5 (line 9) L[0]=rsp + #16 L[1]=rsp + #8 L[2]=_ L[3]=_
        # OopMap {rbp=NarrowOop [8]=Oop [16]=Oop [24]=Oop off=616/0x268}
268     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    1109  167             mul::workload (32 bytes)
 total in heap  [0x00007fab48d7a390,0x00007fab48d7acf0] = 2400
 relocation     [0x00007fab48d7a500,0x00007fab48d7a5a8] = 168
 main code      [0x00007fab48d7a5c0,0x00007fab48d7a860] = 672
 stub code      [0x00007fab48d7a860,0x00007fab48d7a878] = 24
 oops           [0x00007fab48d7a878,0x00007fab48d7a888] = 16
 metadata       [0x00007fab48d7a888,0x00007fab48d7a930] = 168
 scopes data    [0x00007fab48d7a930,0x00007fab48d7aac0] = 400
 scopes pcs     [0x00007fab48d7aac0,0x00007fab48d7acb0] = 496
 dependencies   [0x00007fab48d7acb0,0x00007fab48d7acc8] = 24
 nul chk table  [0x00007fab48d7acc8,0x00007fab48d7acf0] = 40

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Entry Point]
[Inline Entry Point]
[Verified Entry Point]
[Verified Inline Entry Point]
[Verified Inline Entry Point (RO)]
  # {method} {0x00007fab004015f0} 'workload' '([I[I)V' in 'mul'
  # parm0:    rsi:rsi   = '[I'
  # parm1:    rdx:rdx   = '[I'
  #           [sp+0x60]  (sp of caller)
 ;; N1: #	out( B1 ) <- in( B18 B14 B19 B15 B12 B21 B17 B11 B16 B20 B13 )  Freq: 1
 ;; B1: #	out( B18 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fab48d7a5c0:   mov    %eax,-0x18000(%rsp)
  0x00007fab48d7a5c7:   push   %rbp
  0x00007fab48d7a5c8:   sub    $0x50,%rsp
  0x00007fab48d7a5cc:   cmpl   $0x1,0x20(%r15)
  0x00007fab48d7a5d4:   jne    0x00007fab48d7a852           ;*synchronization entry
                                                            ; - mul::workload@-1 (line 9)
  0x00007fab48d7a5da:   mov    %rsi,%r10
  0x00007fab48d7a5dd:   movabs $0x11f0dc5e8,%r11            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
                                                            ; - mul::workload@28 (line 11)
                                                            ;   {oop(a 'java/lang/Class'{0x000000011f0dc5e8} = 'mul')}
  0x00007fab48d7a5e7:   mov    0x78(%r11),%r9d              ;*getstatic SPECIES {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - mul::workload@0 (line 9)
  0x00007fab48d7a5eb:   mov    0x8(%r12,%r9,8),%r8d         ; implicit exception: dispatches to 0x00007fab48d7a7a0
 ;; B2: #	out( B14 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007fab48d7a5f0:   cmp    $0x1048770,%r8d              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
                                                            ; - mul::workload@28 (line 11)
                                                            ;   {metadata('jdk/incubator/vector/IntVector$IntSpecies')}
  0x00007fab48d7a5f7:   jne    0x00007fab48d7a6e8
 ;; B3: #	out( B19 B4 ) <- in( B2 )  Freq: 0.999998
  0x00007fab48d7a5fd:   nop
  0x00007fab48d7a5fe:   nop
  0x00007fab48d7a5ff:   nop
  0x00007fab48d7a600:   mov    0xc(%rsi),%r11d              ; implicit exception: dispatches to 0x00007fab48d7a7c4
 ;; B4: #	out( B15 B5 ) <- in( B3 )  Freq: 0.999997
  0x00007fab48d7a604:   lea    (%r12,%r9,8),%r8             ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@2 (line 3064)
                                                            ; - mul::workload@5 (line 9)
  0x00007fab48d7a608:   sub    0xc(%r8),%r11d
  0x00007fab48d7a60c:   lea    0x1(%r11),%ebp
  0x00007fab48d7a610:   test   %ebp,%ebp
  0x00007fab48d7a612:   jl     0x00007fab48d7a718
 ;; B5: #	out( B12 B6 ) <- in( B4 )  Freq: 0.999996
  0x00007fab48d7a618:   nop
  0x00007fab48d7a619:   nop
  0x00007fab48d7a61a:   nop
  0x00007fab48d7a61b:   nop
  0x00007fab48d7a61c:   nop
  0x00007fab48d7a61d:   nop
  0x00007fab48d7a61e:   nop
  0x00007fab48d7a61f:   nop
  0x00007fab48d7a620:   cmp    $0xffffffff,%r11d
  0x00007fab48d7a624:   je     0x00007fab48d7a689           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
                                                            ; - mul::workload@28 (line 11)
 ;; B6: #	out( B21 B7 ) <- in( B5 )  Freq: 0.999995
  0x00007fab48d7a62a:   mov    0x48(%r8),%ebp               ;*getfield dummyVectorMF {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVectorMF@1 (line 322)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVectorMF@1 (line 4030)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 3066)
                                                            ; - mul::workload@5 (line 9)
  0x00007fab48d7a62e:   mov    0x8(%r12,%rbp,8),%r11d       ; implicit exception: dispatches to 0x00007fab48d7a80c
 ;; B7: #	out( B17 B8 ) <- in( B6 )  Freq: 0.999994
  0x00007fab48d7a633:   nop
  0x00007fab48d7a634:   nop
  0x00007fab48d7a635:   nop
  0x00007fab48d7a636:   nop
  0x00007fab48d7a637:   nop
  0x00007fab48d7a638:   nop
  0x00007fab48d7a639:   nop
  0x00007fab48d7a63a:   nop
  0x00007fab48d7a63b:   nop
  0x00007fab48d7a63c:   nop
  0x00007fab48d7a63d:   nop
  0x00007fab48d7a63e:   nop
  0x00007fab48d7a63f:   nop
  0x00007fab48d7a640:   cmp    $0x104c630,%r11d             ;   {metadata('jdk/incubator/vector/Int256Vector')}
  0x00007fab48d7a647:   jne    0x00007fab48d7a774
 ;; B8: #	out( B20 B9 ) <- in( B7 )  Freq: 0.999994
  0x00007fab48d7a64d:   mov    0xc(%rdx),%r11d              ; implicit exception: dispatches to 0x00007fab48d7a7e8
                                                            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
                                                            ; - mul::workload@28 (line 11)
 ;; B9: #	out( B16 B10 ) <- in( B8 )  Freq: 0.999993
  0x00007fab48d7a651:   vmovdqu 0x10(%rsi),%ymm0            ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@32 (line 3554)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 882)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 3066)
                                                            ; - mul::workload@5 (line 9)
  0x00007fab48d7a656:   vpmulld %ymm0,%ymm0,%ymm0           ;*invokestatic binaryOp {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@154 (line 856)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 304)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 42)
                                                            ; - mul::workload@23 (line 11)
  0x00007fab48d7a65b:   lea    -0x7(%r11),%ebp
  0x00007fab48d7a65f:   nop
  0x00007fab48d7a660:   test   %ebp,%ebp
  0x00007fab48d7a662:   jl     0x00007fab48d7a748
 ;; B10: #	out( B13 B11 ) <- in( B9 )  Freq: 0.999992
  0x00007fab48d7a668:   cmp    $0x7,%r11d
  0x00007fab48d7a66c:   je     0x00007fab48d7a6bc
 ;; B11: #	out( N1 ) <- in( B10 )  Freq: 0.999991
  0x00007fab48d7a66e:   vmovdqu %ymm0,0x10(%rdx)
  0x00007fab48d7a673:   vzeroupper 
  0x00007fab48d7a676:   add    $0x50,%rsp
  0x00007fab48d7a67a:   pop    %rbp
  0x00007fab48d7a67b:   cmp    0x3c0(%r15),%rsp             ;   {poll_return}
  0x00007fab48d7a682:   ja     0x00007fab48d7a83c
  0x00007fab48d7a688:   retq   
 ;; B12: #	out( N1 ) <- in( B5 )  Freq: 1.01327e-06
  0x00007fab48d7a689:   mov    $0xffffffe4,%esi
  0x00007fab48d7a68e:   mov    %rdx,0x8(%rsp)
  0x00007fab48d7a693:   mov    %r10,0x10(%rsp)
  0x00007fab48d7a698:   mov    %r8,0x18(%rsp)               ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
                                                            ; - mul::workload@28 (line 11)
  0x00007fab48d7a69d:   nop
  0x00007fab48d7a69e:   nop
  0x00007fab48d7a69f:   nop
  0x00007fab48d7a6a0:   vzeroupper 
  0x00007fab48d7a6a3:   callq  0x00007fab48be9ea0           ; ImmutableOopMap {[8]=Oop [16]=Oop [24]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 473)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 3064)
                                                            ; - mul::workload@5 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fab48d7a6a8:   movabs $0x7fab5a339a08,%rdi         ;   {external_word}
  0x00007fab48d7a6b2:   and    $0xfffffffffffffff0,%rsp
  0x00007fab48d7a6b6:   callq  0x00007fab599a85b4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fab48d7a6bb:   hlt    
 ;; B13: #	out( N1 ) <- in( B10 )  Freq: 1.01327e-06
  0x00007fab48d7a6bc:   mov    $0xffffffe4,%esi
  0x00007fab48d7a6c1:   mov    %rdx,(%rsp)
  0x00007fab48d7a6c5:   vmovdqu %ymm0,0x20(%rsp)            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
                                                            ; - mul::workload@28 (line 11)
  0x00007fab48d7a6cb:   nop
  0x00007fab48d7a6cc:   vzeroupper 
  0x00007fab48d7a6cf:   callq  0x00007fab48be9ea0           ; ImmutableOopMap {[0]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 473)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 3337)
                                                            ; - mul::workload@28 (line 11)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fab48d7a6d4:   movabs $0x7fab5a339a08,%rdi         ;   {external_word}
  0x00007fab48d7a6de:   and    $0xfffffffffffffff0,%rsp
  0x00007fab48d7a6e2:   callq  0x00007fab599a85b4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fab48d7a6e7:   hlt    
 ;; B14: #	out( N1 ) <- in( B2 )  Freq: 9.99999e-07
  0x00007fab48d7a6e8:   mov    $0xffffffde,%esi
  0x00007fab48d7a6ed:   mov    %rdx,(%rsp)
  0x00007fab48d7a6f1:   mov    %r10,0x10(%rsp)
  0x00007fab48d7a6f6:   mov    %r9d,0xc(%rsp)               ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
                                                            ; - mul::workload@28 (line 11)
  0x00007fab48d7a6fb:   nop
  0x00007fab48d7a6fc:   vzeroupper 
  0x00007fab48d7a6ff:   callq  0x00007fab48be9ea0           ; ImmutableOopMap {[0]=Oop [12]=NarrowOop [16]=Oop }
                                                            ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@2 (line 3064)
                                                            ; - mul::workload@5 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fab48d7a704:   movabs $0x7fab5a339a08,%rdi         ;   {external_word}
  0x00007fab48d7a70e:   and    $0xfffffffffffffff0,%rsp
  0x00007fab48d7a712:   callq  0x00007fab599a85b4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fab48d7a717:   hlt    
 ;; B15: #	out( N1 ) <- in( B4 )  Freq: 9.99997e-07
  0x00007fab48d7a718:   mov    $0xffffffcc,%esi
  0x00007fab48d7a71d:   mov    %rdx,0x8(%rsp)
  0x00007fab48d7a722:   mov    %r10,0x10(%rsp)
  0x00007fab48d7a727:   mov    %r8,0x18(%rsp)
  0x00007fab48d7a72c:   vzeroupper 
  0x00007fab48d7a72f:   callq  0x00007fab48be9ea0           ; ImmutableOopMap {[8]=Oop [16]=Oop [24]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 473)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 3064)
                                                            ; - mul::workload@5 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fab48d7a734:   movabs $0x7fab5a339a08,%rdi         ;   {external_word}
  0x00007fab48d7a73e:   and    $0xfffffffffffffff0,%rsp
  0x00007fab48d7a742:   callq  0x00007fab599a85b4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fab48d7a747:   hlt    
 ;; B16: #	out( N1 ) <- in( B9 )  Freq: 9.99993e-07
  0x00007fab48d7a748:   mov    $0xffffffcc,%esi
  0x00007fab48d7a74d:   mov    %rdx,(%rsp)
  0x00007fab48d7a751:   vmovdqu %ymm0,0x20(%rsp)            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
                                                            ; - mul::workload@28 (line 11)
  0x00007fab48d7a757:   nop
  0x00007fab48d7a758:   vzeroupper 
  0x00007fab48d7a75b:   callq  0x00007fab48be9ea0           ; ImmutableOopMap {[0]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 473)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 3337)
                                                            ; - mul::workload@28 (line 11)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fab48d7a760:   movabs $0x7fab5a339a08,%rdi         ;   {external_word}
  0x00007fab48d7a76a:   and    $0xfffffffffffffff0,%rsp
  0x00007fab48d7a76e:   callq  0x00007fab599a85b4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fab48d7a773:   hlt    
 ;; B17: #	out( N1 ) <- in( B7 )  Freq: 1e-35
  0x00007fab48d7a774:   mov    $0xffffffde,%esi
  0x00007fab48d7a779:   mov    %rdx,0x8(%rsp)
  0x00007fab48d7a77e:   mov    %r10,0x10(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
                                                            ; - mul::workload@28 (line 11)
  0x00007fab48d7a783:   nop
  0x00007fab48d7a784:   vzeroupper 
  0x00007fab48d7a787:   callq  0x00007fab48be9ea0           ; ImmutableOopMap {rbp=NarrowOop [8]=Oop [16]=Oop }
                                                            ;*checkcast {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVectorMF@4 (line 4030)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 3066)
                                                            ; - mul::workload@5 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fab48d7a78c:   movabs $0x7fab5a339a08,%rdi         ;   {external_word}
  0x00007fab48d7a796:   and    $0xfffffffffffffff0,%rsp
  0x00007fab48d7a79a:   callq  0x00007fab599a85b4Time = 3
           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fab48d7a79f:   hlt    
 ;; B18: #	out( N1 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007fab48d7a7a0:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
                                                            ; - mul::workload@28 (line 11)
  0x00007fab48d7a7a5:   nop
  0x00007fab48d7a7a6:   nop
  0x00007fab48d7a7a7:   nop
  0x00007fab48d7a7a8:   vzeroupper 
  0x00007fab48d7a7ab:   callq  0x00007fab48be9ea0           ; ImmutableOopMap {}
                                                            ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@2 (line 3064)
                                                            ; - mul::workload@5 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fab48d7a7b0:   movabs $0x7fab5a339a08,%rdi         ;   {external_word}
  0x00007fab48d7a7ba:   and    $0xfffffffffffffff0,%rsp
  0x00007fab48d7a7be:   callq  0x00007fab599a85b4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fab48d7a7c3:   hlt    
 ;; B19: #	out( N1 ) <- in( B3 )  Freq: 1.01328e-06
  0x00007fab48d7a7c4:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
                                                            ; - mul::workload@28 (line 11)
  0x00007fab48d7a7c9:   nop
  0x00007fab48d7a7ca:   nop
  0x00007fab48d7a7cb:   nop
  0x00007fab48d7a7cc:   vzeroupper 
  0x00007fab48d7a7cf:   callq  0x00007fab48be9ea0           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@8 (line 3064)
                                                            ; - mul::workload@5 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fab48d7a7d4:   movabs $0x7fab5a339a08,%rdi         ;   {external_word}
  0x00007fab48d7a7de:   and    $0xfffffffffffffff0,%rsp
  0x00007fab48d7a7e2:   callq  0x00007fab599a85b4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fab48d7a7e7:   hlt    
 ;; B20: #	out( N1 ) <- in( B8 )  Freq: 1.01327e-06
  0x00007fab48d7a7e8:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
                                                            ; - mul::workload@28 (line 11)
  0x00007fab48d7a7ed:   nop
  0x00007fab48d7a7ee:   nop
  0x00007fab48d7a7ef:   nop
  0x00007fab48d7a7f0:   vzeroupper 
  0x00007fab48d7a7f3:   callq  0x00007fab48be9ea0           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@6 (line 3337)
                                                            ; - mul::workload@28 (line 11)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fab48d7a7f8:   movabs $0x7fab5a339a08,%rdi         ;   {external_word}
  0x00007fab48d7a802:   and    $0xfffffffffffffff0,%rsp
  0x00007fab48d7a806:   callq  0x00007fab599a85b41 
4 
9 
16 
25 
36 
49 
64 
           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fab48d7a80b:   hlt    
 ;; B21: #	out( N1 ) <- in( B6 )  Freq: 4.76835e-07
  0x00007fab48d7a80c:   mov    $0xffffff45,%esi
  0x00007fab48d7a811:   mov    %rdx,0x8(%rsp)
  0x00007fab48d7a816:   mov    %r10,0x10(%rsp)
  0x00007fab48d7a81b:   mov    %r8,0x18(%rsp)
  0x00007fab48d7a820:   vzeroupper 
  0x00007fab48d7a823:   callq  0x00007fab48be9ea0           ; ImmutableOopMap {rbp=NarrowOop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*ifnull {reexecute=1 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - (reexecute) jdk.incubator.vector.AbstractSpecies::dummyVectorMF@6 (line 323)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVectorMF@1 (line 4030)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 3066)
                                                            ; - mul::workload@5 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fab48d7a828:   movabs $0x7fab5a339a08,%rdi         ;   {external_word}
  0x00007fab48d7a832:   and    $0xfffffffffffffff0,%rsp
  0x00007fab48d7a836:   callq  0x00007fab599a85b4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fab48d7a83b:   hlt                                 ;*ifnull {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVectorMF@6 (line 323)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVectorMF@1 (line 4030)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 3066)
                                                            ; - mul::workload@5 (line 9)
  0x00007fab48d7a83c:   movabs $0x7fab48d7a67b,%r10         ;   {internal_word}
  0x00007fab48d7a846:   mov    %r10,0x3d8(%r15)
  0x00007fab48d7a84d:   jmpq   0x00007fab48d16520           ;   {runtime_call SafepointBlob}
  0x00007fab48d7a852:   callq  Stub::nmethod_entry_barrier  ;   {runtime_call StubRoutines (2)}
  0x00007fab48d7a857:   jmpq   0x00007fab48d7a5da
  0x00007fab48d7a85c:   hlt    
  0x00007fab48d7a85d:   hlt    
  0x00007fab48d7a85e:   hlt    
  0x00007fab48d7a85f:   hlt    
[Exception Handler]
  0x00007fab48d7a860:   jmpq   0x00007fab48c1d1a0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007fab48d7a865:   callq  0x00007fab48d7a86a
  0x00007fab48d7a86a:   subq   $0x5,(%rsp)
  0x00007fab48d7a86f:   jmpq   0x00007fab48d179c0           ;   {runtime_call DeoptimizationBlob}
  0x00007fab48d7a874:   hlt    
  0x00007fab48d7a875:   hlt    
  0x00007fab48d7a876:   hlt    
  0x00007fab48d7a877:   hlt    
--------------------------------------------------------------------------------
[/Disassembly]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007fab48d7a878:   0x000000011f0eb520 a 'java/lang/Class'{0x000000011f0eb520} = 'jdk/incubator/vector/Int256Vector'
  0x00007fab48d7a880:   0x000000011f014428 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000011f014428}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007fab48d7a888:   0x00007fab004015f0 {method} {0x00007fab004015f0} 'workload' '([I[I)V' in 'mul'
  0x00007fab48d7a890:   0x00007fab00045a20 {method} {0x00007fab00045a20} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
  0x00007fab48d7a898:   0x0000000801048770 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fab48d7a8a0:   0x00007fab000451c0 {method} {0x00007fab000451c0} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fab48d7a8a8:   0x00007fab00091dd8 {method} {0x00007fab00091dd8} 'dummyVectorMF' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fab48d7a8b0:   0x00007fab00097990 {method} {0x00007fab00097990} 'dummyVectorMF' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fab48d7a8b8:   0x000000080104c630 'jdk/incubator/vector/Int256Vector'
  0x00007fab48d7a8c0:   0x00007fab000d3b28 {method} {0x00007fab000d3b28} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fab48d7a8c8:   0x00007fab00046318 {method} {0x00007fab00046318} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fab48d7a8d0:   0x00007fab000d5c48 {method} {0x00007fab000d5c48} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fab48d7a8d8:   0x00007fab000d15a8 {method} {0x00007fab000d15a8} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fab48d7a8e0:   0x00007fab0003cfb0 {method} {0x00007fab0003cfb0} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fab48d7a8e8:   0x00007fab000ef6b8 {method} {0x00007fab000ef6b8} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007fab48d7a8f0:   0x0000000800078940 {method} {0x0000000800078940} 'checkIndex' '(II)I' in 'java/util/Objects'
  0x00007fab48d7a8f8:   0x00000008010541a0 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
  0x00007fab48d7a900:   0x00007fab001678d8 {method} {0x00007fab001678d8} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fab48d7a908:   0x0000000801053910 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fab48d7a910:   0x00007fab00167410 {method} {0x00007fab00167410} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fab48d7a918:   0x00007fab00167500 {method} {0x00007fab00167500} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fab48d7a920:   0x00007fab0008b268 {method} {0x00007fab0008b268} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
  0x00007fab48d7a928:   0x00000008010473d0 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007fab48d7a5bf offset=ffffffff bits=0):
PcDesc(pc=0x00007fab48d7a5da offset=1a bits=0):
   mul::workload@-1 (line 9)
PcDesc(pc=0x00007fab48d7a5e7 offset=27 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
   mul::workload@28 (line 11)
PcDesc(pc=0x00007fab48d7a5eb offset=2b bits=0):
   mul::workload@0 (line 9)
PcDesc(pc=0x00007fab48d7a5f7 offset=37 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
   mul::workload@28 (line 11)
PcDesc(pc=0x00007fab48d7a608 offset=48 bits=0):
   jdk.incubator.vector.IntVector::fromArray@2 (line 3064)
   mul::workload@5 (line 9)
PcDesc(pc=0x00007fab48d7a62a offset=6a bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
   mul::workload@28 (line 11)
PcDesc(pc=0x00007fab48d7a62e offset=6e bits=0):
   jdk.incubator.vector.AbstractSpecies::dummyVectorMF@1 (line 322)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVectorMF@1 (line 4030)
   jdk.incubator.vector.IntVector::fromArray@19 (line 3066)
   mul::workload@5 (line 9)
PcDesc(pc=0x00007fab48d7a651 offset=91 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
   mul::workload@28 (line 11)
PcDesc(pc=0x00007fab48d7a656 offset=96 bits=0):
   jdk.incubator.vector.IntVector::fromArray0Template@32 (line 3554)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 882)
   jdk.incubator.vector.IntVector::fromArray@24 (line 3066)
   mul::workload@5 (line 9)
PcDesc(pc=0x00007fab48d7a65b offset=9b bits=0):
   jdk.incubator.vector.IntVector::lanewiseTemplate@154 (line 856)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 304)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 42)
   mul::workload@23 (line 11)
PcDesc(pc=0x00007fab48d7a69d offset=dd bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
   mul::workload@28 (line 11)
PcDesc(pc=0x00007fab48d7a6a8 offset=e8 bits=0):
   java.util.Objects::checkIndex@3 (line 473)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::fromArray@9 (line 3064)
   Locals
    - l0: stack[24],oop
    - l1: stack[16],oop
    - l2: empty
    - l3: empty
   mul::workload@5 (line 9)
   Locals
    - l0: stack[16],oop
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
PcDesc(pc=0x00007fab48d7a6cb offset=10b bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
   mul::workload@28 (line 11)
PcDesc(pc=0x00007fab48d7a6d4 offset=114 bits=0):
   java.util.Objects::checkIndex@3 (line 473)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::intoArray@7 (line 3337)
   Locals
    - l0: obj[138]
    - l1: stack[0],oop
    - l2: empty
    - l3: empty
   mul::workload@28 (line 11)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Objects
    - 138: jdk.incubator.vector.Int256Vector stack[32],vector
PcDesc(pc=0x00007fab48d7a6fb offset=13b bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
   mul::workload@28 (line 11)
PcDesc(pc=0x00007fab48d7a704 offset=144 bits=0):
   jdk.incubator.vector.IntVector::fromArray@2 (line 3064)
   Locals
    - l0: stack[12],narrowoop
    - l1: stack[16],oop
    - l2: empty
    - l3: empty
   Expression stack
    - @0: 0
    - @1: stack[12],narrowoop
   mul::workload@5 (line 9)
   Locals
    - l0: stack[16],oop
    - l1: stack[0],oop
    - l2: empty
    - l3: empty
PcDesc(pc=0x00007fab48d7a734 offset=174 bits=0):
   java.util.Objects::checkIndex@3 (line 473)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::fromArray@9 (line 3064)
   Locals
    - l0: stack[24],oop
    - l1: stack[16],oop
    - l2: empty
    - l3: empty
   mul::workload@5 (line 9)
   Locals
    - l0: stack[16],oop
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
PcDesc(pc=0x00007fab48d7a757 offset=197 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
   mul::workload@28 (line 11)
PcDesc(pc=0x00007fab48d7a760 offset=1a0 bits=0):
   java.util.Objects::checkIndex@3 (line 473)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: NULL
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
   jdk.incubator.vector.IntVector::intoArray@7 (line 3337)
   Locals
    - l0: obj[121]
    - l1: stack[0],oop
    - l2: empty
    - l3: empty
   mul::workload@28 (line 11)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Objects
    - 121: jdk.incubator.vector.Int256Vector stack[32],vector
PcDesc(pc=0x00007fab48d7a783 offset=1c3 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
   mul::workload@28 (line 11)
PcDesc(pc=0x00007fab48d7a78c offset=1cc bits=0):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVectorMF@4 (line 4030)
   Locals
    - l0: empty
   Expression stack
    - @0: reg rbp [10],narrowoop
   jdk.incubator.vector.IntVector::fromArray@19 (line 3066)
   Locals
    - l0: empty
    - l1: stack[16],oop
    - l2: 0
    - l3: empty
   mul::workload@5 (line 9)
   Locals
    - l0: stack[16],oop
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
PcDesc(pc=0x00007fab48d7a7a5 offset=1e5 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
   mul::workload@28 (line 11)
PcDesc(pc=0x00007fab48d7a7b0 offset=1f0 bits=0):
   jdk.incubator.vector.IntVector::fromArray@2 (line 3064)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: empty
    - @1: NULL
   mul::workload@5 (line 9)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
PcDesc(pc=0x00007fab48d7a7c9 offset=209 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
   mul::workload@28 (line 11)
PcDesc(pc=0x00007fab48d7a7d4 offset=214 bits=0):
   jdk.incubator.vector.IntVector::fromArray@8 (line 3064)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: NULL
   mul::workload@5 (line 9)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
PcDesc(pc=0x00007fab48d7a7ed offset=22d bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
   mul::workload@28 (line 11)
PcDesc(pc=0x00007fab48d7a7f8 offset=238 bits=0):
   jdk.incubator.vector.IntVector::intoArray@6 (line 3337)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: NULL
   mul::workload@28 (line 11)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
PcDesc(pc=0x00007fab48d7a828 offset=268 bits=1):
   jdk.incubator.vector.AbstractSpecies::dummyVectorMF@6 (line 323)  reexecute=true
   Locals
    - l0: stack[24],oop
    - l1: reg rbp [10],narrowoop
   Expression stack
    - @0: reg rbp [10],narrowoop
   jdk.incubator.vector.IntVector$IntSpecies::dummyVectorMF@1 (line 4030)
   Locals
    - l0: empty
   jdk.incubator.vector.IntVector::fromArray@19 (line 3066)
   Locals
    - l0: empty
    - l1: stack[16],oop
    - l2: 0
    - l3: empty
   mul::workload@5 (line 9)
   Locals
    - l0: stack[16],oop
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
PcDesc(pc=0x00007fab48d7a83c offset=27c bits=0):
   jdk.incubator.vector.AbstractSpecies::dummyVectorMF@6 (line 323)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVectorMF@1 (line 4030)
   jdk.incubator.vector.IntVector::fromArray@19 (line 3066)
   mul::workload@5 (line 9)
PcDesc(pc=0x00007fab48d7a879 offset=2b9 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 10 OopMaps

ImmutableOopMap {[8]=Oop [16]=Oop [24]=Oop } pc offsets: 232 
ImmutableOopMap {[0]=Oop } pc offsets: 276 
ImmutableOopMap {[0]=Oop [12]=NarrowOop [16]=Oop } pc offsets: 324 
ImmutableOopMap {[8]=Oop [16]=Oop [24]=Oop } pc offsets: 372 
ImmutableOopMap {[0]=Oop } pc offsets: 416 
ImmutableOopMap {rbp=NarrowOop [8]=Oop [16]=Oop } pc offsets: 460 
ImmutableOopMap {} pc offsets: 496 532 568 
ImmutableOopMap {rbp=NarrowOop [8]=Oop [16]=Oop [24]=Oop } pc offsets: 616 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007fab48d7a5da offset=1a):
   mul::workload@-1 (line 9)
ScopeDesc(pc=0x00007fab48d7a5e7 offset=27):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
ScopeDesc(pc=0x00007fab48d7a5e7 offset=27):
   mul::workload@28 (line 11)
ScopeDesc(pc=0x00007fab48d7a5eb offset=2b):
   mul::workload@0 (line 9)
ScopeDesc(pc=0x00007fab48d7a5f7 offset=37):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
ScopeDesc(pc=0x00007fab48d7a5f7 offset=37):
   mul::workload@28 (line 11)
ScopeDesc(pc=0x00007fab48d7a608 offset=48):
   jdk.incubator.vector.IntVector::fromArray@2 (line 3064)
ScopeDesc(pc=0x00007fab48d7a608 offset=48):
   mul::workload@5 (line 9)
ScopeDesc(pc=0x00007fab48d7a62a offset=6a):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
ScopeDesc(pc=0x00007fab48d7a62a offset=6a):
   mul::workload@28 (line 11)
ScopeDesc(pc=0x00007fab48d7a62e offset=6e):
   jdk.incubator.vector.AbstractSpecies::dummyVectorMF@1 (line 322)
ScopeDesc(pc=0x00007fab48d7a62e offset=6e):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVectorMF@1 (line 4030)
ScopeDesc(pc=0x00007fab48d7a62e offset=6e):
   jdk.incubator.vector.IntVector::fromArray@19 (line 3066)
ScopeDesc(pc=0x00007fab48d7a62e offset=6e):
   mul::workload@5 (line 9)
ScopeDesc(pc=0x00007fab48d7a651 offset=91):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
ScopeDesc(pc=0x00007fab48d7a651 offset=91):
   mul::workload@28 (line 11)
ScopeDesc(pc=0x00007fab48d7a656 offset=96):
   jdk.incubator.vector.IntVector::fromArray0Template@32 (line 3554)
ScopeDesc(pc=0x00007fab48d7a656 offset=96):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 882)
ScopeDesc(pc=0x00007fab48d7a656 offset=96):
   jdk.incubator.vector.IntVector::fromArray@24 (line 3066)
ScopeDesc(pc=0x00007fab48d7a656 offset=96):
   mul::workload@5 (line 9)
ScopeDesc(pc=0x00007fab48d7a65b offset=9b):
   jdk.incubator.vector.IntVector::lanewiseTemplate@154 (line 856)
ScopeDesc(pc=0x00007fab48d7a65b offset=9b):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 304)
ScopeDesc(pc=0x00007fab48d7a65b offset=9b):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 42)
ScopeDesc(pc=0x00007fab48d7a65b offset=9b):
   mul::workload@23 (line 11)
ScopeDesc(pc=0x00007fab48d7a69d offset=dd):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
ScopeDesc(pc=0x00007fab48d7a69d offset=dd):
   mul::workload@28 (line 11)
ScopeDesc(pc=0x00007fab48d7a6a8 offset=e8):
   java.util.Objects::checkIndex@3 (line 473)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: NULL
ScopeDesc(pc=0x00007fab48d7a6a8 offset=e8):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fab48d7a6a8 offset=e8):
   jdk.incubator.vector.IntVector::fromArray@9 (line 3064)
   Locals
    - l0: stack[24],oop
    - l1: stack[16],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fab48d7a6a8 offset=e8):
   mul::workload@5 (line 9)
   Locals
    - l0: stack[16],oop
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fab48d7a6cb offset=10b):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
ScopeDesc(pc=0x00007fab48d7a6cb offset=10b):
   mul::workload@28 (line 11)
ScopeDesc(pc=0x00007fab48d7a6d4 offset=114):
   java.util.Objects::checkIndex@3 (line 473)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: NULL
ScopeDesc(pc=0x00007fab48d7a6d4 offset=114):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fab48d7a6d4 offset=114):
   jdk.incubator.vector.IntVector::intoArray@7 (line 3337)
   Locals
    - l0: obj[138]
    - l1: stack[0],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fab48d7a6d4 offset=114):
   mul::workload@28 (line 11)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Objects
    - 138: jdk.incubator.vector.Int256Vector stack[32],vector
ScopeDesc(pc=0x00007fab48d7a6fb offset=13b):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
ScopeDesc(pc=0x00007fab48d7a6fb offset=13b):
   mul::workload@28 (line 11)
ScopeDesc(pc=0x00007fab48d7a704 offset=144):
   jdk.incubator.vector.IntVector::fromArray@2 (line 3064)
   Locals
    - l0: stack[12],narrowoop
    - l1: stack[16],oop
    - l2: empty
    - l3: empty
   Expression stack
    - @0: 0
    - @1: stack[12],narrowoop
ScopeDesc(pc=0x00007fab48d7a704 offset=144):
   mul::workload@5 (line 9)
   Locals
    - l0: stack[16],oop
    - l1: stack[0],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fab48d7a734 offset=174):
   java.util.Objects::checkIndex@3 (line 473)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: NULL
ScopeDesc(pc=0x00007fab48d7a734 offset=174):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fab48d7a734 offset=174):
   jdk.incubator.vector.IntVector::fromArray@9 (line 3064)
   Locals
    - l0: stack[24],oop
    - l1: stack[16],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fab48d7a734 offset=174):
   mul::workload@5 (line 9)
   Locals
    - l0: stack[16],oop
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fab48d7a757 offset=197):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
ScopeDesc(pc=0x00007fab48d7a757 offset=197):
   mul::workload@28 (line 11)
ScopeDesc(pc=0x00007fab48d7a760 offset=1a0):
   java.util.Objects::checkIndex@3 (line 473)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: NULL
ScopeDesc(pc=0x00007fab48d7a760 offset=1a0):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fab48d7a760 offset=1a0):
   jdk.incubator.vector.IntVector::intoArray@7 (line 3337)
   Locals
    - l0: obj[121]
    - l1: stack[0],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fab48d7a760 offset=1a0):
   mul::workload@28 (line 11)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Objects
    - 121: jdk.incubator.vector.Int256Vector stack[32],vector
ScopeDesc(pc=0x00007fab48d7a783 offset=1c3):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
ScopeDesc(pc=0x00007fab48d7a783 offset=1c3):
   mul::workload@28 (line 11)
ScopeDesc(pc=0x00007fab48d7a78c offset=1cc):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVectorMF@4 (line 4030)
   Locals
    - l0: empty
   Expression stack
    - @0: reg rbp [10],narrowoop
ScopeDesc(pc=0x00007fab48d7a78c offset=1cc):
   jdk.incubator.vector.IntVector::fromArray@19 (line 3066)
   Locals
    - l0: empty
    - l1: stack[16],oop
    - l2: 0
    - l3: empty
ScopeDesc(pc=0x00007fab48d7a78c offset=1cc):
   mul::workload@5 (line 9)
   Locals
    - l0: stack[16],oop
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fab48d7a7a5 offset=1e5):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
ScopeDesc(pc=0x00007fab48d7a7a5 offset=1e5):
   mul::workload@28 (line 11)
ScopeDesc(pc=0x00007fab48d7a7b0 offset=1f0):
   jdk.incubator.vector.IntVector::fromArray@2 (line 3064)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: empty
    - @1: NULL
ScopeDesc(pc=0x00007fab48d7a7b0 offset=1f0):
   mul::workload@5 (line 9)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fab48d7a7c9 offset=209):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
ScopeDesc(pc=0x00007fab48d7a7c9 offset=209):
   mul::workload@28 (line 11)
ScopeDesc(pc=0x00007fab48d7a7d4 offset=214):
   jdk.incubator.vector.IntVector::fromArray@8 (line 3064)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: NULL
ScopeDesc(pc=0x00007fab48d7a7d4 offset=214):
   mul::workload@5 (line 9)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fab48d7a7ed offset=22d):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3339)
ScopeDesc(pc=0x00007fab48d7a7ed offset=22d):
   mul::workload@28 (line 11)
ScopeDesc(pc=0x00007fab48d7a7f8 offset=238):
   jdk.incubator.vector.IntVector::intoArray@6 (line 3337)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: NULL
ScopeDesc(pc=0x00007fab48d7a7f8 offset=238):
   mul::workload@28 (line 11)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fab48d7a828 offset=268):
   jdk.incubator.vector.AbstractSpecies::dummyVectorMF@6 (line 323)  reexecute=true
   Locals
    - l0: stack[24],oop
    - l1: reg rbp [10],narrowoop
   Expression stack
    - @0: reg rbp [10],narrowoop
ScopeDesc(pc=0x00007fab48d7a828 offset=268):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVectorMF@1 (line 4030)
   Locals
    - l0: empty
ScopeDesc(pc=0x00007fab48d7a828 offset=268):
   jdk.incubator.vector.IntVector::fromArray@19 (line 3066)
   Locals
    - l0: empty
    - l1: stack[16],oop
    - l2: 0
    - l3: empty
ScopeDesc(pc=0x00007fab48d7a828 offset=268):
   mul::workload@5 (line 9)
   Locals
    - l0: stack[16],oop
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fab48d7a83c offset=27c):
   jdk.incubator.vector.AbstractSpecies::dummyVectorMF@6 (line 323)
ScopeDesc(pc=0x00007fab48d7a83c offset=27c):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVectorMF@1 (line 4030)
ScopeDesc(pc=0x00007fab48d7a83c offset=27c):
   jdk.incubator.vector.IntVector::fromArray@19 (line 3066)
ScopeDesc(pc=0x00007fab48d7a83c offset=27c):
   mul::workload@5 (line 9)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007fab48d7a500: 081d
relocInfo@0x00007fab48d7a500 [type=1(oop) addr=0x00007fab48d7a5dd offset=29] | [oop_addr=0x00007fab48d7a5df *=0x000000011f0dc5e8 offset=0]
         @0x00007fab48d7a502: 78036613
relocInfo@0x00007fab48d7a504 [type=12(metadata) addr=0x00007fab48d7a5f0 offset=19 format=3 data=3] | [metadata_addr=0x00007fab48d7a898 *=0x0000000801048770 offset=0]metadata_value=0x0000000801048770: 'jdk/incubator/vector/IntVector$IntSpecies'
         @0x00007fab48d7a506: 78076650
relocInfo@0x00007fab48d7a508 [type=12(metadata) addr=0x00007fab48d7a640 offset=80 format=3 data=7] | [metadata_addr=0x00007fab48d7a8b8 *=0x000000080104c630 offset=0]metadata_value=0x000000080104c630: 'jdk/incubator/vector/Int256Vector'
         @0x00007fab48d7a50a: 583b
relocInfo@0x00007fab48d7a50a [type=11(poll_return) addr=0x00007fab48d7a67b offset=59]
         @0x00007fab48d7a50c: 3228
relocInfo@0x00007fab48d7a50c [type=6(runtime_call) addr=0x00007fab48d7a6a3 offset=40 format=1] | [destination=0x00007fab48be9ea0]
         @0x00007fab48d7a50e: 7c035a339a087fab3805
relocInfo@0x00007fab48d7a516 [type=7(external_word) addr=0x00007fab48d7a6a8 offset=5 data={5a339a087fab}] | [target=0x00007fab5a339a08]
         @0x00007fab48d7a518: 320e
relocInfo@0x00007fab48d7a518 [type=6(runtime_call) addr=0x00007fab48d7a6b6 offset=14 format=1] | [destination=0x00007fab599a85b4]
         @0x00007fab48d7a51a: 3219
relocInfo@0x00007fab48d7a51a [type=6(runtime_call) addr=0x00007fab48d7a6cf offset=25 format=1] | [destination=0x00007fab48be9ea0]
         @0x00007fab48d7a51c: 7c035a339a087fab3805
relocInfo@0x00007fab48d7a524 [type=7(external_word) addr=0x00007fab48d7a6d4 offset=5 data={5a339a087fab}] | [target=0x00007fab5a339a08]
         @0x00007fab48d7a526: 320e
relocInfo@0x00007fab48d7a526 [type=6(runtime_call) addr=0x00007fab48d7a6e2 offset=14 format=1] | [destination=0x00007fab599a85b4]
         @0x00007fab48d7a528: 321d
relocInfo@0x00007fab48d7a528 [type=6(runtime_call) addr=0x00007fab48d7a6ff offset=29 format=1] | [destination=0x00007fab48be9ea0]
         @0x00007fab48d7a52a: 7c035a339a087fab3805
relocInfo@0x00007fab48d7a532 [type=7(external_word) addr=0x00007fab48d7a704 offset=5 data={5a339a087fab}] | [target=0x00007fab5a339a08]
         @0x00007fab48d7a534: 320e
relocInfo@0x00007fab48d7a534 [type=6(runtime_call) addr=0x00007fab48d7a712 offset=14 format=1] | [destination=0x00007fab599a85b4]
         @0x00007fab48d7a536: 321d
relocInfo@0x00007fab48d7a536 [type=6(runtime_call) addr=0x00007fab48d7a72f offset=29 format=1] | [destination=0x00007fab48be9ea0]
         @0x00007fab48d7a538: 7c035a339a087fab3805
relocInfo@0x00007fab48d7a540 [type=7(external_word) addr=0x00007fab48d7a734 offset=5 data={5a339a087fab}] | [target=0x00007fab5a339a08]
         @0x00007fab48d7a542: 320e
relocInfo@0x00007fab48d7a542 [type=6(runtime_call) addr=0x00007fab48d7a742 offset=14 format=1] | [destination=0x00007fab599a85b4]
         @0x00007fab48d7a544: 3219
relocInfo@0x00007fab48d7a544 [type=6(runtime_call) addr=0x00007fab48d7a75b offset=25 format=1] | [destination=0x00007fab48be9ea0]
         @0x00007fab48d7a546: 7c035a339a087fab3805
relocInfo@0x00007fab48d7a54e [type=7(external_word) addr=0x00007fab48d7a760 offset=5 data={5a339a087fab}] | [target=0x00007fab5a339a08]
         @0x00007fab48d7a550: 320e
relocInfo@0x00007fab48d7a550 [type=6(runtime_call) addr=0x00007fab48d7a76e offset=14 format=1] | [destination=0x00007fab599a85b4]
         @0x00007fab48d7a552: 3219
relocInfo@0x00007fab48d7a552 [type=6(runtime_call) addr=0x00007fab48d7a787 offset=25 format=1] | [destination=0x00007fab48be9ea0]
         @0x00007fab48d7a554: 7c035a339a087fab3805
relocInfo@0x00007fab48d7a55c [type=7(external_word) addr=0x00007fab48d7a78c offset=5 data={5a339a087fab}] | [target=0x00007fab5a339a08]
         @0x00007fab48d7a55e: 320e
relocInfo@0x00007fab48d7a55e [type=6(runtime_call) addr=0x00007fab48d7a79a offset=14 format=1] | [destination=0x00007fab599a85b4]
         @0x00007fab48d7a560: 3211
relocInfo@0x00007fab48d7a560 [type=6(runtime_call) addr=0x00007fab48d7a7ab offset=17 format=1] | [destination=0x00007fab48be9ea0]
         @0x00007fab48d7a562: 7c035a339a087fab3805
relocInfo@0x00007fab48d7a56a [type=7(external_word) addr=0x00007fab48d7a7b0 offset=5 data={5a339a087fab}] | [target=0x00007fab5a339a08]
         @0x00007fab48d7a56c: 320e
relocInfo@0x00007fab48d7a56c [type=6(runtime_call) addr=0x00007fab48d7a7be offset=14 format=1] | [destination=0x00007fab599a85b4]
         @0x00007fab48d7a56e: 3211
relocInfo@0x00007fab48d7a56e [type=6(runtime_call) addr=0x00007fab48d7a7cf offset=17 format=1] | [destination=0x00007fab48be9ea0]
         @0x00007fab48d7a570: 7c035a339a087fab3805
relocInfo@0x00007fab48d7a578 [type=7(external_word) addr=0x00007fab48d7a7d4 offset=5 data={5a339a087fab}] | [target=0x00007fab5a339a08]
         @0x00007fab48d7a57a: 320e
relocInfo@0x00007fab48d7a57a [type=6(runtime_call) addr=0x00007fab48d7a7e2 offset=14 format=1] | [destination=0x00007fab599a85b4]
         @0x00007fab48d7a57c: 3211
relocInfo@0x00007fab48d7a57c [type=6(runtime_call) addr=0x00007fab48d7a7f3 offset=17 format=1] | [destination=0x00007fab48be9ea0]
         @0x00007fab48d7a57e: 7c035a339a087fab3805
relocInfo@0x00007fab48d7a586 [type=7(external_word) addr=0x00007fab48d7a7f8 offset=5 data={5a339a087fab}] | [target=0x00007fab5a339a08]
         @0x00007fab48d7a588: 320e
relocInfo@0x00007fab48d7a588 [type=6(runtime_call) addr=0x00007fab48d7a806 offset=14 format=1] | [destination=0x00007fab599a85b4]
         @0x00007fab48d7a58a: 321d
relocInfo@0x00007fab48d7a58a [type=6(runtime_call) addr=0x00007fab48d7a823 offset=29 format=1] | [destination=0x00007fab48be9ea0]
         @0x00007fab48d7a58c: 7c035a339a087fab3805
relocInfo@0x00007fab48d7a594 [type=7(external_word) addr=0x00007fab48d7a828 offset=5 data={5a339a087fab}] | [target=0x00007fab5a339a08]
         @0x00007fab48d7a596: 320e
relocInfo@0x00007fab48d7a596 [type=6(runtime_call) addr=0x00007fab48d7a836 offset=14 format=1] | [destination=0x00007fab599a85b4]
         @0x00007fab48d7a598: 79c14006
relocInfo@0x00007fab48d7a59a [type=8(internal_word) addr=0x00007fab48d7a83c offset=6 data=449] | [target=0x00007fab48d7a67b]
         @0x00007fab48d7a59c: 3211
relocInfo@0x00007fab48d7a59c [type=6(runtime_call) addr=0x00007fab48d7a84d offset=17 format=1] | [destination=0x00007fab48d16520]
         @0x00007fab48d7a59e: 3205
relocInfo@0x00007fab48d7a59e [type=6(runtime_call) addr=0x00007fab48d7a852 offset=5 format=1] | [destination=0x00007fab48c71300]
         @0x00007fab48d7a5a0: 000e
relocInfo@0x00007fab48d7a5a0 [type=0(none) addr=0x00007fab48d7a860 offset=14]
         @0x00007fab48d7a5a2: 3200
relocInfo@0x00007fab48d7a5a2 [type=6(runtime_call) addr=0x00007fab48d7a860 offset=0 format=1] | [destination=0x00007fab48c1d1a0]
         @0x00007fab48d7a5a4: 320f
relocInfo@0x00007fab48d7a5a4 [type=6(runtime_call) addr=0x00007fab48d7a86f offset=15 format=1] | [destination=0x00007fab48d179c0]
         @0x00007fab48d7a5a6: 0000
relocInfo@0x00007fab48d7a5a6 [type=0(none) addr=0x00007fab48d7a86f offset=0]
         @0x00007fab48d7a5a8: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fab001678d8} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  class   = jdk.incubator.vector.VectorOperators$OperatorImpl
  method  = {method} {0x00007fab001678d8} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fab00167410} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  class   = jdk.incubator.vector.VectorOperators$OperatorImpl
  method  = {method} {0x00007fab00167410} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fab00167500} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  class   = jdk.incubator.vector.VectorOperators$OperatorImpl
  method  = {method} {0x00007fab00167500} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.VectorOperators$ImplCache
  method  = {method} {0x00007fab0008b268} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
  class   = jdk.incubator.vector.VectorOperators$ImplCache
  method  = {method} {0x00007fab0008b268} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$ImplCache
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 4 entries, 36 bytes):
{
   < 0x00007fab48d7a5eb, 0x00007fab48d7a7a0 > < 0x00007fab48d7a600, 0x00007fab48d7a7c4 > < 0x00007fab48d7a62e, 0x00007fab48d7a80c > 
   < 0x00007fab48d7a64d, 0x00007fab48d7a7e8 > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x000000011f0eb520 a 'java/lang/Class'{0x000000011f0eb520} = 'jdk/incubator/vector/Int256Vector'
#2: 0x000000011f014428 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000011f014428}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
# 0: 0x0000000000000000 NULL-oop
# 1: 0x00007fab004015f0 {method} {0x00007fab004015f0} 'workload' '([I[I)V' in 'mul'
# 2: 0x00007fab00045a20 {method} {0x00007fab00045a20} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
# 3: 0x0000000801048770 'jdk/incubator/vector/IntVector$IntSpecies'
# 4: 0x00007fab000451c0 {method} {0x00007fab000451c0} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
# 5: 0x00007fab00091dd8 {method} {0x00007fab00091dd8} 'dummyVectorMF' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
# 6: 0x00007fab00097990 {method} {0x00007fab00097990} 'dummyVectorMF' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
# 7: 0x000000080104c630 'jdk/incubator/vector/Int256Vector'
# 8: 0x00007fab000d3b28 {method} {0x00007fab000d3b28} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
# 9: 0x00007fab00046318 {method} {0x00007fab00046318} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#10: 0x00007fab000d5c48 {method} {0x00007fab000d5c48} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
#11: 0x00007fab000d15a8 {method} {0x00007fab000d15a8} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
#12: 0x00007fab0003cfb0 {method} {0x00007fab0003cfb0} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#13: 0x00007fab000ef6b8 {method} {0x00007fab000ef6b8} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
#14: 0x0000000800078940 {method} {0x0000000800078940} 'checkIndex' '(II)I' in 'java/util/Objects'
#15: 0x00000008010541a0 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
#16: 0x00007fab001678d8 {method} {0x00007fab001678d8} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#17: 0x0000000801053910 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#18: 0x00007fab00167410 {method} {0x00007fab00167410} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#19: 0x00007fab00167500 {method} {0x00007fab00167500} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#20: 0x00007fab0008b268 {method} {0x00007fab0008b268} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
#21: 0x00000008010473d0 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
------------------------------------------------------------------------
static mul::workload([I[I)V
  interpreter_invocation_count:       32937
  invocation_counter:                 32937
  backedge_counter:                       0
  decompile_count:                        0
  mdo size: 568 bytes

   0 getstatic 7 <mul.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
   3 fast_aload_0
   4 iconst_0
   5 invokestatic 13 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  0   bci: 5    CounterData         count(31274)
   8 astore_2
   9 getstatic 7 <mul.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
  12 fast_aload_0
  13 iconst_0
  14 invokestatic 13 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  16  bci: 14   CounterData         count(31274)
  17 astore_3
  18 aload_3
  19 getstatic 19 <jdk/incubator/vector/VectorOperators.MUL/Ljdk/incubator/vector/VectorOperators$Associative;> 
  22 aload_2
  23 invokevirtual 25 <jdk/incubator/vector/IntVector.lanewise(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;> 
  32  bci: 23   VirtualCallData     count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/Int256Vector'(31274 1.00)
  26 aload_1
  27 iconst_0
  28 invokevirtual 29 <jdk/incubator/vector/IntVector.intoArray([II)V> 
  88  bci: 28   VirtualCallData     count(31274) nonprofiled_count(0) entries(0)
  31 return
------------------------------------------------------------------------
Total MDO size: 568 bytes
