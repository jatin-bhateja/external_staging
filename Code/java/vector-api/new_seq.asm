vpbroadcastd -0x5b(%rip),%ymm0        
vmovdqu %ymm0,0x10(%rsi)
vpbroadcastd -0x69(%rip),%ymm1        
vextractf128 $0x1,%ymm1,%xmm0
vpextrd $0x3,%xmm0,%eax
