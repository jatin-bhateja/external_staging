
import java.util.Random;
import jdk.incubator.vector.*;
import static jdk.incubator.vector.VectorOperators.*;


public class test {
  static int positionCount;
  static final boolean outputRequired = true;

  static double lower;
  static double upper;

  public static double [] staticDValues;
  public static double [] outputLongValues;
  public static long [] outputValues;
  public static int [] outputPositions;
  public static int [] positions;

  public static int outputPositionCount;

  public static Random rd;

  public static VectorMask<Double> DoubleRange_testDoubleVector(DoubleVector values) {
      return values.compare(GE, lower).and(values.compare(LE, upper));
  }

  public static boolean DoubleRange_testDouble(double value) {
      return value >= lower && value <= upper;
  }

  public static void ReadFilter_vector() {
        int i = 0;
        outputPositionCount = 0;
        VectorSpecies<Integer> speciesInt = IntVector.SPECIES_256;
        int upperBound = DoubleVector.SPECIES_512.loopBound(positionCount);
        int speciesLength = DoubleVector.SPECIES_512.length();
        for (; i < upperBound; i += speciesLength) {
            // Following loop and its fanout logic is moved  out of enclosing loop in OSR compilation 
            // And fanout logic was not recursively inlined to meet the compilation constraints.
            // This looks like root cause of failed intrinsification of intoArray API [A] and reason behind
            // box allocation for masks..
            for (int j = 0; j < speciesLength; j++) {                                                        //     |
                staticDValues[j] = rd.nextDouble();                                                          //     |  
            }                                                                                                //     |
            DoubleVector valuesVector = DoubleVector.fromArray(DoubleVector.SPECIES_512, staticDValues, 0);  //     |
            VectorMask<Double> passing = DoubleRange_testDoubleVector(valuesVector);                         //     |
                                                                                                             //   __|__
            if (outputRequired) {
                DoubleVector outputDoubleValuesVector = valuesVector.compress(passing);
                LongVector outputLongValuesVector = outputDoubleValuesVector.viewAsIntegralLanes();
                outputLongValuesVector.intoArray(outputValues, outputPositionCount);                         // [A]
            }
            IntVector positionsVector = IntVector.fromArray(speciesInt, positions, i);
            IntVector outputPositionsVector = positionsVector.compress(passing.cast(speciesInt));
            outputPositionsVector.intoArray(outputPositions, outputPositionCount);
            outputPositionCount += passing.trueCount();
        }
    }
 
    public static void ReadFilter_scalar() {
        outputPositionCount = 0;
        for (int i = 0; i < positionCount; i++) {
            double value = rd.nextDouble();
            if (DoubleRange_testDouble(value)) {
                if (outputRequired) {
                    outputValues[outputPositionCount] = Double.doubleToLongBits(value);
                }
                outputPositions[outputPositionCount] = positions[i];
                outputPositionCount++;
            }
        }
    }

   public static void setup(int count) {
      positionCount = count;
      staticDValues = new double[DoubleVector.SPECIES_512.length()];          
      outputValues = new long[positionCount];
      outputPositions = new int[positionCount]; 
      positions = new int[positionCount];
      for (int i = 0; i < positionCount; i++) {
          positions[i] = i;
      }
      lower = 0.15;
      upper = 0.75;
   }
   public static void main(String [] args) {
      int size = Integer.parseInt(args[0]);
      int algo = Integer.parseInt(args[1]);
      setup(size);
      if (algo == 0) {
          rd = new Random(1023);
          for(int i = 0 ; i < 100000; i++) {
             ReadFilter_vector();
          }  
          long t1 = System.currentTimeMillis();
          for(int i = 0 ; i < 100000; i++) {
             ReadFilter_vector();
          }  
          long t2 = System.currentTimeMillis();
          long cumulativePos = 0;
          double cumulativeDoubleOutput = 0.0;
          for(int i = 0; i < outputPositionCount; i++) {
              cumulativePos += outputPositions[i];
              cumulativeDoubleOutput += outputValues[i];
          }
          System.out.println("[Vector Time]  " + (t2 - t1) +  " ms  [Pos] "  + cumulativePos + " [Output] " + cumulativeDoubleOutput);
      } else {
          rd = new Random(1023);
          for(int i = 0 ; i < 100000; i++) {
             ReadFilter_scalar();
          }  
          long t1 = System.currentTimeMillis();
          for(int i = 0 ; i < 100000; i++) {
             ReadFilter_scalar();
          }  
          long t2 = System.currentTimeMillis();
          long cumulativePos = 0;
          double cumulativeDoubleOutput = 0.0;
          for(int i = 0; i < outputPositionCount; i++) {
              cumulativePos += outputPositions[i];
              cumulativeDoubleOutput += outputValues[i];
          }
          System.out.println("[Scalar Time]  " + (t2 - t1) +  " ms  [Pos] "  + cumulativePos + " [Output] " + cumulativeDoubleOutput);
      }
   } 
}
