
class test {
  public static int workload(byte [] a ,  int [] r, int idx) {
     for (int j =  0 ; j < a.length ; j++)
        r[j] = a[j];
     return r[idx];
  }

  public static void main(String [] args) {
     byte [] a = new byte[1024];
     int [] r = new int[1024];

     //OFFSET = Integer.parseInt(args[0]);

     for (int i = 0 ; i < 8; i++)
        a[i] = (byte)-i;

     int res = 0;
     for (int i = 0 ; i < 100000 ; i++)
        res += workload(a, r, i & (r.length-1));

     res = 0;
     long t1 = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
        res += workload(a, r, i & (r.length-1));
     long t2 = System.currentTimeMillis();

     System.out.println("[Time] " + (t2-t1) +  " ms   [Res] " + r[0]);
  }
}

