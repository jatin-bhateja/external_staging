CompileCommand: print mul.workload bool print = true
CompileCommand: dontinline mul.leaf bool dontinline = true

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
#r597 rsp+20: spill
#r596 rsp+16: spill
#r595 rsp+12: spill
#r594 rsp+ 8: spill
#r593 rsp+ 4: spill
#r592 rsp+ 0: spill
#
----------------------- MetaData before Compile_id = 277 ------------------------
{method}
 - this oop:          0x00007f54bc6036e8
 - method holder:     'mul'
 - constants:         0x00007f54bc603080 constant pool [115]/operands[10] {0x00007f54bc603080} for 'mul' cache=0x00007f54bc603a68
 - access:            0x9  public static 
 - flags:             0x4080   queued_for_compilation  has_loops_flag_init 
 - name:              'workload'
 - signature:         '([I[I)V'
 - max stack:         5
 - max locals:        5
 - size of params:    2
 - method size:       14
 - vtable index:      -2
 - i2i entry:         0x00007f550100c740
 - adapters:          AHE@0x00007f550438f730: 0xbb i2c: 0x00007f550105cb80 c2i: 0x00007f550105cc71 c2iUV: 0x00007f550105cc3f c2iNCI: 0x00007f550105ccab
 - compiled entry     0x00007f550105cc71
 - code size:         51
 - code start:        0x00007f54bc6036a8
 - code end (excl):   0x00007f54bc6036db
 - method data:       0x00007f54bc603d70
 - checked ex length: 0
 - linenumber start:  0x00007f54bc6036db
 - localvar length:   0

------------------------ OptoAssembly for Compile_id = 277 -----------------------
#
#  void ( int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact *, int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact * )
#
000     N1: #	out( B1 ) <- in( B19 B15 B12 B11 B14 B20 B16 B13 B17 B21 B18 )  Freq: 1

000     B1: #	out( B19 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
000     # stack bang (504 bytes)
	pushq   rbp	# Save rbp
	subq    rsp, #80	# Create frame

