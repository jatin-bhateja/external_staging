XDIS 0: CALL      BASE       E81166C40A               call 0xac46616
XDIS 5: NOP       BASE       90                       nop
XDIS 6: NOP       BASE       90                       nop
XDIS 7: NOP       BASE       90                       nop
XDIS 8: NOP       BASE       90                       nop
XDIS 9: NOP       BASE       90                       nop
XDIS a: NOP       BASE       90                       nop
XDIS b: NOP       BASE       90                       nop
XDIS c: NOP       BASE       90                       nop
XDIS d: NOP       BASE       90                       nop
XDIS e: NOP       BASE       90                       nop
XDIS f: NOP       BASE       90                       nop
XDIS 10: DATAXFER  BASE       89842400A0FEFF           mov dword ptr [esp-0x16000], eax
XDIS 17: PUSH      BASE       55                       push ebp
XDIS 18: BINARY    BASE       48                       dec eax
XDIS 19: BINARY    BASE       81ECD0000000             sub esp, 0xd0
XDIS 1f: BINARY    BASE       48                       dec eax
XDIS 20: DATAXFER  BASE       8B5E58                   mov ebx, dword ptr [esi+0x58]
XDIS 23: BINARY    BASE       4C                       dec esp
XDIS 24: DATAXFER  BASE       8B7650                   mov esi, dword ptr [esi+0x50]
XDIS 27: BINARY    BASE       44                       inc esp
XDIS 28: DATAXFER  BASE       8B6E30                   mov ebp, dword ptr [esi+0x30]
XDIS 2b: BINARY    BASE       4C                       dec esp
XDIS 2c: DATAXFER  BASE       8B5648                   mov edx, dword ptr [esi+0x48]
XDIS 2f: BINARY    BASE       4C                       dec esp
XDIS 30: DATAXFER  BASE       891424                   mov dword ptr [esp], edx
XDIS 33: BINARY    BASE       4C                       dec esp
XDIS 34: DATAXFER  BASE       8B5640                   mov edx, dword ptr [esi+0x40]
XDIS 37: BINARY    BASE       4C                       dec esp
XDIS 38: DATAXFER  BASE       89542408                 mov dword ptr [esp+0x8], edx
XDIS 3c: BINARY    BASE       4C                       dec esp
XDIS 3d: DATAXFER  BASE       8B5638                   mov edx, dword ptr [esi+0x38]
XDIS 40: BINARY    BASE       4C                       dec esp
XDIS 41: DATAXFER  BASE       89542410                 mov dword ptr [esp+0x10], edx
XDIS 45: BINARY    BASE       48                       dec eax
XDIS 46: DATAXFER  BASE       8BFE                     mov edi, esi
XDIS 48: AVX       AVX        C5F877                   vzeroupper
XDIS 4b: BINARY    BASE       49                       dec ecx
XDIS 4c: DATAXFER  BASE       BAF0A4E98B               mov edx, 0x8be9a4f0
XDIS 51: FLAGOP    BASE       D6                       salc 
XDIS 52: COND_BR   BASE       7F00                     jnle 0x54
XDIS 54: BINARY    BASE       0041FF                   add byte ptr [ecx-0x1], al
XDIS 57: ROTATE    BASE       D24885                   ror byte ptr [eax-0x7b], cl
XDIS 5a: X87_ALU   X87        DB9090909090             fist dword ptr [eax-0x6f6f6f70], st
XDIS 60: COND_BR   BASE       0F84B3020000             jz 0x319
XDIS 66: BINARY    BASE       48                       dec eax
XDIS 67: DATAXFER  BASE       8BEB                     mov ebp, ebx
XDIS 69: BINARY    BASE       44                       inc esp
XDIS 6a: DATAXFER  BASE       8B5308                   mov edx, dword ptr [ebx+0x8]
XDIS 6d: BINARY    BASE       41                       inc ecx
XDIS 6e: BINARY    BASE       81FAA00B0400             cmp edx, 0x40ba0
XDIS 74: COND_BR   BASE       0F85C0040000             jnz 0x53a
XDIS 7a: BINARY    BASE       4C                       dec esp
XDIS 7b: DATAXFER  BASE       8BC3                     mov eax, ebx
XDIS 7d: NOP       BASE       90                       nop
XDIS 7e: NOP       BASE       90                       nop
XDIS 7f: NOP       BASE       90                       nop
XDIS 80: BINARY    BASE       4D                       dec ebp
XDIS 81: LOGICAL   BASE       85F6                     test esi, esi
XDIS 83: COND_BR   BASE       0F849C020000             jz 0x325
XDIS 89: BINARY    BASE       45                       inc ebp
XDIS 8a: DATAXFER  BASE       8B5608                   mov edx, dword ptr [esi+0x8]
XDIS 8d: BINARY    BASE       41                       inc ecx
XDIS 8e: BINARY    BASE       81FAA00B0400             cmp edx, 0x40ba0
XDIS 94: COND_BR   BASE       0F85B0040000             jnz 0x54a
XDIS 9a: BINARY    BASE       4D                       dec ebp
XDIS 9b: DATAXFER  BASE       8BCE                     mov ecx, esi
XDIS 9d: BINARY    BASE       48                       dec eax
XDIS 9e: DATAXFER  BASE       8B3C24                   mov edi, dword ptr [esp]
XDIS a1: BINARY    BASE       48                       dec eax
XDIS a2: LOGICAL   BASE       85FF                     test edi, edi
XDIS a4: COND_BR   BASE       0F8483020000             jz 0x32d
XDIS aa: BINARY    BASE       44                       inc esp
XDIS ab: DATAXFER  BASE       8B5F08                   mov ebx, dword ptr [edi+0x8]
XDIS ae: BINARY    BASE       41                       inc ecx
XDIS af: BINARY    BASE       81FBA00B0400             cmp ebx, 0x40ba0
XDIS b5: COND_BR   BASE       0F85D9040000             jnz 0x594
XDIS bb: BINARY    BASE       48                       dec eax
XDIS bc: DATAXFER  BASE       8BCF                     mov ecx, edi
XDIS be: BINARY    BASE       48                       dec eax
XDIS bf: DATAXFER  BASE       8B442408                 mov eax, dword ptr [esp+0x8]
XDIS c3: BINARY    BASE       48                       dec eax
XDIS c4: LOGICAL   BASE       85C0                     test eax, eax
XDIS c6: COND_BR   BASE       0F8468020000             jz 0x334
XDIS cc: BINARY    BASE       44                       inc esp
XDIS cd: DATAXFER  BASE       8B5008                   mov edx, dword ptr [eax+0x8]
XDIS d0: BINARY    BASE       41                       inc ecx
XDIS d1: BINARY    BASE       81FAA00B0400             cmp edx, 0x40ba0
XDIS d7: COND_BR   BASE       0F85C5040000             jnz 0x5a2
XDIS dd: BINARY    BASE       48                       dec eax
XDIS de: DATAXFER  BASE       8BD0                     mov edx, eax
XDIS e0: BINARY    BASE       48                       dec eax
XDIS e1: DATAXFER  BASE       8B5C2410                 mov ebx, dword ptr [esp+0x10]
XDIS e5: BINARY    BASE       48                       dec eax
XDIS e6: LOGICAL   BASE       85DB                     test ebx, ebx
XDIS e8: COND_BR   BASE       0F844D020000             jz 0x33b
XDIS ee: BINARY    BASE       44                       inc esp
XDIS ef: DATAXFER  BASE       8B5B08                   mov ebx, dword ptr [ebx+0x8]
XDIS f2: NOP       BASE       90                       nop
XDIS f3: NOP       BASE       90                       nop
XDIS f4: NOP       BASE       90                       nop
XDIS f5: NOP       BASE       90                       nop
XDIS f6: NOP       BASE       90                       nop
XDIS f7: NOP       BASE       90                       nop
XDIS f8: NOP       BASE       90                       nop
XDIS f9: NOP       BASE       90                       nop
XDIS fa: NOP       BASE       90                       nop
XDIS fb: NOP       BASE       90                       nop
XDIS fc: NOP       BASE       90                       nop
XDIS fd: NOP       BASE       90                       nop
XDIS fe: NOP       BASE       90                       nop
XDIS ff: NOP       BASE       90                       nop
XDIS 100: BINARY    BASE       41                       inc ecx
XDIS 101: BINARY    BASE       81FBA00B0400             cmp ebx, 0x40ba0
XDIS 107: COND_BR   BASE       0F854B040000             jnz 0x558
XDIS 10d: BINARY    BASE       41                       inc ecx
XDIS 10e: DATAXFER  BASE       8B400C                   mov eax, dword ptr [eax+0xc]
XDIS 111: BINARY    BASE       48                       dec eax
XDIS 112: DATAXFER  BASE       BDA0D45801               mov ebp, 0x158d4a0
XDIS 117: BINARY    BASE       0100                     add dword ptr [eax], eax
XDIS 119: BINARY    BASE       0000                     add byte ptr [eax], al
XDIS 11b: BINARY    BASE       44                       inc esp
XDIS 11c: DATAXFER  BASE       8B5570                   mov edx, dword ptr [ebp+0x70]
XDIS 11f: NOP       BASE       90                       nop
XDIS 120: BINARY    BASE       43                       inc ebx
XDIS 121: DATAXFER  BASE       8B7CD408                 mov edi, dword ptr [esp+edx*8+0x8]
XDIS 125: BINARY    BASE       81FFA8AA0C00             cmp edi, 0xcaaa8
XDIS 12b: COND_BR   BASE       0F8557030000             jnz 0x488
XDIS 131: BINARY    BASE       4B                       dec ebx
XDIS 132: MISC      BASE       8D34D4                   lea esi, ptr [esp+edx*8]
XDIS 135: BINARY    BASE       44                       inc esp
XDIS 136: DATAXFER  BASE       8B760C                   mov esi, dword ptr [esi+0xc]
XDIS 139: BINARY    BASE       41                       inc ecx
XDIS 13a: DATAXFER  BASE       8BFE                     mov edi, esi
XDIS 13c: BINARY    BASE       FFCF                     dec edi
XDIS 13e: BINARY    BASE       45                       inc ebp
XDIS 13f: DATAXFER  BASE       8BD6                     mov edx, esi
XDIS 141: BINARY    BASE       44                       inc esp
XDIS 142: LOGICAL   BASE       23D7                     and edx, edi
XDIS 144: BINARY    BASE       45                       inc ebp
XDIS 145: LOGICAL   BASE       85D2                     test edx, edx
XDIS 147: COND_BR   BASE       0F853B030000             jnz 0x488
XDIS 14d: BINARY    BASE       45                       inc ebp
XDIS 14e: DATAXFER  BASE       8B590C                   mov ebx, dword ptr [ecx+0xc]
XDIS 151: BINARY    BASE       45                       inc ebp
XDIS 152: BINARY    BASE       2BDE                     sub ebx, esi
XDIS 154: BINARY    BASE       41                       inc ecx
XDIS 155: BINARY    BASE       FFC3                     inc ebx
XDIS 157: BINARY    BASE       45                       inc ebp
XDIS 158: LOGICAL   BASE       85DB                     test ebx, ebx
XDIS 15a: NOP       BASE       90                       nop
XDIS 15b: NOP       BASE       90                       nop
XDIS 15c: NOP       BASE       90                       nop
XDIS 15d: NOP       BASE       90                       nop
XDIS 15e: NOP       BASE       90                       nop
XDIS 15f: NOP       BASE       90                       nop
XDIS 160: COND_BR   BASE       0F8C74030000             jl 0x4da
XDIS 166: BINARY    BASE       44                       inc esp
XDIS 167: DATAXFER  BASE       8B5644                   mov edx, dword ptr [esi+0x44]
XDIS 16a: BINARY    BASE       47                       inc edi
XDIS 16b: DATAXFER  BASE       8B54D408                 mov edx, dword ptr [esp+edx*8+0x8]
XDIS 16f: BINARY    BASE       41                       inc ecx
XDIS 170: BINARY    BASE       81FA20DF0C00             cmp edx, 0xcdf20
XDIS 176: COND_BR   BASE       0F855E030000             jnz 0x4da
XDIS 17c: NOP       BASE       90                       nop
XDIS 17d: NOP       BASE       90                       nop
XDIS 17e: NOP       BASE       90                       nop
XDIS 17f: NOP       BASE       90                       nop
XDIS 180: BINARY    BASE       44                       inc esp
XDIS 181: DATAXFER  BASE       8B510C                   mov edx, dword ptr [ecx+0xc]
XDIS 184: BINARY    BASE       45                       inc ebp
XDIS 185: BINARY    BASE       2BD6                     sub edx, esi
XDIS 187: BINARY    BASE       41                       inc ecx
XDIS 188: BINARY    BASE       FFC2                     inc edx
XDIS 18a: BINARY    BASE       45                       inc ebp
XDIS 18b: LOGICAL   BASE       85D2                     test edx, edx
XDIS 18d: COND_BR   BASE       0F8C47030000             jl 0x4da
XDIS 193: BINARY    BASE       44                       inc esp
XDIS 194: DATAXFER  BASE       89542408                 mov dword ptr [esp+0x8], edx
XDIS 198: BINARY    BASE       44                       inc esp
XDIS 199: DATAXFER  BASE       895C2404                 mov dword ptr [esp+0x4], ebx
XDIS 19d: DATAXFER  AVX        C4E1F96ECE               vmovd xmm1, esi
XDIS 1a2: DATAXFER  AVX        C4E1F96EC2               vmovd xmm0, edx
XDIS 1a7: BINARY    BASE       48                       dec eax
XDIS 1a8: DATAXFER  BASE       8BD1                     mov edx, ecx
XDIS 1aa: BINARY    BASE       4C                       dec esp
XDIS 1ab: DATAXFER  BASE       8BDB                     mov ebx, ebx
XDIS 1ad: DATAXFER  AVX        C4C1F97EC2               vmovd edx, xmm0
XDIS 1b2: BINARY    BASE       45                       inc ebp
XDIS 1b3: DATAXFER  BASE       8B520C                   mov edx, dword ptr [edx+0xc]
XDIS 1b6: BINARY    BASE       45                       inc ebp
XDIS 1b7: BINARY    BASE       2BD6                     sub edx, esi
XDIS 1b9: BINARY    BASE       41                       inc ecx
XDIS 1ba: BINARY    BASE       FFC2                     inc edx
XDIS 1bc: BINARY    BASE       44                       inc esp
XDIS 1bd: DATAXFER  BASE       8954240C                 mov dword ptr [esp+0xc], edx
XDIS 1c1: BINARY    BASE       45                       inc ebp
XDIS 1c2: LOGICAL   BASE       85D2                     test edx, edx
XDIS 1c4: COND_BR   BASE       0F8C4E030000             jl 0x518
XDIS 1ca: BINARY    BASE       44                       inc esp
XDIS 1cb: DATAXFER  BASE       8B530C                   mov edx, dword ptr [ebx+0xc]
XDIS 1ce: BINARY    BASE       45                       inc ebp
XDIS 1cf: BINARY    BASE       2BD6                     sub edx, esi
XDIS 1d1: BINARY    BASE       41                       inc ecx
XDIS 1d2: BINARY    BASE       FFC2                     inc edx
XDIS 1d4: BINARY    BASE       44                       inc esp
XDIS 1d5: DATAXFER  BASE       89542410                 mov dword ptr [esp+0x10], edx
XDIS 1d9: BINARY    BASE       45                       inc ebp
XDIS 1da: LOGICAL   BASE       85D2                     test edx, edx
XDIS 1dc: NOP       BASE       90                       nop
XDIS 1dd: NOP       BASE       90                       nop
XDIS 1de: NOP       BASE       90                       nop
XDIS 1df: NOP       BASE       90                       nop
XDIS 1e0: COND_BR   BASE       0F8C39030000             jl 0x51f
XDIS 1e6: DATAXFER  BASE       8B4D74                   mov ecx, dword ptr [ebp+0x74]
XDIS 1e9: BINARY    BASE       45                       inc ebp
XDIS 1ea: DATAXFER  BASE       8B54CC08                 mov edx, dword ptr [esp+ecx*8+0x8]
XDIS 1ee: BINARY    BASE       41                       inc ecx
XDIS 1ef: BINARY    BASE       81FA90E50C00             cmp edx, 0xce590
XDIS 1f5: COND_BR   BASE       0F852B030000             jnz 0x526
XDIS 1fb: DATAXFER  BASE       8BE8                     mov ebp, eax
XDIS 1fd: BINARY    BASE       83C5F9                   add ebp, 0xfffffff9
XDIS 200: LOGICAL   BASE       85ED                     test ebp, ebp
XDIS 202: COND_BR   BASE       0F8C28030000             jl 0x530
XDIS 208: BMI1      BMI1       C4E240F2D8               andn ebx, edi, eax
XDIS 20d: BINARY    BASE       4D                       dec ebp
XDIS 20e: MISC      BASE       8D14CC                   lea edx, ptr [esp+ecx*8]
XDIS 211: BINARY    BASE       45                       inc ebp
XDIS 212: DATAXFER  BASE       8B520C                   mov edx, dword ptr [edx+0xc]
XDIS 215: SEGOP     BASE       C4817A7E54D4             les eax, ptr [ecx-0x2bab8186]
XDIS 21b: BINARY    BASE       1062F3                   adc byte ptr [edx-0xd], ah
XDIS 21e: IOSTRINGOP BASE       6D                       insd 
XDIS 21f: LOGICAL   BASE       083F                     or byte ptr [edi], bh
XDIS 221: BINARY    BASE       3D79AEF5FF               cmp eax, 0xfff5ae79
XDIS 226: BINARY    BASE       00EB                     add bl, ch
XDIS 228: BINARY    BASE       1B9090909090             sbb edx, dword ptr [eax-0x6f6f6f70]
XDIS 22e: NOP       BASE       90                       nop
XDIS 22f: NOP       BASE       90                       nop
XDIS 230: SEGOP     BASE       C4817E7F6CA8             les eax, ptr [ecx-0x57938082]
XDIS 236: BINARY    BASE       104503                   adc byte ptr [ebp+0x3], al
XDIS 239: IO        BASE       EE                       out dx, al
XDIS 23a: BINARY    BASE       4D                       dec ebp
XDIS 23b: DATAXFER  BASE       8B9790030000             mov edx, dword ptr [edi+0x390]
XDIS 241: BINARY    BASE       41                       inc ecx
XDIS 242: LOGICAL   BASE       8502                     test dword ptr [edx], eax
XDIS 244: BINARY    BASE       44                       inc esp
XDIS 245: BINARY    BASE       3BEB                     cmp ebp, ebx
XDIS 247: COND_BR   BASE       0F8DB3000000             jnl 0x300
XDIS 24d: BINARY    BASE       44                       inc esp
XDIS 24e: BINARY    BASE       3B6C2404                 cmp ebp, dword ptr [esp+0x4]
XDIS 252: COND_BR   BASE       0F83ED000000             jnb 0x345
XDIS 258: SEGOP     BASE       C4817E6F6CA9             les eax, ptr [ecx-0x56939082]
XDIS 25e: BINARY    BASE       1090443B6C24             adc byte ptr [eax+0x246c3b44], dl
XDIS 264: LOGICAL   BASE       080F                     or byte ptr [edi], cl
XDIS 266: LOGICAL   BASE       832101                   and dword ptr [ecx], 0x1
XDIS 269: BINARY    BASE       0000                     add byte ptr [eax], al
XDIS 26b: SEGOP     BASE       C4A17E6F5CAA             les esp, ptr [ecx-0x55a39082]
XDIS 271: BINARY    BASE       10443B6C                 adc byte ptr [ebx+edi*1+0x6c], al
XDIS 275: LOGICAL   BASE       240C                     and al, 0xc
XDIS 277: COND_BR   BASE       0F835B010000             jnb 0x3d8
XDIS 27d: DATAXFER  AVX        C4C1F97EC2               vmovd edx, xmm0
XDIS 282: SEGOP     BASE       C4817E6F64AA             les eax, ptr [ecx-0x559b9082]
XDIS 288: BINARY    BASE       10443B6C                 adc byte ptr [ebx+edi*1+0x6c], al
XDIS 28c: LOGICAL   BASE       2410                     and al, 0x10
XDIS 28e: COND_BR   BASE       0F8398010000             jnb 0x42c
XDIS 294: LOGICAL   AVX512EVEX 62F35D2825EBE0           vpternlogd ymm5, ymm4, ymm3, 0xe0
XDIS 29b: SEGOP     BASE       C4817E6F54AB             les eax, ptr [ecx-0x54ab9082]
XDIS 2a1: BINARY    BASE       1062F3                   adc byte ptr [edx-0xd], ah
XDIS 2a4: POP       BASE       5D                       pop ebp
XDIS 2a5: BINARY    BASE       2825D3E062F1             sub byte ptr [0xf162e0d3], ah
XDIS 2ab: PUSH      BASE       55                       push ebp
XDIS 2ac: DECIMAL   BASE       2F                       das 
XDIS 2ad: IO        BASE       EF                       out dx, eax
XDIS 2ae: UNCOND_BR BASE       EA443BED0F8278           jmp far 0xfed3b44, 0x7882
ERROR: GENERAL_ERROR Could not decode at offset: 0x2b5 len: 2 PC: 0x2b5: [FFFF]
ERROR: GENERAL_ERROR Could not decode at offset: 0x2b7 len: 6 PC: 0x2b7: [FFBEE4FFFFFF]
XDIS 2bd: BINARY    BASE       44                       inc esp
XDIS 2be: DATAXFER  BASE       896C2404                 mov dword ptr [esp+0x4], ebp
XDIS 2c2: BINARY    BASE       4C                       dec esp
XDIS 2c3: DATAXFER  BASE       894C2410                 mov dword ptr [esp+0x10], ecx
XDIS 2c7: BINARY    BASE       48                       dec eax
XDIS 2c8: DATAXFER  BASE       89542418                 mov dword ptr [esp+0x18], edx
XDIS 2cc: BINARY    BASE       4C                       dec esp
XDIS 2cd: DATAXFER  BASE       89542420                 mov dword ptr [esp+0x20], edx
XDIS 2d1: BINARY    BASE       4C                       dec esp
XDIS 2d2: DATAXFER  BASE       895C2428                 mov dword ptr [esp+0x28], ebx
XDIS 2d6: BINARY    BASE       4C                       dec esp
XDIS 2d7: DATAXFER  BASE       89442430                 mov dword ptr [esp+0x30], eax
XDIS 2db: DATAXFER  AVX        C5FE7F6C2440             vmovdqu ymmword ptr [esp+0x40], ymm5
XDIS 2e1: NOP       BASE       90                       nop
XDIS 2e2: NOP       BASE       90                       nop
XDIS 2e3: NOP       BASE       90                       nop
XDIS 2e4: AVX       AVX        C5F877                   vzeroupper
XDIS 2e7: CALL      BASE       E894A1FCFF               call 0xfffca480
XDIS 2ec: BINARY    BASE       48                       dec eax
XDIS 2ed: DATAXFER  BASE       BF20FD488C               mov edi, 0x8c48fd20
XDIS 2f2: FLAGOP    BASE       D6                       salc 
XDIS 2f3: COND_BR   BASE       7F00                     jnle 0x2f5
XDIS 2f5: BINARY    BASE       004883                   add byte ptr [eax-0x7d], cl
XDIS 2f8: IO        BASE       E4F0                     in al, 0xf0
XDIS 2fa: CALL      BASE       E86782AC0A               call 0xaac8566
XDIS 2ff: SYSTEM    BASE       F4                       hlt
XDIS 300: AVX       AVX        C5F877                   vzeroupper
XDIS 303: BINARY    BASE       48                       dec eax
XDIS 304: BINARY    BASE       81C4D0000000             add esp, 0xd0
XDIS 30a: POP       BASE       5D                       pop ebp
XDIS 30b: BINARY    BASE       49                       dec ecx
XDIS 30c: BINARY    BASE       3BA788030000             cmp esp, dword ptr [edi+0x388]
XDIS 312: COND_BR   BASE       0F8791020000             jnbe 0x5a9
XDIS 318: RET       BASE       C3                       ret 
XDIS 319: BINARY    BASE       45                       inc ebp
XDIS 31a: LOGICAL   BASE       33C0                     xor eax, eax
XDIS 31c: BINARY    BASE       48                       dec eax
XDIS 31d: DATAXFER  BASE       8BEB                     mov ebp, ebx
XDIS 31f: NOP       BASE       90                       nop
XDIS 320: UNCOND_BR BASE       E958FDFFFF               jmp 0x7d
XDIS 325: BINARY    BASE       45                       inc ebp
XDIS 326: LOGICAL   BASE       33C9                     xor ecx, ecx
XDIS 328: UNCOND_BR BASE       E970FDFFFF               jmp 0x9d
XDIS 32d: LOGICAL   BASE       33C9                     xor ecx, ecx
XDIS 32f: UNCOND_BR BASE       E98AFDFFFF               jmp 0xbe
XDIS 334: LOGICAL   BASE       33D2                     xor edx, edx
XDIS 336: UNCOND_BR BASE       E9A5FDFFFF               jmp 0xe0
XDIS 33b: LOGICAL   BASE       33DB                     xor ebx, ebx
XDIS 33d: NOP       BASE       90                       nop
XDIS 33e: NOP       BASE       90                       nop
XDIS 33f: NOP       BASE       90                       nop
XDIS 340: UNCOND_BR BASE       E9C8FDFFFF               jmp 0x10d
XDIS 345: DATAXFER  BASE       BEE4FFFFFF               mov esi, 0xffffffe4
XDIS 34a: BINARY    BASE       44                       inc esp
XDIS 34b: DATAXFER  BASE       892C24                   mov dword ptr [esp], ebp
XDIS 34e: BINARY    BASE       4C                       dec esp
XDIS 34f: DATAXFER  BASE       89442408                 mov dword ptr [esp+0x8], eax
XDIS 353: BINARY    BASE       48                       dec eax
XDIS 354: DATAXFER  BASE       89542418                 mov dword ptr [esp+0x18], edx
XDIS 358: DATAXFER  AVX        C5FB11442420             vmovsd qword ptr [esp+0x20], xmm0
XDIS 35e: BINARY    BASE       4C                       dec esp
XDIS 35f: DATAXFER  BASE       895C2428                 mov dword ptr [esp+0x28], ebx
XDIS 363: DATAXFER  AVX        C5FB114C2430             vmovsd qword ptr [esp+0x30], xmm1
XDIS 369: BINARY    BASE       4C                       dec esp
XDIS 36a: DATAXFER  BASE       894C2438                 mov dword ptr [esp+0x38], ecx
XDIS 36e: NOP       BASE       90                       nop
XDIS 36f: NOP       BASE       90                       nop
XDIS 370: AVX       AVX        C5F877                   vzeroupper
XDIS 373: CALL      BASE       E808A1FCFF               call 0xfffca480
XDIS 378: BINARY    BASE       48                       dec eax
XDIS 379: DATAXFER  BASE       BF20FD488C               mov edi, 0x8c48fd20
XDIS 37e: FLAGOP    BASE       D6                       salc 
XDIS 37f: COND_BR   BASE       7F00                     jnle 0x381
XDIS 381: BINARY    BASE       004883                   add byte ptr [eax-0x7d], cl
XDIS 384: IO        BASE       E4F0                     in al, 0xf0
XDIS 386: CALL      BASE       E8DB81AC0A               call 0xaac8566
XDIS 38b: SYSTEM    BASE       F4                       hlt
XDIS 38c: DATAXFER  BASE       BEE4FFFFFF               mov esi, 0xffffffe4
XDIS 391: BINARY    BASE       44                       inc esp
XDIS 392: DATAXFER  BASE       892C24                   mov dword ptr [esp], ebp
XDIS 395: BINARY    BASE       4C                       dec esp
XDIS 396: DATAXFER  BASE       89442410                 mov dword ptr [esp+0x10], eax
XDIS 39a: BINARY    BASE       4C                       dec esp
XDIS 39b: DATAXFER  BASE       894C2418                 mov dword ptr [esp+0x18], ecx
XDIS 39f: DATAXFER  AVX        C5FB11442428             vmovsd qword ptr [esp+0x28], xmm0
XDIS 3a5: BINARY    BASE       4C                       dec esp
XDIS 3a6: DATAXFER  BASE       895C2430                 mov dword ptr [esp+0x30], ebx
XDIS 3aa: DATAXFER  AVX        C5FB114C2438             vmovsd qword ptr [esp+0x38], xmm1
XDIS 3b0: BINARY    BASE       48                       dec eax
XDIS 3b1: DATAXFER  BASE       89542440                 mov dword ptr [esp+0x40], edx
XDIS 3b5: DATAXFER  AVX        C5FE7F6C2460             vmovdqu ymmword ptr [esp+0x60], ymm5
XDIS 3bb: NOP       BASE       90                       nop
XDIS 3bc: AVX       AVX        C5F877                   vzeroupper
XDIS 3bf: CALL      BASE       E8BCA0FCFF               call 0xfffca480
XDIS 3c4: BINARY    BASE       48                       dec eax
XDIS 3c5: DATAXFER  BASE       BF20FD488C               mov edi, 0x8c48fd20
XDIS 3ca: FLAGOP    BASE       D6                       salc 
XDIS 3cb: COND_BR   BASE       7F00                     jnle 0x3cd
XDIS 3cd: BINARY    BASE       004883                   add byte ptr [eax-0x7d], cl
XDIS 3d0: IO        BASE       E4F0                     in al, 0xf0
XDIS 3d2: CALL      BASE       E88F81AC0A               call 0xaac8566
XDIS 3d7: SYSTEM    BASE       F4                       hlt
XDIS 3d8: DATAXFER  BASE       BEE4FFFFFF               mov esi, 0xffffffe4
XDIS 3dd: BINARY    BASE       44                       inc esp
XDIS 3de: DATAXFER  BASE       892C24                   mov dword ptr [esp], ebp
XDIS 3e1: BINARY    BASE       4C                       dec esp
XDIS 3e2: DATAXFER  BASE       89442410                 mov dword ptr [esp+0x10], eax
XDIS 3e6: BINARY    BASE       4C                       dec esp
XDIS 3e7: DATAXFER  BASE       894C2418                 mov dword ptr [esp+0x18], ecx
XDIS 3eb: BINARY    BASE       48                       dec eax
XDIS 3ec: DATAXFER  BASE       89542420                 mov dword ptr [esp+0x20], edx
XDIS 3f0: BINARY    BASE       4C                       dec esp
XDIS 3f1: DATAXFER  BASE       895C2430                 mov dword ptr [esp+0x30], ebx
XDIS 3f5: DATAXFER  AVX        C5FB114C2438             vmovsd qword ptr [esp+0x38], xmm1
XDIS 3fb: DATAXFER  AVX        C5FB11442440             vmovsd qword ptr [esp+0x40], xmm0
XDIS 401: DATAXFER  AVX        C5FE7F5C2460             vmovdqu ymmword ptr [esp+0x60], ymm3
XDIS 407: DATAXFER  AVX        C5FE7FAC2480000000       vmovdqu ymmword ptr [esp+0x80], ymm5
XDIS 410: AVX       AVX        C5F877                   vzeroupper
XDIS 413: CALL      BASE       E868A0FCFF               call 0xfffca480
XDIS 418: BINARY    BASE       48                       dec eax
XDIS 419: DATAXFER  BASE       BF20FD488C               mov edi, 0x8c48fd20
XDIS 41e: FLAGOP    BASE       D6                       salc 
XDIS 41f: COND_BR   BASE       7F00                     jnle 0x421
XDIS 421: BINARY    BASE       004883                   add byte ptr [eax-0x7d], cl
XDIS 424: IO        BASE       E4F0                     in al, 0xf0
XDIS 426: CALL      BASE       E83B81AC0A               call 0xaac8566
XDIS 42b: SYSTEM    BASE       F4                       hlt
XDIS 42c: DATAXFER  BASE       BEE4FFFFFF               mov esi, 0xffffffe4
XDIS 431: BINARY    BASE       44                       inc esp
XDIS 432: DATAXFER  BASE       892C24                   mov dword ptr [esp], ebp
XDIS 435: BINARY    BASE       4C                       dec esp
XDIS 436: DATAXFER  BASE       89442408                 mov dword ptr [esp+0x8], eax
XDIS 43a: BINARY    BASE       4C                       dec esp
XDIS 43b: DATAXFER  BASE       894C2418                 mov dword ptr [esp+0x18], ecx
XDIS 43f: BINARY    BASE       48                       dec eax
XDIS 440: DATAXFER  BASE       89542420                 mov dword ptr [esp+0x20], edx
XDIS 444: BINARY    BASE       4C                       dec esp
XDIS 445: DATAXFER  BASE       89542428                 mov dword ptr [esp+0x28], edx
XDIS 449: DATAXFER  AVX        C5FB114C2438             vmovsd qword ptr [esp+0x38], xmm1
XDIS 44f: BINARY    BASE       4C                       dec esp
XDIS 450: DATAXFER  BASE       895C2440                 mov dword ptr [esp+0x40], ebx
XDIS 454: DATAXFER  AVX        C5FE7F642460             vmovdqu ymmword ptr [esp+0x60], ymm4
XDIS 45a: DATAXFER  AVX        C5FE7F9C2480000000       vmovdqu ymmword ptr [esp+0x80], ymm3
XDIS 463: DATAXFER  AVX        C5FE7FAC24A0000000       vmovdqu ymmword ptr [esp+0xa0], ymm5
XDIS 46c: AVX       AVX        C5F877                   vzeroupper
XDIS 46f: CALL      BASE       E80CA0FCFF               call 0xfffca480
XDIS 474: BINARY    BASE       48                       dec eax
XDIS 475: DATAXFER  BASE       BF20FD488C               mov edi, 0x8c48fd20
XDIS 47a: FLAGOP    BASE       D6                       salc 
XDIS 47b: COND_BR   BASE       7F00                     jnle 0x47d
XDIS 47d: BINARY    BASE       004883                   add byte ptr [eax-0x7d], cl
XDIS 480: IO        BASE       E4F0                     in al, 0xf0
XDIS 482: CALL      BASE       E8DF80AC0A               call 0xaac8566
XDIS 487: SYSTEM    BASE       F4                       hlt
XDIS 488: DATAXFER  BASE       BE76FFFFFF               mov esi, 0xffffff76
XDIS 48d: BINARY    BASE       41                       inc ecx
XDIS 48e: DATAXFER  BASE       8BED                     mov ebp, ebp
XDIS 490: BINARY    BASE       4C                       dec esp
XDIS 491: DATAXFER  BASE       890424                   mov dword ptr [esp], eax
XDIS 494: BINARY    BASE       4C                       dec esp
XDIS 495: DATAXFER  BASE       894C2408                 mov dword ptr [esp+0x8], ecx
XDIS 499: BINARY    BASE       48                       dec eax
XDIS 49a: DATAXFER  BASE       894C2410                 mov dword ptr [esp+0x10], ecx
XDIS 49e: BINARY    BASE       48                       dec eax
XDIS 49f: DATAXFER  BASE       89542418                 mov dword ptr [esp+0x18], edx
XDIS 4a3: BINARY    BASE       48                       dec eax
XDIS 4a4: DATAXFER  BASE       895C2420                 mov dword ptr [esp+0x20], ebx
XDIS 4a8: AVX       AVX        C5F877                   vzeroupper
XDIS 4ab: CALL      BASE       E8D09FFCFF               call 0xfffca480
XDIS 4b0: BINARY    BASE       48                       dec eax
XDIS 4b1: DATAXFER  BASE       BF20FD488C               mov edi, 0x8c48fd20
XDIS 4b6: FLAGOP    BASE       D6                       salc 
XDIS 4b7: COND_BR   BASE       7F00                     jnle 0x4b9
XDIS 4b9: BINARY    BASE       004883                   add byte ptr [eax-0x7d], cl
XDIS 4bc: IO        BASE       E4F0                     in al, 0xf0
XDIS 4be: CALL      BASE       E8A380AC0A               call 0xaac8566
XDIS 4c3: SYSTEM    BASE       F4                       hlt
XDIS 4c4: BINARY    BASE       48                       dec eax
XDIS 4c5: DATAXFER  BASE       8BCA                     mov ecx, edx
XDIS 4c7: DATAXFER  AVX        C4E1F97EC2               vmovd edx, xmm0
XDIS 4cc: UNCOND_BR BASE       EB0C                     jmp 0x4da
XDIS 4ce: DATAXFER  AVX        C4E1F97EC2               vmovd edx, xmm0
XDIS 4d3: UNCOND_BR BASE       EB05                     jmp 0x4da
XDIS 4d5: DATAXFER  AVX        C4E1F97EC2               vmovd edx, xmm0
XDIS 4da: DATAXFER  BASE       BEBEFFFFFF               mov esi, 0xffffffbe
XDIS 4df: BINARY    BASE       41                       inc ecx
XDIS 4e0: DATAXFER  BASE       8BED                     mov ebp, ebp
XDIS 4e2: BINARY    BASE       4C                       dec esp
XDIS 4e3: DATAXFER  BASE       890424                   mov dword ptr [esp], eax
XDIS 4e6: BINARY    BASE       4C                       dec esp
XDIS 4e7: DATAXFER  BASE       894C2408                 mov dword ptr [esp+0x8], ecx
XDIS 4eb: BINARY    BASE       48                       dec eax
XDIS 4ec: DATAXFER  BASE       894C2410                 mov dword ptr [esp+0x10], ecx
XDIS 4f0: BINARY    BASE       48                       dec eax
XDIS 4f1: DATAXFER  BASE       89542418                 mov dword ptr [esp+0x18], edx
XDIS 4f5: BINARY    BASE       48                       dec eax
XDIS 4f6: DATAXFER  BASE       895C2420                 mov dword ptr [esp+0x20], ebx
XDIS 4fa: NOP       BASE       90                       nop
XDIS 4fb: NOP       BASE       90                       nop
XDIS 4fc: AVX       AVX        C5F877                   vzeroupper
XDIS 4ff: CALL      BASE       E87C9FFCFF               call 0xfffca480
XDIS 504: BINARY    BASE       48                       dec eax
XDIS 505: DATAXFER  BASE       BF20FD488C               mov edi, 0x8c48fd20
XDIS 50a: FLAGOP    BASE       D6                       salc 
XDIS 50b: COND_BR   BASE       7F00                     jnle 0x50d
XDIS 50d: BINARY    BASE       004883                   add byte ptr [eax-0x7d], cl
XDIS 510: IO        BASE       E4F0                     in al, 0xf0
XDIS 512: CALL      BASE       E84F80AC0A               call 0xaac8566
XDIS 517: SYSTEM    BASE       F4                       hlt
XDIS 518: DATAXFER  AVX        C4E1F97EC2               vmovd edx, xmm0
XDIS 51d: UNCOND_BR BASE       EBBB                     jmp 0x4da
XDIS 51f: DATAXFER  AVX        C4E1F97EC2               vmovd edx, xmm0
XDIS 524: UNCOND_BR BASE       EBB4                     jmp 0x4da
XDIS 526: BINARY    BASE       48                       dec eax
XDIS 527: DATAXFER  BASE       8BCA                     mov ecx, edx
XDIS 529: DATAXFER  AVX        C4E1F97EC2               vmovd edx, xmm0
XDIS 52e: UNCOND_BR BASE       EBAA                     jmp 0x4da
XDIS 530: BINARY    BASE       48                       dec eax
XDIS 531: DATAXFER  BASE       8BCA                     mov ecx, edx
XDIS 533: DATAXFER  AVX        C4E1F97EC2               vmovd edx, xmm0
XDIS 538: UNCOND_BR BASE       EBA0                     jmp 0x4da
XDIS 53a: BINARY    BASE       48                       dec eax
XDIS 53b: DATAXFER  BASE       8B3C24                   mov edi, dword ptr [esp]
XDIS 53e: BINARY    BASE       48                       dec eax
XDIS 53f: DATAXFER  BASE       8B442408                 mov eax, dword ptr [esp+0x8]
XDIS 543: BINARY    BASE       48                       dec eax
XDIS 544: DATAXFER  BASE       8B5C2410                 mov ebx, dword ptr [esp+0x10]
XDIS 548: UNCOND_BR BASE       EB0E                     jmp 0x558
XDIS 54a: BINARY    BASE       48                       dec eax
XDIS 54b: DATAXFER  BASE       8B3C24                   mov edi, dword ptr [esp]
XDIS 54e: BINARY    BASE       48                       dec eax
XDIS 54f: DATAXFER  BASE       8B442408                 mov eax, dword ptr [esp+0x8]
XDIS 553: BINARY    BASE       48                       dec eax
XDIS 554: DATAXFER  BASE       8B5C2410                 mov ebx, dword ptr [esp+0x10]
XDIS 558: DATAXFER  BASE       BE8DFFFFFF               mov esi, 0xffffff8d
XDIS 55d: BINARY    BASE       44                       inc esp
XDIS 55e: DATAXFER  BASE       892C24                   mov dword ptr [esp], ebp
XDIS 561: BINARY    BASE       4C                       dec esp
XDIS 562: DATAXFER  BASE       89742408                 mov dword ptr [esp+0x8], esi
XDIS 566: BINARY    BASE       48                       dec eax
XDIS 567: DATAXFER  BASE       897C2410                 mov dword ptr [esp+0x10], edi
XDIS 56b: BINARY    BASE       48                       dec eax
XDIS 56c: DATAXFER  BASE       89442418                 mov dword ptr [esp+0x18], eax
XDIS 570: BINARY    BASE       48                       dec eax
XDIS 571: DATAXFER  BASE       895C2420                 mov dword ptr [esp+0x20], ebx
XDIS 575: NOP       BASE       90                       nop
XDIS 576: NOP       BASE       90                       nop
XDIS 577: NOP       BASE       90                       nop
XDIS 578: AVX       AVX        C5F877                   vzeroupper
XDIS 57b: CALL      BASE       E8009FFCFF               call 0xfffca480
XDIS 580: BINARY    BASE       48                       dec eax
XDIS 581: DATAXFER  BASE       BF20FD488C               mov edi, 0x8c48fd20
XDIS 586: FLAGOP    BASE       D6                       salc 
XDIS 587: COND_BR   BASE       7F00                     jnle 0x589
XDIS 589: BINARY    BASE       004883                   add byte ptr [eax-0x7d], cl
XDIS 58c: IO        BASE       E4F0                     in al, 0xf0
XDIS 58e: CALL      BASE       E8D37FAC0A               call 0xaac8566
XDIS 593: SYSTEM    BASE       F4                       hlt
XDIS 594: BINARY    BASE       48                       dec eax
XDIS 595: DATAXFER  BASE       8B442408                 mov eax, dword ptr [esp+0x8]
XDIS 599: BINARY    BASE       48                       dec eax
XDIS 59a: DATAXFER  BASE       8B5C2410                 mov ebx, dword ptr [esp+0x10]
XDIS 59e: NOP       BASE       90                       nop
XDIS 59f: NOP       BASE       90                       nop
XDIS 5a0: UNCOND_BR BASE       EBB6                     jmp 0x558
XDIS 5a2: BINARY    BASE       48                       dec eax
XDIS 5a3: DATAXFER  BASE       8B5C2410                 mov ebx, dword ptr [esp+0x10]
XDIS 5a7: UNCOND_BR BASE       EBAF                     jmp 0x558
XDIS 5a9: BINARY    BASE       49                       dec ecx
XDIS 5aa: DATAXFER  BASE       BACB471581               mov edx, 0x811547cb
XDIS 5af: FLAGOP    BASE       D6                       salc 
XDIS 5b0: COND_BR   BASE       7F00                     jnle 0x5b2
XDIS 5b2: BINARY    BASE       004D89                   add byte ptr [ebp-0x77], cl
XDIS 5b5: DATAXFER  BASE       97                       xchg edi, eax
XDIS 5b6: DATAXFER  BASE       A0030000E9               mov al, byte ptr [0xe9000003]
ERROR: BUFFER_TOO_SHORT Could not decode at offset: 0x5bb len: 3 PC: 0x5bb: [218CFC]
XDIS 5be: PUSH      BASE       FFF4                     push esp
# end of text section.
# Errors: 3
#XED3 DECODE STATS
#Total DECODE cycles:        444590
#Total instructions DECODE: 503
#Total tail DECODE cycles:        695362
#Total tail instructions DECODE: 553
#Total cycles/instruction DECODE: 883.88
#Total tail cycles/instruction DECODE: 1257.44
