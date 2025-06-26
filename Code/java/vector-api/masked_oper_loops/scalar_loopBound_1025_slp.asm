CompileCommand: dontinline App.micro_vector bool dontinline = true
CompileCommand: print App.micro_scalar bool print = true
OpenJDK 64-Bit Server VM warning: printing of assembly code is enabled; turning on DebugNonSafepoints to gain additional output
Warning:  TraceDependencies results may be inflated by VerifyDependencies

============================= C2-compiled nmethod ==============================
----------------------- MetaData before Compile_id = 98 ------------------------
{method}
 - this oop:          0x00007f2bc10116e8
 - method holder:     'App'
 - constants:         0x00007f2bc1011090 constant pool [134]/operands[15] {0x00007f2bc1011090} for 'App' cache=0x00007f2bc1300000
 - access:            0xc1000001  public 
 - name:              'micro_scalar'
 - signature:         '([I[I[I)V'
 - max stack:         6
 - max locals:        5
 - size of params:    4
 - method size:       13
 - vtable index:      6
 - i2i entry:         0x00007f2c1900e220
 - adapters:          AHE@0x00007f2c1c3b6230: 0xbbbb0000 i2c: 0x00007f2c1907f6e0 c2i: 0x00007f2c1907f7cc c2iUV: 0x00007f2c1907f796 c2iNCI: 0x00007f2c1907f809
 - compiled entry     0x00007f2c1907f7cc
 - code size:         30
 - code start:        0x00007f2bc10116c0
 - code end (excl):   0x00007f2bc10116de
 - method data:       0x00007f2bc1011da8
 - checked ex length: 0
 - linenumber start:  0x00007f2bc10116de
 - localvar length:   0

------------------------ OptoAssembly for Compile_id = 98 -----------------------
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
031     jbe,u   B30  P=0.000971 C=117442.000000

