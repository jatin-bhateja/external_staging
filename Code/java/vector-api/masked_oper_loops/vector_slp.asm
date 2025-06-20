CompileCommand: print App.micro_vector bool print = true
SCALAR : [Time] 240 ms   [Res] 99999000000000

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 227 ------------------------
{method}
 - this oop:          0x00007fc7b9c11818
 - method holder:     'App'
 - constants:         0x00007fc7b9c11090 constant pool [134]/operands[15] {0x00007fc7b9c11090} for 'App' cache=0x00007fc7b9f00000
 - access:            0xc1000001  public 
 - name:              'micro_vector'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        7
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007fc81100e220
 - adapters:          AHE@0x00007fc8143c5270: 0xbbbb0000 i2c: 0x00007fc81107ffe0 c2i: 0x00007fc8110800cc c2iUV: 0x00007fc811080096 c2iNCI: 0x00007fc811080109
 - compiled entry     0x00007fc8110800cc
 - code size:         106
 - code start:        0x00007fc7b9c11798
 - code end (excl):   0x00007fc7b9c11802
 - method data:       0x00007fc7b9f00bb8
 - checked ex length: 0
 - linenumber start:  0x00007fc7b9c11802
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
000     N625: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
000     movl    rscratch1, [j_rarg0 + oopDesc::klass_offset_in_bytes()]	# compressed klass
	decode_klass_not_null rscratch1, rscratch1
	cmpq    rax, rscratch1	 # Inline cache check
	jne     SharedRuntime::_ic_miss_stub
	nop	# nops to align entry point

        nop 	# 4 bytes pad for loops and calls

020     B1: #	out( B64 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
020     # stack bang (512 bytes)
	pushq   rbp	# Save rbp
	subq    rsp, #176	# Create frame

