

class cloop {
  private static final int LEN = 1024;

  public static void doSum(boolean cond, int [] sum, int [] a, int [] b) {
    if (cond) 
       b[1] = 10;
    else
       b[1] = 20;
    sum[1] =  a[1] + b[1];
  }
  public static void main(String [] args) {
     int R = 0;
     int [] sum = new int[LEN];
     int [] a = new int[LEN];
     int [] b = new int[LEN];
     for(int i = 0 ; i < LEN; i++) 
         a[i] = b[i] = i;
     for(int i = 0; i < 1000000; i++)
        doSum(i%2 ==0, sum,a,b);
     System.out.println("R = " + sum[45]);
  }
}
