CompileCommand: print App.micro_vector bool print = true
OpenJDK 64-Bit Server VM warning: printing of assembly code is enabled; turning on DebugNonSafepoints to gain additional output
SCALAR : [Time] 1 ms   [Res] 99990000000

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 130 ------------------------
{method}
 - this oop:          0x00007f4ea3411818
 - method holder:     'App'
 - constants:         0x00007f4ea3411090 constant pool [134]/operands[15] {0x00007f4ea3411090} for 'App' cache=0x00007f4ea3700000
 - access:            0xc1000001  public 
 - name:              'micro_vector'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        7
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007f4efc7a6220
 - adapters:          AHE@0x00007f4f003c5270: 0xbbbb0000 i2c: 0x00007f4efc817fe0 c2i: 0x00007f4efc8180cc c2iUV: 0x00007f4efc818096 c2iNCI: 0x00007f4efc818109
 - compiled entry     0x00007f4efc8180cc
 - code size:         109
 - code start:        0x00007f4ea3411798
 - code end (excl):   0x00007f4ea3411805
 - method data:       0x00007f4ea3700bb8
 - checked ex length: 0
 - linenumber start:  0x00007f4ea3411805
 - localvar length:   0

------------------------ OptoAssembly for Compile_id = 130 -----------------------
#
#  void ( App:NotNull *, int[int:>=0]:exact *, int[int:>=0]:exact *, int[int:>=0]:exact * )
#
#r018 rsi:rsi   : parm 0: App:NotNull *
#r016 rdx:rdx   : parm 1: int[int:>=0]:exact *
#r010 rcx:rcx   : parm 2: int[int:>=0]:exact *
#r004 r8:r8   : parm 3: int[int:>=0]:exact *
# -- Old rsp -- Framesize: 96 --
#r583 rsp+92: in_preserve
#r582 rsp+88: return address
#r581 rsp+84: in_preserve
#r580 rsp+80: saved fp register
#r579 rsp+76: pad2, stack alignment
#r578 rsp+72: pad2, stack alignment
#r577 rsp+68: Fixed slot 1
#r576 rsp+64: Fixed slot 0
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
000     N445: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
000     movl    rscratch1, [j_rarg0 + oopDesc::klass_offset_in_bytes()]	# compressed klass
	decode_klass_not_null rscratch1, rscratch1
	cmpq    rax, rscratch1	 # Inline cache check
	jne     SharedRuntime::_ic_miss_stub
	nop	# nops to align entry point

        nop 	# 4 bytes pad for loops and calls

020     B1: #	out( B47 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
020     # stack bang (296 bytes)
	pushq   rbp	# Save rbp
	subq    rsp, #80	# Create frame