01a     movq    R10, RSI	# spill
01d     movq    [rsp + #8], RDX	# spill
022     movq    R11, java/lang/Class (java/io/Serializable,java/lang/constant/Constable,java/lang/reflect/AnnotatedElement,java/lang/invoke/TypeDescriptor,java/lang/reflect/GenericDeclaration,java/lang/reflect/Type,java/lang/invoke/TypeDescriptor$OfField):exact *	# ptr
02c     movl    R11, [R11 + #116 (8-bit)]	# compressed ptr ! Field: mul.mask_arr
030     movl    R9, [R12 + R11 << 3 + #12] (compressed oop addressing)	# range
035     NullCheck R11

035     B2: #	out( B15 B3 ) <- in( B1 )  Freq: 0.999999
035     leal    RBP, [R9 + #-7]
039     testl   RBP, RBP
        nop 	# 5 bytes pad for loops and calls
040     jl     B15  P=0.000001 C=-1.000000

046     B3: #	out( B12 B4 ) <- in( B2 )  Freq: 0.999998
046     cmpl    R9, #7
04a     je     B12  P=0.000001 C=-1.000000

050     B4: #	out( B18 B5 ) <- in( B3 )  Freq: 0.999997
050     load_vector XMM0,[R12 + R11 << 3 + #16] (compressed oop addressing)
057     movq    [rsp + 16],XMM0	# spill
        nop 	# 3 bytes pad for loops and calls
060     call,static  mul::leaf
        # mul::workload @ bci:12 (line 12) L[0]=_ L[1]=rsp + #8 L[2]=#ScObj0 L[3]=_ L[4]=_
        # ScObj0 jdk/incubator/vector/Int256Vector$Int256Mask={ [payload :0]=rsp + #16 }
        # OopMap {[8]=Oop off=104/0x68}

070     B5: #	out( B20 B6 ) <- in( B4 )  Freq: 0.999977
        # Block is sole successor of call
070     movl    R11, [RAX + #12 (8-bit)]	# range
074     NullCheck RAX

074     B6: #	out( B16 B7 ) <- in( B5 )  Freq: 0.999976
074     leal    RBP, [R11 + #-7]
078     testl   RBP, RBP
        nop 	# 6 bytes pad for loops and calls
080     jl     B16  P=0.000001 C=-1.000000

086     B7: #	out( B13 B8 ) <- in( B6 )  Freq: 0.999975
086     cmpl    R11, #7
08a     je     B13  P=0.000001 C=-1.000000

090     B8: #	out( B21 B9 ) <- in( B7 )  Freq: 0.999974
090     movq    R10, [rsp + #8]	# spill
095     movl    R11, [R10 + #12 (8-bit)]	# range
099     NullCheck R10

099     B9: #	out( B17 B10 ) <- in( B8 )  Freq: 0.999973
099     load_vector XMM2,[RAX + #16 (8-bit)]
09e     leal    RBP, [R11 + #-7]
0a2     movq    XMM1,[rsp + 16]	# spill
0a8     vector_loadmask_byte K7, XMM1	! using XMM0 as TEMP
0b6     vpmul_masked XMM2, XMM2, XMM2, K7	! mul masked operation
        nop 	# 4 bytes pad for loops and calls
0c0     testl   RBP, RBP
0c2     jl     B17  P=0.000001 C=-1.000000

0c8     B10: #	out( B14 B11 ) <- in( B9 )  Freq: 0.999972
0c8     cmpl    R11, #7
0cc     je     B14  P=0.000001 C=-1.000000

0d2     B11: #	out( N1 ) <- in( B10 )  Freq: 0.999971
0d2     store_vector [R10 + #16 (8-bit)],XMM2
	
0d8     vzeroupper
	addq    rsp, 80	# Destroy frame
	popq    rbp
	cmpq    rsp, poll_offset[r15_thread] 
	ja      #safepoint_stub	# Safepoint: poll for GC

0ed     ret

0ee     B12: #	out( N1 ) <- in( B3 )  Freq: 1.01328e-06
0ee     movl    RSI, #-28	# int
0f3     movq    [rsp + #0], R10	# spill
0f7     movl    [rsp + #16], R11	# spill
0fc     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 385) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#null
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.VectorMask::fromArray @ bci:16 (line 207) L[0]=_ L[1]=rsp + #16 L[2]=_ L[3]=#Ptr0x00007f5494168fe0 L[4]=#8
        # mul::workload @ bci:7 (line 11) L[0]=rsp + #0 L[1]=rsp + #8 L[2]=_ L[3]=_ L[4]=_
        # OopMap {[0]=Oop [8]=Oop [16]=NarrowOop off=260/0x104}
10c     stop	# ShouldNotReachHere

120     B13: #	out( N1 ) <- in( B7 )  Freq: 1.01325e-06
120     movl    RSI, #-28	# int
125     movq    R10, [rsp + #8]	# spill
12a     movq    [rsp + #0], R10	# spill
12e     movq    [rsp + #24], RAX	# spill
        nop 	# 1 bytes pad for loops and calls
134     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 385) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#null
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2941) L[0]=#Ptr0x00007f5494168fe0 L[1]=rsp + #24 L[2]=_ L[3]=_
        # mul::workload @ bci:21 (line 13) L[0]=rsp + #24 L[1]=rsp + #0 L[2]=#ScObj0 L[3]=_ L[4]=_
        # ScObj0 jdk/incubator/vector/Int256Vector$Int256Mask={ [payload :0]=rsp + #16 }
        # OopMap {[0]=Oop [24]=Oop off=316/0x13c}
144     stop	# ShouldNotReachHere

158     B14: #	out( N1 ) <- in( B10 )  Freq: 1.01325e-06
158     movl    RSI, #-28	# int
15d     vmovdqu [rsp + 32],XMM2	# spill
        nop 	# 1 bytes pad for loops and calls
164     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 385) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#null
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:7 (line 3214) L[0]=#ScObj0 L[1]=rsp + #8 L[2]=_ L[3]=_
        # ScObj0 jdk/incubator/vector/Int256Vector={ [payload :0]=rsp + #32 }
        # mul::workload @ bci:47 (line 15) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # OopMap {[8]=Oop off=364/0x16c}
174     stop	# ShouldNotReachHere

188     B15: #	out( N1 ) <- in( B2 )  Freq: 9.99999e-07
188     movl    RSI, #-52	# int
18d     movq    [rsp + #0], R10	# spill
191     movl    [rsp + #16], R11	# spill
        nop 	# 2 bytes pad for loops and calls
198     call,static  wrapper for: uncommon_trap(reason='intrinsic_or_type_checked_inlining' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 385) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#null
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.VectorMask::fromArray @ bci:16 (line 207) L[0]=_ L[1]=rsp + #16 L[2]=_ L[3]=#Ptr0x00007f5494168fe0 L[4]=#8
        # mul::workload @ bci:7 (line 11) L[0]=rsp + #0 L[1]=rsp + #8 L[2]=_ L[3]=_ L[4]=_
        # OopMap {[0]=Oop [8]=Oop [16]=NarrowOop off=416/0x1a0}
1a8     stop	# ShouldNotReachHere

1bc     B16: #	out( N1 ) <- in( B6 )  Freq: 9.99976e-07
1bc     movl    RSI, #-52	# int
1c1     movq    R10, [rsp + #8]	# spill
1c6     movq    [rsp + #0], R10	# spill
1ca     movq    [rsp + #24], RAX	# spill
        nop 	# 1 bytes pad for loops and calls
1d0     call,static  wrapper for: uncommon_trap(reason='intrinsic_or_type_checked_inlining' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 385) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#null
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2941) L[0]=#Ptr0x00007f5494168fe0 L[1]=rsp + #24 L[2]=_ L[3]=_
        # mul::workload @ bci:21 (line 13) L[0]=rsp + #24 L[1]=rsp + #0 L[2]=#ScObj0 L[3]=_ L[4]=_
        # ScObj0 jdk/incubator/vector/Int256Vector$Int256Mask={ [payload :0]=rsp + #16 }
        # OopMap {[0]=Oop [24]=Oop off=472/0x1d8}
1e0     stop	# ShouldNotReachHere

1f4     B17: #	out( N1 ) <- in( B9 )  Freq: 9.99973e-07
1f4     movl    RSI, #-52	# int
1f9     vmovdqu [rsp + 32],XMM2	# spill
        nop 	# 1 bytes pad for loops and calls
200     call,static  wrapper for: uncommon_trap(reason='intrinsic_or_type_checked_inlining' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 385) L[0]=_ L[1]=_ STK[0]=#0 STK[1]=RBP STK[2]=#null
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 57) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:7 (line 3214) L[0]=#ScObj0 L[1]=rsp + #8 L[2]=_ L[3]=_
        # ScObj0 jdk/incubator/vector/Int256Vector={ [payload :0]=rsp + #32 }
        # mul::workload @ bci:47 (line 15) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # OopMap {[8]=Oop off=520/0x208}
210     stop	# ShouldNotReachHere

224     B18: #	out( N1 ) <- in( B4 )  Freq: 9.99997e-06
224     # exception oop is in rax; no code emitted
224     movq    RSI, RAX	# spill
227     vzeroupper
	addq    rsp, 80	# Destroy frame
	popq    rbp

22f     jmp     rethrow_stub

234     B19: #	out( N1 ) <- in( B1 )  Freq: 1.01328e-06
234     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
23c     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.VectorMask::fromArray @ bci:15 (line 207) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ STK[0]=_ STK[1]=_ STK[2]=#null
        # mul::workload @ bci:7 (line 11) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # OopMap {off=580/0x244}
24c     stop	# ShouldNotReachHere

260     B20: #	out( N1 ) <- in( B5 )  Freq: 1.01326e-06
260     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
268     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:8 (line 2941) L[0]=_ L[1]=_ L[2]=_ L[3]=_ STK[0]=_ STK[1]=_ STK[2]=#null
        # mul::workload @ bci:21 (line 13) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # OopMap {off=624/0x270}
278     stop	# ShouldNotReachHere

28c     B21: #	out( N1 ) <- in( B8 )  Freq: 1.01325e-06
28c     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
294     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::intoArray @ bci:6 (line 3214) L[0]=_ L[1]=_ L[2]=_ L[3]=_ STK[0]=_ STK[1]=_ STK[2]=#null
        # mul::workload @ bci:47 (line 15) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_
        # OopMap {off=668/0x29c}
2a4     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    1913  277             mul::workload (51 bytes)
 total in heap  [0x00007f5501204e90,0x00007f5501205910] = 2688
 relocation     [0x00007f5501205000,0x00007f55012050b8] = 184
 main code      [0x00007f55012050c0,0x00007f5501205398] = 728
 stub code      [0x00007f5501205398,0x00007f55012053c0] = 40
 oops           [0x00007f55012053c0,0x00007f55012053e0] = 32
 metadata       [0x00007f55012053e0,0x00007f55012054b0] = 208
 scopes data    [0x00007f55012054b0,0x00007f5501205678] = 456
 scopes pcs     [0x00007f5501205678,0x00007f55012058b8] = 576
 dependencies   [0x00007f55012058b8,0x00007f55012058d8] = 32
 handler table  [0x00007f55012058d8,0x00007f55012058f0] = 24
 nul chk table  [0x00007f55012058f0,0x00007f5501205910] = 32

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007f54bc6036e8} 'workload' '([I[I)V' in 'mul'
  # parm0:    rsi:rsi   = '[I'
  # parm1:    rdx:rdx   = '[I'
  #           [sp+0x60]  (sp of caller)
 ;; N1: #	out( B1 ) <- in( B19 B15 B12 B11 B14 B20 B16 B13 B17 B21 B18 )  Freq: 1
 ;; B1: #	out( B19 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f55012050c0:   mov    %eax,-0x18000(%rsp)
  0x00007f55012050c7:   push   %rbp
  0x00007f55012050c8:   sub    $0x50,%rsp
  0x00007f55012050cc:   cmpl   $0x1,0x20(%r15)
  0x00007f55012050d4:   jne    0x00007f550120538e           ;*synchronization entry
                                                            ; - mul::workload@-1 (line 11)
  0x00007f55012050da:   mov    %rsi,%r10
  0x00007f55012050dd:   mov    %rdx,0x8(%rsp)
  0x00007f55012050e2:   movabs $0x11f920010,%r11            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
                                                            ;   {oop(a 'java/lang/Class'{0x000000011f920010} = 'mul')}
  0x00007f55012050ec:   mov    0x74(%r11),%r11d             ;*getstatic mask_arr {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - mul::workload@3 (line 11)
  0x00007f55012050f0:   mov    0xc(%r12,%r11,8),%r9d        ; implicit exception: dispatches to 0x00007f55012052f4
 ;; B2: #	out( B15 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007f55012050f5:   lea    -0x7(%r9),%ebp
  0x00007f55012050f9:   test   %ebp,%ebp
  0x00007f55012050fb:   nop
  0x00007f55012050fc:   nop
  0x00007f55012050fd:   nop
  0x00007f55012050fe:   nop
  0x00007f55012050ff:   nop
  0x00007f5501205100:   jl     0x00007f5501205248
 ;; B3: #	out( B12 B4 ) <- in( B2 )  Freq: 0.999998
  0x00007f5501205106:   cmp    $0x7,%r9d
  0x00007f550120510a:   je     0x00007f55012051ae           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
 ;; B4: #	out( B18 B5 ) <- in( B3 )  Freq: 0.999997
  0x00007f5501205110:   vmovq  0x10(%r12,%r11,8),%xmm0      ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@47 (line 208)
                                                            ; - mul::workload@7 (line 11)
  0x00007f5501205117:   vmovq  %xmm0,0x10(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
  0x00007f550120511d:   nop
  0x00007f550120511e:   nop
  0x00007f550120511f:   nop
  0x00007f5501205120:   vzeroupper 
  0x00007f5501205123:   callq  0x00007f5501202fa0           ; ImmutableOopMap {[8]=Oop }
                                                            ;*invokestatic leaf {reexecute=0 rethrow=0 return_oop=1}
                                                            ; - mul::workload@12 (line 12)
                                                            ;   {static_call}
  0x00007f5501205128:   nopl   0x298(%rax,%rax,1)           ;   {other}
 ;; B5: #	out( B20 B6 ) <- in( B4 )  Freq: 0.999977
  0x00007f5501205130:   mov    0xc(%rax),%r11d              ; implicit exception: dispatches to 0x00007f5501205320
 ;; B6: #	out( B16 B7 ) <- in( B5 )  Freq: 0.999976
  0x00007f5501205134:   lea    -0x7(%r11),%ebp
  0x00007f5501205138:   test   %ebp,%ebp
  0x00007f550120513a:   nop
  0x00007f550120513b:   nop
  0x00007f550120513c:   nop
  0x00007f550120513d:   nop
  0x00007f550120513e:   nop
  0x00007f550120513f:   nop
  0x00007f5501205140:   jl     0x00007f550120527c
 ;; B7: #	out( B13 B8 ) <- in( B6 )  Freq: 0.999975
  0x00007f5501205146:   cmp    $0x7,%r11d
  0x00007f550120514a:   je     0x00007f55012051e0
 ;; B8: #	out( B21 B9 ) <- in( B7 )  Freq: 0.999974
  0x00007f5501205150:   mov    0x8(%rsp),%r10
  0x00007f5501205155:   mov    0xc(%r10),%r11d              ; implicit exception: dispatches to 0x00007f550120534c
                                                            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
 ;; B9: #	out( B17 B10 ) <- in( B8 )  Freq: 0.999973
  0x00007f5501205159:   vmovdqu 0x10(%rax),%ymm2            ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@32 (line 3430)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 880)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2943)
                                                            ; - mul::workload@21 (line 13)
  0x00007f550120515e:   lea    -0x7(%r11),%ebp
  0x00007f5501205162:   vmovq  0x10(%rsp),%xmm1             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
  0x00007f5501205168:   vpxor  %xmm0,%xmm0,%xmm0
  0x00007f550120516c:   vpsubb %xmm1,%xmm0,%xmm0
  0x00007f5501205170:   vpmovb2m %xmm0,%k7                  ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@47 (line 208)
                                                            ; - mul::workload@7 (line 11)
  0x00007f5501205176:   vpmulld %ymm2,%ymm2,%ymm2{%k7}      ;*invokestatic binaryOp {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@192 (line 834)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@9 (line 276)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@4 (line 41)
                                                            ; - mul::workload@42 (line 15)
  0x00007f550120517c:   nop
  0x00007f550120517d:   nop
  0x00007f550120517e:   nop
  0x00007f550120517f:   nop
  0x00007f5501205180:   test   %ebp,%ebp                    ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
  0x00007f5501205182:   jl     0x00007f55012052b4
 ;; B10: #	out( B14 B11 ) <- in( B9 )  Freq: 0.999972
  0x00007f5501205188:   cmp    $0x7,%r11d
  0x00007f550120518c:   je     0x00007f5501205218
 ;; B11: #	out( N1 ) <- in( B10 )  Freq: 0.999971
  0x00007f5501205192:   vmovdqu %ymm2,0x10(%r10)
  0x00007f5501205198:   vzeroupper 
  0x00007f550120519b:   add    $0x50,%rsp
  0x00007f550120519f:   pop    %rbp
  0x00007f55012051a0:   cmp    0x488(%r15),%rsp             ;   {poll_return}
  0x00007f55012051a7:   ja     0x00007f5501205378
  0x00007f55012051ad:   retq   
 ;; B12: #	out( N1 ) <- in( B3 )  Freq: 1.01328e-06
  0x00007f55012051ae:   mov    $0xffffffe4,%esi
  0x00007f55012051b3:   mov    %r10,(%rsp)
  0x00007f55012051b7:   mov    %r11d,0x10(%rsp)
  0x00007f55012051bc:   vzeroupper 
  0x00007f55012051bf:   callq  0x00007f5501120b20           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=NarrowOop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
                                                            ; - mul::workload@7 (line 11)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f55012051c4:   nopl   0x1000334(%rax,%rax,1)       ;   {other}
  0x00007f55012051cc:   movabs $0x7f550a095f50,%rdi         ;   {external_word}
  0x00007f55012051d6:   and    $0xfffffffffffffff0,%rsp
  0x00007f55012051da:   callq  0x00007f55096003f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f55012051df:   hlt    
 ;; B13: #	out( N1 ) <- in( B7 )  Freq: 1.01325e-06
  0x00007f55012051e0:   mov    $0xffffffe4,%esi
  0x00007f55012051e5:   mov    0x8(%rsp),%r10
  0x00007f55012051ea:   mov    %r10,(%rsp)
  0x00007f55012051ee:   mov    %rax,0x18(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
  0x00007f55012051f3:   nop
  0x00007f55012051f4:   vzeroupper 
  0x00007f55012051f7:   callq  0x00007f5501120b20           ; ImmutableOopMap {[0]=Oop [24]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2941)
                                                            ; - mul::workload@21 (line 13)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f55012051fc:   nopl   0x200036c(%rax,%rax,1)       ;   {other}
  0x00007f5501205204:   movabs $0x7f550a095f50,%rdi         ;   {external_word}
  0x00007f550120520e:   and    $0xfffffffffffffff0,%rsp
  0x00007f5501205212:   callq  0x00007f55096003f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f5501205217:   hlt    
 ;; B14: #	out( N1 ) <- in( B10 )  Freq: 1.01325e-06
  0x00007f5501205218:   mov    $0xffffffe4,%esi
  0x00007f550120521d:   vmovdqu %ymm2,0x20(%rsp)            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
  0x00007f5501205223:   nop
  0x00007f5501205224:   vzeroupper 
  0x00007f5501205227:   callq  0x00007f5501120b20           ; ImmutableOopMap {[8]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 3214)
                                                            ; - mul::workload@47 (line 15)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f550120522c:   nopl   0x300039c(%rax,%rax,1)       ;   {other}
  0x00007f5501205234:   movabs $0x7f550a095f50,%rdi         ;   {external_word}
  0x00007f550120523e:   and    $0xfffffffffffffff0,%rsp
  0x00007f5501205242:   callq  0x00007f55096003f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f5501205247:   hlt    
 ;; B15: #	out( N1 ) <- in( B2 )  Freq: 9.99999e-07
  0x00007f5501205248:   mov    $0xffffffcc,%esi
  0x00007f550120524d:   mov    %r10,(%rsp)
  0x00007f5501205251:   mov    %r11d,0x10(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
  0x00007f5501205256:   nop
  0x00007f5501205257:   nop
  0x00007f5501205258:   vzeroupper 
  0x00007f550120525b:   callq  0x00007f5501120b20           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=NarrowOop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
                                                            ; - mul::workload@7 (line 11)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f5501205260:   nopl   0x40003d0(%rax,%rax,1)       ;   {other}
  0x00007f5501205268:   movabs $0x7f550a095f50,%rdi         ;   {external_word}
  0x00007f5501205272:   and    $0xfffffffffffffff0,%rsp
  0x00007f5501205276:   callq  0x00007f55096003f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f550120527b:   hlt    
 ;; B16: #	out( N1 ) <- in( B6 )  Freq: 9.99976e-07
  0x00007f550120527c:   mov    $0xffffffcc,%esi
  0x00007f5501205281:   mov    0x8(%rsp),%r10
  0x00007f5501205286:   mov    %r10,(%rsp)
  0x00007f550120528a:   mov    %rax,0x18(%rsp)              ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
  0x00007f550120528f:   nop
  0x00007f5501205290:   vzeroupper 
  0x00007f5501205293:   callq  0x00007f5501120b20           ; ImmutableOopMap {[0]=Oop [24]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2941)
                                                            ; - mul::workload@21 (line 13)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f5501205298:   nopl   0x5000408(%rax,%rax,1)       ;   {other}
  0x00007f55012052a0:   movabs $0x7f550a095f50,%rdi         ;   {external_word}
  0x00007f55012052aa:   and    $0xfffffffffffffff0,%rsp
  0x00007f55012052ae:   callq  0x00007f55096003f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f55012052b3:   hlt    
 ;; B17: #	out( N1 ) <- in( B9 )  Freq: 9.99973e-07
  0x00007f55012052b4:   mov    $0xffffffcc,%esi
  0x00007f55012052b9:   vmovdqu %ymm2,0x20(%rsp)            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
  0x00007f55012052bf:   nop
  0x00007f55012052c0:   vzeroupper 
  0x00007f55012052c3:   callq  0x00007f5501120b20           ; ImmutableOopMap {[8]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 3214)
                                                            ; - mul::workload@47 (line 15)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f55012052c8:   nopl   0x6000438(%rax,%rax,1)       ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
                                                            ;   {other}
  0x00007f55012052d0:   movabs $0x7f550a095f50,%rdi         ;   {external_word}
  0x00007f55012052da:   and    $0xfffffffffffffff0,%rsp
  0x00007f55012052de:   callq  0x00007f55096003f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f55012052e3:   hlt                                 ;*invokestatic leaf {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - mul::workload@12 (line 12)
 ;; B18: #	out( N1 ) <- in( B4 )  Freq: 9.99997e-06
  0x00007f55012052e4:   mov    %rax,%rsi
  0x00007f55012052e7:   vzeroupper 
  0x00007f55012052ea:   add    $0x50,%rsp
  0x00007f55012052ee:   pop    %rbp
  0x00007f55012052ef:   jmpq   0x00007f550114c8a0           ;   {runtime_call _rethrow_Java}
 ;; B19: #	out( N1 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007f55012052f4:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
  0x00007f55012052f9:   nop
  0x00007f55012052fa:   nop
  0x00007f55012052fb:   nop
  0x00007f55012052fc:   vzeroupper 
  0x00007f55012052ff:   callq  0x00007f5501120b20           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.VectorMask::fromArray@15 (line 207)
                                                            ; - mul::workload@7 (line 11)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f5501205304:   nopl   0x7000474(%rax,%rax,1)       ;   {other}
  0x00007f550120530c:   movabs $0x7f550a095f50,%rdi         ;   {external_word}
  0x00007f5501205316:   and    $0xfffffffffffffff0,%rsp
  0x00007f550120531a:   callq  0x00007f55096003f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f550120531f:   hlt    
 ;; B20: #	out( N1 ) <- in( B5 )  Freq: 1.01326e-06
  0x00007f5501205320:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
  0x00007f5501205325:   nop
  0x00007f5501205326:   nop
  0x00007f5501205327:   nop
  0x00007f5501205328:   vzeroupper 
  0x00007f550120532b:   callq  0x00007f5501120b20           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@8 (line 2941)
                                                            ; - mul::workload@21 (line 13)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f5501205330:   nopl   0x80004a0(%rax,%rax,1)       ;   {other}
  0x00007f5501205338:   movabs $0x7f550a095f50,%rdi         ;   {external_word}
  0x00007f5501205342:   and    $0xfffffffffffffff0,%rsp
  0x00007f5501205346:   callq  0x00007f55096003f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f550120534b:   hlt    
 ;; B21: #	out( N1 ) <- in( B8 )  Freq: 1.01325e-06
  0x00007f550120534c:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
  0x00007f5501205351:   nop
  0x00007f5501205352:   nop
  0x00007f5501205353:   nop
  0x00007f5501205354:   vzeroupper 
  0x00007f5501205357:   callq  0x00007f5501120b20           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@6 (line 3214)
                                                            ; - mul::workload@47 (line 15)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f550120535c:   nopl   0x90004cc(%rax,%rax,1)       ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
                                                            ; - mul::workload@47 (line 15)
                                                            ;   {other}
  0x00007f5501205364:   movabs $0x7f550a095f50,%rdi         ;   {external_word}
  0x00007f550120536e:   and    $0xfffffffffffffff0,%rsp
  0x00007f5501205372:   callq  0x00007f55096003f2           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f5501205377:   hlt                                 ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@6 (line 3214)
                                                            ; - mul::workload@47 (line 15)
  0x00007f5501205378:   movabs $0x7f55012051a0,%r10         ;   {internal_word}
  0x00007f5501205382:   mov    %r10,0x4a0(%r15)
  0x00007f5501205389:   jmpq   0x00007f550111f9a0           ;   {runtime_call SafepointBlob}
  0x00007f550120538e:   callq  Stub::nmethod_entry_barrier  ;   {runtime_call StubRoutines (final stubs)}
  0x00007f5501205393:   jmpq   0x00007f55012050da
[Stub Code]
  0x00007f5501205398:   movabs $0x0,%rbx                    ;   {no_reloc}
  0x00007f55012053a2:   jmpq   0x00007f55012053a2           ;   {runtime_call}
[Exception Handler]
  0x00007f55012053a7:   jmpq   0x00007f5501028a20           ;   {runtime_call ExceptionBlob}
[Deopt Handler Code]
  0x00007f55012053ac:   callq  0x00007f55012053b1
  0x00007f55012053b1:   subq   $0x5,(%rsp)
  0x00007f55012053b6:   jmpq   0x00007f5501120e60           ;   {runtime_call DeoptimizationBlob}
  0x00007f55012053bb:   hlt    
  0x00007f55012053bc:   hlt    
  0x00007f55012053bd:   hlt    
  0x00007f55012053be:   hlt    
  0x00007f55012053bf:   hlt    
--------------------------------------------------------------------------------
[/Disassembly]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007f55012053c0:   0x000000011f947240 a 'java/lang/Class'{0x000000011f947240} = 'jdk/incubator/vector/Int256Vector$Int256Mask'
  0x00007f55012053c8:   0x000000011f947160 a 'jdk/incubator/vector/IntVector$IntSpecies'{0x000000011f947160}
  0x00007f55012053d0:   0x000000011f9471b0 a 'java/lang/Class'{0x000000011f9471b0} = 'jdk/incubator/vector/Int256Vector'
  0x00007f55012053d8:   0x000000011f81dad0 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000011f81dad0}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007f55012053e0:   0x00007f54bc6036e8 {method} {0x00007f54bc6036e8} 'workload' '([I[I)V' in 'mul'
  0x00007f55012053e8:   0x00007f54bc789bd0 {method} {0x00007f54bc789bd0} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
  0x00007f55012053f0:   0x00007f54bc6817d8 {method} {0x00007f54bc6817d8} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[ZI)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
  0x00007f55012053f8:   0x00007f54bc7893a0 {method} {0x00007f54bc7893a0} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007f5501205400:   0x00007f54bc6a2200 {method} {0x00007f54bc6a2200} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007f5501205408:   0x00007f54bc78a4a8 {method} {0x00007f54bc78a4a8} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007f5501205410:   0x00007f54bc6a40f8 {method} {0x00007f54bc6a40f8} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007f5501205418:   0x00007f54bc69ff88 {method} {0x00007f54bc69ff88} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007f5501205420:   0x00007f54bc781c98 {method} {0x00007f54bc781c98} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljava/lang/Class;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007f5501205428:   0x00007f54bc6d3370 {method} {0x00007f54bc6d3370} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007f5501205430:   0x00007f54bc1a1258 {method} {0x00007f54bc1a1258} 'checkIndex' '(II)I' in 'java/util/Objects'
  0x00007f5501205438:   0x00000008000d9fa8 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007f5501205440:   0x00007f54bc7e2f80 {method} {0x00007f54bc7e2f80} 'length' '()I' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007f5501205448:   0x00000008000d97a0 'jdk/incubator/vector/VectorSpecies'
  0x00007f5501205450:   0x00007f54bc7e1408 {method} {0x00007f54bc7e1408} 'length' '()I' in 'jdk/incubator/vector/VectorSpecies'
  0x00007f5501205458:   0x00000008000de730 'jdk/incubator/vector/Int256Vector$Int256Mask'
  0x00007f5501205460:   0x00007f54bc7feab0 {method} {0x00007f54bc7feab0} 'check' '(Ljava/lang/Class;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/AbstractMask'
  0x00007f5501205468:   0x00000008000dbed0 'jdk/incubator/vector/VectorMask'
  0x00007f5501205470:   0x00007f54bc6827e0 {method} {0x00007f54bc6827e0} 'check' '(Ljava/lang/Class;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
  0x00007f5501205478:   0x00000008000e7938 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
  0x00007f5501205480:   0x00007f54bc63da08 {method} {0x00007f54bc63da08} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007f5501205488:   0x00000008000e7120 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007f5501205490:   0x00007f54bc63d540 {method} {0x00007f54bc63d540} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007f5501205498:   0x00007f54bc63d630 {method} {0x00007f54bc63d630} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007f55012054a0:   0x00007f54bc7d6bc0 {method} {0x00007f54bc7d6bc0} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
  0x00007f55012054a8:   0x00000008000d8d58 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007f55012050bf offset=ffffffff bits=0):
PcDesc(pc=0x00007f55012050da offset=1a bits=0):
   mul::workload@-1 (line 11)
PcDesc(pc=0x00007f55012050ec offset=2c bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f55012050f0 offset=30 bits=0):
   mul::workload@3 (line 11)
PcDesc(pc=0x00007f5501205110 offset=50 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f5501205117 offset=57 bits=0):
   jdk.incubator.vector.VectorMask::fromArray@47 (line 208)
   mul::workload@7 (line 11)
PcDesc(pc=0x00007f550120511d offset=5d bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f5501205128 offset=68 bits=4):
   mul::workload@12 (line 12)
   Locals
    - l0: empty
    - l1: stack[8],oop
    - l2: obj[75]
    - l3: empty
    - l4: empty
   Objects
    - 75: jdk.incubator.vector.Int256Vector$Int256Mask stack[16],vector
PcDesc(pc=0x00007f5501205159 offset=99 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f550120515e offset=9e bits=0):
   jdk.incubator.vector.IntVector::fromArray0Template@32 (line 3430)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 880)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2943)
   mul::workload@21 (line 13)
PcDesc(pc=0x00007f5501205168 offset=a8 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f5501205176 offset=b6 bits=0):
   jdk.incubator.vector.VectorMask::fromArray@47 (line 208)
   mul::workload@7 (line 11)
PcDesc(pc=0x00007f550120517c offset=bc bits=0):
   jdk.incubator.vector.IntVector::lanewiseTemplate@192 (line 834)
   jdk.incubator.vector.Int256Vector::lanewise@9 (line 276)
   jdk.incubator.vector.Int256Vector::lanewise@4 (line 41)
   mul::workload@42 (line 15)
PcDesc(pc=0x00007f5501205182 offset=c2 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f55012051c4 offset=104 bits=0):
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
    - l1: stack[16],narrowoop
    - l2: empty
    - l3: a 'jdk/incubator/vector/IntVector$IntSpecies'{0x000000011f947160}
    - l4: 8
   mul::workload@7 (line 11)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007f55012051f3 offset=133 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f55012051fc offset=13c bits=0):
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
    - l0: a 'jdk/incubator/vector/IntVector$IntSpecies'{0x000000011f947160}
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
   mul::workload@21 (line 13)
   Locals
    - l0: stack[24],oop
    - l1: stack[0],oop
    - l2: obj[127]
    - l3: empty
    - l4: empty
   Objects
    - 127: jdk.incubator.vector.Int256Vector$Int256Mask stack[16],vector
PcDesc(pc=0x00007f5501205223 offset=163 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f550120522c offset=16c bits=0):
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
    - l0: obj[100]
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
   mul::workload@47 (line 15)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Objects
    - 100: jdk.incubator.vector.Int256Vector stack[32],vector
PcDesc(pc=0x00007f5501205256 offset=196 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f5501205260 offset=1a0 bits=0):
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
    - l1: stack[16],narrowoop
    - l2: empty
    - l3: a 'jdk/incubator/vector/IntVector$IntSpecies'{0x000000011f947160}
    - l4: 8
   mul::workload@7 (line 11)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007f550120528f offset=1cf bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f5501205298 offset=1d8 bits=0):
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
    - l0: a 'jdk/incubator/vector/IntVector$IntSpecies'{0x000000011f947160}
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
   mul::workload@21 (line 13)
   Locals
    - l0: stack[24],oop
    - l1: stack[0],oop
    - l2: obj[117]
    - l3: empty
    - l4: empty
   Objects
    - 117: jdk.incubator.vector.Int256Vector$Int256Mask stack[16],vector
PcDesc(pc=0x00007f55012052bf offset=1ff bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f55012052c8 offset=208 bits=0):
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
    - l0: obj[136]
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
   mul::workload@47 (line 15)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Objects
    - 136: jdk.incubator.vector.Int256Vector stack[32],vector
PcDesc(pc=0x00007f55012052d0 offset=210 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f55012052e4 offset=224 bits=0):
   mul::workload@12 (line 12)
PcDesc(pc=0x00007f55012052f9 offset=239 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f5501205304 offset=244 bits=0):
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
   mul::workload@7 (line 11)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007f5501205325 offset=265 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f5501205330 offset=270 bits=0):
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
   mul::workload@21 (line 13)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007f5501205351 offset=291 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f550120535c offset=29c bits=0):
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
   mul::workload@47 (line 15)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
PcDesc(pc=0x00007f5501205364 offset=2a4 bits=0):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f5501205378 offset=2b8 bits=0):
   jdk.incubator.vector.IntVector::intoArray@6 (line 3214)
   mul::workload@47 (line 15)
PcDesc(pc=0x00007f55012053c1 offset=301 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 10 OopMaps

ImmutableOopMap {[8]=Oop } pc offsets: 104 
ImmutableOopMap {[0]=Oop [8]=Oop [16]=NarrowOop } pc offsets: 260 
ImmutableOopMap {[0]=Oop [24]=Oop } pc offsets: 316 
ImmutableOopMap {[8]=Oop } pc offsets: 364 
ImmutableOopMap {[0]=Oop [8]=Oop [16]=NarrowOop } pc offsets: 416 
ImmutableOopMap {[0]=Oop [24]=Oop } pc offsets: 472 
ImmutableOopMap {[8]=Oop } pc offsets: 520 
ImmutableOopMap {} pc offsets: 580 624 668 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007f55012050da offset=1a):
   mul::workload@-1 (line 11)
ScopeDesc(pc=0x00007f55012050ec offset=2c):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f55012050ec offset=2c):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f55012050f0 offset=30):
   mul::workload@3 (line 11)
ScopeDesc(pc=0x00007f5501205110 offset=50):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f5501205110 offset=50):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f5501205117 offset=57):
   jdk.incubator.vector.VectorMask::fromArray@47 (line 208)
ScopeDesc(pc=0x00007f5501205117 offset=57):
   mul::workload@7 (line 11)
ScopeDesc(pc=0x00007f550120511d offset=5d):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f550120511d offset=5d):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f5501205128 offset=68):
   mul::workload@12 (line 12)
   Locals
    - l0: empty
    - l1: stack[8],oop
    - l2: obj[75]
    - l3: empty
    - l4: empty
   Objects
    - 75: jdk.incubator.vector.Int256Vector$Int256Mask stack[16],vector
ScopeDesc(pc=0x00007f5501205159 offset=99):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f5501205159 offset=99):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f550120515e offset=9e):
   jdk.incubator.vector.IntVector::fromArray0Template@32 (line 3430)
ScopeDesc(pc=0x00007f550120515e offset=9e):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 880)
ScopeDesc(pc=0x00007f550120515e offset=9e):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2943)
ScopeDesc(pc=0x00007f550120515e offset=9e):
   mul::workload@21 (line 13)
