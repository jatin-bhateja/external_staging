
import jdk.incubator.vector.*;

class test {
  public static float workload(short [] r, float [] a, int idx) {
     for (int j =  0 ; j < a.length ; j++) {
        r[j] = Float.floatToFloat16(a[j]);
     }
     return r[idx];
  }

  public static void main(String [] args) {
     short [] r = new short[1024];
     float [] a = new float[1024];

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

     for (int i = 0 ; i < 8; i++)
        a[i] = (float)-i;

     int res = 0;
     for (int i = 0 ; i < 100000 ; i++)
        res += workload(r, a, i & (r.length-1));

     res = 0;
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

