
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
     "vpcmpeqb %%xmm2, %%xmm2, %%xmm2 \n\t"

     // Extract lower 128 bit permute vector.
     // LO_PERM = PERM_TABLE[ INDEX & 0xFF]
     // NUM_OF_COMPRESS_INDEXES = POPCNT INDEX & 0xFF
     "movl %2,    %%ecx   \n\t"
     "shl $4,    %%ecx    \n\t"
     "movsxd %%ecx, %%rcx \n\t"
     "movq %3   , %%rsi   \n\t"
     "addq %%rsi, %%rcx   \n\t"
     "vmovdqu %%xmm2, %%xmm1 \n\t"
     "movdqu (%%rcx), %%xmm1 \n\t"

     // Finally shuffle source vector as per SHORT_COMPRESS_PERM_MASK to
     // get compressed vector.
     "vmovdqu %1, %%xmm3   \n\t"
     "vpshufb %%xmm1, %%xmm3, %%xmm3 \n\t"
     "vmovdqu %%xmm3, %0 \n\t"

    : "=m"(*res)
    : "m"(*src), "r"(mask), "r"(perm)
    : "cc", "%xmm1", "%xmm2", "%xmm3", "%rcx", "%rsi" 
  );
} 

void print_mask(int mask) {
  printf("[ ");
  for (int i = 0; i < 8; i++) {
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
  int mask = 0x11;
  gen_perm_table_byte_16();
  short src [8] = {
     10, 20, 30, 40, 50, 60, 70, 80
  };
  short res [8];
  compress_short_avx2(res, src, mask, 8); 
  print_vec(src, 8);
  print_mask(mask);
  print_vec(res, 8);
  return 0;
}
