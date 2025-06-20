
import jdk.incubator.vector.*;
import java.util.Arrays;
import java.util.Random;

public  class filter_mask {
    public static long micro1(byte [] filter_mask, int [] pos) {
        return ByteVector.fromArray(ByteVector.SPECIES_512, filter_mask, 0, pos, 0)
                         .compare(VectorOperators.EQ, 1).trueCount();
    }

    public static long micro2(int [] filter_mask, int [] pos) {
        long mask = 0;
        mask = IntVector.fromArray(IntVector.SPECIES_512, filter_mask, 0, pos, 0)
                        .compare(VectorOperators.EQ, 1).toLong();
        mask |= IntVector.fromArray(IntVector.SPECIES_512, filter_mask, 0, pos, 16)
                        .compare(VectorOperators.EQ, 1).toLong() << 16;
        mask |= IntVector.fromArray(IntVector.SPECIES_512, filter_mask, 0, pos, 32)
                        .compare(VectorOperators.EQ, 1).toLong() << 32;
        mask |= IntVector.fromArray(IntVector.SPECIES_512, filter_mask, 0, pos, 48)
                        .compare(VectorOperators.EQ, 1).toLong() << 48;
        return VectorMask.fromLong(ByteVector.SPECIES_512, mask).trueCount();
    }

    public static void main(String [] args) {
         byte [] filter_mask = new byte[2048];
         int  [] filter_maskI = new int[2048];
         for (int i = 0; i < filter_mask.length; i++) {
             filter_mask[i] = (byte)(i & 0x1);
             filter_maskI[i] = i & 0x1;
         }
         int [] pos = new int[64];
         Random r = new Random(2048);
         for (int i = 0; i < pos.length; i++) {
             pos[i] = r.nextInt(2048); 
         }

         long t1 = 0; 
         long t2 = 0; 
         long res = 0;

         for (int i = 0; i < 100000; i++) {
             res += micro1(filter_mask, pos);
         }
         t1 = System.currentTimeMillis();
         for (int i = 0; i < 910000; i++) {
             res += micro1(filter_mask, pos);
         }
         t2 = System.currentTimeMillis();
         System.out.println("micro1: [res]   " + res +  " [time]  " + (t2-t1) +  " ms ");
   
         res = 0;      
         for (int i = 0; i < 100000; i++) {
             res += micro2(filter_maskI, pos);
         }
         t1 = System.currentTimeMillis();
         for (int i = 0; i < 910000; i++) {
             res += micro2(filter_maskI, pos);
         }
         t2 = System.currentTimeMillis();
         System.out.println("micro2: [res]   " + res +  " [time]  " + (t2-t1) +  " ms ");
    }
} 
