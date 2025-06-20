CompileCommand: dontinline App.micro_vector bool dontinline = true
CompileCommand: print App.micro_vector bool print = true
OpenJDK 64-Bit Server VM warning: printing of assembly code is enabled; turning on DebugNonSafepoints to gain additional output
Warning:  TraceDependencies results may be inflated by VerifyDependencies
SCALAR : [Time] 2128 ms   [Res] 999990000000000

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 226 ------------------------
{method}
 - this oop:          0x00007fc548c11818
 - method holder:     'App'
 - constants:         0x00007fc548c11090 constant pool [134]/operands[15] {0x00007fc548c11090} for 'App' cache=0x00007fc548f00000
 - access:            0xc1000001  public 
 - name:              'micro_vector'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        7
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007fc5a100e220
 - adapters:          AHE@0x00007fc5a43b6230: 0xbbbb0000 i2c: 0x00007fc5a107f6e0 c2i: 0x00007fc5a107f7cc c2iUV: 0x00007fc5a107f796 c2iNCI: 0x00007fc5a107f809
 - compiled entry     0x00007fc5a107f7cc
 - code size:         106
 - code start:        0x00007fc548c11798
 - code end (excl):   0x00007fc548c11802
 - method data:       0x00007fc548f00bb8
 - checked ex length: 0
 - linenumber start:  0x00007fc548c11802
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
045     cmpl    R9, narrowklass: precise klass jdk/incubator/vector/IntVector$IntSpecies: 0x00007fc518033ca0:Constant:exact *	# compressed klass ptr
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
066     jne     B55  P=0.000000 C=11477.000000

06c     B5: #	out( B52 B6 ) <- in( B4 )  Freq: 0.999996
06c     andnl  R10, R10, R11
071     movl    RBP, R11	# spill
074     addl    RBP, #-7	# int
077     # TLS is in R15
077     xorl    RSI, RSI	# int
079     testl   R10, R10
        nop 	# 4 bytes pad for loops and calls
080     jle     B52  P=0.000079 C=228521.000000

