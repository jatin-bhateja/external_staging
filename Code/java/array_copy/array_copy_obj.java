
class array_copy {
   static class A {
   }

   public static int copy(A [] dst, A [] src, int i) {
     System.arraycopy(src, 0 , dst, 0, 10);
     return 10;
   }

   public static void main(String [] args) {
     A [] src = new A[8192];
     A [] dst = new A[8192];

     // Warmup
     int Res = 0;
     for(int i = 0 ; i < 990000 ; i++)
        Res += copy(dst, src, i & 63);

     Res = 0;
     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 10000 ; i++)
        Res += copy(dst, src, i & 8191);
     long t2 = System.currentTimeMillis();
     System.out.println("[Time] " + (t2-t1) + " ms  [Res] "  + Res);
   }
}
