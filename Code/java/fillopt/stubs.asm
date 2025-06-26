StubRoutines::jshort_fill [0x000001ee66d902e0, 0x000001ee66d90535] (597 bytes)
--------------------------------------------------------------------------------
 ;; Entry:
  0x000001ee66d902e0:   push   %rbp
  0x000001ee66d902e1:   mov    %rsp,%rbp
  0x000001ee66d902e4:   cmp    $0x800,%r8
  0x000001ee66d902eb:   jg     Stub::jshort_fill+329 0x000001ee66d90429
  0x000001ee66d902f1:   vpbroadcastw %edx,%ymm0
  0x000001ee66d902f7:   cmp    $0x10,%r8
  0x000001ee66d902fb:   jg     Stub::jshort_fill+60 0x000001ee66d9031c
  0x000001ee66d902fd:   movabs $0xffffffffffffffff,%rax
  0x000001ee66d90307:   bzhi   %r8,%rax,%rax
  0x000001ee66d9030c:   kmovq  %rax,%k2
  0x000001ee66d90311:   vmovdqu16 %ymm0,(%rcx){%k2}
  0x000001ee66d90317:   jmpq   Stub::jshort_fill+592 0x000001ee66d90530
  0x000001ee66d9031c:   cmp    $0x20,%r8
  0x000001ee66d90320:   jg     Stub::jshort_fill+106 0x000001ee66d9034a
  0x000001ee66d90322:   vmovdqu %ymm0,(%rcx)
  0x000001ee66d90326:   sub    $0x10,%r8
  0x000001ee66d9032a:   movabs $0xffffffffffffffff,%rax
  0x000001ee66d90334:   bzhi   %r8,%rax,%rax
  0x000001ee66d90339:   kmovq  %rax,%k2
  0x000001ee66d9033e:   vmovdqu16 %ymm0,0x20(%rcx){%k2}
  0x000001ee66d90345:   jmpq   Stub::jshort_fill+592 0x000001ee66d90530
  0x000001ee66d9034a:   cmp    $0x30,%r8
  0x000001ee66d9034e:   jg     Stub::jshort_fill+157 0x000001ee66d9037d
  0x000001ee66d90350:   vmovdqu %ymm0,(%rcx)
  0x000001ee66d90354:   vmovdqu %ymm0,0x20(%rcx)
  0x000001ee66d90359:   sub    $0x20,%r8
  0x000001ee66d9035d:   movabs $0xffffffffffffffff,%rax
  0x000001ee66d90367:   bzhi   %r8,%rax,%rax
  0x000001ee66d9036c:   kmovq  %rax,%k2
  0x000001ee66d90371:   vmovdqu16 %ymm0,0x40(%rcx){%k2}
  0x000001ee66d90378:   jmpq   Stub::jshort_fill+592 0x000001ee66d90530
  0x000001ee66d9037d:   cmp    $0x40,%r8
  0x000001ee66d90381:   jg     Stub::jshort_fill+217 0x000001ee66d903b9
  0x000001ee66d90387:   vmovdqu %ymm0,(%rcx)
  0x000001ee66d9038b:   vmovdqu %ymm0,0x20(%rcx)
  0x000001ee66d90390:   vmovdqu %ymm0,0x40(%rcx)
  0x000001ee66d90395:   sub    $0x30,%r8
  0x000001ee66d90399:   movabs $0xffffffffffffffff,%rax
  0x000001ee66d903a3:   bzhi   %r8,%rax,%rax
  0x000001ee66d903a8:   kmovq  %rax,%k2
  0x000001ee66d903ad:   vmovdqu16 %ymm0,0x60(%rcx){%k2}
  0x000001ee66d903b4:   jmpq   Stub::jshort_fill+592 0x000001ee66d90530
  0x000001ee66d903b9:   mov    %rcx,%rax
  0x000001ee66d903bc:   and    $0x1f,%rax
  0x000001ee66d903c0:   je     Stub::jshort_fill+278 0x000001ee66d903f6
  0x000001ee66d903c2:   neg    %rax
  0x000001ee66d903c5:   add    $0x20,%rax
  0x000001ee66d903c9:   movabs $0xffffffffffffffff,%r8
  0x000001ee66d903d3:   bzhi   %rax,%r8,%r8
  0x000001ee66d903d8:   kmovq  %r8,%k2
  0x000001ee66d903dd:   vmovdqu8 %ymm0,(%rcx){%k2}
  0x000001ee66d903e3:   add    %rax,%rcx
  0x000001ee66d903e6:   shr    %rax
  0x000001ee66d903e9:   sub    %rax,%r8
  0x000001ee66d903ec:   cmp    $0x40,%r8
  0x000001ee66d903f0:   jl     Stub::jshort_fill+23 0x000001ee66d902f7
  0x000001ee66d903f6:   sub    $0x40,%r8
  0x000001ee66d903fa:   vmovdqu %ymm0,(%rcx)
  0x000001ee66d903fe:   vmovdqu %ymm0,0x20(%rcx)
  0x000001ee66d90403:   vmovdqu %ymm0,0x40(%rcx)
  0x000001ee66d90408:   vmovdqu %ymm0,0x60(%rcx)
  0x000001ee66d9040d:   add    $0x80,%rcx
  0x000001ee66d90414:   sub    $0x40,%r8
  0x000001ee66d90418:   jge    Stub::jshort_fill+282 0x000001ee66d903fa
  0x000001ee66d9041a:   add    $0x40,%r8
  0x000001ee66d9041e:   je     Stub::jshort_fill+592 0x000001ee66d90530
  0x000001ee66d90424:   jmpq   Stub::jshort_fill+23 0x000001ee66d902f7
  0x000001ee66d90429:   vpbroadcastw %edx,%zmm0
  0x000001ee66d9042f:   cmp    $0x20,%r8
  0x000001ee66d90433:   jg     Stub::jshort_fill+372 0x000001ee66d90454
  0x000001ee66d90435:   movabs $0xffffffffffffffff,%rax
  0x000001ee66d9043f:   bzhi   %r8,%rax,%rax
  0x000001ee66d90444:   kmovq  %rax,%k2
  0x000001ee66d90449:   vmovdqu16 %zmm0,(%rcx){%k2}
  0x000001ee66d9044f:   jmpq   Stub::jshort_fill+592 0x000001ee66d90530
  0x000001ee66d90454:   cmp    $0x40,%r8
  0x000001ee66d90458:   jg     Stub::jshort_fill+420 0x000001ee66d90484
  0x000001ee66d9045a:   vmovdqu64 %zmm0,(%rcx)
  0x000001ee66d90460:   sub    $0x20,%r8
  0x000001ee66d90464:   movabs $0xffffffffffffffff,%rax
  0x000001ee66d9046e:   bzhi   %r8,%rax,%rax
  0x000001ee66d90473:   kmovq  %rax,%k2
  0x000001ee66d90478:   vmovdqu16 %zmm0,0x40(%rcx){%k2}
  0x000001ee66d9047f:   jmpq   Stub::jshort_fill+592 0x000001ee66d90530
  0x000001ee66d90484:   cmp    $0x60,%r8
  0x000001ee66d90488:   jg     Stub::jshort_fill+479 0x000001ee66d904bf
  0x000001ee66d9048e:   vmovdqu64 %zmm0,(%rcx)
  0x000001ee66d90494:   vmovdqu64 %zmm0,0x40(%rcx)
  0x000001ee66d9049b:   sub    $0x40,%r8
  0x000001ee66d9049f:   movabs $0xffffffffffffffff,%rax
  0x000001ee66d904a9:   bzhi   %r8,%rax,%rax
  0x000001ee66d904ae:   kmovq  %rax,%k2
  0x000001ee66d904b3:   vmovdqu16 %zmm0,0x80(%rcx){%k2}
  0x000001ee66d904ba:   jmpq   Stub::jshort_fill+592 0x000001ee66d90530
  0x000001ee66d904bf:   mov    %rcx,%rax
  0x000001ee66d904c2:   and    $0x3f,%rax
  0x000001ee66d904c6:   je     Stub::jshort_fill+540 0x000001ee66d904fc
  0x000001ee66d904c8:   neg    %rax
  0x000001ee66d904cb:   add    $0x40,%rax
  0x000001ee66d904cf:   movabs $0xffffffffffffffff,%r8
  0x000001ee66d904d9:   bzhi   %rax,%r8,%r8
  0x000001ee66d904de:   kmovq  %r8,%k2
  0x000001ee66d904e3:   vmovdqu8 %zmm0,(%rcx){%k2}
  0x000001ee66d904e9:   add    %rax,%rcx
  0x000001ee66d904ec:   shr    %rax
  0x000001ee66d904ef:   sub    %rax,%r8
  0x000001ee66d904f2:   cmp    $0x60,%r8
  0x000001ee66d904f6:   jl     Stub::jshort_fill+335 0x000001ee66d9042f
  0x000001ee66d904fc:   sub    $0x60,%r8
  0x000001ee66d90500:   vmovdqu64 %zmm0,(%rcx)
  0x000001ee66d90506:   vmovdqu64 %zmm0,0x40(%rcx)
  0x000001ee66d9050d:   vmovdqu64 %zmm0,0x80(%rcx)
  0x000001ee66d90514:   add    $0xc0,%rcx
  0x000001ee66d9051b:   sub    $0x60,%r8
  0x000001ee66d9051f:   jge    Stub::jshort_fill+544 0x000001ee66d90500
  0x000001ee66d90521:   add    $0x60,%r8
  0x000001ee66d90525:   je     Stub::jshort_fill+592 0x000001ee66d90530
  0x000001ee66d9052b:   jmpq   Stub::jshort_fill+335 0x000001ee66d9042f
  0x000001ee66d90530:   vzeroupper 
  0x000001ee66d90533:   leaveq 
  0x000001ee66d90534:   retq   
--------------------------------------------------------------------------------
- - - [END] - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
