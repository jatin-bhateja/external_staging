
import jdk.incubator.vector.*;

class mask {
  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;

  public static int workload(boolean [] inp, boolean [] res) {
    VectorMask<Integer> mask = VectorMask.fromArray(SPECIES, inp, 0);
    mask.intoArray(res, 0);
    return mask.allTrue() == true ? 1 : 0;
  }

  public static int workload1(boolean [] inp, boolean [] res) {
    VectorMask<Integer> mask = VectorMask.fromArray(SPECIES, inp, 0);
    mask.intoArray(res, 0);
    return mask.not().trueCount();
  }

  public static int workload2(boolean [] inp, boolean [] res) {
    VectorMask<Integer> mask = VectorMask.fromArray(SPECIES, inp, 0);
    mask.intoArray(res, 0);
    return mask.allTrue() == true ? 1 : 0;
  }

  public static int workload3(boolean [] inp, boolean [] res) {
    VectorMask<Integer> mask1 = VectorMask.fromArray(SPECIES, inp, 0);
    VectorMask<Integer> mask2 = VectorMask.fromArray(SPECIES, res, 0);
    //return mask1.and(mask2).trueCount();
    //mask1.cmp(mask2).trueCount();
    return mask1.or(mask2).trueCount();
  }

  public static int workload4(boolean [] inp, boolean [] res) {
    VectorMask<Integer> mask1 = VectorMask.fromArray(SPECIES, inp, 0);
    return mask1.cast(FloatVector.SPECIES_256).trueCount();
  }

  public static int workload5(boolean [] inp, boolean [] res) {
    VectorMask<Integer> mask1 = VectorMask.fromArray(SPECIES, inp, 0);
    return mask1.firstTrue();
  }

  public static int workload6(boolean [] inp , int cnt) {
    VectorMask<Integer> mask1 = VectorMask.fromArray(SPECIES, inp, 0);
    return mask1.laneIsSet(cnt) == true ? 1 : 0;
  }

  public static int workload7(boolean [] inp, boolean [] res) {
    VectorMask<Integer> mask1 = VectorMask.fromArray(SPECIES, inp, 0);
    return mask1.lastTrue();
  }

  public static int workload8(boolean [] inp, boolean [] res) {
    VectorMask<Integer> mask1 = SPECIES.maskAll(true);
    VectorMask<Integer> mask2 = SPECIES.maskAll(false);
    return mask1.or(mask2).lastTrue();
  }

  public static boolean workload9(boolean [] inp, int i, VectorMask<Integer> mask) {
    VectorMask<Integer> mask1 = VectorMask.fromArray(SPECIES, inp, 0);
    VectorMask<Integer> mask2 = mask1.toVector().compare(VectorOperators.EQ, 1);
    return (((IntVector)(mask2.toVector())).lane(i)) == -1;
  }

  public static boolean workload10(boolean [] inp, int i) {
    VectorMask<Integer> mask1 = VectorMask.fromArray(SPECIES, inp, 0);
    VectorMask<Integer> mask2 = mask1.toVector().compare(VectorOperators.EQ, 1);
    return mask2.laneIsSet(i);
  }
  public static void main(String [] args) {
     boolean [] inp = {false, true, false, true, false, true, false, true, false, true, false, true, false, true, false, true};
     boolean [] res = new boolean[16];

     long val = 0;

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       val += workload10(inp, i & (SPECIES.length()-1)) == true ? 1 : 0;

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       val += workload10(inp, i & (SPECIES.length()-1)) == true ? 1 : 0;
     long time = System.currentTimeMillis() - start;

     System.out.println("[Time] " + time + "ms   [Res] " + val);
  }
}
