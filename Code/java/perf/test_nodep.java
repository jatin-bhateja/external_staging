
import java.util.Random;

class test {
  public static float reduce(int size, float [] arr1, float [] arr2) {
     float Res = 0.0f;
     for (int i = 0 ; i < size; i++)
        Res = Math.max(arr1[i], arr2[i]);
     return Res;
  }
  public static void main (String [] args) {
    Random r = new Random();
    float Res = 0.0f;
    float [] vec = new float[64];
    for (int i = 0 ; i <  64 ; i++)
       vec[i] = r.nextFloat();
    for (int i = 0 ; i < 100000; i++)
       Res += test.reduce(64, vec, vec);
    System.out.println("Res = " + Res);
  }
}