086     B6: #	out( B54 B7 ) <- in( B5 )  Freq: 0.999918
086     movl    R9, [RCX + #12 (8-bit)]	# range
08a     NullCheck RCX

08a     B7: #	out( B54 B8 ) <- in( B6 )  Freq: 0.999917
08a     subl    R9, RAX	# int
08d     incl    R9	# int
090     testl   R9, R9
093     jl     B54  P=0.000001 C=-1.000000

099     B8: #	out( B54 B9 ) <- in( B7 )  Freq: 0.999916
099     movl    RDI, [RBX + #68 (8-bit)]	# compressed ptr ! Field: jdk/incubator/vector/AbstractSpecies.dummyVector (constant)
        nop 	# 4 bytes pad for loops and calls
0a0     movl    RDI, [R12 + RDI << 3 + #8] (compressed oop addressing)	# compressed klass ptr
0a5     NullCheck RDI

0a5     B9: #	out( B54 B10 ) <- in( B8 )  Freq: 0.999915
0a5     cmpl    RDI, narrowklass: precise klass jdk/incubator/vector/Int256Vector: 0x00007fc51c0f7d40:Constant:exact *	# compressed klass ptr
0ab     jne,u   B54  P=0.000001 C=-1.000000

0b1     B10: #	out( B54 B11 ) <- in( B9 )  Freq: 0.999914
0b1     movl    RDI, [R8 + #12 (8-bit)]	# range
0b5     NullCheck R8

0b5     B11: #	out( B54 B12 ) <- in( B10 )  Freq: 0.999913
0b5     subl    RDI, RAX	# int
0b7     incl    RDI	# int
0b9     testl   RDI, RDI
        nop 	# 5 bytes pad for loops and calls
0c0     jl     B54  P=0.000001 C=-1.000000

0c6     B12: #	out( B54 B13 ) <- in( B11 )  Freq: 0.999912
0c6     testl   RBP, RBP
0c8     jl     B54  P=0.000001 C=-1.000000

0ce     B13: #	out( B14 ) <- in( B12 )  Freq: 0.999911
0ce     movdq   XMM0, RBX	# spill
0d3     movl    R13, R11	# spill
0d6     # castII of RDI
0d6     # castII of R9
0d6     movl    R11, RBP	# spill
0d9     # castII of R11
0d9     xorl    RBX, RBX	# int
        nop 	# 5 bytes pad for loops and calls

0e0     B14: #	out( B49 B15 ) <- in( B13 B17 ) Loop( B14-B17 inner ) Freq: 12227.2
0e0     cmpl    RBX, R9	# unsigned
0e3     jnb,u   B49  P=0.000001 C=-1.000000

0e9     B15: #	out( B50 B16 ) <- in( B14 )  Freq: 12227.2
0e9     # castII of RBX
0e9     load_vector XMM2,[RCX + #16 + RBX << #2]
0ef     cmpl    RBX, RDI	# unsigned
0f1     jnb,u   B50  P=0.000001 C=-1.000000

0f7     B16: #	out( B51 B17 ) <- in( B15 )  Freq: 12227.2
0f7     vpaddd  XMM2,XMM2,[R8 + #16 + RBX << #2]	! add packedI
        nop 	# 2 bytes pad for loops and calls
100     cmpl    RBX, R11	# unsigned
103     jnb,u   B51  P=0.000001 C=-1.000000

109     B17: #	out( B14 B18 ) <- in( B16 )  Freq: 12227.2
109     store_vector [RDX + #16 + RBX << #2],XMM2
	
10f     movq    R14, [R15 + #304 (32-bit)]	# ptr
116     addl    RBX, RAX	# int
118     testl   rax, [R14]	# Safepoint: poll for GC        # App::micro_vector @ bci:76 (line 20) L[0]=XMM1 L[1]=RDX L[2]=RCX L[3]=R8 L[4]=_ L[5]=_ L[6]=RBX
        # OopMap {r8=Oop rcx=Oop rdx=Oop xmm0=Oop xmm1=Oop off=280/0x118}
        nop 	# 5 bytes pad for loops and calls
120     cmpl    RBX, R10
123     jl,s   B14  P=0.999921 C=228502.000000

125     B18: #	out( B19 ) <- in( B17 )  Freq: 0.962742
125     movl    R11, R13	# spill

128     B19: #	out( B48 B20 ) <- in( B18 B52 )  Freq: 0.962821
128     cmpl    RBX, R11
12b     jge     B48  P=0.500000 C=-1.000000

131     B20: #	out( B56 B21 ) <- in( B19 )  Freq: 0.48141
131     movl    R10, [RCX + #12 (8-bit)]	# range
135     NullCheck RCX

135     B21: #	out( B56 B22 ) <- in( B20 )  Freq: 0.48141
135     cmpl    RBX, R10	# unsigned
138     jnb,u   B56  P=0.000001 C=-1.000000

13e     B22: #	out( B56 B23 ) <- in( B21 )  Freq: 0.481409
13e     movl    RAX, R11	# spill
141     decl    RAX	# int
143     cmpl    RAX, R10	# unsigned
146     jnb,u   B56  P=0.000001 C=-1.000000

14c     B23: #	out( B56 B24 ) <- in( B22 )  Freq: 0.481409
14c     movl    R9, [R8 + #12 (8-bit)]	# range
150     NullCheck R8

150     B24: #	out( B56 B25 ) <- in( B23 )  Freq: 0.481408
150     cmpl    RBX, R9	# unsigned
153     jnb,u   B56  P=0.000001 C=-1.000000

159     B25: #	out( B56 B26 ) <- in( B24 )  Freq: 0.481408
159     cmpl    RAX, R9	# unsigned
        nop 	# 4 bytes pad for loops and calls
160     jnb,u   B56  P=0.000001 C=-1.000000

166     B26: #	out( B56 B27 ) <- in( B25 )  Freq: 0.481407
166     cmpl    RBX, R11	# unsigned
169     jnb,u   B56  P=0.000001 C=-1.000000

16f     B27: #	out( B56 B28 ) <- in( B26 )  Freq: 0.481407
16f     cmpl    RAX, R11	# unsigned
172     jnb,u   B56  P=0.000001 C=-1.000000

178     B28: #	out( B29 ) <- in( B27 )  Freq: 0.481406
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

198     B29: #	out( B29 B30 ) <- in( B28 B29 ) Loop( B29-B29 inner pre of N1916) Freq: 4.81406
198     movl    RAX, [R8 + #16 + RBX << #2]	# int
19d     addl    RAX, [RCX + #16 + RBX << #2]	# int
1a1     movl    [RDX + #16 + RBX << #2], RAX	# int
1a5     incl    RBX	# int
1a7     cmpl    RBX, RDI
1a9     jl,s   B29	# loop end  P=0.900000 C=-1.000000

1ab     B30: #	out( B45 B31 ) <- in( B29 )  Freq: 0.481406
1ab     movl    RAX, R11	# spill
1ae     addl    RAX, #-31	# int
1b1     cmpl    RBX, RAX
1b3     jge     B45  P=0.000001 C=-1.000000

1b9     B31: #	out( B57 B32 ) <- in( B30 )  Freq: 0.481406
1b9     # castII of RBX
1b9     cmpl    RBX, R11	# unsigned
        nop 	# 4 bytes pad for loops and calls
1c0     jnb,u   B57  P=0.000001 C=-1.000000

1c6     B32: #	out( B58 B33 ) <- in( B31 )  Freq: 0.481405
1c6     cmpl    RBX, R9	# unsigned
1c9     jnb,u   B58  P=0.000001 C=-1.000000

1cf     B33: #	out( B59 B34 ) <- in( B32 )  Freq: 0.481405
1cf     cmpl    RBX, R10	# unsigned
1d2     jnb,u   B59  P=0.000001 C=-1.000000

1d8     B34: #	out( B60 B35 ) <- in( B33 )  Freq: 0.481404
1d8     movl    RDI, RBX	# spill
1da     addl    RDI, #31	# int
        nop 	# 3 bytes pad for loops and calls
1e0     cmpl    RDI, R10	# unsigned
1e3     jnb,u   B60  P=0.000001 C=-1.000000

1e9     B35: #	out( B61 B36 ) <- in( B34 )  Freq: 0.481404
1e9     cmpl    RDI, R9	# unsigned
1ec     jnb,u   B61  P=0.000001 C=-1.000000

1f2     B36: #	out( B62 B37 ) <- in( B35 )  Freq: 0.481404
1f2     cmpl    RBX, R11	# unsigned
1f5     jnb,u   B62  P=0.000001 C=-1.000000

1fb     B37: #	out( B63 B38 ) <- in( B36 )  Freq: 0.481403
        nop 	# 5 bytes pad for loops and calls
200     cmpl    RDI, R11	# unsigned
203     jnb,u   B63  P=0.000001 C=-1.000000

209     B38: #	out( B39 ) <- in( B37 )  Freq: 0.481403
209     movl    R9, #32000	# int

20f     B39: #	out( B40 ) <- in( B38 B41 ) Loop( B39-B41 ) Freq: 4.81402
20f     movl    R10, R11	# spill
212     subl    R10, RBX	# int
215     addl    R10, #-31	# int
219     cmpl    RAX, RBX
21b     cmovll R10, RSI	# signed, int
21f     cmpl    R10, #32000	# unsigned
226     cmovlnbe R10, R9	# unsigned, int
22a     addl    R10, RBX	# int
        nop 	# 3 bytes pad for loops and calls

230     B40: #	out( B40 B41 ) <- in( B39 B40 ) Loop( B40-B40 inner main of N298 strip mined) Freq: 48.1402
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

287     B41: #	out( B39 B42 ) <- in( B40 )  Freq: 4.81402
287     movq    R10, [R15 + #304 (32-bit)]	# ptr
28e     testl   rax, [R10]	# Safepoint: poll for GC        # App::micro_vector @ bci:102 (line 25) L[0]=_ L[1]=RDX L[2]=RCX L[3]=R8 L[4]=_ L[5]=_ L[6]=RBX
        # OopMap {r8=Oop rcx=Oop rdx=Oop off=654/0x28e}
291     cmpl    RBX, RAX
293     jl     B39  P=0.900000 C=-1.000000

299     B42: #	out( B45 B43 ) <- in( B41 )  Freq: 0.481403
299     cmpl    RBX, RBP
29b     jge,s   B45  P=0.500000 C=-1.000000

29d     B43: #	out( B44 ) <- in( B42 )  Freq: 0.240701
29d     # castII of RBX
        nop 	# 3 bytes pad for loops and calls

2a0     B44: #	out( B44 B45 ) <- in( B43 B44 ) Loop( B44-B44 inner post of N2614) Freq: 2.40701
2a0     load_vector XMM0,[RCX + #16 + RBX << #2]
2a6     vpaddd  XMM0,XMM0,[R8 + #16 + RBX << #2]	! add packedI
2ad     store_vector [RDX + #16 + RBX << #2],XMM0
	
2b3     addl    RBX, #8	# int
2b6     cmpl    RBX, RBP
2b8     jl,s   B44	# loop end  P=0.900000 C=-1.000000

2ba     B45: #	out( B48 B46 ) <- in( B30 B44 B42 )  Freq: 0.481403
        nop 	# 6 bytes pad for loops and calls
2c0     cmpl    RBX, R11
2c3     jge,s   B48  P=0.500000 C=-1.000000

2c5     B46: #	out( B47 ) <- in( B45 )  Freq: 0.240702
2c5     # castII of RBX
        nop 	# 3 bytes pad for loops and calls

2c8     B47: #	out( B47 B48 ) <- in( B46 B47 ) Loop( B47-B47 inner post of N1916) Freq: 2.40701
2c8     movl    R9, [R8 + #16 + RBX << #2]	# int
2cd     addl    R9, [RCX + #16 + RBX << #2]	# int
2d2     movl    [RDX + #16 + RBX << #2], R9	# int
2d7     incl    RBX	# int
2d9     cmpl    RBX, R11
2dc     jl,s   B47	# loop end  P=0.900000 C=-1.000000

2de     B48: #	out( N625 ) <- in( B47 B45 B19 )  Freq: 0.962813
2de     vzeroupper
	addq    rsp, 112	# Destroy frame
	popq    rbp
	cmpq     rsp, poll_offset[r15_thread] 
	ja       #safepoint_stub	# Safepoint: poll for GC

2f3     ret

2f4     B49: #	out( N625 ) <- in( B14 )  Freq: 0.0123896
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

338     B50: #	out( N625 ) <- in( B15 )  Freq: 0.0123896
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

380     B51: #	out( N625 ) <- in( B16 )  Freq: 0.0123896
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

3c4     B52: #	out( B19 ) <- in( B5 )  Freq: 7.87671e-05
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

408     B54: #	out( N625 ) <- in( B11 B12 B6 B7 B8 B9 B10 )  Freq: 7.03924e-06
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

484     B56: #	out( N625 ) <- in( B25 B20 B21 B22 B27 B26 B23 B24 )  Freq: 3.90241e-06
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

4bc     B57: #	out( N625 ) <- in( B31 )  Freq: 4.87799e-07
4bc     stop	# ShouldNotReachHere

4d0     B58: #	out( N625 ) <- in( B32 )  Freq: 4.87798e-07
4d0     stop	# ShouldNotReachHere

4e4     B59: #	out( N625 ) <- in( B33 )  Freq: 4.87798e-07
4e4     stop	# ShouldNotReachHere

4f8     B60: #	out( N625 ) <- in( B34 )  Freq: 4.87797e-07
4f8     stop	# ShouldNotReachHere

50c     B61: #	out( N625 ) <- in( B35 )  Freq: 4.87797e-07
50c     stop	# ShouldNotReachHere

520     B62: #	out( N625 ) <- in( B36 )  Freq: 4.87796e-07
520     stop	# ShouldNotReachHere

534     B63: #	out( N625 ) <- in( B37 )  Freq: 4.87796e-07
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

Compiled method (c2)    9642  226             App::micro_vector (106 bytes)
 total in heap  [0x00007fc5a117a010,0x00007fc5a117af00] = 3824
 relocation     [0x00007fc5a117a188,0x00007fc5a117a278] = 240
 main code      [0x00007fc5a117a280,0x00007fc5a117a840] = 1472
 stub code      [0x00007fc5a117a840,0x00007fc5a117a858] = 24
 oops           [0x00007fc5a117a858,0x00007fc5a117a868] = 16
 metadata       [0x00007fc5a117a868,0x00007fc5a117a918] = 176
 scopes data    [0x00007fc5a117a918,0x00007fc5a117ab80] = 616
 scopes pcs     [0x00007fc5a117ab80,0x00007fc5a117aeb0] = 816
 dependencies   [0x00007fc5a117aeb0,0x00007fc5a117aec0] = 16
 nul chk table  [0x00007fc5a117aec0,0x00007fc5a117af00] = 64

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Entry Point]
  # {method} {0x00007fc548c11818} 'micro_vector' '([I[I[I)V' in 'App'
  # this:     rsi:rsi   = 'App'
  # parm0:    rdx:rdx   = '[I'
  # parm1:    rcx:rcx   = '[I'
  # parm2:    r8:r8     = '[I'
  #           [sp+0x80]  (sp of caller)
 ;; N625: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fc5a117a280:   mov    0x8(%rsi),%r10d
  0x00007fc5a117a284:   movabs $0x800000000,%r11
  0x00007fc5a117a28e:   add    %r11,%r10
  0x00007fc5a117a291:   cmp    %r10,%rax
  0x00007fc5a117a294:   jne    0x00007fc5a1115920           ;   {runtime_call ic_miss_stub}
  0x00007fc5a117a29a:   nop
  0x00007fc5a117a29b:   nop
  0x00007fc5a117a29c:   nop
  0x00007fc5a117a29d:   nop
  0x00007fc5a117a29e:   nop
  0x00007fc5a117a29f:   nop
[Verified Entry Point]
 ;; B1: #	out( B64 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fc5a117a2a0:   mov    %eax,-0x16000(%rsp)
  0x00007fc5a117a2a7:   push   %rbp
  0x00007fc5a117a2a8:   sub    $0x70,%rsp                   ;*synchronization entry
                                                            ; - App::micro_vector@-1 (line 15)
  0x00007fc5a117a2ac:   vmovq  %rsi,%xmm1
  0x00007fc5a117a2b1:   mov    0xc(%rdx),%r11d              ; implicit exception: dispatches to 0x00007fc5a117a7c8
                                                            ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B2: #	out( B65 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007fc5a117a2b5:   mov    0xc(%rsi),%ebp               ;*getfield SPECIES {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@12 (line 20)
  0x00007fc5a117a2b8:   nop
  0x00007fc5a117a2b9:   nop
  0x00007fc5a117a2ba:   nop
  0x00007fc5a117a2bb:   nop
  0x00007fc5a117a2bc:   nop
  0x00007fc5a117a2bd:   nop
  0x00007fc5a117a2be:   nop
  0x00007fc5a117a2bf:   nop
  0x00007fc5a117a2c0:   mov    0x8(%r12,%rbp,8),%r9d        ; implicit exception: dispatches to 0x00007fc5a117a7ec
 ;; B3: #	out( B53 B4 ) <- in( B2 )  Freq: 0.999998
  0x00007fc5a117a2c5:   cmp    $0x94b80,%r9d                ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
                                                            ;   {metadata('jdk/incubator/vector/IntVector$IntSpecies')}
  0x00007fc5a117a2cc:   jne    0x00007fc5a117a64b
 ;; B4: #	out( B55 B5 ) <- in( B3 )  Freq: 0.999997
  0x00007fc5a117a2d2:   lea    (%r12,%rbp,8),%rbx           ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
  0x00007fc5a117a2d6:   mov    0xc(%rbx),%eax               ;*getfield laneCount {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
                                                            ; - App::micro_vector@17 (line 20)
  0x00007fc5a117a2d9:   mov    %eax,%r10d
  0x00007fc5a117a2dc:   dec    %r10d
  0x00007fc5a117a2df:   mov    %eax,%ebp
  0x00007fc5a117a2e1:   and    %r10d,%ebp
  0x00007fc5a117a2e4:   test   %ebp,%ebp
  0x00007fc5a117a2e6:   jne    0x00007fc5a117a6c4
 ;; B5: #	out( B52 B6 ) <- in( B4 )  Freq: 0.999996
  0x00007fc5a117a2ec:   andn   %r11d,%r10d,%r10d
  0x00007fc5a117a2f1:   mov    %r11d,%ebp                   ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a2f4:   add    $0xfffffff9,%ebp             ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@76 (line 20)
  0x00007fc5a117a2f7:   xor    %esi,%esi
  0x00007fc5a117a2f9:   test   %r10d,%r10d
  0x00007fc5a117a2fc:   nop
  0x00007fc5a117a2fd:   nop
  0x00007fc5a117a2fe:   nop
  0x00007fc5a117a2ff:   nop
  0x00007fc5a117a300:   jle    0x00007fc5a117a644
 ;; B6: #	out( B54 B7 ) <- in( B5 )  Freq: 0.999918
  0x00007fc5a117a306:   mov    0xc(%rcx),%r9d               ; implicit exception: dispatches to 0x00007fc5a117a688
 ;; B7: #	out( B54 B8 ) <- in( B6 )  Freq: 0.999917
  0x00007fc5a117a30a:   sub    %eax,%r9d
  0x00007fc5a117a30d:   inc    %r9d
  0x00007fc5a117a310:   test   %r9d,%r9d
  0x00007fc5a117a313:   jl     0x00007fc5a117a688           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B8: #	out( B54 B9 ) <- in( B7 )  Freq: 0.999916
  0x00007fc5a117a319:   mov    0x44(%rbx),%edi              ;*getfield dummyVector {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
                                                            ; - jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007fc5a117a31c:   nop
  0x00007fc5a117a31d:   nop
  0x00007fc5a117a31e:   nop
  0x00007fc5a117a31f:   nop
  0x00007fc5a117a320:   mov    0x8(%r12,%rdi,8),%edi        ; implicit exception: dispatches to 0x00007fc5a117a688
 ;; B9: #	out( B54 B10 ) <- in( B8 )  Freq: 0.999915
  0x00007fc5a117a325:   cmp    $0x98110,%edi                ;   {metadata('jdk/incubator/vector/Int256Vector')}
  0x00007fc5a117a32b:   jne    0x00007fc5a117a688
 ;; B10: #	out( B54 B11 ) <- in( B9 )  Freq: 0.999914
  0x00007fc5a117a331:   mov    0xc(%r8),%edi                ; implicit exception: dispatches to 0x00007fc5a117a688
 ;; B11: #	out( B54 B12 ) <- in( B10 )  Freq: 0.999913
  0x00007fc5a117a335:   sub    %eax,%edi                    ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a337:   inc    %edi
  0x00007fc5a117a339:   test   %edi,%edi
  0x00007fc5a117a33b:   nop
  0x00007fc5a117a33c:   nop
  0x00007fc5a117a33d:   nop
  0x00007fc5a117a33e:   nop
  0x00007fc5a117a33f:   nop
  0x00007fc5a117a340:   jl     0x00007fc5a117a688
 ;; B12: #	out( B54 B13 ) <- in( B11 )  Freq: 0.999912
  0x00007fc5a117a346:   test   %ebp,%ebp
  0x00007fc5a117a348:   jl     0x00007fc5a117a688
 ;; B13: #	out( B14 ) <- in( B12 )  Freq: 0.999911
  0x00007fc5a117a34e:   vmovq  %rbx,%xmm0
  0x00007fc5a117a353:   mov    %r11d,%r13d                  ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007fc5a117a356:   mov    %ebp,%r11d                   ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a359:   xor    %ebx,%ebx
  0x00007fc5a117a35b:   nop
  0x00007fc5a117a35c:   nop
  0x00007fc5a117a35d:   nop
  0x00007fc5a117a35e:   nop
  0x00007fc5a117a35f:   nop
 ;; B14: #	out( B49 B15 ) <- in( B13 B17 ) Loop( B14-B17 inner ) Freq: 12227.2
  0x00007fc5a117a360:   cmp    %r9d,%ebx
  0x00007fc5a117a363:   jae    0x00007fc5a117a574           ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
 ;; B15: #	out( B50 B16 ) <- in( B14 )  Freq: 12227.2
  0x00007fc5a117a369:   vmovdqu 0x10(%rcx,%rbx,4),%ymm2     ;*invokestatic load {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
                                                            ; - jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
                                                            ; - App::micro_vector@32 (line 21)
  0x00007fc5a117a36f:   cmp    %edi,%ebx
  0x00007fc5a117a371:   jae    0x00007fc5a117a5b8           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B16: #	out( B51 B17 ) <- in( B15 )  Freq: 12227.2
  0x00007fc5a117a377:   vpaddd 0x10(%r8,%rbx,4),%ymm2,%ymm2 ;*invokestatic binaryOp {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
                                                            ; - jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
                                                            ; - jdk.incubator.vector.IntVector::add@5 (line 1096)
                                                            ; - App::micro_vector@53 (line 23)
  0x00007fc5a117a37e:   nop
  0x00007fc5a117a37f:   nop
  0x00007fc5a117a380:   cmp    %r11d,%ebx
  0x00007fc5a117a383:   jae    0x00007fc5a117a600
 ;; B17: #	out( B14 B18 ) <- in( B16 )  Freq: 12227.2
  0x00007fc5a117a389:   vmovdqu %ymm2,0x10(%rdx,%rbx,4)
  0x00007fc5a117a38f:   mov    0x130(%r15),%r14             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a396:   add    %eax,%ebx                    ; ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop xmm0=Oop xmm1=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@76 (line 20)
  0x00007fc5a117a398:   test   %eax,(%r14)                  ;   {poll}
  0x00007fc5a117a39b:   nop
  0x00007fc5a117a39c:   nop
  0x00007fc5a117a39d:   nop
  0x00007fc5a117a39e:   nop
  0x00007fc5a117a39f:   nop
  0x00007fc5a117a3a0:   cmp    %r10d,%ebx
  0x00007fc5a117a3a3:   jl     0x00007fc5a117a360
 ;; B18: #	out( B19 ) <- in( B17 )  Freq: 0.962742
  0x00007fc5a117a3a5:   mov    %r13d,%r11d
 ;; B19: #	out( B48 B20 ) <- in( B18 B52 )  Freq: 0.962821
  0x00007fc5a117a3a8:   cmp    %r11d,%ebx
  0x00007fc5a117a3ab:   jge    0x00007fc5a117a55e
 ;; B20: #	out( B56 B21 ) <- in( B19 )  Freq: 0.48141
  0x00007fc5a117a3b1:   mov    0xc(%rcx),%r10d              ; implicit exception: dispatches to 0x00007fc5a117a704
 ;; B21: #	out( B56 B22 ) <- in( B20 )  Freq: 0.48141
  0x00007fc5a117a3b5:   cmp    %r10d,%ebx
  0x00007fc5a117a3b8:   jae    0x00007fc5a117a704
 ;; B22: #	out( B56 B23 ) <- in( B21 )  Freq: 0.481409
  0x00007fc5a117a3be:   mov    %r11d,%eax
  0x00007fc5a117a3c1:   dec    %eax
  0x00007fc5a117a3c3:   cmp    %r10d,%eax
  0x00007fc5a117a3c6:   jae    0x00007fc5a117a704           ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
 ;; B23: #	out( B56 B24 ) <- in( B22 )  Freq: 0.481409
  0x00007fc5a117a3cc:   mov    0xc(%r8),%r9d                ; implicit exception: dispatches to 0x00007fc5a117a704
 ;; B24: #	out( B56 B25 ) <- in( B23 )  Freq: 0.481408
  0x00007fc5a117a3d0:   cmp    %r9d,%ebx
  0x00007fc5a117a3d3:   jae    0x00007fc5a117a704
 ;; B25: #	out( B56 B26 ) <- in( B24 )  Freq: 0.481408
  0x00007fc5a117a3d9:   cmp    %r9d,%eax
  0x00007fc5a117a3dc:   nop
  0x00007fc5a117a3dd:   nop
  0x00007fc5a117a3de:   nop
  0x00007fc5a117a3df:   nop
  0x00007fc5a117a3e0:   jae    0x00007fc5a117a704
 ;; B26: #	out( B56 B27 ) <- in( B25 )  Freq: 0.481407
  0x00007fc5a117a3e6:   cmp    %r11d,%ebx
  0x00007fc5a117a3e9:   jae    0x00007fc5a117a704
 ;; B27: #	out( B56 B28 ) <- in( B26 )  Freq: 0.481407
  0x00007fc5a117a3ef:   cmp    %r11d,%eax
  0x00007fc5a117a3f2:   jae    0x00007fc5a117a704
 ;; B28: #	out( B29 ) <- in( B27 )  Freq: 0.481406
  0x00007fc5a117a3f8:   mov    %edx,%eax
  0x00007fc5a117a3fa:   shr    $0x2,%eax
  0x00007fc5a117a3fd:   and    $0x7,%eax
  0x00007fc5a117a400:   add    %ebx,%eax
  0x00007fc5a117a402:   mov    $0x3,%edi
  0x00007fc5a117a407:   sub    %eax,%edi
  0x00007fc5a117a409:   and    $0x7,%edi
  0x00007fc5a117a40c:   add    %ebx,%edi
  0x00007fc5a117a40e:   inc    %edi
  0x00007fc5a117a410:   cmp    %r11d,%edi
  0x00007fc5a117a413:   cmovg  %r11d,%edi
  0x00007fc5a117a417:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B29: #	out( B29 B30 ) <- in( B28 B29 ) Loop( B29-B29 inner pre of N1916) Freq: 4.81406
  0x00007fc5a117a418:   mov    0x10(%r8,%rbx,4),%eax
  0x00007fc5a117a41d:   add    0x10(%rcx,%rbx,4),%eax       ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a421:   mov    %eax,0x10(%rdx,%rbx,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@98 (line 26)
  0x00007fc5a117a425:   inc    %ebx
  0x00007fc5a117a427:   cmp    %edi,%ebx
  0x00007fc5a117a429:   jl     0x00007fc5a117a418
 ;; B30: #	out( B45 B31 ) <- in( B29 )  Freq: 0.481406
  0x00007fc5a117a42b:   mov    %r11d,%eax
  0x00007fc5a117a42e:   add    $0xffffffe1,%eax
  0x00007fc5a117a431:   cmp    %eax,%ebx
  0x00007fc5a117a433:   jge    0x00007fc5a117a53a
 ;; B31: #	out( B57 B32 ) <- in( B30 )  Freq: 0.481406
  0x00007fc5a117a439:   cmp    %r11d,%ebx
  0x00007fc5a117a43c:   nop
  0x00007fc5a117a43d:   nop
  0x00007fc5a117a43e:   nop
  0x00007fc5a117a43f:   nop
  0x00007fc5a117a440:   jae    0x00007fc5a117a73c
 ;; B32: #	out( B58 B33 ) <- in( B31 )  Freq: 0.481405
  0x00007fc5a117a446:   cmp    %r9d,%ebx
  0x00007fc5a117a449:   jae    0x00007fc5a117a750
 ;; B33: #	out( B59 B34 ) <- in( B32 )  Freq: 0.481405
  0x00007fc5a117a44f:   cmp    %r10d,%ebx
  0x00007fc5a117a452:   jae    0x00007fc5a117a764
 ;; B34: #	out( B60 B35 ) <- in( B33 )  Freq: 0.481404
  0x00007fc5a117a458:   mov    %ebx,%edi
  0x00007fc5a117a45a:   add    $0x1f,%edi
  0x00007fc5a117a45d:   nop
  0x00007fc5a117a45e:   nop
  0x00007fc5a117a45f:   nop
  0x00007fc5a117a460:   cmp    %r10d,%edi
  0x00007fc5a117a463:   jae    0x00007fc5a117a778
 ;; B35: #	out( B61 B36 ) <- in( B34 )  Freq: 0.481404
  0x00007fc5a117a469:   cmp    %r9d,%edi
  0x00007fc5a117a46c:   jae    0x00007fc5a117a78c
 ;; B36: #	out( B62 B37 ) <- in( B35 )  Freq: 0.481404
  0x00007fc5a117a472:   cmp    %r11d,%ebx
  0x00007fc5a117a475:   jae    0x00007fc5a117a7a0
 ;; B37: #	out( B63 B38 ) <- in( B36 )  Freq: 0.481403
  0x00007fc5a117a47b:   nop
  0x00007fc5a117a47c:   nop
  0x00007fc5a117a47d:   nop
  0x00007fc5a117a47e:   nop
  0x00007fc5a117a47f:   nop
  0x00007fc5a117a480:   cmp    %r11d,%edi
  0x00007fc5a117a483:   jae    0x00007fc5a117a7b4
 ;; B38: #	out( B39 ) <- in( B37 )  Freq: 0.481403
  0x00007fc5a117a489:   mov    $0x7d00,%r9d
 ;; B39: #	out( B40 ) <- in( B38 B41 ) Loop( B39-B41 ) Freq: 4.81402
  0x00007fc5a117a48f:   mov    %r11d,%r10d
  0x00007fc5a117a492:   sub    %ebx,%r10d
  0x00007fc5a117a495:   add    $0xffffffe1,%r10d
  0x00007fc5a117a499:   cmp    %ebx,%eax
  0x00007fc5a117a49b:   cmovl  %esi,%r10d
  0x00007fc5a117a49f:   cmp    $0x7d00,%r10d
  0x00007fc5a117a4a6:   cmova  %r9d,%r10d
  0x00007fc5a117a4aa:   add    %ebx,%r10d
  0x00007fc5a117a4ad:   nop
  0x00007fc5a117a4ae:   nop
  0x00007fc5a117a4af:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B40: #	out( B40 B41 ) <- in( B39 B40 ) Loop( B40-B40 inner main of N298 strip mined) Freq: 48.1402
  0x00007fc5a117a4b0:   vmovdqu 0x10(%rcx,%rbx,4),%ymm0
  0x00007fc5a117a4b6:   vpaddd 0x10(%r8,%rbx,4),%ymm0,%ymm0
  0x00007fc5a117a4bd:   vmovdqu %ymm0,0x10(%rdx,%rbx,4)
  0x00007fc5a117a4c3:   movslq %ebx,%rdi
  0x00007fc5a117a4c6:   vmovdqu 0x30(%rcx,%rdi,4),%ymm0
  0x00007fc5a117a4cc:   vpaddd 0x30(%r8,%rdi,4),%ymm0,%ymm0
  0x00007fc5a117a4d3:   vmovdqu %ymm0,0x30(%rdx,%rdi,4)
  0x00007fc5a117a4d9:   vmovdqu 0x50(%rcx,%rdi,4),%ymm0
  0x00007fc5a117a4df:   vpaddd 0x50(%r8,%rdi,4),%ymm0,%ymm0
  0x00007fc5a117a4e6:   vmovdqu %ymm0,0x50(%rdx,%rdi,4)
  0x00007fc5a117a4ec:   vmovdqu 0x70(%rcx,%rdi,4),%ymm0
  0x00007fc5a117a4f2:   vpaddd 0x70(%r8,%rdi,4),%ymm0,%ymm0
  0x00007fc5a117a4f9:   vmovdqu %ymm0,0x70(%rdx,%rdi,4)     ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a4ff:   add    $0x20,%ebx
  0x00007fc5a117a502:   cmp    %r10d,%ebx
  0x00007fc5a117a505:   jl     0x00007fc5a117a4b0           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@102 (line 25)
 ;; B41: #	out( B39 B42 ) <- in( B40 )  Freq: 4.81402
  0x00007fc5a117a507:   mov    0x130(%r15),%r10             ; ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@102 (line 25)
  0x00007fc5a117a50e:   test   %eax,(%r10)                  ;   {poll}
  0x00007fc5a117a511:   cmp    %eax,%ebx
  0x00007fc5a117a513:   jl     0x00007fc5a117a48f
 ;; B42: #	out( B45 B43 ) <- in( B41 )  Freq: 0.481403
  0x00007fc5a117a519:   cmp    %ebp,%ebx
  0x00007fc5a117a51b:   jge    0x00007fc5a117a53a
 ;; B43: #	out( B44 ) <- in( B42 )  Freq: 0.240701
  0x00007fc5a117a51d:   nop
  0x00007fc5a117a51e:   nop
  0x00007fc5a117a51f:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B44: #	out( B44 B45 ) <- in( B43 B44 ) Loop( B44-B44 inner post of N2614) Freq: 2.40701
  0x00007fc5a117a520:   vmovdqu 0x10(%rcx,%rbx,4),%ymm0
  0x00007fc5a117a526:   vpaddd 0x10(%r8,%rbx,4),%ymm0,%ymm0
  0x00007fc5a117a52d:   vmovdqu %ymm0,0x10(%rdx,%rbx,4)     ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a533:   add    $0x8,%ebx
  0x00007fc5a117a536:   cmp    %ebp,%ebx
  0x00007fc5a117a538:   jl     0x00007fc5a117a520
 ;; B45: #	out( B48 B46 ) <- in( B30 B44 B42 )  Freq: 0.481403
  0x00007fc5a117a53a:   nop
  0x00007fc5a117a53b:   nop
  0x00007fc5a117a53c:   nop
  0x00007fc5a117a53d:   nop
  0x00007fc5a117a53e:   nop
  0x00007fc5a117a53f:   nop
  0x00007fc5a117a540:   cmp    %r11d,%ebx
  0x00007fc5a117a543:   jge    0x00007fc5a117a55e
 ;; B46: #	out( B47 ) <- in( B45 )  Freq: 0.240702
  0x00007fc5a117a545:   nop
  0x00007fc5a117a546:   nop
  0x00007fc5a117a547:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@86 (line 26)
 ;; B47: #	out( B47 B48 ) <- in( B46 B47 ) Loop( B47-B47 inner post of N1916) Freq: 2.40701
  0x00007fc5a117a548:   mov    0x10(%r8,%rbx,4),%r9d
  0x00007fc5a117a54d:   add    0x10(%rcx,%rbx,4),%r9d       ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a552:   mov    %r9d,0x10(%rdx,%rbx,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@98 (line 26)
  0x00007fc5a117a557:   inc    %ebx
  0x00007fc5a117a559:   cmp    %r11d,%ebx
  0x00007fc5a117a55c:   jl     0x00007fc5a117a548           ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
 ;; B48: #	out( N625 ) <- in( B47 B45 B19 )  Freq: 0.962813
  0x00007fc5a117a55e:   vzeroupper 
  0x00007fc5a117a561:   add    $0x70,%rsp
  0x00007fc5a117a565:   pop    %rbp
  0x00007fc5a117a566:   cmp    0x128(%r15),%rsp             ;   {poll_return}
  0x00007fc5a117a56d:   ja     0x00007fc5a117a810
  0x00007fc5a117a573:   retq   
 ;; B49: #	out( N625 ) <- in( B14 )  Freq: 0.0123896
  0x00007fc5a117a574:   mov    $0xffffffe4,%esi
  0x00007fc5a117a579:   vmovq  %xmm1,%rbp
  0x00007fc5a117a57e:   mov    %rdx,(%rsp)
  0x00007fc5a117a582:   mov    %r8,0x10(%rsp)
  0x00007fc5a117a587:   mov    %rcx,0x20(%rsp)
  0x00007fc5a117a58c:   mov    %ebx,0x1c(%rsp)
  0x00007fc5a117a590:   mov    %r9d,0x28(%rsp)
  0x00007fc5a117a595:   vmovsd %xmm0,0x30(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a59b:   nop
  0x00007fc5a117a59c:   vzeroupper 
  0x00007fc5a117a59f:   callq  0x00007fc5a1116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop [32]=Oop [48]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@32 (line 21)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc5a117a5a4:   movabs $0x7fc5ab5697b8,%rdi         ;   {external_word}
  0x00007fc5a117a5ae:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a5b2:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a5b7:   hlt    
 ;; B50: #	out( N625 ) <- in( B15 )  Freq: 0.0123896
  0x00007fc5a117a5b8:   mov    $0xffffffe4,%esi
  0x00007fc5a117a5bd:   vmovq  %xmm1,%rbp
  0x00007fc5a117a5c2:   mov    %rdx,(%rsp)
  0x00007fc5a117a5c6:   mov    %rcx,0x8(%rsp)
  0x00007fc5a117a5cb:   mov    %r8,0x20(%rsp)
  0x00007fc5a117a5d0:   mov    %ebx,0x1c(%rsp)
  0x00007fc5a117a5d4:   mov    %edi,0x28(%rsp)
  0x00007fc5a117a5d8:   vmovdqu %ymm2,0x40(%rsp)
  0x00007fc5a117a5de:   vmovsd %xmm0,0x30(%rsp)
  0x00007fc5a117a5e4:   vzeroupper 
  0x00007fc5a117a5e7:   callq  0x00007fc5a1116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [32]=Oop [48]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
                                                            ; - App::micro_vector@44 (line 22)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc5a117a5ec:   movabs $0x7fc5ab5697b8,%rdi         ;   {external_word}
  0x00007fc5a117a5f6:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a5fa:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a5ff:   hlt    
 ;; B51: #	out( N625 ) <- in( B16 )  Freq: 0.0123896
  0x00007fc5a117a600:   mov    $0xffffffe4,%esi
  0x00007fc5a117a605:   vmovq  %xmm1,%rbp
  0x00007fc5a117a60a:   mov    %rcx,0x8(%rsp)
  0x00007fc5a117a60f:   mov    %r8,0x10(%rsp)
  0x00007fc5a117a614:   mov    %rdx,0x20(%rsp)
  0x00007fc5a117a619:   mov    %ebx,0x1c(%rsp)
  0x00007fc5a117a61d:   mov    %r11d,0x28(%rsp)
  0x00007fc5a117a622:   vmovdqu %ymm2,0x40(%rsp)
  0x00007fc5a117a628:   vzeroupper 
  0x00007fc5a117a62b:   callq  0x00007fc5a1116540           ; ImmutableOopMap {rbp=Oop [8]=Oop [16]=Oop [32]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 359)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
                                                            ; - jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
                                                            ; - App::micro_vector@59 (line 23)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc5a117a630:   movabs $0x7fc5ab5697b8,%rdi         ;   {external_word}
  0x00007fc5a117a63a:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a63e:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a643:   hlt    
 ;; B52: #	out( B19 ) <- in( B5 )  Freq: 7.87671e-05
  0x00007fc5a117a644:   xor    %ebx,%ebx
  0x00007fc5a117a646:   jmpq   0x00007fc5a117a3a8
 ;; B53: #	out( N625 ) <- in( B3 )  Freq: 9.99998e-07
  0x00007fc5a117a64b:   mov    $0xffffffde,%esi
  0x00007fc5a117a650:   vmovsd %xmm1,(%rsp)
  0x00007fc5a117a655:   mov    %rdx,0x8(%rsp)
  0x00007fc5a117a65a:   mov    %rcx,0x10(%rsp)
  0x00007fc5a117a65f:   mov    %r8,0x18(%rsp)
  0x00007fc5a117a664:   mov    %r11d,0x20(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a669:   nop
  0x00007fc5a117a66a:   nop
  0x00007fc5a117a66b:   nop
  0x00007fc5a117a66c:   vzeroupper 
  0x00007fc5a117a66f:   callq  0x00007fc5a1116540           ; ImmutableOopMap {rbp=NarrowOop [0]=Oop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc5a117a674:   movabs $0x7fc5ab5697b8,%rdi         ;   {external_word}
  0x00007fc5a117a67e:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a682:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a687:   hlt    
 ;; B54: #	out( N625 ) <- in( B11 B12 B6 B7 B8 B9 B10 )  Freq: 7.03924e-06
  0x00007fc5a117a688:   mov    $0xffffff76,%esi
  0x00007fc5a117a68d:   vmovq  %xmm1,%rbp
  0x00007fc5a117a692:   mov    %rdx,(%rsp)
  0x00007fc5a117a696:   mov    %rcx,0x8(%rsp)
  0x00007fc5a117a69b:   mov    %r8,0x10(%rsp)
  0x00007fc5a117a6a0:   mov    %r10d,0x18(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a6a5:   nop
  0x00007fc5a117a6a6:   nop
  0x00007fc5a117a6a7:   nop
  0x00007fc5a117a6a8:   vzeroupper 
  0x00007fc5a117a6ab:   callq  0x00007fc5a1116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop [16]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@22 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc5a117a6b0:   movabs $0x7fc5ab5697b8,%rdi         ;   {external_word}
  0x00007fc5a117a6ba:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a6be:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a6c3:   hlt    
 ;; B55: #	out( N625 ) <- in( B4 )  Freq: 4.99998e-07
  0x00007fc5a117a6c4:   mov    $0xffffff45,%esi
  0x00007fc5a117a6c9:   vmovsd %xmm1,(%rsp)
  0x00007fc5a117a6ce:   mov    %rdx,0x8(%rsp)
  0x00007fc5a117a6d3:   mov    %rcx,0x10(%rsp)
  0x00007fc5a117a6d8:   mov    %r8,0x18(%rsp)
  0x00007fc5a117a6dd:   mov    %eax,0x20(%rsp)
  0x00007fc5a117a6e1:   mov    %r11d,0x24(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a6e6:   nop
  0x00007fc5a117a6e7:   nop
  0x00007fc5a117a6e8:   vzeroupper 
  0x00007fc5a117a6eb:   callq  0x00007fc5a1116540           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop [24]=Oop }
                                                            ;*ifne {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)
                                                            ; - jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc5a117a6f0:   movabs $0x7fc5ab5697b8,%rdi         ;   {external_word}
  0x00007fc5a117a6fa:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a6fe:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a703:   hlt    
 ;; B56: #	out( N625 ) <- in( B25 B20 B21 B22 B27 B26 B23 B24 )  Freq: 3.90241e-06
  0x00007fc5a117a704:   mov    $0xffffff76,%esi
  0x00007fc5a117a709:   mov    %rdx,%rbp
  0x00007fc5a117a70c:   mov    %rcx,(%rsp)
  0x00007fc5a117a710:   mov    %r8,0x8(%rsp)
  0x00007fc5a117a715:   mov    %ebx,0x14(%rsp)
  0x00007fc5a117a719:   mov    %r11d,0x18(%rsp)             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a71e:   nop
  0x00007fc5a117a71f:   nop
  0x00007fc5a117a720:   vzeroupper 
  0x00007fc5a117a723:   callq  0x00007fc5a1116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_vector@83 (line 25)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc5a117a728:   movabs $0x7fc5ab5697b8,%rdi         ;   {external_word}
  0x00007fc5a117a732:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a736:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a73b:   hlt    
 ;; B57: #	out( N625 ) <- in( B31 )  Freq: 4.87799e-07
  0x00007fc5a117a73c:   movabs $0x7fc5ab701078,%rdi         ;   {external_word}
  0x00007fc5a117a746:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a74a:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a74f:   hlt    
 ;; B58: #	out( N625 ) <- in( B32 )  Freq: 4.87798e-07
  0x00007fc5a117a750:   movabs $0x7fc5ab701078,%rdi         ;   {external_word}
  0x00007fc5a117a75a:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a75e:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a763:   hlt    
 ;; B59: #	out( N625 ) <- in( B33 )  Freq: 4.87798e-07
  0x00007fc5a117a764:   movabs $0x7fc5ab701078,%rdi         ;   {external_word}
  0x00007fc5a117a76e:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a772:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a777:   hlt    
 ;; B60: #	out( N625 ) <- in( B34 )  Freq: 4.87797e-07
  0x00007fc5a117a778:   movabs $0x7fc5ab701078,%rdi         ;   {external_word}
  0x00007fc5a117a782:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a786:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a78b:   hlt    
 ;; B61: #	out( N625 ) <- in( B35 )  Freq: 4.87797e-07
  0x00007fc5a117a78c:   movabs $0x7fc5ab701078,%rdi         ;   {external_word}
  0x00007fc5a117a796:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a79a:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a79f:   hlt    
 ;; B62: #	out( N625 ) <- in( B36 )  Freq: 4.87796e-07
  0x00007fc5a117a7a0:   movabs $0x7fc5ab701078,%rdi         ;   {external_word}
  0x00007fc5a117a7aa:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a7ae:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a7b3:   hlt    
 ;; B63: #	out( N625 ) <- in( B37 )  Freq: 4.87796e-07
  0x00007fc5a117a7b4:   movabs $0x7fc5ab701078,%rdi         ;   {external_word}
  0x00007fc5a117a7be:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a7c2:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a7c7:   hlt    
 ;; B64: #	out( N625 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007fc5a117a7c8:   mov    $0xfffffff6,%esi             ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a7cd:   nop
  0x00007fc5a117a7ce:   nop
  0x00007fc5a117a7cf:   nop
  0x00007fc5a117a7d0:   vzeroupper 
  0x00007fc5a117a7d3:   callq  0x00007fc5a1116540           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@16 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc5a117a7d8:   movabs $0x7fc5ab5697b8,%rdi         ;   {external_word}
  0x00007fc5a117a7e2:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a7e6:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a7eb:   hlt    
 ;; B65: #	out( N625 ) <- in( B2 )  Freq: 1.01328e-06
  0x00007fc5a117a7ec:   mov    $0xfffffff6,%esi
  0x00007fc5a117a7f1:   mov    %r11d,%ebp
  0x00007fc5a117a7f4:   vzeroupper 
  0x00007fc5a117a7f7:   callq  0x00007fc5a1116540           ; ImmutableOopMap {}
                                                            ;*invokeinterface loopBound {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_vector@17 (line 20)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fc5a117a7fc:   movabs $0x7fc5ab5697b8,%rdi         ;   {external_word}
  0x00007fc5a117a806:   and    $0xfffffffffffffff0,%rsp
  0x00007fc5a117a80a:   callq  0x00007fc5aad2eff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fc5a117a80f:   hlt                                 ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
                                                            ; - App::micro_vector@59 (line 23)
  0x00007fc5a117a810:   movabs $0x7fc5a117a566,%r10         ;   {internal_word}
  0x00007fc5a117a81a:   mov    %r10,0x3e8(%r15)
  0x00007fc5a117a821:   jmpq   0x00007fc5a1117220           ;   {runtime_call SafepointBlob}
  0x00007fc5a117a826:   hlt    
  0x00007fc5a117a827:   hlt    
  0x00007fc5a117a828:   hlt    
  0x00007fc5a117a829:   hlt    
  0x00007fc5a117a82a:   hlt    
  0x00007fc5a117a82b:   hlt    
  0x00007fc5a117a82c:   hlt    
  0x00007fc5a117a82d:   hlt    
  0x00007fc5a117a82e:   hlt    
  0x00007fc5a117a82f:   hlt    
  0x00007fc5a117a830:   hlt    
  0x00007fc5a117a831:   hlt    
  0x00007fc5a117a832:   hlt    
  0x00007fc5a117a833:   hlt    
  0x00007fc5a117a834:   hlt    
  0x00007fc5a117a835:   hlt    
  0x00007fc5a117a836:   hlt    
  0x00007fc5a117a837:   hlt    
  0x00007fc5a117a838:   hlt    
  0x00007fc5a117a839:   hlt    
  0x00007fc5a117a83a:   hlt    
  0x00007fc5a117a83b:   hlt    
  0x00007fc5a117a83c:   hlt    
  0x00007fc5a117a83d:   hlt    
  0x00007fc5a117a83e:   hlt    
  0x00007fc5a117a83f:   hlt    
[Exception Handler]
  0x00007fc5a117a840:   jmpq   0x00007fc5a105c6a0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007fc5a117a845:   callq  0x00007fc5a117a84a
  0x00007fc5a117a84a:   subq   $0x5,(%rsp)
  0x00007fc5a117a84f:   jmpq   0x00007fc5a1116860           ;   {runtime_call DeoptimizationBlob}
  0x00007fc5a117a854:   hlt    
  0x00007fc5a117a855:   hlt    
  0x00007fc5a117a856:   hlt    
  0x00007fc5a117a857:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007fc5a117a858:   0x00000000fb064248 a 'java/lang/Class'{0x00000000fb064248} = 'jdk/incubator/vector/Int256Vector'
  0x00007fc5a117a860:   0x00000000fb0640a0 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x00000000fb0640a0}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007fc5a117a868:   0x00007fc548c11818 {method} {0x00007fc548c11818} 'micro_vector' '([I[I[I)V' in 'App'
  0x00007fc5a117a870:   0x00007fc548c12d08 {method} {0x00007fc548c12d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
  0x00007fc5a117a878:   0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fc5a117a880:   0x00007fc548e1e040 {method} {0x00007fc548e1e040} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fc5a117a888:   0x00007fc548c12728 {method} {0x00007fc548c12728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fc5a117a890:   0x00007fc548e18468 {method} {0x00007fc548e18468} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
  0x00007fc5a117a898:   0x00007fc548e1eb40 {method} {0x00007fc548e1eb40} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
  0x00007fc5a117a8a0:   0x0000000800098110 'jdk/incubator/vector/Int256Vector'
  0x00007fc5a117a8a8:   0x00007fc548e84038 {method} {0x00007fc548e84038} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007fc5a117a8b0:   0x00007fc548960ca0 {method} {0x00007fc548960ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
  0x00007fc5a117a8b8:   0x00007fc548e4d2a8 {method} {0x00007fc548e4d2a8} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fc5a117a8c0:   0x00007fc548c13798 {method} {0x00007fc548c13798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fc5a117a8c8:   0x00007fc548c1f8d8 {method} {0x00007fc548c1f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fc5a117a8d0:   0x00007fc548e4e718 {method} {0x00007fc548e4e718} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fc5a117a8d8:   0x00007fc548e4b678 {method} {0x00007fc548e4b678} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
  0x00007fc5a117a8e0:   0x00007fc548c1e8d8 {method} {0x00007fc548c1e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
  0x00007fc5a117a8e8:   0x00007fc548e84340 {method} {0x00007fc548e84340} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
  0x00007fc5a117a8f0:   0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
  0x00007fc5a117a8f8:   0x00007fc548eef250 {method} {0x00007fc548eef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fc5a117a900:   0x00007fc548eeede8 {method} {0x00007fc548eeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fc5a117a908:   0x00007fc548eeeec0 {method} {0x00007fc548eeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
  0x00007fc5a117a910:   0x00007fc548e11968 {method} {0x00007fc548e11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007fc5a117a27f offset=ffffffff bits=0):
PcDesc(pc=0x00007fc5a117a2ac offset=2c bits=0):   App::micro_vector@-1 (line 15)
PcDesc(pc=0x00007fc5a117a2b5 offset=35 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a2b8 offset=38 bits=0):   App::micro_vector@12 (line 20)
PcDesc(pc=0x00007fc5a117a2cc offset=4c bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a2d6 offset=56 bits=0):   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007fc5a117a2d9 offset=59 bits=0):   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007fc5a117a2f4 offset=74 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a2f7 offset=77 bits=0):   App::micro_vector@76 (line 20)
PcDesc(pc=0x00007fc5a117a319 offset=99 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a31c offset=9c bits=0):   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fc5a117a337 offset=b7 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a356 offset=d6 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fc5a117a359 offset=d9 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a369 offset=e9 bits=0):   java.util.Objects::checkIndex@3 (line 359)
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fc5a117a36f offset=ef bits=0):   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
   App::micro_vector@32 (line 21)
PcDesc(pc=0x00007fc5a117a377 offset=f7 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a37e offset=fe bits=0):   jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
   jdk.incubator.vector.IntVector::add@5 (line 1096)
   App::micro_vector@53 (line 23)
PcDesc(pc=0x00007fc5a117a396 offset=116 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a398 offset=118 bits=1):   App::micro_vector@76 (line 20)  reexecute=true
   Locals
    - l0: reg xmm1 [64],oop
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: empty
    - l5: empty
    - l6: reg rbx [6],int
PcDesc(pc=0x00007fc5a117a3cc offset=14c bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a418 offset=198 bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007fc5a117a421 offset=1a1 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a425 offset=1a5 bits=0):   App::micro_vector@98 (line 26)
PcDesc(pc=0x00007fc5a117a4b0 offset=230 bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007fc5a117a4ff offset=27f bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a507 offset=287 bits=0):   App::micro_vector@102 (line 25)
PcDesc(pc=0x00007fc5a117a50e offset=28e bits=1):   App::micro_vector@102 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: empty
    - l5: empty
    - l6: reg rbx [6],int
PcDesc(pc=0x00007fc5a117a520 offset=2a0 bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007fc5a117a533 offset=2b3 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a548 offset=2c8 bits=0):   App::micro_vector@86 (line 26)
PcDesc(pc=0x00007fc5a117a552 offset=2d2 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a557 offset=2d7 bits=0):   App::micro_vector@98 (line 26)
PcDesc(pc=0x00007fc5a117a55e offset=2de bits=0):   App::micro_vector@17 (line 20)
PcDesc(pc=0x00007fc5a117a59b offset=31b bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a5a4 offset=324 bits=0):   java.util.Objects::checkIndex@3 (line 359)
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
PcDesc(pc=0x00007fc5a117a5ec offset=36c bits=0):   java.util.Objects::checkIndex@3 (line 359)
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
PcDesc(pc=0x00007fc5a117a630 offset=3b0 bits=0):   java.util.Objects::checkIndex@3 (line 359)
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
PcDesc(pc=0x00007fc5a117a669 offset=3e9 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a674 offset=3f4 bits=0):   App::micro_vector@17 (line 20)
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
PcDesc(pc=0x00007fc5a117a6a5 offset=425 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a6b0 offset=430 bits=1):   App::micro_vector@22 (line 20)  reexecute=true
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
PcDesc(pc=0x00007fc5a117a6e6 offset=466 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a6f0 offset=470 bits=1):   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
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
PcDesc(pc=0x00007fc5a117a71e offset=49e bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a728 offset=4a8 bits=1):   App::micro_vector@83 (line 25)  reexecute=true
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
PcDesc(pc=0x00007fc5a117a7cd offset=54d bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a7d8 offset=558 bits=0):   App::micro_vector@16 (line 20)
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
PcDesc(pc=0x00007fc5a117a7fc offset=57c bits=0):   App::micro_vector@17 (line 20)
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
PcDesc(pc=0x00007fc5a117a810 offset=590 bits=0):   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
   App::micro_vector@59 (line 23)
PcDesc(pc=0x00007fc5a117a859 offset=5d9 bits=0):
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
ScopeDesc(pc=0x00007fc5a117a2ac offset=2c):
   App::micro_vector@-1 (line 15)
ScopeDesc(pc=0x00007fc5a117a2b5 offset=35):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a2b5 offset=35):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a2b8 offset=38):
   App::micro_vector@12 (line 20)
ScopeDesc(pc=0x00007fc5a117a2cc offset=4c):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a2cc offset=4c):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a2d6 offset=56):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007fc5a117a2d9 offset=59):
   jdk.incubator.vector.AbstractSpecies::loopBound@2 (line 203)
ScopeDesc(pc=0x00007fc5a117a2d9 offset=59):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007fc5a117a2f4 offset=74):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a2f4 offset=74):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a2f7 offset=77):
   App::micro_vector@76 (line 20)
ScopeDesc(pc=0x00007fc5a117a319 offset=99):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a319 offset=99):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a31c offset=9c):
   jdk.incubator.vector.AbstractSpecies::dummyVector@1 (line 295)
ScopeDesc(pc=0x00007fc5a117a31c offset=9c):
   jdk.incubator.vector.IntVector$IntSpecies::dummyVector@1 (line 3574)
ScopeDesc(pc=0x00007fc5a117a31c offset=9c):
   jdk.incubator.vector.IntVector::fromArray@19 (line 2691)
ScopeDesc(pc=0x00007fc5a117a31c offset=9c):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fc5a117a337 offset=b7):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a337 offset=b7):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a356 offset=d6):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fc5a117a356 offset=d6):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fc5a117a356 offset=d6):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fc5a117a356 offset=d6):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fc5a117a359 offset=d9):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fc5a117a359 offset=d9):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fc5a117a359 offset=d9):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
ScopeDesc(pc=0x00007fc5a117a359 offset=d9):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a369 offset=e9):
   java.util.Objects::checkIndex@3 (line 359)
ScopeDesc(pc=0x00007fc5a117a369 offset=e9):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
ScopeDesc(pc=0x00007fc5a117a369 offset=e9):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
ScopeDesc(pc=0x00007fc5a117a369 offset=e9):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fc5a117a36f offset=ef):
   jdk.incubator.vector.IntVector::fromArray0Template@31 (line 3209)
ScopeDesc(pc=0x00007fc5a117a36f offset=ef):
   jdk.incubator.vector.Int256Vector::fromArray0@3 (line 789)
ScopeDesc(pc=0x00007fc5a117a36f offset=ef):
   jdk.incubator.vector.IntVector::fromArray@24 (line 2691)
ScopeDesc(pc=0x00007fc5a117a36f offset=ef):
   App::micro_vector@32 (line 21)
ScopeDesc(pc=0x00007fc5a117a377 offset=f7):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a377 offset=f7):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a37e offset=fe):
   jdk.incubator.vector.IntVector::lanewiseTemplate@244 (line 633)
ScopeDesc(pc=0x00007fc5a117a37e offset=fe):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 279)
ScopeDesc(pc=0x00007fc5a117a37e offset=fe):
   jdk.incubator.vector.Int256Vector::lanewise@3 (line 41)
ScopeDesc(pc=0x00007fc5a117a37e offset=fe):
   jdk.incubator.vector.IntVector::add@5 (line 1096)
ScopeDesc(pc=0x00007fc5a117a37e offset=fe):
   App::micro_vector@53 (line 23)
ScopeDesc(pc=0x00007fc5a117a396 offset=116):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a396 offset=116):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a398 offset=118):
   App::micro_vector@76 (line 20)  reexecute=true
   Locals
    - l0: reg xmm1 [64],oop
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: empty
    - l5: empty
    - l6: reg rbx [6],int
ScopeDesc(pc=0x00007fc5a117a3cc offset=14c):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a3cc offset=14c):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a418 offset=198):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007fc5a117a421 offset=1a1):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a421 offset=1a1):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a425 offset=1a5):
   App::micro_vector@98 (line 26)
ScopeDesc(pc=0x00007fc5a117a4b0 offset=230):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007fc5a117a4ff offset=27f):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a4ff offset=27f):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a507 offset=287):
   App::micro_vector@102 (line 25)
