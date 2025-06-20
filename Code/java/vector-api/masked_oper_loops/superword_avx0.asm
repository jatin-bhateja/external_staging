CompileCommand: print App.micro_scalar bool print = true

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 99 ------------------------
{method}
 - this oop:          0x00007f294f8116e8
 - method holder:     'App'
 - constants:         0x00007f294f811090 constant pool [134]/operands[15] {0x00007f294f811090} for 'App' cache=0x00007f294fb00000
 - access:            0xc1000001  public 
 - name:              'micro_scalar'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        5
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007f29ad00e160
 - adapters:          AHE@0x00007f29b03b4280: 0xbbbb0000 i2c: 0x00007f29ad07f960 c2i: 0x00007f29ad07fa4c c2iUV: 0x00007f29ad07fa16 c2iNCI: 0x00007f29ad07fa89
 - compiled entry     0x00007f29ad07fa4c
 - code size:         30
 - code start:        0x00007f294f8116c0
 - code end (excl):   0x00007f294f8116de
 - method data:       0x00007f294f811db0
 - checked ex length: 0
 - linenumber start:  0x00007f294f8116de
 - localvar length:   0

------------------------ OptoAssembly for Compile_id = 99 -----------------------
#
#  void ( rawptr:BotPTR )
#
#r018 rsi:rsi   : parm 0: rawptr:BotPTR
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
000     N533: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
000     # breakpoint
        nop 	# 11 bytes pad for loops and calls

010     B1: #	out( B48 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
010     # stack bang (176 bytes)
	pushq   rbp	# Save rbp
	subq    rsp, #80	# Create frame

