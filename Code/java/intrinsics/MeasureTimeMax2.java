import java.lang.Math;
import java.util.Random;

public class MeasureTimeMax2 {

static float[] buffer;
	
public static void main(String[] args) 
{
  buffer = new float[100];
  Random rand = new Random(435437646);
  System.out.println("Data");
  for(int i=0; i<100; i++)
  {
     buffer[i] = rand.nextFloat()*20000.0f - 10000.0f;
     //System.out.println(buffer[i]);
  }

  float sum = 0.0f;
  for (int j = 0; j < 40000000; j++)
  {
    sum += kernel(buffer);
  }
  System.out.println("Warmup done...");
  long start = System.currentTimeMillis();
  for (int j = 0; j < 8000000; j++)
  {
    sum += kernel(buffer);
  }
  long elapsedTimeMillis = System.currentTimeMillis()-start;
  System.out.println("Iterations Per Micro Second:" + (300.0 * 5000)/elapsedTimeMillis+" ipus");
  System.out.println("Sum:" + sum);
}
// Reduction 
public static float kernel(float [] arr) {
   float Res = 0.0f;
   for (int i = 1 ; i < 100; i++)
      Res = Math.max(Res, arr[i]);
      //Res = Math.max(arr[i-1], arr[i]);
   return Res;
}
/*
// Non-Reduction
public static float kernel(float [] arr) {
   float Res = 0.0f;
   for (int i = 0 ; i < 99; i++)
      Res = Math.max(arr[i], arr[i+1]);
   return Res;
}
*/
}

