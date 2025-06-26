import jdk.incubator.vector.*;
import java.util.Arrays;

class bug1 {
  public static final int LENGTH = 1024;

  public static VectorSpecies<Integer> I_SPECIES = IntVector.SPECIES_PREFERRED;

  public static int [] ia, ib, ic;

  public static int micro(int [] ia, int [] ib, int [] ic, int ctr) {
    var av = IntVector.fromArray(I_SPECIES, ia, 0);
    for (int i = 0; i < LENGTH; i += I_SPECIES.length()) {
       var bv = IntVector.fromArray(I_SPECIES, ib, i);
       av = av.and(bv);
    }
    av.intoArray(ic, 0);
    return ic[ctr];
  }

  public static void main(String [] args) {
    int res = 0;
    ia = new int[LENGTH];
    ib = new int[LENGTH];
    ic = new int[LENGTH];
    Arrays.fill(ia, 10);
    Arrays.fill(ib, 10);
    for (int i = 0; i < 10000; i++) {
       res += micro(ia, ib, ic, i & (I_SPECIES.length() - 1));
    }
    System.out.println(res);
  }
}
