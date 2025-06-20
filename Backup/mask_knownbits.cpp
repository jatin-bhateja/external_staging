#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

template<U,S>
class KnownBits {
  private:
    U zeros; 
    U ones; 

  public:
    KnownBits(U lb, U ub);

    U getKnownZeros() {
      return zeros;
    }

    U getKnownOnes() {
      return ones;
    }

    long getKnownZerosCount() {
      uint64_t count = 0;
      asm volatile ("popcntq %1, %0 \n\t", "=r"(count) , "r"(zeros) : "cc");
      return count;
    }

    long getKnownOnesCount() {
      uint64_t count = 0;
      asm volatile ("popcntq %1, %0 \n\t", "=r"(count) , "r"(ones) : "cc");
      return count;
    }
    
    bool check_voilation() {
      return ~bits.zeros & bits.ones != 0;
    }

    bool is_MSB_KnownOneBitsSet() {
      return (bits.ones >> 64) == 1;
    }
};

KnownBits<U,S>::KnownBits(U lb, U ub) {
  U lzcnt = 0;
  U common_prefix = lb ^ ub;

  asm volatile ("lzcntq %1, %0 \n\t" : "=r"(lzcnt) : "r"(common_prefix) : "cc");

  common_prefix_mask |=  ~(1ULL << (64 - lzcnt)) - 1;

  zeros = (~lb) & common_prefix_mask;

  ones = (lb) & common_prefix_mask;
}

