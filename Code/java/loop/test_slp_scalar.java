

class loop {
  public static final int LEN  = 4;
  // MUT
  public double doSum(double res1, double res2, double res3, double res4, double [] a , double [] b) {
    for (int j = 0 ; j < 1000000 ; j++)
      for (int i = 0 ; i < loop.LEN ; i+=4) {
       res1 = a[i] + b[i];
       res2 = a[i+1] + b[i+2];
       res3 = a[i+2] + b[i+3];
       res4 = a[i+3] + b[i+3];
      }
    return res1 + res2 + res3 + res4;
  }

  // Driver
  public static void main(String [] args) {
     loop obj = new loop();
     double [] a = new double[loop.LEN];
     double [] b = new double[loop.LEN];
     double [] res = new double[loop.LEN];

     for( int i = 0; i < loop.LEN ; i++)
        a[i]  = 1.0f;
     for( int i = 0; i < loop.LEN ; i++)
        b[i]  = i + 1.0f;
     //for(float i = 0 ; i < 100000 ;i++)
       res[0] = obj.doSum(res[0],res[1],res[2],res[3],a,b);

     System.out.println("Res[4] = " + res[3]);
  }
}
