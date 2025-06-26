class test {
   public static int value(int size) {
      int res = 0;
      switch(size) {
         case 1:
            for(int i = 0; i < 64; i++) {
              res += 34;
            } 
            return res;
         case 2:
            for(int i = 0; i < 64; i++) {
              res += 44;
            } 
            return res;
         case 4:
            for(int i = 0; i < 64; i++) {
              res += 54;
            } 
            return res;
         case 8:
            for(int i = 0; i < 64; i++) {
              res += 64;
            } 
            return res;
         default:
            for(int i = 0; i < 64; i++) {
              res += 74;
            } 
            return res;
      }
   }
   public static int value4(int size) {
      int res = 0;
      for(int i = 0; i < 64; i++) {
         res += 54;
      } 
      return res;
   }
   public static void main(String [] args) {
       int res = 0;
       for(int i = 0; i < 100000; i++) {
           res += value(1 << (i & 0));
       }
       res = 0;
       long t1 = System.nanoTime();
       for(int i = 0; i < 100000; i++) {
           res += value(1 << 2);
       }
       long t2 = System.nanoTime();
       System.out.println("[Time] " + (t2-t1) + " ns   [Res] " + res);
       res = 0;
       t1 = System.nanoTime();
       for(int i = 0; i < 100000; i++) {
           res += value4(1 << (i & 2));
       }
       t2 = System.nanoTime();
       System.out.println("[Time] " + (t2-t1) + " ns   [Res] " + res);
   }
} 
