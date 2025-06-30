
class test {
  public static float minRedD(float Res, float [] arr) {
    for (int i = 0 ; i < 1024; i++) {
     Res = Math.max(Res, arr[i]);
     // Res += arr[i];
    }
    return Res; 
  }
  public static void main (String [] args) {
     float [] arr = new float[1024];
     for (int i = 0 ; i < 1024 ; i++) {
       arr[i] = i + 10;
     }
     float Res = 0;
     for (int i = 0 ; i < 1000000 ; i++) {
       Res += test.minRedD(Res, arr);
     }
     System.out.println("Res = " + Res);
  }
}
