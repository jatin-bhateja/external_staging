
import jdk.incubator.vector.*;

public class ea_vector {
  public static double init_value(double init) {
     return init + 10.0;
  }
  public static double micro(double init) {
     double res = 0.0;
     // Allocate.
     double [] val = new double[DoubleVector.SPECIES_512.length()];
     // Initialization.
     // Fully unroll small loop.
     for(int i = 0; i < val.length; i++) {
        // Pull the initialization value from store.
        val[i] = init_value(init);
     }
     // Fully unroll small loop.
     for(int i = 0; i < val.length; i++) {
       // Tie intialization values to AddD inputs.
       res += val[i];
       // Fold every thing to a constant.
     }
     // Return a constant.
     return res;
  }  
  public static void main(String [] args) {
     double res = 0.0;
     for(int i = 0; i < 100000; i++) {
        res += micro(10.0);
     }
     System.out.println("Res = " + res);
  }
}
