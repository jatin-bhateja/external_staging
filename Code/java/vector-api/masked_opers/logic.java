
import jdk.incubator.vector.*;

class logic {
    Vector<Integer> iv1;
    Vector<Integer> iv2;
    Vector<Integer> iv3;
    Vector<Integer> iv4;
    Vector<Integer> iv5;

    VectorMask<Integer> imask;

    int int256_arr_idx;

    static final int ARRAYLEN = 1024;
    static final int 

  public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;
  public static VectorMask<Integer> mask;

  static void micro1(int[] r, int[] a, int[] b, int[] c, int[] d) {
    for (int i = 0; i < r.length; i++) {
      r[i] = (a[i] & (b[i] | c[i])) ^ ((b[i] | c[i]) & d[i]);
    }
  }

/*
  static void micro1_vec(int[] r, int[] a, int[] b, int[] c, int[] d) {
    for (int i = 0; i < SPECIES.loopBound(r.length); i+=SPECIES.length()) {
      IntVector av = IntVector.fromArray(SPECIES, a, i);
      IntVector bv = IntVector.fromArray(SPECIES, b, i);
      IntVector cv = IntVector.fromArray(SPECIES, c, i);
      IntVector dv = IntVector.fromArray(SPECIES, d, i);
      IntVector t1 = bv.lanewise(VectorOperators.OR, cv).lanewise(VectorOperators.AND, av);
      IntVector t2 = bv.lanewise(VectorOperators.OR, cv).lanewise(VectorOperators.AND, dv);
      t1.lanewise(VectorOperators.XOR, t2).intoArray(r, i);
    }
  }

  // Two input special case
  static void micro1_vec_mask(int[] r, int[] a, int[] b, int[] c, int[] d) {
    for (int i = 0; i < SPECIES.loopBound(r.length); i+=SPECIES.length()) {
      IntVector av = IntVector.fromArray(SPECIES, a, i);
      IntVector bv = IntVector.fromArray(SPECIES, b, i);
      IntVector cv = IntVector.fromArray(SPECIES, c, i);
      IntVector dv = IntVector.fromArray(SPECIES, d, i);
      IntVector t1 = av.lanewise(VectorOperators.AND, bv.lanewise(VectorOperators.XOR, av, mask), mask);
      ((IntVector)(t1.lanewise(VectorOperators.XOR, av, mask))).intoArray(r, i);
    }
  }

  static int micro1_vec_mask(int[] r, int[] a, int[] b, int[] c, int[] d, int idx) {
    for (int i = 0; i < SPECIES.loopBound(r.length); i+=SPECIES.length()) {
      IntVector av = IntVector.fromArray(SPECIES, a, i);
      IntVector bv = IntVector.fromArray(SPECIES, b, i);
      IntVector cv = IntVector.fromArray(SPECIES, c, i);
      IntVector dv = IntVector.fromArray(SPECIES, d, i);
       av.lanewise(VectorOperators.AND, bv, mask)
         .lanewise(VectorOperators.XOR,
                   av.lanewise(VectorOperators.AND, cv))
         .intoArray(r, i);
    }
    return r[idx];
  }

  static int micro2_vec_mask(int[] a, int[] b, int[] c, int[] d, int idx) {
       for (int i = 0; i < SPECIES.loopBound(a.length); i+=SPECIES.length()) {
           IntVector bv = IntVector.fromArray(SPECIES, b, i);
           IntVector cv = IntVector.fromArray(SPECIES, c, i);
           IntVector.fromArray(SPECIES, a, i)
               .lanewise(VectorOperators.BITWISE_BLEND, bv, cv, mask)
               .lanewise(VectorOperators.BITWISE_BLEND, bv, cv, mask)
               .intoArray(a, i);
       }
       return a[idx];
  }
*/

  static int micro1_vec_mask(int[] r, int[] a, int[] b, int[] c, int[] d, int idx) {
       imask = VectorMask.fromLong(IntVector.SPECIES_256, idx);
       iv2 = IntVector.fromArray(IntVector.SPECIES_256, a, int256_arr_idx);
       iv3 = IntVector.fromArray(IntVector.SPECIES_256, b, int256_arr_idx);
       iv4 = IntVector.fromArray(IntVector.SPECIES_256, c, int256_arr_idx);
       iv5 = IntVector.fromArray(IntVector.SPECIES_256, d, int256_arr_idx);
       for(int i = 0; i < INVOC_COUNTER; i++) {
           for(int j = 0 ; j < ARRAYLEN; j+= IntVector.SPECIES_256.length()) {
               IntVector.fromArray(IntVector.SPECIES_256, r, j)
                   .lanewise(VectorOperators.AND, iv2, imask)
                   .lanewise(VectorOperators.OR,  iv3, imask)
                   .lanewise(VectorOperators.AND, iv4, imask)
                   .lanewise(VectorOperators.XOR, iv5, imask)
                   .intoArray(r, j);
           }
       }
       return r[idx];
  }

  public static void main(String [] args) {
    int [] a = new int[ARRAYLEN];
    int [] b = new int[ARRAYLEN];
    int [] c = new int[ARRAYLEN];
    int [] d = new int[ARRAYLEN];
    int [] r = new int[ARRAYLEN];
    
    int res = 0;
    for(int i = 0 ; i < ARRAYLEN ; i++) {
       a[i] = 395706256; b[i] = 1510598489; c[i] = 6588415; d[i] = 13;
       r[i] = 1;
    }

    int256_arr_idx = 0;
    mask = VectorMask.fromLong(SPECIES, 0);
 
/*
    // Warmup
    for(int i = 0 ; i < 100000 ; i++)
      micro1(r, a, b, c, d);

    // Perf measurement.
    long t1 = System.nanoTime();
    for(int i = 0 ; i < 1000*1000; i++)
      micro1(r, a, b, c, d);
    long t2 = System.nanoTime();

    long res = 0L;
    for (int i = 0; i < r.length ; i++)
      res += r[i];
    System.out.println("RES1 (micro1_auto_vec) = " + res + " [Time] " + (t2-t1) + " ns");

    // Warmup
    for(int i = 0 ; i < 100000 ; i++)
      micro1_vec(r, a, b, c, d);

    // Perf measurement.
    t1 = System.nanoTime();
    for(int i = 0 ; i < 1000*1000; i++)
      micro1_vec(r, a, b, c, d);
    t2 = System.nanoTime();

    res = 0L;
    for (int i = 0; i < r.length ; i++)
      res += r[i];
    System.out.println("RES2 (micro1_vec) = " + res + " [Time] " + (t2-t1) + " ns");
*/

    // Warmup
    for(int i = 0 ; i < 100000 ; i++)
      res += micro1_vec_mask(r, a, b, c, d, i & (ARRAYLEN -1));

    // Perf measurement.
    long t1 = System.nanoTime();
    for(int i = 0 ; i < 1000*1000; i++) {
      int256_arr_idx += 8;
      res +=  micro1_vec_mask(r, a, b, c, d, i & (ARRAYLEN -1));
    }
    long t2 = System.nanoTime();
    System.out.println("RES3 (micro1_vec_mask) = " + res + " [Time] " + (t2-t1) + " ns");
  }
}