037     B3: #	out( B31 B4 ) <- in( B2 )  Freq: 0.999028
037     movl    RBX, [RCX + #12 (8-bit)]	# range
03a     NullCheck RCX

03a     B4: #	out( B31 B5 ) <- in( B3 )  Freq: 0.999027
03a     testl   RBX, RBX	# unsigned
        nop 	# 4 bytes pad for loops and calls
040     jbe,u   B31  P=0.000001 C=-1.000000

046     B5: #	out( B31 B6 ) <- in( B4 )  Freq: 0.999026
046     movl    R13, RBP	# spill
049     decl    R13	# int
04c     cmpl    R13, RBX	# unsigned
04f     jnb,u   B31  P=0.000001 C=-1.000000

055     B6: #	out( B31 B7 ) <- in( B5 )  Freq: 0.999025
055     movl    R9, [R8 + #12 (8-bit)]	# range
059     NullCheck R8

059     B7: #	out( B31 B8 ) <- in( B6 )  Freq: 0.999024
059     testl   R9, R9	# unsigned
        nop 	# 4 bytes pad for loops and calls
060     jbe,u   B31  P=0.000001 C=-1.000000

066     B8: #	out( B31 B9 ) <- in( B7 )  Freq: 0.999023
066     cmpl    R13, R9	# unsigned
069     jnb,u   B31  P=0.000001 C=-1.000000

06f     B9: #	out( B31 B10 ) <- in( B8 )  Freq: 0.999022
06f     cmpl    R13, RBP	# unsigned
072     jnb,u   B31  P=0.000001 C=-1.000000

078     B10: #	out( B11 ) <- in( B9 )  Freq: 0.999021
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

09e     B11: #	out( B11 B12 ) <- in( B10 B11 ) Loop( B11-B11 inner pre of N234) Freq: 1.99804
09e     movl    R11, [R8 + #16 + RDI << #2]	# int
0a3     addl    R11, [RCX + #16 + RDI << #2]	# int
0a8     movl    [RDX + #16 + RDI << #2], R11	# int
0ad     incl    RDI	# int
0af     cmpl    RDI, R10
0b2     jl,s   B11	# loop end  P=0.500000 C=117327.000000

0b4     B12: #	out( B27 B13 ) <- in( B11 )  Freq: 0.999021
0b4     movl    R10, RBP	# spill
0b7     addl    R10, #-31	# int
0bb     movl    RAX, #-2147483648	# int
0c0     cmpl    R13, R10
0c3     cmovll R10, RAX	# signed, int
0c7     cmpl    RDI, R10
0ca     jge     B27  P=0.000001 C=-1.000000

0d0     B13: #	out( B32 B14 ) <- in( B12 )  Freq: 0.99902
0d0     # castII of RDI
0d0     cmpl    RDI, RBP	# unsigned
0d2     jnb,u   B32  P=0.000001 C=-1.000000

0d8     B14: #	out( B33 B15 ) <- in( B13 )  Freq: 0.999019
0d8     cmpl    RDI, R9	# unsigned
        nop 	# 5 bytes pad for loops and calls
0e0     jnb,u   B33  P=0.000001 C=-1.000000

0e6     B15: #	out( B34 B16 ) <- in( B14 )  Freq: 0.999018
0e6     cmpl    RDI, RBX	# unsigned
0e8     jnb,u   B34  P=0.000001 C=-1.000000

0ee     B16: #	out( B35 B17 ) <- in( B15 )  Freq: 0.999017
0ee     movl    R11, RDI	# spill
0f1     addl    R11, #31	# int
0f5     cmpl    R11, RBX	# unsigned
0f8     jnb,u   B35  P=0.000001 C=-1.000000

0fe     B17: #	out( B36 B18 ) <- in( B16 )  Freq: 0.999016
        nop 	# 2 bytes pad for loops and calls
100     cmpl    R11, R9	# unsigned
103     jnb,u   B36  P=0.000001 C=-1.000000

109     B18: #	out( B37 B19 ) <- in( B17 )  Freq: 0.999015
109     cmpl    RDI, RBP	# unsigned
10b     jnb,u   B37  P=0.000001 C=-1.000000

111     B19: #	out( B38 B20 ) <- in( B18 )  Freq: 0.999014
111     cmpl    R11, RBP	# unsigned
114     jnb,u   B38  P=0.000001 C=-1.000000

11a     B20: #	out( B21 ) <- in( B19 )  Freq: 0.999013
11a     movl    RBX, #32000	# int
11f     # TLS is in R15

11f     B21: #	out( B22 ) <- in( B20 B23 ) Loop( B21-B23 ) Freq: 1029.15
11f     movl    R9, R10	# spill
122     subl    R9, RDI	# int
125     cmpl    R10, RDI
128     cmovll R9, RSI	# signed, int
12c     cmpl    R9, #32000	# unsigned
133     cmovlnbe R9, RBX	# unsigned, int
137     addl    R9, RDI	# int
        nop 	# 6 bytes pad for loops and calls

140     B22: #	out( B22 B23 ) <- in( B21 B22 ) Loop( B22-B22 inner main of N159 strip mined) Freq: 1.06019e+06
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
19b     jl,s   B22	# loop end  P=0.999029 C=117327.000000

19d     B23: #	out( B21 B24 ) <- in( B22 )  Freq: 1029.15
19d     movq    R11, [R15 + #304 (32-bit)]	# ptr
1a4     testl   rax, [R11]	# Safepoint: poll for GC        # App::micro_scalar @ bci:26 (line 10) L[0]=_ L[1]=RDX L[2]=RCX L[3]=R8 L[4]=RDI
        # OopMap {r8=Oop rcx=Oop rdx=Oop off=420/0x1a4}
1a7     cmpl    RDI, R10
1aa     jl     B21  P=0.999029 C=117327.000000

1b0     B24: #	out( B27 B25 ) <- in( B23 )  Freq: 0.999013
1b0     movl    R10, RBP	# spill
1b3     addl    R10, #-7	# int
1b7     cmpl    R13, R10
1ba     cmovll R10, RAX	# signed, int
        nop 	# 2 bytes pad for loops and calls
1c0     cmpl    RDI, R10
1c3     jge,s   B27  P=0.500000 C=-1.000000

1c5     B25: #	out( B26 ) <- in( B24 )  Freq: 0.499507
1c5     # castII of RDI
        nop 	# 3 bytes pad for loops and calls

1c8     B26: #	out( B26 B27 ) <- in( B25 B26 ) Loop( B26-B26 inner post of N869) Freq: 0.999013
1c8     load_vector XMM0,[R8 + #16 + RDI << #2]
1cf     vpaddd  XMM0,XMM0,[RCX + #16 + RDI << #2]	! add packedI
1d5     store_vector [RDX + #16 + RDI << #2],XMM0
	
1db     addl    RDI, #8	# int
        nop 	# 2 bytes pad for loops and calls
1e0     cmpl    RDI, R10
1e3     jl,s   B26	# loop end  P=0.500000 C=117327.000000

1e5     B27: #	out( B30 B28 ) <- in( B12 B26 B24 )  Freq: 0.999014
1e5     cmpl    RDI, RBP
1e7     jge,s   B30  P=0.500000 C=-1.000000

1e9     B28: #	out( B29 ) <- in( B27 )  Freq: 0.499507
1e9     # castII of RDI
        nop 	# 3 bytes pad for loops and calls

1ec     B29: #	out( B29 B30 ) <- in( B28 B29 ) Loop( B29-B29 inner post of N234) Freq: 0.999014
1ec     movl    R11, [R8 + #16 + RDI << #2]	# int
1f1     addl    R11, [RCX + #16 + RDI << #2]	# int
1f6     movl    [RDX + #16 + RDI << #2], R11	# int
1fb     incl    RDI	# int
        nop 	# 3 bytes pad for loops and calls
200     cmpl    RDI, RBP
202     jl,s   B29	# loop end  P=0.500000 C=117327.000000

204     B30: #	out( N334 ) <- in( B29 B27 B2 )  Freq: 0.999985
204     vzeroupper
	addq    rsp, 48	# Destroy frame
	popq    rbp
	cmpq     rsp, poll_offset[r15_thread] 
	ja       #safepoint_stub	# Safepoint: poll for GC

219     ret

21a     B31: #	out( N334 ) <- in( B7 B3 B4 B5 B8 B9 B6 )  Freq: 7.05951e-06
21a     movl    RSI, #-138	# int
21f     movq    [rsp + #0], RDX	# spill
223     movq    [rsp + #8], RCX	# spill
228     movq    [rsp + #16], R8	# spill
        nop 	# 3 bytes pad for loops and calls
230     call,static  wrapper for: uncommon_trap(reason='predicate' action='maybe_recompile' debug_id='0')
        # App::micro_scalar @ bci:7 (line 10) L[0]=_ L[1]=rsp + #0 L[2]=rsp + #8 L[3]=rsp + #16 L[4]=#0 STK[0]=#0 STK[1]=RBP
        # OopMap {[0]=Oop [8]=Oop [16]=Oop off=568/0x238}
238     stop	# ShouldNotReachHere

24c     B32: #	out( N334 ) <- in( B13 )  Freq: 1.01229e-06
24c     stop	# ShouldNotReachHere

260     B33: #	out( N334 ) <- in( B14 )  Freq: 1.01229e-06
260     stop	# ShouldNotReachHere

274     B34: #	out( N334 ) <- in( B15 )  Freq: 1.01228e-06
274     stop	# ShouldNotReachHere

288     B35: #	out( N334 ) <- in( B16 )  Freq: 1.01228e-06
288     stop	# ShouldNotReachHere

29c     B36: #	out( N334 ) <- in( B17 )  Freq: 1.01228e-06
29c     stop	# ShouldNotReachHere

2b0     B37: #	out( N334 ) <- in( B18 )  Freq: 1.01228e-06
2b0     stop	# ShouldNotReachHere

2c4     B38: #	out( N334 ) <- in( B19 )  Freq: 1.01228e-06
2c4     stop	# ShouldNotReachHere

2d8     B39: #	out( N334 ) <- in( B1 )  Freq: 1.01328e-06
2d8     movl    RSI, #-10	# int
        nop 	# 3 bytes pad for loops and calls
2e0     call,static  wrapper for: uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')
        # App::micro_scalar @ bci:6 (line 10) L[0]=_ L[1]=_ L[2]=_ L[3]=_ L[4]=_ STK[0]=_ STK[1]=#NULL
        # OopMap {off=744/0x2e8}
2e8     stop	# ShouldNotReachHere

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    1459   98             App::micro_scalar (30 bytes)
 total in heap  [0x00007f2c19140d90,0x00007f2c19141558] = 1992
 relocation     [0x00007f2c19140f08,0x00007f2c19140f90] = 136
 main code      [0x00007f2c19140fa0,0x00007f2c191412c0] = 800
 stub code      [0x00007f2c191412c0,0x00007f2c191412d8] = 24
 oops           [0x00007f2c191412d8,0x00007f2c191412e0] = 8
 metadata       [0x00007f2c191412e0,0x00007f2c191412e8] = 8
 scopes data    [0x00007f2c191412e8,0x00007f2c19141360] = 120
 scopes pcs     [0x00007f2c19141360,0x00007f2c19141530] = 464
 dependencies   [0x00007f2c19141530,0x00007f2c19141538] = 8
 nul chk table  [0x00007f2c19141538,0x00007f2c19141558] = 32

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Entry Point]
  # {method} {0x00007f2bc10116e8} 'micro_scalar' '([I[I[I)V' in 'App'
  # this:     rsi:rsi   = 'App'
  # parm0:    rdx:rdx   = '[I'
  # parm1:    rcx:rcx   = '[I'
  # parm2:    r8:r8     = '[I'
  #           [sp+0x40]  (sp of caller)
 ;; N334: #	out( B1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f2c19140fa0:   mov    0x8(%rsi),%r10d
  0x00007f2c19140fa4:   movabs $0x800000000,%r11
  0x00007f2c19140fae:   add    %r11,%r10
  0x00007f2c19140fb1:   cmp    %r10,%rax
  0x00007f2c19140fb4:   jne    0x00007f2c19115920           ;   {runtime_call ic_miss_stub}
  0x00007f2c19140fba:   nop
  0x00007f2c19140fbb:   nop
  0x00007f2c19140fbc:   nop
  0x00007f2c19140fbd:   nop
  0x00007f2c19140fbe:   nop
  0x00007f2c19140fbf:   nop
[Verified Entry Point]
 ;; B1: #	out( B39 B2 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f2c19140fc0:   mov    %eax,-0x16000(%rsp)
  0x00007f2c19140fc7:   push   %rbp
  0x00007f2c19140fc8:   sub    $0x30,%rsp                   ;*synchronization entry
                                                            ; - App::micro_scalar@-1 (line 9)
  0x00007f2c19140fcc:   mov    0xc(%rdx),%ebp               ; implicit exception: dispatches to 0x00007f2c19141278
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@6 (line 10)
 ;; B2: #	out( B30 B3 ) <- in( B1 )  Freq: 0.999999
  0x00007f2c19140fcf:   test   %ebp,%ebp
  0x00007f2c19140fd1:   jbe    0x00007f2c191411a4           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 10)
 ;; B3: #	out( B31 B4 ) <- in( B2 )  Freq: 0.999028
  0x00007f2c19140fd7:   mov    0xc(%rcx),%ebx               ; implicit exception: dispatches to 0x00007f2c191411ba
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 11)
 ;; B4: #	out( B31 B5 ) <- in( B3 )  Freq: 0.999027
  0x00007f2c19140fda:   test   %ebx,%ebx
  0x00007f2c19140fdc:   nop
  0x00007f2c19140fdd:   nop
  0x00007f2c19140fde:   nop
  0x00007f2c19140fdf:   nop
  0x00007f2c19140fe0:   jbe    0x00007f2c191411ba
 ;; B5: #	out( B31 B6 ) <- in( B4 )  Freq: 0.999026
  0x00007f2c19140fe6:   mov    %ebp,%r13d
  0x00007f2c19140fe9:   dec    %r13d
  0x00007f2c19140fec:   cmp    %ebx,%r13d
  0x00007f2c19140fef:   jae    0x00007f2c191411ba
 ;; B6: #	out( B31 B7 ) <- in( B5 )  Freq: 0.999025
  0x00007f2c19140ff5:   mov    0xc(%r8),%r9d                ; implicit exception: dispatches to 0x00007f2c191411ba
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 11)
 ;; B7: #	out( B31 B8 ) <- in( B6 )  Freq: 0.999024
  0x00007f2c19140ff9:   test   %r9d,%r9d
  0x00007f2c19140ffc:   nop
  0x00007f2c19140ffd:   nop
  0x00007f2c19140ffe:   nop
  0x00007f2c19140fff:   nop
  0x00007f2c19141000:   jbe    0x00007f2c191411ba
 ;; B8: #	out( B31 B9 ) <- in( B7 )  Freq: 0.999023
  0x00007f2c19141006:   cmp    %r9d,%r13d
  0x00007f2c19141009:   jae    0x00007f2c191411ba
 ;; B9: #	out( B31 B10 ) <- in( B8 )  Freq: 0.999022
  0x00007f2c1914100f:   cmp    %ebp,%r13d
  0x00007f2c19141012:   jae    0x00007f2c191411ba
 ;; B10: #	out( B11 ) <- in( B9 )  Freq: 0.999021
  0x00007f2c19141018:   mov    %edx,%r11d
  0x00007f2c1914101b:   shr    $0x2,%r11d
  0x00007f2c1914101f:   and    $0x7,%r11d
  0x00007f2c19141023:   mov    $0x3,%r10d
  0x00007f2c19141029:   sub    %r11d,%r10d
  0x00007f2c1914102c:   and    $0x7,%r10d
  0x00007f2c19141030:   inc    %r10d
  0x00007f2c19141033:   cmp    %ebp,%r10d
  0x00007f2c19141036:   cmovg  %ebp,%r10d
  0x00007f2c1914103a:   xor    %esi,%esi
  0x00007f2c1914103c:   xor    %edi,%edi                    ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 11)
 ;; B11: #	out( B11 B12 ) <- in( B10 B11 ) Loop( B11-B11 inner pre of N234) Freq: 1.99804
  0x00007f2c1914103e:   mov    0x10(%r8,%rdi,4),%r11d
  0x00007f2c19141043:   add    0x10(%rcx,%rdi,4),%r11d
  0x00007f2c19141048:   mov    %r11d,0x10(%rdx,%rdi,4)      ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 11)
  0x00007f2c1914104d:   inc    %edi                         ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 10)
  0x00007f2c1914104f:   cmp    %r10d,%edi
  0x00007f2c19141052:   jl     0x00007f2c1914103e           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 10)
 ;; B12: #	out( B27 B13 ) <- in( B11 )  Freq: 0.999021
  0x00007f2c19141054:   mov    %ebp,%r10d
  0x00007f2c19141057:   add    $0xffffffe1,%r10d
  0x00007f2c1914105b:   mov    $0x80000000,%eax
  0x00007f2c19141060:   cmp    %r10d,%r13d
  0x00007f2c19141063:   cmovl  %eax,%r10d
  0x00007f2c19141067:   cmp    %r10d,%edi
  0x00007f2c1914106a:   jge    0x00007f2c19141185
 ;; B13: #	out( B32 B14 ) <- in( B12 )  Freq: 0.99902
  0x00007f2c19141070:   cmp    %ebp,%edi
  0x00007f2c19141072:   jae    0x00007f2c191411ec
 ;; B14: #	out( B33 B15 ) <- in( B13 )  Freq: 0.999019
  0x00007f2c19141078:   cmp    %r9d,%edi
  0x00007f2c1914107b:   nop
  0x00007f2c1914107c:   nop
  0x00007f2c1914107d:   nop
  0x00007f2c1914107e:   nop
  0x00007f2c1914107f:   nop
  0x00007f2c19141080:   jae    0x00007f2c19141200
 ;; B15: #	out( B34 B16 ) <- in( B14 )  Freq: 0.999018
  0x00007f2c19141086:   cmp    %ebx,%edi
  0x00007f2c19141088:   jae    0x00007f2c19141214
 ;; B16: #	out( B35 B17 ) <- in( B15 )  Freq: 0.999017
  0x00007f2c1914108e:   mov    %edi,%r11d
  0x00007f2c19141091:   add    $0x1f,%r11d
  0x00007f2c19141095:   cmp    %ebx,%r11d
  0x00007f2c19141098:   jae    0x00007f2c19141228
 ;; B17: #	out( B36 B18 ) <- in( B16 )  Freq: 0.999016
  0x00007f2c1914109e:   nop
  0x00007f2c1914109f:   nop
  0x00007f2c191410a0:   cmp    %r9d,%r11d
  0x00007f2c191410a3:   jae    0x00007f2c1914123c
 ;; B18: #	out( B37 B19 ) <- in( B17 )  Freq: 0.999015
  0x00007f2c191410a9:   cmp    %ebp,%edi
  0x00007f2c191410ab:   jae    0x00007f2c19141250
 ;; B19: #	out( B38 B20 ) <- in( B18 )  Freq: 0.999014
  0x00007f2c191410b1:   cmp    %ebp,%r11d
  0x00007f2c191410b4:   jae    0x00007f2c19141264
 ;; B20: #	out( B21 ) <- in( B19 )  Freq: 0.999013
  0x00007f2c191410ba:   mov    $0x7d00,%ebx
 ;; B21: #	out( B22 ) <- in( B20 B23 ) Loop( B21-B23 ) Freq: 1029.15
  0x00007f2c191410bf:   mov    %r10d,%r9d
  0x00007f2c191410c2:   sub    %edi,%r9d
  0x00007f2c191410c5:   cmp    %edi,%r10d
  0x00007f2c191410c8:   cmovl  %esi,%r9d
  0x00007f2c191410cc:   cmp    $0x7d00,%r9d
  0x00007f2c191410d3:   cmova  %ebx,%r9d
  0x00007f2c191410d7:   add    %edi,%r9d
  0x00007f2c191410da:   nop
  0x00007f2c191410db:   nop
  0x00007f2c191410dc:   nop
  0x00007f2c191410dd:   nop
  0x00007f2c191410de:   nop
  0x00007f2c191410df:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 11)
 ;; B22: #	out( B22 B23 ) <- in( B21 B22 ) Loop( B22-B22 inner main of N159 strip mined) Freq: 1.06019e+06
  0x00007f2c191410e0:   vmovdqu 0x10(%r8,%rdi,4),%ymm0
  0x00007f2c191410e7:   vpaddd 0x10(%rcx,%rdi,4),%ymm0,%ymm0
  0x00007f2c191410ed:   vmovdqu %ymm0,0x10(%rdx,%rdi,4)
  0x00007f2c191410f3:   movslq %edi,%r11
  0x00007f2c191410f6:   vmovdqu 0x30(%r8,%r11,4),%ymm0
  0x00007f2c191410fd:   vpaddd 0x30(%rcx,%r11,4),%ymm0,%ymm0
  0x00007f2c19141104:   vmovdqu %ymm0,0x30(%rdx,%r11,4)
  0x00007f2c1914110b:   vmovdqu 0x50(%r8,%r11,4),%ymm0
  0x00007f2c19141112:   vpaddd 0x50(%rcx,%r11,4),%ymm0,%ymm0
  0x00007f2c19141119:   vmovdqu %ymm0,0x50(%rdx,%r11,4)
  0x00007f2c19141120:   vmovdqu 0x70(%r8,%r11,4),%ymm0
  0x00007f2c19141127:   vpaddd 0x70(%rcx,%r11,4),%ymm0,%ymm0
  0x00007f2c1914112e:   vmovdqu %ymm0,0x70(%rdx,%r11,4)     ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 11)
  0x00007f2c19141135:   add    $0x20,%edi                   ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 10)
  0x00007f2c19141138:   cmp    %r9d,%edi
  0x00007f2c1914113b:   jl     0x00007f2c191410e0           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 10)
 ;; B23: #	out( B21 B24 ) <- in( B22 )  Freq: 1029.15
  0x00007f2c1914113d:   mov    0x130(%r15),%r11             ; ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@26 (line 10)
  0x00007f2c19141144:   test   %eax,(%r11)                  ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 10)
                                                            ;   {poll}
  0x00007f2c19141147:   cmp    %r10d,%edi
  0x00007f2c1914114a:   jl     0x00007f2c191410bf
 ;; B24: #	out( B27 B25 ) <- in( B23 )  Freq: 0.999013
  0x00007f2c19141150:   mov    %ebp,%r10d
  0x00007f2c19141153:   add    $0xfffffff9,%r10d
  0x00007f2c19141157:   cmp    %r10d,%r13d
  0x00007f2c1914115a:   cmovl  %eax,%r10d
  0x00007f2c1914115e:   nop
  0x00007f2c1914115f:   nop
  0x00007f2c19141160:   cmp    %r10d,%edi
  0x00007f2c19141163:   jge    0x00007f2c19141185
 ;; B25: #	out( B26 ) <- in( B24 )  Freq: 0.499507
  0x00007f2c19141165:   nop
  0x00007f2c19141166:   nop
  0x00007f2c19141167:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 11)
 ;; B26: #	out( B26 B27 ) <- in( B25 B26 ) Loop( B26-B26 inner post of N869) Freq: 0.999013
  0x00007f2c19141168:   vmovdqu 0x10(%r8,%rdi,4),%ymm0
  0x00007f2c1914116f:   vpaddd 0x10(%rcx,%rdi,4),%ymm0,%ymm0
  0x00007f2c19141175:   vmovdqu %ymm0,0x10(%rdx,%rdi,4)     ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 11)
  0x00007f2c1914117b:   add    $0x8,%edi                    ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 10)
  0x00007f2c1914117e:   nop
  0x00007f2c1914117f:   nop
  0x00007f2c19141180:   cmp    %r10d,%edi
  0x00007f2c19141183:   jl     0x00007f2c19141168           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 10)
 ;; B27: #	out( B30 B28 ) <- in( B12 B26 B24 )  Freq: 0.999014
  0x00007f2c19141185:   cmp    %ebp,%edi
  0x00007f2c19141187:   jge    0x00007f2c191411a4
 ;; B28: #	out( B29 ) <- in( B27 )  Freq: 0.499507
  0x00007f2c19141189:   nop
  0x00007f2c1914118a:   nop
  0x00007f2c1914118b:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 11)
 ;; B29: #	out( B29 B30 ) <- in( B28 B29 ) Loop( B29-B29 inner post of N234) Freq: 0.999014
  0x00007f2c1914118c:   mov    0x10(%r8,%rdi,4),%r11d
  0x00007f2c19141191:   add    0x10(%rcx,%rdi,4),%r11d
  0x00007f2c19141196:   mov    %r11d,0x10(%rdx,%rdi,4)      ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 11)
  0x00007f2c1914119b:   inc    %edi                         ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 10)
  0x00007f2c1914119d:   nop
  0x00007f2c1914119e:   nop
  0x00007f2c1914119f:   nop
  0x00007f2c191411a0:   cmp    %ebp,%edi
  0x00007f2c191411a2:   jl     0x00007f2c1914118c
 ;; B30: #	out( N334 ) <- in( B29 B27 B2 )  Freq: 0.999985
  0x00007f2c191411a4:   vzeroupper 
  0x00007f2c191411a7:   add    $0x30,%rsp
  0x00007f2c191411ab:   pop    %rbp
  0x00007f2c191411ac:   cmp    0x128(%r15),%rsp             ;   {poll_return}
  0x00007f2c191411b3:   ja     0x00007f2c1914129c
  0x00007f2c191411b9:   retq                                ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 10)
 ;; B31: #	out( N334 ) <- in( B7 B3 B4 B5 B8 B9 B6 )  Freq: 7.05951e-06
  0x00007f2c191411ba:   mov    $0xffffff76,%esi
  0x00007f2c191411bf:   mov    %rdx,(%rsp)
  0x00007f2c191411c3:   mov    %rcx,0x8(%rsp)
  0x00007f2c191411c8:   mov    %r8,0x10(%rsp)
  0x00007f2c191411cd:   nop
  0x00007f2c191411ce:   nop
  0x00007f2c191411cf:   nop
  0x00007f2c191411d0:   vzeroupper 
  0x00007f2c191411d3:   callq  0x00007f2c19116540           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@7 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f2c191411d8:   movabs $0x7f2c239517b8,%rdi         ;   {external_word}
  0x00007f2c191411e2:   and    $0xfffffffffffffff0,%rsp
  0x00007f2c191411e6:   callq  0x00007f2c23116ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f2c191411eb:   hlt                                 ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 10)
 ;; B32: #	out( N334 ) <- in( B13 )  Freq: 1.01229e-06
  0x00007f2c191411ec:   movabs $0x7f2c23ae9078,%rdi         ;   {external_word}
  0x00007f2c191411f6:   and    $0xfffffffffffffff0,%rsp
  0x00007f2c191411fa:   callq  0x00007f2c23116ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f2c191411ff:   hlt    
 ;; B33: #	out( N334 ) <- in( B14 )  Freq: 1.01229e-06
  0x00007f2c19141200:   movabs $0x7f2c23ae9078,%rdi         ;   {external_word}
  0x00007f2c1914120a:   and    $0xfffffffffffffff0,%rsp
  0x00007f2c1914120e:   callq  0x00007f2c23116ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f2c19141213:   hlt    
 ;; B34: #	out( N334 ) <- in( B15 )  Freq: 1.01228e-06
  0x00007f2c19141214:   movabs $0x7f2c23ae9078,%rdi         ;   {external_word}
  0x00007f2c1914121e:   and    $0xfffffffffffffff0,%rsp
  0x00007f2c19141222:   callq  0x00007f2c23116ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f2c19141227:   hlt    
 ;; B35: #	out( N334 ) <- in( B16 )  Freq: 1.01228e-06
  0x00007f2c19141228:   movabs $0x7f2c23ae9078,%rdi         ;   {external_word}
  0x00007f2c19141232:   and    $0xfffffffffffffff0,%rsp
  0x00007f2c19141236:   callq  0x00007f2c23116ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f2c1914123b:   hlt    
 ;; B36: #	out( N334 ) <- in( B17 )  Freq: 1.01228e-06
  0x00007f2c1914123c:   movabs $0x7f2c23ae9078,%rdi         ;   {external_word}
  0x00007f2c19141246:   and    $0xfffffffffffffff0,%rsp
  0x00007f2c1914124a:   callq  0x00007f2c23116ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f2c1914124f:   hlt    
 ;; B37: #	out( N334 ) <- in( B18 )  Freq: 1.01228e-06
  0x00007f2c19141250:   movabs $0x7f2c23ae9078,%rdi         ;   {external_word}
  0x00007f2c1914125a:   and    $0xfffffffffffffff0,%rsp
  0x00007f2c1914125e:   callq  0x00007f2c23116ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f2c19141263:   hlt    
 ;; B38: #	out( N334 ) <- in( B19 )  Freq: 1.01228e-06
  0x00007f2c19141264:   movabs $0x7f2c23ae9078,%rdi         ;   {external_word}
  0x00007f2c1914126e:   and    $0xfffffffffffffff0,%rsp
  0x00007f2c19141272:   callq  0x00007f2c23116ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f2c19141277:   hlt    
 ;; B39: #	out( N334 ) <- in( B1 )  Freq: 1.01328e-06
  0x00007f2c19141278:   mov    $0xfffffff6,%esi
  0x00007f2c1914127d:   nop
  0x00007f2c1914127e:   nop
  0x00007f2c1914127f:   nop
  0x00007f2c19141280:   vzeroupper 
  0x00007f2c19141283:   callq  0x00007f2c19116540           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@6 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f2c19141288:   movabs $0x7f2c239517b8,%rdi         ;   {external_word}
  0x00007f2c19141292:   and    $0xfffffffffffffff0,%rsp
  0x00007f2c19141296:   callq  0x00007f2c23116ff4           ;   {runtime_call MacroAssembler::debug64(char*, long, long*)}
  0x00007f2c1914129b:   hlt                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 11)
  0x00007f2c1914129c:   movabs $0x7f2c191411ac,%r10         ;   {internal_word}
  0x00007f2c191412a6:   mov    %r10,0x3e8(%r15)
  0x00007f2c191412ad:   jmpq   0x00007f2c19117220           ;   {runtime_call SafepointBlob}
  0x00007f2c191412b2:   hlt    
  0x00007f2c191412b3:   hlt    
  0x00007f2c191412b4:   hlt    
  0x00007f2c191412b5:   hlt    
  0x00007f2c191412b6:   hlt    
  0x00007f2c191412b7:   hlt    
  0x00007f2c191412b8:   hlt    
  0x00007f2c191412b9:   hlt    
  0x00007f2c191412ba:   hlt    
  0x00007f2c191412bb:   hlt    
  0x00007f2c191412bc:   hlt    
  0x00007f2c191412bd:   hlt    
  0x00007f2c191412be:   hlt    
  0x00007f2c191412bf:   hlt    
