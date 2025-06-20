
import jdk.incubator.vector.*;
import java.util.Arrays;

public class compress1 {
  public static VectorSpecies SPECIES = IntVector.SPECIES_256;

  public static Vector<Integer> expandHelper(Vector<Integer> v, VectorMask<Integer> m) {
     IntVector r = (IntVector) SPECIES.zero();
     IntVector vi = (IntVector) v;
     for(int i = 0,j = 0; i < SPECIES.length(); i++) {
        r = r.withLane(i, m.laneIsSet(i) ? vi.lane(j++) : 0);
     }
     return r;
  }

  public static int compressHelper(Vector<Integer> v, VectorMask<Integer> m, int ctr) {
     IntVector r = (IntVector) SPECIES.zero();
     IntVector vi = (IntVector) v;
     for(int i = 0,j = 0; i < SPECIES.length(); i++) {
       if (m.laneIsSet(i)) {
          r = r.withLane(j++, vi.lane(i));
       }
     }
     return r.lane(ctr);
  }

  public static int compressHelper3(Vector<Integer> v, VectorMask<Integer> m, int ctr) {
     IntVector r = (IntVector) SPECIES.zero();
     IntVector vi = (IntVector) v;
     for(int i = 0,j = 0; i < SPECIES.length(); i++) {
       if (m.laneIsSet(i)) {
          r = r.withLane(j++, vi.lane(i));
       }
     }
     return r.lane(ctr);
  }

  public static VectorShuffle<Integer> maskToShuffle(VectorMask<Integer> m) {
     int i = 0;
     IntVector indices = (IntVector)SPECIES.zero();
     while(m.trueCount() > 0) {
        int set_pos = m.firstTrue();
        indices = indices.withLane(i++, set_pos);
        m = m.andNot(VectorMask.fromLong(SPECIES, 1 << set_pos));
     }
     return indices.toShuffle();
  }

  public static int compressHelper2(Vector<Integer> v, VectorMask<Integer> m, int ctr) {
     IntVector vi = (IntVector) v;
     VectorShuffle<Integer> indices = maskToShuffle(m);
     IntVector r = ((IntVector)SPECIES.zero()).blend(vi.rearrange(indices), VectorMask.fromLong(SPECIES, (1 << m.trueCount())-1));
     return r.lane(ctr);
  }

  public static void main(String [] args) {
      IntVector v = (IntVector)(SPECIES.iotaShuffle(0, 1, false).toVector());
      VectorMask<Integer> m = VectorMask.fromLong(SPECIES, 1365);
     
      long res = 0;
      for(int i = 0; i < 900000; i++) {
        res +=  compressHelper(v, m, i & (SPECIES.length()-1));
      }

      long t1 = System.currentTimeMillis();
      for(int i = 0; i < 900000; i++) {
        res +=  compressHelper(v, m, i & (SPECIES.length()-1));
      }
      long t2 = System.currentTimeMillis();

      System.out.println("[Time] " + (t2-t1) + " ms  [Res] " + res);
  }
}
