

class test {
  public static final int VALUE = 5;

  public static void workload(int [] a,  float [] r) {
     for (int j =  0 ; j < a.length ; j++)
        r[j] =  a[j] * j;
  }

  public static void main(String [] args) {
     int [] a = new int[2048];
     float [] r = new float[2048];

     for (int i = 0 ; i < a.length; i++)
        a[i] = 1;
     
     for (int i = 0 ; i < 100000 ; i++)
        workload(a, r);
     
     long t1 = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
        workload(a, r);
     long t2 = System.currentTimeMillis();
     System.out.println("[Time ] " + (t2 - t1) + " ms  [Res]" + r[5]); 
  }
}
