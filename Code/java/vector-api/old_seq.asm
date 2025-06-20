vmovdqu -0x3e(%rip),%ymm1
vmovdqu %ymm1,0x10(%rsi)
vextractf128 $0x1,%ymm1,%xmm0
vpextrd $0x3,%xmm0,%eax

