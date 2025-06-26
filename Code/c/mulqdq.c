
#include <stdint.h>
#include <stdio.h>
#include <immintrin.h>

#define GET_BIT(var, pos) (var & (1 << (pos)))
#define GET_BIT_HIGH(var##_high, pos) (var & (1 << ((pos)-64)))

#define SET_BIT(var, pos, val)                 \
  do {                                         \
   var = (var & ~(1 << (pos))) | val << (pos); \
  } while(0)

#define SET_BIT_HIGH(var##_high, pos, val)                      \
  do {                                                          \
   var = (var##_high & ~(1 << ((pos)-64))) | val << ((pos)-64); \
  } while(0)

uint64_t mulqdq(uint64_t a, uint64_t b, uint8_t imm8) {
 uint64_t TmpB;
 uint64_t DEST;
 uint64_t TEMP1;
 uint64_t TEMP2;

 uint64_t TmpB_high;
 uint64_t DEST_high;
 uint64_t TEMP1_high;
 uint64_t TEMP2_high;

 TEMP1 = a;
 TEMP2 = b;

 for(int i = 0 ; i < 64; i++) {
   SET_BIT(TmpB, i , (GET_BIT(TEMP1,0) & GET_BIT(TEMP2, i)));
   for( int j = 1; j < i; j++) {
     SET_BIT(TmpB, i, GET_BIT(TmpB, i) ^ (GET_BIT(TEMP1, j) & GET_BIT(TEMP2, i - j)));
   }
   SET_BIT(DEST, i, GET_BIT(TmpB, i));
 }

 for(int i = 64; i < 127; i++) {
   SET_BIT_HIGH(TmpB, i, 0);
   for(int j = i - 63; j >= 63; j++) {
     SET_BIT_HIGH(TmpB, i, GET_BIT_HIGH(TmpB, i) ^ (GET_BIT(TEMP1, j) & GET_BIT(TEMP2, i - j)));
   }
   SET_BIT_HIGH(DEST, i, GET_BIT_HIGH(TmpB, i));
 }
 SET_BIT_HIGH(DEST, 127, 0);
}