ScopeDesc(pc=0x00007f5501205168 offset=a8):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f5501205168 offset=a8):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f5501205176 offset=b6):
   jdk.incubator.vector.VectorMask::fromArray@47 (line 208)
ScopeDesc(pc=0x00007f5501205176 offset=b6):
   mul::workload@7 (line 11)
ScopeDesc(pc=0x00007f550120517c offset=bc):
   jdk.incubator.vector.IntVector::lanewiseTemplate@192 (line 834)
ScopeDesc(pc=0x00007f550120517c offset=bc):
   jdk.incubator.vector.Int256Vector::lanewise@9 (line 276)
ScopeDesc(pc=0x00007f550120517c offset=bc):
   jdk.incubator.vector.Int256Vector::lanewise@4 (line 41)
ScopeDesc(pc=0x00007f550120517c offset=bc):
   mul::workload@42 (line 15)
ScopeDesc(pc=0x00007f5501205182 offset=c2):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f5501205182 offset=c2):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f55012051c4 offset=104):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
ScopeDesc(pc=0x00007f55012051c4 offset=104):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007f55012051c4 offset=104):
   jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
   Locals
    - l0: empty
    - l1: stack[16],narrowoop
    - l2: empty
    - l3: a 'jdk/incubator/vector/IntVector$IntSpecies'{0x000000011f947160}
    - l4: 8