[Exception Handler]
  0x00007f2c191412c0:   jmpq   0x00007f2c1905c6a0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f2c191412c5:   callq  0x00007f2c191412ca
  0x00007f2c191412ca:   subq   $0x5,(%rsp)
  0x00007f2c191412cf:   jmpq   0x00007f2c19116860           ;   {runtime_call DeoptimizationBlob}
  0x00007f2c191412d4:   hlt    
  0x00007f2c191412d5:   hlt    
  0x00007f2c191412d6:   hlt    
  0x00007f2c191412d7:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007f2c191412d8:   0x000000010110df10 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110df10}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007f2c191412e0:   0x00007f2bc10116e8 {method} {0x00007f2bc10116e8} 'micro_scalar' '([I[I[I)V' in 'App'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007f2c19140f9f offset=ffffffff bits=0):
PcDesc(pc=0x00007f2c19140fcc offset=2c bits=0):   App::micro_scalar@-1 (line 9)
PcDesc(pc=0x00007f2c19140fcf offset=2f bits=0):   App::micro_scalar@6 (line 10)
PcDesc(pc=0x00007f2c19140fd7 offset=37 bits=0):   App::micro_scalar@7 (line 10)
PcDesc(pc=0x00007f2c19140fda offset=3a bits=0):   App::micro_scalar@16 (line 11)
PcDesc(pc=0x00007f2c19140ff9 offset=59 bits=0):   App::micro_scalar@20 (line 11)
PcDesc(pc=0x00007f2c1914103e offset=9e bits=0):   App::micro_scalar@10 (line 11)
PcDesc(pc=0x00007f2c1914104d offset=ad bits=0):   App::micro_scalar@22 (line 11)
PcDesc(pc=0x00007f2c1914104f offset=af bits=0):   App::micro_scalar@23 (line 10)
PcDesc(pc=0x00007f2c19141054 offset=b4 bits=0):   App::micro_scalar@7 (line 10)
PcDesc(pc=0x00007f2c191410e0 offset=140 bits=0):   App::micro_scalar@10 (line 11)
PcDesc(pc=0x00007f2c19141135 offset=195 bits=0):   App::micro_scalar@22 (line 11)
PcDesc(pc=0x00007f2c19141138 offset=198 bits=0):   App::micro_scalar@23 (line 10)
PcDesc(pc=0x00007f2c1914113d offset=19d bits=0):   App::micro_scalar@26 (line 10)
PcDesc(pc=0x00007f2c19141144 offset=1a4 bits=1):   App::micro_scalar@26 (line 10)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rdi [14],int
PcDesc(pc=0x00007f2c19141147 offset=1a7 bits=0):   App::micro_scalar@26 (line 10)
PcDesc(pc=0x00007f2c19141168 offset=1c8 bits=0):   App::micro_scalar@10 (line 11)
PcDesc(pc=0x00007f2c1914117b offset=1db bits=0):   App::micro_scalar@22 (line 11)
PcDesc(pc=0x00007f2c1914117e offset=1de bits=0):   App::micro_scalar@23 (line 10)
PcDesc(pc=0x00007f2c19141185 offset=1e5 bits=0):   App::micro_scalar@7 (line 10)
PcDesc(pc=0x00007f2c1914118c offset=1ec bits=0):   App::micro_scalar@10 (line 11)
PcDesc(pc=0x00007f2c1914119b offset=1fb bits=0):   App::micro_scalar@22 (line 11)
PcDesc(pc=0x00007f2c1914119d offset=1fd bits=0):   App::micro_scalar@23 (line 10)
PcDesc(pc=0x00007f2c191411ba offset=21a bits=0):   App::micro_scalar@7 (line 10)
PcDesc(pc=0x00007f2c191411d8 offset=238 bits=1):   App::micro_scalar@7 (line 10)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: 0
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
PcDesc(pc=0x00007f2c191411ec offset=24c bits=0):   App::micro_scalar@7 (line 10)
PcDesc(pc=0x00007f2c19141288 offset=2e8 bits=0):   App::micro_scalar@6 (line 10)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: empty
    - @1: NULL
