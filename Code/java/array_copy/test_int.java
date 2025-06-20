
class test {
  public static final int LEN = 64;

  public static int [] large_int_src;

  public static int workload() {
  int[] dest = new int[10];
  dest[0] = large_int_src[8];
  dest[1] = large_int_src[9];
  System.arraycopy(large_int_src, 0, dest, 2, 8);
  int Res =  dest[0] + dest[1] + dest[2] + dest[3] + dest[4] +
	  dest[5] + dest[6] + dest[7] + dest[8] + dest[9];
    return Res;
  }

  public static void main(String [] args) {
     large_int_src = new int[10];

     for (int i = 0 ; i < large_int_src.length ; i++)
       large_int_src[i] = i;

     int res = 0;
     for (int i = 0 ; i < 1000000 ; i++)
        res += workload();

     res = 0;
     for (int i = 0 ; i < 1000 ; i++)
        res += workload();

     System.out.println("Res =  " + res);
  }
}

