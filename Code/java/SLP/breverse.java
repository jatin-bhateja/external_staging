
import java.util.Random;
import jdk.incubator.vector.*;

class breverse {

  public static int LEN;

  public static final VectorSpecies SPECIES = IntVector.SPECIES_256;

  // embedded bcast use case. one/two consumers.
  // dumping constant arrays will have bloated constant
  // tables.
  public static int mask1bitR = 0xaaaaaaaa;
  public static int mask1bitL = 0x55555555;
  public static int mask2bitR = 0xcccccccc;
  public static int mask2bitL = 0x33333333;
  public static int mask4bitR = 0xf0f0f0f0;
  public static int mask4bitL = 0x0f0f0f0f;
  public static int mask8bitR = 0xff00ff00;
  public static int mask8bitL = 0x00ff00ff;

  public static int workload(int [] a, int [] r, int ctr) {
     int i = 0;
     int retval = 0;
     for (; i < LEN ; i++) {
        r[i] = Integer.reverse(a[i]);
     }
     return i;
  }

  public static int workload_vector(int [] a, int [] r, int ctr) {
     int i = 0;
     int retval = 0;

     for (; i < SPECIES.loopBound(LEN) ; i+=SPECIES.length()) {
        IntVector v1 = IntVector.fromArray(SPECIES, a, i);

        // BIT_REV start // 
        // BYTE_REV start // 

        IntVector v2 = v1.lanewise(VectorOperators.ROL, 16);

        IntVector v3 = v2.lanewise(VectorOperators.AND, mask8bitR);
        v3 = v3.lanewise(VectorOperators.LSHR, 8);
        IntVector v4 = v2.lanewise(VectorOperators.AND, mask8bitL);
        v4 = v4.lanewise(VectorOperators.LSHL, 8);
        v3 = v3.lanewise(VectorOperators.OR, v4);
        v2 = v3;

        // BYTE_REV end // 

        v3 = v2.lanewise(VectorOperators.AND, mask4bitR);
        v3 = v3.lanewise(VectorOperators.LSHR, 4);
        v4 = v2.lanewise(VectorOperators.AND, mask4bitL);
        v4 = v4.lanewise(VectorOperators.LSHL, 4);
        v3 = v3.lanewise(VectorOperators.OR, v4);
        v2 = v3;

        v3 = v2.lanewise(VectorOperators.AND, mask2bitR);
        v3 = v3.lanewise(VectorOperators.LSHR, 2);
        v4 = v2.lanewise(VectorOperators.AND, mask2bitL);
        v4 = v4.lanewise(VectorOperators.LSHL, 2);
        v3 = v3.lanewise(VectorOperators.OR, v4);
        v2 = v3;

        v3 = v2.lanewise(VectorOperators.AND, mask1bitR);
        v3 = v3.lanewise(VectorOperators.LSHR, 1);
        v4 = v2.lanewise(VectorOperators.AND, mask1bitL);
        v4 = v4.lanewise(VectorOperators.LSHL, 1);
        v3 = v3.lanewise(VectorOperators.OR, v4);

        // BIT_REV end // 
        v3.intoArray(r, i);
     }

     for (; i < LEN ; i++) {
        r[i] = Integer.reverse(a[i]);
     }
     return i;
  }

  public static void main(String [] args) {
     LEN = Integer.parseInt(args[0]);
     if ((LEN & LEN-1) != 0) {
        throw new AssertionError("Non-POW length");
     }

     int [] a = new int[LEN];
     int [] r = new int[LEN];
   
     Random rd = new Random(1024);
     for (int i = 0 ; i < LEN; i++)
        a[i] = rd.nextInt();

     int res = 0;
     for (int i = 0 ; i < 70000; i++)
        res += workload(a, r, i & (LEN-1));
     
     res = 0;
     System.out.println("Warmup complete");
     long t1 = System.currentTimeMillis();
     for (int i = 0 ; i < 120000 ; i++)
        res += workload(a, r , i & (LEN-1));
     long t2 = System.currentTimeMillis();
     System.out.println("Measurement complete");     

     for(int i = 0 ; i < SPECIES.length(); i++) {
       System.out.println("r["+ i + "] = " + r[i]);
     }
     System.out.println("[Time Scalar] " + (t2-t1) + " ms [Res] " + res); 
     

     res = 0;
     for (int i = 0 ; i < 70000; i++)
        res += workload_vector(a, r, i & (LEN-1));
     
     res = 0;
     System.out.println("Warmup complete");
     t1 = System.currentTimeMillis();
     for (int i = 0 ; i < 120000 ; i++)
        res += workload_vector(a, r , i & (LEN-1));
     t2 = System.currentTimeMillis();
     System.out.println("Measurement complete");     

     for(int i = 0 ; i < SPECIES.length(); i++) {
       System.out.println("r["+ i + "] = " + r[i]);
     }
     System.out.println("[Time Vector] " + (t2-t1) + " ms [Res] " + res); 
  }
}
