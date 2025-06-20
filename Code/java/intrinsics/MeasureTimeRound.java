import java.lang.Math;
import java.util.Random;

public class MeasureTimeRound {

static double[] buffer;
	
public static void main(String[] args) 
{
  buffer = new double[1000];
  Random rand = new Random(435437646);
  System.out.println("Data");
  for(int i=0; i<1000; i++)
  {
     buffer[i] = rand.nextDouble()*20000.0 - 10000.0;
  }

  double sum = 0.0;
  for (int j = 0; j < 1000000; j++)		
  {
    sum += kernel(buffer[j%1000]);
  }
  System.out.println("Warmup done...");
  long start = System.currentTimeMillis();
  for (int j = 0; j < 800000; j++)		
  {
    sum += kernel(buffer[(j)%1000]);
  }
  long elapsedTimeMillis = System.currentTimeMillis()-start;
  System.out.println("Iterations Per Micro Second:" + (800000)/elapsedTimeMillis+" ops/ms");
  System.out.println("Sum:" + sum);
}


public static double kernel(double arg1)
{
   return Math.rint(arg1);
}
}
