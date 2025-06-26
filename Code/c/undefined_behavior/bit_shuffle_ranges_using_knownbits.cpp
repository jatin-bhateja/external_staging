//
// Prototype of bit compress/expand value range computation
// using KnownBits infrastructure.
//

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>

template<class U,class S>
class KnownBitsLattice {
  private:
    U zeros; 
    U ones; 

  public:
    KnownBitsLattice(U lb, U ub);

    U getKnownZeros() {
      return zeros;
    }

    U getKnownOnes() {
      return ones;
    }

    long getKnownZerosCount() {
      uint64_t count = 0;
      asm volatile ("popcntq %1, %0 \n\t" : "=r"(count) : "r"(zeros) : "cc");
      return count;
    }

    long getKnownOnesCount() {
      uint64_t count = 0;
      asm volatile ("popcntq %1, %0 \n\t" : "=r"(count) : "r"(ones) : "cc");
      return count;
    }
    
    bool check_voilation() {
      // A given bit cannot be both zero or one.
      return (zeros & ones) != 0;
    }

    bool is_MSB_KnownOneBitsSet() {
      return (ones >> 63) == 1;
    }

    bool is_MSB_KnownZeroBitsSet() {
      return (zeros >> 63) == 1;
    }
};

template<class U, class S>
KnownBitsLattice<U,S>::KnownBitsLattice(U lb, U ub) {
  // To find KnownBitsLattice from a given value range
  // we first find the common prefix b/w upper and lower
  // bound, we then concertize known zeros and ones bit
  // based on common prefix.
  // e.g.
  //    lb = 00110001
  //    ub = 00111111
  //    common prefix = 0011XXXX
  //    knownbits.zeros = 11000000
  //    knownbits.ones = 00110000
  //
  // conversely, for a give knownbits value we can find
  // lower and upper value ranges. 
  // e.g.
  //      knownbits.zeros = 0x00010001
  //      knownbits.ones  = 0x10001100
  //  range.lo = knownbits.ones, this is because knownbits.ones are
  //                             guaranteed to be one.
  //  range.hi = ~knownbits.zeros, this is an optimistic upper bound
  //                               which assumes all unset knownbits.zero
  //                               are ones. 
  // Thus in above example,
  // range.lo = 0x8C
  // range.hi = 0xEE

  U lzcnt = 0;
  U common_prefix = lb ^ ub;
  asm volatile ("lzcntq %1, %0 \n\t" : "=r"(lzcnt) : "r"(common_prefix) : "cc");
  U common_prefix_mask =  lzcnt == 0 ? 0xFFFFFFFFFFFFFFFFL : ~((1ULL << (64 - lzcnt)) - 1);
  zeros = (~lb) & common_prefix_mask;
  ones = (lb) & common_prefix_mask;
}

uint64_t getPopcount(uint64_t value) {
  uint64_t cnt = 0;
  asm volatile ("popcntq %1 , %0 \n\t" : "=r"(cnt) : "r"(value) : "cc");
  return cnt;
}

