class test {
  public static final int SIZE = 1024;

  public static int workload(int [] a, int [] b) {
        int[] res = new int[SIZE];
        for (int i = SIZE / 2; i < SIZE; i++) {
            res[SIZE - i] = a[SIZE - i] * b[SIZE - i];
        }
        return res[SIZE/2];
  }

  public static void main(String [] args) {
     int r = 0;
     int [] a = new int[SIZE];
     int [] b = new int[SIZE];

     for (int i = 0 ; i < a.length; i++) {
        a[i] = i;
        b[i] = i;
     }
     
     for (int i = 0 ; i < 100000 ; i++)
         r += workload(a, b);
     
     System.out.println("Res =  " + r); 
  }
}
