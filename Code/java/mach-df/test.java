

class test {
  public static int workload(int cond , int val) {
     int r  = 0;
     if ( cond == 2)
        r = 1;
     else
        r = 2;
     return r + val;
  }

  public static void main(String [] args) {
     int [] a = new int[32];
     int [] r = new int[32];

     for (int i = 0 ; i < 8; i++)
        a[i] = -i;
     
     int Res = 0;
     for (int i = 0 ; i < 100000 ; i++)
        Res += workload(a[i&31], i);
     
     System.out.println("Res =  " + Res); 
  }
}