PcDesc(pc=0x00007f2c1914129c offset=2fc bits=0):   App::micro_scalar@10 (line 11)
PcDesc(pc=0x00007f2c191412d9 offset=339 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 3 OopMaps

ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop } pc offsets: 420 
ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop } pc offsets: 568 
ImmutableOopMap {} pc offsets: 744 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007f2c19140fcc offset=2c):
   App::micro_scalar@-1 (line 9)
ScopeDesc(pc=0x00007f2c19140fcf offset=2f):
   App::micro_scalar@6 (line 10)
ScopeDesc(pc=0x00007f2c19140fd7 offset=37):
   App::micro_scalar@7 (line 10)
ScopeDesc(pc=0x00007f2c19140fda offset=3a):
   App::micro_scalar@16 (line 11)
ScopeDesc(pc=0x00007f2c19140ff9 offset=59):
   App::micro_scalar@20 (line 11)
ScopeDesc(pc=0x00007f2c1914103e offset=9e):
   App::micro_scalar@10 (line 11)
ScopeDesc(pc=0x00007f2c1914104d offset=ad):
   App::micro_scalar@22 (line 11)
ScopeDesc(pc=0x00007f2c1914104f offset=af):
   App::micro_scalar@23 (line 10)
ScopeDesc(pc=0x00007f2c19141054 offset=b4):
   App::micro_scalar@7 (line 10)
