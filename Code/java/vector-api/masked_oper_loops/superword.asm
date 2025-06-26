CompileCommand: print App.micro_scalar bool print = true

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 99 ------------------------
{method}
 - this oop:          0x00007fd66fc116e8
 - method holder:     'App'
 - constants:         0x00007fd66fc11090 constant pool [134]/operands[15] {0x00007fd66fc11090} for 'App' cache=0x00007fd66ff00000
 - access:            0xc1000001  public 
 - name:              'micro_scalar'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        5
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007fd6ccdde220
 - adapters:          AHE@0x00007fd6d03a4520: 0xbbbb0000 i2c: 0x00007fd6cce4f6e0 c2i: 0x00007fd6cce4f7cc c2iUV: 0x00007fd6cce4f796 c2iNCI: 0x00007fd6cce4f809
 - compiled entry     0x00007fd6cce4f7cc
 - code size:         30
 - code start:        0x00007fd66fc116c0
 - code end (excl):   0x00007fd66fc116de
 - method data:       0x00007fd66fc11db0
 - checked ex length: 0
 - linenumber start:  0x00007fd66fc116de
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
000     N529: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
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
        nop 	# 2 bytes pad for loops and calls
040     testq   R14, R14	# ptr
043     je     B48  P=0.001000 C=-1.000000

