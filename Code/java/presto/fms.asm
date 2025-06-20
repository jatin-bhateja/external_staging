CompileCommand: print FloatColumnFilter.VectorFloatColumnFilterMS bool print = true
WARNING: Using incubator modules: jdk.incubator.vector
Size = 4096
Selectivity = 0.5
Algo = Vector
Debug = false

============================= C2-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2)     225  308 %           FloatColumnFilter::VectorFloatColumnFilterMS @ 5 (94 bytes)
 total in heap  [0x00007fb28111e990,0x00007fb28111f200] = 2160
 relocation     [0x00007fb28111eae0,0x00007fb28111eb20] = 64
 main code      [0x00007fb28111eb20,0x00007fb28111eec8] = 936
 stub code      [0x00007fb28111eec8,0x00007fb28111eee0] = 24
 oops           [0x00007fb28111eee0,0x00007fb28111ef00] = 32
 metadata       [0x00007fb28111ef00,0x00007fb28111f020] = 288
 scopes data    [0x00007fb28111f020,0x00007fb28111f118] = 248
 scopes pcs     [0x00007fb28111f118,0x00007fb28111f198] = 128
 dependencies   [0x00007fb28111f198,0x00007fb28111f1d8] = 64
 nul chk table  [0x00007fb28111f1d8,0x00007fb28111f200] = 40

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007fb238401d68} 'VectorFloatColumnFilterMS' '(Ljava/lang/foreign/MemorySegment;Ljava/lang/foreign/MemorySegment;F)I' in 'FloatColumnFilter'
  0x00007fb28111eb20:   callq  0x00007fb2930abf80           ;   {runtime_call os::breakpoint()}
  0x00007fb28111eb25:   data16 data16 nopw 0x0(%rax,%rax,1)
  0x00007fb28111eb30:   mov    %eax,-0x14000(%rsp)
  0x00007fb28111eb37:   push   %rbp
  0x00007fb28111eb38:   sub    $0x90,%rsp
  0x00007fb28111eb3f:   nop
  0x00007fb28111eb40:   cmpl   $0x1,0x20(%r15)
  0x00007fb28111eb48:   jne    0x00007fb28111eebe
  0x00007fb28111eb4e:   mov    0x38(%rsi),%rbp
  0x00007fb28111eb52:   mov    0x30(%rsi),%r13
  0x00007fb28111eb56:   mov    0x18(%rsi),%r14d
  0x00007fb28111eb5a:   vmovss 0x28(%rsi),%xmm1
  0x00007fb28111eb5f:   vmovss %xmm1,0x10(%rsp)
  0x00007fb28111eb65:   mov    0x20(%rsi),%ebx
  0x00007fb28111eb68:   mov    %rsi,%rdi
  0x00007fb28111eb6b:   vzeroupper 
  0x00007fb28111eb6e:   movabs $0x7fb293167fd0,%r10
  0x00007fb28111eb78:   callq  *%r10
  0x00007fb28111eb7b:   nopl   0x0(%rax,%rax,1)             ;   {other}
  0x00007fb28111eb83:   movabs $0x80104e7d8,%rax            ;   {metadata('java/lang/foreign/MemorySegment')}
  0x00007fb28111eb8d:   test   %rbp,%rbp
  0x00007fb28111eb90:   je     0x00007fb28111ee05
  0x00007fb28111eb96:   mov    0x8(%rbp),%r10d
  0x00007fb28111eb9a:   movabs $0x800000000,%rsi
  0x00007fb28111eba4:   add    %r10,%rsi
  0x00007fb28111eba7:   mov    0x20(%rsi),%r10
  0x00007fb28111ebab:   cmp    %rax,%r10
  0x00007fb28111ebae:   jne    0x00007fb28111ed9b
  0x00007fb28111ebb4:   mov    %rbp,%r9
  0x00007fb28111ebb7:   test   %r13,%r13
  0x00007fb28111ebba:   nopw   0x0(%rax,%rax,1)
  0x00007fb28111ebc0:   je     0x00007fb28111ee0d
  0x00007fb28111ebc6:   mov    0x8(%r13),%r10d
  0x00007fb28111ebca:   movabs $0x800000000,%rsi
  0x00007fb28111ebd4:   add    %r10,%rsi
  0x00007fb28111ebd7:   mov    0x20(%rsi),%r10
  0x00007fb28111ebdb:   nopl   0x0(%rax,%rax,1)
  0x00007fb28111ebe0:   cmp    %rax,%r10
  0x00007fb28111ebe3:   jne    0x00007fb28111ede0
  0x00007fb28111ebe9:   mov    0x8(%r9),%r10d               ; implicit exception: dispatches to 0x00007fb28111ee58
  0x00007fb28111ebed:   cmp    $0x104f788,%r10d             ;   {metadata('jdk/internal/foreign/NativeMemorySegmentImpl')}
  0x00007fb28111ebf4:   jne    0x00007fb28111ee58
  0x00007fb28111ebfa:   mov    %r9,%rcx
  0x00007fb28111ebfd:   mov    0x10(%rcx),%rdx
  0x00007fb28111ec01:   mov    %rdx,%rdi
  0x00007fb28111ec04:   add    $0xffffffffffffffc1,%rdi
  0x00007fb28111ec08:   test   %rdi,%rdi
  0x00007fb28111ec0b:   jl     0x00007fb28111ee80
  0x00007fb28111ec11:   mov    0x18(%rcx),%r10d
  0x00007fb28111ec15:   mov    0x8(%r12,%r10,8),%r8d        ; implicit exception: dispatches to 0x00007fb28111ee80
  0x00007fb28111ec1a:   nopw   0x0(%rax,%rax,1)
  0x00007fb28111ec20:   cmp    $0x104d890,%r8d              ;   {metadata('jdk/internal/foreign/MemorySessionImpl$GlobalSessionImpl')}
  0x00007fb28111ec27:   jne    0x00007fb28111ee80
  0x00007fb28111ec2d:   shl    $0x3,%r10
  0x00007fb28111ec31:   cmp    0x18(%r10),%r12d
  0x00007fb28111ec35:   jne    0x00007fb28111ee80
  0x00007fb28111ec3b:   mov    0xc(%r10),%r11d
  0x00007fb28111ec3f:   nop
  0x00007fb28111ec40:   test   %r11d,%r11d
  0x00007fb28111ec43:   jl     0x00007fb28111ee80
  0x00007fb28111ec49:   mov    0x8(%r13),%r11d              ; implicit exception: dispatches to 0x00007fb28111ee80
  0x00007fb28111ec4d:   cmp    $0x104f788,%r11d             ;   {metadata('jdk/internal/foreign/NativeMemorySegmentImpl')}
  0x00007fb28111ec54:   jne    0x00007fb28111ee80
  0x00007fb28111ec5a:   mov    %r13,%r8
  0x00007fb28111ec5d:   movzbl 0xc(%r8),%r10d
  0x00007fb28111ec62:   test   %r10d,%r10d
  0x00007fb28111ec65:   jne    0x00007fb28111ee80
  0x00007fb28111ec6b:   mov    $0xffffffffffffffc1,%rsi
  0x00007fb28111ec72:   add    0x10(%r8),%rsi
  0x00007fb28111ec76:   test   %rsi,%rsi
  0x00007fb28111ec79:   jl     0x00007fb28111ee80
  0x00007fb28111ec7f:   mov    0x18(%r8),%r10d
  0x00007fb28111ec83:   mov    0x8(%r12,%r10,8),%r11d       ; implicit exception: dispatches to 0x00007fb28111ee80
  0x00007fb28111ec88:   cmp    $0x104d890,%r11d             ;   {metadata('jdk/internal/foreign/MemorySessionImpl$GlobalSessionImpl')}
  0x00007fb28111ec8f:   jne    0x00007fb28111ee80
  0x00007fb28111ec95:   shl    $0x3,%r10
  0x00007fb28111ec99:   nopl   0x0(%rax)
  0x00007fb28111eca0:   cmp    0x18(%r10),%r12d
  0x00007fb28111eca4:   jne    0x00007fb28111ee80
  0x00007fb28111ecaa:   mov    0xc(%r10),%r11d
  0x00007fb28111ecae:   test   %r11d,%r11d
  0x00007fb28111ecb1:   jl     0x00007fb28111ee80
  0x00007fb28111ecb7:   mov    0x20(%r8),%r10
  0x00007fb28111ecbb:   mov    0x20(%rcx),%r11
  0x00007fb28111ecbf:   vbroadcastss 0x10(%rsp),%zmm0
  0x00007fb28111ecc7:   mov    %r10,%r9
  0x00007fb28111ecca:   jmp    0x00007fb28111ecf2
  0x00007fb28111eccc:   nopl   0x0(%rax)
  0x00007fb28111ecd0:   add    %ebp,%ebx
  0x00007fb28111ecd2:   add    $0x40,%r14d
  0x00007fb28111ecd6:   movslq %r8d,%r10
  0x00007fb28111ecd9:   vmovdqu32 %zmm1,(%r9,%r10,1)
  0x00007fb28111ece0:   mov    0x380(%r15),%r10             ; ImmutableOopMap {rcx=Oop rax=Oop r13=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) FloatColumnFilter::VectorFloatColumnFilterMS@89 (line 40)
  0x00007fb28111ece7:   test   %eax,(%r10)                  ;   {poll}
  0x00007fb28111ecea:   mov    %rax,%r8
  0x00007fb28111eced:   mov    0x8(%rsp),%rsi
  0x00007fb28111ecf2:   movslq %r14d,%r10
  0x00007fb28111ecf5:   cmp    %rdx,%r10
  0x00007fb28111ecf8:   jge    0x00007fb28111ed80
  0x00007fb28111ecfe:   xchg   %ax,%ax
  0x00007fb28111ed00:   cmp    %rdi,%r10
  0x00007fb28111ed03:   jae    0x00007fb28111ee15
  0x00007fb28111ed09:   mov    %rsi,0x8(%rsp)
  0x00007fb28111ed0e:   mov    %r8,%rax
  0x00007fb28111ed11:   mov    %r14d,%r10d
  0x00007fb28111ed14:   mov    %ebx,%r8d
  0x00007fb28111ed17:   shl    $0x2,%r8d
  0x00007fb28111ed1b:   movslq %r10d,%r10
  0x00007fb28111ed1e:   vmovdqu32 (%r11,%r10,1),%zmm1
  0x00007fb28111ed25:   vcmpge_oqps %zmm0,%zmm1,%k7
  0x00007fb28111ed2c:   vcompressps %zmm1,%zmm1{%k7}{z}
  0x00007fb28111ed32:   movslq %r8d,%r10
  0x00007fb28111ed35:   kmovq  %k7,%rsi
  0x00007fb28111ed3a:   popcnt %rsi,%rbp
  0x00007fb28111ed3f:   nop
  0x00007fb28111ed40:   cmp    0x8(%rsp),%r10
  0x00007fb28111ed45:   jb     0x00007fb28111ecd0
  0x00007fb28111ed47:   mov    $0xffffffe4,%esi
  0x00007fb28111ed4c:   mov    %ebx,(%rsp)
  0x00007fb28111ed4f:   mov    %r14d,0x4(%rsp)
  0x00007fb28111ed54:   mov    %rcx,0x18(%rsp)
  0x00007fb28111ed59:   mov    %r13,0x20(%rsp)
  0x00007fb28111ed5e:   mov    %rax,0x28(%rsp)
  0x00007fb28111ed63:   mov    %r10,0x30(%rsp)
  0x00007fb28111ed68:   vmovdqu64 %zmm1,0x40(%rsp)
  0x00007fb28111ed70:   vzeroupper 
  0x00007fb28111ed73:   callq  0x00007fb281005600           ; ImmutableOopMap {[24]=Oop [32]=Oop [40]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 461)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@45 (line 67)
                                                            ; - jdk.incubator.vector.FloatVector::intoMemorySegment@32 (line 3232)
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@66 (line 44)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fb28111ed78:   nopl   0x10003e8(%rax,%rax,1)       ;   {other}
  0x00007fb28111ed80:   mov    %ebx,%eax
  0x00007fb28111ed82:   vzeroupper 
  0x00007fb28111ed85:   add    $0x90,%rsp
  0x00007fb28111ed8c:   pop    %rbp
  0x00007fb28111ed8d:   cmp    0x378(%r15),%rsp             ;   {poll_return}
  0x00007fb28111ed94:   ja     0x00007fb28111eea8
  0x00007fb28111ed9a:   retq   
  0x00007fb28111ed9b:   mov    0x28(%rsi),%rdi
  0x00007fb28111ed9f:   mov    (%rdi),%ecx
  0x00007fb28111eda1:   add    $0x8,%rdi
  0x00007fb28111eda5:   test   %rax,%rax
  0x00007fb28111eda8:   repnz scas %es:(%rdi),%rax
  0x00007fb28111edab:   jne    0x00007fb28111edb5
  0x00007fb28111edb1:   mov    %rax,0x20(%rsi)
  0x00007fb28111edb5:   je     0x00007fb28111ebb4
  0x00007fb28111edbb:   mov    $0xffffff8d,%esi
  0x00007fb28111edc0:   mov    %ebx,(%rsp)
  0x00007fb28111edc3:   mov    %r14d,0x4(%rsp)
  0x00007fb28111edc8:   mov    %r13,0x8(%rsp)
  0x00007fb28111edcd:   data16 xchg %ax,%ax
  0x00007fb28111edd0:   vzeroupper 
  0x00007fb28111edd3:   callq  0x00007fb281005600           ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@5 (line 40)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fb28111edd8:   nopl   0x2000448(%rax,%rax,1)       ;   {other}
  0x00007fb28111ede0:   mov    0x28(%rsi),%rdi
  0x00007fb28111ede4:   mov    (%rdi),%ecx
  0x00007fb28111ede6:   add    $0x8,%rdi
  0x00007fb28111edea:   test   %rax,%rax
  0x00007fb28111eded:   repnz scas %es:(%rdi),%rax
  0x00007fb28111edf0:   jne    0x00007fb28111edfa
  0x00007fb28111edf6:   mov    %rax,0x20(%rsi)
  0x00007fb28111edfa:   jne    0x00007fb28111edbb
  0x00007fb28111edfc:   nopl   0x0(%rax)
  0x00007fb28111ee00:   jmpq   0x00007fb28111ebe9
  0x00007fb28111ee05:   xor    %r9d,%r9d
  0x00007fb28111ee08:   jmpq   0x00007fb28111ebb7
  0x00007fb28111ee0d:   xor    %r13d,%r13d
  0x00007fb28111ee10:   jmpq   0x00007fb28111ebe9
  0x00007fb28111ee15:   mov    $0xffffffe4,%esi
  0x00007fb28111ee1a:   mov    %ebx,%ebp
  0x00007fb28111ee1c:   mov    %r14d,(%rsp)
  0x00007fb28111ee20:   mov    %r10,0x8(%rsp)
  0x00007fb28111ee25:   mov    %r13,0x20(%rsp)
  0x00007fb28111ee2a:   mov    %rax,-0x8(%rsp)
  0x00007fb28111ee2f:   mov    0x10(%rsp),%eax
  0x00007fb28111ee33:   mov    %eax,0x4(%rsp)
  0x00007fb28111ee37:   mov    -0x8(%rsp),%rax
  0x00007fb28111ee3c:   mov    %rcx,0x10(%rsp)
  0x00007fb28111ee41:   mov    %rdi,0x28(%rsp)
  0x00007fb28111ee46:   xchg   %ax,%ax
  0x00007fb28111ee48:   vzeroupper 
  0x00007fb28111ee4b:   callq  0x00007fb281005600           ; ImmutableOopMap {[16]=Oop [32]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 461)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@45 (line 67)
                                                            ; - jdk.incubator.vector.FloatVector::fromMemorySegment@14 (line 2984)
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@28 (line 41)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fb28111ee50:   nopl   0x30004c0(%rax,%rax,1)       ;   {other}
  0x00007fb28111ee58:   mov    $0xffffff76,%esi
  0x00007fb28111ee5d:   mov    %ebx,%ebp
  0x00007fb28111ee5f:   mov    %r14d,(%rsp)
  0x00007fb28111ee63:   mov    %r9,0x8(%rsp)
  0x00007fb28111ee68:   mov    %r13,0x18(%rsp)
  0x00007fb28111ee6d:   data16 xchg %ax,%ax
  0x00007fb28111ee70:   vzeroupper 
  0x00007fb28111ee73:   callq  0x00007fb281005600           ; ImmutableOopMap {[8]=Oop [24]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@5 (line 40)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fb28111ee78:   nopl   0x40004e8(%rax,%rax,1)       ;   {other}
  0x00007fb28111ee80:   mov    $0xffffffbe,%esi
  0x00007fb28111ee85:   mov    %ebx,%ebp
  0x00007fb28111ee87:   mov    %r14d,(%rsp)
  0x00007fb28111ee8b:   mov    %r9,0x8(%rsp)
  0x00007fb28111ee90:   mov    %r13,0x18(%rsp)
  0x00007fb28111ee95:   data16 xchg %ax,%ax
  0x00007fb28111ee98:   vzeroupper 
  0x00007fb28111ee9b:   callq  0x00007fb281005600           ; ImmutableOopMap {[8]=Oop [24]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@5 (line 40)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fb28111eea0:   nopl   0x5000510(%rax,%rax,1)       ;   {other}
  0x00007fb28111eea8:   movabs $0x7fb28111ed8d,%r10         ;   {internal_word}
  0x00007fb28111eeb2:   mov    %r10,0x390(%r15)
  0x00007fb28111eeb9:   jmpq   0x00007fb281054780           ;   {runtime_call SafepointBlob}
  0x00007fb28111eebe:   callq  Stub::nmethod_entry_barrier  ;   {runtime_call StubRoutines (2)}
  0x00007fb28111eec3:   jmpq   0x00007fb28111eb4e
[Exception Handler]
  0x00007fb28111eec8:   jmpq   0x00007fb281086500           ;   {no_reloc}
[Deopt Handler Code]
  0x00007fb28111eecd:   callq  0x00007fb28111eed2
  0x00007fb28111eed2:   subq   $0x5,(%rsp)
  0x00007fb28111eed7:   jmpq   0x00007fb281055c20           ;   {runtime_call DeoptimizationBlob}
  0x00007fb28111eedc:   hlt    
  0x00007fb28111eedd:   hlt    
  0x00007fb28111eede:   hlt    
  0x00007fb28111eedf:   hlt    
--------------------------------------------------------------------------------
[/Disassembly]

============================= C2-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2)     242  309             FloatColumnFilter::VectorFloatColumnFilterMS (94 bytes)
 total in heap  [0x00007fb281124410,0x00007fb281124bd0] = 1984
 relocation     [0x00007fb281124560,0x00007fb281124598] = 56
 main code      [0x00007fb2811245a0,0x00007fb281124868] = 712
 stub code      [0x00007fb281124868,0x00007fb281124880] = 24
 oops           [0x00007fb281124880,0x00007fb2811248a0] = 32
 metadata       [0x00007fb2811248a0,0x00007fb2811249c0] = 288
 scopes data    [0x00007fb2811249c0,0x00007fb281124ae8] = 296
 scopes pcs     [0x00007fb281124ae8,0x00007fb281124b68] = 128
 dependencies   [0x00007fb281124b68,0x00007fb281124ba8] = 64
 nul chk table  [0x00007fb281124ba8,0x00007fb281124bd0] = 40

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007fb238401d68} 'VectorFloatColumnFilterMS' '(Ljava/lang/foreign/MemorySegment;Ljava/lang/foreign/MemorySegment;F)I' in 'FloatColumnFilter'
  # parm0:    rsi:rsi   = 'java/lang/foreign/MemorySegment'
  # parm1:    rdx:rdx   = 'java/lang/foreign/MemorySegment'
  # parm2:    xmm0      = float
  #           [sp+0xa0]  (sp of caller)
  0x00007fb2811245a0:   mov    %eax,-0x14000(%rsp)
  0x00007fb2811245a7:   push   %rbp
  0x00007fb2811245a8:   sub    $0x90,%rsp
  0x00007fb2811245af:   nop
  0x00007fb2811245b0:   cmpl   $0x1,0x20(%r15)
  0x00007fb2811245b8:   jne    0x00007fb28112485a
  0x00007fb2811245be:   vmovaps %xmm0,%xmm2
  0x00007fb2811245c2:   vmovq  %rdx,%xmm0
  0x00007fb2811245c7:   mov    %rsi,%r9
  0x00007fb2811245ca:   mov    0x8(%rsi),%r11d              ; implicit exception: dispatches to 0x00007fb28112482c
  0x00007fb2811245ce:   cmp    $0x104f788,%r11d             ;   {metadata('jdk/internal/foreign/NativeMemorySegmentImpl')}
  0x00007fb2811245d5:   jne    0x00007fb2811247cc
  0x00007fb2811245db:   mov    0x10(%r9),%r8
  0x00007fb2811245df:   xor    %ecx,%ecx
  0x00007fb2811245e1:   test   %r8,%r8
  0x00007fb2811245e4:   jle    0x00007fb28112474e
  0x00007fb2811245ea:   mov    %r8,%rbx
  0x00007fb2811245ed:   add    $0xffffffffffffffc1,%rbx
  0x00007fb2811245f1:   test   %rbx,%rbx
  0x00007fb2811245f4:   jl     0x00007fb2811247f0
  0x00007fb2811245fa:   mov    0x18(%r9),%r11d
  0x00007fb2811245fe:   xchg   %ax,%ax
  0x00007fb281124600:   mov    0x8(%r12,%r11,8),%r10d       ; implicit exception: dispatches to 0x00007fb2811247f0
  0x00007fb281124605:   cmp    $0x104d890,%r10d             ;   {metadata('jdk/internal/foreign/MemorySessionImpl$GlobalSessionImpl')}
  0x00007fb28112460c:   jne    0x00007fb2811247f0
  0x00007fb281124612:   lea    (%r12,%r11,8),%r10
  0x00007fb281124616:   cmp    0x18(%r10),%r12d
  0x00007fb28112461a:   nopw   0x0(%rax,%rax,1)
  0x00007fb281124620:   jne    0x00007fb2811247f0
  0x00007fb281124626:   mov    0xc(%r10),%r10d
  0x00007fb28112462a:   test   %r10d,%r10d
  0x00007fb28112462d:   jl     0x00007fb2811247f0
  0x00007fb281124633:   mov    0x8(%rdx),%r10d              ; implicit exception: dispatches to 0x00007fb2811247f0
  0x00007fb281124637:   nopw   0x0(%rax,%rax,1)
  0x00007fb281124640:   cmp    $0x104f788,%r10d             ;   {metadata('jdk/internal/foreign/NativeMemorySegmentImpl')}
  0x00007fb281124647:   jne    0x00007fb2811247f0
  0x00007fb28112464d:   mov    %rdx,%rdi
  0x00007fb281124650:   movzbl 0xc(%rdi),%r10d
  0x00007fb281124655:   test   %r10d,%r10d
  0x00007fb281124658:   jne    0x00007fb2811247f0
  0x00007fb28112465e:   mov    $0xffffffffffffffc1,%rdx
  0x00007fb281124665:   add    0x10(%rdi),%rdx
  0x00007fb281124669:   test   %rdx,%rdx
  0x00007fb28112466c:   jl     0x00007fb2811247f0
  0x00007fb281124672:   mov    0x18(%rdi),%r11d
  0x00007fb281124676:   data16 nopw 0x0(%rax,%rax,1)
  0x00007fb281124680:   mov    0x8(%r12,%r11,8),%r10d       ; implicit exception: dispatches to 0x00007fb2811247f0
  0x00007fb281124685:   cmp    $0x104d890,%r10d             ;   {metadata('jdk/internal/foreign/MemorySessionImpl$GlobalSessionImpl')}
  0x00007fb28112468c:   jne    0x00007fb2811247f0
  0x00007fb281124692:   lea    (%r12,%r11,8),%r10
  0x00007fb281124696:   cmp    0x18(%r10),%r12d
  0x00007fb28112469a:   nopw   0x0(%rax,%rax,1)
  0x00007fb2811246a0:   jne    0x00007fb2811247f0
  0x00007fb2811246a6:   mov    0xc(%r10),%r10d
  0x00007fb2811246aa:   test   %r10d,%r10d
  0x00007fb2811246ad:   jl     0x00007fb2811247f0
  0x00007fb2811246b3:   mov    0x20(%rdi),%r10
  0x00007fb2811246b7:   mov    0x20(%r9),%r11
  0x00007fb2811246bb:   mov    %r11,%rsi
  0x00007fb2811246be:   mov    %r10,%r13
  0x00007fb2811246c1:   vbroadcastss %xmm2,%zmm1
  0x00007fb2811246c7:   xor    %eax,%eax
  0x00007fb2811246c9:   nopl   0x0(%rax)
  0x00007fb2811246d0:   movslq %ecx,%r10
  0x00007fb2811246d3:   cmp    %rbx,%r10
  0x00007fb2811246d6:   jae    0x00007fb281124752
  0x00007fb2811246dc:   mov    %ecx,%r10d
  0x00007fb2811246df:   mov    %eax,%r11d
  0x00007fb2811246e2:   shl    $0x2,%r11d
  0x00007fb2811246e6:   movslq %r10d,%r10
  0x00007fb2811246e9:   vmovdqu32 (%rsi,%r10,1),%zmm3
  0x00007fb2811246f0:   vcmpge_oqps %zmm1,%zmm3,%k7
  0x00007fb2811246f7:   vcompressps %zmm3,%zmm3{%k7}{z}
  0x00007fb2811246fd:   movslq %r11d,%r10
  0x00007fb281124700:   kmovq  %k7,%r14
  0x00007fb281124705:   popcnt %r14,%rbp
  0x00007fb28112470a:   cmp    %rdx,%r10
  0x00007fb28112470d:   jae    0x00007fb281124788
  0x00007fb281124713:   add    %ebp,%eax
  0x00007fb281124715:   add    $0x40,%ecx
  0x00007fb281124718:   movslq %r11d,%r10
  0x00007fb28112471b:   vmovdqu32 %zmm3,0x0(%r13,%r10,1)
  0x00007fb281124723:   mov    0x380(%r15),%r10             ; ImmutableOopMap {r9=Oop rdi=Oop xmm0=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) FloatColumnFilter::VectorFloatColumnFilterMS@89 (line 40)
  0x00007fb28112472a:   test   %eax,(%r10)                  ;   {poll}
  0x00007fb28112472d:   movslq %ecx,%r10
  0x00007fb281124730:   cmp    %r8,%r10
  0x00007fb281124733:   jl     0x00007fb2811246d0
  0x00007fb281124735:   vzeroupper 
  0x00007fb281124738:   add    $0x90,%rsp
  0x00007fb28112473f:   pop    %rbp
  0x00007fb281124740:   cmp    0x378(%r15),%rsp             ;   {poll_return}
  0x00007fb281124747:   ja     0x00007fb281124844
  0x00007fb28112474d:   retq   
  0x00007fb28112474e:   xor    %eax,%eax
  0x00007fb281124750:   jmp    0x00007fb281124735
  0x00007fb281124752:   mov    $0xffffffe4,%esi
  0x00007fb281124757:   mov    %eax,%ebp
  0x00007fb281124759:   mov    %ecx,(%rsp)
  0x00007fb28112475c:   mov    %r10,0x8(%rsp)
  0x00007fb281124761:   mov    %rbx,0x10(%rsp)
  0x00007fb281124766:   vmovsd %xmm0,0x20(%rsp)
  0x00007fb28112476c:   vmovss %xmm2,0x4(%rsp)
  0x00007fb281124772:   mov    %r9,0x28(%rsp)
  0x00007fb281124777:   nop
  0x00007fb281124778:   vzeroupper 
  0x00007fb28112477b:   callq  0x00007fb281005600           ; ImmutableOopMap {[32]=Oop [40]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 461)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@45 (line 67)
                                                            ; - jdk.incubator.vector.FloatVector::fromMemorySegment@14 (line 2984)
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@28 (line 41)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fb281124780:   nopl   0x1000370(%rax,%rax,1)       ;   {other}
  0x00007fb281124788:   mov    $0xffffffe4,%esi
  0x00007fb28112478d:   mov    %eax,(%rsp)
  0x00007fb281124790:   mov    %ecx,0x4(%rsp)
  0x00007fb281124794:   mov    %r9,0x8(%rsp)
  0x00007fb281124799:   vmovsd %xmm0,0x10(%rsp)
  0x00007fb28112479f:   vmovss %xmm2,0x18(%rsp)
  0x00007fb2811247a5:   mov    %rdi,0x20(%rsp)
  0x00007fb2811247aa:   mov    %r10,0x28(%rsp)
  0x00007fb2811247af:   mov    %rdx,0x30(%rsp)
  0x00007fb2811247b4:   vmovdqu64 %zmm3,0x40(%rsp)
  0x00007fb2811247bc:   vzeroupper 
  0x00007fb2811247bf:   callq  0x00007fb281005600           ; ImmutableOopMap {[8]=Oop [16]=Oop [32]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 461)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@45 (line 67)
                                                            ; - jdk.incubator.vector.FloatVector::intoMemorySegment@32 (line 3232)
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@66 (line 44)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fb2811247c4:   nopl   0x20003b4(%rax,%rax,1)       ;   {other}
  0x00007fb2811247cc:   mov    $0xffffffde,%esi
  0x00007fb2811247d1:   mov    %rdx,(%rsp)
  0x00007fb2811247d5:   vmovss %xmm2,0x8(%rsp)
  0x00007fb2811247db:   mov    %r9,0x10(%rsp)
  0x00007fb2811247e0:   vzeroupper 
  0x00007fb2811247e3:   callq  0x00007fb281005600           ; ImmutableOopMap {[0]=Oop [16]=Oop }
                                                            ;*invokeinterface byteSize {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@9 (line 40)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fb2811247e8:   nopl   0x30003d8(%rax,%rax,1)       ;   {other}
  0x00007fb2811247f0:   mov    $0xffffff76,%esi
  0x00007fb2811247f5:   xor    %r10d,%r10d
  0x00007fb2811247f8:   cmp    %r8,%r10
  0x00007fb2811247fb:   mov    $0xffffffff,%ebp
  0x00007fb281124800:   jl     0x00007fb28112480a
  0x00007fb281124802:   setne  %bpl
  0x00007fb281124806:   movzbl %bpl,%ebp
  0x00007fb28112480a:   mov    %r9,(%rsp)
  0x00007fb28112480e:   vmovsd %xmm0,0x8(%rsp)
  0x00007fb281124814:   vmovss %xmm2,0x10(%rsp)
  0x00007fb28112481a:   xchg   %ax,%ax
  0x00007fb28112481c:   vzeroupper 
  0x00007fb28112481f:   callq  0x00007fb281005600           ; ImmutableOopMap {[0]=Oop [8]=Oop }
                                                            ;*ifge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) FloatColumnFilter::VectorFloatColumnFilterMS@15 (line 40)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fb281124824:   nopl   0x4000414(%rax,%rax,1)       ;   {other}
  0x00007fb28112482c:   mov    $0xfffffff6,%esi
  0x00007fb281124831:   data16 xchg %ax,%ax
  0x00007fb281124834:   vzeroupper 
  0x00007fb281124837:   callq  0x00007fb281005600           ; ImmutableOopMap {}
                                                            ;*invokeinterface byteSize {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilterMS@9 (line 40)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007fb28112483c:   nopl   0x500042c(%rax,%rax,1)       ;   {other}
  0x00007fb281124844:   movabs $0x7fb281124740,%r10         ;   {internal_word}
  0x00007fb28112484e:   mov    %r10,0x390(%r15)
  0x00007fb281124855:   jmpq   0x00007fb281054780           ;   {runtime_call SafepointBlob}
  0x00007fb28112485a:   callq  Stub::nmethod_entry_barrier  ;   {runtime_call StubRoutines (2)}
  0x00007fb28112485f:   jmpq   0x00007fb2811245be
  0x00007fb281124864:   hlt    
  0x00007fb281124865:   hlt    
  0x00007fb281124866:   hlt    
  0x00007fb281124867:   hlt    
[Exception Handler]
  0x00007fb281124868:   jmpq   0x00007fb281086500           ;   {no_reloc}
[Deopt Handler Code]
  0x00007fb28112486d:   callq  0x00007fb281124872
  0x00007fb281124872:   subq   $0x5,(%rsp)
  0x00007fb281124877:   jmpq   0x00007fb281055c20           ;   {runtime_call DeoptimizationBlob}
  0x00007fb28112487c:   hlt    
  0x00007fb28112487d:   hlt    
  0x00007fb28112487e:   hlt    
  0x00007fb28112487f:   hlt    
--------------------------------------------------------------------------------
[/Disassembly]
[VectorMS Time] 49ms [Res] 20480.0

 Performance counter stats for 'java --enable-preview -XX:-TieredCompilation --add-modules=jdk.incubator.vector -XX:CompileCommand=Print,FloatColumnFilter::VectorFloatColumnFilterMS -cp . FloatColumnFilter 4096 0.5 2 0':

            986.37 msec task-clock                #    2.688 CPUs utilized          
               656      context-switches          #    0.665 K/sec                  
                19      cpu-migrations            #    0.019 K/sec                  
            20,663      page-faults               #    0.021 M/sec                  
    2,21,74,00,187      cycles                    #    2.248 GHz                    
    3,61,51,69,806      instructions              #    1.63  insn per cycle         
      61,49,30,279      branches                  #  623.424 M/sec                  
       2,06,41,485      branch-misses             #    3.36% of all branches        

       0.366992679 seconds time elapsed

       0.913048000 seconds user
       0.088489000 seconds sys