ScopeDesc(pc=0x00007fc5a117a50e offset=28e):
   App::micro_vector@102 (line 25)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: empty
    - l5: empty
    - l6: reg rbx [6],int
ScopeDesc(pc=0x00007fc5a117a520 offset=2a0):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007fc5a117a533 offset=2b3):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a533 offset=2b3):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a548 offset=2c8):
   App::micro_vector@86 (line 26)
ScopeDesc(pc=0x00007fc5a117a552 offset=2d2):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a552 offset=2d2):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a557 offset=2d7):
   App::micro_vector@98 (line 26)
ScopeDesc(pc=0x00007fc5a117a55e offset=2de):
   App::micro_vector@17 (line 20)
ScopeDesc(pc=0x00007fc5a117a59b offset=31b):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a59b offset=31b):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a5a4 offset=324):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007fc5a117a5a4 offset=324):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fc5a117a5a4 offset=324):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[48],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fc5a117a5a4 offset=324):
   App::micro_vector@32 (line 21)
   Locals
    - l0: reg rbp [10],oop
    - l1: stack[0],oop
    - l2: stack[32],oop
    - l3: stack[16],oop
    - l4: empty
    - l5: empty
    - l6: stack[28]
ScopeDesc(pc=0x00007fc5a117a5ec offset=36c):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007fc5a117a5ec offset=36c):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fc5a117a5ec offset=36c):
   jdk.incubator.vector.IntVector::fromArray@9 (line 2689)
   Locals
    - l0: stack[48],oop
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fc5a117a5ec offset=36c):
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
ScopeDesc(pc=0x00007fc5a117a630 offset=3b0):
   java.util.Objects::checkIndex@3 (line 359)
   Locals
    - l0: empty
    - l1: empty
   Expression stack
    - @0: stack[28]
    - @1: stack[40]
    - @2: NULL
