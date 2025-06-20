CompileCommand: print add.mux
OpenJDK 64-Bit Server VM warning: printing of assembly code is enabled; turning on DebugNonSafepoints to gain additional output

============================= C2-compiled nmethod ==============================
----------------------------------- MetaData -----------------------------------
{method}
 - this oop:          0x00007f21d8b1f3e0
 - method holder:     'add'
 - constants:         0x00007f21d8b1f080 constant pool [52]/operands[5] {0x00007f21d8b1f080} for 'add' cache=0x00007f21d8b1f580
 - access:            0x81000009  public static 
 - name:              'mux'
 - signature:         '(I)I'
 - max stack:         3
 - max locals:        2
 - size of params:    1
 - method size:       13
 - vtable index:      -2
 - i2i entry:         0x00007f21e1016440
 - adapters:          AHE@0x00007f21e433d508: 0xa0000000 i2c: 0x00007f21e104fd60 c2i: 0x00007f21e104fea5 c2iUV: 0x00007f21e104fe6c
 - compiled entry     0x00007f21e104fea5
 - code size:         21
 - code start:        0x00007f21d8b1f3c0
 - code end (excl):   0x00007f21d8b1f3d5
 - method data:       0x00007f21d8b1f9c8
 - checked ex length: 0
 - linenumber start:  0x00007f21d8b1f3d5
 - localvar length:   0

--------------------------------- OptoAssembly ---------------------------------
#
#  int ( int )
#
#r018 rsi   : parm 0: int
# -- Old rsp -- Framesize: 32 --
#r583 rsp+28: in_preserve
#r582 rsp+24: return address
#r581 rsp+20: in_preserve
#r580 rsp+16: saved fp register
#r579 rsp+12: pad2, stack alignment
#r578 rsp+ 8: pad2, stack alignment
#r577 rsp+ 4: Fixed slot 1
#r576 rsp+ 0: Fixed slot 0
#
000     N1: #	out( B1 ) <- in( B1 )  Freq: 1

000     B1: #	out( N1 ) <- BLOCK HEAD IS JUNK  Freq: 1
000     # stack bang (96 bytes)
	pushq   rbp	# Save rbp
	subq    rsp, #16	# Create frame

00c     movl    R11, #20	# int
012     movl    RAX, #10	# int
017     cmpl    RSI, #1
01a     cmovlne RAX, R11	# signed, int
01e     addl    RAX, #100	# int
021     addq    rsp, 16	# Destroy frame
	popq    rbp
	movq    rscratch1, poll_offset[r15_thread] #polling_page_address
	testl   rax, [rscratch1]	# Safepoint: poll for GC

030     ret

--------------------------------------------------------------------------------
----------------------------------- Assembly -----------------------------------

Compiled method (c2)    1310  100             add::mux (21 bytes)
 total in heap  [0x00007f21e1190210,0x00007f21e1190460] = 592
 relocation     [0x00007f21e1190380,0x00007f21e1190388] = 8
 main code      [0x00007f21e11903a0,0x00007f21e11903e0] = 64
 stub code      [0x00007f21e11903e0,0x00007f21e11903f8] = 24
 oops           [0x00007f21e11903f8,0x00007f21e1190400] = 8
 metadata       [0x00007f21e1190400,0x00007f21e1190408] = 8
 scopes data    [0x00007f21e1190408,0x00007f21e1190418] = 16
 scopes pcs     [0x00007f21e1190418,0x00007f21e1190458] = 64
 dependencies   [0x00007f21e1190458,0x00007f21e1190460] = 8

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007f21d8b1f3e0} 'mux' '(I)I' in 'add'
  # parm0:    rsi       = int
  #           [sp+0x20]  (sp of caller)
 ;; N1: #	out( B1 ) <- in( B1 )  Freq: 1
 ;; B1: #	out( N1 ) <- BLOCK HEAD IS JUNK  Freq: 1
  0x00007f21e11903a0:   mov    %eax,-0x16000(%rsp)
  0x00007f21e11903a7:   push   %rbp
  0x00007f21e11903a8:   sub    $0x10,%rsp                   ;*synchronization entry
                                                            ; - add::mux@-1 (line 5)
  0x00007f21e11903ac:   mov    $0x14,%r11d
  0x00007f21e11903b2:   mov    $0xa,%eax
  0x00007f21e11903b7:   cmp    $0x1,%esi
  0x00007f21e11903ba:   cmovne %r11d,%eax
  0x00007f21e11903be:   add    $0x64,%eax                   ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - add::mux@19 (line 10)
  0x00007f21e11903c1:   add    $0x10,%rsp
  0x00007f21e11903c5:   pop    %rbp
  0x00007f21e11903c6:   mov    0x128(%r15),%r10
  0x00007f21e11903cd:   test   %eax,(%r10)                  ;   {poll_return}
  0x00007f21e11903d0:   retq   
  0x00007f21e11903d1:   hlt    
  0x00007f21e11903d2:   hlt    
  0x00007f21e11903d3:   hlt    
  0x00007f21e11903d4:   hlt    
  0x00007f21e11903d5:   hlt    
  0x00007f21e11903d6:   hlt    
  0x00007f21e11903d7:   hlt    
  0x00007f21e11903d8:   hlt    
  0x00007f21e11903d9:   hlt    
  0x00007f21e11903da:   hlt    
  0x00007f21e11903db:   hlt    
  0x00007f21e11903dc:   hlt    
  0x00007f21e11903dd:   hlt    
  0x00007f21e11903de:   hlt    
  0x00007f21e11903df:   hlt    
