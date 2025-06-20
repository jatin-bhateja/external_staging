
import java.util.Random;

class test {
  public static float reduce(float [] arr) {
     float Res = 0.0f;
     for (int i = 0 ; i < 64; i++)
        Res = Math.max(Res, arr[i]);
     return Res;
  }
  public static void main (String [] args) {
    float Res = 0.0f;
    Random r = new Random();
    float [] vec = new float[64];
    for (int i = 0 ; i <  64 ; i++)
       vec[i] = r.nextFloat();
    for (int i = 0 ; i < 100000; i++)
       Res += test.reduce(vec);
    System.out.println("Res = " + Res);
  }
}
