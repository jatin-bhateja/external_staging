class MyClass {
   public int f1;
   public int f2;
   public MyClass(int f1, int f2) {
     this.f1 = f1;
     this.f2 = f2;
   }
}

class array_copy {
   public static int leaf(byte [] dst) {
     return dst.length + 1000;
   }
   public static MyClass [] mem = new MyClass[1024];

   public static int copy(byte [] dst, byte [] src, int i) {
     System.arraycopy(src, 0 , dst, 0, i);
     int val = leaf(dst);
     //System.gc();
     mem[i&1023].f1 = mem[((i+1)&1023)].f2;
     System.arraycopy(dst, 2 , dst, 2, i);
     return val + 1000;
   }

   public static void main(String [] args) {
     byte [] dst = new byte[8192];
     byte [] src = new byte[8192];
     for (int i = 0 ; i < 8192 ; i++)
       src[i] = (byte)i;

     for (int i = 0 ; i < 1024 ; i++) {
        mem[i] = new MyClass(i, i+1);
     }
     // Warmup
     int Res = 0;
     for(int i = 0 ; i < 990000 ; i++)
        Res += copy(dst, src, i & 31);

     Res = 0;
     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 9000 ; i++) {
        Res += copy(dst, src, i&0x1F);
     }

     long t2 = System.currentTimeMillis();
     System.out.println("[Time] " + (t2-t1) + " ms  [Res] "  + Res);
   }
}