ScopeDesc(pc=0x00007f2c191410e0 offset=140):
   App::micro_scalar@10 (line 11)
ScopeDesc(pc=0x00007f2c19141135 offset=195):
   App::micro_scalar@22 (line 11)
ScopeDesc(pc=0x00007f2c19141138 offset=198):
   App::micro_scalar@23 (line 10)
ScopeDesc(pc=0x00007f2c1914113d offset=19d):
   App::micro_scalar@26 (line 10)
ScopeDesc(pc=0x00007f2c19141144 offset=1a4):
   App::micro_scalar@26 (line 10)  reexecute=true
   Locals
    - l0: empty
    - l1: reg rdx [4],oop
    - l2: reg rcx [2],oop
    - l3: reg r8 [16],oop
    - l4: reg rdi [14],int
ScopeDesc(pc=0x00007f2c19141147 offset=1a7):
   App::micro_scalar@26 (line 10)
ScopeDesc(pc=0x00007f2c19141168 offset=1c8):
   App::micro_scalar@10 (line 11)
ScopeDesc(pc=0x00007f2c1914117b offset=1db):
   App::micro_scalar@22 (line 11)
ScopeDesc(pc=0x00007f2c1914117e offset=1de):
   App::micro_scalar@23 (line 10)
ScopeDesc(pc=0x00007f2c19141185 offset=1e5):
   App::micro_scalar@7 (line 10)