int main(int argc, char * argv[]) {
  if (argc != 5) {
    return printf("Unexpected input <app> <mask.lo> <mask.hi> <src.lo> <src.hi> ! \n");
  }  

  long cnt = 0;
  long mask_lo = atol(argv[1]);
  long mask_hi = atol(argv[2]);
  long src_lo = atol(argv[3]);
  long src_hi = atol(argv[4]);

  printf("mask.lo = %ld \n", mask_lo);
  printf("mask.hi = %ld \n", mask_hi);
  printf("src.lo = %ld \n", src_lo);
  printf("src.hi = %ld \n", src_hi);

  KnownBitsLattice<uint64_t, int64_t> mask_bits(mask_lo, mask_hi);
  printf("mask.bits.zeros = 0x%lx \n", mask_bits.getKnownZeros());
  printf("mask.bits.zeros_count = %ld \n", mask_bits.getKnownZerosCount());
  printf("mask.bits.ones = 0x%lx \n", mask_bits.getKnownOnes());
  printf("mask.bits.ones_count = %ld \n", mask_bits.getKnownOnesCount());

  assert(!mask_bits.check_voilation());

  KnownBitsLattice<uint64_t, int64_t> src_bits(src_lo, src_hi);
  printf("src.bits.zeros = 0x%lx \n", src_bits.getKnownZeros());
  printf("src.bits.zeros_count = %ld \n", src_bits.getKnownZerosCount());
  printf("src.bits.ones = 0x%lx \n", src_bits.getKnownOnes());
  printf("src.bits.ones_count = %ld \n", src_bits.getKnownOnesCount());

  assert(!src_bits.check_voilation());

  // Bit compression selects the source bits corresponding to true mask bits,
  // packs them and places them contiguously at destination bit positions
  // starting from least significant bit, remaining higher order bits are set
  // to zero.

  // In order to compute optimistic_upper_bound, barring MSB bit all unset known.zero bits
  // can be assumed to be set to 1, also we can assume corresponding source bits are set to 1, 
  // thereby resulting into a max int value, else compute the upper bound through popcount of
  // flipped known zero bits.
  uint64_t bit_compress_optimistic_upper_bound =  mask_bits.getKnownZerosCount() == 0 ?
                                                  0x7FFFFFFFFFFFFFFF : (1UL << (64 - mask_bits.getKnownZerosCount())) - 1;

  //  Q. For bit compression, can we find maximum value less than optimistic_upper_bound where we assume
  //     all the bits corresponding to source.knownbits.ones are set ?
  //  A. Yes, again by taking into consideration source.knownbits.zeros we can find a maximum value less than
  //     optimistic_upper_bound. Bit compression picks the source bits corresponding to set mask bits, packs
  //     them and places them at destination bit positions starting from least significant bit.
  //     Reset optimistic_upper_bound bits corresponding to set mask bits where source knownbits.zeros is set to 1.

  auto src_zeros = src_bits.getKnownZeros();
  auto constrained_mask = mask_bits.getKnownZerosCount() == 0 ? 0x7FFFFFFFFFFFFFFF : ~mask_bits.getKnownZeros();
  constrained_mask = constrained_mask & ~src_zeros;
  uint64_t constrained_bit_compress_upper_bound =  (1UL << getPopcount(constrained_mask)) - 1;

  // In order to compute optimistic_lower_bound, we refer mask.knownbits.ones, if all the bits are set then
  // minimum value is computed by assuming all but MSB bits as zero, else minimum value will always be a non-negative
  // value, this is based on assumption that source bits corresponding to set mask bits were zero.
  uint64_t bit_compress_optimistic_lower_bound = mask_bits.getKnownOnesCount() == 64 ? 0x8000000000000000 : 0;

  //  Q. For bit compression, can we find a minimum value greater than optimistic_lower_bound
  //  A. Yes, optimistic_lower_bound for mask with knownbits.ones.cnt as 64 is minimum int value which is based on the assumption
  //     that all source bits corresponding to true mask bits barring most significant bit are set to 0. By consulting
  //     source.knownbits.ones we can find a value greater than optimistic_lower_bound
  //     e.g.
  //          mask.knownbits.ones = 0xFFFFFFFFFFFFFFFF  (-1)
  //          optimistic_lower_bound = 0x8000000000000000 which assume that all but MSB bits are set to zero.
  //          if 
  //             source.knownbits.ones = 0xF0, i.e. bit 4-7 are guaranteed ones 
  //          then
  //             result.lo = 0x80000000000000F0 which is greater than optimistic_lower_bound
  uint64_t constrained_bit_compress_lower_bound = bit_compress_optimistic_lower_bound;
  if (bit_compress_optimistic_lower_bound < 0) {
    constrained_bit_compress_lower_bound |= mask_bits.getKnownOnes() & src_bits.getKnownOnes(); 
  } else {
    constrained_bit_compress_lower_bound = (1UL << getPopcount(mask_bits.getKnownOnes() & src_bits.getKnownOnes())) - 1;
  }

  // Bit expansion is a reverse process, which sequentially reads source bits
  // starting from LSB and places them at bit positions in result value where
  // corresponding mask bits are 1. Thus, bit expansion for non-negative mask
  // value will always generate a +ve value, this is because sign bit of result
  // will never be set to 1 as corresponding mask bit is always 0.

  // To compute optimistic upper bound for bit expansion, we assume all but last read source bit to be one,
  // number of source bits read equals popcount of mask value.
  uint64_t bit_expansion_optimistic_upper_bound = (~mask_bits.getKnownZeros() | mask_bits.getKnownOnes()) & ~0x8000000000000000;

  //  Q. For bit expansion can we find an upper bound lesser than optimistic_upper_bound ?
  //  A. Yes, we can find a maximum value lower than optimistic upper bound by taking into consideration
  //     source.knownbits.zeros bits, if any of the lower order n source bits where n equals popcount of mask
  //     are zero then we are sure to find a maximum value less than optimistic upper bound
  //     e.g.
  //     mask = (~mask_bits.zero | mask_bits.ones) =  0xFF00FF00
  //     optimistic_upper_bound = 0xFF00FF00
  //     if (source.knownbits.zero | ~source.knownbits.ones) = 0xFF
  //     then lower order 8 bits of src are always set to 0, thus bit expansion which reads
  //     16 least significant source bits, only assumes upper 8 bits to be 1.
  //     constrained_upper_bound = 0xFF000000 

  uint64_t num_lower_order_source_bits_read = getPopcount(bit_expansion_optimistic_upper_bound);
  uint64_t lower_order_source_bits = ~((src_bits.getKnownZeros() | ~src_bits.getKnownOnes()) & ((1UL << lower_order_source_bits) -1));
  uint64_t constrained_bit_expansion_upper_bound = 0;
  asm volatile ("pdepq %2 , %1, %0 \n\t" : "=r"(constrained_bit_expansion_upper_bound) :
                                           "r"(lower_order_source_bits) ,
                                           "r"(bit_expansion_optimistic_upper_bound) : "cc");

  // Q. Can we use mask_bits.knownbits.ones.MSB to ascertain a -ve result ?
  // A. Since results is dependent on lower order source bits values and expansion simply scatters those
  // bits at result bit positions corresponding to set mask bits, hence just based on set MSB we cannot
  // guarantee a -ve result, also if source.knownbits.ones.cnt == 64 then result is solely
  // a function of mask_bits ones count.
  if (src_bits.getKnownOnesCount() == 64) {
     constrained_bit_expansion_upper_bound = (~mask_bits.getKnownZeros() | mask_bits.getKnownOnes());
  }

  // To compute optimistic lower bound for bit expansion, we check mask.knownbits.zeros.MSB bit, 
  // if it's set, bit expansion will always result in a non-negative value and we can consider
  // lowest non-negative value as the lower bound else result should be lowest integral
  // value i.e. 0x8000000000000000

  // Q. Why do we not base our assumptions to compute optimistic_lower_bound on is_MSB_KnownOneBitsSet ?
  // A. This is becasue even if it returns false and mask.knownbits.zeros.MSB is zero actual mask value
  //    may still have its most significant sign bit set.
  //    Thus golden rule to check for non-negative number is mask.knownbits.zero.MSB should be set.

  uint64_t bit_expansion_optimistic_lower_bound = mask_bits.is_MSB_KnownZeroBitsSet() ? 0 : 0x8000000000000000;

  // Q. For bit expansion, can we find a minimum value greater than optimistic lower bound ?
  // A. Yes, it can be done by first computing the knownbits from source value range, then consider
  //    lower order source bit expansion.
  // e.g.
  //       mask.knownbits.ones = 0x000000000000F0F0
  //       mask.knownbits.zeros = 0x8000000000000000
  // 
  //       Here, mask.knownbits.zeros.MSB is 1, this means result will always be a non-negative value, and optimistic
  //       lower bound can be assumed to be minimum non-negative value i.e. 0
  // 
  //       optimistic_lower_bound = 0
  //       max_num_lower_order_source_bits_read = getPopcount((~mask.knownbits.zeros | mask.knownbits.ones))
  //       source.knownbits.ones = 0x0F00
  //       source.knownbits.zeros = 0x00F0
  //
  //       source_one_bits = (source.knownbits.ones | ~source.knownbits.zeros)
  //                     = 0xF00 | ~0x00F0
  //                     = 0xF00 | 0xFF0F
  //                     = 0xFF0F 
  // 
  //       Consider first set knownonebits with bit index less than max_num_lower_order_source_bits_read
  //       to compute next lower value greater than optimistic_lower_bound 0
  //       
  //       Thus, minimum lower bound greater than optimistic_lower_bound is 0x001.
  //       
  //   If mask.knownbits.ones.MSB is 1, then result may a -ve value, I am saying maybe because it depends on the last read source bit
  //   if its 1 then results is a -ve value else not. Last read source bit depends on the popcount of actual mask, with mask.knownbits.ones
  //   we can only partially determine number of set mask bits, remaining bits i.e. ~mask.knownbits.zeros are unknown at
  //   compile time. Thus, its not possible to make any assumption based on unknown mask popcount. 
  //  
  // Overall, KnownBits information help us constrain optimistic value range bounds.

  uint64_t constrained_bit_expansion_lower_bound = bit_expansion_optimistic_lower_bound;
  // Try to find lower bound greater than optimistic_lower_bound
  if (mask_bits.is_MSB_KnownZeroBitsSet()) {
     uint64_t source_one_bits = src_bits.getKnownOnes() | ~src_bits.getKnownZeros();
     uint64_t first_set_bit = 0;
     asm volatile ("bsfq %1 , %0 \n\t" : "=r"(first_set_bit) : "r"(source_one_bits) : "cc");
     constrained_bit_expansion_lower_bound |= (1UL << first_set_bit);
  }
  
  printf("\nbit_compress_optimistic_upper_bound = %lx \n", bit_compress_optimistic_upper_bound);
  printf("constrained_bit_compress_upper_bound= %lx \n", constrained_bit_compress_upper_bound);
  printf("bit_compress_optimistic_lower_bound = %lx \n", bit_compress_optimistic_lower_bound);
  printf("constrained_bit_compress_lower_bound = %lx \n", constrained_bit_compress_lower_bound);

  printf("bit_expansion_optimistic_upper_bound = %lx \n", bit_expansion_optimistic_upper_bound);
  printf("constrained_bit_expansion_upper_bound= %lx \n", constrained_bit_expansion_upper_bound);
  printf("bit_expansion_optimistic_lower_bound = %lx \n", bit_expansion_optimistic_lower_bound);
  printf("constrained_bit_expansion_lower_bound = %lx \n", constrained_bit_expansion_lower_bound);
  
  assert(bit_compress_optimistic_upper_bound >= constrained_bit_compress_upper_bound);
  assert(bit_compress_optimistic_lower_bound <= constrained_bit_compress_lower_bound);

  assert(bit_expansion_optimistic_upper_bound >= constrained_bit_expansion_upper_bound);
  assert(bit_expansion_optimistic_lower_bound <= constrained_bit_expansion_lower_bound);
  
  return 0;
}
