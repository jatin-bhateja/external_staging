
import java.util.Arrays;
import java.util.Random;

public class clamp_opt {
   public static final Random r = new Random(1024);

   //
   // Lattice constraining possible for integral clamp with constant bounds, integral min/max already intrinsified..
   // For floating point clamp, we can optimized JIT code sequence to share unordered NaN related checks b/w min/max.
   //
   //  0x00007f1a14c8bfa6:   vblendvps %xmm1,%xmm0,%xmm1,%xmm5
   //  0x00007f1a14c8bfac:   vblendvps %xmm1,%xmm1,%xmm0,%xmm6
   //  0x00007f1a14c8bfb2:   vmaxss %xmm5,%xmm6,%xmm3
   //  0x00007f1a14c8bfb6:   vcmpunordps %xmm6,%xmm6,%xmm5
   //  0x00007f1a14c8bfbb:   vblendvps %xmm5,%xmm6,%xmm3,%xmm1
   //  0x00007f1a14c8bfc1:   vblendvps %xmm1,%xmm2,%xmm1,%xmm5
   //  0x00007f1a14c8bfc7:   vblendvps %xmm1,%xmm1,%xmm2,%xmm4
   //  0x00007f1a14c8bfcd:   vminss %xmm4,%xmm5,%xmm0
   //  0x00007f1a14c8bfd1:   vcmpunordps %xmm5,%xmm5,%xmm4
   //  0x00007f1a14c8bfd6:   vblendvps %xmm4,%xmm5,%xmm0,%xmm0

   public static float micro(float val, float min, float max) {
      return Math.clamp(val, min, max);
   }

   public static final int SIZE = 1024;
   public static final int SIZE_M1 = SIZE - 1;
   public static void main(String [] args) {
       float res = 0.0f;
       float [] src = new float[SIZE];
       for (int i = 0; i < SIZE; i++) {
          src[i] = r.nextFloat(); 
       } 
       for (int i = 0; i < 1000000; i++) {
          res += micro(src[i & SIZE_M1], 10.0f, 20.0f);
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 1000000; i++) {
          res += micro(src[i & SIZE_M1], 10.0f, 20.0f);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + " ms   [res] " + res);
   }
}
