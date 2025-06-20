
class boxing_at_merge_point {
   public static int genInt(int val) {
       return val * 10;
   }
   public static Integer micro(int val, int cond) {
        Integer ret = Integer.valueOf(val); // t1 = Explicit Boxing
        if (cond > 10000) {
           ret = genInt(val);               // DontInline genInt, t2 = AutoBoxing 
        } 
                                            // Phi : t1 , t2
        return ret; 
   }
    
   public static void main(String [] args) {
       int res = 0;
       for (int i = 0; i < 100000; i++) {
           res += micro(i, i);
       }
       System.out.println(res);
   }
}