ScopeDesc(pc=0x00007f2c1914118c offset=1ec):
   App::micro_scalar@10 (line 11)
ScopeDesc(pc=0x00007f2c1914119b offset=1fb):
   App::micro_scalar@22 (line 11)
ScopeDesc(pc=0x00007f2c1914119d offset=1fd):
   App::micro_scalar@23 (line 10)
ScopeDesc(pc=0x00007f2c191411ba offset=21a):
   App::micro_scalar@7 (line 10)
ScopeDesc(pc=0x00007f2c191411d8 offset=238):
   App::micro_scalar@7 (line 10)  reexecute=true
   Locals
    - l0: empty
    - l1: stack[0],oop
    - l2: stack[8],oop
    - l3: stack[16],oop
    - l4: 0
   Expression stack
    - @0: 0
    - @1: reg rbp [10],int
ScopeDesc(pc=0x00007f2c191411ec offset=24c):
   App::micro_scalar@7 (line 10)
ScopeDesc(pc=0x00007f2c19141288 offset=2e8):
   App::micro_scalar@6 (line 10)
   Locals
    - l0: empty
    - l1: empty
    - l2: empty
    - l3: empty
    - l4: empty
   Expression stack
    - @0: empty
    - @1: NULL
ScopeDesc(pc=0x00007f2c1914129c offset=2fc):
   App::micro_scalar@10 (line 11)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007f2c19140f08: 6014
