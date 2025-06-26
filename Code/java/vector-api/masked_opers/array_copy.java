
class array_copy {
   public static int leaf(byte [] dst) {
     return dst.length + 1000;
   }

   public static int copy(byte [] dst, byte [] src, int i) {
     System.arraycopy(src, 0 , dst, 0, i);
     int index = leaf(dst);
     System.arraycopy(src, 1 , dst, 1, i);
     return dst[i % dst.length] + 10;
   }

   public static void main(String [] args) {
     byte [] dst = new byte[8192];
     byte [] src = new byte[8192];
     for (int i = 0 ; i < 8192 ; i++)
       src[i] = (byte)i;

     // Warmup
     int Res = 0;
     for(int i = 0 ; i < 99000000 ; i++)
        Res += copy(dst, src, i & 31);

     Res = 0;
     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 9000000 ; i++) {
        Res += copy(dst, src, i&0x1F);
     }

     long t2 = System.currentTimeMillis();
     System.out.println("[Time] " + (t2-t1) + " ms  [Res] "  + Res);
   }
}
