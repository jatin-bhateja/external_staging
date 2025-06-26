

class tzcnt {
  public static int LEN;

  public static int workload(int [] a) {
     int retval = 0;
     for (int j =  0 ; j < LEN ; j++) {
        retval += Integer.numberOfTrailingZeros(a[j]);
     }
     return retval;
  }

  public static int workload_vector(int [] a, int [] r, int ctr) {
     int i = 0;
     int retval = 0;

     for (; i < SPECIES.loopBound(LEN) ; i+=SPECIES.length()) {
        IntVector v1 = IntVector.fromArray(SPECIES, a, i);

        IntVector v2 = v1.lanewise(VectorOperators.ROL, 16);

        IntVector v3 = v2.lanewise(VectorOperators.AND, mask8bitR);
        v3 = v3.lanewise(VectorOperators.LSHR, 8);
        IntVector v4 = v2.lanewise(VectorOperators.AND, mask8bitL);
        v4 = v4.lanewise(VectorOperators.LSHL, 8);
        v3 = v3.lanewise(VectorOperators.OR, v4);
        v2 = v3;

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

        //v3 = v3.lanewise(VectorOperators.CTZ);

        v3.intoArray(r, i);
     }

     for (; i < LEN ; i++) {
        r[i] = Integer.reverse(a[i]);
     }
     return i;
  }


  public static void main(String [] args) {
     LEN = 1023;
     int [] a = new int[LEN];
     int [] b = new int[LEN];
     int [] r = new int[LEN];
   
     int res = 0;
     //OFFSET = Integer.parseInt(args[0]);

     for (int i = 0 ; i < LEN; i++)
        a[i] = (int)i;

     for (int i = 0 ; i < 70000; i++)
        res += workload(a);
     
     res = 0;
     System.out.println("Warmup complete");
     long t1 = System.currentTimeMillis();
     for (int i = 0 ; i < 120000 ; i++)
        res += workload(a);
     long t2 = System.currentTimeMillis();
     System.out.println("Measurement complete");     

     System.out.println("[Time] " + (t2-t1) + " ms [Res] " + res); 
  }
}
