
import java.util.Arrays;
import java.nio.*;
import jdk.incubator.vector.*;

class benchmark {
   public static int [] src1;
   public static int [] src2;
   public static int [] dst;

   public static ByteBuffer bsrc1;
   public static ByteBuffer bsrc2;
   public static ByteBuffer bdst;

   public static VectorSpecies SPECIES = IntVector.SPECIES_256;

   public static int micro0(int count) { 
      int i = 0;
      for(; i < src1.length; i++) {
         dst[i] = src1[i] + src2[i];
      }
      return dst[count];
   }

   public static int micro1(int count) { 
      int i = 0;
      for( ; i < SPECIES.loopBound(src1.length); i+=SPECIES.length()) {
         IntVector vec1 = IntVector.fromArray(SPECIES, src1, i);
         IntVector vec2 = IntVector.fromArray(SPECIES, src2, i);
         vec1.lanewise(VectorOperators.ADD, vec2).intoArray(dst, i);
      }
      for(; i < src1.length; i++) {
         dst[i] = src1[i] + src2[i];
      }
      return dst[count];
   }

   // ObjectAlignmentInBytes = 32 && CompressedKlassPtr
   public static int micro2(int count) { 
      int i = 0;
      // Peel-loop
      for( ; i < 4; i++) {
         dst[i] = src1[i] + src2[i];
      }
      for( ; i < SPECIES.loopBound(src1.length-4); i+=SPECIES.length()) {
         IntVector vec1 = IntVector.fromArray(SPECIES, src1, i);
         IntVector vec2 = IntVector.fromArray(SPECIES, src2, i);
         vec1.lanewise(VectorOperators.ADD, vec2).intoArray(dst, i);
      }
      for(; i < src1.length; i++) {
         dst[i] = src1[i] + src2[i];
      }
      return dst[count];
   }


   public static void main(String [] args) {
      int size = Integer.parseInt(args[0]);
      src1 = new int[size];
      src2 = new int[size];
      dst = new int[size];
      for (int i = 0 ; i < size; i++) {
         src1[i] = src2[i] = i;
      }
     
      long Res = 0;
//      for (int i = 0 ; i < 1000000; i++) {
//         Res += micro1(i & (src1.length -1)); 
//         Res += micro2(i & (src1.length -1)); 
//      }
//      
//      Res = 0;
      Arrays.fill(dst, 0);
      long t1 = System.currentTimeMillis();
      for (int i = 0 ; i < 100000; i++) {
         Res += micro0(i & (src1.length -1)); 
      }
      long t2 = System.currentTimeMillis();
      System.out.println("Micro 1 : [Time] " + (t2-t1) + "ms [Res] " + Res); 
     
//      Res = 0;
//      Arrays.fill(dst, 0);
//      t1 = System.currentTimeMillis();
//      for (int i = 0 ; i < 100000; i++) {
//         Res += micro2(i & (src1.length -1)); 
//      }
//      t2 = System.currentTimeMillis();
//      System.out.println("Micro 2 : [Time] " + (t2-t1) + "ms [Res] " + Res); 
   }
}
