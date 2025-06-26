CompileCommand: print FloatColumnFilter.VectorFloatColumnFilterMS bool print = true
WARNING: Using incubator modules: jdk.incubator.vector
Size = 100000
Selectivity = 0.5
Algo = Vector
Debug = false

============================= C2-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2)     206  685 %     4       FloatColumnFilter::VectorFloatColumnFilterMS @ 5 (94 bytes)
 total in heap  [0x00007fdb28c5d110,0x00007fdb28c5d970] = 2144
 relocation     [0x00007fdb28c5d260,0x00007fdb28c5d2a0] = 64
 main code      [0x00007fdb28c5d2a0,0x00007fdb28c5d648] = 936
 stub code      [0x00007fdb28c5d648,0x00007fdb28c5d660] = 24
 oops           [0x00007fdb28c5d660,0x00007fdb28c5d680] = 32
 metadata       [0x00007fdb28c5d680,0x00007fdb28c5d7a0] = 288
 scopes data    [0x00007fdb28c5d7a0,0x00007fdb28c5d888] = 232
 scopes pcs     [0x00007fdb28c5d888,0x00007fdb28c5d908] = 128
 dependencies   [0x00007fdb28c5d908,0x00007fdb28c5d948] = 64
 nul chk table  [0x00007fdb28c5d948,0x00007fdb28c5d970] = 40

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007fdad8401d50} 'VectorFloatColumnFilterMS' '(Ljava/lang/foreign/MemorySegment;Ljava/lang/foreign/MemorySegment;F)I' in 'FloatColumnFilter'
  0x00007fdb28c5d2a0:   callq  0x00007fdb3e87bf80           ;   {runtime_call os::breakpoint()}
  0x00007fdb28c5d2a5:   data16 data16 nopw 0x0(%rax,%rax,1)
  0x00007fdb28c5d2b0:   mov    %eax,-0x14000(%rsp)
  0x00007fdb28c5d2b7:   push   %rbp
  0x00007fdb28c5d2b8:   sub    $0x90,%rsp
  0x00007fdb28c5d2bf:   nop
  0x00007fdb28c5d2c0:   cmpl   $0x1,0x20(%r15)
  0x00007fdb28c5d2c8:   jne    0x00007fdb28c5d63e
  0x00007fdb28c5d2ce:   mov    0x38(%rsi),%rbp
  0x00007fdb28c5d2d2:   mov    0x30(%rsi),%r13
  0x00007fdb28c5d2d6:   mov    0x18(%rsi),%r14d
  0x00007fdb28c5d2da:   vmovss 0x28(%rsi),%xmm0
  0x00007fdb28c5d2df:   vmovss %xmm0,(%rsp)
  0x00007fdb28c5d2e4:   mov    0x20(%rsi),%ebx
  0x00007fdb28c5d2e7:   mov    %rsi,%rdi
  0x00007fdb28c5d2ea:   vzeroupper 
  0x00007fdb28c5d2ed:   movabs $0x7fdb3e937fd0,%r10
  0x00007fdb28c5d2f7:   callq  *%r10
  0x00007fdb28c5d2fa:   nopl   0x0(%rax,%rax,1)             ;   {other}
  0x00007fdb28c5d302:   movabs $0x80104e9c0,%rax            ;   {metadata('java/lang/foreign/MemorySegment')}
  0x00007fdb28c5d30c:   test   %rbp,%rbp
  0x00007fdb28c5d30f:   je     0x00007fdb28c5d5c0
  0x00007fdb28c5d315:   mov    0x8(%rbp),%r11d
  0x00007fdb28c5d319:   movabs $0x800000000,%rsi
  0x00007fdb28c5d323:   add    %r11,%rsi
  0x00007fdb28c5d326:   mov    0x20(%rsi),%r10
  0x00007fdb28c5d32a:   cmp    %rax,%r10
  0x00007fdb28c5d32d:   jne    0x00007fdb28c5d527
  0x00007fdb28c5d333:   mov    %rbp,%r8
  0x00007fdb28c5d336:   test   %r13,%r13
  0x00007fdb28c5d339:   je     0x00007fdb28c5d5c8
  0x00007fdb28c5d33f:   mov    0x8(%r13),%r11d
  0x00007fdb28c5d343:   movabs $0x800000000,%rsi
  0x00007fdb28c5d34d:   add    %r11,%rsi
  0x00007fdb28c5d350:   mov    0x20(%rsi),%r10
  0x00007fdb28c5d354:   cmp    %rax,%r10
  0x00007fdb28c5d357:   jne    0x00007fdb28c5d56c
  0x00007fdb28c5d35d:   data16 xchg %ax,%ax
  0x00007fdb28c5d360:   mov    0x8(%r8),%r11d               ; implicit exception: dispatches to 0x00007fdb28c5d5d0
  0x00007fdb28c5d364:   cmp    $0x104f970,%r11d             ;   {metadata('jdk/internal/foreign/NativeMemorySegmentImpl')}
  0x00007fdb28c5d36b:   jne    0x00007fdb28c5d5d0
  0x00007fdb28c5d371:   mov    %r8,%rax
  0x00007fdb28c5d374:   mov    0x10(%rax),%rdi
  0x00007fdb28c5d378:   mov    %rdi,%rcx
  0x00007fdb28c5d37b:   add    $0xffffffffffffffc1,%rcx
  0x00007fdb28c5d37f:   nop
  0x00007fdb28c5d380:   test   %rcx,%rcx
  0x00007fdb28c5d383:   jl     0x00007fdb28c5d5fc
  0x00007fdb28c5d389:   mov    0x18(%rax),%r10d
  0x00007fdb28c5d38d:   mov    0x8(%r12,%r10,8),%r11d       ; implicit exception: dispatches to 0x00007fdb28c5d5fc
  0x00007fdb28c5d392:   data16 nopw 0x0(%rax,%rax,1)
  0x00007fdb28c5d39c:   data16 data16 xchg %ax,%ax
  0x00007fdb28c5d3a0:   cmp    $0x104da78,%r11d             ;   {metadata('jdk/internal/foreign/MemorySessionImpl$GlobalSessionImpl')}
  0x00007fdb28c5d3a7:   jne    0x00007fdb28c5d5fc
  0x00007fdb28c5d3ad:   shl    $0x3,%r10
  0x00007fdb28c5d3b1:   cmp    0x18(%r10),%r12d
  0x00007fdb28c5d3b5:   jne    0x00007fdb28c5d5fc
  0x00007fdb28c5d3bb:   mov    0xc(%r10),%r10d
  0x00007fdb28c5d3bf:   nop
  0x00007fdb28c5d3c0:   test   %r10d,%r10d
  0x00007fdb28c5d3c3:   jl     0x00007fdb28c5d5fc
  0x00007fdb28c5d3c9:   mov    0x8(%r13),%r10d              ; implicit exception: dispatches to 0x00007fdb28c5d5fc
  0x00007fdb28c5d3cd:   cmp    $0x104f970,%r10d             ;   {metadata('jdk/internal/foreign/NativeMemorySegmentImpl')}
  0x00007fdb28c5d3d4:   jne    0x00007fdb28c5d5fc
  0x00007fdb28c5d3da:   mov    %r13,%r9
  0x00007fdb28c5d3dd:   movzbl 0xc(%r9),%r10d
  0x00007fdb28c5d3e2:   test   %r10d,%r10d
  0x00007fdb28c5d3e5:   jne    0x00007fdb28c5d5fc
  0x00007fdb28c5d3eb:   mov    $0xffffffffffffffc1,%rdx
  0x00007fdb28c5d3f2:   add    0x10(%r9),%rdx
  0x00007fdb28c5d3f6:   test   %rdx,%rdx
  0x00007fdb28c5d3f9:   jl     0x00007fdb28c5d5fc
  0x00007fdb28c5d3ff:   mov    0x18(%r9),%r10d
  0x00007fdb28c5d403:   mov    0x8(%r12,%r10,8),%r11d       ; implicit exception: dispatches to 0x00007fdb28c5d5fc
  0x00007fdb28c5d408:   cmp    $0x104da78,%r11d             ;   {metadata('jdk/internal/foreign/MemorySessionImpl$GlobalSessionImpl')}
  0x00007fdb28c5d40f:   jne    0x00007fdb28c5d5fc
  0x00007fdb28c5d415:   shl    $0x3,%r10
  0x00007fdb28c5d419:   nopl   0x0(%rax)
  0x00007fdb28c5d420:   cmp    0x18(%r10),%r12d
  0x00007fdb28c5d424:   jne    0x00007fdb28c5d5fc
  0x00007fdb28c5d42a:   mov    0xc(%r10),%r10d
  0x00007fdb28c5d42e:   test   %r10d,%r10d
  0x00007fdb28c5d431:   jl     0x00007fdb28c5d5fc
  0x00007fdb28c5d437:   mov    0x20(%r9),%r10
  0x00007fdb28c5d43b:   mov    0x20(%rax),%r11
  0x00007fdb28c5d43f:   mov    %r11,%r8
  0x00007fdb28c5d442:   vbroadcastss (%rsp),%zmm0
  0x00007fdb28c5d449:   mov    %r10,%rsi
  0x00007fdb28c5d44c:   jmp    0x00007fdb28c5d46f
  0x00007fdb28c5d44e:   xchg   %ax,%ax
  0x00007fdb28c5d450:   vmovd  %xmm1,%ebx
  0x00007fdb28c5d454:   add    %r10d,%ebx
  0x00007fdb28c5d457:   add    $0x40,%r14d
  0x00007fdb28c5d45b:   movslq %r11d,%r10
  0x00007fdb28c5d45e:   vmovdqu32 %zmm2,(%rsi,%r10,1)
  0x00007fdb28c5d465:   mov    0x380(%r15),%r10             ; ImmutableOopMap {r9=Oop rax=Oop r13=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) FloatColumnFilter::VectorFloatColumnFilterMS@89 (line 40)
  0x00007fdb28c5d46c:   test   %eax,(%r10)                  ;   {poll}
  0x00007fdb28c5d46f:   movslq %r14d,%r10
  0x00007fdb28c5d472:   cmp    %rdi,%r10
  0x00007fdb28c5d475:   jge    0x00007fdb28c5d50c
  0x00007fdb28c5d47b:   nopl   0x0(%rax,%rax,1)
  0x00007fdb28c5d480:   cmp    %rcx,%r10
  0x00007fdb28c5d483:   jae    0x00007fdb28c5d58d
  0x00007fdb28c5d489:   mov    %r14d,%r10d
  0x00007fdb28c5d48c:   mov    %ebx,%r11d
  0x00007fdb28c5d48f:   vmovd  %ebx,%xmm1
  0x00007fdb28c5d493:   shl    $0x2,%r11d
  0x00007fdb28c5d497:   movslq %r10d,%r10
  0x00007fdb28c5d49a:   vmovdqu32 (%r8,%r10,1),%zmm2
  0x00007fdb28c5d4a1:   vcmpge_oqps %zmm0,%zmm2,%k7
  0x00007fdb28c5d4a8:   vcompressps %zmm2,%zmm2{%k7}{z}
  0x00007fdb28c5d4ae:   movslq %r11d,%rbx
  0x00007fdb28c5d4b1:   kmovq  %k7,%rbp
  0x00007fdb28c5d4b6:   popcnt %rbp,%r10
  0x00007fdb28c5d4bb:   nopl   0x0(%rax,%rax,1)
  0x00007fdb28c5d4c0:   cmp    %rdx,%rbx
  0x00007fdb28c5d4c3:   jb     0x00007fdb28c5d450
  0x00007fdb28c5d4c5:   mov    $0xffffffe4,%esi
  0x00007fdb28c5d4ca:   mov    %rax,%rbp
  0x00007fdb28c5d4cd:   vmovss %xmm1,0x4(%rsp)
  0x00007fdb28c5d4d3:   mov    %r14d,0x8(%rsp)
  0x00007fdb28c5d4d8:   mov    %r10d,0xc(%rsp)
  0x00007fdb28c5d4dd:   mov    %r9,0x10(%rsp)
  0x00007fdb28c5d4e2:   mov    %rbx,0x18(%rsp)
  0x00007fdb28c5d4e7:   mov    %rdx,0x20(%rsp)
  0x00007fdb28c5d4ec:   vmovdqu64 %zmm2,0x40(%rsp)
  0x00007fdb28c5d4f4:   mov    %r13,0x28(%rsp)
  0x00007fdb28c5d4f9:   data16 xchg %ax,%ax
  0x00007fdb28c5d4fc:   vzeroupper 
  0x00007fdb28c5d4ff:   callq  0x00007fdb283d4600           ; ImmutableOopMap {rbp=Oop [16]=Oop [40]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 461)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@45 (line 67)
                                                            ; - jdk.incubator.vector.FloatVector::intoMemorySegment@32 (line 3232)
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@66 (line 44)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fdb28c5d504:   nopl   0x10003f4(%rax,%rax,1)       ;   {other}
  0x00007fdb28c5d50c:   mov    %ebx,%eax
  0x00007fdb28c5d50e:   vzeroupper 
  0x00007fdb28c5d511:   add    $0x90,%rsp
  0x00007fdb28c5d518:   pop    %rbp
  0x00007fdb28c5d519:   cmp    0x378(%r15),%rsp             ;   {poll_return}
  0x00007fdb28c5d520:   ja     0x00007fdb28c5d628
  0x00007fdb28c5d526:   retq   
  0x00007fdb28c5d527:   mov    0x28(%rsi),%rdi
  0x00007fdb28c5d52b:   mov    (%rdi),%ecx
  0x00007fdb28c5d52d:   add    $0x8,%rdi
  0x00007fdb28c5d531:   test   %rax,%rax
  0x00007fdb28c5d534:   repnz scas %es:(%rdi),%rax
  0x00007fdb28c5d537:   jne    0x00007fdb28c5d541
  0x00007fdb28c5d53d:   mov    %rax,0x20(%rsi)
  0x00007fdb28c5d541:   je     0x00007fdb28c5d333
  0x00007fdb28c5d547:   mov    $0xffffff8d,%esi
  0x00007fdb28c5d54c:   mov    %ebx,0x4(%rsp)
  0x00007fdb28c5d550:   mov    %r14d,0x8(%rsp)
  0x00007fdb28c5d555:   mov    %r13,0x10(%rsp)
  0x00007fdb28c5d55a:   xchg   %ax,%ax
  0x00007fdb28c5d55c:   vzeroupper 
  0x00007fdb28c5d55f:   callq  0x00007fdb283d4600           ; ImmutableOopMap {rbp=Oop [16]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@5 (line 40)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fdb28c5d564:   nopl   0x2000454(%rax,%rax,1)       ;   {other}
  0x00007fdb28c5d56c:   mov    0x28(%rsi),%rdi
  0x00007fdb28c5d570:   mov    (%rdi),%ecx
  0x00007fdb28c5d572:   add    $0x8,%rdi
  0x00007fdb28c5d576:   test   %rax,%rax
  0x00007fdb28c5d579:   repnz scas %es:(%rdi),%rax
  0x00007fdb28c5d57c:   jne    0x00007fdb28c5d586
  0x00007fdb28c5d582:   mov    %rax,0x20(%rsi)
  0x00007fdb28c5d586:   jne    0x00007fdb28c5d547
  0x00007fdb28c5d588:   jmpq   0x00007fdb28c5d35d
  0x00007fdb28c5d58d:   mov    $0xffffffe4,%esi
  0x00007fdb28c5d592:   mov    %ebx,0x4(%rsp)
  0x00007fdb28c5d596:   mov    %r14d,0x8(%rsp)
  0x00007fdb28c5d59b:   mov    %rax,0x10(%rsp)
  0x00007fdb28c5d5a0:   mov    %r10,0x18(%rsp)
  0x00007fdb28c5d5a5:   mov    %rcx,0x20(%rsp)
  0x00007fdb28c5d5aa:   mov    %r13,0x28(%rsp)
  0x00007fdb28c5d5af:   nop
  0x00007fdb28c5d5b0:   vzeroupper 
  0x00007fdb28c5d5b3:   callq  0x00007fdb283d4600           ; ImmutableOopMap {[16]=Oop [40]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 461)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@45 (line 67)
                                                            ; - jdk.incubator.vector.FloatVector::fromMemorySegment@14 (line 2984)
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@28 (line 41)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fdb28c5d5b8:   nopl   0x30004a8(%rax,%rax,1)       ;   {other}
  0x00007fdb28c5d5c0:   xor    %r8d,%r8d
  0x00007fdb28c5d5c3:   jmpq   0x00007fdb28c5d336
  0x00007fdb28c5d5c8:   xor    %r13d,%r13d
  0x00007fdb28c5d5cb:   jmpq   0x00007fdb28c5d35d
  0x00007fdb28c5d5d0:   mov    $0xffffff76,%esi
  0x00007fdb28c5d5d5:   mov    (%rsp),%ebp
  0x00007fdb28c5d5d8:   mov    %ebx,(%rsp)
  0x00007fdb28c5d5db:   mov    %r14d,0x4(%rsp)
  0x00007fdb28c5d5e0:   mov    %r8,0x8(%rsp)
  0x00007fdb28c5d5e5:   mov    %r13,0x10(%rsp)
  0x00007fdb28c5d5ea:   xchg   %ax,%ax
  0x00007fdb28c5d5ec:   vzeroupper 
  0x00007fdb28c5d5ef:   callq  0x00007fdb283d4600           ; ImmutableOopMap {[8]=Oop [16]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@5 (line 40)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fdb28c5d5f4:   nopl   0x40004e4(%rax,%rax,1)       ;   {other}
  0x00007fdb28c5d5fc:   mov    $0xffffffbe,%esi
  0x00007fdb28c5d601:   mov    (%rsp),%ebp
  0x00007fdb28c5d604:   mov    %ebx,(%rsp)
  0x00007fdb28c5d607:   mov    %r14d,0x4(%rsp)
  0x00007fdb28c5d60c:   mov    %r8,0x8(%rsp)
  0x00007fdb28c5d611:   mov    %r13,0x10(%rsp)
  0x00007fdb28c5d616:   xchg   %ax,%ax
  0x00007fdb28c5d618:   vzeroupper 
  0x00007fdb28c5d61b:   callq  0x00007fdb283d4600           ; ImmutableOopMap {[8]=Oop [16]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@5 (line 40)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fdb28c5d620:   nopl   0x5000510(%rax,%rax,1)       ;   {other}
  0x00007fdb28c5d628:   movabs $0x7fdb28c5d519,%r10         ;   {internal_word}
  0x00007fdb28c5d632:   mov    %r10,0x390(%r15)
  0x00007fdb28c5d639:   jmpq   0x00007fdb28423780           ;   {runtime_call SafepointBlob}
  0x00007fdb28c5d63e:   callq  Stub::nmethod_entry_barrier  ;   {runtime_call StubRoutines (2)}
  0x00007fdb28c5d643:   jmpq   0x00007fdb28c5d2ce
[Exception Handler]
  0x00007fdb28c5d648:   jmpq   0x00007fdb284e0c80           ;   {no_reloc}
[Deopt Handler Code]
  0x00007fdb28c5d64d:   callq  0x00007fdb28c5d652
  0x00007fdb28c5d652:   subq   $0x5,(%rsp)
  0x00007fdb28c5d657:   jmpq   0x00007fdb28424c20           ;   {runtime_call DeoptimizationBlob}
  0x00007fdb28c5d65c:   hlt    
  0x00007fdb28c5d65d:   hlt    
  0x00007fdb28c5d65e:   hlt    
  0x00007fdb28c5d65f:   hlt    
--------------------------------------------------------------------------------
[/Disassembly]

============================= C2-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2)     220  686       4       FloatColumnFilter::VectorFloatColumnFilterMS (94 bytes)
 total in heap  [0x00007fdb28c5d990,0x00007fdb28c5e158] = 1992
 relocation     [0x00007fdb28c5dae0,0x00007fdb28c5db18] = 56
 main code      [0x00007fdb28c5db20,0x00007fdb28c5de00] = 736
 stub code      [0x00007fdb28c5de00,0x00007fdb28c5de18] = 24
 oops           [0x00007fdb28c5de18,0x00007fdb28c5de38] = 32
 metadata       [0x00007fdb28c5de38,0x00007fdb28c5df58] = 288
 scopes data    [0x00007fdb28c5df58,0x00007fdb28c5e070] = 280
 scopes pcs     [0x00007fdb28c5e070,0x00007fdb28c5e0f0] = 128
 dependencies   [0x00007fdb28c5e0f0,0x00007fdb28c5e130] = 64
 nul chk table  [0x00007fdb28c5e130,0x00007fdb28c5e158] = 40

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007fdad8401d50} 'VectorFloatColumnFilterMS' '(Ljava/lang/foreign/MemorySegment;Ljava/lang/foreign/MemorySegment;F)I' in 'FloatColumnFilter'
  # parm0:    rsi:rsi   = 'java/lang/foreign/MemorySegment'
  # parm1:    rdx:rdx   = 'java/lang/foreign/MemorySegment'
  # parm2:    xmm0      = float
  #           [sp+0xa0]  (sp of caller)
  0x00007fdb28c5db20:   mov    %eax,-0x14000(%rsp)
  0x00007fdb28c5db27:   push   %rbp
  0x00007fdb28c5db28:   sub    $0x90,%rsp
  0x00007fdb28c5db2f:   nop
  0x00007fdb28c5db30:   cmpl   $0x1,0x20(%r15)
  0x00007fdb28c5db38:   jne    0x00007fdb28c5ddf2
  0x00007fdb28c5db3e:   mov    %rsi,%r11
  0x00007fdb28c5db41:   mov    0x8(%rsi),%r10d              ; implicit exception: dispatches to 0x00007fdb28c5ddc7
  0x00007fdb28c5db45:   cmp    $0x104f970,%r10d             ;   {metadata('jdk/internal/foreign/NativeMemorySegmentImpl')}
  0x00007fdb28c5db4c:   jne    0x00007fdb28c5dd4f
  0x00007fdb28c5db52:   mov    %rsi,%r13
  0x00007fdb28c5db55:   mov    0x10(%r13),%r11
  0x00007fdb28c5db59:   xor    %ecx,%ecx
  0x00007fdb28c5db5b:   nopl   0x0(%rax,%rax,1)
  0x00007fdb28c5db60:   test   %r11,%r11
  0x00007fdb28c5db63:   jle    0x00007fdb28c5dd48
  0x00007fdb28c5db69:   mov    %r11,%r8
  0x00007fdb28c5db6c:   add    $0xffffffffffffffc1,%r8
  0x00007fdb28c5db70:   test   %r8,%r8
  0x00007fdb28c5db73:   jl     0x00007fdb28c5dd74
  0x00007fdb28c5db79:   mov    0x18(%r13),%r10d
  0x00007fdb28c5db7d:   data16 xchg %ax,%ax
  0x00007fdb28c5db80:   mov    0x8(%r12,%r10,8),%ebx        ; implicit exception: dispatches to 0x00007fdb28c5dd79
  0x00007fdb28c5db85:   cmp    $0x104da78,%ebx              ;   {metadata('jdk/internal/foreign/MemorySessionImpl$GlobalSessionImpl')}
  0x00007fdb28c5db8b:   jne    0x00007fdb28c5ddb8
  0x00007fdb28c5db91:   shl    $0x3,%r10
  0x00007fdb28c5db95:   cmp    0x18(%r10),%r12d
  0x00007fdb28c5db99:   jne    0x00007fdb28c5ddbd
  0x00007fdb28c5db9f:   mov    0xc(%r10),%r9d
  0x00007fdb28c5dba3:   test   %r9d,%r9d
  0x00007fdb28c5dba6:   jl     0x00007fdb28c5ddc2
  0x00007fdb28c5dbac:   mov    %rdx,%rdi
  0x00007fdb28c5dbaf:   mov    0x8(%rdx),%r9d               ; implicit exception: dispatches to 0x00007fdb28c5dd7c
  0x00007fdb28c5dbb3:   nopw   0x0(%rax,%rax,1)
  0x00007fdb28c5dbbc:   data16 data16 xchg %ax,%ax
  0x00007fdb28c5dbc0:   cmp    $0x104f970,%r9d              ;   {metadata('jdk/internal/foreign/NativeMemorySegmentImpl')}
  0x00007fdb28c5dbc7:   jne    0x00007fdb28c5dd7c
  0x00007fdb28c5dbcd:   mov    %rdx,%r9
  0x00007fdb28c5dbd0:   movzbl 0xc(%r9),%ebx
  0x00007fdb28c5dbd5:   test   %ebx,%ebx
  0x00007fdb28c5dbd7:   jne    0x00007fdb28c5dd7c
  0x00007fdb28c5dbdd:   mov    $0xffffffffffffffc1,%rbx
  0x00007fdb28c5dbe4:   add    0x10(%r9),%rbx
  0x00007fdb28c5dbe8:   test   %rbx,%rbx
  0x00007fdb28c5dbeb:   jl     0x00007fdb28c5dd7c
  0x00007fdb28c5dbf1:   mov    0x18(%r9),%r10d
  0x00007fdb28c5dbf5:   mov    0x8(%r12,%r10,8),%eax        ; implicit exception: dispatches to 0x00007fdb28c5dd7c
  0x00007fdb28c5dbfa:   nopw   0x0(%rax,%rax,1)
  0x00007fdb28c5dc00:   cmp    $0x104da78,%eax              ;   {metadata('jdk/internal/foreign/MemorySessionImpl$GlobalSessionImpl')}
  0x00007fdb28c5dc06:   jne    0x00007fdb28c5dd7c
  0x00007fdb28c5dc0c:   shl    $0x3,%r10
  0x00007fdb28c5dc10:   cmp    0x18(%r10),%r12d
  0x00007fdb28c5dc14:   jne    0x00007fdb28c5dd7c
  0x00007fdb28c5dc1a:   mov    0xc(%r10),%r10d
  0x00007fdb28c5dc1e:   xchg   %ax,%ax
  0x00007fdb28c5dc20:   test   %r10d,%r10d
  0x00007fdb28c5dc23:   jl     0x00007fdb28c5dd7c
  0x00007fdb28c5dc29:   mov    0x20(%r9),%r10
  0x00007fdb28c5dc2d:   mov    0x20(%r13),%rdx
  0x00007fdb28c5dc31:   mov    %r10,%rbp
  0x00007fdb28c5dc34:   vbroadcastss %xmm0,%zmm2
  0x00007fdb28c5dc3a:   xor    %eax,%eax
  0x00007fdb28c5dc3c:   jmp    0x00007fdb28c5dc45
  0x00007fdb28c5dc3e:   xchg   %ax,%ax
  0x00007fdb28c5dc40:   vmovq  %xmm1,%rdi
  0x00007fdb28c5dc45:   movslq %ecx,%r10
  0x00007fdb28c5dc48:   cmp    %r8,%r10
  0x00007fdb28c5dc4b:   jae    0x00007fdb28c5dcc7
  0x00007fdb28c5dc51:   vmovq  %rdi,%xmm1
  0x00007fdb28c5dc56:   mov    %ecx,%r10d
  0x00007fdb28c5dc59:   mov    %eax,%esi
  0x00007fdb28c5dc5b:   shl    $0x2,%esi
  0x00007fdb28c5dc5e:   movslq %r10d,%r10
  0x00007fdb28c5dc61:   vmovdqu32 (%rdx,%r10,1),%zmm3
  0x00007fdb28c5dc68:   vcmpge_oqps %zmm2,%zmm3,%k7
  0x00007fdb28c5dc6f:   vcompressps %zmm3,%zmm3{%k7}{z}
  0x00007fdb28c5dc75:   movslq %esi,%rdi
  0x00007fdb28c5dc78:   kmovq  %k7,%r14
  0x00007fdb28c5dc7d:   popcnt %r14,%r10
  0x00007fdb28c5dc82:   cmp    %rbx,%rdi
  0x00007fdb28c5dc85:   jae    0x00007fdb28c5dd00
  0x00007fdb28c5dc8b:   add    %r10d,%eax
  0x00007fdb28c5dc8e:   add    $0x40,%ecx
  0x00007fdb28c5dc91:   movslq %esi,%r10
  0x00007fdb28c5dc94:   vmovdqu32 %zmm3,0x0(%rbp,%r10,1)
  0x00007fdb28c5dc9c:   mov    0x380(%r15),%r10             ; ImmutableOopMap {r9=Oop r13=Oop xmm1=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) FloatColumnFilter::VectorFloatColumnFilterMS@89 (line 40)
  0x00007fdb28c5dca3:   test   %eax,(%r10)                  ;   {poll}
  0x00007fdb28c5dca6:   movslq %ecx,%r10
  0x00007fdb28c5dca9:   cmp    %r11,%r10
  0x00007fdb28c5dcac:   jl     0x00007fdb28c5dc40
  0x00007fdb28c5dcae:   vzeroupper 
  0x00007fdb28c5dcb1:   add    $0x90,%rsp
  0x00007fdb28c5dcb8:   pop    %rbp
  0x00007fdb28c5dcb9:   cmp    0x378(%r15),%rsp             ;   {poll_return}
  0x00007fdb28c5dcc0:   ja     0x00007fdb28c5dddc
  0x00007fdb28c5dcc6:   retq   
  0x00007fdb28c5dcc7:   mov    $0xffffffe4,%esi
  0x00007fdb28c5dccc:   vmovss %xmm0,(%rsp)
  0x00007fdb28c5dcd1:   mov    %eax,0x4(%rsp)
  0x00007fdb28c5dcd5:   mov    %ecx,0x8(%rsp)
  0x00007fdb28c5dcd9:   mov    %r13,0x10(%rsp)
  0x00007fdb28c5dcde:   mov    %r10,0x18(%rsp)
  0x00007fdb28c5dce3:   mov    %r8,0x20(%rsp)
  0x00007fdb28c5dce8:   mov    %rdi,0x28(%rsp)
  0x00007fdb28c5dced:   data16 xchg %ax,%ax
  0x00007fdb28c5dcf0:   vzeroupper 
  0x00007fdb28c5dcf3:   callq  0x00007fdb283d4600           ; ImmutableOopMap {[16]=Oop [40]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 461)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@45 (line 67)
                                                            ; - jdk.incubator.vector.FloatVector::fromMemorySegment@14 (line 2984)
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@28 (line 41)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fdb28c5dcf8:   nopl   0x1000368(%rax,%rax,1)       ;   {other}
  0x00007fdb28c5dd00:   mov    $0xffffffe4,%esi
  0x00007fdb28c5dd05:   mov    %r13,%rbp
  0x00007fdb28c5dd08:   vmovss %xmm0,(%rsp)
  0x00007fdb28c5dd0d:   mov    %eax,0x4(%rsp)
  0x00007fdb28c5dd11:   mov    %ecx,0x8(%rsp)
  0x00007fdb28c5dd15:   mov    %r10d,0xc(%rsp)
  0x00007fdb28c5dd1a:   mov    %r9,0x10(%rsp)
  0x00007fdb28c5dd1f:   mov    %rdi,0x18(%rsp)
  0x00007fdb28c5dd24:   mov    %rbx,0x20(%rsp)
  0x00007fdb28c5dd29:   vmovdqu64 %zmm3,0x40(%rsp)
  0x00007fdb28c5dd31:   vmovsd %xmm1,0x28(%rsp)
  0x00007fdb28c5dd37:   nop
  0x00007fdb28c5dd38:   vzeroupper 
  0x00007fdb28c5dd3b:   callq  0x00007fdb283d4600           ; ImmutableOopMap {rbp=Oop [16]=Oop [40]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 461)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@45 (line 67)
                                                            ; - jdk.incubator.vector.FloatVector::intoMemorySegment@32 (line 3232)
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@66 (line 44)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fdb28c5dd40:   nopl   0x20003b0(%rax,%rax,1)       ;   {other}
  0x00007fdb28c5dd48:   xor    %eax,%eax
  0x00007fdb28c5dd4a:   jmpq   0x00007fdb28c5dcae
  0x00007fdb28c5dd4f:   mov    $0xffffffde,%esi
  0x00007fdb28c5dd54:   vmovd  %xmm0,%ebp
  0x00007fdb28c5dd58:   mov    %rdx,0x8(%rsp)
  0x00007fdb28c5dd5d:   mov    %r11,0x10(%rsp)
  0x00007fdb28c5dd62:   xchg   %ax,%ax
  0x00007fdb28c5dd64:   vzeroupper 
  0x00007fdb28c5dd67:   callq  0x00007fdb283d4600           ; ImmutableOopMap {[8]=Oop [16]=Oop }
                                                            ;*invokeinterface byteSize {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@9 (line 40)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fdb28c5dd6c:   nopl   0x30003dc(%rax,%rax,1)       ;   {other}
  0x00007fdb28c5dd74:   mov    %rdx,%rdi
  0x00007fdb28c5dd77:   jmp    0x00007fdb28c5dd7c
  0x00007fdb28c5dd79:   mov    %rdx,%rdi
  0x00007fdb28c5dd7c:   mov    $0xffffff76,%esi
  0x00007fdb28c5dd81:   xor    %r10d,%r10d
  0x00007fdb28c5dd84:   cmp    %r11,%r10
  0x00007fdb28c5dd87:   mov    $0xffffffff,%ebp
  0x00007fdb28c5dd8c:   jl     0x00007fdb28c5dd96
  0x00007fdb28c5dd8e:   setne  %bpl
  0x00007fdb28c5dd92:   movzbl %bpl,%ebp
  0x00007fdb28c5dd96:   mov    %r13,(%rsp)
  0x00007fdb28c5dd9a:   vmovss %xmm0,0x8(%rsp)
  0x00007fdb28c5dda0:   mov    %rdi,0x10(%rsp)
  0x00007fdb28c5dda5:   data16 xchg %ax,%ax
  0x00007fdb28c5dda8:   vzeroupper 
  0x00007fdb28c5ddab:   callq  0x00007fdb283d4600           ; ImmutableOopMap {[0]=Oop [16]=Oop }
                                                            ;*ifge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) FloatColumnFilter::VectorFloatColumnFilterMS@15 (line 40)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fdb28c5ddb0:   nopl   0x4000420(%rax,%rax,1)       ;   {other}
  0x00007fdb28c5ddb8:   mov    %rdx,%rdi
  0x00007fdb28c5ddbb:   jmp    0x00007fdb28c5dd7c
  0x00007fdb28c5ddbd:   mov    %rdx,%rdi
  0x00007fdb28c5ddc0:   jmp    0x00007fdb28c5dd7c
  0x00007fdb28c5ddc2:   mov    %rdx,%rdi
  0x00007fdb28c5ddc5:   jmp    0x00007fdb28c5dd7c
  0x00007fdb28c5ddc7:   mov    $0xfffffff6,%esi
  0x00007fdb28c5ddcc:   vzeroupper 
  0x00007fdb28c5ddcf:   callq  0x00007fdb283d4600           ; ImmutableOopMap {}
                                                            ;*invokeinterface byteSize {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@9 (line 40)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fdb28c5ddd4:   nopl   0x5000444(%rax,%rax,1)       ;   {other}
  0x00007fdb28c5dddc:   movabs $0x7fdb28c5dcb9,%r10         ;   {internal_word}
  0x00007fdb28c5dde6:   mov    %r10,0x390(%r15)
  0x00007fdb28c5dded:   jmpq   0x00007fdb28423780           ;   {runtime_call SafepointBlob}
  0x00007fdb28c5ddf2:   callq  Stub::nmethod_entry_barrier  ;   {runtime_call StubRoutines (2)}
  0x00007fdb28c5ddf7:   jmpq   0x00007fdb28c5db3e
  0x00007fdb28c5ddfc:   hlt    
  0x00007fdb28c5ddfd:   hlt    
  0x00007fdb28c5ddfe:   hlt    
  0x00007fdb28c5ddff:   hlt    
[Exception Handler]
  0x00007fdb28c5de00:   jmpq   0x00007fdb284e0c80           ;   {no_reloc}
[Deopt Handler Code]
  0x00007fdb28c5de05:   callq  0x00007fdb28c5de0a
  0x00007fdb28c5de0a:   subq   $0x5,(%rsp)
  0x00007fdb28c5de0f:   jmpq   0x00007fdb28424c20           ;   {runtime_call DeoptimizationBlob}
  0x00007fdb28c5de14:   hlt    
  0x00007fdb28c5de15:   hlt    
  0x00007fdb28c5de16:   hlt    
  0x00007fdb28c5de17:   hlt    
--------------------------------------------------------------------------------
[/Disassembly]
[Vector Time] 1224ms [Res] 70500.0

 Performance counter stats for 'java --enable-preview -XX:CompileCommand=Print,FloatColumnFilter::VectorFloatColumnFilterMS --add-modules=jdk.incubator.vector FloatColumnFilter 100000 0.5 2 false':

          3,631.09 msec task-clock                #    1.293 CPUs utilized          
             3,056      context-switches          #    0.842 K/sec                  
                26      cpu-migrations            #    0.007 K/sec                  
            23,583      page-faults               #    0.006 M/sec                  
   11,46,92,00,016      cycles                    #    3.159 GHz                    
   35,68,05,44,606      instructions              #    3.11  insn per cycle         
    4,22,17,43,392      branches                  # 1162.664 M/sec                  
       1,85,44,841      branch-misses             #    0.44% of all branches        

       2.808853864 seconds time elapsed

       3.550835000 seconds user
       0.113109000 seconds sys


