
public class SaturatedOps {
   
   static class MyInteger {
       public static final int POLARITY_MASK_INT  = 1 << 31;
       public static final int UNSIGNED_MAX = 0xFFFFFFFF;

       public int saturatedAdd(int a, int b) {
           long res = (long)a + (long)b;
           if (res > Integer.MAX_VALUE) {
               return Integer.MAX_VALUE;
           } else if (res < Integer.MIN_VALUE) {
               return Integer.MIN_VALUE;
           } else {
               return (int)res;
           }
       }
       public int saturatedSub(int a, int b) {
           int res = a - b;
           boolean opposite_polarity_inputs = ((a ^ b) & POLARITY_MASK_INT) == 1;
           if (opposite_polarity_inputs && ((res & POLARITY_MASK_INT) != (a & POLARITY_MASK_INT))) {
               // Saturation occurs when result polarity does not comply with first argument polarity.
               return res < 0 ? Integer.MAX_VALUE : Integer.MIN_VALUE; 
           } else {
               return res;
           } 
       }
     
       public int unsignedSaturtedAdd(int a, int b) {
           int res = a + b;
           if (Integer.compareUnsigned(res, UNSIGNED_MAX) < 0) {
              return res;
           } else {
              return Integer.MAX_VALUE;
           }
       }

       public int unsignedSaturtedSub(int a, int b) {
           int res = a - b;
           if (Integer.compareUnsigned(b, a) < 0) {
              return res;
           } else {
              return 0;
           }
       }
   }

   static class MyLong {
       public static final long POLARITY_MASK_LONG  = 1L << 63;
       public static final long UNSIGNED_MAX = 0xFFFFFFFFFFFFFFFFL;

       public long saturatedAdd(long a, long b) {
           long res = a + b;
           boolean same_polarity_inputs = ((a ^ b) & POLARITY_MASK_LONG) == 0;
           if (same_polarity_inputs &&  ((res & POLARITY_MASK_LONG) != (a & POLARITY_MASK_LONG))) {
              return res < 0 ? Long.MAX_VALUE : Long.MIN_VALUE;
           } else {
              return res;
           }
       }
       public long saturatedSub(long a, long b) {
           long res = a + b;
           boolean opposite_polarity_inputs = ((a ^ b) & POLARITY_MASK_LONG) == 1;
           if (opposite_polarity_inputs && ((res & POLARITY_MASK_LONG) != (a & POLARITY_MASK_LONG))) {
               // Saturation occurs when result polarity does not comply with first argument polarity.
               return res < 0 ? Long.MAX_VALUE : Long.MIN_VALUE; 
           } else {
               return res;
           } 
       }
     
       public long unsignedSaturtedAdd(long a, long b) {
           long res = a + b;
           if (Long.compareUnsigned(res, UNSIGNED_MAX) < 0) {
              return res;
           } else {
              return Long.MAX_VALUE;
           }
       }

       public long unsignedSaturtedSub(long a, long b) {
           long res = a - b;
           if (Long.compareUnsigned(b, a) < 0) {
              return res;
           } else {
              return 0;
           }
       }
   }

   static class MyShort {
       public static final short POLARITY_MASK_SHORT = 1L << 15;
       public static final short UNSIGNED_MAX = 0xFFFF;

       public short saturatedAdd(short a, short b) {
           int res = a + b;
           if (res > Short.MAX_VALUE) {
               return Short.MAX_VALUE;
           } else if (res < Short.MIN_VALUE) {
               return Short.MIN_VALUE;
           } else {
               return (short)res;
           }
       }
       public short saturatedSub(short a, short b) {
           short res = a + b;
           boolean opposite_polarity_inputs = ((a ^ b) & POLARITY_MASK_SHORT) == 1;
           if (opposite_polarity_inputs && ((res & POLARITY_MASK_SHORT) != (a & POLARITY_MASK_SHORT))) {
               // Saturation occurs when result polarity does not comply with first argument polarity.
               return res < 0 ? Short.MAX_VALUE : Short.MIN_VALUE; 
           } else {
               return res;
           } 
       }
     
       public short unsignedSaturtedAdd(short a, short b) {
           short res = a + b;
           if (Short.compareUnsigned(res, UNSIGNED_MAX) < 0) {
              return res;
           } else {
              return Short.MAX_VALUE;
           }
       }

       public short unsignedSaturtedSub(short a, short b) {
           short res = a - b;
           if (Short.compareUnsigned(b, a) < 0) {
              return res;
           } else {
              return 0;
           }
       }
   }
}