ScopeDesc(pc=0x00007fc5a117a630 offset=3b0):
   jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 74)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
ScopeDesc(pc=0x00007fc5a117a630 offset=3b0):
   jdk.incubator.vector.IntVector::intoArray@7 (line 2960)
   Locals
    - l0: obj[263]
    - l1: stack[32],oop
    - l2: empty
    - l3: empty
ScopeDesc(pc=0x00007fc5a117a630 offset=3b0):
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
ScopeDesc(pc=0x00007fc5a117a669 offset=3e9):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a669 offset=3e9):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a674 offset=3f4):
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
ScopeDesc(pc=0x00007fc5a117a6a5 offset=425):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a6a5 offset=425):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a6b0 offset=430):
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
ScopeDesc(pc=0x00007fc5a117a6e6 offset=466):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a6e6 offset=466):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a6f0 offset=470):
   jdk.incubator.vector.VectorIntrinsics::roundDown@5 (line 106)  reexecute=true
   Locals
    - l0: stack[36]
    - l1: stack[32]
   Expression stack
    - @0: reg rbp [10],int
ScopeDesc(pc=0x00007fc5a117a6f0 offset=470):
   jdk.incubator.vector.AbstractSpecies::loopBound@5 (line 203)
   Locals
    - l0: empty
    - l1: empty
