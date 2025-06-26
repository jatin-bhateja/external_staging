class jit {
  public int caller1(int a, int num1, int num2, byte [] mem) {
     if (num1 == 10)
        throw new RuntimeException("Incorrect num1 value");
     return a + num1 + num2 + mem.length;
  }
  public int caller2(int a, int num, byte [] mem) {
     return caller1(a, num, 100 ,  mem) + 100;
  }
  public int caller3(int a, byte [] src, byte [] dst, int ctr) {
     int res = 10;
     System.arraycopy(src, 0 , dst, 0 , ctr);
     try {
        res =  caller2(a, 10, dst);
     } catch(Exception e) {
       //System.out.println("Exception = " + e);
     }
     System.arraycopy(src, 0 , dst, 0 , ctr);
     return res;
  }
  public static void main (String [] args) { 
    int Res = 0 ;
    byte [] src = new byte[1024];
    byte [] dst = new byte[1024];
    for(int i = 0 ; i < dst.length ; i++)
       src[i] = (byte)i;

    jit obj = new jit();
    for ( int i = 0 ; i < 1000000 ; i++)  {
      Res += obj.caller3(i, src, dst, i & (dst.length - 1));
    }
    System.out.println("Res =  " + Res);
  }
}