ScopeDesc(pc=0x00007f55012051c4 offset=104):
   mul::workload@7 (line 11)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007f55012051f3 offset=133):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f55012051f3 offset=133):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f55012051fc offset=13c):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
ScopeDesc(pc=0x00007f55012051fc offset=13c):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007f55012051fc offset=13c):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2941)
   Locals
    - l0: a 'jdk/incubator/vector/IntVector$IntSpecies'{0x000000011f947160}
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007f55012051fc offset=13c):
   mul::workload@21 (line 13)
   Locals
    - l0: stack[24],oop
    - l1: stack[0],oop
    - l2: obj[127]
    - l3: empty
    - l4: empty
   Objects
    - 127: jdk.incubator.vector.Int256Vector$Int256Mask stack[16],vector
ScopeDesc(pc=0x00007f5501205223 offset=163):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f5501205223 offset=163):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f550120522c offset=16c):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
ScopeDesc(pc=0x00007f550120522c offset=16c):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007f550120522c offset=16c):
   jdk.incubator.vector.IntVector::intoArray@7 (line 3214)
   Locals
    - l0: obj[100]
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007f550120522c offset=16c):
   mul::workload@47 (line 15)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Objects
    - 100: jdk.incubator.vector.Int256Vector stack[32],vector
ScopeDesc(pc=0x00007f5501205256 offset=196):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f5501205256 offset=196):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f5501205260 offset=1a0):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
ScopeDesc(pc=0x00007f5501205260 offset=1a0):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007f5501205260 offset=1a0):
   jdk.incubator.vector.VectorMask::fromArray@16 (line 207)
   Locals
    - l0: empty
    - l1: stack[16],narrowoop
    - l2: empty
    - l3: a 'jdk/incubator/vector/IntVector$IntSpecies'{0x000000011f947160}
    - l4: 8