ScopeDesc(pc=0x00007fc5a117a6f0 offset=470):
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
ScopeDesc(pc=0x00007fc5a117a71e offset=49e):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a71e offset=49e):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a728 offset=4a8):
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
ScopeDesc(pc=0x00007fc5a117a7cd offset=54d):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a7cd offset=54d):
   App::micro_vector@59 (line 23)
ScopeDesc(pc=0x00007fc5a117a7d8 offset=558):
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
ScopeDesc(pc=0x00007fc5a117a7fc offset=57c):
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
ScopeDesc(pc=0x00007fc5a117a810 offset=590):
   jdk.incubator.vector.IntVector::intoArray@42 (line 2962)
ScopeDesc(pc=0x00007fc5a117a810 offset=590):
   App::micro_vector@59 (line 23)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007fc5a117a188: 6014
relocInfo@0x00007fc5a117a188 [type=6(runtime_call) addr=0x00007fc5a117a294 offset=20] | [destination=0x00007fc5a1115920]
         @0x00007fc5a117a18a: f003cc31
relocInfo@0x00007fc5a117a18c [type=12(metadata) addr=0x00007fc5a117a2c5 offset=49 format=3 data=3] | [metadata_addr=0x00007fc5a117a878 *=0x0000000800094b80 offset=0]metadata_value=0x0000000800094b80: 'jdk/incubator/vector/IntVector$IntSpecies'
         @0x00007fc5a117a18e: f008cc60
