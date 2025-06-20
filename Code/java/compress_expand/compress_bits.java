
import java.util.Random;
import jdk.incubator.vector.*;

public class compress_bits {

   public static int compressBits(int a, int mask) {
        a = a & mask; // Clear irrelevant bits
        int maskCount = ~mask << 1; // Count 0's to right
        int iters = 5;

        for (int j = 0; j < iters; j++) {
            // Parallel prefix
            // maskPrefix identifies bits of the mask that have odd number of 0's to the right
            int maskPrefix = maskCount  ^ (maskCount  << 1);
            maskPrefix = maskPrefix ^ (maskPrefix << 2);
            maskPrefix = maskPrefix ^ (maskPrefix << 4);
            maskPrefix = maskPrefix ^ (maskPrefix << 8);
            maskPrefix = maskPrefix ^ (maskPrefix << 16);
            // Bits to move
            int maskMove = maskPrefix & mask;
            // Compress mask
            mask = (mask ^ maskMove) | (maskMove >>> (1 << j));
            // Bits of a to be moved
            int t = a & maskMove;
            // Compress a
            a = (a ^ t) | (t >>> (1 << j));
            // Adjust the countMask by identifying the bits that have 0 to the right
            maskCount = maskCount & ~maskPrefix;
        }
        return a;
    }

   public static final VectorSpecies SPECIES = IntVector.SPECIES_256;

   // JDK-18 bug 
   public static void vector_compressBits(int [] r, int [] a, int [] mask, int pos) {
        IntVector aV = IntVector.fromArray(SPECIES, a, pos);
        IntVector maskV = IntVector.fromArray(SPECIES, mask, pos);
       
        //a = a & mask; // Clear irrelevant bits
        aV = aV.lanewise(VectorOperators.AND, maskV);

        //int maskCount = ~mask << 1; // Count 0's to right
        IntVector maskCountV = maskV.lanewise(VectorOperators.NOT)
                                    .lanewise(VectorOperators.LSHL, 1);
        int iters = 5;
        for (int j = 0; j < iters; j++) {
           // Parallel prefix
           // maskPrefix identifies bits of the mask that have odd number of 0's to the right
           // int maskPrefix = maskCount  ^ (maskCount  << 1);
           // maskPrefix = maskPrefix ^ (maskPrefix << 2);
           // maskPrefix = maskPrefix ^ (maskPrefix << 4);
           // maskPrefix = maskPrefix ^ (maskPrefix << 8);
           // maskPrefix = maskPrefix ^ (maskPrefix << 16);
           
           IntVector maskPrefixV = maskCountV.lanewise(VectorOperators.XOR, maskCountV.lanewise(VectorOperators.LSHL, 1)); 
           maskPrefixV = maskPrefixV.lanewise(VectorOperators.XOR, maskPrefixV.lanewise(VectorOperators.LSHL, 2));
           maskPrefixV = maskPrefixV.lanewise(VectorOperators.XOR, maskPrefixV.lanewise(VectorOperators.LSHL, 4));
           maskPrefixV = maskPrefixV.lanewise(VectorOperators.XOR, maskPrefixV.lanewise(VectorOperators.LSHL, 8));
           maskPrefixV = maskPrefixV.lanewise(VectorOperators.XOR, maskPrefixV.lanewise(VectorOperators.LSHL, 16));

           // Bits to move
           //int maskMove = maskPrefix & mask;
           IntVector maskmoveV = maskPrefixV.lanewise(VectorOperators.AND, maskV);

           // Compress mask
           // mask = (mask ^ maskMove) | (maskMove >>> (1 << j));
           maskV = maskV.lanewise(VectorOperators.XOR, maskmoveV).lanewise(VectorOperators.OR, 
                                                                           maskmoveV.lanewise(VectorOperators.LSHR, 1 << j));
           // Bits of a to be moved
           // int t = a & maskMove;
           IntVector tV = aV.lanewise(VectorOperators.AND, maskmoveV);
           // Compress a
           //a = (a ^ t) | (t >>> (1 << j));
           aV = aV.lanewise(VectorOperators.XOR, tV).lanewise(VectorOperators.OR, tV.lanewise(VectorOperators.LSHR, 1 << j)); 

           // Adjust the countMask by identifying the bits that have 0 to the right
           // maskCount = maskCount & ~maskPrefix;
           maskCountV = maskCountV.lanewise(VectorOperators.AND, maskPrefixV.lanewise(VectorOperators.NOT));
        }
        aV.intoArray(r, pos);
    }

    public static int vector_runner(int [] r , int [] a, int [] mask, int ctr) {
      int i = 0;
      for(; i < SPECIES.loopBound(a.length); i+=SPECIES.length()) {
        vector_compressBits(r, a, mask, i);
      }
      for(; i < a.length; i++) {
        r[i] = compressBits(a[i], mask[i]);
      }
      return r[ctr];
    }

    public static int scalar_runner(int [] r , int [] a, int [] mask, int ctr) {
      for(int i = 0 ; i < a.length; i++) {
        r[i] = compressBits(a[i], mask[i]);
      }
      return r[ctr];
    }

   public static void main(String [] args) {
      int len = Integer.parseInt(args[0]);
      int algo = Integer.parseInt(args[1]);

      assert len != 0 && ((len & (len-1)) == 0);

      int [] arr = new int[len];
      int [] mask = new int[len];
      int [] res = new int[len];

      Random r = new Random(1024);
      for(int i = 0; i < len; i++) {
        arr[i] = i;
        mask[i] = i;
      }

      if (algo == 0) {
        int ret = 0;
        for(int i = 0; i < 50000; i++) {
           ret += scalar_runner(res, arr, mask, i & (len-1)); 
        }
        
        ret = 0;
        long t1 = System.currentTimeMillis();
        for(int i = 0; i < 30000; i++) {
           ret += scalar_runner(res, arr, mask, i & (len-1)); 
        }
        long t2 = System.currentTimeMillis();
        for (int i = 0 ; i < res.length; i++) {
           ret += res[i];
        }
        System.out.println("[Scalar Time] " + (t2-t1) + " ms   [Res] " + ret);
        for(int i = 0; i < SPECIES.length(); i++) {
           System.out.println("r["+i+"] = " + res[i]); 
        }
      } else if (algo == 1) { 
        int ret = 0;
        for(int i = 0; i < 50000; i++) {
           ret += vector_runner(res, arr, mask, i & (len-1)); 
        }
        
        ret = 0;
        long t1 = System.currentTimeMillis();
        for(int i = 0; i < 30000; i++) {
           ret += vector_runner(res, arr, mask, i & (len-1)); 
        }
        long t2 = System.currentTimeMillis();
        for (int i = 0 ; i < res.length; i++) {
           ret += res[i];
        }
        System.out.println("[Vector Time] " + (t2-t1) + " ms   [Res] " + ret);
        for(int i = 0; i < SPECIES.length(); i++) {
           System.out.println("r["+i+"] = " + res[i]); 
        }
      } else { 
/*
        int ret = 0;
        for(int i = 0; i < 5; i++) {
           ret += vector_runner_alt(res, arr, mask, i & (len-1)); 
        }
        
        ret = 0;
        long t1 = System.currentTimeMillis();
        for(int i = 0; i < 3; i++) {
           ret += vector_runner_alt(res, arr, mask, i & (len-1)); 
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[VectorALT Time] " + (t2-t1) + " ms   [Res] " + ret);
*/
      }
   }
}