ScopeDesc(pc=0x00007f5501205260 offset=1a0):
   mul::workload@7 (line 11)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007f550120528f offset=1cf):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f550120528f offset=1cf):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f5501205298 offset=1d8):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
ScopeDesc(pc=0x00007f5501205298 offset=1d8):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007f5501205298 offset=1d8):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2941)
   Locals
    - l0: a 'jdk/incubator/vector/IntVector$IntSpecies'{0x000000011f947160}
    - l1: stack[24],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007f5501205298 offset=1d8):
   mul::workload@21 (line 13)
   Locals
    - l0: stack[24],oop
    - l1: stack[0],oop
    - l2: obj[117]
    - l3: empty
    - l4: empty
   Objects
    - 117: jdk.incubator.vector.Int256Vector$Int256Mask stack[16],vector
ScopeDesc(pc=0x00007f55012052bf offset=1ff):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f55012052bf offset=1ff):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f55012052c8 offset=208):
   java.util.Objects::checkIndex@3 (line 385)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
    - @2: nullptr
ScopeDesc(pc=0x00007f55012052c8 offset=208):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007f55012052c8 offset=208):
   jdk.incubator.vector.IntVector::intoArray@7 (line 3214)
   Locals
    - l0: obj[136]
    - l1: stack[8],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007f55012052c8 offset=208):
   mul::workload@47 (line 15)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Objects
    - 136: jdk.incubator.vector.Int256Vector stack[32],vector
