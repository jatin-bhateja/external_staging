CompileCommand: dontinline App.micro_vector bool dontinline = true
CompileCommand: print App.micro_vector bool print = true
OpenJDK 64-Bit Server VM warning: printing of assembly code is enabled; turning on DebugNonSafepoints to gain additional output
Warning:  TraceDependencies results may be inflated by VerifyDependencies
SCALAR : [Time] 2270 ms   [Res] 999990000000000

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 226 ------------------------
{method}
 - this oop:          0x00007f7191811818
 - method holder:     'App'
 - constants:         0x00007f7191811090 constant pool [134]/operands[15] {0x00007f7191811090} for 'App' cache=0x00007f7191b00000
 - access:            0xc1000001  public 
 - name:              'micro_vector'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        7
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007f71e900e220
 - adapters:          AHE@0x00007f71ec3b6230: 0xbbbb0000 i2c: 0x00007f71e907f6e0 c2i: 0x00007f71e907f7cc c2iUV: 0x00007f71e907f796 c2iNCI: 0x00007f71e907f809
 - compiled entry     0x00007f71e907f7cc
 - code size:         106
 - code start:        0x00007f7191811798
 - code end (excl):   0x00007f7191811802
 - method data:       0x00007f7191b00bb8
 - checked ex length: 0
 - linenumber start:  0x00007f7191811802
 - localvar length:   0

------------------------ OptoAssembly for Compile_id = 226 -----------------------
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
	subq    rsp, #112	# Create frame

