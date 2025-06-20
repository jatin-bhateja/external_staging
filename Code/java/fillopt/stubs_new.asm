StubRoutines::jshort_fill [0x0000022007fbf7e0, 0x0000022007fbfb3e] (862 bytes)
--------------------------------------------------------------------------------
 ;; Entry:
  0x0000022007fbf7e0:   mov    %r15,%r9
  0x0000022007fbf7e3:   push   %rax
  0x0000022007fbf7e4:   push   %rdi
  0x0000022007fbf7e5:   push   %rsi
  0x0000022007fbf7e6:   push   %rdx
  0x0000022007fbf7e7:   push   %rcx
  0x0000022007fbf7e8:   push   %r8
  0x0000022007fbf7ea:   push   %r9
  0x0000022007fbf7ec:   push   %r10
  0x0000022007fbf7ee:   push   %r11
  0x0000022007fbf7f0:   sub    $0x20,%rsp
  0x0000022007fbf7f4:   test   $0xf,%esp
  0x0000022007fbf7fa:   je     Stub::jshort_fill+58 0x0000022007fbf81a
  0x0000022007fbf800:   sub    $0x8,%rsp
  0x0000022007fbf804:   movabs $0x7ff99be62350,%r10
  0x0000022007fbf80e:   callq  *%r10
  0x0000022007fbf811:   add    $0x8,%rsp
  0x0000022007fbf815:   jmpq   Stub::jshort_fill+71 0x0000022007fbf827
  0x0000022007fbf81a:   movabs $0x7ff99be62350,%r10
  0x0000022007fbf824:   callq  *%r10
  0x0000022007fbf827:   add    $0x20,%rsp
  0x0000022007fbf82b:   pop    %r11
  0x0000022007fbf82d:   pop    %r10
  0x0000022007fbf82f:   pop    %r9
  0x0000022007fbf831:   pop    %r8
  0x0000022007fbf833:   pop    %rcx
  0x0000022007fbf834:   pop    %rdx
  0x0000022007fbf835:   pop    %rsi
  0x0000022007fbf836:   pop    %rdi
  0x0000022007fbf837:   mov    %rax,%r15
  0x0000022007fbf83a:   pop    %rax
  0x0000022007fbf83b:   mov    %rdi,0x528(%r15)
  0x0000022007fbf842:   mov    %rsi,0x520(%r15)
  0x0000022007fbf849:   mov    %rcx,%rdi
  0x0000022007fbf84c:   mov    %rdx,%rsi
  0x0000022007fbf84f:   mov    %r8,%rdx
  0x0000022007fbf852:   push   %rbp
  0x0000022007fbf853:   mov    %rsp,%rbp
  0x0000022007fbf856:   cmp    $0x800,%rdx
  0x0000022007fbf85d:   jg     Stub::jshort_fill+463 0x0000022007fbf9af
  0x0000022007fbf863:   vpbroadcastw %esi,%ymm0
  0x0000022007fbf869:   cmp    $0x10,%rdx
  0x0000022007fbf86d:   jg     Stub::jshort_fill+174 0x0000022007fbf88e
  0x0000022007fbf86f:   movabs $0xffffffffffffffff,%rax
  0x0000022007fbf879:   bzhi   %rdx,%rax,%rax
  0x0000022007fbf87e:   kmovq  %rax,%k2
  0x0000022007fbf883:   vmovdqu16 %ymm0,(%rdi){%k2}
  0x0000022007fbf889:   jmpq   Stub::jshort_fill+752 0x0000022007fbfad0
  0x0000022007fbf88e:   cmp    $0x20,%rdx
  0x0000022007fbf892:   jg     Stub::jshort_fill+220 0x0000022007fbf8bc
  0x0000022007fbf894:   vmovdqu %ymm0,(%rdi)
  0x0000022007fbf898:   sub    $0x10,%rdx
  0x0000022007fbf89c:   movabs $0xffffffffffffffff,%rax
  0x0000022007fbf8a6:   bzhi   %rdx,%rax,%rax
  0x0000022007fbf8ab:   kmovq  %rax,%k2
  0x0000022007fbf8b0:   vmovdqu16 %ymm0,0x20(%rdi){%k2}
  0x0000022007fbf8b7:   jmpq   Stub::jshort_fill+752 0x0000022007fbfad0
  0x0000022007fbf8bc:   cmp    $0x30,%rdx
  0x0000022007fbf8c0:   jg     Stub::jshort_fill+271 0x0000022007fbf8ef
  0x0000022007fbf8c2:   vmovdqu %ymm0,(%rdi)
  0x0000022007fbf8c6:   vmovdqu %ymm0,0x20(%rdi)
  0x0000022007fbf8cb:   sub    $0x20,%rdx
  0x0000022007fbf8cf:   movabs $0xffffffffffffffff,%rax
  0x0000022007fbf8d9:   bzhi   %rdx,%rax,%rax
  0x0000022007fbf8de:   kmovq  %rax,%k2
  0x0000022007fbf8e3:   vmovdqu16 %ymm0,0x40(%rdi){%k2}
  0x0000022007fbf8ea:   jmpq   Stub::jshort_fill+752 0x0000022007fbfad0
  0x0000022007fbf8ef:   cmp    $0x40,%rdx
  0x0000022007fbf8f3:   jg     Stub::jshort_fill+331 0x0000022007fbf92b
  0x0000022007fbf8f9:   vmovdqu %ymm0,(%rdi)
  0x0000022007fbf8fd:   vmovdqu %ymm0,0x20(%rdi)
  0x0000022007fbf902:   vmovdqu %ymm0,0x40(%rdi)
  0x0000022007fbf907:   sub    $0x30,%rdx
  0x0000022007fbf90b:   movabs $0xffffffffffffffff,%rax
  0x0000022007fbf915:   bzhi   %rdx,%rax,%rax
  0x0000022007fbf91a:   kmovq  %rax,%k2
  0x0000022007fbf91f:   vmovdqu16 %ymm0,0x60(%rdi){%k2}
  0x0000022007fbf926:   jmpq   Stub::jshort_fill+752 0x0000022007fbfad0
  0x0000022007fbf92b:   mov    %rdi,%rax
  0x0000022007fbf92e:   and    $0x1f,%rax
  0x0000022007fbf932:   je     Stub::jshort_fill+392 0x0000022007fbf968
  0x0000022007fbf934:   neg    %rax
  0x0000022007fbf937:   add    $0x20,%rax
  0x0000022007fbf93b:   movabs $0xffffffffffffffff,%r8
  0x0000022007fbf945:   bzhi   %rax,%r8,%r8
  0x0000022007fbf94a:   kmovq  %r8,%k2
  0x0000022007fbf94f:   vmovdqu8 %ymm0,(%rdi){%k2}
  0x0000022007fbf955:   add    %rax,%rdi
  0x0000022007fbf958:   shr    %rax
  0x0000022007fbf95b:   sub    %rax,%rdx
  0x0000022007fbf95e:   cmp    $0x40,%rdx
  0x0000022007fbf962:   jl     Stub::jshort_fill+137 0x0000022007fbf869
  0x0000022007fbf968:   sub    $0x40,%rdx
  0x0000022007fbf96c:   nop
  0x0000022007fbf96d:   nop
  0x0000022007fbf96e:   nop
  0x0000022007fbf96f:   nop
  0x0000022007fbf970:   nop
  0x0000022007fbf971:   nop
  0x0000022007fbf972:   nop
  0x0000022007fbf973:   nop
  0x0000022007fbf974:   nop
  0x0000022007fbf975:   nop
  0x0000022007fbf976:   nop
  0x0000022007fbf977:   nop
  0x0000022007fbf978:   nop
  0x0000022007fbf979:   nop
  0x0000022007fbf97a:   nop
  0x0000022007fbf97b:   nop
  0x0000022007fbf97c:   nop
  0x0000022007fbf97d:   nop
  0x0000022007fbf97e:   nop
  0x0000022007fbf97f:   nop
  0x0000022007fbf980:   vmovdqu %ymm0,(%rdi)
  0x0000022007fbf984:   vmovdqu %ymm0,0x20(%rdi)
  0x0000022007fbf989:   vmovdqu %ymm0,0x40(%rdi)
  0x0000022007fbf98e:   vmovdqu %ymm0,0x60(%rdi)
  0x0000022007fbf993:   add    $0x80,%rdi
  0x0000022007fbf99a:   sub    $0x40,%rdx
  0x0000022007fbf99e:   jge    Stub::jshort_fill+416 0x0000022007fbf980
  0x0000022007fbf9a0:   add    $0x40,%rdx
  0x0000022007fbf9a4:   je     Stub::jshort_fill+752 0x0000022007fbfad0
  0x0000022007fbf9aa:   jmpq   Stub::jshort_fill+137 0x0000022007fbf869
  0x0000022007fbf9af:   vpbroadcastw %esi,%zmm0
  0x0000022007fbf9b5:   cmp    $0x20,%rdx
  0x0000022007fbf9b9:   jg     Stub::jshort_fill+506 0x0000022007fbf9da
  0x0000022007fbf9bb:   movabs $0xffffffffffffffff,%rax
  0x0000022007fbf9c5:   bzhi   %rdx,%rax,%rax
  0x0000022007fbf9ca:   kmovq  %rax,%k2
  0x0000022007fbf9cf:   vmovdqu16 %zmm0,(%rdi){%k2}
  0x0000022007fbf9d5:   jmpq   Stub::jshort_fill+752 0x0000022007fbfad0
  0x0000022007fbf9da:   cmp    $0x40,%rdx
  0x0000022007fbf9de:   jg     Stub::jshort_fill+554 0x0000022007fbfa0a
  0x0000022007fbf9e0:   vmovdqu64 %zmm0,(%rdi)
  0x0000022007fbf9e6:   sub    $0x20,%rdx
  0x0000022007fbf9ea:   movabs $0xffffffffffffffff,%rax
  0x0000022007fbf9f4:   bzhi   %rdx,%rax,%rax
  0x0000022007fbf9f9:   kmovq  %rax,%k2
  0x0000022007fbf9fe:   vmovdqu16 %zmm0,0x40(%rdi){%k2}
  0x0000022007fbfa05:   jmpq   Stub::jshort_fill+752 0x0000022007fbfad0
  0x0000022007fbfa0a:   cmp    $0x60,%rdx
  0x0000022007fbfa0e:   jg     Stub::jshort_fill+613 0x0000022007fbfa45
  0x0000022007fbfa14:   vmovdqu64 %zmm0,(%rdi)
  0x0000022007fbfa1a:   vmovdqu64 %zmm0,0x40(%rdi)
  0x0000022007fbfa21:   sub    $0x40,%rdx
  0x0000022007fbfa25:   movabs $0xffffffffffffffff,%rax
  0x0000022007fbfa2f:   bzhi   %rdx,%rax,%rax
  0x0000022007fbfa34:   kmovq  %rax,%k2
  0x0000022007fbfa39:   vmovdqu16 %zmm0,0x80(%rdi){%k2}
  0x0000022007fbfa40:   jmpq   Stub::jshort_fill+752 0x0000022007fbfad0
  0x0000022007fbfa45:   mov    %rdi,%rax
  0x0000022007fbfa48:   and    $0x3f,%rax
  0x0000022007fbfa4c:   je     Stub::jshort_fill+674 0x0000022007fbfa82
  0x0000022007fbfa4e:   neg    %rax
  0x0000022007fbfa51:   add    $0x40,%rax
  0x0000022007fbfa55:   movabs $0xffffffffffffffff,%r8
  0x0000022007fbfa5f:   bzhi   %rax,%r8,%r8
  0x0000022007fbfa64:   kmovq  %r8,%k2
  0x0000022007fbfa69:   vmovdqu8 %zmm0,(%rdi){%k2}
  0x0000022007fbfa6f:   add    %rax,%rdi
  0x0000022007fbfa72:   shr    %rax
  0x0000022007fbfa75:   sub    %rax,%rdx
  0x0000022007fbfa78:   cmp    $0x60,%rdx
  0x0000022007fbfa7c:   jl     Stub::jshort_fill+469 0x0000022007fbf9b5
  0x0000022007fbfa82:   sub    $0x60,%rdx
  0x0000022007fbfa86:   nop
  0x0000022007fbfa87:   nop
  0x0000022007fbfa88:   nop
  0x0000022007fbfa89:   nop
  0x0000022007fbfa8a:   nop
  0x0000022007fbfa8b:   nop
  0x0000022007fbfa8c:   nop
  0x0000022007fbfa8d:   nop
  0x0000022007fbfa8e:   nop
  0x0000022007fbfa8f:   nop
  0x0000022007fbfa90:   nop
  0x0000022007fbfa91:   nop
  0x0000022007fbfa92:   nop
  0x0000022007fbfa93:   nop
  0x0000022007fbfa94:   nop
  0x0000022007fbfa95:   nop
  0x0000022007fbfa96:   nop
  0x0000022007fbfa97:   nop
  0x0000022007fbfa98:   nop
  0x0000022007fbfa99:   nop
  0x0000022007fbfa9a:   nop
  0x0000022007fbfa9b:   nop
  0x0000022007fbfa9c:   nop
  0x0000022007fbfa9d:   nop
  0x0000022007fbfa9e:   nop
  0x0000022007fbfa9f:   nop
  0x0000022007fbfaa0:   vmovdqu64 %zmm0,(%rdi)
  0x0000022007fbfaa6:   vmovdqu64 %zmm0,0x40(%rdi)
  0x0000022007fbfaad:   vmovdqu64 %zmm0,0x80(%rdi)
  0x0000022007fbfab4:   add    $0xc0,%rdi
  0x0000022007fbfabb:   sub    $0x60,%rdx
  0x0000022007fbfabf:   jge    Stub::jshort_fill+704 0x0000022007fbfaa0
  0x0000022007fbfac1:   add    $0x60,%rdx
  0x0000022007fbfac5:   je     Stub::jshort_fill+752 0x0000022007fbfad0
  0x0000022007fbfacb:   jmpq   Stub::jshort_fill+469 0x0000022007fbf9b5
  0x0000022007fbfad0:   push   %rax
  0x0000022007fbfad1:   push   %rdi
  0x0000022007fbfad2:   push   %rsi
  0x0000022007fbfad3:   push   %rdx
  0x0000022007fbfad4:   push   %rcx
  0x0000022007fbfad5:   push   %r8
  0x0000022007fbfad7:   push   %r9
  0x0000022007fbfad9:   push   %r10
  0x0000022007fbfadb:   push   %r11
  0x0000022007fbfadd:   sub    $0x20,%rsp
  0x0000022007fbfae1:   test   $0xf,%esp
  0x0000022007fbfae7:   je     Stub::jshort_fill+807 0x0000022007fbfb07
  0x0000022007fbfaed:   sub    $0x8,%rsp
  0x0000022007fbfaf1:   movabs $0x7ff99be62350,%r10
  0x0000022007fbfafb:   callq  *%r10
  0x0000022007fbfafe:   add    $0x8,%rsp
  0x0000022007fbfb02:   jmpq   Stub::jshort_fill+820 0x0000022007fbfb14
  0x0000022007fbfb07:   movabs $0x7ff99be62350,%r10
  0x0000022007fbfb11:   callq  *%r10
  0x0000022007fbfb14:   add    $0x20,%rsp
  0x0000022007fbfb18:   pop    %r11
  0x0000022007fbfb1a:   pop    %r10
  0x0000022007fbfb1c:   pop    %r9
  0x0000022007fbfb1e:   pop    %r8
  0x0000022007fbfb20:   pop    %rcx
  0x0000022007fbfb21:   pop    %rdx
  0x0000022007fbfb22:   pop    %rsi
  0x0000022007fbfb23:   pop    %rdi
  0x0000022007fbfb24:   mov    %rax,%r15
  0x0000022007fbfb27:   pop    %rax
  0x0000022007fbfb28:   mov    0x520(%r15),%rsi
  0x0000022007fbfb2f:   mov    0x528(%r15),%rdi
  0x0000022007fbfb36:   mov    %r9,%r15
  0x0000022007fbfb39:   vzeroupper 
  0x0000022007fbfb3c:   leaveq 
  0x0000022007fbfb3d:   retq   
--------------------------------------------------------------------------------
- - - [END] - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
