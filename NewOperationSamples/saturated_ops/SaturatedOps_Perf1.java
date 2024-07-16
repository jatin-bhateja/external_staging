
public class SaturatedOps_Perf1 {
    public static final int POLARITY_MASK_INT = 1 << 31;

    public static final int UNSIGNED_MAX = 0xFFFFFFFF;

    public static int toUnsigned(int sval) {
        return sval + Integer.MIN_VALUE;
    } 
   
    public static int toSigned(int uval) {
        return uval ^ 0x80000000;
    }

    public static int unsignedMax(int uval1, int uval2) {
        return toUnsigned(Math.max(toSigned(uval1), toSigned(uval2)));
    }

    public static int unsignedMin(int uval1, int uval2) {
        return toUnsigned(Math.min(toSigned(uval1), toSigned(uval2)));
    }

    // ----------------|-----------------
    // 255             127              0
    //
    // ----------------------------------
    // 127             0 -1           -128
    //
    public static int unsignedSaturatingAdd1(int a, int b) {
        // eg. a (US) = 127 (-1 signed)  , b (US) = 1 (-127 signed) 
        //  r =  unsignedMax(a,b) = 127
        //  toSigned(r) = -1
        // Integer.MAX_VALUE - toSigned(r) = 127 - (-1) = 128 (not-representable in signed ranges in absolute terms and wraps around to -128).
        // thus gap_to_max <= min_val and returns UNSIGNED_MAX which is incorrect. 
        int gap_to_max = Integer.MAX_VALUE - toSigned(unsignedMax(a, b));
        int min_val = Math.min(toSigned(a), toSigned(b));
        if (gap_to_max <= min_val) {
           return UNSIGNED_MAX;
        } else {
           return a + b;
        }
    }

    public static int unsignedSaturatingAdd2(int a, int b) {
        int res = a + b;
        boolean overflow = Integer.compareUnsigned(res, a | b) < 0;
        if (overflow) {
           return UNSIGNED_MAX;
        } else {
           return res;
        }
    }


    // ADD -> Commutative, associative.
    // Over/Under flow -> iff same polarity inputs.
    public static int saturatedAddAlt(int a, int b) {
        int res = a + b;
        boolean same_polarity_inputs = ((a ^ b) & POLARITY_MASK_INT) == 0;
        if (same_polarity_inputs && ((res & POLARITY_MASK_INT) != (a & POLARITY_MASK_INT))) {
            return res < 0 ? Integer.MAX_VALUE : Integer.MIN_VALUE;
        } else {
            return res;
        }
    }

    public static void main (String [] args) {
        int algo = Integer.parseInt(args[0]);
        long res = 0;
        // Branch Prediction for 'saturatedAdd'
        // Inputs (a/b): 1st 2nd 3rd 4th 5th 6th 7th 8th
        // COND1       : 1,  0,  0,  0,  0,  0,  0,  0
        // COND2       : 0,  0,  1,  0,  0,  0,  1,  0
        // COND3       : 0,  1,  0,  1,  1 , 1,  0,  1
        // For each input, search ends once it finds a matching branch. 
        //                  1st  2nd      3rd   4th      5th      6th      7th   8th
        //                  ---  -------  ---   -------  -------  -------  ----  ------
        // Combined Pattern : 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1
        //                    ----  ----  ----  ----  ----  ----  ----  ----  ----  ----
        // Two bit adaptive global pattern history predictor will consider history for last two branches and
        // create a state machine for it. Pattern history table holds a saturating counters for each entry
        // in the table.
        int [] vals1 = {Integer.MAX_VALUE, -1, Integer.MIN_VALUE, 1000, 2000, 4000, Integer.MIN_VALUE, 3000};
        int [] vals2 = {1, -1, -1, 1000, 2000, 3000, -1, 3000};
       if (algo == 1 || algo == -1) {
          res = 0;
          for (int i = 0; i < 8; i++) {
              int idx = i & 7;
              int tres = unsignedSaturatingAdd1(vals1[idx], vals2[idx]);
              System.out.println("[1] val1 = " + vals1[idx] + " val2 = " + vals2[idx] + " res = " + tres); 
              res += tres;
          } 
          long t1  = System.currentTimeMillis();
          for (int i = 0; i < 8; i++) {
              int idx = i & 7;
              res += unsignedSaturatingAdd1(vals1[idx], vals2[idx]);
          } 
          long t2  = System.currentTimeMillis();
          System.out.println("[time unsignedSaturatingAdd1] " + (t2-t1) + " ms  [res] " + res);
       }
       res = 0;
       if (algo == 0 || algo == -1) {
          for (int i = 0; i < 8; i++) {
              int idx = i & 7;
              int tres = unsignedSaturatingAdd2(vals1[idx], vals2[idx]);
              System.out.println("[2] val1 = " + vals1[idx] + " val2 = " + vals2[idx] + " res = " + tres); 
              res += tres;
          } 
          long t1  = System.currentTimeMillis();
          for (int i = 0; i < 8; i++) {
              int idx = i & 7;
              res += unsignedSaturatingAdd2(vals1[idx], vals2[idx]);
          } 
          long t2  = System.currentTimeMillis();
          System.out.println("[time unsignedSaturatingAdd2]    " + (t2-t1) + " ms  [res] " + res);
       }

    }
}
