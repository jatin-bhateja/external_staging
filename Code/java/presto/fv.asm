CompileCommand: print FloatColumnFilter.VectorFloatColumnFilter bool print = true
WARNING: Using incubator modules: jdk.incubator.vector
Size = 4096
Selectivity = 0.5
Algo = Vector
Debug = false

============================= C2-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2)     198  259 %           FloatColumnFilter::VectorFloatColumnFilter @ 5 (76 bytes)
 total in heap  [0x00007f16f4947b10,0x00007f16f4948120] = 1552
 relocation     [0x00007f16f4947c60,0x00007f16f4947c98] = 56
 main code      [0x00007f16f4947ca0,0x00007f16f4947ef0] = 592
 stub code      [0x00007f16f4947ef0,0x00007f16f4947f08] = 24
 oops           [0x00007f16f4947f08,0x00007f16f4947f20] = 24
 metadata       [0x00007f16f4947f20,0x00007f16f4947fa8] = 136
 scopes data    [0x00007f16f4947fa8,0x00007f16f4948070] = 200
 scopes pcs     [0x00007f16f4948070,0x00007f16f49480f0] = 128
 dependencies   [0x00007f16f49480f0,0x00007f16f4948108] = 24
 nul chk table  [0x00007f16f4948108,0x00007f16f4948120] = 24

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007f16a0401c50} 'VectorFloatColumnFilter' '([F[FF)I' in 'FloatColumnFilter'
  0x00007f16f4947ca0:   callq  0x00007f16f878cf80           ;   {runtime_call os::breakpoint()}
  0x00007f16f4947ca5:   data16 data16 nopw 0x0(%rax,%rax,1)
  0x00007f16f4947cb0:   mov    %eax,-0x14000(%rsp)
  0x00007f16f4947cb7:   push   %rbp
  0x00007f16f4947cb8:   sub    $0x90,%rsp
  0x00007f16f4947cbf:   nop
  0x00007f16f4947cc0:   cmpl   $0x1,0x20(%r15)
  0x00007f16f4947cc8:   jne    0x00007f16f4947ee6
  0x00007f16f4947cce:   mov    0x38(%rsi),%rbp
  0x00007f16f4947cd2:   mov    0x30(%rsi),%r14
  0x00007f16f4947cd6:   mov    0x18(%rsi),%ebx
  0x00007f16f4947cd9:   vmovss 0x28(%rsi),%xmm1
  0x00007f16f4947cde:   vmovss %xmm1,(%rsp)
  0x00007f16f4947ce3:   mov    0x20(%rsi),%r13d
  0x00007f16f4947ce7:   mov    %rsi,%rdi
  0x00007f16f4947cea:   vzeroupper 
  0x00007f16f4947ced:   movabs $0x7f16f8848fd0,%r10
  0x00007f16f4947cf7:   callq  *%r10
  0x00007f16f4947cfa:   nopl   0x0(%rax,%rax,1)             ;   {other}
  0x00007f16f4947d02:   test   %rbp,%rbp
  0x00007f16f4947d05:   je     0x00007f16f4947e18
  0x00007f16f4947d0b:   mov    0x8(%rbp),%r11d
  0x00007f16f4947d0f:   cmp    $0x1e88,%r11d                ;   {metadata({type array float})}
  0x00007f16f4947d16:   jne    0x00007f16f4947e84
  0x00007f16f4947d1c:   mov    %rbp,%r9
  0x00007f16f4947d1f:   nop
  0x00007f16f4947d20:   test   %r14,%r14
  0x00007f16f4947d23:   je     0x00007f16f4947e25
  0x00007f16f4947d29:   mov    0x8(%r14),%r10d
  0x00007f16f4947d2d:   cmp    $0x1e88,%r10d                ;   {metadata({type array float})}
  0x00007f16f4947d34:   jne    0x00007f16f4947e84
  0x00007f16f4947d3a:   nopw   0x0(%rax,%rax,1)
  0x00007f16f4947d40:   mov    0xc(%r9),%r10d               ; implicit exception: dispatches to 0x00007f16f4947ea8
  0x00007f16f4947d44:   mov    %r10d,%r11d
  0x00007f16f4947d47:   add    $0xfffffff1,%r11d
  0x00007f16f4947d4b:   test   %r11d,%r11d
  0x00007f16f4947d4e:   jl     0x00007f16f4947e5c
  0x00007f16f4947d54:   mov    0xc(%r14),%r8d               ; implicit exception: dispatches to 0x00007f16f4947e5c
  0x00007f16f4947d58:   add    $0xfffffff1,%r8d
  0x00007f16f4947d5c:   nopl   0x0(%rax)
  0x00007f16f4947d60:   test   %r8d,%r8d
  0x00007f16f4947d63:   jl     0x00007f16f4947e5c
  0x00007f16f4947d69:   vbroadcastss (%rsp),%zmm0
  0x00007f16f4947d70:   jmp    0x00007f16f4947d8c
  0x00007f16f4947d72:   mov    0x380(%r15),%rcx
  0x00007f16f4947d79:   vmovdqu32 %zmm1,0x10(%r14,%r13,4)
  0x00007f16f4947d84:   add    %ebp,%r13d
  0x00007f16f4947d87:   add    $0x10,%ebx                   ; ImmutableOopMap {r9=Oop r14=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) FloatColumnFilter::VectorFloatColumnFilter@71 (line 28)
  0x00007f16f4947d8a:   test   %eax,(%rcx)                  ;   {poll}
  0x00007f16f4947d8c:   cmp    %r10d,%ebx
  0x00007f16f4947d8f:   jge    0x00007f16f4947dfc
  0x00007f16f4947d95:   cmp    %r11d,%ebx
  0x00007f16f4947d98:   jae    0x00007f16f4947e2d
  0x00007f16f4947d9e:   vmovdqu32 0x10(%r9,%rbx,4),%zmm1
  0x00007f16f4947da9:   vcmpge_oqps %zmm0,%zmm1,%k7
  0x00007f16f4947db0:   vcompressps %zmm1,%zmm1{%k7}{z}
  0x00007f16f4947db6:   kmovq  %k7,%rcx
  0x00007f16f4947dbb:   popcnt %rcx,%rbp
  0x00007f16f4947dc0:   cmp    %r8d,%r13d
  0x00007f16f4947dc3:   jb     0x00007f16f4947d72
  0x00007f16f4947dc5:   mov    $0xffffffe4,%esi
  0x00007f16f4947dca:   mov    %r9,0x8(%rsp)
  0x00007f16f4947dcf:   mov    %ebx,0x18(%rsp)
  0x00007f16f4947dd3:   mov    %r14,0x20(%rsp)
  0x00007f16f4947dd8:   mov    %r13d,0x1c(%rsp)
  0x00007f16f4947ddd:   mov    %r8d,0x28(%rsp)
  0x00007f16f4947de2:   vmovdqu64 %zmm1,0x40(%rsp)
  0x00007f16f4947dea:   xchg   %ax,%ax
  0x00007f16f4947dec:   vzeroupper 
  0x00007f16f4947def:   callq  0x00007f16f4840600           ; ImmutableOopMap {[8]=Oop [32]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.FloatVector::intoArray@7 (line 3070)
                                                            ; - FloatColumnFilter::VectorFloatColumnFilter@50 (line 32)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f16f4947df4:   nopl   0x10002e4(%rax,%rax,1)       ;   {other}
  0x00007f16f4947dfc:   mov    %r13d,%eax
  0x00007f16f4947dff:   vzeroupper 
  0x00007f16f4947e02:   add    $0x90,%rsp
  0x00007f16f4947e09:   pop    %rbp
  0x00007f16f4947e0a:   cmp    0x378(%r15),%rsp             ;   {poll_return}
  0x00007f16f4947e11:   ja     0x00007f16f4947ed0
  0x00007f16f4947e17:   retq   
  0x00007f16f4947e18:   xor    %r9d,%r9d
  0x00007f16f4947e1b:   nopl   0x0(%rax,%rax,1)
  0x00007f16f4947e20:   jmpq   0x00007f16f4947d1f
  0x00007f16f4947e25:   xor    %r14d,%r14d
  0x00007f16f4947e28:   jmpq   0x00007f16f4947d3a
  0x00007f16f4947e2d:   mov    $0xffffffe4,%esi
  0x00007f16f4947e32:   mov    %r14,0x8(%rsp)
  0x00007f16f4947e37:   mov    %r13d,0x4(%rsp)
  0x00007f16f4947e3c:   mov    %r9,0x18(%rsp)
  0x00007f16f4947e41:   mov    %ebx,0x14(%rsp)
  0x00007f16f4947e45:   mov    %r11d,0x20(%rsp)
  0x00007f16f4947e4a:   xchg   %ax,%ax
  0x00007f16f4947e4c:   vzeroupper 
  0x00007f16f4947e4f:   callq  0x00007f16f4840600           ; ImmutableOopMap {[8]=Oop [24]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.FloatVector::fromArray@9 (line 2797)
                                                            ; - FloatColumnFilter::VectorFloatColumnFilter@18 (line 29)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f16f4947e54:   nopl   0x2000344(%rax,%rax,1)       ;   {other}
  0x00007f16f4947e5c:   mov    $0xffffffbe,%esi
  0x00007f16f4947e61:   mov    %r9,%rbp
  0x00007f16f4947e64:   mov    %r14,0x8(%rsp)
  0x00007f16f4947e69:   mov    %r13d,0x4(%rsp)
  0x00007f16f4947e6e:   mov    %ebx,0x10(%rsp)
  0x00007f16f4947e72:   xchg   %ax,%ax
  0x00007f16f4947e74:   vzeroupper 
  0x00007f16f4947e77:   callq  0x00007f16f4840600           ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilter@5 (line 28)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f16f4947e7c:   nopl   0x300036c(%rax,%rax,1)       ;   {other}
  0x00007f16f4947e84:   mov    $0xffffff8d,%esi
  0x00007f16f4947e89:   mov    %r14,0x8(%rsp)
  0x00007f16f4947e8e:   mov    %r13d,0x4(%rsp)
  0x00007f16f4947e93:   mov    %ebx,0x10(%rsp)
  0x00007f16f4947e97:   nop
  0x00007f16f4947e98:   vzeroupper 
  0x00007f16f4947e9b:   callq  0x00007f16f4840600           ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilter@5 (line 28)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f16f4947ea0:   nopl   0x4000390(%rax,%rax,1)       ;   {other}
  0x00007f16f4947ea8:   mov    $0xffffff76,%esi
  0x00007f16f4947ead:   mov    %r9,%rbp
  0x00007f16f4947eb0:   mov    %r14,0x8(%rsp)
  0x00007f16f4947eb5:   mov    %r13d,0x4(%rsp)
  0x00007f16f4947eba:   mov    %ebx,0x10(%rsp)
  0x00007f16f4947ebe:   xchg   %ax,%ax
  0x00007f16f4947ec0:   vzeroupper 
  0x00007f16f4947ec3:   callq  0x00007f16f4840600           ; ImmutableOopMap {rbp=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilter@5 (line 28)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f16f4947ec8:   nopl   0x50003b8(%rax,%rax,1)       ;   {other}
  0x00007f16f4947ed0:   movabs $0x7f16f4947e0a,%r10         ;   {internal_word}
  0x00007f16f4947eda:   mov    %r10,0x390(%r15)
  0x00007f16f4947ee1:   jmpq   0x00007f16f488f780           ;   {runtime_call SafepointBlob}
  0x00007f16f4947ee6:   callq  Stub::nmethod_entry_barrier  ;   {runtime_call StubRoutines (2)}
  0x00007f16f4947eeb:   jmpq   0x00007f16f4947cce
[Exception Handler]
  0x00007f16f4947ef0:   jmpq   0x00007f16f48c1a80           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f16f4947ef5:   callq  0x00007f16f4947efa
  0x00007f16f4947efa:   subq   $0x5,(%rsp)
  0x00007f16f4947eff:   jmpq   0x00007f16f4890c20           ;   {runtime_call DeoptimizationBlob}
  0x00007f16f4947f04:   hlt    
  0x00007f16f4947f05:   hlt    
  0x00007f16f4947f06:   hlt    
  0x00007f16f4947f07:   hlt    
--------------------------------------------------------------------------------
[/Disassembly]

============================= C2-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2)     216  260             FloatColumnFilter::VectorFloatColumnFilter (76 bytes)
 total in heap  [0x00007f16f4946790,0x00007f16f4946ec8] = 1848
 relocation     [0x00007f16f49468e0,0x00007f16f4946908] = 40
 main code      [0x00007f16f4946920,0x00007f16f4946cd8] = 952
 stub code      [0x00007f16f4946cd8,0x00007f16f4946cf0] = 24
 oops           [0x00007f16f4946cf0,0x00007f16f4946d00] = 16
 metadata       [0x00007f16f4946d00,0x00007f16f4946d78] = 120
 scopes data    [0x00007f16f4946d78,0x00007f16f4946e28] = 176
 scopes pcs     [0x00007f16f4946e28,0x00007f16f4946e98] = 112
 dependencies   [0x00007f16f4946e98,0x00007f16f4946eb0] = 24
 nul chk table  [0x00007f16f4946eb0,0x00007f16f4946ec8] = 24

[Disassembly]
--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007f16a0401c50} 'VectorFloatColumnFilter' '([F[FF)I' in 'FloatColumnFilter'
  # parm0:    rsi:rsi   = '[F'
  # parm1:    rdx:rdx   = '[F'
  # parm2:    xmm0      = float
  #           [sp+0x90]  (sp of caller)
  0x00007f16f4946920:   mov    %eax,-0x14000(%rsp)
  0x00007f16f4946927:   push   %rbp
  0x00007f16f4946928:   sub    $0x80,%rsp
  0x00007f16f494692f:   nop
  0x00007f16f4946930:   cmpl   $0x1,0x20(%r15)
  0x00007f16f4946938:   jne    0x00007f16f4946cca
  0x00007f16f494693e:   xchg   %ax,%ax
  0x00007f16f4946940:   mov    0xc(%rsi),%r10d              ; implicit exception: dispatches to 0x00007f16f4946c9f
  0x00007f16f4946944:   xor    %eax,%eax
  0x00007f16f4946946:   test   %r10d,%r10d
  0x00007f16f4946949:   jbe    0x00007f16f4946bd1
  0x00007f16f494694f:   mov    %r10d,%r8d
  0x00007f16f4946952:   add    $0xfffffff1,%r8d
  0x00007f16f4946956:   test   %r8d,%r8d
  0x00007f16f4946959:   jl     0x00007f16f4946c34
  0x00007f16f494695f:   nop
  0x00007f16f4946960:   cmp    $0xf,%r10d
  0x00007f16f4946964:   je     0x00007f16f4946c34
  0x00007f16f494696a:   movslq %r10d,%r11
  0x00007f16f494696d:   mov    %r11,%r8
  0x00007f16f4946970:   add    $0xf,%r8
  0x00007f16f4946974:   add    $0xfffffffffffffff1,%r11
  0x00007f16f4946978:   and    $0xfffffffffffffff0,%r8
  0x00007f16f494697c:   mov    %r8d,%r8d
  0x00007f16f494697f:   movslq %r8d,%r8
  0x00007f16f4946982:   add    $0xfffffffffffffff0,%r8
  0x00007f16f4946986:   cmp    %r11,%r8
  0x00007f16f4946989:   jae    0x00007f16f4946c34
  0x00007f16f494698f:   mov    0xc(%rdx),%r8d               ; implicit exception: dispatches to 0x00007f16f4946c34
  0x00007f16f4946993:   mov    %r8d,%ebx
  0x00007f16f4946996:   add    $0xfffffff1,%ebx
  0x00007f16f4946999:   test   %ebx,%ebx
  0x00007f16f494699b:   nopl   0x0(%rax,%rax,1)
  0x00007f16f49469a0:   jl     0x00007f16f4946c34
  0x00007f16f49469a6:   cmp    $0x7ffffff0,%r10d
  0x00007f16f49469ad:   jg     0x00007f16f4946c5c
  0x00007f16f49469b3:   vmovdqu32 0x10(%rsi),%zmm1
  0x00007f16f49469bd:   vbroadcastss %xmm0,%zmm2
  0x00007f16f49469c3:   vcmpge_oqps %zmm2,%zmm1,%k7
  0x00007f16f49469ca:   vcompressps %zmm1,%zmm3{%k7}{z}
  0x00007f16f49469d0:   kmovq  %k7,%r11
  0x00007f16f49469d5:   popcnt %r11,%rcx
  0x00007f16f49469da:   nopw   0x0(%rax,%rax,1)
  0x00007f16f49469e0:   cmp    $0xf,%r8d
  0x00007f16f49469e4:   je     0x00007f16f4946c84
  0x00007f16f49469ea:   vmovdqu32 %zmm3,0x10(%rdx)
  0x00007f16f49469f4:   mov    %r10d,%r9d
  0x00007f16f49469f7:   add    $0xfffffff0,%r9d
  0x00007f16f49469fb:   mov    %r10d,%r11d
  0x00007f16f49469fe:   add    $0xffffffd0,%r11d
  0x00007f16f4946a02:   mov    $0x80000000,%r8d
  0x00007f16f4946a08:   cmp    %r11d,%r9d
  0x00007f16f4946a0b:   cmovl  %r8d,%r11d
  0x00007f16f4946a0f:   mov    $0x10,%ebp
  0x00007f16f4946a14:   cmp    $0x10,%r11d
  0x00007f16f4946a18:   jle    0x00007f16f4946b82
  0x00007f16f4946a1e:   mov    $0xfa00,%r9d
  0x00007f16f4946a24:   jmpq   0x00007f16f4946b5d
  0x00007f16f4946a29:   nopl   0x0(%rax)
  0x00007f16f4946a30:   vmovd  %xmm1,%r10d
  0x00007f16f4946a35:   vmovdqu32 0x10(%rsi,%rbp,4),%zmm1
  0x00007f16f4946a40:   vcmpge_oqps %zmm2,%zmm1,%k7
  0x00007f16f4946a47:   vcompressps %zmm1,%zmm3{%k7}{z}
  0x00007f16f4946a4d:   kmovq  %k7,%r13
  0x00007f16f4946a52:   popcnt %r13,%rdi
  0x00007f16f4946a57:   cmp    %ebx,%ecx
  0x00007f16f4946a59:   jae    0x00007f16f4946bed
  0x00007f16f4946a5f:   vmovd  %r10d,%xmm1
  0x00007f16f4946a64:   mov    %edi,%r10d
  0x00007f16f4946a67:   add    %ecx,%r10d
  0x00007f16f4946a6a:   movslq %ecx,%r13
  0x00007f16f4946a6d:   vmovdqu32 %zmm3,0x10(%rdx,%r13,4)
  0x00007f16f4946a78:   vmovdqu32 0x50(%rsi,%rbp,4),%zmm3
  0x00007f16f4946a83:   vcmpge_oqps %zmm2,%zmm3,%k7
  0x00007f16f4946a8a:   vcompressps %zmm3,%zmm3{%k7}{z}
  0x00007f16f4946a90:   kmovq  %k7,%r14
  0x00007f16f4946a95:   popcnt %r14,%rcx
  0x00007f16f4946a9a:   nopw   0x0(%rax,%rax,1)
  0x00007f16f4946aa0:   cmp    %ebx,%r10d
  0x00007f16f4946aa3:   jae    0x00007f16f4946bf7
  0x00007f16f4946aa9:   add    %r10d,%ecx
  0x00007f16f4946aac:   movslq %edi,%r10
  0x00007f16f4946aaf:   add    %r13,%r10
  0x00007f16f4946ab2:   vmovdqu32 %zmm3,0x10(%rdx,%r10,4)
  0x00007f16f4946abd:   vmovdqu32 0x90(%rsi,%rbp,4),%zmm3
  0x00007f16f4946ac8:   vcmpge_oqps %zmm2,%zmm3,%k7
  0x00007f16f4946acf:   vcompressps %zmm3,%zmm3{%k7}{z}
  0x00007f16f4946ad5:   kmovq  %k7,%r10
  0x00007f16f4946ada:   popcnt %r10,%rdi
  0x00007f16f4946adf:   nop
  0x00007f16f4946ae0:   cmp    %ebx,%ecx
  0x00007f16f4946ae2:   jae    0x00007f16f4946bea
  0x00007f16f4946ae8:   mov    %edi,%r10d
  0x00007f16f4946aeb:   add    %ecx,%r10d
  0x00007f16f4946aee:   movslq %ecx,%r13
  0x00007f16f4946af1:   vmovdqu32 %zmm3,0x10(%rdx,%r13,4)
  0x00007f16f4946afc:   vmovdqu32 0xd0(%rsi,%rbp,4),%zmm3
  0x00007f16f4946b07:   vcmpge_oqps %zmm2,%zmm3,%k7
  0x00007f16f4946b0e:   vcompressps %zmm3,%zmm3{%k7}{z}
  0x00007f16f4946b14:   kmovq  %k7,%r14
  0x00007f16f4946b19:   popcnt %r14,%rcx
  0x00007f16f4946b1e:   xchg   %ax,%ax                      ;   {no_reloc}
  0x00007f16f4946b20:   cmp    %ebx,%r10d
  0x00007f16f4946b23:   jae    0x00007f16f4946bf4
  0x00007f16f4946b29:   add    %r10d,%ecx
  0x00007f16f4946b2c:   movslq %edi,%r10
  0x00007f16f4946b2f:   add    %r13,%r10
  0x00007f16f4946b32:   vmovdqu32 %zmm3,0x10(%rdx,%r10,4)
  0x00007f16f4946b3d:   add    $0x40,%ebp
  0x00007f16f4946b40:   cmp    %r8d,%ebp
  0x00007f16f4946b43:   jl     0x00007f16f4946a30
  0x00007f16f4946b49:   mov    0x380(%r15),%r10             ; ImmutableOopMap {rdx=Oop rsi=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) FloatColumnFilter::VectorFloatColumnFilter@71 (line 28)
  0x00007f16f4946b50:   test   %eax,(%r10)                  ;   {poll}
  0x00007f16f4946b53:   cmp    %r11d,%ebp
  0x00007f16f4946b56:   jge    0x00007f16f4946b7d
  0x00007f16f4946b58:   vmovd  %xmm1,%r10d
  0x00007f16f4946b5d:   mov    %r11d,%r8d
  0x00007f16f4946b60:   sub    %ebp,%r8d
  0x00007f16f4946b63:   cmp    %ebp,%r11d
  0x00007f16f4946b66:   cmovl  %eax,%r8d
  0x00007f16f4946b6a:   cmp    $0xfa00,%r8d
  0x00007f16f4946b71:   cmova  %r9d,%r8d
  0x00007f16f4946b75:   add    %ebp,%r8d
  0x00007f16f4946b78:   jmpq   0x00007f16f4946a35
  0x00007f16f4946b7d:   vmovd  %xmm1,%r10d
  0x00007f16f4946b82:   cmp    %r10d,%ebp
  0x00007f16f4946b85:   jge    0x00007f16f4946bcf
  0x00007f16f4946b8b:   nop
  0x00007f16f4946b8c:   vmovdqu32 0x10(%rsi,%rbp,4),%zmm1
  0x00007f16f4946b97:   vcmpge_oqps %zmm2,%zmm1,%k7
  0x00007f16f4946b9e:   vcompressps %zmm1,%zmm1{%k7}{z}
  0x00007f16f4946ba4:   kmovq  %k7,%r11
  0x00007f16f4946ba9:   popcnt %r11,%rax
  0x00007f16f4946bae:   cmp    %ebx,%ecx
  0x00007f16f4946bb0:   jae    0x00007f16f4946c8e
  0x00007f16f4946bb6:   vmovdqu32 %zmm1,0x10(%rdx,%rcx,4)
  0x00007f16f4946bc1:   add    %ecx,%eax
  0x00007f16f4946bc3:   add    $0x10,%ebp
  0x00007f16f4946bc6:   cmp    %r10d,%ebp
  0x00007f16f4946bc9:   jge    0x00007f16f4946bd1
  0x00007f16f4946bcb:   mov    %eax,%ecx
  0x00007f16f4946bcd:   jmp    0x00007f16f4946b8c
  0x00007f16f4946bcf:   mov    %ecx,%eax
  0x00007f16f4946bd1:   vzeroupper 
  0x00007f16f4946bd4:   add    $0x80,%rsp
  0x00007f16f4946bdb:   pop    %rbp
  0x00007f16f4946bdc:   cmp    0x378(%r15),%rsp             ;   {poll_return}
  0x00007f16f4946be3:   ja     0x00007f16f4946cb4
  0x00007f16f4946be9:   retq   
  0x00007f16f4946bea:   add    $0x20,%ebp
  0x00007f16f4946bed:   mov    %ecx,%r10d
  0x00007f16f4946bf0:   mov    %edi,%ecx
  0x00007f16f4946bf2:   jmp    0x00007f16f4946bfa
  0x00007f16f4946bf4:   add    $0x20,%ebp
  0x00007f16f4946bf7:   add    $0x10,%ebp
  0x00007f16f4946bfa:   vmovdqu64 %zmm3,(%rsp)
  0x00007f16f4946c01:   mov    %rsi,0x40(%rsp)
  0x00007f16f4946c06:   mov    %ecx,0x54(%rsp)
  0x00007f16f4946c0a:   mov    %rdx,0x58(%rsp)
  0x00007f16f4946c0f:   mov    %r10d,0x60(%rsp)
  0x00007f16f4946c14:   mov    %ebx,0x64(%rsp)
  0x00007f16f4946c18:   vmovss %xmm0,0x68(%rsp)
  0x00007f16f4946c1e:   mov    $0xffffffe4,%esi
  0x00007f16f4946c23:   nop
  0x00007f16f4946c24:   vzeroupper 
  0x00007f16f4946c27:   callq  0x00007f16f4840600           ; ImmutableOopMap {[64]=Oop [88]=Oop }
                                                            ;*invokestatic checkIndex {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - java.util.Objects::checkIndex@3 (line 385)
                                                            ; - jdk.incubator.vector.VectorIntrinsics::checkFromIndexSize@43 (line 57)
                                                            ; - jdk.incubator.vector.FloatVector::intoArray@7 (line 3070)
                                                            ; - FloatColumnFilter::VectorFloatColumnFilter@50 (line 32)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f16f4946c2c:   nopl   0x100049c(%rax,%rax,1)       ;   {other}
  0x00007f16f4946c34:   mov    %rsi,%rbp
  0x00007f16f4946c37:   mov    %rdx,(%rsp)
  0x00007f16f4946c3b:   vmovss %xmm0,0x8(%rsp)
  0x00007f16f4946c41:   mov    %r10d,0xc(%rsp)
  0x00007f16f4946c46:   mov    $0xffffff76,%esi
  0x00007f16f4946c4b:   nop
  0x00007f16f4946c4c:   vzeroupper 
  0x00007f16f4946c4f:   callq  0x00007f16f4840600           ; ImmutableOopMap {rbp=Oop [0]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) FloatColumnFilter::VectorFloatColumnFilter@9 (line 28)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f16f4946c54:   nopl   0x20004c4(%rax,%rax,1)       ;   {other}
  0x00007f16f4946c5c:   mov    %rsi,%rbp
  0x00007f16f4946c5f:   mov    %rdx,(%rsp)
  0x00007f16f4946c63:   vmovss %xmm0,0x8(%rsp)
  0x00007f16f4946c69:   mov    %r10d,0xc(%rsp)
  0x00007f16f4946c6e:   mov    $0xffffff6e,%esi
  0x00007f16f4946c73:   nop
  0x00007f16f4946c74:   vzeroupper 
  0x00007f16f4946c77:   callq  0x00007f16f4840600           ; ImmutableOopMap {rbp=Oop [0]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) FloatColumnFilter::VectorFloatColumnFilter@9 (line 28)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f16f4946c7c:   nopl   0x30004ec(%rax,%rax,1)       ;   {other}
  0x00007f16f4946c84:   xor    %r10d,%r10d
  0x00007f16f4946c87:   xor    %ebp,%ebp
  0x00007f16f4946c89:   jmpq   0x00007f16f4946bfa
  0x00007f16f4946c8e:   vmovdqu64 %zmm1,(%rsp)
  0x00007f16f4946c95:   mov    %ecx,%r10d
  0x00007f16f4946c98:   mov    %eax,%ecx
  0x00007f16f4946c9a:   jmpq   0x00007f16f4946c01
  0x00007f16f4946c9f:   mov    $0xfffffff6,%esi
  0x00007f16f4946ca4:   vzeroupper 
  0x00007f16f4946ca7:   callq  0x00007f16f4840600           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - FloatColumnFilter::VectorFloatColumnFilter@8 (line 28)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f16f4946cac:   nopl   0x400051c(%rax,%rax,1)       ;   {other}
  0x00007f16f4946cb4:   movabs $0x7f16f4946bdc,%r10         ;   {internal_word}
  0x00007f16f4946cbe:   mov    %r10,0x390(%r15)
  0x00007f16f4946cc5:   jmpq   0x00007f16f488f780           ;   {runtime_call SafepointBlob}
  0x00007f16f4946cca:   callq  Stub::nmethod_entry_barrier  ;   {runtime_call StubRoutines (2)}
  0x00007f16f4946ccf:   jmpq   0x00007f16f494693e
  0x00007f16f4946cd4:   hlt    
  0x00007f16f4946cd5:   hlt    
  0x00007f16f4946cd6:   hlt    
  0x00007f16f4946cd7:   hlt    
[Exception Handler]
  0x00007f16f4946cd8:   jmpq   0x00007f16f48c1a80           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f16f4946cdd:   callq  0x00007f16f4946ce2
  0x00007f16f4946ce2:   subq   $0x5,(%rsp)
  0x00007f16f4946ce7:   jmpq   0x00007f16f4890c20           ;   {runtime_call DeoptimizationBlob}
  0x00007f16f4946cec:   hlt    
  0x00007f16f4946ced:   hlt    
  0x00007f16f4946cee:   hlt    
  0x00007f16f4946cef:   hlt    
--------------------------------------------------------------------------------
[/Disassembly]
[Vector Time] 92ms [Res] 20480.0

 Performance counter stats for 'java --enable-preview -XX:-TieredCompilation --add-modules=jdk.incubator.vector -XX:CompileCommand=Print,FloatColumnFilter::VectorFloatColumnFilter -cp . FloatColumnFilter 4096 0.5 1 0':

            965.29 msec task-clock                #    2.249 CPUs utilized          
               522      context-switches          #    0.541 K/sec                  
                28      cpu-migrations            #    0.029 K/sec                  
            17,708      page-faults               #    0.018 M/sec                  
    2,24,56,55,227      cycles                    #    2.326 GHz                    
    2,58,95,23,396      instructions              #    1.15  insn per cycle         
      45,10,01,257      branches                  #  467.220 M/sec                  
       1,69,91,221      branch-misses             #    3.77% of all branches        

       0.429232861 seconds time elapsed

       0.895728000 seconds user
       0.084731000 seconds sys