ScopeDesc(pc=0x00007f55012052d0 offset=210):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f55012052d0 offset=210):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f55012052e4 offset=224):
   mul::workload@12 (line 12)
ScopeDesc(pc=0x00007f55012052f9 offset=239):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f55012052f9 offset=239):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f5501205304 offset=244):
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
ScopeDesc(pc=0x00007f5501205304 offset=244):
   mul::workload@7 (line 11)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007f5501205325 offset=265):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f5501205325 offset=265):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f5501205330 offset=270):
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
ScopeDesc(pc=0x00007f5501205330 offset=270):
   mul::workload@21 (line 13)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007f5501205351 offset=291):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f5501205351 offset=291):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f550120535c offset=29c):
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
ScopeDesc(pc=0x00007f550120535c offset=29c):
   mul::workload@47 (line 15)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
ScopeDesc(pc=0x00007f5501205364 offset=2a4):
   jdk.incubator.vector.IntVector::intoArray@43 (line 3216)
ScopeDesc(pc=0x00007f5501205364 offset=2a4):
   mul::workload@47 (line 15)
ScopeDesc(pc=0x00007f5501205378 offset=2b8):
   jdk.incubator.vector.IntVector::intoArray@6 (line 3214)
ScopeDesc(pc=0x00007f5501205378 offset=2b8):
   mul::workload@47 (line 15)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007f5501205000: 0822
relocInfo@0x00007f5501205000 [type=1(oop) addr=0x00007f55012050e2 offset=34] | [oop_addr=0x00007f55012050e4 *=0x000000011f920010 offset=0]
         @0x00007f5501205002: 2141
relocInfo@0x00007f5501205002 [type=4(static_call) addr=0x00007f5501205123 offset=65 format=1] | [destination=0x00007f5501202fa0 metadata=0x0000000000000000]
         @0x00007f5501205004: 8005
relocInfo@0x00007f5501205004 [type=16(post_call_nop) addr=0x00007f5501205128 offset=5]
         @0x00007f5501205006: 5878
relocInfo@0x00007f5501205006 [type=11(poll_return) addr=0x00007f55012051a0 offset=120]
         @0x00007f5501205008: 311f
relocInfo@0x00007f5501205008 [type=6(runtime_call) addr=0x00007f55012051bf offset=31 format=1] | [destination=0x00007f5501120b20]
         @0x00007f550120500a: 8005
relocInfo@0x00007f550120500a [type=16(post_call_nop) addr=0x00007f55012051c4 offset=5]
         @0x00007f550120500c: 7c030a095f507f553808
relocInfo@0x00007f5501205014 [type=7(external_word) addr=0x00007f55012051cc offset=8 data={0a095f507f55}] | [target=0x00007f550a095f50]
         @0x00007f5501205016: 310e
relocInfo@0x00007f5501205016 [type=6(runtime_call) addr=0x00007f55012051da offset=14 format=1] | [destination=0x00007f55096003f2]
         @0x00007f5501205018: 311d
relocInfo@0x00007f5501205018 [type=6(runtime_call) addr=0x00007f55012051f7 offset=29 format=1] | [destination=0x00007f5501120b20]
         @0x00007f550120501a: 8005
