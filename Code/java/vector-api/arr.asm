CompileCommand: print FloatColumnFilter.VectorFloatColumnFilter bool print = true
WARNING: Using incubator modules: jdk.incubator.vector
Size = 100000
Selectivity = 0.5
Algo = Vector
Debug = false

============================= C2-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2)     183  642 %     4       FloatColumnFilter::VectorFloatColumnFilter @ 5 (76 bytes)
 total in heap  [0x00007f6480c52a90,0x00007f6480c530a8] = 1560
 relocation     [0x00007f6480c52be0,0x00007f6480c52c18] = 56
 main code      [0x00007f6480c52c20,0x00007f6480c52e78] = 600
 stub code      [0x00007f6480c52e78,0x00007f6480c52e90] = 24
 oops           [0x00007f6480c52e90,0x00007f6480c52ea8] = 24
 metadata       [0x00007f6480c52ea8,0x00007f6480c52f30] = 136
 scopes data    [0x00007f6480c52f30,0x00007f6480c52ff8] = 200
 scopes pcs     [0x00007f6480c52ff8,0x00007f6480c53078] = 128
 dependencies   [0x00007f6480c53078,0x00007f6480c53090] = 24
 nul chk table  [0x00007f6480c53090,0x00007f6480c530a8] = 24

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007f6430401c38} 'VectorFloatColumnFilter' '([F[FF)I' in 'FloatColumnFilter'
  0x00007f6480c52c20:   callq  0x00007f64955e9f80           ;   {runtime_call os::breakpoint()}
  0x00007f6480c52c25:   data16 data16 nopw 0x0(%rax,%rax,1)
  0x00007f6480c52c30:   mov    %eax,-0x14000(%rsp)
  0x00007f6480c52c37:   push   %rbp
  0x00007f6480c52c38:   sub    $0x90,%rsp
  0x00007f6480c52c3f:   nop
  0x00007f6480c52c40:   cmpl   $0x1,0x20(%r15)
  0x00007f6480c52c48:   jne    0x00007f6480c52e6e
  0x00007f6480c52c4e:   mov    0x38(%rsi),%rbp
  0x00007f6480c52c52:   mov    0x30(%rsi),%r14
  0x00007f6480c52c56:   mov    0x18(%rsi),%r13d
  0x00007f6480c52c5a:   vmovss 0x28(%rsi),%xmm0
  0x00007f6480c52c5f:   vmovss %xmm0,0x8(%rsp)
  0x00007f6480c52c65:   mov    0x20(%rsi),%ebx
  0x00007f6480c52c68:   mov    %rsi,%rdi
  0x00007f6480c52c6b:   vzeroupper 
  0x00007f6480c52c6e:   movabs $0x7f64956a5fd0,%r10
  0x00007f6480c52c78:   callq  *%r10
  0x00007f6480c52c7b:   nopl   0x0(%rax,%rax,1)             ;   {other}
  0x00007f6480c52c83:   test   %rbp,%rbp
  0x00007f6480c52c86:   je     0x00007f6480c52dd0
  0x00007f6480c52c8c:   mov    0x8(%rbp),%r11d
  0x00007f6480c52c90:   cmp    $0x1e88,%r11d                ;   {metadata({type array float})}
  0x00007f6480c52c97:   jne    0x00007f6480c52e0c
  0x00007f6480c52c9d:   mov    %rbp,%r9
  0x00007f6480c52ca0:   test   %r14,%r14
  0x00007f6480c52ca3:   je     0x00007f6480c52dd8
  0x00007f6480c52ca9:   mov    0x8(%r14),%r10d
  0x00007f6480c52cad:   cmp    $0x1e88,%r10d                ;   {metadata({type array float})}
  0x00007f6480c52cb4:   jne    0x00007f6480c52e0c
  0x00007f6480c52cba:   nopw   0x0(%rax,%rax,1)
  0x00007f6480c52cc0:   mov    0xc(%r9),%edx                ; implicit exception: dispatches to 0x00007f6480c52e30
  0x00007f6480c52cc4:   mov    %edx,%r11d
  0x00007f6480c52cc7:   add    $0xfffffff1,%r11d
  0x00007f6480c52ccb:   test   %r11d,%r11d
  0x00007f6480c52cce:   jl     0x00007f6480c52de5
  0x00007f6480c52cd4:   mov    0xc(%r14),%r8d               ; implicit exception: dispatches to 0x00007f6480c52de5
  0x00007f6480c52cd8:   add    $0xfffffff1,%r8d
  0x00007f6480c52cdc:   nopl   0x0(%rax)
  0x00007f6480c52ce0:   test   %r8d,%r8d
  0x00007f6480c52ce3:   jl     0x00007f6480c52de5
  0x00007f6480c52ce9:   vbroadcastss 0x8(%rsp),%zmm0
  0x00007f6480c52cf1:   jmp    0x00007f6480c52d0e
  0x00007f6480c52cf3:   mov    0x380(%r15),%rcx
  0x00007f6480c52cfa:   vmovdqu32 %zmm1,0x10(%r14,%rbx,4)
  0x00007f6480c52d05:   add    %r10d,%ebx
  0x00007f6480c52d08:   add    $0x10,%r13d                  ; ImmutableOopMap {r9=Oop r14=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) FloatColumnFilter::VectorFloatColumnFilter@71 (line 28)
  0x00007f6480c52d0c:   test   %eax,(%rcx)                  ;   {poll}
  0x00007f6480c52d0e:   cmp    %edx,%r13d
  0x00007f6480c52d11:   jge    0x00007f6480c52d88
  0x00007f6480c52d17:   cmp    %r11d,%r13d
  0x00007f6480c52d1a:   nopw   0x0(%rax,%rax,1)
  0x00007f6480c52d20:   jae    0x00007f6480c52da3
  0x00007f6480c52d26:   vmovdqu32 0x10(%r9,%r13,4),%zmm1
  0x00007f6480c52d31:   vcmpge_oqps %zmm0,%zmm1,%k7
  0x00007f6480c52d38:   vcompressps %zmm1,%zmm1{%k7}{z}
  0x00007f6480c52d3e:   kmovq  %k7,%rcx
  0x00007f6480c52d43:   popcnt %rcx,%r10
  0x00007f6480c52d48:   cmp    %r8d,%ebx
  0x00007f6480c52d4b:   jb     0x00007f6480c52cf3
  0x00007f6480c52d4d:   mov    $0xffffffe4,%esi
  0x00007f6480c52d52:   mov    %r9,%rbp
  0x00007f6480c52d55:   mov    %r13d,0x10(%rsp)
  0x00007f6480c52d5a:   mov    %r10d,0x14(%rsp)
  0x00007f6480c52d5f:   mov    %r14,0x18(%rsp)
  0x00007f6480c52d64:   mov    %ebx,0x20(%rsp)
  0x00007f6480c52d68:   mov    %r8d,0x24(%rsp)
  0x00007f6480c52d6d:   vmovdqu64 %zmm1,0x40(%rsp)
  0x00007f6480c52d75:   data16 xchg %ax,%ax
  0x00007f6480c52d78:   vzeroupper 
  0x00007f6480c52d7b:   callq  0x00007f64803d4600           ; ImmutableOopMap {rbp=Oop [24]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.FloatVector::intoArray@7 (line 3070)
                                                            ; - FloatColumnFilter::VectorFloatColumnFilter@50 (line 32)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f6480c52d80:   nopl   0x10002f0(%rax,%rax,1)       ;   {other}
  0x00007f6480c52d88:   mov    %ebx,%eax
  0x00007f6480c52d8a:   vzeroupper 
  0x00007f6480c52d8d:   add    $0x90,%rsp
  0x00007f6480c52d94:   pop    %rbp
  0x00007f6480c52d95:   cmp    0x378(%r15),%rsp             ;   {poll_return}
  0x00007f6480c52d9c:   ja     0x00007f6480c52e58
  0x00007f6480c52da2:   retq   
  0x00007f6480c52da3:   mov    $0xffffffe4,%esi
  0x00007f6480c52da8:   mov    %r14,(%rsp)
  0x00007f6480c52dac:   mov    %ebx,0xc(%rsp)
  0x00007f6480c52db0:   mov    %r9,0x18(%rsp)
  0x00007f6480c52db5:   mov    %r13d,0x14(%rsp)
  0x00007f6480c52dba:   mov    %r11d,0x20(%rsp)
  0x00007f6480c52dbf:   nop
  0x00007f6480c52dc0:   vzeroupper 
  0x00007f6480c52dc3:   callq  0x00007f64803d4600           ; ImmutableOopMap {[0]=Oop [24]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.FloatVector::fromArray@9 (line 2797)
                                                            ; - FloatColumnFilter::VectorFloatColumnFilter@18 (line 29)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f6480c52dc8:   nopl   0x2000338(%rax,%rax,1)       ;   {other}
  0x00007f6480c52dd0:   xor    %r9d,%r9d
  0x00007f6480c52dd3:   jmpq   0x00007f6480c52ca0
  0x00007f6480c52dd8:   xor    %r14d,%r14d
  0x00007f6480c52ddb:   nopl   0x0(%rax,%rax,1)
  0x00007f6480c52de0:   jmpq   0x00007f6480c52cba
  0x00007f6480c52de5:   mov    $0xffffffbe,%esi
  0x00007f6480c52dea:   mov    %r9,%rbp
  0x00007f6480c52ded:   mov    %r14,(%rsp)
  0x00007f6480c52df1:   mov    %ebx,0xc(%rsp)
  0x00007f6480c52df5:   mov    %r13d,0x10(%rsp)
  0x00007f6480c52dfa:   xchg   %ax,%ax
  0x00007f6480c52dfc:   vzeroupper 
  0x00007f6480c52dff:   callq  0x00007f64803d4600           ; ImmutableOopMap {rbp=Oop [0]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilter@5 (line 28)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f6480c52e04:   nopl   0x3000374(%rax,%rax,1)       ;   {other}
  0x00007f6480c52e0c:   mov    $0xffffff8d,%esi
  0x00007f6480c52e11:   mov    %r14,(%rsp)
  0x00007f6480c52e15:   mov    %ebx,0xc(%rsp)
  0x00007f6480c52e19:   mov    %r13d,0x10(%rsp)
  0x00007f6480c52e1e:   xchg   %ax,%ax
  0x00007f6480c52e20:   vzeroupper 
  0x00007f6480c52e23:   callq  0x00007f64803d4600           ; ImmutableOopMap {rbp=Oop [0]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilter@5 (line 28)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f6480c52e28:   nopl   0x4000398(%rax,%rax,1)       ;   {other}
  0x00007f6480c52e30:   mov    $0xffffff76,%esi
  0x00007f6480c52e35:   mov    %r9,%rbp
  0x00007f6480c52e38:   mov    %r14,(%rsp)
  0x00007f6480c52e3c:   mov    %ebx,0xc(%rsp)
  0x00007f6480c52e40:   mov    %r13d,0x10(%rsp)
  0x00007f6480c52e45:   data16 xchg %ax,%ax
  0x00007f6480c52e48:   vzeroupper 
  0x00007f6480c52e4b:   callq  0x00007f64803d4600           ; ImmutableOopMap {rbp=Oop [0]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilter@5 (line 28)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f6480c52e50:   nopl   0x50003c0(%rax,%rax,1)       ;   {other}
  0x00007f6480c52e58:   movabs $0x7f6480c52d95,%r10         ;   {internal_word}
  0x00007f6480c52e62:   mov    %r10,0x390(%r15)
  0x00007f6480c52e69:   jmpq   0x00007f6480423780           ;   {runtime_call SafepointBlob}
  0x00007f6480c52e6e:   callq  Stub::nmethod_entry_barrier  ;   {runtime_call StubRoutines (2)}
  0x00007f6480c52e73:   jmpq   0x00007f6480c52c4e
[Exception Handler]
  0x00007f6480c52e78:   jmpq   0x00007f64804e0700           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f6480c52e7d:   callq  0x00007f6480c52e82
  0x00007f6480c52e82:   subq   $0x5,(%rsp)
  0x00007f6480c52e87:   jmpq   0x00007f6480424c20           ;   {runtime_call DeoptimizationBlob}
  0x00007f6480c52e8c:   hlt    
  0x00007f6480c52e8d:   hlt    
  0x00007f6480c52e8e:   hlt    
  0x00007f6480c52e8f:   hlt    
--------------------------------------------------------------------------------
[/Disassembly]

============================= C2-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2)     193  643       4       FloatColumnFilter::VectorFloatColumnFilter (76 bytes)
 total in heap  [0x00007f6480c53110,0x00007f6480c53858] = 1864
 relocation     [0x00007f6480c53260,0x00007f6480c53288] = 40
 main code      [0x00007f6480c532a0,0x00007f6480c53668] = 968
 stub code      [0x00007f6480c53668,0x00007f6480c53680] = 24
 oops           [0x00007f6480c53680,0x00007f6480c53690] = 16
 metadata       [0x00007f6480c53690,0x00007f6480c53708] = 120
 scopes data    [0x00007f6480c53708,0x00007f6480c537b8] = 176
 scopes pcs     [0x00007f6480c537b8,0x00007f6480c53828] = 112
 dependencies   [0x00007f6480c53828,0x00007f6480c53840] = 24
 nul chk table  [0x00007f6480c53840,0x00007f6480c53858] = 24

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007f6430401c38} 'VectorFloatColumnFilter' '([F[FF)I' in 'FloatColumnFilter'
  # parm0:    rsi:rsi   = '[F'
  # parm1:    rdx:rdx   = '[F'
  # parm2:    xmm0      = float
  #           [sp+0x90]  (sp of caller)
  0x00007f6480c532a0:   mov    %eax,-0x14000(%rsp)
  0x00007f6480c532a7:   push   %rbp
  0x00007f6480c532a8:   sub    $0x80,%rsp
  0x00007f6480c532af:   nop
  0x00007f6480c532b0:   cmpl   $0x1,0x20(%r15)
  0x00007f6480c532b8:   jne    0x00007f6480c5365a
  0x00007f6480c532be:   xchg   %ax,%ax
  0x00007f6480c532c0:   mov    0xc(%rsi),%r10d              ; implicit exception: dispatches to 0x00007f6480c5362f
  0x00007f6480c532c4:   xor    %eax,%eax
  0x00007f6480c532c6:   test   %r10d,%r10d
  0x00007f6480c532c9:   jbe    0x00007f6480c535ab
  0x00007f6480c532cf:   mov    %r10d,%r8d
  0x00007f6480c532d2:   add    $0xfffffff1,%r8d
  0x00007f6480c532d6:   test   %r8d,%r8d
  0x00007f6480c532d9:   jl     0x00007f6480c535c4
  0x00007f6480c532df:   nop
  0x00007f6480c532e0:   cmp    $0xf,%r10d
  0x00007f6480c532e4:   je     0x00007f6480c535c4
  0x00007f6480c532ea:   movslq %r10d,%r11
  0x00007f6480c532ed:   mov    %r11,%r8
  0x00007f6480c532f0:   add    $0xf,%r8
  0x00007f6480c532f4:   add    $0xfffffffffffffff1,%r11
  0x00007f6480c532f8:   and    $0xfffffffffffffff0,%r8
  0x00007f6480c532fc:   mov    %r8d,%r8d
  0x00007f6480c532ff:   movslq %r8d,%r8
  0x00007f6480c53302:   add    $0xfffffffffffffff0,%r8
  0x00007f6480c53306:   cmp    %r11,%r8
  0x00007f6480c53309:   jae    0x00007f6480c535c4
  0x00007f6480c5330f:   mov    0xc(%rdx),%r8d               ; implicit exception: dispatches to 0x00007f6480c535c4
  0x00007f6480c53313:   mov    %r8d,%ebx
  0x00007f6480c53316:   add    $0xfffffff1,%ebx
  0x00007f6480c53319:   test   %ebx,%ebx
  0x00007f6480c5331b:   nopl   0x0(%rax,%rax,1)
  0x00007f6480c53320:   jl     0x00007f6480c535c4
  0x00007f6480c53326:   cmp    $0x7ffffff0,%r10d
  0x00007f6480c5332d:   jg     0x00007f6480c535ec
  0x00007f6480c53333:   vmovdqu32 0x10(%rsi),%zmm1
  0x00007f6480c5333d:   vbroadcastss %xmm0,%zmm2
  0x00007f6480c53343:   vcmpge_oqps %zmm2,%zmm1,%k7
  0x00007f6480c5334a:   vcompressps %zmm1,%zmm3{%k7}{z}
  0x00007f6480c53350:   kmovq  %k7,%r11
  0x00007f6480c53355:   popcnt %r11,%rcx
  0x00007f6480c5335a:   nopw   0x0(%rax,%rax,1)
  0x00007f6480c53360:   cmp    $0xf,%r8d
  0x00007f6480c53364:   je     0x00007f6480c53614
  0x00007f6480c5336a:   vmovdqu32 %zmm3,0x10(%rdx)
  0x00007f6480c53374:   mov    %r10d,%r9d
  0x00007f6480c53377:   add    $0xfffffff0,%r9d
  0x00007f6480c5337b:   mov    %r10d,%r11d
  0x00007f6480c5337e:   add    $0xffffffd0,%r11d
  0x00007f6480c53382:   mov    $0x80000000,%r8d
  0x00007f6480c53388:   cmp    %r11d,%r9d
  0x00007f6480c5338b:   cmovl  %r8d,%r11d
  0x00007f6480c5338f:   mov    $0x10,%ebp
  0x00007f6480c53394:   cmp    $0x10,%r11d
  0x00007f6480c53398:   jle    0x00007f6480c53555
  0x00007f6480c5339e:   mov    $0xfa00,%r9d
  0x00007f6480c533a4:   jmpq   0x00007f6480c534e1
  0x00007f6480c533a9:   nopl   0x0(%rax)
  0x00007f6480c533b0:   vmovd  %xmm1,%r10d
  0x00007f6480c533b5:   vmovdqu32 0x10(%rsi,%rbp,4),%zmm1
  0x00007f6480c533c0:   vcmpge_oqps %zmm2,%zmm1,%k7
  0x00007f6480c533c7:   vcompressps %zmm1,%zmm3{%k7}{z}
  0x00007f6480c533cd:   kmovq  %k7,%r13
  0x00007f6480c533d2:   popcnt %r13,%rdi
  0x00007f6480c533d7:   cmp    %ebx,%ecx
  0x00007f6480c533d9:   jae    0x00007f6480c53508
  0x00007f6480c533df:   vmovd  %r10d,%xmm1
  0x00007f6480c533e4:   mov    %edi,%r10d
  0x00007f6480c533e7:   add    %ecx,%r10d
  0x00007f6480c533ea:   movslq %ecx,%r13
  0x00007f6480c533ed:   vmovdqu32 %zmm3,0x10(%rdx,%r13,4)
  0x00007f6480c533f8:   vmovdqu32 0x50(%rsi,%rbp,4),%zmm3
  0x00007f6480c53403:   vcmpge_oqps %zmm2,%zmm3,%k7
  0x00007f6480c5340a:   vcompressps %zmm3,%zmm3{%k7}{z}
  0x00007f6480c53410:   kmovq  %k7,%r14
  0x00007f6480c53415:   popcnt %r14,%rcx
  0x00007f6480c5341a:   nopw   0x0(%rax,%rax,1)
  0x00007f6480c53420:   cmp    %ebx,%r10d
  0x00007f6480c53423:   jae    0x00007f6480c53512
  0x00007f6480c53429:   add    %r10d,%ecx
  0x00007f6480c5342c:   movslq %edi,%r10
  0x00007f6480c5342f:   add    %r13,%r10
  0x00007f6480c53432:   vmovdqu32 %zmm3,0x10(%rdx,%r10,4)
  0x00007f6480c5343d:   vmovdqu32 0x90(%rsi,%rbp,4),%zmm3
  0x00007f6480c53448:   vcmpge_oqps %zmm2,%zmm3,%k7
  0x00007f6480c5344f:   vcompressps %zmm3,%zmm3{%k7}{z}
  0x00007f6480c53455:   kmovq  %k7,%r10
  0x00007f6480c5345a:   popcnt %r10,%rdi
  0x00007f6480c5345f:   nop
  0x00007f6480c53460:   cmp    %ebx,%ecx
  0x00007f6480c53462:   jae    0x00007f6480c53505
  0x00007f6480c53468:   mov    %edi,%r10d
  0x00007f6480c5346b:   add    %ecx,%r10d
  0x00007f6480c5346e:   movslq %ecx,%r13
  0x00007f6480c53471:   vmovdqu32 %zmm3,0x10(%rdx,%r13,4)
  0x00007f6480c5347c:   vmovdqu32 0xd0(%rsi,%rbp,4),%zmm3
  0x00007f6480c53487:   vcmpge_oqps %zmm2,%zmm3,%k7
  0x00007f6480c5348e:   vcompressps %zmm3,%zmm3{%k7}{z}
  0x00007f6480c53494:   kmovq  %k7,%r14
  0x00007f6480c53499:   popcnt %r14,%rcx
  0x00007f6480c5349e:   xchg   %ax,%ax                      ;   {no_reloc}
  0x00007f6480c534a0:   cmp    %ebx,%r10d
  0x00007f6480c534a3:   jae    0x00007f6480c5350f
  0x00007f6480c534a9:   add    %r10d,%ecx
  0x00007f6480c534ac:   movslq %edi,%r10
  0x00007f6480c534af:   add    %r13,%r10
  0x00007f6480c534b2:   vmovdqu32 %zmm3,0x10(%rdx,%r10,4)
  0x00007f6480c534bd:   add    $0x40,%ebp
  0x00007f6480c534c0:   cmp    %r8d,%ebp
  0x00007f6480c534c3:   jl     0x00007f6480c533b0
  0x00007f6480c534c9:   mov    0x380(%r15),%r10             ; ImmutableOopMap {rdx=Oop rsi=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) FloatColumnFilter::VectorFloatColumnFilter@71 (line 28)
  0x00007f6480c534d0:   test   %eax,(%r10)                  ;   {poll}
  0x00007f6480c534d3:   cmp    %r11d,%ebp
  0x00007f6480c534d6:   jge    0x00007f6480c53550
  0x00007f6480c534dc:   vmovd  %xmm1,%r10d
  0x00007f6480c534e1:   mov    %r11d,%r8d
  0x00007f6480c534e4:   sub    %ebp,%r8d
  0x00007f6480c534e7:   cmp    %ebp,%r11d
  0x00007f6480c534ea:   cmovl  %eax,%r8d
  0x00007f6480c534ee:   cmp    $0xfa00,%r8d
  0x00007f6480c534f5:   cmova  %r9d,%r8d
  0x00007f6480c534f9:   add    %ebp,%r8d
  0x00007f6480c534fc:   nopl   0x0(%rax)
  0x00007f6480c53500:   jmpq   0x00007f6480c533b5
  0x00007f6480c53505:   add    $0x20,%ebp
  0x00007f6480c53508:   mov    %ecx,%r10d
  0x00007f6480c5350b:   mov    %edi,%ecx
  0x00007f6480c5350d:   jmp    0x00007f6480c53515
  0x00007f6480c5350f:   add    $0x20,%ebp
  0x00007f6480c53512:   add    $0x10,%ebp
  0x00007f6480c53515:   vmovdqu64 %zmm3,(%rsp)
  0x00007f6480c5351c:   mov    %rsi,0x40(%rsp)
  0x00007f6480c53521:   mov    %ecx,0x54(%rsp)
  0x00007f6480c53525:   mov    %rdx,0x58(%rsp)
  0x00007f6480c5352a:   mov    %r10d,0x60(%rsp)
  0x00007f6480c5352f:   mov    %ebx,0x64(%rsp)
  0x00007f6480c53533:   vmovss %xmm0,0x68(%rsp)
  0x00007f6480c53539:   mov    $0xffffffe4,%esi
  0x00007f6480c5353e:   xchg   %ax,%ax
  0x00007f6480c53540:   vzeroupper 
  0x00007f6480c53543:   callq  0x00007f64803d4600           ; ImmutableOopMap {[64]=Oop [88]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.FloatVector::intoArray@7 (line 3070)
                                                            ; - FloatColumnFilter::VectorFloatColumnFilter@50 (line 32)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f6480c53548:   nopl   0x1000438(%rax,%rax,1)       ;   {other}
  0x00007f6480c53550:   vmovd  %xmm1,%r10d
  0x00007f6480c53555:   cmp    %r10d,%ebp
  0x00007f6480c53558:   jge    0x00007f6480c535a9
  0x00007f6480c5355e:   xchg   %ax,%ax
  0x00007f6480c53560:   vmovdqu32 0x10(%rsi,%rbp,4),%zmm1
  0x00007f6480c5356b:   vcmpge_oqps %zmm2,%zmm1,%k7
  0x00007f6480c53572:   vcompressps %zmm1,%zmm1{%k7}{z}
  0x00007f6480c53578:   kmovq  %k7,%r11
  0x00007f6480c5357d:   popcnt %r11,%rax
  0x00007f6480c53582:   cmp    %ebx,%ecx
  0x00007f6480c53584:   jae    0x00007f6480c5361e
  0x00007f6480c5358a:   vmovdqu32 %zmm1,0x10(%rdx,%rcx,4)
  0x00007f6480c53595:   add    %ecx,%eax
  0x00007f6480c53597:   add    $0x10,%ebp
  0x00007f6480c5359a:   nopw   0x0(%rax,%rax,1)
  0x00007f6480c535a0:   cmp    %r10d,%ebp
  0x00007f6480c535a3:   jge    0x00007f6480c535ab
  0x00007f6480c535a5:   mov    %eax,%ecx
  0x00007f6480c535a7:   jmp    0x00007f6480c53560
  0x00007f6480c535a9:   mov    %ecx,%eax
  0x00007f6480c535ab:   vzeroupper 
  0x00007f6480c535ae:   add    $0x80,%rsp
  0x00007f6480c535b5:   pop    %rbp
  0x00007f6480c535b6:   cmp    0x378(%r15),%rsp             ;   {poll_return}
  0x00007f6480c535bd:   ja     0x00007f6480c53644
  0x00007f6480c535c3:   retq   
  0x00007f6480c535c4:   mov    %rsi,%rbp
  0x00007f6480c535c7:   mov    %rdx,(%rsp)
  0x00007f6480c535cb:   vmovss %xmm0,0x8(%rsp)
  0x00007f6480c535d1:   mov    %r10d,0xc(%rsp)
  0x00007f6480c535d6:   mov    $0xffffff76,%esi
  0x00007f6480c535db:   nop
  0x00007f6480c535dc:   vzeroupper 
  0x00007f6480c535df:   callq  0x00007f64803d4600           ; ImmutableOopMap {rbp=Oop [0]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) FloatColumnFilter::VectorFloatColumnFilter@9 (line 28)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f6480c535e4:   nopl   0x20004d4(%rax,%rax,1)       ;   {other}
  0x00007f6480c535ec:   mov    %rsi,%rbp
  0x00007f6480c535ef:   mov    %rdx,(%rsp)
  0x00007f6480c535f3:   vmovss %xmm0,0x8(%rsp)
  0x00007f6480c535f9:   mov    %r10d,0xc(%rsp)
  0x00007f6480c535fe:   mov    $0xffffff6e,%esi
  0x00007f6480c53603:   nop
  0x00007f6480c53604:   vzeroupper 
  0x00007f6480c53607:   callq  0x00007f64803d4600           ; ImmutableOopMap {rbp=Oop [0]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) FloatColumnFilter::VectorFloatColumnFilter@9 (line 28)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f6480c5360c:   nopl   0x30004fc(%rax,%rax,1)       ;   {other}
  0x00007f6480c53614:   xor    %r10d,%r10d
  0x00007f6480c53617:   xor    %ebp,%ebp
  0x00007f6480c53619:   jmpq   0x00007f6480c53515
  0x00007f6480c5361e:   vmovdqu64 %zmm1,(%rsp)
  0x00007f6480c53625:   mov    %ecx,%r10d
  0x00007f6480c53628:   mov    %eax,%ecx
  0x00007f6480c5362a:   jmpq   0x00007f6480c5351c
  0x00007f6480c5362f:   mov    $0xfffffff6,%esi
  0x00007f6480c53634:   vzeroupper 
  0x00007f6480c53637:   callq  0x00007f64803d4600           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilter@8 (line 28)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f6480c5363c:   nopl   0x400052c(%rax,%rax,1)       ;   {other}
  0x00007f6480c53644:   movabs $0x7f6480c535b6,%r10         ;   {internal_word}
  0x00007f6480c5364e:   mov    %r10,0x390(%r15)
  0x00007f6480c53655:   jmpq   0x00007f6480423780           ;   {runtime_call SafepointBlob}
  0x00007f6480c5365a:   callq  Stub::nmethod_entry_barrier  ;   {runtime_call StubRoutines (2)}
  0x00007f6480c5365f:   jmpq   0x00007f6480c532be
  0x00007f6480c53664:   hlt    
  0x00007f6480c53665:   hlt    
  0x00007f6480c53666:   hlt    
  0x00007f6480c53667:   hlt    
[Exception Handler]
  0x00007f6480c53668:   jmpq   0x00007f64804e0700           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f6480c5366d:   callq  0x00007f6480c53672
  0x00007f6480c53672:   subq   $0x5,(%rsp)
  0x00007f6480c53677:   jmpq   0x00007f6480424c20           ;   {runtime_call DeoptimizationBlob}
  0x00007f6480c5367c:   hlt    
  0x00007f6480c5367d:   hlt    
  0x00007f6480c5367e:   hlt    
  0x00007f6480c5367f:   hlt    
--------------------------------------------------------------------------------
[/Disassembly]
[Vector Time] 1115ms [Res] 70500.0

 Performance counter stats for 'java --enable-preview -XX:CompileCommand=Print,FloatColumnFilter::VectorFloatColumnFilter --add-modules=jdk.incubator.vector FloatColumnFilter 100000 0.5 1 false':

          3,167.13 msec task-clock                #    1.291 CPUs utilized          
             3,097      context-switches          #    0.978 K/sec                  
                21      cpu-migrations            #    0.007 K/sec                  
            19,992      page-faults               #    0.006 M/sec                  
    9,93,11,93,394      cycles                    #    3.136 GHz                    
   17,25,75,43,047      instructions              #    1.74  insn per cycle         
    1,94,23,95,368      branches                  #  613.299 M/sec                  
       1,53,87,744      branch-misses             #    0.79% of all branches        

       2.454036998 seconds time elapsed

       3.085864000 seconds user
       0.116134000 seconds sys