01c     movq    R14, [RSI + #24 (8-bit)]	# ptr
020     movq    RBP, [RSI + #16 (8-bit)]	# ptr
024     movl    R13, [RSI]	# int
027     movq    RBX, [RSI + #8 (8-bit)]	# ptr
02b     movq    RDI, RSI	# spill
02e     call_leaf,runtime  OSR_migration_end
        No JVM State Info
        # 
        nop 	# 5 bytes pad for loops and calls
040     testq   R14, R14	# ptr
043     je     B48  P=0.001000 C=-1.000000

049     B2: #	out( B59 B3 ) <- in( B1 )  Freq: 0.999
049     movl    R10, [R14 + #8 (8-bit)]	# compressed klass ptr
04d     cmpl    R10, narrowklass: precise klass [I: 0x00007f2930014ea0:Constant:exact *	# compressed klass ptr
054     jne,u   B59  P=0.000001 C=-1.000000

05a     B3: #	out( B4 ) <- in( B2 )  Freq: 0.998999
05a     movq    R8, R14	# spill
05d     # checkcastPP of R8

05d     B4: #	out( B49 B5 ) <- in( B3 B48 )  Freq: 0.999999
        nop 	# 3 bytes pad for loops and calls
060     testq   RBP, RBP	# ptr
063     je     B49  P=0.001000 C=-1.000000

069     B5: #	out( B59 B6 ) <- in( B4 )  Freq: 0.998999
069     movl    R11, [RBP + #8 (8-bit)]	# compressed klass ptr
06d     cmpl    R11, narrowklass: precise klass [I: 0x00007f2930014ea0:Constant:exact *	# compressed klass ptr
074     jne,u   B59  P=0.000001 C=-1.000000

07a     B6: #	out( B7 ) <- in( B5 )  Freq: 0.998998
07a     movq    R9, RBP	# spill
07d     # checkcastPP of R9

07d     B7: #	out( B50 B8 ) <- in( B6 B49 )  Freq: 0.999998
        nop 	# 3 bytes pad for loops and calls
080     testq   RBX, RBX	# ptr
083     je     B50  P=0.001000 C=-1.000000

089     B8: #	out( B59 B9 ) <- in( B7 )  Freq: 0.998998
089     movl    R10, [RBX + #8 (8-bit)]	# compressed klass ptr
08d     cmpl    R10, narrowklass: precise klass [I: 0x00007f2930014ea0:Constant:exact *	# compressed klass ptr
094     jne,u   B59  P=0.000001 C=-1.000000

09a     B9: #	out( B10 ) <- in( B8 )  Freq: 0.998997
09a     # checkcastPP of RBX

09a     B10: #	out( B60 B11 ) <- in( B9 B50 )  Freq: 0.999997
        nop 	# 6 bytes pad for loops and calls
0a0     movl    RDI, [R8 + #12 (8-bit)]	# range
0a4     NullCheck R8

0a4     B11: #	out( B60 B12 ) <- in( B10 )  Freq: 0.999996
0a4     movl    R14, [R9 + #12 (8-bit)]	# range
0a8     NullCheck R9

0a8     B12: #	out( B60 B13 ) <- in( B11 )  Freq: 0.999995
0a8     movl    RSI, [RBX + #12 (8-bit)]	# range
0ab     NullCheck RBX

0ab     B13: #	out( B44 B14 ) <- in( B12 )  Freq: 0.999994
0ab     cmpl    R13, RDI
0ae     jge     B44  P=0.000000 C=15360.000000

0b4     B14: #	out( B15 ) <- in( B13 )  Freq: 0.999993
0b4     movl    RCX, R8	# ptr -> int
0b7     movl    R11, R13	# spill
0ba     incl    R11	# int
0bd     shrl    RCX, #2
0c0     andl    RCX, #3	# int
0c3     xorl    R10, R10	# int
0c6     cmpl    R11, R10
0c9     cmovllt R11, R10	# max
0cd     cmpl    R11, R10
0d0     cmovllt R11, R10	# max
0d4     cmpl    R11, RDI
0d7     cmovlgt R11, RDI	# min
0db     addl    RCX, R11	# int
0de     negl    RCX	# int
0e0     andl    RCX, #3	# int
0e3     addl    RCX, R11	# int
0e6     cmpl    RCX, RDI
0e8     cmovlgt RCX, RDI	# min

0eb     B15: #	out( B45 B16 ) <- in( B14 B18 ) Loop( B15-B18 inner pre of N419) Freq: 1.99998
0eb     cmpl    R13, R14	# unsigned
0ee     jnb,u   B45  P=0.000001 C=-1.000000

0f4     B16: #	out( B46 B17 ) <- in( B15 )  Freq: 1.99998
0f4     movl    RBP, [R9 + #16 + R13 << #2]	# int
0f9     cmpl    R13, RSI	# unsigned
        nop 	# 4 bytes pad for loops and calls
100     jnb,u   B46  P=0.000001 C=-1.000000

106     B17: #	out( B47 B18 ) <- in( B16 )  Freq: 1.99998
106     addl    RBP, [RBX + #16 + R13 << #2]	# int
10b     cmpl    R13, RDI	# unsigned
10e     jnb,u   B47  P=0.000001 C=-1.000000

114     B18: #	out( B15 B19 ) <- in( B17 )  Freq: 1.99997
114     movl    [R8 + #16 + R13 << #2], RBP	# int
119     incl    R13	# int
        nop 	# 4 bytes pad for loops and calls
120     cmpl    R13, RCX
123     jl,s   B15	# loop end  P=0.500000 C=15360.000000

125     B19: #	out( B38 B20 ) <- in( B18 )  Freq: 0.999987
125     cmpl    R14, RSI
128     movl    RBP, R14	# spill
12b     cmovlgt RBP, RSI	# min
12e     cmpl    RBP, RDI
130     cmovlgt RBP, RDI	# min
133     movl    R11, RBP	# spill
136     addl    R11, #-15	# int
13a     movl    RAX, #-2147483648	# int
13f     cmpl    RBP, R11
142     cmovll R11, RAX	# signed, int
146     cmpl    R13, R11
149     jge     B38  P=0.000001 C=-1.000000

14f     B20: #	out( B51 B21 ) <- in( B19 )  Freq: 0.999986
14f     # castII of R13
14f     cmpl    R13, R14	# unsigned
152     jnb,u   B51  P=0.000001 C=-1.000000

158     B21: #	out( B52 B22 ) <- in( B20 )  Freq: 0.999985
158     cmpl    R13, RSI	# unsigned
        nop 	# 5 bytes pad for loops and calls
160     jnb,u   B52  P=0.000001 C=-1.000000

166     B22: #	out( B53 B23 ) <- in( B21 )  Freq: 0.999984
166     cmpl    R13, RDI	# unsigned
169     jnb,u   B53  P=0.000001 C=-1.000000

16f     B23: #	out( B54 B24 ) <- in( B22 )  Freq: 0.999983
16f     movl    RCX, R13	# spill
172     addl    RCX, #15	# int
175     cmpl    RCX, RDI	# unsigned
177     jnb,u   B54  P=0.000001 C=-1.000000

17d     B24: #	out( B55 B25 ) <- in( B23 )  Freq: 0.999982
        nop 	# 3 bytes pad for loops and calls
180     cmpl    RCX, RSI	# unsigned
182     jnb,u   B55  P=0.000001 C=-1.000000

188     B25: #	out( B56 B26 ) <- in( B24 )  Freq: 0.999981
188     cmpl    R13, RSI	# unsigned
18b     jnb,u   B56  P=0.000001 C=-1.000000

191     B26: #	out( B57 B27 ) <- in( B25 )  Freq: 0.99998
191     cmpl    RCX, R14	# unsigned
194     jnb,u   B57  P=0.000001 C=-1.000000

19a     B27: #	out( B58 B28 ) <- in( B26 )  Freq: 0.999979
        nop 	# 6 bytes pad for loops and calls
1a0     cmpl    R13, R14	# unsigned
1a3     jnb,u   B58  P=0.000001 C=-1.000000

1a9     B28: #	out( B31 ) <- in( B27 )  Freq: 0.999978
1a9     movl    RCX, #16000	# int
1ae     # TLS is in R15
1ae     jmp,s   B31

1b0     B29: #	out( B34 B30 ) <- in( B33 ) top-of-loop Freq: 999978
1b0     movq    RDX, [R15 + #304 (32-bit)]	# ptr
1b7     testl   rax, [RDX]	# Safepoint: poll for GC        # App::micro_scalar @ bci:26 (line 9) L[0]=_ L[1]=R8 L[2]=R9 L[3]=RBX L[4]=R13
        # OopMap {r8=Oop r9=Oop rbx=Oop off=439/0x1b7}
1b9     cmpl    R13, R11
        nop 	# 4 bytes pad for loops and calls
1c0     jge     B34  P=0.000000 C=15360.000000

1c6     B30: #	out( B31 ) <- in( B29 )  Freq: 999978
1c6     movdl   RSI, XMM0	# spill

1ca     B31: #	out( B32 ) <- in( B28 B30 ) Loop( B31-B30 ) Freq: 999978
1ca     movl    RDX, R11	# spill
1cd     subl    RDX, R13	# int
1d0     cmpl    R11, R13
1d3     cmovll RDX, R10	# signed, int
1d7     cmpl    RDX, #16000	# unsigned
1dd     cmovlnbe RDX, RCX	# unsigned, int
1e0     addl    RDX, R13	# int
1e3     movdl   XMM0, RSI	# spill
        nop 	# 9 bytes pad for loops and calls

1f0     B32: #	out( B32 B33 ) <- in( B31 B32 ) Loop( B32-B32 inner main of N219 strip mined) Freq: 9.99978e+11
1f0     load_vector XMM1,[R9 + #16 + R13 << #2]
1f7     load_vector XMM2,[RBX + #16 + R13 << #2]
1fe     paddd   XMM2,XMM1	! add packedI
202     store_vector [R8 + #16 + R13 << #2],XMM2
	
209     movslq  RSI, R13	# i2l
20c     load_vector XMM1,[RBX + #32 + RSI << #2]
212     load_vector XMM2,[R9 + #32 + RSI << #2]
219     paddd   XMM1,XMM2	! add packedI
21d     store_vector [R8 + #32 + RSI << #2],XMM1
	
224     load_vector XMM1,[RBX + #48 + RSI << #2]
22a     load_vector XMM2,[R9 + #48 + RSI << #2]
231     paddd   XMM1,XMM2	! add packedI
235     store_vector [R8 + #48 + RSI << #2],XMM1
	
23c     load_vector XMM1,[RBX + #64 + RSI << #2]
242     load_vector XMM2,[R9 + #64 + RSI << #2]
249     paddd   XMM1,XMM2	! add packedI
24d     store_vector [R8 + #64 + RSI << #2],XMM1
	
254     addl    R13, #16	# int
258     cmpl    R13, RDX
        nop 	# 5 bytes pad for loops and calls
260     jl,s   B32	# loop end  P=1.000000 C=15360.000000

262     B33: #	out( B29 ) <- in( B32 )  Freq: 476827
262     jmp     B29

267     B34: #	out( B37 B35 ) <- in( B29 )  Freq: 0.999978
267     movl    R11, RBP	# spill
26a     addl    R11, #-3	# int
26e     cmpl    RBP, R11
271     cmovll R11, RAX	# signed, int
275     cmpl    R13, R11
278     jge,s   B37  P=0.500000 C=-1.000000

27a     B35: #	out( B36 ) <- in( B34 )  Freq: 0.499989
27a     # castII of R13
        nop 	# 2 bytes pad for loops and calls

27c     B36: #	out( B36 B37 ) <- in( B35 B36 ) Loop( B36-B36 inner post of N944) Freq: 0.999978
27c     load_vector XMM1,[R9 + #16 + R13 << #2]
283     load_vector XMM2,[RBX + #16 + R13 << #2]
28a     paddd   XMM2,XMM1	! add packedI
28e     store_vector [R8 + #16 + R13 << #2],XMM2
	
295     addl    R13, #4	# int
299     cmpl    R13, R11
29c     jl,s   B36	# loop end  P=0.500000 C=15360.000000

29e     B37: #	out( B38 ) <- in( B36 B34 )  Freq: 0.999978
29e     movdl   RSI, XMM0	# spill

2a2     B38: #	out( B44 B39 ) <- in( B19 B37 )  Freq: 0.999979
2a2     cmpl    R13, RDI
2a5     jge     B44  P=0.000001 C=-1.000000

2ab     B39: #	out( B40 ) <- in( B38 )  Freq: 0.999978
2ab     # castII of R13
        nop 	# 1 bytes pad for loops and calls

2ac     B40: #	out( B45 B41 ) <- in( B39 B43 ) Loop( B40-B43 inner post of N419) Freq: 246719
2ac     cmpl    R13, R14	# unsigned
2af     jnb,u   B45  P=0.000001 C=-1.000000

2b5     B41: #	out( B46 B42 ) <- in( B40 )  Freq: 246719
2b5     movl    RBP, [R9 + #16 + R13 << #2]	# int
        nop 	# 6 bytes pad for loops and calls
2c0     cmpl    R13, RSI	# unsigned
2c3     jnb,u   B46  P=0.000001 C=-1.000000

2c9     B42: #	out( B47 B43 ) <- in( B41 )  Freq: 246718
2c9     addl    RBP, [RBX + #16 + R13 << #2]	# int
2ce     cmpl    R13, RDI	# unsigned
2d1     jnb,u   B47  P=0.000001 C=-1.000000

2d7     B43: #	out( B40 B44 ) <- in( B42 )  Freq: 246718
2d7     movl    [R8 + #16 + R13 << #2], RBP	# int
2dc     incl    R13	# int
        nop 	# 1 bytes pad for loops and calls
2e0     cmpl    R13, RDI
2e3     jl,s   B40	# loop end  P=0.999999 C=15360.000000

2e5     B44: #	out( N533 ) <- in( B13 B43 B38 )  Freq: 0.249996
2e5     movl    RSI, #-187	# int
2ea     movq    RBP, R8	# spill
2ed     movq    [rsp + #0], R9	# spill
2f1     movq    [rsp + #8], RBX	# spill
2f6     movl    [rsp + #20], R13	# spill
2fb     movl    [rsp + #24], RDI	# spill
2ff     call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # App::micro_scalar @ bci:7 (line 9) L[0]=_ L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #8 L[4]=rsp + #20 STK[0]=rsp + #20 STK[1]=rsp + #24
        # OopMap {rbp=Oop [0]=Oop [8]=Oop off=772/0x304}
304     stop	# ShouldNotReachHere

318     B45: #	out( N533 ) <- in( B40 B15 )  Freq: 0.249997
318     movl    RSI, #-28	# int
31d     movq    [rsp + #8], RBX	# spill
322     movq    [rsp + #24], R8	# spill
327     movl    [rsp + #20], R13	# spill
32c     movq    [rsp + #32], R9	# spill
331     movl    [rsp + #40], R13	# spill
        nop 	# 1 bytes pad for loops and calls
337     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # App::micro_scalar @ bci:16 (line 10) L[0]=_ L[1]=rsp + #24 L[2]=rsp + #32 L[3]=rsp + #8 L[4]=rsp + #20 STK[0]=rsp + #24 STK[1]=rsp + #40 STK[2]=rsp + #32 STK[3]=rsp + #20
        # OopMap {[8]=Oop [24]=Oop [32]=Oop off=828/0x33c}
33c     stop	# ShouldNotReachHere

350     B46: #	out( N533 ) <- in( B41 B16 )  Freq: 0.249997
350     movl    RSI, #-28	# int
355     movq    [rsp + #8], R9	# spill
35a     movq    [rsp + #32], R8	# spill
35f     movl    [rsp + #28], R13	# spill
364     movq    [rsp + #40], RBX	# spill
369     movl    [rsp + #48], R13	# spill
        nop 	# 1 bytes pad for loops and calls
36f     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # App::micro_scalar @ bci:20 (line 10) L[0]=_ L[1]=rsp + #32 L[2]=rsp + #8 L[3]=rsp + #40 L[4]=rsp + #28 STK[0]=rsp + #32 STK[1]=rsp + #48 STK[2]=RBP STK[3]=rsp + #40 STK[4]=rsp + #28
        # OopMap {[8]=Oop [32]=Oop [40]=Oop off=884/0x374}
374     stop	# ShouldNotReachHere

388     B47: #	out( N533 ) <- in( B42 B17 )  Freq: 0.249996
388     movl    RSI, #-28	# int
38d     movq    [rsp + #8], R9	# spill
392     movq    [rsp + #16], RBX	# spill
397     movq    [rsp + #32], R8	# spill
39c     movl    [rsp + #28], R13	# spill
        nop 	# 2 bytes pad for loops and calls
3a3     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # App::micro_scalar @ bci:22 (line 10) L[0]=_ L[1]=rsp + #32 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=rsp + #28 STK[0]=rsp + #32 STK[1]=rsp + #28 STK[2]=RBP
        # OopMap {[8]=Oop [16]=Oop [32]=Oop off=936/0x3a8}
3a8     stop	# ShouldNotReachHere

3bc     B48: #	out( B4 ) <- in( B1 )  Freq: 0.000999987
3bc     xorl    R8, R8	# ptr
        nop 	# 1 bytes pad for loops and calls
3c0     jmp     B4

3c5     B49: #	out( B7 ) <- in( B4 )  Freq: 0.000999986
3c5     xorl    R9, R9	# ptr
3c8     jmp     B7

3cd     B50: #	out( B10 ) <- in( B7 )  Freq: 0.000999985
3cd     xorl    RBX, RBX	# ptr
3cf     jmp     B10

3d4     B51: #	out( N533 ) <- in( B20 )  Freq: 1.01327e-06
3d4     stop	# ShouldNotReachHere

3e8     B52: #	out( N533 ) <- in( B21 )  Freq: 1.01326e-06
3e8     stop	# ShouldNotReachHere

3fc     B53: #	out( N533 ) <- in( B22 )  Freq: 1.01326e-06
3fc     stop	# ShouldNotReachHere

410     B54: #	out( N533 ) <- in( B23 )  Freq: 1.01326e-06
410     stop	# ShouldNotReachHere

424     B55: #	out( N533 ) <- in( B24 )  Freq: 1.01326e-06
424     stop	# ShouldNotReachHere

438     B56: #	out( N533 ) <- in( B25 )  Freq: 1.01326e-06
438     stop	# ShouldNotReachHere

44c     B57: #	out( N533 ) <- in( B26 )  Freq: 1.01326e-06
44c     stop	# ShouldNotReachHere

460     B58: #	out( N533 ) <- in( B27 )  Freq: 1.01326e-06
460     stop	# ShouldNotReachHere

474     B59: #	out( N533 ) <- in( B2 B5 B8 )  Freq: 2.997e-06
474     movl    RSI, #-115	# int
479     movq    [rsp + #0], RBX	# spill
47d     movl    [rsp + #8], R13	# spill
482     movq    [rsp + #16], R14	# spill
487     call,static  wrapper for: uncommon_trap(reason='constraint' action='reinterpret' debug_id='0')
        # App::micro_scalar @ bci:3 (line 9) L[0]=_ L[1]=rsp + #16 L[2]=RBP L[3]=rsp + #0 L[4]=rsp + #8
        # OopMap {rbp=Oop [0]=Oop [16]=Oop off=1164/0x48c}
48c     stop	# ShouldNotReachHere

4a0     B60: #	out( N533 ) <- in( B12 B10 B11 )  Freq: 3.03982e-06
4a0     movl    RSI, #-138	# int
4a5     movq    RBP, R8	# spill
4a8     movq    [rsp + #0], R9	# spill
4ac     movq    [rsp + #8], RBX	# spill
4b1     movl    [rsp + #16], R13	# spill
        nop 	# 1 bytes pad for loops and calls
4b7     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_scalar @ bci:3 (line 9) L[0]=_ L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #8 L[4]=rsp + #16
        # OopMap {rbp=Oop [0]=Oop [8]=Oop off=1212/0x4bc}
4bc     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    1449   99 %           App::micro_scalar @ 3 (30 bytes)
 total in heap  [0x00007f29ad143890,0x00007f29ad144348] = 2744
 relocation     [0x00007f29ad143a08,0x00007f29ad143ad8] = 208
 main code      [0x00007f29ad143ae0,0x00007f29ad143fc0] = 1248
 stub code      [0x00007f29ad143fc0,0x00007f29ad143fd8] = 24
 oops           [0x00007f29ad143fd8,0x00007f29ad143fe0] = 8
 metadata       [0x00007f29ad143fe0,0x00007f29ad143ff0] = 16
 scopes data    [0x00007f29ad143ff0,0x00007f29ad1440e0] = 240
 scopes pcs     [0x00007f29ad1440e0,0x00007f29ad144320] = 576
 dependencies   [0x00007f29ad144320,0x00007f29ad144328] = 8
 nul chk table  [0x00007f29ad144328,0x00007f29ad144348] = 32

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007f294f8116e8} 'micro_scalar' '([I[I[I)V' in 'App'
 ;; N533: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f29ad143ae0:   callq  0x00007f29b69c2baa           ;   {runtime_call os::breakpoint()}
  0x00007f29ad143ae5:   nop
  0x00007f29ad143ae6:   nop
  0x00007f29ad143ae7:   nop
  0x00007f29ad143ae8:   nop
  0x00007f29ad143ae9:   nop
  0x00007f29ad143aea:   nop
  0x00007f29ad143aeb:   nop
  0x00007f29ad143aec:   nop
  0x00007f29ad143aed:   nop
  0x00007f29ad143aee:   nop
  0x00007f29ad143aef:   nop
 ;; B1: #	out( B48 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f29ad143af0:   mov    %eax,-0x16000(%rsp)
  0x00007f29ad143af7:   push   %rbp
  0x00007f29ad143af8:   sub    $0x50,%rsp
  0x00007f29ad143afc:   mov    0x18(%rsi),%r14
  0x00007f29ad143b00:   mov    0x10(%rsi),%rbp
  0x00007f29ad143b04:   mov    (%rsi),%r13d
  0x00007f29ad143b07:   mov    0x8(%rsi),%rbx
  0x00007f29ad143b0b:   mov    %rsi,%rdi
  0x00007f29ad143b0e:   movabs $0x7f29b6abf410,%r10
  0x00007f29ad143b18:   callq  *%r10
  0x00007f29ad143b1b:   nop
  0x00007f29ad143b1c:   nop
  0x00007f29ad143b1d:   nop
  0x00007f29ad143b1e:   nop
  0x00007f29ad143b1f:   nop
  0x00007f29ad143b20:   test   %r14,%r14
  0x00007f29ad143b23:   je     0x00007f29ad143e9c
 ;; B2: #	out( B59 B3 ) <- in( B1 )  Freq: 0.999
  0x00007f29ad143b29:   mov    0x8(%r14),%r10d
  0x00007f29ad143b2d:   cmp    $0x40c30,%r10d               ;   {metadata({type array int})}
  0x00007f29ad143b34:   jne    0x00007f29ad143f54
 ;; B3: #	out( B4 ) <- in( B2 )  Freq: 0.998999
  0x00007f29ad143b3a:   mov    %r14,%r8
 ;; B4: #	out( B49 B5 ) <- in( B3 B48 )  Freq: 0.999999
  0x00007f29ad143b3d:   nop
  0x00007f29ad143b3e:   nop
  0x00007f29ad143b3f:   nop
  0x00007f29ad143b40:   test   %rbp,%rbp
  0x00007f29ad143b43:   je     0x00007f29ad143ea5
 ;; B5: #	out( B59 B6 ) <- in( B4 )  Freq: 0.998999
  0x00007f29ad143b49:   mov    0x8(%rbp),%r11d
  0x00007f29ad143b4d:   cmp    $0x40c30,%r11d               ;   {metadata({type array int})}
  0x00007f29ad143b54:   jne    0x00007f29ad143f54
 ;; B6: #	out( B7 ) <- in( B5 )  Freq: 0.998998
  0x00007f29ad143b5a:   mov    %rbp,%r9
 ;; B7: #	out( B50 B8 ) <- in( B6 B49 )  Freq: 0.999998
  0x00007f29ad143b5d:   nop
  0x00007f29ad143b5e:   nop
  0x00007f29ad143b5f:   nop
  0x00007f29ad143b60:   test   %rbx,%rbx
  0x00007f29ad143b63:   je     0x00007f29ad143ead
 ;; B8: #	out( B59 B9 ) <- in( B7 )  Freq: 0.998998
  0x00007f29ad143b69:   mov    0x8(%rbx),%r10d
  0x00007f29ad143b6d:   cmp    $0x40c30,%r10d               ;   {metadata({type array int})}
  0x00007f29ad143b74:   jne    0x00007f29ad143f54           ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
 ;; B9: #	out( B10 ) <- in( B8 )  Freq: 0.998997
 ;; B10: #	out( B60 B11 ) <- in( B9 B50 )  Freq: 0.999997
  0x00007f29ad143b7a:   nop
  0x00007f29ad143b7b:   nop
  0x00007f29ad143b7c:   nop
  0x00007f29ad143b7d:   nop
  0x00007f29ad143b7e:   nop
  0x00007f29ad143b7f:   nop
  0x00007f29ad143b80:   mov    0xc(%r8),%edi                ; implicit exception: dispatches to 0x00007f29ad143f80
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@6 (line 9)
 ;; B11: #	out( B60 B12 ) <- in( B10 )  Freq: 0.999996
  0x00007f29ad143b84:   mov    0xc(%r9),%r14d               ; implicit exception: dispatches to 0x00007f29ad143f80
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
 ;; B12: #	out( B60 B13 ) <- in( B11 )  Freq: 0.999995
  0x00007f29ad143b88:   mov    0xc(%rbx),%esi               ; implicit exception: dispatches to 0x00007f29ad143f80
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
 ;; B13: #	out( B44 B14 ) <- in( B12 )  Freq: 0.999994
  0x00007f29ad143b8b:   cmp    %edi,%r13d
  0x00007f29ad143b8e:   jge    0x00007f29ad143dc5           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B14: #	out( B15 ) <- in( B13 )  Freq: 0.999993
  0x00007f29ad143b94:   mov    %r8d,%ecx
  0x00007f29ad143b97:   mov    %r13d,%r11d
  0x00007f29ad143b9a:   inc    %r11d
  0x00007f29ad143b9d:   shr    $0x2,%ecx
  0x00007f29ad143ba0:   and    $0x3,%ecx
  0x00007f29ad143ba3:   xor    %r10d,%r10d
  0x00007f29ad143ba6:   cmp    %r10d,%r11d
  0x00007f29ad143ba9:   cmovl  %r10d,%r11d
  0x00007f29ad143bad:   cmp    %r10d,%r11d
  0x00007f29ad143bb0:   cmovl  %r10d,%r11d
  0x00007f29ad143bb4:   cmp    %edi,%r11d
  0x00007f29ad143bb7:   cmovg  %edi,%r11d
  0x00007f29ad143bbb:   add    %r11d,%ecx
  0x00007f29ad143bbe:   neg    %ecx
  0x00007f29ad143bc0:   and    $0x3,%ecx
  0x00007f29ad143bc3:   add    %r11d,%ecx
  0x00007f29ad143bc6:   cmp    %edi,%ecx
  0x00007f29ad143bc8:   cmovg  %edi,%ecx                    ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
 ;; B15: #	out( B45 B16 ) <- in( B14 B18 ) Loop( B15-B18 inner pre of N419) Freq: 1.99998
  0x00007f29ad143bcb:   cmp    %r14d,%r13d
  0x00007f29ad143bce:   jae    0x00007f29ad143df8
 ;; B16: #	out( B46 B17 ) <- in( B15 )  Freq: 1.99998
  0x00007f29ad143bd4:   mov    0x10(%r9,%r13,4),%ebp        ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007f29ad143bd9:   cmp    %esi,%r13d
  0x00007f29ad143bdc:   nop
  0x00007f29ad143bdd:   nop
  0x00007f29ad143bde:   nop
  0x00007f29ad143bdf:   nop
  0x00007f29ad143be0:   jae    0x00007f29ad143e30
 ;; B17: #	out( B47 B18 ) <- in( B16 )  Freq: 1.99998
  0x00007f29ad143be6:   add    0x10(%rbx,%r13,4),%ebp       ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@21 (line 10)
  0x00007f29ad143beb:   cmp    %edi,%r13d
  0x00007f29ad143bee:   jae    0x00007f29ad143e68
 ;; B18: #	out( B15 B19 ) <- in( B17 )  Freq: 1.99997
  0x00007f29ad143bf4:   mov    %ebp,0x10(%r8,%r13,4)        ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f29ad143bf9:   inc    %r13d                        ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f29ad143bfc:   nop
  0x00007f29ad143bfd:   nop
  0x00007f29ad143bfe:   nop
  0x00007f29ad143bff:   nop
  0x00007f29ad143c00:   cmp    %ecx,%r13d
  0x00007f29ad143c03:   jl     0x00007f29ad143bcb           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B19: #	out( B38 B20 ) <- in( B18 )  Freq: 0.999987
  0x00007f29ad143c05:   cmp    %esi,%r14d
  0x00007f29ad143c08:   mov    %r14d,%ebp
  0x00007f29ad143c0b:   cmovg  %esi,%ebp
  0x00007f29ad143c0e:   cmp    %edi,%ebp
  0x00007f29ad143c10:   cmovg  %edi,%ebp
  0x00007f29ad143c13:   mov    %ebp,%r11d
  0x00007f29ad143c16:   add    $0xfffffff1,%r11d
  0x00007f29ad143c1a:   mov    $0x80000000,%eax
  0x00007f29ad143c1f:   cmp    %r11d,%ebp
  0x00007f29ad143c22:   cmovl  %eax,%r11d
  0x00007f29ad143c26:   cmp    %r11d,%r13d
  0x00007f29ad143c29:   jge    0x00007f29ad143d82
 ;; B20: #	out( B51 B21 ) <- in( B19 )  Freq: 0.999986
  0x00007f29ad143c2f:   cmp    %r14d,%r13d
  0x00007f29ad143c32:   jae    0x00007f29ad143eb4
 ;; B21: #	out( B52 B22 ) <- in( B20 )  Freq: 0.999985
  0x00007f29ad143c38:   cmp    %esi,%r13d
  0x00007f29ad143c3b:   nop
  0x00007f29ad143c3c:   nop
  0x00007f29ad143c3d:   nop
  0x00007f29ad143c3e:   nop
  0x00007f29ad143c3f:   nop
  0x00007f29ad143c40:   jae    0x00007f29ad143ec8
 ;; B22: #	out( B53 B23 ) <- in( B21 )  Freq: 0.999984
  0x00007f29ad143c46:   cmp    %edi,%r13d
  0x00007f29ad143c49:   jae    0x00007f29ad143edc
 ;; B23: #	out( B54 B24 ) <- in( B22 )  Freq: 0.999983
  0x00007f29ad143c4f:   mov    %r13d,%ecx
  0x00007f29ad143c52:   add    $0xf,%ecx
  0x00007f29ad143c55:   cmp    %edi,%ecx
  0x00007f29ad143c57:   jae    0x00007f29ad143ef0
 ;; B24: #	out( B55 B25 ) <- in( B23 )  Freq: 0.999982
  0x00007f29ad143c5d:   nop
  0x00007f29ad143c5e:   nop
  0x00007f29ad143c5f:   nop
  0x00007f29ad143c60:   cmp    %esi,%ecx
  0x00007f29ad143c62:   jae    0x00007f29ad143f04
 ;; B25: #	out( B56 B26 ) <- in( B24 )  Freq: 0.999981
  0x00007f29ad143c68:   cmp    %esi,%r13d
  0x00007f29ad143c6b:   jae    0x00007f29ad143f18
 ;; B26: #	out( B57 B27 ) <- in( B25 )  Freq: 0.99998
  0x00007f29ad143c71:   cmp    %r14d,%ecx
  0x00007f29ad143c74:   jae    0x00007f29ad143f2c
 ;; B27: #	out( B58 B28 ) <- in( B26 )  Freq: 0.999979
  0x00007f29ad143c7a:   nop
  0x00007f29ad143c7b:   nop
  0x00007f29ad143c7c:   nop
  0x00007f29ad143c7d:   nop
  0x00007f29ad143c7e:   nop
  0x00007f29ad143c7f:   nop
  0x00007f29ad143c80:   cmp    %r14d,%r13d
  0x00007f29ad143c83:   jae    0x00007f29ad143f40
 ;; B28: #	out( B31 ) <- in( B27 )  Freq: 0.999978
  0x00007f29ad143c89:   mov    $0x3e80,%ecx
  0x00007f29ad143c8e:   jmp    0x00007f29ad143caa           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
 ;; B29: #	out( B34 B30 ) <- in( B33 ) top-of-loop Freq: 999978
  0x00007f29ad143c90:   mov    0x130(%r15),%rdx             ; ImmutableOopMap {r8=Oop r9=Oop rbx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@26 (line 9)
  0x00007f29ad143c97:   test   %eax,(%rdx)                  ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
                                                            ;   {poll}
  0x00007f29ad143c99:   cmp    %r11d,%r13d
  0x00007f29ad143c9c:   nop
  0x00007f29ad143c9d:   nop
  0x00007f29ad143c9e:   nop
  0x00007f29ad143c9f:   nop
  0x00007f29ad143ca0:   jge    0x00007f29ad143d47
 ;; B30: #	out( B31 ) <- in( B29 )  Freq: 999978
  0x00007f29ad143ca6:   movd   %xmm0,%esi
 ;; B31: #	out( B32 ) <- in( B28 B30 ) Loop( B31-B30 ) Freq: 999978
  0x00007f29ad143caa:   mov    %r11d,%edx
  0x00007f29ad143cad:   sub    %r13d,%edx
  0x00007f29ad143cb0:   cmp    %r13d,%r11d
  0x00007f29ad143cb3:   cmovl  %r10d,%edx
  0x00007f29ad143cb7:   cmp    $0x3e80,%edx
  0x00007f29ad143cbd:   cmova  %ecx,%edx
  0x00007f29ad143cc0:   add    %r13d,%edx
  0x00007f29ad143cc3:   movd   %esi,%xmm0
  0x00007f29ad143cc7:   nop
  0x00007f29ad143cc8:   nop
  0x00007f29ad143cc9:   nop
  0x00007f29ad143cca:   nop
  0x00007f29ad143ccb:   nop
  0x00007f29ad143ccc:   nop
  0x00007f29ad143ccd:   nop
  0x00007f29ad143cce:   nop
  0x00007f29ad143ccf:   nop
 ;; B32: #	out( B32 B33 ) <- in( B31 B32 ) Loop( B32-B32 inner main of N219 strip mined) Freq: 9.99978e+11
  0x00007f29ad143cd0:   movdqu 0x10(%r9,%r13,4),%xmm1
  0x00007f29ad143cd7:   movdqu 0x10(%rbx,%r13,4),%xmm2
  0x00007f29ad143cde:   paddd  %xmm1,%xmm2
  0x00007f29ad143ce2:   movdqu %xmm2,0x10(%r8,%r13,4)
  0x00007f29ad143ce9:   movslq %r13d,%rsi
  0x00007f29ad143cec:   movdqu 0x20(%rbx,%rsi,4),%xmm1
  0x00007f29ad143cf2:   movdqu 0x20(%r9,%rsi,4),%xmm2
  0x00007f29ad143cf9:   paddd  %xmm2,%xmm1
  0x00007f29ad143cfd:   movdqu %xmm1,0x20(%r8,%rsi,4)
  0x00007f29ad143d04:   movdqu 0x30(%rbx,%rsi,4),%xmm1
  0x00007f29ad143d0a:   movdqu 0x30(%r9,%rsi,4),%xmm2
  0x00007f29ad143d11:   paddd  %xmm2,%xmm1
  0x00007f29ad143d15:   movdqu %xmm1,0x30(%r8,%rsi,4)
  0x00007f29ad143d1c:   movdqu 0x40(%rbx,%rsi,4),%xmm1
  0x00007f29ad143d22:   movdqu 0x40(%r9,%rsi,4),%xmm2
  0x00007f29ad143d29:   paddd  %xmm2,%xmm1
  0x00007f29ad143d2d:   movdqu %xmm1,0x40(%r8,%rsi,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f29ad143d34:   add    $0x10,%r13d                  ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f29ad143d38:   cmp    %edx,%r13d
  0x00007f29ad143d3b:   nop
  0x00007f29ad143d3c:   nop
  0x00007f29ad143d3d:   nop
  0x00007f29ad143d3e:   nop
  0x00007f29ad143d3f:   nop
  0x00007f29ad143d40:   jl     0x00007f29ad143cd0           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B33: #	out( B29 ) <- in( B32 )  Freq: 476827
  0x00007f29ad143d42:   jmpq   0x00007f29ad143c90
 ;; B34: #	out( B37 B35 ) <- in( B29 )  Freq: 0.999978
  0x00007f29ad143d47:   mov    %ebp,%r11d
  0x00007f29ad143d4a:   add    $0xfffffffd,%r11d
  0x00007f29ad143d4e:   cmp    %r11d,%ebp
  0x00007f29ad143d51:   cmovl  %eax,%r11d
  0x00007f29ad143d55:   cmp    %r11d,%r13d
  0x00007f29ad143d58:   jge    0x00007f29ad143d7e
 ;; B35: #	out( B36 ) <- in( B34 )  Freq: 0.499989
  0x00007f29ad143d5a:   nop
  0x00007f29ad143d5b:   nop
 ;; B36: #	out( B36 B37 ) <- in( B35 B36 ) Loop( B36-B36 inner post of N944) Freq: 0.999978
  0x00007f29ad143d5c:   movdqu 0x10(%r9,%r13,4),%xmm1
  0x00007f29ad143d63:   movdqu 0x10(%rbx,%r13,4),%xmm2
  0x00007f29ad143d6a:   paddd  %xmm1,%xmm2
  0x00007f29ad143d6e:   movdqu %xmm2,0x10(%r8,%r13,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f29ad143d75:   add    $0x4,%r13d                   ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f29ad143d79:   cmp    %r11d,%r13d
  0x00007f29ad143d7c:   jl     0x00007f29ad143d5c           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B37: #	out( B38 ) <- in( B36 B34 )  Freq: 0.999978
  0x00007f29ad143d7e:   movd   %xmm0,%esi
 ;; B38: #	out( B44 B39 ) <- in( B19 B37 )  Freq: 0.999979
  0x00007f29ad143d82:   cmp    %edi,%r13d
  0x00007f29ad143d85:   jge    0x00007f29ad143dc5
 ;; B39: #	out( B40 ) <- in( B38 )  Freq: 0.999978
  0x00007f29ad143d8b:   nop                                 ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
 ;; B40: #	out( B45 B41 ) <- in( B39 B43 ) Loop( B40-B43 inner post of N419) Freq: 246719
  0x00007f29ad143d8c:   cmp    %r14d,%r13d
  0x00007f29ad143d8f:   jae    0x00007f29ad143df8
 ;; B41: #	out( B46 B42 ) <- in( B40 )  Freq: 246719
  0x00007f29ad143d95:   mov    0x10(%r9,%r13,4),%ebp        ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007f29ad143d9a:   nop
  0x00007f29ad143d9b:   nop
  0x00007f29ad143d9c:   nop
  0x00007f29ad143d9d:   nop
  0x00007f29ad143d9e:   nop
  0x00007f29ad143d9f:   nop
  0x00007f29ad143da0:   cmp    %esi,%r13d
  0x00007f29ad143da3:   jae    0x00007f29ad143e30
 ;; B42: #	out( B47 B43 ) <- in( B41 )  Freq: 246718
  0x00007f29ad143da9:   add    0x10(%rbx,%r13,4),%ebp       ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@21 (line 10)
  0x00007f29ad143dae:   cmp    %edi,%r13d
  0x00007f29ad143db1:   jae    0x00007f29ad143e68
 ;; B43: #	out( B40 B44 ) <- in( B42 )  Freq: 246718
  0x00007f29ad143db7:   mov    %ebp,0x10(%r8,%r13,4)        ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f29ad143dbc:   inc    %r13d                        ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f29ad143dbf:   nop
  0x00007f29ad143dc0:   cmp    %edi,%r13d
  0x00007f29ad143dc3:   jl     0x00007f29ad143d8c           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B44: #	out( N533 ) <- in( B13 B43 B38 )  Freq: 0.249996
  0x00007f29ad143dc5:   mov    $0xffffff45,%esi
  0x00007f29ad143dca:   mov    %r8,%rbp
  0x00007f29ad143dcd:   mov    %r9,(%rsp)
  0x00007f29ad143dd1:   mov    %rbx,0x8(%rsp)
  0x00007f29ad143dd6:   mov    %r13d,0x14(%rsp)
  0x00007f29ad143ddb:   mov    %edi,0x18(%rsp)
  0x00007f29ad143ddf:   callq  0x00007f29ad116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@7 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f29ad143de4:   movabs $0x7f29b70847b8,%rdi         ;   {external_word}
  0x00007f29ad143dee:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad143df2:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad143df7:   hlt    
 ;; B45: #	out( N533 ) <- in( B40 B15 )  Freq: 0.249997
  0x00007f29ad143df8:   mov    $0xffffffe4,%esi
  0x00007f29ad143dfd:   mov    %rbx,0x8(%rsp)
  0x00007f29ad143e02:   mov    %r8,0x18(%rsp)
  0x00007f29ad143e07:   mov    %r13d,0x14(%rsp)
  0x00007f29ad143e0c:   mov    %r9,0x20(%rsp)
  0x00007f29ad143e11:   mov    %r13d,0x28(%rsp)
  0x00007f29ad143e16:   nop
  0x00007f29ad143e17:   callq  0x00007f29ad116540           ; ImmutableOopMap {[8]=Oop [24]=Oop [32]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f29ad143e1c:   movabs $0x7f29b70847b8,%rdi         ;   {external_word}
  0x00007f29ad143e26:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad143e2a:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad143e2f:   hlt    
 ;; B46: #	out( N533 ) <- in( B41 B16 )  Freq: 0.249997
  0x00007f29ad143e30:   mov    $0xffffffe4,%esi
  0x00007f29ad143e35:   mov    %r9,0x8(%rsp)
  0x00007f29ad143e3a:   mov    %r8,0x20(%rsp)
  0x00007f29ad143e3f:   mov    %r13d,0x1c(%rsp)
  0x00007f29ad143e44:   mov    %rbx,0x28(%rsp)
  0x00007f29ad143e49:   mov    %r13d,0x30(%rsp)
  0x00007f29ad143e4e:   nop
  0x00007f29ad143e4f:   callq  0x00007f29ad116540           ; ImmutableOopMap {[8]=Oop [32]=Oop [40]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f29ad143e54:   movabs $0x7f29b70847b8,%rdi         ;   {external_word}
  0x00007f29ad143e5e:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad143e62:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad143e67:   hlt    
 ;; B47: #	out( N533 ) <- in( B42 B17 )  Freq: 0.249996
  0x00007f29ad143e68:   mov    $0xffffffe4,%esi
  0x00007f29ad143e6d:   mov    %r9,0x8(%rsp)
  0x00007f29ad143e72:   mov    %rbx,0x10(%rsp)
  0x00007f29ad143e77:   mov    %r8,0x20(%rsp)
  0x00007f29ad143e7c:   mov    %r13d,0x1c(%rsp)
  0x00007f29ad143e81:   nop
  0x00007f29ad143e82:   nop
  0x00007f29ad143e83:   callq  0x00007f29ad116540           ; ImmutableOopMap {[8]=Oop [16]=Oop [32]=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f29ad143e88:   movabs $0x7f29b70847b8,%rdi         ;   {external_word}
  0x00007f29ad143e92:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad143e96:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad143e9b:   hlt                                 ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
 ;; B48: #	out( B4 ) <- in( B1 )  Freq: 0.000999987
  0x00007f29ad143e9c:   xor    %r8d,%r8d
  0x00007f29ad143e9f:   nop
  0x00007f29ad143ea0:   jmpq   0x00007f29ad143b3d
 ;; B49: #	out( B7 ) <- in( B4 )  Freq: 0.000999986
  0x00007f29ad143ea5:   xor    %r9d,%r9d
  0x00007f29ad143ea8:   jmpq   0x00007f29ad143b5d
 ;; B50: #	out( B10 ) <- in( B7 )  Freq: 0.000999985
  0x00007f29ad143ead:   xor    %ebx,%ebx
  0x00007f29ad143eaf:   jmpq   0x00007f29ad143b7a
 ;; B51: #	out( N533 ) <- in( B20 )  Freq: 1.01327e-06
  0x00007f29ad143eb4:   movabs $0x7f29b721c968,%rdi         ;   {external_word}
  0x00007f29ad143ebe:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad143ec2:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad143ec7:   hlt    
 ;; B52: #	out( N533 ) <- in( B21 )  Freq: 1.01326e-06
  0x00007f29ad143ec8:   movabs $0x7f29b721c968,%rdi         ;   {external_word}
  0x00007f29ad143ed2:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad143ed6:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad143edb:   hlt    
 ;; B53: #	out( N533 ) <- in( B22 )  Freq: 1.01326e-06
  0x00007f29ad143edc:   movabs $0x7f29b721c968,%rdi         ;   {external_word}
  0x00007f29ad143ee6:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad143eea:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad143eef:   hlt    
 ;; B54: #	out( N533 ) <- in( B23 )  Freq: 1.01326e-06
  0x00007f29ad143ef0:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad143efa:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad143efe:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad143f03:   hlt    
 ;; B55: #	out( N533 ) <- in( B24 )  Freq: 1.01326e-06
  0x00007f29ad143f04:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad143f0e:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad143f12:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad143f17:   hlt    
 ;; B56: #	out( N533 ) <- in( B25 )  Freq: 1.01326e-06
  0x00007f29ad143f18:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad143f22:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad143f26:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad143f2b:   hlt    
 ;; B57: #	out( N533 ) <- in( B26 )  Freq: 1.01326e-06
  0x00007f29ad143f2c:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad143f36:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad143f3a:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad143f3f:   hlt    
 ;; B58: #	out( N533 ) <- in( B27 )  Freq: 1.01326e-06
  0x00007f29ad143f40:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad143f4a:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad143f4e:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad143f53:   hlt    
 ;; B59: #	out( N533 ) <- in( B2 B5 B8 )  Freq: 2.997e-06
  0x00007f29ad143f54:   mov    $0xffffff8d,%esi
  0x00007f29ad143f59:   mov    %rbx,(%rsp)
  0x00007f29ad143f5d:   mov    %r13d,0x8(%rsp)
  0x00007f29ad143f62:   mov    %r14,0x10(%rsp)
  0x00007f29ad143f67:   callq  0x00007f29ad116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f29ad143f6c:   movabs $0x7f29b70847b8,%rdi         ;   {external_word}
  0x00007f29ad143f76:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad143f7a:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad143f7f:   hlt    
 ;; B60: #	out( N533 ) <- in( B12 B10 B11 )  Freq: 3.03982e-06
  0x00007f29ad143f80:   mov    $0xffffff76,%esi
  0x00007f29ad143f85:   mov    %r8,%rbp
  0x00007f29ad143f88:   mov    %r9,(%rsp)
  0x00007f29ad143f8c:   mov    %rbx,0x8(%rsp)
  0x00007f29ad143f91:   mov    %r13d,0x10(%rsp)
  0x00007f29ad143f96:   nop
  0x00007f29ad143f97:   callq  0x00007f29ad116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f29ad143f9c:   movabs $0x7f29b70847b8,%rdi         ;   {external_word}
  0x00007f29ad143fa6:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad143faa:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad143faf:   hlt                                 ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
  0x00007f29ad143fb0:   hlt    
  0x00007f29ad143fb1:   hlt    
  0x00007f29ad143fb2:   hlt    
  0x00007f29ad143fb3:   hlt    
  0x00007f29ad143fb4:   hlt    
  0x00007f29ad143fb5:   hlt    
  0x00007f29ad143fb6:   hlt    
  0x00007f29ad143fb7:   hlt    
  0x00007f29ad143fb8:   hlt    
  0x00007f29ad143fb9:   hlt    
  0x00007f29ad143fba:   hlt    
  0x00007f29ad143fbb:   hlt    
  0x00007f29ad143fbc:   hlt    
  0x00007f29ad143fbd:   hlt    
  0x00007f29ad143fbe:   hlt    
  0x00007f29ad143fbf:   hlt    
[Exception Handler]
  0x00007f29ad143fc0:   jmpq   0x00007f29ad05c9a0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f29ad143fc5:   callq  0x00007f29ad143fca
  0x00007f29ad143fca:   subq   $0x5,(%rsp)
  0x00007f29ad143fcf:   jmpq   0x00007f29ad116a60           ;   {runtime_call DeoptimizationBlob}
  0x00007f29ad143fd4:   hlt    
  0x00007f29ad143fd5:   hlt    
  0x00007f29ad143fd6:   hlt    
  0x00007f29ad143fd7:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007f29ad143fd8:   0x000000010110de48 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de48}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007f29ad143fe0:   0x0000000800040c30 {type array int}
  0x00007f29ad143fe8:   0x00007f294f8116e8 {method} {0x00007f294f8116e8} 'micro_scalar' '([I[I[I)V' in 'App'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007f29ad143adf offset=ffffffff bits=0):
PcDesc(pc=0x00007f29ad143b7a offset=9a bits=0):   App::micro_scalar@3 (line 9)
PcDesc(pc=0x00007f29ad143b84 offset=a4 bits=0):   App::micro_scalar@6 (line 9)
PcDesc(pc=0x00007f29ad143b88 offset=a8 bits=0):   App::micro_scalar@16 (line 10)
PcDesc(pc=0x00007f29ad143b8b offset=ab bits=0):   App::micro_scalar@20 (line 10)
PcDesc(pc=0x00007f29ad143b94 offset=b4 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007f29ad143bcb offset=eb bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad143bd9 offset=f9 bits=0):   App::micro_scalar@16 (line 10)
PcDesc(pc=0x00007f29ad143beb offset=10b bits=0):   App::micro_scalar@21 (line 10)
PcDesc(pc=0x00007f29ad143bf9 offset=119 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad143bfc offset=11c bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007f29ad143c05 offset=125 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007f29ad143c90 offset=1b0 bits=0):   App::micro_scalar@26 (line 9)
PcDesc(pc=0x00007f29ad143c97 offset=1b7 bits=1):   App::micro_scalar@26 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg r8 [16],oop
    - l2: reg r9 [18],oop
    - l3: reg rbx [6],oop
    - l4: reg r13 [26],int
PcDesc(pc=0x00007f29ad143c99 offset=1b9 bits=0):   App::micro_scalar@26 (line 9)
PcDesc(pc=0x00007f29ad143d34 offset=254 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad143d38 offset=258 bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007f29ad143d42 offset=262 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007f29ad143d75 offset=295 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad143d79 offset=299 bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007f29ad143d7e offset=29e bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007f29ad143d8c offset=2ac bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad143d9a offset=2ba bits=0):   App::micro_scalar@16 (line 10)
PcDesc(pc=0x00007f29ad143dae offset=2ce bits=0):   App::micro_scalar@21 (line 10)
PcDesc(pc=0x00007f29ad143dbc offset=2dc bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad143dbf offset=2df bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007f29ad143dc5 offset=2e5 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007f29ad143de4 offset=304 bits=1):   App::micro_scalar@7 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[20]
   Expression stack
    - @0: stack[20]
    - @1: stack[24]
PcDesc(pc=0x00007f29ad143e1c offset=33c bits=0):   App::micro_scalar@16 (line 10)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: stack[32],oop
    - l3: stack[8],oop
    - l4: stack[20]
   Expression stack
    - @0: stack[24],oop
    - @1: stack[40]
    - @2: stack[32],oop
    - @3: stack[20]
PcDesc(pc=0x00007f29ad143e54 offset=374 bits=0):   App::micro_scalar@20 (line 10)
   Locals
    - l0: empty
    - l1: stack[32],oop
    - l2: stack[8],oop
    - l3: stack[40],oop
    - l4: stack[28]
   Expression stack
    - @0: stack[32],oop
    - @1: stack[48]
    - @2: reg rbp [10],int
    - @3: stack[40],oop
    - @4: stack[28]
PcDesc(pc=0x00007f29ad143e88 offset=3a8 bits=0):   App::micro_scalar@22 (line 10)
   Locals
    - l0: empty
    - l1: stack[32],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: stack[28]
   Expression stack
    - @0: stack[32],oop
    - @1: stack[28]
    - @2: reg rbp [10],int
PcDesc(pc=0x00007f29ad143e9c offset=3bc bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad143f6c offset=48c bits=0):   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: stack[16],oop
    - l2: reg rbp [10],oop
    - l3: stack[0],oop
    - l4: stack[8]
PcDesc(pc=0x00007f29ad143f9c offset=4bc bits=0):   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[16]
PcDesc(pc=0x00007f29ad143fb0 offset=4d0 bits=0):   App::micro_scalar@3 (line 9)
PcDesc(pc=0x00007f29ad143fd9 offset=4f9 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 7 OopMaps

ImmutableOopMap {r8=Oop r9=Oop rbx=Oop } pc offsets: 439 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop } pc offsets: 772 
ImmutableOopMap {[8]=Oop [24]=Oop [32]=Oop } pc offsets: 828 
ImmutableOopMap {[8]=Oop [32]=Oop [40]=Oop } pc offsets: 884 
ImmutableOopMap {[8]=Oop [16]=Oop [32]=Oop } pc offsets: 936 
ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop } pc offsets: 1164 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop } pc offsets: 1212 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007f29ad143b7a offset=9a):
   App::micro_scalar@3 (line 9)
ScopeDesc(pc=0x00007f29ad143b84 offset=a4):
   App::micro_scalar@6 (line 9)
ScopeDesc(pc=0x00007f29ad143b88 offset=a8):
   App::micro_scalar@16 (line 10)
ScopeDesc(pc=0x00007f29ad143b8b offset=ab):
   App::micro_scalar@20 (line 10)
ScopeDesc(pc=0x00007f29ad143b94 offset=b4):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007f29ad143bcb offset=eb):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad143bd9 offset=f9):
   App::micro_scalar@16 (line 10)
ScopeDesc(pc=0x00007f29ad143beb offset=10b):
   App::micro_scalar@21 (line 10)
ScopeDesc(pc=0x00007f29ad143bf9 offset=119):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad143bfc offset=11c):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007f29ad143c05 offset=125):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007f29ad143c90 offset=1b0):
   App::micro_scalar@26 (line 9)
ScopeDesc(pc=0x00007f29ad143c97 offset=1b7):
   App::micro_scalar@26 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg r8 [16],oop
    - l2: reg r9 [18],oop
    - l3: reg rbx [6],oop
    - l4: reg r13 [26],int
ScopeDesc(pc=0x00007f29ad143c99 offset=1b9):
   App::micro_scalar@26 (line 9)
ScopeDesc(pc=0x00007f29ad143d34 offset=254):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad143d38 offset=258):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007f29ad143d42 offset=262):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007f29ad143d75 offset=295):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad143d79 offset=299):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007f29ad143d7e offset=29e):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007f29ad143d8c offset=2ac):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad143d9a offset=2ba):
   App::micro_scalar@16 (line 10)
ScopeDesc(pc=0x00007f29ad143dae offset=2ce):
   App::micro_scalar@21 (line 10)
ScopeDesc(pc=0x00007f29ad143dbc offset=2dc):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad143dbf offset=2df):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007f29ad143dc5 offset=2e5):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007f29ad143de4 offset=304):
   App::micro_scalar@7 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[20]
   Expression stack
    - @0: stack[20]
    - @1: stack[24]
ScopeDesc(pc=0x00007f29ad143e1c offset=33c):
   App::micro_scalar@16 (line 10)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: stack[32],oop
    - l3: stack[8],oop
    - l4: stack[20]
   Expression stack
    - @0: stack[24],oop
    - @1: stack[40]
    - @2: stack[32],oop
    - @3: stack[20]
ScopeDesc(pc=0x00007f29ad143e54 offset=374):
   App::micro_scalar@20 (line 10)
   Locals
    - l0: empty
    - l1: stack[32],oop
    - l2: stack[8],oop
    - l3: stack[40],oop
    - l4: stack[28]
   Expression stack
    - @0: stack[32],oop
    - @1: stack[48]
    - @2: reg rbp [10],int
    - @3: stack[40],oop
    - @4: stack[28]
ScopeDesc(pc=0x00007f29ad143e88 offset=3a8):
   App::micro_scalar@22 (line 10)
   Locals
    - l0: empty
    - l1: stack[32],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: stack[28]
   Expression stack
    - @0: stack[32],oop
    - @1: stack[28]
    - @2: reg rbp [10],int
ScopeDesc(pc=0x00007f29ad143e9c offset=3bc):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad143f6c offset=48c):
   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: stack[16],oop
    - l2: reg rbp [10],oop
    - l3: stack[0],oop
    - l4: stack[8]
ScopeDesc(pc=0x00007f29ad143f9c offset=4bc):
   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[16]
ScopeDesc(pc=0x00007f29ad143fb0 offset=4d0):
   App::micro_scalar@3 (line 9)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007f29ad143a08: 6400
relocInfo@0x00007f29ad143a08 [type=6(runtime_call) addr=0x00007f29ad143ae0 offset=0 format=1] | [destination=0x00007f29b69c2baa]
         @0x00007f29ad143a0a: f001cc4d
relocInfo@0x00007f29ad143a0c [type=12(metadata) addr=0x00007f29ad143b2d offset=77 format=3 data=1] | [metadata_addr=0x00007f29ad143fe0 *=0x0000000800040c30 offset=0]metadata_value=0x0000000800040c30: {type array int}
         @0x00007f29ad143a0e: f001cc20
relocInfo@0x00007f29ad143a10 [type=12(metadata) addr=0x00007f29ad143b4d offset=32 format=3 data=1] | [metadata_addr=0x00007f29ad143fe0 *=0x0000000800040c30 offset=0]metadata_value=0x0000000800040c30: {type array int}
         @0x00007f29ad143a12: f001cc20
relocInfo@0x00007f29ad143a14 [type=12(metadata) addr=0x00007f29ad143b6d offset=32 format=3 data=1] | [metadata_addr=0x00007f29ad143fe0 *=0x0000000800040c30 offset=0]metadata_value=0x0000000800040c30: {type array int}
         @0x00007f29ad143a16: a12a
relocInfo@0x00007f29ad143a16 [type=10(poll) addr=0x00007f29ad143c97 offset=298]
         @0x00007f29ad143a18: 6548
relocInfo@0x00007f29ad143a18 [type=6(runtime_call) addr=0x00007f29ad143ddf offset=328 format=1] | [destination=0x00007f29ad116540]
         @0x00007f29ad143a1a: f803b70847b87f297005
relocInfo@0x00007f29ad143a22 [type=7(external_word) addr=0x00007f29ad143de4 offset=5 data={b70847b87f29}] | [target=0x00007f29b70847b8]
         @0x00007f29ad143a24: 640e
relocInfo@0x00007f29ad143a24 [type=6(runtime_call) addr=0x00007f29ad143df2 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad143a26: 6425
relocInfo@0x00007f29ad143a26 [type=6(runtime_call) addr=0x00007f29ad143e17 offset=37 format=1] | [destination=0x00007f29ad116540]
         @0x00007f29ad143a28: f803b70847b87f297005
relocInfo@0x00007f29ad143a30 [type=7(external_word) addr=0x00007f29ad143e1c offset=5 data={b70847b87f29}] | [target=0x00007f29b70847b8]
         @0x00007f29ad143a32: 640e
relocInfo@0x00007f29ad143a32 [type=6(runtime_call) addr=0x00007f29ad143e2a offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad143a34: 6425
relocInfo@0x00007f29ad143a34 [type=6(runtime_call) addr=0x00007f29ad143e4f offset=37 format=1] | [destination=0x00007f29ad116540]
         @0x00007f29ad143a36: f803b70847b87f297005
relocInfo@0x00007f29ad143a3e [type=7(external_word) addr=0x00007f29ad143e54 offset=5 data={b70847b87f29}] | [target=0x00007f29b70847b8]
         @0x00007f29ad143a40: 640e
relocInfo@0x00007f29ad143a40 [type=6(runtime_call) addr=0x00007f29ad143e62 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad143a42: 6421
relocInfo@0x00007f29ad143a42 [type=6(runtime_call) addr=0x00007f29ad143e83 offset=33 format=1] | [destination=0x00007f29ad116540]
         @0x00007f29ad143a44: f803b70847b87f297005
relocInfo@0x00007f29ad143a4c [type=7(external_word) addr=0x00007f29ad143e88 offset=5 data={b70847b87f29}] | [target=0x00007f29b70847b8]
         @0x00007f29ad143a4e: 640e
relocInfo@0x00007f29ad143a4e [type=6(runtime_call) addr=0x00007f29ad143e96 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad143a50: f803b721c9687f29701e
relocInfo@0x00007f29ad143a58 [type=7(external_word) addr=0x00007f29ad143eb4 offset=30 data={b721c9687f29}] | [target=0x00007f29b721c968]
         @0x00007f29ad143a5a: 640e
relocInfo@0x00007f29ad143a5a [type=6(runtime_call) addr=0x00007f29ad143ec2 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad143a5c: f803b721c9687f297006
relocInfo@0x00007f29ad143a64 [type=7(external_word) addr=0x00007f29ad143ec8 offset=6 data={b721c9687f29}] | [target=0x00007f29b721c968]
         @0x00007f29ad143a66: 640e
relocInfo@0x00007f29ad143a66 [type=6(runtime_call) addr=0x00007f29ad143ed6 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad143a68: f803b721c9687f297006
relocInfo@0x00007f29ad143a70 [type=7(external_word) addr=0x00007f29ad143edc offset=6 data={b721c9687f29}] | [target=0x00007f29b721c968]
         @0x00007f29ad143a72: 640e
relocInfo@0x00007f29ad143a72 [type=6(runtime_call) addr=0x00007f29ad143eea offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad143a74: f803b721c0787f297006
relocInfo@0x00007f29ad143a7c [type=7(external_word) addr=0x00007f29ad143ef0 offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad143a7e: 640e
relocInfo@0x00007f29ad143a7e [type=6(runtime_call) addr=0x00007f29ad143efe offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad143a80: f803b721c0787f297006
relocInfo@0x00007f29ad143a88 [type=7(external_word) addr=0x00007f29ad143f04 offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad143a8a: 640e
relocInfo@0x00007f29ad143a8a [type=6(runtime_call) addr=0x00007f29ad143f12 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad143a8c: f803b721c0787f297006
relocInfo@0x00007f29ad143a94 [type=7(external_word) addr=0x00007f29ad143f18 offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad143a96: 640e
relocInfo@0x00007f29ad143a96 [type=6(runtime_call) addr=0x00007f29ad143f26 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad143a98: f803b721c0787f297006
relocInfo@0x00007f29ad143aa0 [type=7(external_word) addr=0x00007f29ad143f2c offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad143aa2: 640e
relocInfo@0x00007f29ad143aa2 [type=6(runtime_call) addr=0x00007f29ad143f3a offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad143aa4: f803b721c0787f297006
relocInfo@0x00007f29ad143aac [type=7(external_word) addr=0x00007f29ad143f40 offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad143aae: 640e
relocInfo@0x00007f29ad143aae [type=6(runtime_call) addr=0x00007f29ad143f4e offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad143ab0: 6419
relocInfo@0x00007f29ad143ab0 [type=6(runtime_call) addr=0x00007f29ad143f67 offset=25 format=1] | [destination=0x00007f29ad116540]
         @0x00007f29ad143ab2: f803b70847b87f297005
relocInfo@0x00007f29ad143aba [type=7(external_word) addr=0x00007f29ad143f6c offset=5 data={b70847b87f29}] | [target=0x00007f29b70847b8]
         @0x00007f29ad143abc: 640e
relocInfo@0x00007f29ad143abc [type=6(runtime_call) addr=0x00007f29ad143f7a offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad143abe: 641d
relocInfo@0x00007f29ad143abe [type=6(runtime_call) addr=0x00007f29ad143f97 offset=29 format=1] | [destination=0x00007f29ad116540]
         @0x00007f29ad143ac0: f803b70847b87f297005
relocInfo@0x00007f29ad143ac8 [type=7(external_word) addr=0x00007f29ad143f9c offset=5 data={b70847b87f29}] | [target=0x00007f29b70847b8]
         @0x00007f29ad143aca: 640e
relocInfo@0x00007f29ad143aca [type=6(runtime_call) addr=0x00007f29ad143faa offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad143acc: 0016
relocInfo@0x00007f29ad143acc [type=0(none) addr=0x00007f29ad143fc0 offset=22]
         @0x00007f29ad143ace: 6400
relocInfo@0x00007f29ad143ace [type=6(runtime_call) addr=0x00007f29ad143fc0 offset=0 format=1] | [destination=0x00007f29ad05c9a0]
         @0x00007f29ad143ad0: 640f
relocInfo@0x00007f29ad143ad0 [type=6(runtime_call) addr=0x00007f29ad143fcf offset=15 format=1] | [destination=0x00007f29ad116a60]
         @0x00007f29ad143ad2: 0000
relocInfo@0x00007f29ad143ad2 [type=0(none) addr=0x00007f29ad143fcf offset=0]
         @0x00007f29ad143ad4: 0000
relocInfo@0x00007f29ad143ad4 [type=0(none) addr=0x00007f29ad143fcf offset=0]
         @0x00007f29ad143ad6: 0000
relocInfo@0x00007f29ad143ad6 [type=0(none) addr=0x00007f29ad143fcf offset=0]
         @0x00007f29ad143ad8: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 3 entries, 28 bytes):
{
   < 0x00007f29ad143b80, 0x00007f29ad143f80 > < 0x00007f29ad143b84, 0x00007f29ad143f80 > < 0x00007f29ad143b88, 0x00007f29ad143f80 > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x000000010110de48 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de48}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
#0: 0x0000000000000000 NULL-oop
#1: 0x0000000800040c30 {type array int}
#2: 0x00007f294f8116e8 {method} {0x00007f294f8116e8} 'micro_scalar' '([I[I[I)V' in 'App'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 100 ------------------------
{method}
 - this oop:          0x00007f294f8116e8
 - method holder:     'App'
 - constants:         0x00007f294f811090 constant pool [134]/operands[15] {0x00007f294f811090} for 'App' cache=0x00007f294fb00000
 - access:            0xc1000001  public 
 - name:              'micro_scalar'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        5
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007f29ad00e160
 - adapters:          AHE@0x00007f29b03b4280: 0xbbbb0000 i2c: 0x00007f29ad07f960 c2i: 0x00007f29ad07fa4c c2iUV: 0x00007f29ad07fa16 c2iNCI: 0x00007f29ad07fa89
 - compiled entry     0x00007f29ad07fa4c
 - code size:         30
 - code start:        0x00007f294f8116c0
 - code end (excl):   0x00007f294f8116de
 - method data:       0x00007f294f811db0
 - checked ex length: 0
 - linenumber start:  0x00007f294f8116de
 - localvar length:   0

------------------------ OptoAssembly for Compile_id = 100 -----------------------
#
#  void ( rawptr:BotPTR )
#
#r018 rsi:rsi   : parm 0: rawptr:BotPTR
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
000     N538: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
000     # breakpoint
        nop 	# 11 bytes pad for loops and calls

010     B1: #	out( B44 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
010     # stack bang (176 bytes)
	pushq   rbp	# Save rbp
	subq    rsp, #80	# Create frame

01c     movq    R14, [RSI + #24 (8-bit)]	# ptr
020     movq    RBP, [RSI + #16 (8-bit)]	# ptr
024     movl    R13, [RSI]	# int
027     movq    RBX, [RSI + #8 (8-bit)]	# ptr
02b     movq    RDI, RSI	# spill
02e     call_leaf,runtime  OSR_migration_end
        No JVM State Info
        # 
        nop 	# 5 bytes pad for loops and calls
040     testq   R14, R14	# ptr
043     je     B44  P=0.001000 C=-1.000000

049     B2: #	out( B58 B3 ) <- in( B1 )  Freq: 0.999
049     movl    R10, [R14 + #8 (8-bit)]	# compressed klass ptr
04d     cmpl    R10, narrowklass: precise klass [I: 0x00007f2930014ea0:Constant:exact *	# compressed klass ptr
054     jne,u   B58  P=0.000001 C=-1.000000

05a     B3: #	out( B4 ) <- in( B2 )  Freq: 0.998999
05a     movq    R11, R14	# spill
05d     # checkcastPP of R11

05d     B4: #	out( B45 B5 ) <- in( B3 B44 )  Freq: 0.999999
        nop 	# 3 bytes pad for loops and calls
060     testq   RBP, RBP	# ptr
063     je     B45  P=0.001000 C=-1.000000

069     B5: #	out( B58 B6 ) <- in( B4 )  Freq: 0.998999
069     movl    R8, [RBP + #8 (8-bit)]	# compressed klass ptr
06d     cmpl    R8, narrowklass: precise klass [I: 0x00007f2930014ea0:Constant:exact *	# compressed klass ptr
074     jne,u   B58  P=0.000001 C=-1.000000

07a     B6: #	out( B7 ) <- in( B5 )  Freq: 0.998998
07a     movq    R8, RBP	# spill
07d     # checkcastPP of R8

07d     B7: #	out( B46 B8 ) <- in( B6 B45 )  Freq: 0.999998
        nop 	# 3 bytes pad for loops and calls
080     testq   RBX, RBX	# ptr
083     je     B46  P=0.001000 C=-1.000000

089     B8: #	out( B58 B9 ) <- in( B7 )  Freq: 0.998998
089     movl    R10, [RBX + #8 (8-bit)]	# compressed klass ptr
08d     cmpl    R10, narrowklass: precise klass [I: 0x00007f2930014ea0:Constant:exact *	# compressed klass ptr
094     jne,u   B58  P=0.000001 C=-1.000000

09a     B9: #	out( B10 ) <- in( B8 )  Freq: 0.998997
09a     # checkcastPP of RBX

09a     B10: #	out( B60 B11 ) <- in( B9 B46 )  Freq: 0.999997
        nop 	# 6 bytes pad for loops and calls
0a0     movl    R14, [R11 + #12 (8-bit)]	# range
0a4     NullCheck R11

0a4     B11: #	out( B59 B12 ) <- in( B10 )  Freq: 0.999996
0a4     movl    RDI, [R8 + #12 (8-bit)]	# range
0a8     NullCheck R8

0a8     B12: #	out( B59 B13 ) <- in( B11 )  Freq: 0.999995
0a8     movl    RDX, [RBX + #12 (8-bit)]	# range
0ab     NullCheck RBX

0ab     B13: #	out( B43 B14 ) <- in( B12 )  Freq: 0.999994
0ab     cmpl    R13, R14
0ae     jge     B43  P=0.000010 C=3033119.000000

0b4     B14: #	out( B15 ) <- in( B13 )  Freq: 0.999984
0b4     movl    RCX, R11	# ptr -> int
0b7     movl    R10, R13	# spill
0ba     incl    R10	# int
0bd     shrl    RCX, #2
0c0     andl    RCX, #3	# int
0c3     xorl    R9, R9	# int
0c6     cmpl    R10, R9
0c9     cmovllt R10, R9	# max
0cd     cmpl    R10, R9
0d0     cmovllt R10, R9	# max
0d4     cmpl    R10, R14
0d7     cmovlgt R10, R14	# min
0db     addl    RCX, R10	# int
0de     negl    RCX	# int
0e0     andl    RCX, #3	# int
0e3     addl    RCX, R10	# int
0e6     cmpl    RCX, R14
0e9     cmovlgt RCX, R14	# min

0ed     B15: #	out( B47 B16 ) <- in( B14 B18 ) Loop( B15-B18 inner pre of N415) Freq: 1.99996
0ed     cmpl    R13, RDI	# unsigned
0f0     jnb,u   B47  P=0.000001 C=-1.000000

0f6     B16: #	out( B48 B17 ) <- in( B15 )  Freq: 1.99996
0f6     movl    RBP, [R8 + #16 + R13 << #2]	# int
        nop 	# 5 bytes pad for loops and calls
100     cmpl    R13, RDX	# unsigned
103     jnb,u   B48  P=0.000001 C=-1.000000

109     B17: #	out( B49 B18 ) <- in( B16 )  Freq: 1.99996
109     addl    RBP, [RBX + #16 + R13 << #2]	# int
10e     cmpl    R13, R14	# unsigned
111     jnb,u   B49  P=0.000001 C=-1.000000

117     B18: #	out( B15 B19 ) <- in( B17 )  Freq: 1.99996
117     movl    [R11 + #16 + R13 << #2], RBP	# int
11c     incl    R13	# int
        nop 	# 1 bytes pad for loops and calls
120     cmpl    R13, RCX
123     jl,s   B15	# loop end  P=0.500000 C=3033119.000000

125     B19: #	out( B37 B20 ) <- in( B18 )  Freq: 0.999978
125     cmpl    RDI, RDX
127     movl    RSI, RDI	# spill
129     cmovlgt RSI, RDX	# min
12c     cmpl    RSI, R14
12f     cmovlgt RSI, R14	# min
133     movl    R10, RSI	# spill
136     addl    R10, #-15	# int
13a     movl    RBP, #-2147483648	# int
13f     cmpl    RSI, R10
142     cmovll R10, RBP	# signed, int
146     cmpl    R13, R10
149     jge     B37  P=0.000001 C=-1.000000

14f     B20: #	out( B50 B21 ) <- in( B19 )  Freq: 0.999977
14f     # castII of R13
14f     cmpl    R13, RDI	# unsigned
152     jnb,u   B50  P=0.000001 C=-1.000000

158     B21: #	out( B51 B22 ) <- in( B20 )  Freq: 0.999976
158     cmpl    R13, RDX	# unsigned
        nop 	# 5 bytes pad for loops and calls
160     jnb,u   B51  P=0.000001 C=-1.000000

166     B22: #	out( B52 B23 ) <- in( B21 )  Freq: 0.999975
166     cmpl    R13, R14	# unsigned
169     jnb,u   B52  P=0.000001 C=-1.000000

16f     B23: #	out( B53 B24 ) <- in( B22 )  Freq: 0.999974
16f     movl    RCX, R13	# spill
172     addl    RCX, #15	# int
175     cmpl    RCX, R14	# unsigned
178     jnb,u   B53  P=0.000001 C=-1.000000

17e     B24: #	out( B54 B25 ) <- in( B23 )  Freq: 0.999973
        nop 	# 2 bytes pad for loops and calls
180     cmpl    RCX, RDX	# unsigned
182     jnb,u   B54  P=0.000001 C=-1.000000

188     B25: #	out( B55 B26 ) <- in( B24 )  Freq: 0.999972
188     cmpl    R13, RDX	# unsigned
18b     jnb,u   B55  P=0.000001 C=-1.000000

191     B26: #	out( B56 B27 ) <- in( B25 )  Freq: 0.999971
191     cmpl    RCX, RDI	# unsigned
193     jnb,u   B56  P=0.000001 C=-1.000000

199     B27: #	out( B57 B28 ) <- in( B26 )  Freq: 0.99997
199     cmpl    R13, RDI	# unsigned
        nop 	# 4 bytes pad for loops and calls
1a0     jnb,u   B57  P=0.000001 C=-1.000000

1a6     B28: #	out( B30 ) <- in( B27 )  Freq: 0.999969
1a6     movl    RCX, #16000	# int
1ab     # TLS is in R15
1ab     jmp,s   B30

1ad     B29: #	out( B30 ) <- in( B32 ) top-of-loop Freq: 98108.3
1ad     movdl   RDI, XMM0	# spill

1b1     B30: #	out( B31 ) <- in( B28 B29 ) Loop( B30-B29 ) Freq: 98109.3
1b1     movl    RAX, R10	# spill
1b4     subl    RAX, R13	# int
1b7     cmpl    R10, R13
1ba     cmovll RAX, R9	# signed, int
1be     cmpl    RAX, #16000	# unsigned
1c4     cmovlnbe RAX, RCX	# unsigned, int
1c7     addl    RAX, R13	# int
1ca     movdl   XMM0, RDI	# spill
        nop 	# 2 bytes pad for loops and calls

1d0     B31: #	out( B31 B32 ) <- in( B30 B31 ) Loop( B31-B31 inner main of N225 strip mined) Freq: 9.62574e+09
1d0     load_vector XMM1,[RBX + #16 + R13 << #2]
1d7     load_vector XMM2,[R8 + #16 + R13 << #2]
1de     paddd   XMM2,XMM1	! add packedI
1e2     store_vector [R11 + #16 + R13 << #2],XMM2
	
1e9     movslq  RDI, R13	# i2l
1ec     load_vector XMM1,[R8 + #32 + RDI << #2]
1f3     load_vector XMM2,[RBX + #32 + RDI << #2]
1f9     paddd   XMM1,XMM2	! add packedI
1fd     store_vector [R11 + #32 + RDI << #2],XMM1
	
204     load_vector XMM1,[R8 + #48 + RDI << #2]
20b     load_vector XMM2,[RBX + #48 + RDI << #2]
211     paddd   XMM1,XMM2	! add packedI
215     store_vector [R11 + #48 + RDI << #2],XMM1
	
21c     load_vector XMM1,[R8 + #64 + RDI << #2]
223     load_vector XMM2,[RBX + #64 + RDI << #2]
229     paddd   XMM1,XMM2	! add packedI
22d     store_vector [R11 + #64 + RDI << #2],XMM1
	
234     addl    R13, #16	# int
238     cmpl    R13, RAX
        nop 	# 5 bytes pad for loops and calls
240     jl,s   B31	# loop end  P=0.999990 C=3033119.000000

242     B32: #	out( B29 B33 ) <- in( B31 )  Freq: 98109.3
242     movq    RDI, [R15 + #304 (32-bit)]	# ptr
249     testl   rax, [RDI]	# Safepoint: poll for GC        # App::micro_scalar @ bci:26 (line 9) L[0]=_ L[1]=R11 L[2]=R8 L[3]=RBX L[4]=R13
        # OopMap {r11=Oop r8=Oop rbx=Oop off=585/0x249}
24b     cmpl    R13, R10
24e     jl     B29  P=0.999990 C=3033119.000000

254     B33: #	out( B36 B34 ) <- in( B32 )  Freq: 0.999969
254     movl    R9, RSI	# spill
257     addl    R9, #-3	# int
25b     cmpl    RSI, R9
25e     cmovll R9, RBP	# signed, int
262     cmpl    R13, R9
265     jge,s   B36  P=0.500000 C=-1.000000

267     B34: #	out( B35 ) <- in( B33 )  Freq: 0.499984
267     # castII of R13
        nop 	# 1 bytes pad for loops and calls

268     B35: #	out( B35 B36 ) <- in( B34 B35 ) Loop( B35-B35 inner post of N938) Freq: 0.999969
268     load_vector XMM1,[RBX + #16 + R13 << #2]
26f     load_vector XMM2,[R8 + #16 + R13 << #2]
276     paddd   XMM2,XMM1	! add packedI
27a     store_vector [R11 + #16 + R13 << #2],XMM2
	
281     addl    R13, #4	# int
285     cmpl    R13, R9
288     jl,s   B35	# loop end  P=0.500000 C=3033119.000000

28a     B36: #	out( B37 ) <- in( B35 B33 )  Freq: 0.999969
28a     movdl   RDI, XMM0	# spill

28e     B37: #	out( B43 B38 ) <- in( B19 B36 )  Freq: 0.99997
28e     cmpl    R13, R14
291     jge     B43  P=0.500000 C=-1.000000

297     B38: #	out( B39 ) <- in( B37 )  Freq: 0.499985
297     # castII of R13
        nop 	# 1 bytes pad for loops and calls

298     B39: #	out( B47 B40 ) <- in( B38 B42 ) Loop( B39-B42 inner post of N415) Freq: 0.999967
298     cmpl    R13, RDI	# unsigned
        nop 	# 5 bytes pad for loops and calls
2a0     jnb,u   B47  P=0.000001 C=-1.000000

2a6     B40: #	out( B48 B41 ) <- in( B39 )  Freq: 0.999965
2a6     movl    RBP, [R8 + #16 + R13 << #2]	# int
2ab     cmpl    R13, RDX	# unsigned
2ae     jnb,u   B48  P=0.000001 C=-1.000000

2b4     B41: #	out( B49 B42 ) <- in( B40 )  Freq: 0.999964
2b4     addl    RBP, [RBX + #16 + R13 << #2]	# int
2b9     cmpl    R13, R14	# unsigned
        nop 	# 4 bytes pad for loops and calls
2c0     jnb,u   B49  P=0.000001 C=-1.000000

2c6     B42: #	out( B39 B43 ) <- in( B41 )  Freq: 0.999963
2c6     movl    [R11 + #16 + R13 << #2], RBP	# int
2cb     incl    R13	# int
2ce     cmpl    R13, R14
2d1     jl,s   B39	# loop end  P=0.500000 C=3033119.000000

2d3     B43: #	out( N538 ) <- in( B13 B42 B37 )  Freq: 0.999977
2d3     addq    rsp, 80	# Destroy frame
	popq    rbp
	cmpq     rsp, poll_offset[r15_thread] 
	ja       #safepoint_stub	# Safepoint: poll for GC

2e5     ret

2e6     B44: #	out( B4 ) <- in( B1 )  Freq: 0.000999987
2e6     xorl    R11, R11	# ptr
2e9     jmp     B4

2ee     B45: #	out( B7 ) <- in( B4 )  Freq: 0.000999986
2ee     xorl    R8, R8	# ptr
2f1     jmp     B7

2f6     B46: #	out( B10 ) <- in( B7 )  Freq: 0.000999985
2f6     xorl    RBX, RBX	# ptr
2f8     jmp     B10

2fd     B47: #	out( N538 ) <- in( B39 B15 )  Freq: 3.03976e-06
2fd     movl    RSI, #-28	# int
302     movq    [rsp + #8], RBX	# spill
307     movq    [rsp + #24], R11	# spill
30c     movl    [rsp + #20], R13	# spill
311     movq    [rsp + #32], R8	# spill
316     movl    [rsp + #40], R13	# spill
31b     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # App::micro_scalar @ bci:16 (line 10) L[0]=_ L[1]=rsp + #24 L[2]=rsp + #32 L[3]=rsp + #8 L[4]=rsp + #20 STK[0]=rsp + #24 STK[1]=rsp + #40 STK[2]=rsp + #32 STK[3]=rsp + #20
        # OopMap {[8]=Oop [24]=Oop [32]=Oop off=800/0x320}
320     stop	# ShouldNotReachHere

334     B48: #	out( N538 ) <- in( B40 B16 )  Freq: 3.03976e-06
334     movl    RSI, #-28	# int
339     movq    [rsp + #8], R8	# spill
33e     movq    [rsp + #32], R11	# spill
343     movl    [rsp + #28], R13	# spill
348     movq    [rsp + #40], RBX	# spill
34d     movl    [rsp + #48], R13	# spill
        nop 	# 1 bytes pad for loops and calls
353     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # App::micro_scalar @ bci:20 (line 10) L[0]=_ L[1]=rsp + #32 L[2]=rsp + #8 L[3]=rsp + #40 L[4]=rsp + #28 STK[0]=rsp + #32 STK[1]=rsp + #48 STK[2]=RBP STK[3]=rsp + #40 STK[4]=rsp + #28
        # OopMap {[8]=Oop [32]=Oop [40]=Oop off=856/0x358}
358     stop	# ShouldNotReachHere

36c     B49: #	out( N538 ) <- in( B41 B17 )  Freq: 3.03976e-06
36c     movl    RSI, #-28	# int
371     movq    [rsp + #8], R8	# spill
376     movq    [rsp + #16], RBX	# spill
37b     movq    [rsp + #32], R11	# spill
380     movl    [rsp + #28], R13	# spill
        nop 	# 2 bytes pad for loops and calls
387     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # App::micro_scalar @ bci:22 (line 10) L[0]=_ L[1]=rsp + #32 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=rsp + #28 STK[0]=rsp + #32 STK[1]=rsp + #28 STK[2]=RBP
        # OopMap {[8]=Oop [16]=Oop [32]=Oop off=908/0x38c}
38c     stop	# ShouldNotReachHere

3a0     B50: #	out( N538 ) <- in( B20 )  Freq: 1.01326e-06
3a0     stop	# ShouldNotReachHere

3b4     B51: #	out( N538 ) <- in( B21 )  Freq: 1.01325e-06
3b4     stop	# ShouldNotReachHere

3c8     B52: #	out( N538 ) <- in( B22 )  Freq: 1.01325e-06
3c8     stop	# ShouldNotReachHere

3dc     B53: #	out( N538 ) <- in( B23 )  Freq: 1.01325e-06
3dc     stop	# ShouldNotReachHere

3f0     B54: #	out( N538 ) <- in( B24 )  Freq: 1.01325e-06
3f0     stop	# ShouldNotReachHere

404     B55: #	out( N538 ) <- in( B25 )  Freq: 1.01325e-06
404     stop	# ShouldNotReachHere

418     B56: #	out( N538 ) <- in( B26 )  Freq: 1.01325e-06
418     stop	# ShouldNotReachHere

42c     B57: #	out( N538 ) <- in( B27 )  Freq: 1.01325e-06
42c     stop	# ShouldNotReachHere

440     B58: #	out( N538 ) <- in( B2 B5 B8 )  Freq: 2.997e-06
440     movl    RSI, #-115	# int
445     movq    [rsp + #0], RBX	# spill
449     movl    [rsp + #8], R13	# spill
44e     movq    [rsp + #16], R14	# spill
453     call,static  wrapper for: uncommon_trap(reason='constraint' action='reinterpret' debug_id='0')
        # App::micro_scalar @ bci:3 (line 9) L[0]=_ L[1]=rsp + #16 L[2]=RBP L[3]=rsp + #0 L[4]=rsp + #8
        # OopMap {rbp=Oop [0]=Oop [16]=Oop off=1112/0x458}
458     stop	# ShouldNotReachHere

46c     B59: #	out( N538 ) <- in( B12 B11 )  Freq: 2.02655e-06
46c     movl    RSI, #-66	# int
471     movq    RBP, R11	# spill
474     movq    [rsp + #0], R8	# spill
478     movq    [rsp + #8], RBX	# spill
47d     movl    [rsp + #16], R13	# spill
        nop 	# 1 bytes pad for loops and calls
483     call,static  wrapper for: uncommon_trap(reason='profile_predicate' action='maybe_recompile' debug_id='0')
        # App::micro_scalar @ bci:3 (line 9) L[0]=_ L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #8 L[4]=rsp + #16
        # OopMap {rbp=Oop [0]=Oop [8]=Oop off=1160/0x488}
488     stop	# ShouldNotReachHere

49c     B60: #	out( N538 ) <- in( B10 )  Freq: 1.01328e-06
49c     movl    RSI, #-138	# int
4a1     movq    RBP, R11	# spill
4a4     movq    [rsp + #0], R8	# spill
4a8     movq    [rsp + #8], RBX	# spill
4ad     movl    [rsp + #16], R13	# spill
        nop 	# 1 bytes pad for loops and calls
4b3     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_scalar @ bci:3 (line 9) L[0]=_ L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #8 L[4]=rsp + #16
        # OopMap {rbp=Oop [0]=Oop [8]=Oop off=1208/0x4b8}
4b8     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    1585  100 %           App::micro_scalar @ 3 (30 bytes)
 total in heap  [0x00007f29ad14bc10,0x00007f29ad14c6c8] = 2744
 relocation     [0x00007f29ad14bd88,0x00007f29ad14be60] = 216
 main code      [0x00007f29ad14be60,0x00007f29ad14c360] = 1280
 stub code      [0x00007f29ad14c360,0x00007f29ad14c378] = 24
 oops           [0x00007f29ad14c378,0x00007f29ad14c380] = 8
 metadata       [0x00007f29ad14c380,0x00007f29ad14c390] = 16
 scopes data    [0x00007f29ad14c390,0x00007f29ad14c460] = 208
 scopes pcs     [0x00007f29ad14c460,0x00007f29ad14c6a0] = 576
 dependencies   [0x00007f29ad14c6a0,0x00007f29ad14c6a8] = 8
 nul chk table  [0x00007f29ad14c6a8,0x00007f29ad14c6c8] = 32

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007f294f8116e8} 'micro_scalar' '([I[I[I)V' in 'App'
 ;; N538: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f29ad14be60:   callq  0x00007f29b69c2baa           ;   {runtime_call os::breakpoint()}
  0x00007f29ad14be65:   nop
  0x00007f29ad14be66:   nop
  0x00007f29ad14be67:   nop
  0x00007f29ad14be68:   nop
  0x00007f29ad14be69:   nop
  0x00007f29ad14be6a:   nop
  0x00007f29ad14be6b:   nop
  0x00007f29ad14be6c:   nop
  0x00007f29ad14be6d:   nop
  0x00007f29ad14be6e:   nop
  0x00007f29ad14be6f:   nop
 ;; B1: #	out( B44 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f29ad14be70:   mov    %eax,-0x16000(%rsp)
  0x00007f29ad14be77:   push   %rbp
  0x00007f29ad14be78:   sub    $0x50,%rsp
  0x00007f29ad14be7c:   mov    0x18(%rsi),%r14
  0x00007f29ad14be80:   mov    0x10(%rsi),%rbp
  0x00007f29ad14be84:   mov    (%rsi),%r13d
  0x00007f29ad14be87:   mov    0x8(%rsi),%rbx
  0x00007f29ad14be8b:   mov    %rsi,%rdi
  0x00007f29ad14be8e:   movabs $0x7f29b6abf410,%r10
  0x00007f29ad14be98:   callq  *%r10
  0x00007f29ad14be9b:   nop
  0x00007f29ad14be9c:   nop
  0x00007f29ad14be9d:   nop
  0x00007f29ad14be9e:   nop
  0x00007f29ad14be9f:   nop
  0x00007f29ad14bea0:   test   %r14,%r14
  0x00007f29ad14bea3:   je     0x00007f29ad14c146
 ;; B2: #	out( B58 B3 ) <- in( B1 )  Freq: 0.999
  0x00007f29ad14bea9:   mov    0x8(%r14),%r10d
  0x00007f29ad14bead:   cmp    $0x40c30,%r10d               ;   {metadata({type array int})}
  0x00007f29ad14beb4:   jne    0x00007f29ad14c2a0
 ;; B3: #	out( B4 ) <- in( B2 )  Freq: 0.998999
  0x00007f29ad14beba:   mov    %r14,%r11
 ;; B4: #	out( B45 B5 ) <- in( B3 B44 )  Freq: 0.999999
  0x00007f29ad14bebd:   nop
  0x00007f29ad14bebe:   nop
  0x00007f29ad14bebf:   nop
  0x00007f29ad14bec0:   test   %rbp,%rbp
  0x00007f29ad14bec3:   je     0x00007f29ad14c14e
 ;; B5: #	out( B58 B6 ) <- in( B4 )  Freq: 0.998999
  0x00007f29ad14bec9:   mov    0x8(%rbp),%r8d
  0x00007f29ad14becd:   cmp    $0x40c30,%r8d                ;   {metadata({type array int})}
  0x00007f29ad14bed4:   jne    0x00007f29ad14c2a0
 ;; B6: #	out( B7 ) <- in( B5 )  Freq: 0.998998
  0x00007f29ad14beda:   mov    %rbp,%r8
 ;; B7: #	out( B46 B8 ) <- in( B6 B45 )  Freq: 0.999998
  0x00007f29ad14bedd:   nop
  0x00007f29ad14bede:   nop
  0x00007f29ad14bedf:   nop
  0x00007f29ad14bee0:   test   %rbx,%rbx
  0x00007f29ad14bee3:   je     0x00007f29ad14c156
 ;; B8: #	out( B58 B9 ) <- in( B7 )  Freq: 0.998998
  0x00007f29ad14bee9:   mov    0x8(%rbx),%r10d
  0x00007f29ad14beed:   cmp    $0x40c30,%r10d               ;   {metadata({type array int})}
  0x00007f29ad14bef4:   jne    0x00007f29ad14c2a0           ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
 ;; B9: #	out( B10 ) <- in( B8 )  Freq: 0.998997
 ;; B10: #	out( B60 B11 ) <- in( B9 B46 )  Freq: 0.999997
  0x00007f29ad14befa:   nop
  0x00007f29ad14befb:   nop
  0x00007f29ad14befc:   nop
  0x00007f29ad14befd:   nop
  0x00007f29ad14befe:   nop
  0x00007f29ad14beff:   nop
  0x00007f29ad14bf00:   mov    0xc(%r11),%r14d              ; implicit exception: dispatches to 0x00007f29ad14c2fc
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@6 (line 9)
 ;; B11: #	out( B59 B12 ) <- in( B10 )  Freq: 0.999996
  0x00007f29ad14bf04:   mov    0xc(%r8),%edi                ; implicit exception: dispatches to 0x00007f29ad14c2cc
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
 ;; B12: #	out( B59 B13 ) <- in( B11 )  Freq: 0.999995
  0x00007f29ad14bf08:   mov    0xc(%rbx),%edx               ; implicit exception: dispatches to 0x00007f29ad14c2cc
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
 ;; B13: #	out( B43 B14 ) <- in( B12 )  Freq: 0.999994
  0x00007f29ad14bf0b:   cmp    %r14d,%r13d
  0x00007f29ad14bf0e:   jge    0x00007f29ad14c133           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B14: #	out( B15 ) <- in( B13 )  Freq: 0.999984
  0x00007f29ad14bf14:   mov    %r11d,%ecx
  0x00007f29ad14bf17:   mov    %r13d,%r10d
  0x00007f29ad14bf1a:   inc    %r10d
  0x00007f29ad14bf1d:   shr    $0x2,%ecx
  0x00007f29ad14bf20:   and    $0x3,%ecx
  0x00007f29ad14bf23:   xor    %r9d,%r9d
  0x00007f29ad14bf26:   cmp    %r9d,%r10d
  0x00007f29ad14bf29:   cmovl  %r9d,%r10d
  0x00007f29ad14bf2d:   cmp    %r9d,%r10d
  0x00007f29ad14bf30:   cmovl  %r9d,%r10d
  0x00007f29ad14bf34:   cmp    %r14d,%r10d
  0x00007f29ad14bf37:   cmovg  %r14d,%r10d
  0x00007f29ad14bf3b:   add    %r10d,%ecx
  0x00007f29ad14bf3e:   neg    %ecx
  0x00007f29ad14bf40:   and    $0x3,%ecx
  0x00007f29ad14bf43:   add    %r10d,%ecx
  0x00007f29ad14bf46:   cmp    %r14d,%ecx
  0x00007f29ad14bf49:   cmovg  %r14d,%ecx                   ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
 ;; B15: #	out( B47 B16 ) <- in( B14 B18 ) Loop( B15-B18 inner pre of N415) Freq: 1.99996
  0x00007f29ad14bf4d:   cmp    %edi,%r13d
  0x00007f29ad14bf50:   jae    0x00007f29ad14c15d
 ;; B16: #	out( B48 B17 ) <- in( B15 )  Freq: 1.99996
  0x00007f29ad14bf56:   mov    0x10(%r8,%r13,4),%ebp        ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007f29ad14bf5b:   nop
  0x00007f29ad14bf5c:   nop
  0x00007f29ad14bf5d:   nop
  0x00007f29ad14bf5e:   nop
  0x00007f29ad14bf5f:   nop
  0x00007f29ad14bf60:   cmp    %edx,%r13d
  0x00007f29ad14bf63:   jae    0x00007f29ad14c194
 ;; B17: #	out( B49 B18 ) <- in( B16 )  Freq: 1.99996
  0x00007f29ad14bf69:   add    0x10(%rbx,%r13,4),%ebp       ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@21 (line 10)
  0x00007f29ad14bf6e:   cmp    %r14d,%r13d
  0x00007f29ad14bf71:   jae    0x00007f29ad14c1cc
 ;; B18: #	out( B15 B19 ) <- in( B17 )  Freq: 1.99996
  0x00007f29ad14bf77:   mov    %ebp,0x10(%r11,%r13,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f29ad14bf7c:   inc    %r13d                        ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f29ad14bf7f:   nop
  0x00007f29ad14bf80:   cmp    %ecx,%r13d
  0x00007f29ad14bf83:   jl     0x00007f29ad14bf4d           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B19: #	out( B37 B20 ) <- in( B18 )  Freq: 0.999978
  0x00007f29ad14bf85:   cmp    %edx,%edi
  0x00007f29ad14bf87:   mov    %edi,%esi
  0x00007f29ad14bf89:   cmovg  %edx,%esi
  0x00007f29ad14bf8c:   cmp    %r14d,%esi
  0x00007f29ad14bf8f:   cmovg  %r14d,%esi
  0x00007f29ad14bf93:   mov    %esi,%r10d
  0x00007f29ad14bf96:   add    $0xfffffff1,%r10d
  0x00007f29ad14bf9a:   mov    $0x80000000,%ebp
  0x00007f29ad14bf9f:   cmp    %r10d,%esi
  0x00007f29ad14bfa2:   cmovl  %ebp,%r10d
  0x00007f29ad14bfa6:   cmp    %r10d,%r13d
  0x00007f29ad14bfa9:   jge    0x00007f29ad14c0ee
 ;; B20: #	out( B50 B21 ) <- in( B19 )  Freq: 0.999977
  0x00007f29ad14bfaf:   cmp    %edi,%r13d
  0x00007f29ad14bfb2:   jae    0x00007f29ad14c200
 ;; B21: #	out( B51 B22 ) <- in( B20 )  Freq: 0.999976
  0x00007f29ad14bfb8:   cmp    %edx,%r13d
  0x00007f29ad14bfbb:   nop
  0x00007f29ad14bfbc:   nop
  0x00007f29ad14bfbd:   nop
  0x00007f29ad14bfbe:   nop
  0x00007f29ad14bfbf:   nop
  0x00007f29ad14bfc0:   jae    0x00007f29ad14c214
 ;; B22: #	out( B52 B23 ) <- in( B21 )  Freq: 0.999975
  0x00007f29ad14bfc6:   cmp    %r14d,%r13d
  0x00007f29ad14bfc9:   jae    0x00007f29ad14c228
 ;; B23: #	out( B53 B24 ) <- in( B22 )  Freq: 0.999974
  0x00007f29ad14bfcf:   mov    %r13d,%ecx
  0x00007f29ad14bfd2:   add    $0xf,%ecx
  0x00007f29ad14bfd5:   cmp    %r14d,%ecx
  0x00007f29ad14bfd8:   jae    0x00007f29ad14c23c
 ;; B24: #	out( B54 B25 ) <- in( B23 )  Freq: 0.999973
  0x00007f29ad14bfde:   nop
  0x00007f29ad14bfdf:   nop
  0x00007f29ad14bfe0:   cmp    %edx,%ecx
  0x00007f29ad14bfe2:   jae    0x00007f29ad14c250
 ;; B25: #	out( B55 B26 ) <- in( B24 )  Freq: 0.999972
  0x00007f29ad14bfe8:   cmp    %edx,%r13d
  0x00007f29ad14bfeb:   jae    0x00007f29ad14c264
 ;; B26: #	out( B56 B27 ) <- in( B25 )  Freq: 0.999971
  0x00007f29ad14bff1:   cmp    %edi,%ecx
  0x00007f29ad14bff3:   jae    0x00007f29ad14c278
 ;; B27: #	out( B57 B28 ) <- in( B26 )  Freq: 0.99997
  0x00007f29ad14bff9:   cmp    %edi,%r13d
  0x00007f29ad14bffc:   nop
  0x00007f29ad14bffd:   nop
  0x00007f29ad14bffe:   nop
  0x00007f29ad14bfff:   nop
  0x00007f29ad14c000:   jae    0x00007f29ad14c28c
 ;; B28: #	out( B30 ) <- in( B27 )  Freq: 0.999969
  0x00007f29ad14c006:   mov    $0x3e80,%ecx                 ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
  0x00007f29ad14c00b:   jmp    0x00007f29ad14c011
 ;; B29: #	out( B30 ) <- in( B32 ) top-of-loop Freq: 98108.3
  0x00007f29ad14c00d:   movd   %xmm0,%edi
 ;; B30: #	out( B31 ) <- in( B28 B29 ) Loop( B30-B29 ) Freq: 98109.3
  0x00007f29ad14c011:   mov    %r10d,%eax
  0x00007f29ad14c014:   sub    %r13d,%eax
  0x00007f29ad14c017:   cmp    %r13d,%r10d
  0x00007f29ad14c01a:   cmovl  %r9d,%eax
  0x00007f29ad14c01e:   cmp    $0x3e80,%eax
  0x00007f29ad14c024:   cmova  %ecx,%eax
  0x00007f29ad14c027:   add    %r13d,%eax
  0x00007f29ad14c02a:   movd   %edi,%xmm0
  0x00007f29ad14c02e:   nop
  0x00007f29ad14c02f:   nop
 ;; B31: #	out( B31 B32 ) <- in( B30 B31 ) Loop( B31-B31 inner main of N225 strip mined) Freq: 9.62574e+09
  0x00007f29ad14c030:   movdqu 0x10(%rbx,%r13,4),%xmm1
  0x00007f29ad14c037:   movdqu 0x10(%r8,%r13,4),%xmm2
  0x00007f29ad14c03e:   paddd  %xmm1,%xmm2
  0x00007f29ad14c042:   movdqu %xmm2,0x10(%r11,%r13,4)
  0x00007f29ad14c049:   movslq %r13d,%rdi
  0x00007f29ad14c04c:   movdqu 0x20(%r8,%rdi,4),%xmm1
  0x00007f29ad14c053:   movdqu 0x20(%rbx,%rdi,4),%xmm2
  0x00007f29ad14c059:   paddd  %xmm2,%xmm1
  0x00007f29ad14c05d:   movdqu %xmm1,0x20(%r11,%rdi,4)
  0x00007f29ad14c064:   movdqu 0x30(%r8,%rdi,4),%xmm1
  0x00007f29ad14c06b:   movdqu 0x30(%rbx,%rdi,4),%xmm2
  0x00007f29ad14c071:   paddd  %xmm2,%xmm1
  0x00007f29ad14c075:   movdqu %xmm1,0x30(%r11,%rdi,4)
  0x00007f29ad14c07c:   movdqu 0x40(%r8,%rdi,4),%xmm1
  0x00007f29ad14c083:   movdqu 0x40(%rbx,%rdi,4),%xmm2
  0x00007f29ad14c089:   paddd  %xmm2,%xmm1
  0x00007f29ad14c08d:   movdqu %xmm1,0x40(%r11,%rdi,4)      ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f29ad14c094:   add    $0x10,%r13d                  ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f29ad14c098:   cmp    %eax,%r13d
  0x00007f29ad14c09b:   nop
  0x00007f29ad14c09c:   nop
  0x00007f29ad14c09d:   nop
  0x00007f29ad14c09e:   nop
  0x00007f29ad14c09f:   nop
  0x00007f29ad14c0a0:   jl     0x00007f29ad14c030           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
 ;; B32: #	out( B29 B33 ) <- in( B31 )  Freq: 98109.3
  0x00007f29ad14c0a2:   mov    0x130(%r15),%rdi             ; ImmutableOopMap {r11=Oop r8=Oop rbx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@26 (line 9)
  0x00007f29ad14c0a9:   test   %eax,(%rdi)                  ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
                                                            ;   {poll}
  0x00007f29ad14c0ab:   cmp    %r10d,%r13d
  0x00007f29ad14c0ae:   jl     0x00007f29ad14c00d
 ;; B33: #	out( B36 B34 ) <- in( B32 )  Freq: 0.999969
  0x00007f29ad14c0b4:   mov    %esi,%r9d
  0x00007f29ad14c0b7:   add    $0xfffffffd,%r9d
  0x00007f29ad14c0bb:   cmp    %r9d,%esi
  0x00007f29ad14c0be:   cmovl  %ebp,%r9d
  0x00007f29ad14c0c2:   cmp    %r9d,%r13d
  0x00007f29ad14c0c5:   jge    0x00007f29ad14c0ea
 ;; B34: #	out( B35 ) <- in( B33 )  Freq: 0.499984
  0x00007f29ad14c0c7:   nop
 ;; B35: #	out( B35 B36 ) <- in( B34 B35 ) Loop( B35-B35 inner post of N938) Freq: 0.999969
  0x00007f29ad14c0c8:   movdqu 0x10(%rbx,%r13,4),%xmm1
  0x00007f29ad14c0cf:   movdqu 0x10(%r8,%r13,4),%xmm2
  0x00007f29ad14c0d6:   paddd  %xmm1,%xmm2
  0x00007f29ad14c0da:   movdqu %xmm2,0x10(%r11,%r13,4)      ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f29ad14c0e1:   add    $0x4,%r13d                   ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f29ad14c0e5:   cmp    %r9d,%r13d
  0x00007f29ad14c0e8:   jl     0x00007f29ad14c0c8           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B36: #	out( B37 ) <- in( B35 B33 )  Freq: 0.999969
  0x00007f29ad14c0ea:   movd   %xmm0,%edi
 ;; B37: #	out( B43 B38 ) <- in( B19 B36 )  Freq: 0.99997
  0x00007f29ad14c0ee:   cmp    %r14d,%r13d
  0x00007f29ad14c0f1:   jge    0x00007f29ad14c133
 ;; B38: #	out( B39 ) <- in( B37 )  Freq: 0.499985
  0x00007f29ad14c0f7:   nop                                 ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
 ;; B39: #	out( B47 B40 ) <- in( B38 B42 ) Loop( B39-B42 inner post of N415) Freq: 0.999967
  0x00007f29ad14c0f8:   cmp    %edi,%r13d
  0x00007f29ad14c0fb:   nop
  0x00007f29ad14c0fc:   nop
  0x00007f29ad14c0fd:   nop
  0x00007f29ad14c0fe:   nop
  0x00007f29ad14c0ff:   nop
  0x00007f29ad14c100:   jae    0x00007f29ad14c15d
 ;; B40: #	out( B48 B41 ) <- in( B39 )  Freq: 0.999965
  0x00007f29ad14c106:   mov    0x10(%r8,%r13,4),%ebp        ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007f29ad14c10b:   cmp    %edx,%r13d
  0x00007f29ad14c10e:   jae    0x00007f29ad14c194
 ;; B41: #	out( B49 B42 ) <- in( B40 )  Freq: 0.999964
  0x00007f29ad14c114:   add    0x10(%rbx,%r13,4),%ebp       ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@21 (line 10)
  0x00007f29ad14c119:   cmp    %r14d,%r13d
  0x00007f29ad14c11c:   nop
  0x00007f29ad14c11d:   nop
  0x00007f29ad14c11e:   nop
  0x00007f29ad14c11f:   nop
  0x00007f29ad14c120:   jae    0x00007f29ad14c1cc
 ;; B42: #	out( B39 B43 ) <- in( B41 )  Freq: 0.999963
  0x00007f29ad14c126:   mov    %ebp,0x10(%r11,%r13,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f29ad14c12b:   inc    %r13d                        ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f29ad14c12e:   cmp    %r14d,%r13d
  0x00007f29ad14c131:   jl     0x00007f29ad14c0f8           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B43: #	out( N538 ) <- in( B13 B42 B37 )  Freq: 0.999977
  0x00007f29ad14c133:   add    $0x50,%rsp
  0x00007f29ad14c137:   pop    %rbp
  0x00007f29ad14c138:   cmp    0x128(%r15),%rsp             ;   {poll_return}
  0x00007f29ad14c13f:   ja     0x00007f29ad14c32c
  0x00007f29ad14c145:   retq   
 ;; B44: #	out( B4 ) <- in( B1 )  Freq: 0.000999987
  0x00007f29ad14c146:   xor    %r11d,%r11d
  0x00007f29ad14c149:   jmpq   0x00007f29ad14bebd
 ;; B45: #	out( B7 ) <- in( B4 )  Freq: 0.000999986
  0x00007f29ad14c14e:   xor    %r8d,%r8d
  0x00007f29ad14c151:   jmpq   0x00007f29ad14bedd
 ;; B46: #	out( B10 ) <- in( B7 )  Freq: 0.000999985
  0x00007f29ad14c156:   xor    %ebx,%ebx
  0x00007f29ad14c158:   jmpq   0x00007f29ad14befa
 ;; B47: #	out( N538 ) <- in( B39 B15 )  Freq: 3.03976e-06
  0x00007f29ad14c15d:   mov    $0xffffffe4,%esi
  0x00007f29ad14c162:   mov    %rbx,0x8(%rsp)
  0x00007f29ad14c167:   mov    %r11,0x18(%rsp)
  0x00007f29ad14c16c:   mov    %r13d,0x14(%rsp)
  0x00007f29ad14c171:   mov    %r8,0x20(%rsp)
  0x00007f29ad14c176:   mov    %r13d,0x28(%rsp)
  0x00007f29ad14c17b:   callq  0x00007f29ad116540           ; ImmutableOopMap {[8]=Oop [24]=Oop [32]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f29ad14c180:   movabs $0x7f29b70847b8,%rdi         ;   {external_word}
  0x00007f29ad14c18a:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14c18e:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14c193:   hlt    
 ;; B48: #	out( N538 ) <- in( B40 B16 )  Freq: 3.03976e-06
  0x00007f29ad14c194:   mov    $0xffffffe4,%esi
  0x00007f29ad14c199:   mov    %r8,0x8(%rsp)
  0x00007f29ad14c19e:   mov    %r11,0x20(%rsp)
  0x00007f29ad14c1a3:   mov    %r13d,0x1c(%rsp)
  0x00007f29ad14c1a8:   mov    %rbx,0x28(%rsp)
  0x00007f29ad14c1ad:   mov    %r13d,0x30(%rsp)
  0x00007f29ad14c1b2:   nop
  0x00007f29ad14c1b3:   callq  0x00007f29ad116540           ; ImmutableOopMap {[8]=Oop [32]=Oop [40]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f29ad14c1b8:   movabs $0x7f29b70847b8,%rdi         ;   {external_word}
  0x00007f29ad14c1c2:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14c1c6:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14c1cb:   hlt    
 ;; B49: #	out( N538 ) <- in( B41 B17 )  Freq: 3.03976e-06
  0x00007f29ad14c1cc:   mov    $0xffffffe4,%esi
  0x00007f29ad14c1d1:   mov    %r8,0x8(%rsp)
  0x00007f29ad14c1d6:   mov    %rbx,0x10(%rsp)
  0x00007f29ad14c1db:   mov    %r11,0x20(%rsp)
  0x00007f29ad14c1e0:   mov    %r13d,0x1c(%rsp)
  0x00007f29ad14c1e5:   nop
  0x00007f29ad14c1e6:   nop
  0x00007f29ad14c1e7:   callq  0x00007f29ad116540           ; ImmutableOopMap {[8]=Oop [16]=Oop [32]=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f29ad14c1ec:   movabs $0x7f29b70847b8,%rdi         ;   {external_word}
  0x00007f29ad14c1f6:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14c1fa:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14c1ff:   hlt                                 ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
 ;; B50: #	out( N538 ) <- in( B20 )  Freq: 1.01326e-06
  0x00007f29ad14c200:   movabs $0x7f29b721c968,%rdi         ;   {external_word}
  0x00007f29ad14c20a:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14c20e:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14c213:   hlt    
 ;; B51: #	out( N538 ) <- in( B21 )  Freq: 1.01325e-06
  0x00007f29ad14c214:   movabs $0x7f29b721c968,%rdi         ;   {external_word}
  0x00007f29ad14c21e:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14c222:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14c227:   hlt    
 ;; B52: #	out( N538 ) <- in( B22 )  Freq: 1.01325e-06
  0x00007f29ad14c228:   movabs $0x7f29b721c968,%rdi         ;   {external_word}
  0x00007f29ad14c232:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14c236:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14c23b:   hlt    
 ;; B53: #	out( N538 ) <- in( B23 )  Freq: 1.01325e-06
  0x00007f29ad14c23c:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad14c246:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14c24a:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14c24f:   hlt    
 ;; B54: #	out( N538 ) <- in( B24 )  Freq: 1.01325e-06
  0x00007f29ad14c250:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad14c25a:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14c25e:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14c263:   hlt    
 ;; B55: #	out( N538 ) <- in( B25 )  Freq: 1.01325e-06
  0x00007f29ad14c264:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad14c26e:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14c272:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14c277:   hlt    
 ;; B56: #	out( N538 ) <- in( B26 )  Freq: 1.01325e-06
  0x00007f29ad14c278:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad14c282:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14c286:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14c28b:   hlt    
 ;; B57: #	out( N538 ) <- in( B27 )  Freq: 1.01325e-06
  0x00007f29ad14c28c:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad14c296:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14c29a:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14c29f:   hlt    
 ;; B58: #	out( N538 ) <- in( B2 B5 B8 )  Freq: 2.997e-06
  0x00007f29ad14c2a0:   mov    $0xffffff8d,%esi
  0x00007f29ad14c2a5:   mov    %rbx,(%rsp)
  0x00007f29ad14c2a9:   mov    %r13d,0x8(%rsp)
  0x00007f29ad14c2ae:   mov    %r14,0x10(%rsp)
  0x00007f29ad14c2b3:   callq  0x00007f29ad116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f29ad14c2b8:   movabs $0x7f29b70847b8,%rdi         ;   {external_word}
  0x00007f29ad14c2c2:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14c2c6:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14c2cb:   hlt    
 ;; B59: #	out( N538 ) <- in( B12 B11 )  Freq: 2.02655e-06
  0x00007f29ad14c2cc:   mov    $0xffffffbe,%esi
  0x00007f29ad14c2d1:   mov    %r11,%rbp
  0x00007f29ad14c2d4:   mov    %r8,(%rsp)
  0x00007f29ad14c2d8:   mov    %rbx,0x8(%rsp)
  0x00007f29ad14c2dd:   mov    %r13d,0x10(%rsp)
  0x00007f29ad14c2e2:   nop
  0x00007f29ad14c2e3:   callq  0x00007f29ad116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f29ad14c2e8:   movabs $0x7f29b70847b8,%rdi         ;   {external_word}
  0x00007f29ad14c2f2:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14c2f6:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14c2fb:   hlt    
 ;; B60: #	out( N538 ) <- in( B10 )  Freq: 1.01328e-06
  0x00007f29ad14c2fc:   mov    $0xffffff76,%esi
  0x00007f29ad14c301:   mov    %r11,%rbp
  0x00007f29ad14c304:   mov    %r8,(%rsp)
  0x00007f29ad14c308:   mov    %rbx,0x8(%rsp)
  0x00007f29ad14c30d:   mov    %r13d,0x10(%rsp)
  0x00007f29ad14c312:   nop
  0x00007f29ad14c313:   callq  0x00007f29ad116540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f29ad14c318:   movabs $0x7f29b70847b8,%rdi         ;   {external_word}
  0x00007f29ad14c322:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14c326:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14c32b:   hlt                                 ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
  0x00007f29ad14c32c:   movabs $0x7f29ad14c138,%r10         ;   {internal_word}
  0x00007f29ad14c336:   mov    %r10,0x3e8(%r15)
  0x00007f29ad14c33d:   jmpq   0x00007f29ad114d20           ;   {runtime_call SafepointBlob}
  0x00007f29ad14c342:   hlt    
  0x00007f29ad14c343:   hlt    
  0x00007f29ad14c344:   hlt    
  0x00007f29ad14c345:   hlt    
  0x00007f29ad14c346:   hlt    
  0x00007f29ad14c347:   hlt    
  0x00007f29ad14c348:   hlt    
  0x00007f29ad14c349:   hlt    
  0x00007f29ad14c34a:   hlt    
  0x00007f29ad14c34b:   hlt    
  0x00007f29ad14c34c:   hlt    
  0x00007f29ad14c34d:   hlt    
  0x00007f29ad14c34e:   hlt    
  0x00007f29ad14c34f:   hlt    
  0x00007f29ad14c350:   hlt    
  0x00007f29ad14c351:   hlt    
  0x00007f29ad14c352:   hlt    
  0x00007f29ad14c353:   hlt    
  0x00007f29ad14c354:   hlt    
  0x00007f29ad14c355:   hlt    
  0x00007f29ad14c356:   hlt    
  0x00007f29ad14c357:   hlt    
  0x00007f29ad14c358:   hlt    
  0x00007f29ad14c359:   hlt    
  0x00007f29ad14c35a:   hlt    
  0x00007f29ad14c35b:   hlt    
  0x00007f29ad14c35c:   hlt    
  0x00007f29ad14c35d:   hlt    
  0x00007f29ad14c35e:   hlt    
  0x00007f29ad14c35f:   hlt    
[Exception Handler]
  0x00007f29ad14c360:   jmpq   0x00007f29ad05c9a0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f29ad14c365:   callq  0x00007f29ad14c36a
  0x00007f29ad14c36a:   subq   $0x5,(%rsp)
  0x00007f29ad14c36f:   jmpq   0x00007f29ad116a60           ;   {runtime_call DeoptimizationBlob}
  0x00007f29ad14c374:   hlt    
  0x00007f29ad14c375:   hlt    
  0x00007f29ad14c376:   hlt    
  0x00007f29ad14c377:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007f29ad14c378:   0x000000010110de48 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de48}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007f29ad14c380:   0x0000000800040c30 {type array int}
  0x00007f29ad14c388:   0x00007f294f8116e8 {method} {0x00007f294f8116e8} 'micro_scalar' '([I[I[I)V' in 'App'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007f29ad14be5f offset=ffffffff bits=0):
PcDesc(pc=0x00007f29ad14befa offset=9a bits=0):   App::micro_scalar@3 (line 9)
PcDesc(pc=0x00007f29ad14bf04 offset=a4 bits=0):   App::micro_scalar@6 (line 9)
PcDesc(pc=0x00007f29ad14bf08 offset=a8 bits=0):   App::micro_scalar@16 (line 10)
PcDesc(pc=0x00007f29ad14bf0b offset=ab bits=0):   App::micro_scalar@20 (line 10)
PcDesc(pc=0x00007f29ad14bf14 offset=b4 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007f29ad14bf4d offset=ed bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad14bf5b offset=fb bits=0):   App::micro_scalar@16 (line 10)
PcDesc(pc=0x00007f29ad14bf6e offset=10e bits=0):   App::micro_scalar@21 (line 10)
PcDesc(pc=0x00007f29ad14bf7c offset=11c bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad14bf7f offset=11f bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007f29ad14bf85 offset=125 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007f29ad14c00b offset=1ab bits=0):   App::micro_scalar@26 (line 9)
PcDesc(pc=0x00007f29ad14c094 offset=234 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad14c098 offset=238 bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007f29ad14c0a2 offset=242 bits=0):   App::micro_scalar@26 (line 9)
PcDesc(pc=0x00007f29ad14c0a9 offset=249 bits=1):   App::micro_scalar@26 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg r11 [22],oop
    - l2: reg r8 [16],oop
    - l3: reg rbx [6],oop
    - l4: reg r13 [26],int
PcDesc(pc=0x00007f29ad14c0ab offset=24b bits=0):   App::micro_scalar@26 (line 9)
PcDesc(pc=0x00007f29ad14c0e1 offset=281 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad14c0e5 offset=285 bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007f29ad14c0ea offset=28a bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007f29ad14c0f8 offset=298 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad14c10b offset=2ab bits=0):   App::micro_scalar@16 (line 10)
PcDesc(pc=0x00007f29ad14c119 offset=2b9 bits=0):   App::micro_scalar@21 (line 10)
PcDesc(pc=0x00007f29ad14c12b offset=2cb bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad14c12e offset=2ce bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007f29ad14c133 offset=2d3 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007f29ad14c180 offset=320 bits=0):   App::micro_scalar@16 (line 10)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: stack[32],oop
    - l3: stack[8],oop
    - l4: stack[20]
   Expression stack
    - @0: stack[24],oop
    - @1: stack[40]
    - @2: stack[32],oop
    - @3: stack[20]
PcDesc(pc=0x00007f29ad14c1b8 offset=358 bits=0):   App::micro_scalar@20 (line 10)
   Locals
    - l0: empty
    - l1: stack[32],oop
    - l2: stack[8],oop
    - l3: stack[40],oop
    - l4: stack[28]
   Expression stack
    - @0: stack[32],oop
    - @1: stack[48]
    - @2: reg rbp [10],int
    - @3: stack[40],oop
    - @4: stack[28]
PcDesc(pc=0x00007f29ad14c1ec offset=38c bits=0):   App::micro_scalar@22 (line 10)
   Locals
    - l0: empty
    - l1: stack[32],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: stack[28]
   Expression stack
    - @0: stack[32],oop
    - @1: stack[28]
    - @2: reg rbp [10],int
PcDesc(pc=0x00007f29ad14c200 offset=3a0 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad14c2b8 offset=458 bits=0):   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: stack[16],oop
    - l2: reg rbp [10],oop
    - l3: stack[0],oop
    - l4: stack[8]
PcDesc(pc=0x00007f29ad14c2e8 offset=488 bits=0):   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[16]
PcDesc(pc=0x00007f29ad14c318 offset=4b8 bits=0):   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[16]
PcDesc(pc=0x00007f29ad14c32c offset=4cc bits=0):   App::micro_scalar@3 (line 9)
PcDesc(pc=0x00007f29ad14c379 offset=519 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 7 OopMaps

ImmutableOopMap {r11=Oop r8=Oop rbx=Oop } pc offsets: 585 
ImmutableOopMap {[8]=Oop [24]=Oop [32]=Oop } pc offsets: 800 
ImmutableOopMap {[8]=Oop [32]=Oop [40]=Oop } pc offsets: 856 
ImmutableOopMap {[8]=Oop [16]=Oop [32]=Oop } pc offsets: 908 
ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop } pc offsets: 1112 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop } pc offsets: 1160 1208 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007f29ad14befa offset=9a):
   App::micro_scalar@3 (line 9)
ScopeDesc(pc=0x00007f29ad14bf04 offset=a4):
   App::micro_scalar@6 (line 9)
ScopeDesc(pc=0x00007f29ad14bf08 offset=a8):
   App::micro_scalar@16 (line 10)
ScopeDesc(pc=0x00007f29ad14bf0b offset=ab):
   App::micro_scalar@20 (line 10)
ScopeDesc(pc=0x00007f29ad14bf14 offset=b4):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007f29ad14bf4d offset=ed):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad14bf5b offset=fb):
   App::micro_scalar@16 (line 10)
ScopeDesc(pc=0x00007f29ad14bf6e offset=10e):
   App::micro_scalar@21 (line 10)
ScopeDesc(pc=0x00007f29ad14bf7c offset=11c):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad14bf7f offset=11f):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007f29ad14bf85 offset=125):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007f29ad14c00b offset=1ab):
   App::micro_scalar@26 (line 9)
ScopeDesc(pc=0x00007f29ad14c094 offset=234):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad14c098 offset=238):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007f29ad14c0a2 offset=242):
   App::micro_scalar@26 (line 9)
ScopeDesc(pc=0x00007f29ad14c0a9 offset=249):
   App::micro_scalar@26 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg r11 [22],oop
    - l2: reg r8 [16],oop
    - l3: reg rbx [6],oop
    - l4: reg r13 [26],int
ScopeDesc(pc=0x00007f29ad14c0ab offset=24b):
   App::micro_scalar@26 (line 9)
ScopeDesc(pc=0x00007f29ad14c0e1 offset=281):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad14c0e5 offset=285):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007f29ad14c0ea offset=28a):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007f29ad14c0f8 offset=298):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad14c10b offset=2ab):
   App::micro_scalar@16 (line 10)
ScopeDesc(pc=0x00007f29ad14c119 offset=2b9):
   App::micro_scalar@21 (line 10)
ScopeDesc(pc=0x00007f29ad14c12b offset=2cb):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad14c12e offset=2ce):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007f29ad14c133 offset=2d3):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007f29ad14c180 offset=320):
   App::micro_scalar@16 (line 10)
   Locals
    - l0: empty
    - l1: stack[24],oop
    - l2: stack[32],oop
    - l3: stack[8],oop
    - l4: stack[20]
   Expression stack
    - @0: stack[24],oop
    - @1: stack[40]
    - @2: stack[32],oop
    - @3: stack[20]
ScopeDesc(pc=0x00007f29ad14c1b8 offset=358):
   App::micro_scalar@20 (line 10)
   Locals
    - l0: empty
    - l1: stack[32],oop
    - l2: stack[8],oop
    - l3: stack[40],oop
    - l4: stack[28]
   Expression stack
    - @0: stack[32],oop
    - @1: stack[48]
    - @2: reg rbp [10],int
    - @3: stack[40],oop
    - @4: stack[28]
ScopeDesc(pc=0x00007f29ad14c1ec offset=38c):
   App::micro_scalar@22 (line 10)
   Locals
    - l0: empty
    - l1: stack[32],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: stack[28]
   Expression stack
    - @0: stack[32],oop
    - @1: stack[28]
    - @2: reg rbp [10],int
ScopeDesc(pc=0x00007f29ad14c200 offset=3a0):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad14c2b8 offset=458):
   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: stack[16],oop
    - l2: reg rbp [10],oop
    - l3: stack[0],oop
    - l4: stack[8]
ScopeDesc(pc=0x00007f29ad14c2e8 offset=488):
   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[16]
ScopeDesc(pc=0x00007f29ad14c318 offset=4b8):
   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[16]
ScopeDesc(pc=0x00007f29ad14c32c offset=4cc):
   App::micro_scalar@3 (line 9)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007f29ad14bd88: 6400
relocInfo@0x00007f29ad14bd88 [type=6(runtime_call) addr=0x00007f29ad14be60 offset=0 format=1] | [destination=0x00007f29b69c2baa]
         @0x00007f29ad14bd8a: f001cc4d
relocInfo@0x00007f29ad14bd8c [type=12(metadata) addr=0x00007f29ad14bead offset=77 format=3 data=1] | [metadata_addr=0x00007f29ad14c380 *=0x0000000800040c30 offset=0]metadata_value=0x0000000800040c30: {type array int}
         @0x00007f29ad14bd8e: f001cc20
relocInfo@0x00007f29ad14bd90 [type=12(metadata) addr=0x00007f29ad14becd offset=32 format=3 data=1] | [metadata_addr=0x00007f29ad14c380 *=0x0000000800040c30 offset=0]metadata_value=0x0000000800040c30: {type array int}
         @0x00007f29ad14bd92: f001cc20
relocInfo@0x00007f29ad14bd94 [type=12(metadata) addr=0x00007f29ad14beed offset=32 format=3 data=1] | [metadata_addr=0x00007f29ad14c380 *=0x0000000800040c30 offset=0]metadata_value=0x0000000800040c30: {type array int}
         @0x00007f29ad14bd96: a1bc
relocInfo@0x00007f29ad14bd96 [type=10(poll) addr=0x00007f29ad14c0a9 offset=444]
         @0x00007f29ad14bd98: b08f
relocInfo@0x00007f29ad14bd98 [type=11(poll_return) addr=0x00007f29ad14c138 offset=143]
         @0x00007f29ad14bd9a: 6443
relocInfo@0x00007f29ad14bd9a [type=6(runtime_call) addr=0x00007f29ad14c17b offset=67 format=1] | [destination=0x00007f29ad116540]
         @0x00007f29ad14bd9c: f803b70847b87f297005
relocInfo@0x00007f29ad14bda4 [type=7(external_word) addr=0x00007f29ad14c180 offset=5 data={b70847b87f29}] | [target=0x00007f29b70847b8]
         @0x00007f29ad14bda6: 640e
relocInfo@0x00007f29ad14bda6 [type=6(runtime_call) addr=0x00007f29ad14c18e offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14bda8: 6425
relocInfo@0x00007f29ad14bda8 [type=6(runtime_call) addr=0x00007f29ad14c1b3 offset=37 format=1] | [destination=0x00007f29ad116540]
         @0x00007f29ad14bdaa: f803b70847b87f297005
relocInfo@0x00007f29ad14bdb2 [type=7(external_word) addr=0x00007f29ad14c1b8 offset=5 data={b70847b87f29}] | [target=0x00007f29b70847b8]
         @0x00007f29ad14bdb4: 640e
relocInfo@0x00007f29ad14bdb4 [type=6(runtime_call) addr=0x00007f29ad14c1c6 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14bdb6: 6421
relocInfo@0x00007f29ad14bdb6 [type=6(runtime_call) addr=0x00007f29ad14c1e7 offset=33 format=1] | [destination=0x00007f29ad116540]
         @0x00007f29ad14bdb8: f803b70847b87f297005
relocInfo@0x00007f29ad14bdc0 [type=7(external_word) addr=0x00007f29ad14c1ec offset=5 data={b70847b87f29}] | [target=0x00007f29b70847b8]
         @0x00007f29ad14bdc2: 640e
relocInfo@0x00007f29ad14bdc2 [type=6(runtime_call) addr=0x00007f29ad14c1fa offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14bdc4: f803b721c9687f297006
relocInfo@0x00007f29ad14bdcc [type=7(external_word) addr=0x00007f29ad14c200 offset=6 data={b721c9687f29}] | [target=0x00007f29b721c968]
         @0x00007f29ad14bdce: 640e
relocInfo@0x00007f29ad14bdce [type=6(runtime_call) addr=0x00007f29ad14c20e offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14bdd0: f803b721c9687f297006
relocInfo@0x00007f29ad14bdd8 [type=7(external_word) addr=0x00007f29ad14c214 offset=6 data={b721c9687f29}] | [target=0x00007f29b721c968]
         @0x00007f29ad14bdda: 640e
relocInfo@0x00007f29ad14bdda [type=6(runtime_call) addr=0x00007f29ad14c222 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14bddc: f803b721c9687f297006
relocInfo@0x00007f29ad14bde4 [type=7(external_word) addr=0x00007f29ad14c228 offset=6 data={b721c9687f29}] | [target=0x00007f29b721c968]
         @0x00007f29ad14bde6: 640e
relocInfo@0x00007f29ad14bde6 [type=6(runtime_call) addr=0x00007f29ad14c236 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14bde8: f803b721c0787f297006
relocInfo@0x00007f29ad14bdf0 [type=7(external_word) addr=0x00007f29ad14c23c offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad14bdf2: 640e
relocInfo@0x00007f29ad14bdf2 [type=6(runtime_call) addr=0x00007f29ad14c24a offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14bdf4: f803b721c0787f297006
relocInfo@0x00007f29ad14bdfc [type=7(external_word) addr=0x00007f29ad14c250 offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad14bdfe: 640e
relocInfo@0x00007f29ad14bdfe [type=6(runtime_call) addr=0x00007f29ad14c25e offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14be00: f803b721c0787f297006
relocInfo@0x00007f29ad14be08 [type=7(external_word) addr=0x00007f29ad14c264 offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad14be0a: 640e
relocInfo@0x00007f29ad14be0a [type=6(runtime_call) addr=0x00007f29ad14c272 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14be0c: f803b721c0787f297006
relocInfo@0x00007f29ad14be14 [type=7(external_word) addr=0x00007f29ad14c278 offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad14be16: 640e
relocInfo@0x00007f29ad14be16 [type=6(runtime_call) addr=0x00007f29ad14c286 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14be18: f803b721c0787f297006
relocInfo@0x00007f29ad14be20 [type=7(external_word) addr=0x00007f29ad14c28c offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad14be22: 640e
relocInfo@0x00007f29ad14be22 [type=6(runtime_call) addr=0x00007f29ad14c29a offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14be24: 6419
relocInfo@0x00007f29ad14be24 [type=6(runtime_call) addr=0x00007f29ad14c2b3 offset=25 format=1] | [destination=0x00007f29ad116540]
         @0x00007f29ad14be26: f803b70847b87f297005
relocInfo@0x00007f29ad14be2e [type=7(external_word) addr=0x00007f29ad14c2b8 offset=5 data={b70847b87f29}] | [target=0x00007f29b70847b8]
         @0x00007f29ad14be30: 640e
relocInfo@0x00007f29ad14be30 [type=6(runtime_call) addr=0x00007f29ad14c2c6 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14be32: 641d
relocInfo@0x00007f29ad14be32 [type=6(runtime_call) addr=0x00007f29ad14c2e3 offset=29 format=1] | [destination=0x00007f29ad116540]
         @0x00007f29ad14be34: f803b70847b87f297005
relocInfo@0x00007f29ad14be3c [type=7(external_word) addr=0x00007f29ad14c2e8 offset=5 data={b70847b87f29}] | [target=0x00007f29b70847b8]
         @0x00007f29ad14be3e: 640e
relocInfo@0x00007f29ad14be3e [type=6(runtime_call) addr=0x00007f29ad14c2f6 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14be40: 641d
relocInfo@0x00007f29ad14be40 [type=6(runtime_call) addr=0x00007f29ad14c313 offset=29 format=1] | [destination=0x00007f29ad116540]
         @0x00007f29ad14be42: f803b70847b87f297005
relocInfo@0x00007f29ad14be4a [type=7(external_word) addr=0x00007f29ad14c318 offset=5 data={b70847b87f29}] | [target=0x00007f29b70847b8]
         @0x00007f29ad14be4c: 640e
relocInfo@0x00007f29ad14be4c [type=6(runtime_call) addr=0x00007f29ad14c326 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14be4e: f1f48006
relocInfo@0x00007f29ad14be50 [type=8(internal_word) addr=0x00007f29ad14c32c offset=6 data=500] | [target=0x00007f29ad14c138]
         @0x00007f29ad14be52: 6411
relocInfo@0x00007f29ad14be52 [type=6(runtime_call) addr=0x00007f29ad14c33d offset=17 format=1] | [destination=0x00007f29ad114d20]
         @0x00007f29ad14be54: 0023
relocInfo@0x00007f29ad14be54 [type=0(none) addr=0x00007f29ad14c360 offset=35]
         @0x00007f29ad14be56: 6400
relocInfo@0x00007f29ad14be56 [type=6(runtime_call) addr=0x00007f29ad14c360 offset=0 format=1] | [destination=0x00007f29ad05c9a0]
         @0x00007f29ad14be58: 640f
relocInfo@0x00007f29ad14be58 [type=6(runtime_call) addr=0x00007f29ad14c36f offset=15 format=1] | [destination=0x00007f29ad116a60]
         @0x00007f29ad14be5a: 0000
relocInfo@0x00007f29ad14be5a [type=0(none) addr=0x00007f29ad14c36f offset=0]
         @0x00007f29ad14be5c: 0000
relocInfo@0x00007f29ad14be5c [type=0(none) addr=0x00007f29ad14c36f offset=0]
         @0x00007f29ad14be5e: 0000
relocInfo@0x00007f29ad14be5e [type=0(none) addr=0x00007f29ad14c36f offset=0]
         @0x00007f29ad14be60: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 3 entries, 28 bytes):
{
   < 0x00007f29ad14bf00, 0x00007f29ad14c2fc > < 0x00007f29ad14bf04, 0x00007f29ad14c2cc > < 0x00007f29ad14bf08, 0x00007f29ad14c2cc > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x000000010110de48 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de48}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
#0: 0x0000000000000000 NULL-oop
#1: 0x0000000800040c30 {type array int}
#2: 0x00007f294f8116e8 {method} {0x00007f294f8116e8} 'micro_scalar' '([I[I[I)V' in 'App'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 101 ------------------------
{method}
 - this oop:          0x00007f294f8116e8
 - method holder:     'App'
 - constants:         0x00007f294f811090 constant pool [134]/operands[15] {0x00007f294f811090} for 'App' cache=0x00007f294fb00000
 - access:            0xc1000001  public 
 - name:              'micro_scalar'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        5
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007f29ad00e160
 - adapters:          AHE@0x00007f29b03b4280: 0xbbbb0000 i2c: 0x00007f29ad07f960 c2i: 0x00007f29ad07fa4c c2iUV: 0x00007f29ad07fa16 c2iNCI: 0x00007f29ad07fa89
 - compiled entry     0x00007f29ad07fa4c
 - code size:         30
 - code start:        0x00007f294f8116c0
 - code end (excl):   0x00007f294f8116de
 - method data:       0x00007f294f811db0
 - checked ex length: 0
 - linenumber start:  0x00007f294f8116de
 - localvar length:   0

------------------------ OptoAssembly for Compile_id = 101 -----------------------
#
#  void ( App:NotNull *, int[int:>=0]:exact *, int[int:>=0]:exact *, int[int:>=0]:exact * )
#
#r018 rsi:rsi   : parm 0: App:NotNull *
#r016 rdx:rdx   : parm 1: int[int:>=0]:exact *
#r010 rcx:rcx   : parm 2: int[int:>=0]:exact *
#r004 r8:r8   : parm 3: int[int:>=0]:exact *
# -- Old rsp -- Framesize: 64 --
#r583 rsp+60: in_preserve
#r582 rsp+56: return address
#r581 rsp+52: in_preserve
#r580 rsp+48: saved fp register
#r579 rsp+44: pad2, stack alignment
#r578 rsp+40: pad2, stack alignment
#r577 rsp+36: Fixed slot 1
#r576 rsp+32: Fixed slot 0
#r591 rsp+28: spill
#r590 rsp+24: spill
#r589 rsp+20: spill
#r588 rsp+16: spill
#r587 rsp+12: spill
#r586 rsp+ 8: spill
#r585 rsp+ 4: spill
#r584 rsp+ 0: spill
#
000     N339: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
000     movl    rscratch1, [j_rarg0 + oopDesc::klass_offset_in_bytes()]	# compressed klass
	decode_klass_not_null rscratch1, rscratch1
	cmpq    rax, rscratch1	 # Inline cache check
	jne     SharedRuntime::_ic_miss_stub
	nop	# nops to align entry point

        nop 	# 4 bytes pad for loops and calls

020     B1: #	out( B39 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
020     # stack bang (176 bytes)
	pushq   rbp	# Save rbp
	subq    rsp, #48	# Create frame

02c     movl    RBP, [RDX + #12 (8-bit)]	# range
02f     NullCheck RDX

02f     B2: #	out( B30 B3 ) <- in( B1 )  Freq: 0.999999
02f     testl   RBP, RBP	# unsigned
031     jbe,u   B30  P=0.000008 C=5331633.000000

037     B3: #	out( B31 B4 ) <- in( B2 )  Freq: 0.999991
037     movl    RBX, [RCX + #12 (8-bit)]	# range
03a     NullCheck RCX

03a     B4: #	out( B31 B5 ) <- in( B3 )  Freq: 0.99999
03a     testl   RBX, RBX	# unsigned
        nop 	# 4 bytes pad for loops and calls
040     jbe,u   B31  P=0.000001 C=-1.000000

046     B5: #	out( B31 B6 ) <- in( B4 )  Freq: 0.999988
046     movl    R13, RBP	# spill
049     decl    R13	# int
04c     cmpl    R13, RBX	# unsigned
04f     jnb,u   B31  P=0.000001 C=-1.000000

055     B6: #	out( B31 B7 ) <- in( B5 )  Freq: 0.999987
055     movl    R9, [R8 + #12 (8-bit)]	# range
059     NullCheck R8

059     B7: #	out( B31 B8 ) <- in( B6 )  Freq: 0.999986
059     testl   R9, R9	# unsigned
        nop 	# 4 bytes pad for loops and calls
060     jbe,u   B31  P=0.000001 C=-1.000000

066     B8: #	out( B31 B9 ) <- in( B7 )  Freq: 0.999985
066     cmpl    R13, R9	# unsigned
069     jnb,u   B31  P=0.000001 C=-1.000000

06f     B9: #	out( B31 B10 ) <- in( B8 )  Freq: 0.999984
06f     cmpl    R13, RBP	# unsigned
072     jnb,u   B31  P=0.000001 C=-1.000000

078     B10: #	out( B11 ) <- in( B9 )  Freq: 0.999983
078     movl    R11, RDX	# ptr -> int
07b     shrl    R11, #2
07f     andl    R11, #3	# int
083     movl    R10, #-1	# int
089     subl    R10, R11	# int
08c     andl    R10, #3	# int
090     incl    R10	# int
093     cmpl    R10, RBP
096     cmovlgt R10, RBP	# min
09a     xorl    RSI, RSI	# int
09c     xorl    RDI, RDI	# int

09e     B11: #	out( B11 B12 ) <- in( B10 B11 ) Loop( B11-B11 inner pre of N234) Freq: 1.99997
09e     movl    R11, [R8 + #16 + RDI << #2]	# int
0a3     addl    R11, [RCX + #16 + RDI << #2]	# int
0a8     movl    [RDX + #16 + RDI << #2], R11	# int
0ad     incl    RDI	# int
0af     cmpl    RDI, R10
0b2     jl,s   B11	# loop end  P=0.500000 C=5331587.000000

0b4     B12: #	out( B27 B13 ) <- in( B11 )  Freq: 0.999983
0b4     movl    R10, RBP	# spill
0b7     addl    R10, #-15	# int
0bb     movl    RAX, #-2147483648	# int
0c0     cmpl    R13, R10
0c3     cmovll R10, RAX	# signed, int
0c7     cmpl    RDI, R10
0ca     jge     B27  P=0.000001 C=-1.000000

0d0     B13: #	out( B32 B14 ) <- in( B12 )  Freq: 0.999982
0d0     # castII of RDI
0d0     cmpl    RDI, RBP	# unsigned
0d2     jnb,u   B32  P=0.000001 C=-1.000000

0d8     B14: #	out( B33 B15 ) <- in( B13 )  Freq: 0.999981
0d8     cmpl    RDI, R9	# unsigned
        nop 	# 5 bytes pad for loops and calls
0e0     jnb,u   B33  P=0.000001 C=-1.000000

0e6     B15: #	out( B34 B16 ) <- in( B14 )  Freq: 0.99998
0e6     cmpl    RDI, RBX	# unsigned
0e8     jnb,u   B34  P=0.000001 C=-1.000000

0ee     B16: #	out( B35 B17 ) <- in( B15 )  Freq: 0.999979
0ee     movl    R11, RDI	# spill
0f1     addl    R11, #15	# int
0f5     cmpl    R11, RBX	# unsigned
0f8     jnb,u   B35  P=0.000001 C=-1.000000

0fe     B17: #	out( B36 B18 ) <- in( B16 )  Freq: 0.999978
        nop 	# 2 bytes pad for loops and calls
100     cmpl    R11, R9	# unsigned
103     jnb,u   B36  P=0.000001 C=-1.000000

109     B18: #	out( B37 B19 ) <- in( B17 )  Freq: 0.999977
109     cmpl    RDI, RBP	# unsigned
10b     jnb,u   B37  P=0.000001 C=-1.000000

111     B19: #	out( B38 B20 ) <- in( B18 )  Freq: 0.999976
111     cmpl    R11, RBP	# unsigned
114     jnb,u   B38  P=0.000001 C=-1.000000

11a     B20: #	out( B21 ) <- in( B19 )  Freq: 0.999975
11a     movl    RBX, #16000	# int
11f     # TLS is in R15

11f     B21: #	out( B22 ) <- in( B20 B23 ) Loop( B21-B23 ) Freq: 118146
11f     movl    R9, R10	# spill
122     subl    R9, RDI	# int
125     cmpl    R10, RDI
128     cmovll R9, RSI	# signed, int
12c     cmpl    R9, #16000	# unsigned
133     cmovlnbe R9, RBX	# unsigned, int
137     addl    R9, RDI	# int
        nop 	# 6 bytes pad for loops and calls

140     B22: #	out( B22 B23 ) <- in( B21 B22 ) Loop( B22-B22 inner main of N159 strip mined) Freq: 1.39589e+10
140     load_vector XMM0,[R8 + #16 + RDI << #2]
147     load_vector XMM1,[RCX + #16 + RDI << #2]
14d     paddd   XMM1,XMM0	! add packedI
151     store_vector [RDX + #16 + RDI << #2],XMM1
	
157     movslq  R11, RDI	# i2l
15a     load_vector XMM0,[RCX + #32 + R11 << #2]
161     load_vector XMM1,[R8 + #32 + R11 << #2]
168     paddd   XMM0,XMM1	! add packedI
16c     store_vector [RDX + #32 + R11 << #2],XMM0
	
173     load_vector XMM0,[RCX + #48 + R11 << #2]
17a     load_vector XMM1,[R8 + #48 + R11 << #2]
181     paddd   XMM0,XMM1	! add packedI
185     store_vector [RDX + #48 + R11 << #2],XMM0
	
18c     load_vector XMM0,[RCX + #64 + R11 << #2]
193     load_vector XMM1,[R8 + #64 + R11 << #2]
19a     paddd   XMM0,XMM1	! add packedI
19e     store_vector [RDX + #64 + R11 << #2],XMM0
	
1a5     addl    RDI, #16	# int
1a8     cmpl    RDI, R9
1ab     jl,s   B22	# loop end  P=0.999992 C=5331587.000000

1ad     B23: #	out( B21 B24 ) <- in( B22 )  Freq: 118146
1ad     movq    R11, [R15 + #304 (32-bit)]	# ptr
1b4     testl   rax, [R11]	# Safepoint: poll for GC        # App::micro_scalar @ bci:26 (line 9) L[0]=_ L[1]=RDX L[2]=RCX L[3]=R8 L[4]=RDI
        # OopMap {r8=Oop rcx=Oop rdx=Oop off=436/0x1b4}
1b7     cmpl    RDI, R10
        nop 	# 6 bytes pad for loops and calls
1c0     jl     B21  P=0.999992 C=5331587.000000

1c6     B24: #	out( B27 B25 ) <- in( B23 )  Freq: 0.999975
1c6     movl    R10, RBP	# spill
1c9     addl    R10, #-3	# int
1cd     cmpl    R13, R10
1d0     cmovll R10, RAX	# signed, int
1d4     cmpl    RDI, R10
1d7     jge,s   B27  P=0.500000 C=-1.000000

1d9     B25: #	out( B26 ) <- in( B24 )  Freq: 0.499988
1d9     # castII of RDI
        nop 	# 3 bytes pad for loops and calls

1dc     B26: #	out( B26 B27 ) <- in( B25 B26 ) Loop( B26-B26 inner post of N733) Freq: 0.999975
1dc     load_vector XMM0,[R8 + #16 + RDI << #2]
1e3     load_vector XMM1,[RCX + #16 + RDI << #2]
1e9     paddd   XMM1,XMM0	! add packedI
1ed     store_vector [RDX + #16 + RDI << #2],XMM1
	
1f3     addl    RDI, #4	# int
1f6     cmpl    RDI, R10
1f9     jl,s   B26	# loop end  P=0.500000 C=5331587.000000

1fb     B27: #	out( B30 B28 ) <- in( B12 B26 B24 )  Freq: 0.999976
1fb     cmpl    RDI, RBP
1fd     jge,s   B30  P=0.500000 C=-1.000000

1ff     B28: #	out( B29 ) <- in( B27 )  Freq: 0.499988
1ff     # castII of RDI
        nop 	# 1 bytes pad for loops and calls

200     B29: #	out( B29 B30 ) <- in( B28 B29 ) Loop( B29-B29 inner post of N234) Freq: 0.999976
200     movl    R11, [R8 + #16 + RDI << #2]	# int
205     addl    R11, [RCX + #16 + RDI << #2]	# int
20a     movl    [RDX + #16 + RDI << #2], R11	# int
20f     incl    RDI	# int
211     cmpl    RDI, RBP
213     jl,s   B29	# loop end  P=0.500000 C=5331587.000000

215     B30: #	out( N339 ) <- in( B29 B27 B2 )  Freq: 0.999985
215     addq    rsp, 48	# Destroy frame
	popq    rbp
	cmpq     rsp, poll_offset[r15_thread] 
	ja       #safepoint_stub	# Safepoint: poll for GC

227     ret

228     B31: #	out( N339 ) <- in( B7 B3 B4 B5 B8 B9 B6 )  Freq: 7.06631e-06
228     movl    RSI, #-138	# int
22d     movq    [rsp + #0], RDX	# spill
231     movq    [rsp + #8], RCX	# spill
236     movq    [rsp + #16], R8	# spill
23b     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_scalar @ bci:7 (line 9) L[0]=_ L[1]=rsp + #0 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=#0 STK[0]=#0 STK[1]=RBP
        # OopMap {[0]=Oop [8]=Oop [16]=Oop off=576/0x240}
240     stop	# ShouldNotReachHere

254     B32: #	out( N339 ) <- in( B13 )  Freq: 1.01326e-06
254     stop	# ShouldNotReachHere

268     B33: #	out( N339 ) <- in( B14 )  Freq: 1.01326e-06
268     stop	# ShouldNotReachHere

27c     B34: #	out( N339 ) <- in( B15 )  Freq: 1.01326e-06
27c     stop	# ShouldNotReachHere

290     B35: #	out( N339 ) <- in( B16 )  Freq: 1.01326e-06
290     stop	# ShouldNotReachHere

2a4     B36: #	out( N339 ) <- in( B17 )  Freq: 1.01326e-06
2a4     stop	# ShouldNotReachHere

2b8     B37: #	out( N339 ) <- in( B18 )  Freq: 1.01326e-06
2b8     stop	# ShouldNotReachHere

2cc     B38: #	out( N339 ) <- in( B19 )  Freq: 1.01325e-06
2cc     stop	# ShouldNotReachHere

2e0     B39: #	out( N339 ) <- in( B1 )  Freq: 1.01328e-06
2e0     movl    RSI, #-10	# int
        nop 	# 2 bytes pad for loops and calls
2e7     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_scalar @ bci:6 (line 9) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ STK[0]=_ STK[1]=#NULL
        # OopMap {off=748/0x2ec}
2ec     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    1676  101             App::micro_scalar (30 bytes)
 total in heap  [0x00007f29ad14c710,0x00007f29ad14ced8] = 1992
 relocation     [0x00007f29ad14c888,0x00007f29ad14c910] = 136
 main code      [0x00007f29ad14c920,0x00007f29ad14cc40] = 800
 stub code      [0x00007f29ad14cc40,0x00007f29ad14cc58] = 24
 oops           [0x00007f29ad14cc58,0x00007f29ad14cc60] = 8
 metadata       [0x00007f29ad14cc60,0x00007f29ad14cc68] = 8
 scopes data    [0x00007f29ad14cc68,0x00007f29ad14cce0] = 120
 scopes pcs     [0x00007f29ad14cce0,0x00007f29ad14ceb0] = 464
 dependencies   [0x00007f29ad14ceb0,0x00007f29ad14ceb8] = 8
 nul chk table  [0x00007f29ad14ceb8,0x00007f29ad14ced8] = 32

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Entry Point]
  # {method} {0x00007f294f8116e8} 'micro_scalar' '([I[I[I)V' in 'App'
  # this:     rsi:rsi   = 'App'
  # parm0:    rdx:rdx   = '[I'
  # parm1:    rcx:rcx   = '[I'
  # parm2:    r8:r8     = '[I'
  #           [sp+0x40]  (sp of caller)
 ;; N339: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f29ad14c920:   mov    0x8(%rsi),%r10d
  0x00007f29ad14c924:   movabs $0x800000000,%r11
  0x00007f29ad14c92e:   add    %r11,%r10
  0x00007f29ad14c931:   cmp    %r10,%rax
  0x00007f29ad14c934:   jne    0x00007f29ad115920           ;   {runtime_call ic_miss_stub}
  0x00007f29ad14c93a:   nop
  0x00007f29ad14c93b:   nop
  0x00007f29ad14c93c:   nop
  0x00007f29ad14c93d:   nop
  0x00007f29ad14c93e:   nop
  0x00007f29ad14c93f:   nop
[Verified Entry Point]
 ;; B1: #	out( B39 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f29ad14c940:   mov    %eax,-0x16000(%rsp)
  0x00007f29ad14c947:   push   %rbp
  0x00007f29ad14c948:   sub    $0x30,%rsp                   ;*synchronization entry
                                                            ; - App::micro_scalar@-1 (line 8)
  0x00007f29ad14c94c:   mov    0xc(%rdx),%ebp               ; implicit exception: dispatches to 0x00007f29ad14cc00
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@6 (line 9)
 ;; B2: #	out( B30 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007f29ad14c94f:   test   %ebp,%ebp
  0x00007f29ad14c951:   jbe    0x00007f29ad14cb35           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B3: #	out( B31 B4 ) <- in( B2 )  Freq: 0.999991
  0x00007f29ad14c957:   mov    0xc(%rcx),%ebx               ; implicit exception: dispatches to 0x00007f29ad14cb48
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
 ;; B4: #	out( B31 B5 ) <- in( B3 )  Freq: 0.99999
  0x00007f29ad14c95a:   test   %ebx,%ebx
  0x00007f29ad14c95c:   nop
  0x00007f29ad14c95d:   nop
  0x00007f29ad14c95e:   nop
  0x00007f29ad14c95f:   nop
  0x00007f29ad14c960:   jbe    0x00007f29ad14cb48
 ;; B5: #	out( B31 B6 ) <- in( B4 )  Freq: 0.999988
  0x00007f29ad14c966:   mov    %ebp,%r13d
  0x00007f29ad14c969:   dec    %r13d
  0x00007f29ad14c96c:   cmp    %ebx,%r13d
  0x00007f29ad14c96f:   jae    0x00007f29ad14cb48
 ;; B6: #	out( B31 B7 ) <- in( B5 )  Freq: 0.999987
  0x00007f29ad14c975:   mov    0xc(%r8),%r9d                ; implicit exception: dispatches to 0x00007f29ad14cb48
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
 ;; B7: #	out( B31 B8 ) <- in( B6 )  Freq: 0.999986
  0x00007f29ad14c979:   test   %r9d,%r9d
  0x00007f29ad14c97c:   nop
  0x00007f29ad14c97d:   nop
  0x00007f29ad14c97e:   nop
  0x00007f29ad14c97f:   nop
  0x00007f29ad14c980:   jbe    0x00007f29ad14cb48
 ;; B8: #	out( B31 B9 ) <- in( B7 )  Freq: 0.999985
  0x00007f29ad14c986:   cmp    %r9d,%r13d
  0x00007f29ad14c989:   jae    0x00007f29ad14cb48
 ;; B9: #	out( B31 B10 ) <- in( B8 )  Freq: 0.999984
  0x00007f29ad14c98f:   cmp    %ebp,%r13d
  0x00007f29ad14c992:   jae    0x00007f29ad14cb48
 ;; B10: #	out( B11 ) <- in( B9 )  Freq: 0.999983
  0x00007f29ad14c998:   mov    %edx,%r11d
  0x00007f29ad14c99b:   shr    $0x2,%r11d
  0x00007f29ad14c99f:   and    $0x3,%r11d
  0x00007f29ad14c9a3:   mov    $0xffffffff,%r10d
  0x00007f29ad14c9a9:   sub    %r11d,%r10d
  0x00007f29ad14c9ac:   and    $0x3,%r10d
  0x00007f29ad14c9b0:   inc    %r10d
  0x00007f29ad14c9b3:   cmp    %ebp,%r10d
  0x00007f29ad14c9b6:   cmovg  %ebp,%r10d
  0x00007f29ad14c9ba:   xor    %esi,%esi
  0x00007f29ad14c9bc:   xor    %edi,%edi                    ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 10)
 ;; B11: #	out( B11 B12 ) <- in( B10 B11 ) Loop( B11-B11 inner pre of N234) Freq: 1.99997
  0x00007f29ad14c9be:   mov    0x10(%r8,%rdi,4),%r11d
  0x00007f29ad14c9c3:   add    0x10(%rcx,%rdi,4),%r11d
  0x00007f29ad14c9c8:   mov    %r11d,0x10(%rdx,%rdi,4)      ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f29ad14c9cd:   inc    %edi                         ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f29ad14c9cf:   cmp    %r10d,%edi
  0x00007f29ad14c9d2:   jl     0x00007f29ad14c9be           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B12: #	out( B27 B13 ) <- in( B11 )  Freq: 0.999983
  0x00007f29ad14c9d4:   mov    %ebp,%r10d
  0x00007f29ad14c9d7:   add    $0xfffffff1,%r10d
  0x00007f29ad14c9db:   mov    $0x80000000,%eax
  0x00007f29ad14c9e0:   cmp    %r10d,%r13d
  0x00007f29ad14c9e3:   cmovl  %eax,%r10d
  0x00007f29ad14c9e7:   cmp    %r10d,%edi
  0x00007f29ad14c9ea:   jge    0x00007f29ad14cb1b
 ;; B13: #	out( B32 B14 ) <- in( B12 )  Freq: 0.999982
  0x00007f29ad14c9f0:   cmp    %ebp,%edi
  0x00007f29ad14c9f2:   jae    0x00007f29ad14cb74
 ;; B14: #	out( B33 B15 ) <- in( B13 )  Freq: 0.999981
  0x00007f29ad14c9f8:   cmp    %r9d,%edi
  0x00007f29ad14c9fb:   nop
  0x00007f29ad14c9fc:   nop
  0x00007f29ad14c9fd:   nop
  0x00007f29ad14c9fe:   nop
  0x00007f29ad14c9ff:   nop
  0x00007f29ad14ca00:   jae    0x00007f29ad14cb88
 ;; B15: #	out( B34 B16 ) <- in( B14 )  Freq: 0.99998
  0x00007f29ad14ca06:   cmp    %ebx,%edi
  0x00007f29ad14ca08:   jae    0x00007f29ad14cb9c
 ;; B16: #	out( B35 B17 ) <- in( B15 )  Freq: 0.999979
  0x00007f29ad14ca0e:   mov    %edi,%r11d
  0x00007f29ad14ca11:   add    $0xf,%r11d
  0x00007f29ad14ca15:   cmp    %ebx,%r11d
  0x00007f29ad14ca18:   jae    0x00007f29ad14cbb0
 ;; B17: #	out( B36 B18 ) <- in( B16 )  Freq: 0.999978
  0x00007f29ad14ca1e:   nop
  0x00007f29ad14ca1f:   nop
  0x00007f29ad14ca20:   cmp    %r9d,%r11d
  0x00007f29ad14ca23:   jae    0x00007f29ad14cbc4
 ;; B18: #	out( B37 B19 ) <- in( B17 )  Freq: 0.999977
  0x00007f29ad14ca29:   cmp    %ebp,%edi
  0x00007f29ad14ca2b:   jae    0x00007f29ad14cbd8
 ;; B19: #	out( B38 B20 ) <- in( B18 )  Freq: 0.999976
  0x00007f29ad14ca31:   cmp    %ebp,%r11d
  0x00007f29ad14ca34:   jae    0x00007f29ad14cbec
 ;; B20: #	out( B21 ) <- in( B19 )  Freq: 0.999975
  0x00007f29ad14ca3a:   mov    $0x3e80,%ebx
 ;; B21: #	out( B22 ) <- in( B20 B23 ) Loop( B21-B23 ) Freq: 118146
  0x00007f29ad14ca3f:   mov    %r10d,%r9d
  0x00007f29ad14ca42:   sub    %edi,%r9d
  0x00007f29ad14ca45:   cmp    %edi,%r10d
  0x00007f29ad14ca48:   cmovl  %esi,%r9d
  0x00007f29ad14ca4c:   cmp    $0x3e80,%r9d
  0x00007f29ad14ca53:   cmova  %ebx,%r9d
  0x00007f29ad14ca57:   add    %edi,%r9d
  0x00007f29ad14ca5a:   nop
  0x00007f29ad14ca5b:   nop
  0x00007f29ad14ca5c:   nop
  0x00007f29ad14ca5d:   nop
  0x00007f29ad14ca5e:   nop
  0x00007f29ad14ca5f:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 10)
 ;; B22: #	out( B22 B23 ) <- in( B21 B22 ) Loop( B22-B22 inner main of N159 strip mined) Freq: 1.39589e+10
  0x00007f29ad14ca60:   movdqu 0x10(%r8,%rdi,4),%xmm0
  0x00007f29ad14ca67:   movdqu 0x10(%rcx,%rdi,4),%xmm1
  0x00007f29ad14ca6d:   paddd  %xmm0,%xmm1
  0x00007f29ad14ca71:   movdqu %xmm1,0x10(%rdx,%rdi,4)
  0x00007f29ad14ca77:   movslq %edi,%r11
  0x00007f29ad14ca7a:   movdqu 0x20(%rcx,%r11,4),%xmm0
  0x00007f29ad14ca81:   movdqu 0x20(%r8,%r11,4),%xmm1
  0x00007f29ad14ca88:   paddd  %xmm1,%xmm0
  0x00007f29ad14ca8c:   movdqu %xmm0,0x20(%rdx,%r11,4)
  0x00007f29ad14ca93:   movdqu 0x30(%rcx,%r11,4),%xmm0
  0x00007f29ad14ca9a:   movdqu 0x30(%r8,%r11,4),%xmm1
  0x00007f29ad14caa1:   paddd  %xmm1,%xmm0
  0x00007f29ad14caa5:   movdqu %xmm0,0x30(%rdx,%r11,4)
  0x00007f29ad14caac:   movdqu 0x40(%rcx,%r11,4),%xmm0
  0x00007f29ad14cab3:   movdqu 0x40(%r8,%r11,4),%xmm1
  0x00007f29ad14caba:   paddd  %xmm1,%xmm0
  0x00007f29ad14cabe:   movdqu %xmm0,0x40(%rdx,%r11,4)      ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f29ad14cac5:   add    $0x10,%edi                   ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f29ad14cac8:   cmp    %r9d,%edi
  0x00007f29ad14cacb:   jl     0x00007f29ad14ca60           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
 ;; B23: #	out( B21 B24 ) <- in( B22 )  Freq: 118146
  0x00007f29ad14cacd:   mov    0x130(%r15),%r11             ; ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@26 (line 9)
  0x00007f29ad14cad4:   test   %eax,(%r11)                  ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
                                                            ;   {poll}
  0x00007f29ad14cad7:   cmp    %r10d,%edi
  0x00007f29ad14cada:   nop
  0x00007f29ad14cadb:   nop
  0x00007f29ad14cadc:   nop
  0x00007f29ad14cadd:   nop
  0x00007f29ad14cade:   nop
  0x00007f29ad14cadf:   nop
  0x00007f29ad14cae0:   jl     0x00007f29ad14ca3f
 ;; B24: #	out( B27 B25 ) <- in( B23 )  Freq: 0.999975
  0x00007f29ad14cae6:   mov    %ebp,%r10d
  0x00007f29ad14cae9:   add    $0xfffffffd,%r10d
  0x00007f29ad14caed:   cmp    %r10d,%r13d
  0x00007f29ad14caf0:   cmovl  %eax,%r10d
  0x00007f29ad14caf4:   cmp    %r10d,%edi
  0x00007f29ad14caf7:   jge    0x00007f29ad14cb1b
 ;; B25: #	out( B26 ) <- in( B24 )  Freq: 0.499988
  0x00007f29ad14caf9:   nop
  0x00007f29ad14cafa:   nop
  0x00007f29ad14cafb:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 10)
 ;; B26: #	out( B26 B27 ) <- in( B25 B26 ) Loop( B26-B26 inner post of N733) Freq: 0.999975
  0x00007f29ad14cafc:   movdqu 0x10(%r8,%rdi,4),%xmm0
  0x00007f29ad14cb03:   movdqu 0x10(%rcx,%rdi,4),%xmm1
  0x00007f29ad14cb09:   paddd  %xmm0,%xmm1
  0x00007f29ad14cb0d:   movdqu %xmm1,0x10(%rdx,%rdi,4)      ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f29ad14cb13:   add    $0x4,%edi                    ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f29ad14cb16:   cmp    %r10d,%edi
  0x00007f29ad14cb19:   jl     0x00007f29ad14cafc           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B27: #	out( B30 B28 ) <- in( B12 B26 B24 )  Freq: 0.999976
  0x00007f29ad14cb1b:   cmp    %ebp,%edi
  0x00007f29ad14cb1d:   jge    0x00007f29ad14cb35
 ;; B28: #	out( B29 ) <- in( B27 )  Freq: 0.499988
  0x00007f29ad14cb1f:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 10)
 ;; B29: #	out( B29 B30 ) <- in( B28 B29 ) Loop( B29-B29 inner post of N234) Freq: 0.999976
  0x00007f29ad14cb20:   mov    0x10(%r8,%rdi,4),%r11d
  0x00007f29ad14cb25:   add    0x10(%rcx,%rdi,4),%r11d
  0x00007f29ad14cb2a:   mov    %r11d,0x10(%rdx,%rdi,4)      ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f29ad14cb2f:   inc    %edi                         ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f29ad14cb31:   cmp    %ebp,%edi
  0x00007f29ad14cb33:   jl     0x00007f29ad14cb20
 ;; B30: #	out( N339 ) <- in( B29 B27 B2 )  Freq: 0.999985
  0x00007f29ad14cb35:   add    $0x30,%rsp
  0x00007f29ad14cb39:   pop    %rbp
  0x00007f29ad14cb3a:   cmp    0x128(%r15),%rsp             ;   {poll_return}
  0x00007f29ad14cb41:   ja     0x00007f29ad14cc20
  0x00007f29ad14cb47:   retq                                ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B31: #	out( N339 ) <- in( B7 B3 B4 B5 B8 B9 B6 )  Freq: 7.06631e-06
  0x00007f29ad14cb48:   mov    $0xffffff76,%esi
  0x00007f29ad14cb4d:   mov    %rdx,(%rsp)
  0x00007f29ad14cb51:   mov    %rcx,0x8(%rsp)
  0x00007f29ad14cb56:   mov    %r8,0x10(%rsp)
  0x00007f29ad14cb5b:   callq  0x00007f29ad116540           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@7 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f29ad14cb60:   movabs $0x7f29b70847b8,%rdi         ;   {external_word}
  0x00007f29ad14cb6a:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14cb6e:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14cb73:   hlt                                 ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B32: #	out( N339 ) <- in( B13 )  Freq: 1.01326e-06
  0x00007f29ad14cb74:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad14cb7e:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14cb82:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14cb87:   hlt    
 ;; B33: #	out( N339 ) <- in( B14 )  Freq: 1.01326e-06
  0x00007f29ad14cb88:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad14cb92:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14cb96:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14cb9b:   hlt    
 ;; B34: #	out( N339 ) <- in( B15 )  Freq: 1.01326e-06
  0x00007f29ad14cb9c:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad14cba6:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14cbaa:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14cbaf:   hlt    
 ;; B35: #	out( N339 ) <- in( B16 )  Freq: 1.01326e-06
  0x00007f29ad14cbb0:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad14cbba:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14cbbe:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14cbc3:   hlt    
 ;; B36: #	out( N339 ) <- in( B17 )  Freq: 1.01326e-06
  0x00007f29ad14cbc4:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad14cbce:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14cbd2:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14cbd7:   hlt    
 ;; B37: #	out( N339 ) <- in( B18 )  Freq: 1.01326e-06
  0x00007f29ad14cbd8:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad14cbe2:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14cbe6:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14cbeb:   hlt    
 ;; B38: #	out( N339 ) <- in( B19 )  Freq: 1.01325e-06
  0x00007f29ad14cbec:   movabs $0x7f29b721c078,%rdi         ;   {external_word}
  0x00007f29ad14cbf6:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14cbfa:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14cbff:   hlt    
 ;; B39: #	out( N339 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007f29ad14cc00:   mov    $0xfffffff6,%esi
  0x00007f29ad14cc05:   nop
  0x00007f29ad14cc06:   nop
  0x00007f29ad14cc07:   callq  0x00007f29ad116540           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@6 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f29ad14cc0c:   movabs $0x7f29b70847b8,%rdi         ;   {external_word}
  0x00007f29ad14cc16:   and    $0xfffffffffffffff0,%rsp
  0x00007f29ad14cc1a:   callq  0x00007f29b6849ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f29ad14cc1f:   hlt                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 10)
  0x00007f29ad14cc20:   movabs $0x7f29ad14cb3a,%r10         ;   {internal_word}
  0x00007f29ad14cc2a:   mov    %r10,0x3e8(%r15)
  0x00007f29ad14cc31:   jmpq   0x00007f29ad114d20           ;   {runtime_call SafepointBlob}
  0x00007f29ad14cc36:   hlt    
  0x00007f29ad14cc37:   hlt    
  0x00007f29ad14cc38:   hlt    
  0x00007f29ad14cc39:   hlt    
  0x00007f29ad14cc3a:   hlt    
  0x00007f29ad14cc3b:   hlt    
  0x00007f29ad14cc3c:   hlt    
  0x00007f29ad14cc3d:   hlt    
  0x00007f29ad14cc3e:   hlt    
  0x00007f29ad14cc3f:   hlt    
[Exception Handler]
  0x00007f29ad14cc40:   jmpq   0x00007f29ad05c9a0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f29ad14cc45:   callq  0x00007f29ad14cc4a
  0x00007f29ad14cc4a:   subq   $0x5,(%rsp)
  0x00007f29ad14cc4f:   jmpq   0x00007f29ad116a60           ;   {runtime_call DeoptimizationBlob}
  0x00007f29ad14cc54:   hlt    
  0x00007f29ad14cc55:   hlt    
  0x00007f29ad14cc56:   hlt    
  0x00007f29ad14cc57:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007f29ad14cc58:   0x000000010110de48 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de48}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007f29ad14cc60:   0x00007f294f8116e8 {method} {0x00007f294f8116e8} 'micro_scalar' '([I[I[I)V' in 'App'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007f29ad14c91f offset=ffffffff bits=0):
PcDesc(pc=0x00007f29ad14c94c offset=2c bits=0):   App::micro_scalar@-1 (line 8)
PcDesc(pc=0x00007f29ad14c94f offset=2f bits=0):   App::micro_scalar@6 (line 9)
PcDesc(pc=0x00007f29ad14c957 offset=37 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007f29ad14c95a offset=3a bits=0):   App::micro_scalar@16 (line 10)
PcDesc(pc=0x00007f29ad14c979 offset=59 bits=0):   App::micro_scalar@20 (line 10)
PcDesc(pc=0x00007f29ad14c9be offset=9e bits=0):   App::micro_scalar@10 (line 10)
PcDesc(pc=0x00007f29ad14c9cd offset=ad bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad14c9cf offset=af bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007f29ad14c9d4 offset=b4 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007f29ad14ca60 offset=140 bits=0):   App::micro_scalar@10 (line 10)
PcDesc(pc=0x00007f29ad14cac5 offset=1a5 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad14cac8 offset=1a8 bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007f29ad14cacd offset=1ad bits=0):   App::micro_scalar@26 (line 9)
PcDesc(pc=0x00007f29ad14cad4 offset=1b4 bits=1):   App::micro_scalar@26 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rdi [14],int
PcDesc(pc=0x00007f29ad14cad7 offset=1b7 bits=0):   App::micro_scalar@26 (line 9)
PcDesc(pc=0x00007f29ad14cafc offset=1dc bits=0):   App::micro_scalar@10 (line 10)
PcDesc(pc=0x00007f29ad14cb13 offset=1f3 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad14cb16 offset=1f6 bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007f29ad14cb1b offset=1fb bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007f29ad14cb20 offset=200 bits=0):   App::micro_scalar@10 (line 10)
PcDesc(pc=0x00007f29ad14cb2f offset=20f bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007f29ad14cb31 offset=211 bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007f29ad14cb48 offset=228 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007f29ad14cb60 offset=240 bits=1):   App::micro_scalar@7 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: 0
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
PcDesc(pc=0x00007f29ad14cb74 offset=254 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007f29ad14cc0c offset=2ec bits=0):   App::micro_scalar@6 (line 9)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: empty
    - @1: NULL
PcDesc(pc=0x00007f29ad14cc20 offset=300 bits=0):   App::micro_scalar@10 (line 10)
PcDesc(pc=0x00007f29ad14cc59 offset=339 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 3 OopMaps

ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop } pc offsets: 436 
ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop } pc offsets: 576 
ImmutableOopMap {} pc offsets: 748 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007f29ad14c94c offset=2c):
   App::micro_scalar@-1 (line 8)
ScopeDesc(pc=0x00007f29ad14c94f offset=2f):
   App::micro_scalar@6 (line 9)
ScopeDesc(pc=0x00007f29ad14c957 offset=37):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007f29ad14c95a offset=3a):
   App::micro_scalar@16 (line 10)
ScopeDesc(pc=0x00007f29ad14c979 offset=59):
   App::micro_scalar@20 (line 10)
ScopeDesc(pc=0x00007f29ad14c9be offset=9e):
   App::micro_scalar@10 (line 10)
ScopeDesc(pc=0x00007f29ad14c9cd offset=ad):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad14c9cf offset=af):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007f29ad14c9d4 offset=b4):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007f29ad14ca60 offset=140):
   App::micro_scalar@10 (line 10)
ScopeDesc(pc=0x00007f29ad14cac5 offset=1a5):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad14cac8 offset=1a8):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007f29ad14cacd offset=1ad):
   App::micro_scalar@26 (line 9)
ScopeDesc(pc=0x00007f29ad14cad4 offset=1b4):
   App::micro_scalar@26 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rdi [14],int
ScopeDesc(pc=0x00007f29ad14cad7 offset=1b7):
   App::micro_scalar@26 (line 9)
ScopeDesc(pc=0x00007f29ad14cafc offset=1dc):
   App::micro_scalar@10 (line 10)
ScopeDesc(pc=0x00007f29ad14cb13 offset=1f3):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad14cb16 offset=1f6):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007f29ad14cb1b offset=1fb):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007f29ad14cb20 offset=200):
   App::micro_scalar@10 (line 10)
ScopeDesc(pc=0x00007f29ad14cb2f offset=20f):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007f29ad14cb31 offset=211):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007f29ad14cb48 offset=228):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007f29ad14cb60 offset=240):
   App::micro_scalar@7 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: 0
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
ScopeDesc(pc=0x00007f29ad14cb74 offset=254):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007f29ad14cc0c offset=2ec):
   App::micro_scalar@6 (line 9)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: empty
    - @1: NULL
ScopeDesc(pc=0x00007f29ad14cc20 offset=300):
   App::micro_scalar@10 (line 10)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007f29ad14c888: 6014
relocInfo@0x00007f29ad14c888 [type=6(runtime_call) addr=0x00007f29ad14c934 offset=20] | [destination=0x00007f29ad115920]
         @0x00007f29ad14c88a: a1a0
relocInfo@0x00007f29ad14c88a [type=10(poll) addr=0x00007f29ad14cad4 offset=416]
         @0x00007f29ad14c88c: b066
relocInfo@0x00007f29ad14c88c [type=11(poll_return) addr=0x00007f29ad14cb3a offset=102]
         @0x00007f29ad14c88e: 6421
relocInfo@0x00007f29ad14c88e [type=6(runtime_call) addr=0x00007f29ad14cb5b offset=33 format=1] | [destination=0x00007f29ad116540]
         @0x00007f29ad14c890: f803b70847b87f297005
relocInfo@0x00007f29ad14c898 [type=7(external_word) addr=0x00007f29ad14cb60 offset=5 data={b70847b87f29}] | [target=0x00007f29b70847b8]
         @0x00007f29ad14c89a: 640e
relocInfo@0x00007f29ad14c89a [type=6(runtime_call) addr=0x00007f29ad14cb6e offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14c89c: f803b721c0787f297006
relocInfo@0x00007f29ad14c8a4 [type=7(external_word) addr=0x00007f29ad14cb74 offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad14c8a6: 640e
relocInfo@0x00007f29ad14c8a6 [type=6(runtime_call) addr=0x00007f29ad14cb82 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14c8a8: f803b721c0787f297006
relocInfo@0x00007f29ad14c8b0 [type=7(external_word) addr=0x00007f29ad14cb88 offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad14c8b2: 640e
relocInfo@0x00007f29ad14c8b2 [type=6(runtime_call) addr=0x00007f29ad14cb96 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14c8b4: f803b721c0787f297006
relocInfo@0x00007f29ad14c8bc [type=7(external_word) addr=0x00007f29ad14cb9c offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad14c8be: 640e
relocInfo@0x00007f29ad14c8be [type=6(runtime_call) addr=0x00007f29ad14cbaa offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14c8c0: f803b721c0787f297006
relocInfo@0x00007f29ad14c8c8 [type=7(external_word) addr=0x00007f29ad14cbb0 offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad14c8ca: 640e
relocInfo@0x00007f29ad14c8ca [type=6(runtime_call) addr=0x00007f29ad14cbbe offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14c8cc: f803b721c0787f297006
relocInfo@0x00007f29ad14c8d4 [type=7(external_word) addr=0x00007f29ad14cbc4 offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad14c8d6: 640e
relocInfo@0x00007f29ad14c8d6 [type=6(runtime_call) addr=0x00007f29ad14cbd2 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14c8d8: f803b721c0787f297006
relocInfo@0x00007f29ad14c8e0 [type=7(external_word) addr=0x00007f29ad14cbd8 offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad14c8e2: 640e
relocInfo@0x00007f29ad14c8e2 [type=6(runtime_call) addr=0x00007f29ad14cbe6 offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14c8e4: f803b721c0787f297006
relocInfo@0x00007f29ad14c8ec [type=7(external_word) addr=0x00007f29ad14cbec offset=6 data={b721c0787f29}] | [target=0x00007f29b721c078]
         @0x00007f29ad14c8ee: 640e
relocInfo@0x00007f29ad14c8ee [type=6(runtime_call) addr=0x00007f29ad14cbfa offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14c8f0: 640d
relocInfo@0x00007f29ad14c8f0 [type=6(runtime_call) addr=0x00007f29ad14cc07 offset=13 format=1] | [destination=0x00007f29ad116540]
         @0x00007f29ad14c8f2: f803b70847b87f297005
relocInfo@0x00007f29ad14c8fa [type=7(external_word) addr=0x00007f29ad14cc0c offset=5 data={b70847b87f29}] | [target=0x00007f29b70847b8]
         @0x00007f29ad14c8fc: 640e
relocInfo@0x00007f29ad14c8fc [type=6(runtime_call) addr=0x00007f29ad14cc1a offset=14 format=1] | [destination=0x00007f29b6849ff4]
         @0x00007f29ad14c8fe: f0e68006
relocInfo@0x00007f29ad14c900 [type=8(internal_word) addr=0x00007f29ad14cc20 offset=6 data=230] | [target=0x00007f29ad14cb3a]
         @0x00007f29ad14c902: 6411
relocInfo@0x00007f29ad14c902 [type=6(runtime_call) addr=0x00007f29ad14cc31 offset=17 format=1] | [destination=0x00007f29ad114d20]
         @0x00007f29ad14c904: 000f
relocInfo@0x00007f29ad14c904 [type=0(none) addr=0x00007f29ad14cc40 offset=15]
         @0x00007f29ad14c906: 6400
relocInfo@0x00007f29ad14c906 [type=6(runtime_call) addr=0x00007f29ad14cc40 offset=0 format=1] | [destination=0x00007f29ad05c9a0]
         @0x00007f29ad14c908: 640f
relocInfo@0x00007f29ad14c908 [type=6(runtime_call) addr=0x00007f29ad14cc4f offset=15 format=1] | [destination=0x00007f29ad116a60]
         @0x00007f29ad14c90a: 0000
relocInfo@0x00007f29ad14c90a [type=0(none) addr=0x00007f29ad14cc4f offset=0]
         @0x00007f29ad14c90c: 0000
relocInfo@0x00007f29ad14c90c [type=0(none) addr=0x00007f29ad14cc4f offset=0]
         @0x00007f29ad14c90e: 0000
relocInfo@0x00007f29ad14c90e [type=0(none) addr=0x00007f29ad14cc4f offset=0]
         @0x00007f29ad14c910: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 3 entries, 28 bytes):
{
   < 0x00007f29ad14c94c, 0x00007f29ad14cc00 > < 0x00007f29ad14c957, 0x00007f29ad14cb48 > < 0x00007f29ad14c975, 0x00007f29ad14cb48 > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x000000010110de48 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de48}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
#0: 0x0000000000000000 NULL-oop
#1: 0x00007f294f8116e8 {method} {0x00007f294f8116e8} 'micro_scalar' '([I[I[I)V' in 'App'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SCALAR : [Time] 243 ms   [Res] 99999000000000
VECTOR : [Time] 265 ms   [Res] 99999000000000
VECTOR_MASKED : [Time] 3891 ms   [Res] 999990000000000
------------------------------------------------------------------------
App::micro_scalar([I[I[I)V
  interpreter_invocation_count:     1195 
  invocation_counter:               5000 
  backedge_counter:                 6024 
  mdo size: 552 bytes

0 iconst_0
1 istore #4
3 fast_iload #4
5 aload_1
6 arraylength
7 if_icmpge 29
  0   bci: 7    BranchData          trap(intrinsic_or_type_checked_inlining recompiled) taken(45) displacement(56)
                                    not taken(5660672)
10 aload_1
11 fast_iload #4
13 aload_2
14 fast_iload #4
16 iaload
17 aload_3
18 fast_iload #4
20 iaload
21 iadd
22 iastore
23 iinc #4 1
26 goto 3
  32  bci: 26   JumpData            taken(5660672) displacement(-32)
29 return
------------------------------------------------------------------------
Total MDO size: 552 bytes
