
import java.util.Arrays;
import java.util.Random;

class compareb {

  public static int micro_byte(byte [] arr1, int arr1IdxFrom, int arr1IdxTo, byte [] arr2, int arr2IdxFrom, int arr2IdxTo) {
    return Arrays.equals(arr1, 0, 15, arr2, 0, 15) == true ? 1 : 0;
    //return Arrays.equals(arr1, arr1IdxFrom, arr1IdxTo, arr2, arr2IdxFrom, arr2IdxTo) == true ? 1 : 0;
  }

  // Driver
  public static void main(String [] args) {
    int LEN = Integer.parseInt(args[0]);
    System.out.println("Length = " + LEN);
    byte [] arr1_byte = new byte[LEN];
    byte [] arr2_byte = new byte[LEN];

    int Res = 0;
    Random r = new Random(100);
    for( int i = 0; i < LEN/2 ; i++) {
      arr1_byte[i] = (byte)i;
      arr2_byte[i] = (byte)i;
    }
    arr2_byte[LEN-1] = (byte)-1;

    for (int k = 0 ; k < 9000000 ; k++) {
      Res += micro_byte(arr1_byte, k & (LEN-1), LEN,  arr2_byte, k & (LEN-1), LEN);
    }

    Res=0;
    System.out.println("Warmup completed");
    long t1 = System.currentTimeMillis();
    for (int k = 0 ; k < 100000000 ; k++) {
      Res += micro_byte(arr1_byte, k & (LEN-1), LEN,  arr2_byte, k & (LEN-1), LEN);
    }
    long t2 = System.currentTimeMillis();
    System.out.println("[Time] " + (t2-t1) + " ms  [Res] " + Res);
  }
}
