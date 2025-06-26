vmovd  %xmm0,%r10d
vmovd  %xmm1,%r11d
movslq %r11d,%r11
shl    $0x20,%r11
or     %r10,%r11
mov    %r11,(%rax)
