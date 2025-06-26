

// VectorAPI:
// int idx  = 0;
// ByteVector vec1 = ByteVector.SPECIES_512.broadcast(ch);
// int loopBound   = ByteVector.SPECIES_512.loopBound(ByteVector.SPECIES_512.length()); 
// for(int i = 0; i < loopBound; i+=ByteVector.SPECIES_512.length()) {
//   ByteVector vec2 =  ByteVector.fromArray(string, i);
//   VectorMask<Byte> cmpmask = vec2.lanewise(VectorOperators.EQ, vec1);
//   if (cmpmask.anyTrue()) {
//      return cmpmask.firstTrue();
//   }
// }
// int taillen = ByteVector.SPECIES_512.length() - loopBound; 
// if (taillen) {
//   VectorMask<Byte> tailmask = VectorMask.fromLong(ByteVector.SPECIES_512, (1 << taillen) - 1);
//   ByteVector vec1 =  ByteVector.fromArray(ByteVector.SPECIES_512, string, loopBound, tailmask);
//   VectorMask cmpmask = vec1.lanewise(VectorOperators.EQ, vec2);
//   return cmpmask.firstTrue();
// }
// return 0; 
//

// Opmask register based instruction sequence.
int indexOf_avx512(char * string, char ch) {
  asm volatile(
    
  );
}