relocInfo@0x00007fc5a117a190 [type=12(metadata) addr=0x00007fc5a117a325 offset=96 format=3 data=8] | [metadata_addr=0x00007fc5a117a8a0 *=0x0000000800098110 offset=0]metadata_value=0x0000000800098110: 'jdk/incubator/vector/Int256Vector'
         @0x00007fc5a117a192: a073
relocInfo@0x00007fc5a117a192 [type=10(poll) addr=0x00007fc5a117a398 offset=115]
         @0x00007fc5a117a194: a176
relocInfo@0x00007fc5a117a194 [type=10(poll) addr=0x00007fc5a117a50e offset=374]
         @0x00007fc5a117a196: b058
relocInfo@0x00007fc5a117a196 [type=11(poll_return) addr=0x00007fc5a117a566 offset=88]
         @0x00007fc5a117a198: 6439
relocInfo@0x00007fc5a117a198 [type=6(runtime_call) addr=0x00007fc5a117a59f offset=57 format=1] | [destination=0x00007fc5a1116540]
         @0x00007fc5a117a19a: f803ab5697b87fc57005
relocInfo@0x00007fc5a117a1a2 [type=7(external_word) addr=0x00007fc5a117a5a4 offset=5 data={ab5697b87fc5}] | [target=0x00007fc5ab5697b8]
         @0x00007fc5a117a1a4: 640e
