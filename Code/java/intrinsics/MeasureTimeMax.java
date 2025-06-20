import java.lang.Math;
import java.util.Random;

public class MeasureTimeMax {

static float[] buffer;
	
public static void main(String[] args) 
{
  buffer = new float[1000];
  Random rand = new Random(435437646);
  System.out.println("Data");
  for(int i=0; i<1000; i++)
  {
     buffer[i] = rand.nextFloat()*20000.0f - 10000.0f;
     //System.out.println(buffer[i]);
  }

  float sum = 0.0f;
  for (int j = 0; j < 40000000; j++)		
  {
    sum += kernel(buffer[j%1000], buffer[j%100]);
  }
  System.out.println("Warmup done...");
  long start = System.currentTimeMillis();
  for (int j = 0; j < 8000000; j++)		
  {
    sum += kernel(buffer[(j)%1000],buffer[(j)%100]);
  }
  long elapsedTimeMillis = System.currentTimeMillis()-start;
  System.out.println("Iterations Per Micro Second:" + (300.0 * 5000)/elapsedTimeMillis+" ipus");
  System.out.println("Sum:" + sum);
}


private static float kernel(float arg1, float arg2)
{
   return Math.max(arg1, arg2);
}
}
