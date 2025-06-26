import jdk.incubator.vector.*;
import java.util.Arrays;

class bug {
  public static final int LENGTH = 1024;

  public static VectorSpecies<Integer> I_SPECIES = IntVector.SPECIES_128;

  public static int [] ia, ib, ic;

  public static int micro(int [] ia, int [] ib, int [] ic, int ctr) {
    for (int i = 0; i < LENGTH; i += I_SPECIES.length()) {
       var av = IntVector.fromArray(I_SPECIES, ia, i);
       var bv = IntVector.fromArray(I_SPECIES, ib, i);
       av.lanewise(VectorOperators.ADD, bv).intoArray(ic, i);
    }
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
