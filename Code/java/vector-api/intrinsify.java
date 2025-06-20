

class test {
  public static int copyMem(int [] arr) {
    int s = 0;
    int [] LV = new int[128];
    for (int i = 0; i < 128; i++)
        LV[i] = 9 + i;
    for(int j = 0 ; j < 128; j++)
      for(int i = 0 ; i < 128; i++)
         s = LV[0];
    return s;
  }
  public static void main(String [] args) {
    int [] arr = new int[128];
    for(int i = 0 ; i < 1000000 ; i++)
       test.copyMem(arr);
    System.out.println("Res = " + arr[3]);
  }
}
