import jdk.incubator.vector.*;

public class shufflei {
  public static int micro() {
     VectorShuffle<Integer> iota = IntVector.SPECIES_PREFERRED.iotaShuffle(0, 1, true);
     return iota.toVector().rearrange(iota).reinterpretAsInts().lane(1);
  }
  public static void main(String [] args) {
     int res = 0;
     for(int i = 0; i < 100000; i++) {
        res += micro();
     }
     long t1 = System.currentTimeMillis();
     for(int i = 0; i < 100000; i++) {
        res += micro();
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[time] " + (t2-t1) + "ms  [res]" + res);
  }
}