relocInfo@0x00007fc5a117a1a4 [type=6(runtime_call) addr=0x00007fc5a117a5b2 offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a1a6: 6435
relocInfo@0x00007fc5a117a1a6 [type=6(runtime_call) addr=0x00007fc5a117a5e7 offset=53 format=1] | [destination=0x00007fc5a1116540]
         @0x00007fc5a117a1a8: f803ab5697b87fc57005
relocInfo@0x00007fc5a117a1b0 [type=7(external_word) addr=0x00007fc5a117a5ec offset=5 data={ab5697b87fc5}] | [target=0x00007fc5ab5697b8]
         @0x00007fc5a117a1b2: 640e
relocInfo@0x00007fc5a117a1b2 [type=6(runtime_call) addr=0x00007fc5a117a5fa offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a1b4: 6431
relocInfo@0x00007fc5a117a1b4 [type=6(runtime_call) addr=0x00007fc5a117a62b offset=49 format=1] | [destination=0x00007fc5a1116540]
         @0x00007fc5a117a1b6: f803ab5697b87fc57005
relocInfo@0x00007fc5a117a1be [type=7(external_word) addr=0x00007fc5a117a630 offset=5 data={ab5697b87fc5}] | [target=0x00007fc5ab5697b8]
         @0x00007fc5a117a1c0: 640e
relocInfo@0x00007fc5a117a1c0 [type=6(runtime_call) addr=0x00007fc5a117a63e offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a1c2: 6431
relocInfo@0x00007fc5a117a1c2 [type=6(runtime_call) addr=0x00007fc5a117a66f offset=49 format=1] | [destination=0x00007fc5a1116540]
         @0x00007fc5a117a1c4: f803ab5697b87fc57005
relocInfo@0x00007fc5a117a1cc [type=7(external_word) addr=0x00007fc5a117a674 offset=5 data={ab5697b87fc5}] | [target=0x00007fc5ab5697b8]
         @0x00007fc5a117a1ce: 640e
relocInfo@0x00007fc5a117a1ce [type=6(runtime_call) addr=0x00007fc5a117a682 offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a1d0: 6429
relocInfo@0x00007fc5a117a1d0 [type=6(runtime_call) addr=0x00007fc5a117a6ab offset=41 format=1] | [destination=0x00007fc5a1116540]
         @0x00007fc5a117a1d2: f803ab5697b87fc57005
relocInfo@0x00007fc5a117a1da [type=7(external_word) addr=0x00007fc5a117a6b0 offset=5 data={ab5697b87fc5}] | [target=0x00007fc5ab5697b8]
         @0x00007fc5a117a1dc: 640e
relocInfo@0x00007fc5a117a1dc [type=6(runtime_call) addr=0x00007fc5a117a6be offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a1de: 642d
relocInfo@0x00007fc5a117a1de [type=6(runtime_call) addr=0x00007fc5a117a6eb offset=45 format=1] | [destination=0x00007fc5a1116540]
         @0x00007fc5a117a1e0: f803ab5697b87fc57005
relocInfo@0x00007fc5a117a1e8 [type=7(external_word) addr=0x00007fc5a117a6f0 offset=5 data={ab5697b87fc5}] | [target=0x00007fc5ab5697b8]
         @0x00007fc5a117a1ea: 640e
relocInfo@0x00007fc5a117a1ea [type=6(runtime_call) addr=0x00007fc5a117a6fe offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a1ec: 6425
relocInfo@0x00007fc5a117a1ec [type=6(runtime_call) addr=0x00007fc5a117a723 offset=37 format=1] | [destination=0x00007fc5a1116540]
         @0x00007fc5a117a1ee: f803ab5697b87fc57005
relocInfo@0x00007fc5a117a1f6 [type=7(external_word) addr=0x00007fc5a117a728 offset=5 data={ab5697b87fc5}] | [target=0x00007fc5ab5697b8]
         @0x00007fc5a117a1f8: 640e
relocInfo@0x00007fc5a117a1f8 [type=6(runtime_call) addr=0x00007fc5a117a736 offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a1fa: f803ab7010787fc57006
relocInfo@0x00007fc5a117a202 [type=7(external_word) addr=0x00007fc5a117a73c offset=6 data={ab7010787fc5}] | [target=0x00007fc5ab701078]
         @0x00007fc5a117a204: 640e
relocInfo@0x00007fc5a117a204 [type=6(runtime_call) addr=0x00007fc5a117a74a offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a206: f803ab7010787fc57006
relocInfo@0x00007fc5a117a20e [type=7(external_word) addr=0x00007fc5a117a750 offset=6 data={ab7010787fc5}] | [target=0x00007fc5ab701078]
         @0x00007fc5a117a210: 640e
relocInfo@0x00007fc5a117a210 [type=6(runtime_call) addr=0x00007fc5a117a75e offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a212: f803ab7010787fc57006
relocInfo@0x00007fc5a117a21a [type=7(external_word) addr=0x00007fc5a117a764 offset=6 data={ab7010787fc5}] | [target=0x00007fc5ab701078]
         @0x00007fc5a117a21c: 640e
relocInfo@0x00007fc5a117a21c [type=6(runtime_call) addr=0x00007fc5a117a772 offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a21e: f803ab7010787fc57006
relocInfo@0x00007fc5a117a226 [type=7(external_word) addr=0x00007fc5a117a778 offset=6 data={ab7010787fc5}] | [target=0x00007fc5ab701078]
         @0x00007fc5a117a228: 640e
relocInfo@0x00007fc5a117a228 [type=6(runtime_call) addr=0x00007fc5a117a786 offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a22a: f803ab7010787fc57006
relocInfo@0x00007fc5a117a232 [type=7(external_word) addr=0x00007fc5a117a78c offset=6 data={ab7010787fc5}] | [target=0x00007fc5ab701078]
         @0x00007fc5a117a234: 640e
relocInfo@0x00007fc5a117a234 [type=6(runtime_call) addr=0x00007fc5a117a79a offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a236: f803ab7010787fc57006
relocInfo@0x00007fc5a117a23e [type=7(external_word) addr=0x00007fc5a117a7a0 offset=6 data={ab7010787fc5}] | [target=0x00007fc5ab701078]
         @0x00007fc5a117a240: 640e
relocInfo@0x00007fc5a117a240 [type=6(runtime_call) addr=0x00007fc5a117a7ae offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a242: f803ab7010787fc57006
relocInfo@0x00007fc5a117a24a [type=7(external_word) addr=0x00007fc5a117a7b4 offset=6 data={ab7010787fc5}] | [target=0x00007fc5ab701078]
         @0x00007fc5a117a24c: 640e
relocInfo@0x00007fc5a117a24c [type=6(runtime_call) addr=0x00007fc5a117a7c2 offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a24e: 6411
relocInfo@0x00007fc5a117a24e [type=6(runtime_call) addr=0x00007fc5a117a7d3 offset=17 format=1] | [destination=0x00007fc5a1116540]
         @0x00007fc5a117a250: f803ab5697b87fc57005
relocInfo@0x00007fc5a117a258 [type=7(external_word) addr=0x00007fc5a117a7d8 offset=5 data={ab5697b87fc5}] | [target=0x00007fc5ab5697b8]
         @0x00007fc5a117a25a: 640e
relocInfo@0x00007fc5a117a25a [type=6(runtime_call) addr=0x00007fc5a117a7e6 offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a25c: 6411
relocInfo@0x00007fc5a117a25c [type=6(runtime_call) addr=0x00007fc5a117a7f7 offset=17 format=1] | [destination=0x00007fc5a1116540]
         @0x00007fc5a117a25e: f803ab5697b87fc57005
relocInfo@0x00007fc5a117a266 [type=7(external_word) addr=0x00007fc5a117a7fc offset=5 data={ab5697b87fc5}] | [target=0x00007fc5ab5697b8]
         @0x00007fc5a117a268: 640e
relocInfo@0x00007fc5a117a268 [type=6(runtime_call) addr=0x00007fc5a117a80a offset=14 format=1] | [destination=0x00007fc5aad2eff4]
         @0x00007fc5a117a26a: f2aa8006
relocInfo@0x00007fc5a117a26c [type=8(internal_word) addr=0x00007fc5a117a810 offset=6 data=682] | [target=0x00007fc5a117a566]
         @0x00007fc5a117a26e: 6411
relocInfo@0x00007fc5a117a26e [type=6(runtime_call) addr=0x00007fc5a117a821 offset=17 format=1] | [destination=0x00007fc5a1117220]
         @0x00007fc5a117a270: 001f
relocInfo@0x00007fc5a117a270 [type=0(none) addr=0x00007fc5a117a840 offset=31]
         @0x00007fc5a117a272: 6400
relocInfo@0x00007fc5a117a272 [type=6(runtime_call) addr=0x00007fc5a117a840 offset=0 format=1] | [destination=0x00007fc5a105c6a0]
         @0x00007fc5a117a274: 640f
relocInfo@0x00007fc5a117a274 [type=6(runtime_call) addr=0x00007fc5a117a84f offset=15 format=1] | [destination=0x00007fc5a1116860]
         @0x00007fc5a117a276: 0000
relocInfo@0x00007fc5a117a276 [type=0(none) addr=0x00007fc5a117a84f offset=0]
         @0x00007fc5a117a278: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fc548eef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fc548eeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$AssociativeImpl
  method  = {method} {0x00007fc548eeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$AssociativeImpl
Dependency of type unique_concrete_method
  context = jdk.incubator.vector.VectorOperators$ImplCache
  method  = {method} {0x00007fc548e11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
   [nmethod<=klass]jdk.incubator.vector.VectorOperators$ImplCache
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 7 entries, 60 bytes):
{
   < 0x00007fc5a117a2b1, 0x00007fc5a117a7c8 > < 0x00007fc5a117a2c0, 0x00007fc5a117a7ec > < 0x00007fc5a117a306, 0x00007fc5a117a688 > 
   < 0x00007fc5a117a320, 0x00007fc5a117a688 > < 0x00007fc5a117a331, 0x00007fc5a117a688 > < 0x00007fc5a117a3b1, 0x00007fc5a117a704 > 
   < 0x00007fc5a117a3cc, 0x00007fc5a117a704 > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x00000000fb064248 a 'java/lang/Class'{0x00000000fb064248} = 'jdk/incubator/vector/Int256Vector'
#2: 0x00000000fb0640a0 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x00000000fb0640a0}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
# 0: 0x0000000000000000 NULL-oop
# 1: 0x00007fc548c11818 {method} {0x00007fc548c11818} 'micro_vector' '([I[I[I)V' in 'App'
# 2: 0x00007fc548c12d08 {method} {0x00007fc548c12d08} 'intoArray' '([II)V' in 'jdk/incubator/vector/IntVector'
# 3: 0x0000000800094b80 'jdk/incubator/vector/IntVector$IntSpecies'
# 4: 0x00007fc548e1e040 {method} {0x00007fc548e1e040} 'loopBound' '(I)I' in 'jdk/incubator/vector/AbstractSpecies'
# 5: 0x00007fc548c12728 {method} {0x00007fc548c12728} 'fromArray' '(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
# 6: 0x00007fc548e18468 {method} {0x00007fc548e18468} 'dummyVector' '()Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector$IntSpecies'
# 7: 0x00007fc548e1eb40 {method} {0x00007fc548e1eb40} 'dummyVector' '()Ljdk/incubator/vector/AbstractVector;' in 'jdk/incubator/vector/AbstractSpecies'
# 8: 0x0000000800098110 'jdk/incubator/vector/Int256Vector'
# 9: 0x00007fc548e84038 {method} {0x00007fc548e84038} 'checkFromIndexSize' '(III)I' in 'jdk/incubator/vector/VectorIntrinsics'
#10: 0x00007fc548960ca0 {method} {0x00007fc548960ca0} 'checkIndex' '(II)I' in 'java/util/Objects'
#11: 0x00007fc548e4d2a8 {method} {0x00007fc548e4d2a8} 'fromArray0' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
#12: 0x00007fc548c13798 {method} {0x00007fc548c13798} 'fromArray0Template' '([II)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#13: 0x00007fc548c1f8d8 {method} {0x00007fc548c1f8d8} 'add' '(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#14: 0x00007fc548e4e718 {method} {0x00007fc548e4e718} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/Int256Vector'
#15: 0x00007fc548e4b678 {method} {0x00007fc548e4b678} 'lanewise' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/Int256Vector;' in 'jdk/incubator/vector/Int256Vector'
#16: 0x00007fc548c1e8d8 {method} {0x00007fc548c1e8d8} 'lanewiseTemplate' '(Ljdk/incubator/vector/VectorOperators$Binary;Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;' in 'jdk/incubator/vector/IntVector'
#17: 0x00007fc548e84340 {method} {0x00007fc548e84340} 'roundDown' '(II)I' in 'jdk/incubator/vector/VectorIntrinsics'
#18: 0x00000008000a2b78 'jdk/incubator/vector/VectorOperators$AssociativeImpl'
#19: 0x00007fc548eef250 {method} {0x00007fc548eef250} 'opKind' '(I)Z' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#20: 0x00007fc548eeede8 {method} {0x00007fc548eeede8} 'opCode' '(II)I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#21: 0x00007fc548eeeec0 {method} {0x00007fc548eeeec0} 'opCodeRaw' '()I' in 'jdk/incubator/vector/VectorOperators$OperatorImpl'
#22: 0x00007fc548e11968 {method} {0x00007fc548e11968} 'find' '(Ljdk/incubator/vector/VectorOperators$Operator;ILjava/util/function/IntFunction;)Ljava/lang/Object;' in 'jdk/incubator/vector/VectorOperators$ImplCache'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VECTOR : [Time] 2420 ms   [Res] 999990000000000
VECTOR_MASKED : [Time] 3101 ms   [Res] 999990000000000
------------------------------------------------------------------------
App::micro_vector([I[I[I)V
  interpreter_invocation_count:       41 
  invocation_counter:              10000 
  backedge_counter:                 5273 
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
                                    'jdk/incubator/vector/IntVector$IntSpecies'(509242 1.00)
22 if_icmpge 79
  56  bci: 22   BranchData          taken(41) displacement(256)
                                    not taken(509201)
25 fast_aaccess_0
26 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
29 aload_2
30 fast_iload #6
32 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  88  bci: 32   CounterData         count(509201)
35 astore #4
37 fast_aaccess_0
38 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
41 aload_3
42 fast_iload #6
44 invokestatic 24 <jdk/incubator/vector/IntVector.fromArray(Ljdk/incubator/vector/VectorSpecies;[II)Ljdk/incubator/vector/IntVector;> 
  104 bci: 44   CounterData         count(509201)
47 astore #5
49 aload #4
51 aload #5
53 invokevirtual 28 <jdk/incubator/vector/IntVector.add(Ljdk/incubator/vector/Vector;)Ljdk/incubator/vector/IntVector;> 
  120 bci: 53   VirtualCallData     count(509201) nonprofiled_count(0) entries(0)
56 aload_1
57 fast_iload #6
59 invokevirtual 32 <jdk/incubator/vector/IntVector.intoArray([II)V> 
  176 bci: 59   VirtualCallData     count(509201) nonprofiled_count(0) entries(0)
62 fast_iload #6
64 fast_aaccess_0
65 fast_agetfield 13 <App.SPECIES/Ljdk/incubator/vector/VectorSpecies;> 
68 invokeinterface 36 <jdk/incubator/vector/VectorSpecies.length()I> 
  232 bci: 68   VirtualCallData     count(0) nonprofiled_count(0) entries(1)
                                    'jdk/incubator/vector/IntVector$IntSpecies'(509201 1.00)
73 iadd
74 istore #6
76 goto 9
  288 bci: 76   JumpData            taken(509201) displacement(-288)
79 fast_iload #6
81 aload_1
82 arraylength
83 if_icmpge 105
  312 bci: 83   BranchData          taken(41) displacement(56)
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
