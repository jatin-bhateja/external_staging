
public class int_array_init {
  public static int LEN = 100;
  public static int [] arr;

  public static int micro(int [] arr, int index, int value) {
     for (int inner = 0 ; inner < LEN ; inner++) {
        arr[inner] = value;
     }
     return arr[index];
  }

  // Driver
  public static void main(String [] args) {
    jit obj = new jit();
    arr = new int[LEN];
    for( int i = 0; i < LEN ; i++)
      arr[i]  = 1;
 
    int res = 0;
    for (int k = 0 ; k < 1000000 ; k++)
      res += micro(arr, (k) & (LEN-1), 50);

    long t1 = System.currentTimeMillis();
    res = 0;
    for (int k = 0 ; k < 900000 ; k++)
      res += micro(arr, (k) & (LEN-1), 50);
    long t2 = System.currentTimeMillis();

    System.out.println("[time] " + (t2-t1) +  "ns  [res] " + res);
  } 
} 
