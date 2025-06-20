

class add {
  public static int mux(int cond) {
     int res = 0;
     if (cond == 1)
        res = 10;
     else
        res = 20;
     return res + 100;
  }
  public static void main(String [] args) {
     int res = 0;
     for(int i = 0 ; i < 1000000; i++)
         res += mux(i%2);
     System.out.println("Res = " + res);
  }
}
