CompileCommand: print App.micro_scalar
OpenJDK 64-Bit Server VM warning: printing of assembly code is enabled; turning on DebugNonSafepoints to gain additional output

============================= C2-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2)     288  101 %           App::micro_scalar @ 3 (30 bytes)
 total in heap  [0x00007f1f950b1810,0x00007f1f950b20a0] = 2192
 relocation     [0x00007f1f950b1968,0x00007f1f950b1990] = 40
 main code      [0x00007f1f950b19a0,0x00007f1f950b1d40] = 928
 stub code      [0x00007f1f950b1d40,0x00007f1f950b1d58] = 24
 oops           [0x00007f1f950b1d58,0x00007f1f950b1d60] = 8
 metadata       [0x00007f1f950b1d60,0x00007f1f950b1d70] = 16
 scopes data    [0x00007f1f950b1d70,0x00007f1f950b1e58] = 232
 scopes pcs     [0x00007f1f950b1e58,0x00007f1f950b2078] = 544
 dependencies   [0x00007f1f950b2078,0x00007f1f950b2080] = 8
 nul chk table  [0x00007f1f950b2080,0x00007f1f950b20a0] = 32

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007f1f3dc116d0} 'micro_scalar' '([I[I[I)V' in 'App'
  0x00007f1f950b19a0:   callq  0x00007f1f9fe7cba0           ;   {runtime_call os::breakpoint()}
  0x00007f1f950b19a5:   data16 data16 nopw 0x0(%rax,%rax,1)
  0x00007f1f950b19b0:   mov    %eax,-0x14000(%rsp)
  0x00007f1f950b19b7:   push   %rbp
  0x00007f1f950b19b8:   sub    $0x40,%rsp
  0x00007f1f950b19bc:   mov    0x18(%rsi),%r14
  0x00007f1f950b19c0:   mov    0x10(%rsi),%rbp
  0x00007f1f950b19c4:   mov    (%rsi),%ebx
  0x00007f1f950b19c6:   mov    0x8(%rsi),%r13
  0x00007f1f950b19ca:   mov    %rsi,%rdi
  0x00007f1f950b19cd:   vzeroupper 
  0x00007f1f950b19d0:   movabs $0x7f1f9ff4b850,%r10
  0x00007f1f950b19da:   callq  *%r10
  0x00007f1f950b19dd:   data16 xchg %ax,%ax
  0x00007f1f950b19e0:   test   %r14,%r14
  0x00007f1f950b19e3:   je     0x00007f1f950b1ce4
  0x00007f1f950b19e9:   mov    0x8(%r14),%r10d
  0x00007f1f950b19ed:   cmp    $0x40bd0,%r10d               ;   {metadata({type array int})}
  0x00007f1f950b19f4:   jne    0x00007f1f950b1cfc
  0x00007f1f950b19fa:   mov    %r14,%r11
  0x00007f1f950b19fd:   data16 xchg %ax,%ax
  0x00007f1f950b1a00:   test   %rbp,%rbp
  0x00007f1f950b1a03:   je     0x00007f1f950b1cec
  0x00007f1f950b1a09:   mov    0x8(%rbp),%r8d
  0x00007f1f950b1a0d:   cmp    $0x40bd0,%r8d                ;   {metadata({type array int})}
  0x00007f1f950b1a14:   jne    0x00007f1f950b1cfc
  0x00007f1f950b1a1a:   mov    %rbp,%r9
  0x00007f1f950b1a1d:   data16 xchg %ax,%ax
  0x00007f1f950b1a20:   test   %r13,%r13
  0x00007f1f950b1a23:   je     0x00007f1f950b1cf4
  0x00007f1f950b1a29:   mov    0x8(%r13),%r10d
  0x00007f1f950b1a2d:   cmp    $0x40bd0,%r10d               ;   {metadata({type array int})}
  0x00007f1f950b1a34:   jne    0x00007f1f950b1cfc           ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
  0x00007f1f950b1a3a:   nopw   0x0(%rax,%rax,1)
  0x00007f1f950b1a40:   mov    0xc(%r11),%eax               ; implicit exception: dispatches to 0x00007f1f950b1d18
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@6 (line 9)
  0x00007f1f950b1a44:   mov    0xc(%r9),%ebp                ; implicit exception: dispatches to 0x00007f1f950b1d18
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007f1f950b1a48:   mov    0xc(%r13),%edx               ; implicit exception: dispatches to 0x00007f1f950b1d18
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
  0x00007f1f950b1a4c:   cmp    %eax,%ebx
  0x00007f1f950b1a4e:   jge    0x00007f1f950b1c51           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
  0x00007f1f950b1a54:   mov    %r11d,%esi
  0x00007f1f950b1a57:   mov    %ebx,%r8d
  0x00007f1f950b1a5a:   inc    %r8d
  0x00007f1f950b1a5d:   shr    $0x2,%esi
  0x00007f1f950b1a60:   and    $0xf,%esi
  0x00007f1f950b1a63:   xor    %r10d,%r10d
  0x00007f1f950b1a66:   cmp    %r10d,%r8d
  0x00007f1f950b1a69:   cmovl  %r10d,%r8d
  0x00007f1f950b1a6d:   cmp    %r10d,%r8d
  0x00007f1f950b1a70:   cmovl  %r10d,%r8d
  0x00007f1f950b1a74:   cmp    %eax,%r8d
  0x00007f1f950b1a77:   cmovg  %eax,%r8d
  0x00007f1f950b1a7b:   add    %r8d,%esi
  0x00007f1f950b1a7e:   mov    $0xc,%r14d
  0x00007f1f950b1a84:   sub    %esi,%r14d
  0x00007f1f950b1a87:   and    $0xf,%r14d
  0x00007f1f950b1a8b:   add    %r8d,%r14d
  0x00007f1f950b1a8e:   cmp    %eax,%r14d
  0x00007f1f950b1a91:   cmovg  %eax,%r14d                   ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b1a95:   cmp    %ebp,%ebx
  0x00007f1f950b1a97:   jae    0x00007f1f950b1c74
  0x00007f1f950b1a9d:   mov    0x10(%r9,%rbx,4),%r8d        ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007f1f950b1aa2:   cmp    %edx,%ebx
  0x00007f1f950b1aa4:   jae    0x00007f1f950b1c98
  0x00007f1f950b1aaa:   add    0x10(%r13,%rbx,4),%r8d       ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@21 (line 10)
  0x00007f1f950b1aaf:   cmp    %eax,%ebx
  0x00007f1f950b1ab1:   jae    0x00007f1f950b1cc0
  0x00007f1f950b1ab7:   mov    %r8d,0x10(%r11,%rbx,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b1abc:   inc    %ebx                         ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f1f950b1abe:   xchg   %ax,%ax
  0x00007f1f950b1ac0:   cmp    %r14d,%ebx
  0x00007f1f950b1ac3:   jl     0x00007f1f950b1a95           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
  0x00007f1f950b1ac5:   cmp    %edx,%ebp
  0x00007f1f950b1ac7:   mov    %ebp,%esi
  0x00007f1f950b1ac9:   cmovg  %edx,%esi
  0x00007f1f950b1acc:   cmp    %eax,%esi
  0x00007f1f950b1ace:   cmovg  %eax,%esi
  0x00007f1f950b1ad1:   mov    %esi,%r8d
  0x00007f1f950b1ad4:   add    $0xffffffc1,%r8d
  0x00007f1f950b1ad8:   mov    $0x80000000,%r14d
  0x00007f1f950b1ade:   cmp    %r8d,%esi
  0x00007f1f950b1ae1:   cmovl  %r14d,%r8d
  0x00007f1f950b1ae5:   cmp    %r8d,%ebx
  0x00007f1f950b1ae8:   jge    0x00007f1f950b1c0d
  0x00007f1f950b1aee:   mov    $0xfa00,%edi
  0x00007f1f950b1af3:   jmp    0x00007f1f950b1b0d           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
  0x00007f1f950b1af5:   mov    0x120(%r15),%rcx             ; ImmutableOopMap {r11=Oop r9=Oop r13=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@26 (line 9)
  0x00007f1f950b1afc:   test   %eax,(%rcx)                  ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
                                                            ;   {poll}
  0x00007f1f950b1afe:   xchg   %ax,%ax
  0x00007f1f950b1b00:   cmp    %r8d,%ebx
  0x00007f1f950b1b03:   jge    0x00007f1f950b1bcb
  0x00007f1f950b1b09:   vmovd  %xmm0,%edx
  0x00007f1f950b1b0d:   mov    %r8d,%ecx
  0x00007f1f950b1b10:   sub    %ebx,%ecx
  0x00007f1f950b1b12:   cmp    %ebx,%r8d
  0x00007f1f950b1b15:   cmovl  %r10d,%ecx
  0x00007f1f950b1b19:   cmp    $0xfa00,%ecx
  0x00007f1f950b1b1f:   cmova  %edi,%ecx
  0x00007f1f950b1b22:   add    %ebx,%ecx
  0x00007f1f950b1b24:   vmovd  %edx,%xmm0
  0x00007f1f950b1b28:   nopl   0x0(%rax,%rax,1)
  0x00007f1f950b1b30:   vmovdqu32 0x10(%r9,%rbx,4),%zmm1
  0x00007f1f950b1b3b:   vpaddd 0x10(%r13,%rbx,4),%zmm1,%zmm1
  0x00007f1f950b1b46:   vmovdqu32 %zmm1,0x10(%r11,%rbx,4)
  0x00007f1f950b1b51:   movslq %ebx,%rdx
  0x00007f1f950b1b54:   vmovdqu32 0x50(%r9,%rdx,4),%zmm1
  0x00007f1f950b1b5f:   vpaddd 0x50(%r13,%rdx,4),%zmm1,%zmm1
  0x00007f1f950b1b6a:   vmovdqu32 %zmm1,0x50(%r11,%rdx,4)
  0x00007f1f950b1b75:   vmovdqu32 0x90(%r9,%rdx,4),%zmm1
  0x00007f1f950b1b80:   vpaddd 0x90(%r13,%rdx,4),%zmm1,%zmm1
  0x00007f1f950b1b8b:   vmovdqu32 %zmm1,0x90(%r11,%rdx,4)
  0x00007f1f950b1b96:   vmovdqu32 0xd0(%r9,%rdx,4),%zmm1
  0x00007f1f950b1ba1:   vpaddd 0xd0(%r13,%rdx,4),%zmm1,%zmm1
  0x00007f1f950b1bac:   vmovdqu32 %zmm1,0xd0(%r11,%rdx,4)   ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b1bb7:   add    $0x40,%ebx                   ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f1f950b1bba:   cmp    %ecx,%ebx
  0x00007f1f950b1bbc:   nopl   0x0(%rax)
  0x00007f1f950b1bc0:   jl     0x00007f1f950b1b30           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
  0x00007f1f950b1bc6:   jmpq   0x00007f1f950b1af5
  0x00007f1f950b1bcb:   mov    %esi,%r8d
  0x00007f1f950b1bce:   add    $0xfffffff1,%r8d
  0x00007f1f950b1bd2:   cmp    %r8d,%esi
  0x00007f1f950b1bd5:   cmovl  %r14d,%r8d
  0x00007f1f950b1bd9:   cmp    %r8d,%ebx
  0x00007f1f950b1bdc:   jge    0x00007f1f950b1c09
  0x00007f1f950b1bde:   xchg   %ax,%ax
  0x00007f1f950b1be0:   vmovdqu32 0x10(%r9,%rbx,4),%zmm1
  0x00007f1f950b1beb:   vpaddd 0x10(%r13,%rbx,4),%zmm1,%zmm1
  0x00007f1f950b1bf6:   vmovdqu32 %zmm1,0x10(%r11,%rbx,4)   ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b1c01:   add    $0x10,%ebx                   ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f1f950b1c04:   cmp    %r8d,%ebx
  0x00007f1f950b1c07:   jl     0x00007f1f950b1be0           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
  0x00007f1f950b1c09:   vmovd  %xmm0,%edx
  0x00007f1f950b1c0d:   cmp    %eax,%ebx
  0x00007f1f950b1c0f:   jge    0x00007f1f950b1c51
  0x00007f1f950b1c15:   data16 xchg %ax,%ax                 ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b1c18:   cmp    %ebp,%ebx
  0x00007f1f950b1c1a:   nopw   0x0(%rax,%rax,1)
  0x00007f1f950b1c20:   jae    0x00007f1f950b1c74
  0x00007f1f950b1c26:   mov    0x10(%r9,%rbx,4),%r8d        ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007f1f950b1c2b:   cmp    %edx,%ebx
  0x00007f1f950b1c2d:   jae    0x00007f1f950b1c98
  0x00007f1f950b1c33:   add    0x10(%r13,%rbx,4),%r8d       ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@21 (line 10)
  0x00007f1f950b1c38:   cmp    %eax,%ebx
  0x00007f1f950b1c3a:   nopw   0x0(%rax,%rax,1)
  0x00007f1f950b1c40:   jae    0x00007f1f950b1cc0
  0x00007f1f950b1c46:   mov    %r8d,0x10(%r11,%rbx,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b1c4b:   inc    %ebx                         ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f1f950b1c4d:   cmp    %eax,%ebx
  0x00007f1f950b1c4f:   jl     0x00007f1f950b1c18           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
  0x00007f1f950b1c51:   mov    $0xffffff45,%esi
  0x00007f1f950b1c56:   mov    %r11,%rbp
  0x00007f1f950b1c59:   mov    %r9,(%rsp)
  0x00007f1f950b1c5d:   mov    %r13,0x8(%rsp)
  0x00007f1f950b1c62:   mov    %ebx,0x14(%rsp)
  0x00007f1f950b1c66:   mov    %eax,0x18(%rsp)
  0x00007f1f950b1c6a:   xchg   %ax,%ax
  0x00007f1f950b1c6c:   vzeroupper 
  0x00007f1f950b1c6f:   callq  0x00007f1f9504f880           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@7 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f1f950b1c74:   mov    $0xffffffe4,%esi
  0x00007f1f950b1c79:   mov    %r13,0x8(%rsp)
  0x00007f1f950b1c7e:   mov    %r11,0x18(%rsp)
  0x00007f1f950b1c83:   mov    %ebx,0x14(%rsp)
  0x00007f1f950b1c87:   mov    %r9,0x20(%rsp)
  0x00007f1f950b1c8c:   mov    %ebx,0x28(%rsp)
  0x00007f1f950b1c90:   vzeroupper 
  0x00007f1f950b1c93:   callq  0x00007f1f9504f880           ; ImmutableOopMap {[8]=Oop [24]=Oop [32]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f1f950b1c98:   mov    $0xffffffe4,%esi
  0x00007f1f950b1c9d:   mov    %r9,(%rsp)
  0x00007f1f950b1ca1:   mov    %r11,0x18(%rsp)
  0x00007f1f950b1ca6:   mov    %ebx,0x14(%rsp)
  0x00007f1f950b1caa:   mov    %r8d,0x20(%rsp)
  0x00007f1f950b1caf:   mov    %r13,0x28(%rsp)
  0x00007f1f950b1cb4:   mov    %ebx,0x24(%rsp)
  0x00007f1f950b1cb8:   vzeroupper 
  0x00007f1f950b1cbb:   callq  0x00007f1f9504f880           ; ImmutableOopMap {[0]=Oop [24]=Oop [40]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f1f950b1cc0:   mov    $0xffffffe4,%esi
  0x00007f1f950b1cc5:   mov    %r9,(%rsp)
  0x00007f1f950b1cc9:   mov    %r13,0x8(%rsp)
  0x00007f1f950b1cce:   mov    %r11,0x18(%rsp)
  0x00007f1f950b1cd3:   mov    %ebx,0x14(%rsp)
  0x00007f1f950b1cd7:   mov    %r8d,0x20(%rsp)
  0x00007f1f950b1cdc:   vzeroupper 
  0x00007f1f950b1cdf:   callq  0x00007f1f9504f880           ; ImmutableOopMap {[0]=Oop [8]=Oop [24]=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f1f950b1ce4:   xor    %r11d,%r11d
  0x00007f1f950b1ce7:   jmpq   0x00007f1f950b19fd
  0x00007f1f950b1cec:   xor    %r9d,%r9d
  0x00007f1f950b1cef:   jmpq   0x00007f1f950b1a1d
  0x00007f1f950b1cf4:   xor    %r13d,%r13d
  0x00007f1f950b1cf7:   jmpq   0x00007f1f950b1a3a
  0x00007f1f950b1cfc:   mov    $0xffffff8d,%esi
  0x00007f1f950b1d01:   mov    %r13,(%rsp)
  0x00007f1f950b1d05:   mov    %ebx,0x8(%rsp)
  0x00007f1f950b1d09:   mov    %r14,0x10(%rsp)
  0x00007f1f950b1d0e:   xchg   %ax,%ax
  0x00007f1f950b1d10:   vzeroupper 
  0x00007f1f950b1d13:   callq  0x00007f1f9504f880           ; ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f1f950b1d18:   mov    $0xffffff76,%esi
  0x00007f1f950b1d1d:   mov    %r11,%rbp
  0x00007f1f950b1d20:   mov    %r9,(%rsp)
  0x00007f1f950b1d24:   mov    %r13,0x8(%rsp)
  0x00007f1f950b1d29:   mov    %ebx,0x10(%rsp)
  0x00007f1f950b1d2d:   data16 xchg %ax,%ax
  0x00007f1f950b1d30:   vzeroupper 
  0x00007f1f950b1d33:   callq  0x00007f1f9504f880           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f1f950b1d38:   hlt    
  0x00007f1f950b1d39:   hlt    
  0x00007f1f950b1d3a:   hlt    
  0x00007f1f950b1d3b:   hlt    
  0x00007f1f950b1d3c:   hlt    
  0x00007f1f950b1d3d:   hlt    
  0x00007f1f950b1d3e:   hlt    
  0x00007f1f950b1d3f:   hlt    
[Exception Handler]
  0x00007f1f950b1d40:   jmpq   0x00007f1f95064b80           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f1f950b1d45:   callq  0x00007f1f950b1d4a
  0x00007f1f950b1d4a:   subq   $0x5,(%rsp)
  0x00007f1f950b1d4f:   jmpq   0x00007f1f9504f2a0           ;   {runtime_call DeoptimizationBlob}
  0x00007f1f950b1d54:   hlt    
  0x00007f1f950b1d55:   hlt    
  0x00007f1f950b1d56:   hlt    
  0x00007f1f950b1d57:   hlt    
--------------------------------------------------------------------------------

============================= C2-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2)     301  102 %           App::micro_scalar @ 3 (30 bytes)
 total in heap  [0x00007f1f950b0f10,0x00007f1f950b17a8] = 2200
 relocation     [0x00007f1f950b1068,0x00007f1f950b1098] = 48
 main code      [0x00007f1f950b10a0,0x00007f1f950b1460] = 960
 stub code      [0x00007f1f950b1460,0x00007f1f950b1478] = 24
 oops           [0x00007f1f950b1478,0x00007f1f950b1480] = 8
 metadata       [0x00007f1f950b1480,0x00007f1f950b1490] = 16
 scopes data    [0x00007f1f950b1490,0x00007f1f950b1560] = 208
 scopes pcs     [0x00007f1f950b1560,0x00007f1f950b1780] = 544
 dependencies   [0x00007f1f950b1780,0x00007f1f950b1788] = 8
 nul chk table  [0x00007f1f950b1788,0x00007f1f950b17a8] = 32

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007f1f3dc116d0} 'micro_scalar' '([I[I[I)V' in 'App'
  0x00007f1f950b10a0:   callq  0x00007f1f9fe7cba0           ;   {runtime_call os::breakpoint()}
  0x00007f1f950b10a5:   data16 data16 nopw 0x0(%rax,%rax,1)
  0x00007f1f950b10b0:   mov    %eax,-0x14000(%rsp)
  0x00007f1f950b10b7:   push   %rbp
  0x00007f1f950b10b8:   sub    $0x50,%rsp
  0x00007f1f950b10bc:   mov    0x18(%rsi),%r14
  0x00007f1f950b10c0:   mov    0x10(%rsi),%rbp
  0x00007f1f950b10c4:   mov    (%rsi),%r13d
  0x00007f1f950b10c7:   mov    0x8(%rsi),%rbx
  0x00007f1f950b10cb:   mov    %rsi,%rdi
  0x00007f1f950b10ce:   vzeroupper 
  0x00007f1f950b10d1:   movabs $0x7f1f9ff4b850,%r10
  0x00007f1f950b10db:   callq  *%r10
  0x00007f1f950b10de:   xchg   %ax,%ax
  0x00007f1f950b10e0:   test   %r14,%r14
  0x00007f1f950b10e3:   je     0x00007f1f950b135c
  0x00007f1f950b10e9:   mov    0x8(%r14),%r11d
  0x00007f1f950b10ed:   cmp    $0x40bd0,%r11d               ;   {metadata({type array int})}
  0x00007f1f950b10f4:   jne    0x00007f1f950b13e8
  0x00007f1f950b10fa:   mov    %r14,%r11
  0x00007f1f950b10fd:   data16 xchg %ax,%ax
  0x00007f1f950b1100:   test   %rbp,%rbp
  0x00007f1f950b1103:   je     0x00007f1f950b1365
  0x00007f1f950b1109:   mov    0x8(%rbp),%r10d
  0x00007f1f950b110d:   cmp    $0x40bd0,%r10d               ;   {metadata({type array int})}
  0x00007f1f950b1114:   jne    0x00007f1f950b13e8
  0x00007f1f950b111a:   mov    %rbp,%r8
  0x00007f1f950b111d:   data16 xchg %ax,%ax
  0x00007f1f950b1120:   test   %rbx,%rbx
  0x00007f1f950b1123:   je     0x00007f1f950b136d
  0x00007f1f950b1129:   mov    0x8(%rbx),%r9d
  0x00007f1f950b112d:   cmp    $0x40bd0,%r9d                ;   {metadata({type array int})}
  0x00007f1f950b1134:   jne    0x00007f1f950b13e8           ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
  0x00007f1f950b113a:   nopw   0x0(%rax,%rax,1)
  0x00007f1f950b1140:   mov    0xc(%r11),%r14d              ; implicit exception: dispatches to 0x00007f1f950b1424
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@6 (line 9)
  0x00007f1f950b1144:   mov    0xc(%r8),%edx                ; implicit exception: dispatches to 0x00007f1f950b1404
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007f1f950b1148:   mov    0xc(%rbx),%edi               ; implicit exception: dispatches to 0x00007f1f950b1404
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
  0x00007f1f950b114b:   cmp    %r14d,%r13d
  0x00007f1f950b114e:   jge    0x00007f1f950b1346           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
  0x00007f1f950b1154:   mov    %r11d,%r10d
  0x00007f1f950b1157:   mov    %r13d,%ecx
  0x00007f1f950b115a:   inc    %ecx
  0x00007f1f950b115c:   shr    $0x2,%r10d
  0x00007f1f950b1160:   and    $0xf,%r10d
  0x00007f1f950b1164:   xor    %r9d,%r9d
  0x00007f1f950b1167:   cmp    %r9d,%ecx
  0x00007f1f950b116a:   cmovl  %r9d,%ecx
  0x00007f1f950b116e:   cmp    %r9d,%ecx
  0x00007f1f950b1171:   cmovl  %r9d,%ecx
  0x00007f1f950b1175:   cmp    %r14d,%ecx
  0x00007f1f950b1178:   cmovg  %r14d,%ecx
  0x00007f1f950b117c:   add    %ecx,%r10d
  0x00007f1f950b117f:   mov    $0xc,%esi
  0x00007f1f950b1184:   sub    %r10d,%esi
  0x00007f1f950b1187:   and    $0xf,%esi
  0x00007f1f950b118a:   add    %ecx,%esi
  0x00007f1f950b118c:   cmp    %r14d,%esi
  0x00007f1f950b118f:   cmovg  %r14d,%esi                   ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b1193:   cmp    %edx,%r13d
  0x00007f1f950b1196:   jae    0x00007f1f950b1374
  0x00007f1f950b119c:   mov    0x10(%r8,%r13,4),%ebp        ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007f1f950b11a1:   cmp    %edi,%r13d
  0x00007f1f950b11a4:   jae    0x00007f1f950b139c
  0x00007f1f950b11aa:   add    0x10(%rbx,%r13,4),%ebp       ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@21 (line 10)
  0x00007f1f950b11af:   cmp    %r14d,%r13d
  0x00007f1f950b11b2:   jae    0x00007f1f950b13c4
  0x00007f1f950b11b8:   mov    %ebp,0x10(%r11,%r13,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b11bd:   inc    %r13d                        ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f1f950b11c0:   cmp    %esi,%r13d
  0x00007f1f950b11c3:   jl     0x00007f1f950b1193           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
  0x00007f1f950b11c5:   cmp    %edi,%edx
  0x00007f1f950b11c7:   mov    %edx,%esi
  0x00007f1f950b11c9:   cmovg  %edi,%esi
  0x00007f1f950b11cc:   cmp    %r14d,%esi
  0x00007f1f950b11cf:   cmovg  %r14d,%esi
  0x00007f1f950b11d3:   mov    %esi,%r10d
  0x00007f1f950b11d6:   add    $0xffffffc1,%r10d
  0x00007f1f950b11da:   mov    $0x80000000,%ebp
  0x00007f1f950b11df:   cmp    %r10d,%esi
  0x00007f1f950b11e2:   cmovl  %ebp,%r10d
  0x00007f1f950b11e6:   cmp    %r10d,%r13d
  0x00007f1f950b11e9:   jge    0x00007f1f950b130a           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
  0x00007f1f950b11ef:   mov    $0xfa00,%ecx
  0x00007f1f950b11f4:   jmp    0x00007f1f950b11fa
  0x00007f1f950b11f6:   vmovd  %xmm1,%edi
  0x00007f1f950b11fa:   mov    %r10d,%eax
  0x00007f1f950b11fd:   sub    %r13d,%eax
  0x00007f1f950b1200:   cmp    %r13d,%r10d
  0x00007f1f950b1203:   cmovl  %r9d,%eax
  0x00007f1f950b1207:   cmp    $0xfa00,%eax
  0x00007f1f950b120d:   cmova  %ecx,%eax
  0x00007f1f950b1210:   add    %r13d,%eax
  0x00007f1f950b1213:   vmovd  %edi,%xmm1
  0x00007f1f950b1217:   nopw   0x0(%rax,%rax,1)
  0x00007f1f950b1220:   vmovdqu32 0x10(%rbx,%r13,4),%zmm0
  0x00007f1f950b122b:   vpaddd 0x10(%r8,%r13,4),%zmm0,%zmm0
  0x00007f1f950b1236:   vmovdqu32 %zmm0,0x10(%r11,%r13,4)
  0x00007f1f950b1241:   movslq %r13d,%rdi
  0x00007f1f950b1244:   vmovdqu32 0x50(%rbx,%rdi,4),%zmm0
  0x00007f1f950b124f:   vpaddd 0x50(%r8,%rdi,4),%zmm0,%zmm0
  0x00007f1f950b125a:   vmovdqu32 %zmm0,0x50(%r11,%rdi,4)
  0x00007f1f950b1265:   vmovdqu32 0x90(%rbx,%rdi,4),%zmm0
  0x00007f1f950b1270:   vpaddd 0x90(%r8,%rdi,4),%zmm0,%zmm0
  0x00007f1f950b127b:   vmovdqu32 %zmm0,0x90(%r11,%rdi,4)
  0x00007f1f950b1286:   vmovdqu32 0xd0(%rbx,%rdi,4),%zmm0
  0x00007f1f950b1291:   vpaddd 0xd0(%r8,%rdi,4),%zmm0,%zmm0
  0x00007f1f950b129c:   vmovdqu32 %zmm0,0xd0(%r11,%rdi,4)   ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b12a7:   add    $0x40,%r13d                  ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f1f950b12ab:   cmp    %eax,%r13d
  0x00007f1f950b12ae:   jl     0x00007f1f950b1220           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
  0x00007f1f950b12b4:   mov    0x120(%r15),%rdi             ; ImmutableOopMap {r11=Oop r8=Oop rbx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@26 (line 9)
  0x00007f1f950b12bb:   test   %eax,(%rdi)                  ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
                                                            ;   {poll}
  0x00007f1f950b12bd:   data16 xchg %ax,%ax
  0x00007f1f950b12c0:   cmp    %r10d,%r13d
  0x00007f1f950b12c3:   jl     0x00007f1f950b11f6
  0x00007f1f950b12c9:   mov    %esi,%r10d
  0x00007f1f950b12cc:   add    $0xfffffff1,%r10d
  0x00007f1f950b12d0:   cmp    %r10d,%esi
  0x00007f1f950b12d3:   cmovl  %ebp,%r10d
  0x00007f1f950b12d7:   cmp    %r10d,%r13d
  0x00007f1f950b12da:   jge    0x00007f1f950b1306
  0x00007f1f950b12dc:   vmovdqu32 0x10(%rbx,%r13,4),%zmm0
  0x00007f1f950b12e7:   vpaddd 0x10(%r8,%r13,4),%zmm0,%zmm0
  0x00007f1f950b12f2:   vmovdqu32 %zmm0,0x10(%r11,%r13,4)   ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b12fd:   add    $0x10,%r13d                  ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f1f950b1301:   cmp    %r10d,%r13d
  0x00007f1f950b1304:   jl     0x00007f1f950b12dc           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
  0x00007f1f950b1306:   vmovd  %xmm1,%edi
  0x00007f1f950b130a:   cmp    %r14d,%r13d
  0x00007f1f950b130d:   jge    0x00007f1f950b1346
  0x00007f1f950b1313:   nop                                 ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b1314:   cmp    %edx,%r13d
  0x00007f1f950b1317:   jae    0x00007f1f950b1374
  0x00007f1f950b131d:   mov    0x10(%r8,%r13,4),%ebp        ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007f1f950b1322:   cmp    %edi,%r13d
  0x00007f1f950b1325:   jae    0x00007f1f950b139c
  0x00007f1f950b132b:   add    0x10(%rbx,%r13,4),%ebp       ;*iadd {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@21 (line 10)
  0x00007f1f950b1330:   cmp    %r14d,%r13d
  0x00007f1f950b1333:   jae    0x00007f1f950b13c4
  0x00007f1f950b1339:   mov    %ebp,0x10(%r11,%r13,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b133e:   inc    %r13d                        ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f1f950b1341:   cmp    %r14d,%r13d
  0x00007f1f950b1344:   jl     0x00007f1f950b1314           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
  0x00007f1f950b1346:   vzeroupper 
  0x00007f1f950b1349:   add    $0x50,%rsp
  0x00007f1f950b134d:   pop    %rbp
  0x00007f1f950b134e:   cmp    0x118(%r15),%rsp             ;   {poll_return}
  0x00007f1f950b1355:   ja     0x00007f1f950b1444
  0x00007f1f950b135b:   retq   
  0x00007f1f950b135c:   xor    %r11d,%r11d
  0x00007f1f950b135f:   nop
  0x00007f1f950b1360:   jmpq   0x00007f1f950b10fd
  0x00007f1f950b1365:   xor    %r8d,%r8d
  0x00007f1f950b1368:   jmpq   0x00007f1f950b111d
  0x00007f1f950b136d:   xor    %ebx,%ebx
  0x00007f1f950b136f:   jmpq   0x00007f1f950b113a
  0x00007f1f950b1374:   mov    $0xffffffe4,%esi
  0x00007f1f950b1379:   mov    %rbx,0x8(%rsp)
  0x00007f1f950b137e:   mov    %r11,0x18(%rsp)
  0x00007f1f950b1383:   mov    %r13d,0x14(%rsp)
  0x00007f1f950b1388:   mov    %r8,0x20(%rsp)
  0x00007f1f950b138d:   mov    %r13d,0x28(%rsp)
  0x00007f1f950b1392:   xchg   %ax,%ax
  0x00007f1f950b1394:   vzeroupper 
  0x00007f1f950b1397:   callq  0x00007f1f9504f880           ; ImmutableOopMap {[8]=Oop [24]=Oop [32]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f1f950b139c:   mov    $0xffffffe4,%esi
  0x00007f1f950b13a1:   mov    %r8,0x8(%rsp)
  0x00007f1f950b13a6:   mov    %r11,0x20(%rsp)
  0x00007f1f950b13ab:   mov    %r13d,0x1c(%rsp)
  0x00007f1f950b13b0:   mov    %rbx,0x28(%rsp)
  0x00007f1f950b13b5:   mov    %r13d,0x30(%rsp)
  0x00007f1f950b13ba:   xchg   %ax,%ax
  0x00007f1f950b13bc:   vzeroupper 
  0x00007f1f950b13bf:   callq  0x00007f1f9504f880           ; ImmutableOopMap {[8]=Oop [32]=Oop [40]=Oop }
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f1f950b13c4:   mov    $0xffffffe4,%esi
  0x00007f1f950b13c9:   mov    %r8,0x8(%rsp)
  0x00007f1f950b13ce:   mov    %rbx,0x10(%rsp)
  0x00007f1f950b13d3:   mov    %r11,0x20(%rsp)
  0x00007f1f950b13d8:   mov    %r13d,0x1c(%rsp)
  0x00007f1f950b13dd:   data16 xchg %ax,%ax
  0x00007f1f950b13e0:   vzeroupper 
  0x00007f1f950b13e3:   callq  0x00007f1f9504f880           ; ImmutableOopMap {[8]=Oop [16]=Oop [32]=Oop }
                                                            ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f1f950b13e8:   mov    $0xffffff8d,%esi
  0x00007f1f950b13ed:   mov    %rbx,(%rsp)
  0x00007f1f950b13f1:   mov    %r13d,0x8(%rsp)
  0x00007f1f950b13f6:   mov    %r14,0x10(%rsp)
  0x00007f1f950b13fb:   nop
  0x00007f1f950b13fc:   vzeroupper 
  0x00007f1f950b13ff:   callq  0x00007f1f9504f880           ; ImmutableOopMap {rbp=Oop [0]=Oop [16]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f1f950b1404:   mov    $0xffffffbe,%esi
  0x00007f1f950b1409:   mov    %r11,%rbp
  0x00007f1f950b140c:   mov    %r8,(%rsp)
  0x00007f1f950b1410:   mov    %rbx,0x8(%rsp)
  0x00007f1f950b1415:   mov    %r13d,0x10(%rsp)
  0x00007f1f950b141a:   xchg   %ax,%ax
  0x00007f1f950b141c:   vzeroupper 
  0x00007f1f950b141f:   callq  0x00007f1f9504f880           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f1f950b1424:   mov    $0xffffff76,%esi
  0x00007f1f950b1429:   mov    %r11,%rbp
  0x00007f1f950b142c:   mov    %r8,(%rsp)
  0x00007f1f950b1430:   mov    %rbx,0x8(%rsp)
  0x00007f1f950b1435:   mov    %r13d,0x10(%rsp)
  0x00007f1f950b143a:   xchg   %ax,%ax
  0x00007f1f950b143c:   vzeroupper 
  0x00007f1f950b143f:   callq  0x00007f1f9504f880           ; ImmutableOopMap {rbp=Oop [0]=Oop [8]=Oop }
                                                            ;*iload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@3 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f1f950b1444:   movabs $0x7f1f950b134e,%r10         ;   {internal_word}
  0x00007f1f950b144e:   mov    %r10,0x3b0(%r15)
  0x00007f1f950b1455:   jmpq   0x00007f1f9504ee00           ;   {runtime_call SafepointBlob}
  0x00007f1f950b145a:   hlt    
  0x00007f1f950b145b:   hlt    
  0x00007f1f950b145c:   hlt    
  0x00007f1f950b145d:   hlt    
  0x00007f1f950b145e:   hlt    
  0x00007f1f950b145f:   hlt    
[Exception Handler]
  0x00007f1f950b1460:   jmpq   0x00007f1f95064b80           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f1f950b1465:   callq  0x00007f1f950b146a
  0x00007f1f950b146a:   subq   $0x5,(%rsp)
  0x00007f1f950b146f:   jmpq   0x00007f1f9504f2a0           ;   {runtime_call DeoptimizationBlob}
  0x00007f1f950b1474:   hlt    
  0x00007f1f950b1475:   hlt    
  0x00007f1f950b1476:   hlt    
  0x00007f1f950b1477:   hlt    
--------------------------------------------------------------------------------

============================= C2-compiled nmethod ==============================
----------------------------------- Assembly -----------------------------------

Compiled method (c2)     311  103             App::micro_scalar (30 bytes)
 total in heap  [0x00007f1f950b2110,0x00007f1f950b2758] = 1608
 relocation     [0x00007f1f950b2268,0x00007f1f950b2280] = 24
 main code      [0x00007f1f950b2280,0x00007f1f950b24e0] = 608
 stub code      [0x00007f1f950b24e0,0x00007f1f950b24f8] = 24
 oops           [0x00007f1f950b24f8,0x00007f1f950b2500] = 8
 metadata       [0x00007f1f950b2500,0x00007f1f950b2508] = 8
 scopes data    [0x00007f1f950b2508,0x00007f1f950b2580] = 120
 scopes pcs     [0x00007f1f950b2580,0x00007f1f950b2730] = 432
 dependencies   [0x00007f1f950b2730,0x00007f1f950b2738] = 8
 nul chk table  [0x00007f1f950b2738,0x00007f1f950b2758] = 32

--------------------------------------------------------------------------------
[Constant Pool (empty)]

--------------------------------------------------------------------------------

[Entry Point]
  # {method} {0x00007f1f3dc116d0} 'micro_scalar' '([I[I[I)V' in 'App'
  # this:     rsi:rsi   = 'App'
  # parm0:    rdx:rdx   = '[I'
  # parm1:    rcx:rcx   = '[I'
  # parm2:    r8:r8     = '[I'
  #           [sp+0x40]  (sp of caller)
  0x00007f1f950b2280:   mov    0x8(%rsi),%r10d
  0x00007f1f950b2284:   movabs $0x800000000,%r11
  0x00007f1f950b228e:   add    %r11,%r10
  0x00007f1f950b2291:   cmp    %r10,%rax
  0x00007f1f950b2294:   jne    0x00007f1f9504ca80           ;   {runtime_call ic_miss_stub}
  0x00007f1f950b229a:   xchg   %ax,%ax
  0x00007f1f950b229c:   nopl   0x0(%rax)
[Verified Entry Point]
  0x00007f1f950b22a0:   mov    %eax,-0x14000(%rsp)
  0x00007f1f950b22a7:   push   %rbp
  0x00007f1f950b22a8:   sub    $0x30,%rsp                   ;*synchronization entry
                                                            ; - App::micro_scalar@-1 (line 8)
  0x00007f1f950b22ac:   mov    0xc(%rdx),%ebp               ; implicit exception: dispatches to 0x00007f1f950b24a4
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@6 (line 9)
  0x00007f1f950b22af:   test   %ebp,%ebp
  0x00007f1f950b22b1:   jbe    0x00007f1f950b2471           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
  0x00007f1f950b22b7:   mov    0xc(%rcx),%r9d               ; implicit exception: dispatches to 0x00007f1f950b2487
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@16 (line 10)
  0x00007f1f950b22bb:   nopl   0x0(%rax,%rax,1)
  0x00007f1f950b22c0:   test   %r9d,%r9d
  0x00007f1f950b22c3:   jbe    0x00007f1f950b2487
  0x00007f1f950b22c9:   mov    %ebp,%r10d
  0x00007f1f950b22cc:   dec    %r10d
  0x00007f1f950b22cf:   cmp    %r9d,%r10d
  0x00007f1f950b22d2:   jae    0x00007f1f950b2487
  0x00007f1f950b22d8:   nopl   0x0(%rax,%rax,1)
  0x00007f1f950b22e0:   mov    0xc(%r8),%r9d                ; implicit exception: dispatches to 0x00007f1f950b2487
                                                            ;*iaload {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@20 (line 10)
  0x00007f1f950b22e4:   test   %r9d,%r9d
  0x00007f1f950b22e7:   jbe    0x00007f1f950b2487
  0x00007f1f950b22ed:   cmp    %r9d,%r10d
  0x00007f1f950b22f0:   jae    0x00007f1f950b2487
  0x00007f1f950b22f6:   cmp    %ebp,%r10d
  0x00007f1f950b22f9:   jae    0x00007f1f950b2487
  0x00007f1f950b22ff:   mov    %edx,%r9d
  0x00007f1f950b2302:   shr    $0x2,%r9d
  0x00007f1f950b2306:   and    $0xf,%r9d
  0x00007f1f950b230a:   mov    $0xb,%edi
  0x00007f1f950b230f:   sub    %r9d,%edi
  0x00007f1f950b2312:   and    $0xf,%edi
  0x00007f1f950b2315:   inc    %edi
  0x00007f1f950b2317:   cmp    %ebp,%edi
  0x00007f1f950b2319:   cmovg  %ebp,%edi
  0x00007f1f950b231c:   xor    %r11d,%r11d
  0x00007f1f950b231f:   xor    %ebx,%ebx                    ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 10)
  0x00007f1f950b2321:   mov    0x10(%r8,%rbx,4),%r9d
  0x00007f1f950b2326:   add    0x10(%rcx,%rbx,4),%r9d
  0x00007f1f950b232b:   mov    %r9d,0x10(%rdx,%rbx,4)       ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b2330:   inc    %ebx                         ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f1f950b2332:   cmp    %edi,%ebx
  0x00007f1f950b2334:   jl     0x00007f1f950b2321           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
  0x00007f1f950b2336:   mov    %ebp,%r9d
  0x00007f1f950b2339:   add    $0xffffffc1,%r9d
  0x00007f1f950b233d:   mov    $0x80000000,%r13d
  0x00007f1f950b2343:   cmp    %r9d,%r10d
  0x00007f1f950b2346:   cmovl  %r13d,%r9d
  0x00007f1f950b234a:   cmp    %r9d,%ebx
  0x00007f1f950b234d:   jge    0x00007f1f950b2455
  0x00007f1f950b2353:   mov    $0xfa00,%esi
  0x00007f1f950b2358:   mov    %r9d,%edi
  0x00007f1f950b235b:   sub    %ebx,%edi
  0x00007f1f950b235d:   cmp    %ebx,%r9d
  0x00007f1f950b2360:   cmovl  %r11d,%edi
  0x00007f1f950b2364:   cmp    $0xfa00,%edi
  0x00007f1f950b236a:   cmova  %esi,%edi
  0x00007f1f950b236d:   add    %ebx,%edi
  0x00007f1f950b236f:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 10)
  0x00007f1f950b2370:   vmovdqu32 0x10(%r8,%rbx,4),%zmm0
  0x00007f1f950b237b:   vpaddd 0x10(%rcx,%rbx,4),%zmm0,%zmm0
  0x00007f1f950b2386:   vmovdqu32 %zmm0,0x10(%rdx,%rbx,4)
  0x00007f1f950b2391:   movslq %ebx,%rax
  0x00007f1f950b2394:   vmovdqu32 0x50(%r8,%rax,4),%zmm0
  0x00007f1f950b239f:   vpaddd 0x50(%rcx,%rax,4),%zmm0,%zmm0
  0x00007f1f950b23aa:   vmovdqu32 %zmm0,0x50(%rdx,%rax,4)
  0x00007f1f950b23b5:   vmovdqu32 0x90(%r8,%rax,4),%zmm0
  0x00007f1f950b23c0:   vpaddd 0x90(%rcx,%rax,4),%zmm0,%zmm0
  0x00007f1f950b23cb:   vmovdqu32 %zmm0,0x90(%rdx,%rax,4)
  0x00007f1f950b23d6:   vmovdqu32 0xd0(%r8,%rax,4),%zmm0
  0x00007f1f950b23e1:   vpaddd 0xd0(%rcx,%rax,4),%zmm0,%zmm0
  0x00007f1f950b23ec:   vmovdqu32 %zmm0,0xd0(%rdx,%rax,4)   ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b23f7:   add    $0x40,%ebx                   ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f1f950b23fa:   cmp    %edi,%ebx
  0x00007f1f950b23fc:   nopl   0x0(%rax)
  0x00007f1f950b2400:   jl     0x00007f1f950b2370           ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
  0x00007f1f950b2406:   mov    0x120(%r15),%rdi             ; ImmutableOopMap {r8=Oop rcx=Oop rdx=Oop }
                                                            ;*goto {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@26 (line 9)
  0x00007f1f950b240d:   test   %eax,(%rdi)                  ;*goto {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@26 (line 9)
                                                            ;   {poll}
  0x00007f1f950b240f:   cmp    %r9d,%ebx
  0x00007f1f950b2412:   jl     0x00007f1f950b2358
  0x00007f1f950b2418:   mov    %ebp,%r9d
  0x00007f1f950b241b:   add    $0xfffffff1,%r9d
  0x00007f1f950b241f:   cmp    %r9d,%r10d
  0x00007f1f950b2422:   cmovl  %r13d,%r9d
  0x00007f1f950b2426:   cmp    %r9d,%ebx
  0x00007f1f950b2429:   jge    0x00007f1f950b2455
  0x00007f1f950b242b:   nop                                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 10)
  0x00007f1f950b242c:   vmovdqu32 0x10(%r8,%rbx,4),%zmm0
  0x00007f1f950b2437:   vpaddd 0x10(%rcx,%rbx,4),%zmm0,%zmm0
  0x00007f1f950b2442:   vmovdqu32 %zmm0,0x10(%rdx,%rbx,4)   ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b244d:   add    $0x10,%ebx                   ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f1f950b2450:   cmp    %r9d,%ebx
  0x00007f1f950b2453:   jl     0x00007f1f950b242c           ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
  0x00007f1f950b2455:   cmp    %ebp,%ebx
  0x00007f1f950b2457:   jge    0x00007f1f950b2471
  0x00007f1f950b2459:   data16 xchg %ax,%ax                 ;*aload_1 {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@10 (line 10)
  0x00007f1f950b245c:   mov    0x10(%r8,%rbx,4),%r10d
  0x00007f1f950b2461:   add    0x10(%rcx,%rbx,4),%r10d
  0x00007f1f950b2466:   mov    %r10d,0x10(%rdx,%rbx,4)      ;*iastore {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@22 (line 10)
  0x00007f1f950b246b:   inc    %ebx                         ;*iinc {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@23 (line 9)
  0x00007f1f950b246d:   cmp    %ebp,%ebx
  0x00007f1f950b246f:   jl     0x00007f1f950b245c
  0x00007f1f950b2471:   vzeroupper 
  0x00007f1f950b2474:   add    $0x30,%rsp
  0x00007f1f950b2478:   pop    %rbp
  0x00007f1f950b2479:   cmp    0x118(%r15),%rsp             ;   {poll_return}
  0x00007f1f950b2480:   ja     0x00007f1f950b24b4
  0x00007f1f950b2486:   retq                                ;*if_icmpge {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@7 (line 9)
  0x00007f1f950b2487:   mov    $0xffffff76,%esi
  0x00007f1f950b248c:   mov    %rdx,(%rsp)
  0x00007f1f950b2490:   mov    %rcx,0x8(%rsp)
  0x00007f1f950b2495:   mov    %r8,0x10(%rsp)
  0x00007f1f950b249a:   xchg   %ax,%ax
  0x00007f1f950b249c:   vzeroupper 
  0x00007f1f950b249f:   callq  0x00007f1f9504f880           ; ImmutableOopMap {[0]=Oop [8]=Oop [16]=Oop }
                                                            ;*if_icmpge {reexecute=1 rethrow=0 return_oop=0}
                                                            ; - (reexecute) App::micro_scalar@7 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f1f950b24a4:   mov    $0xfffffff6,%esi
  0x00007f1f950b24a9:   data16 xchg %ax,%ax
  0x00007f1f950b24ac:   vzeroupper 
  0x00007f1f950b24af:   callq  0x00007f1f9504f880           ; ImmutableOopMap {}
                                                            ;*arraylength {reexecute=0 rethrow=0 return_oop=0}
                                                            ; - App::micro_scalar@6 (line 9)
                                                            ;   {runtime_call UncommonTrapBlob}
  0x00007f1f950b24b4:   movabs $0x7f1f950b2479,%r10         ;   {internal_word}
  0x00007f1f950b24be:   mov    %r10,0x3b0(%r15)
  0x00007f1f950b24c5:   jmpq   0x00007f1f9504ee00           ;   {runtime_call SafepointBlob}
  0x00007f1f950b24ca:   hlt    
  0x00007f1f950b24cb:   hlt    
  0x00007f1f950b24cc:   hlt    
  0x00007f1f950b24cd:   hlt    
  0x00007f1f950b24ce:   hlt    
  0x00007f1f950b24cf:   hlt    
  0x00007f1f950b24d0:   hlt    
  0x00007f1f950b24d1:   hlt    
  0x00007f1f950b24d2:   hlt    
  0x00007f1f950b24d3:   hlt    
  0x00007f1f950b24d4:   hlt    
  0x00007f1f950b24d5:   hlt    
  0x00007f1f950b24d6:   hlt    
  0x00007f1f950b24d7:   hlt    
  0x00007f1f950b24d8:   hlt    
  0x00007f1f950b24d9:   hlt    
  0x00007f1f950b24da:   hlt    
  0x00007f1f950b24db:   hlt    
  0x00007f1f950b24dc:   hlt    
  0x00007f1f950b24dd:   hlt    
  0x00007f1f950b24de:   hlt    
  0x00007f1f950b24df:   hlt    
[Exception Handler]
  0x00007f1f950b24e0:   jmpq   0x00007f1f95064b80           ;   {no_reloc}
[Deopt Handler Code]
  0x00007f1f950b24e5:   callq  0x00007f1f950b24ea
  0x00007f1f950b24ea:   subq   $0x5,(%rsp)
  0x00007f1f950b24ef:   jmpq   0x00007f1f9504f2a0           ;   {runtime_call DeoptimizationBlob}
  0x00007f1f950b24f4:   hlt    
  0x00007f1f950b24f5:   hlt    
  0x00007f1f950b24f6:   hlt    
  0x00007f1f950b24f7:   hlt    
--------------------------------------------------------------------------------
SCALAR : [Time] 236 ms   [Res] 99999000000000
VECTOR : [Time] 223 ms   [Res] 99999000000000
VECTOR_MASKED : [Time] 229 ms   [Res] 99999000000000
