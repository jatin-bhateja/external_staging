StubRoutines::jshort_fill [0x00007f41c50b33a0, 0x00007f41c50b3655] (693 bytes)
--------------------------------------------------------------------------------
 ;; Entry:
  0x00007f41c50b33a0:   push   %rbp
  0x00007f41c50b33a1:   mov    %rsp,%rbp
  0x00007f41c50b33a4:   cmp    $0x800,%rdx
  0x00007f41c50b33ab:   jg     Stub::jshort_fill+367 0x00007f41c50b350f
  0x00007f41c50b33b1:   vpbroadcastw %esi,%ymm0
  0x00007f41c50b33b7:   cmp    $0x10,%rdx
  0x00007f41c50b33bb:   jg     Stub::jshort_fill+60 0x00007f41c50b33dc
  0x00007f41c50b33bd:   movabs $0xffffffffffffffff,%rax
  0x00007f41c50b33c7:   bzhi   %rdx,%rax,%rax
  0x00007f41c50b33cc:   kmovq  %rax,%k2
  0x00007f41c50b33d1:   vmovdqu16 %ymm0,(%rdi){%k2}
  0x00007f41c50b33d7:   jmpq   Stub::jshort_fill+688 0x00007f41c50b3650
  0x00007f41c50b33dc:   cmp    $0x20,%rdx
  0x00007f41c50b33e0:   jg     Stub::jshort_fill+106 0x00007f41c50b340a
  0x00007f41c50b33e2:   vmovdqu %ymm0,(%rdi)
  0x00007f41c50b33e6:   sub    $0x10,%rdx
  0x00007f41c50b33ea:   movabs $0xffffffffffffffff,%rax
  0x00007f41c50b33f4:   bzhi   %rdx,%rax,%rax
  0x00007f41c50b33f9:   kmovq  %rax,%k2
  0x00007f41c50b33fe:   vmovdqu16 %ymm0,0x20(%rdi){%k2}
  0x00007f41c50b3405:   jmpq   Stub::jshort_fill+688 0x00007f41c50b3650
  0x00007f41c50b340a:   cmp    $0x30,%rdx
  0x00007f41c50b340e:   jg     Stub::jshort_fill+157 0x00007f41c50b343d
  0x00007f41c50b3410:   vmovdqu %ymm0,(%rdi)
  0x00007f41c50b3414:   vmovdqu %ymm0,0x20(%rdi)
  0x00007f41c50b3419:   sub    $0x20,%rdx
  0x00007f41c50b341d:   movabs $0xffffffffffffffff,%rax
  0x00007f41c50b3427:   bzhi   %rdx,%rax,%rax
  0x00007f41c50b342c:   kmovq  %rax,%k2
  0x00007f41c50b3431:   vmovdqu16 %ymm0,0x40(%rdi){%k2}
  0x00007f41c50b3438:   jmpq   Stub::jshort_fill+688 0x00007f41c50b3650
  0x00007f41c50b343d:   cmp    $0x40,%rdx
  0x00007f41c50b3441:   jg     Stub::jshort_fill+213 0x00007f41c50b3475
  0x00007f41c50b3443:   vmovdqu %ymm0,(%rdi)
  0x00007f41c50b3447:   vmovdqu %ymm0,0x20(%rdi)
  0x00007f41c50b344c:   vmovdqu %ymm0,0x40(%rdi)
  0x00007f41c50b3451:   sub    $0x30,%rdx
  0x00007f41c50b3455:   movabs $0xffffffffffffffff,%rax
  0x00007f41c50b345f:   bzhi   %rdx,%rax,%rax
  0x00007f41c50b3464:   kmovq  %rax,%k2
  0x00007f41c50b3469:   vmovdqu16 %ymm0,0x60(%rdi){%k2}
  0x00007f41c50b3470:   jmpq   Stub::jshort_fill+688 0x00007f41c50b3650
  0x00007f41c50b3475:   mov    %rdi,%rax
  0x00007f41c50b3478:   and    $0x1f,%rax
  0x00007f41c50b347c:   je     Stub::jshort_fill+274 0x00007f41c50b34b2
  0x00007f41c50b347e:   neg    %rax
  0x00007f41c50b3481:   add    $0x20,%rax
  0x00007f41c50b3485:   movabs $0xffffffffffffffff,%r8
  0x00007f41c50b348f:   bzhi   %rax,%r8,%r8
  0x00007f41c50b3494:   kmovq  %r8,%k2
  0x00007f41c50b3499:   vmovdqu8 %ymm0,(%rdi){%k2}
  0x00007f41c50b349f:   add    %rax,%rdi
  0x00007f41c50b34a2:   shr    %rax
  0x00007f41c50b34a5:   sub    %rax,%rdx
  0x00007f41c50b34a8:   cmp    $0x40,%rdx
  0x00007f41c50b34ac:   jl     Stub::jshort_fill+23 0x00007f41c50b33b7
  0x00007f41c50b34b2:   sub    $0x40,%rdx
  0x00007f41c50b34b6:   nop
  0x00007f41c50b34b7:   nop
  0x00007f41c50b34b8:   nop
  0x00007f41c50b34b9:   nop
  0x00007f41c50b34ba:   nop
  0x00007f41c50b34bb:   nop
  0x00007f41c50b34bc:   nop
  0x00007f41c50b34bd:   nop
  0x00007f41c50b34be:   nop
  0x00007f41c50b34bf:   nop
  0x00007f41c50b34c0:   nop
  0x00007f41c50b34c1:   nop
  0x00007f41c50b34c2:   nop
  0x00007f41c50b34c3:   nop
  0x00007f41c50b34c4:   nop
  0x00007f41c50b34c5:   nop
  0x00007f41c50b34c6:   nop
  0x00007f41c50b34c7:   nop
  0x00007f41c50b34c8:   nop
  0x00007f41c50b34c9:   nop
  0x00007f41c50b34ca:   nop
  0x00007f41c50b34cb:   nop
  0x00007f41c50b34cc:   nop
  0x00007f41c50b34cd:   nop
  0x00007f41c50b34ce:   nop
  0x00007f41c50b34cf:   nop
  0x00007f41c50b34d0:   nop
  0x00007f41c50b34d1:   nop
  0x00007f41c50b34d2:   nop
  0x00007f41c50b34d3:   nop
  0x00007f41c50b34d4:   nop
  0x00007f41c50b34d5:   nop
  0x00007f41c50b34d6:   nop
  0x00007f41c50b34d7:   nop
  0x00007f41c50b34d8:   nop
  0x00007f41c50b34d9:   nop
  0x00007f41c50b34da:   nop
  0x00007f41c50b34db:   nop
  0x00007f41c50b34dc:   nop
  0x00007f41c50b34dd:   nop
  0x00007f41c50b34de:   nop
  0x00007f41c50b34df:   nop
  0x00007f41c50b34e0:   vmovdqu %ymm0,(%rdi)
  0x00007f41c50b34e4:   vmovdqu %ymm0,0x20(%rdi)
  0x00007f41c50b34e9:   vmovdqu %ymm0,0x40(%rdi)
  0x00007f41c50b34ee:   vmovdqu %ymm0,0x60(%rdi)
  0x00007f41c50b34f3:   add    $0x80,%rdi
  0x00007f41c50b34fa:   sub    $0x40,%rdx
  0x00007f41c50b34fe:   jge    Stub::jshort_fill+320 0x00007f41c50b34e0
  0x00007f41c50b3500:   add    $0x40,%rdx
  0x00007f41c50b3504:   je     Stub::jshort_fill+688 0x00007f41c50b3650
  0x00007f41c50b350a:   jmpq   Stub::jshort_fill+23 0x00007f41c50b33b7
  0x00007f41c50b350f:   vpbroadcastw %esi,%zmm0
  0x00007f41c50b3515:   cmp    $0x20,%rdx
  0x00007f41c50b3519:   jg     Stub::jshort_fill+410 0x00007f41c50b353a
  0x00007f41c50b351b:   movabs $0xffffffffffffffff,%rax
  0x00007f41c50b3525:   bzhi   %rdx,%rax,%rax
  0x00007f41c50b352a:   kmovq  %rax,%k2
  0x00007f41c50b352f:   vmovdqu16 %zmm0,(%rdi){%k2}
  0x00007f41c50b3535:   jmpq   Stub::jshort_fill+688 0x00007f41c50b3650
  0x00007f41c50b353a:   cmp    $0x40,%rdx
  0x00007f41c50b353e:   jg     Stub::jshort_fill+458 0x00007f41c50b356a
  0x00007f41c50b3540:   vmovdqu64 %zmm0,(%rdi)
  0x00007f41c50b3546:   sub    $0x20,%rdx
  0x00007f41c50b354a:   movabs $0xffffffffffffffff,%rax
  0x00007f41c50b3554:   bzhi   %rdx,%rax,%rax
  0x00007f41c50b3559:   kmovq  %rax,%k2
  0x00007f41c50b355e:   vmovdqu16 %zmm0,0x40(%rdi){%k2}
  0x00007f41c50b3565:   jmpq   Stub::jshort_fill+688 0x00007f41c50b3650
  0x00007f41c50b356a:   cmp    $0x60,%rdx
  0x00007f41c50b356e:   jg     Stub::jshort_fill+513 0x00007f41c50b35a1
  0x00007f41c50b3570:   vmovdqu64 %zmm0,(%rdi)
  0x00007f41c50b3576:   vmovdqu64 %zmm0,0x40(%rdi)
  0x00007f41c50b357d:   sub    $0x40,%rdx
  0x00007f41c50b3581:   movabs $0xffffffffffffffff,%rax
  0x00007f41c50b358b:   bzhi   %rdx,%rax,%rax
  0x00007f41c50b3590:   kmovq  %rax,%k2
  0x00007f41c50b3595:   vmovdqu16 %zmm0,0x80(%rdi){%k2}
  0x00007f41c50b359c:   jmpq   Stub::jshort_fill+688 0x00007f41c50b3650
  0x00007f41c50b35a1:   mov    %rdi,%rax
  0x00007f41c50b35a4:   and    $0x3f,%rax
  0x00007f41c50b35a8:   je     Stub::jshort_fill+574 0x00007f41c50b35de
  0x00007f41c50b35aa:   neg    %rax
  0x00007f41c50b35ad:   add    $0x40,%rax
  0x00007f41c50b35b1:   movabs $0xffffffffffffffff,%r8
  0x00007f41c50b35bb:   bzhi   %rax,%r8,%r8
  0x00007f41c50b35c0:   kmovq  %r8,%k2
  0x00007f41c50b35c5:   vmovdqu8 %zmm0,(%rdi){%k2}
  0x00007f41c50b35cb:   add    %rax,%rdi
  0x00007f41c50b35ce:   shr    %rax
  0x00007f41c50b35d1:   sub    %rax,%rdx
  0x00007f41c50b35d4:   cmp    $0x60,%rdx
  0x00007f41c50b35d8:   jl     Stub::jshort_fill+373 0x00007f41c50b3515
  0x00007f41c50b35de:   sub    $0x60,%rdx
  0x00007f41c50b35e2:   nop
  0x00007f41c50b35e3:   nop
  0x00007f41c50b35e4:   nop
  0x00007f41c50b35e5:   nop
  0x00007f41c50b35e6:   nop
  0x00007f41c50b35e7:   nop
  0x00007f41c50b35e8:   nop
  0x00007f41c50b35e9:   nop
  0x00007f41c50b35ea:   nop
  0x00007f41c50b35eb:   nop
  0x00007f41c50b35ec:   nop
  0x00007f41c50b35ed:   nop
  0x00007f41c50b35ee:   nop
  0x00007f41c50b35ef:   nop
  0x00007f41c50b35f0:   nop
  0x00007f41c50b35f1:   nop
  0x00007f41c50b35f2:   nop
  0x00007f41c50b35f3:   nop
  0x00007f41c50b35f4:   nop
  0x00007f41c50b35f5:   nop
  0x00007f41c50b35f6:   nop
  0x00007f41c50b35f7:   nop
  0x00007f41c50b35f8:   nop
  0x00007f41c50b35f9:   nop
  0x00007f41c50b35fa:   nop
  0x00007f41c50b35fb:   nop
  0x00007f41c50b35fc:   nop
  0x00007f41c50b35fd:   nop
  0x00007f41c50b35fe:   nop
  0x00007f41c50b35ff:   nop
  0x00007f41c50b3600:   nop
  0x00007f41c50b3601:   nop
  0x00007f41c50b3602:   nop
  0x00007f41c50b3603:   nop
  0x00007f41c50b3604:   nop
  0x00007f41c50b3605:   nop
  0x00007f41c50b3606:   nop
  0x00007f41c50b3607:   nop
  0x00007f41c50b3608:   nop
  0x00007f41c50b3609:   nop
  0x00007f41c50b360a:   nop
  0x00007f41c50b360b:   nop
  0x00007f41c50b360c:   nop
  0x00007f41c50b360d:   nop
  0x00007f41c50b360e:   nop
  0x00007f41c50b360f:   nop
  0x00007f41c50b3610:   nop
  0x00007f41c50b3611:   nop
  0x00007f41c50b3612:   nop
  0x00007f41c50b3613:   nop
  0x00007f41c50b3614:   nop
  0x00007f41c50b3615:   nop
  0x00007f41c50b3616:   nop
  0x00007f41c50b3617:   nop
  0x00007f41c50b3618:   nop
  0x00007f41c50b3619:   nop
  0x00007f41c50b361a:   nop
  0x00007f41c50b361b:   nop
  0x00007f41c50b361c:   nop
  0x00007f41c50b361d:   nop
  0x00007f41c50b361e:   nop
  0x00007f41c50b361f:   nop
  0x00007f41c50b3620:   vmovdqu64 %zmm0,(%rdi)
  0x00007f41c50b3626:   vmovdqu64 %zmm0,0x40(%rdi)
  0x00007f41c50b362d:   vmovdqu64 %zmm0,0x80(%rdi)
  0x00007f41c50b3634:   add    $0xc0,%rdi
  0x00007f41c50b363b:   sub    $0x60,%rdx
  0x00007f41c50b363f:   jge    Stub::jshort_fill+640 0x00007f41c50b3620
  0x00007f41c50b3641:   add    $0x60,%rdx
  0x00007f41c50b3645:   je     Stub::jshort_fill+688 0x00007f41c50b3650
  0x00007f41c50b364b:   jmpq   Stub::jshort_fill+373 0x00007f41c50b3515
  0x00007f41c50b3650:   vzeroupper 
  0x00007f41c50b3653:   leaveq 
  0x00007f41c50b3654:   retq   
--------------------------------------------------------------------------------
- - - [END] - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
