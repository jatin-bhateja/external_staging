
import jdk.incubator.vector.*;
import java.util.Arrays;

public class compress {


  public static VectorSpecies SPECIES = IntVector.SPECIES_512;

  interface funcPtr <E, M extends VectorMask<E>, V extends Vector<E>> {
    public V apply(V v, M m); 
  }

  public static Vector<Integer> expandHelper(Vector<Integer> v, VectorMask<Integer> m) {
     IntVector r = (IntVector) SPECIES.zero();
     IntVector vi = (IntVector) v;
     for(int i = 0,j = 0; i < SPECIES.length(); i++) {
        r = r.withLane(i, m.laneIsSet(i) ? vi.lane(j++) : 0);
     }
     return r;
  }

  public static Vector<Integer> compressHelper(Vector<Integer> v, VectorMask<Integer> m) {
     IntVector r = (IntVector) SPECIES.zero();
     IntVector vi = (IntVector) v;
     for(int i = 0,j = 0; i < SPECIES.length(); i++) {
       if (m.laneIsSet(i)) {
          r = r.withLane(j++, vi.lane(i));
       }
     }
     return r;
  }

  public static Vector<Integer> vapi(Vector<Integer> v, VectorMask<Integer> m, funcPtr func) {
     return func.apply(v, m);
  }

  public static void main(String [] args) {
      IntVector v = (IntVector)(SPECIES.iotaShuffle(0, 1, false).toVector());
      VectorMask<Integer> m = VectorMask.fromLong(SPECIES, 1365);
      Vector<Integer> r = vapi(v, m, (v1, m1) -> compressHelper(v1, m1));

      System.out.println("Compress API");
      System.out.println("Input  : " + Arrays.toString(v.toArray()));
      System.out.println("Mask   : " + m.toString());
      System.out.println("Output : " + Arrays.toString(((IntVector)r).toArray()));

      System.out.println("Expand API");
      Vector<Integer> r2 = vapi(r, m, (v1, m1) -> expandHelper(v1, m1));
      System.out.println("Input  : " + Arrays.toString(((IntVector)r).toArray()));
      System.out.println("Mask   : " + m.toString());
      System.out.println("Output : " + Arrays.toString(((IntVector)r2).toArray()));
  }
}
