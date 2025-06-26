
#include<stdio.h>

// Table Size:  256 * 16 * 1 byte = 4096 bytes = 4KB
char perm[256][16] = {0};

char iota[32] = {
   0, 1, 2, 3, 4, 5, 6, 7,
   8, 9, 10, 11, 12, 13, 14, 15,
   16, 17, 18, 19, 20, 21, 22, 23,
   24, 25, 26, 27, 28, 29, 30, 31
};

long byte_shuffle_mask [4] = {
  0x7070707070707070UL,
  0x7070707070707070UL,
  0xF0F0F0F0F0F0F0F0UL,
  0xF0F0F0F0F0F0F0F0UL
};

// Generate byte level permute table
// to ease direct usage of vpshufb
void gen_perm_table_byte_16() {
  for (int i = 0; i < 256; i++) {
     int j = 0;
     int index = 0;
     int tmp = i;
     while (tmp) {
        asm volatile ("bsf %1, %0 \n\t" : "+r"(index) : "r"(tmp) : "cc");
        perm[i][j++] = 2*index;
        perm[i][j++] = 2*index + 1;
        asm volatile ("blsr %1, %0 \n\t" : "+r"(tmp) : "r"(tmp) : "cc");
     }
     for (; j < 16; j++) {
        perm[i][j] = -1;
     }
  }
  int ctr = 0;
  for (int i = 0; i < 256; i++) {
    for (int j = 0; j < 16; j++) {
        if ((ctr % 16) == 0) {
          printf("\n");
        }
        printf(" %2d,", perm[i][j]);
        ctr++;
    }
  }
  printf("\n");
}

// PERM_TABLE.DIM = 8 x 256 (8KB)
// Use 4KB integral permute table in split fashion to assemble short compress
// permute mask, this is to save generating 2MB permute table for shorts.
 
// Short vector compression permute table size for 256 bit vector(16 shorts)
//   16 x 2^16 x 1 bytes = 2^4 * 2^16 * 2^0 = 2^20 = 1 MB
// Byte vector compression permute table size for 256 bit vector (32 bytes)
//   32 x 2^32 x 1 bytes = 2^37 bytes = 128 GB

// mask (GPR) = MOVMASKPS MASK_VECTOR
void compress_short_avx2(short* res, short* src, int mask, int vlen) {
  asm volatile (
     // Prepare allones vector.
     "vpcmpeqb %%ymm2, %%ymm2, %%ymm2 \n\t"

     // Extract lower 128 bit permute vector.
     // LO_PERM = PERM_TABLE[ INDEX & 0xFF]
     // NUM_OF_COMPRESS_INDEXES = POPCNT INDEX & 0xFF
     "movl %2,    %%ecx   \n\t"
     "andl $0xFF, %%ecx   \n\t"
     "popcnt %%ecx, %%edx \n\t"
     "shl $4,    %%ecx    \n\t"
     "movsxd %%ecx, %%rcx \n\t"
     "movq %3   , %%rsi   \n\t"
     "addq %%rsi, %%rcx   \n\t"
     "vmovdqu %%ymm2, %%ymm1 \n\t"
     "movdqu (%%rcx), %%xmm1 \n\t"

     // Extract hight 128 bit permute vector.
     // HI_PERM = PERM_TABLE[ INDEX >> 8]
     // HI_PERM = HI_PERM + BROADCAST 8
     "movl %2,   %%ecx    \n\t"
     "shr $8,   %%ecx     \n\t"
     "shl $4,   %%ecx     \n\t"
     "movsxd %%ecx, %%rcx \n\t"
     "addq %%rsi,   %%rcx \n\t"
     "vmovdqu %%ymm2, %%ymm3 \n\t"
     "movdqu (%%rcx), %%xmm3 \n\t"
     "vmovdqu %%ymm3,  %%ymm7 \n\t"
     "movl $0x10,   %%eax    \n\t"
     "movd %%eax, %%xmm4  \n\t"
     "vpbroadcastb %%xmm4,      %%ymm4 \n\t"
     "vpaddb %%ymm4, %%ymm3,    %%ymm3 \n\t"
     "vpblendvb %%ymm7, %%ymm2, %%ymm3, %%ymm3 \n\t"

     // HI_PERM_SHIFT_PERM = IOTA - NUM_OF_COMPRESS_INDEXES
     "vmovdqu %4, %%ymm5  \n\t"
     "movd %%edx, %%xmm4  \n\t"
     "vpbroadcastb %%xmm4, %%ymm4   \n\t"
     "vpaddb %%ymm4, %%ymm4, %%ymm4 \n\t"
     "vpsubb %%ymm4, %%ymm5, %%ymm5 \n\t"
   
     // Shift right the HI_PERM by NUM_OF_COMPRESS_INDEXES in LO_PERM
     // HI_PERM = EMULATE_PERMW HI_PERM , HI_PERM_SHIFT_PERM
     "vpshufb %%ymm5, %%ymm3, %%ymm3 \n\t"
     
     // Assemble complete permutation mask
     // SHORT_COMPRESS_PERM_MASK = BLENDVB LO_PERM, HI_PERM, LO_PERM
     "vpblendvb %%ymm1, %%ymm3, %%ymm1, %%ymm1 \n\t"
     
     // Finally shuffle source vector as per SHORT_COMPRESS_PERM_MASK to
     // get compressed vector.
     "vmovdqu %1, %%ymm3   \n\t"
     "vperm2i128 $1, %%ymm3, %%ymm3, %%ymm6 \n\t"
     "vpshufb %%ymm1, %%ymm6, %%ymm6 \n\t"
     "vpshufb %%ymm1, %%ymm3, %%ymm3 \n\t"
     "vpaddb  %5, %%ymm1, %%ymm1 \n\t"
     "vpblendvb %%ymm1, %%ymm6, %%ymm3, %%ymm3 \n\t"
     "vmovdqu %%ymm3, %0 \n\t"

    : "=m"(*res)
    : "m"(*src), "r"(mask), "r"(perm), "m"(*iota), "m"(*byte_shuffle_mask)
    : "cc", "%ymm1", "%ymm2", "%ymm3", "%ymm4", "%ymm5", "%ymm6", "%ymm7", "%ecx", "%edx", "%eax", "%rsi" 
  );
} 

void print_mask(int mask) {
  printf("[ ");
  for (int i = 0; i < 16; i++) {
    printf("%c ", (1 << i) & mask ? 'T' : 'F');
  }
  printf(" ]");
  printf("\n");
}

void print_vec(short* vec, int vlen) {
  printf("[ ");
  for (int i = 0; i < vlen; i++) {
    printf("%d ", vec[i]);
  }
  printf(" ]");
  printf("\n");
}

int main(int argc, char * argv[]) {
  int mask = 0x0509;
  gen_perm_table_byte_16();
  short src [] = {
     10, 20, 30, 40, 50, 60, 70, 80,
     90, 100, 110, 120, 130, 140, 150, 160
  };
  short res [16];
  compress_short_avx2(res, src, mask, 16); 
  print_vec(src, 16);
  print_mask(mask);
  print_vec(res, 16);
  return 0;
}
