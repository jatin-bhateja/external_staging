
import jdk.incubator.vector.*;
import java.util.Arrays;

public class selective_stores {
  static VectorSpecies<Long> SPECIES = LongVector.SPECIES_256;

  // Species specific mask-index map applicable for Short64,Int128,Long256.
  static int SHUFFLES [][] = {
     // SHUFFLE INDICES   : MASK 
     {0,0,0,0},     //    : 0 ALL FALSE
     {0,0,0,0},     //    : 1 (0000)
     {1,0,0,0},     //    : 2 (0010)
     {0,1,0,0},     //    : 3 (0011)

     {2,0,0,0},     //    : 4 (0100)
     {0,2,0,0},     //    : 5 (0101)
     {1,2,0,0},     //    : 6 (0110)
     {0,1,2,0},     //    : 7 (0111) 

     {3,0,0,0},     //    : 8 (1000)
     {0,3,0,0},     //    : 9 (1001)
     {1,3,0,0},     //    : 10 (1010)
     {0,1,3,0},     //    : 11 (1011)

     {2,3,0,0},     //    : 12 (1100)
     {0,2,3,0},     //    : 13 (1101)
     {1,2,3,0},     //    : 14 (1110)
     {0,1,2,3}      //    : 15 (1111)
  };

  static long [] INPUT = {10,20,30,40};

  static VectorShuffle<Long> maskToShulle(VectorMask<Long> mask) {
     return VectorShuffle.fromArray(SPECIES, SHUFFLES[(int)mask.toLong()], 0);
  }

  public static long [] compressInputs(VectorMask<Long> mask) {
     LongVector vec = LongVector.fromArray(SPECIES, INPUT, 0);
     return LongVector.broadcast(SPECIES, 0)
            .blend(vec.rearrange(maskToShulle(mask)), 
                                 VectorMask.fromLong(SPECIES, ((1 << mask.trueCount()) - 1)))
            .toArray();
  }

  public static void main(String ... args) {
     long mask = Long.parseLong(args[0]);
     VectorMask vmask = VectorMask.fromLong(SPECIES, mask);
     long [] compressed = compressInputs(vmask);
     System.out.println("Original Input    : " + Arrays.toString(INPUT));
     System.out.println("Filter Mask       : " + mask); 
     System.out.println("Compressed output : " + Arrays.toString(compressed)); 
  }
}
