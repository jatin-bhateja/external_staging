
class testreverses {
   public static final int LEN = 16;

   short micro(short [] a, short [] res, int ctr) {
     for (int i = 0; i < a.length; i++) {
        res[i] = Short.reverseBytes(a[i]);
     }
     return res[ctr];
   }
   
   public static void main(String [] args) {
     testreverses obj = new testreverses();
     short res = 0;
     short [] d = new short[1024];
     short [] a = new short[1024];
     for (int i = 0 ; i < 1024 ; i++) {
       a[i] = (short)i; 
     }
     for (int k = 0 ; k < 10000000 ; k++)
       res += obj.micro(a, d, k & 15);

     for (int i = 0; i < 16; i++) {
       System.out.println("res[" + i + "] = " + d[i]);
     }
     System.out.println("Res = " + res);
   }
}
