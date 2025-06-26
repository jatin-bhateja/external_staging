
import java.util.Arrays;
import java.util.Random;

class comparef {

  public static int micro_float(float [] arr1, int arr1IdxFrom, int arr1IdxTo, float [] arr2, int arr2IdxFrom, int arr2IdxTo) {
    return Arrays.equals(arr1, arr1IdxFrom, arr1IdxTo , arr2, arr2IdxFrom, arr2IdxTo) == true ? 1 : 0;
  }

  // Driver
  public static void main(String [] args) {
    int LEN = Integer.parseInt(args[0]);
    System.out.println("Length = " + LEN);
    float [] arr1_float = new float[LEN];
    float [] arr2_float = new float[LEN];

    int Res = 0;
    Random r = new Random(100);
    for( int i = 0; i < LEN/2 ; i++) {
      arr1_float[i] = Float.NaN;
      arr2_float[i] = Float.NaN;
    }
    for( int i = LEN/2; i < LEN ; i++) {
      arr1_float[i] = (float)i;
      arr2_float[i] = (float)i;
    }

    for (int k = 0 ; k < 900000 ; k++) {
      Res += micro_float(arr1_float, k & (LEN-1), LEN,  arr2_float, k & (LEN-1), LEN);
    }

    Res=0;
    System.out.println("Warmup completed");
    long t1 = System.currentTimeMillis();
    for (int k = 0 ; k < 100000 ; k++) {
      Res += micro_float(arr1_float, k & (LEN-1), LEN,  arr2_float, k & (LEN-1), LEN);
    }
    long t2 = System.currentTimeMillis();
    System.out.println("[Time] " + (t2-t1) + "ms Res = " + Res);
  }
}