int main(int argc, char * argv[]) {
  if (argc != 3) {
    return printf("Unexpected input <app> <lo> <hi>! \n");
  }  
  long cnt = 0;
  long mask_lo = atol(argv[1]);
  long mask_hi = atol(argv[2]);

  printf("mask.lo = %ld \n", mask_lo);
  printf("mask.hi = %ld \n", mask_hi);

  long res_hi = 0x7FFFFFFFFFFFFFFFL;
  long res_lo = 0x8000000000000000L;

  KnownBits<uint64_t, int64_t> bits;
  printf("bits.zeros = %ld \n\t", bits.zeros);
  printf("bits.zeros_count = %ld \n\t", bits.getKnownZerosCount());
  printf("bits.ones = %ld \n\t", bits.ones);
  printf("bits.ones_count = %ld \n\t", bits.getKnownOnesCount());

  assert(bits.check_voilation());

  int max_projected_value_bit_compress = bits.getKnownZerosCount() == 0 ? 0x7FFFFFFFFFFFFFFF : (1UL << (64 - bits.getKnownZerosCount())) - 1;
  // Justification for above rule, if all known.zero bits are unknown then we can safely assume them to be 1, and also assume corresponding
  // source bits are set to 1, thereby resulting into a max int, else compute the max value bound by flipping the known zero bits.

  int min_projected_value_bit_compress = bits.getKnownOnesCount() == 64 ? 0x8000000000000000 : 0;

  // Justification for above rule, if all known.one bits are set then minimum value is computed by assuming all but MSB bits as zero
  // Else minimum value will always be a non-negative value, since we cannot quantify minimum value with knownmask bits and unknown
  // source value hence we take 0 as the minimum value by assuming all source bits corresponding to known.one mask bits are set to zero. 
  
  int max_projected_value_bit_expansion = ~bits.zeros & 0x8000000000000000;
  // If sign bit is 1, then to compute max value we assume last read source bit to be zero, i.e.
  // simply flip the sign bit, optimistically, we flip all known zero bits assuming other bits 
  // will be 1 and corresponding source bits will also be one.

  int min_projected_value_bit_expansion = bits.is_MSB_KnownOneBitsSet() ? 0x8000000000000000 : 0;
  // If knownOneBits.MSB is set, we can assume bits corresponding to other known one bits to be zero. Thereby
  // resulting into a min_int value.
  // If KownZeroBits.MSB is set, then result will always be a non-negative value, minimum mask value in this case
  // will equal to KnownOneBits, but first n source bits where n equals number of set mask bit may be zero, hence
  // minimum result value is 0.

  // Q. What is the advantage of value range to KnownBits conversion in this case ?
  // A. Advantage lies in contraining the upper bound of result value range. 
  // 
  // Q. Can we find a minimum value greater than 0x8000000000000000 if most significant bit of known.onebits of mask is set ?
  // A. Yes, it can be done by first computing the knownbits of source from its value range, then consider
  //    lower order known bits for bit expansion, if lower order knownbits.ones is greater than 1, then we
  //    are sure to find a value greater than 0x8000000000000000 if mask.knownbits.ones has more than one 
  //    set bits.
  // e.g.
  //       Mask.KnownBits.ones = 0x80008000800080000
  //       Source.KnownBits.ones = 0xF
  // 
  // Lets consider above values for bit expansion case, every possible mask value will surely have 4 bits set, since KnownBits.ones hase 4 set bit
  // dispersed across 64 bit mask.
  // This means, we will defiantly be reading lower order 4 bits of source, since bit expansion reads first n bits starting from least
  // significant source bit where n is equal to popcount of mask, and it places these bits in destination at bit position corresponding to 
  // set mask bits, thus with 4 known set mask bits we are sure to read first four bits of source and if there are more than one set bits
  // out of those 4 bits then we are sure to find a minimum value greater than 0x80008000800080000.
  // 
  //  Q. Can we find a maximum value lesser than 0x7FFFFFFFFFFFFFFF with known bits information of mask ?
  //  A. Certainly, maximum number of set mask bits can be found by flipping the knownbits.zeros, thus optimistically
  //     maximum bit expansion value will assume that n lower order source bits, where n equals popcount of ~knownbits.zero
  //     will all hold 1 values, there is a minor caveat here, which is if most significant ~knownbits.zero is set then we
  //     discard it unless knownbits.one.msb is set, as we want to find maximum possible non-negative value.
  //     Its always an interplay of knownbits.zeros and knownbits.ones which can be used to compute maximum projected value.
  //     Now, what we have found in above analysis is an optimistic upper bound of bit expansion since we assumed that all
  //     the lower order n bits are set, we can further find a maximum value lower than optimistic upper bound by
  //     taking into consideration knownbits.zeros bits information of input, if any of the lower order n source bits are
  //     zero then we are sure to find a maximum value less than optimistic upper bound.
  //     i.e.  bound = optimistic_upper_bound;
  //           for (int i = 0; i < n ; i++) {
  //              bit_post_mask   =  i'th set mask bit position
  //              source_bit =  i'th source knownbits.zeros
  //              optimistic_upper_bound &= source_bit << bit_post_mask
  //           }
  //
  //  Q. For bit compression, can we find maximum value less than optimistic_upper_bound where we assume
  //     all the bits corresponding to source.knownbits.ones are set ?
  //  A. Yes, again by taking into consideration source.knownbits.zeros we can find a maximum value less than
  //     optimistic_upper_bound. Bit compression picks the source bits corresponding to set mask bits, packs
  //     them and places them at destination bit positions starting from least significant bit.
  //     If one of the source bit of knownbits.zeros  corresponding to set bits of ~knownbits.zeros.
  //     is zero then we can find maximum value lower than optimistic_upper_bound.
  //
  //  Q. For bit compression, can we find a minimum value greater than optimistic_lower_bound
  //  A. Yes, optimistic_lower_bound for mask when knownbits.ones.cnt is 64 is minimum int value which is based on the assumption
  //     that all source bits corresponding to true mask bits are 1. By consulting source.knownbits.zeros we can find a value greater
  //     than optimistic_lower_bound i.e. all the results bits corresponding to set source.knownbits.ones will be ones.
  //     e.g.
  //          mask.knownbits.ones = 0xFFFFFFFFFFFFFFFF  (-1)
  //          optimistic_lower_bound = 0x8000000000000000 which assume that all but MSB bits are set to zero.
  //          if 
  //             source.knownbits.ones = 0xF0, i.e. bit 4-7 are guaranteed ones 
  //          then
  //             result.lo = 0x80000000000000F0 which is greater than optimistic_lower_bound

  printf("cnt = %ld \n", cnt);

  printf("res_hi = %ld \n", res_hi);
  printf("res_lo = %ld \n", res_lo);
}