relocInfo@0x00007f2c19140f08 [type=6(runtime_call) addr=0x00007f2c19140fb4 offset=20] | [destination=0x00007f2c19115920]
         @0x00007f2c19140f0a: a190
relocInfo@0x00007f2c19140f0a [type=10(poll) addr=0x00007f2c19141144 offset=400]
         @0x00007f2c19140f0c: b068
relocInfo@0x00007f2c19140f0c [type=11(poll_return) addr=0x00007f2c191411ac offset=104]
         @0x00007f2c19140f0e: 6427
relocInfo@0x00007f2c19140f0e [type=6(runtime_call) addr=0x00007f2c191411d3 offset=39 format=1] | [destination=0x00007f2c19116540]
         @0x00007f2c19140f10: f803239517b87f2c7005
relocInfo@0x00007f2c19140f18 [type=7(external_word) addr=0x00007f2c191411d8 offset=5 data={239517b87f2c}] | [target=0x00007f2c239517b8]
         @0x00007f2c19140f1a: 640e
relocInfo@0x00007f2c19140f1a [type=6(runtime_call) addr=0x00007f2c191411e6 offset=14 format=1] | [destination=0x00007f2c23116ff4]
         @0x00007f2c19140f1c: f80323ae90787f2c7006
relocInfo@0x00007f2c19140f24 [type=7(external_word) addr=0x00007f2c191411ec offset=6 data={23ae90787f2c}] | [target=0x00007f2c23ae9078]
         @0x00007f2c19140f26: 640e
relocInfo@0x00007f2c19140f26 [type=6(runtime_call) addr=0x00007f2c191411fa offset=14 format=1] | [destination=0x00007f2c23116ff4]
         @0x00007f2c19140f28: f80323ae90787f2c7006
relocInfo@0x00007f2c19140f30 [type=7(external_word) addr=0x00007f2c19141200 offset=6 data={23ae90787f2c}] | [target=0x00007f2c23ae9078]
         @0x00007f2c19140f32: 640e
