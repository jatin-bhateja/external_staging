
class testmaxf {
   public static final int LEN = 16;

   void getMaxArr(float [] res , float [] a , float [] b) {
        res[1] = Math.max(a[1], a[1]);
   }
   
   public static void main(String [] args) {
     testmaxf obj = new testmaxf();
     float Res = 0.0f; 
     float [] a = new float[16];
     float [] b = new float[16];
     float [] res = new float[16];

     for (int i = 0 ; i < 16 ; i++) {
       a[i] = -55555.5f; 
       b[i] = -55555.5f; 
     }
     for (int k = 0 ; k < 10000000 ; k++)
       obj.getMaxArr(res , a, b);
     System.out.println("res[1] " + res[1]);
   }
}