049     B2: #	out( B59 B3 ) <- in( B1 )  Freq: 0.999
049     movl    R11, [R14 + #8 (8-bit)]	# compressed klass ptr
04d     cmpl    R11, narrowklass: precise klass [I: 0x00007fd650014ea0:Constant:exact *	# compressed klass ptr
054     jne,u   B59  P=0.000001 C=-1.000000

05a     B3: #	out( B4 ) <- in( B2 )  Freq: 0.998999
05a     movq    R8, R14	# spill
05d     # checkcastPP of R8

05d     B4: #	out( B49 B5 ) <- in( B3 B48 )  Freq: 0.999999
        nop 	# 3 bytes pad for loops and calls
060     testq   RBP, RBP	# ptr
063     je     B49  P=0.001000 C=-1.000000

069     B5: #	out( B59 B6 ) <- in( B4 )  Freq: 0.998999
069     movl    R10, [RBP + #8 (8-bit)]	# compressed klass ptr
06d     cmpl    R10, narrowklass: precise klass [I: 0x00007fd650014ea0:Constant:exact *	# compressed klass ptr
074     jne,u   B59  P=0.000001 C=-1.000000

07a     B6: #	out( B7 ) <- in( B5 )  Freq: 0.998998
07a     movq    R9, RBP	# spill
07d     # checkcastPP of R9

07d     B7: #	out( B50 B8 ) <- in( B6 B49 )  Freq: 0.999998
        nop 	# 3 bytes pad for loops and calls
080     testq   RBX, RBX	# ptr
083     je     B50  P=0.001000 C=-1.000000

089     B8: #	out( B59 B9 ) <- in( B7 )  Freq: 0.998998
089     movl    R11, [RBX + #8 (8-bit)]	# compressed klass ptr
08d     cmpl    R11, narrowklass: precise klass [I: 0x00007fd650014ea0:Constant:exact *	# compressed klass ptr
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
0ae     jge     B44  P=0.000000 C=14976.000000

0b4     B14: #	out( B15 ) <- in( B13 )  Freq: 0.999993
0b4     movl    RBP, R8	# ptr -> int
0b7     movl    RAX, R13	# spill
0ba     incl    RAX	# int
0bc     shrl    RBP, #2
0bf     andl    RBP, #7	# int
0c2     xorl    R10, R10	# int
0c5     cmpl    RAX, R10
0c8     cmovllt RAX, R10	# max
0cc     cmpl    RAX, R10
0cf     cmovllt RAX, R10	# max
0d3     cmpl    RAX, RDI
0d5     cmovlgt RAX, RDI	# min
0d8     addl    RBP, RAX	# int
0da     movl    R11, #4	# int
0e0     subl    R11, RBP	# int
0e3     andl    R11, #7	# int
0e7     addl    R11, RAX	# int
0ea     cmpl    R11, RDI
0ed     cmovlgt R11, RDI	# min

0f1     B15: #	out( B45 B16 ) <- in( B14 B18 ) Loop( B15-B18 inner pre of N419) Freq: 1.99998
0f1     cmpl    R13, R14	# unsigned
0f4     jnb,u   B45  P=0.000001 C=-1.000000

0fa     B16: #	out( B46 B17 ) <- in( B15 )  Freq: 1.99998
0fa     movl    RBP, [R9 + #16 + R13 << #2]	# int
        nop 	# 1 bytes pad for loops and calls
100     cmpl    R13, RSI	# unsigned
103     jnb,u   B46  P=0.000001 C=-1.000000

109     B17: #	out( B47 B18 ) <- in( B16 )  Freq: 1.99998
109     addl    RBP, [RBX + #16 + R13 << #2]	# int
10e     cmpl    R13, RDI	# unsigned
111     jnb,u   B47  P=0.000001 C=-1.000000

117     B18: #	out( B15 B19 ) <- in( B17 )  Freq: 1.99997
117     movl    [R8 + #16 + R13 << #2], RBP	# int
11c     incl    R13	# int
        nop 	# 1 bytes pad for loops and calls
120     cmpl    R13, R11
123     jl,s   B15	# loop end  P=0.500000 C=14976.000000

125     B19: #	out( B38 B20 ) <- in( B18 )  Freq: 0.999987
125     cmpl    R14, RSI
128     movl    RBP, R14	# spill
12b     cmovlgt RBP, RSI	# min
12e     cmpl    RBP, RDI
130     cmovlgt RBP, RDI	# min
133     movl    R11, RBP	# spill
136     addl    R11, #-31	# int
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
172     addl    RCX, #31	# int
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
1a9     movl    RCX, #32000	# int
1ae     # TLS is in R15
1ae     jmp,s   B31

1b0     B29: #	out( B34 B30 ) <- in( B33 ) top-of-loop Freq: 999978
1b0     movq    RDX, [R15 + #304 (32-bit)]	# ptr
1b7     testl   rax, [RDX]	# Safepoint: poll for GC        # App::micro_scalar @ bci:26 (line 9) L[0]=_ L[1]=R8 L[2]=R9 L[3]=RBX L[4]=R13
        # OopMap {r8=Oop r9=Oop rbx=Oop off=439/0x1b7}
1b9     cmpl    R13, R11
        nop 	# 4 bytes pad for loops and calls
1c0     jge     B34  P=0.000000 C=14976.000000

1c6     B30: #	out( B31 ) <- in( B29 )  Freq: 999978
1c6     movdl   RSI, XMM1	# spill

1ca     B31: #	out( B32 ) <- in( B28 B30 ) Loop( B31-B30 ) Freq: 999978
1ca     movl    RDX, R11	# spill
1cd     subl    RDX, R13	# int
1d0     cmpl    R11, R13
1d3     cmovll RDX, R10	# signed, int
1d7     cmpl    RDX, #32000	# unsigned
1dd     cmovlnbe RDX, RCX	# unsigned, int
1e0     addl    RDX, R13	# int
1e3     movdl   XMM1, RSI	# spill
        nop 	# 9 bytes pad for loops and calls

1f0     B32: #	out( B32 B33 ) <- in( B31 B32 ) Loop( B32-B32 inner main of N220 strip mined) Freq: 9.99978e+11
1f0     load_vector XMM0,[R9 + #16 + R13 << #2]
1f7     vpaddd  XMM0,XMM0,[RBX + #16 + R13 << #2]	! add packedI
1fe     store_vector [R8 + #16 + R13 << #2],XMM0
	
205     movslq  RSI, R13	# i2l
208     load_vector XMM0,[R9 + #48 + RSI << #2]
20f     vpaddd  XMM0,XMM0,[RBX + #48 + RSI << #2]	! add packedI
215     store_vector [R8 + #48 + RSI << #2],XMM0
	
21c     load_vector XMM0,[R9 + #80 + RSI << #2]
223     vpaddd  XMM0,XMM0,[RBX + #80 + RSI << #2]	! add packedI
229     store_vector [R8 + #80 + RSI << #2],XMM0
	
230     load_vector XMM0,[R9 + #112 + RSI << #2]
237     vpaddd  XMM0,XMM0,[RBX + #112 + RSI << #2]	! add packedI
23d     store_vector [R8 + #112 + RSI << #2],XMM0
	
244     addl    R13, #32	# int
248     cmpl    R13, RDX
24b     jl,s   B32	# loop end  P=1.000000 C=14976.000000

24d     B33: #	out( B29 ) <- in( B32 )  Freq: 476827
24d     jmp     B29

252     B34: #	out( B37 B35 ) <- in( B29 )  Freq: 0.999978
252     movl    R11, RBP	# spill
255     addl    R11, #-7	# int
259     cmpl    RBP, R11
25c     cmovll R11, RAX	# signed, int
260     cmpl    R13, R11
263     jge,s   B37  P=0.500000 C=-1.000000

265     B35: #	out( B36 ) <- in( B34 )  Freq: 0.499989
265     # castII of R13
        nop 	# 3 bytes pad for loops and calls

268     B36: #	out( B36 B37 ) <- in( B35 B36 ) Loop( B36-B36 inner post of N1076) Freq: 0.999978
268     load_vector XMM0,[R9 + #16 + R13 << #2]
26f     vpaddd  XMM0,XMM0,[RBX + #16 + R13 << #2]	! add packedI
276     store_vector [R8 + #16 + R13 << #2],XMM0
	
27d     addl    R13, #8	# int
281     cmpl    R13, R11
284     jl,s   B36	# loop end  P=0.500000 C=14976.000000

286     B37: #	out( B38 ) <- in( B36 B34 )  Freq: 0.999978
286     movdl   RSI, XMM1	# spill

28a     B38: #	out( B44 B39 ) <- in( B19 B37 )  Freq: 0.999979
28a     cmpl    R13, RDI
28d     jge     B44  P=0.000001 C=-1.000000

293     B39: #	out( B40 ) <- in( B38 )  Freq: 0.999978
293     # castII of R13
        nop 	# 1 bytes pad for loops and calls

294     B40: #	out( B45 B41 ) <- in( B39 B43 ) Loop( B40-B43 inner post of N419) Freq: 246719
294     cmpl    R13, R14	# unsigned
297     jnb,u   B45  P=0.000001 C=-1.000000

29d     B41: #	out( B46 B42 ) <- in( B40 )  Freq: 246719
29d     movl    RBP, [R9 + #16 + R13 << #2]	# int
2a2     cmpl    R13, RSI	# unsigned
2a5     jnb,u   B46  P=0.000001 C=-1.000000

2ab     B42: #	out( B47 B43 ) <- in( B41 )  Freq: 246718
2ab     addl    RBP, [RBX + #16 + R13 << #2]	# int
2b0     cmpl    R13, RDI	# unsigned
2b3     jnb,u   B47  P=0.000001 C=-1.000000

2b9     B43: #	out( B40 B44 ) <- in( B42 )  Freq: 246718
2b9     movl    [R8 + #16 + R13 << #2], RBP	# int
2be     incl    R13	# int
2c1     cmpl    R13, RDI
2c4     jl,s   B40	# loop end  P=0.999999 C=14976.000000

2c6     B44: #	out( N529 ) <- in( B13 B43 B38 )  Freq: 0.249996
2c6     movl    RSI, #-187	# int
2cb     movq    RBP, R8	# spill
2ce     movq    [rsp + #0], R9	# spill
2d2     movq    [rsp + #8], RBX	# spill
2d7     movl    [rsp + #20], R13	# spill
2dc     movl    [rsp + #24], RDI	# spill
2e0     call,static  wrapper for: uncommon_trap(reason='unstable_if' action='reinterpret' debug_id='0')
        # App::micro_scalar @ bci:7 (line 9) L[0]=_ L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #8 L[4]=rsp + #20 STK[0]=rsp + #20 STK[1]=rsp + #24
        # OopMap {rbp=Oop [0]=Oop [8]=Oop off=744/0x2e8}
2e8     stop	# ShouldNotReachHere

2fc     B45: #	out( N529 ) <- in( B40 B15 )  Freq: 0.249997
2fc     movl    RSI, #-28	# int
301     movq    [rsp + #8], RBX	# spill
306     movq    [rsp + #24], R8	# spill
30b     movl    [rsp + #20], R13	# spill
310     movq    [rsp + #32], R9	# spill
315     movl    [rsp + #40], R13	# spill
        nop 	# 2 bytes pad for loops and calls
31c     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # App::micro_scalar @ bci:16 (line 10) L[0]=_ L[1]=rsp + #24 L[2]=rsp + #32 L[3]=rsp + #8 L[4]=rsp + #20 STK[0]=rsp + #24 STK[1]=rsp + #40 STK[2]=rsp + #32 STK[3]=rsp + #20
        # OopMap {[8]=Oop [24]=Oop [32]=Oop off=804/0x324}
324     stop	# ShouldNotReachHere

338     B46: #	out( N529 ) <- in( B41 B16 )  Freq: 0.249997
338     movl    RSI, #-28	# int
33d     movq    [rsp + #8], R9	# spill
342     movq    [rsp + #32], R8	# spill
347     movl    [rsp + #28], R13	# spill
34c     movq    [rsp + #40], RBX	# spill
351     movl    [rsp + #48], R13	# spill
        nop 	# 2 bytes pad for loops and calls
358     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # App::micro_scalar @ bci:20 (line 10) L[0]=_ L[1]=rsp + #32 L[2]=rsp + #8 L[3]=rsp + #40 L[4]=rsp + #28 STK[0]=rsp + #32 STK[1]=rsp + #48 STK[2]=RBP STK[3]=rsp + #40 STK[4]=rsp + #28
        # OopMap {[8]=Oop [32]=Oop [40]=Oop off=864/0x360}
360     stop	# ShouldNotReachHere

374     B47: #	out( N529 ) <- in( B42 B17 )  Freq: 0.249996
374     movl    RSI, #-28	# int
379     movq    [rsp + #8], R9	# spill
37e     movq    [rsp + #16], RBX	# spill
383     movq    [rsp + #32], R8	# spill
388     movl    [rsp + #28], R13	# spill
        nop 	# 3 bytes pad for loops and calls
390     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # App::micro_scalar @ bci:22 (line 10) L[0]=_ L[1]=rsp + #32 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=rsp + #28 STK[0]=rsp + #32 STK[1]=rsp + #28 STK[2]=RBP
        # OopMap {[8]=Oop [16]=Oop [32]=Oop off=920/0x398}
398     stop	# ShouldNotReachHere

3ac     B48: #	out( B4 ) <- in( B1 )  Freq: 0.000999987
3ac     xorl    R8, R8	# ptr
3af     jmp     B4

3b4     B49: #	out( B7 ) <- in( B4 )  Freq: 0.000999986
3b4     xorl    R9, R9	# ptr
3b7     jmp     B7

3bc     B50: #	out( B10 ) <- in( B7 )  Freq: 0.000999985
3bc     xorl    RBX, RBX	# ptr
        nop 	# 2 bytes pad for loops and calls
3c0     jmp     B10

3c5     B51: #	out( N529 ) <- in( B20 )  Freq: 1.01327e-06
3c5     stop	# ShouldNotReachHere

3d9     B52: #	out( N529 ) <- in( B21 )  Freq: 1.01326e-06
3d9     stop	# ShouldNotReachHere

3ed     B53: #	out( N529 ) <- in( B22 )  Freq: 1.01326e-06
3ed     stop	# ShouldNotReachHere

401     B54: #	out( N529 ) <- in( B23 )  Freq: 1.01326e-06
401     stop	# ShouldNotReachHere

415     B55: #	out( N529 ) <- in( B24 )  Freq: 1.01326e-06
415     stop	# ShouldNotReachHere

429     B56: #	out( N529 ) <- in( B25 )  Freq: 1.01326e-06
429     stop	# ShouldNotReachHere

43d     B57: #	out( N529 ) <- in( B26 )  Freq: 1.01326e-06
43d     stop	# ShouldNotReachHere

451     B58: #	out( N529 ) <- in( B27 )  Freq: 1.01326e-06
451     stop	# ShouldNotReachHere

465     B59: #	out( N529 ) <- in( B2 B5 B8 )  Freq: 2.997e-06
465     movl    RSI, #-115	# int
46a     movq    [rsp + #0], RBX	# spill
46e     movl    [rsp + #8], R13	# spill
473     movq    [rsp + #16], R14	# spill
478     call,static  wrapper for: uncommon_trap(reason='constraint' action='reinterpret' debug_id='0')
        # App::micro_scalar @ bci:3 (line 9) L[0]=_ L[1]=rsp + #16 L[2]=RBP L[3]=rsp + #0 L[4]=rsp + #8
        # OopMap {rbp=Oop [0]=Oop [16]=Oop off=1152/0x480}
480     stop	# ShouldNotReachHere

494     B60: #	out( N529 ) <- in( B12 B10 B11 )  Freq: 3.03982e-06
494     movl    RSI, #-138	# int
499     movq    RBP, R8	# spill
49c     movq    [rsp + #0], R9	# spill
4a0     movq    [rsp + #8], RBX	# spill
4a5     movl    [rsp + #16], R13	# spill
        nop 	# 2 bytes pad for loops and calls
4ac     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_scalar @ bci:3 (line 9) L[0]=_ L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #8 L[4]=rsp + #16
        # OopMap {rbp=Oop [0]=Oop [8]=Oop off=1204/0x4b4}
4b4     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    1453   99 %           App::micro_scalar @ 3 (30 bytes)
 total in heap  [0x00007fd6ccf1cd90,0x00007fd6ccf1d848] = 2744
 relocation     [0x00007fd6ccf1cf08,0x00007fd6ccf1cfd8] = 208
 main code      [0x00007fd6ccf1cfe0,0x00007fd6ccf1d4c0] = 1248
 stub code      [0x00007fd6ccf1d4c0,0x00007fd6ccf1d4d8] = 24
 oops           [0x00007fd6ccf1d4d8,0x00007fd6ccf1d4e0] = 8
 metadata       [0x00007fd6ccf1d4e0,0x00007fd6ccf1d4f0] = 16
 scopes data    [0x00007fd6ccf1d4f0,0x00007fd6ccf1d5e0] = 240
 scopes pcs     [0x00007fd6ccf1d5e0,0x00007fd6ccf1d820] = 576
 dependencies   [0x00007fd6ccf1d820,0x00007fd6ccf1d828] = 8
 nul chk table  [0x00007fd6ccf1d828,0x00007fd6ccf1d848] = 32

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007fd66fc116e8} 'micro_scalar' '([I[I[I)V' in 'App'
 ;; N529: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fd6ccf1cfe0:   callq  0x00007fd6d6014baa           ;   {runtime_call os::breakpoint()}
  0x00007fd6ccf1cfe5:   nop
  0x00007fd6ccf1cfe6:   nop
  0x00007fd6ccf1cfe7:   nop
  0x00007fd6ccf1cfe8:   nop
  0x00007fd6ccf1cfe9:   nop
  0x00007fd6ccf1cfea:   nop
  0x00007fd6ccf1cfeb:   nop
  0x00007fd6ccf1cfec:   nop
  0x00007fd6ccf1cfed:   nop
  0x00007fd6ccf1cfee:   nop
  0x00007fd6ccf1cfef:   nop
 ;; B1: #	out( B48 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fd6ccf1cff0:   mov    %eax,-0x16000(%rsp)
  0x00007fd6ccf1cff7:   push   %rbp
  0x00007fd6ccf1cff8:   sub    $0x50,%rsp
  0x00007fd6ccf1cffc:   mov    0x18(%rsi),%r14
  0x00007fd6ccf1d000:   mov    0x10(%rsi),%rbp
  0x00007fd6ccf1d004:   mov    (%rsi),%r13d
  0x00007fd6ccf1d007:   mov    0x8(%rsi),%rbx
  0x00007fd6ccf1d00b:   mov    %rsi,%rdi
  0x00007fd6ccf1d00e:   vzeroupper 
  0x00007fd6ccf1d011:   movabs $0x7fd6d6111410,%r10
  0x00007fd6ccf1d01b:   callq  *%r10
  0x00007fd6ccf1d01e:   nop
  0x00007fd6ccf1d01f:   nop
  0x00007fd6ccf1d020:   test   %r14,%r14
  0x00007fd6ccf1d023:   je     0x00007fd6ccf1d38c
 ;; B2: #	out( B59 B3 ) <- in( B1 )  Freq: 0.999
  0x00007fd6ccf1d029:   mov    0x8(%r14),%r11d
  0x00007fd6ccf1d02d:   cmp    $0x40c30,%r11d               ;   {metadata({type array int})}
  0x00007fd6ccf1d034:   jne    0x00007fd6ccf1d445
 ;; B3: #	out( B4 ) <- in( B2 )  Freq: 0.998999
  0x00007fd6ccf1d03a:   mov    %r14,%r8
 ;; B4: #	out( B49 B5 ) <- in( B3 B48 )  Freq: 0.999999
  0x00007fd6ccf1d03d:   nop
  0x00007fd6ccf1d03e:   nop
  0x00007fd6ccf1d03f:   nop
  0x00007fd6ccf1d040:   test   %rbp,%rbp
  0x00007fd6ccf1d043:   je     0x00007fd6ccf1d394
 ;; B5: #	out( B59 B6 ) <- in( B4 )  Freq: 0.998999
  0x00007fd6ccf1d049:   mov    0x8(%rbp),%r10d
  0x00007fd6ccf1d04d:   cmp    $0x40c30,%r10d               ;   {metadata({type array int})}
  0x00007fd6ccf1d054:   jne    0x00007fd6ccf1d445
 ;; B6: #	out( B7 ) <- in( B5 )  Freq: 0.998998
  0x00007fd6ccf1d05a:   mov    %rbp,%r9
 ;; B7: #	out( B50 B8 ) <- in( B6 B49 )  Freq: 0.999998
  0x00007fd6ccf1d05d:   nop
  0x00007fd6ccf1d05e:   nop
  0x00007fd6ccf1d05f:   nop
  0x00007fd6ccf1d060:   test   %rbx,%rbx
  0x00007fd6ccf1d063:   je     0x00007fd6ccf1d39c
 ;; B8: #	out( B59 B9 ) <- in( B7 )  Freq: 0.998998
  0x00007fd6ccf1d069:   mov    0x8(%rbx),%r11d
  0x00007fd6ccf1d06d:   cmp    $0x40c30,%r11d               ;   {metadata({type array int})}
  0x00007fd6ccf1d074:   jne    0x00007fd6ccf1d445           ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
 ;; B9: #	out( B10 ) <- in( B8 )  Freq: 0.998997
 ;; B10: #	out( B60 B11 ) <- in( B9 B50 )  Freq: 0.999997
  0x00007fd6ccf1d07a:   nop
  0x00007fd6ccf1d07b:   nop
  0x00007fd6ccf1d07c:   nop
  0x00007fd6ccf1d07d:   nop
  0x00007fd6ccf1d07e:   nop
  0x00007fd6ccf1d07f:   nop
  0x00007fd6ccf1d080:   mov    0xc(%r8),%edi                ; implicit exception: dispatches to 0x00007fd6ccf1d474
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@6 (line 9)
 ;; B11: #	out( B60 B12 ) <- in( B10 )  Freq: 0.999996
  0x00007fd6ccf1d084:   mov    0xc(%r9),%r14d               ; implicit exception: dispatches to 0x00007fd6ccf1d474
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
 ;; B12: #	out( B60 B13 ) <- in( B11 )  Freq: 0.999995
  0x00007fd6ccf1d088:   mov    0xc(%rbx),%esi               ; implicit exception: dispatches to 0x00007fd6ccf1d474
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
 ;; B13: #	out( B44 B14 ) <- in( B12 )  Freq: 0.999994
  0x00007fd6ccf1d08b:   cmp    %edi,%r13d
  0x00007fd6ccf1d08e:   jge    0x00007fd6ccf1d2a6           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B14: #	out( B15 ) <- in( B13 )  Freq: 0.999993
  0x00007fd6ccf1d094:   mov    %r8d,%ebp
  0x00007fd6ccf1d097:   mov    %r13d,%eax
  0x00007fd6ccf1d09a:   inc    %eax
  0x00007fd6ccf1d09c:   shr    $0x2,%ebp
  0x00007fd6ccf1d09f:   and    $0x7,%ebp
  0x00007fd6ccf1d0a2:   xor    %r10d,%r10d
  0x00007fd6ccf1d0a5:   cmp    %r10d,%eax
  0x00007fd6ccf1d0a8:   cmovl  %r10d,%eax
  0x00007fd6ccf1d0ac:   cmp    %r10d,%eax
  0x00007fd6ccf1d0af:   cmovl  %r10d,%eax
  0x00007fd6ccf1d0b3:   cmp    %edi,%eax
  0x00007fd6ccf1d0b5:   cmovg  %edi,%eax
  0x00007fd6ccf1d0b8:   add    %eax,%ebp
  0x00007fd6ccf1d0ba:   mov    $0x4,%r11d
  0x00007fd6ccf1d0c0:   sub    %ebp,%r11d
  0x00007fd6ccf1d0c3:   and    $0x7,%r11d
  0x00007fd6ccf1d0c7:   add    %eax,%r11d
  0x00007fd6ccf1d0ca:   cmp    %edi,%r11d
  0x00007fd6ccf1d0cd:   cmovg  %edi,%r11d                   ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
 ;; B15: #	out( B45 B16 ) <- in( B14 B18 ) Loop( B15-B18 inner pre of N419) Freq: 1.99998
  0x00007fd6ccf1d0d1:   cmp    %r14d,%r13d
  0x00007fd6ccf1d0d4:   jae    0x00007fd6ccf1d2dc
 ;; B16: #	out( B46 B17 ) <- in( B15 )  Freq: 1.99998
  0x00007fd6ccf1d0da:   mov    0x10(%r9,%r13,4),%ebp        ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007fd6ccf1d0df:   nop
  0x00007fd6ccf1d0e0:   cmp    %esi,%r13d
  0x00007fd6ccf1d0e3:   jae    0x00007fd6ccf1d318
 ;; B17: #	out( B47 B18 ) <- in( B16 )  Freq: 1.99998
  0x00007fd6ccf1d0e9:   add    0x10(%rbx,%r13,4),%ebp       ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@21 (line 10)
  0x00007fd6ccf1d0ee:   cmp    %edi,%r13d
  0x00007fd6ccf1d0f1:   jae    0x00007fd6ccf1d354
 ;; B18: #	out( B15 B19 ) <- in( B17 )  Freq: 1.99997
  0x00007fd6ccf1d0f7:   mov    %ebp,0x10(%r8,%r13,4)        ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007fd6ccf1d0fc:   inc    %r13d                        ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007fd6ccf1d0ff:   nop
  0x00007fd6ccf1d100:   cmp    %r11d,%r13d
  0x00007fd6ccf1d103:   jl     0x00007fd6ccf1d0d1           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B19: #	out( B38 B20 ) <- in( B18 )  Freq: 0.999987
  0x00007fd6ccf1d105:   cmp    %esi,%r14d
  0x00007fd6ccf1d108:   mov    %r14d,%ebp
  0x00007fd6ccf1d10b:   cmovg  %esi,%ebp
  0x00007fd6ccf1d10e:   cmp    %edi,%ebp
  0x00007fd6ccf1d110:   cmovg  %edi,%ebp
  0x00007fd6ccf1d113:   mov    %ebp,%r11d
  0x00007fd6ccf1d116:   add    $0xffffffe1,%r11d
  0x00007fd6ccf1d11a:   mov    $0x80000000,%eax
  0x00007fd6ccf1d11f:   cmp    %r11d,%ebp
  0x00007fd6ccf1d122:   cmovl  %eax,%r11d
  0x00007fd6ccf1d126:   cmp    %r11d,%r13d
  0x00007fd6ccf1d129:   jge    0x00007fd6ccf1d26a
 ;; B20: #	out( B51 B21 ) <- in( B19 )  Freq: 0.999986
  0x00007fd6ccf1d12f:   cmp    %r14d,%r13d
  0x00007fd6ccf1d132:   jae    0x00007fd6ccf1d3a5
 ;; B21: #	out( B52 B22 ) <- in( B20 )  Freq: 0.999985
  0x00007fd6ccf1d138:   cmp    %esi,%r13d
  0x00007fd6ccf1d13b:   nop
  0x00007fd6ccf1d13c:   nop
  0x00007fd6ccf1d13d:   nop
  0x00007fd6ccf1d13e:   nop
  0x00007fd6ccf1d13f:   nop
  0x00007fd6ccf1d140:   jae    0x00007fd6ccf1d3b9
 ;; B22: #	out( B53 B23 ) <- in( B21 )  Freq: 0.999984
  0x00007fd6ccf1d146:   cmp    %edi,%r13d
  0x00007fd6ccf1d149:   jae    0x00007fd6ccf1d3cd
 ;; B23: #	out( B54 B24 ) <- in( B22 )  Freq: 0.999983
  0x00007fd6ccf1d14f:   mov    %r13d,%ecx
  0x00007fd6ccf1d152:   add    $0x1f,%ecx
  0x00007fd6ccf1d155:   cmp    %edi,%ecx
  0x00007fd6ccf1d157:   jae    0x00007fd6ccf1d3e1
 ;; B24: #	out( B55 B25 ) <- in( B23 )  Freq: 0.999982
  0x00007fd6ccf1d15d:   nop
  0x00007fd6ccf1d15e:   nop
  0x00007fd6ccf1d15f:   nop
  0x00007fd6ccf1d160:   cmp    %esi,%ecx
  0x00007fd6ccf1d162:   jae    0x00007fd6ccf1d3f5
 ;; B25: #	out( B56 B26 ) <- in( B24 )  Freq: 0.999981
  0x00007fd6ccf1d168:   cmp    %esi,%r13d
  0x00007fd6ccf1d16b:   jae    0x00007fd6ccf1d409
 ;; B26: #	out( B57 B27 ) <- in( B25 )  Freq: 0.99998
  0x00007fd6ccf1d171:   cmp    %r14d,%ecx
  0x00007fd6ccf1d174:   jae    0x00007fd6ccf1d41d
 ;; B27: #	out( B58 B28 ) <- in( B26 )  Freq: 0.999979
  0x00007fd6ccf1d17a:   nop
  0x00007fd6ccf1d17b:   nop
  0x00007fd6ccf1d17c:   nop
  0x00007fd6ccf1d17d:   nop
  0x00007fd6ccf1d17e:   nop
  0x00007fd6ccf1d17f:   nop
  0x00007fd6ccf1d180:   cmp    %r14d,%r13d
  0x00007fd6ccf1d183:   jae    0x00007fd6ccf1d431
 ;; B28: #	out( B31 ) <- in( B27 )  Freq: 0.999978
  0x00007fd6ccf1d189:   mov    $0x7d00,%ecx
  0x00007fd6ccf1d18e:   jmp    0x00007fd6ccf1d1aa           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
 ;; B29: #	out( B34 B30 ) <- in( B33 ) top-of-loop Freq: 999978
  0x00007fd6ccf1d190:   mov    0x130(%r15),%rdx             ; ImmutableOopMap {r8=Oop r9=Oop rbx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@26 (line 9)
  0x00007fd6ccf1d197:   test   %eax,(%rdx)                  ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
                                                            ;   {poll}
  0x00007fd6ccf1d199:   cmp    %r11d,%r13d
  0x00007fd6ccf1d19c:   nop
  0x00007fd6ccf1d19d:   nop
  0x00007fd6ccf1d19e:   nop
  0x00007fd6ccf1d19f:   nop
  0x00007fd6ccf1d1a0:   jge    0x00007fd6ccf1d232
 ;; B30: #	out( B31 ) <- in( B29 )  Freq: 999978
  0x00007fd6ccf1d1a6:   vmovd  %xmm1,%esi
 ;; B31: #	out( B32 ) <- in( B28 B30 ) Loop( B31-B30 ) Freq: 999978
  0x00007fd6ccf1d1aa:   mov    %r11d,%edx
  0x00007fd6ccf1d1ad:   sub    %r13d,%edx
  0x00007fd6ccf1d1b0:   cmp    %r13d,%r11d
  0x00007fd6ccf1d1b3:   cmovl  %r10d,%edx
  0x00007fd6ccf1d1b7:   cmp    $0x7d00,%edx
  0x00007fd6ccf1d1bd:   cmova  %ecx,%edx
  0x00007fd6ccf1d1c0:   add    %r13d,%edx
  0x00007fd6ccf1d1c3:   vmovd  %esi,%xmm1
  0x00007fd6ccf1d1c7:   nop
  0x00007fd6ccf1d1c8:   nop
  0x00007fd6ccf1d1c9:   nop
  0x00007fd6ccf1d1ca:   nop
  0x00007fd6ccf1d1cb:   nop
  0x00007fd6ccf1d1cc:   nop
  0x00007fd6ccf1d1cd:   nop
  0x00007fd6ccf1d1ce:   nop
  0x00007fd6ccf1d1cf:   nop
 ;; B32: #	out( B32 B33 ) <- in( B31 B32 ) Loop( B32-B32 inner main of N220 strip mined) Freq: 9.99978e+11
  0x00007fd6ccf1d1d0:   vmovdqu 0x10(%r9,%r13,4),%ymm0
  0x00007fd6ccf1d1d7:   vpaddd 0x10(%rbx,%r13,4),%ymm0,%ymm0
  0x00007fd6ccf1d1de:   vmovdqu %ymm0,0x10(%r8,%r13,4)
  0x00007fd6ccf1d1e5:   movslq %r13d,%rsi
  0x00007fd6ccf1d1e8:   vmovdqu 0x30(%r9,%rsi,4),%ymm0
  0x00007fd6ccf1d1ef:   vpaddd 0x30(%rbx,%rsi,4),%ymm0,%ymm0
  0x00007fd6ccf1d1f5:   vmovdqu %ymm0,0x30(%r8,%rsi,4)
  0x00007fd6ccf1d1fc:   vmovdqu 0x50(%r9,%rsi,4),%ymm0
  0x00007fd6ccf1d203:   vpaddd 0x50(%rbx,%rsi,4),%ymm0,%ymm0
  0x00007fd6ccf1d209:   vmovdqu %ymm0,0x50(%r8,%rsi,4)
  0x00007fd6ccf1d210:   vmovdqu 0x70(%r9,%rsi,4),%ymm0
  0x00007fd6ccf1d217:   vpaddd 0x70(%rbx,%rsi,4),%ymm0,%ymm0
  0x00007fd6ccf1d21d:   vmovdqu %ymm0,0x70(%r8,%rsi,4)      ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007fd6ccf1d224:   add    $0x20,%r13d                  ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007fd6ccf1d228:   cmp    %edx,%r13d
  0x00007fd6ccf1d22b:   jl     0x00007fd6ccf1d1d0           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B33: #	out( B29 ) <- in( B32 )  Freq: 476827
  0x00007fd6ccf1d22d:   jmpq   0x00007fd6ccf1d190
 ;; B34: #	out( B37 B35 ) <- in( B29 )  Freq: 0.999978
  0x00007fd6ccf1d232:   mov    %ebp,%r11d
  0x00007fd6ccf1d235:   add    $0xfffffff9,%r11d
  0x00007fd6ccf1d239:   cmp    %r11d,%ebp
  0x00007fd6ccf1d23c:   cmovl  %eax,%r11d
  0x00007fd6ccf1d240:   cmp    %r11d,%r13d
  0x00007fd6ccf1d243:   jge    0x00007fd6ccf1d266
 ;; B35: #	out( B36 ) <- in( B34 )  Freq: 0.499989
  0x00007fd6ccf1d245:   nop
  0x00007fd6ccf1d246:   nop
  0x00007fd6ccf1d247:   nop
 ;; B36: #	out( B36 B37 ) <- in( B35 B36 ) Loop( B36-B36 inner post of N1076) Freq: 0.999978
  0x00007fd6ccf1d248:   vmovdqu 0x10(%r9,%r13,4),%ymm0
  0x00007fd6ccf1d24f:   vpaddd 0x10(%rbx,%r13,4),%ymm0,%ymm0
  0x00007fd6ccf1d256:   vmovdqu %ymm0,0x10(%r8,%r13,4)      ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007fd6ccf1d25d:   add    $0x8,%r13d                   ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007fd6ccf1d261:   cmp    %r11d,%r13d
  0x00007fd6ccf1d264:   jl     0x00007fd6ccf1d248           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B37: #	out( B38 ) <- in( B36 B34 )  Freq: 0.999978
  0x00007fd6ccf1d266:   vmovd  %xmm1,%esi
 ;; B38: #	out( B44 B39 ) <- in( B19 B37 )  Freq: 0.999979
  0x00007fd6ccf1d26a:   cmp    %edi,%r13d
  0x00007fd6ccf1d26d:   jge    0x00007fd6ccf1d2a6
 ;; B39: #	out( B40 ) <- in( B38 )  Freq: 0.999978
  0x00007fd6ccf1d273:   nop                                 ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
 ;; B40: #	out( B45 B41 ) <- in( B39 B43 ) Loop( B40-B43 inner post of N419) Freq: 246719
  0x00007fd6ccf1d274:   cmp    %r14d,%r13d
  0x00007fd6ccf1d277:   jae    0x00007fd6ccf1d2dc
 ;; B41: #	out( B46 B42 ) <- in( B40 )  Freq: 246719
  0x00007fd6ccf1d27d:   mov    0x10(%r9,%r13,4),%ebp        ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007fd6ccf1d282:   cmp    %esi,%r13d
  0x00007fd6ccf1d285:   jae    0x00007fd6ccf1d318
 ;; B42: #	out( B47 B43 ) <- in( B41 )  Freq: 246718
  0x00007fd6ccf1d28b:   add    0x10(%rbx,%r13,4),%ebp       ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@21 (line 10)
  0x00007fd6ccf1d290:   cmp    %edi,%r13d
  0x00007fd6ccf1d293:   jae    0x00007fd6ccf1d354
 ;; B43: #	out( B40 B44 ) <- in( B42 )  Freq: 246718
  0x00007fd6ccf1d299:   mov    %ebp,0x10(%r8,%r13,4)        ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007fd6ccf1d29e:   inc    %r13d                        ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007fd6ccf1d2a1:   cmp    %edi,%r13d
  0x00007fd6ccf1d2a4:   jl     0x00007fd6ccf1d274           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B44: #	out( N529 ) <- in( B13 B43 B38 )  Freq: 0.249996
  0x00007fd6ccf1d2a6:   mov    $0xffffff45,%esi
  0x00007fd6ccf1d2ab:   mov    %r8,%rbp
  0x00007fd6ccf1d2ae:   mov    %r9,(%rsp)
  0x00007fd6ccf1d2b2:   mov    %rbx,0x8(%rsp)
  0x00007fd6ccf1d2b7:   mov    %r13d,0x14(%rsp)
  0x00007fd6ccf1d2bc:   mov    %edi,0x18(%rsp)
  0x00007fd6ccf1d2c0:   vzeroupper 
  0x00007fd6ccf1d2c3:   callq  0x00007fd6ccee6540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@7 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd6ccf1d2c8:   movabs $0x7fd6d66d67b8,%rdi         ;   {external_word}
  0x00007fd6ccf1d2d2:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1d2d6:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1d2db:   hlt    
 ;; B45: #	out( N529 ) <- in( B40 B15 )  Freq: 0.249997
  0x00007fd6ccf1d2dc:   mov    $0xffffffe4,%esi
  0x00007fd6ccf1d2e1:   mov    %rbx,0x8(%rsp)
  0x00007fd6ccf1d2e6:   mov    %r8,0x18(%rsp)
  0x00007fd6ccf1d2eb:   mov    %r13d,0x14(%rsp)
  0x00007fd6ccf1d2f0:   mov    %r9,0x20(%rsp)
  0x00007fd6ccf1d2f5:   mov    %r13d,0x28(%rsp)
  0x00007fd6ccf1d2fa:   nop
  0x00007fd6ccf1d2fb:   nop
  0x00007fd6ccf1d2fc:   vzeroupper 
  0x00007fd6ccf1d2ff:   callq  0x00007fd6ccee6540           ; ImmutableOopMap {[8]=Oop [24]=Oop [32]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd6ccf1d304:   movabs $0x7fd6d66d67b8,%rdi         ;   {external_word}
  0x00007fd6ccf1d30e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1d312:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1d317:   hlt    
 ;; B46: #	out( N529 ) <- in( B41 B16 )  Freq: 0.249997
  0x00007fd6ccf1d318:   mov    $0xffffffe4,%esi
  0x00007fd6ccf1d31d:   mov    %r9,0x8(%rsp)
  0x00007fd6ccf1d322:   mov    %r8,0x20(%rsp)
  0x00007fd6ccf1d327:   mov    %r13d,0x1c(%rsp)
  0x00007fd6ccf1d32c:   mov    %rbx,0x28(%rsp)
  0x00007fd6ccf1d331:   mov    %r13d,0x30(%rsp)
  0x00007fd6ccf1d336:   nop
  0x00007fd6ccf1d337:   nop
  0x00007fd6ccf1d338:   vzeroupper 
  0x00007fd6ccf1d33b:   callq  0x00007fd6ccee6540           ; ImmutableOopMap {[8]=Oop [32]=Oop [40]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd6ccf1d340:   movabs $0x7fd6d66d67b8,%rdi         ;   {external_word}
  0x00007fd6ccf1d34a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1d34e:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1d353:   hlt    
 ;; B47: #	out( N529 ) <- in( B42 B17 )  Freq: 0.249996
  0x00007fd6ccf1d354:   mov    $0xffffffe4,%esi
  0x00007fd6ccf1d359:   mov    %r9,0x8(%rsp)
  0x00007fd6ccf1d35e:   mov    %rbx,0x10(%rsp)
  0x00007fd6ccf1d363:   mov    %r8,0x20(%rsp)
  0x00007fd6ccf1d368:   mov    %r13d,0x1c(%rsp)
  0x00007fd6ccf1d36d:   nop
  0x00007fd6ccf1d36e:   nop
  0x00007fd6ccf1d36f:   nop
  0x00007fd6ccf1d370:   vzeroupper 
  0x00007fd6ccf1d373:   callq  0x00007fd6ccee6540           ; ImmutableOopMap {[8]=Oop [16]=Oop [32]=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd6ccf1d378:   movabs $0x7fd6d66d67b8,%rdi         ;   {external_word}
  0x00007fd6ccf1d382:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1d386:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1d38b:   hlt                                 ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
 ;; B48: #	out( B4 ) <- in( B1 )  Freq: 0.000999987
  0x00007fd6ccf1d38c:   xor    %r8d,%r8d
  0x00007fd6ccf1d38f:   jmpq   0x00007fd6ccf1d03d
 ;; B49: #	out( B7 ) <- in( B4 )  Freq: 0.000999986
  0x00007fd6ccf1d394:   xor    %r9d,%r9d
  0x00007fd6ccf1d397:   jmpq   0x00007fd6ccf1d05d
 ;; B50: #	out( B10 ) <- in( B7 )  Freq: 0.000999985
  0x00007fd6ccf1d39c:   xor    %ebx,%ebx
  0x00007fd6ccf1d39e:   nop
  0x00007fd6ccf1d39f:   nop
  0x00007fd6ccf1d3a0:   jmpq   0x00007fd6ccf1d07a
 ;; B51: #	out( N529 ) <- in( B20 )  Freq: 1.01327e-06
  0x00007fd6ccf1d3a5:   movabs $0x7fd6d686e968,%rdi         ;   {external_word}
  0x00007fd6ccf1d3af:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1d3b3:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1d3b8:   hlt    
 ;; B52: #	out( N529 ) <- in( B21 )  Freq: 1.01326e-06
  0x00007fd6ccf1d3b9:   movabs $0x7fd6d686e968,%rdi         ;   {external_word}
  0x00007fd6ccf1d3c3:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1d3c7:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1d3cc:   hlt    
 ;; B53: #	out( N529 ) <- in( B22 )  Freq: 1.01326e-06
  0x00007fd6ccf1d3cd:   movabs $0x7fd6d686e968,%rdi         ;   {external_word}
  0x00007fd6ccf1d3d7:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1d3db:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1d3e0:   hlt    
 ;; B54: #	out( N529 ) <- in( B23 )  Freq: 1.01326e-06
  0x00007fd6ccf1d3e1:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1d3eb:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1d3ef:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1d3f4:   hlt    
 ;; B55: #	out( N529 ) <- in( B24 )  Freq: 1.01326e-06
  0x00007fd6ccf1d3f5:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1d3ff:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1d403:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1d408:   hlt    
 ;; B56: #	out( N529 ) <- in( B25 )  Freq: 1.01326e-06
  0x00007fd6ccf1d409:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1d413:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1d417:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1d41c:   hlt    
 ;; B57: #	out( N529 ) <- in( B26 )  Freq: 1.01326e-06
  0x00007fd6ccf1d41d:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1d427:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1d42b:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1d430:   hlt    
 ;; B58: #	out( N529 ) <- in( B27 )  Freq: 1.01326e-06
  0x00007fd6ccf1d431:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1d43b:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1d43f:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1d444:   hlt    
 ;; B59: #	out( N529 ) <- in( B2 B5 B8 )  Freq: 2.997e-06
  0x00007fd6ccf1d445:   mov    $0xffffff8d,%esi
  0x00007fd6ccf1d44a:   mov    %rbx,(%rsp)
  0x00007fd6ccf1d44e:   mov    %r13d,0x8(%rsp)
  0x00007fd6ccf1d453:   mov    %r14,0x10(%rsp)
  0x00007fd6ccf1d458:   vzeroupper 
  0x00007fd6ccf1d45b:   callq  0x00007fd6ccee6540           ; ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd6ccf1d460:   movabs $0x7fd6d66d67b8,%rdi         ;   {external_word}
  0x00007fd6ccf1d46a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1d46e:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1d473:   hlt    
 ;; B60: #	out( N529 ) <- in( B12 B10 B11 )  Freq: 3.03982e-06
  0x00007fd6ccf1d474:   mov    $0xffffff76,%esi
  0x00007fd6ccf1d479:   mov    %r8,%rbp
  0x00007fd6ccf1d47c:   mov    %r9,(%rsp)
  0x00007fd6ccf1d480:   mov    %rbx,0x8(%rsp)
  0x00007fd6ccf1d485:   mov    %r13d,0x10(%rsp)
  0x00007fd6ccf1d48a:   nop
  0x00007fd6ccf1d48b:   nop
  0x00007fd6ccf1d48c:   vzeroupper 
  0x00007fd6ccf1d48f:   callq  0x00007fd6ccee6540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd6ccf1d494:   movabs $0x7fd6d66d67b8,%rdi         ;   {external_word}
  0x00007fd6ccf1d49e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1d4a2:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1d4a7:   hlt                                 ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
  0x00007fd6ccf1d4a8:   hlt    
  0x00007fd6ccf1d4a9:   hlt    
  0x00007fd6ccf1d4aa:   hlt    
  0x00007fd6ccf1d4ab:   hlt    
  0x00007fd6ccf1d4ac:   hlt    
  0x00007fd6ccf1d4ad:   hlt    
  0x00007fd6ccf1d4ae:   hlt    
  0x00007fd6ccf1d4af:   hlt    
  0x00007fd6ccf1d4b0:   hlt    
  0x00007fd6ccf1d4b1:   hlt    
  0x00007fd6ccf1d4b2:   hlt    
  0x00007fd6ccf1d4b3:   hlt    
  0x00007fd6ccf1d4b4:   hlt    
  0x00007fd6ccf1d4b5:   hlt    
  0x00007fd6ccf1d4b6:   hlt    
  0x00007fd6ccf1d4b7:   hlt    
  0x00007fd6ccf1d4b8:   hlt    
  0x00007fd6ccf1d4b9:   hlt    
  0x00007fd6ccf1d4ba:   hlt    
  0x00007fd6ccf1d4bb:   hlt    
  0x00007fd6ccf1d4bc:   hlt    
  0x00007fd6ccf1d4bd:   hlt    
  0x00007fd6ccf1d4be:   hlt    
  0x00007fd6ccf1d4bf:   hlt    
[Exception Handler]
  0x00007fd6ccf1d4c0:   jmpq   0x00007fd6cce2c6a0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007fd6ccf1d4c5:   callq  0x00007fd6ccf1d4ca
  0x00007fd6ccf1d4ca:   subq   $0x5,(%rsp)
  0x00007fd6ccf1d4cf:   jmpq   0x00007fd6ccee6860           ;   {runtime_call DeoptimizationBlob}
  0x00007fd6ccf1d4d4:   hlt    
  0x00007fd6ccf1d4d5:   hlt    
  0x00007fd6ccf1d4d6:   hlt    
  0x00007fd6ccf1d4d7:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007fd6ccf1d4d8:   0x000000010110de48 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de48}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007fd6ccf1d4e0:   0x0000000800040c30 {type array int}
  0x00007fd6ccf1d4e8:   0x00007fd66fc116e8 {method} {0x00007fd66fc116e8} 'micro_scalar' '([I[I[I)V' in 'App'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007fd6ccf1cfdf offset=ffffffff bits=0):
PcDesc(pc=0x00007fd6ccf1d07a offset=9a bits=0):   App::micro_scalar@3 (line 9)
PcDesc(pc=0x00007fd6ccf1d084 offset=a4 bits=0):   App::micro_scalar@6 (line 9)
PcDesc(pc=0x00007fd6ccf1d088 offset=a8 bits=0):   App::micro_scalar@16 (line 10)
PcDesc(pc=0x00007fd6ccf1d08b offset=ab bits=0):   App::micro_scalar@20 (line 10)
PcDesc(pc=0x00007fd6ccf1d094 offset=b4 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007fd6ccf1d0d1 offset=f1 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1d0df offset=ff bits=0):   App::micro_scalar@16 (line 10)
PcDesc(pc=0x00007fd6ccf1d0ee offset=10e bits=0):   App::micro_scalar@21 (line 10)
PcDesc(pc=0x00007fd6ccf1d0fc offset=11c bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1d0ff offset=11f bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007fd6ccf1d105 offset=125 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007fd6ccf1d190 offset=1b0 bits=0):   App::micro_scalar@26 (line 9)
PcDesc(pc=0x00007fd6ccf1d197 offset=1b7 bits=1):   App::micro_scalar@26 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg r8 [16],oop
    - l2: reg r9 [18],oop
    - l3: reg rbx [6],oop
    - l4: reg r13 [26],int
PcDesc(pc=0x00007fd6ccf1d199 offset=1b9 bits=0):   App::micro_scalar@26 (line 9)
PcDesc(pc=0x00007fd6ccf1d224 offset=244 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1d228 offset=248 bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007fd6ccf1d22d offset=24d bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007fd6ccf1d25d offset=27d bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1d261 offset=281 bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007fd6ccf1d266 offset=286 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007fd6ccf1d274 offset=294 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1d282 offset=2a2 bits=0):   App::micro_scalar@16 (line 10)
PcDesc(pc=0x00007fd6ccf1d290 offset=2b0 bits=0):   App::micro_scalar@21 (line 10)
PcDesc(pc=0x00007fd6ccf1d29e offset=2be bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1d2a1 offset=2c1 bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007fd6ccf1d2a6 offset=2c6 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007fd6ccf1d2c8 offset=2e8 bits=1):   App::micro_scalar@7 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[20]
   Expression stack
    - @0: stack[20]
    - @1: stack[24]
PcDesc(pc=0x00007fd6ccf1d304 offset=324 bits=0):   App::micro_scalar@16 (line 10)
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
PcDesc(pc=0x00007fd6ccf1d340 offset=360 bits=0):   App::micro_scalar@20 (line 10)
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
PcDesc(pc=0x00007fd6ccf1d378 offset=398 bits=0):   App::micro_scalar@22 (line 10)
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
PcDesc(pc=0x00007fd6ccf1d38c offset=3ac bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1d460 offset=480 bits=0):   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: stack[16],oop
    - l2: reg rbp [10],oop
    - l3: stack[0],oop
    - l4: stack[8]
PcDesc(pc=0x00007fd6ccf1d494 offset=4b4 bits=0):   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[16]
PcDesc(pc=0x00007fd6ccf1d4a8 offset=4c8 bits=0):   App::micro_scalar@3 (line 9)
PcDesc(pc=0x00007fd6ccf1d4d9 offset=4f9 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 7 OopMaps

ImmutableOopMap {r8=Oop r9=Oop rbx=Oop } pc offsets: 439 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop } pc offsets: 744 
ImmutableOopMap {[8]=Oop [24]=Oop [32]=Oop } pc offsets: 804 
ImmutableOopMap {[8]=Oop [32]=Oop [40]=Oop } pc offsets: 864 
ImmutableOopMap {[8]=Oop [16]=Oop [32]=Oop } pc offsets: 920 
ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop } pc offsets: 1152 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop } pc offsets: 1204 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007fd6ccf1d07a offset=9a):
   App::micro_scalar@3 (line 9)
ScopeDesc(pc=0x00007fd6ccf1d084 offset=a4):
   App::micro_scalar@6 (line 9)
ScopeDesc(pc=0x00007fd6ccf1d088 offset=a8):
   App::micro_scalar@16 (line 10)
ScopeDesc(pc=0x00007fd6ccf1d08b offset=ab):
   App::micro_scalar@20 (line 10)
ScopeDesc(pc=0x00007fd6ccf1d094 offset=b4):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007fd6ccf1d0d1 offset=f1):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1d0df offset=ff):
   App::micro_scalar@16 (line 10)
ScopeDesc(pc=0x00007fd6ccf1d0ee offset=10e):
   App::micro_scalar@21 (line 10)
ScopeDesc(pc=0x00007fd6ccf1d0fc offset=11c):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1d0ff offset=11f):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007fd6ccf1d105 offset=125):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007fd6ccf1d190 offset=1b0):
   App::micro_scalar@26 (line 9)
ScopeDesc(pc=0x00007fd6ccf1d197 offset=1b7):
   App::micro_scalar@26 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg r8 [16],oop
    - l2: reg r9 [18],oop
    - l3: reg rbx [6],oop
    - l4: reg r13 [26],int
ScopeDesc(pc=0x00007fd6ccf1d199 offset=1b9):
   App::micro_scalar@26 (line 9)
ScopeDesc(pc=0x00007fd6ccf1d224 offset=244):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1d228 offset=248):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007fd6ccf1d22d offset=24d):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007fd6ccf1d25d offset=27d):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1d261 offset=281):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007fd6ccf1d266 offset=286):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007fd6ccf1d274 offset=294):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1d282 offset=2a2):
   App::micro_scalar@16 (line 10)
ScopeDesc(pc=0x00007fd6ccf1d290 offset=2b0):
   App::micro_scalar@21 (line 10)
ScopeDesc(pc=0x00007fd6ccf1d29e offset=2be):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1d2a1 offset=2c1):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007fd6ccf1d2a6 offset=2c6):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007fd6ccf1d2c8 offset=2e8):
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
ScopeDesc(pc=0x00007fd6ccf1d304 offset=324):
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
ScopeDesc(pc=0x00007fd6ccf1d340 offset=360):
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
ScopeDesc(pc=0x00007fd6ccf1d378 offset=398):
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
ScopeDesc(pc=0x00007fd6ccf1d38c offset=3ac):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1d460 offset=480):
   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: stack[16],oop
    - l2: reg rbp [10],oop
    - l3: stack[0],oop
    - l4: stack[8]
ScopeDesc(pc=0x00007fd6ccf1d494 offset=4b4):
   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[16]
ScopeDesc(pc=0x00007fd6ccf1d4a8 offset=4c8):
   App::micro_scalar@3 (line 9)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007fd6ccf1cf08: 6400
relocInfo@0x00007fd6ccf1cf08 [type=6(runtime_call) addr=0x00007fd6ccf1cfe0 offset=0 format=1] | [destination=0x00007fd6d6014baa]
         @0x00007fd6ccf1cf0a: f001cc4d
relocInfo@0x00007fd6ccf1cf0c [type=12(metadata) addr=0x00007fd6ccf1d02d offset=77 format=3 data=1] | [metadata_addr=0x00007fd6ccf1d4e0 *=0x0000000800040c30 offset=0]metadata_value=0x0000000800040c30: {type array int}
         @0x00007fd6ccf1cf0e: f001cc20
relocInfo@0x00007fd6ccf1cf10 [type=12(metadata) addr=0x00007fd6ccf1d04d offset=32 format=3 data=1] | [metadata_addr=0x00007fd6ccf1d4e0 *=0x0000000800040c30 offset=0]metadata_value=0x0000000800040c30: {type array int}
         @0x00007fd6ccf1cf12: f001cc20
relocInfo@0x00007fd6ccf1cf14 [type=12(metadata) addr=0x00007fd6ccf1d06d offset=32 format=3 data=1] | [metadata_addr=0x00007fd6ccf1d4e0 *=0x0000000800040c30 offset=0]metadata_value=0x0000000800040c30: {type array int}
         @0x00007fd6ccf1cf16: a12a
relocInfo@0x00007fd6ccf1cf16 [type=10(poll) addr=0x00007fd6ccf1d197 offset=298]
         @0x00007fd6ccf1cf18: 652c
relocInfo@0x00007fd6ccf1cf18 [type=6(runtime_call) addr=0x00007fd6ccf1d2c3 offset=300 format=1] | [destination=0x00007fd6ccee6540]
         @0x00007fd6ccf1cf1a: f803d66d67b87fd67005
relocInfo@0x00007fd6ccf1cf22 [type=7(external_word) addr=0x00007fd6ccf1d2c8 offset=5 data={d66d67b87fd6}] | [target=0x00007fd6d66d67b8]
         @0x00007fd6ccf1cf24: 640e
relocInfo@0x00007fd6ccf1cf24 [type=6(runtime_call) addr=0x00007fd6ccf1d2d6 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1cf26: 6429
relocInfo@0x00007fd6ccf1cf26 [type=6(runtime_call) addr=0x00007fd6ccf1d2ff offset=41 format=1] | [destination=0x00007fd6ccee6540]
         @0x00007fd6ccf1cf28: f803d66d67b87fd67005
relocInfo@0x00007fd6ccf1cf30 [type=7(external_word) addr=0x00007fd6ccf1d304 offset=5 data={d66d67b87fd6}] | [target=0x00007fd6d66d67b8]
         @0x00007fd6ccf1cf32: 640e
relocInfo@0x00007fd6ccf1cf32 [type=6(runtime_call) addr=0x00007fd6ccf1d312 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1cf34: 6429
relocInfo@0x00007fd6ccf1cf34 [type=6(runtime_call) addr=0x00007fd6ccf1d33b offset=41 format=1] | [destination=0x00007fd6ccee6540]
         @0x00007fd6ccf1cf36: f803d66d67b87fd67005
relocInfo@0x00007fd6ccf1cf3e [type=7(external_word) addr=0x00007fd6ccf1d340 offset=5 data={d66d67b87fd6}] | [target=0x00007fd6d66d67b8]
         @0x00007fd6ccf1cf40: 640e
relocInfo@0x00007fd6ccf1cf40 [type=6(runtime_call) addr=0x00007fd6ccf1d34e offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1cf42: 6425
relocInfo@0x00007fd6ccf1cf42 [type=6(runtime_call) addr=0x00007fd6ccf1d373 offset=37 format=1] | [destination=0x00007fd6ccee6540]
         @0x00007fd6ccf1cf44: f803d66d67b87fd67005
relocInfo@0x00007fd6ccf1cf4c [type=7(external_word) addr=0x00007fd6ccf1d378 offset=5 data={d66d67b87fd6}] | [target=0x00007fd6d66d67b8]
         @0x00007fd6ccf1cf4e: 640e
relocInfo@0x00007fd6ccf1cf4e [type=6(runtime_call) addr=0x00007fd6ccf1d386 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1cf50: f803d686e9687fd6701f
relocInfo@0x00007fd6ccf1cf58 [type=7(external_word) addr=0x00007fd6ccf1d3a5 offset=31 data={d686e9687fd6}] | [target=0x00007fd6d686e968]
         @0x00007fd6ccf1cf5a: 640e
relocInfo@0x00007fd6ccf1cf5a [type=6(runtime_call) addr=0x00007fd6ccf1d3b3 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1cf5c: f803d686e9687fd67006
relocInfo@0x00007fd6ccf1cf64 [type=7(external_word) addr=0x00007fd6ccf1d3b9 offset=6 data={d686e9687fd6}] | [target=0x00007fd6d686e968]
         @0x00007fd6ccf1cf66: 640e
relocInfo@0x00007fd6ccf1cf66 [type=6(runtime_call) addr=0x00007fd6ccf1d3c7 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1cf68: f803d686e9687fd67006
relocInfo@0x00007fd6ccf1cf70 [type=7(external_word) addr=0x00007fd6ccf1d3cd offset=6 data={d686e9687fd6}] | [target=0x00007fd6d686e968]
         @0x00007fd6ccf1cf72: 640e
relocInfo@0x00007fd6ccf1cf72 [type=6(runtime_call) addr=0x00007fd6ccf1d3db offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1cf74: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1cf7c [type=7(external_word) addr=0x00007fd6ccf1d3e1 offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1cf7e: 640e
relocInfo@0x00007fd6ccf1cf7e [type=6(runtime_call) addr=0x00007fd6ccf1d3ef offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1cf80: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1cf88 [type=7(external_word) addr=0x00007fd6ccf1d3f5 offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1cf8a: 640e
relocInfo@0x00007fd6ccf1cf8a [type=6(runtime_call) addr=0x00007fd6ccf1d403 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1cf8c: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1cf94 [type=7(external_word) addr=0x00007fd6ccf1d409 offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1cf96: 640e
relocInfo@0x00007fd6ccf1cf96 [type=6(runtime_call) addr=0x00007fd6ccf1d417 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1cf98: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1cfa0 [type=7(external_word) addr=0x00007fd6ccf1d41d offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1cfa2: 640e
relocInfo@0x00007fd6ccf1cfa2 [type=6(runtime_call) addr=0x00007fd6ccf1d42b offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1cfa4: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1cfac [type=7(external_word) addr=0x00007fd6ccf1d431 offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1cfae: 640e
relocInfo@0x00007fd6ccf1cfae [type=6(runtime_call) addr=0x00007fd6ccf1d43f offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1cfb0: 641c
relocInfo@0x00007fd6ccf1cfb0 [type=6(runtime_call) addr=0x00007fd6ccf1d45b offset=28 format=1] | [destination=0x00007fd6ccee6540]
         @0x00007fd6ccf1cfb2: f803d66d67b87fd67005
relocInfo@0x00007fd6ccf1cfba [type=7(external_word) addr=0x00007fd6ccf1d460 offset=5 data={d66d67b87fd6}] | [target=0x00007fd6d66d67b8]
         @0x00007fd6ccf1cfbc: 640e
relocInfo@0x00007fd6ccf1cfbc [type=6(runtime_call) addr=0x00007fd6ccf1d46e offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1cfbe: 6421
relocInfo@0x00007fd6ccf1cfbe [type=6(runtime_call) addr=0x00007fd6ccf1d48f offset=33 format=1] | [destination=0x00007fd6ccee6540]
         @0x00007fd6ccf1cfc0: f803d66d67b87fd67005
relocInfo@0x00007fd6ccf1cfc8 [type=7(external_word) addr=0x00007fd6ccf1d494 offset=5 data={d66d67b87fd6}] | [target=0x00007fd6d66d67b8]
         @0x00007fd6ccf1cfca: 640e
relocInfo@0x00007fd6ccf1cfca [type=6(runtime_call) addr=0x00007fd6ccf1d4a2 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1cfcc: 001e
relocInfo@0x00007fd6ccf1cfcc [type=0(none) addr=0x00007fd6ccf1d4c0 offset=30]
         @0x00007fd6ccf1cfce: 6400
relocInfo@0x00007fd6ccf1cfce [type=6(runtime_call) addr=0x00007fd6ccf1d4c0 offset=0 format=1] | [destination=0x00007fd6cce2c6a0]
         @0x00007fd6ccf1cfd0: 640f
relocInfo@0x00007fd6ccf1cfd0 [type=6(runtime_call) addr=0x00007fd6ccf1d4cf offset=15 format=1] | [destination=0x00007fd6ccee6860]
         @0x00007fd6ccf1cfd2: 0000
relocInfo@0x00007fd6ccf1cfd2 [type=0(none) addr=0x00007fd6ccf1d4cf offset=0]
         @0x00007fd6ccf1cfd4: 0000
relocInfo@0x00007fd6ccf1cfd4 [type=0(none) addr=0x00007fd6ccf1d4cf offset=0]
         @0x00007fd6ccf1cfd6: 0000
relocInfo@0x00007fd6ccf1cfd6 [type=0(none) addr=0x00007fd6ccf1d4cf offset=0]
         @0x00007fd6ccf1cfd8: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 3 entries, 28 bytes):
{
   < 0x00007fd6ccf1d080, 0x00007fd6ccf1d474 > < 0x00007fd6ccf1d084, 0x00007fd6ccf1d474 > < 0x00007fd6ccf1d088, 0x00007fd6ccf1d474 > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x000000010110de48 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de48}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
#0: 0x0000000000000000 NULL-oop
#1: 0x0000000800040c30 {type array int}
#2: 0x00007fd66fc116e8 {method} {0x00007fd66fc116e8} 'micro_scalar' '([I[I[I)V' in 'App'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 100 ------------------------
{method}
 - this oop:          0x00007fd66fc116e8
 - method holder:     'App'
 - constants:         0x00007fd66fc11090 constant pool [134]/operands[15] {0x00007fd66fc11090} for 'App' cache=0x00007fd66ff00000
 - access:            0xc1000001  public 
 - name:              'micro_scalar'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        5
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007fd6ccdde220
 - adapters:          AHE@0x00007fd6d03a4520: 0xbbbb0000 i2c: 0x00007fd6cce4f6e0 c2i: 0x00007fd6cce4f7cc c2iUV: 0x00007fd6cce4f796 c2iNCI: 0x00007fd6cce4f809
 - compiled entry     0x00007fd6cce4f7cc
 - code size:         30
 - code start:        0x00007fd66fc116c0
 - code end (excl):   0x00007fd66fc116de
 - method data:       0x00007fd66fc11db0
 - checked ex length: 0
 - linenumber start:  0x00007fd66fc116de
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
000     N534: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
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
        nop 	# 2 bytes pad for loops and calls
040     testq   R14, R14	# ptr
043     je     B44  P=0.001000 C=-1.000000

049     B2: #	out( B58 B3 ) <- in( B1 )  Freq: 0.999
049     movl    R11, [R14 + #8 (8-bit)]	# compressed klass ptr
04d     cmpl    R11, narrowklass: precise klass [I: 0x00007fd650014ea0:Constant:exact *	# compressed klass ptr
054     jne,u   B58  P=0.000001 C=-1.000000

05a     B3: #	out( B4 ) <- in( B2 )  Freq: 0.998999
05a     movq    R11, R14	# spill
05d     # checkcastPP of R11

05d     B4: #	out( B45 B5 ) <- in( B3 B44 )  Freq: 0.999999
        nop 	# 3 bytes pad for loops and calls
060     testq   RBP, RBP	# ptr
063     je     B45  P=0.001000 C=-1.000000

069     B5: #	out( B58 B6 ) <- in( B4 )  Freq: 0.998999
069     movl    R10, [RBP + #8 (8-bit)]	# compressed klass ptr
06d     cmpl    R10, narrowklass: precise klass [I: 0x00007fd650014ea0:Constant:exact *	# compressed klass ptr
074     jne,u   B58  P=0.000001 C=-1.000000

07a     B6: #	out( B7 ) <- in( B5 )  Freq: 0.998998
07a     movq    R8, RBP	# spill
07d     # checkcastPP of R8

07d     B7: #	out( B46 B8 ) <- in( B6 B45 )  Freq: 0.999998
        nop 	# 3 bytes pad for loops and calls
080     testq   RBX, RBX	# ptr
083     je     B46  P=0.001000 C=-1.000000

089     B8: #	out( B58 B9 ) <- in( B7 )  Freq: 0.998998
089     movl    R9, [RBX + #8 (8-bit)]	# compressed klass ptr
08d     cmpl    R9, narrowklass: precise klass [I: 0x00007fd650014ea0:Constant:exact *	# compressed klass ptr
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
0ae     jge     B43  P=0.000010 C=3108068.000000

0b4     B14: #	out( B15 ) <- in( B13 )  Freq: 0.999984
0b4     movl    R10, R11	# ptr -> int
0b7     movl    RCX, R13	# spill
0ba     incl    RCX	# int
0bc     shrl    R10, #2
0c0     andl    R10, #7	# int
0c4     xorl    R9, R9	# int
0c7     cmpl    RCX, R9
0ca     cmovllt RCX, R9	# max
0ce     cmpl    RCX, R9
0d1     cmovllt RCX, R9	# max
0d5     cmpl    RCX, R14
0d8     cmovlgt RCX, R14	# min
0dc     addl    R10, RCX	# int
0df     movl    RSI, #4	# int
0e4     subl    RSI, R10	# int
0e7     andl    RSI, #7	# int
0ea     addl    RSI, RCX	# int
0ec     cmpl    RSI, R14
0ef     cmovlgt RSI, R14	# min

0f3     B15: #	out( B47 B16 ) <- in( B14 B18 ) Loop( B15-B18 inner pre of N415) Freq: 1.99996
0f3     cmpl    R13, RDI	# unsigned
0f6     jnb,u   B47  P=0.000001 C=-1.000000

0fc     B16: #	out( B48 B17 ) <- in( B15 )  Freq: 1.99996
0fc     movl    RBP, [R8 + #16 + R13 << #2]	# int
101     cmpl    R13, RDX	# unsigned
104     jnb,u   B48  P=0.000001 C=-1.000000

10a     B17: #	out( B49 B18 ) <- in( B16 )  Freq: 1.99996
10a     addl    RBP, [RBX + #16 + R13 << #2]	# int
10f     cmpl    R13, R14	# unsigned
112     jnb,u   B49  P=0.000001 C=-1.000000

118     B18: #	out( B15 B19 ) <- in( B17 )  Freq: 1.99996
118     movl    [R11 + #16 + R13 << #2], RBP	# int
11d     incl    R13	# int
120     cmpl    R13, RSI
123     jl,s   B15	# loop end  P=0.500000 C=3108068.000000

125     B19: #	out( B37 B20 ) <- in( B18 )  Freq: 0.999978
125     cmpl    RDI, RDX
127     movl    RSI, RDI	# spill
129     cmovlgt RSI, RDX	# min
12c     cmpl    RSI, R14
12f     cmovlgt RSI, R14	# min
133     movl    R10, RSI	# spill
136     addl    R10, #-31	# int
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
172     addl    RCX, #31	# int
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
1a6     movl    RCX, #32000	# int
1ab     # TLS is in R15
1ab     jmp,s   B30

1ad     B29: #	out( B30 ) <- in( B32 ) top-of-loop Freq: 100458
1ad     movdl   RDI, XMM1	# spill

1b1     B30: #	out( B31 ) <- in( B28 B29 ) Loop( B30-B29 ) Freq: 100459
1b1     movl    RAX, R10	# spill
1b4     subl    RAX, R13	# int
1b7     cmpl    R10, R13
1ba     cmovll RAX, R9	# signed, int
1be     cmpl    RAX, #32000	# unsigned
1c4     cmovlnbe RAX, RCX	# unsigned, int
1c7     addl    RAX, R13	# int
1ca     movdl   XMM1, RDI	# spill
        nop 	# 2 bytes pad for loops and calls

1d0     B31: #	out( B31 B32 ) <- in( B30 B31 ) Loop( B31-B31 inner main of N226 strip mined) Freq: 1.00924e+10
1d0     load_vector XMM0,[RBX + #16 + R13 << #2]
1d7     vpaddd  XMM0,XMM0,[R8 + #16 + R13 << #2]	! add packedI
1de     store_vector [R11 + #16 + R13 << #2],XMM0
	
1e5     movslq  RDI, R13	# i2l
1e8     load_vector XMM0,[RBX + #48 + RDI << #2]
1ee     vpaddd  XMM0,XMM0,[R8 + #48 + RDI << #2]	! add packedI
1f5     store_vector [R11 + #48 + RDI << #2],XMM0
	
1fc     load_vector XMM0,[RBX + #80 + RDI << #2]
202     vpaddd  XMM0,XMM0,[R8 + #80 + RDI << #2]	! add packedI
209     store_vector [R11 + #80 + RDI << #2],XMM0
	
210     load_vector XMM0,[RBX + #112 + RDI << #2]
216     vpaddd  XMM0,XMM0,[R8 + #112 + RDI << #2]	! add packedI
21d     store_vector [R11 + #112 + RDI << #2],XMM0
	
224     addl    R13, #32	# int
228     cmpl    R13, RAX
22b     jl,s   B31	# loop end  P=0.999990 C=3108068.000000

22d     B32: #	out( B29 B33 ) <- in( B31 )  Freq: 100459
22d     movq    RDI, [R15 + #304 (32-bit)]	# ptr
234     testl   rax, [RDI]	# Safepoint: poll for GC        # App::micro_scalar @ bci:26 (line 9) L[0]=_ L[1]=R11 L[2]=R8 L[3]=RBX L[4]=R13
        # OopMap {r11=Oop r8=Oop rbx=Oop off=564/0x234}
236     cmpl    R13, R10
239     jl     B29  P=0.999990 C=3108068.000000

23f     B33: #	out( B36 B34 ) <- in( B32 )  Freq: 0.999969
23f     movl    R9, RSI	# spill
242     addl    R9, #-7	# int
246     cmpl    RSI, R9
249     cmovll R9, RBP	# signed, int
24d     cmpl    R13, R9
250     jge,s   B36  P=0.500000 C=-1.000000

252     B34: #	out( B35 ) <- in( B33 )  Freq: 0.499984
252     # castII of R13
        nop 	# 2 bytes pad for loops and calls

254     B35: #	out( B35 B36 ) <- in( B34 B35 ) Loop( B35-B35 inner post of N1070) Freq: 0.999969
254     load_vector XMM0,[RBX + #16 + R13 << #2]
25b     vpaddd  XMM0,XMM0,[R8 + #16 + R13 << #2]	! add packedI
262     store_vector [R11 + #16 + R13 << #2],XMM0
	
269     addl    R13, #8	# int
26d     cmpl    R13, R9
270     jl,s   B35	# loop end  P=0.500000 C=3108068.000000

272     B36: #	out( B37 ) <- in( B35 B33 )  Freq: 0.999969
272     movdl   RDI, XMM1	# spill

276     B37: #	out( B43 B38 ) <- in( B19 B36 )  Freq: 0.99997
276     cmpl    R13, R14
279     jge     B43  P=0.500000 C=-1.000000

27f     B38: #	out( B39 ) <- in( B37 )  Freq: 0.499985
27f     # castII of R13
        nop 	# 1 bytes pad for loops and calls

280     B39: #	out( B47 B40 ) <- in( B38 B42 ) Loop( B39-B42 inner post of N415) Freq: 0.999967
280     cmpl    R13, RDI	# unsigned
283     jnb,u   B47  P=0.000001 C=-1.000000

289     B40: #	out( B48 B41 ) <- in( B39 )  Freq: 0.999966
289     movl    RBP, [R8 + #16 + R13 << #2]	# int
28e     cmpl    R13, RDX	# unsigned
291     jnb,u   B48  P=0.000001 C=-1.000000

297     B41: #	out( B49 B42 ) <- in( B40 )  Freq: 0.999965
297     addl    RBP, [RBX + #16 + R13 << #2]	# int
        nop 	# 4 bytes pad for loops and calls
2a0     cmpl    R13, R14	# unsigned
2a3     jnb,u   B49  P=0.000001 C=-1.000000

2a9     B42: #	out( B39 B43 ) <- in( B41 )  Freq: 0.999964
2a9     movl    [R11 + #16 + R13 << #2], RBP	# int
2ae     incl    R13	# int
2b1     cmpl    R13, R14
2b4     jl,s   B39	# loop end  P=0.500000 C=3108068.000000

2b6     B43: #	out( N534 ) <- in( B13 B42 B37 )  Freq: 0.999977
2b6     vzeroupper
	addq    rsp, 80	# Destroy frame
	popq    rbp
	cmpq     rsp, poll_offset[r15_thread] 
	ja       #safepoint_stub	# Safepoint: poll for GC

2cb     ret

2cc     B44: #	out( B4 ) <- in( B1 )  Freq: 0.000999987
2cc     xorl    R11, R11	# ptr
2cf     jmp     B4

2d4     B45: #	out( B7 ) <- in( B4 )  Freq: 0.000999986
2d4     xorl    R8, R8	# ptr
2d7     jmp     B7

2dc     B46: #	out( B10 ) <- in( B7 )  Freq: 0.000999985
2dc     xorl    RBX, RBX	# ptr
        nop 	# 2 bytes pad for loops and calls
2e0     jmp     B10

2e5     B47: #	out( N534 ) <- in( B39 B15 )  Freq: 3.03976e-06
2e5     movl    RSI, #-28	# int
2ea     movq    [rsp + #8], RBX	# spill
2ef     movq    [rsp + #24], R11	# spill
2f4     movl    [rsp + #20], R13	# spill
2f9     movq    [rsp + #32], R8	# spill
2fe     movl    [rsp + #40], R13	# spill
        nop 	# 1 bytes pad for loops and calls
304     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # App::micro_scalar @ bci:16 (line 10) L[0]=_ L[1]=rsp + #24 L[2]=rsp + #32 L[3]=rsp + #8 L[4]=rsp + #20 STK[0]=rsp + #24 STK[1]=rsp + #40 STK[2]=rsp + #32 STK[3]=rsp + #20
        # OopMap {[8]=Oop [24]=Oop [32]=Oop off=780/0x30c}
30c     stop	# ShouldNotReachHere

320     B48: #	out( N534 ) <- in( B40 B16 )  Freq: 3.03976e-06
320     movl    RSI, #-28	# int
325     movq    [rsp + #8], R8	# spill
32a     movq    [rsp + #32], R11	# spill
32f     movl    [rsp + #28], R13	# spill
334     movq    [rsp + #40], RBX	# spill
339     movl    [rsp + #48], R13	# spill
        nop 	# 2 bytes pad for loops and calls
340     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # App::micro_scalar @ bci:20 (line 10) L[0]=_ L[1]=rsp + #32 L[2]=rsp + #8 L[3]=rsp + #40 L[4]=rsp + #28 STK[0]=rsp + #32 STK[1]=rsp + #48 STK[2]=RBP STK[3]=rsp + #40 STK[4]=rsp + #28
        # OopMap {[8]=Oop [32]=Oop [40]=Oop off=840/0x348}
348     stop	# ShouldNotReachHere

35c     B49: #	out( N534 ) <- in( B41 B17 )  Freq: 3.03976e-06
35c     movl    RSI, #-28	# int
361     movq    [rsp + #8], R8	# spill
366     movq    [rsp + #16], RBX	# spill
36b     movq    [rsp + #32], R11	# spill
370     movl    [rsp + #28], R13	# spill
        nop 	# 3 bytes pad for loops and calls
378     call,static  wrapper for: uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')
        # App::micro_scalar @ bci:22 (line 10) L[0]=_ L[1]=rsp + #32 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=rsp + #28 STK[0]=rsp + #32 STK[1]=rsp + #28 STK[2]=RBP
        # OopMap {[8]=Oop [16]=Oop [32]=Oop off=896/0x380}
380     stop	# ShouldNotReachHere

394     B50: #	out( N534 ) <- in( B20 )  Freq: 1.01326e-06
394     stop	# ShouldNotReachHere

3a8     B51: #	out( N534 ) <- in( B21 )  Freq: 1.01325e-06
3a8     stop	# ShouldNotReachHere

3bc     B52: #	out( N534 ) <- in( B22 )  Freq: 1.01325e-06
3bc     stop	# ShouldNotReachHere

3d0     B53: #	out( N534 ) <- in( B23 )  Freq: 1.01325e-06
3d0     stop	# ShouldNotReachHere

3e4     B54: #	out( N534 ) <- in( B24 )  Freq: 1.01325e-06
3e4     stop	# ShouldNotReachHere

3f8     B55: #	out( N534 ) <- in( B25 )  Freq: 1.01325e-06
3f8     stop	# ShouldNotReachHere

40c     B56: #	out( N534 ) <- in( B26 )  Freq: 1.01325e-06
40c     stop	# ShouldNotReachHere

420     B57: #	out( N534 ) <- in( B27 )  Freq: 1.01325e-06
420     stop	# ShouldNotReachHere

434     B58: #	out( N534 ) <- in( B2 B5 B8 )  Freq: 2.997e-06
434     movl    RSI, #-115	# int
439     movq    [rsp + #0], RBX	# spill
43d     movl    [rsp + #8], R13	# spill
442     movq    [rsp + #16], R14	# spill
        nop 	# 1 bytes pad for loops and calls
448     call,static  wrapper for: uncommon_trap(reason='constraint' action='reinterpret' debug_id='0')
        # App::micro_scalar @ bci:3 (line 9) L[0]=_ L[1]=rsp + #16 L[2]=RBP L[3]=rsp + #0 L[4]=rsp + #8
        # OopMap {rbp=Oop [0]=Oop [16]=Oop off=1104/0x450}
450     stop	# ShouldNotReachHere

464     B59: #	out( N534 ) <- in( B12 B11 )  Freq: 2.02655e-06
464     movl    RSI, #-66	# int
469     movq    RBP, R11	# spill
46c     movq    [rsp + #0], R8	# spill
470     movq    [rsp + #8], RBX	# spill
475     movl    [rsp + #16], R13	# spill
        nop 	# 2 bytes pad for loops and calls
47c     call,static  wrapper for: uncommon_trap(reason='profile_predicate' action='maybe_recompile' debug_id='0')
        # App::micro_scalar @ bci:3 (line 9) L[0]=_ L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #8 L[4]=rsp + #16
        # OopMap {rbp=Oop [0]=Oop [8]=Oop off=1156/0x484}
484     stop	# ShouldNotReachHere

498     B60: #	out( N534 ) <- in( B10 )  Freq: 1.01328e-06
498     movl    RSI, #-138	# int
49d     movq    RBP, R11	# spill
4a0     movq    [rsp + #0], R8	# spill
4a4     movq    [rsp + #8], RBX	# spill
4a9     movl    [rsp + #16], R13	# spill
        nop 	# 2 bytes pad for loops and calls
4b0     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_scalar @ bci:3 (line 9) L[0]=_ L[1]=RBP L[2]=rsp + #0 L[3]=rsp + #8 L[4]=rsp + #16
        # OopMap {rbp=Oop [0]=Oop [8]=Oop off=1208/0x4b8}
4b8     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    1592  100 %           App::micro_scalar @ 3 (30 bytes)
 total in heap  [0x00007fd6ccf1f590,0x00007fd6ccf20048] = 2744
 relocation     [0x00007fd6ccf1f708,0x00007fd6ccf1f7e0] = 216
 main code      [0x00007fd6ccf1f7e0,0x00007fd6ccf1fce0] = 1280
 stub code      [0x00007fd6ccf1fce0,0x00007fd6ccf1fcf8] = 24
 oops           [0x00007fd6ccf1fcf8,0x00007fd6ccf1fd00] = 8
 metadata       [0x00007fd6ccf1fd00,0x00007fd6ccf1fd10] = 16
 scopes data    [0x00007fd6ccf1fd10,0x00007fd6ccf1fde0] = 208
 scopes pcs     [0x00007fd6ccf1fde0,0x00007fd6ccf20020] = 576
 dependencies   [0x00007fd6ccf20020,0x00007fd6ccf20028] = 8
 nul chk table  [0x00007fd6ccf20028,0x00007fd6ccf20048] = 32

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007fd66fc116e8} 'micro_scalar' '([I[I[I)V' in 'App'
 ;; N534: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fd6ccf1f7e0:   callq  0x00007fd6d6014baa           ;   {runtime_call os::breakpoint()}
  0x00007fd6ccf1f7e5:   nop
  0x00007fd6ccf1f7e6:   nop
  0x00007fd6ccf1f7e7:   nop
  0x00007fd6ccf1f7e8:   nop
  0x00007fd6ccf1f7e9:   nop
  0x00007fd6ccf1f7ea:   nop
  0x00007fd6ccf1f7eb:   nop
  0x00007fd6ccf1f7ec:   nop
  0x00007fd6ccf1f7ed:   nop
  0x00007fd6ccf1f7ee:   nop
  0x00007fd6ccf1f7ef:   nop
 ;; B1: #	out( B44 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fd6ccf1f7f0:   mov    %eax,-0x16000(%rsp)
  0x00007fd6ccf1f7f7:   push   %rbp
  0x00007fd6ccf1f7f8:   sub    $0x50,%rsp
  0x00007fd6ccf1f7fc:   mov    0x18(%rsi),%r14
  0x00007fd6ccf1f800:   mov    0x10(%rsi),%rbp
  0x00007fd6ccf1f804:   mov    (%rsi),%r13d
  0x00007fd6ccf1f807:   mov    0x8(%rsi),%rbx
  0x00007fd6ccf1f80b:   mov    %rsi,%rdi
  0x00007fd6ccf1f80e:   vzeroupper 
  0x00007fd6ccf1f811:   movabs $0x7fd6d6111410,%r10
  0x00007fd6ccf1f81b:   callq  *%r10
  0x00007fd6ccf1f81e:   nop
  0x00007fd6ccf1f81f:   nop
  0x00007fd6ccf1f820:   test   %r14,%r14
  0x00007fd6ccf1f823:   je     0x00007fd6ccf1faac
 ;; B2: #	out( B58 B3 ) <- in( B1 )  Freq: 0.999
  0x00007fd6ccf1f829:   mov    0x8(%r14),%r11d
  0x00007fd6ccf1f82d:   cmp    $0x40c30,%r11d               ;   {metadata({type array int})}
  0x00007fd6ccf1f834:   jne    0x00007fd6ccf1fc14
 ;; B3: #	out( B4 ) <- in( B2 )  Freq: 0.998999
  0x00007fd6ccf1f83a:   mov    %r14,%r11
 ;; B4: #	out( B45 B5 ) <- in( B3 B44 )  Freq: 0.999999
  0x00007fd6ccf1f83d:   nop
  0x00007fd6ccf1f83e:   nop
  0x00007fd6ccf1f83f:   nop
  0x00007fd6ccf1f840:   test   %rbp,%rbp
  0x00007fd6ccf1f843:   je     0x00007fd6ccf1fab4
 ;; B5: #	out( B58 B6 ) <- in( B4 )  Freq: 0.998999
  0x00007fd6ccf1f849:   mov    0x8(%rbp),%r10d
  0x00007fd6ccf1f84d:   cmp    $0x40c30,%r10d               ;   {metadata({type array int})}
  0x00007fd6ccf1f854:   jne    0x00007fd6ccf1fc14
 ;; B6: #	out( B7 ) <- in( B5 )  Freq: 0.998998
  0x00007fd6ccf1f85a:   mov    %rbp,%r8
 ;; B7: #	out( B46 B8 ) <- in( B6 B45 )  Freq: 0.999998
  0x00007fd6ccf1f85d:   nop
  0x00007fd6ccf1f85e:   nop
  0x00007fd6ccf1f85f:   nop
  0x00007fd6ccf1f860:   test   %rbx,%rbx
  0x00007fd6ccf1f863:   je     0x00007fd6ccf1fabc
 ;; B8: #	out( B58 B9 ) <- in( B7 )  Freq: 0.998998
  0x00007fd6ccf1f869:   mov    0x8(%rbx),%r9d
  0x00007fd6ccf1f86d:   cmp    $0x40c30,%r9d                ;   {metadata({type array int})}
  0x00007fd6ccf1f874:   jne    0x00007fd6ccf1fc14           ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
 ;; B9: #	out( B10 ) <- in( B8 )  Freq: 0.998997
 ;; B10: #	out( B60 B11 ) <- in( B9 B46 )  Freq: 0.999997
  0x00007fd6ccf1f87a:   nop
  0x00007fd6ccf1f87b:   nop
  0x00007fd6ccf1f87c:   nop
  0x00007fd6ccf1f87d:   nop
  0x00007fd6ccf1f87e:   nop
  0x00007fd6ccf1f87f:   nop
  0x00007fd6ccf1f880:   mov    0xc(%r11),%r14d              ; implicit exception: dispatches to 0x00007fd6ccf1fc78
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@6 (line 9)
 ;; B11: #	out( B59 B12 ) <- in( B10 )  Freq: 0.999996
  0x00007fd6ccf1f884:   mov    0xc(%r8),%edi                ; implicit exception: dispatches to 0x00007fd6ccf1fc44
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
 ;; B12: #	out( B59 B13 ) <- in( B11 )  Freq: 0.999995
  0x00007fd6ccf1f888:   mov    0xc(%rbx),%edx               ; implicit exception: dispatches to 0x00007fd6ccf1fc44
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
 ;; B13: #	out( B43 B14 ) <- in( B12 )  Freq: 0.999994
  0x00007fd6ccf1f88b:   cmp    %r14d,%r13d
  0x00007fd6ccf1f88e:   jge    0x00007fd6ccf1fa96           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B14: #	out( B15 ) <- in( B13 )  Freq: 0.999984
  0x00007fd6ccf1f894:   mov    %r11d,%r10d
  0x00007fd6ccf1f897:   mov    %r13d,%ecx
  0x00007fd6ccf1f89a:   inc    %ecx
  0x00007fd6ccf1f89c:   shr    $0x2,%r10d
  0x00007fd6ccf1f8a0:   and    $0x7,%r10d
  0x00007fd6ccf1f8a4:   xor    %r9d,%r9d
  0x00007fd6ccf1f8a7:   cmp    %r9d,%ecx
  0x00007fd6ccf1f8aa:   cmovl  %r9d,%ecx
  0x00007fd6ccf1f8ae:   cmp    %r9d,%ecx
  0x00007fd6ccf1f8b1:   cmovl  %r9d,%ecx
  0x00007fd6ccf1f8b5:   cmp    %r14d,%ecx
  0x00007fd6ccf1f8b8:   cmovg  %r14d,%ecx
  0x00007fd6ccf1f8bc:   add    %ecx,%r10d
  0x00007fd6ccf1f8bf:   mov    $0x4,%esi
  0x00007fd6ccf1f8c4:   sub    %r10d,%esi
  0x00007fd6ccf1f8c7:   and    $0x7,%esi
  0x00007fd6ccf1f8ca:   add    %ecx,%esi
  0x00007fd6ccf1f8cc:   cmp    %r14d,%esi
  0x00007fd6ccf1f8cf:   cmovg  %r14d,%esi                   ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
 ;; B15: #	out( B47 B16 ) <- in( B14 B18 ) Loop( B15-B18 inner pre of N415) Freq: 1.99996
  0x00007fd6ccf1f8d3:   cmp    %edi,%r13d
  0x00007fd6ccf1f8d6:   jae    0x00007fd6ccf1fac5
 ;; B16: #	out( B48 B17 ) <- in( B15 )  Freq: 1.99996
  0x00007fd6ccf1f8dc:   mov    0x10(%r8,%r13,4),%ebp        ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007fd6ccf1f8e1:   cmp    %edx,%r13d
  0x00007fd6ccf1f8e4:   jae    0x00007fd6ccf1fb00
 ;; B17: #	out( B49 B18 ) <- in( B16 )  Freq: 1.99996
  0x00007fd6ccf1f8ea:   add    0x10(%rbx,%r13,4),%ebp       ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@21 (line 10)
  0x00007fd6ccf1f8ef:   cmp    %r14d,%r13d
  0x00007fd6ccf1f8f2:   jae    0x00007fd6ccf1fb3c
 ;; B18: #	out( B15 B19 ) <- in( B17 )  Freq: 1.99996
  0x00007fd6ccf1f8f8:   mov    %ebp,0x10(%r11,%r13,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007fd6ccf1f8fd:   inc    %r13d                        ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007fd6ccf1f900:   cmp    %esi,%r13d
  0x00007fd6ccf1f903:   jl     0x00007fd6ccf1f8d3           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B19: #	out( B37 B20 ) <- in( B18 )  Freq: 0.999978
  0x00007fd6ccf1f905:   cmp    %edx,%edi
  0x00007fd6ccf1f907:   mov    %edi,%esi
  0x00007fd6ccf1f909:   cmovg  %edx,%esi
  0x00007fd6ccf1f90c:   cmp    %r14d,%esi
  0x00007fd6ccf1f90f:   cmovg  %r14d,%esi
  0x00007fd6ccf1f913:   mov    %esi,%r10d
  0x00007fd6ccf1f916:   add    $0xffffffe1,%r10d
  0x00007fd6ccf1f91a:   mov    $0x80000000,%ebp
  0x00007fd6ccf1f91f:   cmp    %r10d,%esi
  0x00007fd6ccf1f922:   cmovl  %ebp,%r10d
  0x00007fd6ccf1f926:   cmp    %r10d,%r13d
  0x00007fd6ccf1f929:   jge    0x00007fd6ccf1fa56
 ;; B20: #	out( B50 B21 ) <- in( B19 )  Freq: 0.999977
  0x00007fd6ccf1f92f:   cmp    %edi,%r13d
  0x00007fd6ccf1f932:   jae    0x00007fd6ccf1fb74
 ;; B21: #	out( B51 B22 ) <- in( B20 )  Freq: 0.999976
  0x00007fd6ccf1f938:   cmp    %edx,%r13d
  0x00007fd6ccf1f93b:   nop
  0x00007fd6ccf1f93c:   nop
  0x00007fd6ccf1f93d:   nop
  0x00007fd6ccf1f93e:   nop
  0x00007fd6ccf1f93f:   nop
  0x00007fd6ccf1f940:   jae    0x00007fd6ccf1fb88
 ;; B22: #	out( B52 B23 ) <- in( B21 )  Freq: 0.999975
  0x00007fd6ccf1f946:   cmp    %r14d,%r13d
  0x00007fd6ccf1f949:   jae    0x00007fd6ccf1fb9c
 ;; B23: #	out( B53 B24 ) <- in( B22 )  Freq: 0.999974
  0x00007fd6ccf1f94f:   mov    %r13d,%ecx
  0x00007fd6ccf1f952:   add    $0x1f,%ecx
  0x00007fd6ccf1f955:   cmp    %r14d,%ecx
  0x00007fd6ccf1f958:   jae    0x00007fd6ccf1fbb0
 ;; B24: #	out( B54 B25 ) <- in( B23 )  Freq: 0.999973
  0x00007fd6ccf1f95e:   nop
  0x00007fd6ccf1f95f:   nop
  0x00007fd6ccf1f960:   cmp    %edx,%ecx
  0x00007fd6ccf1f962:   jae    0x00007fd6ccf1fbc4
 ;; B25: #	out( B55 B26 ) <- in( B24 )  Freq: 0.999972
  0x00007fd6ccf1f968:   cmp    %edx,%r13d
  0x00007fd6ccf1f96b:   jae    0x00007fd6ccf1fbd8
 ;; B26: #	out( B56 B27 ) <- in( B25 )  Freq: 0.999971
  0x00007fd6ccf1f971:   cmp    %edi,%ecx
  0x00007fd6ccf1f973:   jae    0x00007fd6ccf1fbec
 ;; B27: #	out( B57 B28 ) <- in( B26 )  Freq: 0.99997
  0x00007fd6ccf1f979:   cmp    %edi,%r13d
  0x00007fd6ccf1f97c:   nop
  0x00007fd6ccf1f97d:   nop
  0x00007fd6ccf1f97e:   nop
  0x00007fd6ccf1f97f:   nop
  0x00007fd6ccf1f980:   jae    0x00007fd6ccf1fc00
 ;; B28: #	out( B30 ) <- in( B27 )  Freq: 0.999969
  0x00007fd6ccf1f986:   mov    $0x7d00,%ecx                 ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
  0x00007fd6ccf1f98b:   jmp    0x00007fd6ccf1f991
 ;; B29: #	out( B30 ) <- in( B32 ) top-of-loop Freq: 100458
  0x00007fd6ccf1f98d:   vmovd  %xmm1,%edi
 ;; B30: #	out( B31 ) <- in( B28 B29 ) Loop( B30-B29 ) Freq: 100459
  0x00007fd6ccf1f991:   mov    %r10d,%eax
  0x00007fd6ccf1f994:   sub    %r13d,%eax
  0x00007fd6ccf1f997:   cmp    %r13d,%r10d
  0x00007fd6ccf1f99a:   cmovl  %r9d,%eax
  0x00007fd6ccf1f99e:   cmp    $0x7d00,%eax
  0x00007fd6ccf1f9a4:   cmova  %ecx,%eax
  0x00007fd6ccf1f9a7:   add    %r13d,%eax
  0x00007fd6ccf1f9aa:   vmovd  %edi,%xmm1
  0x00007fd6ccf1f9ae:   nop
  0x00007fd6ccf1f9af:   nop
 ;; B31: #	out( B31 B32 ) <- in( B30 B31 ) Loop( B31-B31 inner main of N226 strip mined) Freq: 1.00924e+10
  0x00007fd6ccf1f9b0:   vmovdqu 0x10(%rbx,%r13,4),%ymm0
  0x00007fd6ccf1f9b7:   vpaddd 0x10(%r8,%r13,4),%ymm0,%ymm0
  0x00007fd6ccf1f9be:   vmovdqu %ymm0,0x10(%r11,%r13,4)
  0x00007fd6ccf1f9c5:   movslq %r13d,%rdi
  0x00007fd6ccf1f9c8:   vmovdqu 0x30(%rbx,%rdi,4),%ymm0
  0x00007fd6ccf1f9ce:   vpaddd 0x30(%r8,%rdi,4),%ymm0,%ymm0
  0x00007fd6ccf1f9d5:   vmovdqu %ymm0,0x30(%r11,%rdi,4)
  0x00007fd6ccf1f9dc:   vmovdqu 0x50(%rbx,%rdi,4),%ymm0
  0x00007fd6ccf1f9e2:   vpaddd 0x50(%r8,%rdi,4),%ymm0,%ymm0
  0x00007fd6ccf1f9e9:   vmovdqu %ymm0,0x50(%r11,%rdi,4)
  0x00007fd6ccf1f9f0:   vmovdqu 0x70(%rbx,%rdi,4),%ymm0
  0x00007fd6ccf1f9f6:   vpaddd 0x70(%r8,%rdi,4),%ymm0,%ymm0
  0x00007fd6ccf1f9fd:   vmovdqu %ymm0,0x70(%r11,%rdi,4)     ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007fd6ccf1fa04:   add    $0x20,%r13d                  ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007fd6ccf1fa08:   cmp    %eax,%r13d
  0x00007fd6ccf1fa0b:   jl     0x00007fd6ccf1f9b0           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
 ;; B32: #	out( B29 B33 ) <- in( B31 )  Freq: 100459
  0x00007fd6ccf1fa0d:   mov    0x130(%r15),%rdi             ; ImmutableOopMap {r11=Oop r8=Oop rbx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@26 (line 9)
  0x00007fd6ccf1fa14:   test   %eax,(%rdi)                  ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
                                                            ;   {poll}
  0x00007fd6ccf1fa16:   cmp    %r10d,%r13d
  0x00007fd6ccf1fa19:   jl     0x00007fd6ccf1f98d
 ;; B33: #	out( B36 B34 ) <- in( B32 )  Freq: 0.999969
  0x00007fd6ccf1fa1f:   mov    %esi,%r9d
  0x00007fd6ccf1fa22:   add    $0xfffffff9,%r9d
  0x00007fd6ccf1fa26:   cmp    %r9d,%esi
  0x00007fd6ccf1fa29:   cmovl  %ebp,%r9d
  0x00007fd6ccf1fa2d:   cmp    %r9d,%r13d
  0x00007fd6ccf1fa30:   jge    0x00007fd6ccf1fa52
 ;; B34: #	out( B35 ) <- in( B33 )  Freq: 0.499984
  0x00007fd6ccf1fa32:   nop
  0x00007fd6ccf1fa33:   nop
 ;; B35: #	out( B35 B36 ) <- in( B34 B35 ) Loop( B35-B35 inner post of N1070) Freq: 0.999969
  0x00007fd6ccf1fa34:   vmovdqu 0x10(%rbx,%r13,4),%ymm0
  0x00007fd6ccf1fa3b:   vpaddd 0x10(%r8,%r13,4),%ymm0,%ymm0
  0x00007fd6ccf1fa42:   vmovdqu %ymm0,0x10(%r11,%r13,4)     ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007fd6ccf1fa49:   add    $0x8,%r13d                   ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007fd6ccf1fa4d:   cmp    %r9d,%r13d
  0x00007fd6ccf1fa50:   jl     0x00007fd6ccf1fa34           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B36: #	out( B37 ) <- in( B35 B33 )  Freq: 0.999969
  0x00007fd6ccf1fa52:   vmovd  %xmm1,%edi
 ;; B37: #	out( B43 B38 ) <- in( B19 B36 )  Freq: 0.99997
  0x00007fd6ccf1fa56:   cmp    %r14d,%r13d
  0x00007fd6ccf1fa59:   jge    0x00007fd6ccf1fa96
 ;; B38: #	out( B39 ) <- in( B37 )  Freq: 0.499985
  0x00007fd6ccf1fa5f:   nop                                 ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
 ;; B39: #	out( B47 B40 ) <- in( B38 B42 ) Loop( B39-B42 inner post of N415) Freq: 0.999967
  0x00007fd6ccf1fa60:   cmp    %edi,%r13d
  0x00007fd6ccf1fa63:   jae    0x00007fd6ccf1fac5
 ;; B40: #	out( B48 B41 ) <- in( B39 )  Freq: 0.999966
  0x00007fd6ccf1fa69:   mov    0x10(%r8,%r13,4),%ebp        ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007fd6ccf1fa6e:   cmp    %edx,%r13d
  0x00007fd6ccf1fa71:   jae    0x00007fd6ccf1fb00
 ;; B41: #	out( B49 B42 ) <- in( B40 )  Freq: 0.999965
  0x00007fd6ccf1fa77:   add    0x10(%rbx,%r13,4),%ebp       ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@21 (line 10)
  0x00007fd6ccf1fa7c:   nop
  0x00007fd6ccf1fa7d:   nop
  0x00007fd6ccf1fa7e:   nop
  0x00007fd6ccf1fa7f:   nop
  0x00007fd6ccf1fa80:   cmp    %r14d,%r13d
  0x00007fd6ccf1fa83:   jae    0x00007fd6ccf1fb3c
 ;; B42: #	out( B39 B43 ) <- in( B41 )  Freq: 0.999964
  0x00007fd6ccf1fa89:   mov    %ebp,0x10(%r11,%r13,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007fd6ccf1fa8e:   inc    %r13d                        ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007fd6ccf1fa91:   cmp    %r14d,%r13d
  0x00007fd6ccf1fa94:   jl     0x00007fd6ccf1fa60           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B43: #	out( N534 ) <- in( B13 B42 B37 )  Freq: 0.999977
  0x00007fd6ccf1fa96:   vzeroupper 
  0x00007fd6ccf1fa99:   add    $0x50,%rsp
  0x00007fd6ccf1fa9d:   pop    %rbp
  0x00007fd6ccf1fa9e:   cmp    0x128(%r15),%rsp             ;   {poll_return}
  0x00007fd6ccf1faa5:   ja     0x00007fd6ccf1fcac
  0x00007fd6ccf1faab:   retq   
 ;; B44: #	out( B4 ) <- in( B1 )  Freq: 0.000999987
  0x00007fd6ccf1faac:   xor    %r11d,%r11d
  0x00007fd6ccf1faaf:   jmpq   0x00007fd6ccf1f83d
 ;; B45: #	out( B7 ) <- in( B4 )  Freq: 0.000999986
  0x00007fd6ccf1fab4:   xor    %r8d,%r8d
  0x00007fd6ccf1fab7:   jmpq   0x00007fd6ccf1f85d
 ;; B46: #	out( B10 ) <- in( B7 )  Freq: 0.000999985
  0x00007fd6ccf1fabc:   xor    %ebx,%ebx
  0x00007fd6ccf1fabe:   nop
  0x00007fd6ccf1fabf:   nop
  0x00007fd6ccf1fac0:   jmpq   0x00007fd6ccf1f87a
 ;; B47: #	out( N534 ) <- in( B39 B15 )  Freq: 3.03976e-06
  0x00007fd6ccf1fac5:   mov    $0xffffffe4,%esi
  0x00007fd6ccf1faca:   mov    %rbx,0x8(%rsp)
  0x00007fd6ccf1facf:   mov    %r11,0x18(%rsp)
  0x00007fd6ccf1fad4:   mov    %r13d,0x14(%rsp)
  0x00007fd6ccf1fad9:   mov    %r8,0x20(%rsp)
  0x00007fd6ccf1fade:   mov    %r13d,0x28(%rsp)
  0x00007fd6ccf1fae3:   nop
  0x00007fd6ccf1fae4:   vzeroupper 
  0x00007fd6ccf1fae7:   callq  0x00007fd6ccee6540           ; ImmutableOopMap {[8]=Oop [24]=Oop [32]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd6ccf1faec:   movabs $0x7fd6d66d67b8,%rdi         ;   {external_word}
  0x00007fd6ccf1faf6:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1fafa:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1faff:   hlt    
 ;; B48: #	out( N534 ) <- in( B40 B16 )  Freq: 3.03976e-06
  0x00007fd6ccf1fb00:   mov    $0xffffffe4,%esi
  0x00007fd6ccf1fb05:   mov    %r8,0x8(%rsp)
  0x00007fd6ccf1fb0a:   mov    %r11,0x20(%rsp)
  0x00007fd6ccf1fb0f:   mov    %r13d,0x1c(%rsp)
  0x00007fd6ccf1fb14:   mov    %rbx,0x28(%rsp)
  0x00007fd6ccf1fb19:   mov    %r13d,0x30(%rsp)
  0x00007fd6ccf1fb1e:   nop
  0x00007fd6ccf1fb1f:   nop
  0x00007fd6ccf1fb20:   vzeroupper 
  0x00007fd6ccf1fb23:   callq  0x00007fd6ccee6540           ; ImmutableOopMap {[8]=Oop [32]=Oop [40]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd6ccf1fb28:   movabs $0x7fd6d66d67b8,%rdi         ;   {external_word}
  0x00007fd6ccf1fb32:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1fb36:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1fb3b:   hlt    
 ;; B49: #	out( N534 ) <- in( B41 B17 )  Freq: 3.03976e-06
  0x00007fd6ccf1fb3c:   mov    $0xffffffe4,%esi
  0x00007fd6ccf1fb41:   mov    %r8,0x8(%rsp)
  0x00007fd6ccf1fb46:   mov    %rbx,0x10(%rsp)
  0x00007fd6ccf1fb4b:   mov    %r11,0x20(%rsp)
  0x00007fd6ccf1fb50:   mov    %r13d,0x1c(%rsp)
  0x00007fd6ccf1fb55:   nop
  0x00007fd6ccf1fb56:   nop
  0x00007fd6ccf1fb57:   nop
  0x00007fd6ccf1fb58:   vzeroupper 
  0x00007fd6ccf1fb5b:   callq  0x00007fd6ccee6540           ; ImmutableOopMap {[8]=Oop [16]=Oop [32]=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd6ccf1fb60:   movabs $0x7fd6d66d67b8,%rdi         ;   {external_word}
  0x00007fd6ccf1fb6a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1fb6e:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1fb73:   hlt                                 ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
 ;; B50: #	out( N534 ) <- in( B20 )  Freq: 1.01326e-06
  0x00007fd6ccf1fb74:   movabs $0x7fd6d686e968,%rdi         ;   {external_word}
  0x00007fd6ccf1fb7e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1fb82:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1fb87:   hlt    
 ;; B51: #	out( N534 ) <- in( B21 )  Freq: 1.01325e-06
  0x00007fd6ccf1fb88:   movabs $0x7fd6d686e968,%rdi         ;   {external_word}
  0x00007fd6ccf1fb92:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1fb96:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1fb9b:   hlt    
 ;; B52: #	out( N534 ) <- in( B22 )  Freq: 1.01325e-06
  0x00007fd6ccf1fb9c:   movabs $0x7fd6d686e968,%rdi         ;   {external_word}
  0x00007fd6ccf1fba6:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1fbaa:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1fbaf:   hlt    
 ;; B53: #	out( N534 ) <- in( B23 )  Freq: 1.01325e-06
  0x00007fd6ccf1fbb0:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1fbba:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1fbbe:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1fbc3:   hlt    
 ;; B54: #	out( N534 ) <- in( B24 )  Freq: 1.01325e-06
  0x00007fd6ccf1fbc4:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1fbce:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1fbd2:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1fbd7:   hlt    
 ;; B55: #	out( N534 ) <- in( B25 )  Freq: 1.01325e-06
  0x00007fd6ccf1fbd8:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1fbe2:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1fbe6:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1fbeb:   hlt    
 ;; B56: #	out( N534 ) <- in( B26 )  Freq: 1.01325e-06
  0x00007fd6ccf1fbec:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1fbf6:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1fbfa:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1fbff:   hlt    
 ;; B57: #	out( N534 ) <- in( B27 )  Freq: 1.01325e-06
  0x00007fd6ccf1fc00:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1fc0a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1fc0e:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1fc13:   hlt    
 ;; B58: #	out( N534 ) <- in( B2 B5 B8 )  Freq: 2.997e-06
  0x00007fd6ccf1fc14:   mov    $0xffffff8d,%esi
  0x00007fd6ccf1fc19:   mov    %rbx,(%rsp)
  0x00007fd6ccf1fc1d:   mov    %r13d,0x8(%rsp)
  0x00007fd6ccf1fc22:   mov    %r14,0x10(%rsp)
  0x00007fd6ccf1fc27:   nop
  0x00007fd6ccf1fc28:   vzeroupper 
  0x00007fd6ccf1fc2b:   callq  0x00007fd6ccee6540           ; ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd6ccf1fc30:   movabs $0x7fd6d66d67b8,%rdi         ;   {external_word}
  0x00007fd6ccf1fc3a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1fc3e:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1fc43:   hlt    
 ;; B59: #	out( N534 ) <- in( B12 B11 )  Freq: 2.02655e-06
  0x00007fd6ccf1fc44:   mov    $0xffffffbe,%esi
  0x00007fd6ccf1fc49:   mov    %r11,%rbp
  0x00007fd6ccf1fc4c:   mov    %r8,(%rsp)
  0x00007fd6ccf1fc50:   mov    %rbx,0x8(%rsp)
  0x00007fd6ccf1fc55:   mov    %r13d,0x10(%rsp)
  0x00007fd6ccf1fc5a:   nop
  0x00007fd6ccf1fc5b:   nop
  0x00007fd6ccf1fc5c:   vzeroupper 
  0x00007fd6ccf1fc5f:   callq  0x00007fd6ccee6540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd6ccf1fc64:   movabs $0x7fd6d66d67b8,%rdi         ;   {external_word}
  0x00007fd6ccf1fc6e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1fc72:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1fc77:   hlt    
 ;; B60: #	out( N534 ) <- in( B10 )  Freq: 1.01328e-06
  0x00007fd6ccf1fc78:   mov    $0xffffff76,%esi
  0x00007fd6ccf1fc7d:   mov    %r11,%rbp
  0x00007fd6ccf1fc80:   mov    %r8,(%rsp)
  0x00007fd6ccf1fc84:   mov    %rbx,0x8(%rsp)
  0x00007fd6ccf1fc89:   mov    %r13d,0x10(%rsp)
  0x00007fd6ccf1fc8e:   nop
  0x00007fd6ccf1fc8f:   nop
  0x00007fd6ccf1fc90:   vzeroupper 
  0x00007fd6ccf1fc93:   callq  0x00007fd6ccee6540           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd6ccf1fc98:   movabs $0x7fd6d66d67b8,%rdi         ;   {external_word}
  0x00007fd6ccf1fca2:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1fca6:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1fcab:   hlt                                 ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
  0x00007fd6ccf1fcac:   movabs $0x7fd6ccf1fa9e,%r10         ;   {internal_word}
  0x00007fd6ccf1fcb6:   mov    %r10,0x3e8(%r15)
  0x00007fd6ccf1fcbd:   jmpq   0x00007fd6ccee7220           ;   {runtime_call SafepointBlob}
  0x00007fd6ccf1fcc2:   hlt    
  0x00007fd6ccf1fcc3:   hlt    
  0x00007fd6ccf1fcc4:   hlt    
  0x00007fd6ccf1fcc5:   hlt    
  0x00007fd6ccf1fcc6:   hlt    
  0x00007fd6ccf1fcc7:   hlt    
  0x00007fd6ccf1fcc8:   hlt    
  0x00007fd6ccf1fcc9:   hlt    
  0x00007fd6ccf1fcca:   hlt    
  0x00007fd6ccf1fccb:   hlt    
  0x00007fd6ccf1fccc:   hlt    
  0x00007fd6ccf1fccd:   hlt    
  0x00007fd6ccf1fcce:   hlt    
  0x00007fd6ccf1fccf:   hlt    
  0x00007fd6ccf1fcd0:   hlt    
  0x00007fd6ccf1fcd1:   hlt    
  0x00007fd6ccf1fcd2:   hlt    
  0x00007fd6ccf1fcd3:   hlt    
  0x00007fd6ccf1fcd4:   hlt    
  0x00007fd6ccf1fcd5:   hlt    
  0x00007fd6ccf1fcd6:   hlt    
  0x00007fd6ccf1fcd7:   hlt    
  0x00007fd6ccf1fcd8:   hlt    
  0x00007fd6ccf1fcd9:   hlt    
  0x00007fd6ccf1fcda:   hlt    
  0x00007fd6ccf1fcdb:   hlt    
  0x00007fd6ccf1fcdc:   hlt    
  0x00007fd6ccf1fcdd:   hlt    
  0x00007fd6ccf1fcde:   hlt    
  0x00007fd6ccf1fcdf:   hlt    
[Exception Handler]
  0x00007fd6ccf1fce0:   jmpq   0x00007fd6cce2c6a0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007fd6ccf1fce5:   callq  0x00007fd6ccf1fcea
  0x00007fd6ccf1fcea:   subq   $0x5,(%rsp)
  0x00007fd6ccf1fcef:   jmpq   0x00007fd6ccee6860           ;   {runtime_call DeoptimizationBlob}
  0x00007fd6ccf1fcf4:   hlt    
  0x00007fd6ccf1fcf5:   hlt    
  0x00007fd6ccf1fcf6:   hlt    
  0x00007fd6ccf1fcf7:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007fd6ccf1fcf8:   0x000000010110de48 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de48}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007fd6ccf1fd00:   0x0000000800040c30 {type array int}
  0x00007fd6ccf1fd08:   0x00007fd66fc116e8 {method} {0x00007fd66fc116e8} 'micro_scalar' '([I[I[I)V' in 'App'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007fd6ccf1f7df offset=ffffffff bits=0):
PcDesc(pc=0x00007fd6ccf1f87a offset=9a bits=0):   App::micro_scalar@3 (line 9)
PcDesc(pc=0x00007fd6ccf1f884 offset=a4 bits=0):   App::micro_scalar@6 (line 9)
PcDesc(pc=0x00007fd6ccf1f888 offset=a8 bits=0):   App::micro_scalar@16 (line 10)
PcDesc(pc=0x00007fd6ccf1f88b offset=ab bits=0):   App::micro_scalar@20 (line 10)
PcDesc(pc=0x00007fd6ccf1f894 offset=b4 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007fd6ccf1f8d3 offset=f3 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1f8e1 offset=101 bits=0):   App::micro_scalar@16 (line 10)
PcDesc(pc=0x00007fd6ccf1f8ef offset=10f bits=0):   App::micro_scalar@21 (line 10)
PcDesc(pc=0x00007fd6ccf1f8fd offset=11d bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1f900 offset=120 bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007fd6ccf1f905 offset=125 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007fd6ccf1f98b offset=1ab bits=0):   App::micro_scalar@26 (line 9)
PcDesc(pc=0x00007fd6ccf1fa04 offset=224 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1fa08 offset=228 bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007fd6ccf1fa0d offset=22d bits=0):   App::micro_scalar@26 (line 9)
PcDesc(pc=0x00007fd6ccf1fa14 offset=234 bits=1):   App::micro_scalar@26 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg r11 [22],oop
    - l2: reg r8 [16],oop
    - l3: reg rbx [6],oop
    - l4: reg r13 [26],int
PcDesc(pc=0x00007fd6ccf1fa16 offset=236 bits=0):   App::micro_scalar@26 (line 9)
PcDesc(pc=0x00007fd6ccf1fa49 offset=269 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1fa4d offset=26d bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007fd6ccf1fa52 offset=272 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007fd6ccf1fa60 offset=280 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1fa6e offset=28e bits=0):   App::micro_scalar@16 (line 10)
PcDesc(pc=0x00007fd6ccf1fa7c offset=29c bits=0):   App::micro_scalar@21 (line 10)
PcDesc(pc=0x00007fd6ccf1fa8e offset=2ae bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1fa91 offset=2b1 bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007fd6ccf1fa96 offset=2b6 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007fd6ccf1faec offset=30c bits=0):   App::micro_scalar@16 (line 10)
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
PcDesc(pc=0x00007fd6ccf1fb28 offset=348 bits=0):   App::micro_scalar@20 (line 10)
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
PcDesc(pc=0x00007fd6ccf1fb60 offset=380 bits=0):   App::micro_scalar@22 (line 10)
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
PcDesc(pc=0x00007fd6ccf1fb74 offset=394 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1fc30 offset=450 bits=0):   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: stack[16],oop
    - l2: reg rbp [10],oop
    - l3: stack[0],oop
    - l4: stack[8]
PcDesc(pc=0x00007fd6ccf1fc64 offset=484 bits=0):   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[16]
PcDesc(pc=0x00007fd6ccf1fc98 offset=4b8 bits=0):   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[16]
PcDesc(pc=0x00007fd6ccf1fcac offset=4cc bits=0):   App::micro_scalar@3 (line 9)
PcDesc(pc=0x00007fd6ccf1fcf9 offset=519 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 7 OopMaps

ImmutableOopMap {r11=Oop r8=Oop rbx=Oop } pc offsets: 564 
ImmutableOopMap {[8]=Oop [24]=Oop [32]=Oop } pc offsets: 780 
ImmutableOopMap {[8]=Oop [32]=Oop [40]=Oop } pc offsets: 840 
ImmutableOopMap {[8]=Oop [16]=Oop [32]=Oop } pc offsets: 896 
ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop } pc offsets: 1104 
ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop } pc offsets: 1156 1208 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007fd6ccf1f87a offset=9a):
   App::micro_scalar@3 (line 9)
ScopeDesc(pc=0x00007fd6ccf1f884 offset=a4):
   App::micro_scalar@6 (line 9)
ScopeDesc(pc=0x00007fd6ccf1f888 offset=a8):
   App::micro_scalar@16 (line 10)
ScopeDesc(pc=0x00007fd6ccf1f88b offset=ab):
   App::micro_scalar@20 (line 10)
ScopeDesc(pc=0x00007fd6ccf1f894 offset=b4):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007fd6ccf1f8d3 offset=f3):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1f8e1 offset=101):
   App::micro_scalar@16 (line 10)
ScopeDesc(pc=0x00007fd6ccf1f8ef offset=10f):
   App::micro_scalar@21 (line 10)
ScopeDesc(pc=0x00007fd6ccf1f8fd offset=11d):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1f900 offset=120):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007fd6ccf1f905 offset=125):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007fd6ccf1f98b offset=1ab):
   App::micro_scalar@26 (line 9)
ScopeDesc(pc=0x00007fd6ccf1fa04 offset=224):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1fa08 offset=228):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007fd6ccf1fa0d offset=22d):
   App::micro_scalar@26 (line 9)
ScopeDesc(pc=0x00007fd6ccf1fa14 offset=234):
   App::micro_scalar@26 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg r11 [22],oop
    - l2: reg r8 [16],oop
    - l3: reg rbx [6],oop
    - l4: reg r13 [26],int
ScopeDesc(pc=0x00007fd6ccf1fa16 offset=236):
   App::micro_scalar@26 (line 9)
ScopeDesc(pc=0x00007fd6ccf1fa49 offset=269):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1fa4d offset=26d):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007fd6ccf1fa52 offset=272):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007fd6ccf1fa60 offset=280):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1fa6e offset=28e):
   App::micro_scalar@16 (line 10)
ScopeDesc(pc=0x00007fd6ccf1fa7c offset=29c):
   App::micro_scalar@21 (line 10)
ScopeDesc(pc=0x00007fd6ccf1fa8e offset=2ae):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1fa91 offset=2b1):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007fd6ccf1fa96 offset=2b6):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007fd6ccf1faec offset=30c):
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
ScopeDesc(pc=0x00007fd6ccf1fb28 offset=348):
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
ScopeDesc(pc=0x00007fd6ccf1fb60 offset=380):
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
ScopeDesc(pc=0x00007fd6ccf1fb74 offset=394):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1fc30 offset=450):
   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: stack[16],oop
    - l2: reg rbp [10],oop
    - l3: stack[0],oop
    - l4: stack[8]
ScopeDesc(pc=0x00007fd6ccf1fc64 offset=484):
   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[16]
ScopeDesc(pc=0x00007fd6ccf1fc98 offset=4b8):
   App::micro_scalar@3 (line 9)
   Locals
    - l0: empty
    - l1: reg rbp [10],oop
    - l2: stack[0],oop
    - l3: stack[8],oop
    - l4: stack[16]
ScopeDesc(pc=0x00007fd6ccf1fcac offset=4cc):
   App::micro_scalar@3 (line 9)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007fd6ccf1f708: 6400
relocInfo@0x00007fd6ccf1f708 [type=6(runtime_call) addr=0x00007fd6ccf1f7e0 offset=0 format=1] | [destination=0x00007fd6d6014baa]
         @0x00007fd6ccf1f70a: f001cc4d
relocInfo@0x00007fd6ccf1f70c [type=12(metadata) addr=0x00007fd6ccf1f82d offset=77 format=3 data=1] | [metadata_addr=0x00007fd6ccf1fd00 *=0x0000000800040c30 offset=0]metadata_value=0x0000000800040c30: {type array int}
         @0x00007fd6ccf1f70e: f001cc20
relocInfo@0x00007fd6ccf1f710 [type=12(metadata) addr=0x00007fd6ccf1f84d offset=32 format=3 data=1] | [metadata_addr=0x00007fd6ccf1fd00 *=0x0000000800040c30 offset=0]metadata_value=0x0000000800040c30: {type array int}
         @0x00007fd6ccf1f712: f001cc20
relocInfo@0x00007fd6ccf1f714 [type=12(metadata) addr=0x00007fd6ccf1f86d offset=32 format=3 data=1] | [metadata_addr=0x00007fd6ccf1fd00 *=0x0000000800040c30 offset=0]metadata_value=0x0000000800040c30: {type array int}
         @0x00007fd6ccf1f716: a1a7
relocInfo@0x00007fd6ccf1f716 [type=10(poll) addr=0x00007fd6ccf1fa14 offset=423]
         @0x00007fd6ccf1f718: b08a
relocInfo@0x00007fd6ccf1f718 [type=11(poll_return) addr=0x00007fd6ccf1fa9e offset=138]
         @0x00007fd6ccf1f71a: 6449
relocInfo@0x00007fd6ccf1f71a [type=6(runtime_call) addr=0x00007fd6ccf1fae7 offset=73 format=1] | [destination=0x00007fd6ccee6540]
         @0x00007fd6ccf1f71c: f803d66d67b87fd67005
relocInfo@0x00007fd6ccf1f724 [type=7(external_word) addr=0x00007fd6ccf1faec offset=5 data={d66d67b87fd6}] | [target=0x00007fd6d66d67b8]
         @0x00007fd6ccf1f726: 640e
relocInfo@0x00007fd6ccf1f726 [type=6(runtime_call) addr=0x00007fd6ccf1fafa offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1f728: 6429
relocInfo@0x00007fd6ccf1f728 [type=6(runtime_call) addr=0x00007fd6ccf1fb23 offset=41 format=1] | [destination=0x00007fd6ccee6540]
         @0x00007fd6ccf1f72a: f803d66d67b87fd67005
relocInfo@0x00007fd6ccf1f732 [type=7(external_word) addr=0x00007fd6ccf1fb28 offset=5 data={d66d67b87fd6}] | [target=0x00007fd6d66d67b8]
         @0x00007fd6ccf1f734: 640e
relocInfo@0x00007fd6ccf1f734 [type=6(runtime_call) addr=0x00007fd6ccf1fb36 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1f736: 6425
relocInfo@0x00007fd6ccf1f736 [type=6(runtime_call) addr=0x00007fd6ccf1fb5b offset=37 format=1] | [destination=0x00007fd6ccee6540]
         @0x00007fd6ccf1f738: f803d66d67b87fd67005
relocInfo@0x00007fd6ccf1f740 [type=7(external_word) addr=0x00007fd6ccf1fb60 offset=5 data={d66d67b87fd6}] | [target=0x00007fd6d66d67b8]
         @0x00007fd6ccf1f742: 640e
relocInfo@0x00007fd6ccf1f742 [type=6(runtime_call) addr=0x00007fd6ccf1fb6e offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1f744: f803d686e9687fd67006
relocInfo@0x00007fd6ccf1f74c [type=7(external_word) addr=0x00007fd6ccf1fb74 offset=6 data={d686e9687fd6}] | [target=0x00007fd6d686e968]
         @0x00007fd6ccf1f74e: 640e
relocInfo@0x00007fd6ccf1f74e [type=6(runtime_call) addr=0x00007fd6ccf1fb82 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1f750: f803d686e9687fd67006
relocInfo@0x00007fd6ccf1f758 [type=7(external_word) addr=0x00007fd6ccf1fb88 offset=6 data={d686e9687fd6}] | [target=0x00007fd6d686e968]
         @0x00007fd6ccf1f75a: 640e
relocInfo@0x00007fd6ccf1f75a [type=6(runtime_call) addr=0x00007fd6ccf1fb96 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1f75c: f803d686e9687fd67006
relocInfo@0x00007fd6ccf1f764 [type=7(external_word) addr=0x00007fd6ccf1fb9c offset=6 data={d686e9687fd6}] | [target=0x00007fd6d686e968]
         @0x00007fd6ccf1f766: 640e
relocInfo@0x00007fd6ccf1f766 [type=6(runtime_call) addr=0x00007fd6ccf1fbaa offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1f768: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1f770 [type=7(external_word) addr=0x00007fd6ccf1fbb0 offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1f772: 640e
relocInfo@0x00007fd6ccf1f772 [type=6(runtime_call) addr=0x00007fd6ccf1fbbe offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1f774: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1f77c [type=7(external_word) addr=0x00007fd6ccf1fbc4 offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1f77e: 640e
relocInfo@0x00007fd6ccf1f77e [type=6(runtime_call) addr=0x00007fd6ccf1fbd2 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1f780: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1f788 [type=7(external_word) addr=0x00007fd6ccf1fbd8 offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1f78a: 640e
relocInfo@0x00007fd6ccf1f78a [type=6(runtime_call) addr=0x00007fd6ccf1fbe6 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1f78c: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1f794 [type=7(external_word) addr=0x00007fd6ccf1fbec offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1f796: 640e
relocInfo@0x00007fd6ccf1f796 [type=6(runtime_call) addr=0x00007fd6ccf1fbfa offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1f798: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1f7a0 [type=7(external_word) addr=0x00007fd6ccf1fc00 offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1f7a2: 640e
relocInfo@0x00007fd6ccf1f7a2 [type=6(runtime_call) addr=0x00007fd6ccf1fc0e offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1f7a4: 641d
relocInfo@0x00007fd6ccf1f7a4 [type=6(runtime_call) addr=0x00007fd6ccf1fc2b offset=29 format=1] | [destination=0x00007fd6ccee6540]
         @0x00007fd6ccf1f7a6: f803d66d67b87fd67005
relocInfo@0x00007fd6ccf1f7ae [type=7(external_word) addr=0x00007fd6ccf1fc30 offset=5 data={d66d67b87fd6}] | [target=0x00007fd6d66d67b8]
         @0x00007fd6ccf1f7b0: 640e
relocInfo@0x00007fd6ccf1f7b0 [type=6(runtime_call) addr=0x00007fd6ccf1fc3e offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1f7b2: 6421
relocInfo@0x00007fd6ccf1f7b2 [type=6(runtime_call) addr=0x00007fd6ccf1fc5f offset=33 format=1] | [destination=0x00007fd6ccee6540]
         @0x00007fd6ccf1f7b4: f803d66d67b87fd67005
relocInfo@0x00007fd6ccf1f7bc [type=7(external_word) addr=0x00007fd6ccf1fc64 offset=5 data={d66d67b87fd6}] | [target=0x00007fd6d66d67b8]
         @0x00007fd6ccf1f7be: 640e
relocInfo@0x00007fd6ccf1f7be [type=6(runtime_call) addr=0x00007fd6ccf1fc72 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1f7c0: 6421
relocInfo@0x00007fd6ccf1f7c0 [type=6(runtime_call) addr=0x00007fd6ccf1fc93 offset=33 format=1] | [destination=0x00007fd6ccee6540]
         @0x00007fd6ccf1f7c2: f803d66d67b87fd67005
relocInfo@0x00007fd6ccf1f7ca [type=7(external_word) addr=0x00007fd6ccf1fc98 offset=5 data={d66d67b87fd6}] | [target=0x00007fd6d66d67b8]
         @0x00007fd6ccf1f7cc: 640e
relocInfo@0x00007fd6ccf1f7cc [type=6(runtime_call) addr=0x00007fd6ccf1fca6 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1f7ce: f20e8006
relocInfo@0x00007fd6ccf1f7d0 [type=8(internal_word) addr=0x00007fd6ccf1fcac offset=6 data=526] | [target=0x00007fd6ccf1fa9e]
         @0x00007fd6ccf1f7d2: 6411
relocInfo@0x00007fd6ccf1f7d2 [type=6(runtime_call) addr=0x00007fd6ccf1fcbd offset=17 format=1] | [destination=0x00007fd6ccee7220]
         @0x00007fd6ccf1f7d4: 0023
relocInfo@0x00007fd6ccf1f7d4 [type=0(none) addr=0x00007fd6ccf1fce0 offset=35]
         @0x00007fd6ccf1f7d6: 6400
relocInfo@0x00007fd6ccf1f7d6 [type=6(runtime_call) addr=0x00007fd6ccf1fce0 offset=0 format=1] | [destination=0x00007fd6cce2c6a0]
         @0x00007fd6ccf1f7d8: 640f
relocInfo@0x00007fd6ccf1f7d8 [type=6(runtime_call) addr=0x00007fd6ccf1fcef offset=15 format=1] | [destination=0x00007fd6ccee6860]
         @0x00007fd6ccf1f7da: 0000
relocInfo@0x00007fd6ccf1f7da [type=0(none) addr=0x00007fd6ccf1fcef offset=0]
         @0x00007fd6ccf1f7dc: 0000
relocInfo@0x00007fd6ccf1f7dc [type=0(none) addr=0x00007fd6ccf1fcef offset=0]
         @0x00007fd6ccf1f7de: 0000
relocInfo@0x00007fd6ccf1f7de [type=0(none) addr=0x00007fd6ccf1fcef offset=0]
         @0x00007fd6ccf1f7e0: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 3 entries, 28 bytes):
{
   < 0x00007fd6ccf1f880, 0x00007fd6ccf1fc78 > < 0x00007fd6ccf1f884, 0x00007fd6ccf1fc44 > < 0x00007fd6ccf1f888, 0x00007fd6ccf1fc44 > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x000000010110de48 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de48}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
#0: 0x0000000000000000 NULL-oop
#1: 0x0000000800040c30 {type array int}
#2: 0x00007fd66fc116e8 {method} {0x00007fd66fc116e8} 'micro_scalar' '([I[I[I)V' in 'App'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 101 ------------------------
{method}
 - this oop:          0x00007fd66fc116e8
 - method holder:     'App'
 - constants:         0x00007fd66fc11090 constant pool [134]/operands[15] {0x00007fd66fc11090} for 'App' cache=0x00007fd66ff00000
 - access:            0xc1000001  public 
 - name:              'micro_scalar'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        5
 - size of params:    4
 - method size:       13
 - vtable index:      5
 - i2i entry:         0x00007fd6ccdde220
 - adapters:          AHE@0x00007fd6d03a4520: 0xbbbb0000 i2c: 0x00007fd6cce4f6e0 c2i: 0x00007fd6cce4f7cc c2iUV: 0x00007fd6cce4f796 c2iNCI: 0x00007fd6cce4f809
 - compiled entry     0x00007fd6cce4f7cc
 - code size:         30
 - code start:        0x00007fd66fc116c0
 - code end (excl):   0x00007fd66fc116de
 - method data:       0x00007fd66fc11db0
 - checked ex length: 0
 - linenumber start:  0x00007fd66fc116de
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
000     N334: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
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
031     jbe,u   B30  P=0.000008 C=5557910.000000

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
07f     andl    R11, #7	# int
083     movl    R10, #3	# int
089     subl    R10, R11	# int
08c     andl    R10, #7	# int
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
0b2     jl,s   B11	# loop end  P=0.500000 C=5557862.000000

0b4     B12: #	out( B27 B13 ) <- in( B11 )  Freq: 0.999983
0b4     movl    R10, RBP	# spill
0b7     addl    R10, #-31	# int
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
0f1     addl    R11, #31	# int
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
11a     movl    RBX, #32000	# int
11f     # TLS is in R15

11f     B21: #	out( B22 ) <- in( B20 B23 ) Loop( B21-B23 ) Freq: 118146
11f     movl    R9, R10	# spill
122     subl    R9, RDI	# int
125     cmpl    R10, RDI
128     cmovll R9, RSI	# signed, int
12c     cmpl    R9, #32000	# unsigned
133     cmovlnbe R9, RBX	# unsigned, int
137     addl    R9, RDI	# int
        nop 	# 6 bytes pad for loops and calls

140     B22: #	out( B22 B23 ) <- in( B21 B22 ) Loop( B22-B22 inner main of N159 strip mined) Freq: 1.39589e+10
140     load_vector XMM0,[R8 + #16 + RDI << #2]
147     vpaddd  XMM0,XMM0,[RCX + #16 + RDI << #2]	! add packedI
14d     store_vector [RDX + #16 + RDI << #2],XMM0
	
153     movslq  R11, RDI	# i2l
156     load_vector XMM0,[R8 + #48 + R11 << #2]
15d     vpaddd  XMM0,XMM0,[RCX + #48 + R11 << #2]	! add packedI
164     store_vector [RDX + #48 + R11 << #2],XMM0
	
16b     load_vector XMM0,[R8 + #80 + R11 << #2]
172     vpaddd  XMM0,XMM0,[RCX + #80 + R11 << #2]	! add packedI
179     store_vector [RDX + #80 + R11 << #2],XMM0
	
180     load_vector XMM0,[R8 + #112 + R11 << #2]
187     vpaddd  XMM0,XMM0,[RCX + #112 + R11 << #2]	! add packedI
18e     store_vector [RDX + #112 + R11 << #2],XMM0
	
195     addl    RDI, #32	# int
198     cmpl    RDI, R9
19b     jl,s   B22	# loop end  P=0.999992 C=5557862.000000

19d     B23: #	out( B21 B24 ) <- in( B22 )  Freq: 118146
19d     movq    R11, [R15 + #304 (32-bit)]	# ptr
1a4     testl   rax, [R11]	# Safepoint: poll for GC        # App::micro_scalar @ bci:26 (line 9) L[0]=_ L[1]=RDX L[2]=RCX L[3]=R8 L[4]=RDI
        # OopMap {r8=Oop rcx=Oop rdx=Oop off=420/0x1a4}
1a7     cmpl    RDI, R10
1aa     jl     B21  P=0.999992 C=5557862.000000

1b0     B24: #	out( B27 B25 ) <- in( B23 )  Freq: 0.999975
1b0     movl    R10, RBP	# spill
1b3     addl    R10, #-7	# int
1b7     cmpl    R13, R10
1ba     cmovll R10, RAX	# signed, int
        nop 	# 2 bytes pad for loops and calls
1c0     cmpl    RDI, R10
1c3     jge,s   B27  P=0.500000 C=-1.000000

1c5     B25: #	out( B26 ) <- in( B24 )  Freq: 0.499988
1c5     # castII of RDI
        nop 	# 3 bytes pad for loops and calls

1c8     B26: #	out( B26 B27 ) <- in( B25 B26 ) Loop( B26-B26 inner post of N869) Freq: 0.999975
1c8     load_vector XMM0,[R8 + #16 + RDI << #2]
1cf     vpaddd  XMM0,XMM0,[RCX + #16 + RDI << #2]	! add packedI
1d5     store_vector [RDX + #16 + RDI << #2],XMM0
	
1db     addl    RDI, #8	# int
        nop 	# 2 bytes pad for loops and calls
1e0     cmpl    RDI, R10
1e3     jl,s   B26	# loop end  P=0.500000 C=5557862.000000

1e5     B27: #	out( B30 B28 ) <- in( B12 B26 B24 )  Freq: 0.999976
1e5     cmpl    RDI, RBP
1e7     jge,s   B30  P=0.500000 C=-1.000000

1e9     B28: #	out( B29 ) <- in( B27 )  Freq: 0.499988
1e9     # castII of RDI
        nop 	# 3 bytes pad for loops and calls

1ec     B29: #	out( B29 B30 ) <- in( B28 B29 ) Loop( B29-B29 inner post of N234) Freq: 0.999976
1ec     movl    R11, [R8 + #16 + RDI << #2]	# int
1f1     addl    R11, [RCX + #16 + RDI << #2]	# int
1f6     movl    [RDX + #16 + RDI << #2], R11	# int
1fb     incl    RDI	# int
        nop 	# 3 bytes pad for loops and calls
200     cmpl    RDI, RBP
202     jl,s   B29	# loop end  P=0.500000 C=5557862.000000

204     B30: #	out( N334 ) <- in( B29 B27 B2 )  Freq: 0.999985
204     vzeroupper
	addq    rsp, 48	# Destroy frame
	popq    rbp
	cmpq     rsp, poll_offset[r15_thread] 
	ja       #safepoint_stub	# Safepoint: poll for GC

219     ret

21a     B31: #	out( N334 ) <- in( B7 B3 B4 B5 B8 B9 B6 )  Freq: 7.06631e-06
21a     movl    RSI, #-138	# int
21f     movq    [rsp + #0], RDX	# spill
223     movq    [rsp + #8], RCX	# spill
228     movq    [rsp + #16], R8	# spill
        nop 	# 3 bytes pad for loops and calls
230     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_scalar @ bci:7 (line 9) L[0]=_ L[1]=rsp + #0 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=#0 STK[0]=#0 STK[1]=RBP
        # OopMap {[0]=Oop [8]=Oop [16]=Oop off=568/0x238}
238     stop	# ShouldNotReachHere

24c     B32: #	out( N334 ) <- in( B13 )  Freq: 1.01326e-06
24c     stop	# ShouldNotReachHere

260     B33: #	out( N334 ) <- in( B14 )  Freq: 1.01326e-06
260     stop	# ShouldNotReachHere

274     B34: #	out( N334 ) <- in( B15 )  Freq: 1.01326e-06
274     stop	# ShouldNotReachHere

288     B35: #	out( N334 ) <- in( B16 )  Freq: 1.01326e-06
288     stop	# ShouldNotReachHere

29c     B36: #	out( N334 ) <- in( B17 )  Freq: 1.01326e-06
29c     stop	# ShouldNotReachHere

2b0     B37: #	out( N334 ) <- in( B18 )  Freq: 1.01326e-06
2b0     stop	# ShouldNotReachHere

2c4     B38: #	out( N334 ) <- in( B19 )  Freq: 1.01325e-06
2c4     stop	# ShouldNotReachHere

2d8     B39: #	out( N334 ) <- in( B1 )  Freq: 1.01328e-06
2d8     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
2e0     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_scalar @ bci:6 (line 9) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ STK[0]=_ STK[1]=#NULL
        # OopMap {off=744/0x2e8}
2e8     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    1690  101             App::micro_scalar (30 bytes)
 total in heap  [0x00007fd6ccf1db10,0x00007fd6ccf1e2d8] = 1992
 relocation     [0x00007fd6ccf1dc88,0x00007fd6ccf1dd10] = 136
 main code      [0x00007fd6ccf1dd20,0x00007fd6ccf1e040] = 800
 stub code      [0x00007fd6ccf1e040,0x00007fd6ccf1e058] = 24
 oops           [0x00007fd6ccf1e058,0x00007fd6ccf1e060] = 8
 metadata       [0x00007fd6ccf1e060,0x00007fd6ccf1e068] = 8
 scopes data    [0x00007fd6ccf1e068,0x00007fd6ccf1e0e0] = 120
 scopes pcs     [0x00007fd6ccf1e0e0,0x00007fd6ccf1e2b0] = 464
 dependencies   [0x00007fd6ccf1e2b0,0x00007fd6ccf1e2b8] = 8
 nul chk table  [0x00007fd6ccf1e2b8,0x00007fd6ccf1e2d8] = 32

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Entry Point]
  # {method} {0x00007fd66fc116e8} 'micro_scalar' '([I[I[I)V' in 'App'
  # this:     rsi:rsi   = 'App'
  # parm0:    rdx:rdx   = '[I'
  # parm1:    rcx:rcx   = '[I'
  # parm2:    r8:r8     = '[I'
  #           [sp+0x40]  (sp of caller)
 ;; N334: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fd6ccf1dd20:   mov    0x8(%rsi),%r10d
  0x00007fd6ccf1dd24:   movabs $0x800000000,%r11
  0x00007fd6ccf1dd2e:   add    %r11,%r10
  0x00007fd6ccf1dd31:   cmp    %r10,%rax
  0x00007fd6ccf1dd34:   jne    0x00007fd6ccee5920           ;   {runtime_call ic_miss_stub}
  0x00007fd6ccf1dd3a:   nop
  0x00007fd6ccf1dd3b:   nop
  0x00007fd6ccf1dd3c:   nop
  0x00007fd6ccf1dd3d:   nop
  0x00007fd6ccf1dd3e:   nop
  0x00007fd6ccf1dd3f:   nop
[Verified Entry Point]
 ;; B1: #	out( B39 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007fd6ccf1dd40:   mov    %eax,-0x16000(%rsp)
  0x00007fd6ccf1dd47:   push   %rbp
  0x00007fd6ccf1dd48:   sub    $0x30,%rsp                   ;*synchronization entry
                                                            ; - App::micro_scalar@-1 (line 8)
  0x00007fd6ccf1dd4c:   mov    0xc(%rdx),%ebp               ; implicit exception: dispatches to 0x00007fd6ccf1dff8
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@6 (line 9)
 ;; B2: #	out( B30 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007fd6ccf1dd4f:   test   %ebp,%ebp
  0x00007fd6ccf1dd51:   jbe    0x00007fd6ccf1df24           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B3: #	out( B31 B4 ) <- in( B2 )  Freq: 0.999991
  0x00007fd6ccf1dd57:   mov    0xc(%rcx),%ebx               ; implicit exception: dispatches to 0x00007fd6ccf1df3a
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
 ;; B4: #	out( B31 B5 ) <- in( B3 )  Freq: 0.99999
  0x00007fd6ccf1dd5a:   test   %ebx,%ebx
  0x00007fd6ccf1dd5c:   nop
  0x00007fd6ccf1dd5d:   nop
  0x00007fd6ccf1dd5e:   nop
  0x00007fd6ccf1dd5f:   nop
  0x00007fd6ccf1dd60:   jbe    0x00007fd6ccf1df3a
 ;; B5: #	out( B31 B6 ) <- in( B4 )  Freq: 0.999988
  0x00007fd6ccf1dd66:   mov    %ebp,%r13d
  0x00007fd6ccf1dd69:   dec    %r13d
  0x00007fd6ccf1dd6c:   cmp    %ebx,%r13d
  0x00007fd6ccf1dd6f:   jae    0x00007fd6ccf1df3a
 ;; B6: #	out( B31 B7 ) <- in( B5 )  Freq: 0.999987
  0x00007fd6ccf1dd75:   mov    0xc(%r8),%r9d                ; implicit exception: dispatches to 0x00007fd6ccf1df3a
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
 ;; B7: #	out( B31 B8 ) <- in( B6 )  Freq: 0.999986
  0x00007fd6ccf1dd79:   test   %r9d,%r9d
  0x00007fd6ccf1dd7c:   nop
  0x00007fd6ccf1dd7d:   nop
  0x00007fd6ccf1dd7e:   nop
  0x00007fd6ccf1dd7f:   nop
  0x00007fd6ccf1dd80:   jbe    0x00007fd6ccf1df3a
 ;; B8: #	out( B31 B9 ) <- in( B7 )  Freq: 0.999985
  0x00007fd6ccf1dd86:   cmp    %r9d,%r13d
  0x00007fd6ccf1dd89:   jae    0x00007fd6ccf1df3a
 ;; B9: #	out( B31 B10 ) <- in( B8 )  Freq: 0.999984
  0x00007fd6ccf1dd8f:   cmp    %ebp,%r13d
  0x00007fd6ccf1dd92:   jae    0x00007fd6ccf1df3a
 ;; B10: #	out( B11 ) <- in( B9 )  Freq: 0.999983
  0x00007fd6ccf1dd98:   mov    %edx,%r11d
  0x00007fd6ccf1dd9b:   shr    $0x2,%r11d
  0x00007fd6ccf1dd9f:   and    $0x7,%r11d
  0x00007fd6ccf1dda3:   mov    $0x3,%r10d
  0x00007fd6ccf1dda9:   sub    %r11d,%r10d
  0x00007fd6ccf1ddac:   and    $0x7,%r10d
  0x00007fd6ccf1ddb0:   inc    %r10d
  0x00007fd6ccf1ddb3:   cmp    %ebp,%r10d
  0x00007fd6ccf1ddb6:   cmovg  %ebp,%r10d
  0x00007fd6ccf1ddba:   xor    %esi,%esi
  0x00007fd6ccf1ddbc:   xor    %edi,%edi                    ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 10)
 ;; B11: #	out( B11 B12 ) <- in( B10 B11 ) Loop( B11-B11 inner pre of N234) Freq: 1.99997
  0x00007fd6ccf1ddbe:   mov    0x10(%r8,%rdi,4),%r11d
  0x00007fd6ccf1ddc3:   add    0x10(%rcx,%rdi,4),%r11d
  0x00007fd6ccf1ddc8:   mov    %r11d,0x10(%rdx,%rdi,4)      ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007fd6ccf1ddcd:   inc    %edi                         ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007fd6ccf1ddcf:   cmp    %r10d,%edi
  0x00007fd6ccf1ddd2:   jl     0x00007fd6ccf1ddbe           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B12: #	out( B27 B13 ) <- in( B11 )  Freq: 0.999983
  0x00007fd6ccf1ddd4:   mov    %ebp,%r10d
  0x00007fd6ccf1ddd7:   add    $0xffffffe1,%r10d
  0x00007fd6ccf1dddb:   mov    $0x80000000,%eax
  0x00007fd6ccf1dde0:   cmp    %r10d,%r13d
  0x00007fd6ccf1dde3:   cmovl  %eax,%r10d
  0x00007fd6ccf1dde7:   cmp    %r10d,%edi
  0x00007fd6ccf1ddea:   jge    0x00007fd6ccf1df05
 ;; B13: #	out( B32 B14 ) <- in( B12 )  Freq: 0.999982
  0x00007fd6ccf1ddf0:   cmp    %ebp,%edi
  0x00007fd6ccf1ddf2:   jae    0x00007fd6ccf1df6c
 ;; B14: #	out( B33 B15 ) <- in( B13 )  Freq: 0.999981
  0x00007fd6ccf1ddf8:   cmp    %r9d,%edi
  0x00007fd6ccf1ddfb:   nop
  0x00007fd6ccf1ddfc:   nop
  0x00007fd6ccf1ddfd:   nop
  0x00007fd6ccf1ddfe:   nop
  0x00007fd6ccf1ddff:   nop
  0x00007fd6ccf1de00:   jae    0x00007fd6ccf1df80
 ;; B15: #	out( B34 B16 ) <- in( B14 )  Freq: 0.99998
  0x00007fd6ccf1de06:   cmp    %ebx,%edi
  0x00007fd6ccf1de08:   jae    0x00007fd6ccf1df94
 ;; B16: #	out( B35 B17 ) <- in( B15 )  Freq: 0.999979
  0x00007fd6ccf1de0e:   mov    %edi,%r11d
  0x00007fd6ccf1de11:   add    $0x1f,%r11d
  0x00007fd6ccf1de15:   cmp    %ebx,%r11d
  0x00007fd6ccf1de18:   jae    0x00007fd6ccf1dfa8
 ;; B17: #	out( B36 B18 ) <- in( B16 )  Freq: 0.999978
  0x00007fd6ccf1de1e:   nop
  0x00007fd6ccf1de1f:   nop
  0x00007fd6ccf1de20:   cmp    %r9d,%r11d
  0x00007fd6ccf1de23:   jae    0x00007fd6ccf1dfbc
 ;; B18: #	out( B37 B19 ) <- in( B17 )  Freq: 0.999977
  0x00007fd6ccf1de29:   cmp    %ebp,%edi
  0x00007fd6ccf1de2b:   jae    0x00007fd6ccf1dfd0
 ;; B19: #	out( B38 B20 ) <- in( B18 )  Freq: 0.999976
  0x00007fd6ccf1de31:   cmp    %ebp,%r11d
  0x00007fd6ccf1de34:   jae    0x00007fd6ccf1dfe4
 ;; B20: #	out( B21 ) <- in( B19 )  Freq: 0.999975
  0x00007fd6ccf1de3a:   mov    $0x7d00,%ebx
 ;; B21: #	out( B22 ) <- in( B20 B23 ) Loop( B21-B23 ) Freq: 118146
  0x00007fd6ccf1de3f:   mov    %r10d,%r9d
  0x00007fd6ccf1de42:   sub    %edi,%r9d
  0x00007fd6ccf1de45:   cmp    %edi,%r10d
  0x00007fd6ccf1de48:   cmovl  %esi,%r9d
  0x00007fd6ccf1de4c:   cmp    $0x7d00,%r9d
  0x00007fd6ccf1de53:   cmova  %ebx,%r9d
  0x00007fd6ccf1de57:   add    %edi,%r9d
  0x00007fd6ccf1de5a:   nop
  0x00007fd6ccf1de5b:   nop
  0x00007fd6ccf1de5c:   nop
  0x00007fd6ccf1de5d:   nop
  0x00007fd6ccf1de5e:   nop
  0x00007fd6ccf1de5f:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 10)
 ;; B22: #	out( B22 B23 ) <- in( B21 B22 ) Loop( B22-B22 inner main of N159 strip mined) Freq: 1.39589e+10
  0x00007fd6ccf1de60:   vmovdqu 0x10(%r8,%rdi,4),%ymm0
  0x00007fd6ccf1de67:   vpaddd 0x10(%rcx,%rdi,4),%ymm0,%ymm0
  0x00007fd6ccf1de6d:   vmovdqu %ymm0,0x10(%rdx,%rdi,4)
  0x00007fd6ccf1de73:   movslq %edi,%r11
  0x00007fd6ccf1de76:   vmovdqu 0x30(%r8,%r11,4),%ymm0
  0x00007fd6ccf1de7d:   vpaddd 0x30(%rcx,%r11,4),%ymm0,%ymm0
  0x00007fd6ccf1de84:   vmovdqu %ymm0,0x30(%rdx,%r11,4)
  0x00007fd6ccf1de8b:   vmovdqu 0x50(%r8,%r11,4),%ymm0
  0x00007fd6ccf1de92:   vpaddd 0x50(%rcx,%r11,4),%ymm0,%ymm0
  0x00007fd6ccf1de99:   vmovdqu %ymm0,0x50(%rdx,%r11,4)
  0x00007fd6ccf1dea0:   vmovdqu 0x70(%r8,%r11,4),%ymm0
  0x00007fd6ccf1dea7:   vpaddd 0x70(%rcx,%r11,4),%ymm0,%ymm0
  0x00007fd6ccf1deae:   vmovdqu %ymm0,0x70(%rdx,%r11,4)     ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007fd6ccf1deb5:   add    $0x20,%edi                   ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007fd6ccf1deb8:   cmp    %r9d,%edi
  0x00007fd6ccf1debb:   jl     0x00007fd6ccf1de60           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
 ;; B23: #	out( B21 B24 ) <- in( B22 )  Freq: 118146
  0x00007fd6ccf1debd:   mov    0x130(%r15),%r11             ; ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@26 (line 9)
  0x00007fd6ccf1dec4:   test   %eax,(%r11)                  ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
                                                            ;   {poll}
  0x00007fd6ccf1dec7:   cmp    %r10d,%edi
  0x00007fd6ccf1deca:   jl     0x00007fd6ccf1de3f
 ;; B24: #	out( B27 B25 ) <- in( B23 )  Freq: 0.999975
  0x00007fd6ccf1ded0:   mov    %ebp,%r10d
  0x00007fd6ccf1ded3:   add    $0xfffffff9,%r10d
  0x00007fd6ccf1ded7:   cmp    %r10d,%r13d
  0x00007fd6ccf1deda:   cmovl  %eax,%r10d
  0x00007fd6ccf1dede:   nop
  0x00007fd6ccf1dedf:   nop
  0x00007fd6ccf1dee0:   cmp    %r10d,%edi
  0x00007fd6ccf1dee3:   jge    0x00007fd6ccf1df05
 ;; B25: #	out( B26 ) <- in( B24 )  Freq: 0.499988
  0x00007fd6ccf1dee5:   nop
  0x00007fd6ccf1dee6:   nop
  0x00007fd6ccf1dee7:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 10)
 ;; B26: #	out( B26 B27 ) <- in( B25 B26 ) Loop( B26-B26 inner post of N869) Freq: 0.999975
  0x00007fd6ccf1dee8:   vmovdqu 0x10(%r8,%rdi,4),%ymm0
  0x00007fd6ccf1deef:   vpaddd 0x10(%rcx,%rdi,4),%ymm0,%ymm0
  0x00007fd6ccf1def5:   vmovdqu %ymm0,0x10(%rdx,%rdi,4)     ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007fd6ccf1defb:   add    $0x8,%edi                    ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007fd6ccf1defe:   nop
  0x00007fd6ccf1deff:   nop
  0x00007fd6ccf1df00:   cmp    %r10d,%edi
  0x00007fd6ccf1df03:   jl     0x00007fd6ccf1dee8           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B27: #	out( B30 B28 ) <- in( B12 B26 B24 )  Freq: 0.999976
  0x00007fd6ccf1df05:   cmp    %ebp,%edi
  0x00007fd6ccf1df07:   jge    0x00007fd6ccf1df24
 ;; B28: #	out( B29 ) <- in( B27 )  Freq: 0.499988
  0x00007fd6ccf1df09:   nop
  0x00007fd6ccf1df0a:   nop
  0x00007fd6ccf1df0b:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 10)
 ;; B29: #	out( B29 B30 ) <- in( B28 B29 ) Loop( B29-B29 inner post of N234) Freq: 0.999976
  0x00007fd6ccf1df0c:   mov    0x10(%r8,%rdi,4),%r11d
  0x00007fd6ccf1df11:   add    0x10(%rcx,%rdi,4),%r11d
  0x00007fd6ccf1df16:   mov    %r11d,0x10(%rdx,%rdi,4)      ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007fd6ccf1df1b:   inc    %edi                         ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007fd6ccf1df1d:   nop
  0x00007fd6ccf1df1e:   nop
  0x00007fd6ccf1df1f:   nop
  0x00007fd6ccf1df20:   cmp    %ebp,%edi
  0x00007fd6ccf1df22:   jl     0x00007fd6ccf1df0c
 ;; B30: #	out( N334 ) <- in( B29 B27 B2 )  Freq: 0.999985
  0x00007fd6ccf1df24:   vzeroupper 
  0x00007fd6ccf1df27:   add    $0x30,%rsp
  0x00007fd6ccf1df2b:   pop    %rbp
  0x00007fd6ccf1df2c:   cmp    0x128(%r15),%rsp             ;   {poll_return}
  0x00007fd6ccf1df33:   ja     0x00007fd6ccf1e01c
  0x00007fd6ccf1df39:   retq                                ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B31: #	out( N334 ) <- in( B7 B3 B4 B5 B8 B9 B6 )  Freq: 7.06631e-06
  0x00007fd6ccf1df3a:   mov    $0xffffff76,%esi
  0x00007fd6ccf1df3f:   mov    %rdx,(%rsp)
  0x00007fd6ccf1df43:   mov    %rcx,0x8(%rsp)
  0x00007fd6ccf1df48:   mov    %r8,0x10(%rsp)
  0x00007fd6ccf1df4d:   nop
  0x00007fd6ccf1df4e:   nop
  0x00007fd6ccf1df4f:   nop
  0x00007fd6ccf1df50:   vzeroupper 
  0x00007fd6ccf1df53:   callq  0x00007fd6ccee6540           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@7 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd6ccf1df58:   movabs $0x7fd6d66d67b8,%rdi         ;   {external_word}
  0x00007fd6ccf1df62:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1df66:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1df6b:   hlt                                 ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
 ;; B32: #	out( N334 ) <- in( B13 )  Freq: 1.01326e-06
  0x00007fd6ccf1df6c:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1df76:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1df7a:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1df7f:   hlt    
 ;; B33: #	out( N334 ) <- in( B14 )  Freq: 1.01326e-06
  0x00007fd6ccf1df80:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1df8a:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1df8e:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1df93:   hlt    
 ;; B34: #	out( N334 ) <- in( B15 )  Freq: 1.01326e-06
  0x00007fd6ccf1df94:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1df9e:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1dfa2:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1dfa7:   hlt    
 ;; B35: #	out( N334 ) <- in( B16 )  Freq: 1.01326e-06
  0x00007fd6ccf1dfa8:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1dfb2:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1dfb6:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1dfbb:   hlt    
 ;; B36: #	out( N334 ) <- in( B17 )  Freq: 1.01326e-06
  0x00007fd6ccf1dfbc:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1dfc6:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1dfca:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1dfcf:   hlt    
 ;; B37: #	out( N334 ) <- in( B18 )  Freq: 1.01326e-06
  0x00007fd6ccf1dfd0:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1dfda:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1dfde:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1dfe3:   hlt    
 ;; B38: #	out( N334 ) <- in( B19 )  Freq: 1.01325e-06
  0x00007fd6ccf1dfe4:   movabs $0x7fd6d686e078,%rdi         ;   {external_word}
  0x00007fd6ccf1dfee:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1dff2:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1dff7:   hlt    
 ;; B39: #	out( N334 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007fd6ccf1dff8:   mov    $0xfffffff6,%esi
  0x00007fd6ccf1dffd:   nop
  0x00007fd6ccf1dffe:   nop
  0x00007fd6ccf1dfff:   nop
  0x00007fd6ccf1e000:   vzeroupper 
  0x00007fd6ccf1e003:   callq  0x00007fd6ccee6540           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@6 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fd6ccf1e008:   movabs $0x7fd6d66d67b8,%rdi         ;   {external_word}
  0x00007fd6ccf1e012:   and    $0xfffffffffffffff0,%rsp
  0x00007fd6ccf1e016:   callq  0x00007fd6d5e9bff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007fd6ccf1e01b:   hlt                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 10)
  0x00007fd6ccf1e01c:   movabs $0x7fd6ccf1df2c,%r10         ;   {internal_word}
  0x00007fd6ccf1e026:   mov    %r10,0x3e8(%r15)
  0x00007fd6ccf1e02d:   jmpq   0x00007fd6ccee7220           ;   {runtime_call SafepointBlob}
  0x00007fd6ccf1e032:   hlt    
  0x00007fd6ccf1e033:   hlt    
  0x00007fd6ccf1e034:   hlt    
  0x00007fd6ccf1e035:   hlt    
  0x00007fd6ccf1e036:   hlt    
  0x00007fd6ccf1e037:   hlt    
  0x00007fd6ccf1e038:   hlt    
  0x00007fd6ccf1e039:   hlt    
  0x00007fd6ccf1e03a:   hlt    
  0x00007fd6ccf1e03b:   hlt    
  0x00007fd6ccf1e03c:   hlt    
  0x00007fd6ccf1e03d:   hlt    
  0x00007fd6ccf1e03e:   hlt    
  0x00007fd6ccf1e03f:   hlt    
[Exception Handler]
  0x00007fd6ccf1e040:   jmpq   0x00007fd6cce2c6a0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007fd6ccf1e045:   callq  0x00007fd6ccf1e04a
  0x00007fd6ccf1e04a:   subq   $0x5,(%rsp)
  0x00007fd6ccf1e04f:   jmpq   0x00007fd6ccee6860           ;   {runtime_call DeoptimizationBlob}
  0x00007fd6ccf1e054:   hlt    
  0x00007fd6ccf1e055:   hlt    
  0x00007fd6ccf1e056:   hlt    
  0x00007fd6ccf1e057:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007fd6ccf1e058:   0x000000010110de48 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de48}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007fd6ccf1e060:   0x00007fd66fc116e8 {method} {0x00007fd66fc116e8} 'micro_scalar' '([I[I[I)V' in 'App'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007fd6ccf1dd1f offset=ffffffff bits=0):
PcDesc(pc=0x00007fd6ccf1dd4c offset=2c bits=0):   App::micro_scalar@-1 (line 8)
PcDesc(pc=0x00007fd6ccf1dd4f offset=2f bits=0):   App::micro_scalar@6 (line 9)
PcDesc(pc=0x00007fd6ccf1dd57 offset=37 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007fd6ccf1dd5a offset=3a bits=0):   App::micro_scalar@16 (line 10)
PcDesc(pc=0x00007fd6ccf1dd79 offset=59 bits=0):   App::micro_scalar@20 (line 10)
PcDesc(pc=0x00007fd6ccf1ddbe offset=9e bits=0):   App::micro_scalar@10 (line 10)
PcDesc(pc=0x00007fd6ccf1ddcd offset=ad bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1ddcf offset=af bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007fd6ccf1ddd4 offset=b4 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007fd6ccf1de60 offset=140 bits=0):   App::micro_scalar@10 (line 10)
PcDesc(pc=0x00007fd6ccf1deb5 offset=195 bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1deb8 offset=198 bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007fd6ccf1debd offset=19d bits=0):   App::micro_scalar@26 (line 9)
PcDesc(pc=0x00007fd6ccf1dec4 offset=1a4 bits=1):   App::micro_scalar@26 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rdi [14],int
PcDesc(pc=0x00007fd6ccf1dec7 offset=1a7 bits=0):   App::micro_scalar@26 (line 9)
PcDesc(pc=0x00007fd6ccf1dee8 offset=1c8 bits=0):   App::micro_scalar@10 (line 10)
PcDesc(pc=0x00007fd6ccf1defb offset=1db bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1defe offset=1de bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007fd6ccf1df05 offset=1e5 bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007fd6ccf1df0c offset=1ec bits=0):   App::micro_scalar@10 (line 10)
PcDesc(pc=0x00007fd6ccf1df1b offset=1fb bits=0):   App::micro_scalar@22 (line 10)
PcDesc(pc=0x00007fd6ccf1df1d offset=1fd bits=0):   App::micro_scalar@23 (line 9)
PcDesc(pc=0x00007fd6ccf1df3a offset=21a bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007fd6ccf1df58 offset=238 bits=1):   App::micro_scalar@7 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: 0
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
PcDesc(pc=0x00007fd6ccf1df6c offset=24c bits=0):   App::micro_scalar@7 (line 9)
PcDesc(pc=0x00007fd6ccf1e008 offset=2e8 bits=0):   App::micro_scalar@6 (line 9)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: empty
    - @1: NULL
PcDesc(pc=0x00007fd6ccf1e01c offset=2fc bits=0):   App::micro_scalar@10 (line 10)
PcDesc(pc=0x00007fd6ccf1e059 offset=339 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 3 OopMaps

ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop } pc offsets: 420 
ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop } pc offsets: 568 
ImmutableOopMap {} pc offsets: 744 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007fd6ccf1dd4c offset=2c):
   App::micro_scalar@-1 (line 8)
ScopeDesc(pc=0x00007fd6ccf1dd4f offset=2f):
   App::micro_scalar@6 (line 9)
ScopeDesc(pc=0x00007fd6ccf1dd57 offset=37):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007fd6ccf1dd5a offset=3a):
   App::micro_scalar@16 (line 10)
ScopeDesc(pc=0x00007fd6ccf1dd79 offset=59):
   App::micro_scalar@20 (line 10)
ScopeDesc(pc=0x00007fd6ccf1ddbe offset=9e):
   App::micro_scalar@10 (line 10)
ScopeDesc(pc=0x00007fd6ccf1ddcd offset=ad):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1ddcf offset=af):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007fd6ccf1ddd4 offset=b4):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007fd6ccf1de60 offset=140):
   App::micro_scalar@10 (line 10)
ScopeDesc(pc=0x00007fd6ccf1deb5 offset=195):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1deb8 offset=198):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007fd6ccf1debd offset=19d):
   App::micro_scalar@26 (line 9)
ScopeDesc(pc=0x00007fd6ccf1dec4 offset=1a4):
   App::micro_scalar@26 (line 9)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rdi [14],int
ScopeDesc(pc=0x00007fd6ccf1dec7 offset=1a7):
   App::micro_scalar@26 (line 9)
ScopeDesc(pc=0x00007fd6ccf1dee8 offset=1c8):
   App::micro_scalar@10 (line 10)
ScopeDesc(pc=0x00007fd6ccf1defb offset=1db):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1defe offset=1de):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007fd6ccf1df05 offset=1e5):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007fd6ccf1df0c offset=1ec):
   App::micro_scalar@10 (line 10)
ScopeDesc(pc=0x00007fd6ccf1df1b offset=1fb):
   App::micro_scalar@22 (line 10)
ScopeDesc(pc=0x00007fd6ccf1df1d offset=1fd):
   App::micro_scalar@23 (line 9)
ScopeDesc(pc=0x00007fd6ccf1df3a offset=21a):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007fd6ccf1df58 offset=238):
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
ScopeDesc(pc=0x00007fd6ccf1df6c offset=24c):
   App::micro_scalar@7 (line 9)
ScopeDesc(pc=0x00007fd6ccf1e008 offset=2e8):
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
ScopeDesc(pc=0x00007fd6ccf1e01c offset=2fc):
   App::micro_scalar@10 (line 10)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007fd6ccf1dc88: 6014
relocInfo@0x00007fd6ccf1dc88 [type=6(runtime_call) addr=0x00007fd6ccf1dd34 offset=20] | [destination=0x00007fd6ccee5920]
         @0x00007fd6ccf1dc8a: a190
relocInfo@0x00007fd6ccf1dc8a [type=10(poll) addr=0x00007fd6ccf1dec4 offset=400]
         @0x00007fd6ccf1dc8c: b068
relocInfo@0x00007fd6ccf1dc8c [type=11(poll_return) addr=0x00007fd6ccf1df2c offset=104]
         @0x00007fd6ccf1dc8e: 6427
relocInfo@0x00007fd6ccf1dc8e [type=6(runtime_call) addr=0x00007fd6ccf1df53 offset=39 format=1] | [destination=0x00007fd6ccee6540]
         @0x00007fd6ccf1dc90: f803d66d67b87fd67005
relocInfo@0x00007fd6ccf1dc98 [type=7(external_word) addr=0x00007fd6ccf1df58 offset=5 data={d66d67b87fd6}] | [target=0x00007fd6d66d67b8]
         @0x00007fd6ccf1dc9a: 640e
relocInfo@0x00007fd6ccf1dc9a [type=6(runtime_call) addr=0x00007fd6ccf1df66 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1dc9c: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1dca4 [type=7(external_word) addr=0x00007fd6ccf1df6c offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1dca6: 640e
relocInfo@0x00007fd6ccf1dca6 [type=6(runtime_call) addr=0x00007fd6ccf1df7a offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1dca8: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1dcb0 [type=7(external_word) addr=0x00007fd6ccf1df80 offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1dcb2: 640e
relocInfo@0x00007fd6ccf1dcb2 [type=6(runtime_call) addr=0x00007fd6ccf1df8e offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1dcb4: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1dcbc [type=7(external_word) addr=0x00007fd6ccf1df94 offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1dcbe: 640e
relocInfo@0x00007fd6ccf1dcbe [type=6(runtime_call) addr=0x00007fd6ccf1dfa2 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1dcc0: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1dcc8 [type=7(external_word) addr=0x00007fd6ccf1dfa8 offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1dcca: 640e
relocInfo@0x00007fd6ccf1dcca [type=6(runtime_call) addr=0x00007fd6ccf1dfb6 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1dccc: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1dcd4 [type=7(external_word) addr=0x00007fd6ccf1dfbc offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1dcd6: 640e
relocInfo@0x00007fd6ccf1dcd6 [type=6(runtime_call) addr=0x00007fd6ccf1dfca offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1dcd8: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1dce0 [type=7(external_word) addr=0x00007fd6ccf1dfd0 offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1dce2: 640e
relocInfo@0x00007fd6ccf1dce2 [type=6(runtime_call) addr=0x00007fd6ccf1dfde offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1dce4: f803d686e0787fd67006
relocInfo@0x00007fd6ccf1dcec [type=7(external_word) addr=0x00007fd6ccf1dfe4 offset=6 data={d686e0787fd6}] | [target=0x00007fd6d686e078]
         @0x00007fd6ccf1dcee: 640e
relocInfo@0x00007fd6ccf1dcee [type=6(runtime_call) addr=0x00007fd6ccf1dff2 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1dcf0: 6411
relocInfo@0x00007fd6ccf1dcf0 [type=6(runtime_call) addr=0x00007fd6ccf1e003 offset=17 format=1] | [destination=0x00007fd6ccee6540]
         @0x00007fd6ccf1dcf2: f803d66d67b87fd67005
relocInfo@0x00007fd6ccf1dcfa [type=7(external_word) addr=0x00007fd6ccf1e008 offset=5 data={d66d67b87fd6}] | [target=0x00007fd6d66d67b8]
         @0x00007fd6ccf1dcfc: 640e
relocInfo@0x00007fd6ccf1dcfc [type=6(runtime_call) addr=0x00007fd6ccf1e016 offset=14 format=1] | [destination=0x00007fd6d5e9bff4]
         @0x00007fd6ccf1dcfe: f0f08006
relocInfo@0x00007fd6ccf1dd00 [type=8(internal_word) addr=0x00007fd6ccf1e01c offset=6 data=240] | [target=0x00007fd6ccf1df2c]
         @0x00007fd6ccf1dd02: 6411
relocInfo@0x00007fd6ccf1dd02 [type=6(runtime_call) addr=0x00007fd6ccf1e02d offset=17 format=1] | [destination=0x00007fd6ccee7220]
         @0x00007fd6ccf1dd04: 0013
relocInfo@0x00007fd6ccf1dd04 [type=0(none) addr=0x00007fd6ccf1e040 offset=19]
         @0x00007fd6ccf1dd06: 6400
relocInfo@0x00007fd6ccf1dd06 [type=6(runtime_call) addr=0x00007fd6ccf1e040 offset=0 format=1] | [destination=0x00007fd6cce2c6a0]
         @0x00007fd6ccf1dd08: 640f
relocInfo@0x00007fd6ccf1dd08 [type=6(runtime_call) addr=0x00007fd6ccf1e04f offset=15 format=1] | [destination=0x00007fd6ccee6860]
         @0x00007fd6ccf1dd0a: 0000
relocInfo@0x00007fd6ccf1dd0a [type=0(none) addr=0x00007fd6ccf1e04f offset=0]
         @0x00007fd6ccf1dd0c: 0000
relocInfo@0x00007fd6ccf1dd0c [type=0(none) addr=0x00007fd6ccf1e04f offset=0]
         @0x00007fd6ccf1dd0e: 0000
relocInfo@0x00007fd6ccf1dd0e [type=0(none) addr=0x00007fd6ccf1e04f offset=0]
         @0x00007fd6ccf1dd10: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 3 entries, 28 bytes):
{
   < 0x00007fd6ccf1dd4c, 0x00007fd6ccf1dff8 > < 0x00007fd6ccf1dd57, 0x00007fd6ccf1df3a > < 0x00007fd6ccf1dd75, 0x00007fd6ccf1df3a > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x000000010110de48 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110de48}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
#0: 0x0000000000000000 NULL-oop
#1: 0x00007fd66fc116e8 {method} {0x00007fd66fc116e8} 'micro_scalar' '([I[I[I)V' in 'App'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SCALAR : [Time] 233 ms   [Res] 99999000000000
VECTOR : [Time] 244 ms   [Res] 99999000000000
VECTOR_MASKED : [Time] 2929 ms   [Res] 999990000000000
------------------------------------------------------------------------
App::micro_scalar([I[I[I)V
  interpreter_invocation_count:     1318 
  invocation_counter:               5000 
  backedge_counter:                 6024 
  mdo size: 552 bytes

0 iconst_0
1 istore #4
3 fast_iload #4
5 aload_1
6 arraylength
7 if_icmpge 29
  0   bci: 7    BranchData          trap(intrinsic_or_type_checked_inlining recompiled) taken(47) displacement(56)
                                    not taken(5983232)
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
  32  bci: 26   JumpData            taken(5983232) displacement(-32)
29 return
------------------------------------------------------------------------
Total MDO size: 552 bytes