[Exception Handler]
  0x00007f21e11903e0:   jmpq   0x00007f21e11341a0           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f21e11903e5:   callq  0x00007f21e11903ea
  0x00007f21e11903ea:   subq   $0x5,(%rsp)
  0x00007f21e11903ef:   jmpq   0x00007f21e1111ee0           ;   {runtime_call DeoptimizationBlob}
  0x00007f21e11903f4:   hlt    
  0x00007f21e11903f5:   hlt    
  0x00007f21e11903f6:   hlt    
  0x00007f21e11903f7:   hlt    
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oops:
  0x00007f21e11903f8:   0x0000000716ff12b8 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x0000000716ff12b8}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Metadata:
  0x00007f21e1190400:   0x00007f21d8b1f3e0 {method} {0x00007f21d8b1f3e0} 'mux' '(I)I' in 'add'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc-bytecode offsets:
PcDesc(pc=0x00007f21e119039f offset=ffffffff bits=0):
PcDesc(pc=0x00007f21e11903ac offset=c bits=0):   add::mux@-1 (line 5)
PcDesc(pc=0x00007f21e11903c1 offset=21 bits=0):   add::mux@19 (line 10)
PcDesc(pc=0x00007f21e11903f9 offset=59 bits=0):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oop maps:ImmutableOopMapSet contains 0 OopMaps

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scopes:
ScopeDesc(pc=0x00007f21e11903ac offset=c):
   add::mux@-1 (line 5)
ScopeDesc(pc=0x00007f21e11903c1 offset=21):
   add::mux@19 (line 10)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
relocations:
         @0x00007f21e1190380: b02d
relocInfo@0x00007f21e1190380 [type=11(poll_return) addr=0x00007f21e11903cd offset=45]
         @0x00007f21e1190382: 0013
relocInfo@0x00007f21e1190382 [type=0(none) addr=0x00007f21e11903e0 offset=19]
         @0x00007f21e1190384: 6400
relocInfo@0x00007f21e1190384 [type=6(runtime_call) addr=0x00007f21e11903e0 offset=0 format=1] | [destination=0x00007f21e11341a0]
         @0x00007f21e1190386: 640f
relocInfo@0x00007f21e1190386 [type=6(runtime_call) addr=0x00007f21e11903ef offset=15 format=1] | [destination=0x00007f21e1111ee0]
         @0x00007f21e1190388: 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dependencies:
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExceptionHandlerTable (size = 0 bytes)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ImplicitExceptionTable is empty
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded oops:
#0: 0x0000000000000000 NULL-oop
#1: 0x0000000716ff12b8 a 'jdk/internal/loader/ClassLoaders$AppClassLoader'{0x0000000716ff12b8}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Recorded metadata:
#0: 0x0000000000000000 NULL-oop
#1: 0x00007f21d8b1f3e0 {method} {0x00007f21d8b1f3e0} 'mux' '(I)I' in 'add'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Res = 115000000
------------------------------------------------------------------------
static add::mux(I)I
  interpreter_invocation_count:  1000000 
  invocation_counter:               5198 
  backedge_counter:                    1 
  mdo size: 520 bytes

0 iconst_0
1 istore_1
2 iload_0
3 iconst_1
4 if_icmpne 13
  0   bci: 4    BranchData          taken(498350) displacement(56)
                                    not taken(498351)
7 bipush 10
9 istore_1
10 goto 16
  32  bci: 10   JumpData            taken(498351) displacement(24)
13 bipush 20
15 istore_1
16 iload_1
17 bipush 100
19 iadd
20 ireturn
------------------------------------------------------------------------
Total MDO size: 520 bytes
