import jdk.incubator.vector.*;

public class dnz {
   public static final VectorSpecies<Double> SPECIES  = DoubleVector.SPECIES_64;

   public static void micro(double [] dst, double [] src1, double [] src2) {
      DoubleVector av = DoubleVector.fromArray(SPECIES, src1, 0);          
      DoubleVector bv = DoubleVector.fromArray(SPECIES, src2, 0);          
      av.lanewise(VectorOperators.FIRST_NONZERO, bv)
        .intoArray(dst, 0);
   }

   public static void main(String [] args) {
     double [] src1 = new double[1];
     double [] src2 = new double[1];
     double [] dst = new double[1];
     src1[0] = 1.0;
     src2[0] = 1.0;
     for (int i = 0; i < 10000; i++) {
         micro(dst, src1, src2); 
     }
     System.out.println("[dst] " + dst[0]);
   }
}
