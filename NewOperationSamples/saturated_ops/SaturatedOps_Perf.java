
public class SaturatedOps_Perf {
    public static final int POLARITY_MASK_INT = 1 << 31;
   
    public static int saturatedAdd(int a, int b) {
        long res = (long)a + (long)b;
        if (res > Integer.MAX_VALUE) {
            return Integer.MAX_VALUE;
        } else if (res < Integer.MIN_VALUE) {
            return Integer.MIN_VALUE;
        } else {
            return (int)res;
        }
    }

    public static int saturatedAddAlt(int a, int b) {
        int res = a + b;
        boolean opposite_polarity_inputs = ((a ^ b) & POLARITY_MASK_INT) == 1;
        if (opposite_polarity_inputs) {
            return res;
        } else if (((res & POLARITY_MASK_INT) != (a & POLARITY_MASK_INT))) {
            return res < 0 ? Integer.MAX_VALUE : Integer.MIN_VALUE;
        } else {
            return res;
        }
    }

    public static void main (String [] args) {
        int algo = Integer.parseInt(args[0]);
        long res = 0;
        // Branch Prediction for 'saturatedAdd'
        // Inputs: 1st 2nd 3rd 4th 5th 6th 7th 8th
        // COND1 : 1,  0,  0,  0,  0,  0,  0,  0
        // COND2 : 0,  0,  1,  0,  0,  0,  1,  0
        // COND3 : 0,  1,  0,  1,  1 , 1,  0,  1
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
        if (algo == 0) {
          for (int i = 0; i < 100000000; i++) {
              int idx = i & 7;
              res += saturatedAdd(vals1[idx], vals2[idx]);
          } 
          long t1  = System.currentTimeMillis();
          for (int i = 0; i < 100000000; i++) {
              int idx = i & 7;
              res += saturatedAdd(vals1[idx], vals2[idx]);
          } 
          long t2  = System.currentTimeMillis();
          System.out.println("[time saturatedAdd] " + (t2-t1) + " ms  [res] " + res);
       } else {
          res = 0;
          for (int i = 0; i < 100000000; i++) {
              int idx = i & 7;
              res += saturatedAddAlt(vals1[idx], vals2[idx]);
          } 
          long t1  = System.currentTimeMillis();
          for (int i = 0; i < 100000000; i++) {
              int idx = i & 7;
              res += saturatedAddAlt(vals1[idx], vals2[idx]);
          } 
          long t2  = System.currentTimeMillis();
          System.out.println("[time saturatedAddAlt] " + (t2-t1) + " ms  [res] " + res);
       }
    }
}
