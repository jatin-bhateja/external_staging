

class test {
  public static final int VALUE = 5;

  public static void workload(int [] a,  int [] r, int cnt) {
     for (int j =  0 ; j < a.length ; j++)
        r[j] = Integer.rotateLeft(a[j], 13);
  }

  public static void main(String [] args) {
     int [] a = new int[32];
     int [] r = new int[32];

     for (int i = 0 ; i < 32; i++)
        a[i] = i;
     
     for (int i = 0 ; i < 100000 ; i++)
        workload(a, r, 2);
     
     System.out.println("Res =  " + r[5]); 
  }
}
