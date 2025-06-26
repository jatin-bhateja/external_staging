

class loop {
  public static final int LEN  = 16;
  // MUT
  public float doSum(float [] a) {
    float res = 0.0f;
    for (int j = 0 ; j < 1000000 ; j++)
      for (int i = 0 ; i < loop.LEN ; i++)
         res += a[i];
    return res;
  }

  // Driver
  public static void main(String [] args) {
     float res = 0.0f;
     loop obj = new loop();
     float [] a = new float[loop.LEN];

     for( int i = 0; i < loop.LEN ; i++)
        a[i]  = 1.0f;
     res =  obj.doSum(a);
     System.out.println("Res[4] = " + res);
  }
}
