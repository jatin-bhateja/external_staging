
import jdk.incubator.vector.*;

class revb {
  public static final int VALUE = 5;
  public static final VectorSpecies<Short> SPECIES = ShortVector.SPECIES_256;
  public static final VectorSpecies<Integer> ISPECIES = IntVector.SPECIES_512;

  public static void workload(int [] a,  int [] r) {
     /*for (int j =  0 ; j < a.length ; j++) {
        r[j] = Short.reverseBytes((short)a[j]);
     }*/

     for (int j =  0 ; j < SPECIES.loopBound(a.length) ; j+=SPECIES.length()) {
        IntVector.fromArray(ISPECIES, a, j)
                 .castShape(SPECIES, 0)
                 .lanewise(VectorOperators.REVERSE_BYTES)
                 .castShape(ISPECIES, 0)
                 .reinterpretAsInts()
                 .intoArray(r, j);
     }
  }

  public static void main(String [] args) {
     int [] a = new int[1024];
     int [] r = new int[1024];

     for (int i = 0 ; i < 1024; i++)
        a[i] = i;
     
     for (int i = 0 ; i < 100000 ; i++)
        workload(a, r);
     
     System.out.println("Res =  " + r[10]); 
  }
}
