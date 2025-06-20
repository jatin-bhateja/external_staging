
public class jit {
  public static int SIZE = 1024;
  public static final int stride  = 2;

  public static int filter(int [] res , int [] a , int [] b ,boolean [] mask_arr, int ctr) {
    for (int i = 0 ; i < res.length ; i+=stride) {
      //if (mask_arr[i] == true) {
        res[i] = a[i] + 10;
        //res[i] = a[i] + b[i];
      //}
    }
    return res[ctr];
  }

  public static void main (String [] args) { 
    int [] a = new int[SIZE]; 
    int [] b = new int[SIZE]; 
    int [] res = new int[SIZE];
    boolean [] mask_arr = new boolean[SIZE];

    for(int i = 0; i < SIZE; i++) {
      a[i] = i;
      b[i] = i;
      mask_arr[i] = true;
    }

    int ret = 0;
    for ( int i = 0 ; i < 1000000 ; i++)  {
       ret += filter(res, a, b, mask_arr, i % res.length);
    }
    System.out.println("Res =  " + ret);
  }

}