relocInfo@0x00007f2c19140f32 [type=6(runtime_call) addr=0x00007f2c1914120e offset=14 format=1] | [destination=0x00007f2c23116ff4]
         @0x00007f2c19140f34: f80323ae90787f2c7006
relocInfo@0x00007f2c19140f3c [type=7(external_word) addr=0x00007f2c19141214 offset=6 data={23ae90787f2c}] | [target=0x00007f2c23ae9078]
         @0x00007f2c19140f3e: 640e
relocInfo@0x00007f2c19140f3e [type=6(runtime_call) addr=0x00007f2c19141222 offset=14 format=1] | [destination=0x00007f2c23116ff4]
         @0x00007f2c19140f40: f80323ae90787f2c7006
relocInfo@0x00007f2c19140f48 [type=7(external_word) addr=0x00007f2c19141228 offset=6 data={23ae90787f2c}] | [target=0x00007f2c23ae9078]
         @0x00007f2c19140f4a: 640e
relocInfo@0x00007f2c19140f4a [type=6(runtime_call) addr=0x00007f2c19141236 offset=14 format=1] | [destination=0x00007f2c23116ff4]
         @0x00007f2c19140f4c: f80323ae90787f2c7006
relocInfo@0x00007f2c19140f54 [type=7(external_word) addr=0x00007f2c1914123c offset=6 data={23ae90787f2c}] | [target=0x00007f2c23ae9078]
         @0x00007f2c19140f56: 640e
relocInfo@0x00007f2c19140f56 [type=6(runtime_call) addr=0x00007f2c1914124a offset=14 format=1] | [destination=0x00007f2c23116ff4]
         @0x00007f2c19140f58: f80323ae90787f2c7006
relocInfo@0x00007f2c19140f60 [type=7(external_word) addr=0x00007f2c19141250 offset=6 data={23ae90787f2c}] | [target=0x00007f2c23ae9078]
         @0x00007f2c19140f62: 640e
relocInfo@0x00007f2c19140f62 [type=6(runtime_call) addr=0x00007f2c1914125e offset=14 format=1] | [destination=0x00007f2c23116ff4]
         @0x00007f2c19140f64: f80323ae90787f2c7006
relocInfo@0x00007f2c19140f6c [type=7(external_word) addr=0x00007f2c19141264 offset=6 data={23ae90787f2c}] | [target=0x00007f2c23ae9078]
         @0x00007f2c19140f6e: 640e
relocInfo@0x00007f2c19140f6e [type=6(runtime_call) addr=0x00007f2c19141272 offset=14 format=1] | [destination=0x00007f2c23116ff4]
         @0x00007f2c19140f70: 6411
relocInfo@0x00007f2c19140f70 [type=6(runtime_call) addr=0x00007f2c19141283 offset=17 format=1] | [destination=0x00007f2c19116540]
         @0x00007f2c19140f72: f803239517b87f2c7005
relocInfo@0x00007f2c19140f7a [type=7(external_word) addr=0x00007f2c19141288 offset=5 data={239517b87f2c}] | [target=0x00007f2c239517b8]
         @0x00007f2c19140f7c: 640e
relocInfo@0x00007f2c19140f7c [type=6(runtime_call) addr=0x00007f2c19141296 offset=14 format=1] | [destination=0x00007f2c23116ff4]
         @0x00007f2c19140f7e: f0f08006
relocInfo@0x00007f2c19140f80 [type=8(internal_word) addr=0x00007f2c1914129c offset=6 data=240] | [target=0x00007f2c191411ac]
         @0x00007f2c19140f82: 6411
relocInfo@0x00007f2c19140f82 [type=6(runtime_call) addr=0x00007f2c191412ad offset=17 format=1] | [destination=0x00007f2c19117220]
         @0x00007f2c19140f84: 0013
relocInfo@0x00007f2c19140f84 [type=0(none) addr=0x00007f2c191412c0 offset=19]
         @0x00007f2c19140f86: 6400
relocInfo@0x00007f2c19140f86 [type=6(runtime_call) addr=0x00007f2c191412c0 offset=0 format=1] | [destination=0x00007f2c1905c6a0]
         @0x00007f2c19140f88: 640f
relocInfo@0x00007f2c19140f88 [type=6(runtime_call) addr=0x00007f2c191412cf offset=15 format=1] | [destination=0x00007f2c19116860]
         @0x00007f2c19140f8a: 0000
relocInfo@0x00007f2c19140f8a [type=0(none) addr=0x00007f2c191412cf offset=0]
         @0x00007f2c19140f8c: 0000
relocInfo@0x00007f2c19140f8c [type=0(none) addr=0x00007f2c191412cf offset=0]
         @0x00007f2c19140f8e: 0000
relocInfo@0x00007f2c19140f8e [type=0(none) addr=0x00007f2c191412cf offset=0]
         @0x00007f2c19140f90: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable (size = 3 entries, 28 bytes):
{
   < 0x00007f2c19140fcc, 0x00007f2c19141278 > < 0x00007f2c19140fd7, 0x00007f2c191411ba > < 0x00007f2c19140ff5, 0x00007f2c191411ba > 
}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x000000010110df10 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x000000010110df10}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
#0: 0x0000000000000000 NULL-oop
#1: 0x00007f2bc10116e8 {method} {0x00007f2bc10116e8} 'micro_scalar' '([I[I[I)V' in 'App'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SCALAR : [Time] 20 ms   [Res] 104960000000
VECTOR : [Time] 21 ms   [Res] 104960000000
VECTOR_MASKED : [Time] 111 ms   [Res] 104960000000
------------------------------------------------------------------------
App::micro_scalar([I[I[I)V
  interpreter_invocation_count:      671 
  invocation_counter:              10000 
  backedge_counter:                 5447 
  mdo size: 552 bytes

0 iconst_0
1 istore #4
3 fast_iload #4
5 aload_1
6 arraylength
7 if_icmpge 29
  0   bci: 7    BranchData          taken(668) displacement(56)
                                    not taken(684479)
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
  32  bci: 26   JumpData            taken(684479) displacement(-32)
29 return
------------------------------------------------------------------------
Total MDO size: 552 bytes
