
class test {
  public static void  minRedD(float [] res, float [] a, float [] b) {
    for (int i = 0 ; i < 16; i++) {
      res[i] = a[i] + b[i];
    }
  }
  public static void main (String [] args) {
     float [] arr = new float[17];
     for (int i = 0 ; i < 17 ; i++) {
       arr[i] = i + 10.0f;
     }
     for (int i = 0 ; i < 1000000 ; i++) {
       test.minRedD(arr, arr, arr);
     }
    System.out.println("Res = " + arr[1]);
  }
}