02c     movq    R11, RSI	# spill
02f     movl    RBX, [RDX + #12 (8-bit)]	# range
032     NullCheck RDX

032     B2: #	out( B48 B3 ) <- in( B1 )  Freq: 0.999999
032     movl    R10, [RSI + #12 (8-bit)]	# compressed ptr ! Field: App.SPECIES
        nop 	# 10 bytes pad for loops and calls
040     movl    R9, [R12 + R10 << 3 + #8] (compressed oop addressing)	# compressed klass ptr
045     NullCheck R10

045     B3: #	out( B37 B4 ) <- in( B2 )  Freq: 0.999998
045     cmpl    R9, narrowklass: precise klass jdk/incubator/vector/IntVector$IntSpecies: 0x00007f4e6c212ba0:Constant:exact *	# compressed klass ptr
04c     jne,u   B37  P=0.000001 C=-1.000000

052     B4: #	out( B34 B5 ) <- in( B3 )  Freq: 0.999997
052     decode_heap_oop_not_null RAX,R10
056     # checkcastPP of RAX
056     movl    RDI, [RAX + #12 (8-bit)]	# int ! Field: jdk/incubator/vector/AbstractSpecies.laneCount (constant)
059     movl    RSI, RDI	# spill
05b     decl    RSI	# int
05d     andl    RSI, RBX	# int
        nop 	# 1 bytes pad for loops and calls
060     testl   RSI, RSI
062     jg     B34  P=0.500000 C=-1.000000

068     B5: #	out( B33 B6 ) <- in( B4 )  Freq: 0.499998
068     testl   RBX, RBX	# unsigned
06a     jbe,u   B33  P=0.000065 C=15361.000000

070     B6: #	out( B38 B7 ) <- in( B5 )  Freq: 0.499966
070     movl    R11, [RCX + #12 (8-bit)]	# range
074     NullCheck RCX

074     B7: #	out( B38 B8 ) <- in( B6 )  Freq: 0.499965
074     testl   R11, R11	# unsigned
077     jbe,u   B38  P=0.000001 C=-1.000000

07d     B8: #	out( B38 B9 ) <- in( B7 )  Freq: 0.499965
07d     movl    R13, RBX	# spill
080     decl    R13	# int
083     cmpl    R13, R11	# unsigned
086     jnb,u   B38  P=0.000001 C=-1.000000

08c     B9: #	out( B38 B10 ) <- in( B8 )  Freq: 0.499964
08c     movl    RDI, [R8 + #12 (8-bit)]	# range
090     NullCheck R8

090     B10: #	out( B38 B11 ) <- in( B9 )  Freq: 0.499964
090     testl   RDI, RDI	# unsigned
092     jbe,u   B38  P=0.000001 C=-1.000000

098     B11: #	out( B38 B12 ) <- in( B10 )  Freq: 0.499963
098     cmpl    R13, RDI	# unsigned
        nop 	# 5 bytes pad for loops and calls
0a0     jnb,u   B38  P=0.000001 C=-1.000000

0a6     B12: #	out( B38 B13 ) <- in( B11 )  Freq: 0.499963
0a6     cmpl    R13, RBX	# unsigned
0a9     jnb,u   B38  P=0.000001 C=-1.000000

0af     B13: #	out( B14 ) <- in( B12 )  Freq: 0.499962
0af     movl    RSI, RDX	# ptr -> int
0b1     shrl    RSI, #2
0b4     andl    RSI, #15	# int
0b7     movl    R10, #11	# int
0bd     subl    R10, RSI	# int
0c0     andl    R10, #15	# int
0c4     incl    R10	# int
0c7     cmpl    R10, RBX
0ca     cmovlgt R10, RBX	# min
0ce     xorl    RAX, RAX	# int
0d0     xorl    RSI, RSI	# int

0d2     B14: #	out( B14 B15 ) <- in( B13 B14 ) Loop( B14-B14 inner pre of N458) Freq: 0.999925
0d2     movl    R9, [R8 + #16 + RSI << #2]	# int
0d7     addl    R9, [RCX + #16 + RSI << #2]	# int
0dc     movl    [RDX + #16 + RSI << #2], R9	# int
0e1     incl    RSI	# int
0e3     cmpl    RSI, R10
0e6     jl,s   B14	# loop end  P=0.500000 C=15360.000000

0e8     B15: #	out( B30 B16 ) <- in( B14 )  Freq: 0.499962
0e8     movl    R10, RBX	# spill
0eb     addl    R10, #-63	# int
0ef     movl    RBP, #-2147483648	# int
0f4     cmpl    R13, R10
0f7     cmovll R10, RBP	# signed, int
        nop 	# 5 bytes pad for loops and calls
100     cmpl    RSI, R10
103     jge     B30  P=0.000001 C=-1.000000

109     B16: #	out( B39 B17 ) <- in( B15 )  Freq: 0.499962
109     # castII of RSI
109     cmpl    RSI, RBX	# unsigned
10b     jnb,u   B39  P=0.000001 C=-1.000000

111     B17: #	out( B40 B18 ) <- in( B16 )  Freq: 0.499961
111     cmpl    RSI, RDI	# unsigned
113     jnb,u   B40  P=0.000001 C=-1.000000

119     B18: #	out( B41 B19 ) <- in( B17 )  Freq: 0.499961
119     cmpl    RSI, R11	# unsigned
        nop 	# 4 bytes pad for loops and calls
120     jnb,u   B41  P=0.000001 C=-1.000000

126     B19: #	out( B42 B20 ) <- in( B18 )  Freq: 0.49996
126     movl    R9, RSI	# spill
129     addl    R9, #63	# int
12d     cmpl    R9, R11	# unsigned
130     jnb,u   B42  P=0.000001 C=-1.000000

136     B20: #	out( B43 B21 ) <- in( B19 )  Freq: 0.49996
136     cmpl    R9, RDI	# unsigned
139     jnb,u   B43  P=0.000001 C=-1.000000

13f     B21: #	out( B44 B22 ) <- in( B20 )  Freq: 0.499959
        nop 	# 1 bytes pad for loops and calls
140     cmpl    RSI, RBX	# unsigned
142     jnb,u   B44  P=0.000001 C=-1.000000

148     B22: #	out( B45 B23 ) <- in( B21 )  Freq: 0.499959
148     cmpl    R9, RBX	# unsigned
14b     jnb,u   B45  P=0.000001 C=-1.000000

151     B23: #	out( B24 ) <- in( B22 )  Freq: 0.499958
151     movl    R11, #64000	# int
157     # TLS is in R15

157     B24: #	out( B25 ) <- in( B23 B26 ) Loop( B24-B26 ) Freq: 7681.24
157     movl    RDI, R10	# spill
15a     subl    RDI, RSI	# int
15c     cmpl    R10, RSI
15f     cmovll RDI, RAX	# signed, int
162     cmpl    RDI, #64000	# unsigned
168     cmovlnbe RDI, R11	# unsigned, int
16c     addl    RDI, RSI	# int
        nop 	# 2 bytes pad for loops and calls

170     B25: #	out( B25 B26 ) <- in( B24 B25 ) Loop( B25-B25 inner main of N194 strip mined) Freq: 1.18013e+08
170     load_vector XMM0,[RCX + #16 + RSI << #2]
17b     vpaddd  XMM0,XMM0,[R8 + #16 + RSI << #2]	! add packedI
186     store_vector [RDX + #16 + RSI << #2],XMM0
	
191     movslq  R9, RSI	# i2l
194     load_vector XMM0,[RCX + #80 + R9 << #2]
19f     vpaddd  XMM0,XMM0,[R8 + #80 + R9 << #2]	! add packedI
1aa     store_vector [RDX + #80 + R9 << #2],XMM0
	
1b5     load_vector XMM0,[RCX + #144 + R9 << #2]
1c0     vpaddd  XMM0,XMM0,[R8 + #144 + R9 << #2]	! add packedI
1cb     store_vector [RDX + #144 + R9 << #2],XMM0
	
1d6     load_vector XMM0,[RCX + #208 + R9 << #2]
1e1     vpaddd  XMM0,XMM0,[R8 + #208 + R9 << #2]	! add packedI
1ec     store_vector [RDX + #208 + R9 << #2],XMM0
	
1f7     addl    RSI, #64	# int
1fa     cmpl    RSI, RDI
        nop 	# 4 bytes pad for loops and calls
200     jl     B25	# loop end  P=0.999935 C=15360.000000

206     B26: #	out( B24 B27 ) <- in( B25 )  Freq: 7681.24
206     movq    R9, [R15 + #304 (32-bit)]	# ptr
20d     testl   rax, [R9]	# Safepoint: poll for GC        # App::micro_vector @ bci:105 (line 26) L[0]=_ L[1]=RDX L[2]=RCX L[3]=R8 L[4]=RSI L[5]=_ L[6]=_
        # OopMap {r8=Oop rcx=Oop rdx=Oop off=525/0x20d}
210     cmpl    RSI, R10
213     jl     B24  P=0.999935 C=15360.000000

219     B27: #	out( B30 B28 ) <- in( B26 )  Freq: 0.499958
219     movl    R11, RBX	# spill
21c     addl    R11, #-15	# int
220     cmpl    R13, R11
223     cmovll R11, RBP	# signed, int
227     cmpl    RSI, R11
22a     jge,s   B30  P=0.500000 C=-1.000000

22c     B28: #	out( B29 ) <- in( B27 )  Freq: 0.249979
22c     # castII of RSI

22c     B29: #	out( B29 B30 ) <- in( B28 B29 ) Loop( B29-B29 inner post of N1280) Freq: 0.499958
22c     load_vector XMM0,[RCX + #16 + RSI << #2]
237     vpaddd  XMM0,XMM0,[R8 + #16 + RSI << #2]	! add packedI
242     store_vector [RDX + #16 + RSI << #2],XMM0
	
24d     addl    RSI, #16	# int
250     cmpl    RSI, R11
253     jl,s   B29	# loop end  P=0.500000 C=15360.000000

255     B30: #	out( B33 B31 ) <- in( B15 B29 B27 )  Freq: 0.499959
255     cmpl    RSI, RBX
257     jge,s   B33  P=0.500000 C=-1.000000

259     B31: #	out( B32 ) <- in( B30 )  Freq: 0.249979
259     # castII of RSI
        nop 	# 3 bytes pad for loops and calls

25c     B32: #	out( B32 B33 ) <- in( B31 B32 ) Loop( B32-B32 inner post of N458) Freq: 0.499959
25c     movl    R10, [R8 + #16 + RSI << #2]	# int
261     addl    R10, [RCX + #16 + RSI << #2]	# int
266     movl    [RDX + #16 + RSI << #2], R10	# int
26b     incl    RSI	# int
26d     cmpl    RSI, RBX
26f     jl,s   B32	# loop end  P=0.500000 C=15360.000000

271     B33: #	out( N445 ) <- in( B32 B30 B5 )  Freq: 0.499991
271     vzeroupper
	addq    rsp, 80	# Destroy frame
	popq    rbp
	cmpq     rsp, poll_offset[r15_thread] 
	ja       #safepoint_stub	# Safepoint: poll for GC

286     ret

287     B34: #	out( B46 B35 ) <- in( B4 )  Freq: 0.499998
287     movq    RBX, precise klass jdk/incubator/vector/AbstractSpecies: 0x00007f4e6c2183f0:Constant:exact *	# ptr
291     decode_and_move_klass_not_null RSI,R9
29e     movq    R9, [RSI + #72 (8-bit)]	# class
2a2     cmpq    R9, RBX	# ptr
2a5     jne,u   B46  P=0.000001 C=-1.000000

2ab     B35: #	out( B49 B36 ) <- in( B34 )  Freq: 0.499998
2ab     movl    RBP, [RCX + #12 (8-bit)]	# range
2ae     NullCheck RCX

2ae     B36: #	out( N445 ) <- in( B35 )  Freq: 0.499997
2ae     movl    RSI, #540	# int
2b3     movq    [rsp + #0], R11	# spill
2b7     movq    [rsp + #8], RDX	# spill
2bc     movq    [rsp + #24], R8	# spill
2c1     movq    [rsp + #32], RAX	# spill
2c6     movq    [rsp + #40], RCX	# spill
2cb     movl    [rsp + #48], RDI	# spill
        nop 	# 1 bytes pad for loops and calls
2d0     call,static  wrapper for: uncommon_trap(reason='unloaded' action='reinterpret' index='540' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2689) L[0]=rsp + #32 L[1]=rsp + #40 L[2]=_ L[3]=_ STK[0]=#0 STK[1]=rsp + #48 STK[2]=RBP
        # App::micro_vector @ bci:35 (line 22) L[0]=rsp + #0 L[1]=rsp + #8 L[2]=rsp + #40 L[3]=rsp + #24 L[4]=#0 L[5]=_ L[6]=_
        # OopMap {[0]=Oop [8]=Oop [24]=Oop [32]=Oop [40]=Oop off=728/0x2d8}
2d8     stop	# ShouldNotReachHere

2ec     B37: #	out( N445 ) <- in( B3 )  Freq: 9.99998e-07
2ec     movl    RSI, #-34	# int
2f1     movq    RBP, R11	# spill
2f4     movq    [rsp + #0], RDX	# spill
2f8     movq    [rsp + #8], RCX	# spill
2fd     movq    [rsp + #16], R8	# spill
302     movl    [rsp + #24], RBX	# spill
306     movl    [rsp + #28], R10	# spill
        nop 	# 1 bytes pad for loops and calls
30c     call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:17 (line 21) L[0]=RBP L[1]=rsp + #0 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=#0 L[5]=_ L[6]=_ STK[0]=#0 STK[1]=rsp + #24 STK[2]=rsp + #28
        # OopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop [28]=NarrowOop off=788/0x314}
314     stop	# ShouldNotReachHere

328     B38: #	out( N445 ) <- in( B10 B6 B7 B8 B11 B12 B9 )  Freq: 3.53295e-06
328     movl    RSI, #-138	# int
32d     movq    RBP, RDX	# spill
330     movq    [rsp + #0], RCX	# spill
334     movq    [rsp + #8], R8	# spill
339     movl    [rsp + #16], RBX	# spill
        nop 	# 3 bytes pad for loops and calls
340     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:86 (line 26) L[0]=_ L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #8 L[4]=#0 L[5]=_ L[6]=_ STK[0]=#0 STK[1]=rsp + #16
        # OopMap {rbp=Oop [0]=Oop [8]=Oop off=840/0x348}
348     stop	# ShouldNotReachHere

35c     B39: #	out( N445 ) <- in( B16 )  Freq: 5.06601e-07
35c     stop	# ShouldNotReachHere

370     B40: #	out( N445 ) <- in( B17 )  Freq: 5.066e-07
370     stop	# ShouldNotReachHere

384     B41: #	out( N445 ) <- in( B18 )  Freq: 5.066e-07
384     stop	# ShouldNotReachHere

398     B42: #	out( N445 ) <- in( B19 )  Freq: 5.06599e-07
398     stop	# ShouldNotReachHere

3ac     B43: #	out( N445 ) <- in( B20 )  Freq: 5.06599e-07
3ac     stop	# ShouldNotReachHere

3c0     B44: #	out( N445 ) <- in( B21 )  Freq: 5.06598e-07
3c0     stop	# ShouldNotReachHere

3d4     B45: #	out( N445 ) <- in( B22 )  Freq: 5.06598e-07
3d4     stop	# ShouldNotReachHere

3e8     B46: #	out( N445 ) <- in( B34 )  Freq: 4.99998e-07
3e8     movl    RSI, #-33	# int
3ed     movq    RBP, R11	# spill
3f0     movq    [rsp + #0], RDX	# spill
3f4     movq    [rsp + #16], R8	# spill
3f9     movq    [rsp + #32], RCX	# spill
3fe     movl    [rsp + #28], R10	# spill
        nop 	# 1 bytes pad for loops and calls
404     call,static  wrapper for: uncommon_trap(reason='class_check' action='none' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:2 (line 2689) L[0]=rsp + #28 L[1]=rsp + #32 L[2]=_ L[3]=_ STK[0]=#0 STK[1]=rsp + #28
        # App::micro_vector @ bci:35 (line 22) L[0]=RBP L[1]=rsp + #0 L[2]=rsp + #32 L[3]=rsp + #16 L[4]=#0 L[5]=_ L[6]=_
        # OopMap {rbp=Oop [0]=Oop [16]=Oop [28]=NarrowOop [32]=Oop off=1036/0x40c}
40c     stop	# ShouldNotReachHere

420     B47: #	out( N445 ) <- in( B1 )  Freq: 1.01328e-06
420     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
428     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:12 (line 21) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ STK[0]=_ STK[1]=#NULL
        # OopMap {off=1072/0x430}
430     stop	# ShouldNotReachHere

444     B48: #	out( N445 ) <- in( B2 )  Freq: 1.01328e-06
444     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
44c     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:17 (line 21) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ STK[0]=_ STK[1]=_ STK[2]=#NULL
        # OopMap {off=1108/0x454}
454     stop	# ShouldNotReachHere

468     B49: #	out( N445 ) <- in( B35 )  Freq: 5.06637e-07
468     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
470     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # jdk.incubator.vector.IntVector::fromArray @ bci:8 (line 2689) L[0]=_ L[1]=_ L[2]=_ L[3]=_ STK[0]=_ STK[1]=_ STK[2]=#NULL
        # App::micro_vector @ bci:35 (line 22) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_
        # OopMap {off=1144/0x478}
478     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    1689  130             App::micro_vector (109 bytes)
 total in heap  [0x00007f4efc8efb10,0x00007f4efc8f06d0] = 3008
 relocation     [0x00007f4efc8efc88,0x00007f4efc8efd58] = 208
 main code      [0x00007f4efc8efd60,0x00007f4efc8f0220] = 1216
 stub code      [0x00007f4efc8f0220,0x00007f4efc8f0238] = 24
 oops           [0x00007f4efc8f0238,0x00007f4efc8f0240] = 8
 metadata       [0x00007f4efc8f0240,0x00007f4efc8f0270] = 48
 scopes data    [0x00007f4efc8f0270,0x00007f4efc8f03d8] = 360
 scopes pcs     [0x00007f4efc8f03d8,0x00007f4efc8f0698] = 704
 dependencies   [0x00007f4efc8f0698,0x00007f4efc8f06a0] = 8
 nul chk table  [0x00007f4efc8f06a0,0x00007f4efc8f06d0] = 48

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Entry Point]
  # {method} {0x00007f4ea3411818} 'micro_vector' '([I[I[I)V' in 'App'
  # this:     rsi:rsi   = 'App'
  # parm0:    rdx:rdx   = '[I'
  # parm1:    rcx:rcx   = '[I'
  # parm2:    r8:r8     = '[I'
  #           [sp+0x60]  (sp of caller)
 ;; N445: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f4efc8efd60:   mov    0x8(%rsi),%r10d
  0x00007f4efc8efd64:   movabs $0x800000000,%r11
  0x00007f4efc8efd6e:   add    %r11,%r10
  0x00007f4efc8efd71:   cmp    %r10,%rax
  0x00007f4efc8efd74:   jne    0x00007f4efc8adc20           ;   {runtime_call ic_miss_stub}
  0x00007f4efc8efd7a:   nop
  0x00007f4efc8efd7b:   nop
  0x00007f4efc8efd7c:   nop
  0x00007f4efc8efd7d:   nop
  0x00007f4efc8efd7e:   nop
  0x00007f4efc8efd7f:   nop
[Verified Entry Point]
 ;; B1: #	out( B47 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f4efc8efd80:   mov    %eax,-0x16000(%rsp)
  0x00007f4efc8efd87:   push   %rbp
  0x00007f4efc8efd88:   sub    $0x50,%rsp                   ;*synchronization entry
                                                            ; - App::micro_vector@-1 (line 15)
  0x00007f4efc8efd8c:   mov    %rsi,%r11
  0x00007f4efc8efd8f:   mov    0xc(%rdx),%ebx               ; implicit exception: dispatches to 0x00007f4efc8f0180
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@12 (line 21)
 ;; B2: #	out( B48 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007f4efc8efd92:   mov    0xc(%rsi),%r10d              ;*getfield SPECIES {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@14 (line 21)
  0x00007f4efc8efd96:   nop
  0x00007f4efc8efd97:   nop
  0x00007f4efc8efd98:   nop
  0x00007f4efc8efd99:   nop
  0x00007f4efc8efd9a:   nop
  0x00007f4efc8efd9b:   nop
  0x00007f4efc8efd9c:   nop
  0x00007f4efc8efd9d:   nop
  0x00007f4efc8efd9e:   nop
  0x00007f4efc8efd9f:   nop
  0x00007f4efc8efda0:   mov    0x8(%r12,%r10,8),%r9d        ; implicit exception: dispatches to 0x00007f4efc8f01a4
 ;; B3: #	out( B37 B4 ) <- in( B2 )  Freq: 0.999998
  0x00007f4efc8efda5:   cmp    $0x94b80,%r9d                ;   {metadata('jdk/incubator/vector/IntVector$IntSpecies')}
  0x00007f4efc8efdac:   jne    0x00007f4efc8f004c
 ;; B4: #	out( B34 B5 ) <- in( B3 )  Freq: 0.999997
  0x00007f4efc8efdb2:   lea    (%r12,%r10,8),%rax           ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 21)
  0x00007f4efc8efdb6:   mov    0xc(%rax),%edi               ;*getfield laneCount {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::length@1 (line 116)
                                                            ; - App::micro_vector@17 (line 21)
  0x00007f4efc8efdb9:   mov    %edi,%esi
  0x00007f4efc8efdbb:   dec    %esi
  0x00007f4efc8efdbd:   and    %ebx,%esi
  0x00007f4efc8efdbf:   nop
  0x00007f4efc8efdc0:   test   %esi,%esi
  0x00007f4efc8efdc2:   jg     0x00007f4efc8effe7           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@25 (line 21)
 ;; B5: #	out( B33 B6 ) <- in( B4 )  Freq: 0.499998
  0x00007f4efc8efdc8:   test   %ebx,%ebx
  0x00007f4efc8efdca:   jbe    0x00007f4efc8effd1           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B6: #	out( B38 B7 ) <- in( B5 )  Freq: 0.499966
  0x00007f4efc8efdd0:   mov    0xc(%rcx),%r11d              ; implicit exception: dispatches to 0x00007f4efc8f0088
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@95 (line 27)
 ;; B7: #	out( B38 B8 ) <- in( B6 )  Freq: 0.499965
  0x00007f4efc8efdd4:   test   %r11d,%r11d
  0x00007f4efc8efdd7:   jbe    0x00007f4efc8f0088
 ;; B8: #	out( B38 B9 ) <- in( B7 )  Freq: 0.499965
  0x00007f4efc8efddd:   mov    %ebx,%r13d
  0x00007f4efc8efde0:   dec    %r13d
  0x00007f4efc8efde3:   cmp    %r11d,%r13d
  0x00007f4efc8efde6:   jae    0x00007f4efc8f0088
 ;; B9: #	out( B38 B10 ) <- in( B8 )  Freq: 0.499964
  0x00007f4efc8efdec:   mov    0xc(%r8),%edi                ; implicit exception: dispatches to 0x00007f4efc8f0088
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@99 (line 27)
 ;; B10: #	out( B38 B11 ) <- in( B9 )  Freq: 0.499964
  0x00007f4efc8efdf0:   test   %edi,%edi
  0x00007f4efc8efdf2:   jbe    0x00007f4efc8f0088
 ;; B11: #	out( B38 B12 ) <- in( B10 )  Freq: 0.499963
  0x00007f4efc8efdf8:   cmp    %edi,%r13d
  0x00007f4efc8efdfb:   nop
  0x00007f4efc8efdfc:   nop
  0x00007f4efc8efdfd:   nop
  0x00007f4efc8efdfe:   nop
  0x00007f4efc8efdff:   nop
  0x00007f4efc8efe00:   jae    0x00007f4efc8f0088
 ;; B12: #	out( B38 B13 ) <- in( B11 )  Freq: 0.499963
  0x00007f4efc8efe06:   cmp    %ebx,%r13d
  0x00007f4efc8efe09:   jae    0x00007f4efc8f0088
 ;; B13: #	out( B14 ) <- in( B12 )  Freq: 0.499962
  0x00007f4efc8efe0f:   mov    %edx,%esi
  0x00007f4efc8efe11:   shr    $0x2,%esi
  0x00007f4efc8efe14:   and    $0xf,%esi
  0x00007f4efc8efe17:   mov    $0xb,%r10d
  0x00007f4efc8efe1d:   sub    %esi,%r10d
  0x00007f4efc8efe20:   and    $0xf,%r10d
  0x00007f4efc8efe24:   inc    %r10d
  0x00007f4efc8efe27:   cmp    %ebx,%r10d
  0x00007f4efc8efe2a:   cmovg  %ebx,%r10d
  0x00007f4efc8efe2e:   xor    %eax,%eax
  0x00007f4efc8efe30:   xor    %esi,%esi                    ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@89 (line 27)
 ;; B14: #	out( B14 B15 ) <- in( B13 B14 ) Loop( B14-B14 inner pre of N458) Freq: 0.999925
  0x00007f4efc8efe32:   mov    0x10(%r8,%rsi,4),%r9d
  0x00007f4efc8efe37:   add    0x10(%rcx,%rsi,4),%r9d
  0x00007f4efc8efe3c:   mov    %r9d,0x10(%rdx,%rsi,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@101 (line 27)
  0x00007f4efc8efe41:   inc    %esi                         ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@102 (line 26)
  0x00007f4efc8efe43:   cmp    %r10d,%esi
  0x00007f4efc8efe46:   jl     0x00007f4efc8efe32           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B15: #	out( B30 B16 ) <- in( B14 )  Freq: 0.499962
  0x00007f4efc8efe48:   mov    %ebx,%r10d
  0x00007f4efc8efe4b:   add    $0xffffffc1,%r10d
  0x00007f4efc8efe4f:   mov    $0x80000000,%ebp
  0x00007f4efc8efe54:   cmp    %r10d,%r13d
  0x00007f4efc8efe57:   cmovl  %ebp,%r10d
  0x00007f4efc8efe5b:   nop
  0x00007f4efc8efe5c:   nop
  0x00007f4efc8efe5d:   nop
  0x00007f4efc8efe5e:   nop
  0x00007f4efc8efe5f:   nop
  0x00007f4efc8efe60:   cmp    %r10d,%esi
  0x00007f4efc8efe63:   jge    0x00007f4efc8effb5
 ;; B16: #	out( B39 B17 ) <- in( B15 )  Freq: 0.499962
  0x00007f4efc8efe69:   cmp    %ebx,%esi
  0x00007f4efc8efe6b:   jae    0x00007f4efc8f00bc
 ;; B17: #	out( B40 B18 ) <- in( B16 )  Freq: 0.499961
  0x00007f4efc8efe71:   cmp    %edi,%esi
  0x00007f4efc8efe73:   jae    0x00007f4efc8f00d0
 ;; B18: #	out( B41 B19 ) <- in( B17 )  Freq: 0.499961
  0x00007f4efc8efe79:   cmp    %r11d,%esi
  0x00007f4efc8efe7c:   nop
  0x00007f4efc8efe7d:   nop
  0x00007f4efc8efe7e:   nop
  0x00007f4efc8efe7f:   nop
  0x00007f4efc8efe80:   jae    0x00007f4efc8f00e4
 ;; B19: #	out( B42 B20 ) <- in( B18 )  Freq: 0.49996
  0x00007f4efc8efe86:   mov    %esi,%r9d
  0x00007f4efc8efe89:   add    $0x3f,%r9d
  0x00007f4efc8efe8d:   cmp    %r11d,%r9d
  0x00007f4efc8efe90:   jae    0x00007f4efc8f00f8
 ;; B20: #	out( B43 B21 ) <- in( B19 )  Freq: 0.49996
  0x00007f4efc8efe96:   cmp    %edi,%r9d
  0x00007f4efc8efe99:   jae    0x00007f4efc8f010c
 ;; B21: #	out( B44 B22 ) <- in( B20 )  Freq: 0.499959
  0x00007f4efc8efe9f:   nop
  0x00007f4efc8efea0:   cmp    %ebx,%esi
  0x00007f4efc8efea2:   jae    0x00007f4efc8f0120
 ;; B22: #	out( B45 B23 ) <- in( B21 )  Freq: 0.499959
  0x00007f4efc8efea8:   cmp    %ebx,%r9d
  0x00007f4efc8efeab:   jae    0x00007f4efc8f0134
 ;; B23: #	out( B24 ) <- in( B22 )  Freq: 0.499958
  0x00007f4efc8efeb1:   mov    $0xfa00,%r11d
 ;; B24: #	out( B25 ) <- in( B23 B26 ) Loop( B24-B26 ) Freq: 7681.24
  0x00007f4efc8efeb7:   mov    %r10d,%edi
  0x00007f4efc8efeba:   sub    %esi,%edi
  0x00007f4efc8efebc:   cmp    %esi,%r10d
  0x00007f4efc8efebf:   cmovl  %eax,%edi
  0x00007f4efc8efec2:   cmp    $0xfa00,%edi
  0x00007f4efc8efec8:   cmova  %r11d,%edi
  0x00007f4efc8efecc:   add    %esi,%edi
  0x00007f4efc8efece:   nop
  0x00007f4efc8efecf:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@89 (line 27)
 ;; B25: #	out( B25 B26 ) <- in( B24 B25 ) Loop( B25-B25 inner main of N194 strip mined) Freq: 1.18013e+08
  0x00007f4efc8efed0:   vmovdqu32 0x10(%rcx,%rsi,4),%zmm0
  0x00007f4efc8efedb:   vpaddd 0x10(%r8,%rsi,4),%zmm0,%zmm0
  0x00007f4efc8efee6:   vmovdqu32 %zmm0,0x10(%rdx,%rsi,4)
  0x00007f4efc8efef1:   movslq %esi,%r9
  0x00007f4efc8efef4:   vmovdqu32 0x50(%rcx,%r9,4),%zmm0
  0x00007f4efc8efeff:   vpaddd 0x50(%r8,%r9,4),%zmm0,%zmm0
  0x00007f4efc8eff0a:   vmovdqu32 %zmm0,0x50(%rdx,%r9,4)
  0x00007f4efc8eff15:   vmovdqu32 0x90(%rcx,%r9,4),%zmm0
  0x00007f4efc8eff20:   vpaddd 0x90(%r8,%r9,4),%zmm0,%zmm0
  0x00007f4efc8eff2b:   vmovdqu32 %zmm0,0x90(%rdx,%r9,4)
  0x00007f4efc8eff36:   vmovdqu32 0xd0(%rcx,%r9,4),%zmm0
  0x00007f4efc8eff41:   vpaddd 0xd0(%r8,%r9,4),%zmm0,%zmm0
  0x00007f4efc8eff4c:   vmovdqu32 %zmm0,0xd0(%rdx,%r9,4)    ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@101 (line 27)
  0x00007f4efc8eff57:   add    $0x40,%esi                   ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@102 (line 26)
  0x00007f4efc8eff5a:   cmp    %edi,%esi
  0x00007f4efc8eff5c:   nop
  0x00007f4efc8eff5d:   nop
  0x00007f4efc8eff5e:   nop
  0x00007f4efc8eff5f:   nop
  0x00007f4efc8eff60:   jl     0x00007f4efc8efed0           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@105 (line 26)
 ;; B26: #	out( B24 B27 ) <- in( B25 )  Freq: 7681.24
  0x00007f4efc8eff66:   mov    0x130(%r15),%r9              ; ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@105 (line 26)
  0x00007f4efc8eff6d:   test   %eax,(%r9)                   ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@105 (line 26)
                                                            ;   {poll}
  0x00007f4efc8eff70:   cmp    %r10d,%esi
  0x00007f4efc8eff73:   jl     0x00007f4efc8efeb7
 ;; B27: #	out( B30 B28 ) <- in( B26 )  Freq: 0.499958
  0x00007f4efc8eff79:   mov    %ebx,%r11d
  0x00007f4efc8eff7c:   add    $0xfffffff1,%r11d
  0x00007f4efc8eff80:   cmp    %r11d,%r13d
  0x00007f4efc8eff83:   cmovl  %ebp,%r11d
  0x00007f4efc8eff87:   cmp    %r11d,%esi
  0x00007f4efc8eff8a:   jge    0x00007f4efc8effb5           ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@89 (line 27)
 ;; B28: #	out( B29 ) <- in( B27 )  Freq: 0.249979
 ;; B29: #	out( B29 B30 ) <- in( B28 B29 ) Loop( B29-B29 inner post of N1280) Freq: 0.499958
  0x00007f4efc8eff8c:   vmovdqu32 0x10(%rcx,%rsi,4),%zmm0
  0x00007f4efc8eff97:   vpaddd 0x10(%r8,%rsi,4),%zmm0,%zmm0
  0x00007f4efc8effa2:   vmovdqu32 %zmm0,0x10(%rdx,%rsi,4)   ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@101 (line 27)
  0x00007f4efc8effad:   add    $0x10,%esi                   ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@102 (line 26)
  0x00007f4efc8effb0:   cmp    %r11d,%esi
  0x00007f4efc8effb3:   jl     0x00007f4efc8eff8c           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B30: #	out( B33 B31 ) <- in( B15 B29 B27 )  Freq: 0.499959
  0x00007f4efc8effb5:   cmp    %ebx,%esi
  0x00007f4efc8effb7:   jge    0x00007f4efc8effd1
 ;; B31: #	out( B32 ) <- in( B30 )  Freq: 0.249979
  0x00007f4efc8effb9:   nop
  0x00007f4efc8effba:   nop
  0x00007f4efc8effbb:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@89 (line 27)
 ;; B32: #	out( B32 B33 ) <- in( B31 B32 ) Loop( B32-B32 inner post of N458) Freq: 0.499959
  0x00007f4efc8effbc:   mov    0x10(%r8,%rsi,4),%r10d
  0x00007f4efc8effc1:   add    0x10(%rcx,%rsi,4),%r10d
  0x00007f4efc8effc6:   mov    %r10d,0x10(%rdx,%rsi,4)      ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@101 (line 27)
  0x00007f4efc8effcb:   inc    %esi                         ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@102 (line 26)
  0x00007f4efc8effcd:   cmp    %ebx,%esi
  0x00007f4efc8effcf:   jl     0x00007f4efc8effbc           ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 21)
 ;; B33: #	out( N445 ) <- in( B32 B30 B5 )  Freq: 0.499991
  0x00007f4efc8effd1:   vzeroupper 
  0x00007f4efc8effd4:   add    $0x50,%rsp
  0x00007f4efc8effd8:   pop    %rbp
  0x00007f4efc8effd9:   cmp    0x128(%r15),%rsp             ;   {poll_return}
  0x00007f4efc8effe0:   ja     0x00007f4efc8f01ec
  0x00007f4efc8effe6:   retq   
 ;; B34: #	out( B46 B35 ) <- in( B4 )  Freq: 0.499998
  0x00007f4efc8effe7:   movabs $0x800094798,%rbx            ;   {metadata('jdk/incubator/vector/AbstractSpecies')}
  0x00007f4efc8efff1:   movabs $0x800000000,%rsi
  0x00007f4efc8efffb:   add    %r9,%rsi
  0x00007f4efc8efffe:   mov    0x48(%rsi),%r9
  0x00007f4efc8f0002:   cmp    %rbx,%r9
  0x00007f4efc8f0005:   jne    0x00007f4efc8f0148
 ;; B35: #	out( B49 B36 ) <- in( B34 )  Freq: 0.499998
  0x00007f4efc8f000b:   mov    0xc(%rcx),%ebp               ; implicit exception: dispatches to 0x00007f4efc8f01c8
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@8 (line 2689)
                                                            ; - App::micro_vector@35 (line 22)
 ;; B36: #	out( N445 ) <- in( B35 )  Freq: 0.499997
  0x00007f4efc8f000e:   mov    $0x21c,%esi
  0x00007f4efc8f0013:   mov    %r11,(%rsp)
  0x00007f4efc8f0017:   mov    %rdx,0x8(%rsp)
  0x00007f4efc8f001c:   mov    %r8,0x18(%rsp)
  0x00007f4efc8f0021:   mov    %rax,0x20(%rsp)
  0x00007f4efc8f0026:   mov    %rcx,0x28(%rsp)
  0x00007f4efc8f002b:   mov    %edi,0x30(%rsp)
  0x00007f4efc8f002f:   nop
  0x00007f4efc8f0030:   vzeroupper 
  0x00007f4efc8f0033:   callq  0x00007f4efc8b11c0           ; ImmutableOopMap {[0]=Oop [8]=Oop [24]=Oop [32]=Oop [40]=Oop }
                                                            ;*invokestatic checkFromIndexSize {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@35 (line 22)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f4efc8f0038:   movabs $0x7f4f060747b8,%rdi         ;   {external_word}
  0x00007f4efc8f0042:   and    $0xfffffffffffffff0,%rsp
  0x00007f4efc8f0046:   callq  0x00007f4f05839ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f4efc8f004b:   hlt                                 ;*invokestatic checkFromIndexSize {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@35 (line 22)
 ;; B37: #	out( N445 ) <- in( B3 )  Freq: 9.99998e-07
  0x00007f4efc8f004c:   mov    $0xffffffde,%esi
  0x00007f4efc8f0051:   mov    %r11,%rbp
  0x00007f4efc8f0054:   mov    %rdx,(%rsp)
  0x00007f4efc8f0058:   mov    %rcx,0x8(%rsp)
  0x00007f4efc8f005d:   mov    %r8,0x10(%rsp)
  0x00007f4efc8f0062:   mov    %ebx,0x18(%rsp)
  0x00007f4efc8f0066:   mov    %r10d,0x1c(%rsp)
  0x00007f4efc8f006b:   nop
  0x00007f4efc8f006c:   vzeroupper 
  0x00007f4efc8f006f:   callq  0x00007f4efc8b11c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop [28]=NarrowOop }
                                                            ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 21)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f4efc8f0074:   movabs $0x7f4f060747b8,%rdi         ;   {external_word}
  0x00007f4efc8f007e:   and    $0xfffffffffffffff0,%rsp
  0x00007f4efc8f0082:   callq  0x00007f4f05839ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f4efc8f0087:   hlt                                 ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B38: #	out( N445 ) <- in( B10 B6 B7 B8 B11 B12 B9 )  Freq: 3.53295e-06
  0x00007f4efc8f0088:   mov    $0xffffff76,%esi
  0x00007f4efc8f008d:   mov    %rdx,%rbp
  0x00007f4efc8f0090:   mov    %rcx,(%rsp)
  0x00007f4efc8f0094:   mov    %r8,0x8(%rsp)
  0x00007f4efc8f0099:   mov    %ebx,0x10(%rsp)
  0x00007f4efc8f009d:   nop
  0x00007f4efc8f009e:   nop
  0x00007f4efc8f009f:   nop
  0x00007f4efc8f00a0:   vzeroupper 
  0x00007f4efc8f00a3:   callq  0x00007f4efc8b11c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@86 (line 26)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f4efc8f00a8:   movabs $0x7f4f060747b8,%rdi         ;   {external_word}
  0x00007f4efc8f00b2:   and    $0xfffffffffffffff0,%rsp
  0x00007f4efc8f00b6:   callq  0x00007f4f05839ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f4efc8f00bb:   hlt                                 ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B39: #	out( N445 ) <- in( B16 )  Freq: 5.06601e-07
  0x00007f4efc8f00bc:   movabs $0x7f4f0620c078,%rdi         ;   {external_word}
  0x00007f4efc8f00c6:   and    $0xfffffffffffffff0,%rsp
  0x00007f4efc8f00ca:   callq  0x00007f4f05839ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f4efc8f00cf:   hlt    
 ;; B40: #	out( N445 ) <- in( B17 )  Freq: 5.066e-07
  0x00007f4efc8f00d0:   movabs $0x7f4f0620c078,%rdi         ;   {external_word}
  0x00007f4efc8f00da:   and    $0xfffffffffffffff0,%rsp
  0x00007f4efc8f00de:   callq  0x00007f4f05839ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f4efc8f00e3:   hlt    
 ;; B41: #	out( N445 ) <- in( B18 )  Freq: 5.066e-07
  0x00007f4efc8f00e4:   movabs $0x7f4f0620c078,%rdi         ;   {external_word}
  0x00007f4efc8f00ee:   and    $0xfffffffffffffff0,%rsp
  0x00007f4efc8f00f2:   callq  0x00007f4f05839ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f4efc8f00f7:   hlt    
 ;; B42: #	out( N445 ) <- in( B19 )  Freq: 5.06599e-07
  0x00007f4efc8f00f8:   movabs $0x7f4f0620c078,%rdi         ;   {external_word}
  0x00007f4efc8f0102:   and    $0xfffffffffffffff0,%rsp
  0x00007f4efc8f0106:   callq  0x00007f4f05839ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f4efc8f010b:   hlt    
 ;; B43: #	out( N445 ) <- in( B20 )  Freq: 5.06599e-07
  0x00007f4efc8f010c:   movabs $0x7f4f0620c078,%rdi         ;   {external_word}
  0x00007f4efc8f0116:   and    $0xfffffffffffffff0,%rsp
  0x00007f4efc8f011a:   callq  0x00007f4f05839ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f4efc8f011f:   hlt    
 ;; B44: #	out( N445 ) <- in( B21 )  Freq: 5.06598e-07
  0x00007f4efc8f0120:   movabs $0x7f4f0620c078,%rdi         ;   {external_word}
  0x00007f4efc8f012a:   and    $0xfffffffffffffff0,%rsp
  0x00007f4efc8f012e:   callq  0x00007f4f05839ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f4efc8f0133:   hlt    
 ;; B45: #	out( N445 ) <- in( B22 )  Freq: 5.06598e-07
  0x00007f4efc8f0134:   movabs $0x7f4f0620c078,%rdi         ;   {external_word}
  0x00007f4efc8f013e:   and    $0xfffffffffffffff0,%rsp
  0x00007f4efc8f0142:   callq  0x00007f4f05839ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f4efc8f0147:   hlt    
 ;; B46: #	out( N445 ) <- in( B34 )  Freq: 4.99998e-07
  0x00007f4efc8f0148:   mov    $0xffffffdf,%esi
  0x00007f4efc8f014d:   mov    %r11,%rbp
  0x00007f4efc8f0150:   mov    %rdx,(%rsp)
  0x00007f4efc8f0154:   mov    %r8,0x10(%rsp)
  0x00007f4efc8f0159:   mov    %rcx,0x20(%rsp)
  0x00007f4efc8f015e:   mov    %r10d,0x1c(%rsp)
  0x00007f4efc8f0163:   nop
  0x00007f4efc8f0164:   vzeroupper 
  0x00007f4efc8f0167:   callq  0x00007f4efc8b11c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop [28]=NarrowOop [32]=Oop }
                                                            ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
                                                            ; - App::micro_vector@35 (line 22)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f4efc8f016c:   movabs $0x7f4f060747b8,%rdi         ;   {external_word}
  0x00007f4efc8f0176:   and    $0xfffffffffffffff0,%rsp
  0x00007f4efc8f017a:   callq  0x00007f4f05839ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f4efc8f017f:   hlt                                 ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
                                                            ; - App::micro_vector@35 (line 22)
 ;; B47: #	out( N445 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007f4efc8f0180:   mov    $0xfffffff6,%esi
  0x00007f4efc8f0185:   nop
  0x00007f4efc8f0186:   nop
  0x00007f4efc8f0187:   nop
  0x00007f4efc8f0188:   vzeroupper 
  0x00007f4efc8f018b:   callq  0x00007f4efc8b11c0           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@12 (line 21)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f4efc8f0190:   movabs $0x7f4f060747b8,%rdi         ;   {external_word}
  0x00007f4efc8f019a:   and    $0xfffffffffffffff0,%rsp
  0x00007f4efc8f019e:   callq  0x00007f4f05839ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f4efc8f01a3:   hlt                                 ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@12 (line 21)
 ;; B48: #	out( N445 ) <- in( B2 )  Freq: 1.01328e-06
  0x00007f4efc8f01a4:   mov    $0xfffffff6,%esi
  0x00007f4efc8f01a9:   nop
  0x00007f4efc8f01aa:   nop
  0x00007f4efc8f01ab:   nop
  0x00007f4efc8f01ac:   vzeroupper 
  0x00007f4efc8f01af:   callq  0x00007f4efc8b11c0           ; ImmutableOopMap {}
                                                            ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 21)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f4efc8f01b4:   movabs $0x7f4f060747b8,%rdi         ;   {external_word}
  0x00007f4efc8f01be:   and    $0xfffffffffffffff0,%rsp
  0x00007f4efc8f01c2:   callq  0x00007f4f05839ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f4efc8f01c7:   hlt                                 ;*invokeinterface length {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 21)
 ;; B49: #	out( N445 ) <- in( B35 )  Freq: 5.06637e-07
  0x00007f4efc8f01c8:   mov    $0xfffffff6,%esi
  0x00007f4efc8f01cd:   nop
  0x00007f4efc8f01ce:   nop
  0x00007f4efc8f01cf:   nop
  0x00007f4efc8f01d0:   vzeroupper 
  0x00007f4efc8f01d3:   callq  0x00007f4efc8b11c0           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray@8 (line 2689)
                                                            ; - App::micro_vector@35 (line 22)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f4efc8f01d8:   movabs $0x7f4f060747b8,%rdi         ;   {external_word}
  0x00007f4efc8f01e2:   and    $0xfffffffffffffff0,%rsp
  0x00007f4efc8f01e6:   callq  0x00007f4f05839ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f4efc8f01eb:   hlt                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@89 (line 27)
  0x00007f4efc8f01ec:   movabs $0x7f4efc8effd9,%r10         ;   {internal_word}
  0x00007f4efc8f01f6:   mov    %r10,0x3e8(%r15)
  0x00007f4efc8f01fd:   jmpq   0x00007f4efc8b0020           ;   {runtime_call SafepointBlob}
  0x00007f4efc8f0202:   hlt    
  0x00007f4efc8f0203:   hlt    
  0x00007f4efc8f0204:   hlt    
  0x00007f4efc8f0205:   hlt    
  0x00007f4efc8f0206:   hlt    
  0x00007f4efc8f0207:   hlt    
  0x00007f4efc8f0208:   hlt    
  0x00007f4efc8f0209:   hlt    
  0x00007f4efc8f020a:   hlt    
  0x00007f4efc8f020b:   hlt    
  0x00007f4efc8f020c:   hlt    
  0x00007f4efc8f020d:   hlt    
  0x00007f4efc8f020e:   hlt    
  0x00007f4efc8f020f:   hlt    
  0x00007f4efc8f0210:   hlt    
  0x00007f4efc8f0211:   hlt    
  0x00007f4efc8f0212:   hlt    
  0x00007f4efc8f0213:   hlt    
  0x00007f4efc8f0214:   hlt    
  0x00007f4efc8f0215:   hlt    
  0x00007f4efc8f0216:   hlt    
  0x00007f4efc8f0217:   hlt    
  0x00007f4efc8f0218:   hlt    
  0x00007f4efc8f0219:   hlt    
  0x00007f4efc8f021a:   hlt    
  0x00007f4efc8f021b:   hlt    
  0x00007f4efc8f021c:   hlt    
  0x00007f4efc8f021d:   hlt    
  0x00007f4efc8f021e:   hlt    
  0x00007f4efc8f021f:   hlt    
[Exception Handler]
  0x00007f4efc8f0220:   jmpq   0x00007f4efc7f4fa0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f4efc8f0225:   callq  0x00007f4efc8f022a
  0x00007f4efc8f022a:   subq   $0x5,(%rsp)
  0x00007f4efc8f022f:   jmpq   0x00007f4efc8b14e0           ;   {runtime_call DeoptimizationBlob}
  0x00007f4efc8f0234:   hlt    
  0x00007f4efc8f0235:   hlt    
  0x00007f4efc8f0236:   hlt    
  0x00007f4efc8f0237:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007f4efc8f0238:   0x000000010110de40 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de40}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007f4efc8f0240:   0x00007f4ea3411818 {method} {0x00007f4ea3411818} 'micro_vector' '([I[I[I)V' in 'App'
  0x00007f4efc8f0248:   0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007f4efc8f0250:   0x00007f4ea361d568 {method} {0x00007f4ea361d568} 'length' '()I' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007f4efc8f0258:   0x00007f4ea3412728 {method} {0x00007f4ea3412728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007f4efc8f0260:   0x0000000800094798 'jdk/incubator/vector/AbstractSpecies'
  0x00007f4efc8f0268:   0x0000000800094370 'jdk/incubator/vector/VectorSpecies'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007f4efc8efd5f offset=ffffffff bits=0):
PcDesc(pc=0x00007f4efc8efd8c offset=2c bits=0):   App::micro_vector@-1 (line 15)
PcDesc(pc=0x00007f4efc8efd92 offset=32 bits=0):   App::micro_vector@12 (line 21)
PcDesc(pc=0x00007f4efc8efd96 offset=36 bits=0):   App::micro_vector@14 (line 21)
PcDesc(pc=0x00007f4efc8efdb6 offset=56 bits=0):   App::micro_vector@17 (line 21)
PcDesc(pc=0x00007f4efc8efdb9 offset=59 bits=0):   jdk.incubator.vector.AbstractSpecies::length@1 (line 116)
   App::micro_vector@17 (line 21)
PcDesc(pc=0x00007f4efc8efdc8 offset=68 bits=0):   App::micro_vector@25 (line 21)
PcDesc(pc=0x00007f4efc8efdd0 offset=70 bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007f4efc8efdd4 offset=74 bits=0):   App::micro_vector@95 (line 27)
PcDesc(pc=0x00007f4efc8efdf0 offset=90 bits=0):   App::micro_vector@99 (line 27)
PcDesc(pc=0x00007f4efc8efe32 offset=d2 bits=0):   App::micro_vector@89 (line 27)
PcDesc(pc=0x00007f4efc8efe41 offset=e1 bits=0):   App::micro_vector@101 (line 27)
PcDesc(pc=0x00007f4efc8efe43 offset=e3 bits=0):   App::micro_vector@102 (line 26)
PcDesc(pc=0x00007f4efc8efe48 offset=e8 bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007f4efc8efed0 offset=170 bits=0):   App::micro_vector@89 (line 27)
PcDesc(pc=0x00007f4efc8eff57 offset=1f7 bits=0):   App::micro_vector@101 (line 27)
PcDesc(pc=0x00007f4efc8eff5a offset=1fa bits=0):   App::micro_vector@102 (line 26)
PcDesc(pc=0x00007f4efc8eff66 offset=206 bits=0):   App::micro_vector@105 (line 26)
PcDesc(pc=0x00007f4efc8eff6d offset=20d bits=1):   App::micro_vector@105 (line 26)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rsi [12],int
    - l5: empty
    - l6: empty
PcDesc(pc=0x00007f4efc8eff70 offset=210 bits=0):   App::micro_vector@105 (line 26)
PcDesc(pc=0x00007f4efc8eff8c offset=22c bits=0):   App::micro_vector@89 (line 27)
PcDesc(pc=0x00007f4efc8effad offset=24d bits=0):   App::micro_vector@101 (line 27)
PcDesc(pc=0x00007f4efc8effb0 offset=250 bits=0):   App::micro_vector@102 (line 26)
PcDesc(pc=0x00007f4efc8effb5 offset=255 bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007f4efc8effbc offset=25c bits=0):   App::micro_vector@89 (line 27)
PcDesc(pc=0x00007f4efc8effcb offset=26b bits=0):   App::micro_vector@101 (line 27)
PcDesc(pc=0x00007f4efc8effcd offset=26d bits=0):   App::micro_vector@102 (line 26)
PcDesc(pc=0x00007f4efc8effd1 offset=271 bits=0):   App::micro_vector@17 (line 21)
PcDesc(pc=0x00007f4efc8f000e offset=2ae bits=0):   jdk.incubator.vector.IntVector::fromArray@8 (line 2689)
   App::micro_vector@35 (line 22)
PcDesc(pc=0x00007f4efc8f0038 offset=2d8 bits=0):   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[32],oop
    - l1: stack[40],oop
    - l2: empty
    - l3: empty
   Expression stack
    - @0: 0
    - @1: stack[48]
    - @2: reg rbp [10],int
   App::micro_vector@35 (line 22)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: stack[40],oop
    - l3: stack[24],oop
    - l4: 0
    - l5: empty
    - l6: empty
PcDesc(pc=0x00007f4efc8f004c offset=2ec bits=0):   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector@35 (line 22)
PcDesc(pc=0x00007f4efc8f0074 offset=314 bits=0):   App::micro_vector@17 (line 21)
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
    - @2: stack[28],narrowoop
PcDesc(pc=0x00007f4efc8f0088 offset=328 bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007f4efc8f00a8 offset=348 bits=1):   App::micro_vector@86 (line 26)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: 0
    - l5: empty
    - l6: empty
   Expression stack
    - @0: 0
    - @1: stack[16]
PcDesc(pc=0x00007f4efc8f00bc offset=35c bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007f4efc8f016c offset=40c bits=0):   jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
   Locals
    - l0: stack[28],narrowoop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
   Expression stack
    - @0: 0
    - @1: stack[28],narrowoop
   App::micro_vector@35 (line 22)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[32],oop
    - l3: stack[16],oop
    - l4: 0
    - l5: empty
    - l6: empty
PcDesc(pc=0x00007f4efc8f0180 offset=420 bits=0):   jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
   App::micro_vector@35 (line 22)
PcDesc(pc=0x00007f4efc8f0190 offset=430 bits=0):   App::micro_vector@12 (line 21)
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
PcDesc(pc=0x00007f4efc8f01a4 offset=444 bits=0):   App::micro_vector@12 (line 21)
PcDesc(pc=0x00007f4efc8f01b4 offset=454 bits=0):   App::micro_vector@17 (line 21)
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
PcDesc(pc=0x00007f4efc8f01c8 offset=468 bits=0):   App::micro_vector@17 (line 21)
PcDesc(pc=0x00007f4efc8f01d8 offset=478 bits=0):   jdk.incubator.vector.IntVector::fromArray@8 (line 2689)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: NULL
   App::micro_vector@35 (line 22)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
PcDesc(pc=0x00007f4efc8f01ec offset=48c bits=0):   App::micro_vector@89 (line 27)
PcDesc(pc=0x00007f4efc8f0239 offset=4d9 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 8 OopMaps

ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop } pc offsets: 525 
ImmutableOopMap {[0]=Oop [8]=Oop [24]=Oop [32]=Oop [40]=Oop } pc offsets: 728 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop [28]=NarrowOop } pc offsets: 788 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop } pc offsets: 840 
ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop [28]=NarrowOop [32]=Oop } pc offsets: 1036 
ImmutableOopMap {} pc offsets: 1072 1108 1144 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007f4efc8efd8c offset=2c):
   App::micro_vector@-1 (line 15)
ScopeDesc(pc=0x00007f4efc8efd92 offset=32):
   App::micro_vector@12 (line 21)
ScopeDesc(pc=0x00007f4efc8efd96 offset=36):
   App::micro_vector@14 (line 21)
ScopeDesc(pc=0x00007f4efc8efdb6 offset=56):
   App::micro_vector@17 (line 21)
ScopeDesc(pc=0x00007f4efc8efdb9 offset=59):
   jdk.incubator.vector.AbstractSpecies::length@1 (line 116)
ScopeDesc(pc=0x00007f4efc8efdb9 offset=59):
   App::micro_vector@17 (line 21)
ScopeDesc(pc=0x00007f4efc8efdc8 offset=68):
   App::micro_vector@25 (line 21)
ScopeDesc(pc=0x00007f4efc8efdd0 offset=70):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007f4efc8efdd4 offset=74):
   App::micro_vector@95 (line 27)
ScopeDesc(pc=0x00007f4efc8efdf0 offset=90):
   App::micro_vector@99 (line 27)
ScopeDesc(pc=0x00007f4efc8efe32 offset=d2):
   App::micro_vector@89 (line 27)
ScopeDesc(pc=0x00007f4efc8efe41 offset=e1):
   App::micro_vector@101 (line 27)
ScopeDesc(pc=0x00007f4efc8efe43 offset=e3):
   App::micro_vector@102 (line 26)
ScopeDesc(pc=0x00007f4efc8efe48 offset=e8):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007f4efc8efed0 offset=170):
   App::micro_vector@89 (line 27)
ScopeDesc(pc=0x00007f4efc8eff57 offset=1f7):
   App::micro_vector@101 (line 27)
ScopeDesc(pc=0x00007f4efc8eff5a offset=1fa):
   App::micro_vector@102 (line 26)
ScopeDesc(pc=0x00007f4efc8eff66 offset=206):
   App::micro_vector@105 (line 26)
ScopeDesc(pc=0x00007f4efc8eff6d offset=20d):
   App::micro_vector@105 (line 26)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rsi [12],int
    - l5: empty
    - l6: empty
ScopeDesc(pc=0x00007f4efc8eff70 offset=210):
   App::micro_vector@105 (line 26)
ScopeDesc(pc=0x00007f4efc8eff8c offset=22c):
   App::micro_vector@89 (line 27)
ScopeDesc(pc=0x00007f4efc8effad offset=24d):
   App::micro_vector@101 (line 27)
ScopeDesc(pc=0x00007f4efc8effb0 offset=250):
   App::micro_vector@102 (line 26)
ScopeDesc(pc=0x00007f4efc8effb5 offset=255):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007f4efc8effbc offset=25c):
   App::micro_vector@89 (line 27)
ScopeDesc(pc=0x00007f4efc8effcb offset=26b):
   App::micro_vector@101 (line 27)
ScopeDesc(pc=0x00007f4efc8effcd offset=26d):
   App::micro_vector@102 (line 26)
ScopeDesc(pc=0x00007f4efc8effd1 offset=271):
   App::micro_vector@17 (line 21)
ScopeDesc(pc=0x00007f4efc8f000e offset=2ae):
   jdk.incubator.vector.IntVector::fromArray@8 (line 2689)
ScopeDesc(pc=0x00007f4efc8f000e offset=2ae):
   App::micro_vector@35 (line 22)
ScopeDesc(pc=0x00007f4efc8f0038 offset=2d8):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[32],oop
    - l1: stack[40],oop
    - l2: empty
    - l3: empty
   Expression stack
    - @0: 0
    - @1: stack[48]
    - @2: reg rbp [10],int
ScopeDesc(pc=0x00007f4efc8f0038 offset=2d8):
   App::micro_vector@35 (line 22)
   Locals
    - l0: stack[0],oop
    - l1: stack[8],oop
    - l2: stack[40],oop
    - l3: stack[24],oop
    - l4: 0
    - l5: empty
    - l6: empty
ScopeDesc(pc=0x00007f4efc8f004c offset=2ec):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007f4efc8f004c offset=2ec):
   App::micro_vector@35 (line 22)
ScopeDesc(pc=0x00007f4efc8f0074 offset=314):
   App::micro_vector@17 (line 21)
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
    - @2: stack[28],narrowoop
ScopeDesc(pc=0x00007f4efc8f0088 offset=328):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007f4efc8f00a8 offset=348):
   App::micro_vector@86 (line 26)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: 0
    - l5: empty
    - l6: empty
   Expression stack
    - @0: 0
    - @1: stack[16]
ScopeDesc(pc=0x00007f4efc8f00bc offset=35c):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007f4efc8f016c offset=40c):
   jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
   Locals
    - l0: stack[28],narrowoop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
   Expression stack
    - @0: 0
    - @1: stack[28],narrowoop
ScopeDesc(pc=0x00007f4efc8f016c offset=40c):
   App::micro_vector@35 (line 22)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[32],oop
    - l3: stack[16],oop
    - l4: 0
    - l5: empty
    - l6: empty
ScopeDesc(pc=0x00007f4efc8f0180 offset=420):
   jdk.incubator.vector.IntVector::fromArray@2 (line 2689)
ScopeDesc(pc=0x00007f4efc8f0180 offset=420):
   App::micro_vector@35 (line 22)
ScopeDesc(pc=0x00007f4efc8f0190 offset=430):
   App::micro_vector@12 (line 21)
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
ScopeDesc(pc=0x00007f4efc8f01a4 offset=444):
   App::micro_vector@12 (line 21)
ScopeDesc(pc=0x00007f4efc8f01b4 offset=454):
   App::micro_vector@17 (line 21)
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
ScopeDesc(pc=0x00007f4efc8f01c8 offset=468):
   App::micro_vector@17 (line 21)
ScopeDesc(pc=0x00007f4efc8f01d8 offset=478):
   jdk.incubator.vector.IntVector::fromArray@8 (line 2689)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
   Expression stack
    - @0: empty
    - @1: empty
    - @2: NULL
ScopeDesc(pc=0x00007f4efc8f01d8 offset=478):
   App::micro_vector@35 (line 22)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
    - l5: empty
    - l6: empty
ScopeDesc(pc=0x00007f4efc8f01ec offset=48c):
   App::micro_vector@89 (line 27)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007f4efc8efc88: 6014
relocInfo@0x00007f4efc8efc88 [type=6(runtime_call) addr=0x00007f4efc8efd74 offset=20] | [destination=0x00007f4efc8adc20]
         @0x00007f4efc8efc8a: f002cc31
relocInfo@0x00007f4efc8efc8c [type=12(metadata) addr=0x00007f4efc8efda5 offset=49 format=3 data=2] | [metadata_addr=0x00007f4efc8f0248 *=0x0000000800094b80 offset=0]metadata_value=0x0000000800094b80: 'jdk/incubator/vector/IntVector$IntSpecies'
         @0x00007f4efc8efc8e: a1c8
relocInfo@0x00007f4efc8efc8e [type=10(poll) addr=0x00007f4efc8eff6d offset=456]
         @0x00007f4efc8efc90: b06c
relocInfo@0x00007f4efc8efc90 [type=11(poll_return) addr=0x00007f4efc8effd9 offset=108]
         @0x00007f4efc8efc92: c00e
relocInfo@0x00007f4efc8efc92 [type=12(metadata) addr=0x00007f4efc8effe7 offset=14] | [metadata_addr=0x00007f4efc8effe9 *=0x0000000800094798 offset=0]metadata_value=0x0000000800094798: 'jdk/incubator/vector/AbstractSpecies'
         @0x00007f4efc8efc94: 644c
relocInfo@0x00007f4efc8efc94 [type=6(runtime_call) addr=0x00007f4efc8f0033 offset=76 format=1] | [destination=0x00007f4efc8b11c0]
         @0x00007f4efc8efc96: f803060747b87f4f7005
relocInfo@0x00007f4efc8efc9e [type=7(external_word) addr=0x00007f4efc8f0038 offset=5 data={060747b87f4f}] | [target=0x00007f4f060747b8]
         @0x00007f4efc8efca0: 640e
relocInfo@0x00007f4efc8efca0 [type=6(runtime_call) addr=0x00007f4efc8f0046 offset=14 format=1] | [destination=0x00007f4f05839ff4]
         @0x00007f4efc8efca2: 6429
relocInfo@0x00007f4efc8efca2 [type=6(runtime_call) addr=0x00007f4efc8f006f offset=41 format=1] | [destination=0x00007f4efc8b11c0]
         @0x00007f4efc8efca4: f803060747b87f4f7005
relocInfo@0x00007f4efc8efcac [type=7(external_word) addr=0x00007f4efc8f0074 offset=5 data={060747b87f4f}] | [target=0x00007f4f060747b8]
         @0x00007f4efc8efcae: 640e
relocInfo@0x00007f4efc8efcae [type=6(runtime_call) addr=0x00007f4efc8f0082 offset=14 format=1] | [destination=0x00007f4f05839ff4]
         @0x00007f4efc8efcb0: 6421
relocInfo@0x00007f4efc8efcb0 [type=6(runtime_call) addr=0x00007f4efc8f00a3 offset=33 format=1] | [destination=0x00007f4efc8b11c0]
         @0x00007f4efc8efcb2: f803060747b87f4f7005
relocInfo@0x00007f4efc8efcba [type=7(external_word) addr=0x00007f4efc8f00a8 offset=5 data={060747b87f4f}] | [target=0x00007f4f060747b8]
         @0x00007f4efc8efcbc: 640e
relocInfo@0x00007f4efc8efcbc [type=6(runtime_call) addr=0x00007f4efc8f00b6 offset=14 format=1] | [destination=0x00007f4f05839ff4]
         @0x00007f4efc8efcbe: f8030620c0787f4f7006
relocInfo@0x00007f4efc8efcc6 [type=7(external_word) addr=0x00007f4efc8f00bc offset=6 data={0620c0787f4f}] | [target=0x00007f4f0620c078]
         @0x00007f4efc8efcc8: 640e
relocInfo@0x00007f4efc8efcc8 [type=6(runtime_call) addr=0x00007f4efc8f00ca offset=14 format=1] | [destination=0x00007f4f05839ff4]
         @0x00007f4efc8efcca: f8030620c0787f4f7006
relocInfo@0x00007f4efc8efcd2 [type=7(external_word) addr=0x00007f4efc8f00d0 offset=6 data={0620c0787f4f}] | [target=0x00007f4f0620c078]
         @0x00007f4efc8efcd4: 640e
relocInfo@0x00007f4efc8efcd4 [type=6(runtime_call) addr=0x00007f4efc8f00de offset=14 format=1] | [destination=0x00007f4f05839ff4]
         @0x00007f4efc8efcd6: f8030620c0787f4f7006
relocInfo@0x00007f4efc8efcde [type=7(external_word) addr=0x00007f4efc8f00e4 offset=6 data={0620c0787f4f}] | [target=0x00007f4f0620c078]
         @0x00007f4efc8efce0: 640e
relocInfo@0x00007f4efc8efce0 [type=6(runtime_call) addr=0x00007f4efc8f00f2 offset=14 format=1] | [destination=0x00007f4f05839ff4]
         @0x00007f4efc8efce2: f8030620c0787f4f7006
relocInfo@0x00007f4efc8efcea [type=7(external_word) addr=0x00007f4efc8f00f8 offset=6 data={0620c0787f4f}] | [target=0x00007f4f0620c078]
         @0x00007f4efc8efcec: 640e
relocInfo@0x00007f4efc8efcec [type=6(runtime_call) addr=0x00007f4efc8f0106 offset=14 format=1] | [destination=0x00007f4f05839ff4]
         @0x00007f4efc8efcee: f8030620c0787f4f7006
relocInfo@0x00007f4efc8efcf6 [type=7(external_word) addr=0x00007f4efc8f010c offset=6 data={0620c0787f4f}] | [target=0x00007f4f0620c078]
         @0x00007f4efc8efcf8: 640e
relocInfo@0x00007f4efc8efcf8 [type=6(runtime_call) addr=0x00007f4efc8f011a offset=14 format=1] | [destination=0x00007f4f05839ff4]
         @0x00007f4efc8efcfa: f8030620c0787f4f7006
relocInfo@0x00007f4efc8efd02 [type=7(external_word) addr=0x00007f4efc8f0120 offset=6 data={0620c0787f4f}] | [target=0x00007f4f0620c078]
         @0x00007f4efc8efd04: 640e
relocInfo@0x00007f4efc8efd04 [type=6(runtime_call) addr=0x00007f4efc8f012e offset=14 format=1] | [destination=0x00007f4f05839ff4]
         @0x00007f4efc8efd06: f8030620c0787f4f7006
relocInfo@0x00007f4efc8efd0e [type=7(external_word) addr=0x00007f4efc8f0134 offset=6 data={0620c0787f4f}] | [target=0x00007f4f0620c078]
         @0x00007f4efc8efd10: 640e
relocInfo@0x00007f4efc8efd10 [type=6(runtime_call) addr=0x00007f4efc8f0142 offset=14 format=1] | [destination=0x00007f4f05839ff4]
         @0x00007f4efc8efd12: 6425
relocInfo@0x00007f4efc8efd12 [type=6(runtime_call) addr=0x00007f4efc8f0167 offset=37 format=1] | [destination=0x00007f4efc8b11c0]
         @0x00007f4efc8efd14: f803060747b87f4f7005
relocInfo@0x00007f4efc8efd1c [type=7(external_word) addr=0x00007f4efc8f016c offset=5 data={060747b87f4f}] | [target=0x00007f4f060747b8]
         @0x00007f4efc8efd1e: 640e
relocInfo@0x00007f4efc8efd1e [type=6(runtime_call) addr=0x00007f4efc8f017a offset=14 format=1] | [destination=0x00007f4f05839ff4]
         @0x00007f4efc8efd20: 6411
relocInfo@0x00007f4efc8efd20 [type=6(runtime_call) addr=0x00007f4efc8f018b offset=17 format=1] | [destination=0x00007f4efc8b11c0]
         @0x00007f4efc8efd22: f803060747b87f4f7005
relocInfo@0x00007f4efc8efd2a [type=7(external_word) addr=0x00007f4efc8f0190 offset=5 data={060747b87f4f}] | [target=0x00007f4f060747b8]
         @0x00007f4efc8efd2c: 640e
relocInfo@0x00007f4efc8efd2c [type=6(runtime_call) addr=0x00007f4efc8f019e offset=14 format=1] | [destination=0x00007f4f05839ff4]
         @0x00007f4efc8efd2e: 6411
relocInfo@0x00007f4efc8efd2e [type=6(runtime_call) addr=0x00007f4efc8f01af offset=17 format=1] | [destination=0x00007f4efc8b11c0]
         @0x00007f4efc8efd30: f803060747b87f4f7005
relocInfo@0x00007f4efc8efd38 [type=7(external_word) addr=0x00007f4efc8f01b4 offset=5 data={060747b87f4f}] | [target=0x00007f4f060747b8]
         @0x00007f4efc8efd3a: 640e
relocInfo@0x00007f4efc8efd3a [type=6(runtime_call) addr=0x00007f4efc8f01c2 offset=14 format=1] | [destination=0x00007f4f05839ff4]
         @0x00007f4efc8efd3c: 6411
relocInfo@0x00007f4efc8efd3c [type=6(runtime_call) addr=0x00007f4efc8f01d3 offset=17 format=1] | [destination=0x00007f4efc8b11c0]
         @0x00007f4efc8efd3e: f803060747b87f4f7005
relocInfo@0x00007f4efc8efd46 [type=7(external_word) addr=0x00007f4efc8f01d8 offset=5 data={060747b87f4f}] | [target=0x00007f4f060747b8]
         @0x00007f4efc8efd48: 640e
relocInfo@0x00007f4efc8efd48 [type=6(runtime_call) addr=0x00007f4efc8f01e6 offset=14 format=1] | [destination=0x00007f4f05839ff4]
         @0x00007f4efc8efd4a: f2138006
relocInfo@0x00007f4efc8efd4c [type=8(internal_word) addr=0x00007f4efc8f01ec offset=6 data=531] | [target=0x00007f4efc8effd9]
         @0x00007f4efc8efd4e: 6411
relocInfo@0x00007f4efc8efd4e [type=6(runtime_call) addr=0x00007f4efc8f01fd offset=17 format=1] | [destination=0x00007f4efc8b0020]
         @0x00007f4efc8efd50: 0023
relocInfo@0x00007f4efc8efd50 [type=0(none) addr=0x00007f4efc8f0220 offset=35]
         @0x00007f4efc8efd52: 6400
relocInfo@0x00007f4efc8efd52 [type=6(runtime_call) addr=0x00007f4efc8f0220 offset=0 format=1] | [destination=0x00007f4efc7f4fa0]
         @0x00007f4efc8efd54: 640f
relocInfo@0x00007f4efc8efd54 [type=6(runtime_call) addr=0x00007f4efc8f022f offset=15 format=1] | [destination=0x00007f4efc8b14e0]
         @0x00007f4efc8efd56: 0000
relocInfo@0x00007f4efc8efd56 [type=0(none) addr=0x00007f4efc8f022f offset=0]
         @0x00007f4efc8efd58: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
Dependency of type abstract_with_unique_concrete_subtype
  context = *jdk.incubator.vector.AbstractSpecies
  class   = jdk.incubator.vector.IntVector$IntSpecies
   [nmethod<=klass]jdk.incubator.vector.AbstractSpecies
Dependency of type unique_concrete_method
  context = *jdk.incubator.vector.VectorSpecies
  method  = {method} {0x00007f4ea361d568} 'length' '()I' in 'jdk/incubator/vector/AbstractSpecies'
   [nmethod<=klass]jdk.incubator.vector.VectorSpecies
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 5 entries, 44 bytes):
{
   < 0x00007f4efc8efd8f, 0x00007f4efc8f0180 > < 0x00007f4efc8efda0, 0x00007f4efc8f01a4 > < 0x00007f4efc8efdd0, 0x00007f4efc8f0088 > 
   < 0x00007f4efc8efdec, 0x00007f4efc8f0088 > < 0x00007f4efc8f000b, 0x00007f4efc8f01c8 > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x000000010110de40 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de40}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
#0: 0x0000000000000000 NULL-oop
#1: 0x00007f4ea3411818 {method} {0x00007f4ea3411818} 'micro_vector' '([I[I[I)V' in 'App'
#2: 0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
#3: 0x00007f4ea361d568 {method} {0x00007f4ea361d568} 'length' '()I' in 'jdk/incubator/vector/AbstractSpecies'
#4: 0x00007f4ea3412728 {method} {0x00007f4ea3412728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#5: 0x0000000800094798 'jdk/incubator/vector/AbstractSpecies'
#6: 0x0000000800094370 'jdk/incubator/vector/VectorSpecies'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VECTOR : [Time] 3 ms   [Res] 99990000000
VECTOR_MASKED : [Time] 26 ms   [Res] 999900000000
------------------------------------------------------------------------
App::micro_vector([I[I[I)V
  interpreter_invocation_count:      198 
  invocation_counter:              10000 
  backedge_counter:                 5381 
  mdo size: 880 bytes

0 iconst_0
1 istore #4
3 aconst_null
4 astore #5
6 aconst_null
7 astore #6
9 fast_iload #4
11 aload_1
12 arraylength
13 fast_aaccess_0
14 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
17 invokeinterface 18 <jdk/incubator/vector/VectorSpecies.length()I> 
  0   bci: 17   VirtualCallData     count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/IntVector$IntSpecies'(197 1.00)
22 iconst_1
23 isub
24 iand
25 if_icmpge 82
  56  bci: 25   BranchData          taken(197) displacement(256)
                                    not taken(0)
28 aload_0
29 getfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
32 aload_2
33 iload #4
35 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  88  bci: 35   CounterData         count(0)
38 astore #5
40 aload_0
41 getfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
44 aload_3
45 iload #4
47 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  104 bci: 47   CounterData         count(0)
50 astore #6
52 aload #5
54 aload #6
56 invokevirtual 28 <jdk/incubator/vector/IntVector.add(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;> 
  120 bci: 56   VirtualCallData     count(0) nonprofiled_count(0) entries(0)
59 aload_1
60 iload #4
62 invokevirtual 32 <jdk/incubator/vector/IntVector.intoArray([II)V> 
  176 bci: 62   VirtualCallData     count(0) nonprofiled_count(0) entries(0)
65 iload #4
67 aload_0
68 getfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
71 invokeinterface 18 <jdk/incubator/vector/VectorSpecies.length()I> 
  232 bci: 71   VirtualCallData     count(0) nonprofiled_count(0) entries(0)
76 iadd
77 istore #4
79 goto 9
  288 bci: 79   JumpData            taken(0) displacement(-288)
82 fast_iload #4
84 aload_1
85 arraylength
86 if_icmpge 108
  312 bci: 86   BranchData          taken(198) displacement(56)
                                    not taken(1976701)
89 aload_1
90 fast_iload #4
92 aload_2
93 fast_iload #4
95 iaload
96 aload_3
97 fast_iload #4
99 iaload
100 iadd
101 iastore
102 iinc #4 1
105 goto 82
  344 bci: 105  JumpData            taken(1976701) displacement(-32)
108 return
------------------------------------------------------------------------
Total MDO size: 880 bytes
