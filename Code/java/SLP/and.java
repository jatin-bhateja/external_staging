

class test {
  public static void workload(boolean [] a , boolean [] b,  boolean [] r) {
     for (int j =  0 ; j < a.length ; j++)
        r[j] = a[j] & b[j];
  }

  public static void main(String [] args) {
     boolean [] a = new boolean[32];
     boolean [] b = new boolean[32];
     boolean [] r = new boolean[32];

     for (int i = 0 ; i < 8; i++)
        a[i] = (i & 1) == 1 ? true : false;
     for (int i = 0 ; i < 8; i++)
        b[i] = (i & 1) == 1 ? true : false;
     
     for (int i = 0 ; i < 100000 ; i++)
        workload(a, b, r);
     
     System.out.println("Res =  " + r[5]); 
  }
}
