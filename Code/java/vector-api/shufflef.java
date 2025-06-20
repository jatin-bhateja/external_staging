import jdk.incubator.vector.*;

public class shufflef {
  public static short micro() {
     VectorShuffle<Float> iota = FloatVector.SPECIES_256.iotaShuffle(0, 1, true);
     return iota.cast(ShortVector.SPECIES_128).toVector().reinterpretAsShorts().lane(1);
  }
  public static void main(String [] args) {
     short res = 0;
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
