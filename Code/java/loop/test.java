

class loop {
  public static final int LEN  = 1029;

  // MUT
  public void doSum(float [] res, float [] a , float [] b) {
      int i = 0;
      for (; i < loop.LEN - 5; i++)
       res[i] = a[i] + b[i];
      for (; i < loop.LEN ; i++)
       res[i] = a[i] + b[i];
  }

  // Driver
  public static void main(String [] args) {
     loop obj = new loop();
     float [] a = new float[loop.LEN];
     float [] b = new float[loop.LEN];
     float [] res = new float[loop.LEN];

     for( int i = 0; i < loop.LEN ; i++)
        a[i]  = 1.0f;
     for( int i = 0; i < loop.LEN ; i++)
        b[i]  = i + 1.0f;

    for (int j = 0 ; j < 1000000 ; j++)
     obj.doSum(res,a,b);

     System.out.println("Res[4] = " + res[4]);
  }
}
