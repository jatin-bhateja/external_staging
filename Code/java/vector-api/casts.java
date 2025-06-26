
import jdk.incubator.vector.*;

class casts {
  public static int workload(short [] res, double [] arr, int j) {
     for (int i = 0; i < arr.length; i += DoubleVector.SPECIES_256.length()) {
       DoubleVector DV = DoubleVector.fromArray(DoubleVector.SPECIES_256, arr, i);
       Vector<Short> SV = DV.castShape(ShortVector.SPECIES_64, 0);
       ((ShortVector)SV).intoArray(res, i);
     }
     return res[j];
  }

  public static void main(String [] args) {
     short [] res = new short[1024];
     double [] arr = new double[1024];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = 121.77942421415847;

     int r = 0;
     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       r += workload(res, arr, i&7);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       r += workload(res, arr, i&7);

     long time = System.currentTimeMillis() - start;
     System.out.println("[Time] = " + time + " ms [Res] = " + r);

     for (int i = 0 ; i < 8; i++) {
       System.out.println(res[i]);
     }
  }
}