relocInfo@0x00007f550120501a [type=16(post_call_nop) addr=0x00007f55012051fc offset=5]
         @0x00007f550120501c: 7c030a095f507f553808
relocInfo@0x00007f5501205024 [type=7(external_word) addr=0x00007f5501205204 offset=8 data={0a095f507f55}] | [target=0x00007f550a095f50]
         @0x00007f5501205026: 310e
relocInfo@0x00007f5501205026 [type=6(runtime_call) addr=0x00007f5501205212 offset=14 format=1] | [destination=0x00007f55096003f2]
         @0x00007f5501205028: 3115
relocInfo@0x00007f5501205028 [type=6(runtime_call) addr=0x00007f5501205227 offset=21 format=1] | [destination=0x00007f5501120b20]
         @0x00007f550120502a: 8005
relocInfo@0x00007f550120502a [type=16(post_call_nop) addr=0x00007f550120522c offset=5]
         @0x00007f550120502c: 7c030a095f507f553808
relocInfo@0x00007f5501205034 [type=7(external_word) addr=0x00007f5501205234 offset=8 data={0a095f507f55}] | [target=0x00007f550a095f50]
         @0x00007f5501205036: 310e
relocInfo@0x00007f5501205036 [type=6(runtime_call) addr=0x00007f5501205242 offset=14 format=1] | [destination=0x00007f55096003f2]
         @0x00007f5501205038: 3119
relocInfo@0x00007f5501205038 [type=6(runtime_call) addr=0x00007f550120525b offset=25 format=1] | [destination=0x00007f5501120b20]
         @0x00007f550120503a: 8005
relocInfo@0x00007f550120503a [type=16(post_call_nop) addr=0x00007f5501205260 offset=5]
         @0x00007f550120503c: 7c030a095f507f553808
relocInfo@0x00007f5501205044 [type=7(external_word) addr=0x00007f5501205268 offset=8 data={0a095f507f55}] | [target=0x00007f550a095f50]
         @0x00007f5501205046: 310e
relocInfo@0x00007f5501205046 [type=6(runtime_call) addr=0x00007f5501205276 offset=14 format=1] | [destination=0x00007f55096003f2]
         @0x00007f5501205048: 311d
relocInfo@0x00007f5501205048 [type=6(runtime_call) addr=0x00007f5501205293 offset=29 format=1] | [destination=0x00007f5501120b20]
         @0x00007f550120504a: 8005
relocInfo@0x00007f550120504a [type=16(post_call_nop) addr=0x00007f5501205298 offset=5]
         @0x00007f550120504c: 7c030a095f507f553808
relocInfo@0x00007f5501205054 [type=7(external_word) addr=0x00007f55012052a0 offset=8 data={0a095f507f55}] | [target=0x00007f550a095f50]
         @0x00007f5501205056: 310e
relocInfo@0x00007f5501205056 [type=6(runtime_call) addr=0x00007f55012052ae offset=14 format=1] | [destination=0x00007f55096003f2]
         @0x00007f5501205058: 3115
relocInfo@0x00007f5501205058 [type=6(runtime_call) addr=0x00007f55012052c3 offset=21 format=1] | [destination=0x00007f5501120b20]
         @0x00007f550120505a: 8005
relocInfo@0x00007f550120505a [type=16(post_call_nop) addr=0x00007f55012052c8 offset=5]
         @0x00007f550120505c: 7c030a095f507f553808
relocInfo@0x00007f5501205064 [type=7(external_word) addr=0x00007f55012052d0 offset=8 data={0a095f507f55}] | [target=0x00007f550a095f50]
         @0x00007f5501205066: 310e
relocInfo@0x00007f5501205066 [type=6(runtime_call) addr=0x00007f55012052de offset=14 format=1] | [destination=0x00007f55096003f2]
         @0x00007f5501205068: 3111
relocInfo@0x00007f5501205068 [type=6(runtime_call) addr=0x00007f55012052ef offset=17 format=1] | [destination=0x00007f550114c8a0]
         @0x00007f550120506a: 3110
relocInfo@0x00007f550120506a [type=6(runtime_call) addr=0x00007f55012052ff offset=16 format=1] | [destination=0x00007f5501120b20]
         @0x00007f550120506c: 8005
relocInfo@0x00007f550120506c [type=16(post_call_nop) addr=0x00007f5501205304 offset=5]
         @0x00007f550120506e: 7c030a095f507f553808
relocInfo@0x00007f5501205076 [type=7(external_word) addr=0x00007f550120530c offset=8 data={0a095f507f55}] | [target=0x00007f550a095f50]
         @0x00007f5501205078: 310e
relocInfo@0x00007f5501205078 [type=6(runtime_call) addr=0x00007f550120531a offset=14 format=1] | [destination=0x00007f55096003f2]
         @0x00007f550120507a: 3111
relocInfo@0x00007f550120507a [type=6(runtime_call) addr=0x00007f550120532b offset=17 format=1] | [destination=0x00007f5501120b20]
         @0x00007f550120507c: 8005
relocInfo@0x00007f550120507c [type=16(post_call_nop) addr=0x00007f5501205330 offset=5]
         @0x00007f550120507e: 7c030a095f507f553808
relocInfo@0x00007f5501205086 [type=7(external_word) addr=0x00007f5501205338 offset=8 data={0a095f507f55}] | [target=0x00007f550a095f50]
         @0x00007f5501205088: 310e
relocInfo@0x00007f5501205088 [type=6(runtime_call) addr=0x00007f5501205346 offset=14 format=1] | [destination=0x00007f55096003f2]
         @0x00007f550120508a: 3111
relocInfo@0x00007f550120508a [type=6(runtime_call) addr=0x00007f5501205357 offset=17 format=1] | [destination=0x00007f5501120b20]
         @0x00007f550120508c: 8005
relocInfo@0x00007f550120508c [type=16(post_call_nop) addr=0x00007f550120535c offset=5]
         @0x00007f550120508e: 7c030a095f507f553808
relocInfo@0x00007f5501205096 [type=7(external_word) addr=0x00007f5501205364 offset=8 data={0a095f507f55}] | [target=0x00007f550a095f50]
         @0x00007f5501205098: 310e
relocInfo@0x00007f5501205098 [type=6(runtime_call) addr=0x00007f5501205372 offset=14 format=1] | [destination=0x00007f55096003f2]
         @0x00007f550120509a: 79d84006
relocInfo@0x00007f550120509c [type=8(internal_word) addr=0x00007f5501205378 offset=6 data=472] | [target=0x00007f55012051a0]
         @0x00007f550120509e: 3111
relocInfo@0x00007f550120509e [type=6(runtime_call) addr=0x00007f5501205389 offset=17 format=1] | [destination=0x00007f550111f9a0]
         @0x00007f55012050a0: 3105
relocInfo@0x00007f55012050a0 [type=6(runtime_call) addr=0x00007f550120538e offset=5 format=1] | [destination=0x00007f5501065e80]
         @0x00007f55012050a2: 000a
relocInfo@0x00007f55012050a2 [type=0(none) addr=0x00007f5501205398 offset=10]
         @0x00007f55012050a4: 7c01ff9d2800
relocInfo@0x00007f55012050a8 [type=5(static_stub) addr=0x00007f5501205398 offset=0 data=-99] | [static_call=0x00007f5501205123]
         @0x00007f55012050aa: 6000
relocInfo@0x00007f55012050aa [type=12(metadata) addr=0x00007f5501205398 offset=0] | [metadata_addr=0x00007f550120539a *=0x0000000000000000 offset=0]
         @0x00007f55012050ac: 310a
relocInfo@0x00007f55012050ac [type=6(runtime_call) addr=0x00007f55012053a2 offset=10 format=1] | [destination=0xffffffffffffffff]
         @0x00007f55012050ae: 3105
relocInfo@0x00007f55012050ae [type=6(runtime_call) addr=0x00007f55012053a7 offset=5 format=1] | [destination=0x00007f5501028a20]
         @0x00007f55012050b0: 310f
