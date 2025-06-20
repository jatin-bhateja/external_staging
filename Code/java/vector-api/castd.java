
import jdk.incubator.vector.*;

class castd {
  public static int workload(byte [] res, byte [] arr, int k) {
     for (int i = 0, j = 0; i < arr.length; i += ByteVector.SPECIES_512.length(), j+=ByteVector.SPECIES_128.length()) {
       ByteVector.fromArray(ByteVector.SPECIES_512, arr, i)
                .reinterpretShape(ByteVector.SPECIES_128, 0)
                .reinterpretAsBytes()
                .intoArray(res, j);
     }
     return res[k];
  }

  public static void main(String [] args) {
     byte [] res = new byte[256];
     byte [] arr = new byte[1024];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = (byte)121;

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
