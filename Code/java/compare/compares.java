
import java.util.Arrays;
import java.util.Random;

class compares {

  public static int micro_short(short [] arr1, int arr1IdxFrom, int arr1IdxTo, short [] arr2, int arr2IdxFrom, int arr2IdxTo) {
    return Arrays.equals(arr1, arr1IdxFrom, arr1IdxTo , arr2, arr2IdxFrom, arr2IdxTo) == true ? 1 : 0;
  }

  // Driver
  public static void main(String [] args) {
    int LEN = Integer.parseInt(args[0]);
    System.out.println("Length = " + LEN);
    short [] arr1_short = new short[LEN];
    short [] arr2_short = new short[LEN];

    int Res = 0;
    Random r = new Random(100);
    for( int i = 0; i < LEN/2 ; i++) {
      arr1_short[i] = (short)i;
      arr2_short[i] = (short)(i);
    }
    arr2_short[LEN-1] = -1;

    for (int k = 0 ; k < 9000000 ; k++) {
      Res += micro_short(arr1_short, k & (LEN-1), LEN,  arr2_short, k & (LEN-1), LEN);
    }

    Res=0;
    System.out.println("Warmup completed");
    long t1 = System.currentTimeMillis();
    for (int k = 0 ; k < 100000000 ; k++) {
      Res += micro_short(arr1_short, k & (LEN-1), LEN,  arr2_short, k & (LEN-1), LEN);
    }
    long t2 = System.currentTimeMillis();
    System.out.println("[Time] " + (t2-t1) + " ms  [Res] " + Res);
  }
}
