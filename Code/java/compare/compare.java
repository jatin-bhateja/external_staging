
import java.util.Arrays;
import java.util.Random;

class compare {

  public static int micro_object(Object [] arr1, int arr1IdxFrom, int arr1IdxTo, Object [] arr2, int arr2IdxFrom, int arr2IdxTo) {
    return Arrays.equals(arr1, arr1IdxFrom, arr1IdxTo , arr2, arr2IdxFrom, arr2IdxTo) == true ? 1 : 0;
  }
  public static int micro_double(double [] arr1, int arr1IdxFrom, int arr1IdxTo, double [] arr2, int arr2IdxFrom, int arr2IdxTo) {
    return Arrays.equals(arr1, arr1IdxFrom, arr1IdxTo , arr2, arr2IdxFrom, arr2IdxTo) == true ? 1 : 0;
  }
  public static int micro_long(long [] arr1, int arr1IdxFrom, int arr1IdxTo, long [] arr2, int arr2IdxFrom, int arr2IdxTo) {
    return Arrays.equals(arr1, arr1IdxFrom, arr1IdxTo , arr2, arr2IdxFrom, arr2IdxTo) == true ? 1 : 0;
  }
  public static int micro_int(int [] arr1, int arr1IdxFrom, int arr1IdxTo, int [] arr2, int arr2IdxFrom, int arr2IdxTo) {
    return Arrays.equals(arr1, arr1IdxFrom, arr1IdxTo , arr2, arr2IdxFrom, arr2IdxTo) == true ? 1 : 0;
  }
  public static int micro_float(float [] arr1, int arr1IdxFrom, int arr1IdxTo, float [] arr2, int arr2IdxFrom, int arr2IdxTo) {
    return Arrays.equals(arr1, arr1IdxFrom, arr1IdxTo , arr2, arr2IdxFrom, arr2IdxTo) == true ? 1 : 0;
  }
  public static int micro_char(char [] arr1, int arr1IdxFrom, int arr1IdxTo, char [] arr2, int arr2IdxFrom, int arr2IdxTo) {
    return Arrays.equals(arr1, arr1IdxFrom, arr1IdxTo , arr2, arr2IdxFrom, arr2IdxTo) == true ? 1 : 0;
  }
  public static int micro_short(short [] arr1, int arr1IdxFrom, int arr1IdxTo, short [] arr2, int arr2IdxFrom, int arr2IdxTo) {
    return Arrays.equals(arr1, arr1IdxFrom, arr1IdxTo , arr2, arr2IdxFrom, arr2IdxTo) == true ? 1 : 0;
  }
  public static int micro_byte(byte [] arr1, int arr1IdxFrom, int arr1IdxTo, byte [] arr2, int arr2IdxFrom, int arr2IdxTo) {
    return Arrays.equals(arr1, arr1IdxFrom, arr1IdxTo , arr2, arr2IdxFrom, arr2IdxTo) == true ? 1 : 0;
  }

  // Driver
  public static void main(String [] args) {
    int LEN = Integer.parseInt(args[0]);
    System.out.println("Length = " + LEN);
    Object [] arr1_Object = new Object[LEN];
    Object [] arr2_Object = new Object[LEN];
    double [] arr1_double = new double[LEN];
    double [] arr2_double = new double[LEN];
    long [] arr1_long = new long[LEN];
    long [] arr2_long = new long[LEN];
    int [] arr1_int = new int[LEN];
    int [] arr2_int = new int[LEN];
    float [] arr1_float = new float[LEN];
    float [] arr2_float = new float[LEN];
    short [] arr1_short = new short[LEN];
    short [] arr2_short = new short[LEN];
    char [] arr1_char = new char[LEN];
    char [] arr2_char = new char[LEN];
    byte [] arr1_byte = new byte[LEN];
    byte [] arr2_byte = new byte[LEN];

    int Res = 0;
    Random r = new Random(100);
    for( int i = 0; i < LEN ; i++) {
      arr1_float[i] = (float)i;
      arr2_float[i] = (float)i;  
      arr1_double[i] = (double)i;
      arr2_double[i] = (double)i;  
      arr1_long[i] = (long)i;
      arr2_long[i] = (long)i;  
      arr1_int[i] = (int)i;
      arr2_int[i] = (int)i;  
      arr1_char[i] = (char)i;
      arr2_char[i] = (char)i;  
      arr1_short[i] = (short)i;
      arr2_short[i] = (short)i;  
      arr1_byte[i] = (byte)i;
      arr2_byte[i] = (byte)i;  
      arr1_Object[i] = new Object();
      arr2_Object[i] = new Object();  
    }

    for (int k = 0 ; k < 900000 ; k++) {
      Res += micro_double(arr1_double, k & (LEN-1), LEN,  arr2_double, k & (LEN-1), LEN);
      Res += micro_object(arr1_Object, k & (LEN-1), LEN,  arr2_Object, k & (LEN-1), LEN);
      Res += micro_long(arr1_long, k & (LEN-1), LEN,  arr2_long, k & (LEN-1), LEN);
      Res += micro_float(arr1_float, k & (LEN-1), LEN,  arr2_float, k & (LEN-1), LEN);
      Res += micro_int(arr1_int, k & (LEN-1), LEN,  arr2_int, k & (LEN-1), LEN);
      Res += micro_char(arr1_char, k & (LEN-1), LEN,  arr2_char, k & (LEN-1), LEN);
      Res += micro_short(arr1_short, k & (LEN-1), LEN,  arr2_short, k & (LEN-1), LEN);
      Res += micro_byte(arr1_byte, k & (LEN-1), LEN,  arr2_byte, k & (LEN-1), LEN);
    }

    Res=0;
    System.out.println("Warmup completed");
    long t1 = System.currentTimeMillis();
    String str = new String("Token");
    for (int k = 0 ; k < 200000 ; k++) {
      Res += micro_double(arr1_double, k & (LEN-1), LEN,  arr2_double, k & (LEN-1), LEN);
      Res += micro_object(arr1_Object, k & (LEN-1), LEN,  arr2_Object, k & (LEN-1), LEN);
      Res += micro_long(arr1_long, k & (LEN-1), LEN,  arr2_long, k & (LEN-1), LEN);
      Res += micro_float(arr1_float, k & (LEN-1), LEN,  arr2_float, k & (LEN-1), LEN);
      Res += micro_int(arr1_int, k & (LEN-1), LEN,  arr2_int, k & (LEN-1), LEN);
      Res += micro_char(arr1_char, k & (LEN-1), LEN,  arr2_char, k & (LEN-1), LEN);
      Res += micro_short(arr1_short, k & (LEN-1), LEN,  arr2_short, k & (LEN-1), LEN);
      Res += micro_byte(arr1_byte, k & (LEN-1), LEN,  arr2_byte, k & (LEN-1), LEN);
      str = str + k;
    }
    Res += str.length();
    long t2 = System.currentTimeMillis();
    System.out.println("[Time] " + (t2-t1) + "ms Res = " + Res);
  }
}
