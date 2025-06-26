
import jdk.incubator.vector.*;

class test {
  public static float workload(int [] r, float [] a, int idx) {
     for (int j =  0 ; j < a.length ; j+= FloatVector.SPECIES_256.length())
        FloatVector.fromArray(FloatVector.SPECIES_256, a, j)
                   .castShape(IntVector.SPECIES_256, 0)
                   .reinterpretAsInts()
                   .intoArray(r, j);
        //r[j] = (int)(a[j]);
     return r[idx];
  }

  public static void main(String [] args) {
     int [] r = new int[1024];
     float [] a = new float[1024];

     //OFFSET = Integer.parseInt(args[0]);
     //float [] vals = {Float.NaN, Float.POSITIVE_INFINITY, Float.NEGATIVE_INFINITY, -0.0f, Float.MAX_VALUE, Float.MIN_VALUE, -Float.MAX_VALUE, -Float.MIN_VALUE};
     float [] vals = {
       +0x1.fffffep-2f,
       +0x1.0p-1f,
       +0x1.000002p-1f,
       -0x1.fffffep-2f,
       -0x1.0p-1f,
       -0x1.000002p-1f,
        5.6f,
        6.6f,
     }; 

     /*float [] vals = {
      Float.MIN_VALUE, Float.MIN_VALUE,
      Float.MIN_VALUE, Float.MIN_VALUE,
      Float.MIN_VALUE, Float.MIN_VALUE,
      Float.MIN_VALUE, Float.MIN_VALUE,
     };*/

     for (int i = 0 ; i < 8; i++)
        //a[i] = vals[i & 7];;
        a[i] = Float.NEGATIVE_INFINITY;

     float res = 0.0f;
     for (int i = 0 ; i < 100000 ; i++)
        res += workload(r, a, i & (r.length-1));

     res = 0.0f;
     long t1 = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
        res += workload(r, a, i & (r.length-1));
     long t2 = System.currentTimeMillis();

     System.out.println("[Time] " + (t2-t1) +  " ms   [Res] " + r[0]);
     for(int i = 0 ; i < vals.length; i++ ) {
        System.out.println("a[" + i + "] " + a[i] +  " -> " + r[i]);
     }
  }
}

