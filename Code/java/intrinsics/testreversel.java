
class testreversel {
   long micro(long [] res, long [] a, int ctr) {
     int ires = 0;
     for (int i = 0; i < a.length; i++) {
        res[i] = Long.reverse(a[i]);
     }
     return res[ctr];
   }
   
   public static void main(String [] args) {
     testreversel obj = new testreversel();
     int val = 0;
     long [] a = new long[1024];
     long [] res = new long[1024];
     for (int i = 0 ; i < 1024 ; i++) {
       a[i] = 0xCAFE1234CAFE8421L; 
     }

     for (int k = 0 ; k < 100000 ; k++)
       val += obj.micro(res, a, k & 15);

     val = 0;
     long t1 = System.currentTimeMillis();
     for (int k = 0 ; k < 100000 ; k++)
       val += obj.micro(res, a, k & 15);
     long t2 = System.currentTimeMillis();

     for(int i = 0 ; i < 16; i++) {
       System.out.println("src[" + i + "] = " + a[i]);
     }
     for(int i = 0 ; i < 16; i++) {
       System.out.println("res[" + i + "] = " + res[i]);
     }
     System.out.println("Time = " + (t2-t1) + " ms Res = " + val);
   }
}