02f     movdq   XMM1, RSI	# spill
034     movl    R11, [RDX + #12 (8-bit)]	# range
038     NullCheck RDX

038     B2: #	out( B65 B3 ) <- in( B1 )  Freq: 0.999999
038     movl    RBP, [RSI + #12 (8-bit)]	# compressed ptr ! Field: App.SPECIES
        nop 	# 5 bytes pad for loops and calls
040     movl    R9, [R12 + RBP << 3 + #8] (compressed oop addressing)	# compressed klass ptr
045     NullCheck RBP

045     B3: #	out( B53 B4 ) <- in( B2 )  Freq: 0.999998
045     cmpl    R9, narrowklass: precise klass jdk/incubator/vector/IntVector$IntSpecies: 0x00007fc798499be0:Constant:exact *	# compressed klass ptr
04c     jne,u   B53  P=0.000001 C=-1.000000

052     B4: #	out( B55 B5 ) <- in( B3 )  Freq: 0.999997
052     decode_heap_oop_not_null RBX,RBP
056     # checkcastPP of RBX
056     movl    RAX, [RBX + #12 (8-bit)]	# int ! Field: jdk/incubator/vector/AbstractSpecies.laneCount (constant)
059     movl    R10, RAX	# spill
05c     decl    R10	# int
05f     movl    RBP, RAX	# spill
061     andl    RBP, R10	# int
064     testl   RBP, RBP
066     jne     B55  P=0.000000 C=15460.000000

06c     B5: #	out( B52 B6 ) <- in( B4 )  Freq: 0.999996
06c     andnl  R10, R10, R11
071     movl    RBP, R11	# spill
074     addl    RBP, #-15	# int
077     # TLS is in R15
077     xorl    RSI, RSI	# int
079     testl   R10, R10
        nop 	# 4 bytes pad for loops and calls
080     jle     B52  P=0.000159 C=194651.000000

086     B6: #	out( B54 B7 ) <- in( B5 )  Freq: 0.999837
086     movl    R9, [RCX + #12 (8-bit)]	# range
08a     NullCheck RCX

08a     B7: #	out( B54 B8 ) <- in( B6 )  Freq: 0.999836
08a     subl    R9, RAX	# int
08d     incl    R9	# int
090     testl   R9, R9
093     jl     B54  P=0.000001 C=-1.000000

099     B8: #	out( B54 B9 ) <- in( B7 )  Freq: 0.999835
099     movl    RDI, [RBX + #68 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.dummyVector (constant)
        nop 	# 4 bytes pad for loops and calls
0a0     movl    RDI, [R12 + RDI << 3 + #8] (compressed oop addressing)	# compressed klass ptr
0a5     NullCheck RDI

0a5     B9: #	out( B54 B10 ) <- in( B8 )  Freq: 0.999834
0a5     cmpl    RDI, narrowklass: precise klass jdk/incubator/vector/Int512Vector: 0x00007fc784055b10:Constant:exact *	# compressed klass ptr
0ab     jne,u   B54  P=0.000001 C=-1.000000

0b1     B10: #	out( B54 B11 ) <- in( B9 )  Freq: 0.999833
0b1     movl    RDI, [R8 + #12 (8-bit)]	# range
0b5     NullCheck R8

0b5     B11: #	out( B54 B12 ) <- in( B10 )  Freq: 0.999832
0b5     subl    RDI, RAX	# int
0b7     incl    RDI	# int
0b9     testl   RDI, RDI
        nop 	# 5 bytes pad for loops and calls
0c0     jl     B54  P=0.000001 C=-1.000000

0c6     B12: #	out( B54 B13 ) <- in( B11 )  Freq: 0.999831
0c6     testl   RBP, RBP
0c8     jl     B54  P=0.000001 C=-1.000000

0ce     B13: #	out( B14 ) <- in( B12 )  Freq: 0.99983
0ce     movdq   XMM0, RBX	# spill
0d3     movl    R13, R11	# spill
0d6     # castII of RDI
0d6     # castII of R9
0d6     movl    R11, RBP	# spill
0d9     # castII of R11
0d9     xorl    RBX, RBX	# int
        nop 	# 5 bytes pad for loops and calls

0e0     B14: #	out( B49 B15 ) <- in( B13 B17 ) Loop( B14-B17 inner ) Freq: 6160.27
0e0     cmpl    RBX, R9	# unsigned
0e3     jnb,u   B49  P=0.000001 C=-1.000000

0e9     B15: #	out( B50 B16 ) <- in( B14 )  Freq: 6160.26
0e9     # castII of RBX
0e9     load_vector XMM2,[RCX + #16 + RBX << #2]
0f4     cmpl    RBX, RDI	# unsigned
0f6     jnb,u   B50  P=0.000001 C=-1.000000

0fc     B16: #	out( B51 B17 ) <- in( B15 )  Freq: 6160.26
0fc     vpaddd  XMM2,XMM2,[R8 + #16 + RBX << #2]	! add packedI
107     cmpl    RBX, R11	# unsigned
10a     jnb,u   B51  P=0.000001 C=-1.000000

110     B17: #	out( B14 B18 ) <- in( B16 )  Freq: 6160.25
110     store_vector [RDX + #16 + RBX << #2],XMM2
	
11b     movq    R14, [R15 + #304 (32-bit)]	# ptr
122     addl    RBX, RAX	# int
124     testl   rax, [R14]	# Safepoint: poll for GC        # App::micro_vector @ bci:76 (line 20) L[0]=XMM1 L[1]=RDX L[2]=RCX L[3]=R8 L[4]=RBX L[5]=_ L[6]=_
        # OopMap {r8=Oop rcx=Oop rdx=Oop xmm0=Oop xmm1=Oop off=292/0x124}
127     cmpl    RBX, R10
12a     jl,s   B14  P=0.999841 C=194619.000000

12c     B18: #	out( B19 ) <- in( B17 )  Freq: 0.981104
12c     movl    R11, R13	# spill

12f     B19: #	out( B48 B20 ) <- in( B18 B52 )  Freq: 0.981263
12f     cmpl    RBX, R11
132     jge     B48  P=0.500000 C=-1.000000

138     B20: #	out( B56 B21 ) <- in( B19 )  Freq: 0.490632
        nop 	# 8 bytes pad for loops and calls
140     movl    R10, [RCX + #12 (8-bit)]	# range
144     NullCheck RCX

144     B21: #	out( B56 B22 ) <- in( B20 )  Freq: 0.490631
144     cmpl    RBX, R10	# unsigned
147     jnb,u   B56  P=0.000001 C=-1.000000

14d     B22: #	out( B56 B23 ) <- in( B21 )  Freq: 0.490631
14d     movl    RAX, R11	# spill
150     decl    RAX	# int
152     cmpl    RAX, R10	# unsigned
155     jnb,u   B56  P=0.000001 C=-1.000000

15b     B23: #	out( B56 B24 ) <- in( B22 )  Freq: 0.49063
        nop 	# 5 bytes pad for loops and calls
160     movl    R9, [R8 + #12 (8-bit)]	# range
164     NullCheck R8

164     B24: #	out( B56 B25 ) <- in( B23 )  Freq: 0.49063
164     cmpl    RBX, R9	# unsigned
167     jnb,u   B56  P=0.000001 C=-1.000000

16d     B25: #	out( B56 B26 ) <- in( B24 )  Freq: 0.490629
16d     cmpl    RAX, R9	# unsigned
170     jnb,u   B56  P=0.000001 C=-1.000000

176     B26: #	out( B56 B27 ) <- in( B25 )  Freq: 0.490629
176     cmpl    RBX, R11	# unsigned
179     jnb,u   B56  P=0.000001 C=-1.000000

17f     B27: #	out( B56 B28 ) <- in( B26 )  Freq: 0.490628
        nop 	# 1 bytes pad for loops and calls
180     cmpl    RAX, R11	# unsigned
183     jnb,u   B56  P=0.000001 C=-1.000000

189     B28: #	out( B29 ) <- in( B27 )  Freq: 0.490628
189     movl    RAX, RDX	# ptr -> int
18b     shrl    RAX, #2
18e     andl    RAX, #15	# int
191     addl    RAX, RBX	# int
193     movl    RDI, #11	# int
198     subl    RDI, RAX	# int
19a     andl    RDI, #15	# int
19d     addl    RDI, RBX	# int
19f     incl    RDI	# int
1a1     cmpl    RDI, R11
1a4     cmovlgt RDI, R11	# min

1a8     B29: #	out( B29 B30 ) <- in( B28 B29 ) Loop( B29-B29 inner pre of N1916) Freq: 4.90627
1a8     movl    RAX, [R8 + #16 + RBX << #2]	# int
1ad     addl    RAX, [RCX + #16 + RBX << #2]	# int
1b1     movl    [RDX + #16 + RBX << #2], RAX	# int
1b5     incl    RBX	# int
1b7     cmpl    RBX, RDI
1b9     jl,s   B29	# loop end  P=0.900000 C=-1.000000

1bb     B30: #	out( B45 B31 ) <- in( B29 )  Freq: 0.490628
1bb     movl    RAX, R11	# spill
1be     addl    RAX, #-63	# int
1c1     cmpl    RBX, RAX
1c3     jge     B45  P=0.000001 C=-1.000000

1c9     B31: #	out( B57 B32 ) <- in( B30 )  Freq: 0.490627
1c9     # castII of RBX
1c9     cmpl    RBX, R11	# unsigned
1cc     jnb,u   B57  P=0.000001 C=-1.000000

1d2     B32: #	out( B58 B33 ) <- in( B31 )  Freq: 0.490627
1d2     cmpl    RBX, R9	# unsigned
1d5     jnb,u   B58  P=0.000001 C=-1.000000

1db     B33: #	out( B59 B34 ) <- in( B32 )  Freq: 0.490626
        nop 	# 5 bytes pad for loops and calls
1e0     cmpl    RBX, R10	# unsigned
1e3     jnb,u   B59  P=0.000001 C=-1.000000

1e9     B34: #	out( B60 B35 ) <- in( B33 )  Freq: 0.490626
1e9     movl    RDI, RBX	# spill
1eb     addl    RDI, #63	# int
1ee     cmpl    RDI, R10	# unsigned
1f1     jnb,u   B60  P=0.000001 C=-1.000000

1f7     B35: #	out( B61 B36 ) <- in( B34 )  Freq: 0.490625
1f7     cmpl    RDI, R9	# unsigned
        nop 	# 6 bytes pad for loops and calls
200     jnb,u   B61  P=0.000001 C=-1.000000

206     B36: #	out( B62 B37 ) <- in( B35 )  Freq: 0.490625
206     cmpl    RBX, R11	# unsigned
209     jnb,u   B62  P=0.000001 C=-1.000000

20f     B37: #	out( B63 B38 ) <- in( B36 )  Freq: 0.490624
20f     cmpl    RDI, R11	# unsigned
212     jnb,u   B63  P=0.000001 C=-1.000000

218     B38: #	out( B39 ) <- in( B37 )  Freq: 0.490624
218     movl    R9, #64000	# int

21e     B39: #	out( B40 ) <- in( B38 B41 ) Loop( B39-B41 ) Freq: 4.90624
21e     movl    R10, R11	# spill
221     subl    R10, RBX	# int
224     addl    R10, #-63	# int
228     cmpl    RAX, RBX
22a     cmovll R10, RSI	# signed, int
22e     cmpl    R10, #64000	# unsigned
235     cmovlnbe R10, R9	# unsigned, int
239     addl    R10, RBX	# int
        nop 	# 4 bytes pad for loops and calls

240     B40: #	out( B40 B41 ) <- in( B39 B40 ) Loop( B40-B40 inner main of N298 strip mined) Freq: 49.0623
240     load_vector XMM0,[RCX + #16 + RBX << #2]
24b     vpaddd  XMM0,XMM0,[R8 + #16 + RBX << #2]	! add packedI
256     store_vector [RDX + #16 + RBX << #2],XMM0
	
261     movslq  RDI, RBX	# i2l
264     load_vector XMM0,[RCX + #80 + RDI << #2]
26f     vpaddd  XMM0,XMM0,[R8 + #80 + RDI << #2]	! add packedI
27a     store_vector [RDX + #80 + RDI << #2],XMM0
	
285     load_vector XMM0,[RCX + #144 + RDI << #2]
290     vpaddd  XMM0,XMM0,[R8 + #144 + RDI << #2]	! add packedI
29b     store_vector [RDX + #144 + RDI << #2],XMM0
	
2a6     load_vector XMM0,[RCX + #208 + RDI << #2]
2b1     vpaddd  XMM0,XMM0,[R8 + #208 + RDI << #2]	! add packedI
2bc     store_vector [RDX + #208 + RDI << #2],XMM0
	
2c7     addl    RBX, #64	# int
2ca     cmpl    RBX, R10
2cd     jl     B40	# loop end  P=0.900000 C=-1.000000

2d3     B41: #	out( B39 B42 ) <- in( B40 )  Freq: 4.90624
2d3     movq    R10, [R15 + #304 (32-bit)]	# ptr
2da     testl   rax, [R10]	# Safepoint: poll for GC        # App::micro_vector @ bci:102 (line 25) L[0]=_ L[1]=RDX L[2]=RCX L[3]=R8 L[4]=RBX L[5]=_ L[6]=_
        # OopMap {r8=Oop rcx=Oop rdx=Oop off=730/0x2da}
        nop 	# 3 bytes pad for loops and calls
2e0     cmpl    RBX, RAX
2e2     jl     B39  P=0.900000 C=-1.000000

2e8     B42: #	out( B45 B43 ) <- in( B41 )  Freq: 0.490624
2e8     cmpl    RBX, RBP
2ea     jge,s   B45  P=0.500000 C=-1.000000

2ec     B43: #	out( B44 ) <- in( B42 )  Freq: 0.245312
2ec     # castII of RBX

2ec     B44: #	out( B44 B45 ) <- in( B43 B44 ) Loop( B44-B44 inner post of N2802) Freq: 2.45312
2ec     load_vector XMM0,[RCX + #16 + RBX << #2]
2f7     vpaddd  XMM0,XMM0,[R8 + #16 + RBX << #2]	! add packedI
302     store_vector [RDX + #16 + RBX << #2],XMM0
	
30d     addl    RBX, #16	# int
310     cmpl    RBX, RBP
312     jl,s   B44	# loop end  P=0.900000 C=-1.000000

314     B45: #	out( B48 B46 ) <- in( B30 B44 B42 )  Freq: 0.490624
314     cmpl    RBX, R11
317     jge,s   B48  P=0.500000 C=-1.000000

319     B46: #	out( B47 ) <- in( B45 )  Freq: 0.245312
319     # castII of RBX
        nop 	# 3 bytes pad for loops and calls

31c     B47: #	out( B47 B48 ) <- in( B46 B47 ) Loop( B47-B47 inner post of N1916) Freq: 2.45312
31c     movl    R9, [R8 + #16 + RBX << #2]	# int
321     addl    R9, [RCX + #16 + RBX << #2]	# int
326     movl    [RDX + #16 + RBX << #2], R9	# int
32b     incl    RBX	# int
32d     cmpl    RBX, R11
330     jl,s   B47	# loop end  P=0.900000 C=-1.000000

332     B48: #	out( N625 ) <- in( B47 B45 B19 )  Freq: 0.981256
332     vzeroupper
	addq    rsp, 176	# Destroy frame
	popq    rbp
	cmpq     rsp, poll_offset[r15_thread] 
	ja       #safepoint_stub	# Safepoint: poll for GC

34a     ret

34b     B49: #	out( N625 ) <- in( B14 )  Freq: 0.00624207
34b     movl    RSI, #-28	# int
350     movdq   RBP, XMM1	# spill
355     movq    [rsp + #0], RDX	# spill
359     movq    [rsp + #16], R8	# spill
35e     movq    [rsp + #32], RCX	# spill
363     movl    [rsp + #28], RBX	# spill
367     movl    [rsp + #40], R9	# spill
36c     movsd   [rsp + #48], XMM0	# spill
        nop 	# 2 bytes pad for loops and calls
374     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #28 STK[1]=rsp + #40 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2689) L[0]=rsp + #48 L[1]=rsp + #32 L[2]=_ L[3]=_
        # App::micro_vector @ bci:32 (line 21) L[0]=RBP L[1]=rsp + #0 L[2]=rsp + #32 L[3]=rsp + #16 L[4]=rsp + #28 L[5]=_ L[6]=_
        # OopMap {rbp=Oop [0]=Oop [16]=Oop [32]=Oop [48]=Oop off=892/0x37c}
37c     stop	# ShouldNotReachHere

390     B50: #	out( N625 ) <- in( B15 )  Freq: 0.00624207
390     movl    RSI, #-28	# int
395     movdq   RBP, XMM1	# spill
39a     movq    [rsp + #0], RDX	# spill
39e     movq    [rsp + #8], RCX	# spill
3a3     movq    [rsp + #32], R8	# spill
3a8     movl    [rsp + #28], RBX	# spill
3ac     movl    [rsp + #40], RDI	# spill
3b0     vmovdqu [rsp + 96],XMM2	# spill
3bb     movsd   [rsp + #48], XMM0	# spill
        nop 	# 3 bytes pad for loops and calls
3c4     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #28 STK[1]=rsp + #40 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2689) L[0]=rsp + #48 L[1]=rsp + #32 L[2]=_ L[3]=_
        # App::micro_vector @ bci:44 (line 22) L[0]=RBP L[1]=rsp + #0 L[2]=rsp + #8 L[3]=rsp + #32 L[4]=rsp + #28 L[5]=#ScObj0 L[6]=_
        # ScObj0 jdk/incubator/vector/Int512Vector={ [payload :0]=rsp + #96 }
        # OopMap {rbp=Oop [0]=Oop [8]=Oop [32]=Oop [48]=Oop off=972/0x3cc}
3cc     stop	# ShouldNotReachHere

3e0     B51: #	out( N625 ) <- in( B16 )  Freq: 0.00624206
3e0     movl    RSI, #-28	# int
3e5     movdq   RBP, XMM1	# spill
3ea     movq    [rsp + #8], RCX	# spill
3ef     movq    [rsp + #16], R8	# spill
3f4     movq    [rsp + #32], RDX	# spill
3f9     movl    [rsp + #28], RBX	# spill
3fd     movl    [rsp + #40], R11	# spill
402     vmovdqu [rsp + 96],XMM2	# spill
        nop 	# 3 bytes pad for loops and calls
410     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #28 STK[1]=rsp + #40 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:7 (line 2960) L[0]=#ScObj0 L[1]=rsp + #32 L[2]=_ L[3]=_
        # ScObj0 jdk/incubator/vector/Int512Vector={ [payload :0]=rsp + #96 }
        # App::micro_vector @ bci:59 (line 23) L[0]=RBP L[1]=rsp + #32 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=rsp + #28 L[5]=_ L[6]=_
        # OopMap {rbp=Oop [8]=Oop [16]=Oop [32]=Oop off=1048/0x418}
418     stop	# ShouldNotReachHere

42c     B52: #	out( B19 ) <- in( B5 )  Freq: 0.000159259
42c     xorl    RBX, RBX	# int
42e     jmp     B19

433     B53: #	out( N625 ) <- in( B3 )  Freq: 9.99998e-07
433     movl    RSI, #-34	# int
438     movsd   [rsp + #0], XMM1	# spill
43d     movq    [rsp + #8], RDX	# spill
442     movq    [rsp + #16], RCX	# spill
447     movq    [rsp + #24], R8	# spill
44c     movl    [rsp + #32], R11	# spill
        nop 	# 3 bytes pad for loops and calls
454     call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:17 (line 20) L[0]=rsp + #0 L[1]=rsp + #8 L[2]=rsp + #16 L[3]=rsp + #24 L[4]=#0 L[5]=_ L[6]=_ STK[0]=#0 STK[1]=RBP STK[2]=rsp + #32
        # OopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop off=1116/0x45c}
45c     stop	# ShouldNotReachHere

470     B54: #	out( N625 ) <- in( B11 B12 B6 B7 B8 B9 B10 )  Freq: 7.03867e-06
470     movl    RSI, #-138	# int
475     movdq   RBP, XMM1	# spill
47a     movq    [rsp + #0], RDX	# spill
47e     movq    [rsp + #8], RCX	# spill
483     movq    [rsp + #16], R8	# spill
488     movl    [rsp + #24], R10	# spill
        nop 	# 3 bytes pad for loops and calls
490     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:22 (line 20) L[0]=RBP L[1]=rsp + #0 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=#0 L[5]=_ L[6]=_ STK[0]=#0 STK[1]=rsp + #24
        # OopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop off=1176/0x498}
498     stop	# ShouldNotReachHere

4ac     B55: #	out( N625 ) <- in( B4 )  Freq: 4.99998e-07
4ac     movl    RSI, #-187	# int
4b1     movsd   [rsp + #0], XMM1	# spill
4b6     movq    [rsp + #8], RDX	# spill
4bb     movq    [rsp + #16], RCX	# spill
4c0     movq    [rsp + #24], R8	# spill
4c5     movl    [rsp + #32], RAX	# spill
4c9     movl    [rsp + #36], R11	# spill
        nop 	# 2 bytes pad for loops and calls
4d0     call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.VectorIntrinsics::roundDown @ bci:5 (line 106) L[0]=rsp + #36 L[1]=rsp + #32 STK[0]=RBP
        # jdk.incubator.vector.AbstractSpecies::loopBound @ bci:5 (line 203) L[0]=_ L[1]=_
        # App::micro_vector @ bci:17 (line 20) L[0]=rsp + #0 L[1]=rsp + #8 L[2]=rsp + #16 L[3]=rsp + #24 L[4]=#0 L[5]=_ L[6]=_ STK[0]=#0
        # OopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop off=1240/0x4d8}
4d8     stop	# ShouldNotReachHere

4ec     B56: #	out( N625 ) <- in( B25 B20 B21 B22 B27 B26 B23 B24 )  Freq: 3.97716e-06
4ec     movl    RSI, #-138	# int
4f1     movq    RBP, RDX	# spill
4f4     movq    [rsp + #0], RCX	# spill
4f8     movq    [rsp + #8], R8	# spill
4fd     movl    [rsp + #20], RBX	# spill
501     movl    [rsp + #24], R11	# spill
        nop 	# 2 bytes pad for loops and calls
508     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:83 (line 25) L[0]=_ L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #8 L[4]=rsp + #20 L[5]=_ L[6]=_ STK[0]=rsp + #20 STK[1]=rsp + #24
        # OopMap {rbp=Oop [0]=Oop [8]=Oop off=1296/0x510}
510     stop	# ShouldNotReachHere

524     B57: #	out( N625 ) <- in( B31 )  Freq: 4.97142e-07
524     stop	# ShouldNotReachHere

538     B58: #	out( N625 ) <- in( B32 )  Freq: 4.97142e-07
538     stop	# ShouldNotReachHere

54c     B59: #	out( N625 ) <- in( B33 )  Freq: 4.97141e-07
54c     stop	# ShouldNotReachHere

560     B60: #	out( N625 ) <- in( B34 )  Freq: 4.97141e-07
560     stop	# ShouldNotReachHere

574     B61: #	out( N625 ) <- in( B35 )  Freq: 4.9714e-07
574     stop	# ShouldNotReachHere

588     B62: #	out( N625 ) <- in( B36 )  Freq: 4.9714e-07
588     stop	# ShouldNotReachHere

59c     B63: #	out( N625 ) <- in( B37 )  Freq: 4.97139e-07
59c     stop	# ShouldNotReachHere

5b0     B64: #	out( N625 ) <- in( B1 )  Freq: 1.01328e-06
5b0     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
5b8     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:16 (line 20) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ STK[0]=_ STK[1]=_ STK[2]=#NULL
        # OopMap {off=1472/0x5c0}
5c0     stop	# ShouldNotReachHere

5d4     B65: #	out( N625 ) <- in( B2 )  Freq: 1.01328e-06
5d4     movl    RSI, #-10	# int
5d9     movl    RBP, R11	# spill
5dc     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:17 (line 20) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ STK[0]=_ STK[1]=#NULL STK[2]=RBP
        # OopMap {off=1508/0x5e4}
5e4     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    5707  227             App::micro_vector (106 bytes)
 total in heap  [0x00007fc811177090,0x00007fc811178000] = 3952
 relocation     [0x00007fc811177208,0x00007fc8111772f8] = 240
 main code      [0x00007fc811177300,0x00007fc811177920] = 1568
 stub code      [0x00007fc811177920,0x00007fc811177938] = 24
 oops           [0x00007fc811177938,0x00007fc811177948] = 16
 metadata       [0x00007fc811177948,0x00007fc8111779f8] = 176
 scopes data    [0x00007fc8111779f8,0x00007fc811177c60] = 616
 scopes pcs     [0x00007fc811177c60,0x00007fc811177fb0] = 848
 dependencies   [0x00007fc811177fb0,0x00007fc811177fc0] = 16
 nul chk table  [0x00007fc811177fc0,0x00007fc811178000] = 64

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Entry Point]
  # {method} {0x00007fc7b9c11818} 'micro_vector' '([I[I[I)V' in 'App'
  # this:     rsi:rsi   = 'App'
  # parm0:    rdx:rdx   = '[I'
  # parm1:    rcx:rcx   = '[I'
  # parm2:    r8:r8     = '[I'
  #           [sp+0xc0]  (sp of caller)
 ;; N625: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fc811177300:   mov    0x8(%rsi),%r10d
  0x00007fc811177304:   movabs $0x800000000,%r11
  0x00007fc81117730e:   add    %r11,%r10
  0x00007fc811177311:   cmp    %r10,%rax
  0x00007fc811177314:   jne    0x00007fc811115c20           ;   {runtime_call ic_miss_stub}
  0x00007fc81117731a:   nop
  0x00007fc81117731b:   nop
  0x00007fc81117731c:   nop
  0x00007fc81117731d:   nop
  0x00007fc81117731e:   nop
  0x00007fc81117731f:   nop
[Verified Entry Point]
 ;; B1: #	out( B64 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fc811177320:   mov    %eax,-0x16000(%rsp)
  0x00007fc811177327:   push   %rbp
  0x00007fc811177328:   sub    $0xb0,%rsp                   ;*synchronization entry
                                                            ; - App::micro_vector@-1 (line 15)
  0x00007fc81117732f:   vmovq  %rsi,%xmm1
  0x00007fc811177334:   mov    0xc(%rdx),%r11d              ; implicit exception: dispatches to 0x00007fc8111778b0
                                                            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B2: #	out( B65 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007fc811177338:   mov    0xc(%rsi),%ebp               ;*getfield SPECIES {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@12 (line 20)
  0x00007fc81117733b:   nop
  0x00007fc81117733c:   nop
  0x00007fc81117733d:   nop
  0x00007fc81117733e:   nop
  0x00007fc81117733f:   nop
  0x00007fc811177340:   mov    0x8(%r12,%rbp,8),%r9d        ; implicit exception: dispatches to 0x00007fc8111778d4
 ;; B3: #	out( B53 B4 ) <- in( B2 )  Freq: 0.999998
  0x00007fc811177345:   cmp    $0x94b80,%r9d                ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
                                                            ;   {metadata('jdk/incubator/vector/IntVector$IntSpecies')}
  0x00007fc81117734c:   jne    0x00007fc811177733
 ;; B4: #	out( B55 B5 ) <- in( B3 )  Freq: 0.999997
  0x00007fc811177352:   lea    (%r12,%rbp,8),%rbx           ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
  0x00007fc811177356:   mov    0xc(%rbx),%eax               ;*getfield laneCount {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
                                                            ; - App::micro_vector@17 (line 20)
  0x00007fc811177359:   mov    %eax,%r10d
  0x00007fc81117735c:   dec    %r10d
  0x00007fc81117735f:   mov    %eax,%ebp
  0x00007fc811177361:   and    %r10d,%ebp
  0x00007fc811177364:   test   %ebp,%ebp
  0x00007fc811177366:   jne    0x00007fc8111777ac
 ;; B5: #	out( B52 B6 ) <- in( B4 )  Freq: 0.999996
  0x00007fc81117736c:   andn   %r11d,%r10d,%r10d
  0x00007fc811177371:   mov    %r11d,%ebp                   ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc811177374:   add    $0xfffffff1,%ebp             ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@76 (line 20)
  0x00007fc811177377:   xor    %esi,%esi
  0x00007fc811177379:   test   %r10d,%r10d
  0x00007fc81117737c:   nop
  0x00007fc81117737d:   nop
  0x00007fc81117737e:   nop
  0x00007fc81117737f:   nop
  0x00007fc811177380:   jle    0x00007fc81117772c
 ;; B6: #	out( B54 B7 ) <- in( B5 )  Freq: 0.999837
  0x00007fc811177386:   mov    0xc(%rcx),%r9d               ; implicit exception: dispatches to 0x00007fc811177770
 ;; B7: #	out( B54 B8 ) <- in( B6 )  Freq: 0.999836
  0x00007fc81117738a:   sub    %eax,%r9d
  0x00007fc81117738d:   inc    %r9d
  0x00007fc811177390:   test   %r9d,%r9d
  0x00007fc811177393:   jl     0x00007fc811177770           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B8: #	out( B54 B9 ) <- in( B7 )  Freq: 0.999835
  0x00007fc811177399:   mov    0x44(%rbx),%edi              ;*getfield dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007fc81117739c:   nop
  0x00007fc81117739d:   nop
  0x00007fc81117739e:   nop
  0x00007fc81117739f:   nop
  0x00007fc8111773a0:   mov    0x8(%r12,%rdi,8),%edi        ; implicit exception: dispatches to 0x00007fc811177770
 ;; B9: #	out( B54 B10 ) <- in( B8 )  Freq: 0.999834
  0x00007fc8111773a5:   cmp    $0x98c90,%edi                ;   {metadata('jdk/incubator/vector/Int512Vector')}
  0x00007fc8111773ab:   jne    0x00007fc811177770
 ;; B10: #	out( B54 B11 ) <- in( B9 )  Freq: 0.999833
  0x00007fc8111773b1:   mov    0xc(%r8),%edi                ; implicit exception: dispatches to 0x00007fc811177770
 ;; B11: #	out( B54 B12 ) <- in( B10 )  Freq: 0.999832
  0x00007fc8111773b5:   sub    %eax,%edi                    ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc8111773b7:   inc    %edi
  0x00007fc8111773b9:   test   %edi,%edi
  0x00007fc8111773bb:   nop
  0x00007fc8111773bc:   nop
  0x00007fc8111773bd:   nop
  0x00007fc8111773be:   nop
  0x00007fc8111773bf:   nop
  0x00007fc8111773c0:   jl     0x00007fc811177770
 ;; B12: #	out( B54 B13 ) <- in( B11 )  Freq: 0.999831
  0x00007fc8111773c6:   test   %ebp,%ebp
  0x00007fc8111773c8:   jl     0x00007fc811177770
 ;; B13: #	out( B14 ) <- in( B12 )  Freq: 0.99983
  0x00007fc8111773ce:   vmovq  %rbx,%xmm0
  0x00007fc8111773d3:   mov    %r11d,%r13d                  ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007fc8111773d6:   mov    %ebp,%r11d                   ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc8111773d9:   xor    %ebx,%ebx
  0x00007fc8111773db:   nop
  0x00007fc8111773dc:   nop
  0x00007fc8111773dd:   nop
  0x00007fc8111773de:   nop
  0x00007fc8111773df:   nop
 ;; B14: #	out( B49 B15 ) <- in( B13 B17 ) Loop( B14-B17 inner ) Freq: 6160.27
  0x00007fc8111773e0:   cmp    %r9d,%ebx
  0x00007fc8111773e3:   jae    0x00007fc81117764b           ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
 ;; B15: #	out( B50 B16 ) <- in( B14 )  Freq: 6160.26
  0x00007fc8111773e9:   vmovdqu32 0x10(%rcx,%rbx,4),%zmm2   ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
                                                            ; - jdk.incubator.vector.Int512Vector::fromArray0@3 (line 805)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007fc8111773f4:   cmp    %edi,%ebx
  0x00007fc8111773f6:   jae    0x00007fc811177690           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B16: #	out( B51 B17 ) <- in( B15 )  Freq: 6160.26
  0x00007fc8111773fc:   vpaddd 0x10(%r8,%rbx,4),%zmm2,%zmm2 ;*invokestatic binaryOp {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
                                                            ; - jdk.incubator.vector.Int512Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int512Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector@53 (line 23)
  0x00007fc811177407:   cmp    %r11d,%ebx
  0x00007fc81117740a:   jae    0x00007fc8111776e0
 ;; B17: #	out( B14 B18 ) <- in( B16 )  Freq: 6160.25
  0x00007fc811177410:   vmovdqu32 %zmm2,0x10(%rdx,%rbx,4)
  0x00007fc81117741b:   mov    0x130(%r15),%r14             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc811177422:   add    %eax,%ebx                    ; ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop xmm0=Oop xmm1=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@76 (line 20)
  0x00007fc811177424:   test   %eax,(%r14)                  ;   {poll}
  0x00007fc811177427:   cmp    %r10d,%ebx
  0x00007fc81117742a:   jl     0x00007fc8111773e0
 ;; B18: #	out( B19 ) <- in( B17 )  Freq: 0.981104
  0x00007fc81117742c:   mov    %r13d,%r11d
 ;; B19: #	out( B48 B20 ) <- in( B18 B52 )  Freq: 0.981263
  0x00007fc81117742f:   cmp    %r11d,%ebx
  0x00007fc811177432:   jge    0x00007fc811177632
 ;; B20: #	out( B56 B21 ) <- in( B19 )  Freq: 0.490632
  0x00007fc811177438:   nop
  0x00007fc811177439:   nop
  0x00007fc81117743a:   nop
  0x00007fc81117743b:   nop
  0x00007fc81117743c:   nop
  0x00007fc81117743d:   nop
  0x00007fc81117743e:   nop
  0x00007fc81117743f:   nop
  0x00007fc811177440:   mov    0xc(%rcx),%r10d              ; implicit exception: dispatches to 0x00007fc8111777ec
 ;; B21: #	out( B56 B22 ) <- in( B20 )  Freq: 0.490631
  0x00007fc811177444:   cmp    %r10d,%ebx
  0x00007fc811177447:   jae    0x00007fc8111777ec
 ;; B22: #	out( B56 B23 ) <- in( B21 )  Freq: 0.490631
  0x00007fc81117744d:   mov    %r11d,%eax
  0x00007fc811177450:   dec    %eax
  0x00007fc811177452:   cmp    %r10d,%eax
  0x00007fc811177455:   jae    0x00007fc8111777ec           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B23: #	out( B56 B24 ) <- in( B22 )  Freq: 0.49063
  0x00007fc81117745b:   nop
  0x00007fc81117745c:   nop
  0x00007fc81117745d:   nop
  0x00007fc81117745e:   nop
  0x00007fc81117745f:   nop
  0x00007fc811177460:   mov    0xc(%r8),%r9d                ; implicit exception: dispatches to 0x00007fc8111777ec
 ;; B24: #	out( B56 B25 ) <- in( B23 )  Freq: 0.49063
  0x00007fc811177464:   cmp    %r9d,%ebx
  0x00007fc811177467:   jae    0x00007fc8111777ec
 ;; B25: #	out( B56 B26 ) <- in( B24 )  Freq: 0.490629
  0x00007fc81117746d:   cmp    %r9d,%eax
  0x00007fc811177470:   jae    0x00007fc8111777ec
 ;; B26: #	out( B56 B27 ) <- in( B25 )  Freq: 0.490629
  0x00007fc811177476:   cmp    %r11d,%ebx
  0x00007fc811177479:   jae    0x00007fc8111777ec
 ;; B27: #	out( B56 B28 ) <- in( B26 )  Freq: 0.490628
  0x00007fc81117747f:   nop
  0x00007fc811177480:   cmp    %r11d,%eax
  0x00007fc811177483:   jae    0x00007fc8111777ec
 ;; B28: #	out( B29 ) <- in( B27 )  Freq: 0.490628
  0x00007fc811177489:   mov    %edx,%eax
  0x00007fc81117748b:   shr    $0x2,%eax
  0x00007fc81117748e:   and    $0xf,%eax
  0x00007fc811177491:   add    %ebx,%eax
  0x00007fc811177493:   mov    $0xb,%edi
  0x00007fc811177498:   sub    %eax,%edi
  0x00007fc81117749a:   and    $0xf,%edi
  0x00007fc81117749d:   add    %ebx,%edi
  0x00007fc81117749f:   inc    %edi
  0x00007fc8111774a1:   cmp    %r11d,%edi
  0x00007fc8111774a4:   cmovg  %r11d,%edi                   ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B29: #	out( B29 B30 ) <- in( B28 B29 ) Loop( B29-B29 inner pre of N1916) Freq: 4.90627
  0x00007fc8111774a8:   mov    0x10(%r8,%rbx,4),%eax
  0x00007fc8111774ad:   add    0x10(%rcx,%rbx,4),%eax       ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc8111774b1:   mov    %eax,0x10(%rdx,%rbx,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@98 (line 26)
  0x00007fc8111774b5:   inc    %ebx
  0x00007fc8111774b7:   cmp    %edi,%ebx
  0x00007fc8111774b9:   jl     0x00007fc8111774a8
 ;; B30: #	out( B45 B31 ) <- in( B29 )  Freq: 0.490628
  0x00007fc8111774bb:   mov    %r11d,%eax
  0x00007fc8111774be:   add    $0xffffffc1,%eax
  0x00007fc8111774c1:   cmp    %eax,%ebx
  0x00007fc8111774c3:   jge    0x00007fc811177614
 ;; B31: #	out( B57 B32 ) <- in( B30 )  Freq: 0.490627
  0x00007fc8111774c9:   cmp    %r11d,%ebx
  0x00007fc8111774cc:   jae    0x00007fc811177824
 ;; B32: #	out( B58 B33 ) <- in( B31 )  Freq: 0.490627
  0x00007fc8111774d2:   cmp    %r9d,%ebx
  0x00007fc8111774d5:   jae    0x00007fc811177838
 ;; B33: #	out( B59 B34 ) <- in( B32 )  Freq: 0.490626
  0x00007fc8111774db:   nop
  0x00007fc8111774dc:   nop
  0x00007fc8111774dd:   nop
  0x00007fc8111774de:   nop
  0x00007fc8111774df:   nop
  0x00007fc8111774e0:   cmp    %r10d,%ebx
  0x00007fc8111774e3:   jae    0x00007fc81117784c
 ;; B34: #	out( B60 B35 ) <- in( B33 )  Freq: 0.490626
  0x00007fc8111774e9:   mov    %ebx,%edi
  0x00007fc8111774eb:   add    $0x3f,%edi
  0x00007fc8111774ee:   cmp    %r10d,%edi
  0x00007fc8111774f1:   jae    0x00007fc811177860
 ;; B35: #	out( B61 B36 ) <- in( B34 )  Freq: 0.490625
  0x00007fc8111774f7:   cmp    %r9d,%edi
  0x00007fc8111774fa:   nop
  0x00007fc8111774fb:   nop
  0x00007fc8111774fc:   nop
  0x00007fc8111774fd:   nop
  0x00007fc8111774fe:   nop
  0x00007fc8111774ff:   nop
  0x00007fc811177500:   jae    0x00007fc811177874
 ;; B36: #	out( B62 B37 ) <- in( B35 )  Freq: 0.490625
  0x00007fc811177506:   cmp    %r11d,%ebx
  0x00007fc811177509:   jae    0x00007fc811177888
 ;; B37: #	out( B63 B38 ) <- in( B36 )  Freq: 0.490624
  0x00007fc81117750f:   cmp    %r11d,%edi
  0x00007fc811177512:   jae    0x00007fc81117789c
 ;; B38: #	out( B39 ) <- in( B37 )  Freq: 0.490624
  0x00007fc811177518:   mov    $0xfa00,%r9d
 ;; B39: #	out( B40 ) <- in( B38 B41 ) Loop( B39-B41 ) Freq: 4.90624
  0x00007fc81117751e:   mov    %r11d,%r10d
  0x00007fc811177521:   sub    %ebx,%r10d
  0x00007fc811177524:   add    $0xffffffc1,%r10d
  0x00007fc811177528:   cmp    %ebx,%eax
  0x00007fc81117752a:   cmovl  %esi,%r10d
  0x00007fc81117752e:   cmp    $0xfa00,%r10d
  0x00007fc811177535:   cmova  %r9d,%r10d
  0x00007fc811177539:   add    %ebx,%r10d
  0x00007fc81117753c:   nop
  0x00007fc81117753d:   nop
  0x00007fc81117753e:   nop
  0x00007fc81117753f:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B40: #	out( B40 B41 ) <- in( B39 B40 ) Loop( B40-B40 inner main of N298 strip mined) Freq: 49.0623
  0x00007fc811177540:   vmovdqu32 0x10(%rcx,%rbx,4),%zmm0
  0x00007fc81117754b:   vpaddd 0x10(%r8,%rbx,4),%zmm0,%zmm0
  0x00007fc811177556:   vmovdqu32 %zmm0,0x10(%rdx,%rbx,4)
  0x00007fc811177561:   movslq %ebx,%rdi
  0x00007fc811177564:   vmovdqu32 0x50(%rcx,%rdi,4),%zmm0
  0x00007fc81117756f:   vpaddd 0x50(%r8,%rdi,4),%zmm0,%zmm0
  0x00007fc81117757a:   vmovdqu32 %zmm0,0x50(%rdx,%rdi,4)
  0x00007fc811177585:   vmovdqu32 0x90(%rcx,%rdi,4),%zmm0
  0x00007fc811177590:   vpaddd 0x90(%r8,%rdi,4),%zmm0,%zmm0
  0x00007fc81117759b:   vmovdqu32 %zmm0,0x90(%rdx,%rdi,4)
  0x00007fc8111775a6:   vmovdqu32 0xd0(%rcx,%rdi,4),%zmm0
  0x00007fc8111775b1:   vpaddd 0xd0(%r8,%rdi,4),%zmm0,%zmm0
  0x00007fc8111775bc:   vmovdqu32 %zmm0,0xd0(%rdx,%rdi,4)   ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc8111775c7:   add    $0x40,%ebx
  0x00007fc8111775ca:   cmp    %r10d,%ebx
  0x00007fc8111775cd:   jl     0x00007fc811177540           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@102 (line 25)
 ;; B41: #	out( B39 B42 ) <- in( B40 )  Freq: 4.90624
  0x00007fc8111775d3:   mov    0x130(%r15),%r10             ; ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@102 (line 25)
  0x00007fc8111775da:   test   %eax,(%r10)                  ;   {poll}
  0x00007fc8111775dd:   nop
  0x00007fc8111775de:   nop
  0x00007fc8111775df:   nop
  0x00007fc8111775e0:   cmp    %eax,%ebx
  0x00007fc8111775e2:   jl     0x00007fc81117751e
 ;; B42: #	out( B45 B43 ) <- in( B41 )  Freq: 0.490624
  0x00007fc8111775e8:   cmp    %ebp,%ebx
  0x00007fc8111775ea:   jge    0x00007fc811177614           ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B43: #	out( B44 ) <- in( B42 )  Freq: 0.245312
 ;; B44: #	out( B44 B45 ) <- in( B43 B44 ) Loop( B44-B44 inner post of N2802) Freq: 2.45312
  0x00007fc8111775ec:   vmovdqu32 0x10(%rcx,%rbx,4),%zmm0
  0x00007fc8111775f7:   vpaddd 0x10(%r8,%rbx,4),%zmm0,%zmm0
  0x00007fc811177602:   vmovdqu32 %zmm0,0x10(%rdx,%rbx,4)   ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc81117760d:   add    $0x10,%ebx
  0x00007fc811177610:   cmp    %ebp,%ebx
  0x00007fc811177612:   jl     0x00007fc8111775ec
 ;; B45: #	out( B48 B46 ) <- in( B30 B44 B42 )  Freq: 0.490624
  0x00007fc811177614:   cmp    %r11d,%ebx
  0x00007fc811177617:   jge    0x00007fc811177632
 ;; B46: #	out( B47 ) <- in( B45 )  Freq: 0.245312
  0x00007fc811177619:   nop
  0x00007fc81117761a:   nop
  0x00007fc81117761b:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B47: #	out( B47 B48 ) <- in( B46 B47 ) Loop( B47-B47 inner post of N1916) Freq: 2.45312
  0x00007fc81117761c:   mov    0x10(%r8,%rbx,4),%r9d
  0x00007fc811177621:   add    0x10(%rcx,%rbx,4),%r9d       ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc811177626:   mov    %r9d,0x10(%rdx,%rbx,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@98 (line 26)
  0x00007fc81117762b:   inc    %ebx
  0x00007fc81117762d:   cmp    %r11d,%ebx
  0x00007fc811177630:   jl     0x00007fc81117761c           ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
 ;; B48: #	out( N625 ) <- in( B47 B45 B19 )  Freq: 0.981256
  0x00007fc811177632:   vzeroupper 
  0x00007fc811177635:   add    $0xb0,%rsp
  0x00007fc81117763c:   pop    %rbp
  0x00007fc81117763d:   cmp    0x128(%r15),%rsp             ;   {poll_return}
  0x00007fc811177644:   ja     0x00007fc8111778f8
  0x00007fc81117764a:   retq   
 ;; B49: #	out( N625 ) <- in( B14 )  Freq: 0.00624207
  0x00007fc81117764b:   mov    $0xffffffe4,%esi
  0x00007fc811177650:   vmovq  %xmm1,%rbp
  0x00007fc811177655:   mov    %rdx,(%rsp)
  0x00007fc811177659:   mov    %r8,0x10(%rsp)
  0x00007fc81117765e:   mov    %rcx,0x20(%rsp)
  0x00007fc811177663:   mov    %ebx,0x1c(%rsp)
  0x00007fc811177667:   mov    %r9d,0x28(%rsp)
  0x00007fc81117766c:   vmovsd %xmm0,0x30(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc811177672:   nop
  0x00007fc811177673:   nop
  0x00007fc811177674:   vzeroupper 
  0x00007fc811177677:   callq  0x00007fc8111191c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop [32]=Oop [48]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc81117767c:   movabs $0x7fc81c4cb7b8,%rdi         ;   {external_word}
  0x00007fc811177686:   and    $0xfffffffffffffff0,%rsp
  0x00007fc81117768a:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc81117768f:   hlt    
 ;; B50: #	out( N625 ) <- in( B15 )  Freq: 0.00624207
  0x00007fc811177690:   mov    $0xffffffe4,%esi
  0x00007fc811177695:   vmovq  %xmm1,%rbp
  0x00007fc81117769a:   mov    %rdx,(%rsp)
  0x00007fc81117769e:   mov    %rcx,0x8(%rsp)
  0x00007fc8111776a3:   mov    %r8,0x20(%rsp)
  0x00007fc8111776a8:   mov    %ebx,0x1c(%rsp)
  0x00007fc8111776ac:   mov    %edi,0x28(%rsp)
  0x00007fc8111776b0:   vmovdqu64 %zmm2,0x60(%rsp)
  0x00007fc8111776bb:   vmovsd %xmm0,0x30(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc8111776c1:   nop
  0x00007fc8111776c2:   nop
  0x00007fc8111776c3:   nop
  0x00007fc8111776c4:   vzeroupper 
  0x00007fc8111776c7:   callq  0x00007fc8111191c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [32]=Oop [48]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@44 (line 22)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc8111776cc:   movabs $0x7fc81c4cb7b8,%rdi         ;   {external_word}
  0x00007fc8111776d6:   and    $0xfffffffffffffff0,%rsp
  0x00007fc8111776da:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc8111776df:   hlt    
 ;; B51: #	out( N625 ) <- in( B16 )  Freq: 0.00624206
  0x00007fc8111776e0:   mov    $0xffffffe4,%esi
  0x00007fc8111776e5:   vmovq  %xmm1,%rbp
  0x00007fc8111776ea:   mov    %rcx,0x8(%rsp)
  0x00007fc8111776ef:   mov    %r8,0x10(%rsp)
  0x00007fc8111776f4:   mov    %rdx,0x20(%rsp)
  0x00007fc8111776f9:   mov    %ebx,0x1c(%rsp)
  0x00007fc8111776fd:   mov    %r11d,0x28(%rsp)
  0x00007fc811177702:   vmovdqu64 %zmm2,0x60(%rsp)          ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc81117770d:   nop
  0x00007fc81117770e:   nop
  0x00007fc81117770f:   nop
  0x00007fc811177710:   vzeroupper 
  0x00007fc811177713:   callq  0x00007fc8111191c0           ; ImmutableOopMap {rbp=Oop [8]=Oop [16]=Oop [32]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - App::micro_vector@59 (line 23)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc811177718:   movabs $0x7fc81c4cb7b8,%rdi         ;   {external_word}
  0x00007fc811177722:   and    $0xfffffffffffffff0,%rsp
  0x00007fc811177726:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc81117772b:   hlt    
 ;; B52: #	out( B19 ) <- in( B5 )  Freq: 0.000159259
  0x00007fc81117772c:   xor    %ebx,%ebx
  0x00007fc81117772e:   jmpq   0x00007fc81117742f
 ;; B53: #	out( N625 ) <- in( B3 )  Freq: 9.99998e-07
  0x00007fc811177733:   mov    $0xffffffde,%esi
  0x00007fc811177738:   vmovsd %xmm1,(%rsp)
  0x00007fc81117773d:   mov    %rdx,0x8(%rsp)
  0x00007fc811177742:   mov    %rcx,0x10(%rsp)
  0x00007fc811177747:   mov    %r8,0x18(%rsp)
  0x00007fc81117774c:   mov    %r11d,0x20(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc811177751:   nop
  0x00007fc811177752:   nop
  0x00007fc811177753:   nop
  0x00007fc811177754:   vzeroupper 
  0x00007fc811177757:   callq  0x00007fc8111191c0           ; ImmutableOopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc81117775c:   movabs $0x7fc81c4cb7b8,%rdi         ;   {external_word}
  0x00007fc811177766:   and    $0xfffffffffffffff0,%rsp
  0x00007fc81117776a:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc81117776f:   hlt    
 ;; B54: #	out( N625 ) <- in( B11 B12 B6 B7 B8 B9 B10 )  Freq: 7.03867e-06
  0x00007fc811177770:   mov    $0xffffff76,%esi
  0x00007fc811177775:   vmovq  %xmm1,%rbp
  0x00007fc81117777a:   mov    %rdx,(%rsp)
  0x00007fc81117777e:   mov    %rcx,0x8(%rsp)
  0x00007fc811177783:   mov    %r8,0x10(%rsp)
  0x00007fc811177788:   mov    %r10d,0x18(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc81117778d:   nop
  0x00007fc81117778e:   nop
  0x00007fc81117778f:   nop
  0x00007fc811177790:   vzeroupper 
  0x00007fc811177793:   callq  0x00007fc8111191c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@22 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc811177798:   movabs $0x7fc81c4cb7b8,%rdi         ;   {external_word}
  0x00007fc8111777a2:   and    $0xfffffffffffffff0,%rsp
  0x00007fc8111777a6:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc8111777ab:   hlt    
 ;; B55: #	out( N625 ) <- in( B4 )  Freq: 4.99998e-07
  0x00007fc8111777ac:   mov    $0xffffff45,%esi
  0x00007fc8111777b1:   vmovsd %xmm1,(%rsp)
  0x00007fc8111777b6:   mov    %rdx,0x8(%rsp)
  0x00007fc8111777bb:   mov    %rcx,0x10(%rsp)
  0x00007fc8111777c0:   mov    %r8,0x18(%rsp)
  0x00007fc8111777c5:   mov    %eax,0x20(%rsp)
  0x00007fc8111777c9:   mov    %r11d,0x24(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc8111777ce:   nop
  0x00007fc8111777cf:   nop
  0x00007fc8111777d0:   vzeroupper 
  0x00007fc8111777d3:   callq  0x00007fc8111191c0           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*ifne {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc8111777d8:   movabs $0x7fc81c4cb7b8,%rdi         ;   {external_word}
  0x00007fc8111777e2:   and    $0xfffffffffffffff0,%rsp
  0x00007fc8111777e6:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc8111777eb:   hlt    
 ;; B56: #	out( N625 ) <- in( B25 B20 B21 B22 B27 B26 B23 B24 )  Freq: 3.97716e-06
  0x00007fc8111777ec:   mov    $0xffffff76,%esi
  0x00007fc8111777f1:   mov    %rdx,%rbp
  0x00007fc8111777f4:   mov    %rcx,(%rsp)
  0x00007fc8111777f8:   mov    %r8,0x8(%rsp)
  0x00007fc8111777fd:   mov    %ebx,0x14(%rsp)
  0x00007fc811177801:   mov    %r11d,0x18(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc811177806:   nop
  0x00007fc811177807:   nop
  0x00007fc811177808:   vzeroupper 
  0x00007fc81117780b:   callq  0x00007fc8111191c0           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@83 (line 25)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc811177810:   movabs $0x7fc81c4cb7b8,%rdi         ;   {external_word}
  0x00007fc81117781a:   and    $0xfffffffffffffff0,%rsp
  0x00007fc81117781e:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc811177823:   hlt    
 ;; B57: #	out( N625 ) <- in( B31 )  Freq: 4.97142e-07
  0x00007fc811177824:   movabs $0x7fc81c663078,%rdi         ;   {external_word}
  0x00007fc81117782e:   and    $0xfffffffffffffff0,%rsp
  0x00007fc811177832:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc811177837:   hlt    
 ;; B58: #	out( N625 ) <- in( B32 )  Freq: 4.97142e-07
  0x00007fc811177838:   movabs $0x7fc81c663078,%rdi         ;   {external_word}
  0x00007fc811177842:   and    $0xfffffffffffffff0,%rsp
  0x00007fc811177846:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc81117784b:   hlt    
 ;; B59: #	out( N625 ) <- in( B33 )  Freq: 4.97141e-07
  0x00007fc81117784c:   movabs $0x7fc81c663078,%rdi         ;   {external_word}
  0x00007fc811177856:   and    $0xfffffffffffffff0,%rsp
  0x00007fc81117785a:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc81117785f:   hlt    
 ;; B60: #	out( N625 ) <- in( B34 )  Freq: 4.97141e-07
  0x00007fc811177860:   movabs $0x7fc81c663078,%rdi         ;   {external_word}
  0x00007fc81117786a:   and    $0xfffffffffffffff0,%rsp
  0x00007fc81117786e:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc811177873:   hlt    
 ;; B61: #	out( N625 ) <- in( B35 )  Freq: 4.9714e-07
  0x00007fc811177874:   movabs $0x7fc81c663078,%rdi         ;   {external_word}
  0x00007fc81117787e:   and    $0xfffffffffffffff0,%rsp
  0x00007fc811177882:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc811177887:   hlt    
 ;; B62: #	out( N625 ) <- in( B36 )  Freq: 4.9714e-07
  0x00007fc811177888:   movabs $0x7fc81c663078,%rdi         ;   {external_word}
  0x00007fc811177892:   and    $0xfffffffffffffff0,%rsp
  0x00007fc811177896:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc81117789b:   hlt    
 ;; B63: #	out( N625 ) <- in( B37 )  Freq: 4.97139e-07
  0x00007fc81117789c:   movabs $0x7fc81c663078,%rdi         ;   {external_word}
  0x00007fc8111778a6:   and    $0xfffffffffffffff0,%rsp
  0x00007fc8111778aa:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc8111778af:   hlt    
 ;; B64: #	out( N625 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007fc8111778b0:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc8111778b5:   nop
  0x00007fc8111778b6:   nop
  0x00007fc8111778b7:   nop
  0x00007fc8111778b8:   vzeroupper 
  0x00007fc8111778bb:   callq  0x00007fc8111191c0           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@16 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc8111778c0:   movabs $0x7fc81c4cb7b8,%rdi         ;   {external_word}
  0x00007fc8111778ca:   and    $0xfffffffffffffff0,%rsp
  0x00007fc8111778ce:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc8111778d3:   hlt    
 ;; B65: #	out( N625 ) <- in( B2 )  Freq: 1.01328e-06
  0x00007fc8111778d4:   mov    $0xfffffff6,%esi
  0x00007fc8111778d9:   mov    %r11d,%ebp
  0x00007fc8111778dc:   vzeroupper 
  0x00007fc8111778df:   callq  0x00007fc8111191c0           ; ImmutableOopMap {}
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc8111778e4:   movabs $0x7fc81c4cb7b8,%rdi         ;   {external_word}
  0x00007fc8111778ee:   and    $0xfffffffffffffff0,%rsp
  0x00007fc8111778f2:   callq  0x00007fc81bc90ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc8111778f7:   hlt                                 ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc8111778f8:   movabs $0x7fc81117763d,%r10         ;   {internal_word}
  0x00007fc811177902:   mov    %r10,0x3e8(%r15)
  0x00007fc811177909:   jmpq   0x00007fc811118020           ;   {runtime_call SafepointBlob}
  0x00007fc81117790e:   hlt    
  0x00007fc81117790f:   hlt    
  0x00007fc811177910:   hlt    
  0x00007fc811177911:   hlt    
  0x00007fc811177912:   hlt    
  0x00007fc811177913:   hlt    
  0x00007fc811177914:   hlt    
  0x00007fc811177915:   hlt    
  0x00007fc811177916:   hlt    
  0x00007fc811177917:   hlt    
  0x00007fc811177918:   hlt    
  0x00007fc811177919:   hlt    
  0x00007fc81117791a:   hlt    
  0x00007fc81117791b:   hlt    
  0x00007fc81117791c:   hlt    
  0x00007fc81117791d:   hlt    
  0x00007fc81117791e:   hlt    
  0x00007fc81117791f:   hlt    
[Exception Handler]
  0x00007fc811177920:   jmpq   0x00007fc81105cfa0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007fc811177925:   callq  0x00007fc81117792a
  0x00007fc81117792a:   subq   $0x5,(%rsp)
  0x00007fc81117792f:   jmpq   0x00007fc8111194e0           ;   {runtime_call DeoptimizationBlob}
  0x00007fc811177934:   hlt    
  0x00007fc811177935:   hlt    
  0x00007fc811177936:   hlt    
  0x00007fc811177937:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007fc811177938:   0x00000000fb000380 a 'java/lang/Class'{0x00000000fb000380} = 'jdk/incubator/vector/Int512Vector'
  0x00007fc811177940:   0x00000000fb000308 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x00000000fb000308}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007fc811177948:   0x00007fc7b9c11818 {method} {0x00007fc7b9c11818} 'micro_vector' '([I[I[I)V' in 'App'
  0x00007fc811177950:   0x00007fc7b9c12d08 {method} {0x00007fc7b9c12d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
  0x00007fc811177958:   0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fc811177960:   0x00007fc7b9e1e040 {method} {0x00007fc7b9e1e040} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fc811177968:   0x00007fc7b9c12728 {method} {0x00007fc7b9c12728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fc811177970:   0x00007fc7b9e18468 {method} {0x00007fc7b9e18468} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fc811177978:   0x00007fc7b9e1eb40 {method} {0x00007fc7b9e1eb40} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fc811177980:   0x0000000800098c90 'jdk/incubator/vector/Int512Vector'
  0x00007fc811177988:   0x00007fc7b9e84038 {method} {0x00007fc7b9e84038} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007fc811177990:   0x00007fc7b9960ca0 {method} {0x00007fc7b9960ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
  0x00007fc811177998:   0x00007fc7b9e5ac10 {method} {0x00007fc7b9e5ac10} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int512Vector'
  0x00007fc8111779a0:   0x00007fc7b9c13798 {method} {0x00007fc7b9c13798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fc8111779a8:   0x00007fc7b9c1f8d8 {method} {0x00007fc7b9c1f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fc8111779b0:   0x00007fc7b9e5c080 {method} {0x00007fc7b9e5c080} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int512Vector'
  0x00007fc8111779b8:   0x00007fc7b9e58f18 {method} {0x00007fc7b9e58f18} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int512Vector;' in 'jdk/incubator/vector/Int512Vector'
  0x00007fc8111779c0:   0x00007fc7b9c1e8d8 {method} {0x00007fc7b9c1e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fc8111779c8:   0x00007fc7b9e84340 {method} {0x00007fc7b9e84340} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007fc8111779d0:   0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
  0x00007fc8111779d8:   0x00007fc7b9eef250 {method} {0x00007fc7b9eef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fc8111779e0:   0x00007fc7b9eeede8 {method} {0x00007fc7b9eeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fc8111779e8:   0x00007fc7b9eeeec0 {method} {0x00007fc7b9eeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fc8111779f0:   0x00007fc7b9e11968 {method} {0x00007fc7b9e11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007fc8111772ff offset=ffffffff bits=0):
PcDesc(pc=0x00007fc81117732f offset=2f bits=0):   App::micro_vector@-1 (line 15)
PcDesc(pc=0x00007fc811177338 offset=38 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc81117733b offset=3b bits=0):   App::micro_vector@12 (line 20)
PcDesc(pc=0x00007fc81117734c offset=4c bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc811177356 offset=56 bits=0):   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007fc811177359 offset=59 bits=0):   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007fc811177374 offset=74 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc811177377 offset=77 bits=0):   App::micro_vector@76 (line 20)
PcDesc(pc=0x00007fc811177399 offset=99 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc81117739c offset=9c bits=0):   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fc8111773b7 offset=b7 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc8111773d6 offset=d6 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fc8111773d9 offset=d9 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc8111773e9 offset=e9 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fc8111773f4 offset=f4 bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
   jdk.incubator.vector.Int512Vector::fromArray0@3 (line 805)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fc8111773fc offset=fc bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc811177407 offset=107 bits=0):   jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
   jdk.incubator.vector.Int512Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int512Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector@53 (line 23)
PcDesc(pc=0x00007fc811177422 offset=122 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc811177424 offset=124 bits=1):   App::micro_vector@76 (line 20)  reexecute=true
   Locals
    - l0: reg xmm1 [64],oop
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rbx [6],int
    - l5: empty
    - l6: empty
PcDesc(pc=0x00007fc81117745b offset=15b bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc8111774a8 offset=1a8 bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007fc8111774b1 offset=1b1 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc8111774b5 offset=1b5 bits=0):   App::micro_vector@98 (line 26)
PcDesc(pc=0x00007fc811177540 offset=240 bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007fc8111775c7 offset=2c7 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc8111775d3 offset=2d3 bits=0):   App::micro_vector@102 (line 25)
PcDesc(pc=0x00007fc8111775da offset=2da bits=1):   App::micro_vector@102 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rbx [6],int
    - l5: empty
    - l6: empty
PcDesc(pc=0x00007fc8111775ec offset=2ec bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007fc81117760d offset=30d bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc81117761c offset=31c bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007fc811177626 offset=326 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc81117762b offset=32b bits=0):   App::micro_vector@98 (line 26)
PcDesc(pc=0x00007fc811177632 offset=332 bits=0):   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007fc811177672 offset=372 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc81117767c offset=37c bits=0):   java.util.Objects::checkIndex@3 (line 359)
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
PcDesc(pc=0x00007fc8111776c1 offset=3c1 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc8111776cc offset=3cc bits=0):   java.util.Objects::checkIndex@3 (line 359)
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
    - l5: obj[255]
    - l6: empty
   Objects
    - 255: jdk.incubator.vector.Int512Vector stack[96]Wrong location type 7
PcDesc(pc=0x00007fc81117770d offset=40d bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc811177718 offset=418 bits=0):   java.util.Objects::checkIndex@3 (line 359)
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
    - l0: obj[263]
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
    - 263: jdk.incubator.vector.Int512Vector stack[96]Wrong location type 7
PcDesc(pc=0x00007fc811177751 offset=451 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc81117775c offset=45c bits=0):   App::micro_vector@17 (line 20)
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
PcDesc(pc=0x00007fc81117778d offset=48d bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc811177798 offset=498 bits=1):   App::micro_vector@22 (line 20)  reexecute=true
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
PcDesc(pc=0x00007fc8111777ce offset=4ce bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc8111777d8 offset=4d8 bits=1):   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
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
PcDesc(pc=0x00007fc811177806 offset=506 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc811177810 offset=510 bits=1):   App::micro_vector@83 (line 25)  reexecute=true
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
PcDesc(pc=0x00007fc8111778b5 offset=5b5 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc8111778c0 offset=5c0 bits=0):   App::micro_vector@16 (line 20)
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
PcDesc(pc=0x00007fc8111778e4 offset=5e4 bits=0):   App::micro_vector@17 (line 20)
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
PcDesc(pc=0x00007fc8111778f8 offset=5f8 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc811177939 offset=639 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 11 OopMaps

ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop xmm0=Oop xmm1=Oop } pc offsets: 292 
ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop } pc offsets: 730 
ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop [32]=Oop [48]=Oop } pc offsets: 892 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [32]=Oop [48]=Oop } pc offsets: 972 
ImmutableOopMap {rbp=Oop [8]=Oop [16]=Oop [32]=Oop } pc offsets: 1048 
ImmutableOopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop } pc offsets: 1116 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop } pc offsets: 1176 
ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop } pc offsets: 1240 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop } pc offsets: 1296 
ImmutableOopMap {} pc offsets: 1472 1508 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007fc81117732f offset=2f):
   App::micro_vector@-1 (line 15)
ScopeDesc(pc=0x00007fc811177338 offset=38):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc811177338 offset=38):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc81117733b offset=3b):
   App::micro_vector@12 (line 20)
ScopeDesc(pc=0x00007fc81117734c offset=4c):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc81117734c offset=4c):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc811177356 offset=56):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007fc811177359 offset=59):
   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
ScopeDesc(pc=0x00007fc811177359 offset=59):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007fc811177374 offset=74):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc811177374 offset=74):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc811177377 offset=77):
   App::micro_vector@76 (line 20)
ScopeDesc(pc=0x00007fc811177399 offset=99):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc811177399 offset=99):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc81117739c offset=9c):
   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
ScopeDesc(pc=0x00007fc81117739c offset=9c):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007fc81117739c offset=9c):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fc81117739c offset=9c):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fc8111773b7 offset=b7):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc8111773b7 offset=b7):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc8111773d6 offset=d6):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fc8111773d6 offset=d6):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fc8111773d6 offset=d6):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fc8111773d6 offset=d6):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fc8111773d9 offset=d9):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fc8111773d9 offset=d9):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fc8111773d9 offset=d9):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
ScopeDesc(pc=0x00007fc8111773d9 offset=d9):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc8111773e9 offset=e9):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fc8111773e9 offset=e9):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fc8111773e9 offset=e9):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fc8111773e9 offset=e9):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fc8111773f4 offset=f4):
   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
ScopeDesc(pc=0x00007fc8111773f4 offset=f4):
   jdk.incubator.vector.Int512Vector::fromArray0@3 (line 805)
ScopeDesc(pc=0x00007fc8111773f4 offset=f4):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fc8111773f4 offset=f4):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fc8111773fc offset=fc):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc8111773fc offset=fc):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc811177407 offset=107):
   jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
ScopeDesc(pc=0x00007fc811177407 offset=107):
   jdk.incubator.vector.Int512Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fc811177407 offset=107):
   jdk.incubator.vector.Int512Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fc811177407 offset=107):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fc811177407 offset=107):
   App::micro_vector@53 (line 23)
ScopeDesc(pc=0x00007fc811177422 offset=122):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc811177422 offset=122):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc811177424 offset=124):
   App::micro_vector@76 (line 20)  reexecute=true
   Locals
    - l0: reg xmm1 [64],oop
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rbx [6],int
    - l5: empty
    - l6: empty
ScopeDesc(pc=0x00007fc81117745b offset=15b):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc81117745b offset=15b):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc8111774a8 offset=1a8):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007fc8111774b1 offset=1b1):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc8111774b1 offset=1b1):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc8111774b5 offset=1b5):
   App::micro_vector@98 (line 26)
ScopeDesc(pc=0x00007fc811177540 offset=240):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007fc8111775c7 offset=2c7):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc8111775c7 offset=2c7):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc8111775d3 offset=2d3):
   App::micro_vector@102 (line 25)
ScopeDesc(pc=0x00007fc8111775da offset=2da):
   App::micro_vector@102 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rbx [6],int
    - l5: empty
    - l6: empty
ScopeDesc(pc=0x00007fc8111775ec offset=2ec):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007fc81117760d offset=30d):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc81117760d offset=30d):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc81117761c offset=31c):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007fc811177626 offset=326):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc811177626 offset=326):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc81117762b offset=32b):
   App::micro_vector@98 (line 26)
ScopeDesc(pc=0x00007fc811177632 offset=332):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007fc811177672 offset=372):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc811177672 offset=372):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc81117767c offset=37c):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007fc81117767c offset=37c):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fc81117767c offset=37c):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[48],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fc81117767c offset=37c):
   App::micro_vector@32 (line 21)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[32],oop
    - l3: stack[16],oop
    - l4: stack[28]
    - l5: empty
    - l6: empty
ScopeDesc(pc=0x00007fc8111776c1 offset=3c1):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc8111776c1 offset=3c1):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc8111776cc offset=3cc):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007fc8111776cc offset=3cc):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fc8111776cc offset=3cc):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[48],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fc8111776cc offset=3cc):
   App::micro_vector@44 (line 22)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[32],oop
    - l4: stack[28]
    - l5: obj[255]
    - l6: empty
   Objects
    - 255: jdk.incubator.vector.Int512Vector stack[96]Wrong location type 7
ScopeDesc(pc=0x00007fc81117770d offset=40d):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc81117770d offset=40d):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc811177718 offset=418):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007fc811177718 offset=418):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fc811177718 offset=418):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: obj[263]
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fc811177718 offset=418):
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
    - 263: jdk.incubator.vector.Int512Vector stack[96]Wrong location type 7
ScopeDesc(pc=0x00007fc811177751 offset=451):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc811177751 offset=451):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc81117775c offset=45c):
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
ScopeDesc(pc=0x00007fc81117778d offset=48d):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc81117778d offset=48d):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc811177798 offset=498):
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
ScopeDesc(pc=0x00007fc8111777ce offset=4ce):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc8111777ce offset=4ce):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc8111777d8 offset=4d8):
   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
   Locals
    - l0: stack[36]
    - l1: stack[32]
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007fc8111777d8 offset=4d8):
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   Locals
    - l0: empty
    - l1: empty
ScopeDesc(pc=0x00007fc8111777d8 offset=4d8):
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
ScopeDesc(pc=0x00007fc811177806 offset=506):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc811177806 offset=506):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc811177810 offset=510):
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
ScopeDesc(pc=0x00007fc8111778b5 offset=5b5):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc8111778b5 offset=5b5):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc8111778c0 offset=5c0):
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
ScopeDesc(pc=0x00007fc8111778e4 offset=5e4):
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
ScopeDesc(pc=0x00007fc8111778f8 offset=5f8):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc8111778f8 offset=5f8):
   App::micro_vector@59 (line 23)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007fc811177208: 6014
relocInfo@0x00007fc811177208 [type=6(runtime_call) addr=0x00007fc811177314 offset=20] | [destination=0x00007fc811115c20]
         @0x00007fc81117720a: f003cc31
relocInfo@0x00007fc81117720c [type=12(metadata) addr=0x00007fc811177345 offset=49 format=3 data=3] | [metadata_addr=0x00007fc811177958 *=0x0000000800094b80 offset=0]metadata_value=0x0000000800094b80: 'jdk/incubator/vector/IntVector$IntSpecies'
         @0x00007fc81117720e: f008cc60
relocInfo@0x00007fc811177210 [type=12(metadata) addr=0x00007fc8111773a5 offset=96 format=3 data=8] | [metadata_addr=0x00007fc811177980 *=0x0000000800098c90 offset=0]metadata_value=0x0000000800098c90: 'jdk/incubator/vector/Int512Vector'
         @0x00007fc811177212: a07f
relocInfo@0x00007fc811177212 [type=10(poll) addr=0x00007fc811177424 offset=127]
         @0x00007fc811177214: a1b6
relocInfo@0x00007fc811177214 [type=10(poll) addr=0x00007fc8111775da offset=438]
         @0x00007fc811177216: b063
relocInfo@0x00007fc811177216 [type=11(poll_return) addr=0x00007fc81117763d offset=99]
         @0x00007fc811177218: 643a
relocInfo@0x00007fc811177218 [type=6(runtime_call) addr=0x00007fc811177677 offset=58 format=1] | [destination=0x00007fc8111191c0]
         @0x00007fc81117721a: f8031c4cb7b87fc87005
relocInfo@0x00007fc811177222 [type=7(external_word) addr=0x00007fc81117767c offset=5 data={1c4cb7b87fc8}] | [target=0x00007fc81c4cb7b8]
         @0x00007fc811177224: 640e
relocInfo@0x00007fc811177224 [type=6(runtime_call) addr=0x00007fc81117768a offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc811177226: 643d
relocInfo@0x00007fc811177226 [type=6(runtime_call) addr=0x00007fc8111776c7 offset=61 format=1] | [destination=0x00007fc8111191c0]
         @0x00007fc811177228: f8031c4cb7b87fc87005
relocInfo@0x00007fc811177230 [type=7(external_word) addr=0x00007fc8111776cc offset=5 data={1c4cb7b87fc8}] | [target=0x00007fc81c4cb7b8]
         @0x00007fc811177232: 640e
relocInfo@0x00007fc811177232 [type=6(runtime_call) addr=0x00007fc8111776da offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc811177234: 6439
relocInfo@0x00007fc811177234 [type=6(runtime_call) addr=0x00007fc811177713 offset=57 format=1] | [destination=0x00007fc8111191c0]
         @0x00007fc811177236: f8031c4cb7b87fc87005
relocInfo@0x00007fc81117723e [type=7(external_word) addr=0x00007fc811177718 offset=5 data={1c4cb7b87fc8}] | [target=0x00007fc81c4cb7b8]
         @0x00007fc811177240: 640e
relocInfo@0x00007fc811177240 [type=6(runtime_call) addr=0x00007fc811177726 offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc811177242: 6431
relocInfo@0x00007fc811177242 [type=6(runtime_call) addr=0x00007fc811177757 offset=49 format=1] | [destination=0x00007fc8111191c0]
         @0x00007fc811177244: f8031c4cb7b87fc87005
relocInfo@0x00007fc81117724c [type=7(external_word) addr=0x00007fc81117775c offset=5 data={1c4cb7b87fc8}] | [target=0x00007fc81c4cb7b8]
         @0x00007fc81117724e: 640e
relocInfo@0x00007fc81117724e [type=6(runtime_call) addr=0x00007fc81117776a offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc811177250: 6429
relocInfo@0x00007fc811177250 [type=6(runtime_call) addr=0x00007fc811177793 offset=41 format=1] | [destination=0x00007fc8111191c0]
         @0x00007fc811177252: f8031c4cb7b87fc87005
relocInfo@0x00007fc81117725a [type=7(external_word) addr=0x00007fc811177798 offset=5 data={1c4cb7b87fc8}] | [target=0x00007fc81c4cb7b8]
         @0x00007fc81117725c: 640e
relocInfo@0x00007fc81117725c [type=6(runtime_call) addr=0x00007fc8111777a6 offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc81117725e: 642d
relocInfo@0x00007fc81117725e [type=6(runtime_call) addr=0x00007fc8111777d3 offset=45 format=1] | [destination=0x00007fc8111191c0]
         @0x00007fc811177260: f8031c4cb7b87fc87005
relocInfo@0x00007fc811177268 [type=7(external_word) addr=0x00007fc8111777d8 offset=5 data={1c4cb7b87fc8}] | [target=0x00007fc81c4cb7b8]
         @0x00007fc81117726a: 640e
relocInfo@0x00007fc81117726a [type=6(runtime_call) addr=0x00007fc8111777e6 offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc81117726c: 6425
relocInfo@0x00007fc81117726c [type=6(runtime_call) addr=0x00007fc81117780b offset=37 format=1] | [destination=0x00007fc8111191c0]
         @0x00007fc81117726e: f8031c4cb7b87fc87005
relocInfo@0x00007fc811177276 [type=7(external_word) addr=0x00007fc811177810 offset=5 data={1c4cb7b87fc8}] | [target=0x00007fc81c4cb7b8]
         @0x00007fc811177278: 640e
relocInfo@0x00007fc811177278 [type=6(runtime_call) addr=0x00007fc81117781e offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc81117727a: f8031c6630787fc87006
relocInfo@0x00007fc811177282 [type=7(external_word) addr=0x00007fc811177824 offset=6 data={1c6630787fc8}] | [target=0x00007fc81c663078]
         @0x00007fc811177284: 640e
relocInfo@0x00007fc811177284 [type=6(runtime_call) addr=0x00007fc811177832 offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc811177286: f8031c6630787fc87006
relocInfo@0x00007fc81117728e [type=7(external_word) addr=0x00007fc811177838 offset=6 data={1c6630787fc8}] | [target=0x00007fc81c663078]
         @0x00007fc811177290: 640e
relocInfo@0x00007fc811177290 [type=6(runtime_call) addr=0x00007fc811177846 offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc811177292: f8031c6630787fc87006
relocInfo@0x00007fc81117729a [type=7(external_word) addr=0x00007fc81117784c offset=6 data={1c6630787fc8}] | [target=0x00007fc81c663078]
         @0x00007fc81117729c: 640e
relocInfo@0x00007fc81117729c [type=6(runtime_call) addr=0x00007fc81117785a offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc81117729e: f8031c6630787fc87006
relocInfo@0x00007fc8111772a6 [type=7(external_word) addr=0x00007fc811177860 offset=6 data={1c6630787fc8}] | [target=0x00007fc81c663078]
         @0x00007fc8111772a8: 640e
relocInfo@0x00007fc8111772a8 [type=6(runtime_call) addr=0x00007fc81117786e offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc8111772aa: f8031c6630787fc87006
relocInfo@0x00007fc8111772b2 [type=7(external_word) addr=0x00007fc811177874 offset=6 data={1c6630787fc8}] | [target=0x00007fc81c663078]
         @0x00007fc8111772b4: 640e
relocInfo@0x00007fc8111772b4 [type=6(runtime_call) addr=0x00007fc811177882 offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc8111772b6: f8031c6630787fc87006
relocInfo@0x00007fc8111772be [type=7(external_word) addr=0x00007fc811177888 offset=6 data={1c6630787fc8}] | [target=0x00007fc81c663078]
         @0x00007fc8111772c0: 640e
relocInfo@0x00007fc8111772c0 [type=6(runtime_call) addr=0x00007fc811177896 offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc8111772c2: f8031c6630787fc87006
relocInfo@0x00007fc8111772ca [type=7(external_word) addr=0x00007fc81117789c offset=6 data={1c6630787fc8}] | [target=0x00007fc81c663078]
         @0x00007fc8111772cc: 640e
relocInfo@0x00007fc8111772cc [type=6(runtime_call) addr=0x00007fc8111778aa offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc8111772ce: 6411
relocInfo@0x00007fc8111772ce [type=6(runtime_call) addr=0x00007fc8111778bb offset=17 format=1] | [destination=0x00007fc8111191c0]
         @0x00007fc8111772d0: f8031c4cb7b87fc87005
relocInfo@0x00007fc8111772d8 [type=7(external_word) addr=0x00007fc8111778c0 offset=5 data={1c4cb7b87fc8}] | [target=0x00007fc81c4cb7b8]
         @0x00007fc8111772da: 640e
relocInfo@0x00007fc8111772da [type=6(runtime_call) addr=0x00007fc8111778ce offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc8111772dc: 6411
relocInfo@0x00007fc8111772dc [type=6(runtime_call) addr=0x00007fc8111778df offset=17 format=1] | [destination=0x00007fc8111191c0]
         @0x00007fc8111772de: f8031c4cb7b87fc87005
relocInfo@0x00007fc8111772e6 [type=7(external_word) addr=0x00007fc8111778e4 offset=5 data={1c4cb7b87fc8}] | [target=0x00007fc81c4cb7b8]
         @0x00007fc8111772e8: 640e
relocInfo@0x00007fc8111772e8 [type=6(runtime_call) addr=0x00007fc8111778f2 offset=14 format=1] | [destination=0x00007fc81bc90ff4]
         @0x00007fc8111772ea: f2bb8006
relocInfo@0x00007fc8111772ec [type=8(internal_word) addr=0x00007fc8111778f8 offset=6 data=699] | [target=0x00007fc81117763d]
         @0x00007fc8111772ee: 6411
relocInfo@0x00007fc8111772ee [type=6(runtime_call) addr=0x00007fc811177909 offset=17 format=1] | [destination=0x00007fc811118020]
         @0x00007fc8111772f0: 0017
relocInfo@0x00007fc8111772f0 [type=0(none) addr=0x00007fc811177920 offset=23]
         @0x00007fc8111772f2: 6400
relocInfo@0x00007fc8111772f2 [type=6(runtime_call) addr=0x00007fc811177920 offset=0 format=1] | [destination=0x00007fc81105cfa0]
         @0x00007fc8111772f4: 640f
relocInfo@0x00007fc8111772f4 [type=6(runtime_call) addr=0x00007fc81117792f offset=15 format=1] | [destination=0x00007fc8111194e0]
         @0x00007fc8111772f6: 0000
relocInfo@0x00007fc8111772f6 [type=0(none) addr=0x00007fc81117792f offset=0]
         @0x00007fc8111772f8: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fc7b9eef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fc7b9eeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fc7b9eeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$ImplCache
  method  = {method} {0x00007fc7b9e11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$ImplCache
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 7 entries, 60 bytes):
{
   < 0x00007fc811177334, 0x00007fc8111778b0 > < 0x00007fc811177340, 0x00007fc8111778d4 > < 0x00007fc811177386, 0x00007fc811177770 > 
   < 0x00007fc8111773a0, 0x00007fc811177770 > < 0x00007fc8111773b1, 0x00007fc811177770 > < 0x00007fc811177440, 0x00007fc8111777ec > 
   < 0x00007fc811177460, 0x00007fc8111777ec > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x00000000fb000380 a 'java/lang/Class'{0x00000000fb000380} = 'jdk/incubator/vector/Int512Vector'
#2: 0x00000000fb000308 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x00000000fb000308}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
# 0: 0x0000000000000000 NULL-oop
# 1: 0x00007fc7b9c11818 {method} {0x00007fc7b9c11818} 'micro_vector' '([I[I[I)V' in 'App'
# 2: 0x00007fc7b9c12d08 {method} {0x00007fc7b9c12d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
# 3: 0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
# 4: 0x00007fc7b9e1e040 {method} {0x00007fc7b9e1e040} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
# 5: 0x00007fc7b9c12728 {method} {0x00007fc7b9c12728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
# 6: 0x00007fc7b9e18468 {method} {0x00007fc7b9e18468} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
# 7: 0x00007fc7b9e1eb40 {method} {0x00007fc7b9e1eb40} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
# 8: 0x0000000800098c90 'jdk/incubator/vector/Int512Vector'
# 9: 0x00007fc7b9e84038 {method} {0x00007fc7b9e84038} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
#10: 0x00007fc7b9960ca0 {method} {0x00007fc7b9960ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
#11: 0x00007fc7b9e5ac10 {method} {0x00007fc7b9e5ac10} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int512Vector'
#12: 0x00007fc7b9c13798 {method} {0x00007fc7b9c13798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#13: 0x00007fc7b9c1f8d8 {method} {0x00007fc7b9c1f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#14: 0x00007fc7b9e5c080 {method} {0x00007fc7b9e5c080} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int512Vector'
#15: 0x00007fc7b9e58f18 {method} {0x00007fc7b9e58f18} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int512Vector;' in 'jdk/incubator/vector/Int512Vector'
#16: 0x00007fc7b9c1e8d8 {method} {0x00007fc7b9c1e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#17: 0x00007fc7b9e84340 {method} {0x00007fc7b9e84340} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
#18: 0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
#19: 0x00007fc7b9eef250 {method} {0x00007fc7b9eef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#20: 0x00007fc7b9eeede8 {method} {0x00007fc7b9eeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#21: 0x00007fc7b9eeeec0 {method} {0x00007fc7b9eeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#22: 0x00007fc7b9e11968 {method} {0x00007fc7b9e11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VECTOR : [Time] 220 ms   [Res] 99999000000000
VECTOR_MASKED : [Time] 3002 ms   [Res] 999990000000000
------------------------------------------------------------------------
App::micro_vector([I[I[I)V
  interpreter_invocation_count:       81 
  invocation_counter:              10000 
  backedge_counter:                 5167 
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
                                    'jdk/incubator/vector/IntVector$IntSpecies'(503032 1.00)
22 if_icmpge 79
  56  bci: 22   BranchData          taken(81) displacement(256)
                                    not taken(502951)
25 fast_aaccess_0
26 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
29 aload_2
30 fast_iload #4
32 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  88  bci: 32   CounterData         count(502951)
35 astore #5
37 fast_aaccess_0
38 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
41 aload_3
42 fast_iload #4
44 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  104 bci: 44   CounterData         count(502951)
47 astore #6
49 aload #5
51 aload #6
53 invokevirtual 28 <jdk/incubator/vector/IntVector.add(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;> 
  120 bci: 53   VirtualCallData     count(502951) nonprofiled_count(0) entries(0)
56 aload_1
57 fast_iload #4
59 invokevirtual 32 <jdk/incubator/vector/IntVector.intoArray([II)V> 
  176 bci: 59   VirtualCallData     count(502951) nonprofiled_count(0) entries(0)
62 fast_iload #4
64 fast_aaccess_0
65 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
68 invokeinterface 36 <jdk/incubator/vector/VectorSpecies.length()I> 
  232 bci: 68   VirtualCallData     count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/IntVector$IntSpecies'(502951 1.00)
73 iadd
74 istore #4
76 goto 9
  288 bci: 76   JumpData            taken(502951) displacement(-288)
79 fast_iload #4
81 aload_1
82 arraylength
83 if_icmpge 105
  312 bci: 83   BranchData          taken(81) displacement(56)
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
