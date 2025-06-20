
import jdk.incubator.vector.*;

class reinterpretb {
  public static void workload(byte [] arr, byte [] res) {
     Vector<Byte> V1 = ByteVector.fromArray(ByteVector.SPECIES_128, arr, 0);
     Vector<Byte> V2 = V1.reinterpretShape(IntVector.SPECIES_512, 0)
                         .reinterpretShape(IntVector.SPECIES_128, 0)
                         .reinterpretAsBytes();
     ((ByteVector)(V2)).intoArray(res, 0);
  }

  public static void main(String [] args) {
     byte [] arr = new byte[1024];
     byte [] res = new byte[1024];
     for (int i = 0 ; i < arr.length ; i++)
       arr[i] = (byte)i;

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(arr, res);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       workload(arr, res);

     long time = System.currentTimeMillis() - start;
     System.out.println("[Time] " + time + " ms");

     for (int i = 0 ; i < 8 ; i++) {
       System.out.println("r["+ i + "] = " + res[i]);
     }
  }
}