02c     movdq   XMM1, RSI	# spill
031     movl    R11, [RDX + #12 (8-bit)]	# range
035     NullCheck RDX

035     B2: #	out( B65 B3 ) <- in( B1 )  Freq: 0.999999
035     movl    RBP, [RSI + #12 (8-bit)]	# compressed ptr ! Field: App.SPECIES
        nop 	# 8 bytes pad for loops and calls
040     movl    R9, [R12 + RBP << 3 + #8] (compressed oop addressing)	# compressed klass ptr
045     NullCheck RBP

045     B3: #	out( B53 B4 ) <- in( B2 )  Freq: 0.999998
045     cmpl    R9, narrowklass: precise klass jdk/incubator/vector/IntVector$IntSpecies: 0x00007f71700f2370:Constant:exact *	# compressed klass ptr
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
066     jne     B55  P=0.000000 C=15050.000000

06c     B5: #	out( B52 B6 ) <- in( B4 )  Freq: 0.999996
06c     andnl  R10, R10, R11
071     movl    RBP, R11	# spill
074     addl    RBP, #-7	# int
077     # TLS is in R15
077     xorl    RSI, RSI	# int
079     testl   R10, R10
        nop 	# 4 bytes pad for loops and calls
080     jle     B52  P=0.000079 C=314577.000000

086     B6: #	out( B54 B7 ) <- in( B5 )  Freq: 0.999917
086     movl    R9, [RCX + #12 (8-bit)]	# range
08a     NullCheck RCX

08a     B7: #	out( B54 B8 ) <- in( B6 )  Freq: 0.999916
08a     subl    R9, RAX	# int
08d     incl    R9	# int
090     testl   R9, R9
093     jl     B54  P=0.000001 C=-1.000000

099     B8: #	out( B54 B9 ) <- in( B7 )  Freq: 0.999915
099     movl    RDI, [RBX + #68 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.dummyVector (constant)
        nop 	# 4 bytes pad for loops and calls
0a0     movl    RDI, [R12 + RDI << 3 + #8] (compressed oop addressing)	# compressed klass ptr
0a5     NullCheck RDI

0a5     B9: #	out( B54 B10 ) <- in( B8 )  Freq: 0.999914
0a5     cmpl    RDI, narrowklass: precise klass jdk/incubator/vector/Int256Vector: 0x00007f71702212d0:Constant:exact *	# compressed klass ptr
0ab     jne,u   B54  P=0.000001 C=-1.000000

0b1     B10: #	out( B54 B11 ) <- in( B9 )  Freq: 0.999913
0b1     movl    RDI, [R8 + #12 (8-bit)]	# range
0b5     NullCheck R8

0b5     B11: #	out( B54 B12 ) <- in( B10 )  Freq: 0.999912
0b5     subl    RDI, RAX	# int
0b7     incl    RDI	# int
0b9     testl   RDI, RDI
        nop 	# 5 bytes pad for loops and calls
0c0     jl     B54  P=0.000001 C=-1.000000

0c6     B12: #	out( B54 B13 ) <- in( B11 )  Freq: 0.999911
0c6     testl   RBP, RBP
0c8     jl     B54  P=0.000001 C=-1.000000

0ce     B13: #	out( B14 ) <- in( B12 )  Freq: 0.99991
0ce     movdq   XMM0, RBX	# spill
0d3     movl    R13, R11	# spill
0d6     # castII of RDI
0d6     # castII of R9
0d6     movl    R11, RBP	# spill
0d9     # castII of R11
0d9     xorl    RBX, RBX	# int
        nop 	# 5 bytes pad for loops and calls

0e0     B14: #	out( B49 B15 ) <- in( B13 B17 ) Loop( B14-B17 inner ) Freq: 12121.2
0e0     cmpl    RBX, R9	# unsigned
0e3     jnb,u   B49  P=0.000001 C=-1.000000

0e9     B15: #	out( B50 B16 ) <- in( B14 )  Freq: 12121.2
0e9     # castII of RBX
0e9     load_vector XMM2,[RCX + #16 + RBX << #2]
0ef     cmpl    RBX, RDI	# unsigned
0f1     jnb,u   B50  P=0.000001 C=-1.000000

0f7     B16: #	out( B51 B17 ) <- in( B15 )  Freq: 12121.2
0f7     vpaddd  XMM2,XMM2,[R8 + #16 + RBX << #2]	! add packedI
        nop 	# 2 bytes pad for loops and calls
100     cmpl    RBX, R11	# unsigned
103     jnb,u   B51  P=0.000001 C=-1.000000

109     B17: #	out( B14 B18 ) <- in( B16 )  Freq: 12121.2
109     store_vector [RDX + #16 + RBX << #2],XMM2
	
10f     movq    R14, [R15 + #304 (32-bit)]	# ptr
116     addl    RBX, RAX	# int
118     testl   rax, [R14]	# Safepoint: poll for GC        # App::micro_vector @ bci:76 (line 20) L[0]=XMM1 L[1]=RDX L[2]=RCX L[3]=R8 L[4]=_ L[5]=_ L[6]=RBX
        # OopMap {r8=Oop rcx=Oop rdx=Oop xmm0=Oop xmm1=Oop off=280/0x118}
        nop 	# 5 bytes pad for loops and calls
120     cmpl    RBX, R10
123     jl,s   B14  P=0.999921 C=314551.000000

125     B18: #	out( B19 ) <- in( B17 )  Freq: 0.963063
125     movl    R11, R13	# spill

128     B19: #	out( B48 B20 ) <- in( B18 B52 )  Freq: 0.963143
128     cmpl    RBX, R11
12b     jge     B48  P=0.500000 C=-1.000000

131     B20: #	out( B56 B21 ) <- in( B19 )  Freq: 0.481571
131     movl    R10, [RCX + #12 (8-bit)]	# range
135     NullCheck RCX

135     B21: #	out( B56 B22 ) <- in( B20 )  Freq: 0.481571
135     cmpl    RBX, R10	# unsigned
138     jnb,u   B56  P=0.000001 C=-1.000000

13e     B22: #	out( B56 B23 ) <- in( B21 )  Freq: 0.48157
13e     movl    RAX, R11	# spill
141     decl    RAX	# int
143     cmpl    RAX, R10	# unsigned
146     jnb,u   B56  P=0.000001 C=-1.000000

14c     B23: #	out( B56 B24 ) <- in( B22 )  Freq: 0.48157
14c     movl    R9, [R8 + #12 (8-bit)]	# range
150     NullCheck R8

150     B24: #	out( B56 B25 ) <- in( B23 )  Freq: 0.48157
150     cmpl    RBX, R9	# unsigned
153     jnb,u   B56  P=0.000001 C=-1.000000

159     B25: #	out( B56 B26 ) <- in( B24 )  Freq: 0.481569
159     cmpl    RAX, R9	# unsigned
        nop 	# 4 bytes pad for loops and calls
160     jnb,u   B56  P=0.000001 C=-1.000000

166     B26: #	out( B56 B27 ) <- in( B25 )  Freq: 0.481569
166     cmpl    RBX, R11	# unsigned
169     jnb,u   B56  P=0.000001 C=-1.000000

16f     B27: #	out( B56 B28 ) <- in( B26 )  Freq: 0.481568
16f     cmpl    RAX, R11	# unsigned
172     jnb,u   B56  P=0.000001 C=-1.000000

178     B28: #	out( B29 ) <- in( B27 )  Freq: 0.481568
178     movl    RAX, RDX	# ptr -> int
17a     shrl    RAX, #2
17d     andl    RAX, #7	# int
180     addl    RAX, RBX	# int
182     movl    RDI, #3	# int
187     subl    RDI, RAX	# int
189     andl    RDI, #7	# int
18c     addl    RDI, RBX	# int
18e     incl    RDI	# int
190     cmpl    RDI, R11
193     cmovlgt RDI, R11	# min
        nop 	# 1 bytes pad for loops and calls

198     B29: #	out( B29 B30 ) <- in( B28 B29 ) Loop( B29-B29 inner pre of N1916) Freq: 4.81567
198     movl    RAX, [R8 + #16 + RBX << #2]	# int
19d     addl    RAX, [RCX + #16 + RBX << #2]	# int
1a1     movl    [RDX + #16 + RBX << #2], RAX	# int
1a5     incl    RBX	# int
1a7     cmpl    RBX, RDI
1a9     jl,s   B29	# loop end  P=0.900000 C=-1.000000

1ab     B30: #	out( B45 B31 ) <- in( B29 )  Freq: 0.481568
1ab     movl    RAX, R11	# spill
1ae     addl    RAX, #-31	# int
1b1     cmpl    RBX, RAX
1b3     jge     B45  P=0.000001 C=-1.000000

1b9     B31: #	out( B57 B32 ) <- in( B30 )  Freq: 0.481567
1b9     # castII of RBX
1b9     cmpl    RBX, R11	# unsigned
        nop 	# 4 bytes pad for loops and calls
1c0     jnb,u   B57  P=0.000001 C=-1.000000

1c6     B32: #	out( B58 B33 ) <- in( B31 )  Freq: 0.481567
1c6     cmpl    RBX, R9	# unsigned
1c9     jnb,u   B58  P=0.000001 C=-1.000000

1cf     B33: #	out( B59 B34 ) <- in( B32 )  Freq: 0.481566
1cf     cmpl    RBX, R10	# unsigned
1d2     jnb,u   B59  P=0.000001 C=-1.000000

1d8     B34: #	out( B60 B35 ) <- in( B33 )  Freq: 0.481566
1d8     movl    RDI, RBX	# spill
1da     addl    RDI, #31	# int
        nop 	# 3 bytes pad for loops and calls
1e0     cmpl    RDI, R10	# unsigned
1e3     jnb,u   B60  P=0.000001 C=-1.000000

1e9     B35: #	out( B61 B36 ) <- in( B34 )  Freq: 0.481565
1e9     cmpl    RDI, R9	# unsigned
1ec     jnb,u   B61  P=0.000001 C=-1.000000

1f2     B36: #	out( B62 B37 ) <- in( B35 )  Freq: 0.481565
1f2     cmpl    RBX, R11	# unsigned
1f5     jnb,u   B62  P=0.000001 C=-1.000000

1fb     B37: #	out( B63 B38 ) <- in( B36 )  Freq: 0.481564
        nop 	# 5 bytes pad for loops and calls
200     cmpl    RDI, R11	# unsigned
203     jnb,u   B63  P=0.000001 C=-1.000000

209     B38: #	out( B39 ) <- in( B37 )  Freq: 0.481564
209     movl    R9, #32000	# int

20f     B39: #	out( B40 ) <- in( B38 B41 ) Loop( B39-B41 ) Freq: 4.81564
20f     movl    R10, R11	# spill
212     subl    R10, RBX	# int
215     addl    R10, #-31	# int
219     cmpl    RAX, RBX
21b     cmovll R10, RSI	# signed, int
21f     cmpl    R10, #32000	# unsigned
226     cmovlnbe R10, R9	# unsigned, int
22a     addl    R10, RBX	# int
        nop 	# 3 bytes pad for loops and calls

230     B40: #	out( B40 B41 ) <- in( B39 B40 ) Loop( B40-B40 inner main of N298 strip mined) Freq: 48.1563
230     load_vector XMM0,[RCX + #16 + RBX << #2]
236     vpaddd  XMM0,XMM0,[R8 + #16 + RBX << #2]	! add packedI
23d     store_vector [RDX + #16 + RBX << #2],XMM0
	
243     movslq  RDI, RBX	# i2l
246     load_vector XMM0,[RCX + #48 + RDI << #2]
24c     vpaddd  XMM0,XMM0,[R8 + #48 + RDI << #2]	! add packedI
253     store_vector [RDX + #48 + RDI << #2],XMM0
	
259     load_vector XMM0,[RCX + #80 + RDI << #2]
25f     vpaddd  XMM0,XMM0,[R8 + #80 + RDI << #2]	! add packedI
266     store_vector [RDX + #80 + RDI << #2],XMM0
	
26c     load_vector XMM0,[RCX + #112 + RDI << #2]
272     vpaddd  XMM0,XMM0,[R8 + #112 + RDI << #2]	! add packedI
279     store_vector [RDX + #112 + RDI << #2],XMM0
	
27f     addl    RBX, #32	# int
282     cmpl    RBX, R10
285     jl,s   B40	# loop end  P=0.900000 C=-1.000000

287     B41: #	out( B39 B42 ) <- in( B40 )  Freq: 4.81564
287     movq    R10, [R15 + #304 (32-bit)]	# ptr
28e     testl   rax, [R10]	# Safepoint: poll for GC        # App::micro_vector @ bci:102 (line 25) L[0]=_ L[1]=RDX L[2]=RCX L[3]=R8 L[4]=_ L[5]=_ L[6]=RBX
        # OopMap {r8=Oop rcx=Oop rdx=Oop off=654/0x28e}
291     cmpl    RBX, RAX
293     jl     B39  P=0.900000 C=-1.000000

299     B42: #	out( B45 B43 ) <- in( B41 )  Freq: 0.481564
299     cmpl    RBX, RBP
29b     jge,s   B45  P=0.500000 C=-1.000000

29d     B43: #	out( B44 ) <- in( B42 )  Freq: 0.240782
29d     # castII of RBX
        nop 	# 3 bytes pad for loops and calls

2a0     B44: #	out( B44 B45 ) <- in( B43 B44 ) Loop( B44-B44 inner post of N2614) Freq: 2.40782
2a0     load_vector XMM0,[RCX + #16 + RBX << #2]
2a6     vpaddd  XMM0,XMM0,[R8 + #16 + RBX << #2]	! add packedI
2ad     store_vector [RDX + #16 + RBX << #2],XMM0
	
2b3     addl    RBX, #8	# int
2b6     cmpl    RBX, RBP
2b8     jl,s   B44	# loop end  P=0.900000 C=-1.000000

2ba     B45: #	out( B48 B46 ) <- in( B30 B44 B42 )  Freq: 0.481564
        nop 	# 6 bytes pad for loops and calls
2c0     cmpl    RBX, R11
2c3     jge,s   B48  P=0.500000 C=-1.000000

2c5     B46: #	out( B47 ) <- in( B45 )  Freq: 0.240782
2c5     # castII of RBX
        nop 	# 3 bytes pad for loops and calls

2c8     B47: #	out( B47 B48 ) <- in( B46 B47 ) Loop( B47-B47 inner post of N1916) Freq: 2.40782
2c8     movl    R9, [R8 + #16 + RBX << #2]	# int
2cd     addl    R9, [RCX + #16 + RBX << #2]	# int
2d2     movl    [RDX + #16 + RBX << #2], R9	# int
2d7     incl    RBX	# int
2d9     cmpl    RBX, R11
2dc     jl,s   B47	# loop end  P=0.900000 C=-1.000000

2de     B48: #	out( N625 ) <- in( B47 B45 B19 )  Freq: 0.963136
2de     vzeroupper
	addq    rsp, 112	# Destroy frame
	popq    rbp
	cmpq     rsp, poll_offset[r15_thread] 
	ja       #safepoint_stub	# Safepoint: poll for GC

2f3     ret

2f4     B49: #	out( N625 ) <- in( B14 )  Freq: 0.0122822
2f4     movl    RSI, #-28	# int
2f9     movdq   RBP, XMM1	# spill
2fe     movq    [rsp + #0], RDX	# spill
302     movq    [rsp + #16], R8	# spill
307     movq    [rsp + #32], RCX	# spill
30c     movl    [rsp + #28], RBX	# spill
310     movl    [rsp + #40], R9	# spill
315     movsd   [rsp + #48], XMM0	# spill
        nop 	# 1 bytes pad for loops and calls
31c     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #28 STK[1]=rsp + #40 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2689) L[0]=rsp + #48 L[1]=rsp + #32 L[2]=_ L[3]=_
        # App::micro_vector @ bci:32 (line 21) L[0]=RBP L[1]=rsp + #0 L[2]=rsp + #32 L[3]=rsp + #16 L[4]=_ L[5]=_ L[6]=rsp + #28
        # OopMap {rbp=Oop [0]=Oop [16]=Oop [32]=Oop [48]=Oop off=804/0x324}
324     stop	# ShouldNotReachHere

338     B50: #	out( N625 ) <- in( B15 )  Freq: 0.0122822
338     movl    RSI, #-28	# int
33d     movdq   RBP, XMM1	# spill
342     movq    [rsp + #0], RDX	# spill
346     movq    [rsp + #8], RCX	# spill
34b     movq    [rsp + #32], R8	# spill
350     movl    [rsp + #28], RBX	# spill
354     movl    [rsp + #40], RDI	# spill
358     vmovdqu [rsp + 64],XMM2	# spill
35e     movsd   [rsp + #48], XMM0	# spill
364     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #28 STK[1]=rsp + #40 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::fromArray @ bci:9 (line 2689) L[0]=rsp + #48 L[1]=rsp + #32 L[2]=_ L[3]=_
        # App::micro_vector @ bci:44 (line 22) L[0]=RBP L[1]=rsp + #0 L[2]=rsp + #8 L[3]=rsp + #32 L[4]=#ScObj0 L[5]=_ L[6]=rsp + #28
        # ScObj0 jdk/incubator/vector/Int256Vector={ [payload :0]=rsp + #64 }
        # OopMap {rbp=Oop [0]=Oop [8]=Oop [32]=Oop [48]=Oop off=876/0x36c}
36c     stop	# ShouldNotReachHere

380     B51: #	out( N625 ) <- in( B16 )  Freq: 0.0122821
380     movl    RSI, #-28	# int
385     movdq   RBP, XMM1	# spill
38a     movq    [rsp + #8], RCX	# spill
38f     movq    [rsp + #16], R8	# spill
394     movq    [rsp + #32], RDX	# spill
399     movl    [rsp + #28], RBX	# spill
39d     movl    [rsp + #40], R11	# spill
3a2     vmovdqu [rsp + 64],XMM2	# spill
3a8     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # java.util.Objects::checkIndex @ bci:3 (line 359) L[0]=_ L[1]=_ STK[0]=rsp + #28 STK[1]=rsp + #40 STK[2]=#NULL
        # jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize @ bci:43 (line 74) L[0]=_ L[1]=_ L[2]=_
        # jdk.incubator.vector.IntVector::intoArray @ bci:7 (line 2960) L[0]=#ScObj0 L[1]=rsp + #32 L[2]=_ L[3]=_
        # ScObj0 jdk/incubator/vector/Int256Vector={ [payload :0]=rsp + #64 }
        # App::micro_vector @ bci:59 (line 23) L[0]=RBP L[1]=rsp + #32 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=_ L[5]=_ L[6]=rsp + #28
        # OopMap {rbp=Oop [8]=Oop [16]=Oop [32]=Oop off=944/0x3b0}
3b0     stop	# ShouldNotReachHere

3c4     B52: #	out( B19 ) <- in( B5 )  Freq: 7.94715e-05
3c4     xorl    RBX, RBX	# int
3c6     jmp     B19

3cb     B53: #	out( N625 ) <- in( B3 )  Freq: 9.99998e-07
3cb     movl    RSI, #-34	# int
3d0     movsd   [rsp + #0], XMM1	# spill
3d5     movq    [rsp + #8], RDX	# spill
3da     movq    [rsp + #16], RCX	# spill
3df     movq    [rsp + #24], R8	# spill
3e4     movl    [rsp + #32], R11	# spill
        nop 	# 3 bytes pad for loops and calls
3ec     call,static  wrapper for: uncommon_trap(reason='class_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:17 (line 20) L[0]=rsp + #0 L[1]=rsp + #8 L[2]=rsp + #16 L[3]=rsp + #24 L[4]=_ L[5]=_ L[6]=#0 STK[0]=#0 STK[1]=RBP STK[2]=rsp + #32
        # OopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop off=1012/0x3f4}
3f4     stop	# ShouldNotReachHere

408     B54: #	out( N625 ) <- in( B11 B12 B6 B7 B8 B9 B10 )  Freq: 7.03923e-06
408     movl    RSI, #-138	# int
40d     movdq   RBP, XMM1	# spill
412     movq    [rsp + #0], RDX	# spill
416     movq    [rsp + #8], RCX	# spill
41b     movq    [rsp + #16], R8	# spill
420     movl    [rsp + #24], R10	# spill
        nop 	# 3 bytes pad for loops and calls
428     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:22 (line 20) L[0]=RBP L[1]=rsp + #0 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=_ L[5]=_ L[6]=#0 STK[0]=#0 STK[1]=rsp + #24
        # OopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop off=1072/0x430}
430     stop	# ShouldNotReachHere

444     B55: #	out( N625 ) <- in( B4 )  Freq: 4.99998e-07
444     movl    RSI, #-187	# int
449     movsd   [rsp + #0], XMM1	# spill
44e     movq    [rsp + #8], RDX	# spill
453     movq    [rsp + #16], RCX	# spill
458     movq    [rsp + #24], R8	# spill
45d     movl    [rsp + #32], RAX	# spill
461     movl    [rsp + #36], R11	# spill
        nop 	# 2 bytes pad for loops and calls
468     call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # jdk.incubator.vector.VectorIntrinsics::roundDown @ bci:5 (line 106) L[0]=rsp + #36 L[1]=rsp + #32 STK[0]=RBP
        # jdk.incubator.vector.AbstractSpecies::loopBound @ bci:5 (line 203) L[0]=_ L[1]=_
        # App::micro_vector @ bci:17 (line 20) L[0]=rsp + #0 L[1]=rsp + #8 L[2]=rsp + #16 L[3]=rsp + #24 L[4]=_ L[5]=_ L[6]=#0 STK[0]=#0
        # OopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop off=1136/0x470}
470     stop	# ShouldNotReachHere

484     B56: #	out( N625 ) <- in( B25 B20 B21 B22 B27 B26 B23 B24 )  Freq: 3.90372e-06
484     movl    RSI, #-138	# int
489     movq    RBP, RDX	# spill
48c     movq    [rsp + #0], RCX	# spill
490     movq    [rsp + #8], R8	# spill
495     movl    [rsp + #20], RBX	# spill
499     movl    [rsp + #24], R11	# spill
        nop 	# 2 bytes pad for loops and calls
4a0     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:83 (line 25) L[0]=_ L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #8 L[4]=_ L[5]=_ L[6]=rsp + #20 STK[0]=rsp + #20 STK[1]=rsp + #24
        # OopMap {rbp=Oop [0]=Oop [8]=Oop off=1192/0x4a8}
4a8     stop	# ShouldNotReachHere

4bc     B57: #	out( N625 ) <- in( B31 )  Freq: 4.87962e-07
4bc     stop	# ShouldNotReachHere

4d0     B58: #	out( N625 ) <- in( B32 )  Freq: 4.87961e-07
4d0     stop	# ShouldNotReachHere

4e4     B59: #	out( N625 ) <- in( B33 )  Freq: 4.87961e-07
4e4     stop	# ShouldNotReachHere

4f8     B60: #	out( N625 ) <- in( B34 )  Freq: 4.8796e-07
4f8     stop	# ShouldNotReachHere

50c     B61: #	out( N625 ) <- in( B35 )  Freq: 4.8796e-07
50c     stop	# ShouldNotReachHere

520     B62: #	out( N625 ) <- in( B36 )  Freq: 4.87959e-07
520     stop	# ShouldNotReachHere

534     B63: #	out( N625 ) <- in( B37 )  Freq: 4.87959e-07
534     stop	# ShouldNotReachHere

548     B64: #	out( N625 ) <- in( B1 )  Freq: 1.01328e-06
548     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
550     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:16 (line 20) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ STK[0]=_ STK[1]=_ STK[2]=#NULL
        # OopMap {off=1368/0x558}
558     stop	# ShouldNotReachHere

56c     B65: #	out( N625 ) <- in( B2 )  Freq: 1.01328e-06
56c     movl    RSI, #-10	# int
571     movl    RBP, R11	# spill
574     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_vector @ bci:17 (line 20) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ L[5]=_ L[6]=_ STK[0]=_ STK[1]=#NULL STK[2]=RBP
        # OopMap {off=1404/0x57c}
57c     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)   10061  226             App::micro_vector (106 bytes)
 total in heap  [0x00007f71e9177e90,0x00007f71e9178d80] = 3824
 relocation     [0x00007f71e9178008,0x00007f71e91780f8] = 240
 main code      [0x00007f71e9178100,0x00007f71e91786c0] = 1472
 stub code      [0x00007f71e91786c0,0x00007f71e91786d8] = 24
 oops           [0x00007f71e91786d8,0x00007f71e91786e8] = 16
 metadata       [0x00007f71e91786e8,0x00007f71e9178798] = 176
 scopes data    [0x00007f71e9178798,0x00007f71e9178a00] = 616
 scopes pcs     [0x00007f71e9178a00,0x00007f71e9178d30] = 816
 dependencies   [0x00007f71e9178d30,0x00007f71e9178d40] = 16
 nul chk table  [0x00007f71e9178d40,0x00007f71e9178d80] = 64

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Entry Point]
  # {method} {0x00007f7191811818} 'micro_vector' '([I[I[I)V' in 'App'
  # this:     rsi:rsi   = 'App'
  # parm0:    rdx:rdx   = '[I'
  # parm1:    rcx:rcx   = '[I'
  # parm2:    r8:r8     = '[I'
  #           [sp+0x80]  (sp of caller)
 ;; N625: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f71e9178100:   mov    0x8(%rsi),%r10d
  0x00007f71e9178104:   movabs $0x800000000,%r11
  0x00007f71e917810e:   add    %r11,%r10
  0x00007f71e9178111:   cmp    %r10,%rax
  0x00007f71e9178114:   jne    0x00007f71e9115920           ;   {runtime_call ic_miss_stub}
  0x00007f71e917811a:   nop
  0x00007f71e917811b:   nop
  0x00007f71e917811c:   nop
  0x00007f71e917811d:   nop
  0x00007f71e917811e:   nop
  0x00007f71e917811f:   nop
[Verified Entry Point]
 ;; B1: #	out( B64 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f71e9178120:   mov    %eax,-0x16000(%rsp)
  0x00007f71e9178127:   push   %rbp
  0x00007f71e9178128:   sub    $0x70,%rsp                   ;*synchronization entry
                                                            ; - App::micro_vector@-1 (line 15)
  0x00007f71e917812c:   vmovq  %rsi,%xmm1
  0x00007f71e9178131:   mov    0xc(%rdx),%r11d              ; implicit exception: dispatches to 0x00007f71e9178648
                                                            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B2: #	out( B65 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007f71e9178135:   mov    0xc(%rsi),%ebp               ;*getfield SPECIES {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@12 (line 20)
  0x00007f71e9178138:   nop
  0x00007f71e9178139:   nop
  0x00007f71e917813a:   nop
  0x00007f71e917813b:   nop
  0x00007f71e917813c:   nop
  0x00007f71e917813d:   nop
  0x00007f71e917813e:   nop
  0x00007f71e917813f:   nop
  0x00007f71e9178140:   mov    0x8(%r12,%rbp,8),%r9d        ; implicit exception: dispatches to 0x00007f71e917866c
 ;; B3: #	out( B53 B4 ) <- in( B2 )  Freq: 0.999998
  0x00007f71e9178145:   cmp    $0x94b80,%r9d                ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
                                                            ;   {metadata('jdk/incubator/vector/IntVector$IntSpecies')}
  0x00007f71e917814c:   jne    0x00007f71e91784cb
 ;; B4: #	out( B55 B5 ) <- in( B3 )  Freq: 0.999997
  0x00007f71e9178152:   lea    (%r12,%rbp,8),%rbx           ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
  0x00007f71e9178156:   mov    0xc(%rbx),%eax               ;*getfield laneCount {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
                                                            ; - App::micro_vector@17 (line 20)
  0x00007f71e9178159:   mov    %eax,%r10d
  0x00007f71e917815c:   dec    %r10d
  0x00007f71e917815f:   mov    %eax,%ebp
  0x00007f71e9178161:   and    %r10d,%ebp
  0x00007f71e9178164:   test   %ebp,%ebp
  0x00007f71e9178166:   jne    0x00007f71e9178544
 ;; B5: #	out( B52 B6 ) <- in( B4 )  Freq: 0.999996
  0x00007f71e917816c:   andn   %r11d,%r10d,%r10d
  0x00007f71e9178171:   mov    %r11d,%ebp                   ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e9178174:   add    $0xfffffff9,%ebp             ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@76 (line 20)
  0x00007f71e9178177:   xor    %esi,%esi
  0x00007f71e9178179:   test   %r10d,%r10d
  0x00007f71e917817c:   nop
  0x00007f71e917817d:   nop
  0x00007f71e917817e:   nop
  0x00007f71e917817f:   nop
  0x00007f71e9178180:   jle    0x00007f71e91784c4
 ;; B6: #	out( B54 B7 ) <- in( B5 )  Freq: 0.999917
  0x00007f71e9178186:   mov    0xc(%rcx),%r9d               ; implicit exception: dispatches to 0x00007f71e9178508
 ;; B7: #	out( B54 B8 ) <- in( B6 )  Freq: 0.999916
  0x00007f71e917818a:   sub    %eax,%r9d
  0x00007f71e917818d:   inc    %r9d
  0x00007f71e9178190:   test   %r9d,%r9d
  0x00007f71e9178193:   jl     0x00007f71e9178508           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B8: #	out( B54 B9 ) <- in( B7 )  Freq: 0.999915
  0x00007f71e9178199:   mov    0x44(%rbx),%edi              ;*getfield dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007f71e917819c:   nop
  0x00007f71e917819d:   nop
  0x00007f71e917819e:   nop
  0x00007f71e917819f:   nop
  0x00007f71e91781a0:   mov    0x8(%r12,%rdi,8),%edi        ; implicit exception: dispatches to 0x00007f71e9178508
 ;; B9: #	out( B54 B10 ) <- in( B8 )  Freq: 0.999914
  0x00007f71e91781a5:   cmp    $0x98110,%edi                ;   {metadata('jdk/incubator/vector/Int256Vector')}
  0x00007f71e91781ab:   jne    0x00007f71e9178508
 ;; B10: #	out( B54 B11 ) <- in( B9 )  Freq: 0.999913
  0x00007f71e91781b1:   mov    0xc(%r8),%edi                ; implicit exception: dispatches to 0x00007f71e9178508
 ;; B11: #	out( B54 B12 ) <- in( B10 )  Freq: 0.999912
  0x00007f71e91781b5:   sub    %eax,%edi                    ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e91781b7:   inc    %edi
  0x00007f71e91781b9:   test   %edi,%edi
  0x00007f71e91781bb:   nop
  0x00007f71e91781bc:   nop
  0x00007f71e91781bd:   nop
  0x00007f71e91781be:   nop
  0x00007f71e91781bf:   nop
  0x00007f71e91781c0:   jl     0x00007f71e9178508
 ;; B12: #	out( B54 B13 ) <- in( B11 )  Freq: 0.999911
  0x00007f71e91781c6:   test   %ebp,%ebp
  0x00007f71e91781c8:   jl     0x00007f71e9178508
 ;; B13: #	out( B14 ) <- in( B12 )  Freq: 0.99991
  0x00007f71e91781ce:   vmovq  %rbx,%xmm0
  0x00007f71e91781d3:   mov    %r11d,%r13d                  ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007f71e91781d6:   mov    %ebp,%r11d                   ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e91781d9:   xor    %ebx,%ebx
  0x00007f71e91781db:   nop
  0x00007f71e91781dc:   nop
  0x00007f71e91781dd:   nop
  0x00007f71e91781de:   nop
  0x00007f71e91781df:   nop
 ;; B14: #	out( B49 B15 ) <- in( B13 B17 ) Loop( B14-B17 inner ) Freq: 12121.2
  0x00007f71e91781e0:   cmp    %r9d,%ebx
  0x00007f71e91781e3:   jae    0x00007f71e91783f4           ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
 ;; B15: #	out( B50 B16 ) <- in( B14 )  Freq: 12121.2
  0x00007f71e91781e9:   vmovdqu 0x10(%rcx,%rbx,4),%ymm2     ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007f71e91781ef:   cmp    %edi,%ebx
  0x00007f71e91781f1:   jae    0x00007f71e9178438           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B16: #	out( B51 B17 ) <- in( B15 )  Freq: 12121.2
  0x00007f71e91781f7:   vpaddd 0x10(%r8,%rbx,4),%ymm2,%ymm2 ;*invokestatic binaryOp {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector@53 (line 23)
  0x00007f71e91781fe:   nop
  0x00007f71e91781ff:   nop
  0x00007f71e9178200:   cmp    %r11d,%ebx
  0x00007f71e9178203:   jae    0x00007f71e9178480
 ;; B17: #	out( B14 B18 ) <- in( B16 )  Freq: 12121.2
  0x00007f71e9178209:   vmovdqu %ymm2,0x10(%rdx,%rbx,4)
  0x00007f71e917820f:   mov    0x130(%r15),%r14             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e9178216:   add    %eax,%ebx                    ; ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop xmm0=Oop xmm1=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@76 (line 20)
  0x00007f71e9178218:   test   %eax,(%r14)                  ;   {poll}
  0x00007f71e917821b:   nop
  0x00007f71e917821c:   nop
  0x00007f71e917821d:   nop
  0x00007f71e917821e:   nop
  0x00007f71e917821f:   nop
  0x00007f71e9178220:   cmp    %r10d,%ebx
  0x00007f71e9178223:   jl     0x00007f71e91781e0
 ;; B18: #	out( B19 ) <- in( B17 )  Freq: 0.963063
  0x00007f71e9178225:   mov    %r13d,%r11d
 ;; B19: #	out( B48 B20 ) <- in( B18 B52 )  Freq: 0.963143
  0x00007f71e9178228:   cmp    %r11d,%ebx
  0x00007f71e917822b:   jge    0x00007f71e91783de
 ;; B20: #	out( B56 B21 ) <- in( B19 )  Freq: 0.481571
  0x00007f71e9178231:   mov    0xc(%rcx),%r10d              ; implicit exception: dispatches to 0x00007f71e9178584
 ;; B21: #	out( B56 B22 ) <- in( B20 )  Freq: 0.481571
  0x00007f71e9178235:   cmp    %r10d,%ebx
  0x00007f71e9178238:   jae    0x00007f71e9178584
 ;; B22: #	out( B56 B23 ) <- in( B21 )  Freq: 0.48157
  0x00007f71e917823e:   mov    %r11d,%eax
  0x00007f71e9178241:   dec    %eax
  0x00007f71e9178243:   cmp    %r10d,%eax
  0x00007f71e9178246:   jae    0x00007f71e9178584           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B23: #	out( B56 B24 ) <- in( B22 )  Freq: 0.48157
  0x00007f71e917824c:   mov    0xc(%r8),%r9d                ; implicit exception: dispatches to 0x00007f71e9178584
 ;; B24: #	out( B56 B25 ) <- in( B23 )  Freq: 0.48157
  0x00007f71e9178250:   cmp    %r9d,%ebx
  0x00007f71e9178253:   jae    0x00007f71e9178584
 ;; B25: #	out( B56 B26 ) <- in( B24 )  Freq: 0.481569
  0x00007f71e9178259:   cmp    %r9d,%eax
  0x00007f71e917825c:   nop
  0x00007f71e917825d:   nop
  0x00007f71e917825e:   nop
  0x00007f71e917825f:   nop
  0x00007f71e9178260:   jae    0x00007f71e9178584
 ;; B26: #	out( B56 B27 ) <- in( B25 )  Freq: 0.481569
  0x00007f71e9178266:   cmp    %r11d,%ebx
  0x00007f71e9178269:   jae    0x00007f71e9178584
 ;; B27: #	out( B56 B28 ) <- in( B26 )  Freq: 0.481568
  0x00007f71e917826f:   cmp    %r11d,%eax
  0x00007f71e9178272:   jae    0x00007f71e9178584
 ;; B28: #	out( B29 ) <- in( B27 )  Freq: 0.481568
  0x00007f71e9178278:   mov    %edx,%eax
  0x00007f71e917827a:   shr    $0x2,%eax
  0x00007f71e917827d:   and    $0x7,%eax
  0x00007f71e9178280:   add    %ebx,%eax
  0x00007f71e9178282:   mov    $0x3,%edi
  0x00007f71e9178287:   sub    %eax,%edi
  0x00007f71e9178289:   and    $0x7,%edi
  0x00007f71e917828c:   add    %ebx,%edi
  0x00007f71e917828e:   inc    %edi
  0x00007f71e9178290:   cmp    %r11d,%edi
  0x00007f71e9178293:   cmovg  %r11d,%edi
  0x00007f71e9178297:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B29: #	out( B29 B30 ) <- in( B28 B29 ) Loop( B29-B29 inner pre of N1916) Freq: 4.81567
  0x00007f71e9178298:   mov    0x10(%r8,%rbx,4),%eax
  0x00007f71e917829d:   add    0x10(%rcx,%rbx,4),%eax       ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e91782a1:   mov    %eax,0x10(%rdx,%rbx,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@98 (line 26)
  0x00007f71e91782a5:   inc    %ebx
  0x00007f71e91782a7:   cmp    %edi,%ebx
  0x00007f71e91782a9:   jl     0x00007f71e9178298
 ;; B30: #	out( B45 B31 ) <- in( B29 )  Freq: 0.481568
  0x00007f71e91782ab:   mov    %r11d,%eax
  0x00007f71e91782ae:   add    $0xffffffe1,%eax
  0x00007f71e91782b1:   cmp    %eax,%ebx
  0x00007f71e91782b3:   jge    0x00007f71e91783ba
 ;; B31: #	out( B57 B32 ) <- in( B30 )  Freq: 0.481567
  0x00007f71e91782b9:   cmp    %r11d,%ebx
  0x00007f71e91782bc:   nop
  0x00007f71e91782bd:   nop
  0x00007f71e91782be:   nop
  0x00007f71e91782bf:   nop
  0x00007f71e91782c0:   jae    0x00007f71e91785bc
 ;; B32: #	out( B58 B33 ) <- in( B31 )  Freq: 0.481567
  0x00007f71e91782c6:   cmp    %r9d,%ebx
  0x00007f71e91782c9:   jae    0x00007f71e91785d0
 ;; B33: #	out( B59 B34 ) <- in( B32 )  Freq: 0.481566
  0x00007f71e91782cf:   cmp    %r10d,%ebx
  0x00007f71e91782d2:   jae    0x00007f71e91785e4
 ;; B34: #	out( B60 B35 ) <- in( B33 )  Freq: 0.481566
  0x00007f71e91782d8:   mov    %ebx,%edi
  0x00007f71e91782da:   add    $0x1f,%edi
  0x00007f71e91782dd:   nop
  0x00007f71e91782de:   nop
  0x00007f71e91782df:   nop
  0x00007f71e91782e0:   cmp    %r10d,%edi
  0x00007f71e91782e3:   jae    0x00007f71e91785f8
 ;; B35: #	out( B61 B36 ) <- in( B34 )  Freq: 0.481565
  0x00007f71e91782e9:   cmp    %r9d,%edi
  0x00007f71e91782ec:   jae    0x00007f71e917860c
 ;; B36: #	out( B62 B37 ) <- in( B35 )  Freq: 0.481565
  0x00007f71e91782f2:   cmp    %r11d,%ebx
  0x00007f71e91782f5:   jae    0x00007f71e9178620
 ;; B37: #	out( B63 B38 ) <- in( B36 )  Freq: 0.481564
  0x00007f71e91782fb:   nop
  0x00007f71e91782fc:   nop
  0x00007f71e91782fd:   nop
  0x00007f71e91782fe:   nop
  0x00007f71e91782ff:   nop
  0x00007f71e9178300:   cmp    %r11d,%edi
  0x00007f71e9178303:   jae    0x00007f71e9178634
 ;; B38: #	out( B39 ) <- in( B37 )  Freq: 0.481564
  0x00007f71e9178309:   mov    $0x7d00,%r9d
 ;; B39: #	out( B40 ) <- in( B38 B41 ) Loop( B39-B41 ) Freq: 4.81564
  0x00007f71e917830f:   mov    %r11d,%r10d
  0x00007f71e9178312:   sub    %ebx,%r10d
  0x00007f71e9178315:   add    $0xffffffe1,%r10d
  0x00007f71e9178319:   cmp    %ebx,%eax
  0x00007f71e917831b:   cmovl  %esi,%r10d
  0x00007f71e917831f:   cmp    $0x7d00,%r10d
  0x00007f71e9178326:   cmova  %r9d,%r10d
  0x00007f71e917832a:   add    %ebx,%r10d
  0x00007f71e917832d:   nop
  0x00007f71e917832e:   nop
  0x00007f71e917832f:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B40: #	out( B40 B41 ) <- in( B39 B40 ) Loop( B40-B40 inner main of N298 strip mined) Freq: 48.1563
  0x00007f71e9178330:   vmovdqu 0x10(%rcx,%rbx,4),%ymm0
  0x00007f71e9178336:   vpaddd 0x10(%r8,%rbx,4),%ymm0,%ymm0
  0x00007f71e917833d:   vmovdqu %ymm0,0x10(%rdx,%rbx,4)
  0x00007f71e9178343:   movslq %ebx,%rdi
  0x00007f71e9178346:   vmovdqu 0x30(%rcx,%rdi,4),%ymm0
  0x00007f71e917834c:   vpaddd 0x30(%r8,%rdi,4),%ymm0,%ymm0
  0x00007f71e9178353:   vmovdqu %ymm0,0x30(%rdx,%rdi,4)
  0x00007f71e9178359:   vmovdqu 0x50(%rcx,%rdi,4),%ymm0
  0x00007f71e917835f:   vpaddd 0x50(%r8,%rdi,4),%ymm0,%ymm0
  0x00007f71e9178366:   vmovdqu %ymm0,0x50(%rdx,%rdi,4)
  0x00007f71e917836c:   vmovdqu 0x70(%rcx,%rdi,4),%ymm0
  0x00007f71e9178372:   vpaddd 0x70(%r8,%rdi,4),%ymm0,%ymm0
  0x00007f71e9178379:   vmovdqu %ymm0,0x70(%rdx,%rdi,4)     ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e917837f:   add    $0x20,%ebx
  0x00007f71e9178382:   cmp    %r10d,%ebx
  0x00007f71e9178385:   jl     0x00007f71e9178330           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@102 (line 25)
 ;; B41: #	out( B39 B42 ) <- in( B40 )  Freq: 4.81564
  0x00007f71e9178387:   mov    0x130(%r15),%r10             ; ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@102 (line 25)
  0x00007f71e917838e:   test   %eax,(%r10)                  ;   {poll}
  0x00007f71e9178391:   cmp    %eax,%ebx
  0x00007f71e9178393:   jl     0x00007f71e917830f
 ;; B42: #	out( B45 B43 ) <- in( B41 )  Freq: 0.481564
  0x00007f71e9178399:   cmp    %ebp,%ebx
  0x00007f71e917839b:   jge    0x00007f71e91783ba
 ;; B43: #	out( B44 ) <- in( B42 )  Freq: 0.240782
  0x00007f71e917839d:   nop
  0x00007f71e917839e:   nop
  0x00007f71e917839f:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B44: #	out( B44 B45 ) <- in( B43 B44 ) Loop( B44-B44 inner post of N2614) Freq: 2.40782
  0x00007f71e91783a0:   vmovdqu 0x10(%rcx,%rbx,4),%ymm0
  0x00007f71e91783a6:   vpaddd 0x10(%r8,%rbx,4),%ymm0,%ymm0
  0x00007f71e91783ad:   vmovdqu %ymm0,0x10(%rdx,%rbx,4)     ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e91783b3:   add    $0x8,%ebx
  0x00007f71e91783b6:   cmp    %ebp,%ebx
  0x00007f71e91783b8:   jl     0x00007f71e91783a0
 ;; B45: #	out( B48 B46 ) <- in( B30 B44 B42 )  Freq: 0.481564
  0x00007f71e91783ba:   nop
  0x00007f71e91783bb:   nop
  0x00007f71e91783bc:   nop
  0x00007f71e91783bd:   nop
  0x00007f71e91783be:   nop
  0x00007f71e91783bf:   nop
  0x00007f71e91783c0:   cmp    %r11d,%ebx
  0x00007f71e91783c3:   jge    0x00007f71e91783de
 ;; B46: #	out( B47 ) <- in( B45 )  Freq: 0.240782
  0x00007f71e91783c5:   nop
  0x00007f71e91783c6:   nop
  0x00007f71e91783c7:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B47: #	out( B47 B48 ) <- in( B46 B47 ) Loop( B47-B47 inner post of N1916) Freq: 2.40782
  0x00007f71e91783c8:   mov    0x10(%r8,%rbx,4),%r9d
  0x00007f71e91783cd:   add    0x10(%rcx,%rbx,4),%r9d       ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e91783d2:   mov    %r9d,0x10(%rdx,%rbx,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@98 (line 26)
  0x00007f71e91783d7:   inc    %ebx
  0x00007f71e91783d9:   cmp    %r11d,%ebx
  0x00007f71e91783dc:   jl     0x00007f71e91783c8           ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
 ;; B48: #	out( N625 ) <- in( B47 B45 B19 )  Freq: 0.963136
  0x00007f71e91783de:   vzeroupper 
  0x00007f71e91783e1:   add    $0x70,%rsp
  0x00007f71e91783e5:   pop    %rbp
  0x00007f71e91783e6:   cmp    0x128(%r15),%rsp             ;   {poll_return}
  0x00007f71e91783ed:   ja     0x00007f71e9178690
  0x00007f71e91783f3:   retq   
 ;; B49: #	out( N625 ) <- in( B14 )  Freq: 0.0122822
  0x00007f71e91783f4:   mov    $0xffffffe4,%esi
  0x00007f71e91783f9:   vmovq  %xmm1,%rbp
  0x00007f71e91783fe:   mov    %rdx,(%rsp)
  0x00007f71e9178402:   mov    %r8,0x10(%rsp)
  0x00007f71e9178407:   mov    %rcx,0x20(%rsp)
  0x00007f71e917840c:   mov    %ebx,0x1c(%rsp)
  0x00007f71e9178410:   mov    %r9d,0x28(%rsp)
  0x00007f71e9178415:   vmovsd %xmm0,0x30(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e917841b:   nop
  0x00007f71e917841c:   vzeroupper 
  0x00007f71e917841f:   callq  0x00007f71e9116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop [32]=Oop [48]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f71e9178424:   movabs $0x7f71f4f787b8,%rdi         ;   {external_word}
  0x00007f71e917842e:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e9178432:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e9178437:   hlt    
 ;; B50: #	out( N625 ) <- in( B15 )  Freq: 0.0122822
  0x00007f71e9178438:   mov    $0xffffffe4,%esi
  0x00007f71e917843d:   vmovq  %xmm1,%rbp
  0x00007f71e9178442:   mov    %rdx,(%rsp)
  0x00007f71e9178446:   mov    %rcx,0x8(%rsp)
  0x00007f71e917844b:   mov    %r8,0x20(%rsp)
  0x00007f71e9178450:   mov    %ebx,0x1c(%rsp)
  0x00007f71e9178454:   mov    %edi,0x28(%rsp)
  0x00007f71e9178458:   vmovdqu %ymm2,0x40(%rsp)
  0x00007f71e917845e:   vmovsd %xmm0,0x30(%rsp)
  0x00007f71e9178464:   vzeroupper 
  0x00007f71e9178467:   callq  0x00007f71e9116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [32]=Oop [48]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@44 (line 22)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f71e917846c:   movabs $0x7f71f4f787b8,%rdi         ;   {external_word}
  0x00007f71e9178476:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e917847a:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e917847f:   hlt    
 ;; B51: #	out( N625 ) <- in( B16 )  Freq: 0.0122821
  0x00007f71e9178480:   mov    $0xffffffe4,%esi
  0x00007f71e9178485:   vmovq  %xmm1,%rbp
  0x00007f71e917848a:   mov    %rcx,0x8(%rsp)
  0x00007f71e917848f:   mov    %r8,0x10(%rsp)
  0x00007f71e9178494:   mov    %rdx,0x20(%rsp)
  0x00007f71e9178499:   mov    %ebx,0x1c(%rsp)
  0x00007f71e917849d:   mov    %r11d,0x28(%rsp)
  0x00007f71e91784a2:   vmovdqu %ymm2,0x40(%rsp)
  0x00007f71e91784a8:   vzeroupper 
  0x00007f71e91784ab:   callq  0x00007f71e9116540           ; ImmutableOopMap {rbp=Oop [8]=Oop [16]=Oop [32]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - App::micro_vector@59 (line 23)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f71e91784b0:   movabs $0x7f71f4f787b8,%rdi         ;   {external_word}
  0x00007f71e91784ba:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e91784be:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e91784c3:   hlt    
 ;; B52: #	out( B19 ) <- in( B5 )  Freq: 7.94715e-05
  0x00007f71e91784c4:   xor    %ebx,%ebx
  0x00007f71e91784c6:   jmpq   0x00007f71e9178228
 ;; B53: #	out( N625 ) <- in( B3 )  Freq: 9.99998e-07
  0x00007f71e91784cb:   mov    $0xffffffde,%esi
  0x00007f71e91784d0:   vmovsd %xmm1,(%rsp)
  0x00007f71e91784d5:   mov    %rdx,0x8(%rsp)
  0x00007f71e91784da:   mov    %rcx,0x10(%rsp)
  0x00007f71e91784df:   mov    %r8,0x18(%rsp)
  0x00007f71e91784e4:   mov    %r11d,0x20(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e91784e9:   nop
  0x00007f71e91784ea:   nop
  0x00007f71e91784eb:   nop
  0x00007f71e91784ec:   vzeroupper 
  0x00007f71e91784ef:   callq  0x00007f71e9116540           ; ImmutableOopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f71e91784f4:   movabs $0x7f71f4f787b8,%rdi         ;   {external_word}
  0x00007f71e91784fe:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e9178502:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e9178507:   hlt    
 ;; B54: #	out( N625 ) <- in( B11 B12 B6 B7 B8 B9 B10 )  Freq: 7.03923e-06
  0x00007f71e9178508:   mov    $0xffffff76,%esi
  0x00007f71e917850d:   vmovq  %xmm1,%rbp
  0x00007f71e9178512:   mov    %rdx,(%rsp)
  0x00007f71e9178516:   mov    %rcx,0x8(%rsp)
  0x00007f71e917851b:   mov    %r8,0x10(%rsp)
  0x00007f71e9178520:   mov    %r10d,0x18(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e9178525:   nop
  0x00007f71e9178526:   nop
  0x00007f71e9178527:   nop
  0x00007f71e9178528:   vzeroupper 
  0x00007f71e917852b:   callq  0x00007f71e9116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@22 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f71e9178530:   movabs $0x7f71f4f787b8,%rdi         ;   {external_word}
  0x00007f71e917853a:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e917853e:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e9178543:   hlt    
 ;; B55: #	out( N625 ) <- in( B4 )  Freq: 4.99998e-07
  0x00007f71e9178544:   mov    $0xffffff45,%esi
  0x00007f71e9178549:   vmovsd %xmm1,(%rsp)
  0x00007f71e917854e:   mov    %rdx,0x8(%rsp)
  0x00007f71e9178553:   mov    %rcx,0x10(%rsp)
  0x00007f71e9178558:   mov    %r8,0x18(%rsp)
  0x00007f71e917855d:   mov    %eax,0x20(%rsp)
  0x00007f71e9178561:   mov    %r11d,0x24(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e9178566:   nop
  0x00007f71e9178567:   nop
  0x00007f71e9178568:   vzeroupper 
  0x00007f71e917856b:   callq  0x00007f71e9116540           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*ifne {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f71e9178570:   movabs $0x7f71f4f787b8,%rdi         ;   {external_word}
  0x00007f71e917857a:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e917857e:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e9178583:   hlt    
 ;; B56: #	out( N625 ) <- in( B25 B20 B21 B22 B27 B26 B23 B24 )  Freq: 3.90372e-06
  0x00007f71e9178584:   mov    $0xffffff76,%esi
  0x00007f71e9178589:   mov    %rdx,%rbp
  0x00007f71e917858c:   mov    %rcx,(%rsp)
  0x00007f71e9178590:   mov    %r8,0x8(%rsp)
  0x00007f71e9178595:   mov    %ebx,0x14(%rsp)
  0x00007f71e9178599:   mov    %r11d,0x18(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e917859e:   nop
  0x00007f71e917859f:   nop
  0x00007f71e91785a0:   vzeroupper 
  0x00007f71e91785a3:   callq  0x00007f71e9116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@83 (line 25)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f71e91785a8:   movabs $0x7f71f4f787b8,%rdi         ;   {external_word}
  0x00007f71e91785b2:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e91785b6:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e91785bb:   hlt    
 ;; B57: #	out( N625 ) <- in( B31 )  Freq: 4.87962e-07
  0x00007f71e91785bc:   movabs $0x7f71f5110078,%rdi         ;   {external_word}
  0x00007f71e91785c6:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e91785ca:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e91785cf:   hlt    
 ;; B58: #	out( N625 ) <- in( B32 )  Freq: 4.87961e-07
  0x00007f71e91785d0:   movabs $0x7f71f5110078,%rdi         ;   {external_word}
  0x00007f71e91785da:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e91785de:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e91785e3:   hlt    
 ;; B59: #	out( N625 ) <- in( B33 )  Freq: 4.87961e-07
  0x00007f71e91785e4:   movabs $0x7f71f5110078,%rdi         ;   {external_word}
  0x00007f71e91785ee:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e91785f2:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e91785f7:   hlt    
 ;; B60: #	out( N625 ) <- in( B34 )  Freq: 4.8796e-07
  0x00007f71e91785f8:   movabs $0x7f71f5110078,%rdi         ;   {external_word}
  0x00007f71e9178602:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e9178606:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e917860b:   hlt    
 ;; B61: #	out( N625 ) <- in( B35 )  Freq: 4.8796e-07
  0x00007f71e917860c:   movabs $0x7f71f5110078,%rdi         ;   {external_word}
  0x00007f71e9178616:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e917861a:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e917861f:   hlt    
 ;; B62: #	out( N625 ) <- in( B36 )  Freq: 4.87959e-07
  0x00007f71e9178620:   movabs $0x7f71f5110078,%rdi         ;   {external_word}
  0x00007f71e917862a:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e917862e:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e9178633:   hlt    
 ;; B63: #	out( N625 ) <- in( B37 )  Freq: 4.87959e-07
  0x00007f71e9178634:   movabs $0x7f71f5110078,%rdi         ;   {external_word}
  0x00007f71e917863e:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e9178642:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e9178647:   hlt    
 ;; B64: #	out( N625 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007f71e9178648:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e917864d:   nop
  0x00007f71e917864e:   nop
  0x00007f71e917864f:   nop
  0x00007f71e9178650:   vzeroupper 
  0x00007f71e9178653:   callq  0x00007f71e9116540           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@16 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f71e9178658:   movabs $0x7f71f4f787b8,%rdi         ;   {external_word}
  0x00007f71e9178662:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e9178666:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e917866b:   hlt    
 ;; B65: #	out( N625 ) <- in( B2 )  Freq: 1.01328e-06
  0x00007f71e917866c:   mov    $0xfffffff6,%esi
  0x00007f71e9178671:   mov    %r11d,%ebp
  0x00007f71e9178674:   vzeroupper 
  0x00007f71e9178677:   callq  0x00007f71e9116540           ; ImmutableOopMap {}
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f71e917867c:   movabs $0x7f71f4f787b8,%rdi         ;   {external_word}
  0x00007f71e9178686:   and    $0xfffffffffffffff0,%rsp
  0x00007f71e917868a:   callq  0x00007f71f473dff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f71e917868f:   hlt                                 ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007f71e9178690:   movabs $0x7f71e91783e6,%r10         ;   {internal_word}
  0x00007f71e917869a:   mov    %r10,0x3e8(%r15)
  0x00007f71e91786a1:   jmpq   0x00007f71e9117220           ;   {runtime_call SafepointBlob}
  0x00007f71e91786a6:   hlt    
  0x00007f71e91786a7:   hlt    
  0x00007f71e91786a8:   hlt    
  0x00007f71e91786a9:   hlt    
  0x00007f71e91786aa:   hlt    
  0x00007f71e91786ab:   hlt    
  0x00007f71e91786ac:   hlt    
  0x00007f71e91786ad:   hlt    
  0x00007f71e91786ae:   hlt    
  0x00007f71e91786af:   hlt    
  0x00007f71e91786b0:   hlt    
  0x00007f71e91786b1:   hlt    
  0x00007f71e91786b2:   hlt    
  0x00007f71e91786b3:   hlt    
  0x00007f71e91786b4:   hlt    
  0x00007f71e91786b5:   hlt    
  0x00007f71e91786b6:   hlt    
  0x00007f71e91786b7:   hlt    
  0x00007f71e91786b8:   hlt    
  0x00007f71e91786b9:   hlt    
  0x00007f71e91786ba:   hlt    
  0x00007f71e91786bb:   hlt    
  0x00007f71e91786bc:   hlt    
  0x00007f71e91786bd:   hlt    
  0x00007f71e91786be:   hlt    
  0x00007f71e91786bf:   hlt    
[Exception Handler]
  0x00007f71e91786c0:   jmpq   0x00007f71e905c6a0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f71e91786c5:   callq  0x00007f71e91786ca
  0x00007f71e91786ca:   subq   $0x5,(%rsp)
  0x00007f71e91786cf:   jmpq   0x00007f71e9116860           ;   {runtime_call DeoptimizationBlob}
  0x00007f71e91786d4:   hlt    
  0x00007f71e91786d5:   hlt    
  0x00007f71e91786d6:   hlt    
  0x00007f71e91786d7:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007f71e91786d8:   0x00000000fb062e70 a 'java/lang/Class'{0x00000000fb062e70} = 'jdk/incubator/vector/Int256Vector'
  0x00007f71e91786e0:   0x00000000fb0625d8 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x00000000fb0625d8}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007f71e91786e8:   0x00007f7191811818 {method} {0x00007f7191811818} 'micro_vector' '([I[I[I)V' in 'App'
  0x00007f71e91786f0:   0x00007f7191812d08 {method} {0x00007f7191812d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
  0x00007f71e91786f8:   0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007f71e9178700:   0x00007f7191a1e040 {method} {0x00007f7191a1e040} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007f71e9178708:   0x00007f7191812728 {method} {0x00007f7191812728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007f71e9178710:   0x00007f7191a18468 {method} {0x00007f7191a18468} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007f71e9178718:   0x00007f7191a1eb40 {method} {0x00007f7191a1eb40} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007f71e9178720:   0x0000000800098110 'jdk/incubator/vector/Int256Vector'
  0x00007f71e9178728:   0x00007f7191a84038 {method} {0x00007f7191a84038} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007f71e9178730:   0x00007f7191560ca0 {method} {0x00007f7191560ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
  0x00007f71e9178738:   0x00007f7191a4d2a8 {method} {0x00007f7191a4d2a8} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007f71e9178740:   0x00007f7191813798 {method} {0x00007f7191813798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007f71e9178748:   0x00007f719181f8d8 {method} {0x00007f719181f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007f71e9178750:   0x00007f7191a4e718 {method} {0x00007f7191a4e718} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007f71e9178758:   0x00007f7191a4b678 {method} {0x00007f7191a4b678} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007f71e9178760:   0x00007f719181e8d8 {method} {0x00007f719181e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007f71e9178768:   0x00007f7191a84340 {method} {0x00007f7191a84340} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007f71e9178770:   0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
  0x00007f71e9178778:   0x00007f7191aef250 {method} {0x00007f7191aef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007f71e9178780:   0x00007f7191aeede8 {method} {0x00007f7191aeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007f71e9178788:   0x00007f7191aeeec0 {method} {0x00007f7191aeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007f71e9178790:   0x00007f7191a11968 {method} {0x00007f7191a11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007f71e91780ff offset=ffffffff bits=0):
PcDesc(pc=0x00007f71e917812c offset=2c bits=0):   App::micro_vector@-1 (line 15)
PcDesc(pc=0x00007f71e9178135 offset=35 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e9178138 offset=38 bits=0):   App::micro_vector@12 (line 20)
PcDesc(pc=0x00007f71e917814c offset=4c bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e9178156 offset=56 bits=0):   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007f71e9178159 offset=59 bits=0):   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007f71e9178174 offset=74 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e9178177 offset=77 bits=0):   App::micro_vector@76 (line 20)
PcDesc(pc=0x00007f71e9178199 offset=99 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e917819c offset=9c bits=0):   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007f71e91781b7 offset=b7 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e91781d6 offset=d6 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007f71e91781d9 offset=d9 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e91781e9 offset=e9 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007f71e91781ef offset=ef bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007f71e91781f7 offset=f7 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e91781fe offset=fe bits=0):   jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector@53 (line 23)
PcDesc(pc=0x00007f71e9178216 offset=116 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e9178218 offset=118 bits=1):   App::micro_vector@76 (line 20)  reexecute=true
   Locals
    - l0: reg xmm1 [64],oop
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: empty
    - l5: empty
    - l6: reg rbx [6],int
PcDesc(pc=0x00007f71e917824c offset=14c bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e9178298 offset=198 bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007f71e91782a1 offset=1a1 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e91782a5 offset=1a5 bits=0):   App::micro_vector@98 (line 26)
PcDesc(pc=0x00007f71e9178330 offset=230 bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007f71e917837f offset=27f bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e9178387 offset=287 bits=0):   App::micro_vector@102 (line 25)
PcDesc(pc=0x00007f71e917838e offset=28e bits=1):   App::micro_vector@102 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: empty
    - l5: empty
    - l6: reg rbx [6],int
PcDesc(pc=0x00007f71e91783a0 offset=2a0 bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007f71e91783b3 offset=2b3 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e91783c8 offset=2c8 bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007f71e91783d2 offset=2d2 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e91783d7 offset=2d7 bits=0):   App::micro_vector@98 (line 26)
PcDesc(pc=0x00007f71e91783de offset=2de bits=0):   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007f71e917841b offset=31b bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e9178424 offset=324 bits=0):   java.util.Objects::checkIndex@3 (line 359)
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
    - l4: empty
    - l5: empty
    - l6: stack[28]
PcDesc(pc=0x00007f71e917846c offset=36c bits=0):   java.util.Objects::checkIndex@3 (line 359)
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
    - l4: obj[255]
    - l5: empty
    - l6: stack[28]
   Objects
    - 255: jdk.incubator.vector.Int256Vector stack[64]Wrong location type 7
PcDesc(pc=0x00007f71e91784b0 offset=3b0 bits=0):   java.util.Objects::checkIndex@3 (line 359)
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
    - l4: empty
    - l5: empty
    - l6: stack[28]
   Objects
    - 263: jdk.incubator.vector.Int256Vector stack[64]Wrong location type 7
PcDesc(pc=0x00007f71e91784e9 offset=3e9 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e91784f4 offset=3f4 bits=0):   App::micro_vector@17 (line 20)
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
PcDesc(pc=0x00007f71e9178525 offset=425 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e9178530 offset=430 bits=1):   App::micro_vector@22 (line 20)  reexecute=true
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
PcDesc(pc=0x00007f71e9178566 offset=466 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e9178570 offset=470 bits=1):   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
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
    - l4: empty
    - l5: empty
    - l6: 0
   Expression stack
    - @0: 0
PcDesc(pc=0x00007f71e917859e offset=49e bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e91785a8 offset=4a8 bits=1):   App::micro_vector@83 (line 25)  reexecute=true
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
PcDesc(pc=0x00007f71e917864d offset=54d bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e9178658 offset=558 bits=0):   App::micro_vector@16 (line 20)
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
PcDesc(pc=0x00007f71e917867c offset=57c bits=0):   App::micro_vector@17 (line 20)
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
PcDesc(pc=0x00007f71e9178690 offset=590 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007f71e91786d9 offset=5d9 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 11 OopMaps

ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop xmm0=Oop xmm1=Oop } pc offsets: 280 
ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop } pc offsets: 654 
ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop [32]=Oop [48]=Oop } pc offsets: 804 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [32]=Oop [48]=Oop } pc offsets: 876 
ImmutableOopMap {rbp=Oop [8]=Oop [16]=Oop [32]=Oop } pc offsets: 944 
ImmutableOopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop } pc offsets: 1012 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop } pc offsets: 1072 
ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop } pc offsets: 1136 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop } pc offsets: 1192 
ImmutableOopMap {} pc offsets: 1368 1404 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007f71e917812c offset=2c):
   App::micro_vector@-1 (line 15)
ScopeDesc(pc=0x00007f71e9178135 offset=35):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e9178135 offset=35):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e9178138 offset=38):
   App::micro_vector@12 (line 20)
ScopeDesc(pc=0x00007f71e917814c offset=4c):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e917814c offset=4c):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e9178156 offset=56):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007f71e9178159 offset=59):
   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
ScopeDesc(pc=0x00007f71e9178159 offset=59):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007f71e9178174 offset=74):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e9178174 offset=74):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e9178177 offset=77):
   App::micro_vector@76 (line 20)
ScopeDesc(pc=0x00007f71e9178199 offset=99):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e9178199 offset=99):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e917819c offset=9c):
   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
ScopeDesc(pc=0x00007f71e917819c offset=9c):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007f71e917819c offset=9c):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007f71e917819c offset=9c):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007f71e91781b7 offset=b7):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e91781b7 offset=b7):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e91781d6 offset=d6):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007f71e91781d6 offset=d6):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007f71e91781d6 offset=d6):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007f71e91781d6 offset=d6):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007f71e91781d9 offset=d9):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007f71e91781d9 offset=d9):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007f71e91781d9 offset=d9):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
ScopeDesc(pc=0x00007f71e91781d9 offset=d9):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e91781e9 offset=e9):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007f71e91781e9 offset=e9):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007f71e91781e9 offset=e9):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007f71e91781e9 offset=e9):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007f71e91781ef offset=ef):
   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
ScopeDesc(pc=0x00007f71e91781ef offset=ef):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007f71e91781ef offset=ef):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007f71e91781ef offset=ef):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007f71e91781f7 offset=f7):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e91781f7 offset=f7):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e91781fe offset=fe):
   jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
ScopeDesc(pc=0x00007f71e91781fe offset=fe):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007f71e91781fe offset=fe):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007f71e91781fe offset=fe):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007f71e91781fe offset=fe):
   App::micro_vector@53 (line 23)
ScopeDesc(pc=0x00007f71e9178216 offset=116):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e9178216 offset=116):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e9178218 offset=118):
   App::micro_vector@76 (line 20)  reexecute=true
   Locals
    - l0: reg xmm1 [64],oop
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: empty
    - l5: empty
    - l6: reg rbx [6],int
ScopeDesc(pc=0x00007f71e917824c offset=14c):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e917824c offset=14c):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e9178298 offset=198):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007f71e91782a1 offset=1a1):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e91782a1 offset=1a1):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e91782a5 offset=1a5):
   App::micro_vector@98 (line 26)
ScopeDesc(pc=0x00007f71e9178330 offset=230):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007f71e917837f offset=27f):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e917837f offset=27f):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e9178387 offset=287):
   App::micro_vector@102 (line 25)
ScopeDesc(pc=0x00007f71e917838e offset=28e):
   App::micro_vector@102 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: empty
    - l5: empty
    - l6: reg rbx [6],int
ScopeDesc(pc=0x00007f71e91783a0 offset=2a0):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007f71e91783b3 offset=2b3):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e91783b3 offset=2b3):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e91783c8 offset=2c8):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007f71e91783d2 offset=2d2):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e91783d2 offset=2d2):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e91783d7 offset=2d7):
   App::micro_vector@98 (line 26)
ScopeDesc(pc=0x00007f71e91783de offset=2de):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007f71e917841b offset=31b):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e917841b offset=31b):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e9178424 offset=324):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007f71e9178424 offset=324):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007f71e9178424 offset=324):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[48],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007f71e9178424 offset=324):
   App::micro_vector@32 (line 21)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[32],oop
    - l3: stack[16],oop
    - l4: empty
    - l5: empty
    - l6: stack[28]
ScopeDesc(pc=0x00007f71e917846c offset=36c):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007f71e917846c offset=36c):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007f71e917846c offset=36c):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[48],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007f71e917846c offset=36c):
   App::micro_vector@44 (line 22)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[32],oop
    - l4: obj[255]
    - l5: empty
    - l6: stack[28]
   Objects
    - 255: jdk.incubator.vector.Int256Vector stack[64]Wrong location type 7
ScopeDesc(pc=0x00007f71e91784b0 offset=3b0):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007f71e91784b0 offset=3b0):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007f71e91784b0 offset=3b0):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: obj[263]
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007f71e91784b0 offset=3b0):
   App::micro_vector@59 (line 23)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[32],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: empty
    - l5: empty
    - l6: stack[28]
   Objects
    - 263: jdk.incubator.vector.Int256Vector stack[64]Wrong location type 7
ScopeDesc(pc=0x00007f71e91784e9 offset=3e9):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e91784e9 offset=3e9):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e91784f4 offset=3f4):
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
ScopeDesc(pc=0x00007f71e9178525 offset=425):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e9178525 offset=425):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e9178530 offset=430):
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
ScopeDesc(pc=0x00007f71e9178566 offset=466):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e9178566 offset=466):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e9178570 offset=470):
   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
   Locals
    - l0: stack[36]
    - l1: stack[32]
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007f71e9178570 offset=470):
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   Locals
    - l0: empty
    - l1: empty
ScopeDesc(pc=0x00007f71e9178570 offset=470):
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
ScopeDesc(pc=0x00007f71e917859e offset=49e):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e917859e offset=49e):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e91785a8 offset=4a8):
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
ScopeDesc(pc=0x00007f71e917864d offset=54d):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e917864d offset=54d):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007f71e9178658 offset=558):
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
ScopeDesc(pc=0x00007f71e917867c offset=57c):
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
ScopeDesc(pc=0x00007f71e9178690 offset=590):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007f71e9178690 offset=590):
   App::micro_vector@59 (line 23)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007f71e9178008: 6014
relocInfo@0x00007f71e9178008 [type=6(runtime_call) addr=0x00007f71e9178114 offset=20] | [destination=0x00007f71e9115920]
         @0x00007f71e917800a: f003cc31
relocInfo@0x00007f71e917800c [type=12(metadata) addr=0x00007f71e9178145 offset=49 format=3 data=3] | [metadata_addr=0x00007f71e91786f8 *=0x0000000800094b80 offset=0]metadata_value=0x0000000800094b80: 'jdk/incubator/vector/IntVector$IntSpecies'
         @0x00007f71e917800e: f008cc60
relocInfo@0x00007f71e9178010 [type=12(metadata) addr=0x00007f71e91781a5 offset=96 format=3 data=8] | [metadata_addr=0x00007f71e9178720 *=0x0000000800098110 offset=0]metadata_value=0x0000000800098110: 'jdk/incubator/vector/Int256Vector'
         @0x00007f71e9178012: a073
relocInfo@0x00007f71e9178012 [type=10(poll) addr=0x00007f71e9178218 offset=115]
         @0x00007f71e9178014: a176
relocInfo@0x00007f71e9178014 [type=10(poll) addr=0x00007f71e917838e offset=374]
         @0x00007f71e9178016: b058
relocInfo@0x00007f71e9178016 [type=11(poll_return) addr=0x00007f71e91783e6 offset=88]
         @0x00007f71e9178018: 6439
relocInfo@0x00007f71e9178018 [type=6(runtime_call) addr=0x00007f71e917841f offset=57 format=1] | [destination=0x00007f71e9116540]
         @0x00007f71e917801a: f803f4f787b87f717005
relocInfo@0x00007f71e9178022 [type=7(external_word) addr=0x00007f71e9178424 offset=5 data={f4f787b87f71}] | [target=0x00007f71f4f787b8]
         @0x00007f71e9178024: 640e
relocInfo@0x00007f71e9178024 [type=6(runtime_call) addr=0x00007f71e9178432 offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e9178026: 6435
relocInfo@0x00007f71e9178026 [type=6(runtime_call) addr=0x00007f71e9178467 offset=53 format=1] | [destination=0x00007f71e9116540]
         @0x00007f71e9178028: f803f4f787b87f717005
relocInfo@0x00007f71e9178030 [type=7(external_word) addr=0x00007f71e917846c offset=5 data={f4f787b87f71}] | [target=0x00007f71f4f787b8]
         @0x00007f71e9178032: 640e
relocInfo@0x00007f71e9178032 [type=6(runtime_call) addr=0x00007f71e917847a offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e9178034: 6431
relocInfo@0x00007f71e9178034 [type=6(runtime_call) addr=0x00007f71e91784ab offset=49 format=1] | [destination=0x00007f71e9116540]
         @0x00007f71e9178036: f803f4f787b87f717005
relocInfo@0x00007f71e917803e [type=7(external_word) addr=0x00007f71e91784b0 offset=5 data={f4f787b87f71}] | [target=0x00007f71f4f787b8]
         @0x00007f71e9178040: 640e
relocInfo@0x00007f71e9178040 [type=6(runtime_call) addr=0x00007f71e91784be offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e9178042: 6431
relocInfo@0x00007f71e9178042 [type=6(runtime_call) addr=0x00007f71e91784ef offset=49 format=1] | [destination=0x00007f71e9116540]
         @0x00007f71e9178044: f803f4f787b87f717005
relocInfo@0x00007f71e917804c [type=7(external_word) addr=0x00007f71e91784f4 offset=5 data={f4f787b87f71}] | [target=0x00007f71f4f787b8]
         @0x00007f71e917804e: 640e
relocInfo@0x00007f71e917804e [type=6(runtime_call) addr=0x00007f71e9178502 offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e9178050: 6429
relocInfo@0x00007f71e9178050 [type=6(runtime_call) addr=0x00007f71e917852b offset=41 format=1] | [destination=0x00007f71e9116540]
         @0x00007f71e9178052: f803f4f787b87f717005
relocInfo@0x00007f71e917805a [type=7(external_word) addr=0x00007f71e9178530 offset=5 data={f4f787b87f71}] | [target=0x00007f71f4f787b8]
         @0x00007f71e917805c: 640e
relocInfo@0x00007f71e917805c [type=6(runtime_call) addr=0x00007f71e917853e offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e917805e: 642d
relocInfo@0x00007f71e917805e [type=6(runtime_call) addr=0x00007f71e917856b offset=45 format=1] | [destination=0x00007f71e9116540]
         @0x00007f71e9178060: f803f4f787b87f717005
relocInfo@0x00007f71e9178068 [type=7(external_word) addr=0x00007f71e9178570 offset=5 data={f4f787b87f71}] | [target=0x00007f71f4f787b8]
         @0x00007f71e917806a: 640e
relocInfo@0x00007f71e917806a [type=6(runtime_call) addr=0x00007f71e917857e offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e917806c: 6425
relocInfo@0x00007f71e917806c [type=6(runtime_call) addr=0x00007f71e91785a3 offset=37 format=1] | [destination=0x00007f71e9116540]
         @0x00007f71e917806e: f803f4f787b87f717005
relocInfo@0x00007f71e9178076 [type=7(external_word) addr=0x00007f71e91785a8 offset=5 data={f4f787b87f71}] | [target=0x00007f71f4f787b8]
         @0x00007f71e9178078: 640e
relocInfo@0x00007f71e9178078 [type=6(runtime_call) addr=0x00007f71e91785b6 offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e917807a: f803f51100787f717006
relocInfo@0x00007f71e9178082 [type=7(external_word) addr=0x00007f71e91785bc offset=6 data={f51100787f71}] | [target=0x00007f71f5110078]
         @0x00007f71e9178084: 640e
relocInfo@0x00007f71e9178084 [type=6(runtime_call) addr=0x00007f71e91785ca offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e9178086: f803f51100787f717006
relocInfo@0x00007f71e917808e [type=7(external_word) addr=0x00007f71e91785d0 offset=6 data={f51100787f71}] | [target=0x00007f71f5110078]
         @0x00007f71e9178090: 640e
relocInfo@0x00007f71e9178090 [type=6(runtime_call) addr=0x00007f71e91785de offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e9178092: f803f51100787f717006
relocInfo@0x00007f71e917809a [type=7(external_word) addr=0x00007f71e91785e4 offset=6 data={f51100787f71}] | [target=0x00007f71f5110078]
         @0x00007f71e917809c: 640e
relocInfo@0x00007f71e917809c [type=6(runtime_call) addr=0x00007f71e91785f2 offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e917809e: f803f51100787f717006
relocInfo@0x00007f71e91780a6 [type=7(external_word) addr=0x00007f71e91785f8 offset=6 data={f51100787f71}] | [target=0x00007f71f5110078]
         @0x00007f71e91780a8: 640e
relocInfo@0x00007f71e91780a8 [type=6(runtime_call) addr=0x00007f71e9178606 offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e91780aa: f803f51100787f717006
relocInfo@0x00007f71e91780b2 [type=7(external_word) addr=0x00007f71e917860c offset=6 data={f51100787f71}] | [target=0x00007f71f5110078]
         @0x00007f71e91780b4: 640e
relocInfo@0x00007f71e91780b4 [type=6(runtime_call) addr=0x00007f71e917861a offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e91780b6: f803f51100787f717006
relocInfo@0x00007f71e91780be [type=7(external_word) addr=0x00007f71e9178620 offset=6 data={f51100787f71}] | [target=0x00007f71f5110078]
         @0x00007f71e91780c0: 640e
relocInfo@0x00007f71e91780c0 [type=6(runtime_call) addr=0x00007f71e917862e offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e91780c2: f803f51100787f717006
relocInfo@0x00007f71e91780ca [type=7(external_word) addr=0x00007f71e9178634 offset=6 data={f51100787f71}] | [target=0x00007f71f5110078]
         @0x00007f71e91780cc: 640e
relocInfo@0x00007f71e91780cc [type=6(runtime_call) addr=0x00007f71e9178642 offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e91780ce: 6411
relocInfo@0x00007f71e91780ce [type=6(runtime_call) addr=0x00007f71e9178653 offset=17 format=1] | [destination=0x00007f71e9116540]
         @0x00007f71e91780d0: f803f4f787b87f717005
relocInfo@0x00007f71e91780d8 [type=7(external_word) addr=0x00007f71e9178658 offset=5 data={f4f787b87f71}] | [target=0x00007f71f4f787b8]
         @0x00007f71e91780da: 640e
relocInfo@0x00007f71e91780da [type=6(runtime_call) addr=0x00007f71e9178666 offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e91780dc: 6411
relocInfo@0x00007f71e91780dc [type=6(runtime_call) addr=0x00007f71e9178677 offset=17 format=1] | [destination=0x00007f71e9116540]
         @0x00007f71e91780de: f803f4f787b87f717005
relocInfo@0x00007f71e91780e6 [type=7(external_word) addr=0x00007f71e917867c offset=5 data={f4f787b87f71}] | [target=0x00007f71f4f787b8]
         @0x00007f71e91780e8: 640e
relocInfo@0x00007f71e91780e8 [type=6(runtime_call) addr=0x00007f71e917868a offset=14 format=1] | [destination=0x00007f71f473dff4]
         @0x00007f71e91780ea: f2aa8006
relocInfo@0x00007f71e91780ec [type=8(internal_word) addr=0x00007f71e9178690 offset=6 data=682] | [target=0x00007f71e91783e6]
         @0x00007f71e91780ee: 6411
relocInfo@0x00007f71e91780ee [type=6(runtime_call) addr=0x00007f71e91786a1 offset=17 format=1] | [destination=0x00007f71e9117220]
         @0x00007f71e91780f0: 001f
relocInfo@0x00007f71e91780f0 [type=0(none) addr=0x00007f71e91786c0 offset=31]
         @0x00007f71e91780f2: 6400
relocInfo@0x00007f71e91780f2 [type=6(runtime_call) addr=0x00007f71e91786c0 offset=0 format=1] | [destination=0x00007f71e905c6a0]
         @0x00007f71e91780f4: 640f
relocInfo@0x00007f71e91780f4 [type=6(runtime_call) addr=0x00007f71e91786cf offset=15 format=1] | [destination=0x00007f71e9116860]
         @0x00007f71e91780f6: 0000
relocInfo@0x00007f71e91780f6 [type=0(none) addr=0x00007f71e91786cf offset=0]
         @0x00007f71e91780f8: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007f7191aef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007f7191aeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007f7191aeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$ImplCache
  method  = {method} {0x00007f7191a11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$ImplCache
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 7 entries, 60 bytes):
{
   < 0x00007f71e9178131, 0x00007f71e9178648 > < 0x00007f71e9178140, 0x00007f71e917866c > < 0x00007f71e9178186, 0x00007f71e9178508 > 
   < 0x00007f71e91781a0, 0x00007f71e9178508 > < 0x00007f71e91781b1, 0x00007f71e9178508 > < 0x00007f71e9178231, 0x00007f71e9178584 > 
   < 0x00007f71e917824c, 0x00007f71e9178584 > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x00000000fb062e70 a 'java/lang/Class'{0x00000000fb062e70} = 'jdk/incubator/vector/Int256Vector'
#2: 0x00000000fb0625d8 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x00000000fb0625d8}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
# 0: 0x0000000000000000 NULL-oop
# 1: 0x00007f7191811818 {method} {0x00007f7191811818} 'micro_vector' '([I[I[I)V' in 'App'
# 2: 0x00007f7191812d08 {method} {0x00007f7191812d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
# 3: 0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
# 4: 0x00007f7191a1e040 {method} {0x00007f7191a1e040} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
# 5: 0x00007f7191812728 {method} {0x00007f7191812728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
# 6: 0x00007f7191a18468 {method} {0x00007f7191a18468} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
# 7: 0x00007f7191a1eb40 {method} {0x00007f7191a1eb40} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
# 8: 0x0000000800098110 'jdk/incubator/vector/Int256Vector'
# 9: 0x00007f7191a84038 {method} {0x00007f7191a84038} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
#10: 0x00007f7191560ca0 {method} {0x00007f7191560ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
#11: 0x00007f7191a4d2a8 {method} {0x00007f7191a4d2a8} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
#12: 0x00007f7191813798 {method} {0x00007f7191813798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#13: 0x00007f719181f8d8 {method} {0x00007f719181f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#14: 0x00007f7191a4e718 {method} {0x00007f7191a4e718} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
#15: 0x00007f7191a4b678 {method} {0x00007f7191a4b678} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
#16: 0x00007f719181e8d8 {method} {0x00007f719181e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#17: 0x00007f7191a84340 {method} {0x00007f7191a84340} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
#18: 0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
#19: 0x00007f7191aef250 {method} {0x00007f7191aef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#20: 0x00007f7191aeede8 {method} {0x00007f7191aeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#21: 0x00007f7191aeeec0 {method} {0x00007f7191aeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#22: 0x00007f7191a11968 {method} {0x00007f7191a11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VECTOR : [Time] 2384 ms   [Res] 999990000000000
VECTOR_MASKED : [Time] 3134 ms   [Res] 999990000000000
------------------------------------------------------------------------
App::micro_vector([I[I[I)V
  interpreter_invocation_count:       53 
  invocation_counter:              10000 
  backedge_counter:                 5769 
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
                                    'jdk/incubator/vector/IntVector$IntSpecies'(659254 1.00)
22 if_icmpge 79
  56  bci: 22   BranchData          taken(53) displacement(256)
                                    not taken(659201)
25 fast_aaccess_0
26 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
29 aload_2
30 fast_iload #6
32 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  88  bci: 32   CounterData         count(659201)
35 astore #4
37 fast_aaccess_0
38 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
41 aload_3
42 fast_iload #6
44 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  104 bci: 44   CounterData         count(659201)
47 astore #5
49 aload #4
51 aload #5
53 invokevirtual 28 <jdk/incubator/vector/IntVector.add(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;> 
  120 bci: 53   VirtualCallData     count(659201) nonprofiled_count(0) entries(0)
56 aload_1
57 fast_iload #6
59 invokevirtual 32 <jdk/incubator/vector/IntVector.intoArray([II)V> 
  176 bci: 59   VirtualCallData     count(659201) nonprofiled_count(0) entries(0)
62 fast_iload #6
64 fast_aaccess_0
65 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
68 invokeinterface 36 <jdk/incubator/vector/VectorSpecies.length()I> 
  232 bci: 68   VirtualCallData     count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/IntVector$IntSpecies'(659201 1.00)
73 iadd
74 istore #6
76 goto 9
  288 bci: 76   JumpData            taken(659201) displacement(-288)
79 fast_iload #6
81 aload_1
82 arraylength
83 if_icmpge 105
  312 bci: 83   BranchData          taken(53) displacement(56)
                                    not taken(0)
86 aload_1
87 iload #6
89 aload_2
90 iload #6
92 iaload
93 aload_3
94 iload #6
96 iaload
97 iadd
98 iastore
99 iinc #6 1
102 goto 79
  344 bci: 102  JumpData            taken(0) displacement(-32)
105 return
------------------------------------------------------------------------
Total MDO size: 880 bytes