relocInfo@0x00007f55012050b0 [type=6(runtime_call) addr=0x00007f55012053b6 offset=15 format=1] | [destination=0x00007f5501120e60]
         @0x00007f55012050b2: 0000
relocInfo@0x00007f55012050b2 [type=0(none) addr=0x00007f55012053b6 offset=0]
         @0x00007f55012050b4: 0000
relocInfo@0x00007f55012050b4 [type=0(none) addr=0x00007f55012053b6 offset=0]
         @0x00007f55012050b6: 0000
relocInfo@0x00007f55012050b6 [type=0(none) addr=0x00007f55012053b6 offset=0]
         @0x00007f55012050b8: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.IntVector$IntSpecies
  method  = {method} {0x00007f54bc7e2f80} 'length' '()I' in 'jdk/incubator/vector/AbstractSpecies'
  class   = jdk.incubator.vector.VectorSpecies
  method  = *{method} {0x00007f54bc7e1408} 'length' '()I' in 'jdk/incubator/vector/VectorSpecies'
   [nmethod<=klass]jdk.incubator.vector.IntVector$IntSpecies
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.Int256Vector$Int256Mask
  method  = {method} {0x00007f54bc7feab0} 'check' '(Ljava/lang/Class;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/AbstractMask'
  class   = jdk.incubator.vector.VectorMask
  method  = *{method} {0x00007f54bc6827e0} 'check' '(Ljava/lang/Class;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
   [nmethod<=klass]jdk.incubator.vector.Int256Vector$Int256Mask
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007f54bc63da08} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  class   = jdk.incubator.vector.VectorOperators$OperatorImpl
  method  = {method} {0x00007f54bc63da08} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007f54bc63d540} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  class   = jdk.incubator.vector.VectorOperators$OperatorImpl
  method  = {method} {0x00007f54bc63d540} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007f54bc63d630} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  class   = jdk.incubator.vector.VectorOperators$OperatorImpl
  method  = {method} {0x00007f54bc63d630} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method_4
  context = jdk.incubator.vector.VectorOperators$ImplCache
  method  = {method} {0x00007f54bc7d6bc0} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
  class   = jdk.incubator.vector.VectorOperators$ImplCache
  method  = {method} {0x00007f54bc7d6bc0} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$ImplCache
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 24 bytes)
catch_pco = 104 (pc=0x00007f5501205128, 1 entries)
  bci -1 at scope depth 0 -> pco 548 (pc=0x00007f55012052e4)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 3 entries, 28 bytes):
{
   < 0x00007f55012050f0, 0x00007f55012052f4 > < 0x00007f5501205130, 0x00007f5501205320 > < 0x00007f5501205155, 0x00007f550120534c > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 nullptr-oop
#1: 0x000000011f947240 a 'java/lang/Class'{0x000000011f947240} = 'jdk/incubator/vector/Int256Vector$Int256Mask'
#2: 0x000000011f947160 a 'jdk/incubator/vector/IntVector$IntSpecies'{0x000000011f947160}
#3: 0x000000011f9471b0 a 'java/lang/Class'{0x000000011f9471b0} = 'jdk/incubator/vector/Int256Vector'
#4: 0x000000011f81dad0 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000011f81dad0}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
# 0: 0x0000000000000000 nullptr-oop
# 1: 0x00007f54bc6036e8 {method} {0x00007f54bc6036e8} 'workload' '([I[I)V' in 'mul'
# 2: 0x00007f54bc789bd0 {method} {0x00007f54bc789bd0} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
# 3: 0x00007f54bc6817d8 {method} {0x00007f54bc6817d8} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[ZI)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
# 4: 0x00007f54bc7893a0 {method} {0x00007f54bc7893a0} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
# 5: 0x00007f54bc6a2200 {method} {0x00007f54bc6a2200} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
# 6: 0x00007f54bc78a4a8 {method} {0x00007f54bc78a4a8} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
# 7: 0x00007f54bc6a40f8 {method} {0x00007f54bc6a40f8} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
# 8: 0x00007f54bc69ff88 {method} {0x00007f54bc69ff88} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
# 9: 0x00007f54bc781c98 {method} {0x00007f54bc781c98} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljava/lang/Class;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#10: 0x00007f54bc6d3370 {method} {0x00007f54bc6d3370} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
#11: 0x00007f54bc1a1258 {method} {0x00007f54bc1a1258} 'checkIndex' '(II)I' in 'java/util/Objects'
#12: 0x00000008000d9fa8 'jdk/incubator/vector/IntVector$IntSpecies'
#13: 0x00007f54bc7e2f80 {method} {0x00007f54bc7e2f80} 'length' '()I' in 'jdk/incubator/vector/AbstractSpecies'
#14: 0x00000008000d97a0 'jdk/incubator/vector/VectorSpecies'
#15: 0x00007f54bc7e1408 {method} {0x00007f54bc7e1408} 'length' '()I' in 'jdk/incubator/vector/VectorSpecies'
#16: 0x00000008000de730 'jdk/incubator/vector/Int256Vector$Int256Mask'
#17: 0x00007f54bc7feab0 {method} {0x00007f54bc7feab0} 'check' '(Ljava/lang/Class;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/AbstractMask'
#18: 0x00000008000dbed0 'jdk/incubator/vector/VectorMask'
#19: 0x00007f54bc6827e0 {method} {0x00007f54bc6827e0} 'check' '(Ljava/lang/Class;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/VectorMask;' in 'jdk/incubator/vector/VectorMask'
#20: 0x00000008000e7938 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
#21: 0x00007f54bc63da08 {method} {0x00007f54bc63da08} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#22: 0x00000008000e7120 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#23: 0x00007f54bc63d540 {method} {0x00007f54bc63d540} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#24: 0x00007f54bc63d630 {method} {0x00007f54bc63d630} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#25: 0x00007f54bc7d6bc0 {method} {0x00007f54bc7d6bc0} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
#26: 0x00000008000d8d58 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Time = 3
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
  interpreter_invocation_count:       20104
  invocation_counter:                 20104
  backedge_counter:                       0
  decompile_count:                        0
  mdo size: 600 bytes

   0 getstatic 7 <mul.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
   3 getstatic 13 <mul.mask_arr/[Z> 
   6 iconst_0
   7 invokestatic 17 <jdk/incubator/vector/VectorMask.fromArray(Ljdk/incubator/vector/VectorSpecies;[ZI)Ljdk/incubator/vector/VectorMask;> 
  0    bci: 7    CounterData        count(18441)
  10 astore_2
  11 fast_aload_0
  12 invokestatic 23 <mul.leaf([I)[I> 
  16   bci: 12   CounterData        count(18441)
  15 astore_0
  16 getstatic 7 <mul.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
  19 fast_aload_0
  20 iconst_0
  21 invokestatic 27 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  32   bci: 21   CounterData        count(18441)
  24 astore_3
  25 getstatic 7 <mul.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
  28 fast_aload_0
  29 iconst_0
  30 invokestatic 27 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  48   bci: 30   CounterData        count(18441)
  33 astore #4
  35 aload #4
  37 getstatic 32 <jdk/incubator/vector/VectorOperators.MUL/Ljdk/incubator/vector/VectorOperators$Associative;> 
  40 aload_3
  41 aload_2
  42 invokevirtual 38 <jdk/incubator/vector/IntVector.lanewise(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;Ljdk/incubator/vector/VectorMask;)Ljdk/incubator/vector/IntVector;> 
  64   bci: 42   VirtualCallData    count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/Int256Vector'(18441 1.00)
  45 aload_1
  46 iconst_0
  47 invokevirtual 42 <jdk/incubator/vector/IntVector.intoArray([II)V> 
  120  bci: 47   VirtualCallData    count(18441) nonprofiled_count(0) entries(0)
  50 return
------------------------------------------------------------------------
Total MDO size: 600 bytes
