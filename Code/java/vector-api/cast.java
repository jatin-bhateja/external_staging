
import jdk.incubator.vector.*;

class cast {
  public static long workload(long [] res, double [] arr, int i, int j) {
//     if (i == 128) {
        DoubleVector FV = DoubleVector.fromArray(DoubleVector.SPECIES_512, arr, i);
        LongVector LV = FV.viewAsIntegralLanes();
        LV.intoArray(res, i);
//     } 
     return res[j];
  }

  public static void main(String [] args) {
     long [] res = new long[1024];
     double [] arr = new double[1024];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = Double.NEGATIVE_INFINITY;

     long r = 0;
     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       r += workload(res, arr, (i + DoubleVector.SPECIES_512.length()) & 511,  i&1);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 1000000 ; i++)
       r += workload(res, arr, (i + DoubleVector.SPECIES_512.length()) & 511,  i&1);

     long time = System.currentTimeMillis() - start;
     System.out.println("[Time] = " + time + " ms [Res] = " + r);

     for (int i = 0 ; i < ByteVector.SPECIES_128.length(); i++) {
       System.out.println(res[i]);
     }
  }
}
